; ModuleID = 'richards_benchmark.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.task = type { %struct.task*, i32, i32, %struct.packet*, i32, %struct.task* (%struct.packet*)*, i64, i64 }
%struct.packet = type { %struct.packet*, i32, i32, i32, [4 x i8] }

@alphabet = global [28 x i8] c"0ABCDEFGHIJKLMNOPQRSTUVWXYZ\00", align 16
@tasktab = global [11 x %struct.task*] zeroinitializer, align 16
@tasklist = global %struct.task* null, align 8
@qpktcount = global i32 0, align 4
@holdcount = global i32 0, align 4
@tracing = global i32 1, align 4
@layout = global i32 0, align 4
@tcb = common global %struct.task* null, align 8
@taskid = common global i64 0, align 8
@v1 = common global i64 0, align 8
@v2 = common global i64 0, align 8
@.str2 = private unnamed_addr constant [17 x i8] c"\0ABad task id %d\0A\00", align 1
@.str6 = private unnamed_addr constant [33 x i8] c"qpkt count = %d  holdcount = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [19 x i8] c"These results are \00", align 1
@.str8 = private unnamed_addr constant [8 x i8] c"correct\00", align 1
@.str9 = private unnamed_addr constant [10 x i8] c"incorrect\00", align 1
@str = private unnamed_addr constant [20 x i8] c"Bench mark starting\00"
@str11 = private unnamed_addr constant [9 x i8] c"Starting\00"
@str12 = private unnamed_addr constant [9 x i8] c"finished\00"
@str13 = private unnamed_addr constant [12 x i8] c"\0Aend of run\00"

; Function Attrs: nounwind uwtable
define void @createtask(i32 %id, i32 %pri, %struct.packet* %wkq, i32 %state, %struct.task* (%struct.packet*)* %fn, i64 %v1, i64 %v2) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %id}, i64 0, metadata !37), !dbg !139
  tail call void @llvm.dbg.value(metadata !{i32 %pri}, i64 0, metadata !38), !dbg !140
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %wkq}, i64 0, metadata !39), !dbg !141
  tail call void @llvm.dbg.value(metadata !{i32 %state}, i64 0, metadata !40), !dbg !142
  tail call void @llvm.dbg.value(metadata !{%struct.task* (%struct.packet*)* %fn}, i64 0, metadata !41), !dbg !143
  tail call void @llvm.dbg.value(metadata !{i64 %v1}, i64 0, metadata !42), !dbg !144
  tail call void @llvm.dbg.value(metadata !{i64 %v2}, i64 0, metadata !43), !dbg !145
  %1 = tail call noalias i8* @malloc(i64 56) #3, !dbg !146
  %2 = bitcast i8* %1 to %struct.task*, !dbg !146
  tail call void @llvm.dbg.value(metadata !{%struct.task* %2}, i64 0, metadata !44), !dbg !146
  %3 = sext i32 %id to i64, !dbg !147
  %4 = getelementptr inbounds [11 x %struct.task*]* @tasktab, i64 0, i64 %3, !dbg !147
  store %struct.task* %2, %struct.task** %4, align 8, !dbg !147, !tbaa !148
  %5 = load %struct.task** @tasklist, align 8, !dbg !152, !tbaa !148
  %6 = bitcast i8* %1 to %struct.task**, !dbg !152
  store %struct.task* %5, %struct.task** %6, align 8, !dbg !152, !tbaa !153
  %7 = getelementptr inbounds i8* %1, i64 8, !dbg !157
  %8 = bitcast i8* %7 to i32*, !dbg !157
  store i32 %id, i32* %8, align 4, !dbg !157, !tbaa !158
  %9 = getelementptr inbounds i8* %1, i64 12, !dbg !159
  %10 = bitcast i8* %9 to i32*, !dbg !159
  store i32 %pri, i32* %10, align 4, !dbg !159, !tbaa !160
  %11 = getelementptr inbounds i8* %1, i64 16, !dbg !161
  %12 = bitcast i8* %11 to %struct.packet**, !dbg !161
  store %struct.packet* %wkq, %struct.packet** %12, align 8, !dbg !161, !tbaa !162
  %13 = getelementptr inbounds i8* %1, i64 24, !dbg !163
  %14 = bitcast i8* %13 to i32*, !dbg !163
  store i32 %state, i32* %14, align 4, !dbg !163, !tbaa !164
  %15 = getelementptr inbounds i8* %1, i64 32, !dbg !165
  %16 = bitcast i8* %15 to %struct.task* (%struct.packet*)**, !dbg !165
  store %struct.task* (%struct.packet*)* %fn, %struct.task* (%struct.packet*)** %16, align 8, !dbg !165, !tbaa !166
  %17 = getelementptr inbounds i8* %1, i64 40, !dbg !167
  %18 = bitcast i8* %17 to i64*, !dbg !167
  store i64 %v1, i64* %18, align 8, !dbg !167, !tbaa !168
  %19 = getelementptr inbounds i8* %1, i64 48, !dbg !169
  %20 = bitcast i8* %19 to i64*, !dbg !169
  store i64 %v2, i64* %20, align 8, !dbg !169, !tbaa !170
  store %struct.task* %2, %struct.task** @tasklist, align 8, !dbg !171, !tbaa !148
  ret void, !dbg !172
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind uwtable
define noalias %struct.packet* @pkt(%struct.packet* %link, i32 %id, i32 %kind) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %link}, i64 0, metadata !49), !dbg !173
  tail call void @llvm.dbg.value(metadata !{i32 %id}, i64 0, metadata !50), !dbg !173
  tail call void @llvm.dbg.value(metadata !{i32 %kind}, i64 0, metadata !51), !dbg !173
  %1 = tail call noalias i8* @malloc(i64 24) #3, !dbg !174
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %3}, i64 0, metadata !53), !dbg !174
  tail call void @llvm.dbg.value(metadata !175, i64 0, metadata !52), !dbg !176
  %scevgep = getelementptr i8* %1, i64 20
  %2 = bitcast i8* %scevgep to i32*, !dbg !178
  store i32 0, i32* %2, align 1, !dbg !178
  %3 = bitcast i8* %1 to %struct.packet*, !dbg !174
  %4 = bitcast i8* %1 to %struct.packet**, !dbg !179
  store %struct.packet* %link, %struct.packet** %4, align 8, !dbg !179, !tbaa !180
  %5 = getelementptr inbounds i8* %1, i64 8, !dbg !182
  %6 = bitcast i8* %5 to i32*, !dbg !182
  store i32 %id, i32* %6, align 4, !dbg !182, !tbaa !183
  %7 = getelementptr inbounds i8* %1, i64 12, !dbg !184
  %8 = bitcast i8* %7 to i32*, !dbg !184
  store i32 %kind, i32* %8, align 4, !dbg !184, !tbaa !185
  %9 = getelementptr inbounds i8* %1, i64 16, !dbg !186
  %10 = bitcast i8* %9 to i32*, !dbg !186
  store i32 0, i32* %10, align 4, !dbg !186, !tbaa !187
  ret %struct.packet* %3, !dbg !188
}

; Function Attrs: nounwind uwtable
define void @trace(i8 signext %a) #0 {
  tail call void @llvm.dbg.value(metadata !{i8 %a}, i64 0, metadata !58), !dbg !189
  %1 = load i32* @layout, align 4, !dbg !190, !tbaa !192
  %2 = add nsw i32 %1, -1, !dbg !190
  store i32 %2, i32* @layout, align 4, !dbg !190, !tbaa !192
  %3 = icmp slt i32 %1, 2, !dbg !190
  br i1 %3, label %4, label %5, !dbg !190

; <label>:4                                       ; preds = %0
  %putchar1 = tail call i32 @putchar(i32 10) #3, !dbg !193
  store i32 50, i32* @layout, align 4, !dbg !195, !tbaa !192
  br label %5, !dbg !196

; <label>:5                                       ; preds = %4, %0
  %6 = sext i8 %a to i32, !dbg !197
  %putchar = tail call i32 @putchar(i32 %6) #3, !dbg !197
  ret void, !dbg !198
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind uwtable
define void @schedule() #0 {
  %.pr = load %struct.task** @tcb, align 8, !dbg !199, !tbaa !148
  %1 = icmp eq %struct.task* %.pr, null, !dbg !199
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !199

.lr.ph:                                           ; preds = %0, %.backedge
  %2 = phi %struct.task* [ %storemerge, %.backedge ], [ %.pr, %0 ]
  tail call void @llvm.dbg.value(metadata !200, i64 0, metadata !63), !dbg !201
  %3 = getelementptr inbounds %struct.task* %2, i64 0, i32 4, !dbg !202
  %4 = load i32* %3, align 4, !dbg !202, !tbaa !164
  switch i32 %4, label %._crit_edge [
    i32 3, label %5
    i32 0, label %15
    i32 1, label %15
    i32 2, label %43
    i32 4, label %43
    i32 5, label %43
    i32 6, label %43
    i32 7, label %43
  ], !dbg !202

; <label>:5                                       ; preds = %.lr.ph
  %6 = getelementptr inbounds %struct.task* %2, i64 0, i32 3, !dbg !203
  %7 = load %struct.packet** %6, align 8, !dbg !203, !tbaa !162
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %7}, i64 0, metadata !63), !dbg !203
  %8 = getelementptr inbounds %struct.packet* %7, i64 0, i32 0, !dbg !205
  %9 = load %struct.packet** %8, align 8, !dbg !205, !tbaa !180
  store %struct.packet* %9, %struct.packet** %6, align 8, !dbg !205, !tbaa !162
  %10 = load %struct.task** @tcb, align 8, !dbg !206, !tbaa !148
  %11 = getelementptr inbounds %struct.task* %10, i64 0, i32 3, !dbg !206
  %12 = load %struct.packet** %11, align 8, !dbg !206, !tbaa !162
  %not. = icmp ne %struct.packet* %12, null, !dbg !206
  %13 = zext i1 %not. to i32, !dbg !206
  %14 = getelementptr inbounds %struct.task* %10, i64 0, i32 4, !dbg !206
  store i32 %13, i32* %14, align 4, !dbg !206, !tbaa !164
  br label %15, !dbg !206

; <label>:15                                      ; preds = %.lr.ph, %.lr.ph, %5
  %16 = phi %struct.task* [ %2, %.lr.ph ], [ %2, %.lr.ph ], [ %10, %5 ]
  %pkt.0 = phi %struct.packet* [ null, %.lr.ph ], [ null, %.lr.ph ], [ %7, %5 ]
  %17 = getelementptr inbounds %struct.task* %16, i64 0, i32 1, !dbg !207
  %18 = load i32* %17, align 4, !dbg !207, !tbaa !158
  %19 = sext i32 %18 to i64, !dbg !207
  store i64 %19, i64* @taskid, align 8, !dbg !207, !tbaa !208
  %20 = getelementptr inbounds %struct.task* %16, i64 0, i32 6, !dbg !209
  %21 = load i64* %20, align 8, !dbg !209, !tbaa !168
  store i64 %21, i64* @v1, align 8, !dbg !209, !tbaa !208
  %22 = getelementptr inbounds %struct.task* %16, i64 0, i32 7, !dbg !210
  %23 = load i64* %22, align 8, !dbg !210, !tbaa !170
  store i64 %23, i64* @v2, align 8, !dbg !210, !tbaa !208
  %24 = load i32* @tracing, align 4, !dbg !211, !tbaa !192
  %25 = icmp eq i32 %24, 1, !dbg !211
  br i1 %25, label %26, label %33, !dbg !211

; <label>:26                                      ; preds = %15
  %27 = load i32* @layout, align 4, !dbg !213, !tbaa !192
  %28 = add nsw i32 %27, -1, !dbg !213
  store i32 %28, i32* @layout, align 4, !dbg !213, !tbaa !192
  %29 = icmp slt i32 %27, 2, !dbg !213
  br i1 %29, label %30, label %trace.exit, !dbg !213

; <label>:30                                      ; preds = %26
  %putchar1.i = tail call i32 @putchar(i32 10) #3, !dbg !214
  store i32 50, i32* @layout, align 4, !dbg !215, !tbaa !192
  br label %trace.exit, !dbg !216

trace.exit:                                       ; preds = %26, %30
  %31 = shl i32 %18, 24, !dbg !217
  %sext = add i32 %31, 805306368, !dbg !217
  %32 = ashr exact i32 %sext, 24, !dbg !217
  %putchar.i = tail call i32 @putchar(i32 %32) #3, !dbg !217
  %.pre = load %struct.task** @tcb, align 8, !dbg !218, !tbaa !148
  br label %33, !dbg !211

; <label>:33                                      ; preds = %trace.exit, %15
  %34 = phi %struct.task* [ %.pre, %trace.exit ], [ %16, %15 ]
  %35 = getelementptr inbounds %struct.task* %34, i64 0, i32 5, !dbg !218
  %36 = load %struct.task* (%struct.packet*)** %35, align 8, !dbg !218, !tbaa !166
  %37 = tail call %struct.task* %36(%struct.packet* %pkt.0) #3, !dbg !218
  tail call void @llvm.dbg.value(metadata !{%struct.task* %37}, i64 0, metadata !65), !dbg !218
  %38 = load i64* @v1, align 8, !dbg !219, !tbaa !208
  %39 = load %struct.task** @tcb, align 8, !dbg !219, !tbaa !148
  %40 = getelementptr inbounds %struct.task* %39, i64 0, i32 6, !dbg !219
  store i64 %38, i64* %40, align 8, !dbg !219, !tbaa !168
  %41 = load i64* @v2, align 8, !dbg !220, !tbaa !208
  %42 = getelementptr inbounds %struct.task* %39, i64 0, i32 7, !dbg !220
  store i64 %41, i64* %42, align 8, !dbg !220, !tbaa !170
  br label %.backedge, !dbg !221

; <label>:43                                      ; preds = %.lr.ph, %.lr.ph, %.lr.ph, %.lr.ph, %.lr.ph
  %44 = getelementptr inbounds %struct.task* %2, i64 0, i32 0, !dbg !222
  %45 = load %struct.task** %44, align 8, !dbg !222, !tbaa !153
  br label %.backedge, !dbg !223

.backedge:                                        ; preds = %43, %33
  %storemerge = phi %struct.task* [ %45, %43 ], [ %37, %33 ]
  store %struct.task* %storemerge, %struct.task** @tcb, align 8, !dbg !224, !tbaa !148
  %46 = icmp eq %struct.task* %storemerge, null, !dbg !199
  br i1 %46, label %._crit_edge, label %.lr.ph, !dbg !199

._crit_edge:                                      ; preds = %.lr.ph, %.backedge, %0
  ret void, !dbg !225
}

; Function Attrs: nounwind uwtable
define %struct.task* @Wait() #0 {
  %1 = load %struct.task** @tcb, align 8, !dbg !226, !tbaa !148
  %2 = getelementptr inbounds %struct.task* %1, i64 0, i32 4, !dbg !226
  %3 = load i32* %2, align 4, !dbg !226, !tbaa !164
  %4 = or i32 %3, 2, !dbg !226
  store i32 %4, i32* %2, align 4, !dbg !226, !tbaa !164
  ret %struct.task* %1, !dbg !227
}

; Function Attrs: nounwind uwtable
define %struct.task* @holdself() #0 {
  %1 = load i32* @holdcount, align 4, !dbg !228, !tbaa !192
  %2 = add nsw i32 %1, 1, !dbg !228
  store i32 %2, i32* @holdcount, align 4, !dbg !228, !tbaa !192
  %3 = load %struct.task** @tcb, align 8, !dbg !229, !tbaa !148
  %4 = getelementptr inbounds %struct.task* %3, i64 0, i32 4, !dbg !229
  %5 = load i32* %4, align 4, !dbg !229, !tbaa !164
  %6 = or i32 %5, 4, !dbg !229
  store i32 %6, i32* %4, align 4, !dbg !229, !tbaa !164
  %7 = getelementptr inbounds %struct.task* %3, i64 0, i32 0, !dbg !230
  %8 = load %struct.task** %7, align 8, !dbg !230, !tbaa !153
  ret %struct.task* %8, !dbg !230
}

; Function Attrs: nounwind uwtable
define %struct.task* @findtcb(i32 %id) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %id}, i64 0, metadata !74), !dbg !231
  tail call void @llvm.dbg.value(metadata !232, i64 0, metadata !75), !dbg !233
  %id.off = add i32 %id, -1, !dbg !234
  %1 = icmp ult i32 %id.off, 10, !dbg !234
  br i1 %1, label %2, label %.thread, !dbg !234

; <label>:2                                       ; preds = %0
  %3 = sext i32 %id to i64, !dbg !234
  %4 = getelementptr inbounds [11 x %struct.task*]* @tasktab, i64 0, i64 %3, !dbg !236
  %5 = load %struct.task** %4, align 8, !dbg !236, !tbaa !148
  tail call void @llvm.dbg.value(metadata !{%struct.task* %5}, i64 0, metadata !75), !dbg !236
  %6 = icmp eq %struct.task* %5, null, !dbg !237
  br i1 %6, label %.thread, label %8, !dbg !237

.thread:                                          ; preds = %0, %2
  %7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str2, i64 0, i64 0), i32 %id) #3, !dbg !237
  br label %8, !dbg !237

; <label>:8                                       ; preds = %.thread, %2
  %t.01 = phi %struct.task* [ null, %.thread ], [ %5, %2 ]
  ret %struct.task* %t.01, !dbg !239
}

; Function Attrs: nounwind uwtable
define %struct.task* @release(i32 %id) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %id}, i64 0, metadata !78), !dbg !240
  tail call void @llvm.dbg.value(metadata !{i32 %id}, i64 0, metadata !241) #3, !dbg !243
  tail call void @llvm.dbg.value(metadata !232, i64 0, metadata !244) #3, !dbg !245
  %id.off.i = add i32 %id, -1, !dbg !246
  %1 = icmp ult i32 %id.off.i, 10, !dbg !246
  br i1 %1, label %2, label %findtcb.exit.thread, !dbg !246

; <label>:2                                       ; preds = %0
  %3 = sext i32 %id to i64, !dbg !246
  %4 = getelementptr inbounds [11 x %struct.task*]* @tasktab, i64 0, i64 %3, !dbg !247
  %5 = load %struct.task** %4, align 8, !dbg !247, !tbaa !148
  tail call void @llvm.dbg.value(metadata !{%struct.task* %5}, i64 0, metadata !244) #3, !dbg !247
  %6 = icmp eq %struct.task* %5, null, !dbg !248
  br i1 %6, label %findtcb.exit.thread, label %8, !dbg !248

findtcb.exit.thread:                              ; preds = %0, %2
  %7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str2, i64 0, i64 0), i32 %id) #3, !dbg !248
  tail call void @llvm.dbg.value(metadata !{%struct.task* %5}, i64 0, metadata !79), !dbg !242
  br label %18, !dbg !249

; <label>:8                                       ; preds = %2
  tail call void @llvm.dbg.value(metadata !{%struct.task* %5}, i64 0, metadata !79), !dbg !242
  %9 = getelementptr inbounds %struct.task* %5, i64 0, i32 4, !dbg !251
  %10 = load i32* %9, align 4, !dbg !251, !tbaa !164
  %11 = and i32 %10, 65531, !dbg !251
  store i32 %11, i32* %9, align 4, !dbg !251, !tbaa !164
  %12 = getelementptr inbounds %struct.task* %5, i64 0, i32 2, !dbg !252
  %13 = load i32* %12, align 4, !dbg !252, !tbaa !160
  %14 = load %struct.task** @tcb, align 8, !dbg !252, !tbaa !148
  %15 = getelementptr inbounds %struct.task* %14, i64 0, i32 2, !dbg !252
  %16 = load i32* %15, align 4, !dbg !252, !tbaa !160
  %17 = icmp sgt i32 %13, %16, !dbg !252
  %. = select i1 %17, %struct.task* %5, %struct.task* %14, !dbg !252
  br label %18, !dbg !252

; <label>:18                                      ; preds = %findtcb.exit.thread, %8
  %.0 = phi %struct.task* [ %., %8 ], [ null, %findtcb.exit.thread ]
  ret %struct.task* %.0, !dbg !254
}

; Function Attrs: nounwind uwtable
define %struct.task* @qpkt(%struct.packet* %pkt) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %pkt}, i64 0, metadata !82), !dbg !255
  %1 = getelementptr inbounds %struct.packet* %pkt, i64 0, i32 1, !dbg !256
  %2 = load i32* %1, align 4, !dbg !256, !tbaa !183
  tail call void @llvm.dbg.value(metadata !{i32 %2}, i64 0, metadata !257) #3, !dbg !258
  tail call void @llvm.dbg.value(metadata !232, i64 0, metadata !259) #3, !dbg !260
  %id.off.i = add i32 %2, -1, !dbg !261
  %3 = icmp ult i32 %id.off.i, 10, !dbg !261
  br i1 %3, label %4, label %findtcb.exit.thread, !dbg !261

; <label>:4                                       ; preds = %0
  %5 = sext i32 %2 to i64, !dbg !261
  %6 = getelementptr inbounds [11 x %struct.task*]* @tasktab, i64 0, i64 %5, !dbg !262
  %7 = load %struct.task** %6, align 8, !dbg !262, !tbaa !148
  tail call void @llvm.dbg.value(metadata !{%struct.task* %7}, i64 0, metadata !259) #3, !dbg !262
  %8 = icmp eq %struct.task* %7, null, !dbg !263
  br i1 %8, label %findtcb.exit.thread, label %10, !dbg !263

findtcb.exit.thread:                              ; preds = %0, %4
  %9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str2, i64 0, i64 0), i32 %2) #3, !dbg !263
  tail call void @llvm.dbg.value(metadata !{%struct.task* %7}, i64 0, metadata !83), !dbg !256
  br label %37, !dbg !264

; <label>:10                                      ; preds = %4
  tail call void @llvm.dbg.value(metadata !{%struct.task* %7}, i64 0, metadata !83), !dbg !256
  %11 = load i32* @qpktcount, align 4, !dbg !266, !tbaa !192
  %12 = add nsw i32 %11, 1, !dbg !266
  store i32 %12, i32* @qpktcount, align 4, !dbg !266, !tbaa !192
  %13 = getelementptr inbounds %struct.packet* %pkt, i64 0, i32 0, !dbg !267
  store %struct.packet* null, %struct.packet** %13, align 8, !dbg !267, !tbaa !180
  %14 = load i64* @taskid, align 8, !dbg !268, !tbaa !208
  %15 = trunc i64 %14 to i32, !dbg !268
  store i32 %15, i32* %1, align 4, !dbg !268, !tbaa !183
  %16 = getelementptr inbounds %struct.task* %7, i64 0, i32 3, !dbg !269
  %17 = load %struct.packet** %16, align 8, !dbg !269, !tbaa !162
  %18 = icmp eq %struct.packet* %17, null, !dbg !269
  br i1 %18, label %19, label %29, !dbg !269

; <label>:19                                      ; preds = %10
  store %struct.packet* %pkt, %struct.packet** %16, align 8, !dbg !271, !tbaa !162
  %20 = getelementptr inbounds %struct.task* %7, i64 0, i32 4, !dbg !273
  %21 = load i32* %20, align 4, !dbg !273, !tbaa !164
  %22 = or i32 %21, 1, !dbg !273
  store i32 %22, i32* %20, align 4, !dbg !273, !tbaa !164
  %23 = getelementptr inbounds %struct.task* %7, i64 0, i32 2, !dbg !274
  %24 = load i32* %23, align 4, !dbg !274, !tbaa !160
  %25 = load %struct.task** @tcb, align 8, !dbg !274, !tbaa !148
  %26 = getelementptr inbounds %struct.task* %25, i64 0, i32 2, !dbg !274
  %27 = load i32* %26, align 4, !dbg !274, !tbaa !160
  %28 = icmp sgt i32 %24, %27, !dbg !274
  br i1 %28, label %37, label %35, !dbg !274

; <label>:29                                      ; preds = %10
  %30 = bitcast %struct.packet** %16 to %struct.packet*, !dbg !276
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %pkt}, i64 0, metadata !278), !dbg !279
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %30}, i64 0, metadata !280), !dbg !279
  store %struct.packet* null, %struct.packet** %13, align 8, !dbg !281, !tbaa !180
  br label %31, !dbg !282

; <label>:31                                      ; preds = %31, %29
  %.0.i = phi %struct.packet* [ %30, %29 ], [ %33, %31 ]
  %32 = getelementptr inbounds %struct.packet* %.0.i, i64 0, i32 0, !dbg !282
  %33 = load %struct.packet** %32, align 8, !dbg !282, !tbaa !180
  %34 = icmp eq %struct.packet* %33, null, !dbg !282
  br i1 %34, label %append.exit, label %31, !dbg !282

append.exit:                                      ; preds = %31
  store %struct.packet* %pkt, %struct.packet** %32, align 8, !dbg !283, !tbaa !180
  %.pre = load %struct.task** @tcb, align 8, !dbg !284, !tbaa !148
  br label %35

; <label>:35                                      ; preds = %19, %append.exit
  %36 = phi %struct.task* [ %25, %19 ], [ %.pre, %append.exit ]
  br label %37, !dbg !284

; <label>:37                                      ; preds = %findtcb.exit.thread, %19, %35
  %.0 = phi %struct.task* [ %36, %35 ], [ %7, %19 ], [ null, %findtcb.exit.thread ]
  ret %struct.task* %.0, !dbg !285
}

; Function Attrs: nounwind uwtable
define void @append(%struct.packet* %pkt, %struct.packet* nocapture %ptr) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %pkt}, i64 0, metadata !110), !dbg !286
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %ptr}, i64 0, metadata !111), !dbg !286
  %1 = getelementptr inbounds %struct.packet* %pkt, i64 0, i32 0, !dbg !287
  store %struct.packet* null, %struct.packet** %1, align 8, !dbg !287, !tbaa !180
  br label %2, !dbg !288

; <label>:2                                       ; preds = %2, %0
  %.0 = phi %struct.packet* [ %ptr, %0 ], [ %4, %2 ]
  %3 = getelementptr inbounds %struct.packet* %.0, i64 0, i32 0, !dbg !288
  %4 = load %struct.packet** %3, align 8, !dbg !288, !tbaa !180
  %5 = icmp eq %struct.packet* %4, null, !dbg !288
  br i1 %5, label %6, label %2, !dbg !288

; <label>:6                                       ; preds = %2
  store %struct.packet* %pkt, %struct.packet** %3, align 8, !dbg !289, !tbaa !180
  ret void, !dbg !290
}

; Function Attrs: nounwind uwtable
define %struct.task* @idlefn(%struct.packet* nocapture readnone %pkt) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %pkt}, i64 0, metadata !86), !dbg !291
  %1 = load i64* @v2, align 8, !dbg !292, !tbaa !208
  %2 = add nsw i64 %1, -1, !dbg !292
  store i64 %2, i64* @v2, align 8, !dbg !292, !tbaa !208
  %3 = icmp eq i64 %2, 0, !dbg !293
  br i1 %3, label %4, label %13, !dbg !293

; <label>:4                                       ; preds = %0
  %5 = load i32* @holdcount, align 4, !dbg !295, !tbaa !192
  %6 = add nsw i32 %5, 1, !dbg !295
  store i32 %6, i32* @holdcount, align 4, !dbg !295, !tbaa !192
  %7 = load %struct.task** @tcb, align 8, !dbg !296, !tbaa !148
  %8 = getelementptr inbounds %struct.task* %7, i64 0, i32 4, !dbg !296
  %9 = load i32* %8, align 4, !dbg !296, !tbaa !164
  %10 = or i32 %9, 4, !dbg !296
  store i32 %10, i32* %8, align 4, !dbg !296, !tbaa !164
  %11 = getelementptr inbounds %struct.task* %7, i64 0, i32 0, !dbg !297
  %12 = load %struct.task** %11, align 8, !dbg !297, !tbaa !153
  br label %release.exit4, !dbg !293

; <label>:13                                      ; preds = %0
  %14 = load i64* @v1, align 8, !dbg !298, !tbaa !208
  %15 = and i64 %14, 1, !dbg !298
  %16 = icmp eq i64 %15, 0, !dbg !298
  %17 = lshr i64 %14, 1, !dbg !300
  %18 = and i64 %17, 32767, !dbg !300
  br i1 %16, label %19, label %33, !dbg !298

; <label>:19                                      ; preds = %13
  store i64 %18, i64* @v1, align 8, !dbg !300, !tbaa !208
  tail call void @llvm.dbg.value(metadata !302, i64 0, metadata !303) #3, !dbg !305
  tail call void @llvm.dbg.value(metadata !302, i64 0, metadata !306) #3, !dbg !308
  tail call void @llvm.dbg.value(metadata !232, i64 0, metadata !309) #3, !dbg !310
  %20 = load %struct.task** getelementptr inbounds ([11 x %struct.task*]* @tasktab, i64 0, i64 5), align 8, !dbg !311, !tbaa !148
  tail call void @llvm.dbg.value(metadata !{%struct.task* %20}, i64 0, metadata !309) #3, !dbg !311
  %21 = icmp eq %struct.task* %20, null, !dbg !312
  br i1 %21, label %findtcb.exit.thread.i1, label %23, !dbg !312

findtcb.exit.thread.i1:                           ; preds = %19
  %22 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str2, i64 0, i64 0), i32 5) #3, !dbg !312
  tail call void @llvm.dbg.value(metadata !{%struct.task* %20}, i64 0, metadata !313) #3, !dbg !307
  br label %release.exit4, !dbg !314

; <label>:23                                      ; preds = %19
  tail call void @llvm.dbg.value(metadata !{%struct.task* %20}, i64 0, metadata !313) #3, !dbg !307
  %24 = getelementptr inbounds %struct.task* %20, i64 0, i32 4, !dbg !315
  %25 = load i32* %24, align 4, !dbg !315, !tbaa !164
  %26 = and i32 %25, 65531, !dbg !315
  store i32 %26, i32* %24, align 4, !dbg !315, !tbaa !164
  %27 = getelementptr inbounds %struct.task* %20, i64 0, i32 2, !dbg !316
  %28 = load i32* %27, align 4, !dbg !316, !tbaa !160
  %29 = load %struct.task** @tcb, align 8, !dbg !316, !tbaa !148
  %30 = getelementptr inbounds %struct.task* %29, i64 0, i32 2, !dbg !316
  %31 = load i32* %30, align 4, !dbg !316, !tbaa !160
  %32 = icmp sgt i32 %28, %31, !dbg !316
  %..i2 = select i1 %32, %struct.task* %20, %struct.task* %29, !dbg !316
  br label %release.exit4, !dbg !316

; <label>:33                                      ; preds = %13
  %34 = xor i64 %18, 53256, !dbg !317
  store i64 %34, i64* @v1, align 8, !dbg !317, !tbaa !208
  tail call void @llvm.dbg.value(metadata !319, i64 0, metadata !320) #3, !dbg !322
  tail call void @llvm.dbg.value(metadata !319, i64 0, metadata !323) #3, !dbg !325
  tail call void @llvm.dbg.value(metadata !232, i64 0, metadata !326) #3, !dbg !327
  %35 = load %struct.task** getelementptr inbounds ([11 x %struct.task*]* @tasktab, i64 0, i64 6), align 16, !dbg !328, !tbaa !148
  tail call void @llvm.dbg.value(metadata !{%struct.task* %35}, i64 0, metadata !326) #3, !dbg !328
  %36 = icmp eq %struct.task* %35, null, !dbg !329
  br i1 %36, label %findtcb.exit.thread.i, label %38, !dbg !329

findtcb.exit.thread.i:                            ; preds = %33
  %37 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str2, i64 0, i64 0), i32 6) #3, !dbg !329
  tail call void @llvm.dbg.value(metadata !{%struct.task* %35}, i64 0, metadata !330) #3, !dbg !324
  br label %release.exit4, !dbg !331

; <label>:38                                      ; preds = %33
  tail call void @llvm.dbg.value(metadata !{%struct.task* %35}, i64 0, metadata !330) #3, !dbg !324
  %39 = getelementptr inbounds %struct.task* %35, i64 0, i32 4, !dbg !332
  %40 = load i32* %39, align 4, !dbg !332, !tbaa !164
  %41 = and i32 %40, 65531, !dbg !332
  store i32 %41, i32* %39, align 4, !dbg !332, !tbaa !164
  %42 = getelementptr inbounds %struct.task* %35, i64 0, i32 2, !dbg !333
  %43 = load i32* %42, align 4, !dbg !333, !tbaa !160
  %44 = load %struct.task** @tcb, align 8, !dbg !333, !tbaa !148
  %45 = getelementptr inbounds %struct.task* %44, i64 0, i32 2, !dbg !333
  %46 = load i32* %45, align 4, !dbg !333, !tbaa !160
  %47 = icmp sgt i32 %43, %46, !dbg !333
  %..i = select i1 %47, %struct.task* %35, %struct.task* %44, !dbg !333
  br label %release.exit4, !dbg !333

release.exit4:                                    ; preds = %38, %findtcb.exit.thread.i, %23, %findtcb.exit.thread.i1, %4
  %.0 = phi %struct.task* [ %12, %4 ], [ %..i2, %23 ], [ null, %findtcb.exit.thread.i1 ], [ %..i, %38 ], [ null, %findtcb.exit.thread.i ]
  ret %struct.task* %.0, !dbg !334
}

; Function Attrs: nounwind uwtable
define %struct.task* @workfn(%struct.packet* %pkt) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %pkt}, i64 0, metadata !89), !dbg !335
  %1 = icmp eq %struct.packet* %pkt, null, !dbg !336
  br i1 %1, label %2, label %7, !dbg !336

; <label>:2                                       ; preds = %0
  %3 = load %struct.task** @tcb, align 8, !dbg !337, !tbaa !148
  %4 = getelementptr inbounds %struct.task* %3, i64 0, i32 4, !dbg !337
  %5 = load i32* %4, align 4, !dbg !337, !tbaa !164
  %6 = or i32 %5, 2, !dbg !337
  store i32 %6, i32* %4, align 4, !dbg !337, !tbaa !164
  br label %qpkt.exit, !dbg !336

; <label>:7                                       ; preds = %0
  %8 = load i64* @v1, align 8, !dbg !338, !tbaa !208
  %9 = sub nsw i64 7, %8, !dbg !338
  store i64 %9, i64* @v1, align 8, !dbg !338, !tbaa !208
  %10 = trunc i64 %9 to i32, !dbg !339
  %11 = getelementptr inbounds %struct.packet* %pkt, i64 0, i32 1, !dbg !339
  store i32 %10, i32* %11, align 4, !dbg !339, !tbaa !183
  %12 = getelementptr inbounds %struct.packet* %pkt, i64 0, i32 3, !dbg !340
  store i32 0, i32* %12, align 4, !dbg !340, !tbaa !187
  tail call void @llvm.dbg.value(metadata !175, i64 0, metadata !90), !dbg !341
  %13 = load i64* @v2, align 8, !dbg !343, !tbaa !208
  %14 = add nsw i64 %13, 1, !dbg !343
  %15 = icmp sgt i64 %13, 25, !dbg !345
  %. = select i1 %15, i64 1, i64 %14, !dbg !345
  store i64 %., i64* @v2, align 8, !dbg !345, !tbaa !208
  %16 = getelementptr inbounds [28 x i8]* @alphabet, i64 0, i64 %., !dbg !347
  %17 = load i8* %16, align 1, !dbg !347, !tbaa !348
  %18 = getelementptr inbounds %struct.packet* %pkt, i64 0, i32 4, i64 0, !dbg !347
  store i8 %17, i8* %18, align 1, !dbg !347, !tbaa !348
  %19 = load i64* @v2, align 8, !dbg !343, !tbaa !208
  %20 = add nsw i64 %19, 1, !dbg !343
  %21 = icmp sgt i64 %19, 25, !dbg !345
  %..1 = select i1 %21, i64 1, i64 %20, !dbg !345
  store i64 %..1, i64* @v2, align 8, !dbg !345, !tbaa !208
  %22 = getelementptr inbounds [28 x i8]* @alphabet, i64 0, i64 %..1, !dbg !347
  %23 = load i8* %22, align 1, !dbg !347, !tbaa !348
  %24 = getelementptr inbounds %struct.packet* %pkt, i64 0, i32 4, i64 1, !dbg !347
  store i8 %23, i8* %24, align 1, !dbg !347, !tbaa !348
  %25 = load i64* @v2, align 8, !dbg !343, !tbaa !208
  %26 = add nsw i64 %25, 1, !dbg !343
  %27 = icmp sgt i64 %25, 25, !dbg !345
  %..2 = select i1 %27, i64 1, i64 %26, !dbg !345
  store i64 %..2, i64* @v2, align 8, !dbg !345, !tbaa !208
  %28 = getelementptr inbounds [28 x i8]* @alphabet, i64 0, i64 %..2, !dbg !347
  %29 = load i8* %28, align 1, !dbg !347, !tbaa !348
  %30 = getelementptr inbounds %struct.packet* %pkt, i64 0, i32 4, i64 2, !dbg !347
  store i8 %29, i8* %30, align 1, !dbg !347, !tbaa !348
  %31 = load i64* @v2, align 8, !dbg !343, !tbaa !208
  %32 = add nsw i64 %31, 1, !dbg !343
  %33 = icmp sgt i64 %31, 25, !dbg !345
  %..3 = select i1 %33, i64 1, i64 %32, !dbg !345
  store i64 %..3, i64* @v2, align 8, !dbg !345, !tbaa !208
  %34 = getelementptr inbounds [28 x i8]* @alphabet, i64 0, i64 %..3, !dbg !347
  %35 = load i8* %34, align 1, !dbg !347, !tbaa !348
  %36 = getelementptr inbounds %struct.packet* %pkt, i64 0, i32 4, i64 3, !dbg !347
  store i8 %35, i8* %36, align 1, !dbg !347, !tbaa !348
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %pkt}, i64 0, metadata !349) #3, !dbg !351
  tail call void @llvm.dbg.value(metadata !{i32 %10}, i64 0, metadata !352) #3, !dbg !354
  tail call void @llvm.dbg.value(metadata !232, i64 0, metadata !355) #3, !dbg !356
  %id.off.i.i = add i32 %10, -1, !dbg !357
  %37 = icmp ult i32 %id.off.i.i, 10, !dbg !357
  br i1 %37, label %38, label %findtcb.exit.thread.i, !dbg !357

; <label>:38                                      ; preds = %7
  %sext = shl i64 %9, 32, !dbg !357
  %39 = ashr exact i64 %sext, 32, !dbg !357
  %40 = getelementptr inbounds [11 x %struct.task*]* @tasktab, i64 0, i64 %39, !dbg !358
  %41 = load %struct.task** %40, align 8, !dbg !358, !tbaa !148
  %42 = icmp eq %struct.task* %41, null, !dbg !359
  br i1 %42, label %findtcb.exit.thread.i, label %44, !dbg !359

findtcb.exit.thread.i:                            ; preds = %38, %7
  %43 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str2, i64 0, i64 0), i32 %10) #3, !dbg !359
  br label %qpkt.exit, !dbg !360

; <label>:44                                      ; preds = %38
  %45 = load i32* @qpktcount, align 4, !dbg !361, !tbaa !192
  %46 = add nsw i32 %45, 1, !dbg !361
  store i32 %46, i32* @qpktcount, align 4, !dbg !361, !tbaa !192
  %47 = getelementptr inbounds %struct.packet* %pkt, i64 0, i32 0, !dbg !362
  store %struct.packet* null, %struct.packet** %47, align 8, !dbg !362, !tbaa !180
  %48 = load i64* @taskid, align 8, !dbg !363, !tbaa !208
  %49 = trunc i64 %48 to i32, !dbg !363
  store i32 %49, i32* %11, align 4, !dbg !363, !tbaa !183
  %50 = getelementptr inbounds %struct.task* %41, i64 0, i32 3, !dbg !364
  %51 = load %struct.packet** %50, align 8, !dbg !364, !tbaa !162
  %52 = icmp eq %struct.packet* %51, null, !dbg !364
  br i1 %52, label %53, label %63, !dbg !364

; <label>:53                                      ; preds = %44
  store %struct.packet* %pkt, %struct.packet** %50, align 8, !dbg !365, !tbaa !162
  %54 = getelementptr inbounds %struct.task* %41, i64 0, i32 4, !dbg !366
  %55 = load i32* %54, align 4, !dbg !366, !tbaa !164
  %56 = or i32 %55, 1, !dbg !366
  store i32 %56, i32* %54, align 4, !dbg !366, !tbaa !164
  %57 = getelementptr inbounds %struct.task* %41, i64 0, i32 2, !dbg !367
  %58 = load i32* %57, align 4, !dbg !367, !tbaa !160
  %59 = load %struct.task** @tcb, align 8, !dbg !367, !tbaa !148
  %60 = getelementptr inbounds %struct.task* %59, i64 0, i32 2, !dbg !367
  %61 = load i32* %60, align 4, !dbg !367, !tbaa !160
  %62 = icmp sgt i32 %58, %61, !dbg !367
  br i1 %62, label %qpkt.exit, label %69, !dbg !367

; <label>:63                                      ; preds = %44
  %64 = bitcast %struct.packet** %50 to %struct.packet*, !dbg !368
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %pkt}, i64 0, metadata !369) #3, !dbg !370
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %64}, i64 0, metadata !371) #3, !dbg !370
  store %struct.packet* null, %struct.packet** %47, align 8, !dbg !372, !tbaa !180
  br label %65, !dbg !373

; <label>:65                                      ; preds = %65, %63
  %.0.i.i = phi %struct.packet* [ %64, %63 ], [ %67, %65 ]
  %66 = getelementptr inbounds %struct.packet* %.0.i.i, i64 0, i32 0, !dbg !373
  %67 = load %struct.packet** %66, align 8, !dbg !373, !tbaa !180
  %68 = icmp eq %struct.packet* %67, null, !dbg !373
  br i1 %68, label %append.exit.i, label %65, !dbg !373

append.exit.i:                                    ; preds = %65
  store %struct.packet* %pkt, %struct.packet** %66, align 8, !dbg !374, !tbaa !180
  %.pre.i = load %struct.task** @tcb, align 8, !dbg !375, !tbaa !148
  br label %69

; <label>:69                                      ; preds = %append.exit.i, %53
  %70 = phi %struct.task* [ %59, %53 ], [ %.pre.i, %append.exit.i ]
  br label %qpkt.exit, !dbg !375

qpkt.exit:                                        ; preds = %69, %53, %findtcb.exit.thread.i, %2
  %.0 = phi %struct.task* [ %3, %2 ], [ %70, %69 ], [ %41, %53 ], [ null, %findtcb.exit.thread.i ]
  ret %struct.task* %.0, !dbg !376
}

; Function Attrs: nounwind uwtable
define %struct.task* @handlerfn(%struct.packet* %pkt) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %pkt}, i64 0, metadata !95), !dbg !377
  %1 = icmp eq %struct.packet* %pkt, null, !dbg !378
  br i1 %1, label %12, label %2, !dbg !378

; <label>:2                                       ; preds = %0
  %3 = getelementptr inbounds %struct.packet* %pkt, i64 0, i32 2, !dbg !378
  %4 = load i32* %3, align 4, !dbg !378, !tbaa !185
  %5 = icmp eq i32 %4, 1001, !dbg !378
  %6 = select i1 %5, %struct.packet* bitcast (i64* @v1 to %struct.packet*), %struct.packet* bitcast (i64* @v2 to %struct.packet*), !dbg !378
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %pkt}, i64 0, metadata !380), !dbg !381
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %6}, i64 0, metadata !382), !dbg !381
  %7 = getelementptr inbounds %struct.packet* %pkt, i64 0, i32 0, !dbg !383
  store %struct.packet* null, %struct.packet** %7, align 8, !dbg !383, !tbaa !180
  br label %8, !dbg !384

; <label>:8                                       ; preds = %8, %2
  %.0.i = phi %struct.packet* [ %6, %2 ], [ %10, %8 ]
  %9 = getelementptr inbounds %struct.packet* %.0.i, i64 0, i32 0, !dbg !384
  %10 = load %struct.packet** %9, align 8, !dbg !384, !tbaa !180
  %11 = icmp eq %struct.packet* %10, null, !dbg !384
  br i1 %11, label %append.exit, label %8, !dbg !384

append.exit:                                      ; preds = %8
  store %struct.packet* %pkt, %struct.packet** %9, align 8, !dbg !385, !tbaa !180
  br label %12, !dbg !378

; <label>:12                                      ; preds = %0, %append.exit
  %13 = load i64* @v1, align 8, !dbg !386, !tbaa !208
  %14 = icmp eq i64 %13, 0, !dbg !386
  br i1 %14, label %108, label %15, !dbg !386

; <label>:15                                      ; preds = %12
  %16 = inttoptr i64 %13 to %struct.packet*, !dbg !387
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %16}, i64 0, metadata !99), !dbg !387
  %17 = getelementptr inbounds %struct.packet* %16, i64 0, i32 3, !dbg !388
  %18 = load i32* %17, align 4, !dbg !388, !tbaa !187
  tail call void @llvm.dbg.value(metadata !{i32 %18}, i64 0, metadata !96), !dbg !388
  %19 = icmp sgt i32 %18, 3, !dbg !389
  br i1 %19, label %20, label %59, !dbg !389

; <label>:20                                      ; preds = %15
  %21 = getelementptr inbounds %struct.packet* %16, i64 0, i32 0, !dbg !391
  %22 = load %struct.packet** %21, align 8, !dbg !391, !tbaa !180
  %23 = ptrtoint %struct.packet* %22 to i64, !dbg !391
  store i64 %23, i64* @v1, align 8, !dbg !391, !tbaa !208
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %16}, i64 0, metadata !393) #3, !dbg !395
  %24 = getelementptr inbounds %struct.packet* %16, i64 0, i32 1, !dbg !396
  %25 = load i32* %24, align 4, !dbg !396, !tbaa !183
  tail call void @llvm.dbg.value(metadata !{i32 %25}, i64 0, metadata !397) #3, !dbg !398
  tail call void @llvm.dbg.value(metadata !232, i64 0, metadata !399) #3, !dbg !400
  %id.off.i.i2 = add i32 %25, -1, !dbg !401
  %26 = icmp ult i32 %id.off.i.i2, 10, !dbg !401
  br i1 %26, label %27, label %findtcb.exit.thread.i3, !dbg !401

; <label>:27                                      ; preds = %20
  %28 = sext i32 %25 to i64, !dbg !401
  %29 = getelementptr inbounds [11 x %struct.task*]* @tasktab, i64 0, i64 %28, !dbg !402
  %30 = load %struct.task** %29, align 8, !dbg !402, !tbaa !148
  %31 = icmp eq %struct.task* %30, null, !dbg !403
  br i1 %31, label %findtcb.exit.thread.i3, label %33, !dbg !403

findtcb.exit.thread.i3:                           ; preds = %27, %20
  %32 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str2, i64 0, i64 0), i32 %25) #3, !dbg !403
  br label %qpkt.exit8, !dbg !404

; <label>:33                                      ; preds = %27
  %34 = load i32* @qpktcount, align 4, !dbg !405, !tbaa !192
  %35 = add nsw i32 %34, 1, !dbg !405
  store i32 %35, i32* @qpktcount, align 4, !dbg !405, !tbaa !192
  store %struct.packet* null, %struct.packet** %21, align 8, !dbg !406, !tbaa !180
  %36 = load i64* @taskid, align 8, !dbg !407, !tbaa !208
  %37 = trunc i64 %36 to i32, !dbg !407
  store i32 %37, i32* %24, align 4, !dbg !407, !tbaa !183
  %38 = getelementptr inbounds %struct.task* %30, i64 0, i32 3, !dbg !408
  %39 = load %struct.packet** %38, align 8, !dbg !408, !tbaa !162
  %40 = icmp eq %struct.packet* %39, null, !dbg !408
  br i1 %40, label %41, label %51, !dbg !408

; <label>:41                                      ; preds = %33
  store %struct.packet* %16, %struct.packet** %38, align 8, !dbg !409, !tbaa !162
  %42 = getelementptr inbounds %struct.task* %30, i64 0, i32 4, !dbg !410
  %43 = load i32* %42, align 4, !dbg !410, !tbaa !164
  %44 = or i32 %43, 1, !dbg !410
  store i32 %44, i32* %42, align 4, !dbg !410, !tbaa !164
  %45 = getelementptr inbounds %struct.task* %30, i64 0, i32 2, !dbg !411
  %46 = load i32* %45, align 4, !dbg !411, !tbaa !160
  %47 = load %struct.task** @tcb, align 8, !dbg !411, !tbaa !148
  %48 = getelementptr inbounds %struct.task* %47, i64 0, i32 2, !dbg !411
  %49 = load i32* %48, align 4, !dbg !411, !tbaa !160
  %50 = icmp sgt i32 %46, %49, !dbg !411
  br i1 %50, label %qpkt.exit8, label %57, !dbg !411

; <label>:51                                      ; preds = %33
  %52 = bitcast %struct.packet** %38 to %struct.packet*, !dbg !412
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %16}, i64 0, metadata !413) #3, !dbg !414
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %52}, i64 0, metadata !415) #3, !dbg !414
  store %struct.packet* null, %struct.packet** %21, align 8, !dbg !416, !tbaa !180
  br label %53, !dbg !417

; <label>:53                                      ; preds = %53, %51
  %.0.i.i4 = phi %struct.packet* [ %52, %51 ], [ %55, %53 ]
  %54 = getelementptr inbounds %struct.packet* %.0.i.i4, i64 0, i32 0, !dbg !417
  %55 = load %struct.packet** %54, align 8, !dbg !417, !tbaa !180
  %56 = icmp eq %struct.packet* %55, null, !dbg !417
  br i1 %56, label %append.exit.i6, label %53, !dbg !417

append.exit.i6:                                   ; preds = %53
  store %struct.packet* %16, %struct.packet** %54, align 8, !dbg !418, !tbaa !180
  %.pre.i5 = load %struct.task** @tcb, align 8, !dbg !419, !tbaa !148
  br label %57

; <label>:57                                      ; preds = %append.exit.i6, %41
  %58 = phi %struct.task* [ %47, %41 ], [ %.pre.i5, %append.exit.i6 ]
  br label %qpkt.exit8, !dbg !419

; <label>:59                                      ; preds = %15
  %60 = load i64* @v2, align 8, !dbg !420, !tbaa !208
  %61 = icmp eq i64 %60, 0, !dbg !420
  br i1 %61, label %108, label %62, !dbg !420

; <label>:62                                      ; preds = %59
  %63 = inttoptr i64 %60 to %struct.packet*, !dbg !421
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %63}, i64 0, metadata !100), !dbg !421
  %64 = getelementptr inbounds %struct.packet* %63, i64 0, i32 0, !dbg !422
  %65 = load %struct.packet** %64, align 8, !dbg !422, !tbaa !180
  %66 = ptrtoint %struct.packet* %65 to i64, !dbg !422
  store i64 %66, i64* @v2, align 8, !dbg !422, !tbaa !208
  %67 = sext i32 %18 to i64, !dbg !423
  %68 = getelementptr inbounds %struct.packet* %16, i64 0, i32 4, i64 %67, !dbg !423
  %69 = load i8* %68, align 1, !dbg !423, !tbaa !348
  %70 = sext i8 %69 to i32, !dbg !423
  %71 = getelementptr inbounds %struct.packet* %63, i64 0, i32 3, !dbg !423
  store i32 %70, i32* %71, align 4, !dbg !423, !tbaa !187
  %72 = add nsw i32 %18, 1, !dbg !424
  store i32 %72, i32* %17, align 4, !dbg !424, !tbaa !187
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %63}, i64 0, metadata !425) #3, !dbg !427
  %73 = getelementptr inbounds %struct.packet* %63, i64 0, i32 1, !dbg !428
  %74 = load i32* %73, align 4, !dbg !428, !tbaa !183
  tail call void @llvm.dbg.value(metadata !{i32 %74}, i64 0, metadata !429) #3, !dbg !430
  tail call void @llvm.dbg.value(metadata !232, i64 0, metadata !431) #3, !dbg !432
  %id.off.i.i = add i32 %74, -1, !dbg !433
  %75 = icmp ult i32 %id.off.i.i, 10, !dbg !433
  br i1 %75, label %76, label %findtcb.exit.thread.i, !dbg !433

; <label>:76                                      ; preds = %62
  %77 = sext i32 %74 to i64, !dbg !433
  %78 = getelementptr inbounds [11 x %struct.task*]* @tasktab, i64 0, i64 %77, !dbg !434
  %79 = load %struct.task** %78, align 8, !dbg !434, !tbaa !148
  %80 = icmp eq %struct.task* %79, null, !dbg !435
  br i1 %80, label %findtcb.exit.thread.i, label %82, !dbg !435

findtcb.exit.thread.i:                            ; preds = %76, %62
  %81 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str2, i64 0, i64 0), i32 %74) #3, !dbg !435
  br label %qpkt.exit8, !dbg !436

; <label>:82                                      ; preds = %76
  %83 = load i32* @qpktcount, align 4, !dbg !437, !tbaa !192
  %84 = add nsw i32 %83, 1, !dbg !437
  store i32 %84, i32* @qpktcount, align 4, !dbg !437, !tbaa !192
  store %struct.packet* null, %struct.packet** %64, align 8, !dbg !438, !tbaa !180
  %85 = load i64* @taskid, align 8, !dbg !439, !tbaa !208
  %86 = trunc i64 %85 to i32, !dbg !439
  store i32 %86, i32* %73, align 4, !dbg !439, !tbaa !183
  %87 = getelementptr inbounds %struct.task* %79, i64 0, i32 3, !dbg !440
  %88 = load %struct.packet** %87, align 8, !dbg !440, !tbaa !162
  %89 = icmp eq %struct.packet* %88, null, !dbg !440
  br i1 %89, label %90, label %100, !dbg !440

; <label>:90                                      ; preds = %82
  store %struct.packet* %63, %struct.packet** %87, align 8, !dbg !441, !tbaa !162
  %91 = getelementptr inbounds %struct.task* %79, i64 0, i32 4, !dbg !442
  %92 = load i32* %91, align 4, !dbg !442, !tbaa !164
  %93 = or i32 %92, 1, !dbg !442
  store i32 %93, i32* %91, align 4, !dbg !442, !tbaa !164
  %94 = getelementptr inbounds %struct.task* %79, i64 0, i32 2, !dbg !443
  %95 = load i32* %94, align 4, !dbg !443, !tbaa !160
  %96 = load %struct.task** @tcb, align 8, !dbg !443, !tbaa !148
  %97 = getelementptr inbounds %struct.task* %96, i64 0, i32 2, !dbg !443
  %98 = load i32* %97, align 4, !dbg !443, !tbaa !160
  %99 = icmp sgt i32 %95, %98, !dbg !443
  br i1 %99, label %qpkt.exit8, label %106, !dbg !443

; <label>:100                                     ; preds = %82
  %101 = bitcast %struct.packet** %87 to %struct.packet*, !dbg !444
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %63}, i64 0, metadata !445) #3, !dbg !446
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %101}, i64 0, metadata !447) #3, !dbg !446
  store %struct.packet* null, %struct.packet** %64, align 8, !dbg !448, !tbaa !180
  br label %102, !dbg !449

; <label>:102                                     ; preds = %102, %100
  %.0.i.i = phi %struct.packet* [ %101, %100 ], [ %104, %102 ]
  %103 = getelementptr inbounds %struct.packet* %.0.i.i, i64 0, i32 0, !dbg !449
  %104 = load %struct.packet** %103, align 8, !dbg !449, !tbaa !180
  %105 = icmp eq %struct.packet* %104, null, !dbg !449
  br i1 %105, label %append.exit.i, label %102, !dbg !449

append.exit.i:                                    ; preds = %102
  store %struct.packet* %63, %struct.packet** %103, align 8, !dbg !450, !tbaa !180
  %.pre.i = load %struct.task** @tcb, align 8, !dbg !451, !tbaa !148
  br label %106

; <label>:106                                     ; preds = %append.exit.i, %90
  %107 = phi %struct.task* [ %96, %90 ], [ %.pre.i, %append.exit.i ]
  br label %qpkt.exit8, !dbg !451

; <label>:108                                     ; preds = %59, %12
  %109 = load %struct.task** @tcb, align 8, !dbg !452, !tbaa !148
  %110 = getelementptr inbounds %struct.task* %109, i64 0, i32 4, !dbg !452
  %111 = load i32* %110, align 4, !dbg !452, !tbaa !164
  %112 = or i32 %111, 2, !dbg !452
  store i32 %112, i32* %110, align 4, !dbg !452, !tbaa !164
  br label %qpkt.exit8, !dbg !453

qpkt.exit8:                                       ; preds = %106, %90, %findtcb.exit.thread.i, %57, %41, %findtcb.exit.thread.i3, %108
  %.0 = phi %struct.task* [ %109, %108 ], [ %58, %57 ], [ %30, %41 ], [ null, %findtcb.exit.thread.i3 ], [ %107, %106 ], [ %79, %90 ], [ null, %findtcb.exit.thread.i ]
  ret %struct.task* %.0, !dbg !454
}

; Function Attrs: nounwind uwtable
define %struct.task* @devfn(%struct.packet* %pkt) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %pkt}, i64 0, metadata !105), !dbg !455
  %1 = icmp eq %struct.packet* %pkt, null, !dbg !456
  br i1 %1, label %2, label %48, !dbg !456

; <label>:2                                       ; preds = %0
  %3 = load i64* @v1, align 8, !dbg !458, !tbaa !208
  %4 = icmp eq i64 %3, 0, !dbg !458
  br i1 %4, label %5, label %10, !dbg !458

; <label>:5                                       ; preds = %2
  %6 = load %struct.task** @tcb, align 8, !dbg !461, !tbaa !148
  %7 = getelementptr inbounds %struct.task* %6, i64 0, i32 4, !dbg !461
  %8 = load i32* %7, align 4, !dbg !461, !tbaa !164
  %9 = or i32 %8, 2, !dbg !461
  store i32 %9, i32* %7, align 4, !dbg !461, !tbaa !164
  br label %qpkt.exit, !dbg !458

; <label>:10                                      ; preds = %2
  %11 = inttoptr i64 %3 to %struct.packet*, !dbg !462
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %11}, i64 0, metadata !105), !dbg !462
  store i64 0, i64* @v1, align 8, !dbg !463, !tbaa !208
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %11}, i64 0, metadata !464) #3, !dbg !466
  %12 = getelementptr inbounds %struct.packet* %11, i64 0, i32 1, !dbg !467
  %13 = load i32* %12, align 4, !dbg !467, !tbaa !183
  tail call void @llvm.dbg.value(metadata !{i32 %13}, i64 0, metadata !468) #3, !dbg !469
  tail call void @llvm.dbg.value(metadata !232, i64 0, metadata !470) #3, !dbg !471
  %id.off.i.i = add i32 %13, -1, !dbg !472
  %14 = icmp ult i32 %id.off.i.i, 10, !dbg !472
  br i1 %14, label %15, label %findtcb.exit.thread.i, !dbg !472

; <label>:15                                      ; preds = %10
  %16 = sext i32 %13 to i64, !dbg !472
  %17 = getelementptr inbounds [11 x %struct.task*]* @tasktab, i64 0, i64 %16, !dbg !473
  %18 = load %struct.task** %17, align 8, !dbg !473, !tbaa !148
  %19 = icmp eq %struct.task* %18, null, !dbg !474
  br i1 %19, label %findtcb.exit.thread.i, label %21, !dbg !474

findtcb.exit.thread.i:                            ; preds = %15, %10
  %20 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str2, i64 0, i64 0), i32 %13) #3, !dbg !474
  br label %qpkt.exit, !dbg !475

; <label>:21                                      ; preds = %15
  %22 = load i32* @qpktcount, align 4, !dbg !476, !tbaa !192
  %23 = add nsw i32 %22, 1, !dbg !476
  store i32 %23, i32* @qpktcount, align 4, !dbg !476, !tbaa !192
  %24 = getelementptr inbounds %struct.packet* %11, i64 0, i32 0, !dbg !477
  store %struct.packet* null, %struct.packet** %24, align 8, !dbg !477, !tbaa !180
  %25 = load i64* @taskid, align 8, !dbg !478, !tbaa !208
  %26 = trunc i64 %25 to i32, !dbg !478
  store i32 %26, i32* %12, align 4, !dbg !478, !tbaa !183
  %27 = getelementptr inbounds %struct.task* %18, i64 0, i32 3, !dbg !479
  %28 = load %struct.packet** %27, align 8, !dbg !479, !tbaa !162
  %29 = icmp eq %struct.packet* %28, null, !dbg !479
  br i1 %29, label %30, label %40, !dbg !479

; <label>:30                                      ; preds = %21
  store %struct.packet* %11, %struct.packet** %27, align 8, !dbg !480, !tbaa !162
  %31 = getelementptr inbounds %struct.task* %18, i64 0, i32 4, !dbg !481
  %32 = load i32* %31, align 4, !dbg !481, !tbaa !164
  %33 = or i32 %32, 1, !dbg !481
  store i32 %33, i32* %31, align 4, !dbg !481, !tbaa !164
  %34 = getelementptr inbounds %struct.task* %18, i64 0, i32 2, !dbg !482
  %35 = load i32* %34, align 4, !dbg !482, !tbaa !160
  %36 = load %struct.task** @tcb, align 8, !dbg !482, !tbaa !148
  %37 = getelementptr inbounds %struct.task* %36, i64 0, i32 2, !dbg !482
  %38 = load i32* %37, align 4, !dbg !482, !tbaa !160
  %39 = icmp sgt i32 %35, %38, !dbg !482
  br i1 %39, label %qpkt.exit, label %46, !dbg !482

; <label>:40                                      ; preds = %21
  %41 = bitcast %struct.packet** %27 to %struct.packet*, !dbg !483
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %11}, i64 0, metadata !484) #3, !dbg !485
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %41}, i64 0, metadata !486) #3, !dbg !485
  store %struct.packet* null, %struct.packet** %24, align 8, !dbg !487, !tbaa !180
  br label %42, !dbg !488

; <label>:42                                      ; preds = %42, %40
  %.0.i.i = phi %struct.packet* [ %41, %40 ], [ %44, %42 ]
  %43 = getelementptr inbounds %struct.packet* %.0.i.i, i64 0, i32 0, !dbg !488
  %44 = load %struct.packet** %43, align 8, !dbg !488, !tbaa !180
  %45 = icmp eq %struct.packet* %44, null, !dbg !488
  br i1 %45, label %append.exit.i, label %42, !dbg !488

append.exit.i:                                    ; preds = %42
  store %struct.packet* %11, %struct.packet** %43, align 8, !dbg !489, !tbaa !180
  %.pre.i = load %struct.task** @tcb, align 8, !dbg !490, !tbaa !148
  br label %46

; <label>:46                                      ; preds = %append.exit.i, %30
  %47 = phi %struct.task* [ %36, %30 ], [ %.pre.i, %append.exit.i ]
  br label %qpkt.exit, !dbg !490

; <label>:48                                      ; preds = %0
  %49 = ptrtoint %struct.packet* %pkt to i64, !dbg !491
  store i64 %49, i64* @v1, align 8, !dbg !491, !tbaa !208
  %50 = load i32* @tracing, align 4, !dbg !493, !tbaa !192
  %51 = icmp eq i32 %50, 1, !dbg !493
  br i1 %51, label %52, label %60, !dbg !493

; <label>:52                                      ; preds = %48
  %53 = getelementptr inbounds %struct.packet* %pkt, i64 0, i32 3, !dbg !493
  %54 = load i32* %53, align 4, !dbg !493, !tbaa !187
  %55 = load i32* @layout, align 4, !dbg !495, !tbaa !192
  %56 = add nsw i32 %55, -1, !dbg !495
  store i32 %56, i32* @layout, align 4, !dbg !495, !tbaa !192
  %57 = icmp slt i32 %55, 2, !dbg !495
  br i1 %57, label %58, label %trace.exit, !dbg !495

; <label>:58                                      ; preds = %52
  %putchar1.i = tail call i32 @putchar(i32 10) #3, !dbg !496
  store i32 50, i32* @layout, align 4, !dbg !497, !tbaa !192
  br label %trace.exit, !dbg !498

trace.exit:                                       ; preds = %52, %58
  %sext = shl i32 %54, 24, !dbg !499
  %59 = ashr exact i32 %sext, 24, !dbg !499
  %putchar.i = tail call i32 @putchar(i32 %59) #3, !dbg !499
  br label %60, !dbg !493

; <label>:60                                      ; preds = %trace.exit, %48
  %61 = load i32* @holdcount, align 4, !dbg !500, !tbaa !192
  %62 = add nsw i32 %61, 1, !dbg !500
  store i32 %62, i32* @holdcount, align 4, !dbg !500, !tbaa !192
  %63 = load %struct.task** @tcb, align 8, !dbg !502, !tbaa !148
  %64 = getelementptr inbounds %struct.task* %63, i64 0, i32 4, !dbg !502
  %65 = load i32* %64, align 4, !dbg !502, !tbaa !164
  %66 = or i32 %65, 4, !dbg !502
  store i32 %66, i32* %64, align 4, !dbg !502, !tbaa !164
  %67 = getelementptr inbounds %struct.task* %63, i64 0, i32 0, !dbg !503
  %68 = load %struct.task** %67, align 8, !dbg !503, !tbaa !153
  br label %qpkt.exit, !dbg !501

qpkt.exit:                                        ; preds = %46, %30, %findtcb.exit.thread.i, %60, %5
  %.0 = phi %struct.task* [ %6, %5 ], [ %68, %60 ], [ %47, %46 ], [ %18, %30 ], [ null, %findtcb.exit.thread.i ]
  ret %struct.task* %.0, !dbg !504
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  tail call void @llvm.dbg.value(metadata !200, i64 0, metadata !116), !dbg !505
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([20 x i8]* @str, i64 0, i64 0)), !dbg !506
  tail call void @llvm.dbg.value(metadata !507, i64 0, metadata !508) #3, !dbg !510
  tail call void @llvm.dbg.value(metadata !175, i64 0, metadata !511) #3, !dbg !512
  tail call void @llvm.dbg.value(metadata !200, i64 0, metadata !513) #3, !dbg !514
  tail call void @llvm.dbg.value(metadata !175, i64 0, metadata !515) #3, !dbg !516
  tail call void @llvm.dbg.value(metadata !517, i64 0, metadata !518) #3, !dbg !519
  tail call void @llvm.dbg.value(metadata !520, i64 0, metadata !521) #3, !dbg !522
  tail call void @llvm.dbg.value(metadata !523, i64 0, metadata !524) #3, !dbg !525
  %1 = tail call noalias i8* @malloc(i64 56) #3, !dbg !526
  %2 = bitcast i8* %1 to %struct.task*, !dbg !526
  tail call void @llvm.dbg.value(metadata !{%struct.task* %2}, i64 0, metadata !527) #3, !dbg !526
  store %struct.task* %2, %struct.task** getelementptr inbounds ([11 x %struct.task*]* @tasktab, i64 0, i64 1), align 8, !dbg !528, !tbaa !148
  %3 = load %struct.task** @tasklist, align 8, !dbg !529, !tbaa !148
  %4 = bitcast i8* %1 to %struct.task**, !dbg !529
  store %struct.task* %3, %struct.task** %4, align 8, !dbg !529, !tbaa !153
  %5 = getelementptr inbounds i8* %1, i64 8, !dbg !530
  %6 = bitcast i8* %5 to i32*, !dbg !530
  store i32 1, i32* %6, align 4, !dbg !530, !tbaa !158
  %7 = getelementptr inbounds i8* %1, i64 12, !dbg !531
  %8 = getelementptr inbounds i8* %1, i64 32, !dbg !532
  %9 = bitcast i8* %8 to %struct.task* (%struct.packet*)**, !dbg !532
  call void @llvm.memset.p0i8.i64(i8* %7, i8 0, i64 16, i32 4, i1 false), !dbg !533
  store %struct.task* (%struct.packet*)* @idlefn, %struct.task* (%struct.packet*)** %9, align 8, !dbg !532, !tbaa !166
  %10 = getelementptr inbounds i8* %1, i64 40, !dbg !534
  %11 = bitcast i8* %10 to i64*, !dbg !534
  store i64 1, i64* %11, align 8, !dbg !534, !tbaa !168
  %12 = getelementptr inbounds i8* %1, i64 48, !dbg !535
  %13 = bitcast i8* %12 to i64*, !dbg !535
  store i64 10000000, i64* %13, align 8, !dbg !535, !tbaa !170
  tail call void @llvm.dbg.value(metadata !200, i64 0, metadata !536) #3, !dbg !538
  tail call void @llvm.dbg.value(metadata !175, i64 0, metadata !539) #3, !dbg !538
  tail call void @llvm.dbg.value(metadata !540, i64 0, metadata !541) #3, !dbg !538
  %14 = tail call noalias i8* @malloc(i64 24) #3, !dbg !542
  tail call void @llvm.dbg.value(metadata !175, i64 0, metadata !543) #3, !dbg !544
  %scevgep.i = getelementptr i8* %14, i64 20
  %15 = bitcast i8* %scevgep.i to i32*, !dbg !545
  store i32 0, i32* %15, align 1, !dbg !545
  %16 = bitcast i8* %14 to %struct.packet*, !dbg !542
  %17 = bitcast i8* %14 to %struct.packet**, !dbg !546
  store %struct.packet* null, %struct.packet** %17, align 8, !dbg !546, !tbaa !180
  %18 = getelementptr inbounds i8* %14, i64 8, !dbg !547
  %19 = bitcast i8* %18 to i32*, !dbg !547
  store i32 0, i32* %19, align 4, !dbg !547, !tbaa !183
  %20 = getelementptr inbounds i8* %14, i64 12, !dbg !548
  %21 = bitcast i8* %20 to i32*, !dbg !548
  store i32 1001, i32* %21, align 4, !dbg !548, !tbaa !185
  %22 = getelementptr inbounds i8* %14, i64 16, !dbg !549
  %23 = bitcast i8* %22 to i32*, !dbg !549
  store i32 0, i32* %23, align 4, !dbg !549, !tbaa !187
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %16}, i64 0, metadata !116), !dbg !537
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %16}, i64 0, metadata !550) #3, !dbg !552
  tail call void @llvm.dbg.value(metadata !175, i64 0, metadata !553) #3, !dbg !552
  tail call void @llvm.dbg.value(metadata !540, i64 0, metadata !554) #3, !dbg !552
  %24 = tail call noalias i8* @malloc(i64 24) #3, !dbg !555
  tail call void @llvm.dbg.value(metadata !175, i64 0, metadata !556) #3, !dbg !557
  %scevgep.i5 = getelementptr i8* %24, i64 20
  %25 = bitcast i8* %scevgep.i5 to i32*, !dbg !558
  store i32 0, i32* %25, align 1, !dbg !558
  %26 = bitcast i8* %24 to %struct.packet*, !dbg !555
  %27 = bitcast i8* %24 to %struct.packet**, !dbg !559
  store %struct.packet* %16, %struct.packet** %27, align 8, !dbg !559, !tbaa !180
  %28 = getelementptr inbounds i8* %24, i64 8, !dbg !560
  %29 = bitcast i8* %28 to i32*, !dbg !560
  store i32 0, i32* %29, align 4, !dbg !560, !tbaa !183
  %30 = getelementptr inbounds i8* %24, i64 12, !dbg !561
  %31 = bitcast i8* %30 to i32*, !dbg !561
  store i32 1001, i32* %31, align 4, !dbg !561, !tbaa !185
  %32 = getelementptr inbounds i8* %24, i64 16, !dbg !562
  %33 = bitcast i8* %32 to i32*, !dbg !562
  store i32 0, i32* %33, align 4, !dbg !562, !tbaa !187
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %26}, i64 0, metadata !116), !dbg !551
  tail call void @llvm.dbg.value(metadata !563, i64 0, metadata !564) #3, !dbg !566
  tail call void @llvm.dbg.value(metadata !567, i64 0, metadata !568) #3, !dbg !569
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %26}, i64 0, metadata !570) #3, !dbg !571
  tail call void @llvm.dbg.value(metadata !572, i64 0, metadata !573) #3, !dbg !574
  tail call void @llvm.dbg.value(metadata !575, i64 0, metadata !576) #3, !dbg !577
  tail call void @llvm.dbg.value(metadata !578, i64 0, metadata !579) #3, !dbg !580
  tail call void @llvm.dbg.value(metadata !581, i64 0, metadata !582) #3, !dbg !583
  %34 = tail call noalias i8* @malloc(i64 56) #3, !dbg !584
  %35 = bitcast i8* %34 to %struct.task*, !dbg !584
  tail call void @llvm.dbg.value(metadata !{%struct.task* %35}, i64 0, metadata !585) #3, !dbg !584
  store %struct.task* %35, %struct.task** getelementptr inbounds ([11 x %struct.task*]* @tasktab, i64 0, i64 2), align 16, !dbg !586, !tbaa !148
  %36 = bitcast i8* %34 to %struct.task**, !dbg !587
  store %struct.task* %2, %struct.task** %36, align 8, !dbg !587, !tbaa !153
  %37 = getelementptr inbounds i8* %34, i64 8, !dbg !588
  %38 = bitcast i8* %37 to i32*, !dbg !588
  store i32 2, i32* %38, align 4, !dbg !588, !tbaa !158
  %39 = getelementptr inbounds i8* %34, i64 12, !dbg !589
  %40 = bitcast i8* %39 to i32*, !dbg !589
  store i32 1000, i32* %40, align 4, !dbg !589, !tbaa !160
  %41 = getelementptr inbounds i8* %34, i64 16, !dbg !590
  %42 = bitcast i8* %41 to %struct.packet**, !dbg !590
  store %struct.packet* %26, %struct.packet** %42, align 8, !dbg !590, !tbaa !162
  %43 = getelementptr inbounds i8* %34, i64 24, !dbg !591
  %44 = bitcast i8* %43 to i32*, !dbg !591
  store i32 3, i32* %44, align 4, !dbg !591, !tbaa !164
  %45 = getelementptr inbounds i8* %34, i64 32, !dbg !592
  %46 = bitcast i8* %45 to %struct.task* (%struct.packet*)**, !dbg !592
  store %struct.task* (%struct.packet*)* @workfn, %struct.task* (%struct.packet*)** %46, align 8, !dbg !592, !tbaa !166
  %47 = getelementptr inbounds i8* %34, i64 40, !dbg !593
  %48 = bitcast i8* %47 to i64*, !dbg !593
  store i64 3, i64* %48, align 8, !dbg !593, !tbaa !168
  %49 = getelementptr inbounds i8* %34, i64 48, !dbg !594
  %50 = bitcast i8* %49 to i64*, !dbg !594
  store i64 0, i64* %50, align 8, !dbg !594, !tbaa !170
  tail call void @llvm.dbg.value(metadata !200, i64 0, metadata !595) #3, !dbg !597
  tail call void @llvm.dbg.value(metadata !302, i64 0, metadata !598) #3, !dbg !597
  tail call void @llvm.dbg.value(metadata !567, i64 0, metadata !599) #3, !dbg !597
  %51 = tail call noalias i8* @malloc(i64 24) #3, !dbg !600
  tail call void @llvm.dbg.value(metadata !175, i64 0, metadata !601) #3, !dbg !602
  %scevgep.i6 = getelementptr i8* %51, i64 20
  %52 = bitcast i8* %scevgep.i6 to i32*, !dbg !603
  store i32 0, i32* %52, align 1, !dbg !603
  %53 = bitcast i8* %51 to %struct.packet*, !dbg !600
  %54 = bitcast i8* %51 to %struct.packet**, !dbg !604
  store %struct.packet* null, %struct.packet** %54, align 8, !dbg !604, !tbaa !180
  %55 = getelementptr inbounds i8* %51, i64 8, !dbg !605
  %56 = bitcast i8* %55 to i32*, !dbg !605
  store i32 5, i32* %56, align 4, !dbg !605, !tbaa !183
  %57 = getelementptr inbounds i8* %51, i64 12, !dbg !606
  %58 = bitcast i8* %57 to i32*, !dbg !606
  store i32 1000, i32* %58, align 4, !dbg !606, !tbaa !185
  %59 = getelementptr inbounds i8* %51, i64 16, !dbg !607
  %60 = bitcast i8* %59 to i32*, !dbg !607
  store i32 0, i32* %60, align 4, !dbg !607, !tbaa !187
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %53}, i64 0, metadata !116), !dbg !596
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %53}, i64 0, metadata !608) #3, !dbg !610
  tail call void @llvm.dbg.value(metadata !302, i64 0, metadata !611) #3, !dbg !610
  tail call void @llvm.dbg.value(metadata !567, i64 0, metadata !612) #3, !dbg !610
  %61 = tail call noalias i8* @malloc(i64 24) #3, !dbg !613
  tail call void @llvm.dbg.value(metadata !175, i64 0, metadata !614) #3, !dbg !615
  %scevgep.i7 = getelementptr i8* %61, i64 20
  %62 = bitcast i8* %scevgep.i7 to i32*, !dbg !616
  store i32 0, i32* %62, align 1, !dbg !616
  %63 = bitcast i8* %61 to %struct.packet*, !dbg !613
  %64 = bitcast i8* %61 to %struct.packet**, !dbg !617
  store %struct.packet* %53, %struct.packet** %64, align 8, !dbg !617, !tbaa !180
  %65 = getelementptr inbounds i8* %61, i64 8, !dbg !618
  %66 = bitcast i8* %65 to i32*, !dbg !618
  store i32 5, i32* %66, align 4, !dbg !618, !tbaa !183
  %67 = getelementptr inbounds i8* %61, i64 12, !dbg !619
  %68 = bitcast i8* %67 to i32*, !dbg !619
  store i32 1000, i32* %68, align 4, !dbg !619, !tbaa !185
  %69 = getelementptr inbounds i8* %61, i64 16, !dbg !620
  %70 = bitcast i8* %69 to i32*, !dbg !620
  store i32 0, i32* %70, align 4, !dbg !620, !tbaa !187
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %63}, i64 0, metadata !116), !dbg !609
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %63}, i64 0, metadata !621) #3, !dbg !623
  tail call void @llvm.dbg.value(metadata !302, i64 0, metadata !624) #3, !dbg !623
  tail call void @llvm.dbg.value(metadata !567, i64 0, metadata !625) #3, !dbg !623
  %71 = tail call noalias i8* @malloc(i64 24) #3, !dbg !626
  tail call void @llvm.dbg.value(metadata !175, i64 0, metadata !627) #3, !dbg !628
  %scevgep.i8 = getelementptr i8* %71, i64 20
  %72 = bitcast i8* %scevgep.i8 to i32*, !dbg !629
  store i32 0, i32* %72, align 1, !dbg !629
  %73 = bitcast i8* %71 to %struct.packet*, !dbg !626
  %74 = bitcast i8* %71 to %struct.packet**, !dbg !630
  store %struct.packet* %63, %struct.packet** %74, align 8, !dbg !630, !tbaa !180
  %75 = getelementptr inbounds i8* %71, i64 8, !dbg !631
  %76 = bitcast i8* %75 to i32*, !dbg !631
  store i32 5, i32* %76, align 4, !dbg !631, !tbaa !183
  %77 = getelementptr inbounds i8* %71, i64 12, !dbg !632
  %78 = bitcast i8* %77 to i32*, !dbg !632
  store i32 1000, i32* %78, align 4, !dbg !632, !tbaa !185
  %79 = getelementptr inbounds i8* %71, i64 16, !dbg !633
  %80 = bitcast i8* %79 to i32*, !dbg !633
  store i32 0, i32* %80, align 4, !dbg !633, !tbaa !187
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %73}, i64 0, metadata !116), !dbg !622
  tail call void @llvm.dbg.value(metadata !572, i64 0, metadata !634) #3, !dbg !636
  tail call void @llvm.dbg.value(metadata !637, i64 0, metadata !638) #3, !dbg !639
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %73}, i64 0, metadata !640) #3, !dbg !641
  tail call void @llvm.dbg.value(metadata !572, i64 0, metadata !642) #3, !dbg !643
  tail call void @llvm.dbg.value(metadata !644, i64 0, metadata !645) #3, !dbg !646
  tail call void @llvm.dbg.value(metadata !581, i64 0, metadata !647) #3, !dbg !648
  tail call void @llvm.dbg.value(metadata !581, i64 0, metadata !649) #3, !dbg !650
  %81 = tail call noalias i8* @malloc(i64 56) #3, !dbg !651
  %82 = bitcast i8* %81 to %struct.task*, !dbg !651
  tail call void @llvm.dbg.value(metadata !{%struct.task* %82}, i64 0, metadata !652) #3, !dbg !651
  store %struct.task* %82, %struct.task** getelementptr inbounds ([11 x %struct.task*]* @tasktab, i64 0, i64 3), align 8, !dbg !653, !tbaa !148
  %83 = bitcast i8* %81 to %struct.task**, !dbg !654
  store %struct.task* %35, %struct.task** %83, align 8, !dbg !654, !tbaa !153
  %84 = getelementptr inbounds i8* %81, i64 8, !dbg !655
  %85 = bitcast i8* %84 to i32*, !dbg !655
  store i32 3, i32* %85, align 4, !dbg !655, !tbaa !158
  %86 = getelementptr inbounds i8* %81, i64 12, !dbg !656
  %87 = bitcast i8* %86 to i32*, !dbg !656
  store i32 2000, i32* %87, align 4, !dbg !656, !tbaa !160
  %88 = getelementptr inbounds i8* %81, i64 16, !dbg !657
  %89 = bitcast i8* %88 to %struct.packet**, !dbg !657
  store %struct.packet* %73, %struct.packet** %89, align 8, !dbg !657, !tbaa !162
  %90 = getelementptr inbounds i8* %81, i64 24, !dbg !658
  %91 = bitcast i8* %90 to i32*, !dbg !658
  store i32 3, i32* %91, align 4, !dbg !658, !tbaa !164
  %92 = getelementptr inbounds i8* %81, i64 32, !dbg !659
  %93 = bitcast i8* %92 to %struct.task* (%struct.packet*)**, !dbg !659
  store %struct.task* (%struct.packet*)* @handlerfn, %struct.task* (%struct.packet*)** %93, align 8, !dbg !659, !tbaa !166
  %94 = getelementptr inbounds i8* %81, i64 40, !dbg !660
  call void @llvm.memset.p0i8.i64(i8* %94, i8 0, i64 16, i32 8, i1 false), !dbg !661
  tail call void @llvm.dbg.value(metadata !200, i64 0, metadata !662) #3, !dbg !664
  tail call void @llvm.dbg.value(metadata !319, i64 0, metadata !665) #3, !dbg !664
  tail call void @llvm.dbg.value(metadata !567, i64 0, metadata !666) #3, !dbg !664
  %95 = tail call noalias i8* @malloc(i64 24) #3, !dbg !667
  tail call void @llvm.dbg.value(metadata !175, i64 0, metadata !668) #3, !dbg !669
  %scevgep.i9 = getelementptr i8* %95, i64 20
  %96 = bitcast i8* %scevgep.i9 to i32*, !dbg !670
  store i32 0, i32* %96, align 1, !dbg !670
  %97 = bitcast i8* %95 to %struct.packet*, !dbg !667
  %98 = bitcast i8* %95 to %struct.packet**, !dbg !671
  store %struct.packet* null, %struct.packet** %98, align 8, !dbg !671, !tbaa !180
  %99 = getelementptr inbounds i8* %95, i64 8, !dbg !672
  %100 = bitcast i8* %99 to i32*, !dbg !672
  store i32 6, i32* %100, align 4, !dbg !672, !tbaa !183
  %101 = getelementptr inbounds i8* %95, i64 12, !dbg !673
  %102 = bitcast i8* %101 to i32*, !dbg !673
  store i32 1000, i32* %102, align 4, !dbg !673, !tbaa !185
  %103 = getelementptr inbounds i8* %95, i64 16, !dbg !674
  %104 = bitcast i8* %103 to i32*, !dbg !674
  store i32 0, i32* %104, align 4, !dbg !674, !tbaa !187
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %97}, i64 0, metadata !116), !dbg !663
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %97}, i64 0, metadata !675) #3, !dbg !677
  tail call void @llvm.dbg.value(metadata !319, i64 0, metadata !678) #3, !dbg !677
  tail call void @llvm.dbg.value(metadata !567, i64 0, metadata !679) #3, !dbg !677
  %105 = tail call noalias i8* @malloc(i64 24) #3, !dbg !680
  tail call void @llvm.dbg.value(metadata !175, i64 0, metadata !681) #3, !dbg !682
  %scevgep.i10 = getelementptr i8* %105, i64 20
  %106 = bitcast i8* %scevgep.i10 to i32*, !dbg !683
  store i32 0, i32* %106, align 1, !dbg !683
  %107 = bitcast i8* %105 to %struct.packet*, !dbg !680
  %108 = bitcast i8* %105 to %struct.packet**, !dbg !684
  store %struct.packet* %97, %struct.packet** %108, align 8, !dbg !684, !tbaa !180
  %109 = getelementptr inbounds i8* %105, i64 8, !dbg !685
  %110 = bitcast i8* %109 to i32*, !dbg !685
  store i32 6, i32* %110, align 4, !dbg !685, !tbaa !183
  %111 = getelementptr inbounds i8* %105, i64 12, !dbg !686
  %112 = bitcast i8* %111 to i32*, !dbg !686
  store i32 1000, i32* %112, align 4, !dbg !686, !tbaa !185
  %113 = getelementptr inbounds i8* %105, i64 16, !dbg !687
  %114 = bitcast i8* %113 to i32*, !dbg !687
  store i32 0, i32* %114, align 4, !dbg !687, !tbaa !187
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %107}, i64 0, metadata !116), !dbg !676
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %107}, i64 0, metadata !688) #3, !dbg !690
  tail call void @llvm.dbg.value(metadata !319, i64 0, metadata !691) #3, !dbg !690
  tail call void @llvm.dbg.value(metadata !567, i64 0, metadata !692) #3, !dbg !690
  %115 = tail call noalias i8* @malloc(i64 24) #3, !dbg !693
  tail call void @llvm.dbg.value(metadata !175, i64 0, metadata !694) #3, !dbg !695
  %scevgep.i11 = getelementptr i8* %115, i64 20
  %116 = bitcast i8* %scevgep.i11 to i32*, !dbg !696
  store i32 0, i32* %116, align 1, !dbg !696
  %117 = bitcast i8* %115 to %struct.packet*, !dbg !693
  %118 = bitcast i8* %115 to %struct.packet**, !dbg !697
  store %struct.packet* %107, %struct.packet** %118, align 8, !dbg !697, !tbaa !180
  %119 = getelementptr inbounds i8* %115, i64 8, !dbg !698
  %120 = bitcast i8* %119 to i32*, !dbg !698
  store i32 6, i32* %120, align 4, !dbg !698, !tbaa !183
  %121 = getelementptr inbounds i8* %115, i64 12, !dbg !699
  %122 = bitcast i8* %121 to i32*, !dbg !699
  store i32 1000, i32* %122, align 4, !dbg !699, !tbaa !185
  %123 = getelementptr inbounds i8* %115, i64 16, !dbg !700
  %124 = bitcast i8* %123 to i32*, !dbg !700
  store i32 0, i32* %124, align 4, !dbg !700, !tbaa !187
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %117}, i64 0, metadata !116), !dbg !689
  tail call void @llvm.dbg.value(metadata !701, i64 0, metadata !702) #3, !dbg !704
  tail call void @llvm.dbg.value(metadata !705, i64 0, metadata !706) #3, !dbg !707
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %117}, i64 0, metadata !708) #3, !dbg !709
  tail call void @llvm.dbg.value(metadata !572, i64 0, metadata !710) #3, !dbg !711
  tail call void @llvm.dbg.value(metadata !644, i64 0, metadata !712) #3, !dbg !713
  tail call void @llvm.dbg.value(metadata !581, i64 0, metadata !714) #3, !dbg !715
  tail call void @llvm.dbg.value(metadata !581, i64 0, metadata !716) #3, !dbg !717
  %125 = tail call noalias i8* @malloc(i64 56) #3, !dbg !718
  %126 = bitcast i8* %125 to %struct.task*, !dbg !718
  tail call void @llvm.dbg.value(metadata !{%struct.task* %126}, i64 0, metadata !719) #3, !dbg !718
  store %struct.task* %126, %struct.task** getelementptr inbounds ([11 x %struct.task*]* @tasktab, i64 0, i64 4), align 16, !dbg !720, !tbaa !148
  %127 = bitcast i8* %125 to %struct.task**, !dbg !721
  store %struct.task* %82, %struct.task** %127, align 8, !dbg !721, !tbaa !153
  %128 = getelementptr inbounds i8* %125, i64 8, !dbg !722
  %129 = bitcast i8* %128 to i32*, !dbg !722
  store i32 4, i32* %129, align 4, !dbg !722, !tbaa !158
  %130 = getelementptr inbounds i8* %125, i64 12, !dbg !723
  %131 = bitcast i8* %130 to i32*, !dbg !723
  store i32 3000, i32* %131, align 4, !dbg !723, !tbaa !160
  %132 = getelementptr inbounds i8* %125, i64 16, !dbg !724
  %133 = bitcast i8* %132 to %struct.packet**, !dbg !724
  store %struct.packet* %117, %struct.packet** %133, align 8, !dbg !724, !tbaa !162
  %134 = getelementptr inbounds i8* %125, i64 24, !dbg !725
  %135 = bitcast i8* %134 to i32*, !dbg !725
  store i32 3, i32* %135, align 4, !dbg !725, !tbaa !164
  %136 = getelementptr inbounds i8* %125, i64 32, !dbg !726
  %137 = bitcast i8* %136 to %struct.task* (%struct.packet*)**, !dbg !726
  store %struct.task* (%struct.packet*)* @handlerfn, %struct.task* (%struct.packet*)** %137, align 8, !dbg !726, !tbaa !166
  %138 = getelementptr inbounds i8* %125, i64 40, !dbg !727
  call void @llvm.memset.p0i8.i64(i8* %138, i8 0, i64 16, i32 8, i1 false), !dbg !728
  tail call void @llvm.dbg.value(metadata !200, i64 0, metadata !116), !dbg !729
  tail call void @llvm.dbg.value(metadata !302, i64 0, metadata !730) #3, !dbg !732
  tail call void @llvm.dbg.value(metadata !733, i64 0, metadata !734) #3, !dbg !735
  tail call void @llvm.dbg.value(metadata !200, i64 0, metadata !736) #3, !dbg !737
  tail call void @llvm.dbg.value(metadata !563, i64 0, metadata !738) #3, !dbg !739
  tail call void @llvm.dbg.value(metadata !740, i64 0, metadata !741) #3, !dbg !742
  tail call void @llvm.dbg.value(metadata !581, i64 0, metadata !743) #3, !dbg !744
  tail call void @llvm.dbg.value(metadata !581, i64 0, metadata !745) #3, !dbg !746
  %139 = tail call noalias i8* @malloc(i64 56) #3, !dbg !747
  %140 = bitcast i8* %139 to %struct.task*, !dbg !747
  tail call void @llvm.dbg.value(metadata !{%struct.task* %140}, i64 0, metadata !748) #3, !dbg !747
  store %struct.task* %140, %struct.task** getelementptr inbounds ([11 x %struct.task*]* @tasktab, i64 0, i64 5), align 8, !dbg !749, !tbaa !148
  %141 = bitcast i8* %139 to %struct.task**, !dbg !750
  store %struct.task* %126, %struct.task** %141, align 8, !dbg !750, !tbaa !153
  %142 = getelementptr inbounds i8* %139, i64 8, !dbg !751
  %143 = bitcast i8* %142 to i32*, !dbg !751
  store i32 5, i32* %143, align 4, !dbg !751, !tbaa !158
  %144 = getelementptr inbounds i8* %139, i64 12, !dbg !752
  %145 = bitcast i8* %144 to i32*, !dbg !752
  store i32 4000, i32* %145, align 4, !dbg !752, !tbaa !160
  %146 = getelementptr inbounds i8* %139, i64 16, !dbg !753
  %147 = bitcast i8* %146 to %struct.packet**, !dbg !753
  store %struct.packet* null, %struct.packet** %147, align 8, !dbg !753, !tbaa !162
  %148 = getelementptr inbounds i8* %139, i64 24, !dbg !754
  %149 = bitcast i8* %148 to i32*, !dbg !754
  store i32 2, i32* %149, align 4, !dbg !754, !tbaa !164
  %150 = getelementptr inbounds i8* %139, i64 32, !dbg !755
  %151 = bitcast i8* %150 to %struct.task* (%struct.packet*)**, !dbg !755
  store %struct.task* (%struct.packet*)* @devfn, %struct.task* (%struct.packet*)** %151, align 8, !dbg !755, !tbaa !166
  %152 = getelementptr inbounds i8* %139, i64 40, !dbg !756
  call void @llvm.memset.p0i8.i64(i8* %152, i8 0, i64 16, i32 8, i1 false), !dbg !757
  tail call void @llvm.dbg.value(metadata !319, i64 0, metadata !758) #3, !dbg !760
  tail call void @llvm.dbg.value(metadata !761, i64 0, metadata !762) #3, !dbg !763
  tail call void @llvm.dbg.value(metadata !200, i64 0, metadata !764) #3, !dbg !765
  tail call void @llvm.dbg.value(metadata !563, i64 0, metadata !766) #3, !dbg !767
  tail call void @llvm.dbg.value(metadata !740, i64 0, metadata !768) #3, !dbg !769
  tail call void @llvm.dbg.value(metadata !581, i64 0, metadata !770) #3, !dbg !771
  tail call void @llvm.dbg.value(metadata !581, i64 0, metadata !772) #3, !dbg !773
  %153 = tail call noalias i8* @malloc(i64 56) #3, !dbg !774
  %154 = bitcast i8* %153 to %struct.task*, !dbg !774
  tail call void @llvm.dbg.value(metadata !{%struct.task* %154}, i64 0, metadata !775) #3, !dbg !774
  store %struct.task* %154, %struct.task** getelementptr inbounds ([11 x %struct.task*]* @tasktab, i64 0, i64 6), align 16, !dbg !776, !tbaa !148
  %155 = bitcast i8* %153 to %struct.task**, !dbg !777
  store %struct.task* %140, %struct.task** %155, align 8, !dbg !777, !tbaa !153
  %156 = getelementptr inbounds i8* %153, i64 8, !dbg !778
  %157 = bitcast i8* %156 to i32*, !dbg !778
  store i32 6, i32* %157, align 4, !dbg !778, !tbaa !158
  %158 = getelementptr inbounds i8* %153, i64 12, !dbg !779
  %159 = bitcast i8* %158 to i32*, !dbg !779
  store i32 5000, i32* %159, align 4, !dbg !779, !tbaa !160
  %160 = getelementptr inbounds i8* %153, i64 16, !dbg !780
  %161 = bitcast i8* %160 to %struct.packet**, !dbg !780
  store %struct.packet* null, %struct.packet** %161, align 8, !dbg !780, !tbaa !162
  %162 = getelementptr inbounds i8* %153, i64 24, !dbg !781
  %163 = bitcast i8* %162 to i32*, !dbg !781
  store i32 2, i32* %163, align 4, !dbg !781, !tbaa !164
  %164 = getelementptr inbounds i8* %153, i64 32, !dbg !782
  %165 = bitcast i8* %164 to %struct.task* (%struct.packet*)**, !dbg !782
  store %struct.task* (%struct.packet*)* @devfn, %struct.task* (%struct.packet*)** %165, align 8, !dbg !782, !tbaa !166
  %166 = getelementptr inbounds i8* %153, i64 40, !dbg !783
  call void @llvm.memset.p0i8.i64(i8* %166, i8 0, i64 16, i32 8, i1 false), !dbg !784
  store %struct.task* %154, %struct.task** @tasklist, align 8, !dbg !785, !tbaa !148
  store %struct.task* %154, %struct.task** @tcb, align 8, !dbg !786, !tbaa !148
  store i32 0, i32* @holdcount, align 4, !dbg !787, !tbaa !192
  store i32 0, i32* @qpktcount, align 4, !dbg !787, !tbaa !192
  %puts2 = tail call i32 @puts(i8* getelementptr inbounds ([9 x i8]* @str11, i64 0, i64 0)), !dbg !788
  store i32 0, i32* @tracing, align 4, !dbg !789, !tbaa !192
  store i32 0, i32* @layout, align 4, !dbg !790, !tbaa !192
  tail call void @schedule(), !dbg !791
  %puts3 = tail call i32 @puts(i8* getelementptr inbounds ([9 x i8]* @str12, i64 0, i64 0)), !dbg !792
  %167 = load i32* @qpktcount, align 4, !dbg !793, !tbaa !192
  %168 = load i32* @holdcount, align 4, !dbg !793, !tbaa !192
  %169 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str6, i64 0, i64 0), i32 %167, i32 %168) #3, !dbg !793
  %170 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str7, i64 0, i64 0)) #3, !dbg !794
  %171 = load i32* @qpktcount, align 4, !dbg !795, !tbaa !192
  %172 = icmp eq i32 %171, 23263894, !dbg !795
  %173 = load i32* @holdcount, align 4
  %174 = icmp eq i32 %173, 9305557, !dbg !795
  %or.cond = and i1 %172, %174, !dbg !795
  br i1 %or.cond, label %175, label %177, !dbg !795

; <label>:175                                     ; preds = %0
  %176 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str8, i64 0, i64 0)) #3, !dbg !797
  tail call void @llvm.dbg.value(metadata !175, i64 0, metadata !117), !dbg !799
  br label %179, !dbg !800

; <label>:177                                     ; preds = %0
  %178 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str9, i64 0, i64 0)) #3, !dbg !801
  tail call void @llvm.dbg.value(metadata !507, i64 0, metadata !117), !dbg !803
  br label %179

; <label>:179                                     ; preds = %177, %175
  %retval.0 = phi i32 [ 0, %175 ], [ 1, %177 ]
  %puts4 = tail call i32 @puts(i8* getelementptr inbounds ([12 x i8]* @str13, i64 0, i64 0)), !dbg !804
  ret i32 %retval.0, !dbg !805
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #2

; Function Attrs: nounwind
declare i32 @putchar(i32) #3

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #3

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!136, !137}
!llvm.ident = !{!138}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !118, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c] [DW_LANG_C99]
!1 = metadata !{metadata !"richards_benchmark.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !45, metadata !54, metadata !59, metadata !66, metadata !69, metadata !70, metadata !76, metadata !80, metadata !84, metadata !87, metadata !93, metadata !103, metadata !106, metadata !112}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"createtask", metadata !"createtask", metadata !"", i32 100, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32, i32, %struct.packet*, i32, %struct.task* (%struct.packet*)*, i64, i64)* @createtask, null, null, metadata !36, i32 107} ; [ DW_TAG_subprogram ] [line 100] [def] [scope 107] [createtask]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{null, metadata !8, metadata !8, metadata !9, metadata !8, metadata !21, metadata !34, metadata !34}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from packet]
!10 = metadata !{i32 786451, metadata !1, null, metadata !"packet", i32 65, i64 192, i64 64, i32 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [packet] [line 65, size 192, align 64, offset 0] [def] [from ]
!11 = metadata !{metadata !12, metadata !13, metadata !14, metadata !15, metadata !16}
!12 = metadata !{i32 786445, metadata !1, metadata !10, metadata !"p_link", i32 67, i64 64, i64 64, i64 0, i32 0, metadata !9} ; [ DW_TAG_member ] [p_link] [line 67, size 64, align 64, offset 0] [from ]
!13 = metadata !{i32 786445, metadata !1, metadata !10, metadata !"p_id", i32 68, i64 32, i64 32, i64 64, i32 0, metadata !8} ; [ DW_TAG_member ] [p_id] [line 68, size 32, align 32, offset 64] [from int]
!14 = metadata !{i32 786445, metadata !1, metadata !10, metadata !"p_kind", i32 69, i64 32, i64 32, i64 96, i32 0, metadata !8} ; [ DW_TAG_member ] [p_kind] [line 69, size 32, align 32, offset 96] [from int]
!15 = metadata !{i32 786445, metadata !1, metadata !10, metadata !"p_a1", i32 70, i64 32, i64 32, i64 128, i32 0, metadata !8} ; [ DW_TAG_member ] [p_a1] [line 70, size 32, align 32, offset 128] [from int]
!16 = metadata !{i32 786445, metadata !1, metadata !10, metadata !"p_a2", i32 71, i64 32, i64 8, i64 160, i32 0, metadata !17} ; [ DW_TAG_member ] [p_a2] [line 71, size 32, align 8, offset 160] [from ]
!17 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 32, i64 8, i32 0, i32 0, metadata !18, metadata !19, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 32, align 8, offset 0] [from char]
!18 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!19 = metadata !{metadata !20}
!20 = metadata !{i32 786465, i64 0, i64 4}        ; [ DW_TAG_subrange_type ] [0, 3]
!21 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !22} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!22 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !23, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!23 = metadata !{metadata !24, metadata !9}
!24 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !25} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from task]
!25 = metadata !{i32 786451, metadata !1, null, metadata !"task", i32 74, i64 448, i64 64, i32 0, i32 0, null, metadata !26, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [task] [line 74, size 448, align 64, offset 0] [def] [from ]
!26 = metadata !{metadata !27, metadata !28, metadata !29, metadata !30, metadata !31, metadata !32, metadata !33, metadata !35}
!27 = metadata !{i32 786445, metadata !1, metadata !25, metadata !"t_link", i32 76, i64 64, i64 64, i64 0, i32 0, metadata !24} ; [ DW_TAG_member ] [t_link] [line 76, size 64, align 64, offset 0] [from ]
!28 = metadata !{i32 786445, metadata !1, metadata !25, metadata !"t_id", i32 77, i64 32, i64 32, i64 64, i32 0, metadata !8} ; [ DW_TAG_member ] [t_id] [line 77, size 32, align 32, offset 64] [from int]
!29 = metadata !{i32 786445, metadata !1, metadata !25, metadata !"t_pri", i32 78, i64 32, i64 32, i64 96, i32 0, metadata !8} ; [ DW_TAG_member ] [t_pri] [line 78, size 32, align 32, offset 96] [from int]
!30 = metadata !{i32 786445, metadata !1, metadata !25, metadata !"t_wkq", i32 79, i64 64, i64 64, i64 128, i32 0, metadata !9} ; [ DW_TAG_member ] [t_wkq] [line 79, size 64, align 64, offset 128] [from ]
!31 = metadata !{i32 786445, metadata !1, metadata !25, metadata !"t_state", i32 80, i64 32, i64 32, i64 192, i32 0, metadata !8} ; [ DW_TAG_member ] [t_state] [line 80, size 32, align 32, offset 192] [from int]
!32 = metadata !{i32 786445, metadata !1, metadata !25, metadata !"t_fn", i32 81, i64 64, i64 64, i64 256, i32 0, metadata !21} ; [ DW_TAG_member ] [t_fn] [line 81, size 64, align 64, offset 256] [from ]
!33 = metadata !{i32 786445, metadata !1, metadata !25, metadata !"t_v1", i32 82, i64 64, i64 64, i64 320, i32 0, metadata !34} ; [ DW_TAG_member ] [t_v1] [line 82, size 64, align 64, offset 320] [from long int]
!34 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!35 = metadata !{i32 786445, metadata !1, metadata !25, metadata !"t_v2", i32 83, i64 64, i64 64, i64 384, i32 0, metadata !34} ; [ DW_TAG_member ] [t_v2] [line 83, size 64, align 64, offset 384] [from long int]
!36 = metadata !{metadata !37, metadata !38, metadata !39, metadata !40, metadata !41, metadata !42, metadata !43, metadata !44}
!37 = metadata !{i32 786689, metadata !4, metadata !"id", metadata !5, i32 16777316, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [id] [line 100]
!38 = metadata !{i32 786689, metadata !4, metadata !"pri", metadata !5, i32 33554533, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pri] [line 101]
!39 = metadata !{i32 786689, metadata !4, metadata !"wkq", metadata !5, i32 50331750, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wkq] [line 102]
!40 = metadata !{i32 786689, metadata !4, metadata !"state", metadata !5, i32 67108967, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [state] [line 103]
!41 = metadata !{i32 786689, metadata !4, metadata !"fn", metadata !5, i32 83886184, metadata !21, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fn] [line 104]
!42 = metadata !{i32 786689, metadata !4, metadata !"v1", metadata !5, i32 100663401, metadata !34, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [v1] [line 105]
!43 = metadata !{i32 786689, metadata !4, metadata !"v2", metadata !5, i32 117440618, metadata !34, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [v2] [line 106]
!44 = metadata !{i32 786688, metadata !4, metadata !"t", metadata !5, i32 108, metadata !24, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t] [line 108]
!45 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"pkt", metadata !"pkt", metadata !"", i32 122, metadata !46, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, %struct.packet* (%struct.packet*, i32, i32)* @pkt, null, null, metadata !48, i32 123} ; [ DW_TAG_subprogram ] [line 122] [def] [scope 123] [pkt]
!46 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !47, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!47 = metadata !{metadata !9, metadata !9, metadata !8, metadata !8}
!48 = metadata !{metadata !49, metadata !50, metadata !51, metadata !52, metadata !53}
!49 = metadata !{i32 786689, metadata !45, metadata !"link", metadata !5, i32 16777338, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [link] [line 122]
!50 = metadata !{i32 786689, metadata !45, metadata !"id", metadata !5, i32 33554554, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [id] [line 122]
!51 = metadata !{i32 786689, metadata !45, metadata !"kind", metadata !5, i32 50331770, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 122]
!52 = metadata !{i32 786688, metadata !45, metadata !"i", metadata !5, i32 124, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 124]
!53 = metadata !{i32 786688, metadata !45, metadata !"p", metadata !5, i32 125, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [p] [line 125]
!54 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"trace", metadata !"trace", metadata !"", i32 138, metadata !55, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i8)* @trace, null, null, metadata !57, i32 139} ; [ DW_TAG_subprogram ] [line 138] [def] [scope 139] [trace]
!55 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !56, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!56 = metadata !{null, metadata !18}
!57 = metadata !{metadata !58}
!58 = metadata !{i32 786689, metadata !54, metadata !"a", metadata !5, i32 16777354, metadata !18, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [a] [line 138]
!59 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"schedule", metadata !"schedule", metadata !"", i32 149, metadata !60, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, void ()* @schedule, null, null, metadata !62, i32 150} ; [ DW_TAG_subprogram ] [line 149] [def] [scope 150] [schedule]
!60 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !61, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!61 = metadata !{null}
!62 = metadata !{metadata !63, metadata !65}
!63 = metadata !{i32 786688, metadata !64, metadata !"pkt", metadata !5, i32 153, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [pkt] [line 153]
!64 = metadata !{i32 786443, metadata !1, metadata !59, i32 152, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!65 = metadata !{i32 786688, metadata !64, metadata !"newtcb", metadata !5, i32 154, metadata !24, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [newtcb] [line 154]
!66 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Wait", metadata !"Wait", metadata !"", i32 192, metadata !67, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, %struct.task* ()* @Wait, null, null, metadata !2, i32 193} ; [ DW_TAG_subprogram ] [line 192] [def] [scope 193] [Wait]
!67 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !68, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!68 = metadata !{metadata !24}
!69 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"holdself", metadata !"holdself", metadata !"", i32 198, metadata !67, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, %struct.task* ()* @holdself, null, null, metadata !2, i32 199} ; [ DW_TAG_subprogram ] [line 198] [def] [scope 199] [holdself]
!70 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"findtcb", metadata !"findtcb", metadata !"", i32 205, metadata !71, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, %struct.task* (i32)* @findtcb, null, null, metadata !73, i32 206} ; [ DW_TAG_subprogram ] [line 205] [def] [scope 206] [findtcb]
!71 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !72, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!72 = metadata !{metadata !24, metadata !8}
!73 = metadata !{metadata !74, metadata !75}
!74 = metadata !{i32 786689, metadata !70, metadata !"id", metadata !5, i32 16777421, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [id] [line 205]
!75 = metadata !{i32 786688, metadata !70, metadata !"t", metadata !5, i32 207, metadata !24, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t] [line 207]
!76 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"release", metadata !"release", metadata !"", i32 215, metadata !71, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, %struct.task* (i32)* @release, null, null, metadata !77, i32 216} ; [ DW_TAG_subprogram ] [line 215] [def] [scope 216] [release]
!77 = metadata !{metadata !78, metadata !79}
!78 = metadata !{i32 786689, metadata !76, metadata !"id", metadata !5, i32 16777431, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [id] [line 215]
!79 = metadata !{i32 786688, metadata !76, metadata !"t", metadata !5, i32 217, metadata !24, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t] [line 217]
!80 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"qpkt", metadata !"qpkt", metadata !"", i32 229, metadata !22, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, %struct.task* (%struct.packet*)* @qpkt, null, null, metadata !81, i32 230} ; [ DW_TAG_subprogram ] [line 229] [def] [scope 230] [qpkt]
!81 = metadata !{metadata !82, metadata !83}
!82 = metadata !{i32 786689, metadata !80, metadata !"pkt", metadata !5, i32 16777445, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pkt] [line 229]
!83 = metadata !{i32 786688, metadata !80, metadata !"t", metadata !5, i32 231, metadata !24, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t] [line 231]
!84 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"idlefn", metadata !"idlefn", metadata !"", i32 255, metadata !22, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, %struct.task* (%struct.packet*)* @idlefn, null, null, metadata !85, i32 256} ; [ DW_TAG_subprogram ] [line 255] [def] [scope 256] [idlefn]
!85 = metadata !{metadata !86}
!86 = metadata !{i32 786689, metadata !84, metadata !"pkt", metadata !5, i32 16777471, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pkt] [line 255]
!87 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"workfn", metadata !"workfn", metadata !"", i32 272, metadata !22, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, %struct.task* (%struct.packet*)* @workfn, null, null, metadata !88, i32 273} ; [ DW_TAG_subprogram ] [line 272] [def] [scope 273] [workfn]
!88 = metadata !{metadata !89, metadata !90}
!89 = metadata !{i32 786689, metadata !87, metadata !"pkt", metadata !5, i32 16777488, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pkt] [line 272]
!90 = metadata !{i32 786688, metadata !91, metadata !"i", metadata !5, i32 277, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 277]
!91 = metadata !{i32 786443, metadata !1, metadata !92, i32 276, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!92 = metadata !{i32 786443, metadata !1, metadata !87, i32 274, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!93 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"handlerfn", metadata !"handlerfn", metadata !"", i32 293, metadata !22, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, %struct.task* (%struct.packet*)* @handlerfn, null, null, metadata !94, i32 294} ; [ DW_TAG_subprogram ] [line 293] [def] [scope 294] [handlerfn]
!94 = metadata !{metadata !95, metadata !96, metadata !99, metadata !100}
!95 = metadata !{i32 786689, metadata !93, metadata !"pkt", metadata !5, i32 16777509, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pkt] [line 293]
!96 = metadata !{i32 786688, metadata !97, metadata !"count", metadata !5, i32 300, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 300]
!97 = metadata !{i32 786443, metadata !1, metadata !98, i32 299, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!98 = metadata !{i32 786443, metadata !1, metadata !93, i32 298, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!99 = metadata !{i32 786688, metadata !97, metadata !"workpkt", metadata !5, i32 301, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [workpkt] [line 301]
!100 = metadata !{i32 786688, metadata !101, metadata !"devpkt", metadata !5, i32 312, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [devpkt] [line 312]
!101 = metadata !{i32 786443, metadata !1, metadata !102, i32 311, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!102 = metadata !{i32 786443, metadata !1, metadata !97, i32 310, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!103 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"devfn", metadata !"devfn", metadata !"", i32 324, metadata !22, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, %struct.task* (%struct.packet*)* @devfn, null, null, metadata !104, i32 325} ; [ DW_TAG_subprogram ] [line 324] [def] [scope 325] [devfn]
!104 = metadata !{metadata !105}
!105 = metadata !{i32 786689, metadata !103, metadata !"pkt", metadata !5, i32 16777540, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pkt] [line 324]
!106 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"append", metadata !"append", metadata !"", i32 341, metadata !107, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (%struct.packet*, %struct.packet*)* @append, null, null, metadata !109, i32 342} ; [ DW_TAG_subprogram ] [line 341] [def] [scope 342] [append]
!107 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !108, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!108 = metadata !{null, metadata !9, metadata !9}
!109 = metadata !{metadata !110, metadata !111}
!110 = metadata !{i32 786689, metadata !106, metadata !"pkt", metadata !5, i32 16777557, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pkt] [line 341]
!111 = metadata !{i32 786689, metadata !106, metadata !"ptr", metadata !5, i32 33554773, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 341]
!112 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 350, metadata !113, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 ()* @main, null, null, metadata !115, i32 351} ; [ DW_TAG_subprogram ] [line 350] [def] [scope 351] [main]
!113 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !114, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!114 = metadata !{metadata !8}
!115 = metadata !{metadata !116, metadata !117}
!116 = metadata !{i32 786688, metadata !112, metadata !"wkq", metadata !5, i32 352, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [wkq] [line 352]
!117 = metadata !{i32 786688, metadata !112, metadata !"retval", metadata !5, i32 353, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [retval] [line 353]
!118 = metadata !{metadata !119, metadata !123, metadata !127, metadata !128, metadata !129, metadata !130, metadata !131, metadata !132, metadata !133, metadata !134, metadata !135}
!119 = metadata !{i32 786484, i32 0, null, metadata !"alphabet", metadata !"alphabet", metadata !"", metadata !5, i32 86, metadata !120, i32 0, i32 1, [28 x i8]* @alphabet, null} ; [ DW_TAG_variable ] [alphabet] [line 86] [def]
!120 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 224, i64 8, i32 0, i32 0, metadata !18, metadata !121, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 224, align 8, offset 0] [from char]
!121 = metadata !{metadata !122}
!122 = metadata !{i32 786465, i64 0, i64 28}      ; [ DW_TAG_subrange_type ] [0, 27]
!123 = metadata !{i32 786484, i32 0, null, metadata !"tasktab", metadata !"tasktab", metadata !"", metadata !5, i32 87, metadata !124, i32 0, i32 1, [11 x %struct.task*]* @tasktab, null} ; [ DW_TAG_variable ] [tasktab] [line 87] [def]
!124 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 704, i64 64, i32 0, i32 0, metadata !24, metadata !125, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 704, align 64, offset 0] [from ]
!125 = metadata !{metadata !126}
!126 = metadata !{i32 786465, i64 0, i64 11}      ; [ DW_TAG_subrange_type ] [0, 10]
!127 = metadata !{i32 786484, i32 0, null, metadata !"tasklist", metadata !"tasklist", metadata !"", metadata !5, i32 88, metadata !24, i32 0, i32 1, %struct.task** @tasklist, null} ; [ DW_TAG_variable ] [tasklist] [line 88] [def]
!128 = metadata !{i32 786484, i32 0, null, metadata !"qpktcount", metadata !"qpktcount", metadata !"", metadata !5, i32 93, metadata !8, i32 0, i32 1, i32* @qpktcount, null} ; [ DW_TAG_variable ] [qpktcount] [line 93] [def]
!129 = metadata !{i32 786484, i32 0, null, metadata !"holdcount", metadata !"holdcount", metadata !"", metadata !5, i32 94, metadata !8, i32 0, i32 1, i32* @holdcount, null} ; [ DW_TAG_variable ] [holdcount] [line 94] [def]
!130 = metadata !{i32 786484, i32 0, null, metadata !"tracing", metadata !"tracing", metadata !"", metadata !5, i32 95, metadata !8, i32 0, i32 1, i32* @tracing, null} ; [ DW_TAG_variable ] [tracing] [line 95] [def]
!131 = metadata !{i32 786484, i32 0, null, metadata !"layout", metadata !"layout", metadata !"", metadata !5, i32 96, metadata !8, i32 0, i32 1, i32* @layout, null} ; [ DW_TAG_variable ] [layout] [line 96] [def]
!132 = metadata !{i32 786484, i32 0, null, metadata !"tcb", metadata !"tcb", metadata !"", metadata !5, i32 89, metadata !24, i32 0, i32 1, %struct.task** @tcb, null} ; [ DW_TAG_variable ] [tcb] [line 89] [def]
!133 = metadata !{i32 786484, i32 0, null, metadata !"taskid", metadata !"taskid", metadata !"", metadata !5, i32 90, metadata !34, i32 0, i32 1, i64* @taskid, null} ; [ DW_TAG_variable ] [taskid] [line 90] [def]
!134 = metadata !{i32 786484, i32 0, null, metadata !"v1", metadata !"v1", metadata !"", metadata !5, i32 91, metadata !34, i32 0, i32 1, i64* @v1, null} ; [ DW_TAG_variable ] [v1] [line 91] [def]
!135 = metadata !{i32 786484, i32 0, null, metadata !"v2", metadata !"v2", metadata !"", metadata !5, i32 92, metadata !34, i32 0, i32 1, i64* @v2, null} ; [ DW_TAG_variable ] [v2] [line 92] [def]
!136 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!137 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!138 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!139 = metadata !{i32 100, i32 0, metadata !4, null}
!140 = metadata !{i32 101, i32 0, metadata !4, null}
!141 = metadata !{i32 102, i32 0, metadata !4, null}
!142 = metadata !{i32 103, i32 0, metadata !4, null}
!143 = metadata !{i32 104, i32 0, metadata !4, null}
!144 = metadata !{i32 105, i32 0, metadata !4, null}
!145 = metadata !{i32 106, i32 0, metadata !4, null}
!146 = metadata !{i32 108, i32 0, metadata !4, null}
!147 = metadata !{i32 110, i32 0, metadata !4, null}
!148 = metadata !{metadata !149, metadata !149, i64 0}
!149 = metadata !{metadata !"any pointer", metadata !150, i64 0}
!150 = metadata !{metadata !"omnipotent char", metadata !151, i64 0}
!151 = metadata !{metadata !"Simple C/C++ TBAA"}
!152 = metadata !{i32 111, i32 0, metadata !4, null}
!153 = metadata !{metadata !154, metadata !149, i64 0}
!154 = metadata !{metadata !"task", metadata !149, i64 0, metadata !155, i64 8, metadata !155, i64 12, metadata !149, i64 16, metadata !155, i64 24, metadata !149, i64 32, metadata !156, i64 40, metadata !156, i64 48}
!155 = metadata !{metadata !"int", metadata !150, i64 0}
!156 = metadata !{metadata !"long", metadata !150, i64 0}
!157 = metadata !{i32 112, i32 0, metadata !4, null}
!158 = metadata !{metadata !154, metadata !155, i64 8}
!159 = metadata !{i32 113, i32 0, metadata !4, null}
!160 = metadata !{metadata !154, metadata !155, i64 12}
!161 = metadata !{i32 114, i32 0, metadata !4, null}
!162 = metadata !{metadata !154, metadata !149, i64 16}
!163 = metadata !{i32 115, i32 0, metadata !4, null}
!164 = metadata !{metadata !154, metadata !155, i64 24}
!165 = metadata !{i32 116, i32 0, metadata !4, null}
!166 = metadata !{metadata !154, metadata !149, i64 32}
!167 = metadata !{i32 117, i32 0, metadata !4, null}
!168 = metadata !{metadata !154, metadata !156, i64 40}
!169 = metadata !{i32 118, i32 0, metadata !4, null}
!170 = metadata !{metadata !154, metadata !156, i64 48}
!171 = metadata !{i32 119, i32 0, metadata !4, null}
!172 = metadata !{i32 120, i32 0, metadata !4, null}
!173 = metadata !{i32 122, i32 0, metadata !45, null}
!174 = metadata !{i32 125, i32 0, metadata !45, null}
!175 = metadata !{i32 0}
!176 = metadata !{i32 127, i32 0, metadata !177, null}
!177 = metadata !{i32 786443, metadata !1, metadata !45, i32 127, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!178 = metadata !{i32 128, i32 0, metadata !177, null}
!179 = metadata !{i32 130, i32 0, metadata !45, null}
!180 = metadata !{metadata !181, metadata !149, i64 0}
!181 = metadata !{metadata !"packet", metadata !149, i64 0, metadata !155, i64 8, metadata !155, i64 12, metadata !155, i64 16, metadata !150, i64 20}
!182 = metadata !{i32 131, i32 0, metadata !45, null}
!183 = metadata !{metadata !181, metadata !155, i64 8}
!184 = metadata !{i32 132, i32 0, metadata !45, null}
!185 = metadata !{metadata !181, metadata !155, i64 12}
!186 = metadata !{i32 133, i32 0, metadata !45, null}
!187 = metadata !{metadata !181, metadata !155, i64 16}
!188 = metadata !{i32 135, i32 0, metadata !45, null}
!189 = metadata !{i32 138, i32 0, metadata !54, null}
!190 = metadata !{i32 140, i32 0, metadata !191, null}
!191 = metadata !{i32 786443, metadata !1, metadata !54, i32 140, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!192 = metadata !{metadata !155, metadata !155, i64 0}
!193 = metadata !{i32 142, i32 0, metadata !194, null}
!194 = metadata !{i32 786443, metadata !1, metadata !191, i32 141, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!195 = metadata !{i32 143, i32 0, metadata !194, null}
!196 = metadata !{i32 144, i32 0, metadata !194, null}
!197 = metadata !{i32 146, i32 0, metadata !54, null}
!198 = metadata !{i32 147, i32 0, metadata !54, null}
!199 = metadata !{i32 151, i32 0, metadata !59, null}
!200 = metadata !{%struct.packet* null}
!201 = metadata !{i32 156, i32 0, metadata !64, null}
!202 = metadata !{i32 158, i32 0, metadata !64, null}
!203 = metadata !{i32 161, i32 0, metadata !204, null}
!204 = metadata !{i32 786443, metadata !1, metadata !64, i32 159, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!205 = metadata !{i32 162, i32 0, metadata !204, null}
!206 = metadata !{i32 163, i32 0, metadata !204, null}
!207 = metadata !{i32 167, i32 0, metadata !204, null}
!208 = metadata !{metadata !156, metadata !156, i64 0}
!209 = metadata !{i32 168, i32 0, metadata !204, null}
!210 = metadata !{i32 169, i32 0, metadata !204, null}
!211 = metadata !{i32 170, i32 0, metadata !212, null}
!212 = metadata !{i32 786443, metadata !1, metadata !204, i32 170, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!213 = metadata !{i32 140, i32 0, metadata !191, metadata !211}
!214 = metadata !{i32 142, i32 0, metadata !194, metadata !211}
!215 = metadata !{i32 143, i32 0, metadata !194, metadata !211}
!216 = metadata !{i32 144, i32 0, metadata !194, metadata !211}
!217 = metadata !{i32 146, i32 0, metadata !54, metadata !211}
!218 = metadata !{i32 172, i32 0, metadata !204, null}
!219 = metadata !{i32 173, i32 0, metadata !204, null}
!220 = metadata !{i32 174, i32 0, metadata !204, null}
!221 = metadata !{i32 176, i32 0, metadata !204, null}
!222 = metadata !{i32 183, i32 0, metadata !204, null}
!223 = metadata !{i32 184, i32 0, metadata !204, null}
!224 = metadata !{i32 175, i32 0, metadata !204, null}
!225 = metadata !{i32 190, i32 0, metadata !59, null}
!226 = metadata !{i32 194, i32 0, metadata !66, null}
!227 = metadata !{i32 195, i32 0, metadata !66, null}
!228 = metadata !{i32 200, i32 0, metadata !69, null}
!229 = metadata !{i32 201, i32 0, metadata !69, null}
!230 = metadata !{i32 202, i32 0, metadata !69, null}
!231 = metadata !{i32 205, i32 0, metadata !70, null}
!232 = metadata !{%struct.task* null}
!233 = metadata !{i32 207, i32 0, metadata !70, null}
!234 = metadata !{i32 209, i32 0, metadata !235, null}
!235 = metadata !{i32 786443, metadata !1, metadata !70, i32 209, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!236 = metadata !{i32 210, i32 0, metadata !235, null}
!237 = metadata !{i32 211, i32 0, metadata !238, null}
!238 = metadata !{i32 786443, metadata !1, metadata !70, i32 211, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!239 = metadata !{i32 212, i32 0, metadata !70, null}
!240 = metadata !{i32 215, i32 0, metadata !76, null}
!241 = metadata !{i32 786689, metadata !70, metadata !"id", metadata !5, i32 16777421, metadata !8, i32 0, metadata !242} ; [ DW_TAG_arg_variable ] [id] [line 205]
!242 = metadata !{i32 219, i32 0, metadata !76, null}
!243 = metadata !{i32 205, i32 0, metadata !70, metadata !242}
!244 = metadata !{i32 786688, metadata !70, metadata !"t", metadata !5, i32 207, metadata !24, i32 0, metadata !242} ; [ DW_TAG_auto_variable ] [t] [line 207]
!245 = metadata !{i32 207, i32 0, metadata !70, metadata !242}
!246 = metadata !{i32 209, i32 0, metadata !235, metadata !242}
!247 = metadata !{i32 210, i32 0, metadata !235, metadata !242}
!248 = metadata !{i32 211, i32 0, metadata !238, metadata !242}
!249 = metadata !{i32 220, i32 0, metadata !250, null}
!250 = metadata !{i32 786443, metadata !1, metadata !76, i32 220, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!251 = metadata !{i32 222, i32 0, metadata !76, null}
!252 = metadata !{i32 223, i32 0, metadata !253, null}
!253 = metadata !{i32 786443, metadata !1, metadata !76, i32 223, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!254 = metadata !{i32 226, i32 0, metadata !76, null}
!255 = metadata !{i32 229, i32 0, metadata !80, null}
!256 = metadata !{i32 233, i32 0, metadata !80, null}
!257 = metadata !{i32 786689, metadata !70, metadata !"id", metadata !5, i32 16777421, metadata !8, i32 0, metadata !256} ; [ DW_TAG_arg_variable ] [id] [line 205]
!258 = metadata !{i32 205, i32 0, metadata !70, metadata !256}
!259 = metadata !{i32 786688, metadata !70, metadata !"t", metadata !5, i32 207, metadata !24, i32 0, metadata !256} ; [ DW_TAG_auto_variable ] [t] [line 207]
!260 = metadata !{i32 207, i32 0, metadata !70, metadata !256}
!261 = metadata !{i32 209, i32 0, metadata !235, metadata !256}
!262 = metadata !{i32 210, i32 0, metadata !235, metadata !256}
!263 = metadata !{i32 211, i32 0, metadata !238, metadata !256}
!264 = metadata !{i32 234, i32 0, metadata !265, null}
!265 = metadata !{i32 786443, metadata !1, metadata !80, i32 234, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!266 = metadata !{i32 236, i32 0, metadata !80, null}
!267 = metadata !{i32 238, i32 0, metadata !80, null}
!268 = metadata !{i32 239, i32 0, metadata !80, null}
!269 = metadata !{i32 241, i32 0, metadata !270, null}
!270 = metadata !{i32 786443, metadata !1, metadata !80, i32 241, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!271 = metadata !{i32 243, i32 0, metadata !272, null}
!272 = metadata !{i32 786443, metadata !1, metadata !270, i32 242, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!273 = metadata !{i32 244, i32 0, metadata !272, null}
!274 = metadata !{i32 245, i32 0, metadata !275, null}
!275 = metadata !{i32 786443, metadata !1, metadata !272, i32 245, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!276 = metadata !{i32 249, i32 0, metadata !277, null}
!277 = metadata !{i32 786443, metadata !1, metadata !270, i32 248, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!278 = metadata !{i32 786689, metadata !106, metadata !"pkt", metadata !5, i32 16777557, metadata !9, i32 0, metadata !276} ; [ DW_TAG_arg_variable ] [pkt] [line 341]
!279 = metadata !{i32 341, i32 0, metadata !106, metadata !276}
!280 = metadata !{i32 786689, metadata !106, metadata !"ptr", metadata !5, i32 33554773, metadata !9, i32 0, metadata !276} ; [ DW_TAG_arg_variable ] [ptr] [line 341]
!281 = metadata !{i32 343, i32 0, metadata !106, metadata !276}
!282 = metadata !{i32 345, i32 0, metadata !106, metadata !276}
!283 = metadata !{i32 347, i32 0, metadata !106, metadata !276}
!284 = metadata !{i32 252, i32 0, metadata !80, null}
!285 = metadata !{i32 253, i32 0, metadata !80, null}
!286 = metadata !{i32 341, i32 0, metadata !106, null}
!287 = metadata !{i32 343, i32 0, metadata !106, null}
!288 = metadata !{i32 345, i32 0, metadata !106, null}
!289 = metadata !{i32 347, i32 0, metadata !106, null}
!290 = metadata !{i32 348, i32 0, metadata !106, null}
!291 = metadata !{i32 255, i32 0, metadata !84, null}
!292 = metadata !{i32 257, i32 0, metadata !84, null}
!293 = metadata !{i32 258, i32 0, metadata !294, null}
!294 = metadata !{i32 786443, metadata !1, metadata !84, i32 258, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!295 = metadata !{i32 200, i32 0, metadata !69, metadata !293}
!296 = metadata !{i32 201, i32 0, metadata !69, metadata !293}
!297 = metadata !{i32 202, i32 0, metadata !69, metadata !293}
!298 = metadata !{i32 260, i32 0, metadata !299, null}
!299 = metadata !{i32 786443, metadata !1, metadata !84, i32 260, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!300 = metadata !{i32 262, i32 0, metadata !301, null}
!301 = metadata !{i32 786443, metadata !1, metadata !299, i32 261, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!302 = metadata !{i32 5}
!303 = metadata !{i32 786689, metadata !76, metadata !"id", metadata !5, i32 16777431, metadata !8, i32 0, metadata !304} ; [ DW_TAG_arg_variable ] [id] [line 215]
!304 = metadata !{i32 263, i32 0, metadata !301, null}
!305 = metadata !{i32 215, i32 0, metadata !76, metadata !304}
!306 = metadata !{i32 786689, metadata !70, metadata !"id", metadata !5, i32 16777421, metadata !8, i32 0, metadata !307} ; [ DW_TAG_arg_variable ] [id] [line 205]
!307 = metadata !{i32 219, i32 0, metadata !76, metadata !304}
!308 = metadata !{i32 205, i32 0, metadata !70, metadata !307}
!309 = metadata !{i32 786688, metadata !70, metadata !"t", metadata !5, i32 207, metadata !24, i32 0, metadata !307} ; [ DW_TAG_auto_variable ] [t] [line 207]
!310 = metadata !{i32 207, i32 0, metadata !70, metadata !307}
!311 = metadata !{i32 210, i32 0, metadata !235, metadata !307}
!312 = metadata !{i32 211, i32 0, metadata !238, metadata !307}
!313 = metadata !{i32 786688, metadata !76, metadata !"t", metadata !5, i32 217, metadata !24, i32 0, metadata !304} ; [ DW_TAG_auto_variable ] [t] [line 217]
!314 = metadata !{i32 220, i32 0, metadata !250, metadata !304}
!315 = metadata !{i32 222, i32 0, metadata !76, metadata !304}
!316 = metadata !{i32 223, i32 0, metadata !253, metadata !304}
!317 = metadata !{i32 267, i32 0, metadata !318, null}
!318 = metadata !{i32 786443, metadata !1, metadata !299, i32 266, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!319 = metadata !{i32 6}
!320 = metadata !{i32 786689, metadata !76, metadata !"id", metadata !5, i32 16777431, metadata !8, i32 0, metadata !321} ; [ DW_TAG_arg_variable ] [id] [line 215]
!321 = metadata !{i32 268, i32 0, metadata !318, null}
!322 = metadata !{i32 215, i32 0, metadata !76, metadata !321}
!323 = metadata !{i32 786689, metadata !70, metadata !"id", metadata !5, i32 16777421, metadata !8, i32 0, metadata !324} ; [ DW_TAG_arg_variable ] [id] [line 205]
!324 = metadata !{i32 219, i32 0, metadata !76, metadata !321}
!325 = metadata !{i32 205, i32 0, metadata !70, metadata !324}
!326 = metadata !{i32 786688, metadata !70, metadata !"t", metadata !5, i32 207, metadata !24, i32 0, metadata !324} ; [ DW_TAG_auto_variable ] [t] [line 207]
!327 = metadata !{i32 207, i32 0, metadata !70, metadata !324}
!328 = metadata !{i32 210, i32 0, metadata !235, metadata !324}
!329 = metadata !{i32 211, i32 0, metadata !238, metadata !324}
!330 = metadata !{i32 786688, metadata !76, metadata !"t", metadata !5, i32 217, metadata !24, i32 0, metadata !321} ; [ DW_TAG_auto_variable ] [t] [line 217]
!331 = metadata !{i32 220, i32 0, metadata !250, metadata !321}
!332 = metadata !{i32 222, i32 0, metadata !76, metadata !321}
!333 = metadata !{i32 223, i32 0, metadata !253, metadata !321}
!334 = metadata !{i32 270, i32 0, metadata !84, null}
!335 = metadata !{i32 272, i32 0, metadata !87, null}
!336 = metadata !{i32 274, i32 0, metadata !92, null}
!337 = metadata !{i32 194, i32 0, metadata !66, metadata !336}
!338 = metadata !{i32 279, i32 0, metadata !91, null}
!339 = metadata !{i32 280, i32 0, metadata !91, null}
!340 = metadata !{i32 282, i32 0, metadata !91, null}
!341 = metadata !{i32 283, i32 0, metadata !342, null}
!342 = metadata !{i32 786443, metadata !1, metadata !91, i32 283, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!343 = metadata !{i32 285, i32 0, metadata !344, null}
!344 = metadata !{i32 786443, metadata !1, metadata !342, i32 284, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!345 = metadata !{i32 286, i32 0, metadata !346, null}
!346 = metadata !{i32 786443, metadata !1, metadata !344, i32 286, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!347 = metadata !{i32 287, i32 0, metadata !344, null}
!348 = metadata !{metadata !150, metadata !150, i64 0}
!349 = metadata !{i32 786689, metadata !80, metadata !"pkt", metadata !5, i32 16777445, metadata !9, i32 0, metadata !350} ; [ DW_TAG_arg_variable ] [pkt] [line 229]
!350 = metadata !{i32 289, i32 0, metadata !91, null}
!351 = metadata !{i32 229, i32 0, metadata !80, metadata !350}
!352 = metadata !{i32 786689, metadata !70, metadata !"id", metadata !5, i32 16777421, metadata !8, i32 0, metadata !353} ; [ DW_TAG_arg_variable ] [id] [line 205]
!353 = metadata !{i32 233, i32 0, metadata !80, metadata !350}
!354 = metadata !{i32 205, i32 0, metadata !70, metadata !353}
!355 = metadata !{i32 786688, metadata !70, metadata !"t", metadata !5, i32 207, metadata !24, i32 0, metadata !353} ; [ DW_TAG_auto_variable ] [t] [line 207]
!356 = metadata !{i32 207, i32 0, metadata !70, metadata !353}
!357 = metadata !{i32 209, i32 0, metadata !235, metadata !353}
!358 = metadata !{i32 210, i32 0, metadata !235, metadata !353}
!359 = metadata !{i32 211, i32 0, metadata !238, metadata !353}
!360 = metadata !{i32 234, i32 0, metadata !265, metadata !350}
!361 = metadata !{i32 236, i32 0, metadata !80, metadata !350}
!362 = metadata !{i32 238, i32 0, metadata !80, metadata !350}
!363 = metadata !{i32 239, i32 0, metadata !80, metadata !350}
!364 = metadata !{i32 241, i32 0, metadata !270, metadata !350}
!365 = metadata !{i32 243, i32 0, metadata !272, metadata !350}
!366 = metadata !{i32 244, i32 0, metadata !272, metadata !350}
!367 = metadata !{i32 245, i32 0, metadata !275, metadata !350}
!368 = metadata !{i32 249, i32 0, metadata !277, metadata !350}
!369 = metadata !{i32 786689, metadata !106, metadata !"pkt", metadata !5, i32 16777557, metadata !9, i32 0, metadata !368} ; [ DW_TAG_arg_variable ] [pkt] [line 341]
!370 = metadata !{i32 341, i32 0, metadata !106, metadata !368}
!371 = metadata !{i32 786689, metadata !106, metadata !"ptr", metadata !5, i32 33554773, metadata !9, i32 0, metadata !368} ; [ DW_TAG_arg_variable ] [ptr] [line 341]
!372 = metadata !{i32 343, i32 0, metadata !106, metadata !368}
!373 = metadata !{i32 345, i32 0, metadata !106, metadata !368}
!374 = metadata !{i32 347, i32 0, metadata !106, metadata !368}
!375 = metadata !{i32 252, i32 0, metadata !80, metadata !350}
!376 = metadata !{i32 291, i32 0, metadata !87, null}
!377 = metadata !{i32 293, i32 0, metadata !93, null}
!378 = metadata !{i32 295, i32 0, metadata !379, null}
!379 = metadata !{i32 786443, metadata !1, metadata !93, i32 295, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!380 = metadata !{i32 786689, metadata !106, metadata !"pkt", metadata !5, i32 16777557, metadata !9, i32 0, metadata !378} ; [ DW_TAG_arg_variable ] [pkt] [line 341]
!381 = metadata !{i32 341, i32 0, metadata !106, metadata !378}
!382 = metadata !{i32 786689, metadata !106, metadata !"ptr", metadata !5, i32 33554773, metadata !9, i32 0, metadata !378} ; [ DW_TAG_arg_variable ] [ptr] [line 341]
!383 = metadata !{i32 343, i32 0, metadata !106, metadata !378}
!384 = metadata !{i32 345, i32 0, metadata !106, metadata !378}
!385 = metadata !{i32 347, i32 0, metadata !106, metadata !378}
!386 = metadata !{i32 298, i32 0, metadata !98, null}
!387 = metadata !{i32 301, i32 0, metadata !97, null}
!388 = metadata !{i32 302, i32 0, metadata !97, null}
!389 = metadata !{i32 304, i32 0, metadata !390, null}
!390 = metadata !{i32 786443, metadata !1, metadata !97, i32 304, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!391 = metadata !{i32 306, i32 0, metadata !392, null}
!392 = metadata !{i32 786443, metadata !1, metadata !390, i32 305, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!393 = metadata !{i32 786689, metadata !80, metadata !"pkt", metadata !5, i32 16777445, metadata !9, i32 0, metadata !394} ; [ DW_TAG_arg_variable ] [pkt] [line 229]
!394 = metadata !{i32 307, i32 0, metadata !392, null}
!395 = metadata !{i32 229, i32 0, metadata !80, metadata !394}
!396 = metadata !{i32 233, i32 0, metadata !80, metadata !394}
!397 = metadata !{i32 786689, metadata !70, metadata !"id", metadata !5, i32 16777421, metadata !8, i32 0, metadata !396} ; [ DW_TAG_arg_variable ] [id] [line 205]
!398 = metadata !{i32 205, i32 0, metadata !70, metadata !396}
!399 = metadata !{i32 786688, metadata !70, metadata !"t", metadata !5, i32 207, metadata !24, i32 0, metadata !396} ; [ DW_TAG_auto_variable ] [t] [line 207]
!400 = metadata !{i32 207, i32 0, metadata !70, metadata !396}
!401 = metadata !{i32 209, i32 0, metadata !235, metadata !396}
!402 = metadata !{i32 210, i32 0, metadata !235, metadata !396}
!403 = metadata !{i32 211, i32 0, metadata !238, metadata !396}
!404 = metadata !{i32 234, i32 0, metadata !265, metadata !394}
!405 = metadata !{i32 236, i32 0, metadata !80, metadata !394}
!406 = metadata !{i32 238, i32 0, metadata !80, metadata !394}
!407 = metadata !{i32 239, i32 0, metadata !80, metadata !394}
!408 = metadata !{i32 241, i32 0, metadata !270, metadata !394}
!409 = metadata !{i32 243, i32 0, metadata !272, metadata !394}
!410 = metadata !{i32 244, i32 0, metadata !272, metadata !394}
!411 = metadata !{i32 245, i32 0, metadata !275, metadata !394}
!412 = metadata !{i32 249, i32 0, metadata !277, metadata !394}
!413 = metadata !{i32 786689, metadata !106, metadata !"pkt", metadata !5, i32 16777557, metadata !9, i32 0, metadata !412} ; [ DW_TAG_arg_variable ] [pkt] [line 341]
!414 = metadata !{i32 341, i32 0, metadata !106, metadata !412}
!415 = metadata !{i32 786689, metadata !106, metadata !"ptr", metadata !5, i32 33554773, metadata !9, i32 0, metadata !412} ; [ DW_TAG_arg_variable ] [ptr] [line 341]
!416 = metadata !{i32 343, i32 0, metadata !106, metadata !412}
!417 = metadata !{i32 345, i32 0, metadata !106, metadata !412}
!418 = metadata !{i32 347, i32 0, metadata !106, metadata !412}
!419 = metadata !{i32 252, i32 0, metadata !80, metadata !394}
!420 = metadata !{i32 310, i32 0, metadata !102, null}
!421 = metadata !{i32 314, i32 0, metadata !101, null}
!422 = metadata !{i32 315, i32 0, metadata !101, null}
!423 = metadata !{i32 316, i32 0, metadata !101, null}
!424 = metadata !{i32 317, i32 0, metadata !101, null}
!425 = metadata !{i32 786689, metadata !80, metadata !"pkt", metadata !5, i32 16777445, metadata !9, i32 0, metadata !426} ; [ DW_TAG_arg_variable ] [pkt] [line 229]
!426 = metadata !{i32 318, i32 0, metadata !101, null}
!427 = metadata !{i32 229, i32 0, metadata !80, metadata !426}
!428 = metadata !{i32 233, i32 0, metadata !80, metadata !426}
!429 = metadata !{i32 786689, metadata !70, metadata !"id", metadata !5, i32 16777421, metadata !8, i32 0, metadata !428} ; [ DW_TAG_arg_variable ] [id] [line 205]
!430 = metadata !{i32 205, i32 0, metadata !70, metadata !428}
!431 = metadata !{i32 786688, metadata !70, metadata !"t", metadata !5, i32 207, metadata !24, i32 0, metadata !428} ; [ DW_TAG_auto_variable ] [t] [line 207]
!432 = metadata !{i32 207, i32 0, metadata !70, metadata !428}
!433 = metadata !{i32 209, i32 0, metadata !235, metadata !428}
!434 = metadata !{i32 210, i32 0, metadata !235, metadata !428}
!435 = metadata !{i32 211, i32 0, metadata !238, metadata !428}
!436 = metadata !{i32 234, i32 0, metadata !265, metadata !426}
!437 = metadata !{i32 236, i32 0, metadata !80, metadata !426}
!438 = metadata !{i32 238, i32 0, metadata !80, metadata !426}
!439 = metadata !{i32 239, i32 0, metadata !80, metadata !426}
!440 = metadata !{i32 241, i32 0, metadata !270, metadata !426}
!441 = metadata !{i32 243, i32 0, metadata !272, metadata !426}
!442 = metadata !{i32 244, i32 0, metadata !272, metadata !426}
!443 = metadata !{i32 245, i32 0, metadata !275, metadata !426}
!444 = metadata !{i32 249, i32 0, metadata !277, metadata !426}
!445 = metadata !{i32 786689, metadata !106, metadata !"pkt", metadata !5, i32 16777557, metadata !9, i32 0, metadata !444} ; [ DW_TAG_arg_variable ] [pkt] [line 341]
!446 = metadata !{i32 341, i32 0, metadata !106, metadata !444}
!447 = metadata !{i32 786689, metadata !106, metadata !"ptr", metadata !5, i32 33554773, metadata !9, i32 0, metadata !444} ; [ DW_TAG_arg_variable ] [ptr] [line 341]
!448 = metadata !{i32 343, i32 0, metadata !106, metadata !444}
!449 = metadata !{i32 345, i32 0, metadata !106, metadata !444}
!450 = metadata !{i32 347, i32 0, metadata !106, metadata !444}
!451 = metadata !{i32 252, i32 0, metadata !80, metadata !426}
!452 = metadata !{i32 194, i32 0, metadata !66, metadata !453}
!453 = metadata !{i32 321, i32 0, metadata !93, null}
!454 = metadata !{i32 322, i32 0, metadata !93, null}
!455 = metadata !{i32 324, i32 0, metadata !103, null}
!456 = metadata !{i32 326, i32 0, metadata !457, null}
!457 = metadata !{i32 786443, metadata !1, metadata !103, i32 326, i32 0, i32 31} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!458 = metadata !{i32 328, i32 0, metadata !459, null}
!459 = metadata !{i32 786443, metadata !1, metadata !460, i32 328, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!460 = metadata !{i32 786443, metadata !1, metadata !457, i32 327, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!461 = metadata !{i32 194, i32 0, metadata !66, metadata !458}
!462 = metadata !{i32 329, i32 0, metadata !460, null}
!463 = metadata !{i32 330, i32 0, metadata !460, null}
!464 = metadata !{i32 786689, metadata !80, metadata !"pkt", metadata !5, i32 16777445, metadata !9, i32 0, metadata !465} ; [ DW_TAG_arg_variable ] [pkt] [line 229]
!465 = metadata !{i32 331, i32 0, metadata !460, null}
!466 = metadata !{i32 229, i32 0, metadata !80, metadata !465}
!467 = metadata !{i32 233, i32 0, metadata !80, metadata !465}
!468 = metadata !{i32 786689, metadata !70, metadata !"id", metadata !5, i32 16777421, metadata !8, i32 0, metadata !467} ; [ DW_TAG_arg_variable ] [id] [line 205]
!469 = metadata !{i32 205, i32 0, metadata !70, metadata !467}
!470 = metadata !{i32 786688, metadata !70, metadata !"t", metadata !5, i32 207, metadata !24, i32 0, metadata !467} ; [ DW_TAG_auto_variable ] [t] [line 207]
!471 = metadata !{i32 207, i32 0, metadata !70, metadata !467}
!472 = metadata !{i32 209, i32 0, metadata !235, metadata !467}
!473 = metadata !{i32 210, i32 0, metadata !235, metadata !467}
!474 = metadata !{i32 211, i32 0, metadata !238, metadata !467}
!475 = metadata !{i32 234, i32 0, metadata !265, metadata !465}
!476 = metadata !{i32 236, i32 0, metadata !80, metadata !465}
!477 = metadata !{i32 238, i32 0, metadata !80, metadata !465}
!478 = metadata !{i32 239, i32 0, metadata !80, metadata !465}
!479 = metadata !{i32 241, i32 0, metadata !270, metadata !465}
!480 = metadata !{i32 243, i32 0, metadata !272, metadata !465}
!481 = metadata !{i32 244, i32 0, metadata !272, metadata !465}
!482 = metadata !{i32 245, i32 0, metadata !275, metadata !465}
!483 = metadata !{i32 249, i32 0, metadata !277, metadata !465}
!484 = metadata !{i32 786689, metadata !106, metadata !"pkt", metadata !5, i32 16777557, metadata !9, i32 0, metadata !483} ; [ DW_TAG_arg_variable ] [pkt] [line 341]
!485 = metadata !{i32 341, i32 0, metadata !106, metadata !483}
!486 = metadata !{i32 786689, metadata !106, metadata !"ptr", metadata !5, i32 33554773, metadata !9, i32 0, metadata !483} ; [ DW_TAG_arg_variable ] [ptr] [line 341]
!487 = metadata !{i32 343, i32 0, metadata !106, metadata !483}
!488 = metadata !{i32 345, i32 0, metadata !106, metadata !483}
!489 = metadata !{i32 347, i32 0, metadata !106, metadata !483}
!490 = metadata !{i32 252, i32 0, metadata !80, metadata !465}
!491 = metadata !{i32 335, i32 0, metadata !492, null}
!492 = metadata !{i32 786443, metadata !1, metadata !457, i32 334, i32 0, i32 34} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!493 = metadata !{i32 336, i32 0, metadata !494, null}
!494 = metadata !{i32 786443, metadata !1, metadata !492, i32 336, i32 0, i32 35} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!495 = metadata !{i32 140, i32 0, metadata !191, metadata !493}
!496 = metadata !{i32 142, i32 0, metadata !194, metadata !493}
!497 = metadata !{i32 143, i32 0, metadata !194, metadata !493}
!498 = metadata !{i32 144, i32 0, metadata !194, metadata !493}
!499 = metadata !{i32 146, i32 0, metadata !54, metadata !493}
!500 = metadata !{i32 200, i32 0, metadata !69, metadata !501}
!501 = metadata !{i32 337, i32 0, metadata !492, null}
!502 = metadata !{i32 201, i32 0, metadata !69, metadata !501}
!503 = metadata !{i32 202, i32 0, metadata !69, metadata !501}
!504 = metadata !{i32 339, i32 0, metadata !103, null}
!505 = metadata !{i32 352, i32 0, metadata !112, null}
!506 = metadata !{i32 355, i32 0, metadata !112, null}
!507 = metadata !{i32 1}
!508 = metadata !{i32 786689, metadata !4, metadata !"id", metadata !5, i32 16777316, metadata !8, i32 0, metadata !509} ; [ DW_TAG_arg_variable ] [id] [line 100]
!509 = metadata !{i32 357, i32 0, metadata !112, null}
!510 = metadata !{i32 100, i32 0, metadata !4, metadata !509}
!511 = metadata !{i32 786689, metadata !4, metadata !"pri", metadata !5, i32 33554533, metadata !8, i32 0, metadata !509} ; [ DW_TAG_arg_variable ] [pri] [line 101]
!512 = metadata !{i32 101, i32 0, metadata !4, metadata !509}
!513 = metadata !{i32 786689, metadata !4, metadata !"wkq", metadata !5, i32 50331750, metadata !9, i32 0, metadata !509} ; [ DW_TAG_arg_variable ] [wkq] [line 102]
!514 = metadata !{i32 102, i32 0, metadata !4, metadata !509}
!515 = metadata !{i32 786689, metadata !4, metadata !"state", metadata !5, i32 67108967, metadata !8, i32 0, metadata !509} ; [ DW_TAG_arg_variable ] [state] [line 103]
!516 = metadata !{i32 103, i32 0, metadata !4, metadata !509}
!517 = metadata !{%struct.task* (%struct.packet*)* @idlefn}
!518 = metadata !{i32 786689, metadata !4, metadata !"fn", metadata !5, i32 83886184, metadata !21, i32 0, metadata !509} ; [ DW_TAG_arg_variable ] [fn] [line 104]
!519 = metadata !{i32 104, i32 0, metadata !4, metadata !509}
!520 = metadata !{i64 1}
!521 = metadata !{i32 786689, metadata !4, metadata !"v1", metadata !5, i32 100663401, metadata !34, i32 0, metadata !509} ; [ DW_TAG_arg_variable ] [v1] [line 105]
!522 = metadata !{i32 105, i32 0, metadata !4, metadata !509}
!523 = metadata !{i64 10000000}
!524 = metadata !{i32 786689, metadata !4, metadata !"v2", metadata !5, i32 117440618, metadata !34, i32 0, metadata !509} ; [ DW_TAG_arg_variable ] [v2] [line 106]
!525 = metadata !{i32 106, i32 0, metadata !4, metadata !509}
!526 = metadata !{i32 108, i32 0, metadata !4, metadata !509}
!527 = metadata !{i32 786688, metadata !4, metadata !"t", metadata !5, i32 108, metadata !24, i32 0, metadata !509} ; [ DW_TAG_auto_variable ] [t] [line 108]
!528 = metadata !{i32 110, i32 0, metadata !4, metadata !509}
!529 = metadata !{i32 111, i32 0, metadata !4, metadata !509}
!530 = metadata !{i32 112, i32 0, metadata !4, metadata !509}
!531 = metadata !{i32 113, i32 0, metadata !4, metadata !509}
!532 = metadata !{i32 116, i32 0, metadata !4, metadata !509}
!533 = metadata !{i32 114, i32 0, metadata !4, metadata !509}
!534 = metadata !{i32 117, i32 0, metadata !4, metadata !509}
!535 = metadata !{i32 118, i32 0, metadata !4, metadata !509}
!536 = metadata !{i32 786689, metadata !45, metadata !"link", metadata !5, i32 16777338, metadata !9, i32 0, metadata !537} ; [ DW_TAG_arg_variable ] [link] [line 122]
!537 = metadata !{i32 359, i32 0, metadata !112, null}
!538 = metadata !{i32 122, i32 0, metadata !45, metadata !537}
!539 = metadata !{i32 786689, metadata !45, metadata !"id", metadata !5, i32 33554554, metadata !8, i32 0, metadata !537} ; [ DW_TAG_arg_variable ] [id] [line 122]
!540 = metadata !{i32 1001}
!541 = metadata !{i32 786689, metadata !45, metadata !"kind", metadata !5, i32 50331770, metadata !8, i32 0, metadata !537} ; [ DW_TAG_arg_variable ] [kind] [line 122]
!542 = metadata !{i32 125, i32 0, metadata !45, metadata !537}
!543 = metadata !{i32 786688, metadata !45, metadata !"i", metadata !5, i32 124, metadata !8, i32 0, metadata !537} ; [ DW_TAG_auto_variable ] [i] [line 124]
!544 = metadata !{i32 127, i32 0, metadata !177, metadata !537}
!545 = metadata !{i32 128, i32 0, metadata !177, metadata !537}
!546 = metadata !{i32 130, i32 0, metadata !45, metadata !537}
!547 = metadata !{i32 131, i32 0, metadata !45, metadata !537}
!548 = metadata !{i32 132, i32 0, metadata !45, metadata !537}
!549 = metadata !{i32 133, i32 0, metadata !45, metadata !537}
!550 = metadata !{i32 786689, metadata !45, metadata !"link", metadata !5, i32 16777338, metadata !9, i32 0, metadata !551} ; [ DW_TAG_arg_variable ] [link] [line 122]
!551 = metadata !{i32 360, i32 0, metadata !112, null}
!552 = metadata !{i32 122, i32 0, metadata !45, metadata !551}
!553 = metadata !{i32 786689, metadata !45, metadata !"id", metadata !5, i32 33554554, metadata !8, i32 0, metadata !551} ; [ DW_TAG_arg_variable ] [id] [line 122]
!554 = metadata !{i32 786689, metadata !45, metadata !"kind", metadata !5, i32 50331770, metadata !8, i32 0, metadata !551} ; [ DW_TAG_arg_variable ] [kind] [line 122]
!555 = metadata !{i32 125, i32 0, metadata !45, metadata !551}
!556 = metadata !{i32 786688, metadata !45, metadata !"i", metadata !5, i32 124, metadata !8, i32 0, metadata !551} ; [ DW_TAG_auto_variable ] [i] [line 124]
!557 = metadata !{i32 127, i32 0, metadata !177, metadata !551}
!558 = metadata !{i32 128, i32 0, metadata !177, metadata !551}
!559 = metadata !{i32 130, i32 0, metadata !45, metadata !551}
!560 = metadata !{i32 131, i32 0, metadata !45, metadata !551}
!561 = metadata !{i32 132, i32 0, metadata !45, metadata !551}
!562 = metadata !{i32 133, i32 0, metadata !45, metadata !551}
!563 = metadata !{i32 2}
!564 = metadata !{i32 786689, metadata !4, metadata !"id", metadata !5, i32 16777316, metadata !8, i32 0, metadata !565} ; [ DW_TAG_arg_variable ] [id] [line 100]
!565 = metadata !{i32 362, i32 0, metadata !112, null}
!566 = metadata !{i32 100, i32 0, metadata !4, metadata !565}
!567 = metadata !{i32 1000}
!568 = metadata !{i32 786689, metadata !4, metadata !"pri", metadata !5, i32 33554533, metadata !8, i32 0, metadata !565} ; [ DW_TAG_arg_variable ] [pri] [line 101]
!569 = metadata !{i32 101, i32 0, metadata !4, metadata !565}
!570 = metadata !{i32 786689, metadata !4, metadata !"wkq", metadata !5, i32 50331750, metadata !9, i32 0, metadata !565} ; [ DW_TAG_arg_variable ] [wkq] [line 102]
!571 = metadata !{i32 102, i32 0, metadata !4, metadata !565}
!572 = metadata !{i32 3}
!573 = metadata !{i32 786689, metadata !4, metadata !"state", metadata !5, i32 67108967, metadata !8, i32 0, metadata !565} ; [ DW_TAG_arg_variable ] [state] [line 103]
!574 = metadata !{i32 103, i32 0, metadata !4, metadata !565}
!575 = metadata !{%struct.task* (%struct.packet*)* @workfn}
!576 = metadata !{i32 786689, metadata !4, metadata !"fn", metadata !5, i32 83886184, metadata !21, i32 0, metadata !565} ; [ DW_TAG_arg_variable ] [fn] [line 104]
!577 = metadata !{i32 104, i32 0, metadata !4, metadata !565}
!578 = metadata !{i64 3}
!579 = metadata !{i32 786689, metadata !4, metadata !"v1", metadata !5, i32 100663401, metadata !34, i32 0, metadata !565} ; [ DW_TAG_arg_variable ] [v1] [line 105]
!580 = metadata !{i32 105, i32 0, metadata !4, metadata !565}
!581 = metadata !{i64 0}
!582 = metadata !{i32 786689, metadata !4, metadata !"v2", metadata !5, i32 117440618, metadata !34, i32 0, metadata !565} ; [ DW_TAG_arg_variable ] [v2] [line 106]
!583 = metadata !{i32 106, i32 0, metadata !4, metadata !565}
!584 = metadata !{i32 108, i32 0, metadata !4, metadata !565}
!585 = metadata !{i32 786688, metadata !4, metadata !"t", metadata !5, i32 108, metadata !24, i32 0, metadata !565} ; [ DW_TAG_auto_variable ] [t] [line 108]
!586 = metadata !{i32 110, i32 0, metadata !4, metadata !565}
!587 = metadata !{i32 111, i32 0, metadata !4, metadata !565}
!588 = metadata !{i32 112, i32 0, metadata !4, metadata !565}
!589 = metadata !{i32 113, i32 0, metadata !4, metadata !565}
!590 = metadata !{i32 114, i32 0, metadata !4, metadata !565}
!591 = metadata !{i32 115, i32 0, metadata !4, metadata !565}
!592 = metadata !{i32 116, i32 0, metadata !4, metadata !565}
!593 = metadata !{i32 117, i32 0, metadata !4, metadata !565}
!594 = metadata !{i32 118, i32 0, metadata !4, metadata !565}
!595 = metadata !{i32 786689, metadata !45, metadata !"link", metadata !5, i32 16777338, metadata !9, i32 0, metadata !596} ; [ DW_TAG_arg_variable ] [link] [line 122]
!596 = metadata !{i32 364, i32 0, metadata !112, null}
!597 = metadata !{i32 122, i32 0, metadata !45, metadata !596}
!598 = metadata !{i32 786689, metadata !45, metadata !"id", metadata !5, i32 33554554, metadata !8, i32 0, metadata !596} ; [ DW_TAG_arg_variable ] [id] [line 122]
!599 = metadata !{i32 786689, metadata !45, metadata !"kind", metadata !5, i32 50331770, metadata !8, i32 0, metadata !596} ; [ DW_TAG_arg_variable ] [kind] [line 122]
!600 = metadata !{i32 125, i32 0, metadata !45, metadata !596}
!601 = metadata !{i32 786688, metadata !45, metadata !"i", metadata !5, i32 124, metadata !8, i32 0, metadata !596} ; [ DW_TAG_auto_variable ] [i] [line 124]
!602 = metadata !{i32 127, i32 0, metadata !177, metadata !596}
!603 = metadata !{i32 128, i32 0, metadata !177, metadata !596}
!604 = metadata !{i32 130, i32 0, metadata !45, metadata !596}
!605 = metadata !{i32 131, i32 0, metadata !45, metadata !596}
!606 = metadata !{i32 132, i32 0, metadata !45, metadata !596}
!607 = metadata !{i32 133, i32 0, metadata !45, metadata !596}
!608 = metadata !{i32 786689, metadata !45, metadata !"link", metadata !5, i32 16777338, metadata !9, i32 0, metadata !609} ; [ DW_TAG_arg_variable ] [link] [line 122]
!609 = metadata !{i32 365, i32 0, metadata !112, null}
!610 = metadata !{i32 122, i32 0, metadata !45, metadata !609}
!611 = metadata !{i32 786689, metadata !45, metadata !"id", metadata !5, i32 33554554, metadata !8, i32 0, metadata !609} ; [ DW_TAG_arg_variable ] [id] [line 122]
!612 = metadata !{i32 786689, metadata !45, metadata !"kind", metadata !5, i32 50331770, metadata !8, i32 0, metadata !609} ; [ DW_TAG_arg_variable ] [kind] [line 122]
!613 = metadata !{i32 125, i32 0, metadata !45, metadata !609}
!614 = metadata !{i32 786688, metadata !45, metadata !"i", metadata !5, i32 124, metadata !8, i32 0, metadata !609} ; [ DW_TAG_auto_variable ] [i] [line 124]
!615 = metadata !{i32 127, i32 0, metadata !177, metadata !609}
!616 = metadata !{i32 128, i32 0, metadata !177, metadata !609}
!617 = metadata !{i32 130, i32 0, metadata !45, metadata !609}
!618 = metadata !{i32 131, i32 0, metadata !45, metadata !609}
!619 = metadata !{i32 132, i32 0, metadata !45, metadata !609}
!620 = metadata !{i32 133, i32 0, metadata !45, metadata !609}
!621 = metadata !{i32 786689, metadata !45, metadata !"link", metadata !5, i32 16777338, metadata !9, i32 0, metadata !622} ; [ DW_TAG_arg_variable ] [link] [line 122]
!622 = metadata !{i32 366, i32 0, metadata !112, null}
!623 = metadata !{i32 122, i32 0, metadata !45, metadata !622}
!624 = metadata !{i32 786689, metadata !45, metadata !"id", metadata !5, i32 33554554, metadata !8, i32 0, metadata !622} ; [ DW_TAG_arg_variable ] [id] [line 122]
!625 = metadata !{i32 786689, metadata !45, metadata !"kind", metadata !5, i32 50331770, metadata !8, i32 0, metadata !622} ; [ DW_TAG_arg_variable ] [kind] [line 122]
!626 = metadata !{i32 125, i32 0, metadata !45, metadata !622}
!627 = metadata !{i32 786688, metadata !45, metadata !"i", metadata !5, i32 124, metadata !8, i32 0, metadata !622} ; [ DW_TAG_auto_variable ] [i] [line 124]
!628 = metadata !{i32 127, i32 0, metadata !177, metadata !622}
!629 = metadata !{i32 128, i32 0, metadata !177, metadata !622}
!630 = metadata !{i32 130, i32 0, metadata !45, metadata !622}
!631 = metadata !{i32 131, i32 0, metadata !45, metadata !622}
!632 = metadata !{i32 132, i32 0, metadata !45, metadata !622}
!633 = metadata !{i32 133, i32 0, metadata !45, metadata !622}
!634 = metadata !{i32 786689, metadata !4, metadata !"id", metadata !5, i32 16777316, metadata !8, i32 0, metadata !635} ; [ DW_TAG_arg_variable ] [id] [line 100]
!635 = metadata !{i32 368, i32 0, metadata !112, null}
!636 = metadata !{i32 100, i32 0, metadata !4, metadata !635}
!637 = metadata !{i32 2000}
!638 = metadata !{i32 786689, metadata !4, metadata !"pri", metadata !5, i32 33554533, metadata !8, i32 0, metadata !635} ; [ DW_TAG_arg_variable ] [pri] [line 101]
!639 = metadata !{i32 101, i32 0, metadata !4, metadata !635}
!640 = metadata !{i32 786689, metadata !4, metadata !"wkq", metadata !5, i32 50331750, metadata !9, i32 0, metadata !635} ; [ DW_TAG_arg_variable ] [wkq] [line 102]
!641 = metadata !{i32 102, i32 0, metadata !4, metadata !635}
!642 = metadata !{i32 786689, metadata !4, metadata !"state", metadata !5, i32 67108967, metadata !8, i32 0, metadata !635} ; [ DW_TAG_arg_variable ] [state] [line 103]
!643 = metadata !{i32 103, i32 0, metadata !4, metadata !635}
!644 = metadata !{%struct.task* (%struct.packet*)* @handlerfn}
!645 = metadata !{i32 786689, metadata !4, metadata !"fn", metadata !5, i32 83886184, metadata !21, i32 0, metadata !635} ; [ DW_TAG_arg_variable ] [fn] [line 104]
!646 = metadata !{i32 104, i32 0, metadata !4, metadata !635}
!647 = metadata !{i32 786689, metadata !4, metadata !"v1", metadata !5, i32 100663401, metadata !34, i32 0, metadata !635} ; [ DW_TAG_arg_variable ] [v1] [line 105]
!648 = metadata !{i32 105, i32 0, metadata !4, metadata !635}
!649 = metadata !{i32 786689, metadata !4, metadata !"v2", metadata !5, i32 117440618, metadata !34, i32 0, metadata !635} ; [ DW_TAG_arg_variable ] [v2] [line 106]
!650 = metadata !{i32 106, i32 0, metadata !4, metadata !635}
!651 = metadata !{i32 108, i32 0, metadata !4, metadata !635}
!652 = metadata !{i32 786688, metadata !4, metadata !"t", metadata !5, i32 108, metadata !24, i32 0, metadata !635} ; [ DW_TAG_auto_variable ] [t] [line 108]
!653 = metadata !{i32 110, i32 0, metadata !4, metadata !635}
!654 = metadata !{i32 111, i32 0, metadata !4, metadata !635}
!655 = metadata !{i32 112, i32 0, metadata !4, metadata !635}
!656 = metadata !{i32 113, i32 0, metadata !4, metadata !635}
!657 = metadata !{i32 114, i32 0, metadata !4, metadata !635}
!658 = metadata !{i32 115, i32 0, metadata !4, metadata !635}
!659 = metadata !{i32 116, i32 0, metadata !4, metadata !635}
!660 = metadata !{i32 117, i32 0, metadata !4, metadata !635}
!661 = metadata !{i32 118, i32 0, metadata !4, metadata !635}
!662 = metadata !{i32 786689, metadata !45, metadata !"link", metadata !5, i32 16777338, metadata !9, i32 0, metadata !663} ; [ DW_TAG_arg_variable ] [link] [line 122]
!663 = metadata !{i32 370, i32 0, metadata !112, null}
!664 = metadata !{i32 122, i32 0, metadata !45, metadata !663}
!665 = metadata !{i32 786689, metadata !45, metadata !"id", metadata !5, i32 33554554, metadata !8, i32 0, metadata !663} ; [ DW_TAG_arg_variable ] [id] [line 122]
!666 = metadata !{i32 786689, metadata !45, metadata !"kind", metadata !5, i32 50331770, metadata !8, i32 0, metadata !663} ; [ DW_TAG_arg_variable ] [kind] [line 122]
!667 = metadata !{i32 125, i32 0, metadata !45, metadata !663}
!668 = metadata !{i32 786688, metadata !45, metadata !"i", metadata !5, i32 124, metadata !8, i32 0, metadata !663} ; [ DW_TAG_auto_variable ] [i] [line 124]
!669 = metadata !{i32 127, i32 0, metadata !177, metadata !663}
!670 = metadata !{i32 128, i32 0, metadata !177, metadata !663}
!671 = metadata !{i32 130, i32 0, metadata !45, metadata !663}
!672 = metadata !{i32 131, i32 0, metadata !45, metadata !663}
!673 = metadata !{i32 132, i32 0, metadata !45, metadata !663}
!674 = metadata !{i32 133, i32 0, metadata !45, metadata !663}
!675 = metadata !{i32 786689, metadata !45, metadata !"link", metadata !5, i32 16777338, metadata !9, i32 0, metadata !676} ; [ DW_TAG_arg_variable ] [link] [line 122]
!676 = metadata !{i32 371, i32 0, metadata !112, null}
!677 = metadata !{i32 122, i32 0, metadata !45, metadata !676}
!678 = metadata !{i32 786689, metadata !45, metadata !"id", metadata !5, i32 33554554, metadata !8, i32 0, metadata !676} ; [ DW_TAG_arg_variable ] [id] [line 122]
!679 = metadata !{i32 786689, metadata !45, metadata !"kind", metadata !5, i32 50331770, metadata !8, i32 0, metadata !676} ; [ DW_TAG_arg_variable ] [kind] [line 122]
!680 = metadata !{i32 125, i32 0, metadata !45, metadata !676}
!681 = metadata !{i32 786688, metadata !45, metadata !"i", metadata !5, i32 124, metadata !8, i32 0, metadata !676} ; [ DW_TAG_auto_variable ] [i] [line 124]
!682 = metadata !{i32 127, i32 0, metadata !177, metadata !676}
!683 = metadata !{i32 128, i32 0, metadata !177, metadata !676}
!684 = metadata !{i32 130, i32 0, metadata !45, metadata !676}
!685 = metadata !{i32 131, i32 0, metadata !45, metadata !676}
!686 = metadata !{i32 132, i32 0, metadata !45, metadata !676}
!687 = metadata !{i32 133, i32 0, metadata !45, metadata !676}
!688 = metadata !{i32 786689, metadata !45, metadata !"link", metadata !5, i32 16777338, metadata !9, i32 0, metadata !689} ; [ DW_TAG_arg_variable ] [link] [line 122]
!689 = metadata !{i32 372, i32 0, metadata !112, null}
!690 = metadata !{i32 122, i32 0, metadata !45, metadata !689}
!691 = metadata !{i32 786689, metadata !45, metadata !"id", metadata !5, i32 33554554, metadata !8, i32 0, metadata !689} ; [ DW_TAG_arg_variable ] [id] [line 122]
!692 = metadata !{i32 786689, metadata !45, metadata !"kind", metadata !5, i32 50331770, metadata !8, i32 0, metadata !689} ; [ DW_TAG_arg_variable ] [kind] [line 122]
!693 = metadata !{i32 125, i32 0, metadata !45, metadata !689}
!694 = metadata !{i32 786688, metadata !45, metadata !"i", metadata !5, i32 124, metadata !8, i32 0, metadata !689} ; [ DW_TAG_auto_variable ] [i] [line 124]
!695 = metadata !{i32 127, i32 0, metadata !177, metadata !689}
!696 = metadata !{i32 128, i32 0, metadata !177, metadata !689}
!697 = metadata !{i32 130, i32 0, metadata !45, metadata !689}
!698 = metadata !{i32 131, i32 0, metadata !45, metadata !689}
!699 = metadata !{i32 132, i32 0, metadata !45, metadata !689}
!700 = metadata !{i32 133, i32 0, metadata !45, metadata !689}
!701 = metadata !{i32 4}
!702 = metadata !{i32 786689, metadata !4, metadata !"id", metadata !5, i32 16777316, metadata !8, i32 0, metadata !703} ; [ DW_TAG_arg_variable ] [id] [line 100]
!703 = metadata !{i32 374, i32 0, metadata !112, null}
!704 = metadata !{i32 100, i32 0, metadata !4, metadata !703}
!705 = metadata !{i32 3000}
!706 = metadata !{i32 786689, metadata !4, metadata !"pri", metadata !5, i32 33554533, metadata !8, i32 0, metadata !703} ; [ DW_TAG_arg_variable ] [pri] [line 101]
!707 = metadata !{i32 101, i32 0, metadata !4, metadata !703}
!708 = metadata !{i32 786689, metadata !4, metadata !"wkq", metadata !5, i32 50331750, metadata !9, i32 0, metadata !703} ; [ DW_TAG_arg_variable ] [wkq] [line 102]
!709 = metadata !{i32 102, i32 0, metadata !4, metadata !703}
!710 = metadata !{i32 786689, metadata !4, metadata !"state", metadata !5, i32 67108967, metadata !8, i32 0, metadata !703} ; [ DW_TAG_arg_variable ] [state] [line 103]
!711 = metadata !{i32 103, i32 0, metadata !4, metadata !703}
!712 = metadata !{i32 786689, metadata !4, metadata !"fn", metadata !5, i32 83886184, metadata !21, i32 0, metadata !703} ; [ DW_TAG_arg_variable ] [fn] [line 104]
!713 = metadata !{i32 104, i32 0, metadata !4, metadata !703}
!714 = metadata !{i32 786689, metadata !4, metadata !"v1", metadata !5, i32 100663401, metadata !34, i32 0, metadata !703} ; [ DW_TAG_arg_variable ] [v1] [line 105]
!715 = metadata !{i32 105, i32 0, metadata !4, metadata !703}
!716 = metadata !{i32 786689, metadata !4, metadata !"v2", metadata !5, i32 117440618, metadata !34, i32 0, metadata !703} ; [ DW_TAG_arg_variable ] [v2] [line 106]
!717 = metadata !{i32 106, i32 0, metadata !4, metadata !703}
!718 = metadata !{i32 108, i32 0, metadata !4, metadata !703}
!719 = metadata !{i32 786688, metadata !4, metadata !"t", metadata !5, i32 108, metadata !24, i32 0, metadata !703} ; [ DW_TAG_auto_variable ] [t] [line 108]
!720 = metadata !{i32 110, i32 0, metadata !4, metadata !703}
!721 = metadata !{i32 111, i32 0, metadata !4, metadata !703}
!722 = metadata !{i32 112, i32 0, metadata !4, metadata !703}
!723 = metadata !{i32 113, i32 0, metadata !4, metadata !703}
!724 = metadata !{i32 114, i32 0, metadata !4, metadata !703}
!725 = metadata !{i32 115, i32 0, metadata !4, metadata !703}
!726 = metadata !{i32 116, i32 0, metadata !4, metadata !703}
!727 = metadata !{i32 117, i32 0, metadata !4, metadata !703}
!728 = metadata !{i32 118, i32 0, metadata !4, metadata !703}
!729 = metadata !{i32 376, i32 0, metadata !112, null}
!730 = metadata !{i32 786689, metadata !4, metadata !"id", metadata !5, i32 16777316, metadata !8, i32 0, metadata !731} ; [ DW_TAG_arg_variable ] [id] [line 100]
!731 = metadata !{i32 377, i32 0, metadata !112, null}
!732 = metadata !{i32 100, i32 0, metadata !4, metadata !731}
!733 = metadata !{i32 4000}
!734 = metadata !{i32 786689, metadata !4, metadata !"pri", metadata !5, i32 33554533, metadata !8, i32 0, metadata !731} ; [ DW_TAG_arg_variable ] [pri] [line 101]
!735 = metadata !{i32 101, i32 0, metadata !4, metadata !731}
!736 = metadata !{i32 786689, metadata !4, metadata !"wkq", metadata !5, i32 50331750, metadata !9, i32 0, metadata !731} ; [ DW_TAG_arg_variable ] [wkq] [line 102]
!737 = metadata !{i32 102, i32 0, metadata !4, metadata !731}
!738 = metadata !{i32 786689, metadata !4, metadata !"state", metadata !5, i32 67108967, metadata !8, i32 0, metadata !731} ; [ DW_TAG_arg_variable ] [state] [line 103]
!739 = metadata !{i32 103, i32 0, metadata !4, metadata !731}
!740 = metadata !{%struct.task* (%struct.packet*)* @devfn}
!741 = metadata !{i32 786689, metadata !4, metadata !"fn", metadata !5, i32 83886184, metadata !21, i32 0, metadata !731} ; [ DW_TAG_arg_variable ] [fn] [line 104]
!742 = metadata !{i32 104, i32 0, metadata !4, metadata !731}
!743 = metadata !{i32 786689, metadata !4, metadata !"v1", metadata !5, i32 100663401, metadata !34, i32 0, metadata !731} ; [ DW_TAG_arg_variable ] [v1] [line 105]
!744 = metadata !{i32 105, i32 0, metadata !4, metadata !731}
!745 = metadata !{i32 786689, metadata !4, metadata !"v2", metadata !5, i32 117440618, metadata !34, i32 0, metadata !731} ; [ DW_TAG_arg_variable ] [v2] [line 106]
!746 = metadata !{i32 106, i32 0, metadata !4, metadata !731}
!747 = metadata !{i32 108, i32 0, metadata !4, metadata !731}
!748 = metadata !{i32 786688, metadata !4, metadata !"t", metadata !5, i32 108, metadata !24, i32 0, metadata !731} ; [ DW_TAG_auto_variable ] [t] [line 108]
!749 = metadata !{i32 110, i32 0, metadata !4, metadata !731}
!750 = metadata !{i32 111, i32 0, metadata !4, metadata !731}
!751 = metadata !{i32 112, i32 0, metadata !4, metadata !731}
!752 = metadata !{i32 113, i32 0, metadata !4, metadata !731}
!753 = metadata !{i32 114, i32 0, metadata !4, metadata !731}
!754 = metadata !{i32 115, i32 0, metadata !4, metadata !731}
!755 = metadata !{i32 116, i32 0, metadata !4, metadata !731}
!756 = metadata !{i32 117, i32 0, metadata !4, metadata !731}
!757 = metadata !{i32 118, i32 0, metadata !4, metadata !731}
!758 = metadata !{i32 786689, metadata !4, metadata !"id", metadata !5, i32 16777316, metadata !8, i32 0, metadata !759} ; [ DW_TAG_arg_variable ] [id] [line 100]
!759 = metadata !{i32 378, i32 0, metadata !112, null}
!760 = metadata !{i32 100, i32 0, metadata !4, metadata !759}
!761 = metadata !{i32 5000}
!762 = metadata !{i32 786689, metadata !4, metadata !"pri", metadata !5, i32 33554533, metadata !8, i32 0, metadata !759} ; [ DW_TAG_arg_variable ] [pri] [line 101]
!763 = metadata !{i32 101, i32 0, metadata !4, metadata !759}
!764 = metadata !{i32 786689, metadata !4, metadata !"wkq", metadata !5, i32 50331750, metadata !9, i32 0, metadata !759} ; [ DW_TAG_arg_variable ] [wkq] [line 102]
!765 = metadata !{i32 102, i32 0, metadata !4, metadata !759}
!766 = metadata !{i32 786689, metadata !4, metadata !"state", metadata !5, i32 67108967, metadata !8, i32 0, metadata !759} ; [ DW_TAG_arg_variable ] [state] [line 103]
!767 = metadata !{i32 103, i32 0, metadata !4, metadata !759}
!768 = metadata !{i32 786689, metadata !4, metadata !"fn", metadata !5, i32 83886184, metadata !21, i32 0, metadata !759} ; [ DW_TAG_arg_variable ] [fn] [line 104]
!769 = metadata !{i32 104, i32 0, metadata !4, metadata !759}
!770 = metadata !{i32 786689, metadata !4, metadata !"v1", metadata !5, i32 100663401, metadata !34, i32 0, metadata !759} ; [ DW_TAG_arg_variable ] [v1] [line 105]
!771 = metadata !{i32 105, i32 0, metadata !4, metadata !759}
!772 = metadata !{i32 786689, metadata !4, metadata !"v2", metadata !5, i32 117440618, metadata !34, i32 0, metadata !759} ; [ DW_TAG_arg_variable ] [v2] [line 106]
!773 = metadata !{i32 106, i32 0, metadata !4, metadata !759}
!774 = metadata !{i32 108, i32 0, metadata !4, metadata !759}
!775 = metadata !{i32 786688, metadata !4, metadata !"t", metadata !5, i32 108, metadata !24, i32 0, metadata !759} ; [ DW_TAG_auto_variable ] [t] [line 108]
!776 = metadata !{i32 110, i32 0, metadata !4, metadata !759}
!777 = metadata !{i32 111, i32 0, metadata !4, metadata !759}
!778 = metadata !{i32 112, i32 0, metadata !4, metadata !759}
!779 = metadata !{i32 113, i32 0, metadata !4, metadata !759}
!780 = metadata !{i32 114, i32 0, metadata !4, metadata !759}
!781 = metadata !{i32 115, i32 0, metadata !4, metadata !759}
!782 = metadata !{i32 116, i32 0, metadata !4, metadata !759}
!783 = metadata !{i32 117, i32 0, metadata !4, metadata !759}
!784 = metadata !{i32 118, i32 0, metadata !4, metadata !759}
!785 = metadata !{i32 119, i32 0, metadata !4, metadata !759}
!786 = metadata !{i32 380, i32 0, metadata !112, null}
!787 = metadata !{i32 382, i32 0, metadata !112, null}
!788 = metadata !{i32 384, i32 0, metadata !112, null}
!789 = metadata !{i32 386, i32 0, metadata !112, null}
!790 = metadata !{i32 387, i32 0, metadata !112, null}
!791 = metadata !{i32 389, i32 0, metadata !112, null}
!792 = metadata !{i32 391, i32 0, metadata !112, null}
!793 = metadata !{i32 393, i32 0, metadata !112, null}
!794 = metadata !{i32 396, i32 0, metadata !112, null}
!795 = metadata !{i32 397, i32 0, metadata !796, null}
!796 = metadata !{i32 786443, metadata !1, metadata !112, i32 397, i32 0, i32 36} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!797 = metadata !{i32 398, i32 0, metadata !798, null}
!798 = metadata !{i32 786443, metadata !1, metadata !796, i32 397, i32 0, i32 37} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!799 = metadata !{i32 399, i32 0, metadata !798, null}
!800 = metadata !{i32 400, i32 0, metadata !798, null}
!801 = metadata !{i32 401, i32 0, metadata !802, null}
!802 = metadata !{i32 786443, metadata !1, metadata !796, i32 400, i32 0, i32 38} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!803 = metadata !{i32 402, i32 0, metadata !802, null}
!804 = metadata !{i32 405, i32 0, metadata !112, null}
!805 = metadata !{i32 406, i32 0, metadata !112, null}
