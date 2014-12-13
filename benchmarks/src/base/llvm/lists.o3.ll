; ModuleID = 'lists.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

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
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %head}, i64 0, metadata !18), !dbg !130
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %item}, i64 0, metadata !19), !dbg !130
  %1 = getelementptr inbounds %struct.DLL* %head, i64 0, i32 2, !dbg !131
  %2 = load %struct.DLL** %1, align 8, !dbg !131, !tbaa !132
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %2}, i64 0, metadata !20), !dbg !131
  %3 = getelementptr inbounds %struct.DLL* %2, i64 0, i32 1, !dbg !138
  store %struct.DLL* %item, %struct.DLL** %3, align 8, !dbg !138, !tbaa !139
  %4 = getelementptr inbounds %struct.DLL* %item, i64 0, i32 1, !dbg !140
  store %struct.DLL* %head, %struct.DLL** %4, align 8, !dbg !140, !tbaa !139
  store %struct.DLL* %item, %struct.DLL** %1, align 8, !dbg !141, !tbaa !132
  %5 = getelementptr inbounds %struct.DLL* %item, i64 0, i32 2, !dbg !142
  store %struct.DLL* %2, %struct.DLL** %5, align 8, !dbg !142, !tbaa !132
  %6 = getelementptr inbounds %struct.DLL* %head, i64 0, i32 0, !dbg !143
  %7 = load i32* %6, align 4, !dbg !143, !tbaa !144
  %8 = add nsw i32 %7, 1, !dbg !143
  store i32 %8, i32* %6, align 4, !dbg !143, !tbaa !144
  ret void, !dbg !145
}

; Function Attrs: nounwind uwtable
define %struct.DLL* @list_pop_tail(%struct.DLL* %head) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %head}, i64 0, metadata !25), !dbg !146
  %head.idx = getelementptr %struct.DLL* %head, i64 0, i32 0
  %head.idx.val = load i32* %head.idx, align 4, !tbaa !144
  %1 = icmp eq i32 %head.idx.val, 0, !dbg !147
  br i1 %1, label %9, label %2, !dbg !148

; <label>:2                                       ; preds = %0
  %3 = getelementptr inbounds %struct.DLL* %head, i64 0, i32 2, !dbg !150
  %4 = load %struct.DLL** %3, align 8, !dbg !150, !tbaa !132
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %4}, i64 0, metadata !27), !dbg !150
  %5 = getelementptr inbounds %struct.DLL* %4, i64 0, i32 2, !dbg !151
  %6 = load %struct.DLL** %5, align 8, !dbg !151, !tbaa !132
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %6}, i64 0, metadata !26), !dbg !151
  %7 = getelementptr inbounds %struct.DLL* %6, i64 0, i32 1, !dbg !152
  store %struct.DLL* %head, %struct.DLL** %7, align 8, !dbg !152, !tbaa !139
  store %struct.DLL* %6, %struct.DLL** %3, align 8, !dbg !153, !tbaa !132
  %8 = add nsw i32 %head.idx.val, -1, !dbg !154
  store i32 %8, i32* %head.idx, align 4, !dbg !154, !tbaa !144
  br label %9, !dbg !155

; <label>:9                                       ; preds = %0, %2
  %.0 = phi %struct.DLL* [ %4, %2 ], [ null, %0 ]
  ret %struct.DLL* %.0, !dbg !156
}

; Function Attrs: nounwind uwtable
define void @list_push_head(%struct.DLL* %head, %struct.DLL* %item) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %head}, i64 0, metadata !30), !dbg !157
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %item}, i64 0, metadata !31), !dbg !157
  %1 = getelementptr inbounds %struct.DLL* %head, i64 0, i32 1, !dbg !158
  %2 = load %struct.DLL** %1, align 8, !dbg !158, !tbaa !139
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %2}, i64 0, metadata !32), !dbg !158
  store %struct.DLL* %item, %struct.DLL** %1, align 8, !dbg !159, !tbaa !139
  %3 = getelementptr inbounds %struct.DLL* %2, i64 0, i32 2, !dbg !160
  store %struct.DLL* %item, %struct.DLL** %3, align 8, !dbg !160, !tbaa !132
  %4 = getelementptr inbounds %struct.DLL* %item, i64 0, i32 1, !dbg !161
  store %struct.DLL* %2, %struct.DLL** %4, align 8, !dbg !161, !tbaa !139
  %5 = getelementptr inbounds %struct.DLL* %item, i64 0, i32 2, !dbg !162
  store %struct.DLL* %head, %struct.DLL** %5, align 8, !dbg !162, !tbaa !132
  %6 = getelementptr inbounds %struct.DLL* %head, i64 0, i32 0, !dbg !163
  %7 = load i32* %6, align 4, !dbg !163, !tbaa !144
  %8 = add nsw i32 %7, 1, !dbg !163
  store i32 %8, i32* %6, align 4, !dbg !163, !tbaa !144
  ret void, !dbg !164
}

; Function Attrs: nounwind uwtable
define %struct.DLL* @list_pop_head(%struct.DLL* %head) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %head}, i64 0, metadata !35), !dbg !165
  %head.idx = getelementptr %struct.DLL* %head, i64 0, i32 0
  %head.idx.val = load i32* %head.idx, align 4, !tbaa !144
  %1 = icmp eq i32 %head.idx.val, 0, !dbg !147
  br i1 %1, label %10, label %2, !dbg !166

; <label>:2                                       ; preds = %0
  %3 = getelementptr inbounds %struct.DLL* %head, i64 0, i32 1, !dbg !168
  %4 = load %struct.DLL** %3, align 8, !dbg !168, !tbaa !139
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %4}, i64 0, metadata !36), !dbg !168
  %5 = getelementptr inbounds %struct.DLL* %4, i64 0, i32 1, !dbg !169
  %6 = load %struct.DLL** %5, align 8, !dbg !169, !tbaa !139
  store %struct.DLL* %6, %struct.DLL** %3, align 8, !dbg !169, !tbaa !139
  %7 = load %struct.DLL** %5, align 8, !dbg !170, !tbaa !139
  %8 = getelementptr inbounds %struct.DLL* %7, i64 0, i32 2, !dbg !170
  store %struct.DLL* %head, %struct.DLL** %8, align 8, !dbg !170, !tbaa !132
  %9 = add nsw i32 %head.idx.val, -1, !dbg !171
  store i32 %9, i32* %head.idx, align 4, !dbg !171, !tbaa !144
  br label %10, !dbg !172

; <label>:10                                      ; preds = %0, %2
  %.0 = phi %struct.DLL* [ %4, %2 ], [ null, %0 ]
  ret %struct.DLL* %.0, !dbg !173
}

; Function Attrs: nounwind readonly uwtable
define i32 @list_equal(%struct.DLL* readonly %x, %struct.DLL* readonly %y) #1 {
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %x}, i64 0, metadata !41), !dbg !174
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %y}, i64 0, metadata !42), !dbg !174
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %x}, i64 0, metadata !43), !dbg !175
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %y}, i64 0, metadata !44), !dbg !175
  %1 = getelementptr inbounds %struct.DLL* %x, i64 0, i32 1, !dbg !175
  %2 = load %struct.DLL** %1, align 8, !dbg !175, !tbaa !139
  %3 = icmp eq %struct.DLL* %2, %x, !dbg !175
  %4 = getelementptr inbounds %struct.DLL* %x, i64 0, i32 0, !dbg !177
  %5 = load i32* %4, align 4, !dbg !177, !tbaa !144
  %6 = getelementptr inbounds %struct.DLL* %y, i64 0, i32 0, !dbg !177
  %7 = load i32* %6, align 4, !dbg !177, !tbaa !144
  %8 = icmp ne i32 %5, %7, !dbg !177
  br i1 %3, label %._crit_edge, label %.lr.ph, !dbg !175

.lr.ph:                                           ; preds = %0, %11
  %9 = phi i1 [ %21, %11 ], [ %8, %0 ]
  %10 = phi %struct.DLL* [ %15, %11 ], [ %2, %0 ]
  %yp.03 = phi %struct.DLL* [ %13, %11 ], [ %y, %0 ]
  br i1 %9, label %.loopexit, label %11, !dbg !177

; <label>:11                                      ; preds = %.lr.ph
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %10}, i64 0, metadata !43), !dbg !175
  %12 = getelementptr inbounds %struct.DLL* %yp.03, i64 0, i32 1, !dbg !175
  %13 = load %struct.DLL** %12, align 8, !dbg !175, !tbaa !139
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %13}, i64 0, metadata !44), !dbg !175
  %14 = getelementptr inbounds %struct.DLL* %10, i64 0, i32 1, !dbg !175
  %15 = load %struct.DLL** %14, align 8, !dbg !175, !tbaa !139
  %16 = icmp eq %struct.DLL* %15, %x, !dbg !175
  %17 = getelementptr inbounds %struct.DLL* %10, i64 0, i32 0, !dbg !177
  %18 = load i32* %17, align 4, !dbg !177, !tbaa !144
  %19 = getelementptr inbounds %struct.DLL* %13, i64 0, i32 0, !dbg !177
  %20 = load i32* %19, align 4, !dbg !177, !tbaa !144
  %21 = icmp ne i32 %18, %20, !dbg !177
  br i1 %16, label %._crit_edge, label %.lr.ph, !dbg !175

._crit_edge:                                      ; preds = %11, %0
  %.lcssa = phi i1 [ %8, %0 ], [ %21, %11 ]
  %yp.0.lcssa = phi %struct.DLL* [ %y, %0 ], [ %13, %11 ]
  br i1 %.lcssa, label %.loopexit, label %22, !dbg !180

; <label>:22                                      ; preds = %._crit_edge
  %23 = getelementptr inbounds %struct.DLL* %yp.0.lcssa, i64 0, i32 1, !dbg !182
  %24 = load %struct.DLL** %23, align 8, !dbg !182, !tbaa !139
  %25 = icmp eq %struct.DLL* %24, %y, !dbg !182
  %26 = zext i1 %25 to i32, !dbg !182
  br label %.loopexit, !dbg !182

.loopexit:                                        ; preds = %.lr.ph, %._crit_edge, %22
  %.0 = phi i32 [ %26, %22 ], [ 0, %._crit_edge ], [ 0, %.lr.ph ]
  ret i32 %.0, !dbg !183
}

; Function Attrs: nounwind uwtable
define void @list_print(i8* nocapture readonly %msg, %struct.DLL* nocapture readonly %x) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %msg}, i64 0, metadata !51), !dbg !184
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %x}, i64 0, metadata !52), !dbg !184
  %1 = getelementptr inbounds %struct.DLL* %x, i64 0, i32 1, !dbg !185
  %2 = load %struct.DLL** %1, align 8, !dbg !185, !tbaa !139
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %2}, i64 0, metadata !54), !dbg !185
  tail call void @llvm.dbg.value(metadata !186, i64 0, metadata !55), !dbg !187
  %3 = tail call i32 @puts(i8* %msg) #5, !dbg !188
  %x.idx = getelementptr %struct.DLL* %x, i64 0, i32 0
  %x.idx.val = load i32* %x.idx, align 4, !tbaa !144
  %4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i32 %x.idx.val) #5, !dbg !189
  %xp.01 = load %struct.DLL** %1, align 8, !dbg !190
  %5 = getelementptr inbounds %struct.DLL* %xp.01, i64 0, i32 1, !dbg !190
  %6 = load %struct.DLL** %5, align 8, !dbg !190, !tbaa !139
  %7 = icmp eq %struct.DLL* %6, %2, !dbg !190
  br i1 %7, label %._crit_edge, label %.lr.ph, !dbg !190

.lr.ph:                                           ; preds = %0, %.lr.ph
  %8 = phi %struct.DLL* [ %21, %.lr.ph ], [ %6, %0 ]
  %9 = phi %struct.DLL** [ %20, %.lr.ph ], [ %5, %0 ]
  %xp.03 = phi %struct.DLL* [ %xp.0, %.lr.ph ], [ %xp.01, %0 ]
  %i.02 = phi i32 [ %10, %.lr.ph ], [ 0, %0 ]
  %10 = add nsw i32 %i.02, 1, !dbg !192
  tail call void @llvm.dbg.value(metadata !{i32 %10}, i64 0, metadata !55), !dbg !192
  %11 = getelementptr inbounds %struct.DLL* %xp.03, i64 0, i32 0, !dbg !192
  %12 = load i32* %11, align 4, !dbg !192, !tbaa !144
  %13 = getelementptr inbounds %struct.DLL* %8, i64 0, i32 0, !dbg !192
  %14 = load i32* %13, align 4, !dbg !192, !tbaa !144
  %15 = getelementptr inbounds %struct.DLL* %xp.03, i64 0, i32 2, !dbg !192
  %16 = load %struct.DLL** %15, align 8, !dbg !192, !tbaa !132
  %17 = getelementptr inbounds %struct.DLL* %16, i64 0, i32 0, !dbg !192
  %18 = load i32* %17, align 4, !dbg !192, !tbaa !144
  %19 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str1, i64 0, i64 0), i32 %10, i32 %12, i32 %14, i32 %18) #5, !dbg !192
  %xp.0 = load %struct.DLL** %9, align 8, !dbg !190
  %20 = getelementptr inbounds %struct.DLL* %xp.0, i64 0, i32 1, !dbg !190
  %21 = load %struct.DLL** %20, align 8, !dbg !190, !tbaa !139
  %22 = icmp eq %struct.DLL* %21, %2, !dbg !190
  br i1 %22, label %._crit_edge, label %.lr.ph, !dbg !190

._crit_edge:                                      ; preds = %.lr.ph, %0
  %.lcssa = phi %struct.DLL** [ %5, %0 ], [ %20, %.lr.ph ]
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([33 x i8]* @str, i64 0, i64 0)) #5, !dbg !194
  %23 = load %struct.DLL** %.lcssa, align 8, !dbg !195, !tbaa !139
  %24 = getelementptr inbounds %struct.DLL* %23, i64 0, i32 0, !dbg !195
  %25 = load i32* %24, align 4, !dbg !195, !tbaa !144
  %26 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str3, i64 0, i64 0), i32 %25) #5, !dbg !195
  ret void, !dbg !196
}

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #2

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind uwtable
define %struct.DLL* @list_new() #0 {
  %1 = tail call noalias i8* @malloc(i64 24) #5, !dbg !197
  %2 = bitcast i8* %1 to %struct.DLL*, !dbg !197
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %2}, i64 0, metadata !60), !dbg !197
  %3 = getelementptr inbounds i8* %1, i64 8, !dbg !198
  %4 = bitcast i8* %3 to %struct.DLL**, !dbg !198
  store %struct.DLL* %2, %struct.DLL** %4, align 8, !dbg !198, !tbaa !139
  %5 = getelementptr inbounds i8* %1, i64 16, !dbg !199
  %6 = bitcast i8* %5 to %struct.DLL**, !dbg !199
  store %struct.DLL* %2, %struct.DLL** %6, align 8, !dbg !199, !tbaa !132
  %7 = bitcast i8* %1 to i32*, !dbg !200
  store i32 0, i32* %7, align 4, !dbg !200, !tbaa !144
  ret %struct.DLL* %2, !dbg !201
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind uwtable
define %struct.DLL* @list_sequence(i32 %from, i32 %to) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %from}, i64 0, metadata !65), !dbg !202
  tail call void @llvm.dbg.value(metadata !{i32 %to}, i64 0, metadata !66), !dbg !202
  %1 = icmp sgt i32 %from, %to, !dbg !203
  tail call void @llvm.dbg.value(metadata !{i32 %from}, i64 0, metadata !68), !dbg !205
  tail call void @llvm.dbg.value(metadata !{i32 %to}, i64 0, metadata !65), !dbg !205
  tail call void @llvm.dbg.value(metadata !{i32 %from}, i64 0, metadata !66), !dbg !205
  %from.to = select i1 %1, i32 %from, i32 %to, !dbg !203
  %to.from = select i1 %1, i32 %to, i32 %from, !dbg !203
  %2 = sub nsw i32 %from.to, %to.from, !dbg !207
  %3 = add nsw i32 %2, 1, !dbg !207
  tail call void @llvm.dbg.value(metadata !{i32 %3}, i64 0, metadata !67), !dbg !207
  %4 = add nsw i32 %2, 2, !dbg !208
  %5 = sext i32 %4 to i64, !dbg !208
  %6 = mul i64 %5, 24, !dbg !208
  %7 = tail call noalias i8* @malloc(i64 %6) #5, !dbg !208
  %8 = bitcast i8* %7 to %struct.DLL*, !dbg !208
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %8}, i64 0, metadata !71), !dbg !208
  %9 = add nsw i32 %to.from, -1, !dbg !209
  tail call void @llvm.dbg.value(metadata !{i32 %9}, i64 0, metadata !65), !dbg !209
  tail call void @llvm.dbg.value(metadata !186, i64 0, metadata !69), !dbg !210
  tail call void @llvm.dbg.value(metadata !212, i64 0, metadata !70), !dbg !210
  %10 = icmp sgt i32 %2, -1, !dbg !210
  br i1 %10, label %.lr.ph, label %30, !dbg !210

.lr.ph:                                           ; preds = %0
  %11 = icmp sgt i32 %to, %from
  %smax = select i1 %11, i32 %to, i32 %from
  %12 = xor i32 %to, -1, !dbg !210
  %13 = xor i32 %from, -1, !dbg !210
  %14 = icmp sgt i32 %12, %13
  %smax7 = select i1 %14, i32 %12, i32 %13
  %15 = add i32 %smax, %smax7, !dbg !210
  %16 = add i32 %15, 2, !dbg !210
  %17 = icmp sgt i32 %16, 1
  %.op = add i32 %smax, %smax7, !dbg !210
  %18 = select i1 %17, i32 %.op, i32 -1, !dbg !210
  br label %19, !dbg !210

; <label>:19                                      ; preds = %.lr.ph, %19
  %indvars.iv5 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next6, %19 ]
  %indvars.iv = phi i64 [ 1, %.lr.ph ], [ %indvars.iv.next, %19 ]
  %.14 = phi i32 [ %9, %.lr.ph ], [ %25, %19 ]
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1, !dbg !210
  %20 = getelementptr inbounds %struct.DLL* %8, i64 %indvars.iv.next6, !dbg !213
  %21 = getelementptr inbounds %struct.DLL* %8, i64 %indvars.iv5, i32 1, !dbg !213
  store %struct.DLL* %20, %struct.DLL** %21, align 8, !dbg !213, !tbaa !139
  %22 = add nsw i64 %indvars.iv, -1, !dbg !215
  %23 = getelementptr inbounds %struct.DLL* %8, i64 %22, !dbg !215
  %24 = getelementptr inbounds %struct.DLL* %8, i64 %indvars.iv, i32 2, !dbg !215
  store %struct.DLL* %23, %struct.DLL** %24, align 8, !dbg !215, !tbaa !132
  %25 = add nsw i32 %.14, 1, !dbg !216
  tail call void @llvm.dbg.value(metadata !{i32 %29}, i64 0, metadata !65), !dbg !216
  %26 = getelementptr inbounds %struct.DLL* %8, i64 %indvars.iv5, i32 0, !dbg !216
  store i32 %.14, i32* %26, align 4, !dbg !216, !tbaa !144
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !210
  %27 = trunc i64 %indvars.iv.next6 to i32, !dbg !210
  %28 = icmp slt i32 %27, %3, !dbg !210
  br i1 %28, label %19, label %._crit_edge, !dbg !210

._crit_edge:                                      ; preds = %19
  %29 = sub i32 %18, %smax7, !dbg !210
  br label %30, !dbg !210

; <label>:30                                      ; preds = %._crit_edge, %0
  %.1.lcssa = phi i32 [ %29, %._crit_edge ], [ %9, %0 ]
  %31 = sext i32 %3 to i64, !dbg !217
  %32 = getelementptr inbounds %struct.DLL* %8, i64 %31, !dbg !217
  %33 = getelementptr inbounds i8* %7, i64 16, !dbg !217
  %34 = bitcast i8* %33 to %struct.DLL**, !dbg !217
  store %struct.DLL* %32, %struct.DLL** %34, align 8, !dbg !217, !tbaa !132
  %35 = getelementptr inbounds %struct.DLL* %8, i64 %31, i32 1, !dbg !218
  store %struct.DLL* %8, %struct.DLL** %35, align 8, !dbg !218, !tbaa !139
  %36 = sext i32 %2 to i64, !dbg !219
  %37 = getelementptr inbounds %struct.DLL* %8, i64 %36, !dbg !219
  %38 = getelementptr inbounds %struct.DLL* %8, i64 %31, i32 2, !dbg !219
  store %struct.DLL* %37, %struct.DLL** %38, align 8, !dbg !219, !tbaa !132
  %39 = getelementptr inbounds %struct.DLL* %32, i64 0, i32 0, !dbg !220
  store i32 %.1.lcssa, i32* %39, align 4, !dbg !220, !tbaa !144
  %40 = bitcast i8* %7 to i32*, !dbg !221
  store i32 %3, i32* %40, align 4, !dbg !221, !tbaa !144
  ret %struct.DLL* %8, !dbg !222
}

; Function Attrs: nounwind uwtable
define %struct.DLL* @list_copy(%struct.DLL* nocapture readonly %x) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %x}, i64 0, metadata !74), !dbg !223
  %x.idx = getelementptr %struct.DLL* %x, i64 0, i32 0
  %x.idx.val = load i32* %x.idx, align 4, !tbaa !144
  tail call void @llvm.dbg.value(metadata !{i32 %x.idx.val}, i64 0, metadata !77), !dbg !224
  %1 = add nsw i32 %x.idx.val, 1, !dbg !225
  %2 = sext i32 %1 to i64, !dbg !225
  %3 = mul i64 %2, 24, !dbg !225
  %4 = tail call noalias i8* @malloc(i64 %3) #5, !dbg !225
  %5 = bitcast i8* %4 to %struct.DLL*, !dbg !225
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %5}, i64 0, metadata !79), !dbg !225
  tail call void @llvm.dbg.value(metadata !186, i64 0, metadata !75), !dbg !226
  tail call void @llvm.dbg.value(metadata !212, i64 0, metadata !76), !dbg !226
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %x}, i64 0, metadata !78), !dbg !226
  %6 = icmp sgt i32 %x.idx.val, 0, !dbg !226
  br i1 %6, label %.lr.ph, label %._crit_edge, !dbg !226

.lr.ph:                                           ; preds = %0, %._crit_edge7
  %7 = phi i32 [ %.pre, %._crit_edge7 ], [ %x.idx.val, %0 ]
  %indvars.iv5 = phi i64 [ %indvars.iv.next6, %._crit_edge7 ], [ 1, %0 ]
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge7 ], [ 0, %0 ]
  %xp.03 = phi %struct.DLL* [ %14, %._crit_edge7 ], [ %x, %0 ]
  %8 = getelementptr inbounds %struct.DLL* %5, i64 %indvars.iv5, !dbg !228
  %9 = getelementptr inbounds %struct.DLL* %5, i64 %indvars.iv, !dbg !228
  %10 = getelementptr inbounds %struct.DLL* %5, i64 %indvars.iv, i32 1, !dbg !228
  store %struct.DLL* %8, %struct.DLL** %10, align 8, !dbg !228, !tbaa !139
  %11 = getelementptr inbounds %struct.DLL* %5, i64 %indvars.iv5, i32 2, !dbg !230
  store %struct.DLL* %9, %struct.DLL** %11, align 8, !dbg !230, !tbaa !132
  %12 = getelementptr inbounds %struct.DLL* %9, i64 0, i32 0, !dbg !231
  store i32 %7, i32* %12, align 4, !dbg !231, !tbaa !144
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !226
  %13 = getelementptr inbounds %struct.DLL* %xp.03, i64 0, i32 1, !dbg !226
  %14 = load %struct.DLL** %13, align 8, !dbg !226, !tbaa !139
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %14}, i64 0, metadata !78), !dbg !226
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !226
  %exitcond = icmp eq i32 %lftr.wideiv, %x.idx.val, !dbg !226
  br i1 %exitcond, label %._crit_edge, label %._crit_edge7, !dbg !226

._crit_edge7:                                     ; preds = %.lr.ph
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1, !dbg !226
  %.phi.trans.insert = getelementptr inbounds %struct.DLL* %14, i64 0, i32 0
  %.pre = load i32* %.phi.trans.insert, align 4, !dbg !231, !tbaa !144
  br label %.lr.ph, !dbg !226

._crit_edge:                                      ; preds = %.lr.ph, %0
  %15 = sext i32 %x.idx.val to i64, !dbg !232
  %16 = getelementptr inbounds %struct.DLL* %5, i64 %15, !dbg !232
  %17 = getelementptr inbounds i8* %4, i64 16, !dbg !232
  %18 = bitcast i8* %17 to %struct.DLL**, !dbg !232
  store %struct.DLL* %16, %struct.DLL** %18, align 8, !dbg !232, !tbaa !132
  %19 = getelementptr inbounds %struct.DLL* %5, i64 %15, i32 1, !dbg !233
  store %struct.DLL* %5, %struct.DLL** %19, align 8, !dbg !233, !tbaa !139
  %x.idx1 = getelementptr %struct.DLL* %x, i64 0, i32 2
  %x.idx1.val = load %struct.DLL** %x.idx1, align 8, !tbaa !132
  %20 = getelementptr inbounds %struct.DLL* %x.idx1.val, i64 0, i32 0, !dbg !234
  %21 = load i32* %20, align 4, !dbg !234, !tbaa !144
  %22 = getelementptr inbounds %struct.DLL* %16, i64 0, i32 0, !dbg !234
  store i32 %21, i32* %22, align 4, !dbg !234, !tbaa !144
  ret %struct.DLL* %5, !dbg !235
}

; Function Attrs: nounwind uwtable
define void @list_reverse(%struct.DLL* %head) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %head}, i64 0, metadata !84), !dbg !236
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %head}, i64 0, metadata !86), !dbg !237
  br label %1, !dbg !238

; <label>:1                                       ; preds = %1, %0
  %p.0 = phi %struct.DLL* [ %head, %0 ], [ %3, %1 ]
  %2 = getelementptr inbounds %struct.DLL* %p.0, i64 0, i32 1, !dbg !239
  %3 = load %struct.DLL** %2, align 8, !dbg !239, !tbaa !139
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %3}, i64 0, metadata !85), !dbg !239
  %4 = getelementptr inbounds %struct.DLL* %p.0, i64 0, i32 2, !dbg !241
  %5 = load %struct.DLL** %4, align 8, !dbg !241, !tbaa !132
  store %struct.DLL* %5, %struct.DLL** %2, align 8, !dbg !241, !tbaa !139
  store %struct.DLL* %3, %struct.DLL** %4, align 8, !dbg !242, !tbaa !132
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %3}, i64 0, metadata !86), !dbg !243
  %6 = icmp eq %struct.DLL* %3, %head, !dbg !244
  br i1 %6, label %7, label %1, !dbg !244

; <label>:7                                       ; preds = %1
  ret void, !dbg !245
}

; Function Attrs: nounwind uwtable
define i32 @test_lists() #0 {
  tail call void @llvm.dbg.value(metadata !186, i64 0, metadata !91), !dbg !246
  tail call void @llvm.dbg.value(metadata !212, i64 0, metadata !247) #5, !dbg !249
  tail call void @llvm.dbg.value(metadata !250, i64 0, metadata !251) #5, !dbg !249
  tail call void @llvm.dbg.value(metadata !212, i64 0, metadata !252) #5, !dbg !253
  tail call void @llvm.dbg.value(metadata !250, i64 0, metadata !247) #5, !dbg !253
  tail call void @llvm.dbg.value(metadata !212, i64 0, metadata !251) #5, !dbg !253
  tail call void @llvm.dbg.value(metadata !250, i64 0, metadata !254) #5, !dbg !255
  %1 = tail call noalias i8* @malloc(i64 2424) #5, !dbg !256
  %2 = bitcast i8* %1 to %struct.DLL*, !dbg !256
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %2}, i64 0, metadata !257) #5, !dbg !256
  tail call void @llvm.dbg.value(metadata !186, i64 0, metadata !247) #5, !dbg !258
  tail call void @llvm.dbg.value(metadata !186, i64 0, metadata !259) #5, !dbg !260
  tail call void @llvm.dbg.value(metadata !212, i64 0, metadata !261) #5, !dbg !260
  br label %3, !dbg !260

; <label>:3                                       ; preds = %3, %0
  %indvars.iv5.i = phi i64 [ 0, %0 ], [ %indvars.iv.next6.i, %3 ]
  %indvars.iv.i = phi i64 [ 1, %0 ], [ %indvars.iv.next.i, %3 ]
  %.14.i = phi i32 [ 0, %0 ], [ %9, %3 ]
  %indvars.iv.next6.i = add nuw nsw i64 %indvars.iv5.i, 1, !dbg !260
  %4 = getelementptr inbounds %struct.DLL* %2, i64 %indvars.iv.next6.i, !dbg !262
  %5 = getelementptr inbounds %struct.DLL* %2, i64 %indvars.iv5.i, i32 1, !dbg !262
  store %struct.DLL* %4, %struct.DLL** %5, align 8, !dbg !262, !tbaa !139
  %6 = add nsw i64 %indvars.iv.i, -1, !dbg !263
  %7 = getelementptr inbounds %struct.DLL* %2, i64 %6, !dbg !263
  %8 = getelementptr inbounds %struct.DLL* %2, i64 %indvars.iv.i, i32 2, !dbg !263
  store %struct.DLL* %7, %struct.DLL** %8, align 8, !dbg !263, !tbaa !132
  %9 = add nsw i32 %.14.i, 1, !dbg !264
  %10 = getelementptr inbounds %struct.DLL* %2, i64 %indvars.iv5.i, i32 0, !dbg !264
  store i32 %.14.i, i32* %10, align 4, !dbg !264, !tbaa !144
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !260
  %exitcond57 = icmp eq i64 %indvars.iv.next6.i, 100, !dbg !260
  br i1 %exitcond57, label %list_sequence.exit, label %3, !dbg !260

list_sequence.exit:                               ; preds = %3
  %11 = getelementptr inbounds i8* %1, i64 2400, !dbg !265
  %12 = bitcast i8* %11 to %struct.DLL*, !dbg !265
  %13 = getelementptr inbounds i8* %1, i64 16, !dbg !265
  %14 = bitcast i8* %13 to %struct.DLL**, !dbg !265
  store %struct.DLL* %12, %struct.DLL** %14, align 8, !dbg !265, !tbaa !132
  %15 = getelementptr inbounds i8* %1, i64 2408, !dbg !266
  %16 = bitcast i8* %15 to %struct.DLL**, !dbg !266
  store %struct.DLL* %2, %struct.DLL** %16, align 8, !dbg !266, !tbaa !139
  %17 = getelementptr inbounds i8* %1, i64 2376, !dbg !267
  %18 = bitcast i8* %17 to %struct.DLL*, !dbg !267
  %19 = getelementptr inbounds i8* %1, i64 2416, !dbg !267
  %20 = bitcast i8* %19 to %struct.DLL**, !dbg !267
  store %struct.DLL* %18, %struct.DLL** %20, align 8, !dbg !267, !tbaa !132
  %21 = bitcast i8* %11 to i32*, !dbg !268
  store i32 100, i32* %21, align 4, !dbg !268, !tbaa !144
  %22 = bitcast i8* %1 to i32*, !dbg !269
  store i32 100, i32* %22, align 4, !dbg !269, !tbaa !144
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %2}, i64 0, metadata !92), !dbg !248
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %2}, i64 0, metadata !270) #5, !dbg !272
  tail call void @llvm.dbg.value(metadata !250, i64 0, metadata !273) #5, !dbg !274
  %23 = tail call noalias i8* @malloc(i64 2424) #5, !dbg !275
  %24 = bitcast i8* %23 to %struct.DLL*, !dbg !275
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %24}, i64 0, metadata !276) #5, !dbg !275
  tail call void @llvm.dbg.value(metadata !186, i64 0, metadata !277) #5, !dbg !278
  tail call void @llvm.dbg.value(metadata !212, i64 0, metadata !279) #5, !dbg !278
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %2}, i64 0, metadata !280) #5, !dbg !278
  %25 = getelementptr inbounds i8* %23, i64 24, !dbg !281
  %26 = bitcast i8* %25 to %struct.DLL*, !dbg !281
  %27 = getelementptr inbounds i8* %23, i64 8, !dbg !281
  %28 = bitcast i8* %27 to %struct.DLL**, !dbg !281
  store %struct.DLL* %26, %struct.DLL** %28, align 8, !dbg !281, !tbaa !139
  %29 = getelementptr inbounds i8* %23, i64 40, !dbg !282
  %30 = bitcast i8* %29 to %struct.DLL**, !dbg !282
  store %struct.DLL* %24, %struct.DLL** %30, align 8, !dbg !282, !tbaa !132
  %31 = bitcast i8* %23 to i32*, !dbg !283
  store i32 100, i32* %31, align 4, !dbg !283, !tbaa !144
  %32 = getelementptr inbounds i8* %1, i64 8, !dbg !278
  %33 = bitcast i8* %32 to %struct.DLL**, !dbg !278
  br label %._crit_edge7.i, !dbg !278

._crit_edge7.i:                                   ; preds = %list_sequence.exit, %._crit_edge7.i
  %.in = phi %struct.DLL** [ %33, %list_sequence.exit ], [ %40, %._crit_edge7.i ]
  %indvars.iv.next.i2049 = phi i64 [ 1, %list_sequence.exit ], [ %indvars.iv.next.i20, %._crit_edge7.i ]
  %34 = load %struct.DLL** %.in, align 8, !dbg !278
  %indvars.iv.next.i20 = add nuw nsw i64 %indvars.iv.next.i2049, 1, !dbg !278
  %.phi.trans.insert.i = getelementptr inbounds %struct.DLL* %34, i64 0, i32 0
  %.pre.i = load i32* %.phi.trans.insert.i, align 4, !dbg !283, !tbaa !144
  %35 = getelementptr inbounds %struct.DLL* %24, i64 %indvars.iv.next.i20, !dbg !281
  %36 = getelementptr inbounds %struct.DLL* %24, i64 %indvars.iv.next.i2049, !dbg !281
  %37 = getelementptr inbounds %struct.DLL* %24, i64 %indvars.iv.next.i2049, i32 1, !dbg !281
  store %struct.DLL* %35, %struct.DLL** %37, align 8, !dbg !281, !tbaa !139
  %38 = getelementptr inbounds %struct.DLL* %24, i64 %indvars.iv.next.i20, i32 2, !dbg !282
  store %struct.DLL* %36, %struct.DLL** %38, align 8, !dbg !282, !tbaa !132
  %39 = getelementptr inbounds %struct.DLL* %36, i64 0, i32 0, !dbg !283
  store i32 %.pre.i, i32* %39, align 4, !dbg !283, !tbaa !144
  %40 = getelementptr inbounds %struct.DLL* %34, i64 0, i32 1, !dbg !278
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %34}, i64 0, metadata !280) #5, !dbg !278
  %exitcond = icmp eq i64 %indvars.iv.next.i20, 100, !dbg !278
  br i1 %exitcond, label %list_copy.exit, label %._crit_edge7.i, !dbg !278

list_copy.exit:                                   ; preds = %._crit_edge7.i
  %41 = getelementptr inbounds i8* %23, i64 2400, !dbg !284
  %42 = bitcast i8* %41 to %struct.DLL*, !dbg !284
  %43 = getelementptr inbounds i8* %23, i64 16, !dbg !284
  %44 = bitcast i8* %43 to %struct.DLL**, !dbg !284
  store %struct.DLL* %42, %struct.DLL** %44, align 8, !dbg !284, !tbaa !132
  %45 = getelementptr inbounds i8* %23, i64 2408, !dbg !285
  %46 = bitcast i8* %45 to %struct.DLL**, !dbg !285
  store %struct.DLL* %24, %struct.DLL** %46, align 8, !dbg !285, !tbaa !139
  %47 = bitcast i8* %41 to i32*, !dbg !286
  store i32 100, i32* %47, align 4, !dbg !286, !tbaa !144
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %24}, i64 0, metadata !93), !dbg !271
  %48 = tail call noalias i8* @malloc(i64 24) #5, !dbg !287
  %49 = bitcast i8* %48 to %struct.DLL*, !dbg !287
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %49}, i64 0, metadata !289) #5, !dbg !287
  %50 = getelementptr inbounds i8* %48, i64 8, !dbg !290
  %51 = bitcast i8* %50 to %struct.DLL**, !dbg !290
  store %struct.DLL* %49, %struct.DLL** %51, align 8, !dbg !290, !tbaa !139
  %52 = getelementptr inbounds i8* %48, i64 16, !dbg !291
  %53 = bitcast i8* %52 to %struct.DLL**, !dbg !291
  store %struct.DLL* %49, %struct.DLL** %53, align 8, !dbg !291, !tbaa !132
  %54 = bitcast i8* %48 to i32*, !dbg !292
  store i32 0, i32* %54, align 4, !dbg !292, !tbaa !144
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %49}, i64 0, metadata !94), !dbg !288
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %24}, i64 0, metadata !293), !dbg !296
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %2}, i64 0, metadata !297), !dbg !296
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %24}, i64 0, metadata !298), !dbg !299
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %2}, i64 0, metadata !300), !dbg !299
  %55 = load %struct.DLL** %28, align 8, !dbg !299, !tbaa !139
  %56 = icmp eq %struct.DLL* %55, %24, !dbg !299
  %57 = load i32* %31, align 4, !dbg !301, !tbaa !144
  %58 = icmp ne i32 %57, 100, !dbg !301
  br i1 %56, label %._crit_edge.i, label %.lr.ph.i22, !dbg !299

.lr.ph.i22:                                       ; preds = %list_copy.exit, %61
  %59 = phi i1 [ %71, %61 ], [ %58, %list_copy.exit ]
  %60 = phi %struct.DLL* [ %65, %61 ], [ %55, %list_copy.exit ]
  %yp.03.i = phi %struct.DLL* [ %63, %61 ], [ %2, %list_copy.exit ]
  br i1 %59, label %list_equal.exit.thread, label %61, !dbg !301

; <label>:61                                      ; preds = %.lr.ph.i22
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %60}, i64 0, metadata !298), !dbg !299
  %62 = getelementptr inbounds %struct.DLL* %yp.03.i, i64 0, i32 1, !dbg !299
  %63 = load %struct.DLL** %62, align 8, !dbg !299, !tbaa !139
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %63}, i64 0, metadata !300), !dbg !299
  %64 = getelementptr inbounds %struct.DLL* %60, i64 0, i32 1, !dbg !299
  %65 = load %struct.DLL** %64, align 8, !dbg !299, !tbaa !139
  %66 = icmp eq %struct.DLL* %65, %24, !dbg !299
  %67 = getelementptr inbounds %struct.DLL* %60, i64 0, i32 0, !dbg !301
  %68 = load i32* %67, align 4, !dbg !301, !tbaa !144
  %69 = getelementptr inbounds %struct.DLL* %63, i64 0, i32 0, !dbg !301
  %70 = load i32* %69, align 4, !dbg !301, !tbaa !144
  %71 = icmp ne i32 %68, %70, !dbg !301
  br i1 %66, label %._crit_edge.i, label %.lr.ph.i22, !dbg !299

._crit_edge.i:                                    ; preds = %61, %list_copy.exit
  %.lcssa.i = phi i1 [ %58, %list_copy.exit ], [ %71, %61 ]
  %yp.0.lcssa.i = phi %struct.DLL* [ %2, %list_copy.exit ], [ %63, %61 ]
  br i1 %.lcssa.i, label %list_equal.exit.thread, label %list_equal.exit, !dbg !302

list_equal.exit:                                  ; preds = %._crit_edge.i
  %72 = getelementptr inbounds %struct.DLL* %yp.0.lcssa.i, i64 0, i32 1, !dbg !303
  %73 = load %struct.DLL** %72, align 8, !dbg !303, !tbaa !139
  %74 = icmp eq %struct.DLL* %73, %2, !dbg !303
  br i1 %74, label %.preheader35, label %list_equal.exit.thread, !dbg !294

.preheader35:                                     ; preds = %list_equal.exit
  %75 = icmp eq i32 %57, 0, !dbg !147
  br i1 %75, label %.preheader, label %list_pop_head.exit, !dbg !304

list_equal.exit.thread:                           ; preds = %.lr.ph.i22, %list_equal.exit, %._crit_edge.i
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([26 x i8]* @str13, i64 0, i64 0)) #5, !dbg !305
  tail call void @exit(i32 1) #6, !dbg !307
  unreachable, !dbg !307

.preheader34:                                     ; preds = %list_pop_head.exit
  store i32 0, i32* %31, align 4, !tbaa !144
  store i32 %57, i32* %54, align 4, !dbg !308, !tbaa !144
  %76 = icmp eq i32 %57, 0, !dbg !147
  br i1 %76, label %.preheader, label %list_pop_tail.exit, !dbg !311

list_pop_head.exit:                               ; preds = %.preheader35, %list_pop_head.exit.list_pop_head.exit_crit_edge
  %77 = phi %struct.DLL* [ %.pre, %list_pop_head.exit.list_pop_head.exit_crit_edge ], [ %55, %.preheader35 ]
  %.idx9.val44 = phi i32 [ %82, %list_pop_head.exit.list_pop_head.exit_crit_edge ], [ %57, %.preheader35 ]
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %24}, i64 0, metadata !312), !dbg !313
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %77}, i64 0, metadata !314), !dbg !315
  %78 = getelementptr inbounds %struct.DLL* %77, i64 0, i32 1, !dbg !316
  %79 = load %struct.DLL** %78, align 8, !dbg !316, !tbaa !139
  store %struct.DLL* %79, %struct.DLL** %28, align 8, !dbg !316, !tbaa !139
  %80 = load %struct.DLL** %78, align 8, !dbg !317, !tbaa !139
  %81 = getelementptr inbounds %struct.DLL* %80, i64 0, i32 2, !dbg !317
  store %struct.DLL* %24, %struct.DLL** %81, align 8, !dbg !317, !tbaa !132
  %82 = add nsw i32 %.idx9.val44, -1, !dbg !318
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %49}, i64 0, metadata !319), !dbg !320
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %77}, i64 0, metadata !321), !dbg !320
  %83 = load %struct.DLL** %53, align 8, !dbg !322, !tbaa !132
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %83}, i64 0, metadata !323), !dbg !322
  %84 = getelementptr inbounds %struct.DLL* %83, i64 0, i32 1, !dbg !324
  store %struct.DLL* %77, %struct.DLL** %84, align 8, !dbg !324, !tbaa !139
  store %struct.DLL* %49, %struct.DLL** %78, align 8, !dbg !325, !tbaa !139
  store %struct.DLL* %77, %struct.DLL** %53, align 8, !dbg !326, !tbaa !132
  %85 = getelementptr inbounds %struct.DLL* %77, i64 0, i32 2, !dbg !327
  store %struct.DLL* %83, %struct.DLL** %85, align 8, !dbg !327, !tbaa !132
  %86 = icmp eq i32 %82, 0, !dbg !147
  br i1 %86, label %.preheader34, label %list_pop_head.exit.list_pop_head.exit_crit_edge, !dbg !304

list_pop_head.exit.list_pop_head.exit_crit_edge:  ; preds = %list_pop_head.exit
  %.pre = load %struct.DLL** %28, align 8, !dbg !315, !tbaa !139
  br label %list_pop_head.exit, !dbg !304

..preheader_crit_edge:                            ; preds = %list_pop_tail.exit
  store i32 0, i32* %54, align 4, !tbaa !144
  store i32 %57, i32* %31, align 4, !dbg !328, !tbaa !144
  br label %.preheader, !dbg !311

.preheader:                                       ; preds = %.preheader35, %..preheader_crit_edge, %.preheader34
  %87 = phi i32 [ %57, %..preheader_crit_edge ], [ 0, %.preheader34 ], [ 0, %.preheader35 ]
  br label %97, !dbg !331

list_pop_tail.exit:                               ; preds = %.preheader34, %list_pop_tail.exit
  %.idx7.val40 = phi i32 [ %92, %list_pop_tail.exit ], [ %57, %.preheader34 ]
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %49}, i64 0, metadata !333), !dbg !334
  %88 = load %struct.DLL** %53, align 8, !dbg !335, !tbaa !132
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %88}, i64 0, metadata !336), !dbg !335
  %89 = getelementptr inbounds %struct.DLL* %88, i64 0, i32 2, !dbg !337
  %90 = load %struct.DLL** %89, align 8, !dbg !337, !tbaa !132
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %90}, i64 0, metadata !338), !dbg !337
  %91 = getelementptr inbounds %struct.DLL* %90, i64 0, i32 1, !dbg !339
  store %struct.DLL* %49, %struct.DLL** %91, align 8, !dbg !339, !tbaa !139
  store %struct.DLL* %90, %struct.DLL** %53, align 8, !dbg !340, !tbaa !132
  %92 = add nsw i32 %.idx7.val40, -1, !dbg !341
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %24}, i64 0, metadata !342), !dbg !343
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %88}, i64 0, metadata !344), !dbg !343
  %93 = load %struct.DLL** %44, align 8, !dbg !345, !tbaa !132
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %93}, i64 0, metadata !346), !dbg !345
  %94 = getelementptr inbounds %struct.DLL* %93, i64 0, i32 1, !dbg !347
  store %struct.DLL* %88, %struct.DLL** %94, align 8, !dbg !347, !tbaa !139
  %95 = getelementptr inbounds %struct.DLL* %88, i64 0, i32 1, !dbg !348
  store %struct.DLL* %24, %struct.DLL** %95, align 8, !dbg !348, !tbaa !139
  store %struct.DLL* %88, %struct.DLL** %44, align 8, !dbg !349, !tbaa !132
  store %struct.DLL* %93, %struct.DLL** %89, align 8, !dbg !350, !tbaa !132
  %96 = icmp eq i32 %92, 0, !dbg !147
  br i1 %96, label %..preheader_crit_edge, label %list_pop_tail.exit, !dbg !311

; <label>:97                                      ; preds = %.preheader, %97
  %p.0.i = phi %struct.DLL* [ %99, %97 ], [ %2, %.preheader ]
  %98 = getelementptr inbounds %struct.DLL* %p.0.i, i64 0, i32 1, !dbg !331
  %99 = load %struct.DLL** %98, align 8, !dbg !331, !tbaa !139
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %99}, i64 0, metadata !351), !dbg !331
  %100 = getelementptr inbounds %struct.DLL* %p.0.i, i64 0, i32 2, !dbg !352
  %101 = load %struct.DLL** %100, align 8, !dbg !352, !tbaa !132
  store %struct.DLL* %101, %struct.DLL** %98, align 8, !dbg !352, !tbaa !139
  store %struct.DLL* %99, %struct.DLL** %100, align 8, !dbg !353, !tbaa !132
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %99}, i64 0, metadata !354), !dbg !355
  %102 = icmp eq %struct.DLL* %99, %2, !dbg !356
  br i1 %102, label %list_reverse.exit, label %97, !dbg !356

list_reverse.exit:                                ; preds = %97
  %.idx17.val = load %struct.DLL** %33, align 8, !tbaa !139
  %103 = getelementptr inbounds %struct.DLL* %.idx17.val, i64 0, i32 0, !dbg !357
  %104 = load i32* %103, align 4, !dbg !357, !tbaa !144
  %105 = icmp eq i32 %104, 100, !dbg !357
  br i1 %105, label %108, label %106, !dbg !357

; <label>:106                                     ; preds = %list_reverse.exit
  %107 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([42 x i8]* @.str7, i64 0, i64 0), i32 100, i32 %104) #5, !dbg !359
  tail call void @exit(i32 1) #6, !dbg !361
  unreachable, !dbg !361

; <label>:108                                     ; preds = %list_reverse.exit
  %.idx13.val = load %struct.DLL** %14, align 8, !tbaa !132
  %109 = getelementptr inbounds %struct.DLL* %.idx13.val, i64 0, i32 0, !dbg !362
  %110 = load i32* %109, align 4, !dbg !362, !tbaa !144
  %111 = icmp eq i32 %110, 1, !dbg !362
  br i1 %111, label %114, label %112, !dbg !362

; <label>:112                                     ; preds = %108
  %113 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str8, i64 0, i64 0), i32 100, i32 %110) #5, !dbg !364
  tail call void @exit(i32 1) #6, !dbg !366
  unreachable, !dbg !366

; <label>:114                                     ; preds = %108
  %.idx15.val = load %struct.DLL** %28, align 8, !tbaa !139
  %115 = getelementptr inbounds %struct.DLL* %.idx15.val, i64 0, i32 0, !dbg !367
  %116 = load i32* %115, align 4, !dbg !367, !tbaa !144
  %117 = icmp eq i32 %116, 100, !dbg !367
  br i1 %117, label %120, label %118, !dbg !367

; <label>:118                                     ; preds = %114
  %119 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([42 x i8]* @.str9, i64 0, i64 0), i32 100, i32 %116) #5, !dbg !369
  tail call void @exit(i32 1) #6, !dbg !371
  unreachable, !dbg !371

; <label>:120                                     ; preds = %114
  %.idx11.val = load %struct.DLL** %44, align 8, !tbaa !132
  %121 = getelementptr inbounds %struct.DLL* %.idx11.val, i64 0, i32 0, !dbg !372
  %122 = load i32* %121, align 4, !dbg !372, !tbaa !144
  %123 = icmp eq i32 %122, 1, !dbg !372
  br i1 %123, label %126, label %124, !dbg !372

; <label>:124                                     ; preds = %120
  %125 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str8, i64 0, i64 0), i32 100, i32 %122) #5, !dbg !374
  tail call void @exit(i32 1) #6, !dbg !376
  unreachable, !dbg !376

; <label>:126                                     ; preds = %120
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %2}, i64 0, metadata !377), !dbg !380
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %24}, i64 0, metadata !381), !dbg !380
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %2}, i64 0, metadata !382), !dbg !383
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %24}, i64 0, metadata !384), !dbg !383
  %127 = icmp eq %struct.DLL* %.idx17.val, %2, !dbg !383
  %128 = icmp ne i32 %87, 100, !dbg !385
  br i1 %127, label %._crit_edge.i27, label %.lr.ph.i24, !dbg !383

.lr.ph.i24:                                       ; preds = %126, %131
  %129 = phi i1 [ %141, %131 ], [ %128, %126 ]
  %130 = phi %struct.DLL* [ %135, %131 ], [ %.idx17.val, %126 ]
  %yp.03.i23 = phi %struct.DLL* [ %133, %131 ], [ %24, %126 ]
  br i1 %129, label %list_equal.exit29.thread, label %131, !dbg !385

; <label>:131                                     ; preds = %.lr.ph.i24
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %130}, i64 0, metadata !382), !dbg !383
  %132 = getelementptr inbounds %struct.DLL* %yp.03.i23, i64 0, i32 1, !dbg !383
  %133 = load %struct.DLL** %132, align 8, !dbg !383, !tbaa !139
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %133}, i64 0, metadata !384), !dbg !383
  %134 = getelementptr inbounds %struct.DLL* %130, i64 0, i32 1, !dbg !383
  %135 = load %struct.DLL** %134, align 8, !dbg !383, !tbaa !139
  %136 = icmp eq %struct.DLL* %135, %2, !dbg !383
  %137 = getelementptr inbounds %struct.DLL* %130, i64 0, i32 0, !dbg !385
  %138 = load i32* %137, align 4, !dbg !385, !tbaa !144
  %139 = getelementptr inbounds %struct.DLL* %133, i64 0, i32 0, !dbg !385
  %140 = load i32* %139, align 4, !dbg !385, !tbaa !144
  %141 = icmp ne i32 %138, %140, !dbg !385
  br i1 %136, label %._crit_edge.i27, label %.lr.ph.i24, !dbg !383

._crit_edge.i27:                                  ; preds = %131, %126
  %.lcssa.i25 = phi i1 [ %128, %126 ], [ %141, %131 ]
  %yp.0.lcssa.i26 = phi %struct.DLL* [ %24, %126 ], [ %133, %131 ]
  br i1 %.lcssa.i25, label %list_equal.exit29.thread, label %list_equal.exit29, !dbg !386

list_equal.exit29:                                ; preds = %._crit_edge.i27
  %142 = getelementptr inbounds %struct.DLL* %yp.0.lcssa.i26, i64 0, i32 1, !dbg !387
  %143 = load %struct.DLL** %142, align 8, !dbg !387, !tbaa !139
  %144 = icmp eq %struct.DLL* %143, %24, !dbg !387
  br i1 %144, label %145, label %list_equal.exit29.thread, !dbg !378

list_equal.exit29.thread:                         ; preds = %.lr.ph.i24, %list_equal.exit29, %._crit_edge.i27
  %puts3 = tail call i32 @puts(i8* getelementptr inbounds ([26 x i8]* @str16, i64 0, i64 0)) #5, !dbg !388
  tail call void @exit(i32 1) #6, !dbg !390
  unreachable, !dbg !390

; <label>:145                                     ; preds = %list_equal.exit29
  tail call void @llvm.dbg.value(metadata !250, i64 0, metadata !91), !dbg !391
  tail call void @free(i8* %1) #5, !dbg !392
  tail call void @free(i8* %23) #5, !dbg !393
  tail call void @free(i8* %48) #5, !dbg !394
  ret i32 100, !dbg !395
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

; Function Attrs: nounwind
declare void @free(i8* nocapture) #2

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !100), !dbg !396
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !101), !dbg !396
  %1 = icmp eq i32 %argc, 2, !dbg !397
  br i1 %1, label %.preheader, label %.lr.ph, !dbg !397

.preheader:                                       ; preds = %0
  %2 = getelementptr inbounds i8** %argv, i64 1, !dbg !398
  %3 = load i8** %2, align 8, !dbg !398, !tbaa !399
  tail call void @llvm.dbg.value(metadata !{i8* %3}, i64 0, metadata !400) #5, !dbg !401
  %4 = tail call i64 @strtol(i8* nocapture %3, i8** null, i32 10) #5, !dbg !402
  %5 = trunc i64 %4 to i32, !dbg !402
  tail call void @llvm.dbg.value(metadata !{i32 %7}, i64 0, metadata !102), !dbg !404
  %6 = icmp eq i32 %5, 0, !dbg !404
  br i1 %6, label %._crit_edge, label %.lr.ph, !dbg !404

.lr.ph:                                           ; preds = %0, %.preheader, %.lr.ph
  %n.01 = phi i32 [ %7, %.lr.ph ], [ 3000000, %0 ], [ %5, %.preheader ]
  %7 = add nsw i32 %n.01, -1, !dbg !404
  %8 = tail call i32 @test_lists(), !dbg !404
  tail call void @llvm.dbg.value(metadata !{i32 %8}, i64 0, metadata !103), !dbg !404
  tail call void @llvm.dbg.value(metadata !{i32 %7}, i64 0, metadata !102), !dbg !404
  %9 = icmp eq i32 %7, 0, !dbg !404
  br i1 %9, label %._crit_edge, label %.lr.ph, !dbg !404

._crit_edge:                                      ; preds = %.lr.ph, %.preheader
  %result.0.lcssa = phi i32 [ 0, %.preheader ], [ %8, %.lr.ph ]
  %10 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str12, i64 0, i64 0), i32 %result.0.lcssa) #5, !dbg !405
  ret i32 0, !dbg !406
}

; Function Attrs: nounwind
declare i64 @strtol(i8* readonly, i8** nocapture, i32) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #4

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!127, !128}
!llvm.ident = !{!129}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c] [DW_LANG_C99]
!1 = metadata !{metadata !"lists.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !21, metadata !28, metadata !33, metadata !37, metadata !45, metadata !56, metadata !61, metadata !72, metadata !80, metadata !87, metadata !95, metadata !104, metadata !113, metadata !116, metadata !119, metadata !124}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"list_push_tail", metadata !"list_push_tail", metadata !"", i32 26, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (%struct.DLL*, %struct.DLL*)* @list_push_tail, null, null, metadata !17, i32 26} ; [ DW_TAG_subprogram ] [line 26] [def] [list_push_tail]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{null, metadata !8, metadata !8}
!8 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !9} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from DLL]
!9 = metadata !{i32 786454, metadata !1, null, metadata !"DLL", i32 19, i64 0, i64 0, i64 0, i32 0, metadata !10} ; [ DW_TAG_typedef ] [DLL] [line 19, size 0, align 0, offset 0] [from DLL]
!10 = metadata !{i32 786451, metadata !1, null, metadata !"DLL", i32 15, i64 192, i64 64, i32 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [DLL] [line 15, size 192, align 64, offset 0] [def] [from ]
!11 = metadata !{metadata !12, metadata !14, metadata !16}
!12 = metadata !{i32 786445, metadata !1, metadata !10, metadata !"val", i32 16, i64 32, i64 32, i64 0, i32 0, metadata !13} ; [ DW_TAG_member ] [val] [line 16, size 32, align 32, offset 0] [from int]
!13 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!14 = metadata !{i32 786445, metadata !1, metadata !10, metadata !"next", i32 17, i64 64, i64 64, i64 64, i32 0, metadata !15} ; [ DW_TAG_member ] [next] [line 17, size 64, align 64, offset 64] [from ]
!15 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from DLL]
!16 = metadata !{i32 786445, metadata !1, metadata !10, metadata !"prev", i32 18, i64 64, i64 64, i64 128, i32 0, metadata !15} ; [ DW_TAG_member ] [prev] [line 18, size 64, align 64, offset 128] [from ]
!17 = metadata !{metadata !18, metadata !19, metadata !20}
!18 = metadata !{i32 786689, metadata !4, metadata !"head", metadata !5, i32 16777242, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [head] [line 26]
!19 = metadata !{i32 786689, metadata !4, metadata !"item", metadata !5, i32 33554458, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [item] [line 26]
!20 = metadata !{i32 786688, metadata !4, metadata !"tail", metadata !5, i32 27, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tail] [line 27]
!21 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"list_pop_tail", metadata !"list_pop_tail", metadata !"", i32 35, metadata !22, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, %struct.DLL* (%struct.DLL*)* @list_pop_tail, null, null, metadata !24, i32 35} ; [ DW_TAG_subprogram ] [line 35] [def] [list_pop_tail]
!22 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !23, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!23 = metadata !{metadata !8, metadata !8}
!24 = metadata !{metadata !25, metadata !26, metadata !27}
!25 = metadata !{i32 786689, metadata !21, metadata !"head", metadata !5, i32 16777251, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [head] [line 35]
!26 = metadata !{i32 786688, metadata !21, metadata !"prev", metadata !5, i32 36, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [prev] [line 36]
!27 = metadata !{i32 786688, metadata !21, metadata !"tail", metadata !5, i32 36, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tail] [line 36]
!28 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"list_push_head", metadata !"list_push_head", metadata !"", i32 46, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (%struct.DLL*, %struct.DLL*)* @list_push_head, null, null, metadata !29, i32 46} ; [ DW_TAG_subprogram ] [line 46] [def] [list_push_head]
!29 = metadata !{metadata !30, metadata !31, metadata !32}
!30 = metadata !{i32 786689, metadata !28, metadata !"head", metadata !5, i32 16777262, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [head] [line 46]
!31 = metadata !{i32 786689, metadata !28, metadata !"item", metadata !5, i32 33554478, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [item] [line 46]
!32 = metadata !{i32 786688, metadata !28, metadata !"next", metadata !5, i32 47, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [next] [line 47]
!33 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"list_pop_head", metadata !"list_pop_head", metadata !"", i32 55, metadata !22, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, %struct.DLL* (%struct.DLL*)* @list_pop_head, null, null, metadata !34, i32 55} ; [ DW_TAG_subprogram ] [line 55] [def] [list_pop_head]
!34 = metadata !{metadata !35, metadata !36}
!35 = metadata !{i32 786689, metadata !33, metadata !"head", metadata !5, i32 16777271, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [head] [line 55]
!36 = metadata !{i32 786688, metadata !33, metadata !"next", metadata !5, i32 56, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [next] [line 56]
!37 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"list_equal", metadata !"list_equal", metadata !"", i32 65, metadata !38, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.DLL*, %struct.DLL*)* @list_equal, null, null, metadata !40, i32 65} ; [ DW_TAG_subprogram ] [line 65] [def] [list_equal]
!38 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !39, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!39 = metadata !{metadata !13, metadata !8, metadata !8}
!40 = metadata !{metadata !41, metadata !42, metadata !43, metadata !44}
!41 = metadata !{i32 786689, metadata !37, metadata !"x", metadata !5, i32 16777281, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 65]
!42 = metadata !{i32 786689, metadata !37, metadata !"y", metadata !5, i32 33554497, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [y] [line 65]
!43 = metadata !{i32 786688, metadata !37, metadata !"xp", metadata !5, i32 66, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [xp] [line 66]
!44 = metadata !{i32 786688, metadata !37, metadata !"yp", metadata !5, i32 66, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [yp] [line 66]
!45 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"list_print", metadata !"list_print", metadata !"", i32 75, metadata !46, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i8*, %struct.DLL*)* @list_print, null, null, metadata !50, i32 75} ; [ DW_TAG_subprogram ] [line 75] [def] [list_print]
!46 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !47, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!47 = metadata !{null, metadata !48, metadata !8}
!48 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !49} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!49 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!50 = metadata !{metadata !51, metadata !52, metadata !53, metadata !54, metadata !55}
!51 = metadata !{i32 786689, metadata !45, metadata !"msg", metadata !5, i32 16777291, metadata !48, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [msg] [line 75]
!52 = metadata !{i32 786689, metadata !45, metadata !"x", metadata !5, i32 33554507, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 75]
!53 = metadata !{i32 786688, metadata !45, metadata !"xp", metadata !5, i32 76, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [xp] [line 76]
!54 = metadata !{i32 786688, metadata !45, metadata !"first", metadata !5, i32 76, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [first] [line 76]
!55 = metadata !{i32 786688, metadata !45, metadata !"i", metadata !5, i32 77, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 77]
!56 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"list_new", metadata !"list_new", metadata !"", i32 88, metadata !57, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, %struct.DLL* ()* @list_new, null, null, metadata !59, i32 88} ; [ DW_TAG_subprogram ] [line 88] [def] [list_new]
!57 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !58, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!58 = metadata !{metadata !8}
!59 = metadata !{metadata !60}
!60 = metadata !{i32 786688, metadata !56, metadata !"l", metadata !5, i32 89, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [l] [line 89]
!61 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"list_sequence", metadata !"list_sequence", metadata !"", i32 97, metadata !62, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, %struct.DLL* (i32, i32)* @list_sequence, null, null, metadata !64, i32 97} ; [ DW_TAG_subprogram ] [line 97] [def] [list_sequence]
!62 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !63, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!63 = metadata !{metadata !8, metadata !13, metadata !13}
!64 = metadata !{metadata !65, metadata !66, metadata !67, metadata !68, metadata !69, metadata !70, metadata !71}
!65 = metadata !{i32 786689, metadata !61, metadata !"from", metadata !5, i32 16777313, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [from] [line 97]
!66 = metadata !{i32 786689, metadata !61, metadata !"to", metadata !5, i32 33554529, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [to] [line 97]
!67 = metadata !{i32 786688, metadata !61, metadata !"size", metadata !5, i32 98, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [size] [line 98]
!68 = metadata !{i32 786688, metadata !61, metadata !"tmp", metadata !5, i32 98, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tmp] [line 98]
!69 = metadata !{i32 786688, metadata !61, metadata !"i", metadata !5, i32 98, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 98]
!70 = metadata !{i32 786688, metadata !61, metadata !"j", metadata !5, i32 98, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 98]
!71 = metadata !{i32 786688, metadata !61, metadata !"l", metadata !5, i32 99, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [l] [line 99]
!72 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"list_copy", metadata !"list_copy", metadata !"", i32 118, metadata !22, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, %struct.DLL* (%struct.DLL*)* @list_copy, null, null, metadata !73, i32 118} ; [ DW_TAG_subprogram ] [line 118] [def] [list_copy]
!73 = metadata !{metadata !74, metadata !75, metadata !76, metadata !77, metadata !78, metadata !79}
!74 = metadata !{i32 786689, metadata !72, metadata !"x", metadata !5, i32 16777334, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 118]
!75 = metadata !{i32 786688, metadata !72, metadata !"i", metadata !5, i32 119, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 119]
!76 = metadata !{i32 786688, metadata !72, metadata !"j", metadata !5, i32 119, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 119]
!77 = metadata !{i32 786688, metadata !72, metadata !"size", metadata !5, i32 119, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [size] [line 119]
!78 = metadata !{i32 786688, metadata !72, metadata !"xp", metadata !5, i32 120, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [xp] [line 120]
!79 = metadata !{i32 786688, metadata !72, metadata !"l", metadata !5, i32 120, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [l] [line 120]
!80 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"list_reverse", metadata !"list_reverse", metadata !"", i32 132, metadata !81, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (%struct.DLL*)* @list_reverse, null, null, metadata !83, i32 132} ; [ DW_TAG_subprogram ] [line 132] [def] [list_reverse]
!81 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !82, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!82 = metadata !{null, metadata !8}
!83 = metadata !{metadata !84, metadata !85, metadata !86}
!84 = metadata !{i32 786689, metadata !80, metadata !"head", metadata !5, i32 16777348, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [head] [line 132]
!85 = metadata !{i32 786688, metadata !80, metadata !"tmp", metadata !5, i32 133, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tmp] [line 133]
!86 = metadata !{i32 786688, metadata !80, metadata !"p", metadata !5, i32 133, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [p] [line 133]
!87 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"test_lists", metadata !"test_lists", metadata !"", i32 142, metadata !88, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 ()* @test_lists, null, null, metadata !90, i32 142} ; [ DW_TAG_subprogram ] [line 142] [def] [test_lists]
!88 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !89, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!89 = metadata !{metadata !13}
!90 = metadata !{metadata !91, metadata !92, metadata !93, metadata !94}
!91 = metadata !{i32 786688, metadata !87, metadata !"len", metadata !5, i32 143, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [len] [line 143]
!92 = metadata !{i32 786688, metadata !87, metadata !"li1", metadata !5, i32 145, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [li1] [line 145]
!93 = metadata !{i32 786688, metadata !87, metadata !"li2", metadata !5, i32 147, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [li2] [line 147]
!94 = metadata !{i32 786688, metadata !87, metadata !"li3", metadata !5, i32 150, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [li3] [line 150]
!95 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 219, metadata !96, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8**)* @main, null, null, metadata !99, i32 219} ; [ DW_TAG_subprogram ] [line 219] [def] [main]
!96 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !97, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!97 = metadata !{metadata !13, metadata !13, metadata !98}
!98 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !48} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!99 = metadata !{metadata !100, metadata !101, metadata !102, metadata !103}
!100 = metadata !{i32 786689, metadata !95, metadata !"argc", metadata !5, i32 16777435, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 219]
!101 = metadata !{i32 786689, metadata !95, metadata !"argv", metadata !5, i32 33554651, metadata !98, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 219]
!102 = metadata !{i32 786688, metadata !95, metadata !"n", metadata !5, i32 225, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 225]
!103 = metadata !{i32 786688, metadata !95, metadata !"result", metadata !5, i32 226, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [result] [line 226]
!104 = metadata !{i32 786478, metadata !105, metadata !106, metadata !"atoi", metadata !"atoi", metadata !"", i32 278, metadata !107, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !111, i32 279} ; [ DW_TAG_subprogram ] [line 278] [def] [scope 279] [atoi]
!105 = metadata !{metadata !"/usr/include/stdlib.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!106 = metadata !{i32 786473, metadata !105}      ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base//usr/include/stdlib.h]
!107 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !108, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!108 = metadata !{metadata !13, metadata !109}
!109 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !110} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!110 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !49} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!111 = metadata !{metadata !112}
!112 = metadata !{i32 786689, metadata !104, metadata !"__nptr", metadata !106, i32 16777494, metadata !109, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [__nptr] [line 278]
!113 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"list_first", metadata !"list_first", metadata !"", i32 23, metadata !22, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !114, i32 23} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [list_first]
!114 = metadata !{metadata !115}
!115 = metadata !{i32 786689, metadata !113, metadata !"head", metadata !5, i32 16777239, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [head] [line 23]
!116 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"list_last", metadata !"list_last", metadata !"", i32 24, metadata !22, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !117, i32 24} ; [ DW_TAG_subprogram ] [line 24] [local] [def] [list_last]
!117 = metadata !{metadata !118}
!118 = metadata !{i32 786689, metadata !116, metadata !"head", metadata !5, i32 16777240, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [head] [line 24]
!119 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"list_length", metadata !"list_length", metadata !"", i32 21, metadata !120, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !122, i32 21} ; [ DW_TAG_subprogram ] [line 21] [local] [def] [list_length]
!120 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !121, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!121 = metadata !{metadata !13, metadata !8}
!122 = metadata !{metadata !123}
!123 = metadata !{i32 786689, metadata !119, metadata !"head", metadata !5, i32 16777237, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [head] [line 21]
!124 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"list_empty", metadata !"list_empty", metadata !"", i32 22, metadata !120, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !125, i32 22} ; [ DW_TAG_subprogram ] [line 22] [local] [def] [list_empty]
!125 = metadata !{metadata !126}
!126 = metadata !{i32 786689, metadata !124, metadata !"head", metadata !5, i32 16777238, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [head] [line 22]
!127 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!128 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!129 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!130 = metadata !{i32 26, i32 0, metadata !4, null}
!131 = metadata !{i32 27, i32 0, metadata !4, null}
!132 = metadata !{metadata !133, metadata !137, i64 16}
!133 = metadata !{metadata !"DLL", metadata !134, i64 0, metadata !137, i64 8, metadata !137, i64 16}
!134 = metadata !{metadata !"int", metadata !135, i64 0}
!135 = metadata !{metadata !"omnipotent char", metadata !136, i64 0}
!136 = metadata !{metadata !"Simple C/C++ TBAA"}
!137 = metadata !{metadata !"any pointer", metadata !135, i64 0}
!138 = metadata !{i32 28, i32 0, metadata !4, null}
!139 = metadata !{metadata !133, metadata !137, i64 8}
!140 = metadata !{i32 29, i32 0, metadata !4, null}
!141 = metadata !{i32 30, i32 0, metadata !4, null}
!142 = metadata !{i32 31, i32 0, metadata !4, null}
!143 = metadata !{i32 32, i32 0, metadata !4, null}
!144 = metadata !{metadata !133, metadata !134, i64 0}
!145 = metadata !{i32 33, i32 0, metadata !4, null}
!146 = metadata !{i32 35, i32 0, metadata !21, null}
!147 = metadata !{i32 22, i32 0, metadata !124, null}
!148 = metadata !{i32 37, i32 0, metadata !149, null}
!149 = metadata !{i32 786443, metadata !1, metadata !21, i32 37, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!150 = metadata !{i32 38, i32 0, metadata !21, null}
!151 = metadata !{i32 39, i32 0, metadata !21, null}
!152 = metadata !{i32 40, i32 0, metadata !21, null}
!153 = metadata !{i32 41, i32 0, metadata !21, null}
!154 = metadata !{i32 42, i32 0, metadata !21, null}
!155 = metadata !{i32 43, i32 0, metadata !21, null}
!156 = metadata !{i32 44, i32 0, metadata !21, null}
!157 = metadata !{i32 46, i32 0, metadata !28, null}
!158 = metadata !{i32 47, i32 0, metadata !28, null}
!159 = metadata !{i32 48, i32 0, metadata !28, null}
!160 = metadata !{i32 49, i32 0, metadata !28, null}
!161 = metadata !{i32 50, i32 0, metadata !28, null}
!162 = metadata !{i32 51, i32 0, metadata !28, null}
!163 = metadata !{i32 52, i32 0, metadata !28, null}
!164 = metadata !{i32 53, i32 0, metadata !28, null}
!165 = metadata !{i32 55, i32 0, metadata !33, null}
!166 = metadata !{i32 57, i32 0, metadata !167, null}
!167 = metadata !{i32 786443, metadata !1, metadata !33, i32 57, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!168 = metadata !{i32 58, i32 0, metadata !33, null} ; [ DW_TAG_imported_module ]
!169 = metadata !{i32 59, i32 0, metadata !33, null}
!170 = metadata !{i32 60, i32 0, metadata !33, null}
!171 = metadata !{i32 61, i32 0, metadata !33, null}
!172 = metadata !{i32 62, i32 0, metadata !33, null}
!173 = metadata !{i32 63, i32 0, metadata !33, null}
!174 = metadata !{i32 65, i32 0, metadata !37, null}
!175 = metadata !{i32 68, i32 0, metadata !176, null}
!176 = metadata !{i32 786443, metadata !1, metadata !37, i32 68, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!177 = metadata !{i32 69, i32 0, metadata !178, null}
!178 = metadata !{i32 786443, metadata !1, metadata !179, i32 69, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!179 = metadata !{i32 786443, metadata !1, metadata !176, i32 68, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!180 = metadata !{i32 71, i32 0, metadata !181, null}
!181 = metadata !{i32 786443, metadata !1, metadata !37, i32 71, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!182 = metadata !{i32 72, i32 0, metadata !37, null}
!183 = metadata !{i32 73, i32 0, metadata !37, null}
!184 = metadata !{i32 75, i32 0, metadata !45, null}
!185 = metadata !{i32 76, i32 0, metadata !45, null}
!186 = metadata !{i32 0}
!187 = metadata !{i32 77, i32 0, metadata !45, null}
!188 = metadata !{i32 78, i32 0, metadata !45, null}
!189 = metadata !{i32 79, i32 0, metadata !45, null}
!190 = metadata !{i32 80, i32 0, metadata !191, null}
!191 = metadata !{i32 786443, metadata !1, metadata !45, i32 80, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!192 = metadata !{i32 81, i32 0, metadata !193, null}
!193 = metadata !{i32 786443, metadata !1, metadata !191, i32 80, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!194 = metadata !{i32 84, i32 0, metadata !45, null}
!195 = metadata !{i32 85, i32 0, metadata !45, null}
!196 = metadata !{i32 86, i32 0, metadata !45, null}
!197 = metadata !{i32 89, i32 0, metadata !56, null}
!198 = metadata !{i32 90, i32 0, metadata !56, null}
!199 = metadata !{i32 91, i32 0, metadata !56, null}
!200 = metadata !{i32 92, i32 0, metadata !56, null}
!201 = metadata !{i32 93, i32 0, metadata !56, null}
!202 = metadata !{i32 97, i32 0, metadata !61, null}
!203 = metadata !{i32 100, i32 0, metadata !204, null}
!204 = metadata !{i32 786443, metadata !1, metadata !61, i32 100, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!205 = metadata !{i32 101, i32 0, metadata !206, null}
!206 = metadata !{i32 786443, metadata !1, metadata !204, i32 100, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!207 = metadata !{i32 103, i32 0, metadata !61, null}
!208 = metadata !{i32 104, i32 0, metadata !61, null}
!209 = metadata !{i32 105, i32 0, metadata !61, null}
!210 = metadata !{i32 106, i32 0, metadata !211, null}
!211 = metadata !{i32 786443, metadata !1, metadata !61, i32 106, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!212 = metadata !{i32 1}
!213 = metadata !{i32 107, i32 0, metadata !214, null}
!214 = metadata !{i32 786443, metadata !1, metadata !211, i32 106, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!215 = metadata !{i32 108, i32 0, metadata !214, null}
!216 = metadata !{i32 109, i32 0, metadata !214, null}
!217 = metadata !{i32 111, i32 0, metadata !61, null}
!218 = metadata !{i32 112, i32 0, metadata !61, null}
!219 = metadata !{i32 113, i32 0, metadata !61, null}
!220 = metadata !{i32 114, i32 0, metadata !61, null}
!221 = metadata !{i32 115, i32 0, metadata !61, null}
!222 = metadata !{i32 116, i32 0, metadata !61, null}
!223 = metadata !{i32 118, i32 0, metadata !72, null}
!224 = metadata !{i32 119, i32 0, metadata !72, null}
!225 = metadata !{i32 120, i32 0, metadata !72, null}
!226 = metadata !{i32 121, i32 0, metadata !227, null}
!227 = metadata !{i32 786443, metadata !1, metadata !72, i32 121, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!228 = metadata !{i32 122, i32 0, metadata !229, null}
!229 = metadata !{i32 786443, metadata !1, metadata !227, i32 121, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!230 = metadata !{i32 123, i32 0, metadata !229, null}
!231 = metadata !{i32 124, i32 0, metadata !229, null}
!232 = metadata !{i32 126, i32 0, metadata !72, null}
!233 = metadata !{i32 127, i32 0, metadata !72, null}
!234 = metadata !{i32 128, i32 0, metadata !72, null}
!235 = metadata !{i32 129, i32 0, metadata !72, null}
!236 = metadata !{i32 132, i32 0, metadata !80, null}
!237 = metadata !{i32 133, i32 0, metadata !80, null}
!238 = metadata !{i32 134, i32 0, metadata !80, null}
!239 = metadata !{i32 135, i32 0, metadata !240, null}
!240 = metadata !{i32 786443, metadata !1, metadata !80, i32 134, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!241 = metadata !{i32 136, i32 0, metadata !240, null}
!242 = metadata !{i32 137, i32 0, metadata !240, null}
!243 = metadata !{i32 138, i32 0, metadata !240, null}
!244 = metadata !{i32 139, i32 0, metadata !240, null}
!245 = metadata !{i32 140, i32 0, metadata !80, null}
!246 = metadata !{i32 143, i32 0, metadata !87, null}
!247 = metadata !{i32 786689, metadata !61, metadata !"from", metadata !5, i32 16777313, metadata !13, i32 0, metadata !248} ; [ DW_TAG_arg_variable ] [from] [line 97]
!248 = metadata !{i32 145, i32 0, metadata !87, null}
!249 = metadata !{i32 97, i32 0, metadata !61, metadata !248}
!250 = metadata !{i32 100}
!251 = metadata !{i32 786689, metadata !61, metadata !"to", metadata !5, i32 33554529, metadata !13, i32 0, metadata !248} ; [ DW_TAG_arg_variable ] [to] [line 97]
!252 = metadata !{i32 786688, metadata !61, metadata !"tmp", metadata !5, i32 98, metadata !13, i32 0, metadata !248} ; [ DW_TAG_auto_variable ] [tmp] [line 98]
!253 = metadata !{i32 101, i32 0, metadata !206, metadata !248}
!254 = metadata !{i32 786688, metadata !61, metadata !"size", metadata !5, i32 98, metadata !13, i32 0, metadata !248} ; [ DW_TAG_auto_variable ] [size] [line 98]
!255 = metadata !{i32 103, i32 0, metadata !61, metadata !248}
!256 = metadata !{i32 104, i32 0, metadata !61, metadata !248}
!257 = metadata !{i32 786688, metadata !61, metadata !"l", metadata !5, i32 99, metadata !8, i32 0, metadata !248} ; [ DW_TAG_auto_variable ] [l] [line 99]
!258 = metadata !{i32 105, i32 0, metadata !61, metadata !248}
!259 = metadata !{i32 786688, metadata !61, metadata !"i", metadata !5, i32 98, metadata !13, i32 0, metadata !248} ; [ DW_TAG_auto_variable ] [i] [line 98]
!260 = metadata !{i32 106, i32 0, metadata !211, metadata !248}
!261 = metadata !{i32 786688, metadata !61, metadata !"j", metadata !5, i32 98, metadata !13, i32 0, metadata !248} ; [ DW_TAG_auto_variable ] [j] [line 98]
!262 = metadata !{i32 107, i32 0, metadata !214, metadata !248}
!263 = metadata !{i32 108, i32 0, metadata !214, metadata !248}
!264 = metadata !{i32 109, i32 0, metadata !214, metadata !248}
!265 = metadata !{i32 111, i32 0, metadata !61, metadata !248}
!266 = metadata !{i32 112, i32 0, metadata !61, metadata !248}
!267 = metadata !{i32 113, i32 0, metadata !61, metadata !248}
!268 = metadata !{i32 114, i32 0, metadata !61, metadata !248}
!269 = metadata !{i32 115, i32 0, metadata !61, metadata !248}
!270 = metadata !{i32 786689, metadata !72, metadata !"x", metadata !5, i32 16777334, metadata !8, i32 0, metadata !271} ; [ DW_TAG_arg_variable ] [x] [line 118]
!271 = metadata !{i32 147, i32 0, metadata !87, null}
!272 = metadata !{i32 118, i32 0, metadata !72, metadata !271}
!273 = metadata !{i32 786688, metadata !72, metadata !"size", metadata !5, i32 119, metadata !13, i32 0, metadata !271} ; [ DW_TAG_auto_variable ] [size] [line 119]
!274 = metadata !{i32 119, i32 0, metadata !72, metadata !271}
!275 = metadata !{i32 120, i32 0, metadata !72, metadata !271}
!276 = metadata !{i32 786688, metadata !72, metadata !"l", metadata !5, i32 120, metadata !8, i32 0, metadata !271} ; [ DW_TAG_auto_variable ] [l] [line 120]
!277 = metadata !{i32 786688, metadata !72, metadata !"i", metadata !5, i32 119, metadata !13, i32 0, metadata !271} ; [ DW_TAG_auto_variable ] [i] [line 119]
!278 = metadata !{i32 121, i32 0, metadata !227, metadata !271}
!279 = metadata !{i32 786688, metadata !72, metadata !"j", metadata !5, i32 119, metadata !13, i32 0, metadata !271} ; [ DW_TAG_auto_variable ] [j] [line 119]
!280 = metadata !{i32 786688, metadata !72, metadata !"xp", metadata !5, i32 120, metadata !8, i32 0, metadata !271} ; [ DW_TAG_auto_variable ] [xp] [line 120]
!281 = metadata !{i32 122, i32 0, metadata !229, metadata !271}
!282 = metadata !{i32 123, i32 0, metadata !229, metadata !271}
!283 = metadata !{i32 124, i32 0, metadata !229, metadata !271}
!284 = metadata !{i32 126, i32 0, metadata !72, metadata !271}
!285 = metadata !{i32 127, i32 0, metadata !72, metadata !271}
!286 = metadata !{i32 128, i32 0, metadata !72, metadata !271}
!287 = metadata !{i32 89, i32 0, metadata !56, metadata !288}
!288 = metadata !{i32 150, i32 0, metadata !87, null}
!289 = metadata !{i32 786688, metadata !56, metadata !"l", metadata !5, i32 89, metadata !8, i32 0, metadata !288} ; [ DW_TAG_auto_variable ] [l] [line 89]
!290 = metadata !{i32 90, i32 0, metadata !56, metadata !288}
!291 = metadata !{i32 91, i32 0, metadata !56, metadata !288}
!292 = metadata !{i32 92, i32 0, metadata !56, metadata !288}
!293 = metadata !{i32 786689, metadata !37, metadata !"x", metadata !5, i32 16777281, metadata !8, i32 0, metadata !294} ; [ DW_TAG_arg_variable ] [x] [line 65]
!294 = metadata !{i32 152, i32 0, metadata !295, null}
!295 = metadata !{i32 786443, metadata !1, metadata !87, i32 152, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!296 = metadata !{i32 65, i32 0, metadata !37, metadata !294}
!297 = metadata !{i32 786689, metadata !37, metadata !"y", metadata !5, i32 33554497, metadata !8, i32 0, metadata !294} ; [ DW_TAG_arg_variable ] [y] [line 65]
!298 = metadata !{i32 786688, metadata !37, metadata !"xp", metadata !5, i32 66, metadata !8, i32 0, metadata !294} ; [ DW_TAG_auto_variable ] [xp] [line 66]
!299 = metadata !{i32 68, i32 0, metadata !176, metadata !294}
!300 = metadata !{i32 786688, metadata !37, metadata !"yp", metadata !5, i32 66, metadata !8, i32 0, metadata !294} ; [ DW_TAG_auto_variable ] [yp] [line 66]
!301 = metadata !{i32 69, i32 0, metadata !178, metadata !294}
!302 = metadata !{i32 71, i32 0, metadata !181, metadata !294}
!303 = metadata !{i32 72, i32 0, metadata !37, metadata !294}
!304 = metadata !{i32 156, i32 0, metadata !87, null}
!305 = metadata !{i32 153, i32 0, metadata !306, null}
!306 = metadata !{i32 786443, metadata !1, metadata !295, i32 152, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!307 = metadata !{i32 154, i32 0, metadata !306, null}
!308 = metadata !{i32 32, i32 0, metadata !4, metadata !309}
!309 = metadata !{i32 157, i32 0, metadata !310, null}
!310 = metadata !{i32 786443, metadata !1, metadata !87, i32 156, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!311 = metadata !{i32 166, i32 0, metadata !87, null}
!312 = metadata !{i32 786689, metadata !33, metadata !"head", metadata !5, i32 16777271, metadata !8, i32 0, metadata !309} ; [ DW_TAG_arg_variable ] [head] [line 55]
!313 = metadata !{i32 55, i32 0, metadata !33, metadata !309}
!314 = metadata !{i32 786688, metadata !33, metadata !"next", metadata !5, i32 56, metadata !8, i32 0, metadata !309} ; [ DW_TAG_auto_variable ] [next] [line 56]
!315 = metadata !{i32 58, i32 0, metadata !33, metadata !309} ; [ DW_TAG_imported_module ]
!316 = metadata !{i32 59, i32 0, metadata !33, metadata !309}
!317 = metadata !{i32 60, i32 0, metadata !33, metadata !309}
!318 = metadata !{i32 61, i32 0, metadata !33, metadata !309}
!319 = metadata !{i32 786689, metadata !4, metadata !"head", metadata !5, i32 16777242, metadata !8, i32 0, metadata !309} ; [ DW_TAG_arg_variable ] [head] [line 26]
!320 = metadata !{i32 26, i32 0, metadata !4, metadata !309}
!321 = metadata !{i32 786689, metadata !4, metadata !"item", metadata !5, i32 33554458, metadata !8, i32 0, metadata !309} ; [ DW_TAG_arg_variable ] [item] [line 26]
!322 = metadata !{i32 27, i32 0, metadata !4, metadata !309}
!323 = metadata !{i32 786688, metadata !4, metadata !"tail", metadata !5, i32 27, metadata !8, i32 0, metadata !309} ; [ DW_TAG_auto_variable ] [tail] [line 27]
!324 = metadata !{i32 28, i32 0, metadata !4, metadata !309}
!325 = metadata !{i32 29, i32 0, metadata !4, metadata !309}
!326 = metadata !{i32 30, i32 0, metadata !4, metadata !309}
!327 = metadata !{i32 31, i32 0, metadata !4, metadata !309}
!328 = metadata !{i32 32, i32 0, metadata !4, metadata !329}
!329 = metadata !{i32 167, i32 0, metadata !330, null}
!330 = metadata !{i32 786443, metadata !1, metadata !87, i32 166, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!331 = metadata !{i32 135, i32 0, metadata !240, metadata !332}
!332 = metadata !{i32 175, i32 0, metadata !87, null}
!333 = metadata !{i32 786689, metadata !21, metadata !"head", metadata !5, i32 16777251, metadata !8, i32 0, metadata !329} ; [ DW_TAG_arg_variable ] [head] [line 35]
!334 = metadata !{i32 35, i32 0, metadata !21, metadata !329}
!335 = metadata !{i32 38, i32 0, metadata !21, metadata !329}
!336 = metadata !{i32 786688, metadata !21, metadata !"tail", metadata !5, i32 36, metadata !8, i32 0, metadata !329} ; [ DW_TAG_auto_variable ] [tail] [line 36]
!337 = metadata !{i32 39, i32 0, metadata !21, metadata !329}
!338 = metadata !{i32 786688, metadata !21, metadata !"prev", metadata !5, i32 36, metadata !8, i32 0, metadata !329} ; [ DW_TAG_auto_variable ] [prev] [line 36]
!339 = metadata !{i32 40, i32 0, metadata !21, metadata !329}
!340 = metadata !{i32 41, i32 0, metadata !21, metadata !329}
!341 = metadata !{i32 42, i32 0, metadata !21, metadata !329}
!342 = metadata !{i32 786689, metadata !4, metadata !"head", metadata !5, i32 16777242, metadata !8, i32 0, metadata !329} ; [ DW_TAG_arg_variable ] [head] [line 26]
!343 = metadata !{i32 26, i32 0, metadata !4, metadata !329}
!344 = metadata !{i32 786689, metadata !4, metadata !"item", metadata !5, i32 33554458, metadata !8, i32 0, metadata !329} ; [ DW_TAG_arg_variable ] [item] [line 26]
!345 = metadata !{i32 27, i32 0, metadata !4, metadata !329}
!346 = metadata !{i32 786688, metadata !4, metadata !"tail", metadata !5, i32 27, metadata !8, i32 0, metadata !329} ; [ DW_TAG_auto_variable ] [tail] [line 27]
!347 = metadata !{i32 28, i32 0, metadata !4, metadata !329}
!348 = metadata !{i32 29, i32 0, metadata !4, metadata !329}
!349 = metadata !{i32 30, i32 0, metadata !4, metadata !329}
!350 = metadata !{i32 31, i32 0, metadata !4, metadata !329}
!351 = metadata !{i32 786688, metadata !80, metadata !"tmp", metadata !5, i32 133, metadata !8, i32 0, metadata !332} ; [ DW_TAG_auto_variable ] [tmp] [line 133]
!352 = metadata !{i32 136, i32 0, metadata !240, metadata !332}
!353 = metadata !{i32 137, i32 0, metadata !240, metadata !332}
!354 = metadata !{i32 786688, metadata !80, metadata !"p", metadata !5, i32 133, metadata !8, i32 0, metadata !332} ; [ DW_TAG_auto_variable ] [p] [line 133]
!355 = metadata !{i32 138, i32 0, metadata !240, metadata !332}
!356 = metadata !{i32 139, i32 0, metadata !240, metadata !332}
!357 = metadata !{i32 177, i32 0, metadata !358, null}
!358 = metadata !{i32 786443, metadata !1, metadata !87, i32 177, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!359 = metadata !{i32 178, i32 0, metadata !360, null}
!360 = metadata !{i32 786443, metadata !1, metadata !358, i32 177, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!361 = metadata !{i32 180, i32 0, metadata !360, null}
!362 = metadata !{i32 183, i32 0, metadata !363, null}
!363 = metadata !{i32 786443, metadata !1, metadata !87, i32 183, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!364 = metadata !{i32 184, i32 0, metadata !365, null}
!365 = metadata !{i32 786443, metadata !1, metadata !363, i32 183, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!366 = metadata !{i32 186, i32 0, metadata !365, null}
!367 = metadata !{i32 189, i32 0, metadata !368, null}
!368 = metadata !{i32 786443, metadata !1, metadata !87, i32 189, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!369 = metadata !{i32 190, i32 0, metadata !370, null}
!370 = metadata !{i32 786443, metadata !1, metadata !368, i32 189, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!371 = metadata !{i32 192, i32 0, metadata !370, null}
!372 = metadata !{i32 195, i32 0, metadata !373, null}
!373 = metadata !{i32 786443, metadata !1, metadata !87, i32 195, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!374 = metadata !{i32 196, i32 0, metadata !375, null}
!375 = metadata !{i32 786443, metadata !1, metadata !373, i32 195, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!376 = metadata !{i32 198, i32 0, metadata !375, null}
!377 = metadata !{i32 786689, metadata !37, metadata !"x", metadata !5, i32 16777281, metadata !8, i32 0, metadata !378} ; [ DW_TAG_arg_variable ] [x] [line 65]
!378 = metadata !{i32 207, i32 0, metadata !379, null}
!379 = metadata !{i32 786443, metadata !1, metadata !87, i32 207, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!380 = metadata !{i32 65, i32 0, metadata !37, metadata !378}
!381 = metadata !{i32 786689, metadata !37, metadata !"y", metadata !5, i32 33554497, metadata !8, i32 0, metadata !378} ; [ DW_TAG_arg_variable ] [y] [line 65]
!382 = metadata !{i32 786688, metadata !37, metadata !"xp", metadata !5, i32 66, metadata !8, i32 0, metadata !378} ; [ DW_TAG_auto_variable ] [xp] [line 66]
!383 = metadata !{i32 68, i32 0, metadata !176, metadata !378}
!384 = metadata !{i32 786688, metadata !37, metadata !"yp", metadata !5, i32 66, metadata !8, i32 0, metadata !378} ; [ DW_TAG_auto_variable ] [yp] [line 66]
!385 = metadata !{i32 69, i32 0, metadata !178, metadata !378}
!386 = metadata !{i32 71, i32 0, metadata !181, metadata !378}
!387 = metadata !{i32 72, i32 0, metadata !37, metadata !378}
!388 = metadata !{i32 208, i32 0, metadata !389, null}
!389 = metadata !{i32 786443, metadata !1, metadata !379, i32 207, i32 0, i32 34} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!390 = metadata !{i32 209, i32 0, metadata !389, null}
!391 = metadata !{i32 211, i32 0, metadata !87, null}
!392 = metadata !{i32 212, i32 0, metadata !87, null}
!393 = metadata !{i32 213, i32 0, metadata !87, null}
!394 = metadata !{i32 214, i32 0, metadata !87, null}
!395 = metadata !{i32 216, i32 0, metadata !87, null}
!396 = metadata !{i32 219, i32 0, metadata !95, null}
!397 = metadata !{i32 225, i32 0, metadata !95, null}
!398 = metadata !{i32 225, i32 26, metadata !95, null}
!399 = metadata !{metadata !137, metadata !137, i64 0}
!400 = metadata !{i32 786689, metadata !104, metadata !"__nptr", metadata !106, i32 16777494, metadata !109, i32 0, metadata !398} ; [ DW_TAG_arg_variable ] [__nptr] [line 278]
!401 = metadata !{i32 278, i32 0, metadata !104, metadata !398}
!402 = metadata !{i32 280, i32 0, metadata !403, metadata !398}
!403 = metadata !{i32 786443, metadata !105, metadata !104} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base//usr/include/stdlib.h]
!404 = metadata !{i32 227, i32 0, metadata !95, null}
!405 = metadata !{i32 228, i32 0, metadata !95, null}
!406 = metadata !{i32 229, i32 0, metadata !95, null}
