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

; Function Attrs: minsize nounwind optsize uwtable
define void @list_push_tail(%struct.DLL* %head, %struct.DLL* %item) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %head}, i64 0, metadata !18), !dbg !121
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %item}, i64 0, metadata !19), !dbg !121
  %1 = getelementptr inbounds %struct.DLL* %head, i64 0, i32 2, !dbg !122
  %2 = load %struct.DLL** %1, align 8, !dbg !122, !tbaa !123
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %2}, i64 0, metadata !20), !dbg !122
  %3 = getelementptr inbounds %struct.DLL* %2, i64 0, i32 1, !dbg !129
  store %struct.DLL* %item, %struct.DLL** %3, align 8, !dbg !129, !tbaa !130
  %4 = getelementptr inbounds %struct.DLL* %item, i64 0, i32 1, !dbg !131
  store %struct.DLL* %head, %struct.DLL** %4, align 8, !dbg !131, !tbaa !130
  store %struct.DLL* %item, %struct.DLL** %1, align 8, !dbg !132, !tbaa !123
  %5 = getelementptr inbounds %struct.DLL* %item, i64 0, i32 2, !dbg !133
  store %struct.DLL* %2, %struct.DLL** %5, align 8, !dbg !133, !tbaa !123
  %6 = getelementptr inbounds %struct.DLL* %head, i64 0, i32 0, !dbg !134
  %7 = load i32* %6, align 4, !dbg !134, !tbaa !135
  %8 = add nsw i32 %7, 1, !dbg !134
  store i32 %8, i32* %6, align 4, !dbg !134, !tbaa !135
  ret void, !dbg !136
}

; Function Attrs: minsize nounwind optsize uwtable
define %struct.DLL* @list_pop_tail(%struct.DLL* %head) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %head}, i64 0, metadata !25), !dbg !137
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %head}, i64 0, metadata !138), !dbg !141
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %head}, i64 0, metadata !142), !dbg !143
  %1 = getelementptr inbounds %struct.DLL* %head, i64 0, i32 0, !dbg !143
  %2 = load i32* %1, align 4, !dbg !143, !tbaa !135
  %3 = icmp eq i32 %2, 0, !dbg !141
  br i1 %3, label %11, label %4, !dbg !139

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds %struct.DLL* %head, i64 0, i32 2, !dbg !144
  %6 = load %struct.DLL** %5, align 8, !dbg !144, !tbaa !123
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %6}, i64 0, metadata !27), !dbg !144
  %7 = getelementptr inbounds %struct.DLL* %6, i64 0, i32 2, !dbg !145
  %8 = load %struct.DLL** %7, align 8, !dbg !145, !tbaa !123
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %8}, i64 0, metadata !26), !dbg !145
  %9 = getelementptr inbounds %struct.DLL* %8, i64 0, i32 1, !dbg !146
  store %struct.DLL* %head, %struct.DLL** %9, align 8, !dbg !146, !tbaa !130
  store %struct.DLL* %8, %struct.DLL** %5, align 8, !dbg !147, !tbaa !123
  %10 = add nsw i32 %2, -1, !dbg !148
  store i32 %10, i32* %1, align 4, !dbg !148, !tbaa !135
  br label %11, !dbg !149

; <label>:11                                      ; preds = %0, %4
  %.0 = phi %struct.DLL* [ %6, %4 ], [ null, %0 ]
  ret %struct.DLL* %.0, !dbg !150
}

; Function Attrs: minsize nounwind optsize uwtable
define void @list_push_head(%struct.DLL* %head, %struct.DLL* %item) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %head}, i64 0, metadata !30), !dbg !151
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %item}, i64 0, metadata !31), !dbg !151
  %1 = getelementptr inbounds %struct.DLL* %head, i64 0, i32 1, !dbg !152
  %2 = load %struct.DLL** %1, align 8, !dbg !152, !tbaa !130
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %2}, i64 0, metadata !32), !dbg !152
  store %struct.DLL* %item, %struct.DLL** %1, align 8, !dbg !153, !tbaa !130
  %3 = getelementptr inbounds %struct.DLL* %2, i64 0, i32 2, !dbg !154
  store %struct.DLL* %item, %struct.DLL** %3, align 8, !dbg !154, !tbaa !123
  %4 = getelementptr inbounds %struct.DLL* %item, i64 0, i32 1, !dbg !155
  store %struct.DLL* %2, %struct.DLL** %4, align 8, !dbg !155, !tbaa !130
  %5 = getelementptr inbounds %struct.DLL* %item, i64 0, i32 2, !dbg !156
  store %struct.DLL* %head, %struct.DLL** %5, align 8, !dbg !156, !tbaa !123
  %6 = getelementptr inbounds %struct.DLL* %head, i64 0, i32 0, !dbg !157
  %7 = load i32* %6, align 4, !dbg !157, !tbaa !135
  %8 = add nsw i32 %7, 1, !dbg !157
  store i32 %8, i32* %6, align 4, !dbg !157, !tbaa !135
  ret void, !dbg !158
}

; Function Attrs: minsize nounwind optsize uwtable
define %struct.DLL* @list_pop_head(%struct.DLL* %head) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %head}, i64 0, metadata !35), !dbg !159
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %head}, i64 0, metadata !160), !dbg !163
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %head}, i64 0, metadata !164), !dbg !165
  %1 = getelementptr inbounds %struct.DLL* %head, i64 0, i32 0, !dbg !165
  %2 = load i32* %1, align 4, !dbg !165, !tbaa !135
  %3 = icmp eq i32 %2, 0, !dbg !163
  br i1 %3, label %12, label %4, !dbg !161

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds %struct.DLL* %head, i64 0, i32 1, !dbg !166
  %6 = load %struct.DLL** %5, align 8, !dbg !166, !tbaa !130
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %6}, i64 0, metadata !36), !dbg !166
  %7 = getelementptr inbounds %struct.DLL* %6, i64 0, i32 1, !dbg !167
  %8 = load %struct.DLL** %7, align 8, !dbg !167, !tbaa !130
  store %struct.DLL* %8, %struct.DLL** %5, align 8, !dbg !167, !tbaa !130
  %9 = load %struct.DLL** %7, align 8, !dbg !168, !tbaa !130
  %10 = getelementptr inbounds %struct.DLL* %9, i64 0, i32 2, !dbg !168
  store %struct.DLL* %head, %struct.DLL** %10, align 8, !dbg !168, !tbaa !123
  %11 = add nsw i32 %2, -1, !dbg !169
  store i32 %11, i32* %1, align 4, !dbg !169, !tbaa !135
  br label %12, !dbg !170

; <label>:12                                      ; preds = %0, %4
  %.0 = phi %struct.DLL* [ %6, %4 ], [ null, %0 ]
  ret %struct.DLL* %.0, !dbg !171
}

; Function Attrs: minsize nounwind optsize readonly uwtable
define i32 @list_equal(%struct.DLL* readonly %x, %struct.DLL* readonly %y) #1 {
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %x}, i64 0, metadata !41), !dbg !172
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %y}, i64 0, metadata !42), !dbg !172
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %x}, i64 0, metadata !43), !dbg !173
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %y}, i64 0, metadata !44), !dbg !173
  %1 = getelementptr inbounds %struct.DLL* %x, i64 0, i32 1, !dbg !173
  %2 = load %struct.DLL** %1, align 8, !dbg !173, !tbaa !130
  %3 = icmp eq %struct.DLL* %2, %x, !dbg !173
  %4 = getelementptr inbounds %struct.DLL* %x, i64 0, i32 0, !dbg !175
  %5 = load i32* %4, align 4, !dbg !175, !tbaa !135
  %6 = getelementptr inbounds %struct.DLL* %y, i64 0, i32 0, !dbg !175
  %7 = load i32* %6, align 4, !dbg !175, !tbaa !135
  %8 = icmp ne i32 %5, %7, !dbg !175
  br i1 %3, label %._crit_edge, label %.lr.ph, !dbg !173

.lr.ph:                                           ; preds = %0, %11
  %9 = phi i1 [ %21, %11 ], [ %8, %0 ]
  %10 = phi %struct.DLL* [ %15, %11 ], [ %2, %0 ]
  %yp.03 = phi %struct.DLL* [ %13, %11 ], [ %y, %0 ]
  br i1 %9, label %.loopexit, label %11, !dbg !175

; <label>:11                                      ; preds = %.lr.ph
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %10}, i64 0, metadata !43), !dbg !173
  %12 = getelementptr inbounds %struct.DLL* %yp.03, i64 0, i32 1, !dbg !173
  %13 = load %struct.DLL** %12, align 8, !dbg !173, !tbaa !130
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %13}, i64 0, metadata !44), !dbg !173
  %14 = getelementptr inbounds %struct.DLL* %10, i64 0, i32 1, !dbg !173
  %15 = load %struct.DLL** %14, align 8, !dbg !173, !tbaa !130
  %16 = icmp eq %struct.DLL* %15, %x, !dbg !173
  %17 = getelementptr inbounds %struct.DLL* %10, i64 0, i32 0, !dbg !175
  %18 = load i32* %17, align 4, !dbg !175, !tbaa !135
  %19 = getelementptr inbounds %struct.DLL* %13, i64 0, i32 0, !dbg !175
  %20 = load i32* %19, align 4, !dbg !175, !tbaa !135
  %21 = icmp ne i32 %18, %20, !dbg !175
  br i1 %16, label %._crit_edge, label %.lr.ph, !dbg !173

._crit_edge:                                      ; preds = %11, %0
  %.lcssa = phi i1 [ %8, %0 ], [ %21, %11 ]
  %yp.0.lcssa = phi %struct.DLL* [ %y, %0 ], [ %13, %11 ]
  br i1 %.lcssa, label %.loopexit, label %22, !dbg !178

; <label>:22                                      ; preds = %._crit_edge
  %23 = getelementptr inbounds %struct.DLL* %yp.0.lcssa, i64 0, i32 1, !dbg !180
  %24 = load %struct.DLL** %23, align 8, !dbg !180, !tbaa !130
  %25 = icmp eq %struct.DLL* %24, %y, !dbg !180
  %26 = zext i1 %25 to i32, !dbg !180
  br label %.loopexit, !dbg !180

.loopexit:                                        ; preds = %.lr.ph, %._crit_edge, %22
  %.0 = phi i32 [ %26, %22 ], [ 0, %._crit_edge ], [ 0, %.lr.ph ]
  ret i32 %.0, !dbg !181
}

; Function Attrs: minsize nounwind optsize uwtable
define void @list_print(i8* nocapture readonly %msg, %struct.DLL* nocapture readonly %x) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %msg}, i64 0, metadata !51), !dbg !182
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %x}, i64 0, metadata !52), !dbg !182
  %1 = getelementptr inbounds %struct.DLL* %x, i64 0, i32 1, !dbg !183
  %2 = load %struct.DLL** %1, align 8, !dbg !183, !tbaa !130
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %2}, i64 0, metadata !54), !dbg !183
  tail call void @llvm.dbg.value(metadata !184, i64 0, metadata !55), !dbg !185
  %3 = tail call i32 @puts(i8* %msg) #6, !dbg !186
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %x}, i64 0, metadata !187), !dbg !189
  %4 = getelementptr inbounds %struct.DLL* %x, i64 0, i32 0, !dbg !189
  %5 = load i32* %4, align 4, !dbg !189, !tbaa !135
  %6 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i32 %5) #6, !dbg !188
  %xp.01 = load %struct.DLL** %1, align 8, !dbg !190
  %7 = getelementptr inbounds %struct.DLL* %xp.01, i64 0, i32 1, !dbg !190
  %8 = load %struct.DLL** %7, align 8, !dbg !190, !tbaa !130
  %9 = icmp eq %struct.DLL* %8, %2, !dbg !190
  br i1 %9, label %._crit_edge, label %.lr.ph, !dbg !190

.lr.ph:                                           ; preds = %0, %.lr.ph
  %10 = phi %struct.DLL* [ %23, %.lr.ph ], [ %8, %0 ]
  %11 = phi %struct.DLL** [ %22, %.lr.ph ], [ %7, %0 ]
  %xp.03 = phi %struct.DLL* [ %xp.0, %.lr.ph ], [ %xp.01, %0 ]
  %i.02 = phi i32 [ %12, %.lr.ph ], [ 0, %0 ]
  %12 = add nsw i32 %i.02, 1, !dbg !192
  tail call void @llvm.dbg.value(metadata !{i32 %12}, i64 0, metadata !55), !dbg !192
  %13 = getelementptr inbounds %struct.DLL* %xp.03, i64 0, i32 0, !dbg !192
  %14 = load i32* %13, align 4, !dbg !192, !tbaa !135
  %15 = getelementptr inbounds %struct.DLL* %10, i64 0, i32 0, !dbg !192
  %16 = load i32* %15, align 4, !dbg !192, !tbaa !135
  %17 = getelementptr inbounds %struct.DLL* %xp.03, i64 0, i32 2, !dbg !192
  %18 = load %struct.DLL** %17, align 8, !dbg !192, !tbaa !123
  %19 = getelementptr inbounds %struct.DLL* %18, i64 0, i32 0, !dbg !192
  %20 = load i32* %19, align 4, !dbg !192, !tbaa !135
  %21 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str1, i64 0, i64 0), i32 %12, i32 %14, i32 %16, i32 %20) #6, !dbg !192
  %xp.0 = load %struct.DLL** %11, align 8, !dbg !190
  %22 = getelementptr inbounds %struct.DLL* %xp.0, i64 0, i32 1, !dbg !190
  %23 = load %struct.DLL** %22, align 8, !dbg !190, !tbaa !130
  %24 = icmp eq %struct.DLL* %23, %2, !dbg !190
  br i1 %24, label %._crit_edge, label %.lr.ph, !dbg !190

._crit_edge:                                      ; preds = %.lr.ph, %0
  %.lcssa = phi %struct.DLL** [ %7, %0 ], [ %22, %.lr.ph ]
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([33 x i8]* @str, i64 0, i64 0)) #7, !dbg !194
  %25 = load %struct.DLL** %.lcssa, align 8, !dbg !195, !tbaa !130
  %26 = getelementptr inbounds %struct.DLL* %25, i64 0, i32 0, !dbg !195
  %27 = load i32* %26, align 4, !dbg !195, !tbaa !135
  %28 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str3, i64 0, i64 0), i32 %27) #6, !dbg !195
  ret void, !dbg !196
}

; Function Attrs: minsize nounwind optsize
declare i32 @puts(i8* nocapture readonly) #2

; Function Attrs: minsize nounwind optsize
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: minsize nounwind optsize uwtable
define %struct.DLL* @list_new() #0 {
  %1 = tail call noalias i8* @malloc(i64 24) #6, !dbg !197
  %2 = bitcast i8* %1 to %struct.DLL*, !dbg !197
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %2}, i64 0, metadata !60), !dbg !197
  %3 = getelementptr inbounds i8* %1, i64 8, !dbg !198
  %4 = bitcast i8* %3 to %struct.DLL**, !dbg !198
  store %struct.DLL* %2, %struct.DLL** %4, align 8, !dbg !198, !tbaa !130
  %5 = getelementptr inbounds i8* %1, i64 16, !dbg !199
  %6 = bitcast i8* %5 to %struct.DLL**, !dbg !199
  store %struct.DLL* %2, %struct.DLL** %6, align 8, !dbg !199, !tbaa !123
  %7 = bitcast i8* %1 to i32*, !dbg !200
  store i32 0, i32* %7, align 4, !dbg !200, !tbaa !135
  ret %struct.DLL* %2, !dbg !201
}

; Function Attrs: minsize nounwind optsize
declare noalias i8* @malloc(i64) #2

; Function Attrs: minsize nounwind optsize uwtable
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
  %7 = tail call noalias i8* @malloc(i64 %6) #6, !dbg !208
  %8 = bitcast i8* %7 to %struct.DLL*, !dbg !208
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %8}, i64 0, metadata !71), !dbg !208
  %9 = add nsw i32 %to.from, -1, !dbg !209
  tail call void @llvm.dbg.value(metadata !{i32 %9}, i64 0, metadata !65), !dbg !209
  tail call void @llvm.dbg.value(metadata !184, i64 0, metadata !69), !dbg !210
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
  store %struct.DLL* %20, %struct.DLL** %21, align 8, !dbg !213, !tbaa !130
  %22 = add nsw i64 %indvars.iv, -1, !dbg !215
  %23 = getelementptr inbounds %struct.DLL* %8, i64 %22, !dbg !215
  %24 = getelementptr inbounds %struct.DLL* %8, i64 %indvars.iv, i32 2, !dbg !215
  store %struct.DLL* %23, %struct.DLL** %24, align 8, !dbg !215, !tbaa !123
  %25 = add nsw i32 %.14, 1, !dbg !216
  tail call void @llvm.dbg.value(metadata !{i32 %29}, i64 0, metadata !65), !dbg !216
  %26 = getelementptr inbounds %struct.DLL* %8, i64 %indvars.iv5, i32 0, !dbg !216
  store i32 %.14, i32* %26, align 4, !dbg !216, !tbaa !135
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
  store %struct.DLL* %32, %struct.DLL** %34, align 8, !dbg !217, !tbaa !123
  %35 = getelementptr inbounds %struct.DLL* %8, i64 %31, i32 1, !dbg !218
  store %struct.DLL* %8, %struct.DLL** %35, align 8, !dbg !218, !tbaa !130
  %36 = sext i32 %2 to i64, !dbg !219
  %37 = getelementptr inbounds %struct.DLL* %8, i64 %36, !dbg !219
  %38 = getelementptr inbounds %struct.DLL* %8, i64 %31, i32 2, !dbg !219
  store %struct.DLL* %37, %struct.DLL** %38, align 8, !dbg !219, !tbaa !123
  %39 = getelementptr inbounds %struct.DLL* %32, i64 0, i32 0, !dbg !220
  store i32 %.1.lcssa, i32* %39, align 4, !dbg !220, !tbaa !135
  %40 = bitcast i8* %7 to i32*, !dbg !221
  store i32 %3, i32* %40, align 4, !dbg !221, !tbaa !135
  ret %struct.DLL* %8, !dbg !222
}

; Function Attrs: minsize nounwind optsize uwtable
define %struct.DLL* @list_copy(%struct.DLL* nocapture readonly %x) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %x}, i64 0, metadata !74), !dbg !223
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %x}, i64 0, metadata !224), !dbg !226
  %1 = getelementptr inbounds %struct.DLL* %x, i64 0, i32 0, !dbg !226
  %2 = load i32* %1, align 4, !dbg !226, !tbaa !135
  tail call void @llvm.dbg.value(metadata !{i32 %2}, i64 0, metadata !77), !dbg !225
  %3 = add nsw i32 %2, 1, !dbg !227
  %4 = sext i32 %3 to i64, !dbg !227
  %5 = mul i64 %4, 24, !dbg !227
  %6 = tail call noalias i8* @malloc(i64 %5) #6, !dbg !227
  %7 = bitcast i8* %6 to %struct.DLL*, !dbg !227
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %7}, i64 0, metadata !79), !dbg !227
  tail call void @llvm.dbg.value(metadata !184, i64 0, metadata !75), !dbg !228
  tail call void @llvm.dbg.value(metadata !212, i64 0, metadata !76), !dbg !228
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %x}, i64 0, metadata !78), !dbg !228
  %8 = icmp sgt i32 %2, 0, !dbg !228
  br i1 %8, label %.lr.ph, label %._crit_edge, !dbg !228

.lr.ph:                                           ; preds = %0, %._crit_edge6
  %9 = phi i32 [ %.pre, %._crit_edge6 ], [ %2, %0 ]
  %indvars.iv4 = phi i64 [ %indvars.iv.next5, %._crit_edge6 ], [ 1, %0 ]
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge6 ], [ 0, %0 ]
  %xp.02 = phi %struct.DLL* [ %16, %._crit_edge6 ], [ %x, %0 ]
  %10 = getelementptr inbounds %struct.DLL* %7, i64 %indvars.iv4, !dbg !230
  %11 = getelementptr inbounds %struct.DLL* %7, i64 %indvars.iv, !dbg !230
  %12 = getelementptr inbounds %struct.DLL* %7, i64 %indvars.iv, i32 1, !dbg !230
  store %struct.DLL* %10, %struct.DLL** %12, align 8, !dbg !230, !tbaa !130
  %13 = getelementptr inbounds %struct.DLL* %7, i64 %indvars.iv4, i32 2, !dbg !232
  store %struct.DLL* %11, %struct.DLL** %13, align 8, !dbg !232, !tbaa !123
  %14 = getelementptr inbounds %struct.DLL* %11, i64 0, i32 0, !dbg !233
  store i32 %9, i32* %14, align 4, !dbg !233, !tbaa !135
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !228
  %15 = getelementptr inbounds %struct.DLL* %xp.02, i64 0, i32 1, !dbg !228
  %16 = load %struct.DLL** %15, align 8, !dbg !228, !tbaa !130
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %16}, i64 0, metadata !78), !dbg !228
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !228
  %exitcond = icmp eq i32 %lftr.wideiv, %2, !dbg !228
  br i1 %exitcond, label %._crit_edge, label %._crit_edge6, !dbg !228

._crit_edge6:                                     ; preds = %.lr.ph
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1, !dbg !228
  %.phi.trans.insert = getelementptr inbounds %struct.DLL* %16, i64 0, i32 0
  %.pre = load i32* %.phi.trans.insert, align 4, !dbg !233, !tbaa !135
  br label %.lr.ph, !dbg !228

._crit_edge:                                      ; preds = %.lr.ph, %0
  %17 = sext i32 %2 to i64, !dbg !234
  %18 = getelementptr inbounds %struct.DLL* %7, i64 %17, !dbg !234
  %19 = getelementptr inbounds i8* %6, i64 16, !dbg !234
  %20 = bitcast i8* %19 to %struct.DLL**, !dbg !234
  store %struct.DLL* %18, %struct.DLL** %20, align 8, !dbg !234, !tbaa !123
  %21 = getelementptr inbounds %struct.DLL* %7, i64 %17, i32 1, !dbg !235
  store %struct.DLL* %7, %struct.DLL** %21, align 8, !dbg !235, !tbaa !130
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %x}, i64 0, metadata !236), !dbg !238
  %22 = getelementptr inbounds %struct.DLL* %x, i64 0, i32 2, !dbg !238
  %23 = load %struct.DLL** %22, align 8, !dbg !238, !tbaa !123
  %24 = getelementptr inbounds %struct.DLL* %23, i64 0, i32 0, !dbg !237
  %25 = load i32* %24, align 4, !dbg !237, !tbaa !135
  %26 = getelementptr inbounds %struct.DLL* %18, i64 0, i32 0, !dbg !237
  store i32 %25, i32* %26, align 4, !dbg !237, !tbaa !135
  ret %struct.DLL* %7, !dbg !239
}

; Function Attrs: minsize nounwind optsize uwtable
define void @list_reverse(%struct.DLL* %head) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %head}, i64 0, metadata !84), !dbg !240
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %head}, i64 0, metadata !86), !dbg !241
  br label %1, !dbg !242

; <label>:1                                       ; preds = %1, %0
  %p.0 = phi %struct.DLL* [ %head, %0 ], [ %3, %1 ]
  %2 = getelementptr inbounds %struct.DLL* %p.0, i64 0, i32 1, !dbg !243
  %3 = load %struct.DLL** %2, align 8, !dbg !243, !tbaa !130
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %3}, i64 0, metadata !85), !dbg !243
  %4 = getelementptr inbounds %struct.DLL* %p.0, i64 0, i32 2, !dbg !245
  %5 = load %struct.DLL** %4, align 8, !dbg !245, !tbaa !123
  store %struct.DLL* %5, %struct.DLL** %2, align 8, !dbg !245, !tbaa !130
  store %struct.DLL* %3, %struct.DLL** %4, align 8, !dbg !246, !tbaa !123
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %3}, i64 0, metadata !86), !dbg !247
  %6 = icmp eq %struct.DLL* %3, %head, !dbg !248
  br i1 %6, label %7, label %1, !dbg !248

; <label>:7                                       ; preds = %1
  ret void, !dbg !249
}

; Function Attrs: minsize nounwind optsize uwtable
define i32 @test_lists() #0 {
  tail call void @llvm.dbg.value(metadata !184, i64 0, metadata !91), !dbg !250
  %1 = tail call %struct.DLL* @list_sequence(i32 1, i32 100) #8, !dbg !251
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %1}, i64 0, metadata !92), !dbg !251
  %2 = tail call %struct.DLL* @list_copy(%struct.DLL* %1) #8, !dbg !252
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %2}, i64 0, metadata !93), !dbg !252
  %3 = tail call %struct.DLL* @list_new() #8, !dbg !253
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %3}, i64 0, metadata !94), !dbg !253
  %4 = tail call i32 @list_equal(%struct.DLL* %2, %struct.DLL* %1) #8, !dbg !254
  %5 = icmp eq i32 %4, 0, !dbg !254
  br i1 %5, label %11, label %.preheader4, !dbg !254

.preheader4:                                      ; preds = %0
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %2}, i64 0, metadata !256), !dbg !258
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %2}, i64 0, metadata !259), !dbg !260
  %6 = getelementptr inbounds %struct.DLL* %2, i64 0, i32 0, !dbg !260
  %7 = load i32* %6, align 4, !dbg !260, !tbaa !135
  %8 = icmp eq i32 %7, 0, !dbg !258
  br i1 %8, label %.preheader4..preheader_crit_edge, label %.lr.ph5, !dbg !257

.preheader4..preheader_crit_edge:                 ; preds = %.preheader4
  %.phi.trans.insert = getelementptr inbounds %struct.DLL* %3, i64 0, i32 0
  %.pre = load i32* %.phi.trans.insert, align 4, !dbg !261, !tbaa !135
  br label %.preheader, !dbg !257

.lr.ph5:                                          ; preds = %.preheader4
  %9 = getelementptr inbounds %struct.DLL* %3, i64 0, i32 2, !dbg !264
  %10 = getelementptr inbounds %struct.DLL* %3, i64 0, i32 0, !dbg !267
  br label %16, !dbg !257

; <label>:11                                      ; preds = %0
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([26 x i8]* @str13, i64 0, i64 0)) #7, !dbg !268
  tail call void @exit(i32 1) #9, !dbg !270
  unreachable, !dbg !270

.preheader:                                       ; preds = %16, %.preheader4..preheader_crit_edge
  %12 = phi i32 [ %.pre, %.preheader4..preheader_crit_edge ], [ %23, %16 ]
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %3}, i64 0, metadata !271), !dbg !262
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %3}, i64 0, metadata !272), !dbg !261
  %13 = getelementptr inbounds %struct.DLL* %3, i64 0, i32 0, !dbg !261
  %14 = icmp eq i32 %12, 0, !dbg !262
  br i1 %14, label %._crit_edge, label %.lr.ph, !dbg !263

.lr.ph:                                           ; preds = %.preheader
  %15 = getelementptr inbounds %struct.DLL* %2, i64 0, i32 2, !dbg !273
  br label %26, !dbg !263

; <label>:16                                      ; preds = %.lr.ph5, %16
  %17 = tail call %struct.DLL* @list_pop_head(%struct.DLL* %2) #8, !dbg !265
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %3}, i64 0, metadata !276), !dbg !277
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %17}, i64 0, metadata !278), !dbg !277
  %18 = load %struct.DLL** %9, align 8, !dbg !264, !tbaa !123
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %18}, i64 0, metadata !279), !dbg !264
  %19 = getelementptr inbounds %struct.DLL* %18, i64 0, i32 1, !dbg !280
  store %struct.DLL* %17, %struct.DLL** %19, align 8, !dbg !280, !tbaa !130
  %20 = getelementptr inbounds %struct.DLL* %17, i64 0, i32 1, !dbg !281
  store %struct.DLL* %3, %struct.DLL** %20, align 8, !dbg !281, !tbaa !130
  store %struct.DLL* %17, %struct.DLL** %9, align 8, !dbg !282, !tbaa !123
  %21 = getelementptr inbounds %struct.DLL* %17, i64 0, i32 2, !dbg !283
  store %struct.DLL* %18, %struct.DLL** %21, align 8, !dbg !283, !tbaa !123
  %22 = load i32* %10, align 4, !dbg !267, !tbaa !135
  %23 = add nsw i32 %22, 1, !dbg !267
  store i32 %23, i32* %10, align 4, !dbg !267, !tbaa !135
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %2}, i64 0, metadata !256), !dbg !258
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %2}, i64 0, metadata !259), !dbg !260
  %24 = load i32* %6, align 4, !dbg !260, !tbaa !135
  %25 = icmp eq i32 %24, 0, !dbg !258
  br i1 %25, label %.preheader, label %16, !dbg !257

; <label>:26                                      ; preds = %.lr.ph, %26
  %27 = tail call %struct.DLL* @list_pop_tail(%struct.DLL* %3) #8, !dbg !274
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %2}, i64 0, metadata !284), !dbg !285
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %27}, i64 0, metadata !286), !dbg !285
  %28 = load %struct.DLL** %15, align 8, !dbg !273, !tbaa !123
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %28}, i64 0, metadata !287), !dbg !273
  %29 = getelementptr inbounds %struct.DLL* %28, i64 0, i32 1, !dbg !288
  store %struct.DLL* %27, %struct.DLL** %29, align 8, !dbg !288, !tbaa !130
  %30 = getelementptr inbounds %struct.DLL* %27, i64 0, i32 1, !dbg !289
  store %struct.DLL* %2, %struct.DLL** %30, align 8, !dbg !289, !tbaa !130
  store %struct.DLL* %27, %struct.DLL** %15, align 8, !dbg !290, !tbaa !123
  %31 = getelementptr inbounds %struct.DLL* %27, i64 0, i32 2, !dbg !291
  store %struct.DLL* %28, %struct.DLL** %31, align 8, !dbg !291, !tbaa !123
  %32 = load i32* %6, align 4, !dbg !292, !tbaa !135
  %33 = add nsw i32 %32, 1, !dbg !292
  store i32 %33, i32* %6, align 4, !dbg !292, !tbaa !135
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %3}, i64 0, metadata !271), !dbg !262
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %3}, i64 0, metadata !272), !dbg !261
  %34 = load i32* %13, align 4, !dbg !261, !tbaa !135
  %35 = icmp eq i32 %34, 0, !dbg !262
  br i1 %35, label %._crit_edge, label %26, !dbg !263

._crit_edge:                                      ; preds = %26, %.preheader
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %3}, i64 0, metadata !293), !dbg !296
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %3}, i64 0, metadata !297), !dbg !298
  tail call void @list_reverse(%struct.DLL* %1) #8, !dbg !299
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %1}, i64 0, metadata !300), !dbg !303
  %36 = getelementptr inbounds %struct.DLL* %1, i64 0, i32 1, !dbg !303
  %37 = load %struct.DLL** %36, align 8, !dbg !303, !tbaa !130
  %38 = getelementptr inbounds %struct.DLL* %37, i64 0, i32 0, !dbg !301
  %39 = load i32* %38, align 4, !dbg !301, !tbaa !135
  %40 = icmp eq i32 %39, 100, !dbg !301
  br i1 %40, label %43, label %41, !dbg !301

; <label>:41                                      ; preds = %._crit_edge
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %1}, i64 0, metadata !304), !dbg !307
  %42 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([42 x i8]* @.str7, i64 0, i64 0), i32 100, i32 %39) #6, !dbg !308
  tail call void @exit(i32 1) #9, !dbg !309
  unreachable, !dbg !309

; <label>:43                                      ; preds = %._crit_edge
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %1}, i64 0, metadata !310), !dbg !313
  %44 = getelementptr inbounds %struct.DLL* %1, i64 0, i32 2, !dbg !313
  %45 = load %struct.DLL** %44, align 8, !dbg !313, !tbaa !123
  %46 = getelementptr inbounds %struct.DLL* %45, i64 0, i32 0, !dbg !311
  %47 = load i32* %46, align 4, !dbg !311, !tbaa !135
  %48 = icmp eq i32 %47, 1, !dbg !311
  br i1 %48, label %51, label %49, !dbg !311

; <label>:49                                      ; preds = %43
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %1}, i64 0, metadata !314), !dbg !317
  %50 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str8, i64 0, i64 0), i32 100, i32 %47) #6, !dbg !318
  tail call void @exit(i32 1) #9, !dbg !319
  unreachable, !dbg !319

; <label>:51                                      ; preds = %43
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %2}, i64 0, metadata !320), !dbg !323
  %52 = getelementptr inbounds %struct.DLL* %2, i64 0, i32 1, !dbg !323
  %53 = load %struct.DLL** %52, align 8, !dbg !323, !tbaa !130
  %54 = getelementptr inbounds %struct.DLL* %53, i64 0, i32 0, !dbg !321
  %55 = load i32* %54, align 4, !dbg !321, !tbaa !135
  %56 = icmp eq i32 %55, 100, !dbg !321
  br i1 %56, label %59, label %57, !dbg !321

; <label>:57                                      ; preds = %51
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %2}, i64 0, metadata !324), !dbg !327
  %58 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([42 x i8]* @.str9, i64 0, i64 0), i32 100, i32 %55) #6, !dbg !328
  tail call void @exit(i32 1) #9, !dbg !329
  unreachable, !dbg !329

; <label>:59                                      ; preds = %51
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %2}, i64 0, metadata !330), !dbg !333
  %60 = getelementptr inbounds %struct.DLL* %2, i64 0, i32 2, !dbg !333
  %61 = load %struct.DLL** %60, align 8, !dbg !333, !tbaa !123
  %62 = getelementptr inbounds %struct.DLL* %61, i64 0, i32 0, !dbg !331
  %63 = load i32* %62, align 4, !dbg !331, !tbaa !135
  %64 = icmp eq i32 %63, 1, !dbg !331
  br i1 %64, label %67, label %65, !dbg !331

; <label>:65                                      ; preds = %59
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %2}, i64 0, metadata !334), !dbg !337
  %66 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str8, i64 0, i64 0), i32 100, i32 %63) #6, !dbg !338
  tail call void @exit(i32 1) #9, !dbg !339
  unreachable, !dbg !339

; <label>:67                                      ; preds = %59
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %1}, i64 0, metadata !340), !dbg !343
  %68 = getelementptr inbounds %struct.DLL* %1, i64 0, i32 0, !dbg !343
  %69 = load i32* %68, align 4, !dbg !343, !tbaa !135
  %70 = icmp eq i32 %69, 100, !dbg !341
  br i1 %70, label %73, label %71, !dbg !341

; <label>:71                                      ; preds = %67
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %1}, i64 0, metadata !344), !dbg !347
  %72 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([35 x i8]* @.str10, i64 0, i64 0), i32 100, i32 %69) #6, !dbg !348
  tail call void @exit(i32 1) #9, !dbg !349
  unreachable, !dbg !349

; <label>:73                                      ; preds = %67
  %74 = tail call i32 @list_equal(%struct.DLL* %1, %struct.DLL* %2) #8, !dbg !350
  %75 = icmp eq i32 %74, 0, !dbg !350
  br i1 %75, label %76, label %77, !dbg !350

; <label>:76                                      ; preds = %73
  %puts3 = tail call i32 @puts(i8* getelementptr inbounds ([26 x i8]* @str16, i64 0, i64 0)) #7, !dbg !352
  tail call void @exit(i32 1) #9, !dbg !354
  unreachable, !dbg !354

; <label>:77                                      ; preds = %73
  tail call void @llvm.dbg.value(metadata !{%struct.DLL* %1}, i64 0, metadata !355), !dbg !357
  tail call void @llvm.dbg.value(metadata !{i32 %69}, i64 0, metadata !91), !dbg !356
  %78 = bitcast %struct.DLL* %1 to i8*, !dbg !358
  tail call void @free(i8* %78) #6, !dbg !358
  %79 = bitcast %struct.DLL* %2 to i8*, !dbg !359
  tail call void @free(i8* %79) #6, !dbg !359
  %80 = bitcast %struct.DLL* %3 to i8*, !dbg !360
  tail call void @free(i8* %80) #6, !dbg !360
  ret i32 100, !dbg !361
}

; Function Attrs: minsize noreturn nounwind optsize
declare void @exit(i32) #3

; Function Attrs: minsize nounwind optsize
declare void @free(i8* nocapture) #2

; Function Attrs: minsize nounwind optsize uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !100), !dbg !362
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !101), !dbg !362
  %1 = icmp eq i32 %argc, 2, !dbg !363
  br i1 %1, label %.preheader, label %.lr.ph, !dbg !363

.preheader:                                       ; preds = %0
  %2 = getelementptr inbounds i8** %argv, i64 1, !dbg !363
  %3 = load i8** %2, align 8, !dbg !363, !tbaa !364
  %4 = tail call i32 @atoi(i8* %3) #10, !dbg !363
  tail call void @llvm.dbg.value(metadata !{i32 %6}, i64 0, metadata !102), !dbg !365
  %5 = icmp eq i32 %4, 0, !dbg !365
  br i1 %5, label %._crit_edge, label %.lr.ph, !dbg !365

.lr.ph:                                           ; preds = %0, %.preheader, %.lr.ph
  %n.01 = phi i32 [ %6, %.lr.ph ], [ 3000000, %0 ], [ %4, %.preheader ]
  %6 = add nsw i32 %n.01, -1, !dbg !365
  %7 = tail call i32 @test_lists() #8, !dbg !365
  tail call void @llvm.dbg.value(metadata !{i32 %7}, i64 0, metadata !103), !dbg !365
  tail call void @llvm.dbg.value(metadata !{i32 %6}, i64 0, metadata !102), !dbg !365
  %8 = icmp eq i32 %6, 0, !dbg !365
  br i1 %8, label %._crit_edge, label %.lr.ph, !dbg !365

._crit_edge:                                      ; preds = %.lr.ph, %.preheader
  %result.0.lcssa = phi i32 [ 0, %.preheader ], [ %7, %.lr.ph ]
  %9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str12, i64 0, i64 0), i32 %result.0.lcssa) #6, !dbg !366
  ret i32 0, !dbg !367
}

; Function Attrs: minsize nounwind optsize readonly
declare i32 @atoi(i8* nocapture) #4

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #5

attributes #0 = { minsize nounwind optsize uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { minsize nounwind optsize readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { minsize nounwind optsize "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { minsize noreturn nounwind optsize "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { minsize nounwind optsize readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone }
attributes #6 = { minsize nounwind optsize }
attributes #7 = { nounwind }
attributes #8 = { minsize optsize }
attributes #9 = { minsize noreturn nounwind optsize }
attributes #10 = { minsize nounwind optsize readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!118, !119}
!llvm.ident = !{!120}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c] [DW_LANG_C99]
!1 = metadata !{metadata !"lists.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !21, metadata !28, metadata !33, metadata !37, metadata !45, metadata !56, metadata !61, metadata !72, metadata !80, metadata !87, metadata !95, metadata !104, metadata !107, metadata !110, metadata !115}
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
!104 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"list_first", metadata !"list_first", metadata !"", i32 23, metadata !22, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !105, i32 23} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [list_first]
!105 = metadata !{metadata !106}
!106 = metadata !{i32 786689, metadata !104, metadata !"head", metadata !5, i32 16777239, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [head] [line 23]
!107 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"list_last", metadata !"list_last", metadata !"", i32 24, metadata !22, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !108, i32 24} ; [ DW_TAG_subprogram ] [line 24] [local] [def] [list_last]
!108 = metadata !{metadata !109}
!109 = metadata !{i32 786689, metadata !107, metadata !"head", metadata !5, i32 16777240, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [head] [line 24]
!110 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"list_length", metadata !"list_length", metadata !"", i32 21, metadata !111, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !113, i32 21} ; [ DW_TAG_subprogram ] [line 21] [local] [def] [list_length]
!111 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !112, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!112 = metadata !{metadata !13, metadata !8}
!113 = metadata !{metadata !114}
!114 = metadata !{i32 786689, metadata !110, metadata !"head", metadata !5, i32 16777237, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [head] [line 21]
!115 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"list_empty", metadata !"list_empty", metadata !"", i32 22, metadata !111, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !116, i32 22} ; [ DW_TAG_subprogram ] [line 22] [local] [def] [list_empty]
!116 = metadata !{metadata !117}
!117 = metadata !{i32 786689, metadata !115, metadata !"head", metadata !5, i32 16777238, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [head] [line 22]
!118 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!119 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!120 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!121 = metadata !{i32 26, i32 0, metadata !4, null}
!122 = metadata !{i32 27, i32 0, metadata !4, null}
!123 = metadata !{metadata !124, metadata !128, i64 16}
!124 = metadata !{metadata !"DLL", metadata !125, i64 0, metadata !128, i64 8, metadata !128, i64 16}
!125 = metadata !{metadata !"int", metadata !126, i64 0}
!126 = metadata !{metadata !"omnipotent char", metadata !127, i64 0}
!127 = metadata !{metadata !"Simple C/C++ TBAA"}
!128 = metadata !{metadata !"any pointer", metadata !126, i64 0}
!129 = metadata !{i32 28, i32 0, metadata !4, null}
!130 = metadata !{metadata !124, metadata !128, i64 8}
!131 = metadata !{i32 29, i32 0, metadata !4, null}
!132 = metadata !{i32 30, i32 0, metadata !4, null}
!133 = metadata !{i32 31, i32 0, metadata !4, null}
!134 = metadata !{i32 32, i32 0, metadata !4, null}
!135 = metadata !{metadata !124, metadata !125, i64 0}
!136 = metadata !{i32 33, i32 0, metadata !4, null}
!137 = metadata !{i32 35, i32 0, metadata !21, null}
!138 = metadata !{i32 786689, metadata !115, metadata !"head", metadata !5, i32 16777238, metadata !8, i32 0, metadata !139} ; [ DW_TAG_arg_variable ] [head] [line 22]
!139 = metadata !{i32 37, i32 0, metadata !140, null}
!140 = metadata !{i32 786443, metadata !1, metadata !21, i32 37, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!141 = metadata !{i32 22, i32 0, metadata !115, metadata !139}
!142 = metadata !{i32 786689, metadata !110, metadata !"head", metadata !5, i32 16777237, metadata !8, i32 0, metadata !141} ; [ DW_TAG_arg_variable ] [head] [line 21]
!143 = metadata !{i32 21, i32 0, metadata !110, metadata !141}
!144 = metadata !{i32 38, i32 0, metadata !21, null}
!145 = metadata !{i32 39, i32 0, metadata !21, null}
!146 = metadata !{i32 40, i32 0, metadata !21, null}
!147 = metadata !{i32 41, i32 0, metadata !21, null}
!148 = metadata !{i32 42, i32 0, metadata !21, null}
!149 = metadata !{i32 43, i32 0, metadata !21, null}
!150 = metadata !{i32 44, i32 0, metadata !21, null}
!151 = metadata !{i32 46, i32 0, metadata !28, null}
!152 = metadata !{i32 47, i32 0, metadata !28, null}
!153 = metadata !{i32 48, i32 0, metadata !28, null}
!154 = metadata !{i32 49, i32 0, metadata !28, null}
!155 = metadata !{i32 50, i32 0, metadata !28, null}
!156 = metadata !{i32 51, i32 0, metadata !28, null}
!157 = metadata !{i32 52, i32 0, metadata !28, null}
!158 = metadata !{i32 53, i32 0, metadata !28, null}
!159 = metadata !{i32 55, i32 0, metadata !33, null}
!160 = metadata !{i32 786689, metadata !115, metadata !"head", metadata !5, i32 16777238, metadata !8, i32 0, metadata !161} ; [ DW_TAG_arg_variable ] [head] [line 22]
!161 = metadata !{i32 57, i32 0, metadata !162, null}
!162 = metadata !{i32 786443, metadata !1, metadata !33, i32 57, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!163 = metadata !{i32 22, i32 0, metadata !115, metadata !161}
!164 = metadata !{i32 786689, metadata !110, metadata !"head", metadata !5, i32 16777237, metadata !8, i32 0, metadata !163} ; [ DW_TAG_arg_variable ] [head] [line 21]
!165 = metadata !{i32 21, i32 0, metadata !110, metadata !163}
!166 = metadata !{i32 58, i32 0, metadata !33, null} ; [ DW_TAG_imported_module ]
!167 = metadata !{i32 59, i32 0, metadata !33, null}
!168 = metadata !{i32 60, i32 0, metadata !33, null}
!169 = metadata !{i32 61, i32 0, metadata !33, null}
!170 = metadata !{i32 62, i32 0, metadata !33, null}
!171 = metadata !{i32 63, i32 0, metadata !33, null}
!172 = metadata !{i32 65, i32 0, metadata !37, null}
!173 = metadata !{i32 68, i32 0, metadata !174, null}
!174 = metadata !{i32 786443, metadata !1, metadata !37, i32 68, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!175 = metadata !{i32 69, i32 0, metadata !176, null}
!176 = metadata !{i32 786443, metadata !1, metadata !177, i32 69, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!177 = metadata !{i32 786443, metadata !1, metadata !174, i32 68, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!178 = metadata !{i32 71, i32 0, metadata !179, null}
!179 = metadata !{i32 786443, metadata !1, metadata !37, i32 71, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!180 = metadata !{i32 72, i32 0, metadata !37, null}
!181 = metadata !{i32 73, i32 0, metadata !37, null}
!182 = metadata !{i32 75, i32 0, metadata !45, null}
!183 = metadata !{i32 76, i32 0, metadata !45, null}
!184 = metadata !{i32 0}
!185 = metadata !{i32 77, i32 0, metadata !45, null}
!186 = metadata !{i32 78, i32 0, metadata !45, null}
!187 = metadata !{i32 786689, metadata !110, metadata !"head", metadata !5, i32 16777237, metadata !8, i32 0, metadata !188} ; [ DW_TAG_arg_variable ] [head] [line 21]
!188 = metadata !{i32 79, i32 0, metadata !45, null}
!189 = metadata !{i32 21, i32 0, metadata !110, metadata !188}
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
!224 = metadata !{i32 786689, metadata !110, metadata !"head", metadata !5, i32 16777237, metadata !8, i32 0, metadata !225} ; [ DW_TAG_arg_variable ] [head] [line 21]
!225 = metadata !{i32 119, i32 0, metadata !72, null}
!226 = metadata !{i32 21, i32 0, metadata !110, metadata !225}
!227 = metadata !{i32 120, i32 0, metadata !72, null}
!228 = metadata !{i32 121, i32 0, metadata !229, null}
!229 = metadata !{i32 786443, metadata !1, metadata !72, i32 121, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!230 = metadata !{i32 122, i32 0, metadata !231, null}
!231 = metadata !{i32 786443, metadata !1, metadata !229, i32 121, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!232 = metadata !{i32 123, i32 0, metadata !231, null}
!233 = metadata !{i32 124, i32 0, metadata !231, null}
!234 = metadata !{i32 126, i32 0, metadata !72, null}
!235 = metadata !{i32 127, i32 0, metadata !72, null}
!236 = metadata !{i32 786689, metadata !107, metadata !"head", metadata !5, i32 16777240, metadata !8, i32 0, metadata !237} ; [ DW_TAG_arg_variable ] [head] [line 24]
!237 = metadata !{i32 128, i32 0, metadata !72, null}
!238 = metadata !{i32 24, i32 0, metadata !107, metadata !237}
!239 = metadata !{i32 129, i32 0, metadata !72, null}
!240 = metadata !{i32 132, i32 0, metadata !80, null}
!241 = metadata !{i32 133, i32 0, metadata !80, null}
!242 = metadata !{i32 134, i32 0, metadata !80, null}
!243 = metadata !{i32 135, i32 0, metadata !244, null}
!244 = metadata !{i32 786443, metadata !1, metadata !80, i32 134, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!245 = metadata !{i32 136, i32 0, metadata !244, null}
!246 = metadata !{i32 137, i32 0, metadata !244, null}
!247 = metadata !{i32 138, i32 0, metadata !244, null}
!248 = metadata !{i32 139, i32 0, metadata !244, null}
!249 = metadata !{i32 140, i32 0, metadata !80, null}
!250 = metadata !{i32 143, i32 0, metadata !87, null}
!251 = metadata !{i32 145, i32 0, metadata !87, null}
!252 = metadata !{i32 147, i32 0, metadata !87, null}
!253 = metadata !{i32 150, i32 0, metadata !87, null}
!254 = metadata !{i32 152, i32 0, metadata !255, null}
!255 = metadata !{i32 786443, metadata !1, metadata !87, i32 152, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!256 = metadata !{i32 786689, metadata !115, metadata !"head", metadata !5, i32 16777238, metadata !8, i32 0, metadata !257} ; [ DW_TAG_arg_variable ] [head] [line 22]
!257 = metadata !{i32 156, i32 0, metadata !87, null}
!258 = metadata !{i32 22, i32 0, metadata !115, metadata !257}
!259 = metadata !{i32 786689, metadata !110, metadata !"head", metadata !5, i32 16777237, metadata !8, i32 0, metadata !258} ; [ DW_TAG_arg_variable ] [head] [line 21]
!260 = metadata !{i32 21, i32 0, metadata !110, metadata !258}
!261 = metadata !{i32 21, i32 0, metadata !110, metadata !262}
!262 = metadata !{i32 22, i32 0, metadata !115, metadata !263}
!263 = metadata !{i32 166, i32 0, metadata !87, null}
!264 = metadata !{i32 27, i32 0, metadata !4, metadata !265}
!265 = metadata !{i32 157, i32 0, metadata !266, null}
!266 = metadata !{i32 786443, metadata !1, metadata !87, i32 156, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!267 = metadata !{i32 32, i32 0, metadata !4, metadata !265}
!268 = metadata !{i32 153, i32 0, metadata !269, null}
!269 = metadata !{i32 786443, metadata !1, metadata !255, i32 152, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!270 = metadata !{i32 154, i32 0, metadata !269, null}
!271 = metadata !{i32 786689, metadata !115, metadata !"head", metadata !5, i32 16777238, metadata !8, i32 0, metadata !263} ; [ DW_TAG_arg_variable ] [head] [line 22]
!272 = metadata !{i32 786689, metadata !110, metadata !"head", metadata !5, i32 16777237, metadata !8, i32 0, metadata !262} ; [ DW_TAG_arg_variable ] [head] [line 21]
!273 = metadata !{i32 27, i32 0, metadata !4, metadata !274}
!274 = metadata !{i32 167, i32 0, metadata !275, null}
!275 = metadata !{i32 786443, metadata !1, metadata !87, i32 166, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!276 = metadata !{i32 786689, metadata !4, metadata !"head", metadata !5, i32 16777242, metadata !8, i32 0, metadata !265} ; [ DW_TAG_arg_variable ] [head] [line 26]
!277 = metadata !{i32 26, i32 0, metadata !4, metadata !265}
!278 = metadata !{i32 786689, metadata !4, metadata !"item", metadata !5, i32 33554458, metadata !8, i32 0, metadata !265} ; [ DW_TAG_arg_variable ] [item] [line 26]
!279 = metadata !{i32 786688, metadata !4, metadata !"tail", metadata !5, i32 27, metadata !8, i32 0, metadata !265} ; [ DW_TAG_auto_variable ] [tail] [line 27]
!280 = metadata !{i32 28, i32 0, metadata !4, metadata !265}
!281 = metadata !{i32 29, i32 0, metadata !4, metadata !265}
!282 = metadata !{i32 30, i32 0, metadata !4, metadata !265}
!283 = metadata !{i32 31, i32 0, metadata !4, metadata !265}
!284 = metadata !{i32 786689, metadata !4, metadata !"head", metadata !5, i32 16777242, metadata !8, i32 0, metadata !274} ; [ DW_TAG_arg_variable ] [head] [line 26]
!285 = metadata !{i32 26, i32 0, metadata !4, metadata !274}
!286 = metadata !{i32 786689, metadata !4, metadata !"item", metadata !5, i32 33554458, metadata !8, i32 0, metadata !274} ; [ DW_TAG_arg_variable ] [item] [line 26]
!287 = metadata !{i32 786688, metadata !4, metadata !"tail", metadata !5, i32 27, metadata !8, i32 0, metadata !274} ; [ DW_TAG_auto_variable ] [tail] [line 27]
!288 = metadata !{i32 28, i32 0, metadata !4, metadata !274}
!289 = metadata !{i32 29, i32 0, metadata !4, metadata !274}
!290 = metadata !{i32 30, i32 0, metadata !4, metadata !274}
!291 = metadata !{i32 31, i32 0, metadata !4, metadata !274}
!292 = metadata !{i32 32, i32 0, metadata !4, metadata !274}
!293 = metadata !{i32 786689, metadata !115, metadata !"head", metadata !5, i32 16777238, metadata !8, i32 0, metadata !294} ; [ DW_TAG_arg_variable ] [head] [line 22]
!294 = metadata !{i32 170, i32 0, metadata !295, null}
!295 = metadata !{i32 786443, metadata !1, metadata !87, i32 170, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!296 = metadata !{i32 22, i32 0, metadata !115, metadata !294}
!297 = metadata !{i32 786689, metadata !110, metadata !"head", metadata !5, i32 16777237, metadata !8, i32 0, metadata !296} ; [ DW_TAG_arg_variable ] [head] [line 21]
!298 = metadata !{i32 21, i32 0, metadata !110, metadata !296}
!299 = metadata !{i32 175, i32 0, metadata !87, null}
!300 = metadata !{i32 786689, metadata !104, metadata !"head", metadata !5, i32 16777239, metadata !8, i32 0, metadata !301} ; [ DW_TAG_arg_variable ] [head] [line 23]
!301 = metadata !{i32 177, i32 0, metadata !302, null}
!302 = metadata !{i32 786443, metadata !1, metadata !87, i32 177, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!303 = metadata !{i32 23, i32 0, metadata !104, metadata !301}
!304 = metadata !{i32 786689, metadata !104, metadata !"head", metadata !5, i32 16777239, metadata !8, i32 0, metadata !305} ; [ DW_TAG_arg_variable ] [head] [line 23]
!305 = metadata !{i32 179, i32 0, metadata !306, null}
!306 = metadata !{i32 786443, metadata !1, metadata !302, i32 177, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!307 = metadata !{i32 23, i32 0, metadata !104, metadata !305}
!308 = metadata !{i32 178, i32 0, metadata !306, null}
!309 = metadata !{i32 180, i32 0, metadata !306, null}
!310 = metadata !{i32 786689, metadata !107, metadata !"head", metadata !5, i32 16777240, metadata !8, i32 0, metadata !311} ; [ DW_TAG_arg_variable ] [head] [line 24]
!311 = metadata !{i32 183, i32 0, metadata !312, null}
!312 = metadata !{i32 786443, metadata !1, metadata !87, i32 183, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!313 = metadata !{i32 24, i32 0, metadata !107, metadata !311}
!314 = metadata !{i32 786689, metadata !107, metadata !"head", metadata !5, i32 16777240, metadata !8, i32 0, metadata !315} ; [ DW_TAG_arg_variable ] [head] [line 24]
!315 = metadata !{i32 185, i32 0, metadata !316, null}
!316 = metadata !{i32 786443, metadata !1, metadata !312, i32 183, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!317 = metadata !{i32 24, i32 0, metadata !107, metadata !315}
!318 = metadata !{i32 184, i32 0, metadata !316, null}
!319 = metadata !{i32 186, i32 0, metadata !316, null}
!320 = metadata !{i32 786689, metadata !104, metadata !"head", metadata !5, i32 16777239, metadata !8, i32 0, metadata !321} ; [ DW_TAG_arg_variable ] [head] [line 23]
!321 = metadata !{i32 189, i32 0, metadata !322, null}
!322 = metadata !{i32 786443, metadata !1, metadata !87, i32 189, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!323 = metadata !{i32 23, i32 0, metadata !104, metadata !321}
!324 = metadata !{i32 786689, metadata !104, metadata !"head", metadata !5, i32 16777239, metadata !8, i32 0, metadata !325} ; [ DW_TAG_arg_variable ] [head] [line 23]
!325 = metadata !{i32 191, i32 0, metadata !326, null}
!326 = metadata !{i32 786443, metadata !1, metadata !322, i32 189, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!327 = metadata !{i32 23, i32 0, metadata !104, metadata !325}
!328 = metadata !{i32 190, i32 0, metadata !326, null}
!329 = metadata !{i32 192, i32 0, metadata !326, null}
!330 = metadata !{i32 786689, metadata !107, metadata !"head", metadata !5, i32 16777240, metadata !8, i32 0, metadata !331} ; [ DW_TAG_arg_variable ] [head] [line 24]
!331 = metadata !{i32 195, i32 0, metadata !332, null}
!332 = metadata !{i32 786443, metadata !1, metadata !87, i32 195, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!333 = metadata !{i32 24, i32 0, metadata !107, metadata !331}
!334 = metadata !{i32 786689, metadata !107, metadata !"head", metadata !5, i32 16777240, metadata !8, i32 0, metadata !335} ; [ DW_TAG_arg_variable ] [head] [line 24]
!335 = metadata !{i32 197, i32 0, metadata !336, null}
!336 = metadata !{i32 786443, metadata !1, metadata !332, i32 195, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!337 = metadata !{i32 24, i32 0, metadata !107, metadata !335}
!338 = metadata !{i32 196, i32 0, metadata !336, null}
!339 = metadata !{i32 198, i32 0, metadata !336, null}
!340 = metadata !{i32 786689, metadata !110, metadata !"head", metadata !5, i32 16777237, metadata !8, i32 0, metadata !341} ; [ DW_TAG_arg_variable ] [head] [line 21]
!341 = metadata !{i32 201, i32 0, metadata !342, null}
!342 = metadata !{i32 786443, metadata !1, metadata !87, i32 201, i32 0, i32 31} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!343 = metadata !{i32 21, i32 0, metadata !110, metadata !341}
!344 = metadata !{i32 786689, metadata !110, metadata !"head", metadata !5, i32 16777237, metadata !8, i32 0, metadata !345} ; [ DW_TAG_arg_variable ] [head] [line 21]
!345 = metadata !{i32 203, i32 0, metadata !346, null}
!346 = metadata !{i32 786443, metadata !1, metadata !342, i32 201, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!347 = metadata !{i32 21, i32 0, metadata !110, metadata !345}
!348 = metadata !{i32 202, i32 0, metadata !346, null}
!349 = metadata !{i32 204, i32 0, metadata !346, null}
!350 = metadata !{i32 207, i32 0, metadata !351, null}
!351 = metadata !{i32 786443, metadata !1, metadata !87, i32 207, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!352 = metadata !{i32 208, i32 0, metadata !353, null}
!353 = metadata !{i32 786443, metadata !1, metadata !351, i32 207, i32 0, i32 34} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!354 = metadata !{i32 209, i32 0, metadata !353, null}
!355 = metadata !{i32 786689, metadata !110, metadata !"head", metadata !5, i32 16777237, metadata !8, i32 0, metadata !356} ; [ DW_TAG_arg_variable ] [head] [line 21]
!356 = metadata !{i32 211, i32 0, metadata !87, null}
!357 = metadata !{i32 21, i32 0, metadata !110, metadata !356}
!358 = metadata !{i32 212, i32 0, metadata !87, null}
!359 = metadata !{i32 213, i32 0, metadata !87, null}
!360 = metadata !{i32 214, i32 0, metadata !87, null}
!361 = metadata !{i32 216, i32 0, metadata !87, null}
!362 = metadata !{i32 219, i32 0, metadata !95, null}
!363 = metadata !{i32 225, i32 0, metadata !95, null}
!364 = metadata !{metadata !128, metadata !128, i64 0}
!365 = metadata !{i32 227, i32 0, metadata !95, null}
!366 = metadata !{i32 228, i32 0, metadata !95, null}
!367 = metadata !{i32 229, i32 0, metadata !95, null}
