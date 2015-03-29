; ModuleID = 'lists.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.DLL = type { i32, %struct.DLL*, %struct.DLL* }

@.str = private unnamed_addr constant [12 x i8] c"length: %d\0A\00", align 1
@.str1 = private unnamed_addr constant [28 x i8] c"i:%3d  v:%3d  n:%3d  p:%3d\0A\00", align 1
@.str3 = private unnamed_addr constant [31 x i8] c"[val of next of tail is:  %d]\0A\00", align 1
@.str7 = private unnamed_addr constant [42 x i8] c"li1 first value wrong, wanted %d, got %d\0A\00", align 1
@.str8 = private unnamed_addr constant [37 x i8] c"last value wrong, wanted %d, got %d\0A\00", align 1
@.str9 = private unnamed_addr constant [42 x i8] c"li2 first value wrong, wanted %d, got %d\0A\00", align 1
@.str12 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@str = private unnamed_addr constant [33 x i8] c"[last entry points to list head]\00"
@str13 = private unnamed_addr constant [26 x i8] c"li2 and li1 are not equal\00"
@str16 = private unnamed_addr constant [26 x i8] c"li1 and li2 are not equal\00"

; Function Attrs: nounwind uwtable
define void @list_push_tail(%struct.DLL* %head, %struct.DLL* %item) #0 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.DLL* %head, i64 0, metadata !23, metadata !132), !dbg !133
  tail call void @llvm.dbg.value(metadata %struct.DLL* %item, i64 0, metadata !24, metadata !132), !dbg !134
  %prev = getelementptr inbounds %struct.DLL* %head, i64 0, i32 2, !dbg !135
  %0 = load %struct.DLL** %prev, align 8, !dbg !135, !tbaa !136
  tail call void @llvm.dbg.value(metadata %struct.DLL* %0, i64 0, metadata !25, metadata !132), !dbg !142
  %next = getelementptr inbounds %struct.DLL* %0, i64 0, i32 1, !dbg !143
  store %struct.DLL* %item, %struct.DLL** %next, align 8, !dbg !143, !tbaa !144
  %next1 = getelementptr inbounds %struct.DLL* %item, i64 0, i32 1, !dbg !145
  store %struct.DLL* %head, %struct.DLL** %next1, align 8, !dbg !145, !tbaa !144
  store %struct.DLL* %item, %struct.DLL** %prev, align 8, !dbg !146, !tbaa !136
  %prev3 = getelementptr inbounds %struct.DLL* %item, i64 0, i32 2, !dbg !147
  store %struct.DLL* %0, %struct.DLL** %prev3, align 8, !dbg !147, !tbaa !136
  %val = getelementptr inbounds %struct.DLL* %head, i64 0, i32 0, !dbg !148
  %1 = load i32* %val, align 4, !dbg !148, !tbaa !149
  %inc = add nsw i32 %1, 1, !dbg !148
  store i32 %inc, i32* %val, align 4, !dbg !148, !tbaa !149
  ret void, !dbg !150
}

; Function Attrs: nounwind uwtable
define %struct.DLL* @list_pop_tail(%struct.DLL* %head) #0 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.DLL* %head, i64 0, metadata !30, metadata !132), !dbg !151
  %head.idx = getelementptr %struct.DLL* %head, i64 0, i32 0
  %head.idx.val = load i32* %head.idx, align 4, !tbaa !149
  %cmp.i = icmp eq i32 %head.idx.val, 0, !dbg !152
  br i1 %cmp.i, label %return, label %if.end, !dbg !155

if.end:                                           ; preds = %entry
  %prev1 = getelementptr inbounds %struct.DLL* %head, i64 0, i32 2, !dbg !156
  %0 = load %struct.DLL** %prev1, align 8, !dbg !156, !tbaa !136
  tail call void @llvm.dbg.value(metadata %struct.DLL* %0, i64 0, metadata !32, metadata !132), !dbg !157
  %prev2 = getelementptr inbounds %struct.DLL* %0, i64 0, i32 2, !dbg !158
  %1 = load %struct.DLL** %prev2, align 8, !dbg !158, !tbaa !136
  tail call void @llvm.dbg.value(metadata %struct.DLL* %1, i64 0, metadata !31, metadata !132), !dbg !159
  %next = getelementptr inbounds %struct.DLL* %1, i64 0, i32 1, !dbg !160
  store %struct.DLL* %head, %struct.DLL** %next, align 8, !dbg !160, !tbaa !144
  store %struct.DLL* %1, %struct.DLL** %prev1, align 8, !dbg !161, !tbaa !136
  %dec = add nsw i32 %head.idx.val, -1, !dbg !162
  store i32 %dec, i32* %head.idx, align 4, !dbg !162, !tbaa !149
  br label %return, !dbg !163

return:                                           ; preds = %entry, %if.end
  %retval.0 = phi %struct.DLL* [ %0, %if.end ], [ null, %entry ]
  ret %struct.DLL* %retval.0, !dbg !164
}

; Function Attrs: nounwind uwtable
define void @list_push_head(%struct.DLL* %head, %struct.DLL* %item) #0 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.DLL* %head, i64 0, metadata !35, metadata !132), !dbg !165
  tail call void @llvm.dbg.value(metadata %struct.DLL* %item, i64 0, metadata !36, metadata !132), !dbg !166
  %next1 = getelementptr inbounds %struct.DLL* %head, i64 0, i32 1, !dbg !167
  %0 = load %struct.DLL** %next1, align 8, !dbg !167, !tbaa !144
  tail call void @llvm.dbg.value(metadata %struct.DLL* %0, i64 0, metadata !37, metadata !132), !dbg !168
  store %struct.DLL* %item, %struct.DLL** %next1, align 8, !dbg !169, !tbaa !144
  %prev = getelementptr inbounds %struct.DLL* %0, i64 0, i32 2, !dbg !170
  store %struct.DLL* %item, %struct.DLL** %prev, align 8, !dbg !170, !tbaa !136
  %next3 = getelementptr inbounds %struct.DLL* %item, i64 0, i32 1, !dbg !171
  store %struct.DLL* %0, %struct.DLL** %next3, align 8, !dbg !171, !tbaa !144
  %prev4 = getelementptr inbounds %struct.DLL* %item, i64 0, i32 2, !dbg !172
  store %struct.DLL* %head, %struct.DLL** %prev4, align 8, !dbg !172, !tbaa !136
  %val = getelementptr inbounds %struct.DLL* %head, i64 0, i32 0, !dbg !173
  %1 = load i32* %val, align 4, !dbg !173, !tbaa !149
  %inc = add nsw i32 %1, 1, !dbg !173
  store i32 %inc, i32* %val, align 4, !dbg !173, !tbaa !149
  ret void, !dbg !174
}

; Function Attrs: nounwind uwtable
define %struct.DLL* @list_pop_head(%struct.DLL* %head) #0 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.DLL* %head, i64 0, metadata !40, metadata !132), !dbg !175
  %head.idx = getelementptr %struct.DLL* %head, i64 0, i32 0
  %head.idx.val = load i32* %head.idx, align 4, !tbaa !149
  %cmp.i = icmp eq i32 %head.idx.val, 0, !dbg !176
  br i1 %cmp.i, label %return, label %if.end, !dbg !179

if.end:                                           ; preds = %entry
  %next1 = getelementptr inbounds %struct.DLL* %head, i64 0, i32 1, !dbg !180
  %0 = load %struct.DLL** %next1, align 8, !dbg !180, !tbaa !144
  tail call void @llvm.dbg.value(metadata %struct.DLL* %0, i64 0, metadata !41, metadata !132), !dbg !181
  %next2 = getelementptr inbounds %struct.DLL* %0, i64 0, i32 1, !dbg !182
  %1 = load %struct.DLL** %next2, align 8, !dbg !182, !tbaa !144
  store %struct.DLL* %1, %struct.DLL** %next1, align 8, !dbg !183, !tbaa !144
  %2 = load %struct.DLL** %next2, align 8, !dbg !184, !tbaa !144
  %prev = getelementptr inbounds %struct.DLL* %2, i64 0, i32 2, !dbg !184
  store %struct.DLL* %head, %struct.DLL** %prev, align 8, !dbg !184, !tbaa !136
  %dec = add nsw i32 %head.idx.val, -1, !dbg !185
  store i32 %dec, i32* %head.idx, align 4, !dbg !185, !tbaa !149
  br label %return, !dbg !186

return:                                           ; preds = %entry, %if.end
  %retval.0 = phi %struct.DLL* [ %0, %if.end ], [ null, %entry ]
  ret %struct.DLL* %retval.0, !dbg !187
}

; Function Attrs: nounwind readonly uwtable
define i32 @list_equal(%struct.DLL* readonly %x, %struct.DLL* readonly %y) #1 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.DLL* %x, i64 0, metadata !46, metadata !132), !dbg !188
  tail call void @llvm.dbg.value(metadata %struct.DLL* %y, i64 0, metadata !47, metadata !132), !dbg !189
  tail call void @llvm.dbg.value(metadata %struct.DLL* %x, i64 0, metadata !48, metadata !132), !dbg !190
  tail call void @llvm.dbg.value(metadata %struct.DLL* %y, i64 0, metadata !49, metadata !132), !dbg !191
  %next20 = getelementptr inbounds %struct.DLL* %x, i64 0, i32 1, !dbg !192
  %0 = load %struct.DLL** %next20, align 8, !dbg !192, !tbaa !144
  %cmp21 = icmp eq %struct.DLL* %0, %x, !dbg !197
  %val22 = getelementptr inbounds %struct.DLL* %x, i64 0, i32 0, !dbg !198
  %1 = load i32* %val22, align 4, !dbg !198, !tbaa !149
  %val123 = getelementptr inbounds %struct.DLL* %y, i64 0, i32 0, !dbg !201
  %2 = load i32* %val123, align 4, !dbg !201, !tbaa !149
  %cmp224 = icmp ne i32 %1, %2, !dbg !198
  br i1 %cmp21, label %for.end, label %for.body.preheader, !dbg !202

for.body.preheader:                               ; preds = %entry
  br label %for.body, !dbg !203

for.body:                                         ; preds = %for.body.preheader, %for.inc
  %cmp226 = phi i1 [ %cmp2, %for.inc ], [ %cmp224, %for.body.preheader ]
  %3 = phi %struct.DLL* [ %5, %for.inc ], [ %0, %for.body.preheader ]
  %yp.025 = phi %struct.DLL* [ %4, %for.inc ], [ %y, %for.body.preheader ]
  br i1 %cmp226, label %return.loopexit, label %for.inc, !dbg !203

for.inc:                                          ; preds = %for.body
  tail call void @llvm.dbg.value(metadata %struct.DLL* %5, i64 0, metadata !48, metadata !132), !dbg !190
  %next4 = getelementptr inbounds %struct.DLL* %yp.025, i64 0, i32 1, !dbg !204
  %4 = load %struct.DLL** %next4, align 8, !dbg !204, !tbaa !144
  tail call void @llvm.dbg.value(metadata %struct.DLL* %4, i64 0, metadata !49, metadata !132), !dbg !191
  %next = getelementptr inbounds %struct.DLL* %3, i64 0, i32 1, !dbg !192
  %5 = load %struct.DLL** %next, align 8, !dbg !192, !tbaa !144
  %cmp = icmp eq %struct.DLL* %5, %x, !dbg !197
  %val = getelementptr inbounds %struct.DLL* %3, i64 0, i32 0, !dbg !198
  %6 = load i32* %val, align 4, !dbg !198, !tbaa !149
  %val1 = getelementptr inbounds %struct.DLL* %4, i64 0, i32 0, !dbg !201
  %7 = load i32* %val1, align 4, !dbg !201, !tbaa !149
  %cmp2 = icmp ne i32 %6, %7, !dbg !198
  br i1 %cmp, label %for.end.loopexit, label %for.body, !dbg !202

for.end.loopexit:                                 ; preds = %for.inc
  %cmp2.lcssa30 = phi i1 [ %cmp2, %for.inc ]
  %.lcssa = phi %struct.DLL* [ %4, %for.inc ]
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %cmp2.lcssa = phi i1 [ %cmp224, %entry ], [ %cmp2.lcssa30, %for.end.loopexit ]
  %yp.0.lcssa = phi %struct.DLL* [ %y, %entry ], [ %.lcssa, %for.end.loopexit ]
  br i1 %cmp2.lcssa, label %return, label %if.end9, !dbg !205

if.end9:                                          ; preds = %for.end
  %next10 = getelementptr inbounds %struct.DLL* %yp.0.lcssa, i64 0, i32 1, !dbg !206
  %8 = load %struct.DLL** %next10, align 8, !dbg !206, !tbaa !144
  %cmp11 = icmp eq %struct.DLL* %8, %y, !dbg !206
  %conv = zext i1 %cmp11 to i32, !dbg !206
  br label %return, !dbg !207

return.loopexit:                                  ; preds = %for.body
  br label %return

return:                                           ; preds = %return.loopexit, %for.end, %if.end9
  %retval.0 = phi i32 [ %conv, %if.end9 ], [ 0, %for.end ], [ 0, %return.loopexit ]
  ret i32 %retval.0, !dbg !208
}

; Function Attrs: nounwind uwtable
define void @list_print(i8* nocapture readonly %msg, %struct.DLL* nocapture readonly %x) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i8* %msg, i64 0, metadata !54, metadata !132), !dbg !209
  tail call void @llvm.dbg.value(metadata %struct.DLL* %x, i64 0, metadata !55, metadata !132), !dbg !210
  %next = getelementptr inbounds %struct.DLL* %x, i64 0, i32 1, !dbg !211
  %0 = load %struct.DLL** %next, align 8, !dbg !211, !tbaa !144
  tail call void @llvm.dbg.value(metadata %struct.DLL* %0, i64 0, metadata !57, metadata !132), !dbg !212
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !58, metadata !132), !dbg !213
  %call = tail call i32 @puts(i8* %msg) #5, !dbg !214
  %x.idx = getelementptr %struct.DLL* %x, i64 0, i32 0
  %x.idx.val = load i32* %x.idx, align 4, !tbaa !149
  %call2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i32 %x.idx.val) #5, !dbg !215
  %xp.021 = load %struct.DLL** %next, align 8, !dbg !216
  %next422 = getelementptr inbounds %struct.DLL* %xp.021, i64 0, i32 1, !dbg !218
  %1 = load %struct.DLL** %next422, align 8, !dbg !218, !tbaa !144
  %cmp23 = icmp eq %struct.DLL* %1, %0, !dbg !222
  br i1 %cmp23, label %for.end, label %for.body.preheader, !dbg !223

for.body.preheader:                               ; preds = %entry
  br label %for.body, !dbg !224

for.body:                                         ; preds = %for.body.preheader, %for.body
  %2 = phi %struct.DLL* [ %7, %for.body ], [ %1, %for.body.preheader ]
  %next426 = phi %struct.DLL** [ %next4, %for.body ], [ %next422, %for.body.preheader ]
  %xp.025 = phi %struct.DLL* [ %xp.0, %for.body ], [ %xp.021, %for.body.preheader ]
  %i.024 = phi i32 [ %inc, %for.body ], [ 0, %for.body.preheader ]
  %inc = add nuw nsw i32 %i.024, 1, !dbg !224
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !58, metadata !132), !dbg !213
  %val = getelementptr inbounds %struct.DLL* %xp.025, i64 0, i32 0, !dbg !226
  %3 = load i32* %val, align 4, !dbg !226, !tbaa !149
  %val6 = getelementptr inbounds %struct.DLL* %2, i64 0, i32 0, !dbg !227
  %4 = load i32* %val6, align 4, !dbg !227, !tbaa !149
  %prev = getelementptr inbounds %struct.DLL* %xp.025, i64 0, i32 2, !dbg !228
  %5 = load %struct.DLL** %prev, align 8, !dbg !228, !tbaa !136
  %val7 = getelementptr inbounds %struct.DLL* %5, i64 0, i32 0, !dbg !228
  %6 = load i32* %val7, align 4, !dbg !228, !tbaa !149
  %call8 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str1, i64 0, i64 0), i32 %inc, i32 %3, i32 %4, i32 %6) #5, !dbg !229
  %xp.0 = load %struct.DLL** %next426, align 8, !dbg !216
  %next4 = getelementptr inbounds %struct.DLL* %xp.0, i64 0, i32 1, !dbg !218
  %7 = load %struct.DLL** %next4, align 8, !dbg !218, !tbaa !144
  %cmp = icmp eq %struct.DLL* %7, %0, !dbg !222
  br i1 %cmp, label %for.end.loopexit, label %for.body, !dbg !223

for.end.loopexit:                                 ; preds = %for.body
  %next4.lcssa29 = phi %struct.DLL** [ %next4, %for.body ]
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %next4.lcssa = phi %struct.DLL** [ %next422, %entry ], [ %next4.lcssa29, %for.end.loopexit ]
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([33 x i8]* @str, i64 0, i64 0)) #5, !dbg !230
  %8 = load %struct.DLL** %next4.lcssa, align 8, !dbg !231, !tbaa !144
  %val12 = getelementptr inbounds %struct.DLL* %8, i64 0, i32 0, !dbg !231
  %9 = load i32* %val12, align 4, !dbg !231, !tbaa !149
  %call13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str3, i64 0, i64 0), i32 %9) #5, !dbg !232
  ret void, !dbg !233
}

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #2

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind uwtable
define %struct.DLL* @list_new() #0 {
entry:
  %call = tail call noalias i8* @malloc(i64 24) #5, !dbg !234
  %0 = bitcast i8* %call to %struct.DLL*, !dbg !235
  tail call void @llvm.dbg.value(metadata %struct.DLL* %0, i64 0, metadata !63, metadata !132), !dbg !236
  %next = getelementptr inbounds i8* %call, i64 8, !dbg !237
  %1 = bitcast i8* %next to i8**, !dbg !237
  store i8* %call, i8** %1, align 8, !dbg !237, !tbaa !144
  %prev = getelementptr inbounds i8* %call, i64 16, !dbg !238
  %2 = bitcast i8* %prev to i8**, !dbg !238
  store i8* %call, i8** %2, align 8, !dbg !238, !tbaa !136
  %val = bitcast i8* %call to i32*, !dbg !239
  store i32 0, i32* %val, align 4, !dbg !239, !tbaa !149
  ret %struct.DLL* %0, !dbg !240
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind uwtable
define %struct.DLL* @list_sequence(i32 %from, i32 %to) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %from, i64 0, metadata !68, metadata !132), !dbg !241
  tail call void @llvm.dbg.value(metadata i32 %to, i64 0, metadata !69, metadata !132), !dbg !242
  %cmp = icmp sgt i32 %from, %to, !dbg !243
  tail call void @llvm.dbg.value(metadata i32 %from, i64 0, metadata !71, metadata !132), !dbg !245
  tail call void @llvm.dbg.value(metadata i32 %to, i64 0, metadata !68, metadata !132), !dbg !241
  tail call void @llvm.dbg.value(metadata i32 %from, i64 0, metadata !69, metadata !132), !dbg !242
  %from.to = select i1 %cmp, i32 %from, i32 %to, !dbg !246
  %to.from = select i1 %cmp, i32 %to, i32 %from, !dbg !246
  %sub = sub nsw i32 %from.to, %to.from, !dbg !247
  %add = add nsw i32 %sub, 1, !dbg !247
  tail call void @llvm.dbg.value(metadata i32 %add, i64 0, metadata !70, metadata !132), !dbg !248
  %add4 = add nsw i32 %sub, 2, !dbg !249
  %conv = sext i32 %add4 to i64, !dbg !250
  %mul = mul nsw i64 %conv, 24, !dbg !250
  %call = tail call noalias i8* @malloc(i64 %mul) #5, !dbg !251
  %0 = bitcast i8* %call to %struct.DLL*, !dbg !252
  tail call void @llvm.dbg.value(metadata %struct.DLL* %0, i64 0, metadata !74, metadata !132), !dbg !253
  %dec = add nsw i32 %to.from, -1, !dbg !254
  tail call void @llvm.dbg.value(metadata i32 %dec, i64 0, metadata !68, metadata !132), !dbg !241
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !72, metadata !132), !dbg !255
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !73, metadata !132), !dbg !256
  %cmp571 = icmp sgt i32 %sub, -1, !dbg !257
  %1 = sext i32 %add to i64, !dbg !260
  br i1 %cmp571, label %for.body.lr.ph, label %for.end, !dbg !260

for.body.lr.ph:                                   ; preds = %entry
  %2 = icmp sgt i32 %to, %from
  %smax = select i1 %2, i32 %to, i32 %from
  %3 = xor i32 %to, -1, !dbg !260
  %4 = xor i32 %from, -1, !dbg !260
  %5 = icmp sgt i32 %3, %4
  %smax78 = select i1 %5, i32 %3, i32 %4
  %6 = add i32 %smax, %smax78, !dbg !260
  %7 = add i32 %6, 2, !dbg !260
  %8 = icmp sgt i32 %7, 1
  %.op = add i32 %smax, %smax78, !dbg !260
  %9 = select i1 %8, i32 %.op, i32 -1, !dbg !260
  %10 = icmp sgt i32 %to, %from
  %smax80 = select i1 %10, i32 %to, i32 %from
  %11 = sub i32 -1, %to
  %12 = sub i32 -1, %from
  %13 = icmp sgt i32 %11, %12
  %smax81 = select i1 %13, i32 %11, i32 %12
  %14 = add i32 %smax80, %smax81
  %15 = add i32 %14, 2
  %16 = sext i32 %15 to i64
  %17 = icmp sgt i64 %16, 1
  %smax82 = select i1 %17, i64 %16, i64 1
  %xtraiter = and i64 %smax82, 1
  %lcmp.mod = icmp ne i64 %xtraiter, 0
  %lcmp.overflow = icmp eq i64 %smax82, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %for.body.prol, label %for.body.lr.ph.split

for.body.prol:                                    ; preds = %for.body.prol, %for.body.lr.ph
  %indvars.iv76.prol = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next77.prol, %for.body.prol ]
  %indvars.iv.prol = phi i64 [ 1, %for.body.lr.ph ], [ %indvars.iv.next.prol, %for.body.prol ]
  %from.addr.174.prol = phi i32 [ %dec, %for.body.lr.ph ], [ %inc.prol, %for.body.prol ]
  %prol.iter = phi i64 [ %xtraiter, %for.body.lr.ph ], [ %prol.iter.sub, %for.body.prol ]
  %indvars.iv.next77.prol = add nuw nsw i64 %indvars.iv76.prol, 1, !dbg !260
  %arrayidx.prol = getelementptr inbounds %struct.DLL* %0, i64 %indvars.iv.next77.prol, !dbg !261
  %next.prol = getelementptr inbounds %struct.DLL* %0, i64 %indvars.iv76.prol, i32 1, !dbg !263
  store %struct.DLL* %arrayidx.prol, %struct.DLL** %next.prol, align 8, !dbg !263, !tbaa !144
  %18 = add nsw i64 %indvars.iv.prol, -1, !dbg !264
  %arrayidx12.prol = getelementptr inbounds %struct.DLL* %0, i64 %18, !dbg !265
  %prev.prol = getelementptr inbounds %struct.DLL* %0, i64 %indvars.iv.prol, i32 2, !dbg !266
  store %struct.DLL* %arrayidx12.prol, %struct.DLL** %prev.prol, align 8, !dbg !266, !tbaa !136
  %inc.prol = add nsw i32 %from.addr.174.prol, 1, !dbg !267
  tail call void @llvm.dbg.value(metadata i32 %inc.prol, i64 0, metadata !68, metadata !132), !dbg !241
  %val.prol = getelementptr inbounds %struct.DLL* %0, i64 %indvars.iv76.prol, i32 0, !dbg !268
  store i32 %from.addr.174.prol, i32* %val.prol, align 4, !dbg !268, !tbaa !149
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1, !dbg !260
  %cmp5.prol = icmp slt i64 %indvars.iv.next77.prol, %1, !dbg !257
  %prol.iter.sub = sub i64 %prol.iter, 1, !dbg !260
  %prol.iter.cmp = icmp ne i64 %prol.iter.sub, 0, !dbg !260
  br i1 %prol.iter.cmp, label %for.body.prol, label %for.body.lr.ph.split, !llvm.loop !269

for.body.lr.ph.split:                             ; preds = %for.body.prol, %for.body.lr.ph
  %indvars.iv76.unr = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next77.prol, %for.body.prol ]
  %indvars.iv.unr = phi i64 [ 1, %for.body.lr.ph ], [ %indvars.iv.next.prol, %for.body.prol ]
  %from.addr.174.unr = phi i32 [ %dec, %for.body.lr.ph ], [ %inc.prol, %for.body.prol ]
  %19 = icmp ult i64 %smax82, 2
  br i1 %19, label %for.cond.for.end_crit_edge, label %for.body.lr.ph.split.split

for.body.lr.ph.split.split:                       ; preds = %for.body.lr.ph.split
  br label %for.body, !dbg !260

for.body:                                         ; preds = %for.body, %for.body.lr.ph.split.split
  %indvars.iv76 = phi i64 [ %indvars.iv76.unr, %for.body.lr.ph.split.split ], [ %indvars.iv.next77.1, %for.body ]
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.body.lr.ph.split.split ], [ %indvars.iv.next.1, %for.body ]
  %from.addr.174 = phi i32 [ %from.addr.174.unr, %for.body.lr.ph.split.split ], [ %inc.1, %for.body ]
  %indvars.iv.next77 = add nuw nsw i64 %indvars.iv76, 1, !dbg !260
  %arrayidx = getelementptr inbounds %struct.DLL* %0, i64 %indvars.iv.next77, !dbg !261
  %next = getelementptr inbounds %struct.DLL* %0, i64 %indvars.iv76, i32 1, !dbg !263
  store %struct.DLL* %arrayidx, %struct.DLL** %next, align 8, !dbg !263, !tbaa !144
  %20 = add nsw i64 %indvars.iv, -1, !dbg !264
  %arrayidx12 = getelementptr inbounds %struct.DLL* %0, i64 %20, !dbg !265
  %prev = getelementptr inbounds %struct.DLL* %0, i64 %indvars.iv, i32 2, !dbg !266
  store %struct.DLL* %arrayidx12, %struct.DLL** %prev, align 8, !dbg !266, !tbaa !136
  %inc = add nsw i32 %from.addr.174, 1, !dbg !267
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !68, metadata !132), !dbg !241
  %val = getelementptr inbounds %struct.DLL* %0, i64 %indvars.iv76, i32 0, !dbg !268
  store i32 %from.addr.174, i32* %val, align 4, !dbg !268, !tbaa !149
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !260
  %indvars.iv.next77.1 = add nuw nsw i64 %indvars.iv.next77, 1, !dbg !260
  %arrayidx.1 = getelementptr inbounds %struct.DLL* %0, i64 %indvars.iv.next77.1, !dbg !261
  %next.1 = getelementptr inbounds %struct.DLL* %0, i64 %indvars.iv.next77, i32 1, !dbg !263
  store %struct.DLL* %arrayidx.1, %struct.DLL** %next.1, align 8, !dbg !263, !tbaa !144
  %arrayidx12.1 = getelementptr inbounds %struct.DLL* %0, i64 %indvars.iv, !dbg !265
  %prev.1 = getelementptr inbounds %struct.DLL* %0, i64 %indvars.iv.next, i32 2, !dbg !266
  store %struct.DLL* %arrayidx12.1, %struct.DLL** %prev.1, align 8, !dbg !266, !tbaa !136
  %inc.1 = add nsw i32 %inc, 1, !dbg !267
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !68, metadata !132), !dbg !241
  %val.1 = getelementptr inbounds %struct.DLL* %0, i64 %indvars.iv.next77, i32 0, !dbg !268
  store i32 %inc, i32* %val.1, align 4, !dbg !268, !tbaa !149
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv.next, 1, !dbg !260
  %cmp5.1 = icmp slt i64 %indvars.iv.next77.1, %1, !dbg !257
  br i1 %cmp5.1, label %for.body, label %for.cond.for.end_crit_edge.unr-lcssa, !dbg !260

for.cond.for.end_crit_edge.unr-lcssa:             ; preds = %for.body
  br label %for.cond.for.end_crit_edge

for.cond.for.end_crit_edge:                       ; preds = %for.body.lr.ph.split, %for.cond.for.end_crit_edge.unr-lcssa
  %21 = sub i32 %9, %smax78, !dbg !260
  br label %for.end, !dbg !260

for.end:                                          ; preds = %entry, %for.cond.for.end_crit_edge
  %from.addr.1.lcssa = phi i32 [ %21, %for.cond.for.end_crit_edge ], [ %dec, %entry ]
  %arrayidx20 = getelementptr inbounds %struct.DLL* %0, i64 %1, !dbg !271
  %prev22 = getelementptr inbounds i8* %call, i64 16, !dbg !272
  %22 = bitcast i8* %prev22 to %struct.DLL**, !dbg !272
  store %struct.DLL* %arrayidx20, %struct.DLL** %22, align 8, !dbg !272, !tbaa !136
  %next26 = getelementptr inbounds %struct.DLL* %0, i64 %1, i32 1, !dbg !273
  %23 = bitcast %struct.DLL** %next26 to i8**, !dbg !273
  store i8* %call, i8** %23, align 8, !dbg !273, !tbaa !144
  %idxprom28 = sext i32 %sub to i64, !dbg !274
  %arrayidx29 = getelementptr inbounds %struct.DLL* %0, i64 %idxprom28, !dbg !274
  %prev32 = getelementptr inbounds %struct.DLL* %0, i64 %1, i32 2, !dbg !275
  store %struct.DLL* %arrayidx29, %struct.DLL** %prev32, align 8, !dbg !275, !tbaa !136
  %val35 = getelementptr inbounds %struct.DLL* %arrayidx20, i64 0, i32 0, !dbg !276
  store i32 %from.addr.1.lcssa, i32* %val35, align 4, !dbg !276, !tbaa !149
  %val37 = bitcast i8* %call to i32*, !dbg !277
  store i32 %add, i32* %val37, align 4, !dbg !277, !tbaa !149
  ret %struct.DLL* %0, !dbg !278
}

; Function Attrs: nounwind uwtable
define %struct.DLL* @list_copy(%struct.DLL* nocapture readonly %x) #0 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.DLL* %x, i64 0, metadata !77, metadata !132), !dbg !279
  %x.idx = getelementptr %struct.DLL* %x, i64 0, i32 0
  %x.idx.val = load i32* %x.idx, align 4, !tbaa !149
  tail call void @llvm.dbg.value(metadata i32 %x.idx.val, i64 0, metadata !80, metadata !132), !dbg !280
  %add = add nsw i32 %x.idx.val, 1, !dbg !281
  %conv = sext i32 %add to i64, !dbg !282
  %mul = mul nsw i64 %conv, 24, !dbg !282
  %call1 = tail call noalias i8* @malloc(i64 %mul) #5, !dbg !283
  %0 = bitcast i8* %call1 to %struct.DLL*, !dbg !284
  tail call void @llvm.dbg.value(metadata %struct.DLL* %0, i64 0, metadata !82, metadata !132), !dbg !285
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !78, metadata !132), !dbg !286
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !79, metadata !132), !dbg !287
  tail call void @llvm.dbg.value(metadata %struct.DLL* %x, i64 0, metadata !81, metadata !132), !dbg !288
  %cmp51 = icmp sgt i32 %x.idx.val, 0, !dbg !289
  br i1 %cmp51, label %for.body.lr.ph, label %for.end, !dbg !292

for.body.lr.ph:                                   ; preds = %entry
  %1 = add i32 %x.idx.val, -1, !dbg !292
  br label %for.body, !dbg !292

for.body:                                         ; preds = %for.body.for.body_crit_edge, %for.body.lr.ph
  %2 = phi i32 [ %x.idx.val, %for.body.lr.ph ], [ %.pre, %for.body.for.body_crit_edge ]
  %indvars.iv55 = phi i64 [ 1, %for.body.lr.ph ], [ %indvars.iv.next56, %for.body.for.body_crit_edge ]
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %for.body.for.body_crit_edge ]
  %xp.053 = phi %struct.DLL* [ %x, %for.body.lr.ph ], [ %3, %for.body.for.body_crit_edge ]
  %arrayidx = getelementptr inbounds %struct.DLL* %0, i64 %indvars.iv55, !dbg !293
  %arrayidx4 = getelementptr inbounds %struct.DLL* %0, i64 %indvars.iv, !dbg !295
  %next = getelementptr inbounds %struct.DLL* %0, i64 %indvars.iv, i32 1, !dbg !295
  store %struct.DLL* %arrayidx, %struct.DLL** %next, align 8, !dbg !295, !tbaa !144
  %prev = getelementptr inbounds %struct.DLL* %0, i64 %indvars.iv55, i32 2, !dbg !296
  store %struct.DLL* %arrayidx4, %struct.DLL** %prev, align 8, !dbg !296, !tbaa !136
  %val11 = getelementptr inbounds %struct.DLL* %arrayidx4, i64 0, i32 0, !dbg !297
  store i32 %2, i32* %val11, align 4, !dbg !297, !tbaa !149
  %next13 = getelementptr inbounds %struct.DLL* %xp.053, i64 0, i32 1, !dbg !298
  %3 = load %struct.DLL** %next13, align 8, !dbg !298, !tbaa !144
  tail call void @llvm.dbg.value(metadata %struct.DLL* %3, i64 0, metadata !81, metadata !132), !dbg !288
  %lftr.wideiv = trunc i64 %indvars.iv to i32, !dbg !292
  %exitcond = icmp eq i32 %lftr.wideiv, %1, !dbg !292
  br i1 %exitcond, label %for.end.loopexit, label %for.body.for.body_crit_edge, !dbg !292

for.body.for.body_crit_edge:                      ; preds = %for.body
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1, !dbg !292
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !292
  %val.phi.trans.insert = getelementptr inbounds %struct.DLL* %3, i64 0, i32 0
  %.pre = load i32* %val.phi.trans.insert, align 4, !dbg !299, !tbaa !149
  br label %for.body, !dbg !292

for.end.loopexit:                                 ; preds = %for.body
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %idxprom14 = sext i32 %x.idx.val to i64, !dbg !300
  %arrayidx15 = getelementptr inbounds %struct.DLL* %0, i64 %idxprom14, !dbg !300
  %prev17 = getelementptr inbounds i8* %call1, i64 16, !dbg !301
  %4 = bitcast i8* %prev17 to %struct.DLL**, !dbg !301
  store %struct.DLL* %arrayidx15, %struct.DLL** %4, align 8, !dbg !301, !tbaa !136
  %next21 = getelementptr inbounds %struct.DLL* %0, i64 %idxprom14, i32 1, !dbg !302
  %5 = bitcast %struct.DLL** %next21 to i8**, !dbg !302
  store i8* %call1, i8** %5, align 8, !dbg !302, !tbaa !144
  %x.idx50 = getelementptr %struct.DLL* %x, i64 0, i32 2
  %x.idx50.val = load %struct.DLL** %x.idx50, align 8, !tbaa !136
  %val23 = getelementptr inbounds %struct.DLL* %x.idx50.val, i64 0, i32 0, !dbg !303
  %6 = load i32* %val23, align 4, !dbg !303, !tbaa !149
  %val26 = getelementptr inbounds %struct.DLL* %arrayidx15, i64 0, i32 0, !dbg !304
  store i32 %6, i32* %val26, align 4, !dbg !304, !tbaa !149
  ret %struct.DLL* %0, !dbg !305
}

; Function Attrs: nounwind uwtable
define void @list_reverse(%struct.DLL* %head) #0 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.DLL* %head, i64 0, metadata !87, metadata !132), !dbg !306
  tail call void @llvm.dbg.value(metadata %struct.DLL* %head, i64 0, metadata !89, metadata !132), !dbg !307
  br label %do.body, !dbg !308

do.body:                                          ; preds = %do.body, %entry
  %p.0 = phi %struct.DLL* [ %head, %entry ], [ %0, %do.body ]
  %next = getelementptr inbounds %struct.DLL* %p.0, i64 0, i32 1, !dbg !309
  %0 = load %struct.DLL** %next, align 8, !dbg !309, !tbaa !144
  tail call void @llvm.dbg.value(metadata %struct.DLL* %0, i64 0, metadata !88, metadata !132), !dbg !311
  %prev = getelementptr inbounds %struct.DLL* %p.0, i64 0, i32 2, !dbg !312
  %1 = load %struct.DLL** %prev, align 8, !dbg !312, !tbaa !136
  store %struct.DLL* %1, %struct.DLL** %next, align 8, !dbg !313, !tbaa !144
  store %struct.DLL* %0, %struct.DLL** %prev, align 8, !dbg !314, !tbaa !136
  tail call void @llvm.dbg.value(metadata %struct.DLL* %0, i64 0, metadata !89, metadata !132), !dbg !307
  %cmp = icmp eq %struct.DLL* %0, %head, !dbg !315
  br i1 %cmp, label %do.end, label %do.body, !dbg !316

do.end:                                           ; preds = %do.body
  ret void, !dbg !317
}

; Function Attrs: nounwind uwtable
define i32 @test_lists() #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !94, metadata !132), !dbg !318
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !319, metadata !132) #5, !dbg !321
  tail call void @llvm.dbg.value(metadata i32 100, i64 0, metadata !322, metadata !132) #5, !dbg !323
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !324, metadata !132) #5, !dbg !325
  tail call void @llvm.dbg.value(metadata i32 100, i64 0, metadata !319, metadata !132) #5, !dbg !321
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !322, metadata !132) #5, !dbg !323
  tail call void @llvm.dbg.value(metadata i32 100, i64 0, metadata !326, metadata !132) #5, !dbg !327
  %call.i = tail call noalias i8* @malloc(i64 2424) #5, !dbg !328
  %0 = bitcast i8* %call.i to %struct.DLL*, !dbg !329
  tail call void @llvm.dbg.value(metadata %struct.DLL* %0, i64 0, metadata !330, metadata !132) #5, !dbg !331
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !319, metadata !132) #5, !dbg !321
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !332, metadata !132) #5, !dbg !333
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !334, metadata !132) #5, !dbg !335
  br label %for.body.i, !dbg !336

for.body.i:                                       ; preds = %for.body.i, %entry
  %indvars.iv76.i = phi i64 [ 0, %entry ], [ %indvars.iv.next77.i.1, %for.body.i ], !dbg !320
  %indvars.iv.i = phi i64 [ 1, %entry ], [ %indvars.iv.next.i.1, %for.body.i ], !dbg !320
  %from.addr.174.i = phi i32 [ 0, %entry ], [ %inc.i.1, %for.body.i ], !dbg !320
  %indvars.iv.next77.i = add nuw nsw i64 %indvars.iv76.i, 1, !dbg !336
  %arrayidx.i = getelementptr inbounds %struct.DLL* %0, i64 %indvars.iv.next77.i, !dbg !337
  %next.i = getelementptr inbounds %struct.DLL* %0, i64 %indvars.iv76.i, i32 1, !dbg !338
  store %struct.DLL* %arrayidx.i, %struct.DLL** %next.i, align 8, !dbg !338, !tbaa !144
  %1 = add nsw i64 %indvars.iv.i, -1, !dbg !339
  %arrayidx12.i = getelementptr inbounds %struct.DLL* %0, i64 %1, !dbg !340
  %prev.i = getelementptr inbounds %struct.DLL* %0, i64 %indvars.iv.i, i32 2, !dbg !341
  store %struct.DLL* %arrayidx12.i, %struct.DLL** %prev.i, align 8, !dbg !341, !tbaa !136
  %inc.i = add nuw nsw i32 %from.addr.174.i, 1, !dbg !342
  tail call void @llvm.dbg.value(metadata i32 %inc.i, i64 0, metadata !319, metadata !132) #5, !dbg !321
  %val.i = getelementptr inbounds %struct.DLL* %0, i64 %indvars.iv76.i, i32 0, !dbg !343
  store i32 %from.addr.174.i, i32* %val.i, align 4, !dbg !343, !tbaa !149
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !336
  %indvars.iv.next77.i.1 = add nuw nsw i64 %indvars.iv.next77.i, 1, !dbg !336
  %arrayidx.i.1 = getelementptr inbounds %struct.DLL* %0, i64 %indvars.iv.next77.i.1, !dbg !337
  %next.i.1 = getelementptr inbounds %struct.DLL* %0, i64 %indvars.iv.next77.i, i32 1, !dbg !338
  store %struct.DLL* %arrayidx.i.1, %struct.DLL** %next.i.1, align 8, !dbg !338, !tbaa !144
  %arrayidx12.i.1 = getelementptr inbounds %struct.DLL* %0, i64 %indvars.iv.i, !dbg !340
  %prev.i.1 = getelementptr inbounds %struct.DLL* %0, i64 %indvars.iv.next.i, i32 2, !dbg !341
  store %struct.DLL* %arrayidx12.i.1, %struct.DLL** %prev.i.1, align 8, !dbg !341, !tbaa !136
  %inc.i.1 = add nuw nsw i32 %inc.i, 1, !dbg !342
  tail call void @llvm.dbg.value(metadata i32 %inc.i, i64 0, metadata !319, metadata !132) #5, !dbg !321
  %val.i.1 = getelementptr inbounds %struct.DLL* %0, i64 %indvars.iv.next77.i, i32 0, !dbg !343
  store i32 %inc.i, i32* %val.i.1, align 4, !dbg !343, !tbaa !149
  %indvars.iv.next.i.1 = add nuw nsw i64 %indvars.iv.next.i, 1, !dbg !336
  %exitcond191.1 = icmp eq i64 %indvars.iv.next77.i.1, 100, !dbg !336
  br i1 %exitcond191.1, label %list_sequence.exit, label %for.body.i, !dbg !336

list_sequence.exit:                               ; preds = %for.body.i
  %arrayidx20.i = getelementptr inbounds i8* %call.i, i64 2400, !dbg !344
  %prev22.i = getelementptr inbounds i8* %call.i, i64 16, !dbg !345
  %2 = bitcast i8* %prev22.i to i8**, !dbg !345
  store i8* %arrayidx20.i, i8** %2, align 8, !dbg !345, !tbaa !136
  %next26.i = getelementptr inbounds i8* %call.i, i64 2408, !dbg !346
  %3 = bitcast i8* %next26.i to i8**, !dbg !346
  store i8* %call.i, i8** %3, align 8, !dbg !346, !tbaa !144
  %arrayidx29.i = getelementptr inbounds i8* %call.i, i64 2376, !dbg !347
  %prev32.i = getelementptr inbounds i8* %call.i, i64 2416, !dbg !348
  %4 = bitcast i8* %prev32.i to i8**, !dbg !348
  store i8* %arrayidx29.i, i8** %4, align 8, !dbg !348, !tbaa !136
  %val35.i = bitcast i8* %arrayidx20.i to i32*, !dbg !349
  store i32 100, i32* %val35.i, align 4, !dbg !349, !tbaa !149
  %val37.i = bitcast i8* %call.i to i32*, !dbg !350
  store i32 100, i32* %val37.i, align 4, !dbg !350, !tbaa !149
  tail call void @llvm.dbg.value(metadata %struct.DLL* %0, i64 0, metadata !95, metadata !132), !dbg !351
  tail call void @llvm.dbg.value(metadata %struct.DLL* %0, i64 0, metadata !352, metadata !132) #5, !dbg !354
  tail call void @llvm.dbg.value(metadata i32 100, i64 0, metadata !355, metadata !132) #5, !dbg !356
  %call1.i = tail call noalias i8* @malloc(i64 2424) #5, !dbg !357
  %5 = bitcast i8* %call1.i to %struct.DLL*, !dbg !358
  tail call void @llvm.dbg.value(metadata %struct.DLL* %5, i64 0, metadata !359, metadata !132) #5, !dbg !360
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !361, metadata !132) #5, !dbg !362
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !363, metadata !132) #5, !dbg !364
  tail call void @llvm.dbg.value(metadata %struct.DLL* %0, i64 0, metadata !365, metadata !132) #5, !dbg !366
  %arrayidx.i105183 = getelementptr inbounds i8* %call1.i, i64 24, !dbg !367
  %next.i106184 = getelementptr inbounds i8* %call1.i, i64 8, !dbg !368
  %6 = bitcast i8* %next.i106184 to i8**, !dbg !368
  store i8* %arrayidx.i105183, i8** %6, align 8, !dbg !368, !tbaa !144
  %prev.i107185 = getelementptr inbounds i8* %call1.i, i64 40, !dbg !369
  %7 = bitcast i8* %prev.i107185 to i8**, !dbg !369
  store i8* %call1.i, i8** %7, align 8, !dbg !369, !tbaa !136
  %val11.i186 = bitcast i8* %call1.i to i32*, !dbg !370
  store i32 100, i32* %val11.i186, align 4, !dbg !370, !tbaa !149
  %next13.i187 = getelementptr inbounds i8* %call.i, i64 8, !dbg !371
  %8 = bitcast i8* %next13.i187 to %struct.DLL**, !dbg !371
  br label %for.body.for.body_crit_edge.i, !dbg !372

for.body.for.body_crit_edge.i:                    ; preds = %list_sequence.exit, %for.body.for.body_crit_edge.i
  %.in = phi %struct.DLL** [ %8, %list_sequence.exit ], [ %next13.i, %for.body.for.body_crit_edge.i ]
  %indvars.iv.i104189 = phi i64 [ 0, %list_sequence.exit ], [ %indvars.iv.next.i109, %for.body.for.body_crit_edge.i ]
  %indvars.iv55.i188 = phi i64 [ 1, %list_sequence.exit ], [ %indvars.iv.next56.i, %for.body.for.body_crit_edge.i ]
  %9 = load %struct.DLL** %.in, align 8, !dbg !371
  %indvars.iv.next56.i = add nuw nsw i64 %indvars.iv55.i188, 1, !dbg !372
  %indvars.iv.next.i109 = add nuw nsw i64 %indvars.iv.i104189, 1, !dbg !372
  %val.phi.trans.insert.i = getelementptr inbounds %struct.DLL* %9, i64 0, i32 0, !dbg !353
  %.pre.i = load i32* %val.phi.trans.insert.i, align 4, !dbg !373, !tbaa !149
  %arrayidx.i105 = getelementptr inbounds %struct.DLL* %5, i64 %indvars.iv.next56.i, !dbg !367
  %arrayidx4.i = getelementptr inbounds %struct.DLL* %5, i64 %indvars.iv.next.i109, !dbg !368
  %next.i106 = getelementptr inbounds %struct.DLL* %5, i64 %indvars.iv.next.i109, i32 1, !dbg !368
  store %struct.DLL* %arrayidx.i105, %struct.DLL** %next.i106, align 8, !dbg !368, !tbaa !144
  %prev.i107 = getelementptr inbounds %struct.DLL* %5, i64 %indvars.iv.next56.i, i32 2, !dbg !369
  store %struct.DLL* %arrayidx4.i, %struct.DLL** %prev.i107, align 8, !dbg !369, !tbaa !136
  %val11.i = getelementptr inbounds %struct.DLL* %arrayidx4.i, i64 0, i32 0, !dbg !370
  store i32 %.pre.i, i32* %val11.i, align 4, !dbg !370, !tbaa !149
  %next13.i = getelementptr inbounds %struct.DLL* %9, i64 0, i32 1, !dbg !371
  %exitcond = icmp eq i64 %indvars.iv.next.i109, 99, !dbg !372
  br i1 %exitcond, label %list_copy.exit, label %for.body.for.body_crit_edge.i, !dbg !372

list_copy.exit:                                   ; preds = %for.body.for.body_crit_edge.i
  %arrayidx15.i = getelementptr inbounds i8* %call1.i, i64 2400, !dbg !374
  %prev17.i = getelementptr inbounds i8* %call1.i, i64 16, !dbg !375
  %10 = bitcast i8* %prev17.i to i8**, !dbg !375
  store i8* %arrayidx15.i, i8** %10, align 8, !dbg !375, !tbaa !136
  %next21.i = getelementptr inbounds i8* %call1.i, i64 2408, !dbg !376
  %11 = bitcast i8* %next21.i to i8**, !dbg !376
  store i8* %call1.i, i8** %11, align 8, !dbg !376, !tbaa !144
  %12 = bitcast i8* %prev22.i to %struct.DLL**, !dbg !353
  %val23.i = bitcast i8* %arrayidx20.i to i32*, !dbg !377
  %13 = load i32* %val23.i, align 4, !dbg !377, !tbaa !149
  %val26.i = bitcast i8* %arrayidx15.i to i32*, !dbg !378
  store i32 %13, i32* %val26.i, align 4, !dbg !378, !tbaa !149
  tail call void @llvm.dbg.value(metadata %struct.DLL* %5, i64 0, metadata !96, metadata !132), !dbg !379
  %call.i110 = tail call noalias i8* @malloc(i64 24) #5, !dbg !380
  %next.i111 = getelementptr inbounds i8* %call.i110, i64 8, !dbg !382
  %14 = bitcast i8* %next.i111 to i8**, !dbg !382
  store i8* %call.i110, i8** %14, align 8, !dbg !382, !tbaa !144
  %prev.i112 = getelementptr inbounds i8* %call.i110, i64 16, !dbg !383
  %15 = bitcast i8* %prev.i112 to i8**, !dbg !383
  store i8* %call.i110, i8** %15, align 8, !dbg !383, !tbaa !136
  %val.i113 = bitcast i8* %call.i110 to i32*, !dbg !384
  store i32 0, i32* %val.i113, align 4, !dbg !384, !tbaa !149
  tail call void @llvm.dbg.value(metadata %struct.DLL* %5, i64 0, metadata !385, metadata !132), !dbg !388
  tail call void @llvm.dbg.value(metadata %struct.DLL* %0, i64 0, metadata !389, metadata !132), !dbg !390
  tail call void @llvm.dbg.value(metadata %struct.DLL* %5, i64 0, metadata !391, metadata !132), !dbg !392
  tail call void @llvm.dbg.value(metadata %struct.DLL* %0, i64 0, metadata !393, metadata !132), !dbg !394
  %16 = bitcast i8* %next.i106184 to %struct.DLL**, !dbg !395
  %17 = load %struct.DLL** %16, align 8, !dbg !395, !tbaa !144
  %cmp21.i = icmp eq %struct.DLL* %17, %5, !dbg !396
  %18 = load i32* %val11.i186, align 4, !dbg !397, !tbaa !149
  %cmp224.i = icmp ne i32 %18, 100, !dbg !397
  br i1 %cmp21.i, label %for.end.i, label %for.body.i114.preheader, !dbg !398

for.body.i114.preheader:                          ; preds = %list_copy.exit
  br label %for.body.i114, !dbg !399

for.body.i114:                                    ; preds = %for.body.i114.preheader, %for.inc.i
  %cmp226.i = phi i1 [ %cmp2.i, %for.inc.i ], [ %cmp224.i, %for.body.i114.preheader ], !dbg !386
  %19 = phi %struct.DLL* [ %21, %for.inc.i ], [ %17, %for.body.i114.preheader ], !dbg !386
  %yp.025.i = phi %struct.DLL* [ %20, %for.inc.i ], [ %0, %for.body.i114.preheader ], !dbg !386
  br i1 %cmp226.i, label %if.then.loopexit, label %for.inc.i, !dbg !399

for.inc.i:                                        ; preds = %for.body.i114
  %next4.i = getelementptr inbounds %struct.DLL* %yp.025.i, i64 0, i32 1, !dbg !400
  %20 = load %struct.DLL** %next4.i, align 8, !dbg !400, !tbaa !144
  tail call void @llvm.dbg.value(metadata %struct.DLL* %20, i64 0, metadata !393, metadata !132), !dbg !394
  %next.i115 = getelementptr inbounds %struct.DLL* %19, i64 0, i32 1, !dbg !395
  %21 = load %struct.DLL** %next.i115, align 8, !dbg !395, !tbaa !144
  %cmp.i = icmp eq %struct.DLL* %21, %5, !dbg !396
  %val.i116 = getelementptr inbounds %struct.DLL* %19, i64 0, i32 0, !dbg !397
  %22 = load i32* %val.i116, align 4, !dbg !397, !tbaa !149
  %val1.i = getelementptr inbounds %struct.DLL* %20, i64 0, i32 0, !dbg !401
  %23 = load i32* %val1.i, align 4, !dbg !401, !tbaa !149
  %cmp2.i = icmp ne i32 %22, %23, !dbg !397
  br i1 %cmp.i, label %for.end.i.loopexit, label %for.body.i114, !dbg !398

for.end.i.loopexit:                               ; preds = %for.inc.i
  %cmp2.i.lcssa = phi i1 [ %cmp2.i, %for.inc.i ]
  %.lcssa196 = phi %struct.DLL* [ %20, %for.inc.i ]
  br label %for.end.i

for.end.i:                                        ; preds = %for.end.i.loopexit, %list_copy.exit
  %cmp2.lcssa.i = phi i1 [ %cmp224.i, %list_copy.exit ], [ %cmp2.i.lcssa, %for.end.i.loopexit ], !dbg !386
  %yp.0.lcssa.i = phi %struct.DLL* [ %0, %list_copy.exit ], [ %.lcssa196, %for.end.i.loopexit ], !dbg !386
  br i1 %cmp2.lcssa.i, label %if.then, label %list_equal.exit, !dbg !402

list_equal.exit:                                  ; preds = %for.end.i
  %next10.i = getelementptr inbounds %struct.DLL* %yp.0.lcssa.i, i64 0, i32 1, !dbg !403
  %24 = load %struct.DLL** %next10.i, align 8, !dbg !403, !tbaa !144
  %cmp11.i = icmp eq %struct.DLL* %24, %0, !dbg !403
  br i1 %cmp11.i, label %while.cond.preheader, label %if.then, !dbg !404

while.cond.preheader:                             ; preds = %list_equal.exit
  %cmp.i171181 = icmp eq i32 %18, 0, !dbg !405
  br i1 %cmp.i171181, label %do.body.i.preheader, label %if.end.i169.lr.ph, !dbg !407

if.end.i169.lr.ph:                                ; preds = %while.cond.preheader
  %25 = bitcast i8* %prev.i112 to %struct.DLL**, !dbg !408
  br label %if.end.i169, !dbg !407

if.then.loopexit:                                 ; preds = %for.body.i114
  br label %if.then

if.then:                                          ; preds = %if.then.loopexit, %list_equal.exit, %for.end.i
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([26 x i8]* @str13, i64 0, i64 0)) #5, !dbg !411
  tail call void @exit(i32 1) #6, !dbg !413
  unreachable, !dbg !413

while.cond13.preheader:                           ; preds = %if.end.i169
  store i32 0, i32* %val11.i186, align 4, !tbaa !149
  store i32 %18, i32* %val.i113, align 4, !dbg !414, !tbaa !149
  %cmp.i153177 = icmp eq i32 %18, 0, !dbg !415
  br i1 %cmp.i153177, label %do.body.i.preheader, label %if.end.i.lr.ph, !dbg !417

if.end.i.lr.ph:                                   ; preds = %while.cond13.preheader
  %26 = bitcast i8* %prev.i112 to %struct.DLL**, !dbg !418
  %27 = bitcast i8* %prev17.i to %struct.DLL**, !dbg !421
  %xtraiter = and i32 %18, 1
  %lcmp.mod = icmp ne i32 %xtraiter, 0
  %lcmp.overflow = icmp eq i32 %18, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %if.end.i.prol, label %if.end.i.lr.ph.split

if.end.i.prol:                                    ; preds = %if.end.i.prol, %if.end.i.lr.ph
  %call2.idx94.val178.prol = phi i32 [ %18, %if.end.i.lr.ph ], [ %dec.i.prol, %if.end.i.prol ]
  %prol.iter = phi i32 [ %xtraiter, %if.end.i.lr.ph ], [ %prol.iter.sub, %if.end.i.prol ]
  %28 = load %struct.DLL** %26, align 8, !dbg !418, !tbaa !136
  tail call void @llvm.dbg.value(metadata %struct.DLL* %28, i64 0, metadata !423, metadata !132), !dbg !424
  %prev2.i.prol = getelementptr inbounds %struct.DLL* %28, i64 0, i32 2, !dbg !425
  %29 = load %struct.DLL** %prev2.i.prol, align 8, !dbg !425, !tbaa !136
  tail call void @llvm.dbg.value(metadata %struct.DLL* %29, i64 0, metadata !426, metadata !132), !dbg !427
  %next.i151.prol = getelementptr inbounds %struct.DLL* %29, i64 0, i32 1, !dbg !428
  %30 = bitcast %struct.DLL** %next.i151.prol to i8**, !dbg !428
  store i8* %call.i110, i8** %30, align 8, !dbg !428, !tbaa !144
  store %struct.DLL* %29, %struct.DLL** %26, align 8, !dbg !429, !tbaa !136
  %dec.i.prol = add nsw i32 %call2.idx94.val178.prol, -1, !dbg !430
  tail call void @llvm.dbg.value(metadata %struct.DLL* %5, i64 0, metadata !431, metadata !132), !dbg !432
  tail call void @llvm.dbg.value(metadata %struct.DLL* %28, i64 0, metadata !433, metadata !132), !dbg !434
  %31 = load %struct.DLL** %27, align 8, !dbg !421, !tbaa !136
  tail call void @llvm.dbg.value(metadata %struct.DLL* %31, i64 0, metadata !435, metadata !132), !dbg !436
  %next.i148.prol = getelementptr inbounds %struct.DLL* %31, i64 0, i32 1, !dbg !437
  store %struct.DLL* %28, %struct.DLL** %next.i148.prol, align 8, !dbg !437, !tbaa !144
  %next1.i.prol = getelementptr inbounds %struct.DLL* %28, i64 0, i32 1, !dbg !438
  %32 = bitcast %struct.DLL** %next1.i.prol to i8**, !dbg !438
  store i8* %call1.i, i8** %32, align 8, !dbg !438, !tbaa !144
  store %struct.DLL* %28, %struct.DLL** %27, align 8, !dbg !439, !tbaa !136
  store %struct.DLL* %31, %struct.DLL** %prev2.i.prol, align 8, !dbg !440, !tbaa !136
  %cmp.i153.prol = icmp eq i32 %dec.i.prol, 0, !dbg !415
  %prol.iter.sub = sub i32 %prol.iter, 1, !dbg !417
  %prol.iter.cmp = icmp ne i32 %prol.iter.sub, 0, !dbg !417
  br i1 %prol.iter.cmp, label %if.end.i.prol, label %if.end.i.lr.ph.split, !llvm.loop !441

if.end.i.lr.ph.split:                             ; preds = %if.end.i.prol, %if.end.i.lr.ph
  %call2.idx94.val178.unr = phi i32 [ %18, %if.end.i.lr.ph ], [ %dec.i.prol, %if.end.i.prol ]
  %33 = icmp ult i32 %18, 2
  br i1 %33, label %while.cond13.do.body.i.preheader_crit_edge, label %if.end.i.lr.ph.split.split

if.end.i.lr.ph.split.split:                       ; preds = %if.end.i.lr.ph.split
  br label %if.end.i, !dbg !417

if.end.i169:                                      ; preds = %if.end.i169.if.end.i169_crit_edge, %if.end.i169.lr.ph
  %34 = phi %struct.DLL* [ %17, %if.end.i169.lr.ph ], [ %.pre, %if.end.i169.if.end.i169_crit_edge ]
  %call1.idx95.val182 = phi i32 [ %18, %if.end.i169.lr.ph ], [ %dec.i168, %if.end.i169.if.end.i169_crit_edge ]
  tail call void @llvm.dbg.value(metadata %struct.DLL* %5, i64 0, metadata !442, metadata !132), !dbg !444
  tail call void @llvm.dbg.value(metadata %struct.DLL* %34, i64 0, metadata !445, metadata !132), !dbg !446
  %next2.i = getelementptr inbounds %struct.DLL* %34, i64 0, i32 1, !dbg !447
  %35 = load %struct.DLL** %next2.i, align 8, !dbg !447, !tbaa !144
  store %struct.DLL* %35, %struct.DLL** %16, align 8, !dbg !448, !tbaa !144
  %36 = load %struct.DLL** %next2.i, align 8, !dbg !449, !tbaa !144
  %prev.i167 = getelementptr inbounds %struct.DLL* %36, i64 0, i32 2, !dbg !449
  %37 = bitcast %struct.DLL** %prev.i167 to i8**, !dbg !449
  store i8* %call1.i, i8** %37, align 8, !dbg !449, !tbaa !136
  %dec.i168 = add nsw i32 %call1.idx95.val182, -1, !dbg !450
  tail call void @llvm.dbg.value(metadata %struct.DLL* %34, i64 0, metadata !451, metadata !132), !dbg !452
  %38 = load %struct.DLL** %25, align 8, !dbg !408, !tbaa !136
  tail call void @llvm.dbg.value(metadata %struct.DLL* %38, i64 0, metadata !453, metadata !132), !dbg !454
  %next.i158 = getelementptr inbounds %struct.DLL* %38, i64 0, i32 1, !dbg !455
  store %struct.DLL* %34, %struct.DLL** %next.i158, align 8, !dbg !455, !tbaa !144
  %39 = bitcast %struct.DLL** %next2.i to i8**, !dbg !456
  store i8* %call.i110, i8** %39, align 8, !dbg !456, !tbaa !144
  store %struct.DLL* %34, %struct.DLL** %25, align 8, !dbg !457, !tbaa !136
  %prev3.i160 = getelementptr inbounds %struct.DLL* %34, i64 0, i32 2, !dbg !458
  store %struct.DLL* %38, %struct.DLL** %prev3.i160, align 8, !dbg !458, !tbaa !136
  %cmp.i171 = icmp eq i32 %dec.i168, 0, !dbg !405
  br i1 %cmp.i171, label %while.cond13.preheader, label %if.end.i169.if.end.i169_crit_edge, !dbg !407

if.end.i169.if.end.i169_crit_edge:                ; preds = %if.end.i169
  %.pre = load %struct.DLL** %16, align 8, !dbg !459, !tbaa !144
  br label %if.end.i169, !dbg !407

while.cond13.do.body.i.preheader_crit_edge.unr-lcssa: ; preds = %if.end.i
  br label %while.cond13.do.body.i.preheader_crit_edge

while.cond13.do.body.i.preheader_crit_edge:       ; preds = %if.end.i.lr.ph.split, %while.cond13.do.body.i.preheader_crit_edge.unr-lcssa
  store i32 0, i32* %val.i113, align 4, !tbaa !149
  store i32 %18, i32* %val11.i186, align 4, !dbg !460, !tbaa !149
  br label %do.body.i.preheader, !dbg !417

do.body.i.preheader:                              ; preds = %while.cond.preheader, %while.cond13.do.body.i.preheader_crit_edge, %while.cond13.preheader
  %40 = phi i32 [ %18, %while.cond13.do.body.i.preheader_crit_edge ], [ 0, %while.cond13.preheader ], [ 0, %while.cond.preheader ]
  br label %do.body.i, !dbg !461

if.end.i:                                         ; preds = %if.end.i, %if.end.i.lr.ph.split.split
  %call2.idx94.val178 = phi i32 [ %call2.idx94.val178.unr, %if.end.i.lr.ph.split.split ], [ %dec.i.1, %if.end.i ]
  %41 = load %struct.DLL** %26, align 8, !dbg !418, !tbaa !136
  tail call void @llvm.dbg.value(metadata %struct.DLL* %41, i64 0, metadata !423, metadata !132), !dbg !424
  %prev2.i = getelementptr inbounds %struct.DLL* %41, i64 0, i32 2, !dbg !425
  %42 = load %struct.DLL** %prev2.i, align 8, !dbg !425, !tbaa !136
  tail call void @llvm.dbg.value(metadata %struct.DLL* %42, i64 0, metadata !426, metadata !132), !dbg !427
  %next.i151 = getelementptr inbounds %struct.DLL* %42, i64 0, i32 1, !dbg !428
  %43 = bitcast %struct.DLL** %next.i151 to i8**, !dbg !428
  store i8* %call.i110, i8** %43, align 8, !dbg !428, !tbaa !144
  store %struct.DLL* %42, %struct.DLL** %26, align 8, !dbg !429, !tbaa !136
  %dec.i = add nsw i32 %call2.idx94.val178, -1, !dbg !430
  tail call void @llvm.dbg.value(metadata %struct.DLL* %5, i64 0, metadata !431, metadata !132), !dbg !432
  tail call void @llvm.dbg.value(metadata %struct.DLL* %41, i64 0, metadata !433, metadata !132), !dbg !434
  %44 = load %struct.DLL** %27, align 8, !dbg !421, !tbaa !136
  tail call void @llvm.dbg.value(metadata %struct.DLL* %44, i64 0, metadata !435, metadata !132), !dbg !436
  %next.i148 = getelementptr inbounds %struct.DLL* %44, i64 0, i32 1, !dbg !437
  store %struct.DLL* %41, %struct.DLL** %next.i148, align 8, !dbg !437, !tbaa !144
  %next1.i = getelementptr inbounds %struct.DLL* %41, i64 0, i32 1, !dbg !438
  %45 = bitcast %struct.DLL** %next1.i to i8**, !dbg !438
  store i8* %call1.i, i8** %45, align 8, !dbg !438, !tbaa !144
  store %struct.DLL* %41, %struct.DLL** %27, align 8, !dbg !439, !tbaa !136
  store %struct.DLL* %44, %struct.DLL** %prev2.i, align 8, !dbg !440, !tbaa !136
  %46 = load %struct.DLL** %26, align 8, !dbg !418, !tbaa !136
  tail call void @llvm.dbg.value(metadata %struct.DLL* %41, i64 0, metadata !423, metadata !132), !dbg !424
  %prev2.i.1 = getelementptr inbounds %struct.DLL* %46, i64 0, i32 2, !dbg !425
  %47 = load %struct.DLL** %prev2.i.1, align 8, !dbg !425, !tbaa !136
  tail call void @llvm.dbg.value(metadata %struct.DLL* %42, i64 0, metadata !426, metadata !132), !dbg !427
  %next.i151.1 = getelementptr inbounds %struct.DLL* %47, i64 0, i32 1, !dbg !428
  %48 = bitcast %struct.DLL** %next.i151.1 to i8**, !dbg !428
  store i8* %call.i110, i8** %48, align 8, !dbg !428, !tbaa !144
  store %struct.DLL* %47, %struct.DLL** %26, align 8, !dbg !429, !tbaa !136
  %dec.i.1 = add nsw i32 %dec.i, -1, !dbg !430
  tail call void @llvm.dbg.value(metadata %struct.DLL* %5, i64 0, metadata !431, metadata !132), !dbg !432
  tail call void @llvm.dbg.value(metadata %struct.DLL* %41, i64 0, metadata !433, metadata !132), !dbg !434
  %49 = load %struct.DLL** %27, align 8, !dbg !421, !tbaa !136
  tail call void @llvm.dbg.value(metadata %struct.DLL* %44, i64 0, metadata !435, metadata !132), !dbg !436
  %next.i148.1 = getelementptr inbounds %struct.DLL* %49, i64 0, i32 1, !dbg !437
  store %struct.DLL* %46, %struct.DLL** %next.i148.1, align 8, !dbg !437, !tbaa !144
  %next1.i.1 = getelementptr inbounds %struct.DLL* %46, i64 0, i32 1, !dbg !438
  %50 = bitcast %struct.DLL** %next1.i.1 to i8**, !dbg !438
  store i8* %call1.i, i8** %50, align 8, !dbg !438, !tbaa !144
  store %struct.DLL* %46, %struct.DLL** %27, align 8, !dbg !439, !tbaa !136
  store %struct.DLL* %49, %struct.DLL** %prev2.i.1, align 8, !dbg !440, !tbaa !136
  %cmp.i153.1 = icmp eq i32 %dec.i.1, 0, !dbg !415
  br i1 %cmp.i153.1, label %while.cond13.do.body.i.preheader_crit_edge.unr-lcssa, label %if.end.i, !dbg !417

do.body.i:                                        ; preds = %do.body.i.preheader, %do.body.i
  %p.0.i = phi %struct.DLL* [ %51, %do.body.i ], [ %0, %do.body.i.preheader ], !dbg !462
  %next.i142 = getelementptr inbounds %struct.DLL* %p.0.i, i64 0, i32 1, !dbg !461
  %51 = load %struct.DLL** %next.i142, align 8, !dbg !461, !tbaa !144
  tail call void @llvm.dbg.value(metadata %struct.DLL* %51, i64 0, metadata !463, metadata !132), !dbg !464
  %prev.i143 = getelementptr inbounds %struct.DLL* %p.0.i, i64 0, i32 2, !dbg !465
  %52 = load %struct.DLL** %prev.i143, align 8, !dbg !465, !tbaa !136
  store %struct.DLL* %52, %struct.DLL** %next.i142, align 8, !dbg !466, !tbaa !144
  store %struct.DLL* %51, %struct.DLL** %prev.i143, align 8, !dbg !467, !tbaa !136
  tail call void @llvm.dbg.value(metadata %struct.DLL* %51, i64 0, metadata !468, metadata !132), !dbg !469
  %cmp.i144 = icmp eq %struct.DLL* %51, %0, !dbg !470
  br i1 %cmp.i144, label %list_reverse.exit, label %do.body.i, !dbg !471

list_reverse.exit:                                ; preds = %do.body.i
  %call.idx103.val = load %struct.DLL** %8, align 8, !tbaa !144
  %val = getelementptr inbounds %struct.DLL* %call.idx103.val, i64 0, i32 0, !dbg !472
  %53 = load i32* %val, align 4, !dbg !472, !tbaa !149
  %cmp = icmp eq i32 %53, 100, !dbg !472
  br i1 %cmp, label %if.end30, label %if.then26, !dbg !474

if.then26:                                        ; preds = %list_reverse.exit
  %call29 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([42 x i8]* @.str7, i64 0, i64 0), i32 100, i32 %53) #5, !dbg !475
  tail call void @exit(i32 1) #6, !dbg !477
  unreachable, !dbg !477

if.end30:                                         ; preds = %list_reverse.exit
  %call.idx99.val = load %struct.DLL** %12, align 8, !tbaa !136
  %val32 = getelementptr inbounds %struct.DLL* %call.idx99.val, i64 0, i32 0, !dbg !478
  %54 = load i32* %val32, align 4, !dbg !478, !tbaa !149
  %cmp33 = icmp eq i32 %54, 1, !dbg !478
  br i1 %cmp33, label %if.end38, label %if.then34, !dbg !480

if.then34:                                        ; preds = %if.end30
  %call37 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str8, i64 0, i64 0), i32 100, i32 %54) #5, !dbg !481
  tail call void @exit(i32 1) #6, !dbg !483
  unreachable, !dbg !483

if.end38:                                         ; preds = %if.end30
  %call1.idx101.val = load %struct.DLL** %16, align 8, !tbaa !144
  %val40 = getelementptr inbounds %struct.DLL* %call1.idx101.val, i64 0, i32 0, !dbg !484
  %55 = load i32* %val40, align 4, !dbg !484, !tbaa !149
  %cmp41 = icmp eq i32 %55, 100, !dbg !484
  br i1 %cmp41, label %if.end46, label %if.then42, !dbg !486

if.then42:                                        ; preds = %if.end38
  %call45 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([42 x i8]* @.str9, i64 0, i64 0), i32 100, i32 %55) #5, !dbg !487
  tail call void @exit(i32 1) #6, !dbg !489
  unreachable, !dbg !489

if.end46:                                         ; preds = %if.end38
  %56 = bitcast i8* %prev17.i to %struct.DLL**
  %call1.idx97.val = load %struct.DLL** %56, align 8, !tbaa !136
  %val48 = getelementptr inbounds %struct.DLL* %call1.idx97.val, i64 0, i32 0, !dbg !490
  %57 = load i32* %val48, align 4, !dbg !490, !tbaa !149
  %cmp49 = icmp eq i32 %57, 1, !dbg !490
  br i1 %cmp49, label %if.end60, label %if.then50, !dbg !492

if.then50:                                        ; preds = %if.end46
  %call53 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str8, i64 0, i64 0), i32 100, i32 %57) #5, !dbg !493
  tail call void @exit(i32 1) #6, !dbg !495
  unreachable, !dbg !495

if.end60:                                         ; preds = %if.end46
  tail call void @llvm.dbg.value(metadata %struct.DLL* %0, i64 0, metadata !496, metadata !132), !dbg !499
  tail call void @llvm.dbg.value(metadata %struct.DLL* %5, i64 0, metadata !500, metadata !132), !dbg !501
  tail call void @llvm.dbg.value(metadata %struct.DLL* %0, i64 0, metadata !502, metadata !132), !dbg !503
  tail call void @llvm.dbg.value(metadata %struct.DLL* %5, i64 0, metadata !504, metadata !132), !dbg !505
  %cmp21.i119 = icmp eq %struct.DLL* %call.idx103.val, %0, !dbg !506
  %cmp224.i122 = icmp ne i32 %40, 100, !dbg !507
  br i1 %cmp21.i119, label %for.end.i135, label %for.body.i125.preheader, !dbg !508

for.body.i125.preheader:                          ; preds = %if.end60
  br label %for.body.i125, !dbg !509

for.body.i125:                                    ; preds = %for.body.i125.preheader, %for.inc.i132
  %cmp226.i123 = phi i1 [ %cmp2.i131, %for.inc.i132 ], [ %cmp224.i122, %for.body.i125.preheader ], !dbg !497
  %58 = phi %struct.DLL* [ %60, %for.inc.i132 ], [ %call.idx103.val, %for.body.i125.preheader ], !dbg !497
  %yp.025.i124 = phi %struct.DLL* [ %59, %for.inc.i132 ], [ %5, %for.body.i125.preheader ], !dbg !497
  br i1 %cmp226.i123, label %if.then63.loopexit, label %for.inc.i132, !dbg !509

for.inc.i132:                                     ; preds = %for.body.i125
  %next4.i126 = getelementptr inbounds %struct.DLL* %yp.025.i124, i64 0, i32 1, !dbg !510
  %59 = load %struct.DLL** %next4.i126, align 8, !dbg !510, !tbaa !144
  tail call void @llvm.dbg.value(metadata %struct.DLL* %59, i64 0, metadata !504, metadata !132), !dbg !505
  %next.i127 = getelementptr inbounds %struct.DLL* %58, i64 0, i32 1, !dbg !511
  %60 = load %struct.DLL** %next.i127, align 8, !dbg !511, !tbaa !144
  %cmp.i128 = icmp eq %struct.DLL* %60, %0, !dbg !506
  %val.i129 = getelementptr inbounds %struct.DLL* %58, i64 0, i32 0, !dbg !507
  %61 = load i32* %val.i129, align 4, !dbg !507, !tbaa !149
  %val1.i130 = getelementptr inbounds %struct.DLL* %59, i64 0, i32 0, !dbg !512
  %62 = load i32* %val1.i130, align 4, !dbg !512, !tbaa !149
  %cmp2.i131 = icmp ne i32 %61, %62, !dbg !507
  br i1 %cmp.i128, label %for.end.i135.loopexit, label %for.body.i125, !dbg !508

for.end.i135.loopexit:                            ; preds = %for.inc.i132
  %cmp2.i131.lcssa = phi i1 [ %cmp2.i131, %for.inc.i132 ]
  %.lcssa = phi %struct.DLL* [ %59, %for.inc.i132 ]
  br label %for.end.i135

for.end.i135:                                     ; preds = %for.end.i135.loopexit, %if.end60
  %cmp2.lcssa.i133 = phi i1 [ %cmp224.i122, %if.end60 ], [ %cmp2.i131.lcssa, %for.end.i135.loopexit ], !dbg !497
  %yp.0.lcssa.i134 = phi %struct.DLL* [ %5, %if.end60 ], [ %.lcssa, %for.end.i135.loopexit ], !dbg !497
  br i1 %cmp2.lcssa.i133, label %if.then63, label %list_equal.exit141, !dbg !513

list_equal.exit141:                               ; preds = %for.end.i135
  %next10.i136 = getelementptr inbounds %struct.DLL* %yp.0.lcssa.i134, i64 0, i32 1, !dbg !514
  %63 = load %struct.DLL** %next10.i136, align 8, !dbg !514, !tbaa !144
  %cmp11.i137 = icmp eq %struct.DLL* %63, %5, !dbg !514
  br i1 %cmp11.i137, label %if.end65, label %if.then63, !dbg !515

if.then63.loopexit:                               ; preds = %for.body.i125
  br label %if.then63

if.then63:                                        ; preds = %if.then63.loopexit, %list_equal.exit141, %for.end.i135
  %puts91 = tail call i32 @puts(i8* getelementptr inbounds ([26 x i8]* @str16, i64 0, i64 0)) #5, !dbg !516
  tail call void @exit(i32 1) #6, !dbg !518
  unreachable, !dbg !518

if.end65:                                         ; preds = %list_equal.exit141
  tail call void @llvm.dbg.value(metadata i32 100, i64 0, metadata !94, metadata !132), !dbg !318
  tail call void @free(i8* %call.i) #5, !dbg !519
  tail call void @free(i8* %call1.i) #5, !dbg !520
  tail call void @free(i8* %call.i110) #5, !dbg !521
  ret i32 100, !dbg !522
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

; Function Attrs: nounwind
declare void @free(i8* nocapture) #2

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !102, metadata !132), !dbg !523
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !103, metadata !132), !dbg !524
  %cmp = icmp eq i32 %argc, 2, !dbg !525
  br i1 %cmp, label %while.cond.preheader, label %while.body.preheader, !dbg !526

while.cond.preheader:                             ; preds = %entry
  %arrayidx = getelementptr inbounds i8** %argv, i64 1, !dbg !527
  %0 = load i8** %arrayidx, align 8, !dbg !527, !tbaa !529
  tail call void @llvm.dbg.value(metadata i8* %0, i64 0, metadata !530, metadata !132) #5, !dbg !532
  %call.i = tail call i64 @strtol(i8* nocapture %0, i8** null, i32 10) #5, !dbg !533
  %conv.i = trunc i64 %call.i to i32, !dbg !534
  tail call void @llvm.dbg.value(metadata i32 %dec, i64 0, metadata !104, metadata !132), !dbg !535
  %tobool3 = icmp eq i32 %conv.i, 0, !dbg !536
  br i1 %tobool3, label %while.end, label %while.body.preheader, !dbg !536

while.body.preheader:                             ; preds = %while.cond.preheader, %entry
  %n.04.ph = phi i32 [ %conv.i, %while.cond.preheader ], [ 3000000, %entry ]
  br label %while.body, !dbg !537

while.body:                                       ; preds = %while.body.preheader, %while.body
  %n.04 = phi i32 [ %dec, %while.body ], [ %n.04.ph, %while.body.preheader ]
  %dec = add nsw i32 %n.04, -1, !dbg !537
  %call1 = tail call i32 @test_lists(), !dbg !539
  tail call void @llvm.dbg.value(metadata i32 %call1, i64 0, metadata !105, metadata !132), !dbg !541
  tail call void @llvm.dbg.value(metadata i32 %dec, i64 0, metadata !104, metadata !132), !dbg !535
  %tobool = icmp eq i32 %dec, 0, !dbg !536
  br i1 %tobool, label %while.end.loopexit, label %while.body, !dbg !536

while.end.loopexit:                               ; preds = %while.body
  %call1.lcssa = phi i32 [ %call1, %while.body ]
  br label %while.end

while.end:                                        ; preds = %while.end.loopexit, %while.cond.preheader
  %result.0.lcssa = phi i32 [ 0, %while.cond.preheader ], [ %call1.lcssa, %while.end.loopexit ]
  %call2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str12, i64 0, i64 0), i32 %result.0.lcssa) #5, !dbg !542
  ret i32 0, !dbg !543
}

; Function Attrs: nounwind
declare i64 @strtol(i8* readonly, i8** nocapture, i32) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #4

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!129, !130}
!llvm.ident = !{!131}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !17, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c] [DW_LANG_C99]
!1 = !{!"lists.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4, !9, !13, !16}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from DLL]
!5 = !{!"0x16\00DLL\0019\000\000\000\000", !1, null, !6} ; [ DW_TAG_typedef ] [DLL] [line 19, size 0, align 0, offset 0] [from DLL]
!6 = !{!"0x13\00DLL\0015\00192\0064\000\000\000", !1, null, null, !7, null, null, null} ; [ DW_TAG_structure_type ] [DLL] [line 15, size 192, align 64, offset 0] [def] [from ]
!7 = !{!8, !10, !12}
!8 = !{!"0xd\00val\0016\0032\0032\000\000", !1, !6, !9} ; [ DW_TAG_member ] [val] [line 16, size 32, align 32, offset 0] [from int]
!9 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!10 = !{!"0xd\00next\0017\0064\0064\0064\000", !1, !6, !11} ; [ DW_TAG_member ] [next] [line 17, size 64, align 64, offset 64] [from ]
!11 = !{!"0xf\00\000\0064\0064\000\000", null, null, !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from DLL]
!12 = !{!"0xd\00prev\0018\0064\0064\00128\000", !1, !6, !11} ; [ DW_TAG_member ] [prev] [line 18, size 64, align 64, offset 128] [from ]
!13 = !{!"0xf\00\000\0064\0064\000\000", null, null, !14} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!14 = !{!"0xf\00\000\0064\0064\000\000", null, null, !15} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!15 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!16 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!17 = !{!18, !26, !33, !38, !42, !50, !59, !64, !75, !83, !90, !98, !106, !115, !118, !121, !126}
!18 = !{!"0x2e\00list_push_tail\00list_push_tail\00\0026\000\001\000\000\00256\001\0026", !1, !19, !20, null, void (%struct.DLL*, %struct.DLL*)* @list_push_tail, null, null, !22} ; [ DW_TAG_subprogram ] [line 26] [def] [list_push_tail]
!19 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!20 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !21, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!21 = !{null, !4, !4}
!22 = !{!23, !24, !25}
!23 = !{!"0x101\00head\0016777242\000", !18, !19, !4} ; [ DW_TAG_arg_variable ] [head] [line 26]
!24 = !{!"0x101\00item\0033554458\000", !18, !19, !4} ; [ DW_TAG_arg_variable ] [item] [line 26]
!25 = !{!"0x100\00tail\0027\000", !18, !19, !4}   ; [ DW_TAG_auto_variable ] [tail] [line 27]
!26 = !{!"0x2e\00list_pop_tail\00list_pop_tail\00\0035\000\001\000\000\00256\001\0035", !1, !19, !27, null, %struct.DLL* (%struct.DLL*)* @list_pop_tail, null, null, !29} ; [ DW_TAG_subprogram ] [line 35] [def] [list_pop_tail]
!27 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !28, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!28 = !{!4, !4}
!29 = !{!30, !31, !32}
!30 = !{!"0x101\00head\0016777251\000", !26, !19, !4} ; [ DW_TAG_arg_variable ] [head] [line 35]
!31 = !{!"0x100\00prev\0036\000", !26, !19, !4}   ; [ DW_TAG_auto_variable ] [prev] [line 36]
!32 = !{!"0x100\00tail\0036\000", !26, !19, !4}   ; [ DW_TAG_auto_variable ] [tail] [line 36]
!33 = !{!"0x2e\00list_push_head\00list_push_head\00\0046\000\001\000\000\00256\001\0046", !1, !19, !20, null, void (%struct.DLL*, %struct.DLL*)* @list_push_head, null, null, !34} ; [ DW_TAG_subprogram ] [line 46] [def] [list_push_head]
!34 = !{!35, !36, !37}
!35 = !{!"0x101\00head\0016777262\000", !33, !19, !4} ; [ DW_TAG_arg_variable ] [head] [line 46]
!36 = !{!"0x101\00item\0033554478\000", !33, !19, !4} ; [ DW_TAG_arg_variable ] [item] [line 46]
!37 = !{!"0x100\00next\0047\000", !33, !19, !4}   ; [ DW_TAG_auto_variable ] [next] [line 47]
!38 = !{!"0x2e\00list_pop_head\00list_pop_head\00\0055\000\001\000\000\00256\001\0055", !1, !19, !27, null, %struct.DLL* (%struct.DLL*)* @list_pop_head, null, null, !39} ; [ DW_TAG_subprogram ] [line 55] [def] [list_pop_head]
!39 = !{!40, !41}
!40 = !{!"0x101\00head\0016777271\000", !38, !19, !4} ; [ DW_TAG_arg_variable ] [head] [line 55]
!41 = !{!"0x100\00next\0056\000", !38, !19, !4}   ; [ DW_TAG_auto_variable ] [next] [line 56]
!42 = !{!"0x2e\00list_equal\00list_equal\00\0065\000\001\000\000\00256\001\0065", !1, !19, !43, null, i32 (%struct.DLL*, %struct.DLL*)* @list_equal, null, null, !45} ; [ DW_TAG_subprogram ] [line 65] [def] [list_equal]
!43 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !44, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!44 = !{!9, !4, !4}
!45 = !{!46, !47, !48, !49}
!46 = !{!"0x101\00x\0016777281\000", !42, !19, !4} ; [ DW_TAG_arg_variable ] [x] [line 65]
!47 = !{!"0x101\00y\0033554497\000", !42, !19, !4} ; [ DW_TAG_arg_variable ] [y] [line 65]
!48 = !{!"0x100\00xp\0066\000", !42, !19, !4}     ; [ DW_TAG_auto_variable ] [xp] [line 66]
!49 = !{!"0x100\00yp\0066\000", !42, !19, !4}     ; [ DW_TAG_auto_variable ] [yp] [line 66]
!50 = !{!"0x2e\00list_print\00list_print\00\0075\000\001\000\000\00256\001\0075", !1, !19, !51, null, void (i8*, %struct.DLL*)* @list_print, null, null, !53} ; [ DW_TAG_subprogram ] [line 75] [def] [list_print]
!51 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !52, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!52 = !{null, !14, !4}
!53 = !{!54, !55, !56, !57, !58}
!54 = !{!"0x101\00msg\0016777291\000", !50, !19, !14} ; [ DW_TAG_arg_variable ] [msg] [line 75]
!55 = !{!"0x101\00x\0033554507\000", !50, !19, !4} ; [ DW_TAG_arg_variable ] [x] [line 75]
!56 = !{!"0x100\00xp\0076\000", !50, !19, !4}     ; [ DW_TAG_auto_variable ] [xp] [line 76]
!57 = !{!"0x100\00first\0076\000", !50, !19, !4}  ; [ DW_TAG_auto_variable ] [first] [line 76]
!58 = !{!"0x100\00i\0077\000", !50, !19, !9}      ; [ DW_TAG_auto_variable ] [i] [line 77]
!59 = !{!"0x2e\00list_new\00list_new\00\0088\000\001\000\000\000\001\0088", !1, !19, !60, null, %struct.DLL* ()* @list_new, null, null, !62} ; [ DW_TAG_subprogram ] [line 88] [def] [list_new]
!60 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !61, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!61 = !{!4}
!62 = !{!63}
!63 = !{!"0x100\00l\0089\000", !59, !19, !4}      ; [ DW_TAG_auto_variable ] [l] [line 89]
!64 = !{!"0x2e\00list_sequence\00list_sequence\00\0097\000\001\000\000\00256\001\0097", !1, !19, !65, null, %struct.DLL* (i32, i32)* @list_sequence, null, null, !67} ; [ DW_TAG_subprogram ] [line 97] [def] [list_sequence]
!65 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !66, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!66 = !{!4, !9, !9}
!67 = !{!68, !69, !70, !71, !72, !73, !74}
!68 = !{!"0x101\00from\0016777313\000", !64, !19, !9} ; [ DW_TAG_arg_variable ] [from] [line 97]
!69 = !{!"0x101\00to\0033554529\000", !64, !19, !9} ; [ DW_TAG_arg_variable ] [to] [line 97]
!70 = !{!"0x100\00size\0098\000", !64, !19, !9}   ; [ DW_TAG_auto_variable ] [size] [line 98]
!71 = !{!"0x100\00tmp\0098\000", !64, !19, !9}    ; [ DW_TAG_auto_variable ] [tmp] [line 98]
!72 = !{!"0x100\00i\0098\000", !64, !19, !9}      ; [ DW_TAG_auto_variable ] [i] [line 98]
!73 = !{!"0x100\00j\0098\000", !64, !19, !9}      ; [ DW_TAG_auto_variable ] [j] [line 98]
!74 = !{!"0x100\00l\0099\000", !64, !19, !4}      ; [ DW_TAG_auto_variable ] [l] [line 99]
!75 = !{!"0x2e\00list_copy\00list_copy\00\00118\000\001\000\000\00256\001\00118", !1, !19, !27, null, %struct.DLL* (%struct.DLL*)* @list_copy, null, null, !76} ; [ DW_TAG_subprogram ] [line 118] [def] [list_copy]
!76 = !{!77, !78, !79, !80, !81, !82}
!77 = !{!"0x101\00x\0016777334\000", !75, !19, !4} ; [ DW_TAG_arg_variable ] [x] [line 118]
!78 = !{!"0x100\00i\00119\000", !75, !19, !9}     ; [ DW_TAG_auto_variable ] [i] [line 119]
!79 = !{!"0x100\00j\00119\000", !75, !19, !9}     ; [ DW_TAG_auto_variable ] [j] [line 119]
!80 = !{!"0x100\00size\00119\000", !75, !19, !9}  ; [ DW_TAG_auto_variable ] [size] [line 119]
!81 = !{!"0x100\00xp\00120\000", !75, !19, !4}    ; [ DW_TAG_auto_variable ] [xp] [line 120]
!82 = !{!"0x100\00l\00120\000", !75, !19, !4}     ; [ DW_TAG_auto_variable ] [l] [line 120]
!83 = !{!"0x2e\00list_reverse\00list_reverse\00\00132\000\001\000\000\00256\001\00132", !1, !19, !84, null, void (%struct.DLL*)* @list_reverse, null, null, !86} ; [ DW_TAG_subprogram ] [line 132] [def] [list_reverse]
!84 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !85, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!85 = !{null, !4}
!86 = !{!87, !88, !89}
!87 = !{!"0x101\00head\0016777348\000", !83, !19, !4} ; [ DW_TAG_arg_variable ] [head] [line 132]
!88 = !{!"0x100\00tmp\00133\000", !83, !19, !4}   ; [ DW_TAG_auto_variable ] [tmp] [line 133]
!89 = !{!"0x100\00p\00133\000", !83, !19, !4}     ; [ DW_TAG_auto_variable ] [p] [line 133]
!90 = !{!"0x2e\00test_lists\00test_lists\00\00142\000\001\000\000\000\001\00142", !1, !19, !91, null, i32 ()* @test_lists, null, null, !93} ; [ DW_TAG_subprogram ] [line 142] [def] [test_lists]
!91 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !92, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!92 = !{!9}
!93 = !{!94, !95, !96, !97}
!94 = !{!"0x100\00len\00143\000", !90, !19, !9}   ; [ DW_TAG_auto_variable ] [len] [line 143]
!95 = !{!"0x100\00li1\00145\000", !90, !19, !4}   ; [ DW_TAG_auto_variable ] [li1] [line 145]
!96 = !{!"0x100\00li2\00147\000", !90, !19, !4}   ; [ DW_TAG_auto_variable ] [li2] [line 147]
!97 = !{!"0x100\00li3\00150\000", !90, !19, !4}   ; [ DW_TAG_auto_variable ] [li3] [line 150]
!98 = !{!"0x2e\00main\00main\00\00219\000\001\000\000\00256\001\00219", !1, !19, !99, null, i32 (i32, i8**)* @main, null, null, !101} ; [ DW_TAG_subprogram ] [line 219] [def] [main]
!99 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !100, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!100 = !{!9, !9, !13}
!101 = !{!102, !103, !104, !105}
!102 = !{!"0x101\00argc\0016777435\000", !98, !19, !9} ; [ DW_TAG_arg_variable ] [argc] [line 219]
!103 = !{!"0x101\00argv\0033554651\000", !98, !19, !13} ; [ DW_TAG_arg_variable ] [argv] [line 219]
!104 = !{!"0x100\00n\00225\000", !98, !19, !9}    ; [ DW_TAG_auto_variable ] [n] [line 225]
!105 = !{!"0x100\00result\00226\000", !98, !19, !9} ; [ DW_TAG_auto_variable ] [result] [line 226]
!106 = !{!"0x2e\00atoi\00atoi\00\00278\000\001\000\000\00256\001\00279", !107, !108, !109, null, null, null, null, !113} ; [ DW_TAG_subprogram ] [line 278] [def] [scope 279] [atoi]
!107 = !{!"/usr/include/stdlib.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!108 = !{!"0x29", !107}                           ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base//usr/include/stdlib.h]
!109 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !110, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!110 = !{!9, !111}
!111 = !{!"0xf\00\000\0064\0064\000\000", null, null, !112} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!112 = !{!"0x26\00\000\000\000\000\000", null, null, !15} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!113 = !{!114}
!114 = !{!"0x101\00__nptr\0016777494\000", !106, !108, !111} ; [ DW_TAG_arg_variable ] [__nptr] [line 278]
!115 = !{!"0x2e\00list_first\00list_first\00\0023\001\001\000\000\00256\001\0023", !1, !19, !27, null, null, null, null, !116} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [list_first]
!116 = !{!117}
!117 = !{!"0x101\00head\0016777239\000", !115, !19, !4} ; [ DW_TAG_arg_variable ] [head] [line 23]
!118 = !{!"0x2e\00list_last\00list_last\00\0024\001\001\000\000\00256\001\0024", !1, !19, !27, null, null, null, null, !119} ; [ DW_TAG_subprogram ] [line 24] [local] [def] [list_last]
!119 = !{!120}
!120 = !{!"0x101\00head\0016777240\000", !118, !19, !4} ; [ DW_TAG_arg_variable ] [head] [line 24]
!121 = !{!"0x2e\00list_length\00list_length\00\0021\001\001\000\000\00256\001\0021", !1, !19, !122, null, null, null, null, !124} ; [ DW_TAG_subprogram ] [line 21] [local] [def] [list_length]
!122 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !123, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!123 = !{!9, !4}
!124 = !{!125}
!125 = !{!"0x101\00head\0016777237\000", !121, !19, !4} ; [ DW_TAG_arg_variable ] [head] [line 21]
!126 = !{!"0x2e\00list_empty\00list_empty\00\0022\001\001\000\000\00256\001\0022", !1, !19, !122, null, null, null, null, !127} ; [ DW_TAG_subprogram ] [line 22] [local] [def] [list_empty]
!127 = !{!128}
!128 = !{!"0x101\00head\0016777238\000", !126, !19, !4} ; [ DW_TAG_arg_variable ] [head] [line 22]
!129 = !{i32 2, !"Dwarf Version", i32 4}
!130 = !{i32 2, !"Debug Info Version", i32 2}
!131 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!132 = !{!"0x102"}                                ; [ DW_TAG_expression ]
!133 = !MDLocation(line: 26, column: 26, scope: !18)
!134 = !MDLocation(line: 26, column: 37, scope: !18)
!135 = !MDLocation(line: 27, column: 15, scope: !18)
!136 = !{!137, !141, i64 16}
!137 = !{!"DLL", !138, i64 0, !141, i64 8, !141, i64 16}
!138 = !{!"int", !139, i64 0}
!139 = !{!"omnipotent char", !140, i64 0}
!140 = !{!"Simple C/C++ TBAA"}
!141 = !{!"any pointer", !139, i64 0}
!142 = !MDLocation(line: 27, column: 8, scope: !18)
!143 = !MDLocation(line: 28, column: 3, scope: !18)
!144 = !{!137, !141, i64 8}
!145 = !MDLocation(line: 29, column: 3, scope: !18)
!146 = !MDLocation(line: 30, column: 3, scope: !18)
!147 = !MDLocation(line: 31, column: 3, scope: !18)
!148 = !MDLocation(line: 32, column: 3, scope: !18)
!149 = !{!137, !138, i64 0}
!150 = !MDLocation(line: 33, column: 1, scope: !18)
!151 = !MDLocation(line: 35, column: 25, scope: !26)
!152 = !MDLocation(line: 22, column: 43, scope: !126, inlinedAt: !153)
!153 = !MDLocation(line: 37, column: 7, scope: !154)
!154 = !{!"0xb\0037\007\000", !1, !26}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!155 = !MDLocation(line: 37, column: 7, scope: !26)
!156 = !MDLocation(line: 38, column: 10, scope: !26)
!157 = !MDLocation(line: 36, column: 15, scope: !26)
!158 = !MDLocation(line: 39, column: 10, scope: !26)
!159 = !MDLocation(line: 36, column: 8, scope: !26)
!160 = !MDLocation(line: 40, column: 3, scope: !26)
!161 = !MDLocation(line: 41, column: 3, scope: !26)
!162 = !MDLocation(line: 42, column: 3, scope: !26)
!163 = !MDLocation(line: 43, column: 3, scope: !26)
!164 = !MDLocation(line: 44, column: 1, scope: !26)
!165 = !MDLocation(line: 46, column: 26, scope: !33)
!166 = !MDLocation(line: 46, column: 37, scope: !33)
!167 = !MDLocation(line: 47, column: 15, scope: !33)
!168 = !MDLocation(line: 47, column: 8, scope: !33)
!169 = !MDLocation(line: 48, column: 3, scope: !33)
!170 = !MDLocation(line: 49, column: 3, scope: !33)
!171 = !MDLocation(line: 50, column: 3, scope: !33)
!172 = !MDLocation(line: 51, column: 3, scope: !33)
!173 = !MDLocation(line: 52, column: 3, scope: !33)
!174 = !MDLocation(line: 53, column: 1, scope: !33)
!175 = !MDLocation(line: 55, column: 25, scope: !38)
!176 = !MDLocation(line: 22, column: 43, scope: !126, inlinedAt: !177)
!177 = !MDLocation(line: 57, column: 7, scope: !178)
!178 = !{!"0xb\0057\007\001", !1, !38}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!179 = !MDLocation(line: 57, column: 7, scope: !38)
!180 = !MDLocation(line: 58, column: 10, scope: !38)
!181 = !MDLocation(line: 56, column: 8, scope: !38)
!182 = !MDLocation(line: 59, column: 16, scope: !38)
!183 = !MDLocation(line: 59, column: 3, scope: !38)
!184 = !MDLocation(line: 60, column: 3, scope: !38)
!185 = !MDLocation(line: 61, column: 3, scope: !38)
!186 = !MDLocation(line: 62, column: 3, scope: !38)
!187 = !MDLocation(line: 63, column: 1, scope: !38)
!188 = !MDLocation(line: 65, column: 21, scope: !42)
!189 = !MDLocation(line: 65, column: 29, scope: !42)
!190 = !MDLocation(line: 66, column: 8, scope: !42)
!191 = !MDLocation(line: 66, column: 13, scope: !42)
!192 = !MDLocation(line: 68, column: 20, scope: !193)
!193 = !{!"0xb\002", !1, !194}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!194 = !{!"0xb\001", !1, !195}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!195 = !{!"0xb\0068\003\003", !1, !196}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!196 = !{!"0xb\0068\003\002", !1, !42}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!197 = !MDLocation(line: 68, column: 20, scope: !195)
!198 = !MDLocation(line: 69, column: 9, scope: !199)
!199 = !{!"0xb\0069\009\005", !1, !200}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!200 = !{!"0xb\0068\0061\004", !1, !195}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!201 = !MDLocation(line: 69, column: 20, scope: !199)
!202 = !MDLocation(line: 68, column: 3, scope: !196)
!203 = !MDLocation(line: 69, column: 9, scope: !200)
!204 = !MDLocation(line: 68, column: 51, scope: !195)
!205 = !MDLocation(line: 71, column: 7, scope: !42)
!206 = !MDLocation(line: 72, column: 10, scope: !42)
!207 = !MDLocation(line: 72, column: 3, scope: !42)
!208 = !MDLocation(line: 73, column: 1, scope: !42)
!209 = !MDLocation(line: 75, column: 23, scope: !50)
!210 = !MDLocation(line: 75, column: 33, scope: !50)
!211 = !MDLocation(line: 76, column: 21, scope: !50)
!212 = !MDLocation(line: 76, column: 13, scope: !50)
!213 = !MDLocation(line: 77, column: 7, scope: !50)
!214 = !MDLocation(line: 78, column: 3, scope: !50)
!215 = !MDLocation(line: 79, column: 3, scope: !50)
!216 = !MDLocation(line: 80, column: 11, scope: !217)
!217 = !{!"0xb\0080\003\007", !1, !50}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!218 = !MDLocation(line: 80, column: 20, scope: !219)
!219 = !{!"0xb\002", !1, !220}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!220 = !{!"0xb\001", !1, !221}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!221 = !{!"0xb\0080\003\008", !1, !217}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!222 = !MDLocation(line: 80, column: 20, scope: !221)
!223 = !MDLocation(line: 80, column: 3, scope: !217)
!224 = !MDLocation(line: 81, column: 44, scope: !225)
!225 = !{!"0xb\0080\0052\009", !1, !221}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!226 = !MDLocation(line: 82, column: 12, scope: !225)
!227 = !MDLocation(line: 82, column: 21, scope: !225)
!228 = !MDLocation(line: 82, column: 36, scope: !225)
!229 = !MDLocation(line: 81, column: 5, scope: !225)
!230 = !MDLocation(line: 84, column: 3, scope: !50)
!231 = !MDLocation(line: 85, column: 45, scope: !50)
!232 = !MDLocation(line: 85, column: 3, scope: !50)
!233 = !MDLocation(line: 86, column: 1, scope: !50)
!234 = !MDLocation(line: 89, column: 19, scope: !59)
!235 = !MDLocation(line: 89, column: 12, scope: !59)
!236 = !MDLocation(line: 89, column: 8, scope: !59)
!237 = !MDLocation(line: 90, column: 3, scope: !59)
!238 = !MDLocation(line: 91, column: 3, scope: !59)
!239 = !MDLocation(line: 92, column: 3, scope: !59)
!240 = !MDLocation(line: 93, column: 3, scope: !59)
!241 = !MDLocation(line: 97, column: 24, scope: !64)
!242 = !MDLocation(line: 97, column: 34, scope: !64)
!243 = !MDLocation(line: 100, column: 7, scope: !244)
!244 = !{!"0xb\00100\007\0010", !1, !64}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!245 = !MDLocation(line: 98, column: 13, scope: !64)
!246 = !MDLocation(line: 100, column: 7, scope: !64)
!247 = !MDLocation(line: 103, column: 10, scope: !64)
!248 = !MDLocation(line: 98, column: 7, scope: !64)
!249 = !MDLocation(line: 104, column: 22, scope: !64)
!250 = !MDLocation(line: 104, column: 21, scope: !64)
!251 = !MDLocation(line: 104, column: 14, scope: !64)
!252 = !MDLocation(line: 104, column: 7, scope: !64)
!253 = !MDLocation(line: 99, column: 8, scope: !64)
!254 = !MDLocation(line: 105, column: 3, scope: !64)
!255 = !MDLocation(line: 98, column: 18, scope: !64)
!256 = !MDLocation(line: 98, column: 21, scope: !64)
!257 = !MDLocation(line: 106, column: 18, scope: !258)
!258 = !{!"0xb\00106\003\0013", !1, !259}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!259 = !{!"0xb\00106\003\0012", !1, !64}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!260 = !MDLocation(line: 106, column: 3, scope: !259)
!261 = !MDLocation(line: 107, column: 17, scope: !262)
!262 = !{!"0xb\00106\0036\0014", !1, !258}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!263 = !MDLocation(line: 107, column: 5, scope: !262)
!264 = !MDLocation(line: 108, column: 20, scope: !262)
!265 = !MDLocation(line: 108, column: 17, scope: !262)
!266 = !MDLocation(line: 108, column: 5, scope: !262)
!267 = !MDLocation(line: 109, column: 16, scope: !262)
!268 = !MDLocation(line: 109, column: 5, scope: !262)
!269 = distinct !{!269, !270}
!270 = !{!"llvm.loop.unroll.disable"}
!271 = !MDLocation(line: 111, column: 15, scope: !64)
!272 = !MDLocation(line: 111, column: 3, scope: !64)
!273 = !MDLocation(line: 112, column: 3, scope: !64)
!274 = !MDLocation(line: 113, column: 18, scope: !64)
!275 = !MDLocation(line: 113, column: 3, scope: !64)
!276 = !MDLocation(line: 114, column: 3, scope: !64)
!277 = !MDLocation(line: 115, column: 3, scope: !64)
!278 = !MDLocation(line: 116, column: 3, scope: !64)
!279 = !MDLocation(line: 118, column: 21, scope: !75)
!280 = !MDLocation(line: 119, column: 13, scope: !75)
!281 = !MDLocation(line: 120, column: 32, scope: !75)
!282 = !MDLocation(line: 120, column: 31, scope: !75)
!283 = !MDLocation(line: 120, column: 24, scope: !75)
!284 = !MDLocation(line: 120, column: 17, scope: !75)
!285 = !MDLocation(line: 120, column: 13, scope: !75)
!286 = !MDLocation(line: 119, column: 7, scope: !75)
!287 = !MDLocation(line: 119, column: 10, scope: !75)
!288 = !MDLocation(line: 120, column: 8, scope: !75)
!289 = !MDLocation(line: 121, column: 24, scope: !290)
!290 = !{!"0xb\00121\003\0016", !1, !291}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!291 = !{!"0xb\00121\003\0015", !1, !75}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!292 = !MDLocation(line: 121, column: 3, scope: !291)
!293 = !MDLocation(line: 122, column: 17, scope: !294)
!294 = !{!"0xb\00121\0055\0017", !1, !290}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!295 = !MDLocation(line: 122, column: 5, scope: !294)
!296 = !MDLocation(line: 123, column: 5, scope: !294)
!297 = !MDLocation(line: 124, column: 5, scope: !294)
!298 = !MDLocation(line: 121, column: 45, scope: !290)
!299 = !MDLocation(line: 124, column: 16, scope: !294)
!300 = !MDLocation(line: 126, column: 15, scope: !75)
!301 = !MDLocation(line: 126, column: 3, scope: !75)
!302 = !MDLocation(line: 127, column: 3, scope: !75)
!303 = !MDLocation(line: 128, column: 17, scope: !75)
!304 = !MDLocation(line: 128, column: 3, scope: !75)
!305 = !MDLocation(line: 129, column: 3, scope: !75)
!306 = !MDLocation(line: 132, column: 25, scope: !83)
!307 = !MDLocation(line: 133, column: 14, scope: !83)
!308 = !MDLocation(line: 134, column: 3, scope: !83)
!309 = !MDLocation(line: 135, column: 11, scope: !310)
!310 = !{!"0xb\00134\006\0018", !1, !83}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!311 = !MDLocation(line: 133, column: 8, scope: !83)
!312 = !MDLocation(line: 136, column: 15, scope: !310)
!313 = !MDLocation(line: 136, column: 5, scope: !310)
!314 = !MDLocation(line: 137, column: 5, scope: !310)
!315 = !MDLocation(line: 139, column: 12, scope: !83)
!316 = !MDLocation(line: 139, column: 3, scope: !310)
!317 = !MDLocation(line: 140, column: 1, scope: !83)
!318 = !MDLocation(line: 143, column: 7, scope: !90)
!319 = !{!"0x101\00from\0016777313\000", !64, !19, !9, !320} ; [ DW_TAG_arg_variable ] [from] [line 97]
!320 = !MDLocation(line: 145, column: 14, scope: !90)
!321 = !MDLocation(line: 97, column: 24, scope: !64, inlinedAt: !320)
!322 = !{!"0x101\00to\0033554529\000", !64, !19, !9, !320} ; [ DW_TAG_arg_variable ] [to] [line 97]
!323 = !MDLocation(line: 97, column: 34, scope: !64, inlinedAt: !320)
!324 = !{!"0x100\00tmp\0098\000", !64, !19, !9, !320} ; [ DW_TAG_auto_variable ] [tmp] [line 98]
!325 = !MDLocation(line: 98, column: 13, scope: !64, inlinedAt: !320)
!326 = !{!"0x100\00size\0098\000", !64, !19, !9, !320} ; [ DW_TAG_auto_variable ] [size] [line 98]
!327 = !MDLocation(line: 98, column: 7, scope: !64, inlinedAt: !320)
!328 = !MDLocation(line: 104, column: 14, scope: !64, inlinedAt: !320)
!329 = !MDLocation(line: 104, column: 7, scope: !64, inlinedAt: !320)
!330 = !{!"0x100\00l\0099\000", !64, !19, !4, !320} ; [ DW_TAG_auto_variable ] [l] [line 99]
!331 = !MDLocation(line: 99, column: 8, scope: !64, inlinedAt: !320)
!332 = !{!"0x100\00i\0098\000", !64, !19, !9, !320} ; [ DW_TAG_auto_variable ] [i] [line 98]
!333 = !MDLocation(line: 98, column: 18, scope: !64, inlinedAt: !320)
!334 = !{!"0x100\00j\0098\000", !64, !19, !9, !320} ; [ DW_TAG_auto_variable ] [j] [line 98]
!335 = !MDLocation(line: 98, column: 21, scope: !64, inlinedAt: !320)
!336 = !MDLocation(line: 106, column: 3, scope: !259, inlinedAt: !320)
!337 = !MDLocation(line: 107, column: 17, scope: !262, inlinedAt: !320)
!338 = !MDLocation(line: 107, column: 5, scope: !262, inlinedAt: !320)
!339 = !MDLocation(line: 108, column: 20, scope: !262, inlinedAt: !320)
!340 = !MDLocation(line: 108, column: 17, scope: !262, inlinedAt: !320)
!341 = !MDLocation(line: 108, column: 5, scope: !262, inlinedAt: !320)
!342 = !MDLocation(line: 109, column: 16, scope: !262, inlinedAt: !320)
!343 = !MDLocation(line: 109, column: 5, scope: !262, inlinedAt: !320)
!344 = !MDLocation(line: 111, column: 15, scope: !64, inlinedAt: !320)
!345 = !MDLocation(line: 111, column: 3, scope: !64, inlinedAt: !320)
!346 = !MDLocation(line: 112, column: 3, scope: !64, inlinedAt: !320)
!347 = !MDLocation(line: 113, column: 18, scope: !64, inlinedAt: !320)
!348 = !MDLocation(line: 113, column: 3, scope: !64, inlinedAt: !320)
!349 = !MDLocation(line: 114, column: 3, scope: !64, inlinedAt: !320)
!350 = !MDLocation(line: 115, column: 3, scope: !64, inlinedAt: !320)
!351 = !MDLocation(line: 145, column: 8, scope: !90)
!352 = !{!"0x101\00x\0016777334\000", !75, !19, !4, !353} ; [ DW_TAG_arg_variable ] [x] [line 118]
!353 = !MDLocation(line: 147, column: 14, scope: !90)
!354 = !MDLocation(line: 118, column: 21, scope: !75, inlinedAt: !353)
!355 = !{!"0x100\00size\00119\000", !75, !19, !9, !353} ; [ DW_TAG_auto_variable ] [size] [line 119]
!356 = !MDLocation(line: 119, column: 13, scope: !75, inlinedAt: !353)
!357 = !MDLocation(line: 120, column: 24, scope: !75, inlinedAt: !353)
!358 = !MDLocation(line: 120, column: 17, scope: !75, inlinedAt: !353)
!359 = !{!"0x100\00l\00120\000", !75, !19, !4, !353} ; [ DW_TAG_auto_variable ] [l] [line 120]
!360 = !MDLocation(line: 120, column: 13, scope: !75, inlinedAt: !353)
!361 = !{!"0x100\00i\00119\000", !75, !19, !9, !353} ; [ DW_TAG_auto_variable ] [i] [line 119]
!362 = !MDLocation(line: 119, column: 7, scope: !75, inlinedAt: !353)
!363 = !{!"0x100\00j\00119\000", !75, !19, !9, !353} ; [ DW_TAG_auto_variable ] [j] [line 119]
!364 = !MDLocation(line: 119, column: 10, scope: !75, inlinedAt: !353)
!365 = !{!"0x100\00xp\00120\000", !75, !19, !4, !353} ; [ DW_TAG_auto_variable ] [xp] [line 120]
!366 = !MDLocation(line: 120, column: 8, scope: !75, inlinedAt: !353)
!367 = !MDLocation(line: 122, column: 17, scope: !294, inlinedAt: !353)
!368 = !MDLocation(line: 122, column: 5, scope: !294, inlinedAt: !353)
!369 = !MDLocation(line: 123, column: 5, scope: !294, inlinedAt: !353)
!370 = !MDLocation(line: 124, column: 5, scope: !294, inlinedAt: !353)
!371 = !MDLocation(line: 121, column: 45, scope: !290, inlinedAt: !353)
!372 = !MDLocation(line: 121, column: 3, scope: !291, inlinedAt: !353)
!373 = !MDLocation(line: 124, column: 16, scope: !294, inlinedAt: !353)
!374 = !MDLocation(line: 126, column: 15, scope: !75, inlinedAt: !353)
!375 = !MDLocation(line: 126, column: 3, scope: !75, inlinedAt: !353)
!376 = !MDLocation(line: 127, column: 3, scope: !75, inlinedAt: !353)
!377 = !MDLocation(line: 128, column: 17, scope: !75, inlinedAt: !353)
!378 = !MDLocation(line: 128, column: 3, scope: !75, inlinedAt: !353)
!379 = !MDLocation(line: 147, column: 8, scope: !90)
!380 = !MDLocation(line: 89, column: 19, scope: !59, inlinedAt: !381)
!381 = !MDLocation(line: 150, column: 14, scope: !90)
!382 = !MDLocation(line: 90, column: 3, scope: !59, inlinedAt: !381)
!383 = !MDLocation(line: 91, column: 3, scope: !59, inlinedAt: !381)
!384 = !MDLocation(line: 92, column: 3, scope: !59, inlinedAt: !381)
!385 = !{!"0x101\00x\0016777281\000", !42, !19, !4, !386} ; [ DW_TAG_arg_variable ] [x] [line 65]
!386 = !MDLocation(line: 152, column: 8, scope: !387)
!387 = !{!"0xb\00152\007\0019", !1, !90}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!388 = !MDLocation(line: 65, column: 21, scope: !42, inlinedAt: !386)
!389 = !{!"0x101\00y\0033554497\000", !42, !19, !4, !386} ; [ DW_TAG_arg_variable ] [y] [line 65]
!390 = !MDLocation(line: 65, column: 29, scope: !42, inlinedAt: !386)
!391 = !{!"0x100\00xp\0066\000", !42, !19, !4, !386} ; [ DW_TAG_auto_variable ] [xp] [line 66]
!392 = !MDLocation(line: 66, column: 8, scope: !42, inlinedAt: !386)
!393 = !{!"0x100\00yp\0066\000", !42, !19, !4, !386} ; [ DW_TAG_auto_variable ] [yp] [line 66]
!394 = !MDLocation(line: 66, column: 13, scope: !42, inlinedAt: !386)
!395 = !MDLocation(line: 68, column: 20, scope: !193, inlinedAt: !386)
!396 = !MDLocation(line: 68, column: 20, scope: !195, inlinedAt: !386)
!397 = !MDLocation(line: 69, column: 9, scope: !199, inlinedAt: !386)
!398 = !MDLocation(line: 68, column: 3, scope: !196, inlinedAt: !386)
!399 = !MDLocation(line: 69, column: 9, scope: !200, inlinedAt: !386)
!400 = !MDLocation(line: 68, column: 51, scope: !195, inlinedAt: !386)
!401 = !MDLocation(line: 69, column: 20, scope: !199, inlinedAt: !386)
!402 = !MDLocation(line: 71, column: 7, scope: !42, inlinedAt: !386)
!403 = !MDLocation(line: 72, column: 10, scope: !42, inlinedAt: !386)
!404 = !MDLocation(line: 152, column: 7, scope: !90)
!405 = !MDLocation(line: 22, column: 43, scope: !126, inlinedAt: !406)
!406 = !MDLocation(line: 156, column: 11, scope: !90)
!407 = !MDLocation(line: 156, column: 3, scope: !90)
!408 = !MDLocation(line: 27, column: 15, scope: !18, inlinedAt: !409)
!409 = !MDLocation(line: 157, column: 5, scope: !410)
!410 = !{!"0xb\00156\0028\0021", !1, !90}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!411 = !MDLocation(line: 153, column: 5, scope: !412)
!412 = !{!"0xb\00152\0030\0020", !1, !387}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!413 = !MDLocation(line: 154, column: 5, scope: !412)
!414 = !MDLocation(line: 32, column: 3, scope: !18, inlinedAt: !409)
!415 = !MDLocation(line: 22, column: 43, scope: !126, inlinedAt: !416)
!416 = !MDLocation(line: 166, column: 11, scope: !90)
!417 = !MDLocation(line: 166, column: 3, scope: !90)
!418 = !MDLocation(line: 38, column: 10, scope: !26, inlinedAt: !419)
!419 = !MDLocation(line: 167, column: 25, scope: !420)
!420 = !{!"0xb\00166\0028\0024", !1, !90}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!421 = !MDLocation(line: 27, column: 15, scope: !18, inlinedAt: !422)
!422 = !MDLocation(line: 167, column: 5, scope: !420)
!423 = !{!"0x100\00tail\0036\000", !26, !19, !4, !419} ; [ DW_TAG_auto_variable ] [tail] [line 36]
!424 = !MDLocation(line: 36, column: 15, scope: !26, inlinedAt: !419)
!425 = !MDLocation(line: 39, column: 10, scope: !26, inlinedAt: !419)
!426 = !{!"0x100\00prev\0036\000", !26, !19, !4, !419} ; [ DW_TAG_auto_variable ] [prev] [line 36]
!427 = !MDLocation(line: 36, column: 8, scope: !26, inlinedAt: !419)
!428 = !MDLocation(line: 40, column: 3, scope: !26, inlinedAt: !419)
!429 = !MDLocation(line: 41, column: 3, scope: !26, inlinedAt: !419)
!430 = !MDLocation(line: 42, column: 3, scope: !26, inlinedAt: !419)
!431 = !{!"0x101\00head\0016777242\000", !18, !19, !4, !422} ; [ DW_TAG_arg_variable ] [head] [line 26]
!432 = !MDLocation(line: 26, column: 26, scope: !18, inlinedAt: !422)
!433 = !{!"0x101\00item\0033554458\000", !18, !19, !4, !422} ; [ DW_TAG_arg_variable ] [item] [line 26]
!434 = !MDLocation(line: 26, column: 37, scope: !18, inlinedAt: !422)
!435 = !{!"0x100\00tail\0027\000", !18, !19, !4, !422} ; [ DW_TAG_auto_variable ] [tail] [line 27]
!436 = !MDLocation(line: 27, column: 8, scope: !18, inlinedAt: !422)
!437 = !MDLocation(line: 28, column: 3, scope: !18, inlinedAt: !422)
!438 = !MDLocation(line: 29, column: 3, scope: !18, inlinedAt: !422)
!439 = !MDLocation(line: 30, column: 3, scope: !18, inlinedAt: !422)
!440 = !MDLocation(line: 31, column: 3, scope: !18, inlinedAt: !422)
!441 = distinct !{!441, !270}
!442 = !{!"0x101\00head\0016777271\000", !38, !19, !4, !443} ; [ DW_TAG_arg_variable ] [head] [line 55]
!443 = !MDLocation(line: 157, column: 25, scope: !410)
!444 = !MDLocation(line: 55, column: 25, scope: !38, inlinedAt: !443)
!445 = !{!"0x100\00next\0056\000", !38, !19, !4, !443} ; [ DW_TAG_auto_variable ] [next] [line 56]
!446 = !MDLocation(line: 56, column: 8, scope: !38, inlinedAt: !443)
!447 = !MDLocation(line: 59, column: 16, scope: !38, inlinedAt: !443)
!448 = !MDLocation(line: 59, column: 3, scope: !38, inlinedAt: !443)
!449 = !MDLocation(line: 60, column: 3, scope: !38, inlinedAt: !443)
!450 = !MDLocation(line: 61, column: 3, scope: !38, inlinedAt: !443)
!451 = !{!"0x101\00item\0033554458\000", !18, !19, !4, !409} ; [ DW_TAG_arg_variable ] [item] [line 26]
!452 = !MDLocation(line: 26, column: 37, scope: !18, inlinedAt: !409)
!453 = !{!"0x100\00tail\0027\000", !18, !19, !4, !409} ; [ DW_TAG_auto_variable ] [tail] [line 27]
!454 = !MDLocation(line: 27, column: 8, scope: !18, inlinedAt: !409)
!455 = !MDLocation(line: 28, column: 3, scope: !18, inlinedAt: !409)
!456 = !MDLocation(line: 29, column: 3, scope: !18, inlinedAt: !409)
!457 = !MDLocation(line: 30, column: 3, scope: !18, inlinedAt: !409)
!458 = !MDLocation(line: 31, column: 3, scope: !18, inlinedAt: !409)
!459 = !MDLocation(line: 58, column: 10, scope: !38, inlinedAt: !443)
!460 = !MDLocation(line: 32, column: 3, scope: !18, inlinedAt: !422)
!461 = !MDLocation(line: 135, column: 11, scope: !310, inlinedAt: !462)
!462 = !MDLocation(line: 175, column: 3, scope: !90)
!463 = !{!"0x100\00tmp\00133\000", !83, !19, !4, !462} ; [ DW_TAG_auto_variable ] [tmp] [line 133]
!464 = !MDLocation(line: 133, column: 8, scope: !83, inlinedAt: !462)
!465 = !MDLocation(line: 136, column: 15, scope: !310, inlinedAt: !462)
!466 = !MDLocation(line: 136, column: 5, scope: !310, inlinedAt: !462)
!467 = !MDLocation(line: 137, column: 5, scope: !310, inlinedAt: !462)
!468 = !{!"0x100\00p\00133\000", !83, !19, !4, !462} ; [ DW_TAG_auto_variable ] [p] [line 133]
!469 = !MDLocation(line: 133, column: 14, scope: !83, inlinedAt: !462)
!470 = !MDLocation(line: 139, column: 12, scope: !83, inlinedAt: !462)
!471 = !MDLocation(line: 139, column: 3, scope: !310, inlinedAt: !462)
!472 = !MDLocation(line: 177, column: 7, scope: !473)
!473 = !{!"0xb\00177\007\0027", !1, !90}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!474 = !MDLocation(line: 177, column: 7, scope: !90)
!475 = !MDLocation(line: 178, column: 5, scope: !476)
!476 = !{!"0xb\00177\0037\0028", !1, !473}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!477 = !MDLocation(line: 180, column: 5, scope: !476)
!478 = !MDLocation(line: 183, column: 7, scope: !479)
!479 = !{!"0xb\00183\007\0029", !1, !90}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!480 = !MDLocation(line: 183, column: 7, scope: !90)
!481 = !MDLocation(line: 184, column: 5, scope: !482)
!482 = !{!"0xb\00183\0033\0030", !1, !479}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!483 = !MDLocation(line: 186, column: 5, scope: !482)
!484 = !MDLocation(line: 189, column: 7, scope: !485)
!485 = !{!"0xb\00189\007\0031", !1, !90}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!486 = !MDLocation(line: 189, column: 7, scope: !90)
!487 = !MDLocation(line: 190, column: 5, scope: !488)
!488 = !{!"0xb\00189\0037\0032", !1, !485}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!489 = !MDLocation(line: 192, column: 5, scope: !488)
!490 = !MDLocation(line: 195, column: 7, scope: !491)
!491 = !{!"0xb\00195\007\0033", !1, !90}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!492 = !MDLocation(line: 195, column: 7, scope: !90)
!493 = !MDLocation(line: 196, column: 5, scope: !494)
!494 = !{!"0xb\00195\0033\0034", !1, !491}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!495 = !MDLocation(line: 198, column: 5, scope: !494)
!496 = !{!"0x101\00x\0016777281\000", !42, !19, !4, !497} ; [ DW_TAG_arg_variable ] [x] [line 65]
!497 = !MDLocation(line: 207, column: 8, scope: !498)
!498 = !{!"0xb\00207\007\0037", !1, !90}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!499 = !MDLocation(line: 65, column: 21, scope: !42, inlinedAt: !497)
!500 = !{!"0x101\00y\0033554497\000", !42, !19, !4, !497} ; [ DW_TAG_arg_variable ] [y] [line 65]
!501 = !MDLocation(line: 65, column: 29, scope: !42, inlinedAt: !497)
!502 = !{!"0x100\00xp\0066\000", !42, !19, !4, !497} ; [ DW_TAG_auto_variable ] [xp] [line 66]
!503 = !MDLocation(line: 66, column: 8, scope: !42, inlinedAt: !497)
!504 = !{!"0x100\00yp\0066\000", !42, !19, !4, !497} ; [ DW_TAG_auto_variable ] [yp] [line 66]
!505 = !MDLocation(line: 66, column: 13, scope: !42, inlinedAt: !497)
!506 = !MDLocation(line: 68, column: 20, scope: !195, inlinedAt: !497)
!507 = !MDLocation(line: 69, column: 9, scope: !199, inlinedAt: !497)
!508 = !MDLocation(line: 68, column: 3, scope: !196, inlinedAt: !497)
!509 = !MDLocation(line: 69, column: 9, scope: !200, inlinedAt: !497)
!510 = !MDLocation(line: 68, column: 51, scope: !195, inlinedAt: !497)
!511 = !MDLocation(line: 68, column: 20, scope: !193, inlinedAt: !497)
!512 = !MDLocation(line: 69, column: 20, scope: !199, inlinedAt: !497)
!513 = !MDLocation(line: 71, column: 7, scope: !42, inlinedAt: !497)
!514 = !MDLocation(line: 72, column: 10, scope: !42, inlinedAt: !497)
!515 = !MDLocation(line: 207, column: 7, scope: !90)
!516 = !MDLocation(line: 208, column: 5, scope: !517)
!517 = !{!"0xb\00207\0030\0038", !1, !498}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!518 = !MDLocation(line: 209, column: 5, scope: !517)
!519 = !MDLocation(line: 212, column: 3, scope: !90)
!520 = !MDLocation(line: 213, column: 3, scope: !90)
!521 = !MDLocation(line: 214, column: 3, scope: !90)
!522 = !MDLocation(line: 216, column: 3, scope: !90)
!523 = !MDLocation(line: 219, column: 14, scope: !98)
!524 = !MDLocation(line: 219, column: 26, scope: !98)
!525 = !MDLocation(line: 225, column: 13, scope: !98)
!526 = !MDLocation(line: 225, column: 12, scope: !98)
!527 = !MDLocation(line: 225, column: 31, scope: !528)
!528 = !{!"0xb\001", !1, !98}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!529 = !{!141, !141, i64 0}
!530 = !{!"0x101\00__nptr\0016777494\000", !106, !108, !111, !531} ; [ DW_TAG_arg_variable ] [__nptr] [line 278]
!531 = !MDLocation(line: 225, column: 26, scope: !98)
!532 = !MDLocation(line: 278, column: 1, scope: !106, inlinedAt: !531)
!533 = !MDLocation(line: 280, column: 16, scope: !106, inlinedAt: !531)
!534 = !MDLocation(line: 280, column: 10, scope: !106, inlinedAt: !531)
!535 = !MDLocation(line: 225, column: 7, scope: !98)
!536 = !MDLocation(line: 227, column: 3, scope: !98)
!537 = !MDLocation(line: 227, column: 9, scope: !538)
!538 = !{!"0xb\003", !1, !528}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!539 = !MDLocation(line: 227, column: 23, scope: !540)
!540 = !{!"0xb\002", !1, !98}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!541 = !MDLocation(line: 226, column: 7, scope: !98)
!542 = !MDLocation(line: 228, column: 3, scope: !98)
!543 = !MDLocation(line: 229, column: 3, scope: !98)
