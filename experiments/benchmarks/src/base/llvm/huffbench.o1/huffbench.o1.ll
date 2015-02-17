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
@.str4 = private unnamed_addr constant [4 x i8] c"-ga\00", align 1
@stdout = external global %struct._IO_FILE*
@.str5 = private unnamed_addr constant [3 x i8] c"%f\00", align 1
@.str6 = private unnamed_addr constant [35 x i8] c"\0Ahuffbench (Std. C) run time: %f\0A\0A\00", align 1
@seed = internal unnamed_addr global i64 1325, align 8

; Function Attrs: nounwind uwtable
define noalias i8* @generate_test_data(i64 %n) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !23, metadata !131), !dbg !132
  tail call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([33 x i8]* @.str, i32 0, i32 0), i64 0, metadata !24, metadata !131), !dbg !133
  %call = tail call noalias i8* @malloc(i64 %n) #3, !dbg !134
  tail call void @llvm.dbg.value(metadata i8* %call, i64 0, metadata !26, metadata !131), !dbg !135
  tail call void @llvm.dbg.value(metadata i8* %call, i64 0, metadata !27, metadata !131), !dbg !136
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !28, metadata !131), !dbg !137
  %cmp7 = icmp eq i64 %n, 0, !dbg !138
  br i1 %cmp7, label %for.end, label %for.body.lr.ph, !dbg !141

for.body.lr.ph:                                   ; preds = %entry
  %0 = add i64 %n, -1, !dbg !141
  br label %for.body, !dbg !141

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %for.body ]
  %ptr.08 = phi i8* [ %call, %for.body.lr.ph ], [ %incdec.ptr, %for.body ]
  %call2 = tail call fastcc i64 @random4(), !dbg !142
  %arrayidx = getelementptr inbounds [33 x i8]* @.str, i64 0, i64 %call2, !dbg !144
  %1 = load i8* %arrayidx, align 1, !dbg !144, !tbaa !145
  store i8 %1, i8* %ptr.08, align 1, !dbg !148, !tbaa !145
  %incdec.ptr = getelementptr inbounds i8* %ptr.08, i64 1, !dbg !149
  tail call void @llvm.dbg.value(metadata i8* %incdec.ptr, i64 0, metadata !27, metadata !131), !dbg !136
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !141
  %exitcond = icmp eq i64 %indvars.iv, %0, !dbg !141
  br i1 %exitcond, label %for.end, label %for.body, !dbg !141

for.end:                                          ; preds = %for.body, %entry
  ret i8* %call, !dbg !150
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
  tail call void @llvm.dbg.value(metadata i8* %data, i64 0, metadata !34, metadata !131), !dbg !151
  tail call void @llvm.dbg.value(metadata i64 %data_len, i64 0, metadata !35, metadata !131), !dbg !152
  tail call void @llvm.dbg.value(metadata i8* %data, i64 0, metadata !45, metadata !131), !dbg !153
  %add = add i64 %data_len, 1, !dbg !154
  %call = tail call noalias i8* @malloc(i64 %add) #3, !dbg !155
  tail call void @llvm.dbg.value(metadata i8* %call, i64 0, metadata !46, metadata !131), !dbg !156
  %0 = bitcast [512 x i64]* %freq to i8*, !dbg !157
  call void @llvm.lifetime.start(i64 4096, i8* %0) #3, !dbg !157
  tail call void @llvm.dbg.declare(metadata [512 x i64]* %freq, metadata !47, metadata !131), !dbg !158
  %1 = bitcast [256 x i64]* %heap to i8*, !dbg !159
  call void @llvm.lifetime.start(i64 2048, i8* %1) #3, !dbg !159
  tail call void @llvm.dbg.declare(metadata [256 x i64]* %heap, metadata !51, metadata !131), !dbg !160
  %2 = bitcast [512 x i32]* %link to i8*, !dbg !161
  call void @llvm.lifetime.start(i64 2048, i8* %2) #3, !dbg !161
  tail call void @llvm.dbg.declare(metadata [512 x i32]* %link, metadata !55, metadata !131), !dbg !162
  %3 = bitcast [256 x i64]* %code to i8*, !dbg !163
  call void @llvm.lifetime.start(i64 2048, i8* %3) #3, !dbg !163
  tail call void @llvm.dbg.declare(metadata [256 x i64]* %code, metadata !57, metadata !131), !dbg !164
  %4 = getelementptr inbounds [256 x i8]* %clen, i64 0, i64 0, !dbg !165
  call void @llvm.lifetime.start(i64 256, i8* %4) #3, !dbg !165
  tail call void @llvm.dbg.declare(metadata [256 x i8]* %clen, metadata !59, metadata !131), !dbg !166
  tail call void @llvm.memset.p0i8.i64(i8* %call, i8 0, i64 %add, i32 1, i1 false), !dbg !167
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 4096, i32 16, i1 false), !dbg !168
  call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 2048, i32 16, i1 false), !dbg !169
  call void @llvm.memset.p0i8.i64(i8* %2, i8 0, i64 2048, i32 16, i1 false), !dbg !170
  call void @llvm.memset.p0i8.i64(i8* %3, i8 0, i64 2048, i32 16, i1 false), !dbg !171
  call void @llvm.memset.p0i8.i64(i8* %4, i8 0, i64 256, i32 16, i1 false), !dbg !172
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !36, metadata !131), !dbg !173
  %cmp455 = icmp eq i64 %data_len, 0, !dbg !174
  br i1 %cmp455, label %for.body6, label %for.body, !dbg !177

for.body:                                         ; preds = %entry, %for.body
  %i.0457 = phi i64 [ %inc2, %for.body ], [ 0, %entry ]
  %dptr.0456 = phi i8* [ %incdec.ptr, %for.body ], [ %data, %entry ]
  %5 = load i8* %dptr.0456, align 1, !dbg !178, !tbaa !145
  %conv = zext i8 %5 to i64, !dbg !180
  %arrayidx = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 %conv, !dbg !181
  %6 = load i64* %arrayidx, align 8, !dbg !181, !tbaa !182
  %inc = add i64 %6, 1, !dbg !181
  store i64 %inc, i64* %arrayidx, align 8, !dbg !181, !tbaa !182
  %incdec.ptr = getelementptr inbounds i8* %dptr.0456, i64 1, !dbg !184
  tail call void @llvm.dbg.value(metadata i8* %incdec.ptr, i64 0, metadata !45, metadata !131), !dbg !153
  %inc2 = add nuw i64 %i.0457, 1, !dbg !185
  tail call void @llvm.dbg.value(metadata i64 %inc2, i64 0, metadata !36, metadata !131), !dbg !173
  %exitcond467 = icmp eq i64 %inc2, %data_len, !dbg !177
  br i1 %exitcond467, label %for.body6, label %for.body, !dbg !177

for.cond13.preheader:                             ; preds = %for.inc10
  %cmp14451 = icmp eq i64 %n.1, 0, !dbg !186
  br i1 %cmp14451, label %while.end, label %for.body16.lr.ph, !dbg !191

for.body16.lr.ph:                                 ; preds = %for.cond13.preheader
  %arraydecay = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 0, !dbg !192
  %arraydecay17 = getelementptr inbounds [256 x i64]* %heap, i64 0, i64 0, !dbg !193
  %conv18 = trunc i64 %n.1 to i32, !dbg !194
  br label %for.body16, !dbg !191

for.body6:                                        ; preds = %entry, %for.body, %for.inc10
  %i.1454 = phi i64 [ %inc11, %for.inc10 ], [ 0, %for.body ], [ 0, %entry ]
  %n.0453 = phi i64 [ %n.1, %for.inc10 ], [ 0, %for.body ], [ 0, %entry ]
  %arrayidx7 = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 %i.1454, !dbg !195
  %7 = load i64* %arrayidx7, align 8, !dbg !195, !tbaa !182
  %tobool = icmp eq i64 %7, 0, !dbg !200
  br i1 %tobool, label %for.inc10, label %if.then, !dbg !200

if.then:                                          ; preds = %for.body6
  %arrayidx8 = getelementptr inbounds [256 x i64]* %heap, i64 0, i64 %n.0453, !dbg !201
  store i64 %i.1454, i64* %arrayidx8, align 8, !dbg !201, !tbaa !182
  %inc9 = add i64 %n.0453, 1, !dbg !203
  tail call void @llvm.dbg.value(metadata i64 %inc9, i64 0, metadata !38, metadata !131), !dbg !204
  br label %for.inc10, !dbg !205

for.inc10:                                        ; preds = %for.body6, %if.then
  %n.1 = phi i64 [ %inc9, %if.then ], [ %n.0453, %for.body6 ]
  %inc11 = add nuw nsw i64 %i.1454, 1, !dbg !206
  tail call void @llvm.dbg.value(metadata i64 %inc11, i64 0, metadata !36, metadata !131), !dbg !173
  %exitcond466 = icmp eq i64 %inc11, 256, !dbg !207
  br i1 %exitcond466, label %for.cond13.preheader, label %for.body6, !dbg !207

while.cond.preheader:                             ; preds = %for.body16
  %cmp22448 = icmp ugt i64 %n.1, 1, !dbg !208
  br i1 %cmp22448, label %while.body.lr.ph, label %while.end, !dbg !211

while.body.lr.ph:                                 ; preds = %while.cond.preheader
  %arrayidx25 = getelementptr inbounds [256 x i64]* %heap, i64 0, i64 0, !dbg !212
  %arraydecay28 = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 0, !dbg !214
  br label %while.body, !dbg !211

for.body16:                                       ; preds = %for.body16.lr.ph, %for.body16
  %i.2452 = phi i64 [ %n.1, %for.body16.lr.ph ], [ %dec, %for.body16 ]
  %conv19 = trunc i64 %i.2452 to i32, !dbg !215
  call fastcc void @heap_adjust(i64* %arraydecay, i64* %arraydecay17, i32 %conv18, i32 %conv19), !dbg !216
  %dec = add i64 %i.2452, -1, !dbg !217
  tail call void @llvm.dbg.value(metadata i64 %dec, i64 0, metadata !36, metadata !131), !dbg !173
  %cmp14 = icmp eq i64 %dec, 0, !dbg !186
  br i1 %cmp14, label %while.cond.preheader, label %for.body16, !dbg !191

while.body:                                       ; preds = %while.body.lr.ph, %while.body
  %n.2449 = phi i64 [ %n.1, %while.body.lr.ph ], [ %dec24, %while.body ]
  %dec24 = add i64 %n.2449, -1, !dbg !218
  tail call void @llvm.dbg.value(metadata i64 %dec24, i64 0, metadata !38, metadata !131), !dbg !204
  %8 = load i64* %arrayidx25, align 16, !dbg !212, !tbaa !182
  %arrayidx26 = getelementptr inbounds [256 x i64]* %heap, i64 0, i64 %dec24, !dbg !219
  %9 = load i64* %arrayidx26, align 8, !dbg !219, !tbaa !182
  store i64 %9, i64* %arrayidx25, align 16, !dbg !220, !tbaa !182
  %conv30 = trunc i64 %dec24 to i32, !dbg !221
  call fastcc void @heap_adjust(i64* %arraydecay28, i64* %arrayidx25, i32 %conv30, i32 1), !dbg !222
  %10 = load i64* %arrayidx25, align 16, !dbg !223, !tbaa !182
  %arrayidx32 = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 %10, !dbg !224
  %11 = load i64* %arrayidx32, align 8, !dbg !224, !tbaa !182
  %arrayidx33 = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 %8, !dbg !225
  %12 = load i64* %arrayidx33, align 8, !dbg !225, !tbaa !182
  %add34 = add i64 %12, %11, !dbg !224
  %add35 = add i64 %n.2449, 255, !dbg !226
  %arrayidx36 = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 %add35, !dbg !227
  store i64 %add34, i64* %arrayidx36, align 8, !dbg !227, !tbaa !182
  %conv38 = trunc i64 %add35 to i32, !dbg !228
  %arrayidx39 = getelementptr inbounds [512 x i32]* %link, i64 0, i64 %8, !dbg !229
  store i32 %conv38, i32* %arrayidx39, align 4, !dbg !229, !tbaa !230
  %sub = sub i64 -255, %n.2449, !dbg !232
  %conv40 = trunc i64 %sub to i32, !dbg !232
  %13 = load i64* %arrayidx25, align 16, !dbg !233, !tbaa !182
  %arrayidx42 = getelementptr inbounds [512 x i32]* %link, i64 0, i64 %13, !dbg !234
  store i32 %conv40, i32* %arrayidx42, align 4, !dbg !234, !tbaa !230
  store i64 %add35, i64* %arrayidx25, align 16, !dbg !235, !tbaa !182
  call fastcc void @heap_adjust(i64* %arraydecay28, i64* %arrayidx25, i32 %conv30, i32 1), !dbg !236
  %cmp22 = icmp ugt i64 %dec24, 1, !dbg !208
  br i1 %cmp22, label %while.body, label %while.end, !dbg !211

while.end:                                        ; preds = %while.body, %for.cond13.preheader, %while.cond.preheader
  %n.2.lcssa = phi i64 [ %n.1, %while.cond.preheader ], [ 0, %for.cond13.preheader ], [ 1, %while.body ]
  %add48 = add i64 %n.2.lcssa, 256, !dbg !237
  %arrayidx49 = getelementptr inbounds [512 x i32]* %link, i64 0, i64 %add48, !dbg !238
  store i32 0, i32* %arrayidx49, align 4, !dbg !238, !tbaa !230
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !64, metadata !131), !dbg !239
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !65, metadata !131), !dbg !240
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !62, metadata !131), !dbg !241
  br label %for.body53, !dbg !242

for.body53:                                       ; preds = %for.inc84, %while.end
  %maxi.0447 = phi i64 [ 0, %while.end ], [ %maxi.1, %for.inc84 ]
  %maxx.0446 = phi i64 [ 0, %while.end ], [ %maxx.2, %for.inc84 ]
  %m.0445 = phi i64 [ 0, %while.end ], [ %inc85, %for.inc84 ]
  %arrayidx54 = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 %m.0445, !dbg !244
  %14 = load i64* %arrayidx54, align 8, !dbg !244, !tbaa !182
  %tobool55 = icmp eq i64 %14, 0, !dbg !248
  br i1 %tobool55, label %if.then56, label %while.cond60.preheader, !dbg !248

while.cond60.preheader:                           ; preds = %for.body53
  %l.0.in436 = getelementptr inbounds [512 x i32]* %link, i64 0, i64 %m.0445, !dbg !249
  %l.0437 = load i32* %l.0.in436, align 4, !dbg !249
  %tobool61438 = icmp eq i32 %l.0437, 0, !dbg !251
  br i1 %tobool61438, label %while.end71, label %while.body62, !dbg !251

if.then56:                                        ; preds = %for.body53
  %arrayidx57 = getelementptr inbounds [256 x i64]* %code, i64 0, i64 %m.0445, !dbg !252
  store i64 0, i64* %arrayidx57, align 8, !dbg !252, !tbaa !182
  %arrayidx58 = getelementptr inbounds [256 x i8]* %clen, i64 0, i64 %m.0445, !dbg !254
  store i8 0, i8* %arrayidx58, align 1, !dbg !254, !tbaa !145
  br label %for.inc84, !dbg !255

while.body62:                                     ; preds = %while.cond60.preheader, %if.end68
  %l.0442 = phi i32 [ %l.0, %if.end68 ], [ %l.0437, %while.cond60.preheader ]
  %x.0441 = phi i64 [ %x.1, %if.end68 ], [ 0, %while.cond60.preheader ]
  %i.3440 = phi i64 [ %inc70, %if.end68 ], [ 0, %while.cond60.preheader ]
  %j.0439 = phi i64 [ %shl, %if.end68 ], [ 1, %while.cond60.preheader ]
  %cmp63 = icmp slt i32 %l.0442, 0, !dbg !256
  br i1 %cmp63, label %if.then65, label %if.end68, !dbg !259

if.then65:                                        ; preds = %while.body62
  %add66 = add i64 %x.0441, %j.0439, !dbg !260
  tail call void @llvm.dbg.value(metadata i64 %add66, i64 0, metadata !63, metadata !131), !dbg !262
  %sub67 = sub nsw i32 0, %l.0442, !dbg !263
  tail call void @llvm.dbg.value(metadata i32 %sub67, i64 0, metadata !66, metadata !131), !dbg !264
  br label %if.end68, !dbg !265

if.end68:                                         ; preds = %if.then65, %while.body62
  %x.1 = phi i64 [ %add66, %if.then65 ], [ %x.0441, %while.body62 ]
  %l.1 = phi i32 [ %sub67, %if.then65 ], [ %l.0442, %while.body62 ]
  %idxprom = sext i32 %l.1 to i64, !dbg !266
  %shl = shl i64 %j.0439, 1, !dbg !267
  tail call void @llvm.dbg.value(metadata i64 %shl, i64 0, metadata !37, metadata !131), !dbg !268
  %inc70 = add i64 %i.3440, 1, !dbg !269
  tail call void @llvm.dbg.value(metadata i64 %inc70, i64 0, metadata !36, metadata !131), !dbg !173
  %l.0.in = getelementptr inbounds [512 x i32]* %link, i64 0, i64 %idxprom, !dbg !249
  %l.0 = load i32* %l.0.in, align 4, !dbg !249
  %tobool61 = icmp eq i32 %l.0, 0, !dbg !251
  br i1 %tobool61, label %while.end71, label %while.body62, !dbg !251

while.end71:                                      ; preds = %if.end68, %while.cond60.preheader
  %x.0.lcssa = phi i64 [ 0, %while.cond60.preheader ], [ %x.1, %if.end68 ]
  %i.3.lcssa = phi i64 [ 0, %while.cond60.preheader ], [ %inc70, %if.end68 ]
  %arrayidx72 = getelementptr inbounds [256 x i64]* %code, i64 0, i64 %m.0445, !dbg !270
  store i64 %x.0.lcssa, i64* %arrayidx72, align 8, !dbg !270, !tbaa !182
  %conv73 = trunc i64 %i.3.lcssa to i8, !dbg !271
  %arrayidx74 = getelementptr inbounds [256 x i8]* %clen, i64 0, i64 %m.0445, !dbg !272
  store i8 %conv73, i8* %arrayidx74, align 1, !dbg !272, !tbaa !145
  %cmp75 = icmp ugt i64 %x.0.lcssa, %maxx.0446, !dbg !273
  tail call void @llvm.dbg.value(metadata i64 %x.1, i64 0, metadata !64, metadata !131), !dbg !239
  %x.0.maxx.0 = select i1 %cmp75, i64 %x.0.lcssa, i64 %maxx.0446, !dbg !275
  %cmp79 = icmp ugt i64 %i.3.lcssa, %maxi.0447, !dbg !276
  tail call void @llvm.dbg.value(metadata i64 %inc70, i64 0, metadata !65, metadata !131), !dbg !240
  %i.3.maxi.0 = select i1 %cmp79, i64 %i.3.lcssa, i64 %maxi.0447, !dbg !278
  br label %for.inc84, !dbg !278

for.inc84:                                        ; preds = %while.end71, %if.then56
  %maxx.2 = phi i64 [ %maxx.0446, %if.then56 ], [ %x.0.maxx.0, %while.end71 ]
  %maxi.1 = phi i64 [ %maxi.0447, %if.then56 ], [ %i.3.maxi.0, %while.end71 ]
  %inc85 = add nuw nsw i64 %m.0445, 1, !dbg !279
  tail call void @llvm.dbg.value(metadata i64 %inc85, i64 0, metadata !62, metadata !131), !dbg !241
  %exitcond465 = icmp eq i64 %inc85, 256, !dbg !242
  br i1 %exitcond465, label %for.end86, label %for.body53, !dbg !242

for.end86:                                        ; preds = %for.inc84
  %cmp87 = icmp ugt i64 %maxi.1, 64, !dbg !280
  br i1 %cmp87, label %if.then89, label %if.end91, !dbg !282

if.then89:                                        ; preds = %for.end86
  %15 = load %struct._IO_FILE** @stderr, align 8, !dbg !283, !tbaa !285
  %16 = tail call i64 @fwrite(i8* getelementptr inbounds ([26 x i8]* @.str1, i64 0, i64 0), i64 25, i64 1, %struct._IO_FILE* %15) #5, !dbg !287
  tail call void @exit(i32 1) #6, !dbg !288
  unreachable, !dbg !288

if.end91:                                         ; preds = %for.end86
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !67, metadata !131), !dbg !289
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !68, metadata !131), !dbg !290
  tail call void @llvm.dbg.value(metadata i32 -1, i64 0, metadata !69, metadata !131), !dbg !291
  tail call void @llvm.dbg.value(metadata i8* %data, i64 0, metadata !45, metadata !131), !dbg !153
  %cmp92 = icmp eq i64 %maxx.2, 0, !dbg !292
  br i1 %cmp92, label %if.then94, label %for.cond97.preheader, !dbg !294

for.cond97.preheader:                             ; preds = %if.end91
  %cmp98427 = icmp eq i64 %data_len, 0, !dbg !295
  br i1 %cmp98427, label %for.end143, label %for.body100, !dbg !298

if.then94:                                        ; preds = %if.end91
  %17 = load %struct._IO_FILE** @stderr, align 8, !dbg !299, !tbaa !285
  %18 = tail call i64 @fwrite(i8* getelementptr inbounds ([33 x i8]* @.str2, i64 0, i64 0), i64 32, i64 1, %struct._IO_FILE* %17) #5, !dbg !301
  tail call void @exit(i32 1) #6, !dbg !302
  unreachable, !dbg !302

for.body100:                                      ; preds = %for.cond97.preheader, %for.end139
  %bit.0432 = phi i32 [ %bit.1.lcssa, %for.end139 ], [ -1, %for.cond97.preheader ]
  %bout.0431 = phi i8 [ %bout.1.lcssa, %for.end139 ], [ 0, %for.cond97.preheader ]
  %comp_len.0430 = phi i64 [ %comp_len.1.lcssa, %for.end139 ], [ 0, %for.cond97.preheader ]
  %j.1429 = phi i64 [ %inc142, %for.end139 ], [ 0, %for.cond97.preheader ]
  %dptr.1428 = phi i8* [ %incdec.ptr140, %for.end139 ], [ %data, %for.cond97.preheader ]
  tail call void @llvm.dbg.value(metadata i64 %conv106, i64 0, metadata !39, metadata !131), !dbg !303
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !36, metadata !131), !dbg !173
  %19 = load i8* %dptr.1428, align 1, !dbg !304, !tbaa !145
  %idxprom108415 = zext i8 %19 to i64, !dbg !308
  %arrayidx109416 = getelementptr inbounds [256 x i8]* %clen, i64 0, i64 %idxprom108415, !dbg !308
  %20 = load i8* %arrayidx109416, align 1, !dbg !308, !tbaa !145
  %cmp111418 = icmp eq i8 %20, 0, !dbg !309
  br i1 %cmp111418, label %for.end139, label %for.body113.lr.ph, !dbg !310

for.body113.lr.ph:                                ; preds = %for.body100
  %21 = load i8* %dptr.1428, align 1, !dbg !311, !tbaa !145
  %idxprom101 = zext i8 %21 to i64, !dbg !312
  %arrayidx102 = getelementptr inbounds [256 x i8]* %clen, i64 0, i64 %idxprom101, !dbg !312
  %22 = load i8* %arrayidx102, align 1, !dbg !312, !tbaa !145
  %conv103 = zext i8 %22 to i32, !dbg !312
  %sub104 = add nsw i32 %conv103, -1, !dbg !312
  %shl105 = shl i32 1, %sub104, !dbg !313
  %conv106 = sext i32 %shl105 to i64, !dbg !313
  br label %for.body113, !dbg !310

for.body113:                                      ; preds = %for.body113.lr.ph, %if.end129
  %bit.1423 = phi i32 [ %bit.0432, %for.body113.lr.ph ], [ %bit.2, %if.end129 ]
  %bout.1422 = phi i8 [ %bout.0431, %for.body113.lr.ph ], [ %bout.2.or, %if.end129 ]
  %comp_len.1421 = phi i64 [ %comp_len.0430, %for.body113.lr.ph ], [ %comp_len.2, %if.end129 ]
  %i.4420 = phi i64 [ 0, %for.body113.lr.ph ], [ %inc138, %if.end129 ]
  %mask.0419 = phi i64 [ %conv106, %for.body113.lr.ph ], [ %shr, %if.end129 ]
  %cmp114 = icmp eq i32 %bit.1423, 7, !dbg !314
  br i1 %cmp114, label %if.then116, label %if.else124, !dbg !317

if.then116:                                       ; preds = %for.body113
  %arrayidx117 = getelementptr inbounds i8* %call, i64 %comp_len.1421, !dbg !318
  store i8 %bout.1422, i8* %arrayidx117, align 1, !dbg !318, !tbaa !145
  %inc118 = add i64 %comp_len.1421, 1, !dbg !320
  tail call void @llvm.dbg.value(metadata i64 %inc118, i64 0, metadata !67, metadata !131), !dbg !289
  %cmp119 = icmp eq i64 %inc118, %data_len, !dbg !321
  br i1 %cmp119, label %if.then121, label %if.end129, !dbg !323

if.then121:                                       ; preds = %if.then116
  %23 = load %struct._IO_FILE** @stderr, align 8, !dbg !324, !tbaa !285
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8]* @.str3, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5, !dbg !326
  tail call void @exit(i32 1) #6, !dbg !327
  unreachable, !dbg !327

if.else124:                                       ; preds = %for.body113
  %inc125 = add nsw i32 %bit.1423, 1, !dbg !328
  tail call void @llvm.dbg.value(metadata i32 %inc125, i64 0, metadata !69, metadata !131), !dbg !291
  %shl127 = shl i8 %bout.1422, 1, !dbg !330
  tail call void @llvm.dbg.value(metadata i8 %shl127, i64 0, metadata !68, metadata !131), !dbg !290
  br label %if.end129

if.end129:                                        ; preds = %if.then116, %if.else124
  %comp_len.2 = phi i64 [ %comp_len.1421, %if.else124 ], [ %inc118, %if.then116 ]
  %bout.2 = phi i8 [ %shl127, %if.else124 ], [ 0, %if.then116 ]
  %bit.2 = phi i32 [ %inc125, %if.else124 ], [ 0, %if.then116 ]
  %25 = load i8* %dptr.1428, align 1, !dbg !331, !tbaa !145
  %idxprom130 = zext i8 %25 to i64, !dbg !333
  %arrayidx131 = getelementptr inbounds [256 x i64]* %code, i64 0, i64 %idxprom130, !dbg !333
  %26 = load i64* %arrayidx131, align 8, !dbg !333, !tbaa !182
  %and = and i64 %26, %mask.0419, !dbg !333
  %not.tobool132 = icmp ne i64 %and, 0, !dbg !334
  %or = zext i1 %not.tobool132 to i8, !dbg !334
  %bout.2.or = or i8 %or, %bout.2, !dbg !334
  %shr = lshr i64 %mask.0419, 1, !dbg !335
  tail call void @llvm.dbg.value(metadata i64 %shr, i64 0, metadata !39, metadata !131), !dbg !303
  %inc138 = add nuw nsw i64 %i.4420, 1, !dbg !336
  tail call void @llvm.dbg.value(metadata i64 %inc138, i64 0, metadata !36, metadata !131), !dbg !173
  %27 = load i8* %dptr.1428, align 1, !dbg !304, !tbaa !145
  %idxprom108 = zext i8 %27 to i64, !dbg !308
  %arrayidx109 = getelementptr inbounds [256 x i8]* %clen, i64 0, i64 %idxprom108, !dbg !308
  %28 = load i8* %arrayidx109, align 1, !dbg !308, !tbaa !145
  %conv110 = zext i8 %28 to i64, !dbg !308
  %cmp111 = icmp ult i64 %inc138, %conv110, !dbg !309
  br i1 %cmp111, label %for.body113, label %for.end139, !dbg !310

for.end139:                                       ; preds = %if.end129, %for.body100
  %bit.1.lcssa = phi i32 [ %bit.0432, %for.body100 ], [ %bit.2, %if.end129 ]
  %bout.1.lcssa = phi i8 [ %bout.0431, %for.body100 ], [ %bout.2.or, %if.end129 ]
  %comp_len.1.lcssa = phi i64 [ %comp_len.0430, %for.body100 ], [ %comp_len.2, %if.end129 ]
  %incdec.ptr140 = getelementptr inbounds i8* %dptr.1428, i64 1, !dbg !337
  tail call void @llvm.dbg.value(metadata i8* %incdec.ptr140, i64 0, metadata !45, metadata !131), !dbg !153
  %inc142 = add nuw i64 %j.1429, 1, !dbg !338
  tail call void @llvm.dbg.value(metadata i64 %inc142, i64 0, metadata !37, metadata !131), !dbg !268
  %cmp98 = icmp ult i64 %inc142, %data_len, !dbg !295
  br i1 %cmp98, label %for.body100, label %for.end143, !dbg !298

for.end143:                                       ; preds = %for.end139, %for.cond97.preheader
  %bit.0.lcssa = phi i32 [ -1, %for.cond97.preheader ], [ %bit.1.lcssa, %for.end139 ]
  %bout.0.lcssa = phi i8 [ 0, %for.cond97.preheader ], [ %bout.1.lcssa, %for.end139 ]
  %comp_len.0.lcssa = phi i64 [ 0, %for.cond97.preheader ], [ %comp_len.1.lcssa, %for.end139 ]
  %sub144 = sub nsw i32 7, %bit.0.lcssa, !dbg !339
  %conv145 = sext i8 %bout.0.lcssa to i32, !dbg !340
  %shl146 = shl i32 %conv145, %sub144, !dbg !340
  %conv147 = trunc i32 %shl146 to i8, !dbg !340
  tail call void @llvm.dbg.value(metadata i8 %conv147, i64 0, metadata !68, metadata !131), !dbg !290
  %arrayidx148 = getelementptr inbounds i8* %call, i64 %comp_len.0.lcssa, !dbg !341
  store i8 %conv147, i8* %arrayidx148, align 1, !dbg !341, !tbaa !145
  %29 = bitcast [256 x i64]* %heap2 to i8*, !dbg !342
  call void @llvm.lifetime.start(i64 2048, i8* %29) #3, !dbg !342
  tail call void @llvm.dbg.declare(metadata [256 x i64]* %heap2, metadata !70, metadata !131), !dbg !343
  %30 = getelementptr inbounds [256 x i8]* %outc, i64 0, i64 0, !dbg !344
  call void @llvm.lifetime.start(i64 256, i8* %30) #3, !dbg !344
  tail call void @llvm.dbg.declare(metadata [256 x i8]* %outc, metadata !71, metadata !131), !dbg !345
  call void @llvm.memset.p0i8.i64(i8* %29, i8 0, i64 2048, i32 16, i1 false), !dbg !346
  tail call void @llvm.dbg.value(metadata i8* %30, i64 0, metadata !73, metadata !131), !dbg !347
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !37, metadata !131), !dbg !268
  br label %for.body154, !dbg !348

for.body154:                                      ; preds = %for.inc188, %for.end143
  %optr.0414 = phi i8* [ %30, %for.end143 ], [ %incdec.ptr156, %for.inc188 ]
  %j.2413 = phi i64 [ 0, %for.end143 ], [ %inc189, %for.inc188 ]
  %conv155 = trunc i64 %j.2413 to i8, !dbg !350
  store i8 %conv155, i8* %optr.0414, align 1, !dbg !353, !tbaa !145
  %incdec.ptr156 = getelementptr inbounds i8* %optr.0414, i64 1, !dbg !354
  tail call void @llvm.dbg.value(metadata i8* %incdec.ptr156, i64 0, metadata !73, metadata !131), !dbg !347
  %arrayidx157 = getelementptr inbounds [256 x i64]* %code, i64 0, i64 %j.2413, !dbg !355
  %31 = load i64* %arrayidx157, align 8, !dbg !355, !tbaa !182
  %arrayidx158 = getelementptr inbounds [256 x i8]* %clen, i64 0, i64 %j.2413, !dbg !357
  %32 = load i8* %arrayidx158, align 1, !dbg !357, !tbaa !145
  %conv159 = zext i8 %32 to i64, !dbg !357
  %or160 = or i64 %conv159, %31, !dbg !355
  %tobool161 = icmp eq i64 %or160, 0, !dbg !358
  br i1 %tobool161, label %for.inc188, label %if.then162, !dbg !358

if.then162:                                       ; preds = %for.body154
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !40, metadata !131), !dbg !359
  tail call void @llvm.dbg.value(metadata i64 %conv167, i64 0, metadata !39, metadata !131), !dbg !303
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !36, metadata !131), !dbg !173
  %33 = load i8* %arrayidx158, align 1, !dbg !360, !tbaa !145
  %cmp171408 = icmp eq i8 %33, 0, !dbg !364
  br i1 %cmp171408, label %for.end185, label %for.body173.lr.ph, !dbg !365

for.body173.lr.ph:                                ; preds = %if.then162
  %conv164 = zext i8 %32 to i32, !dbg !366
  %sub165 = add nsw i32 %conv164, -1, !dbg !366
  %shl166 = shl i32 1, %sub165, !dbg !367
  %conv167 = sext i32 %shl166 to i64, !dbg !367
  %34 = load i64* %arrayidx157, align 8, !dbg !368, !tbaa !182
  %35 = load i8* %arrayidx158, align 1, !dbg !360, !tbaa !145
  %conv170 = zext i8 %35 to i64, !dbg !360
  br label %for.body173, !dbg !365

for.body173:                                      ; preds = %for.body173.lr.ph, %for.body173
  %i.5411 = phi i64 [ 0, %for.body173.lr.ph ], [ %inc184, %for.body173 ]
  %mask.1410 = phi i64 [ %conv167, %for.body173.lr.ph ], [ %shr182, %for.body173 ]
  %k.0409 = phi i64 [ 0, %for.body173.lr.ph ], [ %add175383.inc180, %for.body173 ]
  %mul174 = shl i64 %k.0409, 1, !dbg !371
  %add175383 = or i64 %mul174, 1, !dbg !371
  tail call void @llvm.dbg.value(metadata i64 %add175383, i64 0, metadata !40, metadata !131), !dbg !359
  %and177 = and i64 %34, %mask.1410, !dbg !368
  %not.tobool178 = icmp ne i64 %and177, 0, !dbg !372
  %inc180 = zext i1 %not.tobool178 to i64, !dbg !372
  %add175383.inc180 = add i64 %inc180, %add175383, !dbg !372
  %shr182 = lshr i64 %mask.1410, 1, !dbg !373
  tail call void @llvm.dbg.value(metadata i64 %shr182, i64 0, metadata !39, metadata !131), !dbg !303
  %inc184 = add nuw nsw i64 %i.5411, 1, !dbg !374
  tail call void @llvm.dbg.value(metadata i64 %inc184, i64 0, metadata !36, metadata !131), !dbg !173
  %cmp171 = icmp ult i64 %inc184, %conv170, !dbg !364
  br i1 %cmp171, label %for.body173, label %for.end185, !dbg !365

for.end185:                                       ; preds = %for.body173, %if.then162
  %k.0.lcssa = phi i64 [ 0, %if.then162 ], [ %add175383.inc180, %for.body173 ]
  %arrayidx186 = getelementptr inbounds [256 x i64]* %heap2, i64 0, i64 %j.2413, !dbg !375
  store i64 %k.0.lcssa, i64* %arrayidx186, align 8, !dbg !375, !tbaa !182
  br label %for.inc188, !dbg !376

for.inc188:                                       ; preds = %for.body154, %for.end185
  %inc189 = add nuw nsw i64 %j.2413, 1, !dbg !377
  tail call void @llvm.dbg.value(metadata i64 %inc189, i64 0, metadata !37, metadata !131), !dbg !268
  %exitcond464 = icmp eq i64 %inc189, 256, !dbg !348
  br i1 %exitcond464, label %land.rhs.lr.ph, label %for.body154, !dbg !348

land.rhs.lr.ph:                                   ; preds = %for.inc188, %while.end211
  %i.6406 = phi i64 [ %inc215, %while.end211 ], [ 1, %for.inc188 ]
  %arrayidx195 = getelementptr inbounds [256 x i64]* %heap2, i64 0, i64 %i.6406, !dbg !378
  %36 = load i64* %arrayidx195, align 8, !dbg !378, !tbaa !182
  tail call void @llvm.dbg.value(metadata i64 %36, i64 0, metadata !42, metadata !131), !dbg !382
  %arrayidx196 = getelementptr inbounds [256 x i8]* %outc, i64 0, i64 %i.6406, !dbg !383
  %37 = load i8* %arrayidx196, align 1, !dbg !383, !tbaa !145
  tail call void @llvm.dbg.value(metadata i8 %37, i64 0, metadata !43, metadata !131), !dbg !384
  tail call void @llvm.dbg.value(metadata i64 %inc215, i64 0, metadata !37, metadata !131), !dbg !268
  br label %land.rhs, !dbg !385

land.rhs:                                         ; preds = %land.rhs.lr.ph, %while.body203
  %j.3404 = phi i64 [ %i.6406, %land.rhs.lr.ph ], [ %sub199, %while.body203 ]
  %sub199 = add nsw i64 %j.3404, -1, !dbg !386
  %arrayidx200 = getelementptr inbounds [256 x i64]* %heap2, i64 0, i64 %sub199, !dbg !388
  %38 = load i64* %arrayidx200, align 8, !dbg !388, !tbaa !182
  %cmp201 = icmp ugt i64 %38, %36, !dbg !388
  br i1 %cmp201, label %while.body203, label %while.end211, !dbg !389

while.body203:                                    ; preds = %land.rhs
  %arrayidx206 = getelementptr inbounds [256 x i64]* %heap2, i64 0, i64 %j.3404, !dbg !391
  store i64 %38, i64* %arrayidx206, align 8, !dbg !391, !tbaa !182
  %arrayidx208 = getelementptr inbounds [256 x i8]* %outc, i64 0, i64 %sub199, !dbg !393
  %39 = load i8* %arrayidx208, align 1, !dbg !393, !tbaa !145
  %arrayidx209 = getelementptr inbounds [256 x i8]* %outc, i64 0, i64 %j.3404, !dbg !394
  store i8 %39, i8* %arrayidx209, align 1, !dbg !394, !tbaa !145
  tail call void @llvm.dbg.value(metadata i64 %sub199, i64 0, metadata !37, metadata !131), !dbg !268
  %tobool198 = icmp eq i64 %sub199, 0, !dbg !385
  br i1 %tobool198, label %while.end211, label %land.rhs, !dbg !385

while.end211:                                     ; preds = %land.rhs, %while.body203
  %j.3.lcssa = phi i64 [ 0, %while.body203 ], [ %j.3404, %land.rhs ]
  %arrayidx212 = getelementptr inbounds [256 x i64]* %heap2, i64 0, i64 %j.3.lcssa, !dbg !395
  store i64 %36, i64* %arrayidx212, align 8, !dbg !395, !tbaa !182
  %arrayidx213 = getelementptr inbounds [256 x i8]* %outc, i64 0, i64 %j.3.lcssa, !dbg !396
  store i8 %37, i8* %arrayidx213, align 1, !dbg !396, !tbaa !145
  %inc215 = add nuw nsw i64 %i.6406, 1, !dbg !397
  tail call void @llvm.dbg.value(metadata i64 %inc215, i64 0, metadata !36, metadata !131), !dbg !173
  %exitcond = icmp eq i64 %inc215, 256, !dbg !398
  br i1 %exitcond, label %for.cond217, label %land.rhs.lr.ph, !dbg !398

for.cond217:                                      ; preds = %while.end211, %for.cond217
  %j.4 = phi i64 [ %inc223, %for.cond217 ], [ 0, %while.end211 ]
  %arrayidx218 = getelementptr inbounds [256 x i64]* %heap2, i64 0, i64 %j.4, !dbg !399
  %40 = load i64* %arrayidx218, align 8, !dbg !399, !tbaa !182
  %cmp219 = icmp eq i64 %40, 0, !dbg !399
  %inc223 = add i64 %j.4, 1, !dbg !402
  tail call void @llvm.dbg.value(metadata i64 %inc223, i64 0, metadata !37, metadata !131), !dbg !268
  br i1 %cmp219, label %for.cond217, label %while.cond225.preheader, !dbg !404

while.cond225.preheader:                          ; preds = %for.cond217
  %cmp226391397 = icmp eq i64 %data_len, 0, !dbg !405
  br i1 %cmp226391397, label %while.end259, label %while.body228.lr.ph, !dbg !406

while.cond225:                                    ; preds = %if.end251
  %shr255 = lshr i64 %mask.2393, 1, !dbg !407
  %cmp226 = icmp ult i64 %n.4, %data_len, !dbg !405
  br i1 %cmp226, label %while.body228, label %while.end259, !dbg !406

while.body228:                                    ; preds = %while.body228.lr.ph, %while.cond225
  %i.7396 = phi i64 [ %i.7.ph402, %while.body228.lr.ph ], [ %i.9, %while.cond225 ]
  %dptr.2395 = phi i8* [ %dptr.2.ph401, %while.body228.lr.ph ], [ %dptr.3, %while.cond225 ]
  %n.3394 = phi i64 [ %n.3.ph399, %while.body228.lr.ph ], [ %n.4, %while.cond225 ]
  %mask.2393 = phi i64 [ 128, %while.body228.lr.ph ], [ %shr255, %while.cond225 ]
  %k.2392 = phi i64 [ %k.2.ph398, %while.body228.lr.ph ], [ %k.4, %while.cond225 ]
  %mul229 = shl i64 %k.2392, 1, !dbg !410
  %add230382 = or i64 %mul229, 1, !dbg !410
  tail call void @llvm.dbg.value(metadata i64 %add230382, i64 0, metadata !40, metadata !131), !dbg !359
  %41 = load i8* %cptr.0.ph400, align 1, !dbg !411, !tbaa !145
  %conv231 = zext i8 %41 to i64, !dbg !413
  %and232 = and i64 %conv231, %mask.2393, !dbg !413
  %not.tobool233 = icmp ne i64 %and232, 0, !dbg !414
  %inc235 = zext i1 %not.tobool233 to i64, !dbg !414
  %add230382.inc235 = add i64 %inc235, %add230382, !dbg !414
  br label %while.cond237, !dbg !414

while.cond237:                                    ; preds = %while.cond237, %while.body228
  %i.8 = phi i64 [ %inc242, %while.cond237 ], [ %i.7396, %while.body228 ]
  %arrayidx238 = getelementptr inbounds [256 x i64]* %heap2, i64 0, i64 %i.8, !dbg !415
  %42 = load i64* %arrayidx238, align 8, !dbg !415, !tbaa !182
  %cmp239 = icmp ult i64 %42, %add230382.inc235, !dbg !415
  %inc242 = add i64 %i.8, 1, !dbg !416
  tail call void @llvm.dbg.value(metadata i64 %inc242, i64 0, metadata !36, metadata !131), !dbg !173
  br i1 %cmp239, label %while.cond237, label %while.end243, !dbg !417

while.end243:                                     ; preds = %while.cond237
  %cmp245 = icmp eq i64 %add230382.inc235, %42, !dbg !418
  br i1 %cmp245, label %if.then247, label %if.end251, !dbg !420

if.then247:                                       ; preds = %while.end243
  %arrayidx248 = getelementptr inbounds [256 x i8]* %outc, i64 0, i64 %i.8, !dbg !421
  %43 = load i8* %arrayidx248, align 1, !dbg !421, !tbaa !145
  store i8 %43, i8* %dptr.2395, align 1, !dbg !423, !tbaa !145
  %incdec.ptr249 = getelementptr inbounds i8* %dptr.2395, i64 1, !dbg !424
  tail call void @llvm.dbg.value(metadata i8* %incdec.ptr249, i64 0, metadata !45, metadata !131), !dbg !153
  %inc250 = add i64 %n.3394, 1, !dbg !425
  tail call void @llvm.dbg.value(metadata i64 %inc250, i64 0, metadata !38, metadata !131), !dbg !204
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !40, metadata !131), !dbg !359
  tail call void @llvm.dbg.value(metadata i64 %j.4, i64 0, metadata !36, metadata !131), !dbg !173
  br label %if.end251, !dbg !426

if.end251:                                        ; preds = %if.then247, %while.end243
  %k.4 = phi i64 [ 0, %if.then247 ], [ %add230382.inc235, %while.end243 ]
  %n.4 = phi i64 [ %inc250, %if.then247 ], [ %n.3394, %while.end243 ]
  %dptr.3 = phi i8* [ %incdec.ptr249, %if.then247 ], [ %dptr.2395, %while.end243 ]
  %i.9 = phi i64 [ %j.4, %if.then247 ], [ %i.8, %while.end243 ]
  %cmp252 = icmp ugt i64 %mask.2393, 1, !dbg !427
  tail call void @llvm.dbg.value(metadata i64 %shr255, i64 0, metadata !39, metadata !131), !dbg !303
  br i1 %cmp252, label %while.cond225, label %if.else256, !dbg !428

if.else256:                                       ; preds = %if.end251
  tail call void @llvm.dbg.value(metadata i64 128, i64 0, metadata !39, metadata !131), !dbg !303
  %incdec.ptr257 = getelementptr inbounds i8* %cptr.0.ph400, i64 1, !dbg !429
  tail call void @llvm.dbg.value(metadata i8* %incdec.ptr257, i64 0, metadata !44, metadata !131), !dbg !431
  %cmp226391 = icmp ult i64 %n.4, %data_len, !dbg !405
  br i1 %cmp226391, label %while.body228.lr.ph, label %while.end259, !dbg !406

while.body228.lr.ph:                              ; preds = %while.cond225.preheader, %if.else256
  %i.7.ph402 = phi i64 [ %i.9, %if.else256 ], [ %j.4, %while.cond225.preheader ]
  %dptr.2.ph401 = phi i8* [ %dptr.3, %if.else256 ], [ %data, %while.cond225.preheader ]
  %cptr.0.ph400 = phi i8* [ %incdec.ptr257, %if.else256 ], [ %call, %while.cond225.preheader ]
  %n.3.ph399 = phi i64 [ %n.4, %if.else256 ], [ 0, %while.cond225.preheader ]
  %k.2.ph398 = phi i64 [ %k.4, %if.else256 ], [ 0, %while.cond225.preheader ]
  br label %while.body228, !dbg !406

while.end259:                                     ; preds = %if.else256, %while.cond225, %while.cond225.preheader
  tail call void @free(i8* %call) #3, !dbg !432
  call void @llvm.lifetime.end(i64 256, i8* %30) #3, !dbg !433
  call void @llvm.lifetime.end(i64 2048, i8* %29) #3, !dbg !433
  call void @llvm.lifetime.end(i64 256, i8* %4) #3, !dbg !433
  call void @llvm.lifetime.end(i64 2048, i8* %3) #3, !dbg !433
  call void @llvm.lifetime.end(i64 2048, i8* %2) #3, !dbg !433
  call void @llvm.lifetime.end(i64 2048, i8* %1) #3, !dbg !433
  call void @llvm.lifetime.end(i64 4096, i8* %0) #3, !dbg !433
  ret void, !dbg !433
}

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #3

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #3

; Function Attrs: nounwind uwtable
define internal fastcc void @heap_adjust(i64* nocapture readonly %freq, i64* nocapture %heap, i32 %n, i32 %k) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i64* %freq, i64 0, metadata !104, metadata !131), !dbg !434
  tail call void @llvm.dbg.value(metadata i64* %heap, i64 0, metadata !105, metadata !131), !dbg !435
  tail call void @llvm.dbg.value(metadata i32 %n, i64 0, metadata !106, metadata !131), !dbg !436
  tail call void @llvm.dbg.value(metadata i32 %k, i64 0, metadata !107, metadata !131), !dbg !437
  %idxprom = sext i32 %k to i64, !dbg !438
  %incdec.ptr.sum = add nsw i64 %idxprom, -1, !dbg !438
  %arrayidx = getelementptr inbounds i64* %heap, i64 %incdec.ptr.sum, !dbg !438
  %0 = load i64* %arrayidx, align 8, !dbg !438, !tbaa !182
  %div = sdiv i32 %n, 2, !dbg !439
  %cmp59 = icmp slt i32 %div, %k, !dbg !440
  br i1 %cmp59, label %while.end, label %while.body.lr.ph, !dbg !441

while.body.lr.ph:                                 ; preds = %entry
  %sext53 = shl i64 %0, 32, !dbg !442
  %idxprom13 = ashr exact i64 %sext53, 32, !dbg !442
  %arrayidx14 = getelementptr inbounds i64* %freq, i64 %idxprom13, !dbg !442
  br label %while.body, !dbg !441

while.body:                                       ; preds = %while.body.lr.ph, %if.end21
  %k.addr.060 = phi i32 [ %k, %while.body.lr.ph ], [ %j.0, %if.end21 ]
  %add = shl nsw i32 %k.addr.060, 1, !dbg !445
  tail call void @llvm.dbg.value(metadata i32 %add, i64 0, metadata !108, metadata !131), !dbg !446
  %cmp2 = icmp slt i32 %add, %n, !dbg !447
  br i1 %cmp2, label %land.lhs.true, label %if.end, !dbg !449

land.lhs.true:                                    ; preds = %while.body
  %idxprom4 = sext i32 %add to i64, !dbg !450
  %incdec.ptr.sum56 = add nsw i64 %idxprom4, -1, !dbg !450
  %arrayidx5 = getelementptr inbounds i64* %heap, i64 %incdec.ptr.sum56, !dbg !450
  %1 = load i64* %arrayidx5, align 8, !dbg !450, !tbaa !182
  %arrayidx6 = getelementptr inbounds i64* %freq, i64 %1, !dbg !451
  %2 = load i64* %arrayidx6, align 8, !dbg !451, !tbaa !182
  %add757 = or i32 %add, 1, !dbg !452
  %idxprom8 = sext i32 %add757 to i64, !dbg !453
  %incdec.ptr.sum58 = add nsw i64 %idxprom8, -1, !dbg !453
  %arrayidx9 = getelementptr inbounds i64* %heap, i64 %incdec.ptr.sum58, !dbg !453
  %3 = load i64* %arrayidx9, align 8, !dbg !453, !tbaa !182
  %arrayidx10 = getelementptr inbounds i64* %freq, i64 %3, !dbg !454
  %4 = load i64* %arrayidx10, align 8, !dbg !454, !tbaa !182
  %cmp11 = icmp ugt i64 %2, %4, !dbg !451
  tail call void @llvm.dbg.value(metadata i32 %add757, i64 0, metadata !108, metadata !131), !dbg !446
  %add757.add = select i1 %cmp11, i32 %add757, i32 %add, !dbg !449
  br label %if.end, !dbg !449

if.end:                                           ; preds = %land.lhs.true, %while.body
  %j.0 = phi i32 [ %add, %while.body ], [ %add757.add, %land.lhs.true ]
  %5 = load i64* %arrayidx14, align 8, !dbg !442, !tbaa !182
  %idxprom15 = sext i32 %j.0 to i64, !dbg !455
  %incdec.ptr.sum54 = add nsw i64 %idxprom15, -1, !dbg !455
  %arrayidx16 = getelementptr inbounds i64* %heap, i64 %incdec.ptr.sum54, !dbg !455
  %6 = load i64* %arrayidx16, align 8, !dbg !455, !tbaa !182
  %arrayidx17 = getelementptr inbounds i64* %freq, i64 %6, !dbg !456
  %7 = load i64* %arrayidx17, align 8, !dbg !456, !tbaa !182
  %cmp18 = icmp ult i64 %5, %7, !dbg !442
  br i1 %cmp18, label %while.end, label %if.end21, !dbg !457

if.end21:                                         ; preds = %if.end
  %idxprom24 = sext i32 %k.addr.060 to i64, !dbg !458
  %incdec.ptr.sum55 = add nsw i64 %idxprom24, -1, !dbg !458
  %arrayidx25 = getelementptr inbounds i64* %heap, i64 %incdec.ptr.sum55, !dbg !458
  store i64 %6, i64* %arrayidx25, align 8, !dbg !458, !tbaa !182
  tail call void @llvm.dbg.value(metadata i32 %j.0, i64 0, metadata !107, metadata !131), !dbg !437
  %cmp = icmp sgt i32 %j.0, %div, !dbg !440
  br i1 %cmp, label %while.end, label %while.body, !dbg !441

while.end:                                        ; preds = %if.end, %if.end21, %entry
  %k.addr.0.lcssa = phi i32 [ %k, %entry ], [ %k.addr.060, %if.end ], [ %j.0, %if.end21 ]
  %sext = shl i64 %0, 32, !dbg !459
  %conv26 = ashr exact i64 %sext, 32, !dbg !459
  %idxprom27 = sext i32 %k.addr.0.lcssa to i64, !dbg !460
  %incdec.ptr.sum52 = add nsw i64 %idxprom27, -1, !dbg !460
  %arrayidx28 = getelementptr inbounds i64* %heap, i64 %incdec.ptr.sum52, !dbg !460
  store i64 %conv26, i64* %arrayidx28, align 8, !dbg !460, !tbaa !182
  ret void, !dbg !461
}

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
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !79, metadata !131), !dbg !462
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !80, metadata !131), !dbg !463
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !82, metadata !131), !dbg !464
  %cmp = icmp sgt i32 %argc, 1, !dbg !465
  br i1 %cmp, label %cond.true.lr.ph, label %if.end44, !dbg !466

cond.true.lr.ph:                                  ; preds = %entry
  %arrayidx = getelementptr inbounds i8** %argv, i64 1, !dbg !467
  %0 = load i8** %arrayidx, align 8, !dbg !467, !tbaa !285
  %1 = load i8* %0, align 1, !dbg !467, !tbaa !145
  %cmp10 = icmp eq i8 %1, 45, !dbg !469
  %arrayidx14 = getelementptr inbounds i8* %0, i64 1, !dbg !472
  %arrayidx24 = getelementptr inbounds i8* %0, i64 2, !dbg !475
  %arrayidx34 = getelementptr inbounds i8* %0, i64 3, !dbg !479
  br label %cond.true, !dbg !482

for.cond:                                         ; preds = %cond.true, %if.then12, %if.then22, %if.end38
  %inc84 = add nuw nsw i32 %i.080, 1, !dbg !483
  %cmp1 = icmp slt i32 %inc84, %argc, !dbg !484
  br i1 %cmp1, label %cond.true, label %if.end44, !dbg !482

cond.true:                                        ; preds = %cond.true.lr.ph, %for.cond
  %i.080 = phi i32 [ 1, %cond.true.lr.ph ], [ %inc84, %for.cond ]
  tail call void @llvm.dbg.value(metadata i64 3, i64 0, metadata !92, metadata !131), !dbg !485
  tail call void @llvm.dbg.value(metadata i8* %0, i64 0, metadata !93, metadata !131), !dbg !486
  br i1 %cmp10, label %if.then12, label %for.cond, !dbg !486

if.then12:                                        ; preds = %cond.true
  %2 = load i8* %arrayidx14, align 1, !dbg !472, !tbaa !145
  %cmp20 = icmp eq i8 %2, 103, !dbg !487
  br i1 %cmp20, label %if.then22, label %for.cond, !dbg !489

if.then22:                                        ; preds = %if.then12
  %3 = load i8* %arrayidx24, align 1, !dbg !475, !tbaa !145
  %cmp30 = icmp eq i8 %3, 97, !dbg !490
  br i1 %cmp30, label %if.end38, label %for.cond, !dbg !492

if.end38:                                         ; preds = %if.then22
  %4 = load i8* %arrayidx34, align 1, !dbg !479, !tbaa !145
  %tobool = icmp eq i8 %4, 0, !dbg !493
  br i1 %tobool, label %if.end44, label %for.cond, !dbg !493

if.end44:                                         ; preds = %for.cond, %if.end38, %entry
  %ga_testing.0 = phi i1 [ false, %entry ], [ true, %if.end38 ], [ false, %for.cond ]
  %call46 = tail call i8* @generate_test_data(i64 10000000), !dbg !494
  tail call void @llvm.dbg.value(metadata i8* %call46, i64 0, metadata !96, metadata !131), !dbg !495
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !81, metadata !131), !dbg !496
  br label %for.body50, !dbg !497

for.body50:                                       ; preds = %for.body50, %if.end44
  %i.178 = phi i32 [ 0, %if.end44 ], [ %inc52, %for.body50 ]
  tail call void @compdecomp(i8* %call46, i64 10000000), !dbg !499
  %inc52 = add nuw nsw i32 %i.178, 1, !dbg !501
  tail call void @llvm.dbg.value(metadata i32 %inc52, i64 0, metadata !81, metadata !131), !dbg !496
  %exitcond = icmp eq i32 %inc52, 30, !dbg !497
  br i1 %exitcond, label %for.end53, label %for.body50, !dbg !497

for.end53:                                        ; preds = %for.body50
  tail call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !97, metadata !131), !dbg !502
  tail call void @free(i8* %call46) #3, !dbg !503
  %5 = load %struct._IO_FILE** @stdout, align 8, !dbg !504, !tbaa !285
  br i1 %ga_testing.0, label %if.then56, label %if.else, !dbg !506

if.then56:                                        ; preds = %for.end53
  %call57 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([3 x i8]* @.str5, i64 0, i64 0), double 0.000000e+00) #3, !dbg !507
  br label %if.end59, !dbg !507

if.else:                                          ; preds = %for.end53
  %call58 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([35 x i8]* @.str6, i64 0, i64 0), double 0.000000e+00) #3, !dbg !508
  br label %if.end59

if.end59:                                         ; preds = %if.else, %if.then56
  %6 = load %struct._IO_FILE** @stdout, align 8, !dbg !509, !tbaa !285
  %call60 = tail call i32 @fflush(%struct._IO_FILE* %6) #3, !dbg !510
  ret i32 0, !dbg !511
}

; Function Attrs: nounwind
declare i32 @fflush(%struct._IO_FILE* nocapture) #2

; Function Attrs: nounwind uwtable
define internal fastcc i64 @random4() #0 {
entry:
  %0 = load i64* @seed, align 8, !dbg !512, !tbaa !182
  %xor = xor i64 %0, 123459876, !dbg !512
  %div = sdiv i64 %xor, 127773, !dbg !513
  tail call void @llvm.dbg.value(metadata i64 %div, i64 0, metadata !114, metadata !131), !dbg !514
  %1 = mul i64 %div, -127773, !dbg !515
  %sub6 = add i64 %xor, %1, !dbg !515
  %mul1 = mul nsw i64 %sub6, 16807, !dbg !516
  %2 = mul i64 %div, -2836, !dbg !516
  %sub37 = add i64 %mul1, %2, !dbg !516
  %cmp = icmp slt i64 %sub37, 0, !dbg !517
  %add = add nsw i64 %sub37, 2147483647, !dbg !519
  %add.sub3 = select i1 %cmp, i64 %add, i64 %sub37, !dbg !520
  %rem = srem i64 %add.sub3, 32, !dbg !521
  tail call void @llvm.dbg.value(metadata i64 %rem, i64 0, metadata !116, metadata !131), !dbg !522
  %xor4 = xor i64 %add.sub3, 123459876, !dbg !523
  store i64 %xor4, i64* @seed, align 8, !dbg !523, !tbaa !182
  ret i64 %rem, !dbg !524
}

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
!99 = !{!"0x2e\00heap_adjust\00heap_adjust\00\00106\001\001\000\000\00256\001\00107", !1, !19, !100, null, void (i64*, i64*, i32, i32)* @heap_adjust, null, null, !103} ; [ DW_TAG_subprogram ] [line 106] [local] [def] [scope 107] [heap_adjust]
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
!110 = !{!"0x2e\00random4\00random4\00\0047\001\001\000\000\000\001\0048", !1, !19, !111, null, i64 ()* @random4, null, null, !113} ; [ DW_TAG_subprogram ] [line 47] [local] [def] [scope 48] [random4]
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
!142 = !MDLocation(line: 98, column: 28, scope: !143)
!143 = !{!"0xb\0097\005\002", !1, !139}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!144 = !MDLocation(line: 98, column: 22, scope: !143)
!145 = !{!146, !146, i64 0}
!146 = !{!"omnipotent char", !147, i64 0}
!147 = !{!"Simple C/C++ TBAA"}
!148 = !MDLocation(line: 98, column: 9, scope: !143)
!149 = !MDLocation(line: 99, column: 9, scope: !143)
!150 = !MDLocation(line: 102, column: 5, scope: !18)
!151 = !MDLocation(line: 136, column: 24, scope: !30)
!152 = !MDLocation(line: 136, column: 37, scope: !30)
!153 = !MDLocation(line: 142, column: 12, scope: !30)
!154 = !MDLocation(line: 149, column: 34, scope: !30)
!155 = !MDLocation(line: 149, column: 27, scope: !30)
!156 = !MDLocation(line: 149, column: 12, scope: !30)
!157 = !MDLocation(line: 151, column: 5, scope: !30)
!158 = !MDLocation(line: 151, column: 12, scope: !30)
!159 = !MDLocation(line: 152, column: 5, scope: !30)
!160 = !MDLocation(line: 152, column: 12, scope: !30)
!161 = !MDLocation(line: 153, column: 5, scope: !30)
!162 = !MDLocation(line: 153, column: 12, scope: !30)
!163 = !MDLocation(line: 154, column: 5, scope: !30)
!164 = !MDLocation(line: 154, column: 12, scope: !30)
!165 = !MDLocation(line: 155, column: 5, scope: !30)
!166 = !MDLocation(line: 155, column: 12, scope: !30)
!167 = !MDLocation(line: 157, column: 5, scope: !30)
!168 = !MDLocation(line: 158, column: 5, scope: !30)
!169 = !MDLocation(line: 159, column: 5, scope: !30)
!170 = !MDLocation(line: 160, column: 5, scope: !30)
!171 = !MDLocation(line: 161, column: 5, scope: !30)
!172 = !MDLocation(line: 162, column: 5, scope: !30)
!173 = !MDLocation(line: 138, column: 12, scope: !30)
!174 = !MDLocation(line: 165, column: 17, scope: !175)
!175 = !{!"0xb\00165\005\004", !1, !176}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!176 = !{!"0xb\00165\005\003", !1, !30}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!177 = !MDLocation(line: 165, column: 5, scope: !176)
!178 = !MDLocation(line: 167, column: 25, scope: !179)
!179 = !{!"0xb\00166\005\005", !1, !175}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!180 = !MDLocation(line: 167, column: 16, scope: !179)
!181 = !MDLocation(line: 167, column: 9, scope: !179)
!182 = !{!183, !183, i64 0}
!183 = !{!"long", !146, i64 0}
!184 = !MDLocation(line: 168, column: 9, scope: !179)
!185 = !MDLocation(line: 165, column: 31, scope: !175)
!186 = !MDLocation(line: 183, column: 17, scope: !187)
!187 = !{!"0xb\002", !1, !188}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!188 = !{!"0xb\001", !1, !189}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!189 = !{!"0xb\00183\005\0012", !1, !190}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!190 = !{!"0xb\00183\005\0011", !1, !30}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!191 = !MDLocation(line: 183, column: 5, scope: !190)
!192 = !MDLocation(line: 184, column: 21, scope: !189)
!193 = !MDLocation(line: 184, column: 26, scope: !189)
!194 = !MDLocation(line: 184, column: 31, scope: !189)
!195 = !MDLocation(line: 176, column: 13, scope: !196)
!196 = !{!"0xb\00176\0013\009", !1, !197}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!197 = !{!"0xb\00175\005\008", !1, !198}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!198 = !{!"0xb\00174\005\007", !1, !199}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!199 = !{!"0xb\00174\005\006", !1, !30}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!200 = !MDLocation(line: 176, column: 13, scope: !197)
!201 = !MDLocation(line: 178, column: 13, scope: !202)
!202 = !{!"0xb\00177\009\0010", !1, !196}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!203 = !MDLocation(line: 179, column: 13, scope: !202)
!204 = !MDLocation(line: 138, column: 18, scope: !30)
!205 = !MDLocation(line: 180, column: 9, scope: !202)
!206 = !MDLocation(line: 174, column: 26, scope: !198)
!207 = !MDLocation(line: 174, column: 5, scope: !199)
!208 = !MDLocation(line: 191, column: 12, scope: !209)
!209 = !{!"0xb\002", !1, !210}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!210 = !{!"0xb\001", !1, !30}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!211 = !MDLocation(line: 191, column: 5, scope: !30)
!212 = !MDLocation(line: 195, column: 19, scope: !213)
!213 = !{!"0xb\00192\005\0013", !1, !30}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!214 = !MDLocation(line: 199, column: 21, scope: !213)
!215 = !MDLocation(line: 184, column: 33, scope: !189)
!216 = !MDLocation(line: 184, column: 9, scope: !189)
!217 = !MDLocation(line: 183, column: 24, scope: !189)
!218 = !MDLocation(line: 194, column: 9, scope: !213)
!219 = !MDLocation(line: 196, column: 19, scope: !213)
!220 = !MDLocation(line: 196, column: 9, scope: !213)
!221 = !MDLocation(line: 199, column: 31, scope: !213)
!222 = !MDLocation(line: 199, column: 9, scope: !213)
!223 = !MDLocation(line: 203, column: 30, scope: !213)
!224 = !MDLocation(line: 203, column: 25, scope: !213)
!225 = !MDLocation(line: 203, column: 41, scope: !213)
!226 = !MDLocation(line: 203, column: 14, scope: !213)
!227 = !MDLocation(line: 203, column: 9, scope: !213)
!228 = !MDLocation(line: 204, column: 26, scope: !213)
!229 = !MDLocation(line: 204, column: 9, scope: !213)
!230 = !{!231, !231, i64 0}
!231 = !{!"int", !146, i64 0}
!232 = !MDLocation(line: 205, column: 25, scope: !213)
!233 = !MDLocation(line: 205, column: 14, scope: !213)
!234 = !MDLocation(line: 205, column: 9, scope: !213)
!235 = !MDLocation(line: 206, column: 9, scope: !213)
!236 = !MDLocation(line: 209, column: 9, scope: !213)
!237 = !MDLocation(line: 212, column: 10, scope: !30)
!238 = !MDLocation(line: 212, column: 5, scope: !30)
!239 = !MDLocation(line: 215, column: 18, scope: !30)
!240 = !MDLocation(line: 215, column: 28, scope: !30)
!241 = !MDLocation(line: 215, column: 12, scope: !30)
!242 = !MDLocation(line: 218, column: 5, scope: !243)
!243 = !{!"0xb\00218\005\0014", !1, !30}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!244 = !MDLocation(line: 220, column: 14, scope: !245)
!245 = !{!"0xb\00220\0013\0017", !1, !246}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!246 = !{!"0xb\00219\005\0016", !1, !247}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!247 = !{!"0xb\00218\005\0015", !1, !243}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!248 = !MDLocation(line: 220, column: 13, scope: !246)
!249 = !MDLocation(line: 230, column: 17, scope: !250)
!250 = !{!"0xb\00226\009\0019", !1, !245}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!251 = !MDLocation(line: 232, column: 13, scope: !250)
!252 = !MDLocation(line: 222, column: 13, scope: !253)
!253 = !{!"0xb\00221\009\0018", !1, !245}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!254 = !MDLocation(line: 223, column: 13, scope: !253)
!255 = !MDLocation(line: 224, column: 9, scope: !253)
!256 = !MDLocation(line: 234, column: 21, scope: !257)
!257 = !{!"0xb\00234\0021\0021", !1, !258}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!258 = !{!"0xb\00233\0013\0020", !1, !250}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!259 = !MDLocation(line: 234, column: 21, scope: !258)
!260 = !MDLocation(line: 236, column: 21, scope: !261)
!261 = !{!"0xb\00235\0017\0022", !1, !257}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!262 = !MDLocation(line: 215, column: 15, scope: !30)
!263 = !MDLocation(line: 237, column: 26, scope: !261)
!264 = !MDLocation(line: 216, column: 9, scope: !30)
!265 = !MDLocation(line: 238, column: 17, scope: !261)
!266 = !MDLocation(line: 240, column: 22, scope: !258)
!267 = !MDLocation(line: 241, column: 17, scope: !258)
!268 = !MDLocation(line: 138, column: 15, scope: !30)
!269 = !MDLocation(line: 242, column: 17, scope: !258)
!270 = !MDLocation(line: 245, column: 13, scope: !250)
!271 = !MDLocation(line: 246, column: 23, scope: !250)
!272 = !MDLocation(line: 246, column: 13, scope: !250)
!273 = !MDLocation(line: 249, column: 17, scope: !274)
!274 = !{!"0xb\00249\0017\0023", !1, !250}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!275 = !MDLocation(line: 249, column: 17, scope: !250)
!276 = !MDLocation(line: 253, column: 17, scope: !277)
!277 = !{!"0xb\00253\0017\0024", !1, !250}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!278 = !MDLocation(line: 253, column: 17, scope: !250)
!279 = !MDLocation(line: 218, column: 26, scope: !247)
!280 = !MDLocation(line: 259, column: 9, scope: !281)
!281 = !{!"0xb\00259\009\0025", !1, !30}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!282 = !MDLocation(line: 259, column: 9, scope: !30)
!283 = !MDLocation(line: 261, column: 17, scope: !284)
!284 = !{!"0xb\00260\005\0026", !1, !281}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!285 = !{!286, !286, i64 0}
!286 = !{!"any pointer", !146, i64 0}
!287 = !MDLocation(line: 261, column: 9, scope: !284)
!288 = !MDLocation(line: 262, column: 9, scope: !284)
!289 = !MDLocation(line: 266, column: 12, scope: !30)
!290 = !MDLocation(line: 267, column: 12, scope: !30)
!291 = !MDLocation(line: 268, column: 12, scope: !30)
!292 = !MDLocation(line: 272, column: 9, scope: !293)
!293 = !{!"0xb\00272\009\0027", !1, !30}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!294 = !MDLocation(line: 272, column: 9, scope: !30)
!295 = !MDLocation(line: 278, column: 17, scope: !296)
!296 = !{!"0xb\00278\005\0030", !1, !297}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!297 = !{!"0xb\00278\005\0029", !1, !30}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!298 = !MDLocation(line: 278, column: 5, scope: !297)
!299 = !MDLocation(line: 274, column: 17, scope: !300)
!300 = !{!"0xb\00273\005\0028", !1, !293}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!301 = !MDLocation(line: 274, column: 9, scope: !300)
!302 = !MDLocation(line: 275, column: 9, scope: !300)
!303 = !MDLocation(line: 138, column: 21, scope: !30)
!304 = !MDLocation(line: 284, column: 31, scope: !305)
!305 = !{!"0xb\00284\009\0033", !1, !306}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!306 = !{!"0xb\00284\009\0032", !1, !307}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!307 = !{!"0xb\00279\005\0031", !1, !296}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!308 = !MDLocation(line: 284, column: 25, scope: !305)
!309 = !MDLocation(line: 284, column: 21, scope: !305)
!310 = !MDLocation(line: 284, column: 9, scope: !306)
!311 = !MDLocation(line: 281, column: 28, scope: !307)
!312 = !MDLocation(line: 281, column: 22, scope: !307)
!313 = !MDLocation(line: 281, column: 16, scope: !307)
!314 = !MDLocation(line: 286, column: 17, scope: !315)
!315 = !{!"0xb\00286\0017\0035", !1, !316}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!316 = !{!"0xb\00285\009\0034", !1, !305}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!317 = !MDLocation(line: 286, column: 17, scope: !316)
!318 = !MDLocation(line: 289, column: 17, scope: !319)
!319 = !{!"0xb\00287\0013\0036", !1, !315}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!320 = !MDLocation(line: 290, column: 17, scope: !319)
!321 = !MDLocation(line: 293, column: 21, scope: !322)
!322 = !{!"0xb\00293\0021\0037", !1, !319}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!323 = !MDLocation(line: 293, column: 21, scope: !319)
!324 = !MDLocation(line: 295, column: 29, scope: !325)
!325 = !{!"0xb\00294\0017\0038", !1, !322}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!326 = !MDLocation(line: 295, column: 21, scope: !325)
!327 = !MDLocation(line: 296, column: 21, scope: !325)
!328 = !MDLocation(line: 305, column: 17, scope: !329)
!329 = !{!"0xb\00303\0013\0039", !1, !315}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!330 = !MDLocation(line: 306, column: 17, scope: !329)
!331 = !MDLocation(line: 309, column: 23, scope: !332)
!332 = !{!"0xb\00309\0017\0040", !1, !316}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!333 = !MDLocation(line: 309, column: 17, scope: !332)
!334 = !MDLocation(line: 309, column: 17, scope: !316)
!335 = !MDLocation(line: 312, column: 13, scope: !316)
!336 = !MDLocation(line: 284, column: 40, scope: !305)
!337 = !MDLocation(line: 315, column: 9, scope: !307)
!338 = !MDLocation(line: 278, column: 31, scope: !296)
!339 = !MDLocation(line: 319, column: 15, scope: !30)
!340 = !MDLocation(line: 319, column: 5, scope: !30)
!341 = !MDLocation(line: 320, column: 5, scope: !30)
!342 = !MDLocation(line: 331, column: 5, scope: !30)
!343 = !MDLocation(line: 331, column: 12, scope: !30)
!344 = !MDLocation(line: 334, column: 5, scope: !30)
!345 = !MDLocation(line: 334, column: 10, scope: !30)
!346 = !MDLocation(line: 337, column: 5, scope: !30)
!347 = !MDLocation(line: 340, column: 12, scope: !30)
!348 = !MDLocation(line: 342, column: 5, scope: !349)
!349 = !{!"0xb\00342\005\0041", !1, !30}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!350 = !MDLocation(line: 344, column: 19, scope: !351)
!351 = !{!"0xb\00343\005\0043", !1, !352}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!352 = !{!"0xb\00342\005\0042", !1, !349}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!353 = !MDLocation(line: 344, column: 9, scope: !351)
!354 = !MDLocation(line: 345, column: 9, scope: !351)
!355 = !MDLocation(line: 348, column: 13, scope: !356)
!356 = !{!"0xb\00348\0013\0044", !1, !351}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!357 = !MDLocation(line: 348, column: 23, scope: !356)
!358 = !MDLocation(line: 348, column: 13, scope: !351)
!359 = !MDLocation(line: 139, column: 12, scope: !30)
!360 = !MDLocation(line: 356, column: 29, scope: !361)
!361 = !{!"0xb\00356\0013\0047", !1, !362}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!362 = !{!"0xb\00356\0013\0046", !1, !363}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!363 = !{!"0xb\00349\009\0045", !1, !356}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!364 = !MDLocation(line: 356, column: 25, scope: !361)
!365 = !MDLocation(line: 356, column: 13, scope: !362)
!366 = !MDLocation(line: 352, column: 26, scope: !363)
!367 = !MDLocation(line: 352, column: 20, scope: !363)
!368 = !MDLocation(line: 360, column: 21, scope: !369)
!369 = !{!"0xb\00360\0021\0049", !1, !370}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!370 = !{!"0xb\00357\0013\0048", !1, !361}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!371 = !MDLocation(line: 358, column: 21, scope: !370)
!372 = !MDLocation(line: 360, column: 21, scope: !370)
!373 = !MDLocation(line: 363, column: 17, scope: !370)
!374 = !MDLocation(line: 356, column: 38, scope: !361)
!375 = !MDLocation(line: 366, column: 13, scope: !363)
!376 = !MDLocation(line: 367, column: 9, scope: !363)
!377 = !MDLocation(line: 342, column: 26, scope: !352)
!378 = !MDLocation(line: 373, column: 13, scope: !379)
!379 = !{!"0xb\00372\005\0052", !1, !380}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!380 = !{!"0xb\00371\005\0051", !1, !381}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!381 = !{!"0xb\00371\005\0050", !1, !30}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!382 = !MDLocation(line: 139, column: 15, scope: !30)
!383 = !MDLocation(line: 374, column: 13, scope: !379)
!384 = !MDLocation(line: 140, column: 12, scope: !30)
!385 = !MDLocation(line: 377, column: 16, scope: !379)
!386 = !MDLocation(line: 377, column: 30, scope: !387)
!387 = !{!"0xb\002", !1, !379}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!388 = !MDLocation(line: 377, column: 24, scope: !379)
!389 = !MDLocation(line: 377, column: 9, scope: !390)
!390 = !{!"0xb\003", !1, !379}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!391 = !MDLocation(line: 379, column: 13, scope: !392)
!392 = !{!"0xb\00378\009\0053", !1, !379}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!393 = !MDLocation(line: 380, column: 23, scope: !392)
!394 = !MDLocation(line: 380, column: 13, scope: !392)
!395 = !MDLocation(line: 384, column: 9, scope: !379)
!396 = !MDLocation(line: 385, column: 9, scope: !379)
!397 = !MDLocation(line: 371, column: 26, scope: !380)
!398 = !MDLocation(line: 371, column: 5, scope: !381)
!399 = !MDLocation(line: 389, column: 17, scope: !400)
!400 = !{!"0xb\00389\005\0055", !1, !401}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!401 = !{!"0xb\00389\005\0054", !1, !30}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!402 = !MDLocation(line: 389, column: 32, scope: !403)
!403 = !{!"0xb\003", !1, !400}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!404 = !MDLocation(line: 389, column: 5, scope: !401)
!405 = !MDLocation(line: 399, column: 12, scope: !30)
!406 = !MDLocation(line: 399, column: 5, scope: !30)
!407 = !MDLocation(line: 422, column: 13, scope: !408)
!408 = !{!"0xb\00421\0013\0060", !1, !409}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!409 = !{!"0xb\00400\005\0056", !1, !30}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!410 = !MDLocation(line: 401, column: 13, scope: !409)
!411 = !MDLocation(line: 403, column: 14, scope: !412)
!412 = !{!"0xb\00403\0013\0057", !1, !409}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!413 = !MDLocation(line: 403, column: 13, scope: !412)
!414 = !MDLocation(line: 403, column: 13, scope: !409)
!415 = !MDLocation(line: 407, column: 16, scope: !409)
!416 = !MDLocation(line: 408, column: 13, scope: !409)
!417 = !MDLocation(line: 407, column: 9, scope: !409)
!418 = !MDLocation(line: 411, column: 13, scope: !419)
!419 = !{!"0xb\00411\0013\0058", !1, !409}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!420 = !MDLocation(line: 411, column: 13, scope: !409)
!421 = !MDLocation(line: 413, column: 23, scope: !422)
!422 = !{!"0xb\00412\009\0059", !1, !419}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!423 = !MDLocation(line: 413, column: 13, scope: !422)
!424 = !MDLocation(line: 414, column: 13, scope: !422)
!425 = !MDLocation(line: 415, column: 13, scope: !422)
!426 = !MDLocation(line: 418, column: 9, scope: !422)
!427 = !MDLocation(line: 421, column: 13, scope: !408)
!428 = !MDLocation(line: 421, column: 13, scope: !409)
!429 = !MDLocation(line: 426, column: 13, scope: !430)
!430 = !{!"0xb\00424\009\0061", !1, !408}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!431 = !MDLocation(line: 141, column: 12, scope: !30)
!432 = !MDLocation(line: 431, column: 5, scope: !30)
!433 = !MDLocation(line: 432, column: 1, scope: !30)
!434 = !MDLocation(line: 106, column: 34, scope: !99)
!435 = !MDLocation(line: 106, column: 49, scope: !99)
!436 = !MDLocation(line: 106, column: 59, scope: !99)
!437 = !MDLocation(line: 106, column: 66, scope: !99)
!438 = !MDLocation(line: 116, column: 13, scope: !99)
!439 = !MDLocation(line: 118, column: 18, scope: !99)
!440 = !MDLocation(line: 118, column: 12, scope: !99)
!441 = !MDLocation(line: 118, column: 5, scope: !99)
!442 = !MDLocation(line: 125, column: 13, scope: !443)
!443 = !{!"0xb\00125\0013\0081", !1, !444}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!444 = !{!"0xb\00119\005\0079", !1, !99}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!445 = !MDLocation(line: 120, column: 13, scope: !444)
!446 = !MDLocation(line: 112, column: 9, scope: !99)
!447 = !MDLocation(line: 122, column: 14, scope: !448)
!448 = !{!"0xb\00122\0013\0080", !1, !444}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!449 = !MDLocation(line: 122, column: 13, scope: !444)
!450 = !MDLocation(line: 122, column: 30, scope: !448)
!451 = !MDLocation(line: 122, column: 25, scope: !448)
!452 = !MDLocation(line: 122, column: 51, scope: !448)
!453 = !MDLocation(line: 122, column: 46, scope: !448)
!454 = !MDLocation(line: 122, column: 41, scope: !448)
!455 = !MDLocation(line: 125, column: 28, scope: !443)
!456 = !MDLocation(line: 125, column: 23, scope: !443)
!457 = !MDLocation(line: 125, column: 13, scope: !444)
!458 = !MDLocation(line: 128, column: 9, scope: !444)
!459 = !MDLocation(line: 132, column: 15, scope: !99)
!460 = !MDLocation(line: 132, column: 5, scope: !99)
!461 = !MDLocation(line: 133, column: 1, scope: !99)
!462 = !MDLocation(line: 434, column: 14, scope: !74)
!463 = !MDLocation(line: 434, column: 28, scope: !74)
!464 = !MDLocation(line: 439, column: 10, scope: !74)
!465 = !MDLocation(line: 441, column: 9, scope: !91)
!466 = !MDLocation(line: 441, column: 9, scope: !74)
!467 = !MDLocation(line: 445, column: 18, scope: !468)
!468 = !{!"0xb\003", !1, !94}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!469 = !MDLocation(line: 445, column: 18, scope: !470)
!470 = !{!"0xb\005", !1, !471}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!471 = !{!"0xb\00445\0018\0070", !1, !94}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!472 = !MDLocation(line: 445, column: 18, scope: !473)
!473 = !{!"0xb\007", !1, !474}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!474 = !{!"0xb\00445\0018\0071", !1, !471}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!475 = !MDLocation(line: 445, column: 18, scope: !476)
!476 = !{!"0xb\0011", !1, !477}                   ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!477 = !{!"0xb\00445\0018\0073", !1, !478}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!478 = !{!"0xb\00445\0018\0072", !1, !474}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!479 = !MDLocation(line: 445, column: 18, scope: !480)
!480 = !{!"0xb\0015", !1, !481}                   ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!481 = !{!"0xb\00445\0018\0074", !1, !477}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!482 = !MDLocation(line: 443, column: 9, scope: !89)
!483 = !MDLocation(line: 443, column: 31, scope: !88)
!484 = !MDLocation(line: 443, column: 21, scope: !88)
!485 = !MDLocation(line: 445, column: 18, scope: !85)
!486 = !MDLocation(line: 445, column: 18, scope: !94)
!487 = !MDLocation(line: 445, column: 18, scope: !488)
!488 = !{!"0xb\009", !1, !478}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!489 = !MDLocation(line: 445, column: 18, scope: !474)
!490 = !MDLocation(line: 445, column: 18, scope: !491)
!491 = !{!"0xb\0013", !1, !481}                   ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!492 = !MDLocation(line: 445, column: 18, scope: !477)
!493 = !MDLocation(line: 445, column: 17, scope: !87)
!494 = !MDLocation(line: 454, column: 24, scope: !74)
!495 = !MDLocation(line: 454, column: 12, scope: !74)
!496 = !MDLocation(line: 436, column: 9, scope: !74)
!497 = !MDLocation(line: 467, column: 5, scope: !498)
!498 = !{!"0xb\00467\005\0076", !1, !74}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!499 = !MDLocation(line: 468, column: 9, scope: !500)
!500 = !{!"0xb\00467\005\0077", !1, !498}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!501 = !MDLocation(line: 467, column: 32, scope: !500)
!502 = !MDLocation(line: 472, column: 12, scope: !74)
!503 = !MDLocation(line: 481, column: 5, scope: !74)
!504 = !MDLocation(line: 485, column: 17, scope: !505)
!505 = !{!"0xb\00484\009\0078", !1, !74}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!506 = !MDLocation(line: 484, column: 9, scope: !74)
!507 = !MDLocation(line: 485, column: 9, scope: !505)
!508 = !MDLocation(line: 487, column: 9, scope: !505)
!509 = !MDLocation(line: 489, column: 12, scope: !74)
!510 = !MDLocation(line: 489, column: 5, scope: !74)
!511 = !MDLocation(line: 492, column: 5, scope: !74)
!512 = !MDLocation(line: 52, column: 5, scope: !110)
!513 = !MDLocation(line: 53, column: 9, scope: !110)
!514 = !MDLocation(line: 49, column: 10, scope: !110)
!515 = !MDLocation(line: 54, column: 18, scope: !110)
!516 = !MDLocation(line: 54, column: 12, scope: !110)
!517 = !MDLocation(line: 56, column: 9, scope: !518)
!518 = !{!"0xb\0056\009\0082", !1, !110}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!519 = !MDLocation(line: 57, column: 9, scope: !518)
!520 = !MDLocation(line: 56, column: 9, scope: !110)
!521 = !MDLocation(line: 59, column: 23, scope: !110)
!522 = !MDLocation(line: 50, column: 12, scope: !110)
!523 = !MDLocation(line: 60, column: 5, scope: !110)
!524 = !MDLocation(line: 62, column: 5, scope: !110)
