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
@.str10 = private unnamed_addr constant [35 x i8] c"li1 size wrong, wanted %d, got %d\0A\00", align 1
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
  tail call void @llvm.dbg.value(metadata %struct.DLL* %head, i64 0, metadata !152, metadata !132), !dbg !155
  tail call void @llvm.dbg.value(metadata %struct.DLL* %head, i64 0, metadata !156, metadata !132), !dbg !158
  %val.i.i = getelementptr inbounds %struct.DLL* %head, i64 0, i32 0, !dbg !159
  %0 = load i32* %val.i.i, align 4, !dbg !159, !tbaa !149
  %cmp.i = icmp eq i32 %0, 0, !dbg !157
  br i1 %cmp.i, label %return, label %if.end, !dbg !160

if.end:                                           ; preds = %entry
  %prev1 = getelementptr inbounds %struct.DLL* %head, i64 0, i32 2, !dbg !161
  %1 = load %struct.DLL** %prev1, align 8, !dbg !161, !tbaa !136
  tail call void @llvm.dbg.value(metadata %struct.DLL* %1, i64 0, metadata !32, metadata !132), !dbg !162
  %prev2 = getelementptr inbounds %struct.DLL* %1, i64 0, i32 2, !dbg !163
  %2 = load %struct.DLL** %prev2, align 8, !dbg !163, !tbaa !136
  tail call void @llvm.dbg.value(metadata %struct.DLL* %2, i64 0, metadata !31, metadata !132), !dbg !164
  %next = getelementptr inbounds %struct.DLL* %2, i64 0, i32 1, !dbg !165
  store %struct.DLL* %head, %struct.DLL** %next, align 8, !dbg !165, !tbaa !144
  store %struct.DLL* %2, %struct.DLL** %prev1, align 8, !dbg !166, !tbaa !136
  %dec = add nsw i32 %0, -1, !dbg !167
  store i32 %dec, i32* %val.i.i, align 4, !dbg !167, !tbaa !149
  br label %return, !dbg !168

return:                                           ; preds = %entry, %if.end
  %retval.0 = phi %struct.DLL* [ %1, %if.end ], [ null, %entry ]
  ret %struct.DLL* %retval.0, !dbg !169
}

; Function Attrs: nounwind uwtable
define void @list_push_head(%struct.DLL* %head, %struct.DLL* %item) #0 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.DLL* %head, i64 0, metadata !35, metadata !132), !dbg !170
  tail call void @llvm.dbg.value(metadata %struct.DLL* %item, i64 0, metadata !36, metadata !132), !dbg !171
  %next1 = getelementptr inbounds %struct.DLL* %head, i64 0, i32 1, !dbg !172
  %0 = load %struct.DLL** %next1, align 8, !dbg !172, !tbaa !144
  tail call void @llvm.dbg.value(metadata %struct.DLL* %0, i64 0, metadata !37, metadata !132), !dbg !173
  store %struct.DLL* %item, %struct.DLL** %next1, align 8, !dbg !174, !tbaa !144
  %prev = getelementptr inbounds %struct.DLL* %0, i64 0, i32 2, !dbg !175
  store %struct.DLL* %item, %struct.DLL** %prev, align 8, !dbg !175, !tbaa !136
  %next3 = getelementptr inbounds %struct.DLL* %item, i64 0, i32 1, !dbg !176
  store %struct.DLL* %0, %struct.DLL** %next3, align 8, !dbg !176, !tbaa !144
  %prev4 = getelementptr inbounds %struct.DLL* %item, i64 0, i32 2, !dbg !177
  store %struct.DLL* %head, %struct.DLL** %prev4, align 8, !dbg !177, !tbaa !136
  %val = getelementptr inbounds %struct.DLL* %head, i64 0, i32 0, !dbg !178
  %1 = load i32* %val, align 4, !dbg !178, !tbaa !149
  %inc = add nsw i32 %1, 1, !dbg !178
  store i32 %inc, i32* %val, align 4, !dbg !178, !tbaa !149
  ret void, !dbg !179
}

; Function Attrs: nounwind uwtable
define %struct.DLL* @list_pop_head(%struct.DLL* %head) #0 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.DLL* %head, i64 0, metadata !40, metadata !132), !dbg !180
  tail call void @llvm.dbg.value(metadata %struct.DLL* %head, i64 0, metadata !181, metadata !132), !dbg !184
  tail call void @llvm.dbg.value(metadata %struct.DLL* %head, i64 0, metadata !185, metadata !132), !dbg !187
  %val.i.i = getelementptr inbounds %struct.DLL* %head, i64 0, i32 0, !dbg !188
  %0 = load i32* %val.i.i, align 4, !dbg !188, !tbaa !149
  %cmp.i = icmp eq i32 %0, 0, !dbg !186
  br i1 %cmp.i, label %return, label %if.end, !dbg !189

if.end:                                           ; preds = %entry
  %next1 = getelementptr inbounds %struct.DLL* %head, i64 0, i32 1, !dbg !190
  %1 = load %struct.DLL** %next1, align 8, !dbg !190, !tbaa !144
  tail call void @llvm.dbg.value(metadata %struct.DLL* %1, i64 0, metadata !41, metadata !132), !dbg !191
  %next2 = getelementptr inbounds %struct.DLL* %1, i64 0, i32 1, !dbg !192
  %2 = load %struct.DLL** %next2, align 8, !dbg !192, !tbaa !144
  store %struct.DLL* %2, %struct.DLL** %next1, align 8, !dbg !193, !tbaa !144
  %3 = load %struct.DLL** %next2, align 8, !dbg !194, !tbaa !144
  %prev = getelementptr inbounds %struct.DLL* %3, i64 0, i32 2, !dbg !194
  store %struct.DLL* %head, %struct.DLL** %prev, align 8, !dbg !194, !tbaa !136
  %dec = add nsw i32 %0, -1, !dbg !195
  store i32 %dec, i32* %val.i.i, align 4, !dbg !195, !tbaa !149
  br label %return, !dbg !196

return:                                           ; preds = %entry, %if.end
  %retval.0 = phi %struct.DLL* [ %1, %if.end ], [ null, %entry ]
  ret %struct.DLL* %retval.0, !dbg !197
}

; Function Attrs: nounwind readonly uwtable
define i32 @list_equal(%struct.DLL* readonly %x, %struct.DLL* readonly %y) #1 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.DLL* %x, i64 0, metadata !46, metadata !132), !dbg !198
  tail call void @llvm.dbg.value(metadata %struct.DLL* %y, i64 0, metadata !47, metadata !132), !dbg !199
  tail call void @llvm.dbg.value(metadata %struct.DLL* %x, i64 0, metadata !48, metadata !132), !dbg !200
  tail call void @llvm.dbg.value(metadata %struct.DLL* %y, i64 0, metadata !49, metadata !132), !dbg !201
  %next20 = getelementptr inbounds %struct.DLL* %x, i64 0, i32 1, !dbg !202
  %0 = load %struct.DLL** %next20, align 8, !dbg !202, !tbaa !144
  %cmp21 = icmp eq %struct.DLL* %0, %x, !dbg !207
  %val22 = getelementptr inbounds %struct.DLL* %x, i64 0, i32 0, !dbg !208
  %1 = load i32* %val22, align 4, !dbg !208, !tbaa !149
  %val123 = getelementptr inbounds %struct.DLL* %y, i64 0, i32 0, !dbg !211
  %2 = load i32* %val123, align 4, !dbg !211, !tbaa !149
  %cmp224 = icmp ne i32 %1, %2, !dbg !208
  br i1 %cmp21, label %for.end, label %for.body.preheader, !dbg !212

for.body.preheader:                               ; preds = %entry
  br label %for.body, !dbg !213

for.body:                                         ; preds = %for.body.preheader, %for.inc
  %cmp226 = phi i1 [ %cmp2, %for.inc ], [ %cmp224, %for.body.preheader ]
  %3 = phi %struct.DLL* [ %5, %for.inc ], [ %0, %for.body.preheader ]
  %yp.025 = phi %struct.DLL* [ %4, %for.inc ], [ %y, %for.body.preheader ]
  br i1 %cmp226, label %return.loopexit, label %for.inc, !dbg !213

for.inc:                                          ; preds = %for.body
  tail call void @llvm.dbg.value(metadata %struct.DLL* %5, i64 0, metadata !48, metadata !132), !dbg !200
  %next4 = getelementptr inbounds %struct.DLL* %yp.025, i64 0, i32 1, !dbg !214
  %4 = load %struct.DLL** %next4, align 8, !dbg !214, !tbaa !144
  tail call void @llvm.dbg.value(metadata %struct.DLL* %4, i64 0, metadata !49, metadata !132), !dbg !201
  %next = getelementptr inbounds %struct.DLL* %3, i64 0, i32 1, !dbg !202
  %5 = load %struct.DLL** %next, align 8, !dbg !202, !tbaa !144
  %cmp = icmp eq %struct.DLL* %5, %x, !dbg !207
  %val = getelementptr inbounds %struct.DLL* %3, i64 0, i32 0, !dbg !208
  %6 = load i32* %val, align 4, !dbg !208, !tbaa !149
  %val1 = getelementptr inbounds %struct.DLL* %4, i64 0, i32 0, !dbg !211
  %7 = load i32* %val1, align 4, !dbg !211, !tbaa !149
  %cmp2 = icmp ne i32 %6, %7, !dbg !208
  br i1 %cmp, label %for.end.loopexit, label %for.body, !dbg !212

for.end.loopexit:                                 ; preds = %for.inc
  %cmp2.lcssa30 = phi i1 [ %cmp2, %for.inc ]
  %.lcssa = phi %struct.DLL* [ %4, %for.inc ]
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %cmp2.lcssa = phi i1 [ %cmp224, %entry ], [ %cmp2.lcssa30, %for.end.loopexit ]
  %yp.0.lcssa = phi %struct.DLL* [ %y, %entry ], [ %.lcssa, %for.end.loopexit ]
  br i1 %cmp2.lcssa, label %return, label %if.end9, !dbg !215

if.end9:                                          ; preds = %for.end
  %next10 = getelementptr inbounds %struct.DLL* %yp.0.lcssa, i64 0, i32 1, !dbg !216
  %8 = load %struct.DLL** %next10, align 8, !dbg !216, !tbaa !144
  %cmp11 = icmp eq %struct.DLL* %8, %y, !dbg !216
  %conv = zext i1 %cmp11 to i32, !dbg !216
  br label %return, !dbg !217

return.loopexit:                                  ; preds = %for.body
  br label %return

return:                                           ; preds = %return.loopexit, %for.end, %if.end9
  %retval.0 = phi i32 [ %conv, %if.end9 ], [ 0, %for.end ], [ 0, %return.loopexit ]
  ret i32 %retval.0, !dbg !218
}

; Function Attrs: nounwind uwtable
define void @list_print(i8* nocapture readonly %msg, %struct.DLL* nocapture readonly %x) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i8* %msg, i64 0, metadata !54, metadata !132), !dbg !219
  tail call void @llvm.dbg.value(metadata %struct.DLL* %x, i64 0, metadata !55, metadata !132), !dbg !220
  %next = getelementptr inbounds %struct.DLL* %x, i64 0, i32 1, !dbg !221
  %0 = load %struct.DLL** %next, align 8, !dbg !221, !tbaa !144
  tail call void @llvm.dbg.value(metadata %struct.DLL* %0, i64 0, metadata !57, metadata !132), !dbg !222
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !58, metadata !132), !dbg !223
  %call = tail call i32 @puts(i8* %msg) #5, !dbg !224
  tail call void @llvm.dbg.value(metadata %struct.DLL* %x, i64 0, metadata !225, metadata !132), !dbg !227
  %val.i = getelementptr inbounds %struct.DLL* %x, i64 0, i32 0, !dbg !228
  %1 = load i32* %val.i, align 4, !dbg !228, !tbaa !149
  %call2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i32 %1) #5, !dbg !229
  %xp.021 = load %struct.DLL** %next, align 8, !dbg !230
  %next422 = getelementptr inbounds %struct.DLL* %xp.021, i64 0, i32 1, !dbg !232
  %2 = load %struct.DLL** %next422, align 8, !dbg !232, !tbaa !144
  %cmp23 = icmp eq %struct.DLL* %2, %0, !dbg !236
  br i1 %cmp23, label %for.end, label %for.body.preheader, !dbg !237

for.body.preheader:                               ; preds = %entry
  br label %for.body, !dbg !238

for.body:                                         ; preds = %for.body.preheader, %for.body
  %3 = phi %struct.DLL* [ %8, %for.body ], [ %2, %for.body.preheader ]
  %next426 = phi %struct.DLL** [ %next4, %for.body ], [ %next422, %for.body.preheader ]
  %xp.025 = phi %struct.DLL* [ %xp.0, %for.body ], [ %xp.021, %for.body.preheader ]
  %i.024 = phi i32 [ %inc, %for.body ], [ 0, %for.body.preheader ]
  %inc = add nuw nsw i32 %i.024, 1, !dbg !238
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !58, metadata !132), !dbg !223
  %val = getelementptr inbounds %struct.DLL* %xp.025, i64 0, i32 0, !dbg !240
  %4 = load i32* %val, align 4, !dbg !240, !tbaa !149
  %val6 = getelementptr inbounds %struct.DLL* %3, i64 0, i32 0, !dbg !241
  %5 = load i32* %val6, align 4, !dbg !241, !tbaa !149
  %prev = getelementptr inbounds %struct.DLL* %xp.025, i64 0, i32 2, !dbg !242
  %6 = load %struct.DLL** %prev, align 8, !dbg !242, !tbaa !136
  %val7 = getelementptr inbounds %struct.DLL* %6, i64 0, i32 0, !dbg !242
  %7 = load i32* %val7, align 4, !dbg !242, !tbaa !149
  %call8 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str1, i64 0, i64 0), i32 %inc, i32 %4, i32 %5, i32 %7) #5, !dbg !243
  %xp.0 = load %struct.DLL** %next426, align 8, !dbg !230
  %next4 = getelementptr inbounds %struct.DLL* %xp.0, i64 0, i32 1, !dbg !232
  %8 = load %struct.DLL** %next4, align 8, !dbg !232, !tbaa !144
  %cmp = icmp eq %struct.DLL* %8, %0, !dbg !236
  br i1 %cmp, label %for.end.loopexit, label %for.body, !dbg !237

for.end.loopexit:                                 ; preds = %for.body
  %next4.lcssa29 = phi %struct.DLL** [ %next4, %for.body ]
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %next4.lcssa = phi %struct.DLL** [ %next422, %entry ], [ %next4.lcssa29, %for.end.loopexit ]
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([33 x i8]* @str, i64 0, i64 0)) #5, !dbg !244
  %9 = load %struct.DLL** %next4.lcssa, align 8, !dbg !245, !tbaa !144
  %val12 = getelementptr inbounds %struct.DLL* %9, i64 0, i32 0, !dbg !245
  %10 = load i32* %val12, align 4, !dbg !245, !tbaa !149
  %call13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str3, i64 0, i64 0), i32 %10) #5, !dbg !246
  ret void, !dbg !247
}

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #2

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind uwtable
define %struct.DLL* @list_new() #0 {
entry:
  %call = tail call noalias i8* @malloc(i64 24) #5, !dbg !248
  %0 = bitcast i8* %call to %struct.DLL*, !dbg !249
  tail call void @llvm.dbg.value(metadata %struct.DLL* %0, i64 0, metadata !63, metadata !132), !dbg !250
  %next = getelementptr inbounds i8* %call, i64 8, !dbg !251
  %1 = bitcast i8* %next to i8**, !dbg !251
  store i8* %call, i8** %1, align 8, !dbg !251, !tbaa !144
  %prev = getelementptr inbounds i8* %call, i64 16, !dbg !252
  %2 = bitcast i8* %prev to i8**, !dbg !252
  store i8* %call, i8** %2, align 8, !dbg !252, !tbaa !136
  %val = bitcast i8* %call to i32*, !dbg !253
  store i32 0, i32* %val, align 4, !dbg !253, !tbaa !149
  ret %struct.DLL* %0, !dbg !254
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind uwtable
define %struct.DLL* @list_sequence(i32 %from, i32 %to) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %from, i64 0, metadata !68, metadata !132), !dbg !255
  tail call void @llvm.dbg.value(metadata i32 %to, i64 0, metadata !69, metadata !132), !dbg !256
  %cmp = icmp sgt i32 %from, %to, !dbg !257
  tail call void @llvm.dbg.value(metadata i32 %from, i64 0, metadata !71, metadata !132), !dbg !259
  tail call void @llvm.dbg.value(metadata i32 %to, i64 0, metadata !68, metadata !132), !dbg !255
  tail call void @llvm.dbg.value(metadata i32 %from, i64 0, metadata !69, metadata !132), !dbg !256
  %from.to = select i1 %cmp, i32 %from, i32 %to, !dbg !260
  %to.from = select i1 %cmp, i32 %to, i32 %from, !dbg !260
  %sub = sub nsw i32 %from.to, %to.from, !dbg !261
  %add = add nsw i32 %sub, 1, !dbg !261
  tail call void @llvm.dbg.value(metadata i32 %add, i64 0, metadata !70, metadata !132), !dbg !262
  %add4 = add nsw i32 %sub, 2, !dbg !263
  %conv = sext i32 %add4 to i64, !dbg !264
  %mul = mul nsw i64 %conv, 24, !dbg !264
  %call = tail call noalias i8* @malloc(i64 %mul) #5, !dbg !265
  %0 = bitcast i8* %call to %struct.DLL*, !dbg !266
  tail call void @llvm.dbg.value(metadata %struct.DLL* %0, i64 0, metadata !74, metadata !132), !dbg !267
  %dec = add nsw i32 %to.from, -1, !dbg !268
  tail call void @llvm.dbg.value(metadata i32 %dec, i64 0, metadata !68, metadata !132), !dbg !255
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !72, metadata !132), !dbg !269
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !73, metadata !132), !dbg !270
  %cmp571 = icmp sgt i32 %sub, -1, !dbg !271
  %1 = sext i32 %add to i64, !dbg !274
  br i1 %cmp571, label %for.body.lr.ph, label %for.end, !dbg !274

for.body.lr.ph:                                   ; preds = %entry
  %2 = icmp sgt i32 %to, %from
  %smax = select i1 %2, i32 %to, i32 %from
  %3 = xor i32 %to, -1, !dbg !274
  %4 = xor i32 %from, -1, !dbg !274
  %5 = icmp sgt i32 %3, %4
  %smax78 = select i1 %5, i32 %3, i32 %4
  %6 = add i32 %smax, %smax78, !dbg !274
  %7 = add i32 %6, 2, !dbg !274
  %8 = icmp sgt i32 %7, 1
  %.op = add i32 %smax, %smax78, !dbg !274
  %9 = select i1 %8, i32 %.op, i32 -1, !dbg !274
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
  %indvars.iv.next77.prol = add nuw nsw i64 %indvars.iv76.prol, 1, !dbg !274
  %arrayidx.prol = getelementptr inbounds %struct.DLL* %0, i64 %indvars.iv.next77.prol, !dbg !275
  %next.prol = getelementptr inbounds %struct.DLL* %0, i64 %indvars.iv76.prol, i32 1, !dbg !277
  store %struct.DLL* %arrayidx.prol, %struct.DLL** %next.prol, align 8, !dbg !277, !tbaa !144
  %18 = add nsw i64 %indvars.iv.prol, -1, !dbg !278
  %arrayidx12.prol = getelementptr inbounds %struct.DLL* %0, i64 %18, !dbg !279
  %prev.prol = getelementptr inbounds %struct.DLL* %0, i64 %indvars.iv.prol, i32 2, !dbg !280
  store %struct.DLL* %arrayidx12.prol, %struct.DLL** %prev.prol, align 8, !dbg !280, !tbaa !136
  %inc.prol = add nsw i32 %from.addr.174.prol, 1, !dbg !281
  tail call void @llvm.dbg.value(metadata i32 %inc.prol, i64 0, metadata !68, metadata !132), !dbg !255
  %val.prol = getelementptr inbounds %struct.DLL* %0, i64 %indvars.iv76.prol, i32 0, !dbg !282
  store i32 %from.addr.174.prol, i32* %val.prol, align 4, !dbg !282, !tbaa !149
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1, !dbg !274
  %cmp5.prol = icmp slt i64 %indvars.iv.next77.prol, %1, !dbg !271
  %prol.iter.sub = sub i64 %prol.iter, 1, !dbg !274
  %prol.iter.cmp = icmp ne i64 %prol.iter.sub, 0, !dbg !274
  br i1 %prol.iter.cmp, label %for.body.prol, label %for.body.lr.ph.split, !llvm.loop !283

for.body.lr.ph.split:                             ; preds = %for.body.prol, %for.body.lr.ph
  %indvars.iv76.unr = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next77.prol, %for.body.prol ]
  %indvars.iv.unr = phi i64 [ 1, %for.body.lr.ph ], [ %indvars.iv.next.prol, %for.body.prol ]
  %from.addr.174.unr = phi i32 [ %dec, %for.body.lr.ph ], [ %inc.prol, %for.body.prol ]
  %19 = icmp ult i64 %smax82, 2
  br i1 %19, label %for.cond.for.end_crit_edge, label %for.body.lr.ph.split.split

for.body.lr.ph.split.split:                       ; preds = %for.body.lr.ph.split
  br label %for.body, !dbg !274

for.body:                                         ; preds = %for.body, %for.body.lr.ph.split.split
  %indvars.iv76 = phi i64 [ %indvars.iv76.unr, %for.body.lr.ph.split.split ], [ %indvars.iv.next77.1, %for.body ]
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.body.lr.ph.split.split ], [ %indvars.iv.next.1, %for.body ]
  %from.addr.174 = phi i32 [ %from.addr.174.unr, %for.body.lr.ph.split.split ], [ %inc.1, %for.body ]
  %indvars.iv.next77 = add nuw nsw i64 %indvars.iv76, 1, !dbg !274
  %arrayidx = getelementptr inbounds %struct.DLL* %0, i64 %indvars.iv.next77, !dbg !275
  %next = getelementptr inbounds %struct.DLL* %0, i64 %indvars.iv76, i32 1, !dbg !277
  store %struct.DLL* %arrayidx, %struct.DLL** %next, align 8, !dbg !277, !tbaa !144
  %20 = add nsw i64 %indvars.iv, -1, !dbg !278
  %arrayidx12 = getelementptr inbounds %struct.DLL* %0, i64 %20, !dbg !279
  %prev = getelementptr inbounds %struct.DLL* %0, i64 %indvars.iv, i32 2, !dbg !280
  store %struct.DLL* %arrayidx12, %struct.DLL** %prev, align 8, !dbg !280, !tbaa !136
  %inc = add nsw i32 %from.addr.174, 1, !dbg !281
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !68, metadata !132), !dbg !255
  %val = getelementptr inbounds %struct.DLL* %0, i64 %indvars.iv76, i32 0, !dbg !282
  store i32 %from.addr.174, i32* %val, align 4, !dbg !282, !tbaa !149
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !274
  %indvars.iv.next77.1 = add nuw nsw i64 %indvars.iv.next77, 1, !dbg !274
  %arrayidx.1 = getelementptr inbounds %struct.DLL* %0, i64 %indvars.iv.next77.1, !dbg !275
  %next.1 = getelementptr inbounds %struct.DLL* %0, i64 %indvars.iv.next77, i32 1, !dbg !277
  store %struct.DLL* %arrayidx.1, %struct.DLL** %next.1, align 8, !dbg !277, !tbaa !144
  %arrayidx12.1 = getelementptr inbounds %struct.DLL* %0, i64 %indvars.iv, !dbg !279
  %prev.1 = getelementptr inbounds %struct.DLL* %0, i64 %indvars.iv.next, i32 2, !dbg !280
  store %struct.DLL* %arrayidx12.1, %struct.DLL** %prev.1, align 8, !dbg !280, !tbaa !136
  %inc.1 = add nsw i32 %inc, 1, !dbg !281
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !68, metadata !132), !dbg !255
  %val.1 = getelementptr inbounds %struct.DLL* %0, i64 %indvars.iv.next77, i32 0, !dbg !282
  store i32 %inc, i32* %val.1, align 4, !dbg !282, !tbaa !149
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv.next, 1, !dbg !274
  %cmp5.1 = icmp slt i64 %indvars.iv.next77.1, %1, !dbg !271
  br i1 %cmp5.1, label %for.body, label %for.cond.for.end_crit_edge.unr-lcssa, !dbg !274

for.cond.for.end_crit_edge.unr-lcssa:             ; preds = %for.body
  br label %for.cond.for.end_crit_edge

for.cond.for.end_crit_edge:                       ; preds = %for.body.lr.ph.split, %for.cond.for.end_crit_edge.unr-lcssa
  %21 = sub i32 %9, %smax78, !dbg !274
  br label %for.end, !dbg !274

for.end:                                          ; preds = %entry, %for.cond.for.end_crit_edge
  %from.addr.1.lcssa = phi i32 [ %21, %for.cond.for.end_crit_edge ], [ %dec, %entry ]
  %arrayidx20 = getelementptr inbounds %struct.DLL* %0, i64 %1, !dbg !285
  %prev22 = getelementptr inbounds i8* %call, i64 16, !dbg !286
  %22 = bitcast i8* %prev22 to %struct.DLL**, !dbg !286
  store %struct.DLL* %arrayidx20, %struct.DLL** %22, align 8, !dbg !286, !tbaa !136
  %next26 = getelementptr inbounds %struct.DLL* %0, i64 %1, i32 1, !dbg !287
  %23 = bitcast %struct.DLL** %next26 to i8**, !dbg !287
  store i8* %call, i8** %23, align 8, !dbg !287, !tbaa !144
  %idxprom28 = sext i32 %sub to i64, !dbg !288
  %arrayidx29 = getelementptr inbounds %struct.DLL* %0, i64 %idxprom28, !dbg !288
  %prev32 = getelementptr inbounds %struct.DLL* %0, i64 %1, i32 2, !dbg !289
  store %struct.DLL* %arrayidx29, %struct.DLL** %prev32, align 8, !dbg !289, !tbaa !136
  %val35 = getelementptr inbounds %struct.DLL* %arrayidx20, i64 0, i32 0, !dbg !290
  store i32 %from.addr.1.lcssa, i32* %val35, align 4, !dbg !290, !tbaa !149
  %val37 = bitcast i8* %call to i32*, !dbg !291
  store i32 %add, i32* %val37, align 4, !dbg !291, !tbaa !149
  ret %struct.DLL* %0, !dbg !292
}

; Function Attrs: nounwind uwtable
define %struct.DLL* @list_copy(%struct.DLL* nocapture readonly %x) #0 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.DLL* %x, i64 0, metadata !77, metadata !132), !dbg !293
  tail call void @llvm.dbg.value(metadata %struct.DLL* %x, i64 0, metadata !294, metadata !132), !dbg !296
  %val.i = getelementptr inbounds %struct.DLL* %x, i64 0, i32 0, !dbg !297
  %0 = load i32* %val.i, align 4, !dbg !297, !tbaa !149
  tail call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !80, metadata !132), !dbg !298
  %add = add nsw i32 %0, 1, !dbg !299
  %conv = sext i32 %add to i64, !dbg !300
  %mul = mul nsw i64 %conv, 24, !dbg !300
  %call1 = tail call noalias i8* @malloc(i64 %mul) #5, !dbg !301
  %1 = bitcast i8* %call1 to %struct.DLL*, !dbg !302
  tail call void @llvm.dbg.value(metadata %struct.DLL* %1, i64 0, metadata !82, metadata !132), !dbg !303
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !78, metadata !132), !dbg !304
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !79, metadata !132), !dbg !305
  tail call void @llvm.dbg.value(metadata %struct.DLL* %x, i64 0, metadata !81, metadata !132), !dbg !306
  %cmp50 = icmp sgt i32 %0, 0, !dbg !307
  br i1 %cmp50, label %for.body.lr.ph, label %for.end, !dbg !310

for.body.lr.ph:                                   ; preds = %entry
  %2 = add i32 %0, -1, !dbg !310
  br label %for.body, !dbg !310

for.body:                                         ; preds = %for.body.for.body_crit_edge, %for.body.lr.ph
  %3 = phi i32 [ %0, %for.body.lr.ph ], [ %.pre, %for.body.for.body_crit_edge ]
  %indvars.iv54 = phi i64 [ 1, %for.body.lr.ph ], [ %indvars.iv.next55, %for.body.for.body_crit_edge ]
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %for.body.for.body_crit_edge ]
  %xp.052 = phi %struct.DLL* [ %x, %for.body.lr.ph ], [ %4, %for.body.for.body_crit_edge ]
  %arrayidx = getelementptr inbounds %struct.DLL* %1, i64 %indvars.iv54, !dbg !311
  %arrayidx4 = getelementptr inbounds %struct.DLL* %1, i64 %indvars.iv, !dbg !313
  %next = getelementptr inbounds %struct.DLL* %1, i64 %indvars.iv, i32 1, !dbg !313
  store %struct.DLL* %arrayidx, %struct.DLL** %next, align 8, !dbg !313, !tbaa !144
  %prev = getelementptr inbounds %struct.DLL* %1, i64 %indvars.iv54, i32 2, !dbg !314
  store %struct.DLL* %arrayidx4, %struct.DLL** %prev, align 8, !dbg !314, !tbaa !136
  %val11 = getelementptr inbounds %struct.DLL* %arrayidx4, i64 0, i32 0, !dbg !315
  store i32 %3, i32* %val11, align 4, !dbg !315, !tbaa !149
  %next13 = getelementptr inbounds %struct.DLL* %xp.052, i64 0, i32 1, !dbg !316
  %4 = load %struct.DLL** %next13, align 8, !dbg !316, !tbaa !144
  tail call void @llvm.dbg.value(metadata %struct.DLL* %4, i64 0, metadata !81, metadata !132), !dbg !306
  %lftr.wideiv = trunc i64 %indvars.iv to i32, !dbg !310
  %exitcond = icmp eq i32 %lftr.wideiv, %2, !dbg !310
  br i1 %exitcond, label %for.end.loopexit, label %for.body.for.body_crit_edge, !dbg !310

for.body.for.body_crit_edge:                      ; preds = %for.body
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1, !dbg !310
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !310
  %val.phi.trans.insert = getelementptr inbounds %struct.DLL* %4, i64 0, i32 0
  %.pre = load i32* %val.phi.trans.insert, align 4, !dbg !317, !tbaa !149
  br label %for.body, !dbg !310

for.end.loopexit:                                 ; preds = %for.body
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %idxprom14 = sext i32 %0 to i64, !dbg !318
  %arrayidx15 = getelementptr inbounds %struct.DLL* %1, i64 %idxprom14, !dbg !318
  %prev17 = getelementptr inbounds i8* %call1, i64 16, !dbg !319
  %5 = bitcast i8* %prev17 to %struct.DLL**, !dbg !319
  store %struct.DLL* %arrayidx15, %struct.DLL** %5, align 8, !dbg !319, !tbaa !136
  %next21 = getelementptr inbounds %struct.DLL* %1, i64 %idxprom14, i32 1, !dbg !320
  %6 = bitcast %struct.DLL** %next21 to i8**, !dbg !320
  store i8* %call1, i8** %6, align 8, !dbg !320, !tbaa !144
  tail call void @llvm.dbg.value(metadata %struct.DLL* %x, i64 0, metadata !321, metadata !132), !dbg !323
  %prev.i = getelementptr inbounds %struct.DLL* %x, i64 0, i32 2, !dbg !324
  %7 = load %struct.DLL** %prev.i, align 8, !dbg !324, !tbaa !136
  %val23 = getelementptr inbounds %struct.DLL* %7, i64 0, i32 0, !dbg !322
  %8 = load i32* %val23, align 4, !dbg !322, !tbaa !149
  %val26 = getelementptr inbounds %struct.DLL* %arrayidx15, i64 0, i32 0, !dbg !325
  store i32 %8, i32* %val26, align 4, !dbg !325, !tbaa !149
  ret %struct.DLL* %1, !dbg !326
}

; Function Attrs: nounwind uwtable
define void @list_reverse(%struct.DLL* %head) #0 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.DLL* %head, i64 0, metadata !87, metadata !132), !dbg !327
  tail call void @llvm.dbg.value(metadata %struct.DLL* %head, i64 0, metadata !89, metadata !132), !dbg !328
  br label %do.body, !dbg !329

do.body:                                          ; preds = %do.body, %entry
  %p.0 = phi %struct.DLL* [ %head, %entry ], [ %0, %do.body ]
  %next = getelementptr inbounds %struct.DLL* %p.0, i64 0, i32 1, !dbg !330
  %0 = load %struct.DLL** %next, align 8, !dbg !330, !tbaa !144
  tail call void @llvm.dbg.value(metadata %struct.DLL* %0, i64 0, metadata !88, metadata !132), !dbg !332
  %prev = getelementptr inbounds %struct.DLL* %p.0, i64 0, i32 2, !dbg !333
  %1 = load %struct.DLL** %prev, align 8, !dbg !333, !tbaa !136
  store %struct.DLL* %1, %struct.DLL** %next, align 8, !dbg !334, !tbaa !144
  store %struct.DLL* %0, %struct.DLL** %prev, align 8, !dbg !335, !tbaa !136
  tail call void @llvm.dbg.value(metadata %struct.DLL* %0, i64 0, metadata !89, metadata !132), !dbg !328
  %cmp = icmp eq %struct.DLL* %0, %head, !dbg !336
  br i1 %cmp, label %do.end, label %do.body, !dbg !337

do.end:                                           ; preds = %do.body
  ret void, !dbg !338
}

; Function Attrs: nounwind uwtable
define i32 @test_lists() #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !94, metadata !132), !dbg !339
  %call = tail call %struct.DLL* @list_sequence(i32 1, i32 100), !dbg !340
  tail call void @llvm.dbg.value(metadata %struct.DLL* %call, i64 0, metadata !95, metadata !132), !dbg !341
  tail call void @llvm.dbg.value(metadata %struct.DLL* %call, i64 0, metadata !342, metadata !132) #5, !dbg !344
  tail call void @llvm.dbg.value(metadata %struct.DLL* %call, i64 0, metadata !345, metadata !132) #5, !dbg !347
  %val.i.i = getelementptr inbounds %struct.DLL* %call, i64 0, i32 0, !dbg !348
  %0 = load i32* %val.i.i, align 4, !dbg !348, !tbaa !149
  tail call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !349, metadata !132) #5, !dbg !350
  %add.i = add nsw i32 %0, 1, !dbg !351
  %conv.i = sext i32 %add.i to i64, !dbg !352
  %mul.i = mul nsw i64 %conv.i, 24, !dbg !352
  %call1.i = tail call noalias i8* @malloc(i64 %mul.i) #5, !dbg !353
  %1 = bitcast i8* %call1.i to %struct.DLL*, !dbg !354
  tail call void @llvm.dbg.value(metadata %struct.DLL* %1, i64 0, metadata !355, metadata !132) #5, !dbg !356
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !357, metadata !132) #5, !dbg !358
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !359, metadata !132) #5, !dbg !360
  tail call void @llvm.dbg.value(metadata %struct.DLL* %call, i64 0, metadata !361, metadata !132) #5, !dbg !362
  %cmp50.i = icmp sgt i32 %0, 0, !dbg !363
  br i1 %cmp50.i, label %for.body.lr.ph.i, label %entry.list_copy.exit_crit_edge, !dbg !364

entry.list_copy.exit_crit_edge:                   ; preds = %entry
  %next20.i.pre = getelementptr inbounds i8* %call1.i, i64 8, !dbg !365
  %val22.i.pre = bitcast i8* %call1.i to i32*, !dbg !368
  br label %list_copy.exit, !dbg !364

for.body.lr.ph.i:                                 ; preds = %entry
  %arrayidx.i173 = getelementptr inbounds i8* %call1.i, i64 24, !dbg !369
  %next.i174 = getelementptr inbounds i8* %call1.i, i64 8, !dbg !370
  %2 = bitcast i8* %next.i174 to i8**, !dbg !370
  store i8* %arrayidx.i173, i8** %2, align 8, !dbg !370, !tbaa !144
  %prev.i175 = getelementptr inbounds i8* %call1.i, i64 40, !dbg !371
  %3 = bitcast i8* %prev.i175 to i8**, !dbg !371
  store i8* %call1.i, i8** %3, align 8, !dbg !371, !tbaa !136
  %val11.i176 = bitcast i8* %call1.i to i32*, !dbg !372
  store i32 %0, i32* %val11.i176, align 4, !dbg !372, !tbaa !149
  %exitcond.i178 = icmp eq i32 %0, 1, !dbg !364
  br i1 %exitcond.i178, label %list_copy.exit, label %for.body.for.body_crit_edge.i.lr.ph, !dbg !364

for.body.for.body_crit_edge.i.lr.ph:              ; preds = %for.body.lr.ph.i
  %4 = add i32 %0, -2, !dbg !364
  %5 = add i32 %0, -1
  %xtraiter186 = and i32 %5, 1
  %lcmp.mod187 = icmp ne i32 %xtraiter186, 0
  %lcmp.overflow188 = icmp eq i32 %5, 0
  %lcmp.or189 = or i1 %lcmp.overflow188, %lcmp.mod187
  br i1 %lcmp.or189, label %for.body.for.body_crit_edge.i.prol, label %for.body.for.body_crit_edge.i.lr.ph.split

for.body.for.body_crit_edge.i.prol:               ; preds = %for.body.for.body_crit_edge.i.prol, %for.body.for.body_crit_edge.i.lr.ph
  %call.pn.prol = phi %struct.DLL* [ %call, %for.body.for.body_crit_edge.i.lr.ph ], [ %6, %for.body.for.body_crit_edge.i.prol ]
  %indvars.iv.i180.prol = phi i64 [ 0, %for.body.for.body_crit_edge.i.lr.ph ], [ %indvars.iv.next.i.prol, %for.body.for.body_crit_edge.i.prol ]
  %indvars.iv54.i179.prol = phi i64 [ 1, %for.body.for.body_crit_edge.i.lr.ph ], [ %indvars.iv.next55.i.prol, %for.body.for.body_crit_edge.i.prol ]
  %prol.iter190 = phi i32 [ %xtraiter186, %for.body.for.body_crit_edge.i.lr.ph ], [ %prol.iter190.sub, %for.body.for.body_crit_edge.i.prol ]
  %.in.prol = getelementptr inbounds %struct.DLL* %call.pn.prol, i64 0, i32 1, !dbg !373
  %6 = load %struct.DLL** %.in.prol, align 8, !dbg !373
  %indvars.iv.next55.i.prol = add nuw nsw i64 %indvars.iv54.i179.prol, 1, !dbg !364
  %indvars.iv.next.i.prol = add nuw nsw i64 %indvars.iv.i180.prol, 1, !dbg !364
  %val.phi.trans.insert.i.prol = getelementptr inbounds %struct.DLL* %6, i64 0, i32 0, !dbg !343
  %.pre.i.prol = load i32* %val.phi.trans.insert.i.prol, align 4, !dbg !374, !tbaa !149
  %arrayidx.i.prol = getelementptr inbounds %struct.DLL* %1, i64 %indvars.iv.next55.i.prol, !dbg !369
  %arrayidx4.i.prol = getelementptr inbounds %struct.DLL* %1, i64 %indvars.iv.next.i.prol, !dbg !370
  %next.i.prol = getelementptr inbounds %struct.DLL* %1, i64 %indvars.iv.next.i.prol, i32 1, !dbg !370
  store %struct.DLL* %arrayidx.i.prol, %struct.DLL** %next.i.prol, align 8, !dbg !370, !tbaa !144
  %prev.i.prol = getelementptr inbounds %struct.DLL* %1, i64 %indvars.iv.next55.i.prol, i32 2, !dbg !371
  store %struct.DLL* %arrayidx4.i.prol, %struct.DLL** %prev.i.prol, align 8, !dbg !371, !tbaa !136
  %val11.i.prol = getelementptr inbounds %struct.DLL* %arrayidx4.i.prol, i64 0, i32 0, !dbg !372
  store i32 %.pre.i.prol, i32* %val11.i.prol, align 4, !dbg !372, !tbaa !149
  %lftr.wideiv.prol = trunc i64 %indvars.iv.i180.prol to i32, !dbg !364
  %exitcond.prol = icmp eq i32 %lftr.wideiv.prol, %4, !dbg !364
  %prol.iter190.sub = sub i32 %prol.iter190, 1, !dbg !364
  %prol.iter190.cmp = icmp ne i32 %prol.iter190.sub, 0, !dbg !364
  br i1 %prol.iter190.cmp, label %for.body.for.body_crit_edge.i.prol, label %for.body.for.body_crit_edge.i.lr.ph.split, !llvm.loop !375

for.body.for.body_crit_edge.i.lr.ph.split:        ; preds = %for.body.for.body_crit_edge.i.prol, %for.body.for.body_crit_edge.i.lr.ph
  %call.pn.unr = phi %struct.DLL* [ %call, %for.body.for.body_crit_edge.i.lr.ph ], [ %6, %for.body.for.body_crit_edge.i.prol ]
  %indvars.iv.i180.unr = phi i64 [ 0, %for.body.for.body_crit_edge.i.lr.ph ], [ %indvars.iv.next.i.prol, %for.body.for.body_crit_edge.i.prol ]
  %indvars.iv54.i179.unr = phi i64 [ 1, %for.body.for.body_crit_edge.i.lr.ph ], [ %indvars.iv.next55.i.prol, %for.body.for.body_crit_edge.i.prol ]
  %7 = icmp ult i32 %5, 2
  br i1 %7, label %list_copy.exit.loopexit, label %for.body.for.body_crit_edge.i.lr.ph.split.split

for.body.for.body_crit_edge.i.lr.ph.split.split:  ; preds = %for.body.for.body_crit_edge.i.lr.ph.split
  br label %for.body.for.body_crit_edge.i, !dbg !364

for.body.for.body_crit_edge.i:                    ; preds = %for.body.for.body_crit_edge.i, %for.body.for.body_crit_edge.i.lr.ph.split.split
  %call.pn = phi %struct.DLL* [ %call.pn.unr, %for.body.for.body_crit_edge.i.lr.ph.split.split ], [ %9, %for.body.for.body_crit_edge.i ]
  %indvars.iv.i180 = phi i64 [ %indvars.iv.i180.unr, %for.body.for.body_crit_edge.i.lr.ph.split.split ], [ %indvars.iv.next.i.1, %for.body.for.body_crit_edge.i ]
  %indvars.iv54.i179 = phi i64 [ %indvars.iv54.i179.unr, %for.body.for.body_crit_edge.i.lr.ph.split.split ], [ %indvars.iv.next55.i.1, %for.body.for.body_crit_edge.i ]
  %.in = getelementptr inbounds %struct.DLL* %call.pn, i64 0, i32 1, !dbg !373
  %8 = load %struct.DLL** %.in, align 8, !dbg !373
  %indvars.iv.next55.i = add nuw nsw i64 %indvars.iv54.i179, 1, !dbg !364
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i180, 1, !dbg !364
  %val.phi.trans.insert.i = getelementptr inbounds %struct.DLL* %8, i64 0, i32 0, !dbg !343
  %.pre.i = load i32* %val.phi.trans.insert.i, align 4, !dbg !374, !tbaa !149
  %arrayidx.i = getelementptr inbounds %struct.DLL* %1, i64 %indvars.iv.next55.i, !dbg !369
  %arrayidx4.i = getelementptr inbounds %struct.DLL* %1, i64 %indvars.iv.next.i, !dbg !370
  %next.i = getelementptr inbounds %struct.DLL* %1, i64 %indvars.iv.next.i, i32 1, !dbg !370
  store %struct.DLL* %arrayidx.i, %struct.DLL** %next.i, align 8, !dbg !370, !tbaa !144
  %prev.i = getelementptr inbounds %struct.DLL* %1, i64 %indvars.iv.next55.i, i32 2, !dbg !371
  store %struct.DLL* %arrayidx4.i, %struct.DLL** %prev.i, align 8, !dbg !371, !tbaa !136
  %val11.i = getelementptr inbounds %struct.DLL* %arrayidx4.i, i64 0, i32 0, !dbg !372
  store i32 %.pre.i, i32* %val11.i, align 4, !dbg !372, !tbaa !149
  %lftr.wideiv = trunc i64 %indvars.iv.i180 to i32, !dbg !364
  %.in.1 = getelementptr inbounds %struct.DLL* %8, i64 0, i32 1, !dbg !373
  %9 = load %struct.DLL** %.in.1, align 8, !dbg !373
  %indvars.iv.next55.i.1 = add nuw nsw i64 %indvars.iv.next55.i, 1, !dbg !364
  %indvars.iv.next.i.1 = add nuw nsw i64 %indvars.iv.next.i, 1, !dbg !364
  %val.phi.trans.insert.i.1 = getelementptr inbounds %struct.DLL* %9, i64 0, i32 0, !dbg !343
  %.pre.i.1 = load i32* %val.phi.trans.insert.i.1, align 4, !dbg !374, !tbaa !149
  %arrayidx.i.1 = getelementptr inbounds %struct.DLL* %1, i64 %indvars.iv.next55.i.1, !dbg !369
  %arrayidx4.i.1 = getelementptr inbounds %struct.DLL* %1, i64 %indvars.iv.next.i.1, !dbg !370
  %next.i.1 = getelementptr inbounds %struct.DLL* %1, i64 %indvars.iv.next.i.1, i32 1, !dbg !370
  store %struct.DLL* %arrayidx.i.1, %struct.DLL** %next.i.1, align 8, !dbg !370, !tbaa !144
  %prev.i.1 = getelementptr inbounds %struct.DLL* %1, i64 %indvars.iv.next55.i.1, i32 2, !dbg !371
  store %struct.DLL* %arrayidx4.i.1, %struct.DLL** %prev.i.1, align 8, !dbg !371, !tbaa !136
  %val11.i.1 = getelementptr inbounds %struct.DLL* %arrayidx4.i.1, i64 0, i32 0, !dbg !372
  store i32 %.pre.i.1, i32* %val11.i.1, align 4, !dbg !372, !tbaa !149
  %lftr.wideiv.1 = trunc i64 %indvars.iv.next.i to i32, !dbg !364
  %exitcond.1 = icmp eq i32 %lftr.wideiv.1, %4, !dbg !364
  br i1 %exitcond.1, label %list_copy.exit.loopexit.unr-lcssa, label %for.body.for.body_crit_edge.i, !dbg !364

list_copy.exit.loopexit.unr-lcssa:                ; preds = %for.body.for.body_crit_edge.i
  br label %list_copy.exit.loopexit

list_copy.exit.loopexit:                          ; preds = %for.body.for.body_crit_edge.i.lr.ph.split, %list_copy.exit.loopexit.unr-lcssa
  br label %list_copy.exit

list_copy.exit:                                   ; preds = %list_copy.exit.loopexit, %for.body.lr.ph.i, %entry.list_copy.exit_crit_edge
  %val22.i.pre-phi = phi i32* [ %val22.i.pre, %entry.list_copy.exit_crit_edge ], [ %val11.i176, %for.body.lr.ph.i ], [ %val11.i176, %list_copy.exit.loopexit ], !dbg !368
  %next20.i.pre-phi = phi i8* [ %next20.i.pre, %entry.list_copy.exit_crit_edge ], [ %next.i174, %for.body.lr.ph.i ], [ %next.i174, %list_copy.exit.loopexit ], !dbg !365
  %idxprom14.i = sext i32 %0 to i64, !dbg !376
  %arrayidx15.i = getelementptr inbounds %struct.DLL* %1, i64 %idxprom14.i, !dbg !376
  %prev17.i = getelementptr inbounds i8* %call1.i, i64 16, !dbg !377
  %10 = bitcast i8* %prev17.i to %struct.DLL**, !dbg !377
  store %struct.DLL* %arrayidx15.i, %struct.DLL** %10, align 8, !dbg !377, !tbaa !136
  %next21.i = getelementptr inbounds %struct.DLL* %1, i64 %idxprom14.i, i32 1, !dbg !378
  %11 = bitcast %struct.DLL** %next21.i to i8**, !dbg !378
  store i8* %call1.i, i8** %11, align 8, !dbg !378, !tbaa !144
  tail call void @llvm.dbg.value(metadata %struct.DLL* %call, i64 0, metadata !379, metadata !132) #5, !dbg !381
  %prev.i.i = getelementptr inbounds %struct.DLL* %call, i64 0, i32 2, !dbg !382
  %12 = load %struct.DLL** %prev.i.i, align 8, !dbg !382, !tbaa !136
  %val23.i = getelementptr inbounds %struct.DLL* %12, i64 0, i32 0, !dbg !380
  %13 = load i32* %val23.i, align 4, !dbg !380, !tbaa !149
  %val26.i = getelementptr inbounds %struct.DLL* %arrayidx15.i, i64 0, i32 0, !dbg !383
  store i32 %13, i32* %val26.i, align 4, !dbg !383, !tbaa !149
  tail call void @llvm.dbg.value(metadata %struct.DLL* %1, i64 0, metadata !96, metadata !132), !dbg !384
  %call.i = tail call noalias i8* @malloc(i64 24) #5, !dbg !385
  %next.i92 = getelementptr inbounds i8* %call.i, i64 8, !dbg !387
  %14 = bitcast i8* %next.i92 to i8**, !dbg !387
  store i8* %call.i, i8** %14, align 8, !dbg !387, !tbaa !144
  %prev.i93 = getelementptr inbounds i8* %call.i, i64 16, !dbg !388
  %15 = bitcast i8* %prev.i93 to i8**, !dbg !388
  store i8* %call.i, i8** %15, align 8, !dbg !388, !tbaa !136
  %val.i = bitcast i8* %call.i to i32*, !dbg !389
  store i32 0, i32* %val.i, align 4, !dbg !389, !tbaa !149
  tail call void @llvm.dbg.value(metadata %struct.DLL* %1, i64 0, metadata !390, metadata !132), !dbg !391
  tail call void @llvm.dbg.value(metadata %struct.DLL* %call, i64 0, metadata !392, metadata !132), !dbg !393
  tail call void @llvm.dbg.value(metadata %struct.DLL* %1, i64 0, metadata !394, metadata !132), !dbg !395
  tail call void @llvm.dbg.value(metadata %struct.DLL* %call, i64 0, metadata !396, metadata !132), !dbg !397
  %16 = bitcast i8* %next20.i.pre-phi to %struct.DLL**, !dbg !365
  %17 = load %struct.DLL** %16, align 8, !dbg !365, !tbaa !144
  %cmp21.i = icmp eq %struct.DLL* %17, %1, !dbg !398
  %18 = load i32* %val22.i.pre-phi, align 4, !dbg !368, !tbaa !149
  %19 = load i32* %val.i.i, align 4, !dbg !399, !tbaa !149
  %cmp224.i = icmp ne i32 %18, %19, !dbg !368
  br i1 %cmp21.i, label %for.end.i, label %for.body.i94.preheader, !dbg !400

for.body.i94.preheader:                           ; preds = %list_copy.exit
  br label %for.body.i94, !dbg !401

for.body.i94:                                     ; preds = %for.body.i94.preheader, %for.inc.i
  %cmp226.i = phi i1 [ %cmp2.i, %for.inc.i ], [ %cmp224.i, %for.body.i94.preheader ], !dbg !366
  %20 = phi %struct.DLL* [ %22, %for.inc.i ], [ %17, %for.body.i94.preheader ], !dbg !366
  %yp.025.i = phi %struct.DLL* [ %21, %for.inc.i ], [ %call, %for.body.i94.preheader ], !dbg !366
  br i1 %cmp226.i, label %if.then.loopexit, label %for.inc.i, !dbg !401

for.inc.i:                                        ; preds = %for.body.i94
  %next4.i = getelementptr inbounds %struct.DLL* %yp.025.i, i64 0, i32 1, !dbg !402
  %21 = load %struct.DLL** %next4.i, align 8, !dbg !402, !tbaa !144
  tail call void @llvm.dbg.value(metadata %struct.DLL* %21, i64 0, metadata !396, metadata !132), !dbg !397
  %next.i95 = getelementptr inbounds %struct.DLL* %20, i64 0, i32 1, !dbg !365
  %22 = load %struct.DLL** %next.i95, align 8, !dbg !365, !tbaa !144
  %cmp.i = icmp eq %struct.DLL* %22, %1, !dbg !398
  %val.i96 = getelementptr inbounds %struct.DLL* %20, i64 0, i32 0, !dbg !368
  %23 = load i32* %val.i96, align 4, !dbg !368, !tbaa !149
  %val1.i = getelementptr inbounds %struct.DLL* %21, i64 0, i32 0, !dbg !399
  %24 = load i32* %val1.i, align 4, !dbg !399, !tbaa !149
  %cmp2.i = icmp ne i32 %23, %24, !dbg !368
  br i1 %cmp.i, label %for.end.i.loopexit, label %for.body.i94, !dbg !400

for.end.i.loopexit:                               ; preds = %for.inc.i
  %cmp2.i.lcssa = phi i1 [ %cmp2.i, %for.inc.i ]
  %.lcssa185 = phi %struct.DLL* [ %21, %for.inc.i ]
  br label %for.end.i

for.end.i:                                        ; preds = %for.end.i.loopexit, %list_copy.exit
  %cmp2.lcssa.i = phi i1 [ %cmp224.i, %list_copy.exit ], [ %cmp2.i.lcssa, %for.end.i.loopexit ], !dbg !366
  %yp.0.lcssa.i = phi %struct.DLL* [ %call, %list_copy.exit ], [ %.lcssa185, %for.end.i.loopexit ], !dbg !366
  br i1 %cmp2.lcssa.i, label %if.then, label %list_equal.exit, !dbg !403

list_equal.exit:                                  ; preds = %for.end.i
  %next10.i = getelementptr inbounds %struct.DLL* %yp.0.lcssa.i, i64 0, i32 1, !dbg !404
  %25 = load %struct.DLL** %next10.i, align 8, !dbg !404, !tbaa !144
  %cmp11.i = icmp eq %struct.DLL* %25, %call, !dbg !404
  br i1 %cmp11.i, label %while.cond.preheader, label %if.then, !dbg !405

while.cond.preheader:                             ; preds = %list_equal.exit
  tail call void @llvm.dbg.value(metadata %struct.DLL* %1, i64 0, metadata !406, metadata !132), !dbg !408
  tail call void @llvm.dbg.value(metadata %struct.DLL* %1, i64 0, metadata !409, metadata !132), !dbg !411
  %cmp.i164171 = icmp eq i32 %18, 0, !dbg !410
  br i1 %cmp.i164171, label %do.body.i.preheader, label %if.end.i161.lr.ph, !dbg !412

if.end.i161.lr.ph:                                ; preds = %while.cond.preheader
  %26 = bitcast i8* %prev.i93 to %struct.DLL**, !dbg !413
  br label %if.end.i161, !dbg !412

if.then.loopexit:                                 ; preds = %for.body.i94
  br label %if.then

if.then:                                          ; preds = %if.then.loopexit, %list_equal.exit, %for.end.i
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([26 x i8]* @str13, i64 0, i64 0)) #5, !dbg !416
  tail call void @exit(i32 1) #6, !dbg !418
  unreachable, !dbg !418

while.cond13.preheader:                           ; preds = %if.end.i161
  store i32 0, i32* %val22.i.pre-phi, align 4, !dbg !419, !tbaa !149
  store i32 %18, i32* %val.i, align 4, !dbg !420, !tbaa !149
  %cmp.i145169 = icmp eq i32 %18, 0, !dbg !421
  br i1 %cmp.i145169, label %do.body.i.preheader, label %if.end.i.lr.ph, !dbg !423

if.end.i.lr.ph:                                   ; preds = %while.cond13.preheader
  %27 = bitcast i8* %prev.i93 to %struct.DLL**, !dbg !424
  %xtraiter = and i32 %18, 1
  %lcmp.mod = icmp ne i32 %xtraiter, 0
  %lcmp.overflow = icmp eq i32 %18, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %if.end.i.prol, label %if.end.i.lr.ph.split

if.end.i.prol:                                    ; preds = %if.end.i.prol, %if.end.i.lr.ph
  %28 = phi i32 [ %18, %if.end.i.lr.ph ], [ %dec.i.prol, %if.end.i.prol ]
  %prol.iter = phi i32 [ %xtraiter, %if.end.i.lr.ph ], [ %prol.iter.sub, %if.end.i.prol ]
  %29 = load %struct.DLL** %27, align 8, !dbg !424, !tbaa !136
  tail call void @llvm.dbg.value(metadata %struct.DLL* %29, i64 0, metadata !427, metadata !132), !dbg !428
  %prev2.i.prol = getelementptr inbounds %struct.DLL* %29, i64 0, i32 2, !dbg !429
  %30 = load %struct.DLL** %prev2.i.prol, align 8, !dbg !429, !tbaa !136
  tail call void @llvm.dbg.value(metadata %struct.DLL* %30, i64 0, metadata !430, metadata !132), !dbg !431
  %next.i142.prol = getelementptr inbounds %struct.DLL* %30, i64 0, i32 1, !dbg !432
  %31 = bitcast %struct.DLL** %next.i142.prol to i8**, !dbg !432
  store i8* %call.i, i8** %31, align 8, !dbg !432, !tbaa !144
  store %struct.DLL* %30, %struct.DLL** %27, align 8, !dbg !433, !tbaa !136
  %dec.i.prol = add nsw i32 %28, -1, !dbg !434
  tail call void @llvm.dbg.value(metadata %struct.DLL* %1, i64 0, metadata !435, metadata !132), !dbg !437
  tail call void @llvm.dbg.value(metadata %struct.DLL* %29, i64 0, metadata !438, metadata !132), !dbg !439
  %32 = load %struct.DLL** %10, align 8, !dbg !440, !tbaa !136
  tail call void @llvm.dbg.value(metadata %struct.DLL* %32, i64 0, metadata !441, metadata !132), !dbg !442
  %next.i140.prol = getelementptr inbounds %struct.DLL* %32, i64 0, i32 1, !dbg !443
  store %struct.DLL* %29, %struct.DLL** %next.i140.prol, align 8, !dbg !443, !tbaa !144
  %next1.i.prol = getelementptr inbounds %struct.DLL* %29, i64 0, i32 1, !dbg !444
  %33 = bitcast %struct.DLL** %next1.i.prol to i8**, !dbg !444
  store i8* %call1.i, i8** %33, align 8, !dbg !444, !tbaa !144
  store %struct.DLL* %29, %struct.DLL** %10, align 8, !dbg !445, !tbaa !136
  store %struct.DLL* %32, %struct.DLL** %prev2.i.prol, align 8, !dbg !446, !tbaa !136
  %cmp.i145.prol = icmp eq i32 %dec.i.prol, 0, !dbg !421
  %prol.iter.sub = sub i32 %prol.iter, 1, !dbg !423
  %prol.iter.cmp = icmp ne i32 %prol.iter.sub, 0, !dbg !423
  br i1 %prol.iter.cmp, label %if.end.i.prol, label %if.end.i.lr.ph.split, !llvm.loop !447

if.end.i.lr.ph.split:                             ; preds = %if.end.i.prol, %if.end.i.lr.ph
  %.unr = phi i32 [ %18, %if.end.i.lr.ph ], [ %dec.i.prol, %if.end.i.prol ]
  %34 = icmp ult i32 %18, 2
  br i1 %34, label %while.cond13.do.body.i.preheader_crit_edge, label %if.end.i.lr.ph.split.split

if.end.i.lr.ph.split.split:                       ; preds = %if.end.i.lr.ph.split
  br label %if.end.i, !dbg !423

if.end.i161:                                      ; preds = %if.end.i161.if.end.i161_crit_edge, %if.end.i161.lr.ph
  %35 = phi %struct.DLL* [ %17, %if.end.i161.lr.ph ], [ %.pre, %if.end.i161.if.end.i161_crit_edge ]
  %36 = phi i32 [ %18, %if.end.i161.lr.ph ], [ %dec.i160, %if.end.i161.if.end.i161_crit_edge ]
  tail call void @llvm.dbg.value(metadata %struct.DLL* %1, i64 0, metadata !448, metadata !132), !dbg !450
  tail call void @llvm.dbg.value(metadata %struct.DLL* %1, i64 0, metadata !451, metadata !132), !dbg !453
  tail call void @llvm.dbg.value(metadata %struct.DLL* %1, i64 0, metadata !454, metadata !132), !dbg !456
  tail call void @llvm.dbg.value(metadata %struct.DLL* %35, i64 0, metadata !457, metadata !132), !dbg !458
  %next2.i = getelementptr inbounds %struct.DLL* %35, i64 0, i32 1, !dbg !459
  %37 = load %struct.DLL** %next2.i, align 8, !dbg !459, !tbaa !144
  store %struct.DLL* %37, %struct.DLL** %16, align 8, !dbg !460, !tbaa !144
  %38 = load %struct.DLL** %next2.i, align 8, !dbg !461, !tbaa !144
  %prev.i159 = getelementptr inbounds %struct.DLL* %38, i64 0, i32 2, !dbg !461
  %39 = bitcast %struct.DLL** %prev.i159 to i8**, !dbg !461
  store i8* %call1.i, i8** %39, align 8, !dbg !461, !tbaa !136
  %dec.i160 = add nsw i32 %36, -1, !dbg !462
  tail call void @llvm.dbg.value(metadata %struct.DLL* %35, i64 0, metadata !463, metadata !132), !dbg !464
  %40 = load %struct.DLL** %26, align 8, !dbg !413, !tbaa !136
  tail call void @llvm.dbg.value(metadata %struct.DLL* %40, i64 0, metadata !465, metadata !132), !dbg !466
  %next.i151 = getelementptr inbounds %struct.DLL* %40, i64 0, i32 1, !dbg !467
  store %struct.DLL* %35, %struct.DLL** %next.i151, align 8, !dbg !467, !tbaa !144
  %41 = bitcast %struct.DLL** %next2.i to i8**, !dbg !468
  store i8* %call.i, i8** %41, align 8, !dbg !468, !tbaa !144
  store %struct.DLL* %35, %struct.DLL** %26, align 8, !dbg !469, !tbaa !136
  %prev3.i153 = getelementptr inbounds %struct.DLL* %35, i64 0, i32 2, !dbg !470
  store %struct.DLL* %40, %struct.DLL** %prev3.i153, align 8, !dbg !470, !tbaa !136
  tail call void @llvm.dbg.value(metadata %struct.DLL* %1, i64 0, metadata !406, metadata !132), !dbg !408
  tail call void @llvm.dbg.value(metadata %struct.DLL* %1, i64 0, metadata !409, metadata !132), !dbg !411
  %cmp.i164 = icmp eq i32 %dec.i160, 0, !dbg !410
  br i1 %cmp.i164, label %while.cond13.preheader, label %if.end.i161.if.end.i161_crit_edge, !dbg !412

if.end.i161.if.end.i161_crit_edge:                ; preds = %if.end.i161
  %.pre = load %struct.DLL** %16, align 8, !dbg !471, !tbaa !144
  br label %if.end.i161, !dbg !412

while.cond13.do.body.i.preheader_crit_edge.unr-lcssa: ; preds = %if.end.i
  br label %while.cond13.do.body.i.preheader_crit_edge

while.cond13.do.body.i.preheader_crit_edge:       ; preds = %if.end.i.lr.ph.split, %while.cond13.do.body.i.preheader_crit_edge.unr-lcssa
  store i32 0, i32* %val.i, align 4, !dbg !472, !tbaa !149
  store i32 %18, i32* %val22.i.pre-phi, align 4, !dbg !473, !tbaa !149
  br label %do.body.i.preheader, !dbg !423

do.body.i.preheader:                              ; preds = %while.cond.preheader, %while.cond13.do.body.i.preheader_crit_edge, %while.cond13.preheader
  %42 = phi i32 [ %18, %while.cond13.do.body.i.preheader_crit_edge ], [ 0, %while.cond13.preheader ], [ 0, %while.cond.preheader ]
  br label %do.body.i, !dbg !474

if.end.i:                                         ; preds = %if.end.i, %if.end.i.lr.ph.split.split
  %43 = phi i32 [ %.unr, %if.end.i.lr.ph.split.split ], [ %dec.i.1, %if.end.i ]
  %44 = load %struct.DLL** %27, align 8, !dbg !424, !tbaa !136
  tail call void @llvm.dbg.value(metadata %struct.DLL* %44, i64 0, metadata !427, metadata !132), !dbg !428
  %prev2.i = getelementptr inbounds %struct.DLL* %44, i64 0, i32 2, !dbg !429
  %45 = load %struct.DLL** %prev2.i, align 8, !dbg !429, !tbaa !136
  tail call void @llvm.dbg.value(metadata %struct.DLL* %45, i64 0, metadata !430, metadata !132), !dbg !431
  %next.i142 = getelementptr inbounds %struct.DLL* %45, i64 0, i32 1, !dbg !432
  %46 = bitcast %struct.DLL** %next.i142 to i8**, !dbg !432
  store i8* %call.i, i8** %46, align 8, !dbg !432, !tbaa !144
  store %struct.DLL* %45, %struct.DLL** %27, align 8, !dbg !433, !tbaa !136
  %dec.i = add nsw i32 %43, -1, !dbg !434
  tail call void @llvm.dbg.value(metadata %struct.DLL* %1, i64 0, metadata !435, metadata !132), !dbg !437
  tail call void @llvm.dbg.value(metadata %struct.DLL* %44, i64 0, metadata !438, metadata !132), !dbg !439
  %47 = load %struct.DLL** %10, align 8, !dbg !440, !tbaa !136
  tail call void @llvm.dbg.value(metadata %struct.DLL* %47, i64 0, metadata !441, metadata !132), !dbg !442
  %next.i140 = getelementptr inbounds %struct.DLL* %47, i64 0, i32 1, !dbg !443
  store %struct.DLL* %44, %struct.DLL** %next.i140, align 8, !dbg !443, !tbaa !144
  %next1.i = getelementptr inbounds %struct.DLL* %44, i64 0, i32 1, !dbg !444
  %48 = bitcast %struct.DLL** %next1.i to i8**, !dbg !444
  store i8* %call1.i, i8** %48, align 8, !dbg !444, !tbaa !144
  store %struct.DLL* %44, %struct.DLL** %10, align 8, !dbg !445, !tbaa !136
  store %struct.DLL* %47, %struct.DLL** %prev2.i, align 8, !dbg !446, !tbaa !136
  %49 = load %struct.DLL** %27, align 8, !dbg !424, !tbaa !136
  tail call void @llvm.dbg.value(metadata %struct.DLL* %44, i64 0, metadata !427, metadata !132), !dbg !428
  %prev2.i.1 = getelementptr inbounds %struct.DLL* %49, i64 0, i32 2, !dbg !429
  %50 = load %struct.DLL** %prev2.i.1, align 8, !dbg !429, !tbaa !136
  tail call void @llvm.dbg.value(metadata %struct.DLL* %45, i64 0, metadata !430, metadata !132), !dbg !431
  %next.i142.1 = getelementptr inbounds %struct.DLL* %50, i64 0, i32 1, !dbg !432
  %51 = bitcast %struct.DLL** %next.i142.1 to i8**, !dbg !432
  store i8* %call.i, i8** %51, align 8, !dbg !432, !tbaa !144
  store %struct.DLL* %50, %struct.DLL** %27, align 8, !dbg !433, !tbaa !136
  %dec.i.1 = add nsw i32 %dec.i, -1, !dbg !434
  tail call void @llvm.dbg.value(metadata %struct.DLL* %1, i64 0, metadata !435, metadata !132), !dbg !437
  tail call void @llvm.dbg.value(metadata %struct.DLL* %44, i64 0, metadata !438, metadata !132), !dbg !439
  %52 = load %struct.DLL** %10, align 8, !dbg !440, !tbaa !136
  tail call void @llvm.dbg.value(metadata %struct.DLL* %47, i64 0, metadata !441, metadata !132), !dbg !442
  %next.i140.1 = getelementptr inbounds %struct.DLL* %52, i64 0, i32 1, !dbg !443
  store %struct.DLL* %49, %struct.DLL** %next.i140.1, align 8, !dbg !443, !tbaa !144
  %next1.i.1 = getelementptr inbounds %struct.DLL* %49, i64 0, i32 1, !dbg !444
  %53 = bitcast %struct.DLL** %next1.i.1 to i8**, !dbg !444
  store i8* %call1.i, i8** %53, align 8, !dbg !444, !tbaa !144
  store %struct.DLL* %49, %struct.DLL** %10, align 8, !dbg !445, !tbaa !136
  store %struct.DLL* %52, %struct.DLL** %prev2.i.1, align 8, !dbg !446, !tbaa !136
  %cmp.i145.1 = icmp eq i32 %dec.i.1, 0, !dbg !421
  br i1 %cmp.i145.1, label %while.cond13.do.body.i.preheader_crit_edge.unr-lcssa, label %if.end.i, !dbg !423

do.body.i:                                        ; preds = %do.body.i.preheader, %do.body.i
  %p.0.i = phi %struct.DLL* [ %54, %do.body.i ], [ %call, %do.body.i.preheader ], !dbg !475
  %next.i133 = getelementptr inbounds %struct.DLL* %p.0.i, i64 0, i32 1, !dbg !474
  %54 = load %struct.DLL** %next.i133, align 8, !dbg !474, !tbaa !144
  tail call void @llvm.dbg.value(metadata %struct.DLL* %54, i64 0, metadata !476, metadata !132), !dbg !477
  %prev.i134 = getelementptr inbounds %struct.DLL* %p.0.i, i64 0, i32 2, !dbg !478
  %55 = load %struct.DLL** %prev.i134, align 8, !dbg !478, !tbaa !136
  store %struct.DLL* %55, %struct.DLL** %next.i133, align 8, !dbg !479, !tbaa !144
  store %struct.DLL* %54, %struct.DLL** %prev.i134, align 8, !dbg !480, !tbaa !136
  tail call void @llvm.dbg.value(metadata %struct.DLL* %54, i64 0, metadata !481, metadata !132), !dbg !482
  %cmp.i135 = icmp eq %struct.DLL* %54, %call, !dbg !483
  br i1 %cmp.i135, label %list_reverse.exit, label %do.body.i, !dbg !484

list_reverse.exit:                                ; preds = %do.body.i
  tail call void @llvm.dbg.value(metadata %struct.DLL* %call, i64 0, metadata !485, metadata !132), !dbg !488
  %next.i132 = getelementptr inbounds %struct.DLL* %call, i64 0, i32 1, !dbg !489
  %56 = load %struct.DLL** %next.i132, align 8, !dbg !489, !tbaa !144
  %val = getelementptr inbounds %struct.DLL* %56, i64 0, i32 0, !dbg !486
  %57 = load i32* %val, align 4, !dbg !486, !tbaa !149
  %cmp = icmp eq i32 %57, 100, !dbg !486
  br i1 %cmp, label %if.end30, label %if.then26, !dbg !490

if.then26:                                        ; preds = %list_reverse.exit
  tail call void @llvm.dbg.value(metadata %struct.DLL* %call, i64 0, metadata !491, metadata !132), !dbg !494
  %call29 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([42 x i8]* @.str7, i64 0, i64 0), i32 100, i32 %57) #5, !dbg !495
  tail call void @exit(i32 1) #6, !dbg !496
  unreachable, !dbg !496

if.end30:                                         ; preds = %list_reverse.exit
  tail call void @llvm.dbg.value(metadata %struct.DLL* %call, i64 0, metadata !497, metadata !132), !dbg !500
  %58 = load %struct.DLL** %prev.i.i, align 8, !dbg !501, !tbaa !136
  %val32 = getelementptr inbounds %struct.DLL* %58, i64 0, i32 0, !dbg !498
  %59 = load i32* %val32, align 4, !dbg !498, !tbaa !149
  %cmp33 = icmp eq i32 %59, 1, !dbg !498
  br i1 %cmp33, label %if.end38, label %if.then34, !dbg !502

if.then34:                                        ; preds = %if.end30
  tail call void @llvm.dbg.value(metadata %struct.DLL* %call, i64 0, metadata !503, metadata !132), !dbg !506
  %call37 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str8, i64 0, i64 0), i32 100, i32 %59) #5, !dbg !507
  tail call void @exit(i32 1) #6, !dbg !508
  unreachable, !dbg !508

if.end38:                                         ; preds = %if.end30
  tail call void @llvm.dbg.value(metadata %struct.DLL* %1, i64 0, metadata !509, metadata !132), !dbg !512
  %60 = load %struct.DLL** %16, align 8, !dbg !513, !tbaa !144
  %val40 = getelementptr inbounds %struct.DLL* %60, i64 0, i32 0, !dbg !510
  %61 = load i32* %val40, align 4, !dbg !510, !tbaa !149
  %cmp41 = icmp eq i32 %61, 100, !dbg !510
  br i1 %cmp41, label %if.end46, label %if.then42, !dbg !514

if.then42:                                        ; preds = %if.end38
  tail call void @llvm.dbg.value(metadata %struct.DLL* %1, i64 0, metadata !515, metadata !132), !dbg !518
  %call45 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([42 x i8]* @.str9, i64 0, i64 0), i32 100, i32 %61) #5, !dbg !519
  tail call void @exit(i32 1) #6, !dbg !520
  unreachable, !dbg !520

if.end46:                                         ; preds = %if.end38
  tail call void @llvm.dbg.value(metadata %struct.DLL* %1, i64 0, metadata !521, metadata !132), !dbg !524
  %62 = load %struct.DLL** %10, align 8, !dbg !525, !tbaa !136
  %val48 = getelementptr inbounds %struct.DLL* %62, i64 0, i32 0, !dbg !522
  %63 = load i32* %val48, align 4, !dbg !522, !tbaa !149
  %cmp49 = icmp eq i32 %63, 1, !dbg !522
  br i1 %cmp49, label %if.end54, label %if.then50, !dbg !526

if.then50:                                        ; preds = %if.end46
  tail call void @llvm.dbg.value(metadata %struct.DLL* %1, i64 0, metadata !527, metadata !132), !dbg !530
  %call53 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str8, i64 0, i64 0), i32 100, i32 %63) #5, !dbg !531
  tail call void @exit(i32 1) #6, !dbg !532
  unreachable, !dbg !532

if.end54:                                         ; preds = %if.end46
  tail call void @llvm.dbg.value(metadata %struct.DLL* %call, i64 0, metadata !533, metadata !132), !dbg !536
  %64 = load i32* %val.i.i, align 4, !dbg !537, !tbaa !149
  %cmp56 = icmp eq i32 %64, 100, !dbg !534
  br i1 %cmp56, label %if.end60, label %if.then57, !dbg !538

if.then57:                                        ; preds = %if.end54
  tail call void @llvm.dbg.value(metadata %struct.DLL* %call, i64 0, metadata !539, metadata !132), !dbg !542
  %call59 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([35 x i8]* @.str10, i64 0, i64 0), i32 100, i32 %64) #5, !dbg !543
  tail call void @exit(i32 1) #6, !dbg !544
  unreachable, !dbg !544

if.end60:                                         ; preds = %if.end54
  tail call void @llvm.dbg.value(metadata %struct.DLL* %call, i64 0, metadata !545, metadata !132), !dbg !548
  tail call void @llvm.dbg.value(metadata %struct.DLL* %1, i64 0, metadata !549, metadata !132), !dbg !550
  tail call void @llvm.dbg.value(metadata %struct.DLL* %call, i64 0, metadata !551, metadata !132), !dbg !552
  tail call void @llvm.dbg.value(metadata %struct.DLL* %1, i64 0, metadata !553, metadata !132), !dbg !554
  %cmp21.i100 = icmp eq %struct.DLL* %56, %call, !dbg !555
  %cmp224.i103 = icmp ne i32 %42, 100, !dbg !556
  br i1 %cmp21.i100, label %for.end.i116, label %for.body.i106.preheader, !dbg !557

for.body.i106.preheader:                          ; preds = %if.end60
  br label %for.body.i106, !dbg !558

for.body.i106:                                    ; preds = %for.body.i106.preheader, %for.inc.i113
  %cmp226.i104 = phi i1 [ %cmp2.i112, %for.inc.i113 ], [ %cmp224.i103, %for.body.i106.preheader ], !dbg !546
  %65 = phi %struct.DLL* [ %67, %for.inc.i113 ], [ %56, %for.body.i106.preheader ], !dbg !546
  %yp.025.i105 = phi %struct.DLL* [ %66, %for.inc.i113 ], [ %1, %for.body.i106.preheader ], !dbg !546
  br i1 %cmp226.i104, label %if.then63.loopexit, label %for.inc.i113, !dbg !558

for.inc.i113:                                     ; preds = %for.body.i106
  %next4.i107 = getelementptr inbounds %struct.DLL* %yp.025.i105, i64 0, i32 1, !dbg !559
  %66 = load %struct.DLL** %next4.i107, align 8, !dbg !559, !tbaa !144
  tail call void @llvm.dbg.value(metadata %struct.DLL* %66, i64 0, metadata !553, metadata !132), !dbg !554
  %next.i108 = getelementptr inbounds %struct.DLL* %65, i64 0, i32 1, !dbg !560
  %67 = load %struct.DLL** %next.i108, align 8, !dbg !560, !tbaa !144
  %cmp.i109 = icmp eq %struct.DLL* %67, %call, !dbg !555
  %val.i110 = getelementptr inbounds %struct.DLL* %65, i64 0, i32 0, !dbg !556
  %68 = load i32* %val.i110, align 4, !dbg !556, !tbaa !149
  %val1.i111 = getelementptr inbounds %struct.DLL* %66, i64 0, i32 0, !dbg !561
  %69 = load i32* %val1.i111, align 4, !dbg !561, !tbaa !149
  %cmp2.i112 = icmp ne i32 %68, %69, !dbg !556
  br i1 %cmp.i109, label %for.end.i116.loopexit, label %for.body.i106, !dbg !557

for.end.i116.loopexit:                            ; preds = %for.inc.i113
  %cmp2.i112.lcssa = phi i1 [ %cmp2.i112, %for.inc.i113 ]
  %.lcssa = phi %struct.DLL* [ %66, %for.inc.i113 ]
  br label %for.end.i116

for.end.i116:                                     ; preds = %for.end.i116.loopexit, %if.end60
  %cmp2.lcssa.i114 = phi i1 [ %cmp224.i103, %if.end60 ], [ %cmp2.i112.lcssa, %for.end.i116.loopexit ], !dbg !546
  %yp.0.lcssa.i115 = phi %struct.DLL* [ %1, %if.end60 ], [ %.lcssa, %for.end.i116.loopexit ], !dbg !546
  br i1 %cmp2.lcssa.i114, label %if.then63, label %list_equal.exit122, !dbg !562

list_equal.exit122:                               ; preds = %for.end.i116
  %next10.i117 = getelementptr inbounds %struct.DLL* %yp.0.lcssa.i115, i64 0, i32 1, !dbg !563
  %70 = load %struct.DLL** %next10.i117, align 8, !dbg !563, !tbaa !144
  %cmp11.i118 = icmp eq %struct.DLL* %70, %1, !dbg !563
  br i1 %cmp11.i118, label %if.end65, label %if.then63, !dbg !564

if.then63.loopexit:                               ; preds = %for.body.i106
  br label %if.then63

if.then63:                                        ; preds = %if.then63.loopexit, %list_equal.exit122, %for.end.i116
  %puts91 = tail call i32 @puts(i8* getelementptr inbounds ([26 x i8]* @str16, i64 0, i64 0)) #5, !dbg !565
  tail call void @exit(i32 1) #6, !dbg !567
  unreachable, !dbg !567

if.end65:                                         ; preds = %list_equal.exit122
  tail call void @llvm.dbg.value(metadata %struct.DLL* %call, i64 0, metadata !568, metadata !132), !dbg !570
  tail call void @llvm.dbg.value(metadata i32 %64, i64 0, metadata !94, metadata !132), !dbg !339
  %71 = bitcast %struct.DLL* %call to i8*, !dbg !571
  tail call void @free(i8* %71) #5, !dbg !572
  tail call void @free(i8* %call1.i) #5, !dbg !573
  tail call void @free(i8* %call.i) #5, !dbg !574
  ret i32 100, !dbg !575
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

; Function Attrs: nounwind
declare void @free(i8* nocapture) #2

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !102, metadata !132), !dbg !576
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !103, metadata !132), !dbg !577
  %cmp = icmp eq i32 %argc, 2, !dbg !578
  br i1 %cmp, label %while.cond.preheader, label %while.body.preheader, !dbg !579

while.cond.preheader:                             ; preds = %entry
  %arrayidx = getelementptr inbounds i8** %argv, i64 1, !dbg !580
  %0 = load i8** %arrayidx, align 8, !dbg !580, !tbaa !582
  tail call void @llvm.dbg.value(metadata i8* %0, i64 0, metadata !583, metadata !132) #5, !dbg !585
  %call.i = tail call i64 @strtol(i8* nocapture %0, i8** null, i32 10) #5, !dbg !586
  %conv.i = trunc i64 %call.i to i32, !dbg !587
  tail call void @llvm.dbg.value(metadata i32 %dec, i64 0, metadata !104, metadata !132), !dbg !588
  %tobool3 = icmp eq i32 %conv.i, 0, !dbg !589
  br i1 %tobool3, label %while.end, label %while.body.preheader, !dbg !589

while.body.preheader:                             ; preds = %while.cond.preheader, %entry
  %n.04.ph = phi i32 [ %conv.i, %while.cond.preheader ], [ 3000000, %entry ]
  br label %while.body, !dbg !590

while.body:                                       ; preds = %while.body.preheader, %while.body
  %n.04 = phi i32 [ %dec, %while.body ], [ %n.04.ph, %while.body.preheader ]
  %dec = add nsw i32 %n.04, -1, !dbg !590
  %call1 = tail call i32 @test_lists(), !dbg !592
  tail call void @llvm.dbg.value(metadata i32 %call1, i64 0, metadata !105, metadata !132), !dbg !594
  tail call void @llvm.dbg.value(metadata i32 %dec, i64 0, metadata !104, metadata !132), !dbg !588
  %tobool = icmp eq i32 %dec, 0, !dbg !589
  br i1 %tobool, label %while.end.loopexit, label %while.body, !dbg !589

while.end.loopexit:                               ; preds = %while.body
  %call1.lcssa = phi i32 [ %call1, %while.body ]
  br label %while.end

while.end:                                        ; preds = %while.end.loopexit, %while.cond.preheader
  %result.0.lcssa = phi i32 [ 0, %while.cond.preheader ], [ %call1.lcssa, %while.end.loopexit ]
  %call2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str12, i64 0, i64 0), i32 %result.0.lcssa) #5, !dbg !595
  ret i32 0, !dbg !596
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
!152 = !{!"0x101\00head\0016777238\000", !126, !19, !4, !153} ; [ DW_TAG_arg_variable ] [head] [line 22]
!153 = !MDLocation(line: 37, column: 7, scope: !154)
!154 = !{!"0xb\0037\007\000", !1, !26}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!155 = !MDLocation(line: 22, column: 28, scope: !126, inlinedAt: !153)
!156 = !{!"0x101\00head\0016777237\000", !121, !19, !4, !157} ; [ DW_TAG_arg_variable ] [head] [line 21]
!157 = !MDLocation(line: 22, column: 43, scope: !126, inlinedAt: !153)
!158 = !MDLocation(line: 21, column: 29, scope: !121, inlinedAt: !157)
!159 = !MDLocation(line: 21, column: 44, scope: !121, inlinedAt: !157)
!160 = !MDLocation(line: 37, column: 7, scope: !26)
!161 = !MDLocation(line: 38, column: 10, scope: !26)
!162 = !MDLocation(line: 36, column: 15, scope: !26)
!163 = !MDLocation(line: 39, column: 10, scope: !26)
!164 = !MDLocation(line: 36, column: 8, scope: !26)
!165 = !MDLocation(line: 40, column: 3, scope: !26)
!166 = !MDLocation(line: 41, column: 3, scope: !26)
!167 = !MDLocation(line: 42, column: 3, scope: !26)
!168 = !MDLocation(line: 43, column: 3, scope: !26)
!169 = !MDLocation(line: 44, column: 1, scope: !26)
!170 = !MDLocation(line: 46, column: 26, scope: !33)
!171 = !MDLocation(line: 46, column: 37, scope: !33)
!172 = !MDLocation(line: 47, column: 15, scope: !33)
!173 = !MDLocation(line: 47, column: 8, scope: !33)
!174 = !MDLocation(line: 48, column: 3, scope: !33)
!175 = !MDLocation(line: 49, column: 3, scope: !33)
!176 = !MDLocation(line: 50, column: 3, scope: !33)
!177 = !MDLocation(line: 51, column: 3, scope: !33)
!178 = !MDLocation(line: 52, column: 3, scope: !33)
!179 = !MDLocation(line: 53, column: 1, scope: !33)
!180 = !MDLocation(line: 55, column: 25, scope: !38)
!181 = !{!"0x101\00head\0016777238\000", !126, !19, !4, !182} ; [ DW_TAG_arg_variable ] [head] [line 22]
!182 = !MDLocation(line: 57, column: 7, scope: !183)
!183 = !{!"0xb\0057\007\001", !1, !38}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!184 = !MDLocation(line: 22, column: 28, scope: !126, inlinedAt: !182)
!185 = !{!"0x101\00head\0016777237\000", !121, !19, !4, !186} ; [ DW_TAG_arg_variable ] [head] [line 21]
!186 = !MDLocation(line: 22, column: 43, scope: !126, inlinedAt: !182)
!187 = !MDLocation(line: 21, column: 29, scope: !121, inlinedAt: !186)
!188 = !MDLocation(line: 21, column: 44, scope: !121, inlinedAt: !186)
!189 = !MDLocation(line: 57, column: 7, scope: !38)
!190 = !MDLocation(line: 58, column: 10, scope: !38)
!191 = !MDLocation(line: 56, column: 8, scope: !38)
!192 = !MDLocation(line: 59, column: 16, scope: !38)
!193 = !MDLocation(line: 59, column: 3, scope: !38)
!194 = !MDLocation(line: 60, column: 3, scope: !38)
!195 = !MDLocation(line: 61, column: 3, scope: !38)
!196 = !MDLocation(line: 62, column: 3, scope: !38)
!197 = !MDLocation(line: 63, column: 1, scope: !38)
!198 = !MDLocation(line: 65, column: 21, scope: !42)
!199 = !MDLocation(line: 65, column: 29, scope: !42)
!200 = !MDLocation(line: 66, column: 8, scope: !42)
!201 = !MDLocation(line: 66, column: 13, scope: !42)
!202 = !MDLocation(line: 68, column: 20, scope: !203)
!203 = !{!"0xb\002", !1, !204}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!204 = !{!"0xb\001", !1, !205}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!205 = !{!"0xb\0068\003\003", !1, !206}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!206 = !{!"0xb\0068\003\002", !1, !42}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!207 = !MDLocation(line: 68, column: 20, scope: !205)
!208 = !MDLocation(line: 69, column: 9, scope: !209)
!209 = !{!"0xb\0069\009\005", !1, !210}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!210 = !{!"0xb\0068\0061\004", !1, !205}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!211 = !MDLocation(line: 69, column: 20, scope: !209)
!212 = !MDLocation(line: 68, column: 3, scope: !206)
!213 = !MDLocation(line: 69, column: 9, scope: !210)
!214 = !MDLocation(line: 68, column: 51, scope: !205)
!215 = !MDLocation(line: 71, column: 7, scope: !42)
!216 = !MDLocation(line: 72, column: 10, scope: !42)
!217 = !MDLocation(line: 72, column: 3, scope: !42)
!218 = !MDLocation(line: 73, column: 1, scope: !42)
!219 = !MDLocation(line: 75, column: 23, scope: !50)
!220 = !MDLocation(line: 75, column: 33, scope: !50)
!221 = !MDLocation(line: 76, column: 21, scope: !50)
!222 = !MDLocation(line: 76, column: 13, scope: !50)
!223 = !MDLocation(line: 77, column: 7, scope: !50)
!224 = !MDLocation(line: 78, column: 3, scope: !50)
!225 = !{!"0x101\00head\0016777237\000", !121, !19, !4, !226} ; [ DW_TAG_arg_variable ] [head] [line 21]
!226 = !MDLocation(line: 79, column: 26, scope: !50)
!227 = !MDLocation(line: 21, column: 29, scope: !121, inlinedAt: !226)
!228 = !MDLocation(line: 21, column: 44, scope: !121, inlinedAt: !226)
!229 = !MDLocation(line: 79, column: 3, scope: !50)
!230 = !MDLocation(line: 80, column: 11, scope: !231)
!231 = !{!"0xb\0080\003\007", !1, !50}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!232 = !MDLocation(line: 80, column: 20, scope: !233)
!233 = !{!"0xb\002", !1, !234}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!234 = !{!"0xb\001", !1, !235}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!235 = !{!"0xb\0080\003\008", !1, !231}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!236 = !MDLocation(line: 80, column: 20, scope: !235)
!237 = !MDLocation(line: 80, column: 3, scope: !231)
!238 = !MDLocation(line: 81, column: 44, scope: !239)
!239 = !{!"0xb\0080\0052\009", !1, !235}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!240 = !MDLocation(line: 82, column: 12, scope: !239)
!241 = !MDLocation(line: 82, column: 21, scope: !239)
!242 = !MDLocation(line: 82, column: 36, scope: !239)
!243 = !MDLocation(line: 81, column: 5, scope: !239)
!244 = !MDLocation(line: 84, column: 3, scope: !50)
!245 = !MDLocation(line: 85, column: 45, scope: !50)
!246 = !MDLocation(line: 85, column: 3, scope: !50)
!247 = !MDLocation(line: 86, column: 1, scope: !50)
!248 = !MDLocation(line: 89, column: 19, scope: !59)
!249 = !MDLocation(line: 89, column: 12, scope: !59)
!250 = !MDLocation(line: 89, column: 8, scope: !59)
!251 = !MDLocation(line: 90, column: 3, scope: !59)
!252 = !MDLocation(line: 91, column: 3, scope: !59)
!253 = !MDLocation(line: 92, column: 3, scope: !59)
!254 = !MDLocation(line: 93, column: 3, scope: !59)
!255 = !MDLocation(line: 97, column: 24, scope: !64)
!256 = !MDLocation(line: 97, column: 34, scope: !64)
!257 = !MDLocation(line: 100, column: 7, scope: !258)
!258 = !{!"0xb\00100\007\0010", !1, !64}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!259 = !MDLocation(line: 98, column: 13, scope: !64)
!260 = !MDLocation(line: 100, column: 7, scope: !64)
!261 = !MDLocation(line: 103, column: 10, scope: !64)
!262 = !MDLocation(line: 98, column: 7, scope: !64)
!263 = !MDLocation(line: 104, column: 22, scope: !64)
!264 = !MDLocation(line: 104, column: 21, scope: !64)
!265 = !MDLocation(line: 104, column: 14, scope: !64)
!266 = !MDLocation(line: 104, column: 7, scope: !64)
!267 = !MDLocation(line: 99, column: 8, scope: !64)
!268 = !MDLocation(line: 105, column: 3, scope: !64)
!269 = !MDLocation(line: 98, column: 18, scope: !64)
!270 = !MDLocation(line: 98, column: 21, scope: !64)
!271 = !MDLocation(line: 106, column: 18, scope: !272)
!272 = !{!"0xb\00106\003\0013", !1, !273}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!273 = !{!"0xb\00106\003\0012", !1, !64}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!274 = !MDLocation(line: 106, column: 3, scope: !273)
!275 = !MDLocation(line: 107, column: 17, scope: !276)
!276 = !{!"0xb\00106\0036\0014", !1, !272}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!277 = !MDLocation(line: 107, column: 5, scope: !276)
!278 = !MDLocation(line: 108, column: 20, scope: !276)
!279 = !MDLocation(line: 108, column: 17, scope: !276)
!280 = !MDLocation(line: 108, column: 5, scope: !276)
!281 = !MDLocation(line: 109, column: 16, scope: !276)
!282 = !MDLocation(line: 109, column: 5, scope: !276)
!283 = distinct !{!283, !284}
!284 = !{!"llvm.loop.unroll.disable"}
!285 = !MDLocation(line: 111, column: 15, scope: !64)
!286 = !MDLocation(line: 111, column: 3, scope: !64)
!287 = !MDLocation(line: 112, column: 3, scope: !64)
!288 = !MDLocation(line: 113, column: 18, scope: !64)
!289 = !MDLocation(line: 113, column: 3, scope: !64)
!290 = !MDLocation(line: 114, column: 3, scope: !64)
!291 = !MDLocation(line: 115, column: 3, scope: !64)
!292 = !MDLocation(line: 116, column: 3, scope: !64)
!293 = !MDLocation(line: 118, column: 21, scope: !75)
!294 = !{!"0x101\00head\0016777237\000", !121, !19, !4, !295} ; [ DW_TAG_arg_variable ] [head] [line 21]
!295 = !MDLocation(line: 119, column: 20, scope: !75)
!296 = !MDLocation(line: 21, column: 29, scope: !121, inlinedAt: !295)
!297 = !MDLocation(line: 21, column: 44, scope: !121, inlinedAt: !295)
!298 = !MDLocation(line: 119, column: 13, scope: !75)
!299 = !MDLocation(line: 120, column: 32, scope: !75)
!300 = !MDLocation(line: 120, column: 31, scope: !75)
!301 = !MDLocation(line: 120, column: 24, scope: !75)
!302 = !MDLocation(line: 120, column: 17, scope: !75)
!303 = !MDLocation(line: 120, column: 13, scope: !75)
!304 = !MDLocation(line: 119, column: 7, scope: !75)
!305 = !MDLocation(line: 119, column: 10, scope: !75)
!306 = !MDLocation(line: 120, column: 8, scope: !75)
!307 = !MDLocation(line: 121, column: 24, scope: !308)
!308 = !{!"0xb\00121\003\0016", !1, !309}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!309 = !{!"0xb\00121\003\0015", !1, !75}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!310 = !MDLocation(line: 121, column: 3, scope: !309)
!311 = !MDLocation(line: 122, column: 17, scope: !312)
!312 = !{!"0xb\00121\0055\0017", !1, !308}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!313 = !MDLocation(line: 122, column: 5, scope: !312)
!314 = !MDLocation(line: 123, column: 5, scope: !312)
!315 = !MDLocation(line: 124, column: 5, scope: !312)
!316 = !MDLocation(line: 121, column: 45, scope: !308)
!317 = !MDLocation(line: 124, column: 16, scope: !312)
!318 = !MDLocation(line: 126, column: 15, scope: !75)
!319 = !MDLocation(line: 126, column: 3, scope: !75)
!320 = !MDLocation(line: 127, column: 3, scope: !75)
!321 = !{!"0x101\00head\0016777240\000", !118, !19, !4, !322} ; [ DW_TAG_arg_variable ] [head] [line 24]
!322 = !MDLocation(line: 128, column: 17, scope: !75)
!323 = !MDLocation(line: 24, column: 28, scope: !118, inlinedAt: !322)
!324 = !MDLocation(line: 24, column: 43, scope: !118, inlinedAt: !322)
!325 = !MDLocation(line: 128, column: 3, scope: !75)
!326 = !MDLocation(line: 129, column: 3, scope: !75)
!327 = !MDLocation(line: 132, column: 25, scope: !83)
!328 = !MDLocation(line: 133, column: 14, scope: !83)
!329 = !MDLocation(line: 134, column: 3, scope: !83)
!330 = !MDLocation(line: 135, column: 11, scope: !331)
!331 = !{!"0xb\00134\006\0018", !1, !83}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!332 = !MDLocation(line: 133, column: 8, scope: !83)
!333 = !MDLocation(line: 136, column: 15, scope: !331)
!334 = !MDLocation(line: 136, column: 5, scope: !331)
!335 = !MDLocation(line: 137, column: 5, scope: !331)
!336 = !MDLocation(line: 139, column: 12, scope: !83)
!337 = !MDLocation(line: 139, column: 3, scope: !331)
!338 = !MDLocation(line: 140, column: 1, scope: !83)
!339 = !MDLocation(line: 143, column: 7, scope: !90)
!340 = !MDLocation(line: 145, column: 14, scope: !90)
!341 = !MDLocation(line: 145, column: 8, scope: !90)
!342 = !{!"0x101\00x\0016777334\000", !75, !19, !4, !343} ; [ DW_TAG_arg_variable ] [x] [line 118]
!343 = !MDLocation(line: 147, column: 14, scope: !90)
!344 = !MDLocation(line: 118, column: 21, scope: !75, inlinedAt: !343)
!345 = !{!"0x101\00head\0016777237\000", !121, !19, !4, !346} ; [ DW_TAG_arg_variable ] [head] [line 21]
!346 = !MDLocation(line: 119, column: 20, scope: !75, inlinedAt: !343)
!347 = !MDLocation(line: 21, column: 29, scope: !121, inlinedAt: !346)
!348 = !MDLocation(line: 21, column: 44, scope: !121, inlinedAt: !346)
!349 = !{!"0x100\00size\00119\000", !75, !19, !9, !343} ; [ DW_TAG_auto_variable ] [size] [line 119]
!350 = !MDLocation(line: 119, column: 13, scope: !75, inlinedAt: !343)
!351 = !MDLocation(line: 120, column: 32, scope: !75, inlinedAt: !343)
!352 = !MDLocation(line: 120, column: 31, scope: !75, inlinedAt: !343)
!353 = !MDLocation(line: 120, column: 24, scope: !75, inlinedAt: !343)
!354 = !MDLocation(line: 120, column: 17, scope: !75, inlinedAt: !343)
!355 = !{!"0x100\00l\00120\000", !75, !19, !4, !343} ; [ DW_TAG_auto_variable ] [l] [line 120]
!356 = !MDLocation(line: 120, column: 13, scope: !75, inlinedAt: !343)
!357 = !{!"0x100\00i\00119\000", !75, !19, !9, !343} ; [ DW_TAG_auto_variable ] [i] [line 119]
!358 = !MDLocation(line: 119, column: 7, scope: !75, inlinedAt: !343)
!359 = !{!"0x100\00j\00119\000", !75, !19, !9, !343} ; [ DW_TAG_auto_variable ] [j] [line 119]
!360 = !MDLocation(line: 119, column: 10, scope: !75, inlinedAt: !343)
!361 = !{!"0x100\00xp\00120\000", !75, !19, !4, !343} ; [ DW_TAG_auto_variable ] [xp] [line 120]
!362 = !MDLocation(line: 120, column: 8, scope: !75, inlinedAt: !343)
!363 = !MDLocation(line: 121, column: 24, scope: !308, inlinedAt: !343)
!364 = !MDLocation(line: 121, column: 3, scope: !309, inlinedAt: !343)
!365 = !MDLocation(line: 68, column: 20, scope: !203, inlinedAt: !366)
!366 = !MDLocation(line: 152, column: 8, scope: !367)
!367 = !{!"0xb\00152\007\0019", !1, !90}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!368 = !MDLocation(line: 69, column: 9, scope: !209, inlinedAt: !366)
!369 = !MDLocation(line: 122, column: 17, scope: !312, inlinedAt: !343)
!370 = !MDLocation(line: 122, column: 5, scope: !312, inlinedAt: !343)
!371 = !MDLocation(line: 123, column: 5, scope: !312, inlinedAt: !343)
!372 = !MDLocation(line: 124, column: 5, scope: !312, inlinedAt: !343)
!373 = !MDLocation(line: 121, column: 45, scope: !308, inlinedAt: !343)
!374 = !MDLocation(line: 124, column: 16, scope: !312, inlinedAt: !343)
!375 = distinct !{!375, !284}
!376 = !MDLocation(line: 126, column: 15, scope: !75, inlinedAt: !343)
!377 = !MDLocation(line: 126, column: 3, scope: !75, inlinedAt: !343)
!378 = !MDLocation(line: 127, column: 3, scope: !75, inlinedAt: !343)
!379 = !{!"0x101\00head\0016777240\000", !118, !19, !4, !380} ; [ DW_TAG_arg_variable ] [head] [line 24]
!380 = !MDLocation(line: 128, column: 17, scope: !75, inlinedAt: !343)
!381 = !MDLocation(line: 24, column: 28, scope: !118, inlinedAt: !380)
!382 = !MDLocation(line: 24, column: 43, scope: !118, inlinedAt: !380)
!383 = !MDLocation(line: 128, column: 3, scope: !75, inlinedAt: !343)
!384 = !MDLocation(line: 147, column: 8, scope: !90)
!385 = !MDLocation(line: 89, column: 19, scope: !59, inlinedAt: !386)
!386 = !MDLocation(line: 150, column: 14, scope: !90)
!387 = !MDLocation(line: 90, column: 3, scope: !59, inlinedAt: !386)
!388 = !MDLocation(line: 91, column: 3, scope: !59, inlinedAt: !386)
!389 = !MDLocation(line: 92, column: 3, scope: !59, inlinedAt: !386)
!390 = !{!"0x101\00x\0016777281\000", !42, !19, !4, !366} ; [ DW_TAG_arg_variable ] [x] [line 65]
!391 = !MDLocation(line: 65, column: 21, scope: !42, inlinedAt: !366)
!392 = !{!"0x101\00y\0033554497\000", !42, !19, !4, !366} ; [ DW_TAG_arg_variable ] [y] [line 65]
!393 = !MDLocation(line: 65, column: 29, scope: !42, inlinedAt: !366)
!394 = !{!"0x100\00xp\0066\000", !42, !19, !4, !366} ; [ DW_TAG_auto_variable ] [xp] [line 66]
!395 = !MDLocation(line: 66, column: 8, scope: !42, inlinedAt: !366)
!396 = !{!"0x100\00yp\0066\000", !42, !19, !4, !366} ; [ DW_TAG_auto_variable ] [yp] [line 66]
!397 = !MDLocation(line: 66, column: 13, scope: !42, inlinedAt: !366)
!398 = !MDLocation(line: 68, column: 20, scope: !205, inlinedAt: !366)
!399 = !MDLocation(line: 69, column: 20, scope: !209, inlinedAt: !366)
!400 = !MDLocation(line: 68, column: 3, scope: !206, inlinedAt: !366)
!401 = !MDLocation(line: 69, column: 9, scope: !210, inlinedAt: !366)
!402 = !MDLocation(line: 68, column: 51, scope: !205, inlinedAt: !366)
!403 = !MDLocation(line: 71, column: 7, scope: !42, inlinedAt: !366)
!404 = !MDLocation(line: 72, column: 10, scope: !42, inlinedAt: !366)
!405 = !MDLocation(line: 152, column: 7, scope: !90)
!406 = !{!"0x101\00head\0016777238\000", !126, !19, !4, !407} ; [ DW_TAG_arg_variable ] [head] [line 22]
!407 = !MDLocation(line: 156, column: 11, scope: !90)
!408 = !MDLocation(line: 22, column: 28, scope: !126, inlinedAt: !407)
!409 = !{!"0x101\00head\0016777237\000", !121, !19, !4, !410} ; [ DW_TAG_arg_variable ] [head] [line 21]
!410 = !MDLocation(line: 22, column: 43, scope: !126, inlinedAt: !407)
!411 = !MDLocation(line: 21, column: 29, scope: !121, inlinedAt: !410)
!412 = !MDLocation(line: 156, column: 3, scope: !90)
!413 = !MDLocation(line: 27, column: 15, scope: !18, inlinedAt: !414)
!414 = !MDLocation(line: 157, column: 5, scope: !415)
!415 = !{!"0xb\00156\0028\0021", !1, !90}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!416 = !MDLocation(line: 153, column: 5, scope: !417)
!417 = !{!"0xb\00152\0030\0020", !1, !367}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!418 = !MDLocation(line: 154, column: 5, scope: !417)
!419 = !MDLocation(line: 21, column: 44, scope: !121, inlinedAt: !410)
!420 = !MDLocation(line: 32, column: 3, scope: !18, inlinedAt: !414)
!421 = !MDLocation(line: 22, column: 43, scope: !126, inlinedAt: !422)
!422 = !MDLocation(line: 166, column: 11, scope: !90)
!423 = !MDLocation(line: 166, column: 3, scope: !90)
!424 = !MDLocation(line: 38, column: 10, scope: !26, inlinedAt: !425)
!425 = !MDLocation(line: 167, column: 25, scope: !426)
!426 = !{!"0xb\00166\0028\0024", !1, !90}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!427 = !{!"0x100\00tail\0036\000", !26, !19, !4, !425} ; [ DW_TAG_auto_variable ] [tail] [line 36]
!428 = !MDLocation(line: 36, column: 15, scope: !26, inlinedAt: !425)
!429 = !MDLocation(line: 39, column: 10, scope: !26, inlinedAt: !425)
!430 = !{!"0x100\00prev\0036\000", !26, !19, !4, !425} ; [ DW_TAG_auto_variable ] [prev] [line 36]
!431 = !MDLocation(line: 36, column: 8, scope: !26, inlinedAt: !425)
!432 = !MDLocation(line: 40, column: 3, scope: !26, inlinedAt: !425)
!433 = !MDLocation(line: 41, column: 3, scope: !26, inlinedAt: !425)
!434 = !MDLocation(line: 42, column: 3, scope: !26, inlinedAt: !425)
!435 = !{!"0x101\00head\0016777242\000", !18, !19, !4, !436} ; [ DW_TAG_arg_variable ] [head] [line 26]
!436 = !MDLocation(line: 167, column: 5, scope: !426)
!437 = !MDLocation(line: 26, column: 26, scope: !18, inlinedAt: !436)
!438 = !{!"0x101\00item\0033554458\000", !18, !19, !4, !436} ; [ DW_TAG_arg_variable ] [item] [line 26]
!439 = !MDLocation(line: 26, column: 37, scope: !18, inlinedAt: !436)
!440 = !MDLocation(line: 27, column: 15, scope: !18, inlinedAt: !436)
!441 = !{!"0x100\00tail\0027\000", !18, !19, !4, !436} ; [ DW_TAG_auto_variable ] [tail] [line 27]
!442 = !MDLocation(line: 27, column: 8, scope: !18, inlinedAt: !436)
!443 = !MDLocation(line: 28, column: 3, scope: !18, inlinedAt: !436)
!444 = !MDLocation(line: 29, column: 3, scope: !18, inlinedAt: !436)
!445 = !MDLocation(line: 30, column: 3, scope: !18, inlinedAt: !436)
!446 = !MDLocation(line: 31, column: 3, scope: !18, inlinedAt: !436)
!447 = distinct !{!447, !284}
!448 = !{!"0x101\00head\0016777271\000", !38, !19, !4, !449} ; [ DW_TAG_arg_variable ] [head] [line 55]
!449 = !MDLocation(line: 157, column: 25, scope: !415)
!450 = !MDLocation(line: 55, column: 25, scope: !38, inlinedAt: !449)
!451 = !{!"0x101\00head\0016777238\000", !126, !19, !4, !452} ; [ DW_TAG_arg_variable ] [head] [line 22]
!452 = !MDLocation(line: 57, column: 7, scope: !183, inlinedAt: !449)
!453 = !MDLocation(line: 22, column: 28, scope: !126, inlinedAt: !452)
!454 = !{!"0x101\00head\0016777237\000", !121, !19, !4, !455} ; [ DW_TAG_arg_variable ] [head] [line 21]
!455 = !MDLocation(line: 22, column: 43, scope: !126, inlinedAt: !452)
!456 = !MDLocation(line: 21, column: 29, scope: !121, inlinedAt: !455)
!457 = !{!"0x100\00next\0056\000", !38, !19, !4, !449} ; [ DW_TAG_auto_variable ] [next] [line 56]
!458 = !MDLocation(line: 56, column: 8, scope: !38, inlinedAt: !449)
!459 = !MDLocation(line: 59, column: 16, scope: !38, inlinedAt: !449)
!460 = !MDLocation(line: 59, column: 3, scope: !38, inlinedAt: !449)
!461 = !MDLocation(line: 60, column: 3, scope: !38, inlinedAt: !449)
!462 = !MDLocation(line: 61, column: 3, scope: !38, inlinedAt: !449)
!463 = !{!"0x101\00item\0033554458\000", !18, !19, !4, !414} ; [ DW_TAG_arg_variable ] [item] [line 26]
!464 = !MDLocation(line: 26, column: 37, scope: !18, inlinedAt: !414)
!465 = !{!"0x100\00tail\0027\000", !18, !19, !4, !414} ; [ DW_TAG_auto_variable ] [tail] [line 27]
!466 = !MDLocation(line: 27, column: 8, scope: !18, inlinedAt: !414)
!467 = !MDLocation(line: 28, column: 3, scope: !18, inlinedAt: !414)
!468 = !MDLocation(line: 29, column: 3, scope: !18, inlinedAt: !414)
!469 = !MDLocation(line: 30, column: 3, scope: !18, inlinedAt: !414)
!470 = !MDLocation(line: 31, column: 3, scope: !18, inlinedAt: !414)
!471 = !MDLocation(line: 58, column: 10, scope: !38, inlinedAt: !449)
!472 = !MDLocation(line: 21, column: 44, scope: !121, inlinedAt: !421)
!473 = !MDLocation(line: 32, column: 3, scope: !18, inlinedAt: !436)
!474 = !MDLocation(line: 135, column: 11, scope: !331, inlinedAt: !475)
!475 = !MDLocation(line: 175, column: 3, scope: !90)
!476 = !{!"0x100\00tmp\00133\000", !83, !19, !4, !475} ; [ DW_TAG_auto_variable ] [tmp] [line 133]
!477 = !MDLocation(line: 133, column: 8, scope: !83, inlinedAt: !475)
!478 = !MDLocation(line: 136, column: 15, scope: !331, inlinedAt: !475)
!479 = !MDLocation(line: 136, column: 5, scope: !331, inlinedAt: !475)
!480 = !MDLocation(line: 137, column: 5, scope: !331, inlinedAt: !475)
!481 = !{!"0x100\00p\00133\000", !83, !19, !4, !475} ; [ DW_TAG_auto_variable ] [p] [line 133]
!482 = !MDLocation(line: 133, column: 14, scope: !83, inlinedAt: !475)
!483 = !MDLocation(line: 139, column: 12, scope: !83, inlinedAt: !475)
!484 = !MDLocation(line: 139, column: 3, scope: !331, inlinedAt: !475)
!485 = !{!"0x101\00head\0016777239\000", !115, !19, !4, !486} ; [ DW_TAG_arg_variable ] [head] [line 23]
!486 = !MDLocation(line: 177, column: 7, scope: !487)
!487 = !{!"0xb\00177\007\0027", !1, !90}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!488 = !MDLocation(line: 23, column: 29, scope: !115, inlinedAt: !486)
!489 = !MDLocation(line: 23, column: 44, scope: !115, inlinedAt: !486)
!490 = !MDLocation(line: 177, column: 7, scope: !90)
!491 = !{!"0x101\00head\0016777239\000", !115, !19, !4, !492} ; [ DW_TAG_arg_variable ] [head] [line 23]
!492 = !MDLocation(line: 179, column: 18, scope: !493)
!493 = !{!"0xb\00177\0037\0028", !1, !487}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!494 = !MDLocation(line: 23, column: 29, scope: !115, inlinedAt: !492)
!495 = !MDLocation(line: 178, column: 5, scope: !493)
!496 = !MDLocation(line: 180, column: 5, scope: !493)
!497 = !{!"0x101\00head\0016777240\000", !118, !19, !4, !498} ; [ DW_TAG_arg_variable ] [head] [line 24]
!498 = !MDLocation(line: 183, column: 7, scope: !499)
!499 = !{!"0xb\00183\007\0029", !1, !90}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!500 = !MDLocation(line: 24, column: 28, scope: !118, inlinedAt: !498)
!501 = !MDLocation(line: 24, column: 43, scope: !118, inlinedAt: !498)
!502 = !MDLocation(line: 183, column: 7, scope: !90)
!503 = !{!"0x101\00head\0016777240\000", !118, !19, !4, !504} ; [ DW_TAG_arg_variable ] [head] [line 24]
!504 = !MDLocation(line: 185, column: 18, scope: !505)
!505 = !{!"0xb\00183\0033\0030", !1, !499}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!506 = !MDLocation(line: 24, column: 28, scope: !118, inlinedAt: !504)
!507 = !MDLocation(line: 184, column: 5, scope: !505)
!508 = !MDLocation(line: 186, column: 5, scope: !505)
!509 = !{!"0x101\00head\0016777239\000", !115, !19, !4, !510} ; [ DW_TAG_arg_variable ] [head] [line 23]
!510 = !MDLocation(line: 189, column: 7, scope: !511)
!511 = !{!"0xb\00189\007\0031", !1, !90}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!512 = !MDLocation(line: 23, column: 29, scope: !115, inlinedAt: !510)
!513 = !MDLocation(line: 23, column: 44, scope: !115, inlinedAt: !510)
!514 = !MDLocation(line: 189, column: 7, scope: !90)
!515 = !{!"0x101\00head\0016777239\000", !115, !19, !4, !516} ; [ DW_TAG_arg_variable ] [head] [line 23]
!516 = !MDLocation(line: 191, column: 18, scope: !517)
!517 = !{!"0xb\00189\0037\0032", !1, !511}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!518 = !MDLocation(line: 23, column: 29, scope: !115, inlinedAt: !516)
!519 = !MDLocation(line: 190, column: 5, scope: !517)
!520 = !MDLocation(line: 192, column: 5, scope: !517)
!521 = !{!"0x101\00head\0016777240\000", !118, !19, !4, !522} ; [ DW_TAG_arg_variable ] [head] [line 24]
!522 = !MDLocation(line: 195, column: 7, scope: !523)
!523 = !{!"0xb\00195\007\0033", !1, !90}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!524 = !MDLocation(line: 24, column: 28, scope: !118, inlinedAt: !522)
!525 = !MDLocation(line: 24, column: 43, scope: !118, inlinedAt: !522)
!526 = !MDLocation(line: 195, column: 7, scope: !90)
!527 = !{!"0x101\00head\0016777240\000", !118, !19, !4, !528} ; [ DW_TAG_arg_variable ] [head] [line 24]
!528 = !MDLocation(line: 197, column: 18, scope: !529)
!529 = !{!"0xb\00195\0033\0034", !1, !523}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!530 = !MDLocation(line: 24, column: 28, scope: !118, inlinedAt: !528)
!531 = !MDLocation(line: 196, column: 5, scope: !529)
!532 = !MDLocation(line: 198, column: 5, scope: !529)
!533 = !{!"0x101\00head\0016777237\000", !121, !19, !4, !534} ; [ DW_TAG_arg_variable ] [head] [line 21]
!534 = !MDLocation(line: 201, column: 7, scope: !535)
!535 = !{!"0xb\00201\007\0035", !1, !90}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!536 = !MDLocation(line: 21, column: 29, scope: !121, inlinedAt: !534)
!537 = !MDLocation(line: 21, column: 44, scope: !121, inlinedAt: !534)
!538 = !MDLocation(line: 201, column: 7, scope: !90)
!539 = !{!"0x101\00head\0016777237\000", !121, !19, !4, !540} ; [ DW_TAG_arg_variable ] [head] [line 21]
!540 = !MDLocation(line: 203, column: 18, scope: !541)
!541 = !{!"0xb\00201\0033\0036", !1, !535}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!542 = !MDLocation(line: 21, column: 29, scope: !121, inlinedAt: !540)
!543 = !MDLocation(line: 202, column: 5, scope: !541)
!544 = !MDLocation(line: 204, column: 5, scope: !541)
!545 = !{!"0x101\00x\0016777281\000", !42, !19, !4, !546} ; [ DW_TAG_arg_variable ] [x] [line 65]
!546 = !MDLocation(line: 207, column: 8, scope: !547)
!547 = !{!"0xb\00207\007\0037", !1, !90}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!548 = !MDLocation(line: 65, column: 21, scope: !42, inlinedAt: !546)
!549 = !{!"0x101\00y\0033554497\000", !42, !19, !4, !546} ; [ DW_TAG_arg_variable ] [y] [line 65]
!550 = !MDLocation(line: 65, column: 29, scope: !42, inlinedAt: !546)
!551 = !{!"0x100\00xp\0066\000", !42, !19, !4, !546} ; [ DW_TAG_auto_variable ] [xp] [line 66]
!552 = !MDLocation(line: 66, column: 8, scope: !42, inlinedAt: !546)
!553 = !{!"0x100\00yp\0066\000", !42, !19, !4, !546} ; [ DW_TAG_auto_variable ] [yp] [line 66]
!554 = !MDLocation(line: 66, column: 13, scope: !42, inlinedAt: !546)
!555 = !MDLocation(line: 68, column: 20, scope: !205, inlinedAt: !546)
!556 = !MDLocation(line: 69, column: 9, scope: !209, inlinedAt: !546)
!557 = !MDLocation(line: 68, column: 3, scope: !206, inlinedAt: !546)
!558 = !MDLocation(line: 69, column: 9, scope: !210, inlinedAt: !546)
!559 = !MDLocation(line: 68, column: 51, scope: !205, inlinedAt: !546)
!560 = !MDLocation(line: 68, column: 20, scope: !203, inlinedAt: !546)
!561 = !MDLocation(line: 69, column: 20, scope: !209, inlinedAt: !546)
!562 = !MDLocation(line: 71, column: 7, scope: !42, inlinedAt: !546)
!563 = !MDLocation(line: 72, column: 10, scope: !42, inlinedAt: !546)
!564 = !MDLocation(line: 207, column: 7, scope: !90)
!565 = !MDLocation(line: 208, column: 5, scope: !566)
!566 = !{!"0xb\00207\0030\0038", !1, !547}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!567 = !MDLocation(line: 209, column: 5, scope: !566)
!568 = !{!"0x101\00head\0016777237\000", !121, !19, !4, !569} ; [ DW_TAG_arg_variable ] [head] [line 21]
!569 = !MDLocation(line: 211, column: 9, scope: !90)
!570 = !MDLocation(line: 21, column: 29, scope: !121, inlinedAt: !569)
!571 = !MDLocation(line: 212, column: 8, scope: !90)
!572 = !MDLocation(line: 212, column: 3, scope: !90)
!573 = !MDLocation(line: 213, column: 3, scope: !90)
!574 = !MDLocation(line: 214, column: 3, scope: !90)
!575 = !MDLocation(line: 216, column: 3, scope: !90)
!576 = !MDLocation(line: 219, column: 14, scope: !98)
!577 = !MDLocation(line: 219, column: 26, scope: !98)
!578 = !MDLocation(line: 225, column: 13, scope: !98)
!579 = !MDLocation(line: 225, column: 12, scope: !98)
!580 = !MDLocation(line: 225, column: 31, scope: !581)
!581 = !{!"0xb\001", !1, !98}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!582 = !{!141, !141, i64 0}
!583 = !{!"0x101\00__nptr\0016777494\000", !106, !108, !111, !584} ; [ DW_TAG_arg_variable ] [__nptr] [line 278]
!584 = !MDLocation(line: 225, column: 26, scope: !98)
!585 = !MDLocation(line: 278, column: 1, scope: !106, inlinedAt: !584)
!586 = !MDLocation(line: 280, column: 16, scope: !106, inlinedAt: !584)
!587 = !MDLocation(line: 280, column: 10, scope: !106, inlinedAt: !584)
!588 = !MDLocation(line: 225, column: 7, scope: !98)
!589 = !MDLocation(line: 227, column: 3, scope: !98)
!590 = !MDLocation(line: 227, column: 9, scope: !591)
!591 = !{!"0xb\003", !1, !581}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!592 = !MDLocation(line: 227, column: 23, scope: !593)
!593 = !{!"0xb\002", !1, !98}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!594 = !MDLocation(line: 226, column: 7, scope: !98)
!595 = !MDLocation(line: 228, column: 3, scope: !98)
!596 = !MDLocation(line: 229, column: 3, scope: !98)
