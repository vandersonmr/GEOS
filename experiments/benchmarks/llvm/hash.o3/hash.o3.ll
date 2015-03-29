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
  %call = tail call noalias i8* @malloc(i64 24) #5, !dbg !118
  %0 = bitcast i8* %call to %struct.ht_node*, !dbg !120
  tail call void @llvm.dbg.value(metadata %struct.ht_node* %0, i64 0, metadata !33, metadata !116), !dbg !121
  %cmp = icmp eq i8* %call, null, !dbg !122
  br i1 %cmp, label %if.then, label %if.end, !dbg !123

if.then:                                          ; preds = %entry
  tail call void @perror(i8* getelementptr inbounds ([15 x i8]* @.str, i64 0, i64 0)) #6, !dbg !124
  tail call void @exit(i32 1) #7, !dbg !126
  unreachable, !dbg !126

if.end:                                           ; preds = %entry
  %call1 = tail call noalias i8* @__strdup(i8* %key) #5, !dbg !127
  tail call void @llvm.dbg.value(metadata i8* %call1, i64 0, metadata !32, metadata !116), !dbg !129
  %cmp2 = icmp eq i8* %call1, null, !dbg !130
  br i1 %cmp2, label %if.then3, label %if.end4, !dbg !131

if.then3:                                         ; preds = %if.end
  tail call void @perror(i8* getelementptr inbounds ([14 x i8]* @.str1, i64 0, i64 0)) #6, !dbg !132
  tail call void @exit(i32 1) #7, !dbg !134
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
  %call = tail call noalias i8* @malloc(i64 40) #5, !dbg !149
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
  %.lcssa = phi i64 [ %0, %while.cond ]
  %1 = bitcast i8* %call to %struct.ht_ht*, !dbg !156
  %conv4 = trunc i64 %.lcssa to i32, !dbg !157
  %size5 = bitcast i8* %call to i32*, !dbg !158
  store i32 %conv4, i32* %size5, align 4, !dbg !158, !tbaa !159
  %sext = shl i64 %.lcssa, 32, !dbg !161
  %conv7 = ashr exact i64 %sext, 32, !dbg !161
  %call8 = tail call noalias i8* @calloc(i64 %conv7, i64 8) #5, !dbg !162
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
  %tbl = getelementptr inbounds %struct.ht_ht* %ht, i64 0, i32 1, !dbg !178
  br i1 %cmp13, label %for.body.preheader, label %for.end, !dbg !180

for.body.preheader:                               ; preds = %entry
  br label %for.body, !dbg !178

for.body:                                         ; preds = %for.body.preheader, %for.inc
  %1 = phi i32 [ %7, %for.inc ], [ %0, %for.body.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 0, %for.body.preheader ]
  %2 = load %struct.ht_node*** %tbl, align 8, !dbg !178, !tbaa !164
  %arrayidx = getelementptr inbounds %struct.ht_node** %2, i64 %indvars.iv, !dbg !178
  %3 = load %struct.ht_node** %arrayidx, align 8, !dbg !178, !tbaa !181
  tail call void @llvm.dbg.value(metadata %struct.ht_node* %3, i64 0, metadata !47, metadata !116), !dbg !182
  %tobool11 = icmp eq %struct.ht_node* %3, null, !dbg !183
  br i1 %tobool11, label %for.inc, label %while.body.preheader, !dbg !183

while.body.preheader:                             ; preds = %for.body
  br label %while.body, !dbg !184

while.body:                                       ; preds = %while.body.preheader, %while.body
  %next.012 = phi %struct.ht_node* [ %4, %while.body ], [ %3, %while.body.preheader ]
  tail call void @llvm.dbg.value(metadata %struct.ht_node* %4, i64 0, metadata !46, metadata !116), !dbg !184
  %next1 = getelementptr inbounds %struct.ht_node* %next.012, i64 0, i32 2, !dbg !185
  %4 = load %struct.ht_node** %next1, align 8, !dbg !185, !tbaa !145
  tail call void @llvm.dbg.value(metadata %struct.ht_node* %4, i64 0, metadata !47, metadata !116), !dbg !182
  %key = getelementptr inbounds %struct.ht_node* %next.012, i64 0, i32 0, !dbg !187
  %5 = load i8** %key, align 8, !dbg !187, !tbaa !136
  tail call void @free(i8* %5) #5, !dbg !188
  %6 = bitcast %struct.ht_node* %next.012 to i8*, !dbg !189
  tail call void @free(i8* %6) #5, !dbg !190
  %tobool = icmp eq %struct.ht_node* %4, null, !dbg !183
  br i1 %tobool, label %while.cond.for.inc_crit_edge, label %while.body, !dbg !183

while.cond.for.inc_crit_edge:                     ; preds = %while.body
  %.pre = load i32* %size, align 4, !dbg !174, !tbaa !159
  br label %for.inc, !dbg !183

for.inc:                                          ; preds = %while.cond.for.inc_crit_edge, %for.body
  %7 = phi i32 [ %.pre, %while.cond.for.inc_crit_edge ], [ %1, %for.body ], !dbg !180
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !180
  %8 = sext i32 %7 to i64, !dbg !177
  %cmp = icmp slt i64 %indvars.iv.next, %8, !dbg !177
  br i1 %cmp, label %for.body, label %for.end.loopexit, !dbg !180

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %9 = bitcast %struct.ht_node*** %tbl to i8**, !dbg !191
  %10 = load i8** %9, align 8, !dbg !191, !tbaa !164
  tail call void @free(i8* %10) #5, !dbg !192
  %11 = bitcast %struct.ht_ht* %ht to i8*, !dbg !193
  tail call void @free(i8* %11) #5, !dbg !194
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
  br i1 %cmp, label %cond.true, label %cond.end, !dbg !200

cond.true:                                        ; preds = %entry
  %arrayidx = getelementptr inbounds i8** %argv, i64 1, !dbg !201
  %0 = load i8** %arrayidx, align 8, !dbg !201, !tbaa !181
  tail call void @llvm.dbg.value(metadata i8* %0, i64 0, metadata !203, metadata !116) #5, !dbg !205
  %call.i = tail call i64 @strtol(i8* nocapture %0, i8** null, i32 10) #5, !dbg !206
  %conv.i = trunc i64 %call.i to i32, !dbg !207
  br label %cond.end, !dbg !200

cond.end:                                         ; preds = %entry, %cond.true
  %cond = phi i32 [ %conv.i, %cond.true ], [ 3500000, %entry ], !dbg !200
  tail call void @llvm.dbg.value(metadata i32 %cond, i64 0, metadata !58, metadata !116), !dbg !208
  tail call void @llvm.dbg.declare(metadata [32 x i8]* %buf, metadata !59, metadata !116), !dbg !209
  tail call void @llvm.dbg.value(metadata i32 %cond, i64 0, metadata !210, metadata !116) #5, !dbg !212
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !213, metadata !116) #5, !dbg !214
  %call.i28 = tail call noalias i8* @malloc(i64 40) #5, !dbg !215
  %conv.i29 = sext i32 %cond to i64, !dbg !216
  br label %while.cond.i, !dbg !217

while.cond.i:                                     ; preds = %while.cond.i, %cond.end
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %while.cond.i ], [ 0, %cond.end ], !dbg !211
  %arrayidx.i = getelementptr inbounds [28 x i64]* @ht_prime_list, i64 0, i64 %indvars.iv.i, !dbg !218
  %1 = load i64* %arrayidx.i, align 8, !dbg !218, !tbaa !154
  %cmp.i = icmp ult i64 %1, %conv.i29, !dbg !218
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !217
  br i1 %cmp.i, label %while.cond.i, label %ht_create.exit, !dbg !217

ht_create.exit:                                   ; preds = %while.cond.i
  %.lcssa = phi i64 [ %1, %while.cond.i ]
  %conv4.i = trunc i64 %.lcssa to i32, !dbg !219
  %size5.i = bitcast i8* %call.i28 to i32*, !dbg !220
  store i32 %conv4.i, i32* %size5.i, align 4, !dbg !220, !tbaa !159
  %sext.i = shl i64 %.lcssa, 32, !dbg !221
  %conv7.i = ashr exact i64 %sext.i, 32, !dbg !221
  %call8.i = tail call noalias i8* @calloc(i64 %conv7.i, i64 8) #5, !dbg !222
  %tbl.i = getelementptr inbounds i8* %call.i28, i64 8, !dbg !223
  %2 = bitcast i8* %tbl.i to i8**, !dbg !223
  store i8* %call8.i, i8** %2, align 8, !dbg !223, !tbaa !164
  %iter_index.i = getelementptr inbounds i8* %call.i28, i64 16, !dbg !224
  %3 = bitcast i8* %iter_index.i to i32*, !dbg !224
  store i32 0, i32* %3, align 4, !dbg !224, !tbaa !166
  %iter_next.i = getelementptr inbounds i8* %call.i28, i64 24, !dbg !225
  %4 = bitcast i8* %iter_next.i to %struct.ht_node**, !dbg !225
  store %struct.ht_node* null, %struct.ht_node** %4, align 8, !dbg !225, !tbaa !168
  %items.i = getelementptr inbounds i8* %call.i28, i64 32, !dbg !226
  %5 = bitcast i8* %items.i to i32*, !dbg !226
  store i32 0, i32* %5, align 4, !dbg !226, !tbaa !170
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !56, metadata !116), !dbg !227
  %cmp273 = icmp slt i32 %cond, 1, !dbg !228
  %6 = bitcast i8* %call8.i to %struct.ht_node**
  br i1 %cmp273, label %for.end15, label %for.body.lr.ph, !dbg !231

for.body.lr.ph:                                   ; preds = %ht_create.exit
  %arraydecay = getelementptr inbounds [32 x i8]* %buf, i64 0, i64 0, !dbg !232
  br label %for.body, !dbg !231

for.cond6.preheader:                              ; preds = %ht_find_new.exit
  %cmp770 = icmp sgt i32 %cond, 0, !dbg !234
  br i1 %cmp770, label %for.body8.lr.ph, label %for.end15, !dbg !239

for.body8.lr.ph:                                  ; preds = %for.cond6.preheader
  %arraydecay9 = getelementptr inbounds [32 x i8]* %buf, i64 0, i64 0, !dbg !240
  %7 = bitcast i8* %tbl.i to %struct.ht_node***, !dbg !242
  br label %for.body8, !dbg !239

for.body:                                         ; preds = %ht_find_new.exit, %for.body.lr.ph
  %8 = phi i32 [ 0, %for.body.lr.ph ], [ %18, %ht_find_new.exit ]
  %i.074 = phi i32 [ 1, %for.body.lr.ph ], [ %inc, %ht_find_new.exit ]
  %call3 = call i32 (i8*, i8*, ...)* @sprintf(i8* %arraydecay, i8* getelementptr inbounds ([3 x i8]* @.str2, i64 0, i64 0), i32 %i.074) #5, !dbg !245
  tail call void @llvm.dbg.value(metadata i8* %arraydecay, i64 0, metadata !246, metadata !116) #5, !dbg !248
  tail call void @llvm.dbg.value(metadata i8* %arraydecay, i64 0, metadata !249, metadata !116) #5, !dbg !251
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !252, metadata !116) #5, !dbg !253
  %9 = load i8* %arraydecay, align 16, !dbg !254, !tbaa !257
  %tobool5.i.i = icmp eq i8 %9, 0, !dbg !258
  br i1 %tobool5.i.i, label %ht_hashcode.exit.i, label %for.body.i.i.preheader, !dbg !258

for.body.i.i.preheader:                           ; preds = %for.body
  br label %for.body.i.i, !dbg !259

for.body.i.i:                                     ; preds = %for.body.i.i.preheader, %for.body.i.i
  %10 = phi i8 [ %11, %for.body.i.i ], [ %9, %for.body.i.i.preheader ], !dbg !250
  %val.07.i.i = phi i64 [ %add.i.i, %for.body.i.i ], [ 0, %for.body.i.i.preheader ], !dbg !250
  %key.addr.06.i.i = phi i8* [ %incdec.ptr.i.i, %for.body.i.i ], [ %arraydecay, %for.body.i.i.preheader ], !dbg !250
  %mul.i.i = mul i64 %val.07.i.i, 5, !dbg !259
  %conv.i.i = sext i8 %10 to i64, !dbg !260
  %add.i.i = add i64 %mul.i.i, %conv.i.i, !dbg !259
  tail call void @llvm.dbg.value(metadata i64 %add.i.i, i64 0, metadata !252, metadata !116) #5, !dbg !253
  %incdec.ptr.i.i = getelementptr inbounds i8* %key.addr.06.i.i, i64 1, !dbg !261
  tail call void @llvm.dbg.value(metadata i8* %incdec.ptr.i.i, i64 0, metadata !249, metadata !116) #5, !dbg !251
  %11 = load i8* %incdec.ptr.i.i, align 1, !dbg !254, !tbaa !257
  %tobool.i.i = icmp eq i8 %11, 0, !dbg !258
  br i1 %tobool.i.i, label %ht_hashcode.exit.i.loopexit, label %for.body.i.i, !dbg !258

ht_hashcode.exit.i.loopexit:                      ; preds = %for.body.i.i
  %add.i.i.lcssa = phi i64 [ %add.i.i, %for.body.i.i ]
  br label %ht_hashcode.exit.i

ht_hashcode.exit.i:                               ; preds = %ht_hashcode.exit.i.loopexit, %for.body
  %val.0.lcssa.i.i = phi i64 [ 0, %for.body ], [ %add.i.i.lcssa, %ht_hashcode.exit.i.loopexit ], !dbg !250
  %sext = shl i64 %.lcssa, 32, !dbg !263
  %conv1.i.i = ashr exact i64 %sext, 32, !dbg !263
  %rem.i.i = urem i64 %val.0.lcssa.i.i, %conv1.i.i, !dbg !264
  tail call void @llvm.dbg.value(metadata %struct.ht_node* null, i64 0, metadata !265, metadata !116) #5, !dbg !266
  %sext.i30 = shl i64 %rem.i.i, 32, !dbg !267
  %idxprom.i = ashr exact i64 %sext.i30, 32, !dbg !267
  %arrayidx.i32 = getelementptr inbounds %struct.ht_node** %6, i64 %idxprom.i, !dbg !267
  %node.023.i = load %struct.ht_node** %arrayidx.i32, align 8, !dbg !267
  %tobool24.i = icmp eq %struct.ht_node* %node.023.i, null, !dbg !268
  br i1 %tobool24.i, label %while.end.i, label %while.body.i.preheader, !dbg !268

while.body.i.preheader:                           ; preds = %ht_hashcode.exit.i
  br label %while.body.i, !dbg !269

while.body.i:                                     ; preds = %while.body.i.preheader, %if.end.i
  %node.025.i = phi %struct.ht_node* [ %node.0.i, %if.end.i ], [ %node.023.i, %while.body.i.preheader ], !dbg !247
  %key1.i = getelementptr inbounds %struct.ht_node* %node.025.i, i64 0, i32 0, !dbg !269
  %12 = load i8** %key1.i, align 8, !dbg !269, !tbaa !136
  %call2.i = call i32 @strcmp(i8* %arraydecay, i8* %12) #5, !dbg !269
  %cmp.i33 = icmp eq i32 %call2.i, 0, !dbg !270
  br i1 %cmp.i33, label %ht_find_new.exit.loopexit, label %if.end.i, !dbg !271

if.end.i:                                         ; preds = %while.body.i
  %next.i = getelementptr inbounds %struct.ht_node* %node.025.i, i64 0, i32 2, !dbg !272
  %node.0.i = load %struct.ht_node** %next.i, align 8, !dbg !267
  %tobool.i = icmp eq %struct.ht_node* %node.0.i, null, !dbg !268
  br i1 %tobool.i, label %while.end.i.loopexit, label %while.body.i, !dbg !268

while.end.i.loopexit:                             ; preds = %if.end.i
  %node.025.i.lcssa80 = phi %struct.ht_node* [ %node.025.i, %if.end.i ]
  br label %while.end.i

while.end.i:                                      ; preds = %while.end.i.loopexit, %ht_hashcode.exit.i
  %prev.0.lcssa.i = phi %struct.ht_node* [ null, %ht_hashcode.exit.i ], [ %node.025.i.lcssa80, %while.end.i.loopexit ], !dbg !247
  %inc.i = add nsw i32 %8, 1, !dbg !273
  store i32 %inc.i, i32* %5, align 4, !dbg !273, !tbaa !170
  %tobool3.i = icmp eq %struct.ht_node* %prev.0.lcssa.i, null, !dbg !274
  tail call void @llvm.dbg.value(metadata i8* %arraydecay, i64 0, metadata !275, metadata !116) #5, !dbg !279
  %call.i.i = tail call noalias i8* @malloc(i64 24) #5, !dbg !280
  %13 = bitcast i8* %call.i.i to %struct.ht_node*, !dbg !281
  tail call void @llvm.dbg.value(metadata %struct.ht_node* %13, i64 0, metadata !282, metadata !116) #5, !dbg !283
  %cmp.i.i = icmp eq i8* %call.i.i, null, !dbg !284
  br i1 %cmp.i.i, label %if.then.i.i, label %if.end.i.i, !dbg !285

if.then.i.i:                                      ; preds = %while.end.i
  tail call void @perror(i8* getelementptr inbounds ([15 x i8]* @.str, i64 0, i64 0)) #6, !dbg !286
  tail call void @exit(i32 1) #7, !dbg !287
  unreachable, !dbg !287

if.end.i.i:                                       ; preds = %while.end.i
  %call1.i.i = call noalias i8* @__strdup(i8* %arraydecay) #5, !dbg !288
  tail call void @llvm.dbg.value(metadata i8* %call1.i.i, i64 0, metadata !289, metadata !116) #5, !dbg !290
  %cmp2.i.i = icmp eq i8* %call1.i.i, null, !dbg !291
  br i1 %cmp2.i.i, label %if.then3.i.i, label %ht_node_create.exit.i, !dbg !292

if.then3.i.i:                                     ; preds = %if.end.i.i
  tail call void @perror(i8* getelementptr inbounds ([14 x i8]* @.str1, i64 0, i64 0)) #6, !dbg !293
  tail call void @exit(i32 1) #7, !dbg !294
  unreachable, !dbg !294

ht_node_create.exit.i:                            ; preds = %if.end.i.i
  %key5.i.i = bitcast i8* %call.i.i to i8**, !dbg !295
  store i8* %call1.i.i, i8** %key5.i.i, align 8, !dbg !295, !tbaa !136
  %val.i.i = getelementptr inbounds i8* %call.i.i, i64 8, !dbg !296
  %14 = bitcast i8* %val.i.i to i32*, !dbg !296
  store i32 0, i32* %14, align 4, !dbg !296, !tbaa !143
  %next.i.i = getelementptr inbounds i8* %call.i.i, i64 16, !dbg !297
  %15 = bitcast i8* %next.i.i to %struct.ht_node**, !dbg !297
  store %struct.ht_node* null, %struct.ht_node** %15, align 8, !dbg !297, !tbaa !145
  br i1 %tobool3.i, label %if.else.i, label %if.then4.i, !dbg !274

if.then4.i:                                       ; preds = %ht_node_create.exit.i
  %next6.i = getelementptr inbounds %struct.ht_node* %prev.0.lcssa.i, i64 0, i32 2, !dbg !298
  %16 = bitcast %struct.ht_node** %next6.i to i8**, !dbg !298
  store i8* %call.i.i, i8** %16, align 8, !dbg !298, !tbaa !145
  br label %ht_find_new.exit, !dbg !299

if.else.i:                                        ; preds = %ht_node_create.exit.i
  %arrayidx10.i = getelementptr inbounds %struct.ht_node** %6, i64 %idxprom.i, !dbg !300
  %17 = bitcast %struct.ht_node** %arrayidx10.i to i8**, !dbg !300
  store i8* %call.i.i, i8** %17, align 8, !dbg !300, !tbaa !181
  br label %ht_find_new.exit, !dbg !302

ht_find_new.exit.loopexit:                        ; preds = %while.body.i
  %node.025.i.lcssa = phi %struct.ht_node* [ %node.025.i, %while.body.i ]
  br label %ht_find_new.exit

ht_find_new.exit:                                 ; preds = %ht_find_new.exit.loopexit, %if.then4.i, %if.else.i
  %18 = phi i32 [ %inc.i, %if.then4.i ], [ %inc.i, %if.else.i ], [ %8, %ht_find_new.exit.loopexit ]
  %retval.0.i = phi %struct.ht_node* [ %13, %if.then4.i ], [ %13, %if.else.i ], [ %node.025.i.lcssa, %ht_find_new.exit.loopexit ], !dbg !247
  %val = getelementptr inbounds %struct.ht_node* %retval.0.i, i64 0, i32 1, !dbg !303
  store i32 %i.074, i32* %val, align 4, !dbg !303, !tbaa !143
  %inc = add nuw nsw i32 %i.074, 1, !dbg !304
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !56, metadata !116), !dbg !227
  %cmp2 = icmp slt i32 %i.074, %cond, !dbg !228
  br i1 %cmp2, label %for.body, label %for.cond6.preheader, !dbg !231

for.body8:                                        ; preds = %for.body8.lr.ph, %ht_find.exit
  %i.172 = phi i32 [ %cond, %for.body8.lr.ph ], [ %dec, %ht_find.exit ]
  %c.071 = phi i32 [ 0, %for.body8.lr.ph ], [ %c.0.inc13, %ht_find.exit ]
  %call10 = call i32 (i8*, i8*, ...)* @sprintf(i8* %arraydecay9, i8* getelementptr inbounds ([3 x i8]* @.str3, i64 0, i64 0), i32 %i.172) #5, !dbg !305
  tail call void @llvm.dbg.value(metadata i8* %arraydecay9, i64 0, metadata !306, metadata !116) #5, !dbg !307
  tail call void @llvm.dbg.value(metadata i8* %arraydecay9, i64 0, metadata !308, metadata !116) #5, !dbg !310
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !311, metadata !116) #5, !dbg !312
  %19 = load i8* %arraydecay9, align 16, !dbg !313, !tbaa !257
  %tobool5.i.i35 = icmp eq i8 %19, 0, !dbg !314
  br i1 %tobool5.i.i35, label %ht_hashcode.exit.i52, label %for.body.i.i43.preheader, !dbg !314

for.body.i.i43.preheader:                         ; preds = %for.body8
  br label %for.body.i.i43, !dbg !315

for.body.i.i43:                                   ; preds = %for.body.i.i43.preheader, %for.body.i.i43
  %20 = phi i8 [ %21, %for.body.i.i43 ], [ %19, %for.body.i.i43.preheader ], !dbg !309
  %val.07.i.i36 = phi i64 [ %add.i.i40, %for.body.i.i43 ], [ 0, %for.body.i.i43.preheader ], !dbg !309
  %key.addr.06.i.i37 = phi i8* [ %incdec.ptr.i.i41, %for.body.i.i43 ], [ %arraydecay9, %for.body.i.i43.preheader ], !dbg !309
  %mul.i.i38 = mul i64 %val.07.i.i36, 5, !dbg !315
  %conv.i.i39 = sext i8 %20 to i64, !dbg !316
  %add.i.i40 = add i64 %mul.i.i38, %conv.i.i39, !dbg !315
  tail call void @llvm.dbg.value(metadata i64 %add.i.i40, i64 0, metadata !311, metadata !116) #5, !dbg !312
  %incdec.ptr.i.i41 = getelementptr inbounds i8* %key.addr.06.i.i37, i64 1, !dbg !317
  tail call void @llvm.dbg.value(metadata i8* %incdec.ptr.i.i41, i64 0, metadata !308, metadata !116) #5, !dbg !310
  %21 = load i8* %incdec.ptr.i.i41, align 1, !dbg !313, !tbaa !257
  %tobool.i.i42 = icmp eq i8 %21, 0, !dbg !314
  br i1 %tobool.i.i42, label %ht_hashcode.exit.i52.loopexit, label %for.body.i.i43, !dbg !314

ht_hashcode.exit.i52.loopexit:                    ; preds = %for.body.i.i43
  %add.i.i40.lcssa = phi i64 [ %add.i.i40, %for.body.i.i43 ]
  br label %ht_hashcode.exit.i52

ht_hashcode.exit.i52:                             ; preds = %ht_hashcode.exit.i52.loopexit, %for.body8
  %val.0.lcssa.i.i44 = phi i64 [ 0, %for.body8 ], [ %add.i.i40.lcssa, %ht_hashcode.exit.i52.loopexit ], !dbg !309
  %sext77 = shl i64 %.lcssa, 32, !dbg !318
  %conv1.i.i46 = ashr exact i64 %sext77, 32, !dbg !318
  %rem.i.i47 = urem i64 %val.0.lcssa.i.i44, %conv1.i.i46, !dbg !319
  %sext.i48 = shl i64 %rem.i.i47, 32, !dbg !242
  %idxprom.i49 = ashr exact i64 %sext.i48, 32, !dbg !242
  %22 = load %struct.ht_node*** %7, align 8, !dbg !242, !tbaa !164
  %arrayidx.i51 = getelementptr inbounds %struct.ht_node** %22, i64 %idxprom.i49, !dbg !242
  %node.07.i = load %struct.ht_node** %arrayidx.i51, align 8, !dbg !242
  %tobool8.i = icmp eq %struct.ht_node* %node.07.i, null, !dbg !320
  br i1 %tobool8.i, label %ht_find.exit, label %while.body.i56.preheader, !dbg !320

while.body.i56.preheader:                         ; preds = %ht_hashcode.exit.i52
  br label %while.body.i56, !dbg !321

while.body.i56:                                   ; preds = %while.body.i56.preheader, %if.end.i60
  %node.09.i = phi %struct.ht_node* [ %node.0.i58, %if.end.i60 ], [ %node.07.i, %while.body.i56.preheader ], !dbg !243
  %key1.i53 = getelementptr inbounds %struct.ht_node* %node.09.i, i64 0, i32 0, !dbg !321
  %23 = load i8** %key1.i53, align 8, !dbg !321, !tbaa !136
  %call2.i54 = call i32 @strcmp(i8* %arraydecay9, i8* %23) #5, !dbg !321
  %cmp.i55 = icmp eq i32 %call2.i54, 0, !dbg !322
  br i1 %cmp.i55, label %ht_find.exit.loopexit, label %if.end.i60, !dbg !323

if.end.i60:                                       ; preds = %while.body.i56
  %next.i57 = getelementptr inbounds %struct.ht_node* %node.09.i, i64 0, i32 2, !dbg !324
  %node.0.i58 = load %struct.ht_node** %next.i57, align 8, !dbg !242
  %tobool.i59 = icmp eq %struct.ht_node* %node.0.i58, null, !dbg !320
  br i1 %tobool.i59, label %ht_find.exit.loopexit, label %while.body.i56, !dbg !320

ht_find.exit.loopexit:                            ; preds = %if.end.i60, %while.body.i56
  %retval.0.i61.ph = phi %struct.ht_node* [ %node.09.i, %while.body.i56 ], [ null, %if.end.i60 ]
  br label %ht_find.exit

ht_find.exit:                                     ; preds = %ht_find.exit.loopexit, %ht_hashcode.exit.i52
  %retval.0.i61 = phi %struct.ht_node* [ null, %ht_hashcode.exit.i52 ], [ %retval.0.i61.ph, %ht_find.exit.loopexit ], !dbg !243
  %not.tobool = icmp ne %struct.ht_node* %retval.0.i61, null, !dbg !325
  %inc13 = zext i1 %not.tobool to i32, !dbg !325
  %c.0.inc13 = add nsw i32 %inc13, %c.071, !dbg !325
  %dec = add nsw i32 %i.172, -1, !dbg !326
  tail call void @llvm.dbg.value(metadata i32 %dec, i64 0, metadata !56, metadata !116), !dbg !227
  %cmp7 = icmp sgt i32 %i.172, 1, !dbg !234
  br i1 %cmp7, label %for.body8, label %for.end15.loopexit, !dbg !239

for.end15.loopexit:                               ; preds = %ht_find.exit
  %c.0.inc13.lcssa = phi i32 [ %c.0.inc13, %ht_find.exit ]
  br label %for.end15

for.end15:                                        ; preds = %for.end15.loopexit, %ht_create.exit, %for.cond6.preheader
  %c.0.lcssa = phi i32 [ 0, %for.cond6.preheader ], [ 0, %ht_create.exit ], [ %c.0.inc13.lcssa, %for.end15.loopexit ]
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !327, metadata !116) #5, !dbg !329
  %cmp13.i = icmp sgt i32 %conv4.i, 0, !dbg !330
  br i1 %cmp13.i, label %for.body.i.preheader, label %for.end15.ht_destroy.exit_crit_edge, !dbg !331

for.end15.ht_destroy.exit_crit_edge:              ; preds = %for.end15
  %.pre = load i8** %2, align 8, !dbg !332, !tbaa !164
  br label %ht_destroy.exit, !dbg !331

for.body.i.preheader:                             ; preds = %for.end15
  %24 = bitcast i8* %tbl.i to %struct.ht_node***, !dbg !333
  %25 = load %struct.ht_node*** %24, align 8, !dbg !333, !tbaa !164
  %26 = bitcast %struct.ht_node** %25 to i8*
  br label %for.body.i, !dbg !333

for.body.i:                                       ; preds = %for.body.i.preheader, %for.inc.i
  %indvars.iv.i63 = phi i64 [ %indvars.iv.next.i67, %for.inc.i ], [ 0, %for.body.i.preheader ], !dbg !328
  %arrayidx.i64 = getelementptr inbounds %struct.ht_node** %25, i64 %indvars.iv.i63, !dbg !333
  %27 = load %struct.ht_node** %arrayidx.i64, align 8, !dbg !333, !tbaa !181
  tail call void @llvm.dbg.value(metadata %struct.ht_node* %27, i64 0, metadata !334, metadata !116) #5, !dbg !335
  %tobool11.i = icmp eq %struct.ht_node* %27, null, !dbg !336
  br i1 %tobool11.i, label %for.inc.i, label %while.body.i66.preheader, !dbg !336

while.body.i66.preheader:                         ; preds = %for.body.i
  br label %while.body.i66, !dbg !337

while.body.i66:                                   ; preds = %while.body.i66.preheader, %while.body.i66
  %next.012.i = phi %struct.ht_node* [ %28, %while.body.i66 ], [ %27, %while.body.i66.preheader ], !dbg !328
  %next1.i = getelementptr inbounds %struct.ht_node* %next.012.i, i64 0, i32 2, !dbg !337
  %28 = load %struct.ht_node** %next1.i, align 8, !dbg !337, !tbaa !145
  %key.i = getelementptr inbounds %struct.ht_node* %next.012.i, i64 0, i32 0, !dbg !338
  %29 = load i8** %key.i, align 8, !dbg !338, !tbaa !136
  tail call void @free(i8* %29) #5, !dbg !339
  %30 = bitcast %struct.ht_node* %next.012.i to i8*, !dbg !340
  tail call void @free(i8* %30) #5, !dbg !341
  %tobool.i65 = icmp eq %struct.ht_node* %28, null, !dbg !336
  br i1 %tobool.i65, label %for.inc.i.loopexit, label %while.body.i66, !dbg !336

for.inc.i.loopexit:                               ; preds = %while.body.i66
  br label %for.inc.i

for.inc.i:                                        ; preds = %for.inc.i.loopexit, %for.body.i
  %indvars.iv.next.i67 = add nuw nsw i64 %indvars.iv.i63, 1, !dbg !331
  %sext76 = shl i64 %.lcssa, 32, !dbg !330
  %31 = ashr exact i64 %sext76, 32, !dbg !330
  %cmp.i68 = icmp slt i64 %indvars.iv.next.i67, %31, !dbg !330
  br i1 %cmp.i68, label %for.body.i, label %ht_destroy.exit.loopexit, !dbg !331

ht_destroy.exit.loopexit:                         ; preds = %for.inc.i
  br label %ht_destroy.exit

ht_destroy.exit:                                  ; preds = %ht_destroy.exit.loopexit, %for.end15.ht_destroy.exit_crit_edge
  %32 = phi i8* [ %.pre, %for.end15.ht_destroy.exit_crit_edge ], [ %26, %ht_destroy.exit.loopexit ]
  tail call void @free(i8* %32) #5, !dbg !342
  tail call void @free(i8* %call.i28) #5, !dbg !343
  %call16 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str4, i64 0, i64 0), i32 %c.0.lcssa) #5, !dbg !344
  ret i32 0, !dbg !345
}

; Function Attrs: nounwind
declare i32 @sprintf(i8* nocapture, i8* nocapture readonly, ...) #2

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8* nocapture, i8* nocapture) #4

; Function Attrs: nounwind
declare i64 @strtol(i8* readonly, i8** nocapture, i32) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { cold nounwind }
attributes #7 = { noreturn nounwind }

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
!64 = !{!"0x2e\00ht_find\00ht_find\00\00125\001\001\000\000\00256\001\00125", !6, !27, !65, null, null, null, null, !67} ; [ DW_TAG_subprogram ] [line 125] [local] [def] [ht_find]
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
!80 = !{!"0x2e\00ht_hashcode\00ht_hashcode\00\0046\001\001\000\000\00256\001\0046", !6, !27, !81, null, null, null, null, !83} ; [ DW_TAG_subprogram ] [line 46] [local] [def] [ht_hashcode]
!81 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !82, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!82 = !{!12, !15, !9}
!83 = !{!84, !85, !86}
!84 = !{!"0x101\00ht\0016777262\000", !80, !27, !15} ; [ DW_TAG_arg_variable ] [ht] [line 46]
!85 = !{!"0x101\00key\0033554478\000", !80, !27, !9} ; [ DW_TAG_arg_variable ] [key] [line 46]
!86 = !{!"0x100\00val\0047\000", !80, !27, !78}   ; [ DW_TAG_auto_variable ] [val] [line 47]
!87 = !{!"0x2e\00ht_find_new\00ht_find_new\00\00135\001\001\000\000\00256\001\00135", !6, !27, !65, null, null, null, null, !88} ; [ DW_TAG_subprogram ] [line 135] [local] [def] [ht_find_new]
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
!99 = !{!"0x2e\00atoi\00atoi\00\00278\000\001\000\000\00256\001\00279", !100, !101, !102, null, null, null, null, !106} ; [ DW_TAG_subprogram ] [line 278] [def] [scope 279] [atoi]
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
!178 = !MDLocation(line: 96, column: 9, scope: !179)
!179 = !{!"0xb\0095\0032\007", !6, !175}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/./simple_hash.h]
!180 = !MDLocation(line: 95, column: 5, scope: !176)
!181 = !{!138, !138, i64 0}
!182 = !MDLocation(line: 85, column: 27, scope: !41)
!183 = !MDLocation(line: 103, column: 2, scope: !179)
!184 = !MDLocation(line: 85, column: 21, scope: !41)
!185 = !MDLocation(line: 105, column: 13, scope: !186)
!186 = !{!"0xb\00103\0015\008", !6, !179}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/./simple_hash.h]
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
!201 = !MDLocation(line: 17, column: 41, scope: !202)
!202 = !{!"0xb\001", !1, !49}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/hash.c]
!203 = !{!"0x101\00__nptr\0016777494\000", !99, !101, !104, !204} ; [ DW_TAG_arg_variable ] [__nptr] [line 278]
!204 = !MDLocation(line: 17, column: 36, scope: !49)
!205 = !MDLocation(line: 278, column: 1, scope: !99, inlinedAt: !204)
!206 = !MDLocation(line: 280, column: 16, scope: !99, inlinedAt: !204)
!207 = !MDLocation(line: 280, column: 10, scope: !99, inlinedAt: !204)
!208 = !MDLocation(line: 17, column: 17, scope: !49)
!209 = !MDLocation(line: 18, column: 10, scope: !49)
!210 = !{!"0x101\00size\0016777285\000", !34, !27, !12, !211} ; [ DW_TAG_arg_variable ] [size] [line 69]
!211 = !MDLocation(line: 20, column: 24, scope: !49)
!212 = !MDLocation(line: 69, column: 29, scope: !34, inlinedAt: !211)
!213 = !{!"0x100\00i\0070\000", !34, !27, !12, !211} ; [ DW_TAG_auto_variable ] [i] [line 70]
!214 = !MDLocation(line: 70, column: 9, scope: !34, inlinedAt: !211)
!215 = !MDLocation(line: 71, column: 40, scope: !34, inlinedAt: !211)
!216 = !MDLocation(line: 72, column: 31, scope: !34, inlinedAt: !211)
!217 = !MDLocation(line: 72, column: 5, scope: !34, inlinedAt: !211)
!218 = !MDLocation(line: 72, column: 12, scope: !34, inlinedAt: !211)
!219 = !MDLocation(line: 73, column: 16, scope: !34, inlinedAt: !211)
!220 = !MDLocation(line: 73, column: 5, scope: !34, inlinedAt: !211)
!221 = !MDLocation(line: 74, column: 41, scope: !34, inlinedAt: !211)
!222 = !MDLocation(line: 74, column: 34, scope: !34, inlinedAt: !211)
!223 = !MDLocation(line: 74, column: 5, scope: !34, inlinedAt: !211)
!224 = !MDLocation(line: 75, column: 5, scope: !34, inlinedAt: !211)
!225 = !MDLocation(line: 76, column: 5, scope: !34, inlinedAt: !211)
!226 = !MDLocation(line: 77, column: 5, scope: !34, inlinedAt: !211)
!227 = !MDLocation(line: 17, column: 9, scope: !49)
!228 = !MDLocation(line: 22, column: 15, scope: !229)
!229 = !{!"0xb\0022\005\0010", !1, !230}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/hash.c]
!230 = !{!"0xb\0022\005\009", !1, !49}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/hash.c]
!231 = !MDLocation(line: 22, column: 5, scope: !230)
!232 = !MDLocation(line: 23, column: 10, scope: !233)
!233 = !{!"0xb\0022\0026\0011", !1, !229}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/hash.c]
!234 = !MDLocation(line: 27, column: 15, scope: !235)
!235 = !{!"0xb\002", !1, !236}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/hash.c]
!236 = !{!"0xb\001", !1, !237}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/hash.c]
!237 = !{!"0xb\0027\005\0013", !1, !238}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/hash.c]
!238 = !{!"0xb\0027\005\0012", !1, !49}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/hash.c]
!239 = !MDLocation(line: 27, column: 5, scope: !238)
!240 = !MDLocation(line: 28, column: 10, scope: !241)
!241 = !{!"0xb\0027\0025\0014", !1, !237}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/hash.c]
!242 = !MDLocation(line: 127, column: 28, scope: !64, inlinedAt: !243)
!243 = !MDLocation(line: 29, column: 6, scope: !244)
!244 = !{!"0xb\0029\006\0015", !1, !241}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/hash.c]
!245 = !MDLocation(line: 23, column: 2, scope: !233)
!246 = !{!"0x101\00key\0033554567\000", !87, !27, !9, !247} ; [ DW_TAG_arg_variable ] [key] [line 135]
!247 = !MDLocation(line: 24, column: 3, scope: !233)
!248 = !MDLocation(line: 135, column: 60, scope: !87, inlinedAt: !247)
!249 = !{!"0x101\00key\0033554478\000", !80, !27, !9, !250} ; [ DW_TAG_arg_variable ] [key] [line 46]
!250 = !MDLocation(line: 136, column: 21, scope: !87, inlinedAt: !247)
!251 = !MDLocation(line: 46, column: 48, scope: !80, inlinedAt: !250)
!252 = !{!"0x100\00val\0047\000", !80, !27, !78, !250} ; [ DW_TAG_auto_variable ] [val] [line 47]
!253 = !MDLocation(line: 47, column: 19, scope: !80, inlinedAt: !250)
!254 = !MDLocation(line: 48, column: 12, scope: !255, inlinedAt: !250)
!255 = !{!"0xb\0048\005\0020", !6, !256}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/./simple_hash.h]
!256 = !{!"0xb\0048\005\0019", !6, !80}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/./simple_hash.h]
!257 = !{!139, !139, i64 0}
!258 = !MDLocation(line: 48, column: 5, scope: !256, inlinedAt: !250)
!259 = !MDLocation(line: 48, column: 31, scope: !255, inlinedAt: !250)
!260 = !MDLocation(line: 48, column: 41, scope: !255, inlinedAt: !250)
!261 = !MDLocation(line: 48, column: 18, scope: !262, inlinedAt: !250)
!262 = !{!"0xb\003", !6, !255}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/./simple_hash.h]
!263 = !MDLocation(line: 49, column: 18, scope: !80, inlinedAt: !250)
!264 = !MDLocation(line: 49, column: 12, scope: !80, inlinedAt: !250)
!265 = !{!"0x100\00prev\00137\000", !87, !27, !4, !247} ; [ DW_TAG_auto_variable ] [prev] [line 137]
!266 = !MDLocation(line: 137, column: 21, scope: !87, inlinedAt: !247)
!267 = !MDLocation(line: 137, column: 39, scope: !87, inlinedAt: !247)
!268 = !MDLocation(line: 138, column: 5, scope: !87, inlinedAt: !247)
!269 = !MDLocation(line: 139, column: 6, scope: !95, inlinedAt: !247)
!270 = !MDLocation(line: 139, column: 6, scope: !96, inlinedAt: !247)
!271 = !MDLocation(line: 139, column: 6, scope: !97, inlinedAt: !247)
!272 = !MDLocation(line: 141, column: 9, scope: !97, inlinedAt: !247)
!273 = !MDLocation(line: 146, column: 5, scope: !87, inlinedAt: !247)
!274 = !MDLocation(line: 147, column: 9, scope: !87, inlinedAt: !247)
!275 = !{!"0x101\00key\0016777268\000", !26, !27, !9, !276} ; [ DW_TAG_arg_variable ] [key] [line 52]
!276 = !MDLocation(line: 148, column: 22, scope: !277, inlinedAt: !247)
!277 = !{!"0xb\00147\0015\0025", !6, !278}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/./simple_hash.h]
!278 = !{!"0xb\00147\009\0024", !6, !87}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/./simple_hash.h]
!279 = !MDLocation(line: 52, column: 38, scope: !26, inlinedAt: !276)
!280 = !MDLocation(line: 55, column: 35, scope: !119, inlinedAt: !276)
!281 = !MDLocation(line: 55, column: 17, scope: !119, inlinedAt: !276)
!282 = !{!"0x100\00node\0054\000", !26, !27, !4, !276} ; [ DW_TAG_auto_variable ] [node] [line 54]
!283 = !MDLocation(line: 54, column: 21, scope: !26, inlinedAt: !276)
!284 = !MDLocation(line: 55, column: 9, scope: !119, inlinedAt: !276)
!285 = !MDLocation(line: 55, column: 9, scope: !26, inlinedAt: !276)
!286 = !MDLocation(line: 56, column: 2, scope: !125, inlinedAt: !276)
!287 = !MDLocation(line: 57, column: 2, scope: !125, inlinedAt: !276)
!288 = !MDLocation(line: 59, column: 27, scope: !128, inlinedAt: !276)
!289 = !{!"0x100\00newkey\0053\000", !26, !27, !9, !276} ; [ DW_TAG_auto_variable ] [newkey] [line 53]
!290 = !MDLocation(line: 53, column: 11, scope: !26, inlinedAt: !276)
!291 = !MDLocation(line: 59, column: 9, scope: !128, inlinedAt: !276)
!292 = !MDLocation(line: 59, column: 9, scope: !26, inlinedAt: !276)
!293 = !MDLocation(line: 60, column: 2, scope: !133, inlinedAt: !276)
!294 = !MDLocation(line: 61, column: 2, scope: !133, inlinedAt: !276)
!295 = !MDLocation(line: 63, column: 5, scope: !26, inlinedAt: !276)
!296 = !MDLocation(line: 64, column: 5, scope: !26, inlinedAt: !276)
!297 = !MDLocation(line: 65, column: 5, scope: !26, inlinedAt: !276)
!298 = !MDLocation(line: 148, column: 9, scope: !277, inlinedAt: !247)
!299 = !MDLocation(line: 148, column: 2, scope: !277, inlinedAt: !247)
!300 = !MDLocation(line: 150, column: 9, scope: !301, inlinedAt: !247)
!301 = !{!"0xb\00149\0012\0026", !6, !278}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/./simple_hash.h]
!302 = !MDLocation(line: 150, column: 2, scope: !301, inlinedAt: !247)
!303 = !MDLocation(line: 24, column: 2, scope: !233)
!304 = !MDLocation(line: 22, column: 21, scope: !229)
!305 = !MDLocation(line: 28, column: 2, scope: !241)
!306 = !{!"0x101\00key\0033554557\000", !64, !27, !9, !243} ; [ DW_TAG_arg_variable ] [key] [line 125]
!307 = !MDLocation(line: 125, column: 56, scope: !64, inlinedAt: !243)
!308 = !{!"0x101\00key\0033554478\000", !80, !27, !9, !309} ; [ DW_TAG_arg_variable ] [key] [line 46]
!309 = !MDLocation(line: 126, column: 21, scope: !64, inlinedAt: !243)
!310 = !MDLocation(line: 46, column: 48, scope: !80, inlinedAt: !309)
!311 = !{!"0x100\00val\0047\000", !80, !27, !78, !309} ; [ DW_TAG_auto_variable ] [val] [line 47]
!312 = !MDLocation(line: 47, column: 19, scope: !80, inlinedAt: !309)
!313 = !MDLocation(line: 48, column: 12, scope: !255, inlinedAt: !309)
!314 = !MDLocation(line: 48, column: 5, scope: !256, inlinedAt: !309)
!315 = !MDLocation(line: 48, column: 31, scope: !255, inlinedAt: !309)
!316 = !MDLocation(line: 48, column: 41, scope: !255, inlinedAt: !309)
!317 = !MDLocation(line: 48, column: 18, scope: !262, inlinedAt: !309)
!318 = !MDLocation(line: 49, column: 18, scope: !80, inlinedAt: !309)
!319 = !MDLocation(line: 49, column: 12, scope: !80, inlinedAt: !309)
!320 = !MDLocation(line: 128, column: 5, scope: !64, inlinedAt: !243)
!321 = !MDLocation(line: 129, column: 6, scope: !73, inlinedAt: !243)
!322 = !MDLocation(line: 129, column: 6, scope: !74, inlinedAt: !243)
!323 = !MDLocation(line: 129, column: 6, scope: !75, inlinedAt: !243)
!324 = !MDLocation(line: 130, column: 9, scope: !75, inlinedAt: !243)
!325 = !MDLocation(line: 29, column: 6, scope: !241)
!326 = !MDLocation(line: 27, column: 20, scope: !237)
!327 = !{!"0x100\00i\0086\000", !41, !27, !12, !328} ; [ DW_TAG_auto_variable ] [i] [line 86]
!328 = !MDLocation(line: 32, column: 5, scope: !49)
!329 = !MDLocation(line: 86, column: 9, scope: !41, inlinedAt: !328)
!330 = !MDLocation(line: 95, column: 15, scope: !175, inlinedAt: !328)
!331 = !MDLocation(line: 95, column: 5, scope: !176, inlinedAt: !328)
!332 = !MDLocation(line: 117, column: 10, scope: !41, inlinedAt: !328)
!333 = !MDLocation(line: 96, column: 9, scope: !179, inlinedAt: !328)
!334 = !{!"0x100\00next\0085\000", !41, !27, !4, !328} ; [ DW_TAG_auto_variable ] [next] [line 85]
!335 = !MDLocation(line: 85, column: 27, scope: !41, inlinedAt: !328)
!336 = !MDLocation(line: 103, column: 2, scope: !179, inlinedAt: !328)
!337 = !MDLocation(line: 105, column: 13, scope: !186, inlinedAt: !328)
!338 = !MDLocation(line: 106, column: 11, scope: !186, inlinedAt: !328)
!339 = !MDLocation(line: 106, column: 6, scope: !186, inlinedAt: !328)
!340 = !MDLocation(line: 107, column: 11, scope: !186, inlinedAt: !328)
!341 = !MDLocation(line: 107, column: 6, scope: !186, inlinedAt: !328)
!342 = !MDLocation(line: 117, column: 5, scope: !41, inlinedAt: !328)
!343 = !MDLocation(line: 118, column: 5, scope: !41, inlinedAt: !328)
!344 = !MDLocation(line: 34, column: 5, scope: !49)
!345 = !MDLocation(line: 35, column: 5, scope: !49)
