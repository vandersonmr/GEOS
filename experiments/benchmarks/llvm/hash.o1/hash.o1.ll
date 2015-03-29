; ModuleID = 'hash.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.ht_node = type { i8*, i32, %struct.ht_node* }
%struct.ht_ht = type { i32, %struct.ht_node**, i32, %struct.ht_node*, i32 }

@.str = private unnamed_addr constant [15 x i8] c"malloc ht_node\00", align 1
@.str1 = private unnamed_addr constant [14 x i8] c"strdup newkey\00", align 1
@ht_prime_list = internal unnamed_addr constant [28 x i64] [i64 53, i64 97, i64 193, i64 389, i64 769, i64 1543, i64 3079, i64 6151, i64 12289, i64 24593, i64 49157, i64 98317, i64 196613, i64 393241, i64 786433, i64 1572869, i64 3145739, i64 6291469, i64 12582917, i64 25165843, i64 50331653, i64 100663319, i64 201326611, i64 402653189, i64 805306457, i64 1610612741, i64 3221225473, i64 4294967291], align 16
@.str2 = private unnamed_addr constant [3 x i8] c"%x\00", align 1
@.str3 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str4 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define noalias %struct.ht_node* @ht_node_create(i8* nocapture readonly %key) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i8* %key, i64 0, metadata !31, metadata !116), !dbg !117
  %call = tail call noalias i8* @malloc(i64 24) #7, !dbg !118
  %0 = bitcast i8* %call to %struct.ht_node*, !dbg !120
  tail call void @llvm.dbg.value(metadata %struct.ht_node* %0, i64 0, metadata !33, metadata !116), !dbg !121
  %cmp = icmp eq i8* %call, null, !dbg !122
  br i1 %cmp, label %if.then, label %if.end, !dbg !123

if.then:                                          ; preds = %entry
  tail call void @perror(i8* getelementptr inbounds ([15 x i8]* @.str, i64 0, i64 0)) #8, !dbg !124
  tail call void @exit(i32 1) #9, !dbg !126
  unreachable, !dbg !126

if.end:                                           ; preds = %entry
  %call1 = tail call noalias i8* @__strdup(i8* %key) #7, !dbg !127
  tail call void @llvm.dbg.value(metadata i8* %call1, i64 0, metadata !32, metadata !116), !dbg !129
  %cmp2 = icmp eq i8* %call1, null, !dbg !130
  br i1 %cmp2, label %if.then3, label %if.end4, !dbg !131

if.then3:                                         ; preds = %if.end
  tail call void @perror(i8* getelementptr inbounds ([14 x i8]* @.str1, i64 0, i64 0)) #8, !dbg !132
  tail call void @exit(i32 1) #9, !dbg !134
  unreachable, !dbg !134

if.end4:                                          ; preds = %if.end
  %key5 = bitcast i8* %call to i8**, !dbg !135
  store i8* %call1, i8** %key5, align 8, !dbg !135, !tbaa !136
  %val = getelementptr inbounds i8* %call, i64 8, !dbg !142
  %1 = bitcast i8* %val to i32*, !dbg !142
  store i32 0, i32* %1, align 4, !dbg !142, !tbaa !143
  %next = getelementptr inbounds i8* %call, i64 16, !dbg !144
  %2 = bitcast i8* %next to %struct.ht_node**, !dbg !144
  store %struct.ht_node* null, %struct.ht_node** %2, align 8, !dbg !144, !tbaa !145
  ret %struct.ht_node* %0, !dbg !146
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind
declare void @perror(i8* nocapture readonly) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

; Function Attrs: nounwind
declare noalias i8* @__strdup(i8* nocapture readonly) #2

; Function Attrs: nounwind uwtable
define noalias %struct.ht_ht* @ht_create(i32 %size) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %size, i64 0, metadata !38, metadata !116), !dbg !147
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !39, metadata !116), !dbg !148
  %call = tail call noalias i8* @malloc(i64 40) #7, !dbg !149
  tail call void @llvm.dbg.value(metadata %struct.ht_ht* %1, i64 0, metadata !40, metadata !116), !dbg !150
  %conv = sext i32 %size to i64, !dbg !151
  br label %while.cond, !dbg !152

while.cond:                                       ; preds = %while.cond, %entry
  %indvars.iv = phi i64 [ %indvars.iv.next, %while.cond ], [ 0, %entry ]
  %arrayidx = getelementptr inbounds [28 x i64]* @ht_prime_list, i64 0, i64 %indvars.iv, !dbg !153
  %0 = load i64* %arrayidx, align 8, !dbg !153, !tbaa !154
  %cmp = icmp ult i64 %0, %conv, !dbg !153
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !152
  br i1 %cmp, label %while.cond, label %while.end, !dbg !152

while.end:                                        ; preds = %while.cond
  %1 = bitcast i8* %call to %struct.ht_ht*, !dbg !156
  %conv4 = trunc i64 %0 to i32, !dbg !157
  %size5 = bitcast i8* %call to i32*, !dbg !158
  store i32 %conv4, i32* %size5, align 4, !dbg !158, !tbaa !159
  %sext = shl i64 %0, 32, !dbg !161
  %conv7 = ashr exact i64 %sext, 32, !dbg !161
  %call8 = tail call noalias i8* @calloc(i64 %conv7, i64 8) #7, !dbg !162
  %tbl = getelementptr inbounds i8* %call, i64 8, !dbg !163
  %2 = bitcast i8* %tbl to i8**, !dbg !163
  store i8* %call8, i8** %2, align 8, !dbg !163, !tbaa !164
  %iter_index = getelementptr inbounds i8* %call, i64 16, !dbg !165
  %3 = bitcast i8* %iter_index to i32*, !dbg !165
  store i32 0, i32* %3, align 4, !dbg !165, !tbaa !166
  %iter_next = getelementptr inbounds i8* %call, i64 24, !dbg !167
  %4 = bitcast i8* %iter_next to %struct.ht_node**, !dbg !167
  store %struct.ht_node* null, %struct.ht_node** %4, align 8, !dbg !167, !tbaa !168
  %items = getelementptr inbounds i8* %call, i64 32, !dbg !169
  %5 = bitcast i8* %items to i32*, !dbg !169
  store i32 0, i32* %5, align 4, !dbg !169, !tbaa !170
  ret %struct.ht_ht* %1, !dbg !171
}

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #2

; Function Attrs: nounwind uwtable
define void @ht_destroy(%struct.ht_ht* nocapture %ht) #0 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.ht_ht* %ht, i64 0, metadata !45, metadata !116), !dbg !172
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !48, metadata !116), !dbg !173
  %size = getelementptr inbounds %struct.ht_ht* %ht, i64 0, i32 0, !dbg !174
  %0 = load i32* %size, align 4, !dbg !174, !tbaa !159
  %cmp13 = icmp sgt i32 %0, 0, !dbg !177
  br i1 %cmp13, label %for.body.lr.ph, label %for.end, !dbg !178

for.body.lr.ph:                                   ; preds = %entry
  %tbl = getelementptr inbounds %struct.ht_ht* %ht, i64 0, i32 1, !dbg !179
  br label %for.body, !dbg !178

for.body:                                         ; preds = %for.body.lr.ph, %for.inc
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %for.inc ]
  %1 = load %struct.ht_node*** %tbl, align 8, !dbg !179, !tbaa !164
  %arrayidx = getelementptr inbounds %struct.ht_node** %1, i64 %indvars.iv, !dbg !179
  %2 = load %struct.ht_node** %arrayidx, align 8, !dbg !179, !tbaa !181
  tail call void @llvm.dbg.value(metadata %struct.ht_node* %2, i64 0, metadata !47, metadata !116), !dbg !182
  %tobool11 = icmp eq %struct.ht_node* %2, null, !dbg !183
  br i1 %tobool11, label %for.inc, label %while.body, !dbg !183

while.body:                                       ; preds = %for.body, %while.body
  %next.012 = phi %struct.ht_node* [ %3, %while.body ], [ %2, %for.body ]
  tail call void @llvm.dbg.value(metadata %struct.ht_node* %3, i64 0, metadata !46, metadata !116), !dbg !184
  %next1 = getelementptr inbounds %struct.ht_node* %next.012, i64 0, i32 2, !dbg !185
  %3 = load %struct.ht_node** %next1, align 8, !dbg !185, !tbaa !145
  tail call void @llvm.dbg.value(metadata %struct.ht_node* %3, i64 0, metadata !47, metadata !116), !dbg !182
  %key = getelementptr inbounds %struct.ht_node* %next.012, i64 0, i32 0, !dbg !187
  %4 = load i8** %key, align 8, !dbg !187, !tbaa !136
  tail call void @free(i8* %4) #7, !dbg !188
  %5 = bitcast %struct.ht_node* %next.012 to i8*, !dbg !189
  tail call void @free(i8* %5) #7, !dbg !190
  %tobool = icmp eq %struct.ht_node* %3, null, !dbg !183
  br i1 %tobool, label %for.inc, label %while.body, !dbg !183

for.inc:                                          ; preds = %while.body, %for.body
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !178
  %6 = load i32* %size, align 4, !dbg !174, !tbaa !159
  %7 = sext i32 %6 to i64, !dbg !177
  %cmp = icmp slt i64 %indvars.iv.next, %7, !dbg !177
  br i1 %cmp, label %for.body, label %for.end, !dbg !178

for.end:                                          ; preds = %for.inc, %entry
  %tbl2 = getelementptr inbounds %struct.ht_ht* %ht, i64 0, i32 1, !dbg !191
  %8 = bitcast %struct.ht_node*** %tbl2 to i8**, !dbg !191
  %9 = load i8** %8, align 8, !dbg !191, !tbaa !164
  tail call void @free(i8* %9) #7, !dbg !192
  %10 = bitcast %struct.ht_ht* %ht to i8*, !dbg !193
  tail call void @free(i8* %10) #7, !dbg !194
  ret void, !dbg !195
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #2

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  %buf = alloca [32 x i8], align 16
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !54, metadata !116), !dbg !196
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !55, metadata !116), !dbg !197
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !57, metadata !116), !dbg !198
  %cmp = icmp eq i32 %argc, 2, !dbg !199
  br i1 %cmp, label %cond.end, label %cond.end.thread, !dbg !200

cond.end.thread:                                  ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 %call, i64 0, metadata !58, metadata !116), !dbg !201
  tail call void @llvm.dbg.declare(metadata [32 x i8]* %buf, metadata !59, metadata !116), !dbg !202
  %call133 = tail call %struct.ht_ht* @ht_create(i32 3500000), !dbg !203
  tail call void @llvm.dbg.value(metadata %struct.ht_ht* %call1, i64 0, metadata !63, metadata !116), !dbg !204
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !56, metadata !116), !dbg !205
  br label %for.body.lr.ph, !dbg !206

cond.end:                                         ; preds = %entry
  %arrayidx = getelementptr inbounds i8** %argv, i64 1, !dbg !208
  %0 = load i8** %arrayidx, align 8, !dbg !208, !tbaa !181
  %call = tail call i32 @atoi(i8* %0) #10, !dbg !210
  tail call void @llvm.dbg.value(metadata i32 %call, i64 0, metadata !58, metadata !116), !dbg !201
  tail call void @llvm.dbg.declare(metadata [32 x i8]* %buf, metadata !59, metadata !116), !dbg !202
  %call1 = tail call %struct.ht_ht* @ht_create(i32 %call), !dbg !203
  tail call void @llvm.dbg.value(metadata %struct.ht_ht* %call1, i64 0, metadata !63, metadata !116), !dbg !204
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !56, metadata !116), !dbg !205
  %cmp231 = icmp slt i32 %call, 1, !dbg !211
  br i1 %cmp231, label %for.end15, label %for.body.lr.ph, !dbg !206

for.body.lr.ph:                                   ; preds = %cond.end.thread, %cond.end
  %call137 = phi %struct.ht_ht* [ %call133, %cond.end.thread ], [ %call1, %cond.end ]
  %cond35 = phi i32 [ 3500000, %cond.end.thread ], [ %call, %cond.end ]
  %arraydecay = getelementptr inbounds [32 x i8]* %buf, i64 0, i64 0, !dbg !213
  br label %for.body, !dbg !206

for.cond6.preheader:                              ; preds = %for.body
  %cmp728 = icmp sgt i32 %cond35, 0, !dbg !215
  br i1 %cmp728, label %for.body8.lr.ph, label %for.end15, !dbg !220

for.body8.lr.ph:                                  ; preds = %for.cond6.preheader
  %arraydecay9 = getelementptr inbounds [32 x i8]* %buf, i64 0, i64 0, !dbg !221
  br label %for.body8, !dbg !220

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %i.032 = phi i32 [ 1, %for.body.lr.ph ], [ %inc, %for.body ]
  %call3 = call i32 (i8*, i8*, ...)* @sprintf(i8* %arraydecay, i8* getelementptr inbounds ([3 x i8]* @.str2, i64 0, i64 0), i32 %i.032) #7, !dbg !223
  %call5 = call fastcc %struct.ht_node* @ht_find_new(%struct.ht_ht* %call137, i8* %arraydecay), !dbg !224
  %val = getelementptr inbounds %struct.ht_node* %call5, i64 0, i32 1, !dbg !225
  store i32 %i.032, i32* %val, align 4, !dbg !225, !tbaa !143
  %inc = add nuw nsw i32 %i.032, 1, !dbg !226
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !56, metadata !116), !dbg !205
  %exitcond = icmp eq i32 %i.032, %cond35, !dbg !206
  br i1 %exitcond, label %for.cond6.preheader, label %for.body, !dbg !206

for.body8:                                        ; preds = %for.body8.lr.ph, %for.body8
  %i.130 = phi i32 [ %cond35, %for.body8.lr.ph ], [ %dec, %for.body8 ]
  %c.029 = phi i32 [ 0, %for.body8.lr.ph ], [ %c.0.inc13, %for.body8 ]
  %call10 = call i32 (i8*, i8*, ...)* @sprintf(i8* %arraydecay9, i8* getelementptr inbounds ([3 x i8]* @.str3, i64 0, i64 0), i32 %i.130) #7, !dbg !227
  %call12 = call fastcc %struct.ht_node* @ht_find(%struct.ht_ht* %call137, i8* %arraydecay9), !dbg !228
  %not.tobool = icmp ne %struct.ht_node* %call12, null, !dbg !230
  %inc13 = zext i1 %not.tobool to i32, !dbg !230
  %c.0.inc13 = add nsw i32 %inc13, %c.029, !dbg !230
  %dec = add nsw i32 %i.130, -1, !dbg !231
  tail call void @llvm.dbg.value(metadata i32 %dec, i64 0, metadata !56, metadata !116), !dbg !205
  %cmp7 = icmp sgt i32 %i.130, 1, !dbg !215
  br i1 %cmp7, label %for.body8, label %for.end15, !dbg !220

for.end15:                                        ; preds = %for.body8, %cond.end, %for.cond6.preheader
  %call13840 = phi %struct.ht_ht* [ %call137, %for.cond6.preheader ], [ %call1, %cond.end ], [ %call137, %for.body8 ]
  %c.0.lcssa = phi i32 [ 0, %for.cond6.preheader ], [ 0, %cond.end ], [ %c.0.inc13, %for.body8 ]
  tail call void @ht_destroy(%struct.ht_ht* %call13840), !dbg !232
  %call16 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str4, i64 0, i64 0), i32 %c.0.lcssa) #7, !dbg !233
  ret i32 0, !dbg !234
}

; Function Attrs: inlinehint nounwind readonly uwtable
define available_externally i32 @atoi(i8* nocapture nonnull readonly %__nptr) #4 {
entry:
  tail call void @llvm.dbg.value(metadata i8* %__nptr, i64 0, metadata !107, metadata !116), !dbg !235
  %call = tail call i64 @strtol(i8* nocapture %__nptr, i8** null, i32 10) #7, !dbg !236
  %conv = trunc i64 %call to i32, !dbg !237
  ret i32 %conv, !dbg !238
}

; Function Attrs: nounwind
declare i32 @sprintf(i8* nocapture, i8* nocapture readonly, ...) #2

; Function Attrs: nounwind uwtable
define internal fastcc %struct.ht_node* @ht_find_new(%struct.ht_ht* nocapture %ht, i8* nocapture readonly %key) #0 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.ht_ht* %ht, i64 0, metadata !89, metadata !116), !dbg !239
  tail call void @llvm.dbg.value(metadata i8* %key, i64 0, metadata !90, metadata !116), !dbg !240
  %call = tail call fastcc i32 @ht_hashcode(%struct.ht_ht* %ht, i8* %key), !dbg !241
  tail call void @llvm.dbg.value(metadata i32 %call, i64 0, metadata !91, metadata !116), !dbg !242
  tail call void @llvm.dbg.value(metadata %struct.ht_node* null, i64 0, metadata !92, metadata !116), !dbg !243
  %idxprom = sext i32 %call to i64, !dbg !244
  %tbl = getelementptr inbounds %struct.ht_ht* %ht, i64 0, i32 1, !dbg !244
  %0 = load %struct.ht_node*** %tbl, align 8, !dbg !244, !tbaa !164
  %arrayidx = getelementptr inbounds %struct.ht_node** %0, i64 %idxprom, !dbg !244
  %node.023 = load %struct.ht_node** %arrayidx, align 8, !dbg !244
  %tobool24 = icmp eq %struct.ht_node* %node.023, null, !dbg !245
  br i1 %tobool24, label %while.end, label %while.body, !dbg !245

while.body:                                       ; preds = %entry, %if.end
  %node.025 = phi %struct.ht_node* [ %node.0, %if.end ], [ %node.023, %entry ]
  %key1 = getelementptr inbounds %struct.ht_node* %node.025, i64 0, i32 0, !dbg !246
  %1 = load i8** %key1, align 8, !dbg !246, !tbaa !136
  %call2 = tail call i32 @strcmp(i8* %key, i8* %1) #7, !dbg !246
  %cmp = icmp eq i32 %call2, 0, !dbg !247
  br i1 %cmp, label %return, label %if.end, !dbg !248

if.end:                                           ; preds = %while.body
  tail call void @llvm.dbg.value(metadata %struct.ht_node* %node.0, i64 0, metadata !92, metadata !116), !dbg !243
  %next = getelementptr inbounds %struct.ht_node* %node.025, i64 0, i32 2, !dbg !249
  %node.0 = load %struct.ht_node** %next, align 8, !dbg !244
  %tobool = icmp eq %struct.ht_node* %node.0, null, !dbg !245
  br i1 %tobool, label %while.end, label %while.body, !dbg !245

while.end:                                        ; preds = %if.end, %entry
  %prev.0.lcssa = phi %struct.ht_node* [ null, %entry ], [ %node.025, %if.end ]
  %items = getelementptr inbounds %struct.ht_ht* %ht, i64 0, i32 4, !dbg !250
  %2 = load i32* %items, align 4, !dbg !250, !tbaa !170
  %inc = add nsw i32 %2, 1, !dbg !250
  store i32 %inc, i32* %items, align 4, !dbg !250, !tbaa !170
  %tobool3 = icmp eq %struct.ht_node* %prev.0.lcssa, null, !dbg !251
  %call5 = tail call %struct.ht_node* @ht_node_create(i8* %key), !dbg !252
  br i1 %tobool3, label %if.else, label %if.then4, !dbg !251

if.then4:                                         ; preds = %while.end
  %next6 = getelementptr inbounds %struct.ht_node* %prev.0.lcssa, i64 0, i32 2, !dbg !255
  store %struct.ht_node* %call5, %struct.ht_node** %next6, align 8, !dbg !255, !tbaa !145
  br label %return, !dbg !256

if.else:                                          ; preds = %while.end
  %3 = load %struct.ht_node*** %tbl, align 8, !dbg !257, !tbaa !164
  %arrayidx10 = getelementptr inbounds %struct.ht_node** %3, i64 %idxprom, !dbg !257
  store %struct.ht_node* %call5, %struct.ht_node** %arrayidx10, align 8, !dbg !257, !tbaa !181
  br label %return, !dbg !259

return:                                           ; preds = %while.body, %if.else, %if.then4
  %retval.0 = phi %struct.ht_node* [ %call5, %if.then4 ], [ %call5, %if.else ], [ %node.025, %while.body ]
  ret %struct.ht_node* %retval.0, !dbg !260
}

; Function Attrs: nounwind readonly uwtable
define internal fastcc %struct.ht_node* @ht_find(%struct.ht_ht* nocapture readonly %ht, i8* nocapture readonly %key) #5 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.ht_ht* %ht, i64 0, metadata !68, metadata !116), !dbg !261
  tail call void @llvm.dbg.value(metadata i8* %key, i64 0, metadata !69, metadata !116), !dbg !262
  %call = tail call fastcc i32 @ht_hashcode(%struct.ht_ht* %ht, i8* %key), !dbg !263
  tail call void @llvm.dbg.value(metadata i32 %call, i64 0, metadata !70, metadata !116), !dbg !264
  %idxprom = sext i32 %call to i64, !dbg !265
  %tbl = getelementptr inbounds %struct.ht_ht* %ht, i64 0, i32 1, !dbg !265
  %0 = load %struct.ht_node*** %tbl, align 8, !dbg !265, !tbaa !164
  %arrayidx = getelementptr inbounds %struct.ht_node** %0, i64 %idxprom, !dbg !265
  %node.07 = load %struct.ht_node** %arrayidx, align 8, !dbg !265
  %tobool8 = icmp eq %struct.ht_node* %node.07, null, !dbg !266
  br i1 %tobool8, label %return, label %while.body, !dbg !266

while.body:                                       ; preds = %entry, %if.end
  %node.09 = phi %struct.ht_node* [ %node.0, %if.end ], [ %node.07, %entry ]
  %key1 = getelementptr inbounds %struct.ht_node* %node.09, i64 0, i32 0, !dbg !267
  %1 = load i8** %key1, align 8, !dbg !267, !tbaa !136
  %call2 = tail call i32 @strcmp(i8* %key, i8* %1) #7, !dbg !267
  %cmp = icmp eq i32 %call2, 0, !dbg !268
  br i1 %cmp, label %return, label %if.end, !dbg !269

if.end:                                           ; preds = %while.body
  %next = getelementptr inbounds %struct.ht_node* %node.09, i64 0, i32 2, !dbg !270
  %node.0 = load %struct.ht_node** %next, align 8, !dbg !265
  %tobool = icmp eq %struct.ht_node* %node.0, null, !dbg !266
  br i1 %tobool, label %return, label %while.body, !dbg !266

return:                                           ; preds = %while.body, %if.end, %entry
  %retval.0 = phi %struct.ht_node* [ null, %entry ], [ %node.09, %while.body ], [ null, %if.end ]
  ret %struct.ht_node* %retval.0, !dbg !271
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind readonly uwtable
define internal fastcc i32 @ht_hashcode(%struct.ht_ht* nocapture readonly %ht, i8* nocapture readonly %key) #5 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.ht_ht* %ht, i64 0, metadata !84, metadata !116), !dbg !272
  tail call void @llvm.dbg.value(metadata i8* %key, i64 0, metadata !85, metadata !116), !dbg !273
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !86, metadata !116), !dbg !274
  %0 = load i8* %key, align 1, !dbg !275, !tbaa !278
  %tobool5 = icmp eq i8 %0, 0, !dbg !279
  br i1 %tobool5, label %for.end, label %for.body, !dbg !279

for.body:                                         ; preds = %entry, %for.body
  %1 = phi i8 [ %2, %for.body ], [ %0, %entry ]
  %val.07 = phi i64 [ %add, %for.body ], [ 0, %entry ]
  %key.addr.06 = phi i8* [ %incdec.ptr, %for.body ], [ %key, %entry ]
  %mul = mul i64 %val.07, 5, !dbg !280
  %conv = sext i8 %1 to i64, !dbg !281
  %add = add i64 %conv, %mul, !dbg !280
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !86, metadata !116), !dbg !274
  %incdec.ptr = getelementptr inbounds i8* %key.addr.06, i64 1, !dbg !282
  tail call void @llvm.dbg.value(metadata i8* %incdec.ptr, i64 0, metadata !85, metadata !116), !dbg !273
  %2 = load i8* %incdec.ptr, align 1, !dbg !275, !tbaa !278
  %tobool = icmp eq i8 %2, 0, !dbg !279
  br i1 %tobool, label %for.end, label %for.body, !dbg !279

for.end:                                          ; preds = %for.body, %entry
  %val.0.lcssa = phi i64 [ 0, %entry ], [ %add, %for.body ]
  %size = getelementptr inbounds %struct.ht_ht* %ht, i64 0, i32 0, !dbg !284
  %3 = load i32* %size, align 4, !dbg !284, !tbaa !159
  %conv1 = sext i32 %3 to i64, !dbg !284
  %rem = urem i64 %val.0.lcssa, %conv1, !dbg !285
  %conv2 = trunc i64 %rem to i32, !dbg !286
  ret i32 %conv2, !dbg !287
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8* nocapture, i8* nocapture) #6

; Function Attrs: nounwind
declare i64 @strtol(i8* readonly, i8** nocapture, i32) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { inlinehint nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind }
attributes #8 = { cold nounwind }
attributes #9 = { noreturn nounwind }
attributes #10 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!113, !114}
!llvm.ident = !{!115}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !25, !108, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/hash.c] [DW_LANG_C99]
!1 = !{!"hash.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4, !9, !14, !15, !20, !12, !24}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ht_node]
!5 = !{!"0x13\00ht_node\0021\00192\0064\000\000\000", !6, null, null, !7, null, null, null} ; [ DW_TAG_structure_type ] [ht_node] [line 21, size 192, align 64, offset 0] [def] [from ]
!6 = !{!"./simple_hash.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!7 = !{!8, !11, !13}
!8 = !{!"0xd\00key\0022\0064\0064\000\000", !6, !5, !9} ; [ DW_TAG_member ] [key] [line 22, size 64, align 64, offset 0] [from ]
!9 = !{!"0xf\00\000\0064\0064\000\000", null, null, !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!10 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!11 = !{!"0xd\00val\0023\0032\0032\0064\000", !6, !5, !12} ; [ DW_TAG_member ] [val] [line 23, size 32, align 32, offset 64] [from int]
!12 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!13 = !{!"0xd\00next\0024\0064\0064\00128\000", !6, !5, !4} ; [ DW_TAG_member ] [next] [line 24, size 64, align 64, offset 128] [from ]
!14 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!15 = !{!"0xf\00\000\0064\0064\000\000", null, null, !16} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ht_ht]
!16 = !{!"0x13\00ht_ht\0027\00320\0064\000\000\000", !6, null, null, !17, null, null, null} ; [ DW_TAG_structure_type ] [ht_ht] [line 27, size 320, align 64, offset 0] [def] [from ]
!17 = !{!18, !19, !21, !22, !23}
!18 = !{!"0xd\00size\0028\0032\0032\000\000", !6, !16, !12} ; [ DW_TAG_member ] [size] [line 28, size 32, align 32, offset 0] [from int]
!19 = !{!"0xd\00tbl\0029\0064\0064\0064\000", !6, !16, !20} ; [ DW_TAG_member ] [tbl] [line 29, size 64, align 64, offset 64] [from ]
!20 = !{!"0xf\00\000\0064\0064\000\000", null, null, !4} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!21 = !{!"0xd\00iter_index\0030\0032\0032\00128\000", !6, !16, !12} ; [ DW_TAG_member ] [iter_index] [line 30, size 32, align 32, offset 128] [from int]
!22 = !{!"0xd\00iter_next\0031\0064\0064\00192\000", !6, !16, !4} ; [ DW_TAG_member ] [iter_next] [line 31, size 64, align 64, offset 192] [from ]
!23 = !{!"0xd\00items\0032\0032\0032\00256\000", !6, !16, !12} ; [ DW_TAG_member ] [items] [line 32, size 32, align 32, offset 256] [from int]
!24 = !{!"0xf\00\000\0064\0064\000\000", null, null, !9} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!25 = !{!26, !34, !41, !49, !64, !80, !87, !99}
!26 = !{!"0x2e\00ht_node_create\00ht_node_create\00\0052\000\001\000\000\00256\001\0052", !6, !27, !28, null, %struct.ht_node* (i8*)* @ht_node_create, null, null, !30} ; [ DW_TAG_subprogram ] [line 52] [def] [ht_node_create]
!27 = !{!"0x29", !6}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/./simple_hash.h]
!28 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !29, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!29 = !{!4, !9}
!30 = !{!31, !32, !33}
!31 = !{!"0x101\00key\0016777268\000", !26, !27, !9} ; [ DW_TAG_arg_variable ] [key] [line 52]
!32 = !{!"0x100\00newkey\0053\000", !26, !27, !9} ; [ DW_TAG_auto_variable ] [newkey] [line 53]
!33 = !{!"0x100\00node\0054\000", !26, !27, !4}   ; [ DW_TAG_auto_variable ] [node] [line 54]
!34 = !{!"0x2e\00ht_create\00ht_create\00\0069\000\001\000\000\00256\001\0069", !6, !27, !35, null, %struct.ht_ht* (i32)* @ht_create, null, null, !37} ; [ DW_TAG_subprogram ] [line 69] [def] [ht_create]
!35 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !36, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!36 = !{!15, !12}
!37 = !{!38, !39, !40}
!38 = !{!"0x101\00size\0016777285\000", !34, !27, !12} ; [ DW_TAG_arg_variable ] [size] [line 69]
!39 = !{!"0x100\00i\0070\000", !34, !27, !12}     ; [ DW_TAG_auto_variable ] [i] [line 70]
!40 = !{!"0x100\00ht\0071\000", !34, !27, !15}    ; [ DW_TAG_auto_variable ] [ht] [line 71]
!41 = !{!"0x2e\00ht_destroy\00ht_destroy\00\0084\000\001\000\000\00256\001\0084", !6, !27, !42, null, void (%struct.ht_ht*)* @ht_destroy, null, null, !44} ; [ DW_TAG_subprogram ] [line 84] [def] [ht_destroy]
!42 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !43, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!43 = !{null, !15}
!44 = !{!45, !46, !47, !48}
!45 = !{!"0x101\00ht\0016777300\000", !41, !27, !15} ; [ DW_TAG_arg_variable ] [ht] [line 84]
!46 = !{!"0x100\00cur\0085\000", !41, !27, !4}    ; [ DW_TAG_auto_variable ] [cur] [line 85]
!47 = !{!"0x100\00next\0085\000", !41, !27, !4}   ; [ DW_TAG_auto_variable ] [next] [line 85]
!48 = !{!"0x100\00i\0086\000", !41, !27, !12}     ; [ DW_TAG_auto_variable ] [i] [line 86]
!49 = !{!"0x2e\00main\00main\00\0011\000\001\000\000\00256\001\0011", !1, !50, !51, null, i32 (i32, i8**)* @main, null, null, !53} ; [ DW_TAG_subprogram ] [line 11] [def] [main]
!50 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/hash.c]
!51 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !52, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!52 = !{!12, !12, !24}
!53 = !{!54, !55, !56, !57, !58, !59, !63}
!54 = !{!"0x101\00argc\0016777227\000", !49, !50, !12} ; [ DW_TAG_arg_variable ] [argc] [line 11]
!55 = !{!"0x101\00argv\0033554443\000", !49, !50, !24} ; [ DW_TAG_arg_variable ] [argv] [line 11]
!56 = !{!"0x100\00i\0017\000", !49, !50, !12}     ; [ DW_TAG_auto_variable ] [i] [line 17]
!57 = !{!"0x100\00c\0017\000", !49, !50, !12}     ; [ DW_TAG_auto_variable ] [c] [line 17]
!58 = !{!"0x100\00n\0017\000", !49, !50, !12}     ; [ DW_TAG_auto_variable ] [n] [line 17]
!59 = !{!"0x100\00buf\0018\000", !49, !50, !60}   ; [ DW_TAG_auto_variable ] [buf] [line 18]
!60 = !{!"0x1\00\000\00256\008\000\000\000", null, null, !10, !61, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 256, align 8, offset 0] [from char]
!61 = !{!62}
!62 = !{!"0x21\000\0032"}                         ; [ DW_TAG_subrange_type ] [0, 31]
!63 = !{!"0x100\00ht\0020\000", !49, !50, !15}    ; [ DW_TAG_auto_variable ] [ht] [line 20]
!64 = !{!"0x2e\00ht_find\00ht_find\00\00125\001\001\000\000\00256\001\00125", !6, !27, !65, null, %struct.ht_node* (%struct.ht_ht*, i8*)* @ht_find, null, null, !67} ; [ DW_TAG_subprogram ] [line 125] [local] [def] [ht_find]
!65 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !66, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!66 = !{!4, !15, !9}
!67 = !{!68, !69, !70, !71, !72, !79}
!68 = !{!"0x101\00ht\0016777341\000", !64, !27, !15} ; [ DW_TAG_arg_variable ] [ht] [line 125]
!69 = !{!"0x101\00key\0033554557\000", !64, !27, !9} ; [ DW_TAG_arg_variable ] [key] [line 125]
!70 = !{!"0x100\00hash_code\00126\000", !64, !27, !12} ; [ DW_TAG_auto_variable ] [hash_code] [line 126]
!71 = !{!"0x100\00node\00127\000", !64, !27, !4}  ; [ DW_TAG_auto_variable ] [node] [line 127]
!72 = !{!"0x100\00__s1_len\00129\000", !73, !27, !76} ; [ DW_TAG_auto_variable ] [__s1_len] [line 129]
!73 = !{!"0xb\00129\006\0018", !6, !74}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/./simple_hash.h]
!74 = !{!"0xb\00129\006\0017", !6, !75}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/./simple_hash.h]
!75 = !{!"0xb\00128\0018\0016", !6, !64}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/./simple_hash.h]
!76 = !{!"0x16\00size_t\0062\000\000\000\000", !77, null, !78} ; [ DW_TAG_typedef ] [size_t] [line 62, size 0, align 0, offset 0] [from long unsigned int]
!77 = !{!"/usr/local/bin/../lib/clang/3.6.0/include/stddef.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!78 = !{!"0x24\00long unsigned int\000\0064\0064\000\000\007", null, null} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!79 = !{!"0x100\00__s2_len\00129\000", !73, !27, !76} ; [ DW_TAG_auto_variable ] [__s2_len] [line 129]
!80 = !{!"0x2e\00ht_hashcode\00ht_hashcode\00\0046\001\001\000\000\00256\001\0046", !6, !27, !81, null, i32 (%struct.ht_ht*, i8*)* @ht_hashcode, null, null, !83} ; [ DW_TAG_subprogram ] [line 46] [local] [def] [ht_hashcode]
!81 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !82, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!82 = !{!12, !15, !9}
!83 = !{!84, !85, !86}
!84 = !{!"0x101\00ht\0016777262\000", !80, !27, !15} ; [ DW_TAG_arg_variable ] [ht] [line 46]
!85 = !{!"0x101\00key\0033554478\000", !80, !27, !9} ; [ DW_TAG_arg_variable ] [key] [line 46]
!86 = !{!"0x100\00val\0047\000", !80, !27, !78}   ; [ DW_TAG_auto_variable ] [val] [line 47]
!87 = !{!"0x2e\00ht_find_new\00ht_find_new\00\00135\001\001\000\000\00256\001\00135", !6, !27, !65, null, %struct.ht_node* (%struct.ht_ht*, i8*)* @ht_find_new, null, null, !88} ; [ DW_TAG_subprogram ] [line 135] [local] [def] [ht_find_new]
!88 = !{!89, !90, !91, !92, !93, !94, !98}
!89 = !{!"0x101\00ht\0016777351\000", !87, !27, !15} ; [ DW_TAG_arg_variable ] [ht] [line 135]
!90 = !{!"0x101\00key\0033554567\000", !87, !27, !9} ; [ DW_TAG_arg_variable ] [key] [line 135]
!91 = !{!"0x100\00hash_code\00136\000", !87, !27, !12} ; [ DW_TAG_auto_variable ] [hash_code] [line 136]
!92 = !{!"0x100\00prev\00137\000", !87, !27, !4}  ; [ DW_TAG_auto_variable ] [prev] [line 137]
!93 = !{!"0x100\00node\00137\000", !87, !27, !4}  ; [ DW_TAG_auto_variable ] [node] [line 137]
!94 = !{!"0x100\00__s1_len\00139\000", !95, !27, !76} ; [ DW_TAG_auto_variable ] [__s1_len] [line 139]
!95 = !{!"0xb\00139\006\0023", !6, !96}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/./simple_hash.h]
!96 = !{!"0xb\00139\006\0022", !6, !97}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/./simple_hash.h]
!97 = !{!"0xb\00138\0018\0021", !6, !87}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/./simple_hash.h]
!98 = !{!"0x100\00__s2_len\00139\000", !95, !27, !76} ; [ DW_TAG_auto_variable ] [__s2_len] [line 139]
!99 = !{!"0x2e\00atoi\00atoi\00\00278\000\001\000\000\00256\001\00279", !100, !101, !102, null, i32 (i8*)* @atoi, null, null, !106} ; [ DW_TAG_subprogram ] [line 278] [def] [scope 279] [atoi]
!100 = !{!"/usr/include/stdlib.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!101 = !{!"0x29", !100}                           ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base//usr/include/stdlib.h]
!102 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !103, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!103 = !{!12, !104}
!104 = !{!"0xf\00\000\0064\0064\000\000", null, null, !105} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!105 = !{!"0x26\00\000\000\000\000\000", null, null, !10} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!106 = !{!107}
!107 = !{!"0x101\00__nptr\0016777494\000", !99, !101, !104} ; [ DW_TAG_arg_variable ] [__nptr] [line 278]
!108 = !{!109}
!109 = !{!"0x34\00ht_prime_list\00ht_prime_list\00\0012\001\001", null, !27, !110, [28 x i64]* @ht_prime_list, null} ; [ DW_TAG_variable ] [ht_prime_list] [line 12] [local] [def]
!110 = !{!"0x1\00\000\001792\0064\000\000\000", null, null, !78, !111, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1792, align 64, offset 0] [from long unsigned int]
!111 = !{!112}
!112 = !{!"0x21\000\0028"}                        ; [ DW_TAG_subrange_type ] [0, 27]
!113 = !{i32 2, !"Dwarf Version", i32 4}
!114 = !{i32 2, !"Debug Info Version", i32 2}
!115 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!116 = !{!"0x102"}                                ; [ DW_TAG_expression ]
!117 = !MDLocation(line: 52, column: 38, scope: !26)
!118 = !MDLocation(line: 55, column: 35, scope: !119)
!119 = !{!"0xb\0055\009\000", !6, !26}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/./simple_hash.h]
!120 = !MDLocation(line: 55, column: 17, scope: !119)
!121 = !MDLocation(line: 54, column: 21, scope: !26)
!122 = !MDLocation(line: 55, column: 9, scope: !119)
!123 = !MDLocation(line: 55, column: 9, scope: !26)
!124 = !MDLocation(line: 56, column: 2, scope: !125)
!125 = !{!"0xb\0055\0073\001", !6, !119}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/./simple_hash.h]
!126 = !MDLocation(line: 57, column: 2, scope: !125)
!127 = !MDLocation(line: 59, column: 27, scope: !128)
!128 = !{!"0xb\0059\009\002", !6, !26}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/./simple_hash.h]
!129 = !MDLocation(line: 53, column: 11, scope: !26)
!130 = !MDLocation(line: 59, column: 9, scope: !128)
!131 = !MDLocation(line: 59, column: 9, scope: !26)
!132 = !MDLocation(line: 60, column: 2, scope: !133)
!133 = !{!"0xb\0059\0046\003", !6, !128}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/./simple_hash.h]
!134 = !MDLocation(line: 61, column: 2, scope: !133)
!135 = !MDLocation(line: 63, column: 5, scope: !26)
!136 = !{!137, !138, i64 0}
!137 = !{!"ht_node", !138, i64 0, !141, i64 8, !138, i64 16}
!138 = !{!"any pointer", !139, i64 0}
!139 = !{!"omnipotent char", !140, i64 0}
!140 = !{!"Simple C/C++ TBAA"}
!141 = !{!"int", !139, i64 0}
!142 = !MDLocation(line: 64, column: 5, scope: !26)
!143 = !{!137, !141, i64 8}
!144 = !MDLocation(line: 65, column: 5, scope: !26)
!145 = !{!137, !138, i64 16}
!146 = !MDLocation(line: 66, column: 5, scope: !26)
!147 = !MDLocation(line: 69, column: 29, scope: !34)
!148 = !MDLocation(line: 70, column: 9, scope: !34)
!149 = !MDLocation(line: 71, column: 40, scope: !34)
!150 = !MDLocation(line: 71, column: 19, scope: !34)
!151 = !MDLocation(line: 72, column: 31, scope: !34)
!152 = !MDLocation(line: 72, column: 5, scope: !34)
!153 = !MDLocation(line: 72, column: 12, scope: !34)
!154 = !{!155, !155, i64 0}
!155 = !{!"long", !139, i64 0}
!156 = !MDLocation(line: 71, column: 24, scope: !34)
!157 = !MDLocation(line: 73, column: 16, scope: !34)
!158 = !MDLocation(line: 73, column: 5, scope: !34)
!159 = !{!160, !141, i64 0}
!160 = !{!"ht_ht", !141, i64 0, !138, i64 8, !141, i64 16, !138, i64 24, !141, i64 32}
!161 = !MDLocation(line: 74, column: 41, scope: !34)
!162 = !MDLocation(line: 74, column: 34, scope: !34)
!163 = !MDLocation(line: 74, column: 5, scope: !34)
!164 = !{!160, !138, i64 8}
!165 = !MDLocation(line: 75, column: 5, scope: !34)
!166 = !{!160, !141, i64 16}
!167 = !MDLocation(line: 76, column: 5, scope: !34)
!168 = !{!160, !138, i64 24}
!169 = !MDLocation(line: 77, column: 5, scope: !34)
!170 = !{!160, !141, i64 32}
!171 = !MDLocation(line: 81, column: 5, scope: !34)
!172 = !MDLocation(line: 84, column: 31, scope: !41)
!173 = !MDLocation(line: 86, column: 9, scope: !41)
!174 = !MDLocation(line: 95, column: 17, scope: !175)
!175 = !{!"0xb\0095\005\006", !6, !176}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/./simple_hash.h]
!176 = !{!"0xb\0095\005\005", !6, !41}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/./simple_hash.h]
!177 = !MDLocation(line: 95, column: 15, scope: !175)
!178 = !MDLocation(line: 95, column: 5, scope: !176)
!179 = !MDLocation(line: 96, column: 9, scope: !180)
!180 = !{!"0xb\0095\0032\007", !6, !175}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/./simple_hash.h]
!181 = !{!138, !138, i64 0}
!182 = !MDLocation(line: 85, column: 27, scope: !41)
!183 = !MDLocation(line: 103, column: 2, scope: !180)
!184 = !MDLocation(line: 85, column: 21, scope: !41)
!185 = !MDLocation(line: 105, column: 13, scope: !186)
!186 = !{!"0xb\00103\0015\008", !6, !180}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/./simple_hash.h]
!187 = !MDLocation(line: 106, column: 11, scope: !186)
!188 = !MDLocation(line: 106, column: 6, scope: !186)
!189 = !MDLocation(line: 107, column: 11, scope: !186)
!190 = !MDLocation(line: 107, column: 6, scope: !186)
!191 = !MDLocation(line: 117, column: 10, scope: !41)
!192 = !MDLocation(line: 117, column: 5, scope: !41)
!193 = !MDLocation(line: 118, column: 10, scope: !41)
!194 = !MDLocation(line: 118, column: 5, scope: !41)
!195 = !MDLocation(line: 123, column: 1, scope: !41)
!196 = !MDLocation(line: 11, column: 14, scope: !49)
!197 = !MDLocation(line: 11, column: 26, scope: !49)
!198 = !MDLocation(line: 17, column: 12, scope: !49)
!199 = !MDLocation(line: 17, column: 23, scope: !49)
!200 = !MDLocation(line: 17, column: 22, scope: !49)
!201 = !MDLocation(line: 17, column: 17, scope: !49)
!202 = !MDLocation(line: 18, column: 10, scope: !49)
!203 = !MDLocation(line: 20, column: 24, scope: !49)
!204 = !MDLocation(line: 20, column: 19, scope: !49)
!205 = !MDLocation(line: 17, column: 9, scope: !49)
!206 = !MDLocation(line: 22, column: 5, scope: !207)
!207 = !{!"0xb\0022\005\009", !1, !49}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/hash.c]
!208 = !MDLocation(line: 17, column: 41, scope: !209)
!209 = !{!"0xb\001", !1, !49}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/hash.c]
!210 = !MDLocation(line: 17, column: 36, scope: !49)
!211 = !MDLocation(line: 22, column: 15, scope: !212)
!212 = !{!"0xb\0022\005\0010", !1, !207}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/hash.c]
!213 = !MDLocation(line: 23, column: 10, scope: !214)
!214 = !{!"0xb\0022\0026\0011", !1, !212}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/hash.c]
!215 = !MDLocation(line: 27, column: 15, scope: !216)
!216 = !{!"0xb\002", !1, !217}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/hash.c]
!217 = !{!"0xb\001", !1, !218}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/hash.c]
!218 = !{!"0xb\0027\005\0013", !1, !219}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/hash.c]
!219 = !{!"0xb\0027\005\0012", !1, !49}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/hash.c]
!220 = !MDLocation(line: 27, column: 5, scope: !219)
!221 = !MDLocation(line: 28, column: 10, scope: !222)
!222 = !{!"0xb\0027\0025\0014", !1, !218}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/hash.c]
!223 = !MDLocation(line: 23, column: 2, scope: !214)
!224 = !MDLocation(line: 24, column: 3, scope: !214)
!225 = !MDLocation(line: 24, column: 2, scope: !214)
!226 = !MDLocation(line: 22, column: 21, scope: !212)
!227 = !MDLocation(line: 28, column: 2, scope: !222)
!228 = !MDLocation(line: 29, column: 6, scope: !229)
!229 = !{!"0xb\0029\006\0015", !1, !222}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/hash.c]
!230 = !MDLocation(line: 29, column: 6, scope: !222)
!231 = !MDLocation(line: 27, column: 20, scope: !218)
!232 = !MDLocation(line: 32, column: 5, scope: !49)
!233 = !MDLocation(line: 34, column: 5, scope: !49)
!234 = !MDLocation(line: 35, column: 5, scope: !49)
!235 = !MDLocation(line: 278, column: 1, scope: !99)
!236 = !MDLocation(line: 280, column: 16, scope: !99)
!237 = !MDLocation(line: 280, column: 10, scope: !99)
!238 = !MDLocation(line: 280, column: 3, scope: !99)
!239 = !MDLocation(line: 135, column: 50, scope: !87)
!240 = !MDLocation(line: 135, column: 60, scope: !87)
!241 = !MDLocation(line: 136, column: 21, scope: !87)
!242 = !MDLocation(line: 136, column: 9, scope: !87)
!243 = !MDLocation(line: 137, column: 21, scope: !87)
!244 = !MDLocation(line: 137, column: 39, scope: !87)
!245 = !MDLocation(line: 138, column: 5, scope: !87)
!246 = !MDLocation(line: 139, column: 6, scope: !95)
!247 = !MDLocation(line: 139, column: 6, scope: !96)
!248 = !MDLocation(line: 139, column: 6, scope: !97)
!249 = !MDLocation(line: 141, column: 9, scope: !97)
!250 = !MDLocation(line: 146, column: 5, scope: !87)
!251 = !MDLocation(line: 147, column: 9, scope: !87)
!252 = !MDLocation(line: 148, column: 22, scope: !253)
!253 = !{!"0xb\00147\0015\0025", !6, !254}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/./simple_hash.h]
!254 = !{!"0xb\00147\009\0024", !6, !87}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/./simple_hash.h]
!255 = !MDLocation(line: 148, column: 9, scope: !253)
!256 = !MDLocation(line: 148, column: 2, scope: !253)
!257 = !MDLocation(line: 150, column: 9, scope: !258)
!258 = !{!"0xb\00149\0012\0026", !6, !254}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/./simple_hash.h]
!259 = !MDLocation(line: 150, column: 2, scope: !258)
!260 = !MDLocation(line: 152, column: 1, scope: !87)
!261 = !MDLocation(line: 125, column: 46, scope: !64)
!262 = !MDLocation(line: 125, column: 56, scope: !64)
!263 = !MDLocation(line: 126, column: 21, scope: !64)
!264 = !MDLocation(line: 126, column: 9, scope: !64)
!265 = !MDLocation(line: 127, column: 28, scope: !64)
!266 = !MDLocation(line: 128, column: 5, scope: !64)
!267 = !MDLocation(line: 129, column: 6, scope: !73)
!268 = !MDLocation(line: 129, column: 6, scope: !74)
!269 = !MDLocation(line: 129, column: 6, scope: !75)
!270 = !MDLocation(line: 130, column: 9, scope: !75)
!271 = !MDLocation(line: 133, column: 1, scope: !64)
!272 = !MDLocation(line: 46, column: 38, scope: !80)
!273 = !MDLocation(line: 46, column: 48, scope: !80)
!274 = !MDLocation(line: 47, column: 19, scope: !80)
!275 = !MDLocation(line: 48, column: 12, scope: !276)
!276 = !{!"0xb\0048\005\0020", !6, !277}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/./simple_hash.h]
!277 = !{!"0xb\0048\005\0019", !6, !80}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/./simple_hash.h]
!278 = !{!139, !139, i64 0}
!279 = !MDLocation(line: 48, column: 5, scope: !277)
!280 = !MDLocation(line: 48, column: 31, scope: !276)
!281 = !MDLocation(line: 48, column: 41, scope: !276)
!282 = !MDLocation(line: 48, column: 18, scope: !283)
!283 = !{!"0xb\003", !6, !276}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/./simple_hash.h]
!284 = !MDLocation(line: 49, column: 18, scope: !80)
!285 = !MDLocation(line: 49, column: 12, scope: !80)
!286 = !MDLocation(line: 49, column: 11, scope: !80)
!287 = !MDLocation(line: 49, column: 5, scope: !80)
