; ModuleID = 'lists.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.DLL = type { i32, %struct.DLL*, %struct.DLL* }

@.str = private unnamed_addr constant [12 x i8] c"length: %d\0A\00", align 1
@.str1 = private unnamed_addr constant [28 x i8] c"i:%3d  v:%3d  n:%3d  p:%3d\0A\00", align 1
@.str2 = private unnamed_addr constant [34 x i8] c"[last entry points to list head]\0A\00", align 1
@.str3 = private unnamed_addr constant [31 x i8] c"[val of next of tail is:  %d]\0A\00", align 1
@.str4 = private unnamed_addr constant [27 x i8] c"li2 and li1 are not equal\0A\00", align 1
@.str5 = private unnamed_addr constant [25 x i8] c"li2 should be empty now\0A\00", align 1
@.str6 = private unnamed_addr constant [25 x i8] c"li3 should be empty now\0A\00", align 1
@.str7 = private unnamed_addr constant [42 x i8] c"li1 first value wrong, wanted %d, got %d\0A\00", align 1
@.str8 = private unnamed_addr constant [37 x i8] c"last value wrong, wanted %d, got %d\0A\00", align 1
@.str9 = private unnamed_addr constant [42 x i8] c"li2 first value wrong, wanted %d, got %d\0A\00", align 1
@.str10 = private unnamed_addr constant [35 x i8] c"li1 size wrong, wanted %d, got %d\0A\00", align 1
@.str11 = private unnamed_addr constant [27 x i8] c"li1 and li2 are not equal\0A\00", align 1
@.str12 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@str = private unnamed_addr constant [33 x i8] c"[last entry points to list head]\00"
@str13 = private unnamed_addr constant [26 x i8] c"li2 and li1 are not equal\00"
@str14 = private unnamed_addr constant [24 x i8] c"li2 should be empty now\00"
@str15 = private unnamed_addr constant [24 x i8] c"li3 should be empty now\00"
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
  %call = tail call fastcc i32 @list_empty(%struct.DLL* %head), !dbg !152
  %tobool = icmp eq i32 %call, 0, !dbg !154
  br i1 %tobool, label %if.end, label %return, !dbg !154

if.end:                                           ; preds = %entry
  %prev1 = getelementptr inbounds %struct.DLL* %head, i64 0, i32 2, !dbg !155
  %0 = load %struct.DLL** %prev1, align 8, !dbg !155, !tbaa !136
  tail call void @llvm.dbg.value(metadata %struct.DLL* %0, i64 0, metadata !32, metadata !132), !dbg !156
  %prev2 = getelementptr inbounds %struct.DLL* %0, i64 0, i32 2, !dbg !157
  %1 = load %struct.DLL** %prev2, align 8, !dbg !157, !tbaa !136
  tail call void @llvm.dbg.value(metadata %struct.DLL* %1, i64 0, metadata !31, metadata !132), !dbg !158
  %next = getelementptr inbounds %struct.DLL* %1, i64 0, i32 1, !dbg !159
  store %struct.DLL* %head, %struct.DLL** %next, align 8, !dbg !159, !tbaa !144
  store %struct.DLL* %1, %struct.DLL** %prev1, align 8, !dbg !160, !tbaa !136
  %val = getelementptr inbounds %struct.DLL* %head, i64 0, i32 0, !dbg !161
  %2 = load i32* %val, align 4, !dbg !161, !tbaa !149
  %dec = add nsw i32 %2, -1, !dbg !161
  store i32 %dec, i32* %val, align 4, !dbg !161, !tbaa !149
  br label %return, !dbg !162

return:                                           ; preds = %entry, %if.end
  %retval.0 = phi %struct.DLL* [ %0, %if.end ], [ null, %entry ]
  ret %struct.DLL* %retval.0, !dbg !163
}

; Function Attrs: nounwind readonly uwtable
define internal fastcc i32 @list_empty(%struct.DLL* nocapture readonly %head) #1 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.DLL* %head, i64 0, metadata !128, metadata !132), !dbg !164
  %call = tail call fastcc i32 @list_length(%struct.DLL* %head), !dbg !165
  %cmp = icmp eq i32 %call, 0, !dbg !165
  %conv = zext i1 %cmp to i32, !dbg !165
  ret i32 %conv, !dbg !166
}

; Function Attrs: nounwind uwtable
define void @list_push_head(%struct.DLL* %head, %struct.DLL* %item) #0 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.DLL* %head, i64 0, metadata !35, metadata !132), !dbg !167
  tail call void @llvm.dbg.value(metadata %struct.DLL* %item, i64 0, metadata !36, metadata !132), !dbg !168
  %next1 = getelementptr inbounds %struct.DLL* %head, i64 0, i32 1, !dbg !169
  %0 = load %struct.DLL** %next1, align 8, !dbg !169, !tbaa !144
  tail call void @llvm.dbg.value(metadata %struct.DLL* %0, i64 0, metadata !37, metadata !132), !dbg !170
  store %struct.DLL* %item, %struct.DLL** %next1, align 8, !dbg !171, !tbaa !144
  %prev = getelementptr inbounds %struct.DLL* %0, i64 0, i32 2, !dbg !172
  store %struct.DLL* %item, %struct.DLL** %prev, align 8, !dbg !172, !tbaa !136
  %next3 = getelementptr inbounds %struct.DLL* %item, i64 0, i32 1, !dbg !173
  store %struct.DLL* %0, %struct.DLL** %next3, align 8, !dbg !173, !tbaa !144
  %prev4 = getelementptr inbounds %struct.DLL* %item, i64 0, i32 2, !dbg !174
  store %struct.DLL* %head, %struct.DLL** %prev4, align 8, !dbg !174, !tbaa !136
  %val = getelementptr inbounds %struct.DLL* %head, i64 0, i32 0, !dbg !175
  %1 = load i32* %val, align 4, !dbg !175, !tbaa !149
  %inc = add nsw i32 %1, 1, !dbg !175
  store i32 %inc, i32* %val, align 4, !dbg !175, !tbaa !149
  ret void, !dbg !176
}

; Function Attrs: nounwind uwtable
define %struct.DLL* @list_pop_head(%struct.DLL* %head) #0 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.DLL* %head, i64 0, metadata !40, metadata !132), !dbg !177
  %call = tail call fastcc i32 @list_empty(%struct.DLL* %head), !dbg !178
  %tobool = icmp eq i32 %call, 0, !dbg !180
  br i1 %tobool, label %if.end, label %return, !dbg !180

if.end:                                           ; preds = %entry
  %next1 = getelementptr inbounds %struct.DLL* %head, i64 0, i32 1, !dbg !181
  %0 = load %struct.DLL** %next1, align 8, !dbg !181, !tbaa !144
  tail call void @llvm.dbg.value(metadata %struct.DLL* %0, i64 0, metadata !41, metadata !132), !dbg !182
  %next2 = getelementptr inbounds %struct.DLL* %0, i64 0, i32 1, !dbg !183
  %1 = load %struct.DLL** %next2, align 8, !dbg !183, !tbaa !144
  store %struct.DLL* %1, %struct.DLL** %next1, align 8, !dbg !184, !tbaa !144
  %2 = load %struct.DLL** %next2, align 8, !dbg !185, !tbaa !144
  %prev = getelementptr inbounds %struct.DLL* %2, i64 0, i32 2, !dbg !185
  store %struct.DLL* %head, %struct.DLL** %prev, align 8, !dbg !185, !tbaa !136
  %val = getelementptr inbounds %struct.DLL* %head, i64 0, i32 0, !dbg !186
  %3 = load i32* %val, align 4, !dbg !186, !tbaa !149
  %dec = add nsw i32 %3, -1, !dbg !186
  store i32 %dec, i32* %val, align 4, !dbg !186, !tbaa !149
  br label %return, !dbg !187

return:                                           ; preds = %entry, %if.end
  %retval.0 = phi %struct.DLL* [ %0, %if.end ], [ null, %entry ]
  ret %struct.DLL* %retval.0, !dbg !188
}

; Function Attrs: nounwind readonly uwtable
define i32 @list_equal(%struct.DLL* readonly %x, %struct.DLL* readonly %y) #1 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.DLL* %x, i64 0, metadata !46, metadata !132), !dbg !189
  tail call void @llvm.dbg.value(metadata %struct.DLL* %y, i64 0, metadata !47, metadata !132), !dbg !190
  tail call void @llvm.dbg.value(metadata %struct.DLL* %x, i64 0, metadata !48, metadata !132), !dbg !191
  tail call void @llvm.dbg.value(metadata %struct.DLL* %y, i64 0, metadata !49, metadata !132), !dbg !192
  %next20 = getelementptr inbounds %struct.DLL* %x, i64 0, i32 1, !dbg !193
  %0 = load %struct.DLL** %next20, align 8, !dbg !193, !tbaa !144
  %cmp21 = icmp eq %struct.DLL* %0, %x, !dbg !198
  %val22 = getelementptr inbounds %struct.DLL* %x, i64 0, i32 0, !dbg !199
  %1 = load i32* %val22, align 4, !dbg !199, !tbaa !149
  %val123 = getelementptr inbounds %struct.DLL* %y, i64 0, i32 0, !dbg !202
  %2 = load i32* %val123, align 4, !dbg !202, !tbaa !149
  %cmp224 = icmp ne i32 %1, %2, !dbg !199
  br i1 %cmp21, label %for.end, label %for.body, !dbg !203

for.body:                                         ; preds = %entry, %for.inc
  %cmp226 = phi i1 [ %cmp2, %for.inc ], [ %cmp224, %entry ]
  %3 = phi %struct.DLL* [ %5, %for.inc ], [ %0, %entry ]
  %yp.025 = phi %struct.DLL* [ %4, %for.inc ], [ %y, %entry ]
  br i1 %cmp226, label %return, label %for.inc, !dbg !204

for.inc:                                          ; preds = %for.body
  tail call void @llvm.dbg.value(metadata %struct.DLL* %5, i64 0, metadata !48, metadata !132), !dbg !191
  %next4 = getelementptr inbounds %struct.DLL* %yp.025, i64 0, i32 1, !dbg !205
  %4 = load %struct.DLL** %next4, align 8, !dbg !205, !tbaa !144
  tail call void @llvm.dbg.value(metadata %struct.DLL* %4, i64 0, metadata !49, metadata !132), !dbg !192
  %next = getelementptr inbounds %struct.DLL* %3, i64 0, i32 1, !dbg !193
  %5 = load %struct.DLL** %next, align 8, !dbg !193, !tbaa !144
  %cmp = icmp eq %struct.DLL* %5, %x, !dbg !198
  %val = getelementptr inbounds %struct.DLL* %3, i64 0, i32 0, !dbg !199
  %6 = load i32* %val, align 4, !dbg !199, !tbaa !149
  %val1 = getelementptr inbounds %struct.DLL* %4, i64 0, i32 0, !dbg !202
  %7 = load i32* %val1, align 4, !dbg !202, !tbaa !149
  %cmp2 = icmp ne i32 %6, %7, !dbg !199
  br i1 %cmp, label %for.end, label %for.body, !dbg !203

for.end:                                          ; preds = %for.inc, %entry
  %cmp2.lcssa = phi i1 [ %cmp224, %entry ], [ %cmp2, %for.inc ]
  %yp.0.lcssa = phi %struct.DLL* [ %y, %entry ], [ %4, %for.inc ]
  br i1 %cmp2.lcssa, label %return, label %if.end9, !dbg !206

if.end9:                                          ; preds = %for.end
  %next10 = getelementptr inbounds %struct.DLL* %yp.0.lcssa, i64 0, i32 1, !dbg !207
  %8 = load %struct.DLL** %next10, align 8, !dbg !207, !tbaa !144
  %cmp11 = icmp eq %struct.DLL* %8, %y, !dbg !207
  %conv = zext i1 %cmp11 to i32, !dbg !207
  br label %return, !dbg !208

return:                                           ; preds = %for.body, %for.end, %if.end9
  %retval.0 = phi i32 [ %conv, %if.end9 ], [ 0, %for.end ], [ 0, %for.body ]
  ret i32 %retval.0, !dbg !209
}

; Function Attrs: nounwind uwtable
define void @list_print(i8* nocapture readonly %msg, %struct.DLL* nocapture readonly %x) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i8* %msg, i64 0, metadata !54, metadata !132), !dbg !210
  tail call void @llvm.dbg.value(metadata %struct.DLL* %x, i64 0, metadata !55, metadata !132), !dbg !211
  %next = getelementptr inbounds %struct.DLL* %x, i64 0, i32 1, !dbg !212
  %0 = load %struct.DLL** %next, align 8, !dbg !212, !tbaa !144
  tail call void @llvm.dbg.value(metadata %struct.DLL* %0, i64 0, metadata !57, metadata !132), !dbg !213
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !58, metadata !132), !dbg !214
  %call = tail call i32 @puts(i8* %msg) #6, !dbg !215
  %call1 = tail call fastcc i32 @list_length(%struct.DLL* %x), !dbg !216
  %call2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i32 %call1) #6, !dbg !217
  %xp.021 = load %struct.DLL** %next, align 8, !dbg !218
  %next422 = getelementptr inbounds %struct.DLL* %xp.021, i64 0, i32 1, !dbg !220
  %1 = load %struct.DLL** %next422, align 8, !dbg !220, !tbaa !144
  %cmp23 = icmp eq %struct.DLL* %1, %0, !dbg !224
  br i1 %cmp23, label %for.end, label %for.body, !dbg !225

for.body:                                         ; preds = %entry, %for.body
  %2 = phi %struct.DLL* [ %7, %for.body ], [ %1, %entry ]
  %next426 = phi %struct.DLL** [ %next4, %for.body ], [ %next422, %entry ]
  %xp.025 = phi %struct.DLL* [ %xp.0, %for.body ], [ %xp.021, %entry ]
  %i.024 = phi i32 [ %inc, %for.body ], [ 0, %entry ]
  %inc = add nuw nsw i32 %i.024, 1, !dbg !226
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !58, metadata !132), !dbg !214
  %val = getelementptr inbounds %struct.DLL* %xp.025, i64 0, i32 0, !dbg !228
  %3 = load i32* %val, align 4, !dbg !228, !tbaa !149
  %val6 = getelementptr inbounds %struct.DLL* %2, i64 0, i32 0, !dbg !229
  %4 = load i32* %val6, align 4, !dbg !229, !tbaa !149
  %prev = getelementptr inbounds %struct.DLL* %xp.025, i64 0, i32 2, !dbg !230
  %5 = load %struct.DLL** %prev, align 8, !dbg !230, !tbaa !136
  %val7 = getelementptr inbounds %struct.DLL* %5, i64 0, i32 0, !dbg !230
  %6 = load i32* %val7, align 4, !dbg !230, !tbaa !149
  %call8 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str1, i64 0, i64 0), i32 %inc, i32 %3, i32 %4, i32 %6) #6, !dbg !231
  %xp.0 = load %struct.DLL** %next426, align 8, !dbg !218
  %next4 = getelementptr inbounds %struct.DLL* %xp.0, i64 0, i32 1, !dbg !220
  %7 = load %struct.DLL** %next4, align 8, !dbg !220, !tbaa !144
  %cmp = icmp eq %struct.DLL* %7, %0, !dbg !224
  br i1 %cmp, label %for.end, label %for.body, !dbg !225

for.end:                                          ; preds = %for.body, %entry
  %next4.lcssa = phi %struct.DLL** [ %next422, %entry ], [ %next4, %for.body ]
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([33 x i8]* @str, i64 0, i64 0)) #6, !dbg !232
  %8 = load %struct.DLL** %next4.lcssa, align 8, !dbg !233, !tbaa !144
  %val12 = getelementptr inbounds %struct.DLL* %8, i64 0, i32 0, !dbg !233
  %9 = load i32* %val12, align 4, !dbg !233, !tbaa !149
  %call13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str3, i64 0, i64 0), i32 %9) #6, !dbg !234
  ret void, !dbg !235
}

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #2

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind readonly uwtable
define internal fastcc i32 @list_length(%struct.DLL* nocapture readonly %head) #1 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.DLL* %head, i64 0, metadata !125, metadata !132), !dbg !236
  %val = getelementptr inbounds %struct.DLL* %head, i64 0, i32 0, !dbg !237
  %0 = load i32* %val, align 4, !dbg !237, !tbaa !149
  ret i32 %0, !dbg !238
}

; Function Attrs: nounwind uwtable
define %struct.DLL* @list_new() #0 {
entry:
  %call = tail call noalias i8* @malloc(i64 24) #6, !dbg !239
  %0 = bitcast i8* %call to %struct.DLL*, !dbg !240
  tail call void @llvm.dbg.value(metadata %struct.DLL* %0, i64 0, metadata !63, metadata !132), !dbg !241
  %next = getelementptr inbounds i8* %call, i64 8, !dbg !242
  %1 = bitcast i8* %next to i8**, !dbg !242
  store i8* %call, i8** %1, align 8, !dbg !242, !tbaa !144
  %prev = getelementptr inbounds i8* %call, i64 16, !dbg !243
  %2 = bitcast i8* %prev to i8**, !dbg !243
  store i8* %call, i8** %2, align 8, !dbg !243, !tbaa !136
  %val = bitcast i8* %call to i32*, !dbg !244
  store i32 0, i32* %val, align 4, !dbg !244, !tbaa !149
  ret %struct.DLL* %0, !dbg !245
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind uwtable
define %struct.DLL* @list_sequence(i32 %from, i32 %to) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %from, i64 0, metadata !68, metadata !132), !dbg !246
  tail call void @llvm.dbg.value(metadata i32 %to, i64 0, metadata !69, metadata !132), !dbg !247
  %cmp = icmp sgt i32 %from, %to, !dbg !248
  tail call void @llvm.dbg.value(metadata i32 %from, i64 0, metadata !71, metadata !132), !dbg !250
  tail call void @llvm.dbg.value(metadata i32 %to, i64 0, metadata !68, metadata !132), !dbg !246
  tail call void @llvm.dbg.value(metadata i32 %from, i64 0, metadata !69, metadata !132), !dbg !247
  %from.to = select i1 %cmp, i32 %from, i32 %to, !dbg !251
  %to.from = select i1 %cmp, i32 %to, i32 %from, !dbg !251
  %sub = sub nsw i32 %from.to, %to.from, !dbg !252
  %add = add nsw i32 %sub, 1, !dbg !252
  tail call void @llvm.dbg.value(metadata i32 %add, i64 0, metadata !70, metadata !132), !dbg !253
  %add4 = add nsw i32 %sub, 2, !dbg !254
  %conv = sext i32 %add4 to i64, !dbg !255
  %mul = mul nsw i64 %conv, 24, !dbg !255
  %call = tail call noalias i8* @malloc(i64 %mul) #6, !dbg !256
  %0 = bitcast i8* %call to %struct.DLL*, !dbg !257
  tail call void @llvm.dbg.value(metadata %struct.DLL* %0, i64 0, metadata !74, metadata !132), !dbg !258
  %dec = add nsw i32 %to.from, -1, !dbg !259
  tail call void @llvm.dbg.value(metadata i32 %dec, i64 0, metadata !68, metadata !132), !dbg !246
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !72, metadata !132), !dbg !260
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !73, metadata !132), !dbg !261
  %cmp571 = icmp sgt i32 %sub, -1, !dbg !262
  br i1 %cmp571, label %for.body.lr.ph, label %for.end, !dbg !265

for.body.lr.ph:                                   ; preds = %entry
  %1 = sext i32 %add to i64, !dbg !265
  %2 = icmp sgt i32 %to, %from
  %smax = select i1 %2, i32 %to, i32 %from
  %3 = xor i32 %to, -1, !dbg !265
  %4 = xor i32 %from, -1, !dbg !265
  %5 = icmp sgt i32 %3, %4
  %smax78 = select i1 %5, i32 %3, i32 %4
  %6 = add i32 %smax, %smax78, !dbg !265
  %7 = add i32 %6, 2, !dbg !265
  %8 = icmp sgt i32 %7, 1
  %.op = add i32 %smax, %smax78, !dbg !265
  %9 = select i1 %8, i32 %.op, i32 -1, !dbg !265
  br label %for.body, !dbg !265

for.body:                                         ; preds = %for.body.lr.ph, %for.body
  %indvars.iv76 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next77, %for.body ]
  %indvars.iv = phi i64 [ 1, %for.body.lr.ph ], [ %indvars.iv.next, %for.body ]
  %from.addr.174 = phi i32 [ %dec, %for.body.lr.ph ], [ %inc, %for.body ]
  %indvars.iv.next77 = add nuw nsw i64 %indvars.iv76, 1, !dbg !265
  %arrayidx = getelementptr inbounds %struct.DLL* %0, i64 %indvars.iv.next77, !dbg !266
  %next = getelementptr inbounds %struct.DLL* %0, i64 %indvars.iv76, i32 1, !dbg !268
  store %struct.DLL* %arrayidx, %struct.DLL** %next, align 8, !dbg !268, !tbaa !144
  %10 = add nsw i64 %indvars.iv, -1, !dbg !269
  %arrayidx12 = getelementptr inbounds %struct.DLL* %0, i64 %10, !dbg !270
  %prev = getelementptr inbounds %struct.DLL* %0, i64 %indvars.iv, i32 2, !dbg !271
  store %struct.DLL* %arrayidx12, %struct.DLL** %prev, align 8, !dbg !271, !tbaa !136
  %inc = add nsw i32 %from.addr.174, 1, !dbg !272
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !68, metadata !132), !dbg !246
  %val = getelementptr inbounds %struct.DLL* %0, i64 %indvars.iv76, i32 0, !dbg !273
  store i32 %from.addr.174, i32* %val, align 4, !dbg !273, !tbaa !149
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !265
  %cmp5 = icmp slt i64 %indvars.iv.next77, %1, !dbg !262
  br i1 %cmp5, label %for.body, label %for.cond.for.end_crit_edge, !dbg !265

for.cond.for.end_crit_edge:                       ; preds = %for.body
  %11 = sub i32 %9, %smax78, !dbg !265
  br label %for.end, !dbg !265

for.end:                                          ; preds = %for.cond.for.end_crit_edge, %entry
  %from.addr.1.lcssa = phi i32 [ %11, %for.cond.for.end_crit_edge ], [ %dec, %entry ]
  %idxprom19 = sext i32 %add to i64, !dbg !274
  %arrayidx20 = getelementptr inbounds %struct.DLL* %0, i64 %idxprom19, !dbg !274
  %prev22 = getelementptr inbounds i8* %call, i64 16, !dbg !275
  %12 = bitcast i8* %prev22 to %struct.DLL**, !dbg !275
  store %struct.DLL* %arrayidx20, %struct.DLL** %12, align 8, !dbg !275, !tbaa !136
  %next26 = getelementptr inbounds %struct.DLL* %0, i64 %idxprom19, i32 1, !dbg !276
  %13 = bitcast %struct.DLL** %next26 to i8**, !dbg !276
  store i8* %call, i8** %13, align 8, !dbg !276, !tbaa !144
  %idxprom28 = sext i32 %sub to i64, !dbg !277
  %arrayidx29 = getelementptr inbounds %struct.DLL* %0, i64 %idxprom28, !dbg !277
  %prev32 = getelementptr inbounds %struct.DLL* %0, i64 %idxprom19, i32 2, !dbg !278
  store %struct.DLL* %arrayidx29, %struct.DLL** %prev32, align 8, !dbg !278, !tbaa !136
  %val35 = getelementptr inbounds %struct.DLL* %arrayidx20, i64 0, i32 0, !dbg !279
  store i32 %from.addr.1.lcssa, i32* %val35, align 4, !dbg !279, !tbaa !149
  %val37 = bitcast i8* %call to i32*, !dbg !280
  store i32 %add, i32* %val37, align 4, !dbg !280, !tbaa !149
  ret %struct.DLL* %0, !dbg !281
}

; Function Attrs: nounwind uwtable
define %struct.DLL* @list_copy(%struct.DLL* nocapture readonly %x) #0 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.DLL* %x, i64 0, metadata !77, metadata !132), !dbg !282
  %call = tail call fastcc i32 @list_length(%struct.DLL* %x), !dbg !283
  tail call void @llvm.dbg.value(metadata i32 %call, i64 0, metadata !80, metadata !132), !dbg !284
  %add = add nsw i32 %call, 1, !dbg !285
  %conv = sext i32 %add to i64, !dbg !286
  %mul = mul nsw i64 %conv, 24, !dbg !286
  %call1 = tail call noalias i8* @malloc(i64 %mul) #6, !dbg !287
  %0 = bitcast i8* %call1 to %struct.DLL*, !dbg !288
  tail call void @llvm.dbg.value(metadata %struct.DLL* %0, i64 0, metadata !82, metadata !132), !dbg !289
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !78, metadata !132), !dbg !290
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !79, metadata !132), !dbg !291
  tail call void @llvm.dbg.value(metadata %struct.DLL* %x, i64 0, metadata !81, metadata !132), !dbg !292
  %cmp50 = icmp sgt i32 %call, 0, !dbg !293
  br i1 %cmp50, label %for.body.lr.ph, label %for.end, !dbg !296

for.body.lr.ph:                                   ; preds = %entry
  %1 = add i32 %call, -1, !dbg !296
  br label %for.body, !dbg !296

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %indvars.iv54 = phi i64 [ 1, %for.body.lr.ph ], [ %indvars.iv.next55, %for.body ]
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %for.body ]
  %xp.052 = phi %struct.DLL* [ %x, %for.body.lr.ph ], [ %3, %for.body ]
  %arrayidx = getelementptr inbounds %struct.DLL* %0, i64 %indvars.iv54, !dbg !297
  %arrayidx4 = getelementptr inbounds %struct.DLL* %0, i64 %indvars.iv, !dbg !299
  %next = getelementptr inbounds %struct.DLL* %0, i64 %indvars.iv, i32 1, !dbg !299
  store %struct.DLL* %arrayidx, %struct.DLL** %next, align 8, !dbg !299, !tbaa !144
  %prev = getelementptr inbounds %struct.DLL* %0, i64 %indvars.iv54, i32 2, !dbg !300
  store %struct.DLL* %arrayidx4, %struct.DLL** %prev, align 8, !dbg !300, !tbaa !136
  %val = getelementptr inbounds %struct.DLL* %xp.052, i64 0, i32 0, !dbg !301
  %2 = load i32* %val, align 4, !dbg !301, !tbaa !149
  %val11 = getelementptr inbounds %struct.DLL* %arrayidx4, i64 0, i32 0, !dbg !302
  store i32 %2, i32* %val11, align 4, !dbg !302, !tbaa !149
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !296
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1, !dbg !296
  %next13 = getelementptr inbounds %struct.DLL* %xp.052, i64 0, i32 1, !dbg !303
  %3 = load %struct.DLL** %next13, align 8, !dbg !303, !tbaa !144
  tail call void @llvm.dbg.value(metadata %struct.DLL* %3, i64 0, metadata !81, metadata !132), !dbg !292
  %lftr.wideiv = trunc i64 %indvars.iv to i32, !dbg !296
  %exitcond = icmp eq i32 %lftr.wideiv, %1, !dbg !296
  br i1 %exitcond, label %for.end, label %for.body, !dbg !296

for.end:                                          ; preds = %for.body, %entry
  %idxprom14 = sext i32 %call to i64, !dbg !304
  %arrayidx15 = getelementptr inbounds %struct.DLL* %0, i64 %idxprom14, !dbg !304
  %prev17 = getelementptr inbounds i8* %call1, i64 16, !dbg !305
  %4 = bitcast i8* %prev17 to %struct.DLL**, !dbg !305
  store %struct.DLL* %arrayidx15, %struct.DLL** %4, align 8, !dbg !305, !tbaa !136
  %next21 = getelementptr inbounds %struct.DLL* %0, i64 %idxprom14, i32 1, !dbg !306
  %5 = bitcast %struct.DLL** %next21 to i8**, !dbg !306
  store i8* %call1, i8** %5, align 8, !dbg !306, !tbaa !144
  %call22 = tail call fastcc %struct.DLL* @list_last(%struct.DLL* %x), !dbg !307
  %val23 = getelementptr inbounds %struct.DLL* %call22, i64 0, i32 0, !dbg !307
  %6 = load i32* %val23, align 4, !dbg !307, !tbaa !149
  %val26 = getelementptr inbounds %struct.DLL* %arrayidx15, i64 0, i32 0, !dbg !308
  store i32 %6, i32* %val26, align 4, !dbg !308, !tbaa !149
  ret %struct.DLL* %0, !dbg !309
}

; Function Attrs: nounwind readonly uwtable
define internal fastcc %struct.DLL* @list_last(%struct.DLL* nocapture readonly %head) #1 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.DLL* %head, i64 0, metadata !120, metadata !132), !dbg !310
  %prev = getelementptr inbounds %struct.DLL* %head, i64 0, i32 2, !dbg !311
  %0 = load %struct.DLL** %prev, align 8, !dbg !311, !tbaa !136
  ret %struct.DLL* %0, !dbg !312
}

; Function Attrs: nounwind uwtable
define void @list_reverse(%struct.DLL* %head) #0 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.DLL* %head, i64 0, metadata !87, metadata !132), !dbg !313
  tail call void @llvm.dbg.value(metadata %struct.DLL* %head, i64 0, metadata !89, metadata !132), !dbg !314
  br label %do.body, !dbg !315

do.body:                                          ; preds = %do.body, %entry
  %p.0 = phi %struct.DLL* [ %head, %entry ], [ %0, %do.body ]
  %next = getelementptr inbounds %struct.DLL* %p.0, i64 0, i32 1, !dbg !316
  %0 = load %struct.DLL** %next, align 8, !dbg !316, !tbaa !144
  tail call void @llvm.dbg.value(metadata %struct.DLL* %0, i64 0, metadata !88, metadata !132), !dbg !318
  %prev = getelementptr inbounds %struct.DLL* %p.0, i64 0, i32 2, !dbg !319
  %1 = load %struct.DLL** %prev, align 8, !dbg !319, !tbaa !136
  store %struct.DLL* %1, %struct.DLL** %next, align 8, !dbg !320, !tbaa !144
  store %struct.DLL* %0, %struct.DLL** %prev, align 8, !dbg !321, !tbaa !136
  tail call void @llvm.dbg.value(metadata %struct.DLL* %0, i64 0, metadata !89, metadata !132), !dbg !314
  %cmp = icmp eq %struct.DLL* %0, %head, !dbg !322
  br i1 %cmp, label %do.end, label %do.body, !dbg !323

do.end:                                           ; preds = %do.body
  ret void, !dbg !324
}

; Function Attrs: nounwind uwtable
define i32 @test_lists() #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !94, metadata !132), !dbg !325
  %call = tail call %struct.DLL* @list_sequence(i32 1, i32 100), !dbg !326
  tail call void @llvm.dbg.value(metadata %struct.DLL* %call, i64 0, metadata !95, metadata !132), !dbg !327
  %call1 = tail call %struct.DLL* @list_copy(%struct.DLL* %call), !dbg !328
  tail call void @llvm.dbg.value(metadata %struct.DLL* %call1, i64 0, metadata !96, metadata !132), !dbg !329
  %call2 = tail call %struct.DLL* @list_new(), !dbg !330
  tail call void @llvm.dbg.value(metadata %struct.DLL* %call2, i64 0, metadata !97, metadata !132), !dbg !331
  %call3 = tail call i32 @list_equal(%struct.DLL* %call1, %struct.DLL* %call), !dbg !332
  %tobool = icmp eq i32 %call3, 0, !dbg !334
  br i1 %tobool, label %if.then, label %while.cond.preheader, !dbg !334

while.cond.preheader:                             ; preds = %entry
  %call594 = tail call fastcc i32 @list_empty(%struct.DLL* %call1), !dbg !335
  %lnot95 = icmp eq i32 %call594, 0, !dbg !336
  br i1 %lnot95, label %while.body, label %while.cond13.preheader, !dbg !337

if.then:                                          ; preds = %entry
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([26 x i8]* @str13, i64 0, i64 0)) #6, !dbg !338
  tail call void @exit(i32 1) #7, !dbg !340
  unreachable, !dbg !340

while.cond13.preheader:                           ; preds = %while.body, %while.cond.preheader
  %call1492 = tail call fastcc i32 @list_empty(%struct.DLL* %call2), !dbg !341
  %lnot1693 = icmp eq i32 %call1492, 0, !dbg !342
  br i1 %lnot1693, label %while.body17, label %if.end24, !dbg !343

while.body:                                       ; preds = %while.cond.preheader, %while.body
  %call7 = tail call %struct.DLL* @list_pop_head(%struct.DLL* %call1), !dbg !344
  tail call void @list_push_tail(%struct.DLL* %call2, %struct.DLL* %call7), !dbg !346
  %call5 = tail call fastcc i32 @list_empty(%struct.DLL* %call1), !dbg !335
  %lnot = icmp eq i32 %call5, 0, !dbg !336
  br i1 %lnot, label %while.body, label %while.cond13.preheader, !dbg !337

while.body17:                                     ; preds = %while.cond13.preheader, %while.body17
  %call18 = tail call %struct.DLL* @list_pop_tail(%struct.DLL* %call2), !dbg !347
  tail call void @list_push_tail(%struct.DLL* %call1, %struct.DLL* %call18), !dbg !349
  %call14 = tail call fastcc i32 @list_empty(%struct.DLL* %call2), !dbg !341
  %lnot16 = icmp eq i32 %call14, 0, !dbg !342
  br i1 %lnot16, label %while.body17, label %if.end24, !dbg !343

if.end24:                                         ; preds = %while.body17, %while.cond13.preheader
  tail call void @list_reverse(%struct.DLL* %call), !dbg !350
  %call25 = tail call fastcc %struct.DLL* @list_first(%struct.DLL* %call), !dbg !351
  %val = getelementptr inbounds %struct.DLL* %call25, i64 0, i32 0, !dbg !351
  %0 = load i32* %val, align 4, !dbg !351, !tbaa !149
  %cmp = icmp eq i32 %0, 100, !dbg !351
  br i1 %cmp, label %if.end30, label %if.then26, !dbg !353

if.then26:                                        ; preds = %if.end24
  %call29 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([42 x i8]* @.str7, i64 0, i64 0), i32 100, i32 %0) #6, !dbg !354
  tail call void @exit(i32 1) #7, !dbg !356
  unreachable, !dbg !356

if.end30:                                         ; preds = %if.end24
  %call31 = tail call fastcc %struct.DLL* @list_last(%struct.DLL* %call), !dbg !357
  %val32 = getelementptr inbounds %struct.DLL* %call31, i64 0, i32 0, !dbg !357
  %1 = load i32* %val32, align 4, !dbg !357, !tbaa !149
  %cmp33 = icmp eq i32 %1, 1, !dbg !357
  br i1 %cmp33, label %if.end38, label %if.then34, !dbg !359

if.then34:                                        ; preds = %if.end30
  %call37 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str8, i64 0, i64 0), i32 100, i32 %1) #6, !dbg !360
  tail call void @exit(i32 1) #7, !dbg !362
  unreachable, !dbg !362

if.end38:                                         ; preds = %if.end30
  %call39 = tail call fastcc %struct.DLL* @list_first(%struct.DLL* %call1), !dbg !363
  %val40 = getelementptr inbounds %struct.DLL* %call39, i64 0, i32 0, !dbg !363
  %2 = load i32* %val40, align 4, !dbg !363, !tbaa !149
  %cmp41 = icmp eq i32 %2, 100, !dbg !363
  br i1 %cmp41, label %if.end46, label %if.then42, !dbg !365

if.then42:                                        ; preds = %if.end38
  %call45 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([42 x i8]* @.str9, i64 0, i64 0), i32 100, i32 %2) #6, !dbg !366
  tail call void @exit(i32 1) #7, !dbg !368
  unreachable, !dbg !368

if.end46:                                         ; preds = %if.end38
  %call47 = tail call fastcc %struct.DLL* @list_last(%struct.DLL* %call1), !dbg !369
  %val48 = getelementptr inbounds %struct.DLL* %call47, i64 0, i32 0, !dbg !369
  %3 = load i32* %val48, align 4, !dbg !369, !tbaa !149
  %cmp49 = icmp eq i32 %3, 1, !dbg !369
  br i1 %cmp49, label %if.end54, label %if.then50, !dbg !371

if.then50:                                        ; preds = %if.end46
  %call53 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str8, i64 0, i64 0), i32 100, i32 %3) #6, !dbg !372
  tail call void @exit(i32 1) #7, !dbg !374
  unreachable, !dbg !374

if.end54:                                         ; preds = %if.end46
  %call55 = tail call fastcc i32 @list_length(%struct.DLL* %call), !dbg !375
  %cmp56 = icmp eq i32 %call55, 100, !dbg !375
  br i1 %cmp56, label %if.end60, label %if.then57, !dbg !377

if.then57:                                        ; preds = %if.end54
  %call59 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([35 x i8]* @.str10, i64 0, i64 0), i32 100, i32 %call55) #6, !dbg !378
  tail call void @exit(i32 1) #7, !dbg !380
  unreachable, !dbg !380

if.end60:                                         ; preds = %if.end54
  %call61 = tail call i32 @list_equal(%struct.DLL* %call, %struct.DLL* %call1), !dbg !381
  %tobool62 = icmp eq i32 %call61, 0, !dbg !383
  br i1 %tobool62, label %if.then63, label %if.end65, !dbg !383

if.then63:                                        ; preds = %if.end60
  %puts91 = tail call i32 @puts(i8* getelementptr inbounds ([26 x i8]* @str16, i64 0, i64 0)) #6, !dbg !384
  tail call void @exit(i32 1) #7, !dbg !386
  unreachable, !dbg !386

if.end65:                                         ; preds = %if.end60
  tail call void @llvm.dbg.value(metadata i32 %call55, i64 0, metadata !94, metadata !132), !dbg !325
  %4 = bitcast %struct.DLL* %call to i8*, !dbg !387
  tail call void @free(i8* %4) #6, !dbg !388
  %5 = bitcast %struct.DLL* %call1 to i8*, !dbg !389
  tail call void @free(i8* %5) #6, !dbg !390
  %6 = bitcast %struct.DLL* %call2 to i8*, !dbg !391
  tail call void @free(i8* %6) #6, !dbg !392
  ret i32 %call55, !dbg !393
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

; Function Attrs: nounwind readonly uwtable
define internal fastcc %struct.DLL* @list_first(%struct.DLL* nocapture readonly %head) #1 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.DLL* %head, i64 0, metadata !117, metadata !132), !dbg !394
  %next = getelementptr inbounds %struct.DLL* %head, i64 0, i32 1, !dbg !395
  %0 = load %struct.DLL** %next, align 8, !dbg !395, !tbaa !144
  ret %struct.DLL* %0, !dbg !396
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #2

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !102, metadata !132), !dbg !397
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !103, metadata !132), !dbg !398
  %cmp = icmp eq i32 %argc, 2, !dbg !399
  br i1 %cmp, label %while.cond.preheader, label %while.body, !dbg !400

while.cond.preheader:                             ; preds = %entry
  %arrayidx = getelementptr inbounds i8** %argv, i64 1, !dbg !401
  %0 = load i8** %arrayidx, align 8, !dbg !401, !tbaa !403
  %call = tail call i32 @atoi(i8* %0) #8, !dbg !404
  tail call void @llvm.dbg.value(metadata i32 %dec, i64 0, metadata !104, metadata !132), !dbg !405
  %tobool3 = icmp eq i32 %call, 0, !dbg !406
  br i1 %tobool3, label %while.end, label %while.body, !dbg !406

while.body:                                       ; preds = %entry, %while.cond.preheader, %while.body
  %n.04 = phi i32 [ %dec, %while.body ], [ 3000000, %entry ], [ %call, %while.cond.preheader ]
  %dec = add nsw i32 %n.04, -1, !dbg !407
  %call1 = tail call i32 @test_lists(), !dbg !409
  tail call void @llvm.dbg.value(metadata i32 %call1, i64 0, metadata !105, metadata !132), !dbg !411
  tail call void @llvm.dbg.value(metadata i32 %dec, i64 0, metadata !104, metadata !132), !dbg !405
  %tobool = icmp eq i32 %dec, 0, !dbg !406
  br i1 %tobool, label %while.end, label %while.body, !dbg !406

while.end:                                        ; preds = %while.body, %while.cond.preheader
  %result.0.lcssa = phi i32 [ 0, %while.cond.preheader ], [ %call1, %while.body ]
  %call2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str12, i64 0, i64 0), i32 %result.0.lcssa) #6, !dbg !412
  ret i32 0, !dbg !413
}

; Function Attrs: inlinehint nounwind readonly uwtable
define available_externally i32 @atoi(i8* nocapture nonnull readonly %__nptr) #4 {
entry:
  tail call void @llvm.dbg.value(metadata i8* %__nptr, i64 0, metadata !114, metadata !132), !dbg !414
  %call = tail call i64 @strtol(i8* nocapture %__nptr, i8** null, i32 10) #6, !dbg !415
  %conv = trunc i64 %call to i32, !dbg !416
  ret i32 %conv, !dbg !417
}

; Function Attrs: nounwind
declare i64 @strtol(i8* readonly, i8** nocapture, i32) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #5

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { inlinehint nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }
attributes #8 = { nounwind readonly }

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
!106 = !{!"0x2e\00atoi\00atoi\00\00278\000\001\000\000\00256\001\00279", !107, !108, !109, null, i32 (i8*)* @atoi, null, null, !113} ; [ DW_TAG_subprogram ] [line 278] [def] [scope 279] [atoi]
!107 = !{!"/usr/include/stdlib.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!108 = !{!"0x29", !107}                           ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base//usr/include/stdlib.h]
!109 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !110, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!110 = !{!9, !111}
!111 = !{!"0xf\00\000\0064\0064\000\000", null, null, !112} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!112 = !{!"0x26\00\000\000\000\000\000", null, null, !15} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!113 = !{!114}
!114 = !{!"0x101\00__nptr\0016777494\000", !106, !108, !111} ; [ DW_TAG_arg_variable ] [__nptr] [line 278]
!115 = !{!"0x2e\00list_first\00list_first\00\0023\001\001\000\000\00256\001\0023", !1, !19, !27, null, %struct.DLL* (%struct.DLL*)* @list_first, null, null, !116} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [list_first]
!116 = !{!117}
!117 = !{!"0x101\00head\0016777239\000", !115, !19, !4} ; [ DW_TAG_arg_variable ] [head] [line 23]
!118 = !{!"0x2e\00list_last\00list_last\00\0024\001\001\000\000\00256\001\0024", !1, !19, !27, null, %struct.DLL* (%struct.DLL*)* @list_last, null, null, !119} ; [ DW_TAG_subprogram ] [line 24] [local] [def] [list_last]
!119 = !{!120}
!120 = !{!"0x101\00head\0016777240\000", !118, !19, !4} ; [ DW_TAG_arg_variable ] [head] [line 24]
!121 = !{!"0x2e\00list_length\00list_length\00\0021\001\001\000\000\00256\001\0021", !1, !19, !122, null, i32 (%struct.DLL*)* @list_length, null, null, !124} ; [ DW_TAG_subprogram ] [line 21] [local] [def] [list_length]
!122 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !123, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!123 = !{!9, !4}
!124 = !{!125}
!125 = !{!"0x101\00head\0016777237\000", !121, !19, !4} ; [ DW_TAG_arg_variable ] [head] [line 21]
!126 = !{!"0x2e\00list_empty\00list_empty\00\0022\001\001\000\000\00256\001\0022", !1, !19, !122, null, i32 (%struct.DLL*)* @list_empty, null, null, !127} ; [ DW_TAG_subprogram ] [line 22] [local] [def] [list_empty]
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
!152 = !MDLocation(line: 37, column: 7, scope: !153)
!153 = !{!"0xb\0037\007\000", !1, !26}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!154 = !MDLocation(line: 37, column: 7, scope: !26)
!155 = !MDLocation(line: 38, column: 10, scope: !26)
!156 = !MDLocation(line: 36, column: 15, scope: !26)
!157 = !MDLocation(line: 39, column: 10, scope: !26)
!158 = !MDLocation(line: 36, column: 8, scope: !26)
!159 = !MDLocation(line: 40, column: 3, scope: !26)
!160 = !MDLocation(line: 41, column: 3, scope: !26)
!161 = !MDLocation(line: 42, column: 3, scope: !26)
!162 = !MDLocation(line: 43, column: 3, scope: !26)
!163 = !MDLocation(line: 44, column: 1, scope: !26)
!164 = !MDLocation(line: 22, column: 28, scope: !126)
!165 = !MDLocation(line: 22, column: 43, scope: !126)
!166 = !MDLocation(line: 22, column: 36, scope: !126)
!167 = !MDLocation(line: 46, column: 26, scope: !33)
!168 = !MDLocation(line: 46, column: 37, scope: !33)
!169 = !MDLocation(line: 47, column: 15, scope: !33)
!170 = !MDLocation(line: 47, column: 8, scope: !33)
!171 = !MDLocation(line: 48, column: 3, scope: !33)
!172 = !MDLocation(line: 49, column: 3, scope: !33)
!173 = !MDLocation(line: 50, column: 3, scope: !33)
!174 = !MDLocation(line: 51, column: 3, scope: !33)
!175 = !MDLocation(line: 52, column: 3, scope: !33)
!176 = !MDLocation(line: 53, column: 1, scope: !33)
!177 = !MDLocation(line: 55, column: 25, scope: !38)
!178 = !MDLocation(line: 57, column: 7, scope: !179)
!179 = !{!"0xb\0057\007\001", !1, !38}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!180 = !MDLocation(line: 57, column: 7, scope: !38)
!181 = !MDLocation(line: 58, column: 10, scope: !38)
!182 = !MDLocation(line: 56, column: 8, scope: !38)
!183 = !MDLocation(line: 59, column: 16, scope: !38)
!184 = !MDLocation(line: 59, column: 3, scope: !38)
!185 = !MDLocation(line: 60, column: 3, scope: !38)
!186 = !MDLocation(line: 61, column: 3, scope: !38)
!187 = !MDLocation(line: 62, column: 3, scope: !38)
!188 = !MDLocation(line: 63, column: 1, scope: !38)
!189 = !MDLocation(line: 65, column: 21, scope: !42)
!190 = !MDLocation(line: 65, column: 29, scope: !42)
!191 = !MDLocation(line: 66, column: 8, scope: !42)
!192 = !MDLocation(line: 66, column: 13, scope: !42)
!193 = !MDLocation(line: 68, column: 20, scope: !194)
!194 = !{!"0xb\002", !1, !195}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!195 = !{!"0xb\001", !1, !196}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!196 = !{!"0xb\0068\003\003", !1, !197}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!197 = !{!"0xb\0068\003\002", !1, !42}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!198 = !MDLocation(line: 68, column: 20, scope: !196)
!199 = !MDLocation(line: 69, column: 9, scope: !200)
!200 = !{!"0xb\0069\009\005", !1, !201}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!201 = !{!"0xb\0068\0061\004", !1, !196}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!202 = !MDLocation(line: 69, column: 20, scope: !200)
!203 = !MDLocation(line: 68, column: 3, scope: !197)
!204 = !MDLocation(line: 69, column: 9, scope: !201)
!205 = !MDLocation(line: 68, column: 51, scope: !196)
!206 = !MDLocation(line: 71, column: 7, scope: !42)
!207 = !MDLocation(line: 72, column: 10, scope: !42)
!208 = !MDLocation(line: 72, column: 3, scope: !42)
!209 = !MDLocation(line: 73, column: 1, scope: !42)
!210 = !MDLocation(line: 75, column: 23, scope: !50)
!211 = !MDLocation(line: 75, column: 33, scope: !50)
!212 = !MDLocation(line: 76, column: 21, scope: !50)
!213 = !MDLocation(line: 76, column: 13, scope: !50)
!214 = !MDLocation(line: 77, column: 7, scope: !50)
!215 = !MDLocation(line: 78, column: 3, scope: !50)
!216 = !MDLocation(line: 79, column: 26, scope: !50)
!217 = !MDLocation(line: 79, column: 3, scope: !50)
!218 = !MDLocation(line: 80, column: 11, scope: !219)
!219 = !{!"0xb\0080\003\007", !1, !50}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!220 = !MDLocation(line: 80, column: 20, scope: !221)
!221 = !{!"0xb\002", !1, !222}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!222 = !{!"0xb\001", !1, !223}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!223 = !{!"0xb\0080\003\008", !1, !219}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!224 = !MDLocation(line: 80, column: 20, scope: !223)
!225 = !MDLocation(line: 80, column: 3, scope: !219)
!226 = !MDLocation(line: 81, column: 44, scope: !227)
!227 = !{!"0xb\0080\0052\009", !1, !223}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!228 = !MDLocation(line: 82, column: 12, scope: !227)
!229 = !MDLocation(line: 82, column: 21, scope: !227)
!230 = !MDLocation(line: 82, column: 36, scope: !227)
!231 = !MDLocation(line: 81, column: 5, scope: !227)
!232 = !MDLocation(line: 84, column: 3, scope: !50)
!233 = !MDLocation(line: 85, column: 45, scope: !50)
!234 = !MDLocation(line: 85, column: 3, scope: !50)
!235 = !MDLocation(line: 86, column: 1, scope: !50)
!236 = !MDLocation(line: 21, column: 29, scope: !121)
!237 = !MDLocation(line: 21, column: 44, scope: !121)
!238 = !MDLocation(line: 21, column: 37, scope: !121)
!239 = !MDLocation(line: 89, column: 19, scope: !59)
!240 = !MDLocation(line: 89, column: 12, scope: !59)
!241 = !MDLocation(line: 89, column: 8, scope: !59)
!242 = !MDLocation(line: 90, column: 3, scope: !59)
!243 = !MDLocation(line: 91, column: 3, scope: !59)
!244 = !MDLocation(line: 92, column: 3, scope: !59)
!245 = !MDLocation(line: 93, column: 3, scope: !59)
!246 = !MDLocation(line: 97, column: 24, scope: !64)
!247 = !MDLocation(line: 97, column: 34, scope: !64)
!248 = !MDLocation(line: 100, column: 7, scope: !249)
!249 = !{!"0xb\00100\007\0010", !1, !64}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!250 = !MDLocation(line: 98, column: 13, scope: !64)
!251 = !MDLocation(line: 100, column: 7, scope: !64)
!252 = !MDLocation(line: 103, column: 10, scope: !64)
!253 = !MDLocation(line: 98, column: 7, scope: !64)
!254 = !MDLocation(line: 104, column: 22, scope: !64)
!255 = !MDLocation(line: 104, column: 21, scope: !64)
!256 = !MDLocation(line: 104, column: 14, scope: !64)
!257 = !MDLocation(line: 104, column: 7, scope: !64)
!258 = !MDLocation(line: 99, column: 8, scope: !64)
!259 = !MDLocation(line: 105, column: 3, scope: !64)
!260 = !MDLocation(line: 98, column: 18, scope: !64)
!261 = !MDLocation(line: 98, column: 21, scope: !64)
!262 = !MDLocation(line: 106, column: 18, scope: !263)
!263 = !{!"0xb\00106\003\0013", !1, !264}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!264 = !{!"0xb\00106\003\0012", !1, !64}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!265 = !MDLocation(line: 106, column: 3, scope: !264)
!266 = !MDLocation(line: 107, column: 17, scope: !267)
!267 = !{!"0xb\00106\0036\0014", !1, !263}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!268 = !MDLocation(line: 107, column: 5, scope: !267)
!269 = !MDLocation(line: 108, column: 20, scope: !267)
!270 = !MDLocation(line: 108, column: 17, scope: !267)
!271 = !MDLocation(line: 108, column: 5, scope: !267)
!272 = !MDLocation(line: 109, column: 16, scope: !267)
!273 = !MDLocation(line: 109, column: 5, scope: !267)
!274 = !MDLocation(line: 111, column: 15, scope: !64)
!275 = !MDLocation(line: 111, column: 3, scope: !64)
!276 = !MDLocation(line: 112, column: 3, scope: !64)
!277 = !MDLocation(line: 113, column: 18, scope: !64)
!278 = !MDLocation(line: 113, column: 3, scope: !64)
!279 = !MDLocation(line: 114, column: 3, scope: !64)
!280 = !MDLocation(line: 115, column: 3, scope: !64)
!281 = !MDLocation(line: 116, column: 3, scope: !64)
!282 = !MDLocation(line: 118, column: 21, scope: !75)
!283 = !MDLocation(line: 119, column: 20, scope: !75)
!284 = !MDLocation(line: 119, column: 13, scope: !75)
!285 = !MDLocation(line: 120, column: 32, scope: !75)
!286 = !MDLocation(line: 120, column: 31, scope: !75)
!287 = !MDLocation(line: 120, column: 24, scope: !75)
!288 = !MDLocation(line: 120, column: 17, scope: !75)
!289 = !MDLocation(line: 120, column: 13, scope: !75)
!290 = !MDLocation(line: 119, column: 7, scope: !75)
!291 = !MDLocation(line: 119, column: 10, scope: !75)
!292 = !MDLocation(line: 120, column: 8, scope: !75)
!293 = !MDLocation(line: 121, column: 24, scope: !294)
!294 = !{!"0xb\00121\003\0016", !1, !295}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!295 = !{!"0xb\00121\003\0015", !1, !75}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!296 = !MDLocation(line: 121, column: 3, scope: !295)
!297 = !MDLocation(line: 122, column: 17, scope: !298)
!298 = !{!"0xb\00121\0055\0017", !1, !294}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!299 = !MDLocation(line: 122, column: 5, scope: !298)
!300 = !MDLocation(line: 123, column: 5, scope: !298)
!301 = !MDLocation(line: 124, column: 16, scope: !298)
!302 = !MDLocation(line: 124, column: 5, scope: !298)
!303 = !MDLocation(line: 121, column: 45, scope: !294)
!304 = !MDLocation(line: 126, column: 15, scope: !75)
!305 = !MDLocation(line: 126, column: 3, scope: !75)
!306 = !MDLocation(line: 127, column: 3, scope: !75)
!307 = !MDLocation(line: 128, column: 17, scope: !75)
!308 = !MDLocation(line: 128, column: 3, scope: !75)
!309 = !MDLocation(line: 129, column: 3, scope: !75)
!310 = !MDLocation(line: 24, column: 28, scope: !118)
!311 = !MDLocation(line: 24, column: 43, scope: !118)
!312 = !MDLocation(line: 24, column: 36, scope: !118)
!313 = !MDLocation(line: 132, column: 25, scope: !83)
!314 = !MDLocation(line: 133, column: 14, scope: !83)
!315 = !MDLocation(line: 134, column: 3, scope: !83)
!316 = !MDLocation(line: 135, column: 11, scope: !317)
!317 = !{!"0xb\00134\006\0018", !1, !83}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!318 = !MDLocation(line: 133, column: 8, scope: !83)
!319 = !MDLocation(line: 136, column: 15, scope: !317)
!320 = !MDLocation(line: 136, column: 5, scope: !317)
!321 = !MDLocation(line: 137, column: 5, scope: !317)
!322 = !MDLocation(line: 139, column: 12, scope: !83)
!323 = !MDLocation(line: 139, column: 3, scope: !317)
!324 = !MDLocation(line: 140, column: 1, scope: !83)
!325 = !MDLocation(line: 143, column: 7, scope: !90)
!326 = !MDLocation(line: 145, column: 14, scope: !90)
!327 = !MDLocation(line: 145, column: 8, scope: !90)
!328 = !MDLocation(line: 147, column: 14, scope: !90)
!329 = !MDLocation(line: 147, column: 8, scope: !90)
!330 = !MDLocation(line: 150, column: 14, scope: !90)
!331 = !MDLocation(line: 150, column: 8, scope: !90)
!332 = !MDLocation(line: 152, column: 8, scope: !333)
!333 = !{!"0xb\00152\007\0019", !1, !90}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!334 = !MDLocation(line: 152, column: 7, scope: !90)
!335 = !MDLocation(line: 156, column: 11, scope: !90)
!336 = !MDLocation(line: 156, column: 10, scope: !90)
!337 = !MDLocation(line: 156, column: 3, scope: !90)
!338 = !MDLocation(line: 153, column: 5, scope: !339)
!339 = !{!"0xb\00152\0030\0020", !1, !333}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!340 = !MDLocation(line: 154, column: 5, scope: !339)
!341 = !MDLocation(line: 166, column: 11, scope: !90)
!342 = !MDLocation(line: 166, column: 10, scope: !90)
!343 = !MDLocation(line: 166, column: 3, scope: !90)
!344 = !MDLocation(line: 157, column: 25, scope: !345)
!345 = !{!"0xb\00156\0028\0021", !1, !90}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!346 = !MDLocation(line: 157, column: 5, scope: !345)
!347 = !MDLocation(line: 167, column: 25, scope: !348)
!348 = !{!"0xb\00166\0028\0024", !1, !90}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!349 = !MDLocation(line: 167, column: 5, scope: !348)
!350 = !MDLocation(line: 175, column: 3, scope: !90)
!351 = !MDLocation(line: 177, column: 7, scope: !352)
!352 = !{!"0xb\00177\007\0027", !1, !90}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!353 = !MDLocation(line: 177, column: 7, scope: !90)
!354 = !MDLocation(line: 178, column: 5, scope: !355)
!355 = !{!"0xb\00177\0037\0028", !1, !352}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!356 = !MDLocation(line: 180, column: 5, scope: !355)
!357 = !MDLocation(line: 183, column: 7, scope: !358)
!358 = !{!"0xb\00183\007\0029", !1, !90}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!359 = !MDLocation(line: 183, column: 7, scope: !90)
!360 = !MDLocation(line: 184, column: 5, scope: !361)
!361 = !{!"0xb\00183\0033\0030", !1, !358}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!362 = !MDLocation(line: 186, column: 5, scope: !361)
!363 = !MDLocation(line: 189, column: 7, scope: !364)
!364 = !{!"0xb\00189\007\0031", !1, !90}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!365 = !MDLocation(line: 189, column: 7, scope: !90)
!366 = !MDLocation(line: 190, column: 5, scope: !367)
!367 = !{!"0xb\00189\0037\0032", !1, !364}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!368 = !MDLocation(line: 192, column: 5, scope: !367)
!369 = !MDLocation(line: 195, column: 7, scope: !370)
!370 = !{!"0xb\00195\007\0033", !1, !90}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!371 = !MDLocation(line: 195, column: 7, scope: !90)
!372 = !MDLocation(line: 196, column: 5, scope: !373)
!373 = !{!"0xb\00195\0033\0034", !1, !370}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!374 = !MDLocation(line: 198, column: 5, scope: !373)
!375 = !MDLocation(line: 201, column: 7, scope: !376)
!376 = !{!"0xb\00201\007\0035", !1, !90}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!377 = !MDLocation(line: 201, column: 7, scope: !90)
!378 = !MDLocation(line: 202, column: 5, scope: !379)
!379 = !{!"0xb\00201\0033\0036", !1, !376}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!380 = !MDLocation(line: 204, column: 5, scope: !379)
!381 = !MDLocation(line: 207, column: 8, scope: !382)
!382 = !{!"0xb\00207\007\0037", !1, !90}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!383 = !MDLocation(line: 207, column: 7, scope: !90)
!384 = !MDLocation(line: 208, column: 5, scope: !385)
!385 = !{!"0xb\00207\0030\0038", !1, !382}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!386 = !MDLocation(line: 209, column: 5, scope: !385)
!387 = !MDLocation(line: 212, column: 8, scope: !90)
!388 = !MDLocation(line: 212, column: 3, scope: !90)
!389 = !MDLocation(line: 213, column: 8, scope: !90)
!390 = !MDLocation(line: 213, column: 3, scope: !90)
!391 = !MDLocation(line: 214, column: 8, scope: !90)
!392 = !MDLocation(line: 214, column: 3, scope: !90)
!393 = !MDLocation(line: 216, column: 3, scope: !90)
!394 = !MDLocation(line: 23, column: 29, scope: !115)
!395 = !MDLocation(line: 23, column: 44, scope: !115)
!396 = !MDLocation(line: 23, column: 37, scope: !115)
!397 = !MDLocation(line: 219, column: 14, scope: !98)
!398 = !MDLocation(line: 219, column: 26, scope: !98)
!399 = !MDLocation(line: 225, column: 13, scope: !98)
!400 = !MDLocation(line: 225, column: 12, scope: !98)
!401 = !MDLocation(line: 225, column: 31, scope: !402)
!402 = !{!"0xb\001", !1, !98}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!403 = !{!141, !141, i64 0}
!404 = !MDLocation(line: 225, column: 26, scope: !98)
!405 = !MDLocation(line: 225, column: 7, scope: !98)
!406 = !MDLocation(line: 227, column: 3, scope: !98)
!407 = !MDLocation(line: 227, column: 9, scope: !408)
!408 = !{!"0xb\003", !1, !402}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!409 = !MDLocation(line: 227, column: 23, scope: !410)
!410 = !{!"0xb\002", !1, !98}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!411 = !MDLocation(line: 226, column: 7, scope: !98)
!412 = !MDLocation(line: 228, column: 3, scope: !98)
!413 = !MDLocation(line: 229, column: 3, scope: !98)
!414 = !MDLocation(line: 278, column: 1, scope: !106)
!415 = !MDLocation(line: 280, column: 16, scope: !106)
!416 = !MDLocation(line: 280, column: 10, scope: !106)
!417 = !MDLocation(line: 280, column: 3, scope: !106)
