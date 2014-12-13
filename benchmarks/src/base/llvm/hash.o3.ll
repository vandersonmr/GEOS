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
  %1 = tail call noalias i8* @malloc(i64 24) #5, !dbg !117
  %2 = bitcast i8* %1 to %struct.ht_node*, !dbg !117
  tail call void @llvm.dbg.value(metadata !{%struct.ht_node* %2}, i64 0, metadata !21), !dbg !117
  %3 = icmp eq i8* %1, null, !dbg !117
  br i1 %3, label %4, label %5, !dbg !117

; <label>:4                                       ; preds = %0
  tail call void @perror(i8* getelementptr inbounds ([15 x i8]* @.str, i64 0, i64 0)) #6, !dbg !119
  tail call void @exit(i32 1) #7, !dbg !121
  unreachable, !dbg !121

; <label>:5                                       ; preds = %0
  %6 = tail call noalias i8* @__strdup(i8* %key) #5, !dbg !122
  tail call void @llvm.dbg.value(metadata !{i8* %6}, i64 0, metadata !20), !dbg !122
  %7 = icmp eq i8* %6, null, !dbg !122
  br i1 %7, label %8, label %9, !dbg !122

; <label>:8                                       ; preds = %5
  tail call void @perror(i8* getelementptr inbounds ([14 x i8]* @.str1, i64 0, i64 0)) #6, !dbg !124
  tail call void @exit(i32 1) #7, !dbg !126
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
  %1 = tail call noalias i8* @malloc(i64 40) #5, !dbg !142
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
  %12 = tail call noalias i8* @calloc(i64 %11, i64 8) #5, !dbg !149
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
  %4 = getelementptr inbounds %struct.ht_ht* %ht, i64 0, i32 1, !dbg !161
  br i1 %3, label %.lr.ph4, label %._crit_edge5, !dbg !159

.lr.ph4:                                          ; preds = %0, %16
  %5 = phi i32 [ %17, %16 ], [ %2, %0 ]
  %indvars.iv = phi i64 [ %indvars.iv.next, %16 ], [ 0, %0 ]
  %6 = load %struct.ht_node*** %4, align 8, !dbg !161, !tbaa !150
  %7 = getelementptr inbounds %struct.ht_node** %6, i64 %indvars.iv, !dbg !161
  %8 = load %struct.ht_node** %7, align 8, !dbg !161, !tbaa !163
  tail call void @llvm.dbg.value(metadata !{%struct.ht_node* %8}, i64 0, metadata !44), !dbg !161
  %9 = icmp eq %struct.ht_node* %8, null, !dbg !164
  br i1 %9, label %16, label %.lr.ph, !dbg !164

.lr.ph:                                           ; preds = %.lr.ph4, %.lr.ph
  %next.01 = phi %struct.ht_node* [ %11, %.lr.ph ], [ %8, %.lr.ph4 ]
  tail call void @llvm.dbg.value(metadata !{%struct.ht_node* %next.01}, i64 0, metadata !43), !dbg !165
  %10 = getelementptr inbounds %struct.ht_node* %next.01, i64 0, i32 2, !dbg !167
  %11 = load %struct.ht_node** %10, align 8, !dbg !167, !tbaa !137
  tail call void @llvm.dbg.value(metadata !{%struct.ht_node* %11}, i64 0, metadata !44), !dbg !167
  %12 = getelementptr inbounds %struct.ht_node* %next.01, i64 0, i32 0, !dbg !168
  %13 = load i8** %12, align 8, !dbg !168, !tbaa !128
  tail call void @free(i8* %13) #5, !dbg !168
  %14 = bitcast %struct.ht_node* %next.01 to i8*, !dbg !169
  tail call void @free(i8* %14) #5, !dbg !169
  %15 = icmp eq %struct.ht_node* %11, null, !dbg !164
  br i1 %15, label %._crit_edge, label %.lr.ph, !dbg !164

._crit_edge:                                      ; preds = %.lr.ph
  %.pre = load i32* %1, align 4, !dbg !159, !tbaa !147
  br label %16, !dbg !164

; <label>:16                                      ; preds = %._crit_edge, %.lr.ph4
  %17 = phi i32 [ %.pre, %._crit_edge ], [ %5, %.lr.ph4 ], !dbg !159
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !159
  %18 = trunc i64 %indvars.iv.next to i32, !dbg !159
  %19 = icmp slt i32 %18, %17, !dbg !159
  br i1 %19, label %.lr.ph4, label %._crit_edge5, !dbg !159

._crit_edge5:                                     ; preds = %16, %0
  %20 = load %struct.ht_node*** %4, align 8, !dbg !170, !tbaa !150
  %21 = bitcast %struct.ht_node** %20 to i8*, !dbg !170
  tail call void @free(i8* %21) #5, !dbg !170
  %22 = bitcast %struct.ht_ht* %ht to i8*, !dbg !171
  tail call void @free(i8* %22) #5, !dbg !171
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
  br i1 %1, label %2, label %7, !dbg !174

; <label>:2                                       ; preds = %0
  %3 = getelementptr inbounds i8** %argv, i64 1, !dbg !175
  %4 = load i8** %3, align 8, !dbg !175, !tbaa !163
  tail call void @llvm.dbg.value(metadata !{i8* %4}, i64 0, metadata !176) #5, !dbg !177
  %5 = tail call i64 @strtol(i8* nocapture %4, i8** null, i32 10) #5, !dbg !178
  %6 = trunc i64 %5 to i32, !dbg !178
  br label %7, !dbg !175

; <label>:7                                       ; preds = %0, %2
  %8 = phi i32 [ %6, %2 ], [ 3500000, %0 ], !dbg !175
  tail call void @llvm.dbg.value(metadata !{i32 %8}, i64 0, metadata !57), !dbg !175
  tail call void @llvm.dbg.declare(metadata !{[32 x i8]* %buf}, metadata !58), !dbg !180
  tail call void @llvm.dbg.value(metadata !{i32 %8}, i64 0, metadata !181) #5, !dbg !183
  tail call void @llvm.dbg.value(metadata !140, i64 0, metadata !184) #5, !dbg !185
  %9 = sext i32 %8 to i64, !dbg !186
  br label %10, !dbg !186

; <label>:10                                      ; preds = %10, %7
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %10 ], [ 0, %7 ]
  %11 = getelementptr inbounds [28 x i64]* @ht_prime_list, i64 0, i64 %indvars.iv.i, !dbg !186
  %12 = load i64* %11, align 8, !dbg !186, !tbaa !144
  %13 = icmp ult i64 %12, %9, !dbg !186
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !186
  br i1 %13, label %10, label %ht_create.exit, !dbg !186

ht_create.exit:                                   ; preds = %10
  %14 = trunc i64 %12 to i32, !dbg !187
  %sext.i = shl i64 %12, 32, !dbg !188
  %15 = ashr exact i64 %sext.i, 32, !dbg !188
  %16 = tail call noalias i8* @calloc(i64 %15, i64 8) #5, !dbg !188
  %17 = bitcast i8* %16 to %struct.ht_node**, !dbg !188
  tail call void @llvm.dbg.value(metadata !189, i64 0, metadata !54), !dbg !190
  %18 = icmp slt i32 %8, 1, !dbg !190
  br i1 %18, label %._crit_edge, label %.lr.ph22, !dbg !190

.lr.ph22:                                         ; preds = %ht_create.exit
  %19 = getelementptr inbounds [32 x i8]* %buf, i64 0, i64 0, !dbg !192
  br label %22, !dbg !190

.preheader:                                       ; preds = %ht_find_new.exit
  %20 = icmp sgt i32 %8, 0, !dbg !194
  br i1 %20, label %.lr.ph, label %._crit_edge, !dbg !194

.lr.ph:                                           ; preds = %.preheader
  %21 = getelementptr inbounds [32 x i8]* %buf, i64 0, i64 0, !dbg !196
  br label %65, !dbg !194

; <label>:22                                      ; preds = %ht_find_new.exit, %.lr.ph22
  %i.021 = phi i32 [ 1, %.lr.ph22 ], [ %63, %ht_find_new.exit ]
  %23 = call i32 (i8*, i8*, ...)* @sprintf(i8* %19, i8* getelementptr inbounds ([3 x i8]* @.str2, i64 0, i64 0), i32 %i.021) #5, !dbg !192
  tail call void @llvm.dbg.value(metadata !{i8* %19}, i64 0, metadata !198) #5, !dbg !200
  tail call void @llvm.dbg.value(metadata !{i8* %19}, i64 0, metadata !201) #5, !dbg !203
  tail call void @llvm.dbg.value(metadata !204, i64 0, metadata !205) #5, !dbg !206
  %24 = load i8* %19, align 16, !dbg !207, !tbaa !209
  %25 = icmp eq i8 %24, 0, !dbg !207
  br i1 %25, label %ht_hashcode.exit.i, label %.lr.ph.i.i, !dbg !207

.lr.ph.i.i:                                       ; preds = %22, %.lr.ph.i.i
  %26 = phi i8 [ %31, %.lr.ph.i.i ], [ %24, %22 ]
  %val.02.i.i = phi i64 [ %29, %.lr.ph.i.i ], [ 0, %22 ]
  %.01.i.i = phi i8* [ %30, %.lr.ph.i.i ], [ %19, %22 ]
  %27 = mul i64 %val.02.i.i, 5, !dbg !207
  %28 = sext i8 %26 to i64, !dbg !207
  %29 = add i64 %27, %28, !dbg !207
  tail call void @llvm.dbg.value(metadata !{i64 %29}, i64 0, metadata !205) #5, !dbg !207
  %30 = getelementptr inbounds i8* %.01.i.i, i64 1, !dbg !207
  tail call void @llvm.dbg.value(metadata !{i8* %30}, i64 0, metadata !201) #5, !dbg !207
  %31 = load i8* %30, align 1, !dbg !207, !tbaa !209
  %32 = icmp eq i8 %31, 0, !dbg !207
  br i1 %32, label %ht_hashcode.exit.i, label %.lr.ph.i.i, !dbg !207

ht_hashcode.exit.i:                               ; preds = %.lr.ph.i.i, %22
  %val.0.lcssa.i.i = phi i64 [ 0, %22 ], [ %29, %.lr.ph.i.i ]
  %sext = shl i64 %12, 32, !dbg !210
  %33 = ashr exact i64 %sext, 32, !dbg !210
  %34 = urem i64 %val.0.lcssa.i.i, %33, !dbg !210
  tail call void @llvm.dbg.value(metadata !211, i64 0, metadata !212) #5, !dbg !213
  %sext.i1 = shl i64 %34, 32, !dbg !213
  %35 = ashr exact i64 %sext.i1, 32, !dbg !213
  %36 = getelementptr inbounds %struct.ht_node** %17, i64 %35, !dbg !213
  %node.03.i = load %struct.ht_node** %36, align 8, !dbg !213
  %37 = icmp eq %struct.ht_node* %node.03.i, null, !dbg !214
  br i1 %37, label %._crit_edge.i, label %.lr.ph.i, !dbg !214

; <label>:38                                      ; preds = %.lr.ph.i
  %39 = getelementptr inbounds %struct.ht_node* %node.04.i, i64 0, i32 2, !dbg !215
  %node.0.i = load %struct.ht_node** %39, align 8, !dbg !213
  %40 = icmp eq %struct.ht_node* %node.0.i, null, !dbg !214
  br i1 %40, label %._crit_edge.i, label %.lr.ph.i, !dbg !214

.lr.ph.i:                                         ; preds = %ht_hashcode.exit.i, %38
  %node.04.i = phi %struct.ht_node* [ %node.0.i, %38 ], [ %node.03.i, %ht_hashcode.exit.i ]
  %41 = getelementptr inbounds %struct.ht_node* %node.04.i, i64 0, i32 0, !dbg !216
  %42 = load i8** %41, align 8, !dbg !216, !tbaa !128
  %43 = call i32 @strcmp(i8* %19, i8* %42) #5, !dbg !216
  %44 = icmp eq i32 %43, 0, !dbg !216
  tail call void @llvm.dbg.value(metadata !{%struct.ht_node* %node.04.i}, i64 0, metadata !212) #5, !dbg !217
  br i1 %44, label %ht_find_new.exit, label %38, !dbg !216

._crit_edge.i:                                    ; preds = %38, %ht_hashcode.exit.i
  %prev.0.lcssa.i = phi %struct.ht_node* [ null, %ht_hashcode.exit.i ], [ %node.04.i, %38 ]
  %45 = icmp eq %struct.ht_node* %prev.0.lcssa.i, null, !dbg !218
  tail call void @llvm.dbg.value(metadata !{i8* %19}, i64 0, metadata !220) #5, !dbg !223
  %46 = tail call noalias i8* @malloc(i64 24) #5, !dbg !224
  %47 = bitcast i8* %46 to %struct.ht_node*, !dbg !224
  tail call void @llvm.dbg.value(metadata !{%struct.ht_node* %47}, i64 0, metadata !225) #5, !dbg !224
  %48 = icmp eq i8* %46, null, !dbg !224
  br i1 %48, label %49, label %50, !dbg !224

; <label>:49                                      ; preds = %._crit_edge.i
  tail call void @perror(i8* getelementptr inbounds ([15 x i8]* @.str, i64 0, i64 0)) #6, !dbg !226
  tail call void @exit(i32 1) #7, !dbg !227
  unreachable, !dbg !227

; <label>:50                                      ; preds = %._crit_edge.i
  %51 = call noalias i8* @__strdup(i8* %19) #5, !dbg !228
  tail call void @llvm.dbg.value(metadata !{i8* %51}, i64 0, metadata !229) #5, !dbg !228
  %52 = icmp eq i8* %51, null, !dbg !228
  br i1 %52, label %53, label %ht_node_create.exit.i, !dbg !228

; <label>:53                                      ; preds = %50
  tail call void @perror(i8* getelementptr inbounds ([14 x i8]* @.str1, i64 0, i64 0)) #6, !dbg !230
  tail call void @exit(i32 1) #7, !dbg !231
  unreachable, !dbg !231

ht_node_create.exit.i:                            ; preds = %50
  %54 = bitcast i8* %46 to i8**, !dbg !232
  store i8* %51, i8** %54, align 8, !dbg !232, !tbaa !128
  %55 = getelementptr inbounds i8* %46, i64 8, !dbg !233
  %56 = bitcast i8* %55 to i32*, !dbg !233
  store i32 0, i32* %56, align 4, !dbg !233, !tbaa !135
  %57 = getelementptr inbounds i8* %46, i64 16, !dbg !234
  %58 = bitcast i8* %57 to %struct.ht_node**, !dbg !234
  store %struct.ht_node* null, %struct.ht_node** %58, align 8, !dbg !234, !tbaa !137
  br i1 %45, label %61, label %59, !dbg !218

; <label>:59                                      ; preds = %ht_node_create.exit.i
  %60 = getelementptr inbounds %struct.ht_node* %prev.0.lcssa.i, i64 0, i32 2, !dbg !221
  store %struct.ht_node* %47, %struct.ht_node** %60, align 8, !dbg !221, !tbaa !137
  br label %ht_find_new.exit, !dbg !221

; <label>:61                                      ; preds = %ht_node_create.exit.i
  store %struct.ht_node* %47, %struct.ht_node** %36, align 8, !dbg !235, !tbaa !163
  br label %ht_find_new.exit, !dbg !235

ht_find_new.exit:                                 ; preds = %.lr.ph.i, %59, %61
  %.0.i = phi %struct.ht_node* [ %47, %59 ], [ %47, %61 ], [ %node.04.i, %.lr.ph.i ]
  %62 = getelementptr inbounds %struct.ht_node* %.0.i, i64 0, i32 1, !dbg !199
  store i32 %i.021, i32* %62, align 4, !dbg !199, !tbaa !135
  %63 = add nsw i32 %i.021, 1, !dbg !190
  tail call void @llvm.dbg.value(metadata !{i32 %63}, i64 0, metadata !54), !dbg !190
  %64 = icmp slt i32 %i.021, %8, !dbg !190
  br i1 %64, label %22, label %.preheader, !dbg !190

; <label>:65                                      ; preds = %.lr.ph, %ht_find.exit
  %i.120 = phi i32 [ %8, %.lr.ph ], [ %89, %ht_find.exit ]
  %c.019 = phi i32 [ 0, %.lr.ph ], [ %c.0., %ht_find.exit ]
  %66 = call i32 (i8*, i8*, ...)* @sprintf(i8* %21, i8* getelementptr inbounds ([3 x i8]* @.str3, i64 0, i64 0), i32 %i.120) #5, !dbg !196
  tail call void @llvm.dbg.value(metadata !{i8* %21}, i64 0, metadata !237) #5, !dbg !240
  tail call void @llvm.dbg.value(metadata !{i8* %21}, i64 0, metadata !241) #5, !dbg !243
  tail call void @llvm.dbg.value(metadata !204, i64 0, metadata !244) #5, !dbg !245
  %67 = load i8* %21, align 16, !dbg !246, !tbaa !209
  %68 = icmp eq i8 %67, 0, !dbg !246
  br i1 %68, label %ht_hashcode.exit.i7, label %.lr.ph.i.i4, !dbg !246

.lr.ph.i.i4:                                      ; preds = %65, %.lr.ph.i.i4
  %69 = phi i8 [ %74, %.lr.ph.i.i4 ], [ %67, %65 ]
  %val.02.i.i2 = phi i64 [ %72, %.lr.ph.i.i4 ], [ 0, %65 ]
  %.01.i.i3 = phi i8* [ %73, %.lr.ph.i.i4 ], [ %21, %65 ]
  %70 = mul i64 %val.02.i.i2, 5, !dbg !246
  %71 = sext i8 %69 to i64, !dbg !246
  %72 = add i64 %70, %71, !dbg !246
  tail call void @llvm.dbg.value(metadata !{i64 %72}, i64 0, metadata !244) #5, !dbg !246
  %73 = getelementptr inbounds i8* %.01.i.i3, i64 1, !dbg !246
  tail call void @llvm.dbg.value(metadata !{i8* %73}, i64 0, metadata !241) #5, !dbg !246
  %74 = load i8* %73, align 1, !dbg !246, !tbaa !209
  %75 = icmp eq i8 %74, 0, !dbg !246
  br i1 %75, label %ht_hashcode.exit.i7, label %.lr.ph.i.i4, !dbg !246

ht_hashcode.exit.i7:                              ; preds = %.lr.ph.i.i4, %65
  %val.0.lcssa.i.i5 = phi i64 [ 0, %65 ], [ %72, %.lr.ph.i.i4 ]
  %sext26 = shl i64 %12, 32, !dbg !247
  %76 = ashr exact i64 %sext26, 32, !dbg !247
  %77 = urem i64 %val.0.lcssa.i.i5, %76, !dbg !247
  %sext.i6 = shl i64 %77, 32, !dbg !248
  %78 = ashr exact i64 %sext.i6, 32, !dbg !248
  %79 = getelementptr inbounds %struct.ht_node** %17, i64 %78, !dbg !248
  %node.01.i = load %struct.ht_node** %79, align 8, !dbg !248
  %80 = icmp eq %struct.ht_node* %node.01.i, null, !dbg !249
  br i1 %80, label %ht_find.exit, label %.lr.ph.i9, !dbg !249

; <label>:81                                      ; preds = %.lr.ph.i9
  %82 = getelementptr inbounds %struct.ht_node* %node.02.i, i64 0, i32 2, !dbg !250
  %node.0.i8 = load %struct.ht_node** %82, align 8, !dbg !248
  %83 = icmp eq %struct.ht_node* %node.0.i8, null, !dbg !249
  br i1 %83, label %ht_find.exit, label %.lr.ph.i9, !dbg !249

.lr.ph.i9:                                        ; preds = %ht_hashcode.exit.i7, %81
  %node.02.i = phi %struct.ht_node* [ %node.0.i8, %81 ], [ %node.01.i, %ht_hashcode.exit.i7 ]
  %84 = getelementptr inbounds %struct.ht_node* %node.02.i, i64 0, i32 0, !dbg !251
  %85 = load i8** %84, align 8, !dbg !251, !tbaa !128
  %86 = call i32 @strcmp(i8* %21, i8* %85) #5, !dbg !251
  %87 = icmp eq i32 %86, 0, !dbg !251
  br i1 %87, label %ht_find.exit, label %81, !dbg !251

ht_find.exit:                                     ; preds = %81, %.lr.ph.i9, %ht_hashcode.exit.i7
  %.0.i10 = phi %struct.ht_node* [ null, %ht_hashcode.exit.i7 ], [ null, %81 ], [ %node.02.i, %.lr.ph.i9 ]
  %not. = icmp ne %struct.ht_node* %.0.i10, null, !dbg !238
  %88 = zext i1 %not. to i32, !dbg !238
  %c.0. = add nsw i32 %88, %c.019, !dbg !238
  %89 = add nsw i32 %i.120, -1, !dbg !194
  tail call void @llvm.dbg.value(metadata !{i32 %89}, i64 0, metadata !54), !dbg !194
  %90 = icmp sgt i32 %89, 0, !dbg !194
  br i1 %90, label %65, label %._crit_edge, !dbg !194

._crit_edge:                                      ; preds = %ht_find.exit, %ht_create.exit, %.preheader
  %c.0.lcssa = phi i32 [ 0, %.preheader ], [ 0, %ht_create.exit ], [ %c.0., %ht_find.exit ]
  tail call void @llvm.dbg.value(metadata !140, i64 0, metadata !252) #5, !dbg !254
  %91 = icmp sgt i32 %14, 0, !dbg !254
  br i1 %91, label %.lr.ph4.i, label %ht_destroy.exit, !dbg !254

.lr.ph4.i:                                        ; preds = %._crit_edge, %._crit_edge.i14
  %indvars.iv.i12 = phi i64 [ %indvars.iv.next.i15, %._crit_edge.i14 ], [ 0, %._crit_edge ]
  %92 = getelementptr inbounds %struct.ht_node** %17, i64 %indvars.iv.i12, !dbg !255
  %93 = load %struct.ht_node** %92, align 8, !dbg !255, !tbaa !163
  tail call void @llvm.dbg.value(metadata !{%struct.ht_node* %93}, i64 0, metadata !256) #5, !dbg !255
  %94 = icmp eq %struct.ht_node* %93, null, !dbg !257
  br i1 %94, label %._crit_edge.i14, label %.lr.ph.i13, !dbg !257

.lr.ph.i13:                                       ; preds = %.lr.ph4.i, %.lr.ph.i13
  %next.01.i = phi %struct.ht_node* [ %96, %.lr.ph.i13 ], [ %93, %.lr.ph4.i ]
  tail call void @llvm.dbg.value(metadata !{%struct.ht_node* %next.01.i}, i64 0, metadata !258) #5, !dbg !259
  %95 = getelementptr inbounds %struct.ht_node* %next.01.i, i64 0, i32 2, !dbg !260
  %96 = load %struct.ht_node** %95, align 8, !dbg !260, !tbaa !137
  tail call void @llvm.dbg.value(metadata !{%struct.ht_node* %96}, i64 0, metadata !256) #5, !dbg !260
  %97 = getelementptr inbounds %struct.ht_node* %next.01.i, i64 0, i32 0, !dbg !261
  %98 = load i8** %97, align 8, !dbg !261, !tbaa !128
  tail call void @free(i8* %98) #5, !dbg !261
  %99 = bitcast %struct.ht_node* %next.01.i to i8*, !dbg !262
  tail call void @free(i8* %99) #5, !dbg !262
  %100 = icmp eq %struct.ht_node* %96, null, !dbg !257
  br i1 %100, label %._crit_edge.i14, label %.lr.ph.i13, !dbg !257

._crit_edge.i14:                                  ; preds = %.lr.ph.i13, %.lr.ph4.i
  %indvars.iv.next.i15 = add nuw nsw i64 %indvars.iv.i12, 1, !dbg !254
  %101 = trunc i64 %indvars.iv.next.i15 to i32, !dbg !254
  %102 = icmp slt i32 %101, %14, !dbg !254
  br i1 %102, label %.lr.ph4.i, label %ht_destroy.exit, !dbg !254

ht_destroy.exit:                                  ; preds = %._crit_edge.i14, %._crit_edge
  tail call void @free(i8* %16) #5, !dbg !263
  %103 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str4, i64 0, i64 0), i32 %c.0.lcssa) #5, !dbg !264
  ret i32 0, !dbg !265
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
declare void @llvm.dbg.value(metadata, i64, metadata) #1

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
!63 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"ht_find", metadata !"ht_find", metadata !"", i32 125, metadata !64, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !66, i32 125} ; [ DW_TAG_subprogram ] [line 125] [local] [def] [ht_find]
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
!80 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"ht_hashcode", metadata !"ht_hashcode", metadata !"", i32 46, metadata !81, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !83, i32 46} ; [ DW_TAG_subprogram ] [line 46] [local] [def] [ht_hashcode]
!81 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !82, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!82 = metadata !{metadata !16, metadata !25, metadata !13}
!83 = metadata !{metadata !84, metadata !85, metadata !86}
!84 = metadata !{i32 786689, metadata !80, metadata !"ht", metadata !6, i32 16777262, metadata !25, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ht] [line 46]
!85 = metadata !{i32 786689, metadata !80, metadata !"key", metadata !6, i32 33554478, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [key] [line 46]
!86 = metadata !{i32 786688, metadata !80, metadata !"val", metadata !6, i32 47, metadata !78, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [val] [line 47]
!87 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"ht_find_new", metadata !"ht_find_new", metadata !"", i32 135, metadata !64, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !88, i32 135} ; [ DW_TAG_subprogram ] [line 135] [local] [def] [ht_find_new]
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
!99 = metadata !{i32 786478, metadata !100, metadata !101, metadata !"atoi", metadata !"atoi", metadata !"", i32 278, metadata !102, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !106, i32 279} ; [ DW_TAG_subprogram ] [line 278] [def] [scope 279] [atoi]
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
!176 = metadata !{i32 786689, metadata !99, metadata !"__nptr", metadata !101, i32 16777494, metadata !104, i32 0, metadata !175} ; [ DW_TAG_arg_variable ] [__nptr] [line 278]
!177 = metadata !{i32 278, i32 0, metadata !99, metadata !175}
!178 = metadata !{i32 280, i32 0, metadata !179, metadata !175}
!179 = metadata !{i32 786443, metadata !100, metadata !99} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base//usr/include/stdlib.h]
!180 = metadata !{i32 18, i32 0, metadata !55, null}
!181 = metadata !{i32 786689, metadata !22, metadata !"size", metadata !6, i32 16777285, metadata !16, i32 0, metadata !182} ; [ DW_TAG_arg_variable ] [size] [line 69]
!182 = metadata !{i32 20, i32 0, metadata !55, null}
!183 = metadata !{i32 69, i32 0, metadata !22, metadata !182}
!184 = metadata !{i32 786688, metadata !22, metadata !"i", metadata !6, i32 70, metadata !16, i32 0, metadata !182} ; [ DW_TAG_auto_variable ] [i] [line 70]
!185 = metadata !{i32 70, i32 0, metadata !22, metadata !182}
!186 = metadata !{i32 72, i32 0, metadata !22, metadata !182}
!187 = metadata !{i32 73, i32 0, metadata !22, metadata !182}
!188 = metadata !{i32 74, i32 0, metadata !22, metadata !182}
!189 = metadata !{i32 1}
!190 = metadata !{i32 22, i32 0, metadata !191, null}
!191 = metadata !{i32 786443, metadata !1, metadata !55, i32 22, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/hash.c]
!192 = metadata !{i32 23, i32 0, metadata !193, null}
!193 = metadata !{i32 786443, metadata !1, metadata !191, i32 22, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/hash.c]
!194 = metadata !{i32 27, i32 0, metadata !195, null}
!195 = metadata !{i32 786443, metadata !1, metadata !55, i32 27, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/hash.c]
!196 = metadata !{i32 28, i32 0, metadata !197, null}
!197 = metadata !{i32 786443, metadata !1, metadata !195, i32 27, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/hash.c]
!198 = metadata !{i32 786689, metadata !87, metadata !"key", metadata !6, i32 33554567, metadata !13, i32 0, metadata !199} ; [ DW_TAG_arg_variable ] [key] [line 135]
!199 = metadata !{i32 24, i32 0, metadata !193, null}
!200 = metadata !{i32 135, i32 0, metadata !87, metadata !199}
!201 = metadata !{i32 786689, metadata !80, metadata !"key", metadata !6, i32 33554478, metadata !13, i32 0, metadata !202} ; [ DW_TAG_arg_variable ] [key] [line 46]
!202 = metadata !{i32 136, i32 0, metadata !87, metadata !199}
!203 = metadata !{i32 46, i32 0, metadata !80, metadata !202}
!204 = metadata !{i64 0}
!205 = metadata !{i32 786688, metadata !80, metadata !"val", metadata !6, i32 47, metadata !78, i32 0, metadata !202} ; [ DW_TAG_auto_variable ] [val] [line 47]
!206 = metadata !{i32 47, i32 0, metadata !80, metadata !202}
!207 = metadata !{i32 48, i32 0, metadata !208, metadata !202}
!208 = metadata !{i32 786443, metadata !5, metadata !80, i32 48, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/./simple_hash.h]
!209 = metadata !{metadata !131, metadata !131, i64 0}
!210 = metadata !{i32 49, i32 0, metadata !80, metadata !202}
!211 = metadata !{%struct.ht_node* null}
!212 = metadata !{i32 786688, metadata !87, metadata !"prev", metadata !6, i32 137, metadata !9, i32 0, metadata !199} ; [ DW_TAG_auto_variable ] [prev] [line 137]
!213 = metadata !{i32 137, i32 0, metadata !87, metadata !199}
!214 = metadata !{i32 138, i32 0, metadata !87, metadata !199}
!215 = metadata !{i32 141, i32 0, metadata !97, metadata !199}
!216 = metadata !{i32 139, i32 0, metadata !95, metadata !199}
!217 = metadata !{i32 140, i32 0, metadata !97, metadata !199}
!218 = metadata !{i32 147, i32 0, metadata !219, metadata !199}
!219 = metadata !{i32 786443, metadata !5, metadata !87, i32 147, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/./simple_hash.h]
!220 = metadata !{i32 786689, metadata !4, metadata !"key", metadata !6, i32 16777268, metadata !13, i32 0, metadata !221} ; [ DW_TAG_arg_variable ] [key] [line 52]
!221 = metadata !{i32 148, i32 0, metadata !222, metadata !199}
!222 = metadata !{i32 786443, metadata !5, metadata !219, i32 147, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/./simple_hash.h]
!223 = metadata !{i32 52, i32 0, metadata !4, metadata !221}
!224 = metadata !{i32 55, i32 0, metadata !118, metadata !221}
!225 = metadata !{i32 786688, metadata !4, metadata !"node", metadata !6, i32 54, metadata !9, i32 0, metadata !221} ; [ DW_TAG_auto_variable ] [node] [line 54]
!226 = metadata !{i32 56, i32 0, metadata !120, metadata !221}
!227 = metadata !{i32 57, i32 0, metadata !120, metadata !221}
!228 = metadata !{i32 59, i32 0, metadata !123, metadata !221}
!229 = metadata !{i32 786688, metadata !4, metadata !"newkey", metadata !6, i32 53, metadata !13, i32 0, metadata !221} ; [ DW_TAG_auto_variable ] [newkey] [line 53]
!230 = metadata !{i32 60, i32 0, metadata !125, metadata !221}
!231 = metadata !{i32 61, i32 0, metadata !125, metadata !221}
!232 = metadata !{i32 63, i32 0, metadata !4, metadata !221}
!233 = metadata !{i32 64, i32 0, metadata !4, metadata !221}
!234 = metadata !{i32 65, i32 0, metadata !4, metadata !221}
!235 = metadata !{i32 150, i32 0, metadata !236, metadata !199}
!236 = metadata !{i32 786443, metadata !5, metadata !219, i32 149, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/./simple_hash.h]
!237 = metadata !{i32 786689, metadata !63, metadata !"key", metadata !6, i32 33554557, metadata !13, i32 0, metadata !238} ; [ DW_TAG_arg_variable ] [key] [line 125]
!238 = metadata !{i32 29, i32 0, metadata !239, null}
!239 = metadata !{i32 786443, metadata !1, metadata !197, i32 29, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/hash.c]
!240 = metadata !{i32 125, i32 0, metadata !63, metadata !238}
!241 = metadata !{i32 786689, metadata !80, metadata !"key", metadata !6, i32 33554478, metadata !13, i32 0, metadata !242} ; [ DW_TAG_arg_variable ] [key] [line 46]
!242 = metadata !{i32 126, i32 0, metadata !70, metadata !238}
!243 = metadata !{i32 46, i32 0, metadata !80, metadata !242}
!244 = metadata !{i32 786688, metadata !80, metadata !"val", metadata !6, i32 47, metadata !78, i32 0, metadata !242} ; [ DW_TAG_auto_variable ] [val] [line 47]
!245 = metadata !{i32 47, i32 0, metadata !80, metadata !242}
!246 = metadata !{i32 48, i32 0, metadata !208, metadata !242}
!247 = metadata !{i32 49, i32 0, metadata !80, metadata !242}
!248 = metadata !{i32 127, i32 0, metadata !70, metadata !238}
!249 = metadata !{i32 128, i32 0, metadata !70, metadata !238}
!250 = metadata !{i32 130, i32 0, metadata !75, metadata !238}
!251 = metadata !{i32 129, i32 0, metadata !73, metadata !238}
!252 = metadata !{i32 786688, metadata !38, metadata !"i", metadata !6, i32 86, metadata !16, i32 0, metadata !253} ; [ DW_TAG_auto_variable ] [i] [line 86]
!253 = metadata !{i32 32, i32 0, metadata !55, null}
!254 = metadata !{i32 95, i32 0, metadata !160, metadata !253}
!255 = metadata !{i32 96, i32 0, metadata !162, metadata !253}
!256 = metadata !{i32 786688, metadata !38, metadata !"next", metadata !6, i32 85, metadata !9, i32 0, metadata !253} ; [ DW_TAG_auto_variable ] [next] [line 85]
!257 = metadata !{i32 103, i32 0, metadata !162, metadata !253}
!258 = metadata !{i32 786688, metadata !38, metadata !"cur", metadata !6, i32 85, metadata !9, i32 0, metadata !253} ; [ DW_TAG_auto_variable ] [cur] [line 85]
!259 = metadata !{i32 104, i32 0, metadata !166, metadata !253}
!260 = metadata !{i32 105, i32 0, metadata !166, metadata !253}
!261 = metadata !{i32 106, i32 0, metadata !166, metadata !253}
!262 = metadata !{i32 107, i32 0, metadata !166, metadata !253}
!263 = metadata !{i32 117, i32 0, metadata !38, metadata !253}
!264 = metadata !{i32 34, i32 0, metadata !55, null}
!265 = metadata !{i32 35, i32 0, metadata !55, null}
