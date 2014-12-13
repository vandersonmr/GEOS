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

; Function Attrs: minsize nounwind optsize uwtable
define noalias %struct.ht_node* @ht_node_create(i8* nocapture readonly %key) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %key}, i64 0, metadata !19), !dbg !95
  %1 = tail call noalias i8* @malloc(i64 24) #6, !dbg !96
  %2 = bitcast i8* %1 to %struct.ht_node*, !dbg !96
  tail call void @llvm.dbg.value(metadata !{%struct.ht_node* %2}, i64 0, metadata !21), !dbg !96
  %3 = icmp eq i8* %1, null, !dbg !96
  br i1 %3, label %4, label %5, !dbg !96

; <label>:4                                       ; preds = %0
  tail call void @perror(i8* getelementptr inbounds ([15 x i8]* @.str, i64 0, i64 0)) #7, !dbg !98
  tail call void @exit(i32 1) #8, !dbg !100
  unreachable, !dbg !100

; <label>:5                                       ; preds = %0
  %6 = tail call noalias i8* @strdup(i8* %key) #6, !dbg !101
  tail call void @llvm.dbg.value(metadata !{i8* %6}, i64 0, metadata !20), !dbg !101
  %7 = icmp eq i8* %6, null, !dbg !101
  br i1 %7, label %8, label %9, !dbg !101

; <label>:8                                       ; preds = %5
  tail call void @perror(i8* getelementptr inbounds ([14 x i8]* @.str1, i64 0, i64 0)) #7, !dbg !103
  tail call void @exit(i32 1) #8, !dbg !105
  unreachable, !dbg !105

; <label>:9                                       ; preds = %5
  %10 = bitcast i8* %1 to i8**, !dbg !106
  store i8* %6, i8** %10, align 8, !dbg !106, !tbaa !107
  %11 = getelementptr inbounds i8* %1, i64 8, !dbg !113
  %12 = bitcast i8* %11 to i32*, !dbg !113
  store i32 0, i32* %12, align 4, !dbg !113, !tbaa !114
  %13 = getelementptr inbounds i8* %1, i64 16, !dbg !115
  %14 = bitcast i8* %13 to %struct.ht_node**, !dbg !115
  store %struct.ht_node* null, %struct.ht_node** %14, align 8, !dbg !115, !tbaa !116
  ret %struct.ht_node* %2, !dbg !117
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: minsize nounwind optsize
declare noalias i8* @malloc(i64) #2

; Function Attrs: minsize nounwind optsize
declare void @perror(i8* nocapture readonly) #2

; Function Attrs: minsize noreturn nounwind optsize
declare void @exit(i32) #3

; Function Attrs: minsize nounwind optsize
declare noalias i8* @strdup(i8* nocapture readonly) #2

; Function Attrs: minsize nounwind optsize uwtable
define noalias %struct.ht_ht* @ht_create(i32 %size) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %size}, i64 0, metadata !35), !dbg !118
  tail call void @llvm.dbg.value(metadata !119, i64 0, metadata !36), !dbg !120
  %1 = tail call noalias i8* @malloc(i64 40) #6, !dbg !121
  tail call void @llvm.dbg.value(metadata !{%struct.ht_ht* %8}, i64 0, metadata !37), !dbg !121
  %2 = sext i32 %size to i64, !dbg !122
  br label %3, !dbg !122

; <label>:3                                       ; preds = %3, %0
  %indvars.iv = phi i64 [ %indvars.iv.next, %3 ], [ 0, %0 ]
  %4 = getelementptr inbounds [28 x i64]* @ht_prime_list, i64 0, i64 %indvars.iv, !dbg !122
  %5 = load i64* %4, align 8, !dbg !122, !tbaa !123
  %6 = icmp ult i64 %5, %2, !dbg !122
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !122
  br i1 %6, label %3, label %7, !dbg !122

; <label>:7                                       ; preds = %3
  %8 = bitcast i8* %1 to %struct.ht_ht*, !dbg !121
  %9 = trunc i64 %5 to i32, !dbg !125
  %10 = bitcast i8* %1 to i32*, !dbg !125
  store i32 %9, i32* %10, align 4, !dbg !125, !tbaa !126
  %sext = shl i64 %5, 32, !dbg !128
  %11 = ashr exact i64 %sext, 32, !dbg !128
  %12 = tail call noalias i8* @calloc(i64 %11, i64 8) #6, !dbg !128
  %13 = bitcast i8* %12 to %struct.ht_node**, !dbg !128
  %14 = getelementptr inbounds i8* %1, i64 8, !dbg !128
  %15 = bitcast i8* %14 to %struct.ht_node***, !dbg !128
  store %struct.ht_node** %13, %struct.ht_node*** %15, align 8, !dbg !128, !tbaa !129
  %16 = getelementptr inbounds i8* %1, i64 16, !dbg !130
  %17 = bitcast i8* %16 to i32*, !dbg !130
  store i32 0, i32* %17, align 4, !dbg !130, !tbaa !131
  %18 = getelementptr inbounds i8* %1, i64 24, !dbg !132
  %19 = bitcast i8* %18 to %struct.ht_node**, !dbg !132
  store %struct.ht_node* null, %struct.ht_node** %19, align 8, !dbg !132, !tbaa !133
  %20 = getelementptr inbounds i8* %1, i64 32, !dbg !134
  %21 = bitcast i8* %20 to i32*, !dbg !134
  store i32 0, i32* %21, align 4, !dbg !134, !tbaa !135
  ret %struct.ht_ht* %8, !dbg !136
}

; Function Attrs: minsize nounwind optsize
declare noalias i8* @calloc(i64, i64) #2

; Function Attrs: minsize nounwind optsize uwtable
define void @ht_destroy(%struct.ht_ht* nocapture %ht) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.ht_ht* %ht}, i64 0, metadata !42), !dbg !137
  tail call void @llvm.dbg.value(metadata !119, i64 0, metadata !45), !dbg !138
  %1 = getelementptr inbounds %struct.ht_ht* %ht, i64 0, i32 0, !dbg !138
  %2 = load i32* %1, align 4, !dbg !138, !tbaa !126
  %3 = icmp sgt i32 %2, 0, !dbg !138
  %4 = getelementptr inbounds %struct.ht_ht* %ht, i64 0, i32 1, !dbg !140
  br i1 %3, label %.lr.ph4, label %._crit_edge5, !dbg !138

.lr.ph4:                                          ; preds = %0, %16
  %5 = phi i32 [ %17, %16 ], [ %2, %0 ]
  %indvars.iv = phi i64 [ %indvars.iv.next, %16 ], [ 0, %0 ]
  %6 = load %struct.ht_node*** %4, align 8, !dbg !140, !tbaa !129
  %7 = getelementptr inbounds %struct.ht_node** %6, i64 %indvars.iv, !dbg !140
  %8 = load %struct.ht_node** %7, align 8, !dbg !140, !tbaa !142
  tail call void @llvm.dbg.value(metadata !{%struct.ht_node* %8}, i64 0, metadata !44), !dbg !140
  %9 = icmp eq %struct.ht_node* %8, null, !dbg !143
  br i1 %9, label %16, label %.lr.ph, !dbg !143

.lr.ph:                                           ; preds = %.lr.ph4, %.lr.ph
  %next.01 = phi %struct.ht_node* [ %11, %.lr.ph ], [ %8, %.lr.ph4 ]
  tail call void @llvm.dbg.value(metadata !{%struct.ht_node* %next.01}, i64 0, metadata !43), !dbg !144
  %10 = getelementptr inbounds %struct.ht_node* %next.01, i64 0, i32 2, !dbg !146
  %11 = load %struct.ht_node** %10, align 8, !dbg !146, !tbaa !116
  tail call void @llvm.dbg.value(metadata !{%struct.ht_node* %11}, i64 0, metadata !44), !dbg !146
  %12 = getelementptr inbounds %struct.ht_node* %next.01, i64 0, i32 0, !dbg !147
  %13 = load i8** %12, align 8, !dbg !147, !tbaa !107
  tail call void @free(i8* %13) #6, !dbg !147
  %14 = bitcast %struct.ht_node* %next.01 to i8*, !dbg !148
  tail call void @free(i8* %14) #6, !dbg !148
  %15 = icmp eq %struct.ht_node* %11, null, !dbg !143
  br i1 %15, label %._crit_edge, label %.lr.ph, !dbg !143

._crit_edge:                                      ; preds = %.lr.ph
  %.pre = load i32* %1, align 4, !dbg !138, !tbaa !126
  br label %16, !dbg !143

; <label>:16                                      ; preds = %._crit_edge, %.lr.ph4
  %17 = phi i32 [ %.pre, %._crit_edge ], [ %5, %.lr.ph4 ], !dbg !138
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !138
  %18 = trunc i64 %indvars.iv.next to i32, !dbg !138
  %19 = icmp slt i32 %18, %17, !dbg !138
  br i1 %19, label %.lr.ph4, label %._crit_edge5, !dbg !138

._crit_edge5:                                     ; preds = %16, %0
  %20 = load %struct.ht_node*** %4, align 8, !dbg !149, !tbaa !129
  %21 = bitcast %struct.ht_node** %20 to i8*, !dbg !149
  tail call void @free(i8* %21) #6, !dbg !149
  %22 = bitcast %struct.ht_ht* %ht to i8*, !dbg !150
  tail call void @free(i8* %22) #6, !dbg !150
  ret void, !dbg !151
}

; Function Attrs: minsize nounwind optsize
declare void @free(i8* nocapture) #2

; Function Attrs: minsize nounwind optsize uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
  %buf = alloca [32 x i8], align 16
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !52), !dbg !152
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !53), !dbg !152
  tail call void @llvm.dbg.value(metadata !119, i64 0, metadata !56), !dbg !153
  %1 = icmp eq i32 %argc, 2, !dbg !153
  br i1 %1, label %3, label %.thread, !dbg !153

.thread:                                          ; preds = %0
  tail call void @llvm.dbg.value(metadata !{i32 %10}, i64 0, metadata !57), !dbg !153
  tail call void @llvm.dbg.declare(metadata !{[32 x i8]* %buf}, metadata !58), !dbg !154
  %2 = tail call %struct.ht_ht* @ht_create(i32 3500000) #9, !dbg !155
  tail call void @llvm.dbg.value(metadata !{%struct.ht_ht* %55}, i64 0, metadata !62), !dbg !155
  tail call void @llvm.dbg.value(metadata !156, i64 0, metadata !54), !dbg !157
  br label %.lr.ph10, !dbg !157

; <label>:3                                       ; preds = %0
  %4 = getelementptr inbounds i8** %argv, i64 1, !dbg !153
  %5 = load i8** %4, align 8, !dbg !153, !tbaa !142
  %6 = tail call i32 @atoi(i8* %5) #10, !dbg !153
  tail call void @llvm.dbg.value(metadata !{i32 %10}, i64 0, metadata !57), !dbg !153
  tail call void @llvm.dbg.declare(metadata !{[32 x i8]* %buf}, metadata !58), !dbg !154
  %7 = tail call %struct.ht_ht* @ht_create(i32 %6) #9, !dbg !155
  tail call void @llvm.dbg.value(metadata !{%struct.ht_ht* %55}, i64 0, metadata !62), !dbg !155
  tail call void @llvm.dbg.value(metadata !156, i64 0, metadata !54), !dbg !157
  %8 = icmp slt i32 %6, 1, !dbg !157
  br i1 %8, label %._crit_edge, label %.lr.ph10, !dbg !157

.lr.ph10:                                         ; preds = %.thread, %3
  %9 = phi %struct.ht_ht* [ %2, %.thread ], [ %7, %3 ]
  %10 = phi i32 [ 3500000, %.thread ], [ %6, %3 ]
  %11 = getelementptr inbounds [32 x i8]* %buf, i64 0, i64 0, !dbg !159
  %12 = getelementptr inbounds %struct.ht_ht* %9, i64 0, i32 1, !dbg !161
  %13 = getelementptr inbounds %struct.ht_ht* %9, i64 0, i32 4, !dbg !163
  %.pre12 = load %struct.ht_node*** %12, align 8, !dbg !161, !tbaa !129
  br label %17, !dbg !157

.preheader:                                       ; preds = %ht_find_new.exit
  %14 = icmp sgt i32 %10, 0, !dbg !164
  br i1 %14, label %.lr.ph, label %._crit_edge, !dbg !164

.lr.ph:                                           ; preds = %.preheader
  %15 = getelementptr inbounds [32 x i8]* %buf, i64 0, i64 0, !dbg !166
  %16 = getelementptr inbounds %struct.ht_ht* %9, i64 0, i32 1, !dbg !168
  %.pre = load %struct.ht_node*** %16, align 8, !dbg !168, !tbaa !129
  br label %39, !dbg !164

; <label>:17                                      ; preds = %ht_find_new.exit, %.lr.ph10
  %i.08 = phi i32 [ 1, %.lr.ph10 ], [ %38, %ht_find_new.exit ]
  %18 = call i32 (i8*, i8*, ...)* @sprintf(i8* %11, i8* getelementptr inbounds ([3 x i8]* @.str2, i64 0, i64 0), i32 %i.08) #6, !dbg !159
  tail call void @llvm.dbg.value(metadata !{%struct.ht_ht* %55}, i64 0, metadata !171) #11, !dbg !172
  tail call void @llvm.dbg.value(metadata !{i8* %11}, i64 0, metadata !173) #11, !dbg !172
  %19 = call fastcc i32 @ht_hashcode(%struct.ht_ht* %9, i8* %11) #6, !dbg !174
  tail call void @llvm.dbg.value(metadata !{i32 %19}, i64 0, metadata !175) #11, !dbg !174
  tail call void @llvm.dbg.value(metadata !176, i64 0, metadata !177) #11, !dbg !161
  %20 = sext i32 %19 to i64, !dbg !161
  %21 = getelementptr inbounds %struct.ht_node** %.pre12, i64 %20, !dbg !161
  %node.03.i = load %struct.ht_node** %21, align 8, !dbg !161
  %22 = icmp eq %struct.ht_node* %node.03.i, null, !dbg !178
  br i1 %22, label %._crit_edge.i, label %.lr.ph.i, !dbg !178

; <label>:23                                      ; preds = %.lr.ph.i
  %24 = getelementptr inbounds %struct.ht_node* %node.04.i, i64 0, i32 2, !dbg !179
  %node.0.i = load %struct.ht_node** %24, align 8, !dbg !161
  %25 = icmp eq %struct.ht_node* %node.0.i, null, !dbg !178
  br i1 %25, label %._crit_edge.i, label %.lr.ph.i, !dbg !178

.lr.ph.i:                                         ; preds = %17, %23
  %node.04.i = phi %struct.ht_node* [ %node.0.i, %23 ], [ %node.03.i, %17 ]
  %26 = getelementptr inbounds %struct.ht_node* %node.04.i, i64 0, i32 0, !dbg !181
  %27 = load i8** %26, align 8, !dbg !181, !tbaa !107
  %28 = call i32 @strcmp(i8* %11, i8* %27) #10, !dbg !181
  %29 = icmp eq i32 %28, 0, !dbg !181
  tail call void @llvm.dbg.value(metadata !{%struct.ht_node* %node.04.i}, i64 0, metadata !177) #11, !dbg !183
  br i1 %29, label %ht_find_new.exit, label %23, !dbg !181

._crit_edge.i:                                    ; preds = %23, %17
  %prev.0.lcssa.i = phi %struct.ht_node* [ null, %17 ], [ %node.04.i, %23 ]
  %30 = load i32* %13, align 4, !dbg !163, !tbaa !135
  %31 = add nsw i32 %30, 1, !dbg !163
  store i32 %31, i32* %13, align 4, !dbg !163, !tbaa !135
  %32 = icmp eq %struct.ht_node* %prev.0.lcssa.i, null, !dbg !184
  %33 = call %struct.ht_node* @ht_node_create(i8* %11) #6, !dbg !186
  br i1 %32, label %36, label %34, !dbg !184

; <label>:34                                      ; preds = %._crit_edge.i
  %35 = getelementptr inbounds %struct.ht_node* %prev.0.lcssa.i, i64 0, i32 2, !dbg !186
  store %struct.ht_node* %33, %struct.ht_node** %35, align 8, !dbg !186, !tbaa !116
  br label %ht_find_new.exit, !dbg !186

; <label>:36                                      ; preds = %._crit_edge.i
  store %struct.ht_node* %33, %struct.ht_node** %21, align 8, !dbg !188, !tbaa !142
  br label %ht_find_new.exit, !dbg !188

ht_find_new.exit:                                 ; preds = %.lr.ph.i, %34, %36
  %.0.i = phi %struct.ht_node* [ %33, %34 ], [ %33, %36 ], [ %node.04.i, %.lr.ph.i ]
  %37 = getelementptr inbounds %struct.ht_node* %.0.i, i64 0, i32 1, !dbg !162
  store i32 %i.08, i32* %37, align 4, !dbg !162, !tbaa !114
  %38 = add nsw i32 %i.08, 1, !dbg !157
  tail call void @llvm.dbg.value(metadata !{i32 %38}, i64 0, metadata !54), !dbg !157
  %exitcond = icmp eq i32 %i.08, %10, !dbg !157
  br i1 %exitcond, label %.preheader, label %17, !dbg !157

; <label>:39                                      ; preds = %.lr.ph, %ht_find.exit
  %i.17 = phi i32 [ %10, %.lr.ph ], [ %53, %ht_find.exit ]
  %c.06 = phi i32 [ 0, %.lr.ph ], [ %c.0., %ht_find.exit ]
  %40 = call i32 (i8*, i8*, ...)* @sprintf(i8* %15, i8* getelementptr inbounds ([3 x i8]* @.str3, i64 0, i64 0), i32 %i.17) #6, !dbg !166
  tail call void @llvm.dbg.value(metadata !{%struct.ht_ht* %55}, i64 0, metadata !190) #11, !dbg !191
  tail call void @llvm.dbg.value(metadata !{i8* %15}, i64 0, metadata !192) #11, !dbg !191
  %41 = call fastcc i32 @ht_hashcode(%struct.ht_ht* %9, i8* %15) #6, !dbg !193
  tail call void @llvm.dbg.value(metadata !{i32 %41}, i64 0, metadata !194) #11, !dbg !193
  %42 = sext i32 %41 to i64, !dbg !168
  %43 = getelementptr inbounds %struct.ht_node** %.pre, i64 %42, !dbg !168
  %node.01.i = load %struct.ht_node** %43, align 8, !dbg !168
  %44 = icmp eq %struct.ht_node* %node.01.i, null, !dbg !195
  br i1 %44, label %ht_find.exit, label %.lr.ph.i2, !dbg !195

; <label>:45                                      ; preds = %.lr.ph.i2
  %46 = getelementptr inbounds %struct.ht_node* %node.02.i, i64 0, i32 2, !dbg !196
  %node.0.i1 = load %struct.ht_node** %46, align 8, !dbg !168
  %47 = icmp eq %struct.ht_node* %node.0.i1, null, !dbg !195
  br i1 %47, label %ht_find.exit, label %.lr.ph.i2, !dbg !195

.lr.ph.i2:                                        ; preds = %39, %45
  %node.02.i = phi %struct.ht_node* [ %node.0.i1, %45 ], [ %node.01.i, %39 ]
  %48 = getelementptr inbounds %struct.ht_node* %node.02.i, i64 0, i32 0, !dbg !198
  %49 = load i8** %48, align 8, !dbg !198, !tbaa !107
  %50 = call i32 @strcmp(i8* %15, i8* %49) #10, !dbg !198
  %51 = icmp eq i32 %50, 0, !dbg !198
  br i1 %51, label %ht_find.exit, label %45, !dbg !198

ht_find.exit:                                     ; preds = %45, %.lr.ph.i2, %39
  %.0.i3 = phi %struct.ht_node* [ null, %39 ], [ null, %45 ], [ %node.02.i, %.lr.ph.i2 ]
  %not. = icmp ne %struct.ht_node* %.0.i3, null, !dbg !169
  %52 = zext i1 %not. to i32, !dbg !169
  %c.0. = add nsw i32 %52, %c.06, !dbg !169
  %53 = add nsw i32 %i.17, -1, !dbg !164
  tail call void @llvm.dbg.value(metadata !{i32 %53}, i64 0, metadata !54), !dbg !164
  %54 = icmp sgt i32 %53, 0, !dbg !164
  br i1 %54, label %39, label %._crit_edge, !dbg !164

._crit_edge:                                      ; preds = %ht_find.exit, %3, %.preheader
  %55 = phi %struct.ht_ht* [ %9, %.preheader ], [ %7, %3 ], [ %9, %ht_find.exit ]
  %c.0.lcssa = phi i32 [ 0, %.preheader ], [ 0, %3 ], [ %c.0., %ht_find.exit ]
  tail call void @ht_destroy(%struct.ht_ht* %55) #9, !dbg !200
  %56 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str4, i64 0, i64 0), i32 %c.0.lcssa) #6, !dbg !201
  ret i32 0, !dbg !202
}

; Function Attrs: minsize nounwind optsize readonly
declare i32 @atoi(i8* nocapture) #4

; Function Attrs: minsize nounwind optsize
declare i32 @sprintf(i8* nocapture, i8* nocapture readonly, ...) #2

; Function Attrs: minsize nounwind optsize
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: minsize nounwind optsize readonly uwtable
define internal fastcc i32 @ht_hashcode(%struct.ht_ht* nocapture readonly %ht, i8* nocapture readonly %key) #5 {
  tail call void @llvm.dbg.value(metadata !{%struct.ht_ht* %ht}, i64 0, metadata !76), !dbg !203
  tail call void @llvm.dbg.value(metadata !{i8* %key}, i64 0, metadata !77), !dbg !203
  tail call void @llvm.dbg.value(metadata !204, i64 0, metadata !78), !dbg !205
  %1 = load i8* %key, align 1, !dbg !206, !tbaa !208
  %2 = icmp eq i8 %1, 0, !dbg !206
  br i1 %2, label %._crit_edge, label %.lr.ph, !dbg !206

.lr.ph:                                           ; preds = %0, %.lr.ph
  %3 = phi i8 [ %8, %.lr.ph ], [ %1, %0 ]
  %val.02 = phi i64 [ %6, %.lr.ph ], [ 0, %0 ]
  %.01 = phi i8* [ %7, %.lr.ph ], [ %key, %0 ]
  %4 = mul i64 %val.02, 5, !dbg !206
  %5 = sext i8 %3 to i64, !dbg !206
  %6 = add i64 %5, %4, !dbg !206
  tail call void @llvm.dbg.value(metadata !{i64 %6}, i64 0, metadata !78), !dbg !206
  %7 = getelementptr inbounds i8* %.01, i64 1, !dbg !206
  tail call void @llvm.dbg.value(metadata !{i8* %7}, i64 0, metadata !77), !dbg !206
  %8 = load i8* %7, align 1, !dbg !206, !tbaa !208
  %9 = icmp eq i8 %8, 0, !dbg !206
  br i1 %9, label %._crit_edge, label %.lr.ph, !dbg !206

._crit_edge:                                      ; preds = %.lr.ph, %0
  %val.0.lcssa = phi i64 [ 0, %0 ], [ %6, %.lr.ph ]
  %10 = getelementptr inbounds %struct.ht_ht* %ht, i64 0, i32 0, !dbg !209
  %11 = load i32* %10, align 4, !dbg !209, !tbaa !126
  %12 = sext i32 %11 to i64, !dbg !209
  %13 = urem i64 %val.0.lcssa, %12, !dbg !209
  %14 = trunc i64 %13 to i32, !dbg !209
  ret i32 %14, !dbg !209
}

; Function Attrs: minsize nounwind optsize readonly
declare i32 @strcmp(i8* nocapture, i8* nocapture) #4

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { minsize nounwind optsize uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { minsize nounwind optsize "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { minsize noreturn nounwind optsize "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { minsize nounwind optsize readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { minsize nounwind optsize readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { minsize nounwind optsize }
attributes #7 = { cold minsize nounwind optsize }
attributes #8 = { minsize noreturn nounwind optsize }
attributes #9 = { minsize optsize }
attributes #10 = { minsize nounwind optsize readonly }
attributes #11 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!92, !93}
!llvm.ident = !{!94}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !87, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/hash.c] [DW_LANG_C99]
!1 = metadata !{metadata !"hash.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !22, metadata !38, metadata !46, metadata !63, metadata !72, metadata !80}
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
!66 = metadata !{metadata !67, metadata !68, metadata !69, metadata !71}
!67 = metadata !{i32 786689, metadata !63, metadata !"ht", metadata !6, i32 16777341, metadata !25, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ht] [line 125]
!68 = metadata !{i32 786689, metadata !63, metadata !"key", metadata !6, i32 33554557, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [key] [line 125]
!69 = metadata !{i32 786688, metadata !70, metadata !"hash_code", metadata !6, i32 126, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [hash_code] [line 126]
!70 = metadata !{i32 786443, metadata !5, metadata !63} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/./simple_hash.h]
!71 = metadata !{i32 786688, metadata !70, metadata !"node", metadata !6, i32 127, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [node] [line 127]
!72 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"ht_hashcode", metadata !"ht_hashcode", metadata !"", i32 46, metadata !73, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.ht_ht*, i8*)* @ht_hashcode, null, null, metadata !75, i32 46} ; [ DW_TAG_subprogram ] [line 46] [local] [def] [ht_hashcode]
!73 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !74, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!74 = metadata !{metadata !16, metadata !25, metadata !13}
!75 = metadata !{metadata !76, metadata !77, metadata !78}
!76 = metadata !{i32 786689, metadata !72, metadata !"ht", metadata !6, i32 16777262, metadata !25, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ht] [line 46]
!77 = metadata !{i32 786689, metadata !72, metadata !"key", metadata !6, i32 33554478, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [key] [line 46]
!78 = metadata !{i32 786688, metadata !72, metadata !"val", metadata !6, i32 47, metadata !79, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [val] [line 47]
!79 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!80 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"ht_find_new", metadata !"ht_find_new", metadata !"", i32 135, metadata !64, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !81, i32 135} ; [ DW_TAG_subprogram ] [line 135] [local] [def] [ht_find_new]
!81 = metadata !{metadata !82, metadata !83, metadata !84, metadata !85, metadata !86}
!82 = metadata !{i32 786689, metadata !80, metadata !"ht", metadata !6, i32 16777351, metadata !25, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ht] [line 135]
!83 = metadata !{i32 786689, metadata !80, metadata !"key", metadata !6, i32 33554567, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [key] [line 135]
!84 = metadata !{i32 786688, metadata !80, metadata !"hash_code", metadata !6, i32 136, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [hash_code] [line 136]
!85 = metadata !{i32 786688, metadata !80, metadata !"prev", metadata !6, i32 137, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [prev] [line 137]
!86 = metadata !{i32 786688, metadata !80, metadata !"node", metadata !6, i32 137, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [node] [line 137]
!87 = metadata !{metadata !88}
!88 = metadata !{i32 786484, i32 0, null, metadata !"ht_prime_list", metadata !"ht_prime_list", metadata !"", metadata !6, i32 12, metadata !89, i32 1, i32 1, [28 x i64]* @ht_prime_list, null} ; [ DW_TAG_variable ] [ht_prime_list] [line 12] [local] [def]
!89 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 1792, i64 64, i32 0, i32 0, metadata !79, metadata !90, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1792, align 64, offset 0] [from long unsigned int]
!90 = metadata !{metadata !91}
!91 = metadata !{i32 786465, i64 0, i64 28}       ; [ DW_TAG_subrange_type ] [0, 27]
!92 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!93 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!94 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!95 = metadata !{i32 52, i32 0, metadata !4, null}
!96 = metadata !{i32 55, i32 0, metadata !97, null}
!97 = metadata !{i32 786443, metadata !5, metadata !4, i32 55, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/./simple_hash.h]
!98 = metadata !{i32 56, i32 0, metadata !99, null}
!99 = metadata !{i32 786443, metadata !5, metadata !97, i32 55, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/./simple_hash.h]
!100 = metadata !{i32 57, i32 0, metadata !99, null}
!101 = metadata !{i32 59, i32 0, metadata !102, null}
!102 = metadata !{i32 786443, metadata !5, metadata !4, i32 59, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/./simple_hash.h]
!103 = metadata !{i32 60, i32 0, metadata !104, null}
!104 = metadata !{i32 786443, metadata !5, metadata !102, i32 59, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/./simple_hash.h]
!105 = metadata !{i32 61, i32 0, metadata !104, null}
!106 = metadata !{i32 63, i32 0, metadata !4, null}
!107 = metadata !{metadata !108, metadata !109, i64 0}
!108 = metadata !{metadata !"ht_node", metadata !109, i64 0, metadata !112, i64 8, metadata !109, i64 16}
!109 = metadata !{metadata !"any pointer", metadata !110, i64 0}
!110 = metadata !{metadata !"omnipotent char", metadata !111, i64 0}
!111 = metadata !{metadata !"Simple C/C++ TBAA"}
!112 = metadata !{metadata !"int", metadata !110, i64 0}
!113 = metadata !{i32 64, i32 0, metadata !4, null}
!114 = metadata !{metadata !108, metadata !112, i64 8}
!115 = metadata !{i32 65, i32 0, metadata !4, null}
!116 = metadata !{metadata !108, metadata !109, i64 16}
!117 = metadata !{i32 66, i32 0, metadata !4, null}
!118 = metadata !{i32 69, i32 0, metadata !22, null}
!119 = metadata !{i32 0}
!120 = metadata !{i32 70, i32 0, metadata !22, null}
!121 = metadata !{i32 71, i32 0, metadata !22, null}
!122 = metadata !{i32 72, i32 0, metadata !22, null}
!123 = metadata !{metadata !124, metadata !124, i64 0}
!124 = metadata !{metadata !"long", metadata !110, i64 0}
!125 = metadata !{i32 73, i32 0, metadata !22, null}
!126 = metadata !{metadata !127, metadata !112, i64 0}
!127 = metadata !{metadata !"ht_ht", metadata !112, i64 0, metadata !109, i64 8, metadata !112, i64 16, metadata !109, i64 24, metadata !112, i64 32}
!128 = metadata !{i32 74, i32 0, metadata !22, null}
!129 = metadata !{metadata !127, metadata !109, i64 8}
!130 = metadata !{i32 75, i32 0, metadata !22, null}
!131 = metadata !{metadata !127, metadata !112, i64 16}
!132 = metadata !{i32 76, i32 0, metadata !22, null}
!133 = metadata !{metadata !127, metadata !109, i64 24}
!134 = metadata !{i32 77, i32 0, metadata !22, null}
!135 = metadata !{metadata !127, metadata !112, i64 32}
!136 = metadata !{i32 81, i32 0, metadata !22, null}
!137 = metadata !{i32 84, i32 0, metadata !38, null}
!138 = metadata !{i32 95, i32 0, metadata !139, null}
!139 = metadata !{i32 786443, metadata !5, metadata !38, i32 95, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/./simple_hash.h]
!140 = metadata !{i32 96, i32 0, metadata !141, null}
!141 = metadata !{i32 786443, metadata !5, metadata !139, i32 95, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/./simple_hash.h]
!142 = metadata !{metadata !109, metadata !109, i64 0}
!143 = metadata !{i32 103, i32 0, metadata !141, null}
!144 = metadata !{i32 104, i32 0, metadata !145, null}
!145 = metadata !{i32 786443, metadata !5, metadata !141, i32 103, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/./simple_hash.h]
!146 = metadata !{i32 105, i32 0, metadata !145, null}
!147 = metadata !{i32 106, i32 0, metadata !145, null}
!148 = metadata !{i32 107, i32 0, metadata !145, null}
!149 = metadata !{i32 117, i32 0, metadata !38, null}
!150 = metadata !{i32 118, i32 0, metadata !38, null}
!151 = metadata !{i32 123, i32 0, metadata !38, null}
!152 = metadata !{i32 11, i32 0, metadata !46, null}
!153 = metadata !{i32 17, i32 0, metadata !55, null}
!154 = metadata !{i32 18, i32 0, metadata !55, null}
!155 = metadata !{i32 20, i32 0, metadata !55, null}
!156 = metadata !{i32 1}
!157 = metadata !{i32 22, i32 0, metadata !158, null}
!158 = metadata !{i32 786443, metadata !1, metadata !55, i32 22, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/hash.c]
!159 = metadata !{i32 23, i32 0, metadata !160, null}
!160 = metadata !{i32 786443, metadata !1, metadata !158, i32 22, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/hash.c]
!161 = metadata !{i32 137, i32 0, metadata !80, metadata !162}
!162 = metadata !{i32 24, i32 0, metadata !160, null}
!163 = metadata !{i32 146, i32 0, metadata !80, metadata !162}
!164 = metadata !{i32 27, i32 0, metadata !165, null}
!165 = metadata !{i32 786443, metadata !1, metadata !55, i32 27, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/hash.c]
!166 = metadata !{i32 28, i32 0, metadata !167, null}
!167 = metadata !{i32 786443, metadata !1, metadata !165, i32 27, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/hash.c]
!168 = metadata !{i32 127, i32 0, metadata !70, metadata !169}
!169 = metadata !{i32 29, i32 0, metadata !170, null}
!170 = metadata !{i32 786443, metadata !1, metadata !167, i32 29, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/hash.c]
!171 = metadata !{i32 786689, metadata !80, metadata !"ht", metadata !6, i32 16777351, metadata !25, i32 0, metadata !162} ; [ DW_TAG_arg_variable ] [ht] [line 135]
!172 = metadata !{i32 135, i32 0, metadata !80, metadata !162}
!173 = metadata !{i32 786689, metadata !80, metadata !"key", metadata !6, i32 33554567, metadata !13, i32 0, metadata !162} ; [ DW_TAG_arg_variable ] [key] [line 135]
!174 = metadata !{i32 136, i32 0, metadata !80, metadata !162}
!175 = metadata !{i32 786688, metadata !80, metadata !"hash_code", metadata !6, i32 136, metadata !16, i32 0, metadata !162} ; [ DW_TAG_auto_variable ] [hash_code] [line 136]
!176 = metadata !{%struct.ht_node* null}
!177 = metadata !{i32 786688, metadata !80, metadata !"prev", metadata !6, i32 137, metadata !9, i32 0, metadata !162} ; [ DW_TAG_auto_variable ] [prev] [line 137]
!178 = metadata !{i32 138, i32 0, metadata !80, metadata !162}
!179 = metadata !{i32 141, i32 0, metadata !180, metadata !162}
!180 = metadata !{i32 786443, metadata !5, metadata !80, i32 138, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/./simple_hash.h]
!181 = metadata !{i32 139, i32 0, metadata !182, metadata !162}
!182 = metadata !{i32 786443, metadata !5, metadata !180, i32 139, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/./simple_hash.h]
!183 = metadata !{i32 140, i32 0, metadata !180, metadata !162}
!184 = metadata !{i32 147, i32 0, metadata !185, metadata !162}
!185 = metadata !{i32 786443, metadata !5, metadata !80, i32 147, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/./simple_hash.h]
!186 = metadata !{i32 148, i32 0, metadata !187, metadata !162}
!187 = metadata !{i32 786443, metadata !5, metadata !185, i32 147, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/./simple_hash.h]
!188 = metadata !{i32 150, i32 0, metadata !189, metadata !162}
!189 = metadata !{i32 786443, metadata !5, metadata !185, i32 149, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/./simple_hash.h]
!190 = metadata !{i32 786689, metadata !63, metadata !"ht", metadata !6, i32 16777341, metadata !25, i32 0, metadata !169} ; [ DW_TAG_arg_variable ] [ht] [line 125]
!191 = metadata !{i32 125, i32 0, metadata !63, metadata !169}
!192 = metadata !{i32 786689, metadata !63, metadata !"key", metadata !6, i32 33554557, metadata !13, i32 0, metadata !169} ; [ DW_TAG_arg_variable ] [key] [line 125]
!193 = metadata !{i32 126, i32 0, metadata !70, metadata !169}
!194 = metadata !{i32 786688, metadata !70, metadata !"hash_code", metadata !6, i32 126, metadata !16, i32 0, metadata !169} ; [ DW_TAG_auto_variable ] [hash_code] [line 126]
!195 = metadata !{i32 128, i32 0, metadata !70, metadata !169}
!196 = metadata !{i32 130, i32 0, metadata !197, metadata !169}
!197 = metadata !{i32 786443, metadata !5, metadata !70, i32 128, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/./simple_hash.h]
!198 = metadata !{i32 129, i32 0, metadata !199, metadata !169}
!199 = metadata !{i32 786443, metadata !5, metadata !197, i32 129, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/./simple_hash.h]
!200 = metadata !{i32 32, i32 0, metadata !55, null}
!201 = metadata !{i32 34, i32 0, metadata !55, null}
!202 = metadata !{i32 35, i32 0, metadata !55, null}
!203 = metadata !{i32 46, i32 0, metadata !72, null}
!204 = metadata !{i64 0}
!205 = metadata !{i32 47, i32 0, metadata !72, null}
!206 = metadata !{i32 48, i32 0, metadata !207, null}
!207 = metadata !{i32 786443, metadata !5, metadata !72, i32 48, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/./simple_hash.h]
!208 = metadata !{metadata !110, metadata !110, i64 0}
!209 = metadata !{i32 49, i32 0, metadata !72, null}
