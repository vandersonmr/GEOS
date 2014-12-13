; ModuleID = 'hash.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

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
  tail call void @llvm.dbg.value(metadata !{i8* %key}, i64 0, metadata !19), !dbg !116
  %1 = tail call noalias i8* @malloc(i64 24) #7, !dbg !117
  %2 = bitcast i8* %1 to %struct.ht_node*, !dbg !117
  tail call void @llvm.dbg.value(metadata !{%struct.ht_node* %2}, i64 0, metadata !21), !dbg !117
  %3 = icmp eq i8* %1, null, !dbg !117
  br i1 %3, label %4, label %5, !dbg !117

; <label>:4                                       ; preds = %0
  tail call void @perror(i8* getelementptr inbounds ([15 x i8]* @.str, i64 0, i64 0)) #8, !dbg !119
  tail call void @exit(i32 1) #9, !dbg !121
  unreachable, !dbg !121

; <label>:5                                       ; preds = %0
  %6 = tail call noalias i8* @__strdup(i8* %key) #7, !dbg !122
  tail call void @llvm.dbg.value(metadata !{i8* %6}, i64 0, metadata !20), !dbg !122
  %7 = icmp eq i8* %6, null, !dbg !122
  br i1 %7, label %8, label %9, !dbg !122

; <label>:8                                       ; preds = %5
  tail call void @perror(i8* getelementptr inbounds ([14 x i8]* @.str1, i64 0, i64 0)) #8, !dbg !124
  tail call void @exit(i32 1) #9, !dbg !126
  unreachable, !dbg !126

; <label>:9                                       ; preds = %5
  %10 = bitcast i8* %1 to i8**, !dbg !127
  store i8* %6, i8** %10, align 8, !dbg !127, !tbaa !128
  %11 = getelementptr inbounds i8* %1, i64 8, !dbg !134
  %12 = bitcast i8* %11 to i32*, !dbg !134
  store i32 0, i32* %12, align 4, !dbg !134, !tbaa !135
  %13 = getelementptr inbounds i8* %1, i64 16, !dbg !136
  %14 = bitcast i8* %13 to %struct.ht_node**, !dbg !136
  store %struct.ht_node* null, %struct.ht_node** %14, align 8, !dbg !136, !tbaa !137
  ret %struct.ht_node* %2, !dbg !138
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

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
  tail call void @llvm.dbg.value(metadata !{i32 %size}, i64 0, metadata !35), !dbg !139
  tail call void @llvm.dbg.value(metadata !140, i64 0, metadata !36), !dbg !141
  %1 = tail call noalias i8* @malloc(i64 40) #7, !dbg !142
  tail call void @llvm.dbg.value(metadata !{%struct.ht_ht* %8}, i64 0, metadata !37), !dbg !142
  %2 = sext i32 %size to i64, !dbg !143
  br label %3, !dbg !143

; <label>:3                                       ; preds = %3, %0
  %indvars.iv = phi i64 [ %indvars.iv.next, %3 ], [ 0, %0 ]
  %4 = getelementptr inbounds [28 x i64]* @ht_prime_list, i64 0, i64 %indvars.iv, !dbg !143
  %5 = load i64* %4, align 8, !dbg !143, !tbaa !144
  %6 = icmp ult i64 %5, %2, !dbg !143
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !143
  br i1 %6, label %3, label %7, !dbg !143

; <label>:7                                       ; preds = %3
  %8 = bitcast i8* %1 to %struct.ht_ht*, !dbg !142
  %9 = trunc i64 %5 to i32, !dbg !146
  %10 = bitcast i8* %1 to i32*, !dbg !146
  store i32 %9, i32* %10, align 4, !dbg !146, !tbaa !147
  %sext = shl i64 %5, 32, !dbg !149
  %11 = ashr exact i64 %sext, 32, !dbg !149
  %12 = tail call noalias i8* @calloc(i64 %11, i64 8) #7, !dbg !149
  %13 = bitcast i8* %12 to %struct.ht_node**, !dbg !149
  %14 = getelementptr inbounds i8* %1, i64 8, !dbg !149
  %15 = bitcast i8* %14 to %struct.ht_node***, !dbg !149
  store %struct.ht_node** %13, %struct.ht_node*** %15, align 8, !dbg !149, !tbaa !150
  %16 = getelementptr inbounds i8* %1, i64 16, !dbg !151
  %17 = bitcast i8* %16 to i32*, !dbg !151
  store i32 0, i32* %17, align 4, !dbg !151, !tbaa !152
  %18 = getelementptr inbounds i8* %1, i64 24, !dbg !153
  %19 = bitcast i8* %18 to %struct.ht_node**, !dbg !153
  store %struct.ht_node* null, %struct.ht_node** %19, align 8, !dbg !153, !tbaa !154
  %20 = getelementptr inbounds i8* %1, i64 32, !dbg !155
  %21 = bitcast i8* %20 to i32*, !dbg !155
  store i32 0, i32* %21, align 4, !dbg !155, !tbaa !156
  ret %struct.ht_ht* %8, !dbg !157
}

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #2

; Function Attrs: nounwind uwtable
define void @ht_destroy(%struct.ht_ht* nocapture %ht) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.ht_ht* %ht}, i64 0, metadata !42), !dbg !158
  tail call void @llvm.dbg.value(metadata !140, i64 0, metadata !45), !dbg !159
  %1 = getelementptr inbounds %struct.ht_ht* %ht, i64 0, i32 0, !dbg !159
  %2 = load i32* %1, align 4, !dbg !159, !tbaa !147
  %3 = icmp sgt i32 %2, 0, !dbg !159
  br i1 %3, label %.lr.ph4, label %._crit_edge5, !dbg !159

.lr.ph4:                                          ; preds = %0
  %4 = getelementptr inbounds %struct.ht_ht* %ht, i64 0, i32 1, !dbg !161
  br label %5, !dbg !159

; <label>:5                                       ; preds = %.lr.ph4, %._crit_edge
  %indvars.iv = phi i64 [ 0, %.lr.ph4 ], [ %indvars.iv.next, %._crit_edge ]
  %6 = load %struct.ht_node*** %4, align 8, !dbg !161, !tbaa !150
  %7 = getelementptr inbounds %struct.ht_node** %6, i64 %indvars.iv, !dbg !161
  %8 = load %struct.ht_node** %7, align 8, !dbg !161, !tbaa !163
  tail call void @llvm.dbg.value(metadata !{%struct.ht_node* %8}, i64 0, metadata !44), !dbg !161
  %9 = icmp eq %struct.ht_node* %8, null, !dbg !164
  br i1 %9, label %._crit_edge, label %.lr.ph, !dbg !164

.lr.ph:                                           ; preds = %5, %.lr.ph
  %next.01 = phi %struct.ht_node* [ %11, %.lr.ph ], [ %8, %5 ]
  tail call void @llvm.dbg.value(metadata !{%struct.ht_node* %next.01}, i64 0, metadata !43), !dbg !165
  %10 = getelementptr inbounds %struct.ht_node* %next.01, i64 0, i32 2, !dbg !167
  %11 = load %struct.ht_node** %10, align 8, !dbg !167, !tbaa !137
  tail call void @llvm.dbg.value(metadata !{%struct.ht_node* %11}, i64 0, metadata !44), !dbg !167
  %12 = getelementptr inbounds %struct.ht_node* %next.01, i64 0, i32 0, !dbg !168
  %13 = load i8** %12, align 8, !dbg !168, !tbaa !128
  tail call void @free(i8* %13) #7, !dbg !168
  %14 = bitcast %struct.ht_node* %next.01 to i8*, !dbg !169
  tail call void @free(i8* %14) #7, !dbg !169
  %15 = icmp eq %struct.ht_node* %11, null, !dbg !164
  br i1 %15, label %._crit_edge, label %.lr.ph, !dbg !164

._crit_edge:                                      ; preds = %.lr.ph, %5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !159
  %16 = load i32* %1, align 4, !dbg !159, !tbaa !147
  %17 = trunc i64 %indvars.iv.next to i32, !dbg !159
  %18 = icmp slt i32 %17, %16, !dbg !159
  br i1 %18, label %5, label %._crit_edge5, !dbg !159

._crit_edge5:                                     ; preds = %._crit_edge, %0
  %19 = getelementptr inbounds %struct.ht_ht* %ht, i64 0, i32 1, !dbg !170
  %20 = load %struct.ht_node*** %19, align 8, !dbg !170, !tbaa !150
  %21 = bitcast %struct.ht_node** %20 to i8*, !dbg !170
  tail call void @free(i8* %21) #7, !dbg !170
  %22 = bitcast %struct.ht_ht* %ht to i8*, !dbg !171
  tail call void @free(i8* %22) #7, !dbg !171
  ret void, !dbg !172
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #2

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
  %buf = alloca [32 x i8], align 16
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !52), !dbg !173
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !53), !dbg !173
  tail call void @llvm.dbg.value(metadata !140, i64 0, metadata !56), !dbg !174
  %1 = icmp eq i32 %argc, 2, !dbg !174
  br i1 %1, label %3, label %.thread, !dbg !174

.thread:                                          ; preds = %0
  tail call void @llvm.dbg.value(metadata !{i32 %10}, i64 0, metadata !57), !dbg !175
  tail call void @llvm.dbg.declare(metadata !{[32 x i8]* %buf}, metadata !58), !dbg !176
  %2 = tail call %struct.ht_ht* @ht_create(i32 3500000), !dbg !177
  tail call void @llvm.dbg.value(metadata !{%struct.ht_ht* %25}, i64 0, metadata !62), !dbg !177
  tail call void @llvm.dbg.value(metadata !178, i64 0, metadata !54), !dbg !179
  br label %.lr.ph5, !dbg !179

; <label>:3                                       ; preds = %0
  %4 = getelementptr inbounds i8** %argv, i64 1, !dbg !175
  %5 = load i8** %4, align 8, !dbg !175, !tbaa !163
  %6 = tail call i32 @atoi(i8* %5) #10, !dbg !175
  tail call void @llvm.dbg.value(metadata !{i32 %10}, i64 0, metadata !57), !dbg !175
  tail call void @llvm.dbg.declare(metadata !{[32 x i8]* %buf}, metadata !58), !dbg !176
  %7 = tail call %struct.ht_ht* @ht_create(i32 %6), !dbg !177
  tail call void @llvm.dbg.value(metadata !{%struct.ht_ht* %25}, i64 0, metadata !62), !dbg !177
  tail call void @llvm.dbg.value(metadata !178, i64 0, metadata !54), !dbg !179
  %8 = icmp slt i32 %6, 1, !dbg !179
  br i1 %8, label %._crit_edge, label %.lr.ph5, !dbg !179

.lr.ph5:                                          ; preds = %.thread, %3
  %9 = phi %struct.ht_ht* [ %2, %.thread ], [ %7, %3 ]
  %10 = phi i32 [ 3500000, %.thread ], [ %6, %3 ]
  %11 = getelementptr inbounds [32 x i8]* %buf, i64 0, i64 0, !dbg !181
  br label %14, !dbg !179

.preheader:                                       ; preds = %14
  %12 = icmp sgt i32 %10, 0, !dbg !183
  br i1 %12, label %.lr.ph, label %._crit_edge, !dbg !183

.lr.ph:                                           ; preds = %.preheader
  %13 = getelementptr inbounds [32 x i8]* %buf, i64 0, i64 0, !dbg !185
  br label %19, !dbg !183

; <label>:14                                      ; preds = %14, %.lr.ph5
  %i.03 = phi i32 [ 1, %.lr.ph5 ], [ %18, %14 ]
  %15 = call i32 (i8*, i8*, ...)* @sprintf(i8* %11, i8* getelementptr inbounds ([3 x i8]* @.str2, i64 0, i64 0), i32 %i.03) #7, !dbg !181
  %16 = call fastcc %struct.ht_node* @ht_find_new(%struct.ht_ht* %9, i8* %11), !dbg !187
  %17 = getelementptr inbounds %struct.ht_node* %16, i64 0, i32 1, !dbg !187
  store i32 %i.03, i32* %17, align 4, !dbg !187, !tbaa !135
  %18 = add nsw i32 %i.03, 1, !dbg !179
  tail call void @llvm.dbg.value(metadata !{i32 %18}, i64 0, metadata !54), !dbg !179
  %exitcond = icmp eq i32 %i.03, %10, !dbg !179
  br i1 %exitcond, label %.preheader, label %14, !dbg !179

; <label>:19                                      ; preds = %.lr.ph, %19
  %i.12 = phi i32 [ %10, %.lr.ph ], [ %23, %19 ]
  %c.01 = phi i32 [ 0, %.lr.ph ], [ %c.0., %19 ]
  %20 = call i32 (i8*, i8*, ...)* @sprintf(i8* %13, i8* getelementptr inbounds ([3 x i8]* @.str3, i64 0, i64 0), i32 %i.12) #7, !dbg !185
  %21 = call fastcc %struct.ht_node* @ht_find(%struct.ht_ht* %9, i8* %13), !dbg !188
  %not. = icmp ne %struct.ht_node* %21, null, !dbg !188
  %22 = zext i1 %not. to i32, !dbg !188
  %c.0. = add nsw i32 %22, %c.01, !dbg !188
  %23 = add nsw i32 %i.12, -1, !dbg !183
  tail call void @llvm.dbg.value(metadata !{i32 %23}, i64 0, metadata !54), !dbg !183
  %24 = icmp sgt i32 %23, 0, !dbg !183
  br i1 %24, label %19, label %._crit_edge, !dbg !183

._crit_edge:                                      ; preds = %19, %3, %.preheader
  %25 = phi %struct.ht_ht* [ %9, %.preheader ], [ %7, %3 ], [ %9, %19 ]
  %c.0.lcssa = phi i32 [ 0, %.preheader ], [ 0, %3 ], [ %c.0., %19 ]
  tail call void @ht_destroy(%struct.ht_ht* %25), !dbg !190
  %26 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str4, i64 0, i64 0), i32 %c.0.lcssa) #7, !dbg !191
  ret i32 0, !dbg !192
}

; Function Attrs: inlinehint nounwind readonly uwtable
define available_externally i32 @atoi(i8* nocapture readonly %__nptr) #4 {
  tail call void @llvm.dbg.value(metadata !{i8* %__nptr}, i64 0, metadata !107), !dbg !193
  %1 = tail call i64 @strtol(i8* nocapture %__nptr, i8** null, i32 10) #7, !dbg !194
  %2 = trunc i64 %1 to i32, !dbg !194
  ret i32 %2, !dbg !194
}

; Function Attrs: nounwind
declare i32 @sprintf(i8* nocapture, i8* nocapture readonly, ...) #2

; Function Attrs: nounwind uwtable
define internal fastcc %struct.ht_node* @ht_find_new(%struct.ht_ht* nocapture %ht, i8* nocapture readonly %key) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.ht_ht* %ht}, i64 0, metadata !89), !dbg !196
  tail call void @llvm.dbg.value(metadata !{i8* %key}, i64 0, metadata !90), !dbg !196
  %1 = tail call fastcc i32 @ht_hashcode(%struct.ht_ht* %ht, i8* %key), !dbg !197
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !91), !dbg !197
  tail call void @llvm.dbg.value(metadata !198, i64 0, metadata !92), !dbg !199
  %2 = sext i32 %1 to i64, !dbg !199
  %3 = getelementptr inbounds %struct.ht_ht* %ht, i64 0, i32 1, !dbg !199
  %4 = load %struct.ht_node*** %3, align 8, !dbg !199, !tbaa !150
  %5 = getelementptr inbounds %struct.ht_node** %4, i64 %2, !dbg !199
  %node.03 = load %struct.ht_node** %5, align 8, !dbg !199
  %6 = icmp eq %struct.ht_node* %node.03, null, !dbg !200
  br i1 %6, label %._crit_edge, label %.lr.ph, !dbg !200

; <label>:7                                       ; preds = %.lr.ph
  %8 = getelementptr inbounds %struct.ht_node* %node.04, i64 0, i32 2, !dbg !201
  %node.0 = load %struct.ht_node** %8, align 8, !dbg !199
  %9 = icmp eq %struct.ht_node* %node.0, null, !dbg !200
  br i1 %9, label %._crit_edge, label %.lr.ph, !dbg !200

.lr.ph:                                           ; preds = %0, %7
  %node.04 = phi %struct.ht_node* [ %node.0, %7 ], [ %node.03, %0 ]
  %10 = getelementptr inbounds %struct.ht_node* %node.04, i64 0, i32 0, !dbg !202
  %11 = load i8** %10, align 8, !dbg !202, !tbaa !128
  %12 = tail call i32 @strcmp(i8* %key, i8* %11) #7, !dbg !202
  %13 = icmp eq i32 %12, 0, !dbg !202
  tail call void @llvm.dbg.value(metadata !{%struct.ht_node* %node.04}, i64 0, metadata !92), !dbg !203
  br i1 %13, label %.loopexit, label %7, !dbg !202

._crit_edge:                                      ; preds = %7, %0
  %prev.0.lcssa = phi %struct.ht_node* [ null, %0 ], [ %node.04, %7 ]
  %14 = getelementptr inbounds %struct.ht_ht* %ht, i64 0, i32 4, !dbg !204
  %15 = load i32* %14, align 4, !dbg !204, !tbaa !156
  %16 = add nsw i32 %15, 1, !dbg !204
  store i32 %16, i32* %14, align 4, !dbg !204, !tbaa !156
  %17 = icmp eq %struct.ht_node* %prev.0.lcssa, null, !dbg !205
  %18 = tail call %struct.ht_node* @ht_node_create(i8* %key), !dbg !207
  br i1 %17, label %21, label %19, !dbg !205

; <label>:19                                      ; preds = %._crit_edge
  %20 = getelementptr inbounds %struct.ht_node* %prev.0.lcssa, i64 0, i32 2, !dbg !207
  store %struct.ht_node* %18, %struct.ht_node** %20, align 8, !dbg !207, !tbaa !137
  br label %.loopexit, !dbg !207

; <label>:21                                      ; preds = %._crit_edge
  %22 = load %struct.ht_node*** %3, align 8, !dbg !209, !tbaa !150
  %23 = getelementptr inbounds %struct.ht_node** %22, i64 %2, !dbg !209
  store %struct.ht_node* %18, %struct.ht_node** %23, align 8, !dbg !209, !tbaa !163
  br label %.loopexit, !dbg !209

.loopexit:                                        ; preds = %.lr.ph, %21, %19
  %.0 = phi %struct.ht_node* [ %18, %19 ], [ %18, %21 ], [ %node.04, %.lr.ph ]
  ret %struct.ht_node* %.0, !dbg !211
}

; Function Attrs: nounwind readonly uwtable
define internal fastcc %struct.ht_node* @ht_find(%struct.ht_ht* nocapture readonly %ht, i8* nocapture readonly %key) #5 {
  tail call void @llvm.dbg.value(metadata !{%struct.ht_ht* %ht}, i64 0, metadata !67), !dbg !212
  tail call void @llvm.dbg.value(metadata !{i8* %key}, i64 0, metadata !68), !dbg !212
  %1 = tail call fastcc i32 @ht_hashcode(%struct.ht_ht* %ht, i8* %key), !dbg !213
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !69), !dbg !213
  %2 = sext i32 %1 to i64, !dbg !214
  %3 = getelementptr inbounds %struct.ht_ht* %ht, i64 0, i32 1, !dbg !214
  %4 = load %struct.ht_node*** %3, align 8, !dbg !214, !tbaa !150
  %5 = getelementptr inbounds %struct.ht_node** %4, i64 %2, !dbg !214
  %node.01 = load %struct.ht_node** %5, align 8, !dbg !214
  %6 = icmp eq %struct.ht_node* %node.01, null, !dbg !215
  br i1 %6, label %._crit_edge, label %.lr.ph, !dbg !215

; <label>:7                                       ; preds = %.lr.ph
  %8 = getelementptr inbounds %struct.ht_node* %node.02, i64 0, i32 2, !dbg !216
  %node.0 = load %struct.ht_node** %8, align 8, !dbg !214
  %9 = icmp eq %struct.ht_node* %node.0, null, !dbg !215
  br i1 %9, label %._crit_edge, label %.lr.ph, !dbg !215

.lr.ph:                                           ; preds = %0, %7
  %node.02 = phi %struct.ht_node* [ %node.0, %7 ], [ %node.01, %0 ]
  %10 = getelementptr inbounds %struct.ht_node* %node.02, i64 0, i32 0, !dbg !217
  %11 = load i8** %10, align 8, !dbg !217, !tbaa !128
  %12 = tail call i32 @strcmp(i8* %key, i8* %11) #7, !dbg !217
  %13 = icmp eq i32 %12, 0, !dbg !217
  br i1 %13, label %._crit_edge, label %7, !dbg !217

._crit_edge:                                      ; preds = %.lr.ph, %7, %0
  %.0 = phi %struct.ht_node* [ null, %0 ], [ %node.02, %.lr.ph ], [ null, %7 ]
  ret %struct.ht_node* %.0, !dbg !218
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind readonly uwtable
define internal fastcc i32 @ht_hashcode(%struct.ht_ht* nocapture readonly %ht, i8* nocapture readonly %key) #5 {
  tail call void @llvm.dbg.value(metadata !{%struct.ht_ht* %ht}, i64 0, metadata !84), !dbg !219
  tail call void @llvm.dbg.value(metadata !{i8* %key}, i64 0, metadata !85), !dbg !219
  tail call void @llvm.dbg.value(metadata !220, i64 0, metadata !86), !dbg !221
  %1 = load i8* %key, align 1, !dbg !222, !tbaa !224
  %2 = icmp eq i8 %1, 0, !dbg !222
  br i1 %2, label %._crit_edge, label %.lr.ph, !dbg !222

.lr.ph:                                           ; preds = %0, %.lr.ph
  %3 = phi i8 [ %8, %.lr.ph ], [ %1, %0 ]
  %val.02 = phi i64 [ %6, %.lr.ph ], [ 0, %0 ]
  %.01 = phi i8* [ %7, %.lr.ph ], [ %key, %0 ]
  %4 = mul i64 %val.02, 5, !dbg !222
  %5 = sext i8 %3 to i64, !dbg !222
  %6 = add i64 %5, %4, !dbg !222
  tail call void @llvm.dbg.value(metadata !{i64 %6}, i64 0, metadata !86), !dbg !222
  %7 = getelementptr inbounds i8* %.01, i64 1, !dbg !222
  tail call void @llvm.dbg.value(metadata !{i8* %7}, i64 0, metadata !85), !dbg !222
  %8 = load i8* %7, align 1, !dbg !222, !tbaa !224
  %9 = icmp eq i8 %8, 0, !dbg !222
  br i1 %9, label %._crit_edge, label %.lr.ph, !dbg !222

._crit_edge:                                      ; preds = %.lr.ph, %0
  %val.0.lcssa = phi i64 [ 0, %0 ], [ %6, %.lr.ph ]
  %10 = getelementptr inbounds %struct.ht_ht* %ht, i64 0, i32 0, !dbg !225
  %11 = load i32* %10, align 4, !dbg !225, !tbaa !147
  %12 = sext i32 %11 to i64, !dbg !225
  %13 = urem i64 %val.0.lcssa, %12, !dbg !225
  %14 = trunc i64 %13 to i32, !dbg !225
  ret i32 %14, !dbg !225
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8* nocapture, i8* nocapture) #6

; Function Attrs: nounwind
declare i64 @strtol(i8* readonly, i8** nocapture, i32) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

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

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !108, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/hash.c] [DW_LANG_C99]
!1 = metadata !{metadata !"hash.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !22, metadata !38, metadata !46, metadata !63, metadata !80, metadata !87, metadata !99}
!4 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"ht_node_create", metadata !"ht_node_create", metadata !"", i32 52, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, %struct.ht_node* (i8*)* @ht_node_create, null, null, metadata !18, i32 52} ; [ DW_TAG_subprogram ] [line 52] [def] [ht_node_create]
!5 = metadata !{metadata !"./simple_hash.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!6 = metadata !{i32 786473, metadata !5}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/./simple_hash.h]
!7 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{metadata !9, metadata !13}
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ht_node]
!10 = metadata !{i32 786451, metadata !5, null, metadata !"ht_node", i32 21, i64 192, i64 64, i32 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [ht_node] [line 21, size 192, align 64, offset 0] [def] [from ]
!11 = metadata !{metadata !12, metadata !15, metadata !17}
!12 = metadata !{i32 786445, metadata !5, metadata !10, metadata !"key", i32 22, i64 64, i64 64, i64 0, i32 0, metadata !13} ; [ DW_TAG_member ] [key] [line 22, size 64, align 64, offset 0] [from ]
!13 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !14} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!14 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!15 = metadata !{i32 786445, metadata !5, metadata !10, metadata !"val", i32 23, i64 32, i64 32, i64 64, i32 0, metadata !16} ; [ DW_TAG_member ] [val] [line 23, size 32, align 32, offset 64] [from int]
!16 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!17 = metadata !{i32 786445, metadata !5, metadata !10, metadata !"next", i32 24, i64 64, i64 64, i64 128, i32 0, metadata !9} ; [ DW_TAG_member ] [next] [line 24, size 64, align 64, offset 128] [from ]
!18 = metadata !{metadata !19, metadata !20, metadata !21}
!19 = metadata !{i32 786689, metadata !4, metadata !"key", metadata !6, i32 16777268, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [key] [line 52]
!20 = metadata !{i32 786688, metadata !4, metadata !"newkey", metadata !6, i32 53, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [newkey] [line 53]
!21 = metadata !{i32 786688, metadata !4, metadata !"node", metadata !6, i32 54, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [node] [line 54]
!22 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"ht_create", metadata !"ht_create", metadata !"", i32 69, metadata !23, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, %struct.ht_ht* (i32)* @ht_create, null, null, metadata !34, i32 69} ; [ DW_TAG_subprogram ] [line 69] [def] [ht_create]
!23 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !24, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!24 = metadata !{metadata !25, metadata !16}
!25 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !26} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ht_ht]
!26 = metadata !{i32 786451, metadata !5, null, metadata !"ht_ht", i32 27, i64 320, i64 64, i32 0, i32 0, null, metadata !27, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [ht_ht] [line 27, size 320, align 64, offset 0] [def] [from ]
!27 = metadata !{metadata !28, metadata !29, metadata !31, metadata !32, metadata !33}
!28 = metadata !{i32 786445, metadata !5, metadata !26, metadata !"size", i32 28, i64 32, i64 32, i64 0, i32 0, metadata !16} ; [ DW_TAG_member ] [size] [line 28, size 32, align 32, offset 0] [from int]
!29 = metadata !{i32 786445, metadata !5, metadata !26, metadata !"tbl", i32 29, i64 64, i64 64, i64 64, i32 0, metadata !30} ; [ DW_TAG_member ] [tbl] [line 29, size 64, align 64, offset 64] [from ]
!30 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !9} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!31 = metadata !{i32 786445, metadata !5, metadata !26, metadata !"iter_index", i32 30, i64 32, i64 32, i64 128, i32 0, metadata !16} ; [ DW_TAG_member ] [iter_index] [line 30, size 32, align 32, offset 128] [from int]
!32 = metadata !{i32 786445, metadata !5, metadata !26, metadata !"iter_next", i32 31, i64 64, i64 64, i64 192, i32 0, metadata !9} ; [ DW_TAG_member ] [iter_next] [line 31, size 64, align 64, offset 192] [from ]
!33 = metadata !{i32 786445, metadata !5, metadata !26, metadata !"items", i32 32, i64 32, i64 32, i64 256, i32 0, metadata !16} ; [ DW_TAG_member ] [items] [line 32, size 32, align 32, offset 256] [from int]
!34 = metadata !{metadata !35, metadata !36, metadata !37}
!35 = metadata !{i32 786689, metadata !22, metadata !"size", metadata !6, i32 16777285, metadata !16, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 69]
!36 = metadata !{i32 786688, metadata !22, metadata !"i", metadata !6, i32 70, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 70]
!37 = metadata !{i32 786688, metadata !22, metadata !"ht", metadata !6, i32 71, metadata !25, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ht] [line 71]
!38 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"ht_destroy", metadata !"ht_destroy", metadata !"", i32 84, metadata !39, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (%struct.ht_ht*)* @ht_destroy, null, null, metadata !41, i32 84} ; [ DW_TAG_subprogram ] [line 84] [def] [ht_destroy]
!39 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !40, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!40 = metadata !{null, metadata !25}
!41 = metadata !{metadata !42, metadata !43, metadata !44, metadata !45}
!42 = metadata !{i32 786689, metadata !38, metadata !"ht", metadata !6, i32 16777300, metadata !25, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ht] [line 84]
!43 = metadata !{i32 786688, metadata !38, metadata !"cur", metadata !6, i32 85, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cur] [line 85]
!44 = metadata !{i32 786688, metadata !38, metadata !"next", metadata !6, i32 85, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [next] [line 85]
!45 = metadata !{i32 786688, metadata !38, metadata !"i", metadata !6, i32 86, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 86]
!46 = metadata !{i32 786478, metadata !1, metadata !47, metadata !"main", metadata !"main", metadata !"", i32 11, metadata !48, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8**)* @main, null, null, metadata !51, i32 11} ; [ DW_TAG_subprogram ] [line 11] [def] [main]
!47 = metadata !{i32 786473, metadata !1}         ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/hash.c]
!48 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !49, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!49 = metadata !{metadata !16, metadata !16, metadata !50}
!50 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !13} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!51 = metadata !{metadata !52, metadata !53, metadata !54, metadata !56, metadata !57, metadata !58, metadata !62}
!52 = metadata !{i32 786689, metadata !46, metadata !"argc", metadata !47, i32 16777227, metadata !16, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 11]
!53 = metadata !{i32 786689, metadata !46, metadata !"argv", metadata !47, i32 33554443, metadata !50, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 11]
!54 = metadata !{i32 786688, metadata !55, metadata !"i", metadata !47, i32 17, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 17]
!55 = metadata !{i32 786443, metadata !1, metadata !46} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/hash.c]
!56 = metadata !{i32 786688, metadata !55, metadata !"c", metadata !47, i32 17, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [c] [line 17]
!57 = metadata !{i32 786688, metadata !55, metadata !"n", metadata !47, i32 17, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 17]
!58 = metadata !{i32 786688, metadata !55, metadata !"buf", metadata !47, i32 18, metadata !59, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [buf] [line 18]
!59 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 256, i64 8, i32 0, i32 0, metadata !14, metadata !60, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 256, align 8, offset 0] [from char]
!60 = metadata !{metadata !61}
!61 = metadata !{i32 786465, i64 0, i64 32}       ; [ DW_TAG_subrange_type ] [0, 31]
!62 = metadata !{i32 786688, metadata !55, metadata !"ht", metadata !47, i32 20, metadata !25, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ht] [line 20]
!63 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"ht_find", metadata !"ht_find", metadata !"", i32 125, metadata !64, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, %struct.ht_node* (%struct.ht_ht*, i8*)* @ht_find, null, null, metadata !66, i32 125} ; [ DW_TAG_subprogram ] [line 125] [local] [def] [ht_find]
!64 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !65, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!65 = metadata !{metadata !9, metadata !25, metadata !13}
!66 = metadata !{metadata !67, metadata !68, metadata !69, metadata !71, metadata !72, metadata !79}
!67 = metadata !{i32 786689, metadata !63, metadata !"ht", metadata !6, i32 16777341, metadata !25, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ht] [line 125]
!68 = metadata !{i32 786689, metadata !63, metadata !"key", metadata !6, i32 33554557, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [key] [line 125]
!69 = metadata !{i32 786688, metadata !70, metadata !"hash_code", metadata !6, i32 126, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [hash_code] [line 126]
!70 = metadata !{i32 786443, metadata !5, metadata !63} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/./simple_hash.h]
!71 = metadata !{i32 786688, metadata !70, metadata !"node", metadata !6, i32 127, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [node] [line 127]
!72 = metadata !{i32 786688, metadata !73, metadata !"__s1_len", metadata !6, i32 129, metadata !76, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [__s1_len] [line 129]
!73 = metadata !{i32 786443, metadata !5, metadata !74, i32 129, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/./simple_hash.h]
!74 = metadata !{i32 786443, metadata !5, metadata !75, i32 129, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/./simple_hash.h]
!75 = metadata !{i32 786443, metadata !5, metadata !70, i32 128, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/./simple_hash.h]
!76 = metadata !{i32 786454, metadata !77, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !78} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!77 = metadata !{metadata !"/usr/bin/../lib/clang/3.5/include/stddef.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!78 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!79 = metadata !{i32 786688, metadata !73, metadata !"__s2_len", metadata !6, i32 129, metadata !76, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [__s2_len] [line 129]
!80 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"ht_hashcode", metadata !"ht_hashcode", metadata !"", i32 46, metadata !81, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.ht_ht*, i8*)* @ht_hashcode, null, null, metadata !83, i32 46} ; [ DW_TAG_subprogram ] [line 46] [local] [def] [ht_hashcode]
!81 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !82, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!82 = metadata !{metadata !16, metadata !25, metadata !13}
!83 = metadata !{metadata !84, metadata !85, metadata !86}
!84 = metadata !{i32 786689, metadata !80, metadata !"ht", metadata !6, i32 16777262, metadata !25, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ht] [line 46]
!85 = metadata !{i32 786689, metadata !80, metadata !"key", metadata !6, i32 33554478, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [key] [line 46]
!86 = metadata !{i32 786688, metadata !80, metadata !"val", metadata !6, i32 47, metadata !78, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [val] [line 47]
!87 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"ht_find_new", metadata !"ht_find_new", metadata !"", i32 135, metadata !64, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, %struct.ht_node* (%struct.ht_ht*, i8*)* @ht_find_new, null, null, metadata !88, i32 135} ; [ DW_TAG_subprogram ] [line 135] [local] [def] [ht_find_new]
!88 = metadata !{metadata !89, metadata !90, metadata !91, metadata !92, metadata !93, metadata !94, metadata !98}
!89 = metadata !{i32 786689, metadata !87, metadata !"ht", metadata !6, i32 16777351, metadata !25, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ht] [line 135]
!90 = metadata !{i32 786689, metadata !87, metadata !"key", metadata !6, i32 33554567, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [key] [line 135]
!91 = metadata !{i32 786688, metadata !87, metadata !"hash_code", metadata !6, i32 136, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [hash_code] [line 136]
!92 = metadata !{i32 786688, metadata !87, metadata !"prev", metadata !6, i32 137, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [prev] [line 137]
!93 = metadata !{i32 786688, metadata !87, metadata !"node", metadata !6, i32 137, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [node] [line 137]
!94 = metadata !{i32 786688, metadata !95, metadata !"__s1_len", metadata !6, i32 139, metadata !76, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [__s1_len] [line 139]
!95 = metadata !{i32 786443, metadata !5, metadata !96, i32 139, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/./simple_hash.h]
!96 = metadata !{i32 786443, metadata !5, metadata !97, i32 139, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/./simple_hash.h]
!97 = metadata !{i32 786443, metadata !5, metadata !87, i32 138, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/./simple_hash.h]
!98 = metadata !{i32 786688, metadata !95, metadata !"__s2_len", metadata !6, i32 139, metadata !76, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [__s2_len] [line 139]
!99 = metadata !{i32 786478, metadata !100, metadata !101, metadata !"atoi", metadata !"atoi", metadata !"", i32 278, metadata !102, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @atoi, null, null, metadata !106, i32 279} ; [ DW_TAG_subprogram ] [line 278] [def] [scope 279] [atoi]
!100 = metadata !{metadata !"/usr/include/stdlib.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!101 = metadata !{i32 786473, metadata !100}      ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base//usr/include/stdlib.h]
!102 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !103, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!103 = metadata !{metadata !16, metadata !104}
!104 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !105} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!105 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !14} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!106 = metadata !{metadata !107}
!107 = metadata !{i32 786689, metadata !99, metadata !"__nptr", metadata !101, i32 16777494, metadata !104, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [__nptr] [line 278]
!108 = metadata !{metadata !109}
!109 = metadata !{i32 786484, i32 0, null, metadata !"ht_prime_list", metadata !"ht_prime_list", metadata !"", metadata !6, i32 12, metadata !110, i32 1, i32 1, [28 x i64]* @ht_prime_list, null} ; [ DW_TAG_variable ] [ht_prime_list] [line 12] [local] [def]
!110 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 1792, i64 64, i32 0, i32 0, metadata !78, metadata !111, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1792, align 64, offset 0] [from long unsigned int]
!111 = metadata !{metadata !112}
!112 = metadata !{i32 786465, i64 0, i64 28}      ; [ DW_TAG_subrange_type ] [0, 27]
!113 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!114 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!115 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!116 = metadata !{i32 52, i32 0, metadata !4, null}
!117 = metadata !{i32 55, i32 0, metadata !118, null}
!118 = metadata !{i32 786443, metadata !5, metadata !4, i32 55, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/./simple_hash.h]
!119 = metadata !{i32 56, i32 0, metadata !120, null}
!120 = metadata !{i32 786443, metadata !5, metadata !118, i32 55, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/./simple_hash.h]
!121 = metadata !{i32 57, i32 0, metadata !120, null}
!122 = metadata !{i32 59, i32 0, metadata !123, null}
!123 = metadata !{i32 786443, metadata !5, metadata !4, i32 59, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/./simple_hash.h]
!124 = metadata !{i32 60, i32 0, metadata !125, null}
!125 = metadata !{i32 786443, metadata !5, metadata !123, i32 59, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/./simple_hash.h]
!126 = metadata !{i32 61, i32 0, metadata !125, null}
!127 = metadata !{i32 63, i32 0, metadata !4, null}
!128 = metadata !{metadata !129, metadata !130, i64 0}
!129 = metadata !{metadata !"ht_node", metadata !130, i64 0, metadata !133, i64 8, metadata !130, i64 16}
!130 = metadata !{metadata !"any pointer", metadata !131, i64 0}
!131 = metadata !{metadata !"omnipotent char", metadata !132, i64 0}
!132 = metadata !{metadata !"Simple C/C++ TBAA"}
!133 = metadata !{metadata !"int", metadata !131, i64 0}
!134 = metadata !{i32 64, i32 0, metadata !4, null}
!135 = metadata !{metadata !129, metadata !133, i64 8}
!136 = metadata !{i32 65, i32 0, metadata !4, null}
!137 = metadata !{metadata !129, metadata !130, i64 16}
!138 = metadata !{i32 66, i32 0, metadata !4, null}
!139 = metadata !{i32 69, i32 0, metadata !22, null}
!140 = metadata !{i32 0}
!141 = metadata !{i32 70, i32 0, metadata !22, null}
!142 = metadata !{i32 71, i32 0, metadata !22, null}
!143 = metadata !{i32 72, i32 0, metadata !22, null}
!144 = metadata !{metadata !145, metadata !145, i64 0}
!145 = metadata !{metadata !"long", metadata !131, i64 0}
!146 = metadata !{i32 73, i32 0, metadata !22, null}
!147 = metadata !{metadata !148, metadata !133, i64 0}
!148 = metadata !{metadata !"ht_ht", metadata !133, i64 0, metadata !130, i64 8, metadata !133, i64 16, metadata !130, i64 24, metadata !133, i64 32}
!149 = metadata !{i32 74, i32 0, metadata !22, null}
!150 = metadata !{metadata !148, metadata !130, i64 8}
!151 = metadata !{i32 75, i32 0, metadata !22, null}
!152 = metadata !{metadata !148, metadata !133, i64 16}
!153 = metadata !{i32 76, i32 0, metadata !22, null}
!154 = metadata !{metadata !148, metadata !130, i64 24}
!155 = metadata !{i32 77, i32 0, metadata !22, null}
!156 = metadata !{metadata !148, metadata !133, i64 32}
!157 = metadata !{i32 81, i32 0, metadata !22, null}
!158 = metadata !{i32 84, i32 0, metadata !38, null}
!159 = metadata !{i32 95, i32 0, metadata !160, null}
!160 = metadata !{i32 786443, metadata !5, metadata !38, i32 95, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/./simple_hash.h]
!161 = metadata !{i32 96, i32 0, metadata !162, null}
!162 = metadata !{i32 786443, metadata !5, metadata !160, i32 95, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/./simple_hash.h]
!163 = metadata !{metadata !130, metadata !130, i64 0}
!164 = metadata !{i32 103, i32 0, metadata !162, null}
!165 = metadata !{i32 104, i32 0, metadata !166, null}
!166 = metadata !{i32 786443, metadata !5, metadata !162, i32 103, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/./simple_hash.h]
!167 = metadata !{i32 105, i32 0, metadata !166, null}
!168 = metadata !{i32 106, i32 0, metadata !166, null}
!169 = metadata !{i32 107, i32 0, metadata !166, null}
!170 = metadata !{i32 117, i32 0, metadata !38, null}
!171 = metadata !{i32 118, i32 0, metadata !38, null}
!172 = metadata !{i32 123, i32 0, metadata !38, null}
!173 = metadata !{i32 11, i32 0, metadata !46, null}
!174 = metadata !{i32 17, i32 0, metadata !55, null}
!175 = metadata !{i32 17, i32 36, metadata !55, null}
!176 = metadata !{i32 18, i32 0, metadata !55, null}
!177 = metadata !{i32 20, i32 0, metadata !55, null}
!178 = metadata !{i32 1}
!179 = metadata !{i32 22, i32 0, metadata !180, null}
!180 = metadata !{i32 786443, metadata !1, metadata !55, i32 22, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/hash.c]
!181 = metadata !{i32 23, i32 0, metadata !182, null}
!182 = metadata !{i32 786443, metadata !1, metadata !180, i32 22, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/hash.c]
!183 = metadata !{i32 27, i32 0, metadata !184, null}
!184 = metadata !{i32 786443, metadata !1, metadata !55, i32 27, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/hash.c]
!185 = metadata !{i32 28, i32 0, metadata !186, null}
!186 = metadata !{i32 786443, metadata !1, metadata !184, i32 27, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/hash.c]
!187 = metadata !{i32 24, i32 0, metadata !182, null}
!188 = metadata !{i32 29, i32 0, metadata !189, null}
!189 = metadata !{i32 786443, metadata !1, metadata !186, i32 29, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/hash.c]
!190 = metadata !{i32 32, i32 0, metadata !55, null}
!191 = metadata !{i32 34, i32 0, metadata !55, null}
!192 = metadata !{i32 35, i32 0, metadata !55, null}
!193 = metadata !{i32 278, i32 0, metadata !99, null}
!194 = metadata !{i32 280, i32 0, metadata !195, null}
!195 = metadata !{i32 786443, metadata !100, metadata !99} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base//usr/include/stdlib.h]
!196 = metadata !{i32 135, i32 0, metadata !87, null}
!197 = metadata !{i32 136, i32 0, metadata !87, null}
!198 = metadata !{%struct.ht_node* null}
!199 = metadata !{i32 137, i32 0, metadata !87, null}
!200 = metadata !{i32 138, i32 0, metadata !87, null}
!201 = metadata !{i32 141, i32 0, metadata !97, null}
!202 = metadata !{i32 139, i32 0, metadata !95, null}
!203 = metadata !{i32 140, i32 0, metadata !97, null}
!204 = metadata !{i32 146, i32 0, metadata !87, null}
!205 = metadata !{i32 147, i32 0, metadata !206, null}
!206 = metadata !{i32 786443, metadata !5, metadata !87, i32 147, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/./simple_hash.h]
!207 = metadata !{i32 148, i32 0, metadata !208, null}
!208 = metadata !{i32 786443, metadata !5, metadata !206, i32 147, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/./simple_hash.h]
!209 = metadata !{i32 150, i32 0, metadata !210, null}
!210 = metadata !{i32 786443, metadata !5, metadata !206, i32 149, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/./simple_hash.h]
!211 = metadata !{i32 152, i32 0, metadata !87, null}
!212 = metadata !{i32 125, i32 0, metadata !63, null}
!213 = metadata !{i32 126, i32 0, metadata !70, null}
!214 = metadata !{i32 127, i32 0, metadata !70, null}
!215 = metadata !{i32 128, i32 0, metadata !70, null}
!216 = metadata !{i32 130, i32 0, metadata !75, null}
!217 = metadata !{i32 129, i32 0, metadata !73, null}
!218 = metadata !{i32 133, i32 0, metadata !70, null}
!219 = metadata !{i32 46, i32 0, metadata !80, null}
!220 = metadata !{i64 0}
!221 = metadata !{i32 47, i32 0, metadata !80, null}
!222 = metadata !{i32 48, i32 0, metadata !223, null}
!223 = metadata !{i32 786443, metadata !5, metadata !80, i32 48, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/./simple_hash.h]
!224 = metadata !{metadata !131, metadata !131, i64 0}
!225 = metadata !{i32 49, i32 0, metadata !80, null}
