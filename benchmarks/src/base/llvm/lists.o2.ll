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
@.str10 = private unnamed_addr constant [35 x i8] c"li1 size wrong, wanted %d, got %d\0A\00", align 1
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
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %head}, i64 0, metadata !147), !dbg !150
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %head}, i64 0, metadata !151), !dbg !152
  %1 = getelementptr inbounds %struct.DLL* %head, i64 0, i32 0, !dbg !152
  %2 = load i32* %1, align 4, !dbg !152, !tbaa !144
  %3 = icmp eq i32 %2, 0, !dbg !150
  br i1 %3, label %11, label %4, !dbg !148

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds %struct.DLL* %head, i64 0, i32 2, !dbg !153
  %6 = load %struct.DLL** %5, align 8, !dbg !153, !tbaa !132
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %6}, i64 0, metadata !27), !dbg !153
  %7 = getelementptr inbounds %struct.DLL* %6, i64 0, i32 2, !dbg !154
  %8 = load %struct.DLL** %7, align 8, !dbg !154, !tbaa !132
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %8}, i64 0, metadata !26), !dbg !154
  %9 = getelementptr inbounds %struct.DLL* %8, i64 0, i32 1, !dbg !155
  store %struct.DLL* %head, %struct.DLL** %9, align 8, !dbg !155, !tbaa !139
  store %struct.DLL* %8, %struct.DLL** %5, align 8, !dbg !156, !tbaa !132
  %10 = add nsw i32 %2, -1, !dbg !157
  store i32 %10, i32* %1, align 4, !dbg !157, !tbaa !144
  br label %11, !dbg !158

; <label>:11                                      ; preds = %0, %4
  %.0 = phi %struct.DLL* [ %6, %4 ], [ null, %0 ]
  ret %struct.DLL* %.0, !dbg !159
}

; Function Attrs: nounwind uwtable
define void @list_push_head(%struct.DLL* %head, %struct.DLL* %item) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %head}, i64 0, metadata !30), !dbg !160
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %item}, i64 0, metadata !31), !dbg !160
  %1 = getelementptr inbounds %struct.DLL* %head, i64 0, i32 1, !dbg !161
  %2 = load %struct.DLL** %1, align 8, !dbg !161, !tbaa !139
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %2}, i64 0, metadata !32), !dbg !161
  store %struct.DLL* %item, %struct.DLL** %1, align 8, !dbg !162, !tbaa !139
  %3 = getelementptr inbounds %struct.DLL* %2, i64 0, i32 2, !dbg !163
  store %struct.DLL* %item, %struct.DLL** %3, align 8, !dbg !163, !tbaa !132
  %4 = getelementptr inbounds %struct.DLL* %item, i64 0, i32 1, !dbg !164
  store %struct.DLL* %2, %struct.DLL** %4, align 8, !dbg !164, !tbaa !139
  %5 = getelementptr inbounds %struct.DLL* %item, i64 0, i32 2, !dbg !165
  store %struct.DLL* %head, %struct.DLL** %5, align 8, !dbg !165, !tbaa !132
  %6 = getelementptr inbounds %struct.DLL* %head, i64 0, i32 0, !dbg !166
  %7 = load i32* %6, align 4, !dbg !166, !tbaa !144
  %8 = add nsw i32 %7, 1, !dbg !166
  store i32 %8, i32* %6, align 4, !dbg !166, !tbaa !144
  ret void, !dbg !167
}

; Function Attrs: nounwind uwtable
define %struct.DLL* @list_pop_head(%struct.DLL* %head) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %head}, i64 0, metadata !35), !dbg !168
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %head}, i64 0, metadata !169), !dbg !172
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %head}, i64 0, metadata !173), !dbg !174
  %1 = getelementptr inbounds %struct.DLL* %head, i64 0, i32 0, !dbg !174
  %2 = load i32* %1, align 4, !dbg !174, !tbaa !144
  %3 = icmp eq i32 %2, 0, !dbg !172
  br i1 %3, label %12, label %4, !dbg !170

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds %struct.DLL* %head, i64 0, i32 1, !dbg !175
  %6 = load %struct.DLL** %5, align 8, !dbg !175, !tbaa !139
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %6}, i64 0, metadata !36), !dbg !175
  %7 = getelementptr inbounds %struct.DLL* %6, i64 0, i32 1, !dbg !176
  %8 = load %struct.DLL** %7, align 8, !dbg !176, !tbaa !139
  store %struct.DLL* %8, %struct.DLL** %5, align 8, !dbg !176, !tbaa !139
  %9 = load %struct.DLL** %7, align 8, !dbg !177, !tbaa !139
  %10 = getelementptr inbounds %struct.DLL* %9, i64 0, i32 2, !dbg !177
  store %struct.DLL* %head, %struct.DLL** %10, align 8, !dbg !177, !tbaa !132
  %11 = add nsw i32 %2, -1, !dbg !178
  store i32 %11, i32* %1, align 4, !dbg !178, !tbaa !144
  br label %12, !dbg !179

; <label>:12                                      ; preds = %0, %4
  %.0 = phi %struct.DLL* [ %6, %4 ], [ null, %0 ]
  ret %struct.DLL* %.0, !dbg !180
}

; Function Attrs: nounwind readonly uwtable
define i32 @list_equal(%struct.DLL* readonly %x, %struct.DLL* readonly %y) #1 {
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %x}, i64 0, metadata !41), !dbg !181
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %y}, i64 0, metadata !42), !dbg !181
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %x}, i64 0, metadata !43), !dbg !182
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %y}, i64 0, metadata !44), !dbg !182
  %1 = getelementptr inbounds %struct.DLL* %x, i64 0, i32 1, !dbg !182
  %2 = load %struct.DLL** %1, align 8, !dbg !182, !tbaa !139
  %3 = icmp eq %struct.DLL* %2, %x, !dbg !182
  %4 = getelementptr inbounds %struct.DLL* %x, i64 0, i32 0, !dbg !184
  %5 = load i32* %4, align 4, !dbg !184, !tbaa !144
  %6 = getelementptr inbounds %struct.DLL* %y, i64 0, i32 0, !dbg !184
  %7 = load i32* %6, align 4, !dbg !184, !tbaa !144
  %8 = icmp ne i32 %5, %7, !dbg !184
  br i1 %3, label %._crit_edge, label %.lr.ph, !dbg !182

.lr.ph:                                           ; preds = %0, %11
  %9 = phi i1 [ %21, %11 ], [ %8, %0 ]
  %10 = phi %struct.DLL* [ %15, %11 ], [ %2, %0 ]
  %yp.03 = phi %struct.DLL* [ %13, %11 ], [ %y, %0 ]
  br i1 %9, label %.loopexit, label %11, !dbg !184

; <label>:11                                      ; preds = %.lr.ph
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %10}, i64 0, metadata !43), !dbg !182
  %12 = getelementptr inbounds %struct.DLL* %yp.03, i64 0, i32 1, !dbg !182
  %13 = load %struct.DLL** %12, align 8, !dbg !182, !tbaa !139
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %13}, i64 0, metadata !44), !dbg !182
  %14 = getelementptr inbounds %struct.DLL* %10, i64 0, i32 1, !dbg !182
  %15 = load %struct.DLL** %14, align 8, !dbg !182, !tbaa !139
  %16 = icmp eq %struct.DLL* %15, %x, !dbg !182
  %17 = getelementptr inbounds %struct.DLL* %10, i64 0, i32 0, !dbg !184
  %18 = load i32* %17, align 4, !dbg !184, !tbaa !144
  %19 = getelementptr inbounds %struct.DLL* %13, i64 0, i32 0, !dbg !184
  %20 = load i32* %19, align 4, !dbg !184, !tbaa !144
  %21 = icmp ne i32 %18, %20, !dbg !184
  br i1 %16, label %._crit_edge, label %.lr.ph, !dbg !182

._crit_edge:                                      ; preds = %11, %0
  %.lcssa = phi i1 [ %8, %0 ], [ %21, %11 ]
  %yp.0.lcssa = phi %struct.DLL* [ %y, %0 ], [ %13, %11 ]
  br i1 %.lcssa, label %.loopexit, label %22, !dbg !187

; <label>:22                                      ; preds = %._crit_edge
  %23 = getelementptr inbounds %struct.DLL* %yp.0.lcssa, i64 0, i32 1, !dbg !189
  %24 = load %struct.DLL** %23, align 8, !dbg !189, !tbaa !139
  %25 = icmp eq %struct.DLL* %24, %y, !dbg !189
  %26 = zext i1 %25 to i32, !dbg !189
  br label %.loopexit, !dbg !189

.loopexit:                                        ; preds = %.lr.ph, %._crit_edge, %22
  %.0 = phi i32 [ %26, %22 ], [ 0, %._crit_edge ], [ 0, %.lr.ph ]
  ret i32 %.0, !dbg !190
}

; Function Attrs: nounwind uwtable
define void @list_print(i8* nocapture readonly %msg, %struct.DLL* nocapture readonly %x) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %msg}, i64 0, metadata !51), !dbg !191
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %x}, i64 0, metadata !52), !dbg !191
  %1 = getelementptr inbounds %struct.DLL* %x, i64 0, i32 1, !dbg !192
  %2 = load %struct.DLL** %1, align 8, !dbg !192, !tbaa !139
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %2}, i64 0, metadata !54), !dbg !192
  tail call void @llvm.dbg.value(metadata !193, i64 0, metadata !55), !dbg !194
  %3 = tail call i32 @puts(i8* %msg) #5, !dbg !195
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %x}, i64 0, metadata !196), !dbg !198
  %4 = getelementptr inbounds %struct.DLL* %x, i64 0, i32 0, !dbg !198
  %5 = load i32* %4, align 4, !dbg !198, !tbaa !144
  %6 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i32 %5) #5, !dbg !197
  %xp.01 = load %struct.DLL** %1, align 8, !dbg !199
  %7 = getelementptr inbounds %struct.DLL* %xp.01, i64 0, i32 1, !dbg !199
  %8 = load %struct.DLL** %7, align 8, !dbg !199, !tbaa !139
  %9 = icmp eq %struct.DLL* %8, %2, !dbg !199
  br i1 %9, label %._crit_edge, label %.lr.ph, !dbg !199

.lr.ph:                                           ; preds = %0, %.lr.ph
  %10 = phi %struct.DLL* [ %23, %.lr.ph ], [ %8, %0 ]
  %11 = phi %struct.DLL** [ %22, %.lr.ph ], [ %7, %0 ]
  %xp.03 = phi %struct.DLL* [ %xp.0, %.lr.ph ], [ %xp.01, %0 ]
  %i.02 = phi i32 [ %12, %.lr.ph ], [ 0, %0 ]
  %12 = add nsw i32 %i.02, 1, !dbg !201
  tail call void @llvm.dbg.value(metadata !{i32 %12}, i64 0, metadata !55), !dbg !201
  %13 = getelementptr inbounds %struct.DLL* %xp.03, i64 0, i32 0, !dbg !201
  %14 = load i32* %13, align 4, !dbg !201, !tbaa !144
  %15 = getelementptr inbounds %struct.DLL* %10, i64 0, i32 0, !dbg !201
  %16 = load i32* %15, align 4, !dbg !201, !tbaa !144
  %17 = getelementptr inbounds %struct.DLL* %xp.03, i64 0, i32 2, !dbg !201
  %18 = load %struct.DLL** %17, align 8, !dbg !201, !tbaa !132
  %19 = getelementptr inbounds %struct.DLL* %18, i64 0, i32 0, !dbg !201
  %20 = load i32* %19, align 4, !dbg !201, !tbaa !144
  %21 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str1, i64 0, i64 0), i32 %12, i32 %14, i32 %16, i32 %20) #5, !dbg !201
  %xp.0 = load %struct.DLL** %11, align 8, !dbg !199
  %22 = getelementptr inbounds %struct.DLL* %xp.0, i64 0, i32 1, !dbg !199
  %23 = load %struct.DLL** %22, align 8, !dbg !199, !tbaa !139
  %24 = icmp eq %struct.DLL* %23, %2, !dbg !199
  br i1 %24, label %._crit_edge, label %.lr.ph, !dbg !199

._crit_edge:                                      ; preds = %.lr.ph, %0
  %.lcssa = phi %struct.DLL** [ %7, %0 ], [ %22, %.lr.ph ]
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([33 x i8]* @str, i64 0, i64 0)) #5, !dbg !203
  %25 = load %struct.DLL** %.lcssa, align 8, !dbg !204, !tbaa !139
  %26 = getelementptr inbounds %struct.DLL* %25, i64 0, i32 0, !dbg !204
  %27 = load i32* %26, align 4, !dbg !204, !tbaa !144
  %28 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str3, i64 0, i64 0), i32 %27) #5, !dbg !204
  ret void, !dbg !205
}

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #2

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind uwtable
define %struct.DLL* @list_new() #0 {
  %1 = tail call noalias i8* @malloc(i64 24) #5, !dbg !206
  %2 = bitcast i8* %1 to %struct.DLL*, !dbg !206
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %2}, i64 0, metadata !60), !dbg !206
  %3 = getelementptr inbounds i8* %1, i64 8, !dbg !207
  %4 = bitcast i8* %3 to %struct.DLL**, !dbg !207
  store %struct.DLL* %2, %struct.DLL** %4, align 8, !dbg !207, !tbaa !139
  %5 = getelementptr inbounds i8* %1, i64 16, !dbg !208
  %6 = bitcast i8* %5 to %struct.DLL**, !dbg !208
  store %struct.DLL* %2, %struct.DLL** %6, align 8, !dbg !208, !tbaa !132
  %7 = bitcast i8* %1 to i32*, !dbg !209
  store i32 0, i32* %7, align 4, !dbg !209, !tbaa !144
  ret %struct.DLL* %2, !dbg !210
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind uwtable
define %struct.DLL* @list_sequence(i32 %from, i32 %to) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %from}, i64 0, metadata !65), !dbg !211
  tail call void @llvm.dbg.value(metadata !{i32 %to}, i64 0, metadata !66), !dbg !211
  %1 = icmp sgt i32 %from, %to, !dbg !212
  tail call void @llvm.dbg.value(metadata !{i32 %from}, i64 0, metadata !68), !dbg !214
  tail call void @llvm.dbg.value(metadata !{i32 %to}, i64 0, metadata !65), !dbg !214
  tail call void @llvm.dbg.value(metadata !{i32 %from}, i64 0, metadata !66), !dbg !214
  %from.to = select i1 %1, i32 %from, i32 %to, !dbg !212
  %to.from = select i1 %1, i32 %to, i32 %from, !dbg !212
  %2 = sub nsw i32 %from.to, %to.from, !dbg !216
  %3 = add nsw i32 %2, 1, !dbg !216
  tail call void @llvm.dbg.value(metadata !{i32 %3}, i64 0, metadata !67), !dbg !216
  %4 = add nsw i32 %2, 2, !dbg !217
  %5 = sext i32 %4 to i64, !dbg !217
  %6 = mul i64 %5, 24, !dbg !217
  %7 = tail call noalias i8* @malloc(i64 %6) #5, !dbg !217
  %8 = bitcast i8* %7 to %struct.DLL*, !dbg !217
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %8}, i64 0, metadata !71), !dbg !217
  %9 = add nsw i32 %to.from, -1, !dbg !218
  tail call void @llvm.dbg.value(metadata !{i32 %9}, i64 0, metadata !65), !dbg !218
  tail call void @llvm.dbg.value(metadata !193, i64 0, metadata !69), !dbg !219
  tail call void @llvm.dbg.value(metadata !221, i64 0, metadata !70), !dbg !219
  %10 = icmp sgt i32 %2, -1, !dbg !219
  br i1 %10, label %.lr.ph, label %30, !dbg !219

.lr.ph:                                           ; preds = %0
  %11 = icmp sgt i32 %to, %from
  %smax = select i1 %11, i32 %to, i32 %from
  %12 = xor i32 %to, -1, !dbg !219
  %13 = xor i32 %from, -1, !dbg !219
  %14 = icmp sgt i32 %12, %13
  %smax7 = select i1 %14, i32 %12, i32 %13
  %15 = add i32 %smax, %smax7, !dbg !219
  %16 = add i32 %15, 2, !dbg !219
  %17 = icmp sgt i32 %16, 1
  %.op = add i32 %smax, %smax7, !dbg !219
  %18 = select i1 %17, i32 %.op, i32 -1, !dbg !219
  br label %19, !dbg !219

; <label>:19                                      ; preds = %.lr.ph, %19
  %indvars.iv5 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next6, %19 ]
  %indvars.iv = phi i64 [ 1, %.lr.ph ], [ %indvars.iv.next, %19 ]
  %.14 = phi i32 [ %9, %.lr.ph ], [ %25, %19 ]
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1, !dbg !219
  %20 = getelementptr inbounds %struct.DLL* %8, i64 %indvars.iv.next6, !dbg !222
  %21 = getelementptr inbounds %struct.DLL* %8, i64 %indvars.iv5, i32 1, !dbg !222
  store %struct.DLL* %20, %struct.DLL** %21, align 8, !dbg !222, !tbaa !139
  %22 = add nsw i64 %indvars.iv, -1, !dbg !224
  %23 = getelementptr inbounds %struct.DLL* %8, i64 %22, !dbg !224
  %24 = getelementptr inbounds %struct.DLL* %8, i64 %indvars.iv, i32 2, !dbg !224
  store %struct.DLL* %23, %struct.DLL** %24, align 8, !dbg !224, !tbaa !132
  %25 = add nsw i32 %.14, 1, !dbg !225
  tail call void @llvm.dbg.value(metadata !{i32 %29}, i64 0, metadata !65), !dbg !225
  %26 = getelementptr inbounds %struct.DLL* %8, i64 %indvars.iv5, i32 0, !dbg !225
  store i32 %.14, i32* %26, align 4, !dbg !225, !tbaa !144
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !219
  %27 = trunc i64 %indvars.iv.next6 to i32, !dbg !219
  %28 = icmp slt i32 %27, %3, !dbg !219
  br i1 %28, label %19, label %._crit_edge, !dbg !219

._crit_edge:                                      ; preds = %19
  %29 = sub i32 %18, %smax7, !dbg !219
  br label %30, !dbg !219

; <label>:30                                      ; preds = %._crit_edge, %0
  %.1.lcssa = phi i32 [ %29, %._crit_edge ], [ %9, %0 ]
  %31 = sext i32 %3 to i64, !dbg !226
  %32 = getelementptr inbounds %struct.DLL* %8, i64 %31, !dbg !226
  %33 = getelementptr inbounds i8* %7, i64 16, !dbg !226
  %34 = bitcast i8* %33 to %struct.DLL**, !dbg !226
  store %struct.DLL* %32, %struct.DLL** %34, align 8, !dbg !226, !tbaa !132
  %35 = getelementptr inbounds %struct.DLL* %8, i64 %31, i32 1, !dbg !227
  store %struct.DLL* %8, %struct.DLL** %35, align 8, !dbg !227, !tbaa !139
  %36 = sext i32 %2 to i64, !dbg !228
  %37 = getelementptr inbounds %struct.DLL* %8, i64 %36, !dbg !228
  %38 = getelementptr inbounds %struct.DLL* %8, i64 %31, i32 2, !dbg !228
  store %struct.DLL* %37, %struct.DLL** %38, align 8, !dbg !228, !tbaa !132
  %39 = getelementptr inbounds %struct.DLL* %32, i64 0, i32 0, !dbg !229
  store i32 %.1.lcssa, i32* %39, align 4, !dbg !229, !tbaa !144
  %40 = bitcast i8* %7 to i32*, !dbg !230
  store i32 %3, i32* %40, align 4, !dbg !230, !tbaa !144
  ret %struct.DLL* %8, !dbg !231
}

; Function Attrs: nounwind uwtable
define %struct.DLL* @list_copy(%struct.DLL* nocapture readonly %x) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %x}, i64 0, metadata !74), !dbg !232
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %x}, i64 0, metadata !233), !dbg !235
  %1 = getelementptr inbounds %struct.DLL* %x, i64 0, i32 0, !dbg !235
  %2 = load i32* %1, align 4, !dbg !235, !tbaa !144
  tail call void @llvm.dbg.value(metadata !{i32 %2}, i64 0, metadata !77), !dbg !234
  %3 = add nsw i32 %2, 1, !dbg !236
  %4 = sext i32 %3 to i64, !dbg !236
  %5 = mul i64 %4, 24, !dbg !236
  %6 = tail call noalias i8* @malloc(i64 %5) #5, !dbg !236
  %7 = bitcast i8* %6 to %struct.DLL*, !dbg !236
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %7}, i64 0, metadata !79), !dbg !236
  tail call void @llvm.dbg.value(metadata !193, i64 0, metadata !75), !dbg !237
  tail call void @llvm.dbg.value(metadata !221, i64 0, metadata !76), !dbg !237
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %x}, i64 0, metadata !78), !dbg !237
  %8 = icmp sgt i32 %2, 0, !dbg !237
  br i1 %8, label %.lr.ph, label %._crit_edge, !dbg !237

.lr.ph:                                           ; preds = %0, %._crit_edge6
  %9 = phi i32 [ %.pre, %._crit_edge6 ], [ %2, %0 ]
  %indvars.iv4 = phi i64 [ %indvars.iv.next5, %._crit_edge6 ], [ 1, %0 ]
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge6 ], [ 0, %0 ]
  %xp.02 = phi %struct.DLL* [ %16, %._crit_edge6 ], [ %x, %0 ]
  %10 = getelementptr inbounds %struct.DLL* %7, i64 %indvars.iv4, !dbg !239
  %11 = getelementptr inbounds %struct.DLL* %7, i64 %indvars.iv, !dbg !239
  %12 = getelementptr inbounds %struct.DLL* %7, i64 %indvars.iv, i32 1, !dbg !239
  store %struct.DLL* %10, %struct.DLL** %12, align 8, !dbg !239, !tbaa !139
  %13 = getelementptr inbounds %struct.DLL* %7, i64 %indvars.iv4, i32 2, !dbg !241
  store %struct.DLL* %11, %struct.DLL** %13, align 8, !dbg !241, !tbaa !132
  %14 = getelementptr inbounds %struct.DLL* %11, i64 0, i32 0, !dbg !242
  store i32 %9, i32* %14, align 4, !dbg !242, !tbaa !144
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !237
  %15 = getelementptr inbounds %struct.DLL* %xp.02, i64 0, i32 1, !dbg !237
  %16 = load %struct.DLL** %15, align 8, !dbg !237, !tbaa !139
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %16}, i64 0, metadata !78), !dbg !237
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !237
  %exitcond = icmp eq i32 %lftr.wideiv, %2, !dbg !237
  br i1 %exitcond, label %._crit_edge, label %._crit_edge6, !dbg !237

._crit_edge6:                                     ; preds = %.lr.ph
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1, !dbg !237
  %.phi.trans.insert = getelementptr inbounds %struct.DLL* %16, i64 0, i32 0
  %.pre = load i32* %.phi.trans.insert, align 4, !dbg !242, !tbaa !144
  br label %.lr.ph, !dbg !237

._crit_edge:                                      ; preds = %.lr.ph, %0
  %17 = sext i32 %2 to i64, !dbg !243
  %18 = getelementptr inbounds %struct.DLL* %7, i64 %17, !dbg !243
  %19 = getelementptr inbounds i8* %6, i64 16, !dbg !243
  %20 = bitcast i8* %19 to %struct.DLL**, !dbg !243
  store %struct.DLL* %18, %struct.DLL** %20, align 8, !dbg !243, !tbaa !132
  %21 = getelementptr inbounds %struct.DLL* %7, i64 %17, i32 1, !dbg !244
  store %struct.DLL* %7, %struct.DLL** %21, align 8, !dbg !244, !tbaa !139
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %x}, i64 0, metadata !245), !dbg !247
  %22 = getelementptr inbounds %struct.DLL* %x, i64 0, i32 2, !dbg !247
  %23 = load %struct.DLL** %22, align 8, !dbg !247, !tbaa !132
  %24 = getelementptr inbounds %struct.DLL* %23, i64 0, i32 0, !dbg !246
  %25 = load i32* %24, align 4, !dbg !246, !tbaa !144
  %26 = getelementptr inbounds %struct.DLL* %18, i64 0, i32 0, !dbg !246
  store i32 %25, i32* %26, align 4, !dbg !246, !tbaa !144
  ret %struct.DLL* %7, !dbg !248
}

; Function Attrs: nounwind uwtable
define void @list_reverse(%struct.DLL* %head) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %head}, i64 0, metadata !84), !dbg !249
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %head}, i64 0, metadata !86), !dbg !250
  br label %1, !dbg !251

; <label>:1                                       ; preds = %1, %0
  %p.0 = phi %struct.DLL* [ %head, %0 ], [ %3, %1 ]
  %2 = getelementptr inbounds %struct.DLL* %p.0, i64 0, i32 1, !dbg !252
  %3 = load %struct.DLL** %2, align 8, !dbg !252, !tbaa !139
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %3}, i64 0, metadata !85), !dbg !252
  %4 = getelementptr inbounds %struct.DLL* %p.0, i64 0, i32 2, !dbg !254
  %5 = load %struct.DLL** %4, align 8, !dbg !254, !tbaa !132
  store %struct.DLL* %5, %struct.DLL** %2, align 8, !dbg !254, !tbaa !139
  store %struct.DLL* %3, %struct.DLL** %4, align 8, !dbg !255, !tbaa !132
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %3}, i64 0, metadata !86), !dbg !256
  %6 = icmp eq %struct.DLL* %3, %head, !dbg !257
  br i1 %6, label %7, label %1, !dbg !257

; <label>:7                                       ; preds = %1
  ret void, !dbg !258
}

; Function Attrs: nounwind uwtable
define i32 @test_lists() #0 {
  tail call void @llvm.dbg.value(metadata !193, i64 0, metadata !91), !dbg !259
  %1 = tail call %struct.DLL* @list_sequence(i32 1, i32 100), !dbg !260
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %1}, i64 0, metadata !92), !dbg !260
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %1}, i64 0, metadata !261) #5, !dbg !263
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %1}, i64 0, metadata !264) #5, !dbg !266
  %2 = getelementptr inbounds %struct.DLL* %1, i64 0, i32 0, !dbg !266
  %3 = load i32* %2, align 4, !dbg !266, !tbaa !144
  tail call void @llvm.dbg.value(metadata !{i32 %3}, i64 0, metadata !267) #5, !dbg !265
  %4 = add nsw i32 %3, 1, !dbg !268
  %5 = sext i32 %4 to i64, !dbg !268
  %6 = mul i64 %5, 24, !dbg !268
  %7 = tail call noalias i8* @malloc(i64 %6) #5, !dbg !268
  %8 = bitcast i8* %7 to %struct.DLL*, !dbg !268
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %8}, i64 0, metadata !269) #5, !dbg !268
  tail call void @llvm.dbg.value(metadata !193, i64 0, metadata !270) #5, !dbg !271
  tail call void @llvm.dbg.value(metadata !221, i64 0, metadata !272) #5, !dbg !271
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %1}, i64 0, metadata !273) #5, !dbg !271
  %9 = icmp sgt i32 %3, 0, !dbg !271
  br i1 %9, label %.lr.ph.i.preheader, label %.list_copy.exit_crit_edge, !dbg !271

.list_copy.exit_crit_edge:                        ; preds = %0
  %.pre35 = getelementptr inbounds i8* %7, i64 8, !dbg !274
  %.pre36 = bitcast i8* %.pre35 to %struct.DLL**, !dbg !274
  %.pre38 = bitcast i8* %7 to i32*, !dbg !277
  br label %list_copy.exit, !dbg !271

.lr.ph.i.preheader:                               ; preds = %0
  %10 = getelementptr inbounds i8* %7, i64 24, !dbg !278
  %11 = bitcast i8* %10 to %struct.DLL*, !dbg !278
  %12 = getelementptr inbounds i8* %7, i64 8, !dbg !278
  %13 = bitcast i8* %12 to %struct.DLL**, !dbg !278
  store %struct.DLL* %11, %struct.DLL** %13, align 8, !dbg !278, !tbaa !139
  %14 = getelementptr inbounds i8* %7, i64 40, !dbg !279
  %15 = bitcast i8* %14 to %struct.DLL**, !dbg !279
  store %struct.DLL* %8, %struct.DLL** %15, align 8, !dbg !279, !tbaa !132
  %16 = bitcast i8* %7 to i32*, !dbg !280
  store i32 %3, i32* %16, align 4, !dbg !280, !tbaa !144
  %exitcond.i25 = icmp eq i32 %3, 1, !dbg !271
  br i1 %exitcond.i25, label %list_copy.exit, label %._crit_edge6.i, !dbg !271

._crit_edge6.i:                                   ; preds = %.lr.ph.i.preheader, %._crit_edge6.i
  %.pn = phi %struct.DLL* [ %17, %._crit_edge6.i ], [ %1, %.lr.ph.i.preheader ]
  %indvars.iv.next.i27 = phi i64 [ %indvars.iv.next.i, %._crit_edge6.i ], [ 1, %.lr.ph.i.preheader ]
  %.in = getelementptr inbounds %struct.DLL* %.pn, i64 0, i32 1, !dbg !271
  %17 = load %struct.DLL** %.in, align 8, !dbg !271
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.next.i27, 1, !dbg !271
  %.phi.trans.insert.i = getelementptr inbounds %struct.DLL* %17, i64 0, i32 0
  %.pre.i = load i32* %.phi.trans.insert.i, align 4, !dbg !280, !tbaa !144
  %18 = getelementptr inbounds %struct.DLL* %8, i64 %indvars.iv.next.i, !dbg !278
  %19 = getelementptr inbounds %struct.DLL* %8, i64 %indvars.iv.next.i27, !dbg !278
  %20 = getelementptr inbounds %struct.DLL* %8, i64 %indvars.iv.next.i27, i32 1, !dbg !278
  store %struct.DLL* %18, %struct.DLL** %20, align 8, !dbg !278, !tbaa !139
  %21 = getelementptr inbounds %struct.DLL* %8, i64 %indvars.iv.next.i, i32 2, !dbg !279
  store %struct.DLL* %19, %struct.DLL** %21, align 8, !dbg !279, !tbaa !132
  %22 = getelementptr inbounds %struct.DLL* %19, i64 0, i32 0, !dbg !280
  store i32 %.pre.i, i32* %22, align 4, !dbg !280, !tbaa !144
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %17}, i64 0, metadata !273) #5, !dbg !271
  %lftr.wideiv = trunc i64 %indvars.iv.next.i to i32, !dbg !271
  %exitcond = icmp eq i32 %lftr.wideiv, %3, !dbg !271
  br i1 %exitcond, label %list_copy.exit, label %._crit_edge6.i, !dbg !271

list_copy.exit:                                   ; preds = %._crit_edge6.i, %.lr.ph.i.preheader, %.list_copy.exit_crit_edge
  %.pre-phi39 = phi i32* [ %.pre38, %.list_copy.exit_crit_edge ], [ %16, %.lr.ph.i.preheader ], [ %16, %._crit_edge6.i ], !dbg !277
  %.pre-phi37 = phi %struct.DLL** [ %.pre36, %.list_copy.exit_crit_edge ], [ %13, %.lr.ph.i.preheader ], [ %13, %._crit_edge6.i ], !dbg !274
  %23 = sext i32 %3 to i64, !dbg !281
  %24 = getelementptr inbounds %struct.DLL* %8, i64 %23, !dbg !281
  %25 = getelementptr inbounds i8* %7, i64 16, !dbg !281
  %26 = bitcast i8* %25 to %struct.DLL**, !dbg !281
  store %struct.DLL* %24, %struct.DLL** %26, align 8, !dbg !281, !tbaa !132
  %27 = getelementptr inbounds %struct.DLL* %8, i64 %23, i32 1, !dbg !282
  store %struct.DLL* %8, %struct.DLL** %27, align 8, !dbg !282, !tbaa !139
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %1}, i64 0, metadata !283) #5, !dbg !285
  %28 = getelementptr inbounds %struct.DLL* %1, i64 0, i32 2, !dbg !285
  %29 = load %struct.DLL** %28, align 8, !dbg !285, !tbaa !132
  %30 = getelementptr inbounds %struct.DLL* %29, i64 0, i32 0, !dbg !284
  %31 = load i32* %30, align 4, !dbg !284, !tbaa !144
  %32 = getelementptr inbounds %struct.DLL* %24, i64 0, i32 0, !dbg !284
  store i32 %31, i32* %32, align 4, !dbg !284, !tbaa !144
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %8}, i64 0, metadata !93), !dbg !262
  %33 = tail call noalias i8* @malloc(i64 24) #5, !dbg !286
  %34 = bitcast i8* %33 to %struct.DLL*, !dbg !286
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %34}, i64 0, metadata !288) #5, !dbg !286
  %35 = getelementptr inbounds i8* %33, i64 8, !dbg !289
  %36 = bitcast i8* %35 to %struct.DLL**, !dbg !289
  store %struct.DLL* %34, %struct.DLL** %36, align 8, !dbg !289, !tbaa !139
  %37 = getelementptr inbounds i8* %33, i64 16, !dbg !290
  %38 = bitcast i8* %37 to %struct.DLL**, !dbg !290
  store %struct.DLL* %34, %struct.DLL** %38, align 8, !dbg !290, !tbaa !132
  %39 = bitcast i8* %33 to i32*, !dbg !291
  store i32 0, i32* %39, align 4, !dbg !291, !tbaa !144
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %34}, i64 0, metadata !94), !dbg !287
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %8}, i64 0, metadata !292), !dbg !293
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %1}, i64 0, metadata !294), !dbg !293
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %8}, i64 0, metadata !295), !dbg !274
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %1}, i64 0, metadata !296), !dbg !274
  %40 = load %struct.DLL** %.pre-phi37, align 8, !dbg !274, !tbaa !139
  %41 = icmp eq %struct.DLL* %40, %8, !dbg !274
  %42 = load i32* %.pre-phi39, align 4, !dbg !277, !tbaa !144
  %43 = load i32* %2, align 4, !dbg !277, !tbaa !144
  %44 = icmp ne i32 %42, %43, !dbg !277
  br i1 %41, label %._crit_edge.i, label %.lr.ph.i4, !dbg !274

.lr.ph.i4:                                        ; preds = %list_copy.exit, %47
  %45 = phi i1 [ %57, %47 ], [ %44, %list_copy.exit ]
  %46 = phi %struct.DLL* [ %51, %47 ], [ %40, %list_copy.exit ]
  %yp.03.i = phi %struct.DLL* [ %49, %47 ], [ %1, %list_copy.exit ]
  br i1 %45, label %list_equal.exit.thread, label %47, !dbg !277

; <label>:47                                      ; preds = %.lr.ph.i4
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %46}, i64 0, metadata !295), !dbg !274
  %48 = getelementptr inbounds %struct.DLL* %yp.03.i, i64 0, i32 1, !dbg !274
  %49 = load %struct.DLL** %48, align 8, !dbg !274, !tbaa !139
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %49}, i64 0, metadata !296), !dbg !274
  %50 = getelementptr inbounds %struct.DLL* %46, i64 0, i32 1, !dbg !274
  %51 = load %struct.DLL** %50, align 8, !dbg !274, !tbaa !139
  %52 = icmp eq %struct.DLL* %51, %8, !dbg !274
  %53 = getelementptr inbounds %struct.DLL* %46, i64 0, i32 0, !dbg !277
  %54 = load i32* %53, align 4, !dbg !277, !tbaa !144
  %55 = getelementptr inbounds %struct.DLL* %49, i64 0, i32 0, !dbg !277
  %56 = load i32* %55, align 4, !dbg !277, !tbaa !144
  %57 = icmp ne i32 %54, %56, !dbg !277
  br i1 %52, label %._crit_edge.i, label %.lr.ph.i4, !dbg !274

._crit_edge.i:                                    ; preds = %47, %list_copy.exit
  %.lcssa.i = phi i1 [ %44, %list_copy.exit ], [ %57, %47 ]
  %yp.0.lcssa.i = phi %struct.DLL* [ %1, %list_copy.exit ], [ %49, %47 ]
  br i1 %.lcssa.i, label %list_equal.exit.thread, label %list_equal.exit, !dbg !297

list_equal.exit:                                  ; preds = %._crit_edge.i
  %58 = getelementptr inbounds %struct.DLL* %yp.0.lcssa.i, i64 0, i32 1, !dbg !298
  %59 = load %struct.DLL** %58, align 8, !dbg !298, !tbaa !139
  %60 = icmp eq %struct.DLL* %59, %1, !dbg !298
  br i1 %60, label %.preheader15, label %list_equal.exit.thread, !dbg !275

.preheader15:                                     ; preds = %list_equal.exit
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %8}, i64 0, metadata !299), !dbg !301
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %8}, i64 0, metadata !302), !dbg !303
  %61 = icmp eq i32 %42, 0, !dbg !301
  br i1 %61, label %.preheader, label %list_pop_head.exit, !dbg !300

list_equal.exit.thread:                           ; preds = %.lr.ph.i4, %list_equal.exit, %._crit_edge.i
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([26 x i8]* @str13, i64 0, i64 0)) #5, !dbg !304
  tail call void @exit(i32 1) #6, !dbg !306
  unreachable, !dbg !306

.preheader14:                                     ; preds = %list_pop_head.exit
  store i32 0, i32* %.pre-phi39, align 4, !dbg !303, !tbaa !144
  store i32 %42, i32* %39, align 4, !dbg !307, !tbaa !144
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %34}, i64 0, metadata !310), !dbg !312
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %34}, i64 0, metadata !313), !dbg !314
  %62 = icmp eq i32 %42, 0, !dbg !312
  br i1 %62, label %.preheader, label %list_pop_tail.exit, !dbg !311

list_pop_head.exit:                               ; preds = %.preheader15, %list_pop_head.exit.list_pop_head.exit_crit_edge
  %63 = phi %struct.DLL* [ %.pre, %list_pop_head.exit.list_pop_head.exit_crit_edge ], [ %40, %.preheader15 ]
  %64 = phi i32 [ %69, %list_pop_head.exit.list_pop_head.exit_crit_edge ], [ %42, %.preheader15 ]
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %8}, i64 0, metadata !315), !dbg !316
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %8}, i64 0, metadata !317), !dbg !319
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %8}, i64 0, metadata !320), !dbg !321
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %63}, i64 0, metadata !322), !dbg !323
  %65 = getelementptr inbounds %struct.DLL* %63, i64 0, i32 1, !dbg !324
  %66 = load %struct.DLL** %65, align 8, !dbg !324, !tbaa !139
  store %struct.DLL* %66, %struct.DLL** %.pre-phi37, align 8, !dbg !324, !tbaa !139
  %67 = load %struct.DLL** %65, align 8, !dbg !325, !tbaa !139
  %68 = getelementptr inbounds %struct.DLL* %67, i64 0, i32 2, !dbg !325
  store %struct.DLL* %8, %struct.DLL** %68, align 8, !dbg !325, !tbaa !132
  %69 = add nsw i32 %64, -1, !dbg !326
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %34}, i64 0, metadata !327), !dbg !328
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %63}, i64 0, metadata !329), !dbg !328
  %70 = load %struct.DLL** %38, align 8, !dbg !330, !tbaa !132
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %70}, i64 0, metadata !331), !dbg !330
  %71 = getelementptr inbounds %struct.DLL* %70, i64 0, i32 1, !dbg !332
  store %struct.DLL* %63, %struct.DLL** %71, align 8, !dbg !332, !tbaa !139
  store %struct.DLL* %34, %struct.DLL** %65, align 8, !dbg !333, !tbaa !139
  store %struct.DLL* %63, %struct.DLL** %38, align 8, !dbg !334, !tbaa !132
  %72 = getelementptr inbounds %struct.DLL* %63, i64 0, i32 2, !dbg !335
  store %struct.DLL* %70, %struct.DLL** %72, align 8, !dbg !335, !tbaa !132
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %8}, i64 0, metadata !299), !dbg !301
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %8}, i64 0, metadata !302), !dbg !303
  %73 = icmp eq i32 %69, 0, !dbg !301
  br i1 %73, label %.preheader14, label %list_pop_head.exit.list_pop_head.exit_crit_edge, !dbg !300

list_pop_head.exit.list_pop_head.exit_crit_edge:  ; preds = %list_pop_head.exit
  %.pre = load %struct.DLL** %.pre-phi37, align 8, !dbg !323, !tbaa !139
  br label %list_pop_head.exit, !dbg !300

..preheader_crit_edge:                            ; preds = %list_pop_tail.exit
  store i32 0, i32* %39, align 4, !dbg !314, !tbaa !144
  store i32 %42, i32* %.pre-phi39, align 4, !dbg !336, !tbaa !144
  br label %.preheader, !dbg !311

.preheader:                                       ; preds = %.preheader15, %..preheader_crit_edge, %.preheader14
  %74 = phi i32 [ %42, %..preheader_crit_edge ], [ 0, %.preheader14 ], [ 0, %.preheader15 ]
  br label %85, !dbg !339

list_pop_tail.exit:                               ; preds = %.preheader14, %list_pop_tail.exit
  %75 = phi i32 [ %80, %list_pop_tail.exit ], [ %42, %.preheader14 ]
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %34}, i64 0, metadata !341), !dbg !342
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %34}, i64 0, metadata !343), !dbg !345
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %34}, i64 0, metadata !346), !dbg !347
  %76 = load %struct.DLL** %38, align 8, !dbg !348, !tbaa !132
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %76}, i64 0, metadata !349), !dbg !348
  %77 = getelementptr inbounds %struct.DLL* %76, i64 0, i32 2, !dbg !350
  %78 = load %struct.DLL** %77, align 8, !dbg !350, !tbaa !132
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %78}, i64 0, metadata !351), !dbg !350
  %79 = getelementptr inbounds %struct.DLL* %78, i64 0, i32 1, !dbg !352
  store %struct.DLL* %34, %struct.DLL** %79, align 8, !dbg !352, !tbaa !139
  store %struct.DLL* %78, %struct.DLL** %38, align 8, !dbg !353, !tbaa !132
  %80 = add nsw i32 %75, -1, !dbg !354
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %8}, i64 0, metadata !355), !dbg !356
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %76}, i64 0, metadata !357), !dbg !356
  %81 = load %struct.DLL** %26, align 8, !dbg !358, !tbaa !132
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %81}, i64 0, metadata !359), !dbg !358
  %82 = getelementptr inbounds %struct.DLL* %81, i64 0, i32 1, !dbg !360
  store %struct.DLL* %76, %struct.DLL** %82, align 8, !dbg !360, !tbaa !139
  %83 = getelementptr inbounds %struct.DLL* %76, i64 0, i32 1, !dbg !361
  store %struct.DLL* %8, %struct.DLL** %83, align 8, !dbg !361, !tbaa !139
  store %struct.DLL* %76, %struct.DLL** %26, align 8, !dbg !362, !tbaa !132
  store %struct.DLL* %81, %struct.DLL** %77, align 8, !dbg !363, !tbaa !132
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %34}, i64 0, metadata !310), !dbg !312
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %34}, i64 0, metadata !313), !dbg !314
  %84 = icmp eq i32 %80, 0, !dbg !312
  br i1 %84, label %..preheader_crit_edge, label %list_pop_tail.exit, !dbg !311

; <label>:85                                      ; preds = %.preheader, %85
  %p.0.i = phi %struct.DLL* [ %87, %85 ], [ %1, %.preheader ]
  %86 = getelementptr inbounds %struct.DLL* %p.0.i, i64 0, i32 1, !dbg !339
  %87 = load %struct.DLL** %86, align 8, !dbg !339, !tbaa !139
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %87}, i64 0, metadata !364), !dbg !339
  %88 = getelementptr inbounds %struct.DLL* %p.0.i, i64 0, i32 2, !dbg !365
  %89 = load %struct.DLL** %88, align 8, !dbg !365, !tbaa !132
  store %struct.DLL* %89, %struct.DLL** %86, align 8, !dbg !365, !tbaa !139
  store %struct.DLL* %87, %struct.DLL** %88, align 8, !dbg !366, !tbaa !132
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %87}, i64 0, metadata !367), !dbg !368
  %90 = icmp eq %struct.DLL* %87, %1, !dbg !369
  br i1 %90, label %list_reverse.exit, label %85, !dbg !369

list_reverse.exit:                                ; preds = %85
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %1}, i64 0, metadata !370), !dbg !373
  %91 = getelementptr inbounds %struct.DLL* %1, i64 0, i32 1, !dbg !374
  %92 = load %struct.DLL** %91, align 8, !dbg !374, !tbaa !139
  %93 = getelementptr inbounds %struct.DLL* %92, i64 0, i32 0, !dbg !371
  %94 = load i32* %93, align 4, !dbg !371, !tbaa !144
  %95 = icmp eq i32 %94, 100, !dbg !371
  br i1 %95, label %98, label %96, !dbg !371

; <label>:96                                      ; preds = %list_reverse.exit
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %1}, i64 0, metadata !376), !dbg !379
  %97 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([42 x i8]* @.str7, i64 0, i64 0), i32 100, i32 %94) #5, !dbg !380
  tail call void @exit(i32 1) #6, !dbg !381
  unreachable, !dbg !381

; <label>:98                                      ; preds = %list_reverse.exit
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %1}, i64 0, metadata !382), !dbg !385
  %99 = load %struct.DLL** %28, align 8, !dbg !385, !tbaa !132
  %100 = getelementptr inbounds %struct.DLL* %99, i64 0, i32 0, !dbg !383
  %101 = load i32* %100, align 4, !dbg !383, !tbaa !144
  %102 = icmp eq i32 %101, 1, !dbg !383
  br i1 %102, label %105, label %103, !dbg !383

; <label>:103                                     ; preds = %98
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %1}, i64 0, metadata !386), !dbg !389
  %104 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str8, i64 0, i64 0), i32 100, i32 %101) #5, !dbg !390
  tail call void @exit(i32 1) #6, !dbg !391
  unreachable, !dbg !391

; <label>:105                                     ; preds = %98
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %8}, i64 0, metadata !392), !dbg !395
  %106 = load %struct.DLL** %.pre-phi37, align 8, !dbg !396, !tbaa !139
  %107 = getelementptr inbounds %struct.DLL* %106, i64 0, i32 0, !dbg !393
  %108 = load i32* %107, align 4, !dbg !393, !tbaa !144
  %109 = icmp eq i32 %108, 100, !dbg !393
  br i1 %109, label %112, label %110, !dbg !393

; <label>:110                                     ; preds = %105
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %8}, i64 0, metadata !397), !dbg !400
  %111 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([42 x i8]* @.str9, i64 0, i64 0), i32 100, i32 %108) #5, !dbg !401
  tail call void @exit(i32 1) #6, !dbg !402
  unreachable, !dbg !402

; <label>:112                                     ; preds = %105
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %8}, i64 0, metadata !403), !dbg !406
  %113 = load %struct.DLL** %26, align 8, !dbg !406, !tbaa !132
  %114 = getelementptr inbounds %struct.DLL* %113, i64 0, i32 0, !dbg !404
  %115 = load i32* %114, align 4, !dbg !404, !tbaa !144
  %116 = icmp eq i32 %115, 1, !dbg !404
  br i1 %116, label %119, label %117, !dbg !404

; <label>:117                                     ; preds = %112
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %8}, i64 0, metadata !407), !dbg !410
  %118 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str8, i64 0, i64 0), i32 100, i32 %115) #5, !dbg !411
  tail call void @exit(i32 1) #6, !dbg !412
  unreachable, !dbg !412

; <label>:119                                     ; preds = %112
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %1}, i64 0, metadata !413), !dbg !416
  %120 = load i32* %2, align 4, !dbg !416, !tbaa !144
  %121 = icmp eq i32 %120, 100, !dbg !414
  br i1 %121, label %124, label %122, !dbg !414

; <label>:122                                     ; preds = %119
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %1}, i64 0, metadata !417), !dbg !420
  %123 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([35 x i8]* @.str10, i64 0, i64 0), i32 100, i32 %120) #5, !dbg !421
  tail call void @exit(i32 1) #6, !dbg !422
  unreachable, !dbg !422

; <label>:124                                     ; preds = %119
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %1}, i64 0, metadata !423), !dbg !426
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %8}, i64 0, metadata !427), !dbg !426
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %1}, i64 0, metadata !428), !dbg !429
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %8}, i64 0, metadata !430), !dbg !429
  %125 = icmp eq %struct.DLL* %92, %1, !dbg !429
  %126 = icmp ne i32 %74, 100, !dbg !431
  br i1 %125, label %._crit_edge.i9, label %.lr.ph.i6, !dbg !429

.lr.ph.i6:                                        ; preds = %124, %129
  %127 = phi i1 [ %139, %129 ], [ %126, %124 ]
  %128 = phi %struct.DLL* [ %133, %129 ], [ %92, %124 ]
  %yp.03.i5 = phi %struct.DLL* [ %131, %129 ], [ %8, %124 ]
  br i1 %127, label %list_equal.exit11.thread, label %129, !dbg !431

; <label>:129                                     ; preds = %.lr.ph.i6
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %128}, i64 0, metadata !428), !dbg !429
  %130 = getelementptr inbounds %struct.DLL* %yp.03.i5, i64 0, i32 1, !dbg !429
  %131 = load %struct.DLL** %130, align 8, !dbg !429, !tbaa !139
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %131}, i64 0, metadata !430), !dbg !429
  %132 = getelementptr inbounds %struct.DLL* %128, i64 0, i32 1, !dbg !429
  %133 = load %struct.DLL** %132, align 8, !dbg !429, !tbaa !139
  %134 = icmp eq %struct.DLL* %133, %1, !dbg !429
  %135 = getelementptr inbounds %struct.DLL* %128, i64 0, i32 0, !dbg !431
  %136 = load i32* %135, align 4, !dbg !431, !tbaa !144
  %137 = getelementptr inbounds %struct.DLL* %131, i64 0, i32 0, !dbg !431
  %138 = load i32* %137, align 4, !dbg !431, !tbaa !144
  %139 = icmp ne i32 %136, %138, !dbg !431
  br i1 %134, label %._crit_edge.i9, label %.lr.ph.i6, !dbg !429

._crit_edge.i9:                                   ; preds = %129, %124
  %.lcssa.i7 = phi i1 [ %126, %124 ], [ %139, %129 ]
  %yp.0.lcssa.i8 = phi %struct.DLL* [ %8, %124 ], [ %131, %129 ]
  br i1 %.lcssa.i7, label %list_equal.exit11.thread, label %list_equal.exit11, !dbg !432

list_equal.exit11:                                ; preds = %._crit_edge.i9
  %140 = getelementptr inbounds %struct.DLL* %yp.0.lcssa.i8, i64 0, i32 1, !dbg !433
  %141 = load %struct.DLL** %140, align 8, !dbg !433, !tbaa !139
  %142 = icmp eq %struct.DLL* %141, %8, !dbg !433
  br i1 %142, label %143, label %list_equal.exit11.thread, !dbg !424

list_equal.exit11.thread:                         ; preds = %.lr.ph.i6, %list_equal.exit11, %._crit_edge.i9
  %puts3 = tail call i32 @puts(i8* getelementptr inbounds ([26 x i8]* @str16, i64 0, i64 0)) #5, !dbg !434
  tail call void @exit(i32 1) #6, !dbg !436
  unreachable, !dbg !436

; <label>:143                                     ; preds = %list_equal.exit11
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %1}, i64 0, metadata !437), !dbg !439
  tail call void @llvm.dbg.value(metadata !{i32 %120}, i64 0, metadata !91), !dbg !438
  %144 = bitcast %struct.DLL* %1 to i8*, !dbg !440
  tail call void @free(i8* %144) #5, !dbg !440
  tail call void @free(i8* %7) #5, !dbg !441
  tail call void @free(i8* %33) #5, !dbg !442
  ret i32 100, !dbg !443
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

; Function Attrs: nounwind
declare void @free(i8* nocapture) #2

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !100), !dbg !444
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !101), !dbg !444
  %1 = icmp eq i32 %argc, 2, !dbg !445
  br i1 %1, label %.preheader, label %.lr.ph, !dbg !445

.preheader:                                       ; preds = %0
  %2 = getelementptr inbounds i8** %argv, i64 1, !dbg !446
  %3 = load i8** %2, align 8, !dbg !446, !tbaa !447
  tail call void @llvm.dbg.value(metadata !{i8* %3}, i64 0, metadata !448) #5, !dbg !449
  %4 = tail call i64 @strtol(i8* nocapture %3, i8** null, i32 10) #5, !dbg !450
  %5 = trunc i64 %4 to i32, !dbg !450
  tail call void @llvm.dbg.value(metadata !{i32 %7}, i64 0, metadata !102), !dbg !452
  %6 = icmp eq i32 %5, 0, !dbg !452
  br i1 %6, label %._crit_edge, label %.lr.ph, !dbg !452

.lr.ph:                                           ; preds = %0, %.preheader, %.lr.ph
  %n.01 = phi i32 [ %7, %.lr.ph ], [ 3000000, %0 ], [ %5, %.preheader ]
  %7 = add nsw i32 %n.01, -1, !dbg !452
  %8 = tail call i32 @test_lists(), !dbg !452
  tail call void @llvm.dbg.value(metadata !{i32 %8}, i64 0, metadata !103), !dbg !452
  tail call void @llvm.dbg.value(metadata !{i32 %7}, i64 0, metadata !102), !dbg !452
  %9 = icmp eq i32 %7, 0, !dbg !452
  br i1 %9, label %._crit_edge, label %.lr.ph, !dbg !452

._crit_edge:                                      ; preds = %.lr.ph, %.preheader
  %result.0.lcssa = phi i32 [ 0, %.preheader ], [ %8, %.lr.ph ]
  %10 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str12, i64 0, i64 0), i32 %result.0.lcssa) #5, !dbg !453
  ret i32 0, !dbg !454
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
!147 = metadata !{i32 786689, metadata !124, metadata !"head", metadata !5, i32 16777238, metadata !8, i32 0, metadata !148} ; [ DW_TAG_arg_variable ] [head] [line 22]
!148 = metadata !{i32 37, i32 0, metadata !149, null}
!149 = metadata !{i32 786443, metadata !1, metadata !21, i32 37, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!150 = metadata !{i32 22, i32 0, metadata !124, metadata !148}
!151 = metadata !{i32 786689, metadata !119, metadata !"head", metadata !5, i32 16777237, metadata !8, i32 0, metadata !150} ; [ DW_TAG_arg_variable ] [head] [line 21]
!152 = metadata !{i32 21, i32 0, metadata !119, metadata !150}
!153 = metadata !{i32 38, i32 0, metadata !21, null}
!154 = metadata !{i32 39, i32 0, metadata !21, null}
!155 = metadata !{i32 40, i32 0, metadata !21, null}
!156 = metadata !{i32 41, i32 0, metadata !21, null}
!157 = metadata !{i32 42, i32 0, metadata !21, null}
!158 = metadata !{i32 43, i32 0, metadata !21, null}
!159 = metadata !{i32 44, i32 0, metadata !21, null}
!160 = metadata !{i32 46, i32 0, metadata !28, null}
!161 = metadata !{i32 47, i32 0, metadata !28, null}
!162 = metadata !{i32 48, i32 0, metadata !28, null}
!163 = metadata !{i32 49, i32 0, metadata !28, null}
!164 = metadata !{i32 50, i32 0, metadata !28, null}
!165 = metadata !{i32 51, i32 0, metadata !28, null}
!166 = metadata !{i32 52, i32 0, metadata !28, null}
!167 = metadata !{i32 53, i32 0, metadata !28, null}
!168 = metadata !{i32 55, i32 0, metadata !33, null}
!169 = metadata !{i32 786689, metadata !124, metadata !"head", metadata !5, i32 16777238, metadata !8, i32 0, metadata !170} ; [ DW_TAG_arg_variable ] [head] [line 22]
!170 = metadata !{i32 57, i32 0, metadata !171, null}
!171 = metadata !{i32 786443, metadata !1, metadata !33, i32 57, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!172 = metadata !{i32 22, i32 0, metadata !124, metadata !170}
!173 = metadata !{i32 786689, metadata !119, metadata !"head", metadata !5, i32 16777237, metadata !8, i32 0, metadata !172} ; [ DW_TAG_arg_variable ] [head] [line 21]
!174 = metadata !{i32 21, i32 0, metadata !119, metadata !172}
!175 = metadata !{i32 58, i32 0, metadata !33, null} ; [ DW_TAG_imported_module ]
!176 = metadata !{i32 59, i32 0, metadata !33, null}
!177 = metadata !{i32 60, i32 0, metadata !33, null}
!178 = metadata !{i32 61, i32 0, metadata !33, null}
!179 = metadata !{i32 62, i32 0, metadata !33, null}
!180 = metadata !{i32 63, i32 0, metadata !33, null}
!181 = metadata !{i32 65, i32 0, metadata !37, null}
!182 = metadata !{i32 68, i32 0, metadata !183, null}
!183 = metadata !{i32 786443, metadata !1, metadata !37, i32 68, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!184 = metadata !{i32 69, i32 0, metadata !185, null}
!185 = metadata !{i32 786443, metadata !1, metadata !186, i32 69, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!186 = metadata !{i32 786443, metadata !1, metadata !183, i32 68, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!187 = metadata !{i32 71, i32 0, metadata !188, null}
!188 = metadata !{i32 786443, metadata !1, metadata !37, i32 71, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!189 = metadata !{i32 72, i32 0, metadata !37, null}
!190 = metadata !{i32 73, i32 0, metadata !37, null}
!191 = metadata !{i32 75, i32 0, metadata !45, null}
!192 = metadata !{i32 76, i32 0, metadata !45, null}
!193 = metadata !{i32 0}
!194 = metadata !{i32 77, i32 0, metadata !45, null}
!195 = metadata !{i32 78, i32 0, metadata !45, null}
!196 = metadata !{i32 786689, metadata !119, metadata !"head", metadata !5, i32 16777237, metadata !8, i32 0, metadata !197} ; [ DW_TAG_arg_variable ] [head] [line 21]
!197 = metadata !{i32 79, i32 0, metadata !45, null}
!198 = metadata !{i32 21, i32 0, metadata !119, metadata !197}
!199 = metadata !{i32 80, i32 0, metadata !200, null}
!200 = metadata !{i32 786443, metadata !1, metadata !45, i32 80, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!201 = metadata !{i32 81, i32 0, metadata !202, null}
!202 = metadata !{i32 786443, metadata !1, metadata !200, i32 80, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!203 = metadata !{i32 84, i32 0, metadata !45, null}
!204 = metadata !{i32 85, i32 0, metadata !45, null}
!205 = metadata !{i32 86, i32 0, metadata !45, null}
!206 = metadata !{i32 89, i32 0, metadata !56, null}
!207 = metadata !{i32 90, i32 0, metadata !56, null}
!208 = metadata !{i32 91, i32 0, metadata !56, null}
!209 = metadata !{i32 92, i32 0, metadata !56, null}
!210 = metadata !{i32 93, i32 0, metadata !56, null}
!211 = metadata !{i32 97, i32 0, metadata !61, null}
!212 = metadata !{i32 100, i32 0, metadata !213, null}
!213 = metadata !{i32 786443, metadata !1, metadata !61, i32 100, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!214 = metadata !{i32 101, i32 0, metadata !215, null}
!215 = metadata !{i32 786443, metadata !1, metadata !213, i32 100, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!216 = metadata !{i32 103, i32 0, metadata !61, null}
!217 = metadata !{i32 104, i32 0, metadata !61, null}
!218 = metadata !{i32 105, i32 0, metadata !61, null}
!219 = metadata !{i32 106, i32 0, metadata !220, null}
!220 = metadata !{i32 786443, metadata !1, metadata !61, i32 106, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!221 = metadata !{i32 1}
!222 = metadata !{i32 107, i32 0, metadata !223, null}
!223 = metadata !{i32 786443, metadata !1, metadata !220, i32 106, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!224 = metadata !{i32 108, i32 0, metadata !223, null}
!225 = metadata !{i32 109, i32 0, metadata !223, null}
!226 = metadata !{i32 111, i32 0, metadata !61, null}
!227 = metadata !{i32 112, i32 0, metadata !61, null}
!228 = metadata !{i32 113, i32 0, metadata !61, null}
!229 = metadata !{i32 114, i32 0, metadata !61, null}
!230 = metadata !{i32 115, i32 0, metadata !61, null}
!231 = metadata !{i32 116, i32 0, metadata !61, null}
!232 = metadata !{i32 118, i32 0, metadata !72, null}
!233 = metadata !{i32 786689, metadata !119, metadata !"head", metadata !5, i32 16777237, metadata !8, i32 0, metadata !234} ; [ DW_TAG_arg_variable ] [head] [line 21]
!234 = metadata !{i32 119, i32 0, metadata !72, null}
!235 = metadata !{i32 21, i32 0, metadata !119, metadata !234}
!236 = metadata !{i32 120, i32 0, metadata !72, null}
!237 = metadata !{i32 121, i32 0, metadata !238, null}
!238 = metadata !{i32 786443, metadata !1, metadata !72, i32 121, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!239 = metadata !{i32 122, i32 0, metadata !240, null}
!240 = metadata !{i32 786443, metadata !1, metadata !238, i32 121, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!241 = metadata !{i32 123, i32 0, metadata !240, null}
!242 = metadata !{i32 124, i32 0, metadata !240, null}
!243 = metadata !{i32 126, i32 0, metadata !72, null}
!244 = metadata !{i32 127, i32 0, metadata !72, null}
!245 = metadata !{i32 786689, metadata !116, metadata !"head", metadata !5, i32 16777240, metadata !8, i32 0, metadata !246} ; [ DW_TAG_arg_variable ] [head] [line 24]
!246 = metadata !{i32 128, i32 0, metadata !72, null}
!247 = metadata !{i32 24, i32 0, metadata !116, metadata !246}
!248 = metadata !{i32 129, i32 0, metadata !72, null}
!249 = metadata !{i32 132, i32 0, metadata !80, null}
!250 = metadata !{i32 133, i32 0, metadata !80, null}
!251 = metadata !{i32 134, i32 0, metadata !80, null}
!252 = metadata !{i32 135, i32 0, metadata !253, null}
!253 = metadata !{i32 786443, metadata !1, metadata !80, i32 134, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!254 = metadata !{i32 136, i32 0, metadata !253, null}
!255 = metadata !{i32 137, i32 0, metadata !253, null}
!256 = metadata !{i32 138, i32 0, metadata !253, null}
!257 = metadata !{i32 139, i32 0, metadata !253, null}
!258 = metadata !{i32 140, i32 0, metadata !80, null}
!259 = metadata !{i32 143, i32 0, metadata !87, null}
!260 = metadata !{i32 145, i32 0, metadata !87, null}
!261 = metadata !{i32 786689, metadata !72, metadata !"x", metadata !5, i32 16777334, metadata !8, i32 0, metadata !262} ; [ DW_TAG_arg_variable ] [x] [line 118]
!262 = metadata !{i32 147, i32 0, metadata !87, null}
!263 = metadata !{i32 118, i32 0, metadata !72, metadata !262}
!264 = metadata !{i32 786689, metadata !119, metadata !"head", metadata !5, i32 16777237, metadata !8, i32 0, metadata !265} ; [ DW_TAG_arg_variable ] [head] [line 21]
!265 = metadata !{i32 119, i32 0, metadata !72, metadata !262}
!266 = metadata !{i32 21, i32 0, metadata !119, metadata !265}
!267 = metadata !{i32 786688, metadata !72, metadata !"size", metadata !5, i32 119, metadata !13, i32 0, metadata !262} ; [ DW_TAG_auto_variable ] [size] [line 119]
!268 = metadata !{i32 120, i32 0, metadata !72, metadata !262}
!269 = metadata !{i32 786688, metadata !72, metadata !"l", metadata !5, i32 120, metadata !8, i32 0, metadata !262} ; [ DW_TAG_auto_variable ] [l] [line 120]
!270 = metadata !{i32 786688, metadata !72, metadata !"i", metadata !5, i32 119, metadata !13, i32 0, metadata !262} ; [ DW_TAG_auto_variable ] [i] [line 119]
!271 = metadata !{i32 121, i32 0, metadata !238, metadata !262}
!272 = metadata !{i32 786688, metadata !72, metadata !"j", metadata !5, i32 119, metadata !13, i32 0, metadata !262} ; [ DW_TAG_auto_variable ] [j] [line 119]
!273 = metadata !{i32 786688, metadata !72, metadata !"xp", metadata !5, i32 120, metadata !8, i32 0, metadata !262} ; [ DW_TAG_auto_variable ] [xp] [line 120]
!274 = metadata !{i32 68, i32 0, metadata !183, metadata !275}
!275 = metadata !{i32 152, i32 0, metadata !276, null}
!276 = metadata !{i32 786443, metadata !1, metadata !87, i32 152, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!277 = metadata !{i32 69, i32 0, metadata !185, metadata !275}
!278 = metadata !{i32 122, i32 0, metadata !240, metadata !262}
!279 = metadata !{i32 123, i32 0, metadata !240, metadata !262}
!280 = metadata !{i32 124, i32 0, metadata !240, metadata !262}
!281 = metadata !{i32 126, i32 0, metadata !72, metadata !262}
!282 = metadata !{i32 127, i32 0, metadata !72, metadata !262}
!283 = metadata !{i32 786689, metadata !116, metadata !"head", metadata !5, i32 16777240, metadata !8, i32 0, metadata !284} ; [ DW_TAG_arg_variable ] [head] [line 24]
!284 = metadata !{i32 128, i32 0, metadata !72, metadata !262}
!285 = metadata !{i32 24, i32 0, metadata !116, metadata !284}
!286 = metadata !{i32 89, i32 0, metadata !56, metadata !287}
!287 = metadata !{i32 150, i32 0, metadata !87, null}
!288 = metadata !{i32 786688, metadata !56, metadata !"l", metadata !5, i32 89, metadata !8, i32 0, metadata !287} ; [ DW_TAG_auto_variable ] [l] [line 89]
!289 = metadata !{i32 90, i32 0, metadata !56, metadata !287}
!290 = metadata !{i32 91, i32 0, metadata !56, metadata !287}
!291 = metadata !{i32 92, i32 0, metadata !56, metadata !287}
!292 = metadata !{i32 786689, metadata !37, metadata !"x", metadata !5, i32 16777281, metadata !8, i32 0, metadata !275} ; [ DW_TAG_arg_variable ] [x] [line 65]
!293 = metadata !{i32 65, i32 0, metadata !37, metadata !275}
!294 = metadata !{i32 786689, metadata !37, metadata !"y", metadata !5, i32 33554497, metadata !8, i32 0, metadata !275} ; [ DW_TAG_arg_variable ] [y] [line 65]
!295 = metadata !{i32 786688, metadata !37, metadata !"xp", metadata !5, i32 66, metadata !8, i32 0, metadata !275} ; [ DW_TAG_auto_variable ] [xp] [line 66]
!296 = metadata !{i32 786688, metadata !37, metadata !"yp", metadata !5, i32 66, metadata !8, i32 0, metadata !275} ; [ DW_TAG_auto_variable ] [yp] [line 66]
!297 = metadata !{i32 71, i32 0, metadata !188, metadata !275}
!298 = metadata !{i32 72, i32 0, metadata !37, metadata !275}
!299 = metadata !{i32 786689, metadata !124, metadata !"head", metadata !5, i32 16777238, metadata !8, i32 0, metadata !300} ; [ DW_TAG_arg_variable ] [head] [line 22]
!300 = metadata !{i32 156, i32 0, metadata !87, null}
!301 = metadata !{i32 22, i32 0, metadata !124, metadata !300}
!302 = metadata !{i32 786689, metadata !119, metadata !"head", metadata !5, i32 16777237, metadata !8, i32 0, metadata !301} ; [ DW_TAG_arg_variable ] [head] [line 21]
!303 = metadata !{i32 21, i32 0, metadata !119, metadata !301}
!304 = metadata !{i32 153, i32 0, metadata !305, null}
!305 = metadata !{i32 786443, metadata !1, metadata !276, i32 152, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!306 = metadata !{i32 154, i32 0, metadata !305, null}
!307 = metadata !{i32 32, i32 0, metadata !4, metadata !308}
!308 = metadata !{i32 157, i32 0, metadata !309, null}
!309 = metadata !{i32 786443, metadata !1, metadata !87, i32 156, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!310 = metadata !{i32 786689, metadata !124, metadata !"head", metadata !5, i32 16777238, metadata !8, i32 0, metadata !311} ; [ DW_TAG_arg_variable ] [head] [line 22]
!311 = metadata !{i32 166, i32 0, metadata !87, null}
!312 = metadata !{i32 22, i32 0, metadata !124, metadata !311}
!313 = metadata !{i32 786689, metadata !119, metadata !"head", metadata !5, i32 16777237, metadata !8, i32 0, metadata !312} ; [ DW_TAG_arg_variable ] [head] [line 21]
!314 = metadata !{i32 21, i32 0, metadata !119, metadata !312}
!315 = metadata !{i32 786689, metadata !33, metadata !"head", metadata !5, i32 16777271, metadata !8, i32 0, metadata !308} ; [ DW_TAG_arg_variable ] [head] [line 55]
!316 = metadata !{i32 55, i32 0, metadata !33, metadata !308}
!317 = metadata !{i32 786689, metadata !124, metadata !"head", metadata !5, i32 16777238, metadata !8, i32 0, metadata !318} ; [ DW_TAG_arg_variable ] [head] [line 22]
!318 = metadata !{i32 57, i32 0, metadata !171, metadata !308}
!319 = metadata !{i32 22, i32 0, metadata !124, metadata !318}
!320 = metadata !{i32 786689, metadata !119, metadata !"head", metadata !5, i32 16777237, metadata !8, i32 0, metadata !319} ; [ DW_TAG_arg_variable ] [head] [line 21]
!321 = metadata !{i32 21, i32 0, metadata !119, metadata !319}
!322 = metadata !{i32 786688, metadata !33, metadata !"next", metadata !5, i32 56, metadata !8, i32 0, metadata !308} ; [ DW_TAG_auto_variable ] [next] [line 56]
!323 = metadata !{i32 58, i32 0, metadata !33, metadata !308} ; [ DW_TAG_imported_module ]
!324 = metadata !{i32 59, i32 0, metadata !33, metadata !308}
!325 = metadata !{i32 60, i32 0, metadata !33, metadata !308}
!326 = metadata !{i32 61, i32 0, metadata !33, metadata !308}
!327 = metadata !{i32 786689, metadata !4, metadata !"head", metadata !5, i32 16777242, metadata !8, i32 0, metadata !308} ; [ DW_TAG_arg_variable ] [head] [line 26]
!328 = metadata !{i32 26, i32 0, metadata !4, metadata !308}
!329 = metadata !{i32 786689, metadata !4, metadata !"item", metadata !5, i32 33554458, metadata !8, i32 0, metadata !308} ; [ DW_TAG_arg_variable ] [item] [line 26]
!330 = metadata !{i32 27, i32 0, metadata !4, metadata !308}
!331 = metadata !{i32 786688, metadata !4, metadata !"tail", metadata !5, i32 27, metadata !8, i32 0, metadata !308} ; [ DW_TAG_auto_variable ] [tail] [line 27]
!332 = metadata !{i32 28, i32 0, metadata !4, metadata !308}
!333 = metadata !{i32 29, i32 0, metadata !4, metadata !308}
!334 = metadata !{i32 30, i32 0, metadata !4, metadata !308}
!335 = metadata !{i32 31, i32 0, metadata !4, metadata !308}
!336 = metadata !{i32 32, i32 0, metadata !4, metadata !337}
!337 = metadata !{i32 167, i32 0, metadata !338, null}
!338 = metadata !{i32 786443, metadata !1, metadata !87, i32 166, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!339 = metadata !{i32 135, i32 0, metadata !253, metadata !340}
!340 = metadata !{i32 175, i32 0, metadata !87, null}
!341 = metadata !{i32 786689, metadata !21, metadata !"head", metadata !5, i32 16777251, metadata !8, i32 0, metadata !337} ; [ DW_TAG_arg_variable ] [head] [line 35]
!342 = metadata !{i32 35, i32 0, metadata !21, metadata !337}
!343 = metadata !{i32 786689, metadata !124, metadata !"head", metadata !5, i32 16777238, metadata !8, i32 0, metadata !344} ; [ DW_TAG_arg_variable ] [head] [line 22]
!344 = metadata !{i32 37, i32 0, metadata !149, metadata !337}
!345 = metadata !{i32 22, i32 0, metadata !124, metadata !344}
!346 = metadata !{i32 786689, metadata !119, metadata !"head", metadata !5, i32 16777237, metadata !8, i32 0, metadata !345} ; [ DW_TAG_arg_variable ] [head] [line 21]
!347 = metadata !{i32 21, i32 0, metadata !119, metadata !345}
!348 = metadata !{i32 38, i32 0, metadata !21, metadata !337}
!349 = metadata !{i32 786688, metadata !21, metadata !"tail", metadata !5, i32 36, metadata !8, i32 0, metadata !337} ; [ DW_TAG_auto_variable ] [tail] [line 36]
!350 = metadata !{i32 39, i32 0, metadata !21, metadata !337}
!351 = metadata !{i32 786688, metadata !21, metadata !"prev", metadata !5, i32 36, metadata !8, i32 0, metadata !337} ; [ DW_TAG_auto_variable ] [prev] [line 36]
!352 = metadata !{i32 40, i32 0, metadata !21, metadata !337}
!353 = metadata !{i32 41, i32 0, metadata !21, metadata !337}
!354 = metadata !{i32 42, i32 0, metadata !21, metadata !337}
!355 = metadata !{i32 786689, metadata !4, metadata !"head", metadata !5, i32 16777242, metadata !8, i32 0, metadata !337} ; [ DW_TAG_arg_variable ] [head] [line 26]
!356 = metadata !{i32 26, i32 0, metadata !4, metadata !337}
!357 = metadata !{i32 786689, metadata !4, metadata !"item", metadata !5, i32 33554458, metadata !8, i32 0, metadata !337} ; [ DW_TAG_arg_variable ] [item] [line 26]
!358 = metadata !{i32 27, i32 0, metadata !4, metadata !337}
!359 = metadata !{i32 786688, metadata !4, metadata !"tail", metadata !5, i32 27, metadata !8, i32 0, metadata !337} ; [ DW_TAG_auto_variable ] [tail] [line 27]
!360 = metadata !{i32 28, i32 0, metadata !4, metadata !337}
!361 = metadata !{i32 29, i32 0, metadata !4, metadata !337}
!362 = metadata !{i32 30, i32 0, metadata !4, metadata !337}
!363 = metadata !{i32 31, i32 0, metadata !4, metadata !337}
!364 = metadata !{i32 786688, metadata !80, metadata !"tmp", metadata !5, i32 133, metadata !8, i32 0, metadata !340} ; [ DW_TAG_auto_variable ] [tmp] [line 133]
!365 = metadata !{i32 136, i32 0, metadata !253, metadata !340}
!366 = metadata !{i32 137, i32 0, metadata !253, metadata !340}
!367 = metadata !{i32 786688, metadata !80, metadata !"p", metadata !5, i32 133, metadata !8, i32 0, metadata !340} ; [ DW_TAG_auto_variable ] [p] [line 133]
!368 = metadata !{i32 138, i32 0, metadata !253, metadata !340}
!369 = metadata !{i32 139, i32 0, metadata !253, metadata !340}
!370 = metadata !{i32 786689, metadata !113, metadata !"head", metadata !5, i32 16777239, metadata !8, i32 0, metadata !371} ; [ DW_TAG_arg_variable ] [head] [line 23]
!371 = metadata !{i32 177, i32 0, metadata !372, null}
!372 = metadata !{i32 786443, metadata !1, metadata !87, i32 177, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!373 = metadata !{i32 23, i32 0, metadata !113, metadata !371}
!374 = metadata !{i32 23, i32 0, metadata !375, metadata !371}
!375 = metadata !{i32 786443, metadata !1, metadata !113} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!376 = metadata !{i32 786689, metadata !113, metadata !"head", metadata !5, i32 16777239, metadata !8, i32 0, metadata !377} ; [ DW_TAG_arg_variable ] [head] [line 23]
!377 = metadata !{i32 179, i32 0, metadata !378, null}
!378 = metadata !{i32 786443, metadata !1, metadata !372, i32 177, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!379 = metadata !{i32 23, i32 0, metadata !113, metadata !377}
!380 = metadata !{i32 178, i32 0, metadata !378, null}
!381 = metadata !{i32 180, i32 0, metadata !378, null}
!382 = metadata !{i32 786689, metadata !116, metadata !"head", metadata !5, i32 16777240, metadata !8, i32 0, metadata !383} ; [ DW_TAG_arg_variable ] [head] [line 24]
!383 = metadata !{i32 183, i32 0, metadata !384, null}
!384 = metadata !{i32 786443, metadata !1, metadata !87, i32 183, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!385 = metadata !{i32 24, i32 0, metadata !116, metadata !383}
!386 = metadata !{i32 786689, metadata !116, metadata !"head", metadata !5, i32 16777240, metadata !8, i32 0, metadata !387} ; [ DW_TAG_arg_variable ] [head] [line 24]
!387 = metadata !{i32 185, i32 0, metadata !388, null}
!388 = metadata !{i32 786443, metadata !1, metadata !384, i32 183, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!389 = metadata !{i32 24, i32 0, metadata !116, metadata !387}
!390 = metadata !{i32 184, i32 0, metadata !388, null}
!391 = metadata !{i32 186, i32 0, metadata !388, null}
!392 = metadata !{i32 786689, metadata !113, metadata !"head", metadata !5, i32 16777239, metadata !8, i32 0, metadata !393} ; [ DW_TAG_arg_variable ] [head] [line 23]
!393 = metadata !{i32 189, i32 0, metadata !394, null}
!394 = metadata !{i32 786443, metadata !1, metadata !87, i32 189, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!395 = metadata !{i32 23, i32 0, metadata !113, metadata !393}
!396 = metadata !{i32 23, i32 0, metadata !375, metadata !393}
!397 = metadata !{i32 786689, metadata !113, metadata !"head", metadata !5, i32 16777239, metadata !8, i32 0, metadata !398} ; [ DW_TAG_arg_variable ] [head] [line 23]
!398 = metadata !{i32 191, i32 0, metadata !399, null}
!399 = metadata !{i32 786443, metadata !1, metadata !394, i32 189, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!400 = metadata !{i32 23, i32 0, metadata !113, metadata !398}
!401 = metadata !{i32 190, i32 0, metadata !399, null}
!402 = metadata !{i32 192, i32 0, metadata !399, null}
!403 = metadata !{i32 786689, metadata !116, metadata !"head", metadata !5, i32 16777240, metadata !8, i32 0, metadata !404} ; [ DW_TAG_arg_variable ] [head] [line 24]
!404 = metadata !{i32 195, i32 0, metadata !405, null}
!405 = metadata !{i32 786443, metadata !1, metadata !87, i32 195, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!406 = metadata !{i32 24, i32 0, metadata !116, metadata !404}
!407 = metadata !{i32 786689, metadata !116, metadata !"head", metadata !5, i32 16777240, metadata !8, i32 0, metadata !408} ; [ DW_TAG_arg_variable ] [head] [line 24]
!408 = metadata !{i32 197, i32 0, metadata !409, null}
!409 = metadata !{i32 786443, metadata !1, metadata !405, i32 195, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!410 = metadata !{i32 24, i32 0, metadata !116, metadata !408}
!411 = metadata !{i32 196, i32 0, metadata !409, null}
!412 = metadata !{i32 198, i32 0, metadata !409, null}
!413 = metadata !{i32 786689, metadata !119, metadata !"head", metadata !5, i32 16777237, metadata !8, i32 0, metadata !414} ; [ DW_TAG_arg_variable ] [head] [line 21]
!414 = metadata !{i32 201, i32 0, metadata !415, null}
!415 = metadata !{i32 786443, metadata !1, metadata !87, i32 201, i32 0, i32 31} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!416 = metadata !{i32 21, i32 0, metadata !119, metadata !414}
!417 = metadata !{i32 786689, metadata !119, metadata !"head", metadata !5, i32 16777237, metadata !8, i32 0, metadata !418} ; [ DW_TAG_arg_variable ] [head] [line 21]
!418 = metadata !{i32 203, i32 0, metadata !419, null}
!419 = metadata !{i32 786443, metadata !1, metadata !415, i32 201, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!420 = metadata !{i32 21, i32 0, metadata !119, metadata !418}
!421 = metadata !{i32 202, i32 0, metadata !419, null}
!422 = metadata !{i32 204, i32 0, metadata !419, null}
!423 = metadata !{i32 786689, metadata !37, metadata !"x", metadata !5, i32 16777281, metadata !8, i32 0, metadata !424} ; [ DW_TAG_arg_variable ] [x] [line 65]
!424 = metadata !{i32 207, i32 0, metadata !425, null}
!425 = metadata !{i32 786443, metadata !1, metadata !87, i32 207, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!426 = metadata !{i32 65, i32 0, metadata !37, metadata !424}
!427 = metadata !{i32 786689, metadata !37, metadata !"y", metadata !5, i32 33554497, metadata !8, i32 0, metadata !424} ; [ DW_TAG_arg_variable ] [y] [line 65]
!428 = metadata !{i32 786688, metadata !37, metadata !"xp", metadata !5, i32 66, metadata !8, i32 0, metadata !424} ; [ DW_TAG_auto_variable ] [xp] [line 66]
!429 = metadata !{i32 68, i32 0, metadata !183, metadata !424}
!430 = metadata !{i32 786688, metadata !37, metadata !"yp", metadata !5, i32 66, metadata !8, i32 0, metadata !424} ; [ DW_TAG_auto_variable ] [yp] [line 66]
!431 = metadata !{i32 69, i32 0, metadata !185, metadata !424}
!432 = metadata !{i32 71, i32 0, metadata !188, metadata !424}
!433 = metadata !{i32 72, i32 0, metadata !37, metadata !424}
!434 = metadata !{i32 208, i32 0, metadata !435, null}
!435 = metadata !{i32 786443, metadata !1, metadata !425, i32 207, i32 0, i32 34} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!436 = metadata !{i32 209, i32 0, metadata !435, null}
!437 = metadata !{i32 786689, metadata !119, metadata !"head", metadata !5, i32 16777237, metadata !8, i32 0, metadata !438} ; [ DW_TAG_arg_variable ] [head] [line 21]
!438 = metadata !{i32 211, i32 0, metadata !87, null}
!439 = metadata !{i32 21, i32 0, metadata !119, metadata !438}
!440 = metadata !{i32 212, i32 0, metadata !87, null}
!441 = metadata !{i32 213, i32 0, metadata !87, null}
!442 = metadata !{i32 214, i32 0, metadata !87, null}
!443 = metadata !{i32 216, i32 0, metadata !87, null}
!444 = metadata !{i32 219, i32 0, metadata !95, null}
!445 = metadata !{i32 225, i32 0, metadata !95, null}
!446 = metadata !{i32 225, i32 26, metadata !95, null}
!447 = metadata !{metadata !137, metadata !137, i64 0}
!448 = metadata !{i32 786689, metadata !104, metadata !"__nptr", metadata !106, i32 16777494, metadata !109, i32 0, metadata !446} ; [ DW_TAG_arg_variable ] [__nptr] [line 278]
!449 = metadata !{i32 278, i32 0, metadata !104, metadata !446}
!450 = metadata !{i32 280, i32 0, metadata !451, metadata !446}
!451 = metadata !{i32 786443, metadata !105, metadata !104} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base//usr/include/stdlib.h]
!452 = metadata !{i32 227, i32 0, metadata !95, null}
!453 = metadata !{i32 228, i32 0, metadata !95, null}
!454 = metadata !{i32 229, i32 0, metadata !95, null}
