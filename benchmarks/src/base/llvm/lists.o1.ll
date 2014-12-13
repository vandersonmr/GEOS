; ModuleID = 'lists.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

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
  %1 = tail call fastcc i32 @list_empty(%struct.DLL* %head), !dbg !147
  %2 = icmp eq i32 %1, 0, !dbg !147
  br i1 %2, label %3, label %12, !dbg !147

; <label>:3                                       ; preds = %0
  %4 = getelementptr inbounds %struct.DLL* %head, i64 0, i32 2, !dbg !149
  %5 = load %struct.DLL** %4, align 8, !dbg !149, !tbaa !132
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %5}, i64 0, metadata !27), !dbg !149
  %6 = getelementptr inbounds %struct.DLL* %5, i64 0, i32 2, !dbg !150
  %7 = load %struct.DLL** %6, align 8, !dbg !150, !tbaa !132
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %7}, i64 0, metadata !26), !dbg !150
  %8 = getelementptr inbounds %struct.DLL* %7, i64 0, i32 1, !dbg !151
  store %struct.DLL* %head, %struct.DLL** %8, align 8, !dbg !151, !tbaa !139
  store %struct.DLL* %7, %struct.DLL** %4, align 8, !dbg !152, !tbaa !132
  %9 = getelementptr inbounds %struct.DLL* %head, i64 0, i32 0, !dbg !153
  %10 = load i32* %9, align 4, !dbg !153, !tbaa !144
  %11 = add nsw i32 %10, -1, !dbg !153
  store i32 %11, i32* %9, align 4, !dbg !153, !tbaa !144
  br label %12, !dbg !154

; <label>:12                                      ; preds = %0, %3
  %.0 = phi %struct.DLL* [ %5, %3 ], [ null, %0 ]
  ret %struct.DLL* %.0, !dbg !155
}

; Function Attrs: nounwind readonly uwtable
define internal fastcc i32 @list_empty(%struct.DLL* nocapture readonly %head) #1 {
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %head}, i64 0, metadata !126), !dbg !156
  %1 = tail call fastcc i32 @list_length(%struct.DLL* %head), !dbg !156
  %2 = icmp eq i32 %1, 0, !dbg !156
  %3 = zext i1 %2 to i32, !dbg !156
  ret i32 %3, !dbg !156
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
  %1 = tail call fastcc i32 @list_empty(%struct.DLL* %head), !dbg !166
  %2 = icmp eq i32 %1, 0, !dbg !166
  br i1 %2, label %3, label %13, !dbg !166

; <label>:3                                       ; preds = %0
  %4 = getelementptr inbounds %struct.DLL* %head, i64 0, i32 1, !dbg !168
  %5 = load %struct.DLL** %4, align 8, !dbg !168, !tbaa !139
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %5}, i64 0, metadata !36), !dbg !168
  %6 = getelementptr inbounds %struct.DLL* %5, i64 0, i32 1, !dbg !169
  %7 = load %struct.DLL** %6, align 8, !dbg !169, !tbaa !139
  store %struct.DLL* %7, %struct.DLL** %4, align 8, !dbg !169, !tbaa !139
  %8 = load %struct.DLL** %6, align 8, !dbg !170, !tbaa !139
  %9 = getelementptr inbounds %struct.DLL* %8, i64 0, i32 2, !dbg !170
  store %struct.DLL* %head, %struct.DLL** %9, align 8, !dbg !170, !tbaa !132
  %10 = getelementptr inbounds %struct.DLL* %head, i64 0, i32 0, !dbg !171
  %11 = load i32* %10, align 4, !dbg !171, !tbaa !144
  %12 = add nsw i32 %11, -1, !dbg !171
  store i32 %12, i32* %10, align 4, !dbg !171, !tbaa !144
  br label %13, !dbg !172

; <label>:13                                      ; preds = %0, %3
  %.0 = phi %struct.DLL* [ %5, %3 ], [ null, %0 ]
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
  %3 = tail call i32 @puts(i8* %msg) #6, !dbg !188
  %4 = tail call fastcc i32 @list_length(%struct.DLL* %x), !dbg !189
  %5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i32 %4) #6, !dbg !189
  %xp.01 = load %struct.DLL** %1, align 8, !dbg !190
  %6 = getelementptr inbounds %struct.DLL* %xp.01, i64 0, i32 1, !dbg !190
  %7 = load %struct.DLL** %6, align 8, !dbg !190, !tbaa !139
  %8 = icmp eq %struct.DLL* %7, %2, !dbg !190
  br i1 %8, label %._crit_edge, label %.lr.ph, !dbg !190

.lr.ph:                                           ; preds = %0, %.lr.ph
  %9 = phi %struct.DLL* [ %22, %.lr.ph ], [ %7, %0 ]
  %10 = phi %struct.DLL** [ %21, %.lr.ph ], [ %6, %0 ]
  %xp.03 = phi %struct.DLL* [ %xp.0, %.lr.ph ], [ %xp.01, %0 ]
  %i.02 = phi i32 [ %11, %.lr.ph ], [ 0, %0 ]
  %11 = add nsw i32 %i.02, 1, !dbg !192
  tail call void @llvm.dbg.value(metadata !{i32 %11}, i64 0, metadata !55), !dbg !192
  %12 = getelementptr inbounds %struct.DLL* %xp.03, i64 0, i32 0, !dbg !192
  %13 = load i32* %12, align 4, !dbg !192, !tbaa !144
  %14 = getelementptr inbounds %struct.DLL* %9, i64 0, i32 0, !dbg !192
  %15 = load i32* %14, align 4, !dbg !192, !tbaa !144
  %16 = getelementptr inbounds %struct.DLL* %xp.03, i64 0, i32 2, !dbg !192
  %17 = load %struct.DLL** %16, align 8, !dbg !192, !tbaa !132
  %18 = getelementptr inbounds %struct.DLL* %17, i64 0, i32 0, !dbg !192
  %19 = load i32* %18, align 4, !dbg !192, !tbaa !144
  %20 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str1, i64 0, i64 0), i32 %11, i32 %13, i32 %15, i32 %19) #6, !dbg !192
  %xp.0 = load %struct.DLL** %10, align 8, !dbg !190
  %21 = getelementptr inbounds %struct.DLL* %xp.0, i64 0, i32 1, !dbg !190
  %22 = load %struct.DLL** %21, align 8, !dbg !190, !tbaa !139
  %23 = icmp eq %struct.DLL* %22, %2, !dbg !190
  br i1 %23, label %._crit_edge, label %.lr.ph, !dbg !190

._crit_edge:                                      ; preds = %.lr.ph, %0
  %.lcssa = phi %struct.DLL** [ %6, %0 ], [ %21, %.lr.ph ]
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([33 x i8]* @str, i64 0, i64 0)) #6, !dbg !194
  %24 = load %struct.DLL** %.lcssa, align 8, !dbg !195, !tbaa !139
  %25 = getelementptr inbounds %struct.DLL* %24, i64 0, i32 0, !dbg !195
  %26 = load i32* %25, align 4, !dbg !195, !tbaa !144
  %27 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str3, i64 0, i64 0), i32 %26) #6, !dbg !195
  ret void, !dbg !196
}

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #2

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind readonly uwtable
define internal fastcc i32 @list_length(%struct.DLL* nocapture readonly %head) #1 {
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %head}, i64 0, metadata !123), !dbg !197
  %1 = getelementptr inbounds %struct.DLL* %head, i64 0, i32 0, !dbg !197
  %2 = load i32* %1, align 4, !dbg !197, !tbaa !144
  ret i32 %2, !dbg !197
}

; Function Attrs: nounwind uwtable
define %struct.DLL* @list_new() #0 {
  %1 = tail call noalias i8* @malloc(i64 24) #6, !dbg !198
  %2 = bitcast i8* %1 to %struct.DLL*, !dbg !198
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %2}, i64 0, metadata !60), !dbg !198
  %3 = getelementptr inbounds i8* %1, i64 8, !dbg !199
  %4 = bitcast i8* %3 to %struct.DLL**, !dbg !199
  store %struct.DLL* %2, %struct.DLL** %4, align 8, !dbg !199, !tbaa !139
  %5 = getelementptr inbounds i8* %1, i64 16, !dbg !200
  %6 = bitcast i8* %5 to %struct.DLL**, !dbg !200
  store %struct.DLL* %2, %struct.DLL** %6, align 8, !dbg !200, !tbaa !132
  %7 = bitcast i8* %1 to i32*, !dbg !201
  store i32 0, i32* %7, align 4, !dbg !201, !tbaa !144
  ret %struct.DLL* %2, !dbg !202
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind uwtable
define %struct.DLL* @list_sequence(i32 %from, i32 %to) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %from}, i64 0, metadata !65), !dbg !203
  tail call void @llvm.dbg.value(metadata !{i32 %to}, i64 0, metadata !66), !dbg !203
  %1 = icmp sgt i32 %from, %to, !dbg !204
  tail call void @llvm.dbg.value(metadata !{i32 %from}, i64 0, metadata !68), !dbg !206
  tail call void @llvm.dbg.value(metadata !{i32 %to}, i64 0, metadata !65), !dbg !206
  tail call void @llvm.dbg.value(metadata !{i32 %from}, i64 0, metadata !66), !dbg !206
  %from.to = select i1 %1, i32 %from, i32 %to, !dbg !204
  %to.from = select i1 %1, i32 %to, i32 %from, !dbg !204
  %2 = sub nsw i32 %from.to, %to.from, !dbg !208
  %3 = add nsw i32 %2, 1, !dbg !208
  tail call void @llvm.dbg.value(metadata !{i32 %3}, i64 0, metadata !67), !dbg !208
  %4 = add nsw i32 %2, 2, !dbg !209
  %5 = sext i32 %4 to i64, !dbg !209
  %6 = mul i64 %5, 24, !dbg !209
  %7 = tail call noalias i8* @malloc(i64 %6) #6, !dbg !209
  %8 = bitcast i8* %7 to %struct.DLL*, !dbg !209
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %8}, i64 0, metadata !71), !dbg !209
  %9 = add nsw i32 %to.from, -1, !dbg !210
  tail call void @llvm.dbg.value(metadata !{i32 %9}, i64 0, metadata !65), !dbg !210
  tail call void @llvm.dbg.value(metadata !186, i64 0, metadata !69), !dbg !211
  tail call void @llvm.dbg.value(metadata !213, i64 0, metadata !70), !dbg !211
  %10 = icmp sgt i32 %2, -1, !dbg !211
  br i1 %10, label %.lr.ph, label %30, !dbg !211

.lr.ph:                                           ; preds = %0
  %11 = icmp sgt i32 %to, %from
  %smax = select i1 %11, i32 %to, i32 %from
  %12 = xor i32 %to, -1, !dbg !211
  %13 = xor i32 %from, -1, !dbg !211
  %14 = icmp sgt i32 %12, %13
  %smax7 = select i1 %14, i32 %12, i32 %13
  %15 = add i32 %smax, %smax7, !dbg !211
  %16 = add i32 %15, 2, !dbg !211
  %17 = icmp sgt i32 %16, 1
  %.op = add i32 %smax, %smax7, !dbg !211
  %18 = select i1 %17, i32 %.op, i32 -1, !dbg !211
  br label %19, !dbg !211

; <label>:19                                      ; preds = %.lr.ph, %19
  %indvars.iv5 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next6, %19 ]
  %indvars.iv = phi i64 [ 1, %.lr.ph ], [ %indvars.iv.next, %19 ]
  %.14 = phi i32 [ %9, %.lr.ph ], [ %25, %19 ]
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1, !dbg !211
  %20 = getelementptr inbounds %struct.DLL* %8, i64 %indvars.iv.next6, !dbg !214
  %21 = getelementptr inbounds %struct.DLL* %8, i64 %indvars.iv5, i32 1, !dbg !214
  store %struct.DLL* %20, %struct.DLL** %21, align 8, !dbg !214, !tbaa !139
  %22 = add nsw i64 %indvars.iv, -1, !dbg !216
  %23 = getelementptr inbounds %struct.DLL* %8, i64 %22, !dbg !216
  %24 = getelementptr inbounds %struct.DLL* %8, i64 %indvars.iv, i32 2, !dbg !216
  store %struct.DLL* %23, %struct.DLL** %24, align 8, !dbg !216, !tbaa !132
  %25 = add nsw i32 %.14, 1, !dbg !217
  tail call void @llvm.dbg.value(metadata !{i32 %29}, i64 0, metadata !65), !dbg !217
  %26 = getelementptr inbounds %struct.DLL* %8, i64 %indvars.iv5, i32 0, !dbg !217
  store i32 %.14, i32* %26, align 4, !dbg !217, !tbaa !144
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !211
  %27 = trunc i64 %indvars.iv.next6 to i32, !dbg !211
  %28 = icmp slt i32 %27, %3, !dbg !211
  br i1 %28, label %19, label %._crit_edge, !dbg !211

._crit_edge:                                      ; preds = %19
  %29 = sub i32 %18, %smax7, !dbg !211
  br label %30, !dbg !211

; <label>:30                                      ; preds = %._crit_edge, %0
  %.1.lcssa = phi i32 [ %29, %._crit_edge ], [ %9, %0 ]
  %31 = sext i32 %3 to i64, !dbg !218
  %32 = getelementptr inbounds %struct.DLL* %8, i64 %31, !dbg !218
  %33 = getelementptr inbounds i8* %7, i64 16, !dbg !218
  %34 = bitcast i8* %33 to %struct.DLL**, !dbg !218
  store %struct.DLL* %32, %struct.DLL** %34, align 8, !dbg !218, !tbaa !132
  %35 = getelementptr inbounds %struct.DLL* %8, i64 %31, i32 1, !dbg !219
  store %struct.DLL* %8, %struct.DLL** %35, align 8, !dbg !219, !tbaa !139
  %36 = sext i32 %2 to i64, !dbg !220
  %37 = getelementptr inbounds %struct.DLL* %8, i64 %36, !dbg !220
  %38 = getelementptr inbounds %struct.DLL* %8, i64 %31, i32 2, !dbg !220
  store %struct.DLL* %37, %struct.DLL** %38, align 8, !dbg !220, !tbaa !132
  %39 = getelementptr inbounds %struct.DLL* %32, i64 0, i32 0, !dbg !221
  store i32 %.1.lcssa, i32* %39, align 4, !dbg !221, !tbaa !144
  %40 = bitcast i8* %7 to i32*, !dbg !222
  store i32 %3, i32* %40, align 4, !dbg !222, !tbaa !144
  ret %struct.DLL* %8, !dbg !223
}

; Function Attrs: nounwind uwtable
define %struct.DLL* @list_copy(%struct.DLL* nocapture readonly %x) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %x}, i64 0, metadata !74), !dbg !224
  %1 = tail call fastcc i32 @list_length(%struct.DLL* %x), !dbg !225
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !77), !dbg !225
  %2 = add nsw i32 %1, 1, !dbg !226
  %3 = sext i32 %2 to i64, !dbg !226
  %4 = mul i64 %3, 24, !dbg !226
  %5 = tail call noalias i8* @malloc(i64 %4) #6, !dbg !226
  %6 = bitcast i8* %5 to %struct.DLL*, !dbg !226
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %6}, i64 0, metadata !79), !dbg !226
  tail call void @llvm.dbg.value(metadata !186, i64 0, metadata !75), !dbg !227
  tail call void @llvm.dbg.value(metadata !213, i64 0, metadata !76), !dbg !227
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %x}, i64 0, metadata !78), !dbg !227
  %7 = icmp sgt i32 %1, 0, !dbg !227
  br i1 %7, label %.lr.ph, label %._crit_edge, !dbg !227

.lr.ph:                                           ; preds = %0, %.lr.ph
  %indvars.iv4 = phi i64 [ %indvars.iv.next5, %.lr.ph ], [ 1, %0 ]
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %0 ]
  %xp.02 = phi %struct.DLL* [ %16, %.lr.ph ], [ %x, %0 ]
  %8 = getelementptr inbounds %struct.DLL* %6, i64 %indvars.iv4, !dbg !229
  %9 = getelementptr inbounds %struct.DLL* %6, i64 %indvars.iv, !dbg !229
  %10 = getelementptr inbounds %struct.DLL* %6, i64 %indvars.iv, i32 1, !dbg !229
  store %struct.DLL* %8, %struct.DLL** %10, align 8, !dbg !229, !tbaa !139
  %11 = getelementptr inbounds %struct.DLL* %6, i64 %indvars.iv4, i32 2, !dbg !231
  store %struct.DLL* %9, %struct.DLL** %11, align 8, !dbg !231, !tbaa !132
  %12 = getelementptr inbounds %struct.DLL* %xp.02, i64 0, i32 0, !dbg !232
  %13 = load i32* %12, align 4, !dbg !232, !tbaa !144
  %14 = getelementptr inbounds %struct.DLL* %9, i64 0, i32 0, !dbg !232
  store i32 %13, i32* %14, align 4, !dbg !232, !tbaa !144
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !227
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1, !dbg !227
  %15 = getelementptr inbounds %struct.DLL* %xp.02, i64 0, i32 1, !dbg !227
  %16 = load %struct.DLL** %15, align 8, !dbg !227, !tbaa !139
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %16}, i64 0, metadata !78), !dbg !227
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !227
  %exitcond = icmp eq i32 %lftr.wideiv, %1, !dbg !227
  br i1 %exitcond, label %._crit_edge, label %.lr.ph, !dbg !227

._crit_edge:                                      ; preds = %.lr.ph, %0
  %17 = sext i32 %1 to i64, !dbg !233
  %18 = getelementptr inbounds %struct.DLL* %6, i64 %17, !dbg !233
  %19 = getelementptr inbounds i8* %5, i64 16, !dbg !233
  %20 = bitcast i8* %19 to %struct.DLL**, !dbg !233
  store %struct.DLL* %18, %struct.DLL** %20, align 8, !dbg !233, !tbaa !132
  %21 = getelementptr inbounds %struct.DLL* %6, i64 %17, i32 1, !dbg !234
  store %struct.DLL* %6, %struct.DLL** %21, align 8, !dbg !234, !tbaa !139
  %22 = tail call fastcc %struct.DLL* @list_last(%struct.DLL* %x), !dbg !235
  %23 = getelementptr inbounds %struct.DLL* %22, i64 0, i32 0, !dbg !235
  %24 = load i32* %23, align 4, !dbg !235, !tbaa !144
  %25 = getelementptr inbounds %struct.DLL* %18, i64 0, i32 0, !dbg !235
  store i32 %24, i32* %25, align 4, !dbg !235, !tbaa !144
  ret %struct.DLL* %6, !dbg !236
}

; Function Attrs: nounwind readonly uwtable
define internal fastcc %struct.DLL* @list_last(%struct.DLL* nocapture readonly %head) #1 {
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %head}, i64 0, metadata !118), !dbg !237
  %1 = getelementptr inbounds %struct.DLL* %head, i64 0, i32 2, !dbg !237
  %2 = load %struct.DLL** %1, align 8, !dbg !237, !tbaa !132
  ret %struct.DLL* %2, !dbg !237
}

; Function Attrs: nounwind uwtable
define void @list_reverse(%struct.DLL* %head) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %head}, i64 0, metadata !84), !dbg !238
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %head}, i64 0, metadata !86), !dbg !239
  br label %1, !dbg !240

; <label>:1                                       ; preds = %1, %0
  %p.0 = phi %struct.DLL* [ %head, %0 ], [ %3, %1 ]
  %2 = getelementptr inbounds %struct.DLL* %p.0, i64 0, i32 1, !dbg !241
  %3 = load %struct.DLL** %2, align 8, !dbg !241, !tbaa !139
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %3}, i64 0, metadata !85), !dbg !241
  %4 = getelementptr inbounds %struct.DLL* %p.0, i64 0, i32 2, !dbg !243
  %5 = load %struct.DLL** %4, align 8, !dbg !243, !tbaa !132
  store %struct.DLL* %5, %struct.DLL** %2, align 8, !dbg !243, !tbaa !139
  store %struct.DLL* %3, %struct.DLL** %4, align 8, !dbg !244, !tbaa !132
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %3}, i64 0, metadata !86), !dbg !245
  %6 = icmp eq %struct.DLL* %3, %head, !dbg !246
  br i1 %6, label %7, label %1, !dbg !246

; <label>:7                                       ; preds = %1
  ret void, !dbg !247
}

; Function Attrs: nounwind uwtable
define i32 @test_lists() #0 {
  tail call void @llvm.dbg.value(metadata !186, i64 0, metadata !91), !dbg !248
  %1 = tail call %struct.DLL* @list_sequence(i32 1, i32 100), !dbg !249
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %1}, i64 0, metadata !92), !dbg !249
  %2 = tail call %struct.DLL* @list_copy(%struct.DLL* %1), !dbg !250
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %2}, i64 0, metadata !93), !dbg !250
  %3 = tail call %struct.DLL* @list_new(), !dbg !251
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %3}, i64 0, metadata !94), !dbg !251
  %4 = tail call i32 @list_equal(%struct.DLL* %2, %struct.DLL* %1), !dbg !252
  %5 = icmp eq i32 %4, 0, !dbg !252
  br i1 %5, label %8, label %.preheader4, !dbg !252

.preheader4:                                      ; preds = %0
  %6 = tail call fastcc i32 @list_empty(%struct.DLL* %2), !dbg !254
  %7 = icmp eq i32 %6, 0, !dbg !254
  br i1 %7, label %.lr.ph5, label %.preheader, !dbg !254

; <label>:8                                       ; preds = %0
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([26 x i8]* @str13, i64 0, i64 0)) #6, !dbg !255
  tail call void @exit(i32 1) #7, !dbg !257
  unreachable, !dbg !257

.preheader:                                       ; preds = %.lr.ph5, %.preheader4
  %9 = tail call fastcc i32 @list_empty(%struct.DLL* %3), !dbg !258
  %10 = icmp eq i32 %9, 0, !dbg !258
  br i1 %10, label %.lr.ph, label %._crit_edge, !dbg !258

.lr.ph5:                                          ; preds = %.preheader4, %.lr.ph5
  %11 = tail call %struct.DLL* @list_pop_head(%struct.DLL* %2), !dbg !259
  tail call void @list_push_tail(%struct.DLL* %3, %struct.DLL* %11), !dbg !259
  %12 = tail call fastcc i32 @list_empty(%struct.DLL* %2), !dbg !254
  %13 = icmp eq i32 %12, 0, !dbg !254
  br i1 %13, label %.lr.ph5, label %.preheader, !dbg !254

.lr.ph:                                           ; preds = %.preheader, %.lr.ph
  %14 = tail call %struct.DLL* @list_pop_tail(%struct.DLL* %3), !dbg !261
  tail call void @list_push_tail(%struct.DLL* %2, %struct.DLL* %14), !dbg !261
  %15 = tail call fastcc i32 @list_empty(%struct.DLL* %3), !dbg !258
  %16 = icmp eq i32 %15, 0, !dbg !258
  br i1 %16, label %.lr.ph, label %._crit_edge, !dbg !258

._crit_edge:                                      ; preds = %.lr.ph, %.preheader
  tail call void @list_reverse(%struct.DLL* %1), !dbg !263
  %17 = tail call fastcc %struct.DLL* @list_first(%struct.DLL* %1), !dbg !264
  %18 = getelementptr inbounds %struct.DLL* %17, i64 0, i32 0, !dbg !264
  %19 = load i32* %18, align 4, !dbg !264, !tbaa !144
  %20 = icmp eq i32 %19, 100, !dbg !264
  br i1 %20, label %23, label %21, !dbg !264

; <label>:21                                      ; preds = %._crit_edge
  %22 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([42 x i8]* @.str7, i64 0, i64 0), i32 100, i32 %19) #6, !dbg !266
  tail call void @exit(i32 1) #7, !dbg !268
  unreachable, !dbg !268

; <label>:23                                      ; preds = %._crit_edge
  %24 = tail call fastcc %struct.DLL* @list_last(%struct.DLL* %1), !dbg !269
  %25 = getelementptr inbounds %struct.DLL* %24, i64 0, i32 0, !dbg !269
  %26 = load i32* %25, align 4, !dbg !269, !tbaa !144
  %27 = icmp eq i32 %26, 1, !dbg !269
  br i1 %27, label %30, label %28, !dbg !269

; <label>:28                                      ; preds = %23
  %29 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str8, i64 0, i64 0), i32 100, i32 %26) #6, !dbg !271
  tail call void @exit(i32 1) #7, !dbg !273
  unreachable, !dbg !273

; <label>:30                                      ; preds = %23
  %31 = tail call fastcc %struct.DLL* @list_first(%struct.DLL* %2), !dbg !274
  %32 = getelementptr inbounds %struct.DLL* %31, i64 0, i32 0, !dbg !274
  %33 = load i32* %32, align 4, !dbg !274, !tbaa !144
  %34 = icmp eq i32 %33, 100, !dbg !274
  br i1 %34, label %37, label %35, !dbg !274

; <label>:35                                      ; preds = %30
  %36 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([42 x i8]* @.str9, i64 0, i64 0), i32 100, i32 %33) #6, !dbg !276
  tail call void @exit(i32 1) #7, !dbg !278
  unreachable, !dbg !278

; <label>:37                                      ; preds = %30
  %38 = tail call fastcc %struct.DLL* @list_last(%struct.DLL* %2), !dbg !279
  %39 = getelementptr inbounds %struct.DLL* %38, i64 0, i32 0, !dbg !279
  %40 = load i32* %39, align 4, !dbg !279, !tbaa !144
  %41 = icmp eq i32 %40, 1, !dbg !279
  br i1 %41, label %44, label %42, !dbg !279

; <label>:42                                      ; preds = %37
  %43 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str8, i64 0, i64 0), i32 100, i32 %40) #6, !dbg !281
  tail call void @exit(i32 1) #7, !dbg !283
  unreachable, !dbg !283

; <label>:44                                      ; preds = %37
  %45 = tail call fastcc i32 @list_length(%struct.DLL* %1), !dbg !284
  %46 = icmp eq i32 %45, 100, !dbg !284
  br i1 %46, label %49, label %47, !dbg !284

; <label>:47                                      ; preds = %44
  %48 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([35 x i8]* @.str10, i64 0, i64 0), i32 100, i32 %45) #6, !dbg !286
  tail call void @exit(i32 1) #7, !dbg !288
  unreachable, !dbg !288

; <label>:49                                      ; preds = %44
  %50 = tail call i32 @list_equal(%struct.DLL* %1, %struct.DLL* %2), !dbg !289
  %51 = icmp eq i32 %50, 0, !dbg !289
  br i1 %51, label %52, label %53, !dbg !289

; <label>:52                                      ; preds = %49
  %puts3 = tail call i32 @puts(i8* getelementptr inbounds ([26 x i8]* @str16, i64 0, i64 0)) #6, !dbg !291
  tail call void @exit(i32 1) #7, !dbg !293
  unreachable, !dbg !293

; <label>:53                                      ; preds = %49
  tail call void @llvm.dbg.value(metadata !{i32 %45}, i64 0, metadata !91), !dbg !294
  %54 = bitcast %struct.DLL* %1 to i8*, !dbg !295
  tail call void @free(i8* %54) #6, !dbg !295
  %55 = bitcast %struct.DLL* %2 to i8*, !dbg !296
  tail call void @free(i8* %55) #6, !dbg !296
  %56 = bitcast %struct.DLL* %3 to i8*, !dbg !297
  tail call void @free(i8* %56) #6, !dbg !297
  ret i32 %45, !dbg !298
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

; Function Attrs: nounwind readonly uwtable
define internal fastcc %struct.DLL* @list_first(%struct.DLL* nocapture readonly %head) #1 {
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %head}, i64 0, metadata !115), !dbg !299
  %1 = getelementptr inbounds %struct.DLL* %head, i64 0, i32 1, !dbg !300
  %2 = load %struct.DLL** %1, align 8, !dbg !300, !tbaa !139
  ret %struct.DLL* %2, !dbg !300
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #2

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !100), !dbg !302
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !101), !dbg !302
  %1 = icmp eq i32 %argc, 2, !dbg !303
  br i1 %1, label %.preheader, label %.lr.ph, !dbg !303

.preheader:                                       ; preds = %0
  %2 = getelementptr inbounds i8** %argv, i64 1, !dbg !304
  %3 = load i8** %2, align 8, !dbg !304, !tbaa !305
  %4 = tail call i32 @atoi(i8* %3) #8, !dbg !304
  tail call void @llvm.dbg.value(metadata !{i32 %6}, i64 0, metadata !102), !dbg !306
  %5 = icmp eq i32 %4, 0, !dbg !306
  br i1 %5, label %._crit_edge, label %.lr.ph, !dbg !306

.lr.ph:                                           ; preds = %0, %.preheader, %.lr.ph
  %n.01 = phi i32 [ %6, %.lr.ph ], [ 3000000, %0 ], [ %4, %.preheader ]
  %6 = add nsw i32 %n.01, -1, !dbg !306
  %7 = tail call i32 @test_lists(), !dbg !306
  tail call void @llvm.dbg.value(metadata !{i32 %7}, i64 0, metadata !103), !dbg !306
  tail call void @llvm.dbg.value(metadata !{i32 %6}, i64 0, metadata !102), !dbg !306
  %8 = icmp eq i32 %6, 0, !dbg !306
  br i1 %8, label %._crit_edge, label %.lr.ph, !dbg !306

._crit_edge:                                      ; preds = %.lr.ph, %.preheader
  %result.0.lcssa = phi i32 [ 0, %.preheader ], [ %7, %.lr.ph ]
  %9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str12, i64 0, i64 0), i32 %result.0.lcssa) #6, !dbg !307
  ret i32 0, !dbg !308
}

; Function Attrs: inlinehint nounwind readonly uwtable
define available_externally i32 @atoi(i8* nocapture readonly %__nptr) #4 {
  tail call void @llvm.dbg.value(metadata !{i8* %__nptr}, i64 0, metadata !112), !dbg !309
  %1 = tail call i64 @strtol(i8* nocapture %__nptr, i8** null, i32 10) #6, !dbg !310
  %2 = trunc i64 %1 to i32, !dbg !310
  ret i32 %2, !dbg !310
}

; Function Attrs: nounwind
declare i64 @strtol(i8* readonly, i8** nocapture, i32) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #5

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
!104 = metadata !{i32 786478, metadata !105, metadata !106, metadata !"atoi", metadata !"atoi", metadata !"", i32 278, metadata !107, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @atoi, null, null, metadata !111, i32 279} ; [ DW_TAG_subprogram ] [line 278] [def] [scope 279] [atoi]
!105 = metadata !{metadata !"/usr/include/stdlib.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!106 = metadata !{i32 786473, metadata !105}      ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base//usr/include/stdlib.h]
!107 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !108, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!108 = metadata !{metadata !13, metadata !109}
!109 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !110} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!110 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !49} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!111 = metadata !{metadata !112}
!112 = metadata !{i32 786689, metadata !104, metadata !"__nptr", metadata !106, i32 16777494, metadata !109, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [__nptr] [line 278]
!113 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"list_first", metadata !"list_first", metadata !"", i32 23, metadata !22, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, %struct.DLL* (%struct.DLL*)* @list_first, null, null, metadata !114, i32 23} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [list_first]
!114 = metadata !{metadata !115}
!115 = metadata !{i32 786689, metadata !113, metadata !"head", metadata !5, i32 16777239, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [head] [line 23]
!116 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"list_last", metadata !"list_last", metadata !"", i32 24, metadata !22, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, %struct.DLL* (%struct.DLL*)* @list_last, null, null, metadata !117, i32 24} ; [ DW_TAG_subprogram ] [line 24] [local] [def] [list_last]
!117 = metadata !{metadata !118}
!118 = metadata !{i32 786689, metadata !116, metadata !"head", metadata !5, i32 16777240, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [head] [line 24]
!119 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"list_length", metadata !"list_length", metadata !"", i32 21, metadata !120, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.DLL*)* @list_length, null, null, metadata !122, i32 21} ; [ DW_TAG_subprogram ] [line 21] [local] [def] [list_length]
!120 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !121, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!121 = metadata !{metadata !13, metadata !8}
!122 = metadata !{metadata !123}
!123 = metadata !{i32 786689, metadata !119, metadata !"head", metadata !5, i32 16777237, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [head] [line 21]
!124 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"list_empty", metadata !"list_empty", metadata !"", i32 22, metadata !120, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.DLL*)* @list_empty, null, null, metadata !125, i32 22} ; [ DW_TAG_subprogram ] [line 22] [local] [def] [list_empty]
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
!147 = metadata !{i32 37, i32 0, metadata !148, null}
!148 = metadata !{i32 786443, metadata !1, metadata !21, i32 37, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!149 = metadata !{i32 38, i32 0, metadata !21, null}
!150 = metadata !{i32 39, i32 0, metadata !21, null}
!151 = metadata !{i32 40, i32 0, metadata !21, null}
!152 = metadata !{i32 41, i32 0, metadata !21, null}
!153 = metadata !{i32 42, i32 0, metadata !21, null}
!154 = metadata !{i32 43, i32 0, metadata !21, null}
!155 = metadata !{i32 44, i32 0, metadata !21, null}
!156 = metadata !{i32 22, i32 0, metadata !124, null}
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
!197 = metadata !{i32 21, i32 0, metadata !119, null}
!198 = metadata !{i32 89, i32 0, metadata !56, null}
!199 = metadata !{i32 90, i32 0, metadata !56, null}
!200 = metadata !{i32 91, i32 0, metadata !56, null}
!201 = metadata !{i32 92, i32 0, metadata !56, null}
!202 = metadata !{i32 93, i32 0, metadata !56, null}
!203 = metadata !{i32 97, i32 0, metadata !61, null}
!204 = metadata !{i32 100, i32 0, metadata !205, null}
!205 = metadata !{i32 786443, metadata !1, metadata !61, i32 100, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!206 = metadata !{i32 101, i32 0, metadata !207, null}
!207 = metadata !{i32 786443, metadata !1, metadata !205, i32 100, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!208 = metadata !{i32 103, i32 0, metadata !61, null}
!209 = metadata !{i32 104, i32 0, metadata !61, null}
!210 = metadata !{i32 105, i32 0, metadata !61, null}
!211 = metadata !{i32 106, i32 0, metadata !212, null}
!212 = metadata !{i32 786443, metadata !1, metadata !61, i32 106, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!213 = metadata !{i32 1}
!214 = metadata !{i32 107, i32 0, metadata !215, null}
!215 = metadata !{i32 786443, metadata !1, metadata !212, i32 106, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!216 = metadata !{i32 108, i32 0, metadata !215, null}
!217 = metadata !{i32 109, i32 0, metadata !215, null}
!218 = metadata !{i32 111, i32 0, metadata !61, null}
!219 = metadata !{i32 112, i32 0, metadata !61, null}
!220 = metadata !{i32 113, i32 0, metadata !61, null}
!221 = metadata !{i32 114, i32 0, metadata !61, null}
!222 = metadata !{i32 115, i32 0, metadata !61, null}
!223 = metadata !{i32 116, i32 0, metadata !61, null}
!224 = metadata !{i32 118, i32 0, metadata !72, null}
!225 = metadata !{i32 119, i32 0, metadata !72, null}
!226 = metadata !{i32 120, i32 0, metadata !72, null}
!227 = metadata !{i32 121, i32 0, metadata !228, null}
!228 = metadata !{i32 786443, metadata !1, metadata !72, i32 121, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!229 = metadata !{i32 122, i32 0, metadata !230, null}
!230 = metadata !{i32 786443, metadata !1, metadata !228, i32 121, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!231 = metadata !{i32 123, i32 0, metadata !230, null}
!232 = metadata !{i32 124, i32 0, metadata !230, null}
!233 = metadata !{i32 126, i32 0, metadata !72, null}
!234 = metadata !{i32 127, i32 0, metadata !72, null}
!235 = metadata !{i32 128, i32 0, metadata !72, null}
!236 = metadata !{i32 129, i32 0, metadata !72, null}
!237 = metadata !{i32 24, i32 0, metadata !116, null}
!238 = metadata !{i32 132, i32 0, metadata !80, null}
!239 = metadata !{i32 133, i32 0, metadata !80, null}
!240 = metadata !{i32 134, i32 0, metadata !80, null}
!241 = metadata !{i32 135, i32 0, metadata !242, null}
!242 = metadata !{i32 786443, metadata !1, metadata !80, i32 134, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!243 = metadata !{i32 136, i32 0, metadata !242, null}
!244 = metadata !{i32 137, i32 0, metadata !242, null}
!245 = metadata !{i32 138, i32 0, metadata !242, null}
!246 = metadata !{i32 139, i32 0, metadata !242, null}
!247 = metadata !{i32 140, i32 0, metadata !80, null}
!248 = metadata !{i32 143, i32 0, metadata !87, null}
!249 = metadata !{i32 145, i32 0, metadata !87, null}
!250 = metadata !{i32 147, i32 0, metadata !87, null}
!251 = metadata !{i32 150, i32 0, metadata !87, null}
!252 = metadata !{i32 152, i32 0, metadata !253, null}
!253 = metadata !{i32 786443, metadata !1, metadata !87, i32 152, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!254 = metadata !{i32 156, i32 0, metadata !87, null}
!255 = metadata !{i32 153, i32 0, metadata !256, null}
!256 = metadata !{i32 786443, metadata !1, metadata !253, i32 152, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!257 = metadata !{i32 154, i32 0, metadata !256, null}
!258 = metadata !{i32 166, i32 0, metadata !87, null}
!259 = metadata !{i32 157, i32 0, metadata !260, null}
!260 = metadata !{i32 786443, metadata !1, metadata !87, i32 156, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!261 = metadata !{i32 167, i32 0, metadata !262, null}
!262 = metadata !{i32 786443, metadata !1, metadata !87, i32 166, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!263 = metadata !{i32 175, i32 0, metadata !87, null}
!264 = metadata !{i32 177, i32 0, metadata !265, null}
!265 = metadata !{i32 786443, metadata !1, metadata !87, i32 177, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!266 = metadata !{i32 178, i32 0, metadata !267, null}
!267 = metadata !{i32 786443, metadata !1, metadata !265, i32 177, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!268 = metadata !{i32 180, i32 0, metadata !267, null}
!269 = metadata !{i32 183, i32 0, metadata !270, null}
!270 = metadata !{i32 786443, metadata !1, metadata !87, i32 183, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!271 = metadata !{i32 184, i32 0, metadata !272, null}
!272 = metadata !{i32 786443, metadata !1, metadata !270, i32 183, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!273 = metadata !{i32 186, i32 0, metadata !272, null}
!274 = metadata !{i32 189, i32 0, metadata !275, null}
!275 = metadata !{i32 786443, metadata !1, metadata !87, i32 189, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!276 = metadata !{i32 190, i32 0, metadata !277, null}
!277 = metadata !{i32 786443, metadata !1, metadata !275, i32 189, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!278 = metadata !{i32 192, i32 0, metadata !277, null}
!279 = metadata !{i32 195, i32 0, metadata !280, null}
!280 = metadata !{i32 786443, metadata !1, metadata !87, i32 195, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!281 = metadata !{i32 196, i32 0, metadata !282, null}
!282 = metadata !{i32 786443, metadata !1, metadata !280, i32 195, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!283 = metadata !{i32 198, i32 0, metadata !282, null}
!284 = metadata !{i32 201, i32 0, metadata !285, null}
!285 = metadata !{i32 786443, metadata !1, metadata !87, i32 201, i32 0, i32 31} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!286 = metadata !{i32 202, i32 0, metadata !287, null}
!287 = metadata !{i32 786443, metadata !1, metadata !285, i32 201, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!288 = metadata !{i32 204, i32 0, metadata !287, null}
!289 = metadata !{i32 207, i32 0, metadata !290, null}
!290 = metadata !{i32 786443, metadata !1, metadata !87, i32 207, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!291 = metadata !{i32 208, i32 0, metadata !292, null}
!292 = metadata !{i32 786443, metadata !1, metadata !290, i32 207, i32 0, i32 34} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!293 = metadata !{i32 209, i32 0, metadata !292, null}
!294 = metadata !{i32 211, i32 0, metadata !87, null}
!295 = metadata !{i32 212, i32 0, metadata !87, null}
!296 = metadata !{i32 213, i32 0, metadata !87, null}
!297 = metadata !{i32 214, i32 0, metadata !87, null}
!298 = metadata !{i32 216, i32 0, metadata !87, null}
!299 = metadata !{i32 23, i32 0, metadata !113, null}
!300 = metadata !{i32 23, i32 0, metadata !301, null}
!301 = metadata !{i32 786443, metadata !1, metadata !113} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!302 = metadata !{i32 219, i32 0, metadata !95, null}
!303 = metadata !{i32 225, i32 0, metadata !95, null}
!304 = metadata !{i32 225, i32 26, metadata !95, null}
!305 = metadata !{metadata !137, metadata !137, i64 0}
!306 = metadata !{i32 227, i32 0, metadata !95, null}
!307 = metadata !{i32 228, i32 0, metadata !95, null}
!308 = metadata !{i32 229, i32 0, metadata !95, null}
!309 = metadata !{i32 278, i32 0, metadata !104, null}
!310 = metadata !{i32 280, i32 0, metadata !311, null}
!311 = metadata !{i32 786443, metadata !105, metadata !104} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base//usr/include/stdlib.h]
