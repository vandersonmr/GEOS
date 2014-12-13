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

; Function Attrs: nounwind optsize uwtable
define void @createtask(i32 %id, i32 %pri, %struct.packet* %wkq, i32 %state, %struct.task* (%struct.packet*)* %fn, i64 %v1, i64 %v2) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %id}, i64 0, metadata !37), !dbg !139
  tail call void @llvm.dbg.value(metadata !{i32 %pri}, i64 0, metadata !38), !dbg !140
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %wkq}, i64 0, metadata !39), !dbg !141
  tail call void @llvm.dbg.value(metadata !{i32 %state}, i64 0, metadata !40), !dbg !142
  tail call void @llvm.dbg.value(metadata !{%struct.task* (%struct.packet*)* %fn}, i64 0, metadata !41), !dbg !143
  tail call void @llvm.dbg.value(metadata !{i64 %v1}, i64 0, metadata !42), !dbg !144
  tail call void @llvm.dbg.value(metadata !{i64 %v2}, i64 0, metadata !43), !dbg !145
  %1 = tail call noalias i8* @malloc(i64 56) #4, !dbg !146
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

; Function Attrs: nounwind optsize
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind optsize uwtable
define noalias %struct.packet* @pkt(%struct.packet* %link, i32 %id, i32 %kind) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %link}, i64 0, metadata !49), !dbg !173
  tail call void @llvm.dbg.value(metadata !{i32 %id}, i64 0, metadata !50), !dbg !173
  tail call void @llvm.dbg.value(metadata !{i32 %kind}, i64 0, metadata !51), !dbg !173
  %1 = tail call noalias i8* @malloc(i64 24) #4, !dbg !174
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

; Function Attrs: nounwind optsize uwtable
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

; Function Attrs: nounwind optsize
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind optsize uwtable
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
    i32 2, label %39
    i32 4, label %39
    i32 5, label %39
    i32 6, label %39
    i32 7, label %39
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
  br i1 %25, label %26, label %29, !dbg !211

; <label>:26                                      ; preds = %15
  %27 = add nsw i64 %19, 48, !dbg !211
  %28 = trunc i64 %27 to i8, !dbg !211
  tail call void @trace(i8 signext %28) #5, !dbg !211
  %.pre = load %struct.task** @tcb, align 8, !dbg !213, !tbaa !148
  br label %29, !dbg !211

; <label>:29                                      ; preds = %26, %15
  %30 = phi %struct.task* [ %.pre, %26 ], [ %16, %15 ]
  %31 = getelementptr inbounds %struct.task* %30, i64 0, i32 5, !dbg !213
  %32 = load %struct.task* (%struct.packet*)** %31, align 8, !dbg !213, !tbaa !166
  %33 = tail call %struct.task* %32(%struct.packet* %pkt.0) #4, !dbg !213
  tail call void @llvm.dbg.value(metadata !{%struct.task* %33}, i64 0, metadata !65), !dbg !213
  %34 = load i64* @v1, align 8, !dbg !214, !tbaa !208
  %35 = load %struct.task** @tcb, align 8, !dbg !214, !tbaa !148
  %36 = getelementptr inbounds %struct.task* %35, i64 0, i32 6, !dbg !214
  store i64 %34, i64* %36, align 8, !dbg !214, !tbaa !168
  %37 = load i64* @v2, align 8, !dbg !215, !tbaa !208
  %38 = getelementptr inbounds %struct.task* %35, i64 0, i32 7, !dbg !215
  store i64 %37, i64* %38, align 8, !dbg !215, !tbaa !170
  br label %.backedge, !dbg !216

; <label>:39                                      ; preds = %.lr.ph, %.lr.ph, %.lr.ph, %.lr.ph, %.lr.ph
  %40 = getelementptr inbounds %struct.task* %2, i64 0, i32 0, !dbg !217
  %41 = load %struct.task** %40, align 8, !dbg !217, !tbaa !153
  br label %.backedge, !dbg !218

.backedge:                                        ; preds = %39, %29
  %storemerge = phi %struct.task* [ %41, %39 ], [ %33, %29 ]
  store %struct.task* %storemerge, %struct.task** @tcb, align 8, !dbg !219, !tbaa !148
  %42 = icmp eq %struct.task* %storemerge, null, !dbg !199
  br i1 %42, label %._crit_edge, label %.lr.ph, !dbg !199

._crit_edge:                                      ; preds = %.lr.ph, %.backedge, %0
  ret void, !dbg !220
}

; Function Attrs: nounwind optsize uwtable
define %struct.task* @Wait() #0 {
  %1 = load %struct.task** @tcb, align 8, !dbg !221, !tbaa !148
  %2 = getelementptr inbounds %struct.task* %1, i64 0, i32 4, !dbg !221
  %3 = load i32* %2, align 4, !dbg !221, !tbaa !164
  %4 = or i32 %3, 2, !dbg !221
  store i32 %4, i32* %2, align 4, !dbg !221, !tbaa !164
  ret %struct.task* %1, !dbg !222
}

; Function Attrs: nounwind optsize uwtable
define %struct.task* @holdself() #0 {
  %1 = load i32* @holdcount, align 4, !dbg !223, !tbaa !192
  %2 = add nsw i32 %1, 1, !dbg !223
  store i32 %2, i32* @holdcount, align 4, !dbg !223, !tbaa !192
  %3 = load %struct.task** @tcb, align 8, !dbg !224, !tbaa !148
  %4 = getelementptr inbounds %struct.task* %3, i64 0, i32 4, !dbg !224
  %5 = load i32* %4, align 4, !dbg !224, !tbaa !164
  %6 = or i32 %5, 4, !dbg !224
  store i32 %6, i32* %4, align 4, !dbg !224, !tbaa !164
  %7 = getelementptr inbounds %struct.task* %3, i64 0, i32 0, !dbg !225
  %8 = load %struct.task** %7, align 8, !dbg !225, !tbaa !153
  ret %struct.task* %8, !dbg !225
}

; Function Attrs: nounwind optsize uwtable
define %struct.task* @findtcb(i32 %id) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %id}, i64 0, metadata !74), !dbg !226
  tail call void @llvm.dbg.value(metadata !227, i64 0, metadata !75), !dbg !228
  %id.off = add i32 %id, -1, !dbg !229
  %1 = icmp ult i32 %id.off, 10, !dbg !229
  br i1 %1, label %2, label %.thread, !dbg !229

; <label>:2                                       ; preds = %0
  %3 = sext i32 %id to i64, !dbg !229
  %4 = getelementptr inbounds [11 x %struct.task*]* @tasktab, i64 0, i64 %3, !dbg !231
  %5 = load %struct.task** %4, align 8, !dbg !231, !tbaa !148
  tail call void @llvm.dbg.value(metadata !{%struct.task* %5}, i64 0, metadata !75), !dbg !231
  %6 = icmp eq %struct.task* %5, null, !dbg !232
  br i1 %6, label %.thread, label %8, !dbg !232

.thread:                                          ; preds = %0, %2
  %7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str2, i64 0, i64 0), i32 %id) #4, !dbg !232
  br label %8, !dbg !232

; <label>:8                                       ; preds = %.thread, %2
  %t.01 = phi %struct.task* [ null, %.thread ], [ %5, %2 ]
  ret %struct.task* %t.01, !dbg !234
}

; Function Attrs: nounwind optsize uwtable
define %struct.task* @release(i32 %id) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %id}, i64 0, metadata !78), !dbg !235
  %1 = tail call %struct.task* @findtcb(i32 %id) #5, !dbg !236
  tail call void @llvm.dbg.value(metadata !{%struct.task* %1}, i64 0, metadata !79), !dbg !236
  %2 = icmp eq %struct.task* %1, null, !dbg !237
  br i1 %2, label %13, label %3, !dbg !237

; <label>:3                                       ; preds = %0
  %4 = getelementptr inbounds %struct.task* %1, i64 0, i32 4, !dbg !239
  %5 = load i32* %4, align 4, !dbg !239, !tbaa !164
  %6 = and i32 %5, 65531, !dbg !239
  store i32 %6, i32* %4, align 4, !dbg !239, !tbaa !164
  %7 = getelementptr inbounds %struct.task* %1, i64 0, i32 2, !dbg !240
  %8 = load i32* %7, align 4, !dbg !240, !tbaa !160
  %9 = load %struct.task** @tcb, align 8, !dbg !240, !tbaa !148
  %10 = getelementptr inbounds %struct.task* %9, i64 0, i32 2, !dbg !240
  %11 = load i32* %10, align 4, !dbg !240, !tbaa !160
  %12 = icmp sgt i32 %8, %11, !dbg !240
  %. = select i1 %12, %struct.task* %1, %struct.task* %9, !dbg !240
  br label %13, !dbg !240

; <label>:13                                      ; preds = %3, %0
  %.0 = phi %struct.task* [ null, %0 ], [ %., %3 ]
  ret %struct.task* %.0, !dbg !242
}

; Function Attrs: nounwind optsize uwtable
define %struct.task* @qpkt(%struct.packet* %pkt) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %pkt}, i64 0, metadata !82), !dbg !243
  %1 = getelementptr inbounds %struct.packet* %pkt, i64 0, i32 1, !dbg !244
  %2 = load i32* %1, align 4, !dbg !244, !tbaa !183
  %3 = tail call %struct.task* @findtcb(i32 %2) #5, !dbg !244
  tail call void @llvm.dbg.value(metadata !{%struct.task* %3}, i64 0, metadata !83), !dbg !244
  %4 = icmp eq %struct.task* %3, null, !dbg !245
  br i1 %4, label %32, label %5, !dbg !245

; <label>:5                                       ; preds = %0
  %6 = load i32* @qpktcount, align 4, !dbg !247, !tbaa !192
  %7 = add nsw i32 %6, 1, !dbg !247
  store i32 %7, i32* @qpktcount, align 4, !dbg !247, !tbaa !192
  %8 = getelementptr inbounds %struct.packet* %pkt, i64 0, i32 0, !dbg !248
  store %struct.packet* null, %struct.packet** %8, align 8, !dbg !248, !tbaa !180
  %9 = load i64* @taskid, align 8, !dbg !249, !tbaa !208
  %10 = trunc i64 %9 to i32, !dbg !249
  store i32 %10, i32* %1, align 4, !dbg !249, !tbaa !183
  %11 = getelementptr inbounds %struct.task* %3, i64 0, i32 3, !dbg !250
  %12 = load %struct.packet** %11, align 8, !dbg !250, !tbaa !162
  %13 = icmp eq %struct.packet* %12, null, !dbg !250
  br i1 %13, label %14, label %24, !dbg !250

; <label>:14                                      ; preds = %5
  store %struct.packet* %pkt, %struct.packet** %11, align 8, !dbg !252, !tbaa !162
  %15 = getelementptr inbounds %struct.task* %3, i64 0, i32 4, !dbg !254
  %16 = load i32* %15, align 4, !dbg !254, !tbaa !164
  %17 = or i32 %16, 1, !dbg !254
  store i32 %17, i32* %15, align 4, !dbg !254, !tbaa !164
  %18 = getelementptr inbounds %struct.task* %3, i64 0, i32 2, !dbg !255
  %19 = load i32* %18, align 4, !dbg !255, !tbaa !160
  %20 = load %struct.task** @tcb, align 8, !dbg !255, !tbaa !148
  %21 = getelementptr inbounds %struct.task* %20, i64 0, i32 2, !dbg !255
  %22 = load i32* %21, align 4, !dbg !255, !tbaa !160
  %23 = icmp sgt i32 %19, %22, !dbg !255
  br i1 %23, label %32, label %30, !dbg !255

; <label>:24                                      ; preds = %5
  %25 = bitcast %struct.packet** %11 to %struct.packet*, !dbg !257
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %pkt}, i64 0, metadata !259), !dbg !260
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %25}, i64 0, metadata !261), !dbg !260
  store %struct.packet* null, %struct.packet** %8, align 8, !dbg !262, !tbaa !180
  br label %26, !dbg !263

; <label>:26                                      ; preds = %26, %24
  %.0.i = phi %struct.packet* [ %25, %24 ], [ %28, %26 ]
  %27 = getelementptr inbounds %struct.packet* %.0.i, i64 0, i32 0, !dbg !263
  %28 = load %struct.packet** %27, align 8, !dbg !263, !tbaa !180
  %29 = icmp eq %struct.packet* %28, null, !dbg !263
  br i1 %29, label %append.exit, label %26, !dbg !263

append.exit:                                      ; preds = %26
  store %struct.packet* %pkt, %struct.packet** %27, align 8, !dbg !264, !tbaa !180
  %.pre = load %struct.task** @tcb, align 8, !dbg !265, !tbaa !148
  br label %30

; <label>:30                                      ; preds = %14, %append.exit
  %31 = phi %struct.task* [ %20, %14 ], [ %.pre, %append.exit ]
  br label %32, !dbg !265

; <label>:32                                      ; preds = %14, %0, %30
  %.0 = phi %struct.task* [ %31, %30 ], [ null, %0 ], [ %3, %14 ]
  ret %struct.task* %.0, !dbg !266
}

; Function Attrs: nounwind optsize uwtable
define void @append(%struct.packet* %pkt, %struct.packet* nocapture %ptr) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %pkt}, i64 0, metadata !110), !dbg !267
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %ptr}, i64 0, metadata !111), !dbg !267
  %1 = getelementptr inbounds %struct.packet* %pkt, i64 0, i32 0, !dbg !268
  store %struct.packet* null, %struct.packet** %1, align 8, !dbg !268, !tbaa !180
  br label %2, !dbg !269

; <label>:2                                       ; preds = %2, %0
  %.0 = phi %struct.packet* [ %ptr, %0 ], [ %4, %2 ]
  %3 = getelementptr inbounds %struct.packet* %.0, i64 0, i32 0, !dbg !269
  %4 = load %struct.packet** %3, align 8, !dbg !269, !tbaa !180
  %5 = icmp eq %struct.packet* %4, null, !dbg !269
  br i1 %5, label %6, label %2, !dbg !269

; <label>:6                                       ; preds = %2
  store %struct.packet* %pkt, %struct.packet** %3, align 8, !dbg !270, !tbaa !180
  ret void, !dbg !271
}

; Function Attrs: nounwind optsize uwtable
define %struct.task* @idlefn(%struct.packet* nocapture readnone %pkt) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %pkt}, i64 0, metadata !86), !dbg !272
  %1 = load i64* @v2, align 8, !dbg !273, !tbaa !208
  %2 = add nsw i64 %1, -1, !dbg !273
  store i64 %2, i64* @v2, align 8, !dbg !273, !tbaa !208
  %3 = icmp eq i64 %2, 0, !dbg !274
  br i1 %3, label %4, label %13, !dbg !274

; <label>:4                                       ; preds = %0
  %5 = load i32* @holdcount, align 4, !dbg !276, !tbaa !192
  %6 = add nsw i32 %5, 1, !dbg !276
  store i32 %6, i32* @holdcount, align 4, !dbg !276, !tbaa !192
  %7 = load %struct.task** @tcb, align 8, !dbg !277, !tbaa !148
  %8 = getelementptr inbounds %struct.task* %7, i64 0, i32 4, !dbg !277
  %9 = load i32* %8, align 4, !dbg !277, !tbaa !164
  %10 = or i32 %9, 4, !dbg !277
  store i32 %10, i32* %8, align 4, !dbg !277, !tbaa !164
  %11 = getelementptr inbounds %struct.task* %7, i64 0, i32 0, !dbg !278
  %12 = load %struct.task** %11, align 8, !dbg !278, !tbaa !153
  br label %24, !dbg !274

; <label>:13                                      ; preds = %0
  %14 = load i64* @v1, align 8, !dbg !279, !tbaa !208
  %15 = and i64 %14, 1, !dbg !279
  %16 = icmp eq i64 %15, 0, !dbg !279
  %17 = lshr i64 %14, 1, !dbg !281
  %18 = and i64 %17, 32767, !dbg !281
  br i1 %16, label %19, label %21, !dbg !279

; <label>:19                                      ; preds = %13
  store i64 %18, i64* @v1, align 8, !dbg !281, !tbaa !208
  %20 = tail call %struct.task* @release(i32 5) #5, !dbg !283
  br label %24, !dbg !283

; <label>:21                                      ; preds = %13
  %22 = xor i64 %18, 53256, !dbg !284
  store i64 %22, i64* @v1, align 8, !dbg !284, !tbaa !208
  %23 = tail call %struct.task* @release(i32 6) #5, !dbg !286
  br label %24, !dbg !286

; <label>:24                                      ; preds = %21, %19, %4
  %.0 = phi %struct.task* [ %12, %4 ], [ %20, %19 ], [ %23, %21 ]
  ret %struct.task* %.0, !dbg !287
}

; Function Attrs: nounwind optsize uwtable
define %struct.task* @workfn(%struct.packet* %pkt) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %pkt}, i64 0, metadata !89), !dbg !288
  %1 = icmp eq %struct.packet* %pkt, null, !dbg !289
  br i1 %1, label %2, label %7, !dbg !289

; <label>:2                                       ; preds = %0
  %3 = load %struct.task** @tcb, align 8, !dbg !290, !tbaa !148
  %4 = getelementptr inbounds %struct.task* %3, i64 0, i32 4, !dbg !290
  %5 = load i32* %4, align 4, !dbg !290, !tbaa !164
  %6 = or i32 %5, 2, !dbg !290
  store i32 %6, i32* %4, align 4, !dbg !290, !tbaa !164
  br label %22, !dbg !289

; <label>:7                                       ; preds = %0
  %8 = load i64* @v1, align 8, !dbg !291, !tbaa !208
  %9 = sub nsw i64 7, %8, !dbg !291
  store i64 %9, i64* @v1, align 8, !dbg !291, !tbaa !208
  %10 = trunc i64 %9 to i32, !dbg !292
  %11 = getelementptr inbounds %struct.packet* %pkt, i64 0, i32 1, !dbg !292
  store i32 %10, i32* %11, align 4, !dbg !292, !tbaa !183
  %12 = getelementptr inbounds %struct.packet* %pkt, i64 0, i32 3, !dbg !293
  store i32 0, i32* %12, align 4, !dbg !293, !tbaa !187
  tail call void @llvm.dbg.value(metadata !175, i64 0, metadata !90), !dbg !294
  br label %13, !dbg !294

; <label>:13                                      ; preds = %13, %7
  %indvars.iv = phi i64 [ 0, %7 ], [ %indvars.iv.next, %13 ]
  %14 = load i64* @v2, align 8, !dbg !296, !tbaa !208
  %15 = add nsw i64 %14, 1, !dbg !296
  %16 = icmp sgt i64 %14, 25, !dbg !298
  %. = select i1 %16, i64 1, i64 %15, !dbg !298
  store i64 %., i64* @v2, align 8, !dbg !298, !tbaa !208
  %17 = getelementptr inbounds [28 x i8]* @alphabet, i64 0, i64 %., !dbg !300
  %18 = load i8* %17, align 1, !dbg !300, !tbaa !301
  %19 = getelementptr inbounds %struct.packet* %pkt, i64 0, i32 4, i64 %indvars.iv, !dbg !300
  store i8 %18, i8* %19, align 1, !dbg !300, !tbaa !301
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !294
  %exitcond = icmp eq i64 %indvars.iv.next, 4, !dbg !294
  br i1 %exitcond, label %20, label %13, !dbg !294

; <label>:20                                      ; preds = %13
  %21 = tail call %struct.task* @qpkt(%struct.packet* %pkt) #5, !dbg !302
  br label %22, !dbg !302

; <label>:22                                      ; preds = %20, %2
  %.0 = phi %struct.task* [ %3, %2 ], [ %21, %20 ]
  ret %struct.task* %.0, !dbg !303
}

; Function Attrs: nounwind optsize uwtable
define %struct.task* @handlerfn(%struct.packet* %pkt) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %pkt}, i64 0, metadata !95), !dbg !304
  %1 = icmp eq %struct.packet* %pkt, null, !dbg !305
  br i1 %1, label %12, label %2, !dbg !305

; <label>:2                                       ; preds = %0
  %3 = getelementptr inbounds %struct.packet* %pkt, i64 0, i32 2, !dbg !305
  %4 = load i32* %3, align 4, !dbg !305, !tbaa !185
  %5 = icmp eq i32 %4, 1001, !dbg !305
  %6 = select i1 %5, %struct.packet* bitcast (i64* @v1 to %struct.packet*), %struct.packet* bitcast (i64* @v2 to %struct.packet*), !dbg !305
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %pkt}, i64 0, metadata !307), !dbg !308
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %6}, i64 0, metadata !309), !dbg !308
  %7 = getelementptr inbounds %struct.packet* %pkt, i64 0, i32 0, !dbg !310
  store %struct.packet* null, %struct.packet** %7, align 8, !dbg !310, !tbaa !180
  br label %8, !dbg !311

; <label>:8                                       ; preds = %8, %2
  %.0.i = phi %struct.packet* [ %6, %2 ], [ %10, %8 ]
  %9 = getelementptr inbounds %struct.packet* %.0.i, i64 0, i32 0, !dbg !311
  %10 = load %struct.packet** %9, align 8, !dbg !311, !tbaa !180
  %11 = icmp eq %struct.packet* %10, null, !dbg !311
  br i1 %11, label %append.exit, label %8, !dbg !311

append.exit:                                      ; preds = %8
  store %struct.packet* %pkt, %struct.packet** %9, align 8, !dbg !312, !tbaa !180
  br label %12, !dbg !305

; <label>:12                                      ; preds = %0, %append.exit
  %13 = load i64* @v1, align 8, !dbg !313, !tbaa !208
  %14 = icmp eq i64 %13, 0, !dbg !313
  br i1 %14, label %40, label %15, !dbg !313

; <label>:15                                      ; preds = %12
  %16 = inttoptr i64 %13 to %struct.packet*, !dbg !314
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %16}, i64 0, metadata !99), !dbg !314
  %17 = getelementptr inbounds %struct.packet* %16, i64 0, i32 3, !dbg !315
  %18 = load i32* %17, align 4, !dbg !315, !tbaa !187
  tail call void @llvm.dbg.value(metadata !{i32 %18}, i64 0, metadata !96), !dbg !315
  %19 = icmp sgt i32 %18, 3, !dbg !316
  br i1 %19, label %20, label %25, !dbg !316

; <label>:20                                      ; preds = %15
  %21 = getelementptr inbounds %struct.packet* %16, i64 0, i32 0, !dbg !318
  %22 = load %struct.packet** %21, align 8, !dbg !318, !tbaa !180
  %23 = ptrtoint %struct.packet* %22 to i64, !dbg !318
  store i64 %23, i64* @v1, align 8, !dbg !318, !tbaa !208
  %24 = tail call %struct.task* @qpkt(%struct.packet* %16) #5, !dbg !320
  br label %45, !dbg !320

; <label>:25                                      ; preds = %15
  %26 = load i64* @v2, align 8, !dbg !321, !tbaa !208
  %27 = icmp eq i64 %26, 0, !dbg !321
  br i1 %27, label %40, label %28, !dbg !321

; <label>:28                                      ; preds = %25
  %29 = inttoptr i64 %26 to %struct.packet*, !dbg !322
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %29}, i64 0, metadata !100), !dbg !322
  %30 = getelementptr inbounds %struct.packet* %29, i64 0, i32 0, !dbg !323
  %31 = load %struct.packet** %30, align 8, !dbg !323, !tbaa !180
  %32 = ptrtoint %struct.packet* %31 to i64, !dbg !323
  store i64 %32, i64* @v2, align 8, !dbg !323, !tbaa !208
  %33 = sext i32 %18 to i64, !dbg !324
  %34 = getelementptr inbounds %struct.packet* %16, i64 0, i32 4, i64 %33, !dbg !324
  %35 = load i8* %34, align 1, !dbg !324, !tbaa !301
  %36 = sext i8 %35 to i32, !dbg !324
  %37 = getelementptr inbounds %struct.packet* %29, i64 0, i32 3, !dbg !324
  store i32 %36, i32* %37, align 4, !dbg !324, !tbaa !187
  %38 = add nsw i32 %18, 1, !dbg !325
  store i32 %38, i32* %17, align 4, !dbg !325, !tbaa !187
  %39 = tail call %struct.task* @qpkt(%struct.packet* %29) #5, !dbg !326
  br label %45, !dbg !326

; <label>:40                                      ; preds = %25, %12
  %41 = load %struct.task** @tcb, align 8, !dbg !327, !tbaa !148
  %42 = getelementptr inbounds %struct.task* %41, i64 0, i32 4, !dbg !327
  %43 = load i32* %42, align 4, !dbg !327, !tbaa !164
  %44 = or i32 %43, 2, !dbg !327
  store i32 %44, i32* %42, align 4, !dbg !327, !tbaa !164
  br label %45, !dbg !328

; <label>:45                                      ; preds = %40, %28, %20
  %.0 = phi %struct.task* [ %24, %20 ], [ %39, %28 ], [ %41, %40 ]
  ret %struct.task* %.0, !dbg !329
}

; Function Attrs: nounwind optsize uwtable
define %struct.task* @devfn(%struct.packet* %pkt) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %pkt}, i64 0, metadata !105), !dbg !330
  %1 = icmp eq %struct.packet* %pkt, null, !dbg !331
  br i1 %1, label %2, label %13, !dbg !331

; <label>:2                                       ; preds = %0
  %3 = load i64* @v1, align 8, !dbg !333, !tbaa !208
  %4 = icmp eq i64 %3, 0, !dbg !333
  br i1 %4, label %5, label %10, !dbg !333

; <label>:5                                       ; preds = %2
  %6 = load %struct.task** @tcb, align 8, !dbg !336, !tbaa !148
  %7 = getelementptr inbounds %struct.task* %6, i64 0, i32 4, !dbg !336
  %8 = load i32* %7, align 4, !dbg !336, !tbaa !164
  %9 = or i32 %8, 2, !dbg !336
  store i32 %9, i32* %7, align 4, !dbg !336, !tbaa !164
  br label %30, !dbg !333

; <label>:10                                      ; preds = %2
  %11 = inttoptr i64 %3 to %struct.packet*, !dbg !337
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %11}, i64 0, metadata !105), !dbg !337
  store i64 0, i64* @v1, align 8, !dbg !338, !tbaa !208
  %12 = tail call %struct.task* @qpkt(%struct.packet* %11) #5, !dbg !339
  br label %30, !dbg !339

; <label>:13                                      ; preds = %0
  %14 = ptrtoint %struct.packet* %pkt to i64, !dbg !340
  store i64 %14, i64* @v1, align 8, !dbg !340, !tbaa !208
  %15 = load i32* @tracing, align 4, !dbg !342, !tbaa !192
  %16 = icmp eq i32 %15, 1, !dbg !342
  br i1 %16, label %17, label %21, !dbg !342

; <label>:17                                      ; preds = %13
  %18 = getelementptr inbounds %struct.packet* %pkt, i64 0, i32 3, !dbg !342
  %19 = load i32* %18, align 4, !dbg !342, !tbaa !187
  %20 = trunc i32 %19 to i8, !dbg !342
  tail call void @trace(i8 signext %20) #5, !dbg !342
  br label %21, !dbg !342

; <label>:21                                      ; preds = %17, %13
  %22 = load i32* @holdcount, align 4, !dbg !344, !tbaa !192
  %23 = add nsw i32 %22, 1, !dbg !344
  store i32 %23, i32* @holdcount, align 4, !dbg !344, !tbaa !192
  %24 = load %struct.task** @tcb, align 8, !dbg !346, !tbaa !148
  %25 = getelementptr inbounds %struct.task* %24, i64 0, i32 4, !dbg !346
  %26 = load i32* %25, align 4, !dbg !346, !tbaa !164
  %27 = or i32 %26, 4, !dbg !346
  store i32 %27, i32* %25, align 4, !dbg !346, !tbaa !164
  %28 = getelementptr inbounds %struct.task* %24, i64 0, i32 0, !dbg !347
  %29 = load %struct.task** %28, align 8, !dbg !347, !tbaa !153
  br label %30, !dbg !345

; <label>:30                                      ; preds = %21, %10, %5
  %.0 = phi %struct.task* [ %6, %5 ], [ %12, %10 ], [ %29, %21 ]
  ret %struct.task* %.0, !dbg !348
}

; Function Attrs: nounwind optsize uwtable
define i32 @main() #0 {
  tail call void @llvm.dbg.value(metadata !200, i64 0, metadata !116), !dbg !349
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([20 x i8]* @str, i64 0, i64 0)), !dbg !350
  tail call void @llvm.dbg.value(metadata !351, i64 0, metadata !352) #3, !dbg !354
  tail call void @llvm.dbg.value(metadata !175, i64 0, metadata !355) #3, !dbg !356
  tail call void @llvm.dbg.value(metadata !200, i64 0, metadata !357) #3, !dbg !358
  tail call void @llvm.dbg.value(metadata !175, i64 0, metadata !359) #3, !dbg !360
  tail call void @llvm.dbg.value(metadata !361, i64 0, metadata !362) #3, !dbg !363
  tail call void @llvm.dbg.value(metadata !364, i64 0, metadata !365) #3, !dbg !366
  tail call void @llvm.dbg.value(metadata !367, i64 0, metadata !368) #3, !dbg !369
  %1 = tail call noalias i8* @malloc(i64 56) #4, !dbg !370
  %2 = bitcast i8* %1 to %struct.task*, !dbg !370
  tail call void @llvm.dbg.value(metadata !{%struct.task* %2}, i64 0, metadata !371) #3, !dbg !370
  store %struct.task* %2, %struct.task** getelementptr inbounds ([11 x %struct.task*]* @tasktab, i64 0, i64 1), align 8, !dbg !372, !tbaa !148
  %3 = load %struct.task** @tasklist, align 8, !dbg !373, !tbaa !148
  %4 = bitcast i8* %1 to %struct.task**, !dbg !373
  store %struct.task* %3, %struct.task** %4, align 8, !dbg !373, !tbaa !153
  %5 = getelementptr inbounds i8* %1, i64 8, !dbg !374
  %6 = bitcast i8* %5 to i32*, !dbg !374
  store i32 1, i32* %6, align 4, !dbg !374, !tbaa !158
  %7 = getelementptr inbounds i8* %1, i64 12, !dbg !375
  %8 = getelementptr inbounds i8* %1, i64 32, !dbg !376
  %9 = bitcast i8* %8 to %struct.task* (%struct.packet*)**, !dbg !376
  call void @llvm.memset.p0i8.i64(i8* %7, i8 0, i64 16, i32 4, i1 false), !dbg !377
  store %struct.task* (%struct.packet*)* @idlefn, %struct.task* (%struct.packet*)** %9, align 8, !dbg !376, !tbaa !166
  %10 = getelementptr inbounds i8* %1, i64 40, !dbg !378
  %11 = bitcast i8* %10 to i64*, !dbg !378
  store i64 1, i64* %11, align 8, !dbg !378, !tbaa !168
  %12 = getelementptr inbounds i8* %1, i64 48, !dbg !379
  %13 = bitcast i8* %12 to i64*, !dbg !379
  store i64 10000000, i64* %13, align 8, !dbg !379, !tbaa !170
  tail call void @llvm.dbg.value(metadata !200, i64 0, metadata !380) #3, !dbg !382
  tail call void @llvm.dbg.value(metadata !175, i64 0, metadata !383) #3, !dbg !382
  tail call void @llvm.dbg.value(metadata !384, i64 0, metadata !385) #3, !dbg !382
  %14 = tail call noalias i8* @malloc(i64 24) #4, !dbg !386
  tail call void @llvm.dbg.value(metadata !175, i64 0, metadata !387) #3, !dbg !388
  %scevgep.i = getelementptr i8* %14, i64 20
  %15 = bitcast i8* %scevgep.i to i32*, !dbg !389
  store i32 0, i32* %15, align 1, !dbg !389
  %16 = bitcast i8* %14 to %struct.packet*, !dbg !386
  %17 = bitcast i8* %14 to %struct.packet**, !dbg !390
  store %struct.packet* null, %struct.packet** %17, align 8, !dbg !390, !tbaa !180
  %18 = getelementptr inbounds i8* %14, i64 8, !dbg !391
  %19 = bitcast i8* %18 to i32*, !dbg !391
  store i32 0, i32* %19, align 4, !dbg !391, !tbaa !183
  %20 = getelementptr inbounds i8* %14, i64 12, !dbg !392
  %21 = bitcast i8* %20 to i32*, !dbg !392
  store i32 1001, i32* %21, align 4, !dbg !392, !tbaa !185
  %22 = getelementptr inbounds i8* %14, i64 16, !dbg !393
  %23 = bitcast i8* %22 to i32*, !dbg !393
  store i32 0, i32* %23, align 4, !dbg !393, !tbaa !187
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %16}, i64 0, metadata !116), !dbg !381
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %16}, i64 0, metadata !394) #3, !dbg !396
  tail call void @llvm.dbg.value(metadata !175, i64 0, metadata !397) #3, !dbg !396
  tail call void @llvm.dbg.value(metadata !384, i64 0, metadata !398) #3, !dbg !396
  %24 = tail call noalias i8* @malloc(i64 24) #4, !dbg !399
  tail call void @llvm.dbg.value(metadata !175, i64 0, metadata !400) #3, !dbg !401
  %scevgep.i5 = getelementptr i8* %24, i64 20
  %25 = bitcast i8* %scevgep.i5 to i32*, !dbg !402
  store i32 0, i32* %25, align 1, !dbg !402
  %26 = bitcast i8* %24 to %struct.packet*, !dbg !399
  %27 = bitcast i8* %24 to %struct.packet**, !dbg !403
  store %struct.packet* %16, %struct.packet** %27, align 8, !dbg !403, !tbaa !180
  %28 = getelementptr inbounds i8* %24, i64 8, !dbg !404
  %29 = bitcast i8* %28 to i32*, !dbg !404
  store i32 0, i32* %29, align 4, !dbg !404, !tbaa !183
  %30 = getelementptr inbounds i8* %24, i64 12, !dbg !405
  %31 = bitcast i8* %30 to i32*, !dbg !405
  store i32 1001, i32* %31, align 4, !dbg !405, !tbaa !185
  %32 = getelementptr inbounds i8* %24, i64 16, !dbg !406
  %33 = bitcast i8* %32 to i32*, !dbg !406
  store i32 0, i32* %33, align 4, !dbg !406, !tbaa !187
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %26}, i64 0, metadata !116), !dbg !395
  tail call void @llvm.dbg.value(metadata !407, i64 0, metadata !408) #3, !dbg !410
  tail call void @llvm.dbg.value(metadata !411, i64 0, metadata !412) #3, !dbg !413
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %26}, i64 0, metadata !414) #3, !dbg !415
  tail call void @llvm.dbg.value(metadata !416, i64 0, metadata !417) #3, !dbg !418
  tail call void @llvm.dbg.value(metadata !419, i64 0, metadata !420) #3, !dbg !421
  tail call void @llvm.dbg.value(metadata !422, i64 0, metadata !423) #3, !dbg !424
  tail call void @llvm.dbg.value(metadata !425, i64 0, metadata !426) #3, !dbg !427
  %34 = tail call noalias i8* @malloc(i64 56) #4, !dbg !428
  %35 = bitcast i8* %34 to %struct.task*, !dbg !428
  tail call void @llvm.dbg.value(metadata !{%struct.task* %35}, i64 0, metadata !429) #3, !dbg !428
  store %struct.task* %35, %struct.task** getelementptr inbounds ([11 x %struct.task*]* @tasktab, i64 0, i64 2), align 16, !dbg !430, !tbaa !148
  %36 = bitcast i8* %34 to %struct.task**, !dbg !431
  store %struct.task* %2, %struct.task** %36, align 8, !dbg !431, !tbaa !153
  %37 = getelementptr inbounds i8* %34, i64 8, !dbg !432
  %38 = bitcast i8* %37 to i32*, !dbg !432
  store i32 2, i32* %38, align 4, !dbg !432, !tbaa !158
  %39 = getelementptr inbounds i8* %34, i64 12, !dbg !433
  %40 = bitcast i8* %39 to i32*, !dbg !433
  store i32 1000, i32* %40, align 4, !dbg !433, !tbaa !160
  %41 = getelementptr inbounds i8* %34, i64 16, !dbg !434
  %42 = bitcast i8* %41 to %struct.packet**, !dbg !434
  store %struct.packet* %26, %struct.packet** %42, align 8, !dbg !434, !tbaa !162
  %43 = getelementptr inbounds i8* %34, i64 24, !dbg !435
  %44 = bitcast i8* %43 to i32*, !dbg !435
  store i32 3, i32* %44, align 4, !dbg !435, !tbaa !164
  %45 = getelementptr inbounds i8* %34, i64 32, !dbg !436
  %46 = bitcast i8* %45 to %struct.task* (%struct.packet*)**, !dbg !436
  store %struct.task* (%struct.packet*)* @workfn, %struct.task* (%struct.packet*)** %46, align 8, !dbg !436, !tbaa !166
  %47 = getelementptr inbounds i8* %34, i64 40, !dbg !437
  %48 = bitcast i8* %47 to i64*, !dbg !437
  store i64 3, i64* %48, align 8, !dbg !437, !tbaa !168
  %49 = getelementptr inbounds i8* %34, i64 48, !dbg !438
  %50 = bitcast i8* %49 to i64*, !dbg !438
  store i64 0, i64* %50, align 8, !dbg !438, !tbaa !170
  tail call void @llvm.dbg.value(metadata !200, i64 0, metadata !439) #3, !dbg !441
  tail call void @llvm.dbg.value(metadata !442, i64 0, metadata !443) #3, !dbg !441
  tail call void @llvm.dbg.value(metadata !411, i64 0, metadata !444) #3, !dbg !441
  %51 = tail call noalias i8* @malloc(i64 24) #4, !dbg !445
  tail call void @llvm.dbg.value(metadata !175, i64 0, metadata !446) #3, !dbg !447
  %scevgep.i6 = getelementptr i8* %51, i64 20
  %52 = bitcast i8* %scevgep.i6 to i32*, !dbg !448
  store i32 0, i32* %52, align 1, !dbg !448
  %53 = bitcast i8* %51 to %struct.packet*, !dbg !445
  %54 = bitcast i8* %51 to %struct.packet**, !dbg !449
  store %struct.packet* null, %struct.packet** %54, align 8, !dbg !449, !tbaa !180
  %55 = getelementptr inbounds i8* %51, i64 8, !dbg !450
  %56 = bitcast i8* %55 to i32*, !dbg !450
  store i32 5, i32* %56, align 4, !dbg !450, !tbaa !183
  %57 = getelementptr inbounds i8* %51, i64 12, !dbg !451
  %58 = bitcast i8* %57 to i32*, !dbg !451
  store i32 1000, i32* %58, align 4, !dbg !451, !tbaa !185
  %59 = getelementptr inbounds i8* %51, i64 16, !dbg !452
  %60 = bitcast i8* %59 to i32*, !dbg !452
  store i32 0, i32* %60, align 4, !dbg !452, !tbaa !187
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %53}, i64 0, metadata !116), !dbg !440
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %53}, i64 0, metadata !453) #3, !dbg !455
  tail call void @llvm.dbg.value(metadata !442, i64 0, metadata !456) #3, !dbg !455
  tail call void @llvm.dbg.value(metadata !411, i64 0, metadata !457) #3, !dbg !455
  %61 = tail call noalias i8* @malloc(i64 24) #4, !dbg !458
  tail call void @llvm.dbg.value(metadata !175, i64 0, metadata !459) #3, !dbg !460
  %scevgep.i7 = getelementptr i8* %61, i64 20
  %62 = bitcast i8* %scevgep.i7 to i32*, !dbg !461
  store i32 0, i32* %62, align 1, !dbg !461
  %63 = bitcast i8* %61 to %struct.packet*, !dbg !458
  %64 = bitcast i8* %61 to %struct.packet**, !dbg !462
  store %struct.packet* %53, %struct.packet** %64, align 8, !dbg !462, !tbaa !180
  %65 = getelementptr inbounds i8* %61, i64 8, !dbg !463
  %66 = bitcast i8* %65 to i32*, !dbg !463
  store i32 5, i32* %66, align 4, !dbg !463, !tbaa !183
  %67 = getelementptr inbounds i8* %61, i64 12, !dbg !464
  %68 = bitcast i8* %67 to i32*, !dbg !464
  store i32 1000, i32* %68, align 4, !dbg !464, !tbaa !185
  %69 = getelementptr inbounds i8* %61, i64 16, !dbg !465
  %70 = bitcast i8* %69 to i32*, !dbg !465
  store i32 0, i32* %70, align 4, !dbg !465, !tbaa !187
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %63}, i64 0, metadata !116), !dbg !454
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %63}, i64 0, metadata !466) #3, !dbg !468
  tail call void @llvm.dbg.value(metadata !442, i64 0, metadata !469) #3, !dbg !468
  tail call void @llvm.dbg.value(metadata !411, i64 0, metadata !470) #3, !dbg !468
  %71 = tail call noalias i8* @malloc(i64 24) #4, !dbg !471
  tail call void @llvm.dbg.value(metadata !175, i64 0, metadata !472) #3, !dbg !473
  %scevgep.i8 = getelementptr i8* %71, i64 20
  %72 = bitcast i8* %scevgep.i8 to i32*, !dbg !474
  store i32 0, i32* %72, align 1, !dbg !474
  %73 = bitcast i8* %71 to %struct.packet*, !dbg !471
  %74 = bitcast i8* %71 to %struct.packet**, !dbg !475
  store %struct.packet* %63, %struct.packet** %74, align 8, !dbg !475, !tbaa !180
  %75 = getelementptr inbounds i8* %71, i64 8, !dbg !476
  %76 = bitcast i8* %75 to i32*, !dbg !476
  store i32 5, i32* %76, align 4, !dbg !476, !tbaa !183
  %77 = getelementptr inbounds i8* %71, i64 12, !dbg !477
  %78 = bitcast i8* %77 to i32*, !dbg !477
  store i32 1000, i32* %78, align 4, !dbg !477, !tbaa !185
  %79 = getelementptr inbounds i8* %71, i64 16, !dbg !478
  %80 = bitcast i8* %79 to i32*, !dbg !478
  store i32 0, i32* %80, align 4, !dbg !478, !tbaa !187
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %73}, i64 0, metadata !116), !dbg !467
  tail call void @llvm.dbg.value(metadata !416, i64 0, metadata !479) #3, !dbg !481
  tail call void @llvm.dbg.value(metadata !482, i64 0, metadata !483) #3, !dbg !484
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %73}, i64 0, metadata !485) #3, !dbg !486
  tail call void @llvm.dbg.value(metadata !416, i64 0, metadata !487) #3, !dbg !488
  tail call void @llvm.dbg.value(metadata !489, i64 0, metadata !490) #3, !dbg !491
  tail call void @llvm.dbg.value(metadata !425, i64 0, metadata !492) #3, !dbg !493
  tail call void @llvm.dbg.value(metadata !425, i64 0, metadata !494) #3, !dbg !495
  %81 = tail call noalias i8* @malloc(i64 56) #4, !dbg !496
  %82 = bitcast i8* %81 to %struct.task*, !dbg !496
  tail call void @llvm.dbg.value(metadata !{%struct.task* %82}, i64 0, metadata !497) #3, !dbg !496
  store %struct.task* %82, %struct.task** getelementptr inbounds ([11 x %struct.task*]* @tasktab, i64 0, i64 3), align 8, !dbg !498, !tbaa !148
  %83 = bitcast i8* %81 to %struct.task**, !dbg !499
  store %struct.task* %35, %struct.task** %83, align 8, !dbg !499, !tbaa !153
  %84 = getelementptr inbounds i8* %81, i64 8, !dbg !500
  %85 = bitcast i8* %84 to i32*, !dbg !500
  store i32 3, i32* %85, align 4, !dbg !500, !tbaa !158
  %86 = getelementptr inbounds i8* %81, i64 12, !dbg !501
  %87 = bitcast i8* %86 to i32*, !dbg !501
  store i32 2000, i32* %87, align 4, !dbg !501, !tbaa !160
  %88 = getelementptr inbounds i8* %81, i64 16, !dbg !502
  %89 = bitcast i8* %88 to %struct.packet**, !dbg !502
  store %struct.packet* %73, %struct.packet** %89, align 8, !dbg !502, !tbaa !162
  %90 = getelementptr inbounds i8* %81, i64 24, !dbg !503
  %91 = bitcast i8* %90 to i32*, !dbg !503
  store i32 3, i32* %91, align 4, !dbg !503, !tbaa !164
  %92 = getelementptr inbounds i8* %81, i64 32, !dbg !504
  %93 = bitcast i8* %92 to %struct.task* (%struct.packet*)**, !dbg !504
  store %struct.task* (%struct.packet*)* @handlerfn, %struct.task* (%struct.packet*)** %93, align 8, !dbg !504, !tbaa !166
  %94 = getelementptr inbounds i8* %81, i64 40, !dbg !505
  call void @llvm.memset.p0i8.i64(i8* %94, i8 0, i64 16, i32 8, i1 false), !dbg !506
  tail call void @llvm.dbg.value(metadata !200, i64 0, metadata !507) #3, !dbg !509
  tail call void @llvm.dbg.value(metadata !510, i64 0, metadata !511) #3, !dbg !509
  tail call void @llvm.dbg.value(metadata !411, i64 0, metadata !512) #3, !dbg !509
  %95 = tail call noalias i8* @malloc(i64 24) #4, !dbg !513
  tail call void @llvm.dbg.value(metadata !175, i64 0, metadata !514) #3, !dbg !515
  %scevgep.i9 = getelementptr i8* %95, i64 20
  %96 = bitcast i8* %scevgep.i9 to i32*, !dbg !516
  store i32 0, i32* %96, align 1, !dbg !516
  %97 = bitcast i8* %95 to %struct.packet*, !dbg !513
  %98 = bitcast i8* %95 to %struct.packet**, !dbg !517
  store %struct.packet* null, %struct.packet** %98, align 8, !dbg !517, !tbaa !180
  %99 = getelementptr inbounds i8* %95, i64 8, !dbg !518
  %100 = bitcast i8* %99 to i32*, !dbg !518
  store i32 6, i32* %100, align 4, !dbg !518, !tbaa !183
  %101 = getelementptr inbounds i8* %95, i64 12, !dbg !519
  %102 = bitcast i8* %101 to i32*, !dbg !519
  store i32 1000, i32* %102, align 4, !dbg !519, !tbaa !185
  %103 = getelementptr inbounds i8* %95, i64 16, !dbg !520
  %104 = bitcast i8* %103 to i32*, !dbg !520
  store i32 0, i32* %104, align 4, !dbg !520, !tbaa !187
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %97}, i64 0, metadata !116), !dbg !508
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %97}, i64 0, metadata !521) #3, !dbg !523
  tail call void @llvm.dbg.value(metadata !510, i64 0, metadata !524) #3, !dbg !523
  tail call void @llvm.dbg.value(metadata !411, i64 0, metadata !525) #3, !dbg !523
  %105 = tail call noalias i8* @malloc(i64 24) #4, !dbg !526
  tail call void @llvm.dbg.value(metadata !175, i64 0, metadata !527) #3, !dbg !528
  %scevgep.i10 = getelementptr i8* %105, i64 20
  %106 = bitcast i8* %scevgep.i10 to i32*, !dbg !529
  store i32 0, i32* %106, align 1, !dbg !529
  %107 = bitcast i8* %105 to %struct.packet*, !dbg !526
  %108 = bitcast i8* %105 to %struct.packet**, !dbg !530
  store %struct.packet* %97, %struct.packet** %108, align 8, !dbg !530, !tbaa !180
  %109 = getelementptr inbounds i8* %105, i64 8, !dbg !531
  %110 = bitcast i8* %109 to i32*, !dbg !531
  store i32 6, i32* %110, align 4, !dbg !531, !tbaa !183
  %111 = getelementptr inbounds i8* %105, i64 12, !dbg !532
  %112 = bitcast i8* %111 to i32*, !dbg !532
  store i32 1000, i32* %112, align 4, !dbg !532, !tbaa !185
  %113 = getelementptr inbounds i8* %105, i64 16, !dbg !533
  %114 = bitcast i8* %113 to i32*, !dbg !533
  store i32 0, i32* %114, align 4, !dbg !533, !tbaa !187
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %107}, i64 0, metadata !116), !dbg !522
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %107}, i64 0, metadata !534) #3, !dbg !536
  tail call void @llvm.dbg.value(metadata !510, i64 0, metadata !537) #3, !dbg !536
  tail call void @llvm.dbg.value(metadata !411, i64 0, metadata !538) #3, !dbg !536
  %115 = tail call noalias i8* @malloc(i64 24) #4, !dbg !539
  tail call void @llvm.dbg.value(metadata !175, i64 0, metadata !540) #3, !dbg !541
  %scevgep.i11 = getelementptr i8* %115, i64 20
  %116 = bitcast i8* %scevgep.i11 to i32*, !dbg !542
  store i32 0, i32* %116, align 1, !dbg !542
  %117 = bitcast i8* %115 to %struct.packet*, !dbg !539
  %118 = bitcast i8* %115 to %struct.packet**, !dbg !543
  store %struct.packet* %107, %struct.packet** %118, align 8, !dbg !543, !tbaa !180
  %119 = getelementptr inbounds i8* %115, i64 8, !dbg !544
  %120 = bitcast i8* %119 to i32*, !dbg !544
  store i32 6, i32* %120, align 4, !dbg !544, !tbaa !183
  %121 = getelementptr inbounds i8* %115, i64 12, !dbg !545
  %122 = bitcast i8* %121 to i32*, !dbg !545
  store i32 1000, i32* %122, align 4, !dbg !545, !tbaa !185
  %123 = getelementptr inbounds i8* %115, i64 16, !dbg !546
  %124 = bitcast i8* %123 to i32*, !dbg !546
  store i32 0, i32* %124, align 4, !dbg !546, !tbaa !187
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %117}, i64 0, metadata !116), !dbg !535
  tail call void @llvm.dbg.value(metadata !547, i64 0, metadata !548) #3, !dbg !550
  tail call void @llvm.dbg.value(metadata !551, i64 0, metadata !552) #3, !dbg !553
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %117}, i64 0, metadata !554) #3, !dbg !555
  tail call void @llvm.dbg.value(metadata !416, i64 0, metadata !556) #3, !dbg !557
  tail call void @llvm.dbg.value(metadata !489, i64 0, metadata !558) #3, !dbg !559
  tail call void @llvm.dbg.value(metadata !425, i64 0, metadata !560) #3, !dbg !561
  tail call void @llvm.dbg.value(metadata !425, i64 0, metadata !562) #3, !dbg !563
  %125 = tail call noalias i8* @malloc(i64 56) #4, !dbg !564
  %126 = bitcast i8* %125 to %struct.task*, !dbg !564
  tail call void @llvm.dbg.value(metadata !{%struct.task* %126}, i64 0, metadata !565) #3, !dbg !564
  store %struct.task* %126, %struct.task** getelementptr inbounds ([11 x %struct.task*]* @tasktab, i64 0, i64 4), align 16, !dbg !566, !tbaa !148
  %127 = bitcast i8* %125 to %struct.task**, !dbg !567
  store %struct.task* %82, %struct.task** %127, align 8, !dbg !567, !tbaa !153
  %128 = getelementptr inbounds i8* %125, i64 8, !dbg !568
  %129 = bitcast i8* %128 to i32*, !dbg !568
  store i32 4, i32* %129, align 4, !dbg !568, !tbaa !158
  %130 = getelementptr inbounds i8* %125, i64 12, !dbg !569
  %131 = bitcast i8* %130 to i32*, !dbg !569
  store i32 3000, i32* %131, align 4, !dbg !569, !tbaa !160
  %132 = getelementptr inbounds i8* %125, i64 16, !dbg !570
  %133 = bitcast i8* %132 to %struct.packet**, !dbg !570
  store %struct.packet* %117, %struct.packet** %133, align 8, !dbg !570, !tbaa !162
  %134 = getelementptr inbounds i8* %125, i64 24, !dbg !571
  %135 = bitcast i8* %134 to i32*, !dbg !571
  store i32 3, i32* %135, align 4, !dbg !571, !tbaa !164
  %136 = getelementptr inbounds i8* %125, i64 32, !dbg !572
  %137 = bitcast i8* %136 to %struct.task* (%struct.packet*)**, !dbg !572
  store %struct.task* (%struct.packet*)* @handlerfn, %struct.task* (%struct.packet*)** %137, align 8, !dbg !572, !tbaa !166
  %138 = getelementptr inbounds i8* %125, i64 40, !dbg !573
  call void @llvm.memset.p0i8.i64(i8* %138, i8 0, i64 16, i32 8, i1 false), !dbg !574
  tail call void @llvm.dbg.value(metadata !200, i64 0, metadata !116), !dbg !575
  tail call void @llvm.dbg.value(metadata !442, i64 0, metadata !576) #3, !dbg !578
  tail call void @llvm.dbg.value(metadata !579, i64 0, metadata !580) #3, !dbg !581
  tail call void @llvm.dbg.value(metadata !200, i64 0, metadata !582) #3, !dbg !583
  tail call void @llvm.dbg.value(metadata !407, i64 0, metadata !584) #3, !dbg !585
  tail call void @llvm.dbg.value(metadata !586, i64 0, metadata !587) #3, !dbg !588
  tail call void @llvm.dbg.value(metadata !425, i64 0, metadata !589) #3, !dbg !590
  tail call void @llvm.dbg.value(metadata !425, i64 0, metadata !591) #3, !dbg !592
  %139 = tail call noalias i8* @malloc(i64 56) #4, !dbg !593
  %140 = bitcast i8* %139 to %struct.task*, !dbg !593
  tail call void @llvm.dbg.value(metadata !{%struct.task* %140}, i64 0, metadata !594) #3, !dbg !593
  store %struct.task* %140, %struct.task** getelementptr inbounds ([11 x %struct.task*]* @tasktab, i64 0, i64 5), align 8, !dbg !595, !tbaa !148
  %141 = bitcast i8* %139 to %struct.task**, !dbg !596
  store %struct.task* %126, %struct.task** %141, align 8, !dbg !596, !tbaa !153
  %142 = getelementptr inbounds i8* %139, i64 8, !dbg !597
  %143 = bitcast i8* %142 to i32*, !dbg !597
  store i32 5, i32* %143, align 4, !dbg !597, !tbaa !158
  %144 = getelementptr inbounds i8* %139, i64 12, !dbg !598
  %145 = bitcast i8* %144 to i32*, !dbg !598
  store i32 4000, i32* %145, align 4, !dbg !598, !tbaa !160
  %146 = getelementptr inbounds i8* %139, i64 16, !dbg !599
  %147 = bitcast i8* %146 to %struct.packet**, !dbg !599
  store %struct.packet* null, %struct.packet** %147, align 8, !dbg !599, !tbaa !162
  %148 = getelementptr inbounds i8* %139, i64 24, !dbg !600
  %149 = bitcast i8* %148 to i32*, !dbg !600
  store i32 2, i32* %149, align 4, !dbg !600, !tbaa !164
  %150 = getelementptr inbounds i8* %139, i64 32, !dbg !601
  %151 = bitcast i8* %150 to %struct.task* (%struct.packet*)**, !dbg !601
  store %struct.task* (%struct.packet*)* @devfn, %struct.task* (%struct.packet*)** %151, align 8, !dbg !601, !tbaa !166
  %152 = getelementptr inbounds i8* %139, i64 40, !dbg !602
  call void @llvm.memset.p0i8.i64(i8* %152, i8 0, i64 16, i32 8, i1 false), !dbg !603
  tail call void @llvm.dbg.value(metadata !510, i64 0, metadata !604) #3, !dbg !606
  tail call void @llvm.dbg.value(metadata !607, i64 0, metadata !608) #3, !dbg !609
  tail call void @llvm.dbg.value(metadata !200, i64 0, metadata !610) #3, !dbg !611
  tail call void @llvm.dbg.value(metadata !407, i64 0, metadata !612) #3, !dbg !613
  tail call void @llvm.dbg.value(metadata !586, i64 0, metadata !614) #3, !dbg !615
  tail call void @llvm.dbg.value(metadata !425, i64 0, metadata !616) #3, !dbg !617
  tail call void @llvm.dbg.value(metadata !425, i64 0, metadata !618) #3, !dbg !619
  %153 = tail call noalias i8* @malloc(i64 56) #4, !dbg !620
  %154 = bitcast i8* %153 to %struct.task*, !dbg !620
  tail call void @llvm.dbg.value(metadata !{%struct.task* %154}, i64 0, metadata !621) #3, !dbg !620
  store %struct.task* %154, %struct.task** getelementptr inbounds ([11 x %struct.task*]* @tasktab, i64 0, i64 6), align 16, !dbg !622, !tbaa !148
  %155 = bitcast i8* %153 to %struct.task**, !dbg !623
  store %struct.task* %140, %struct.task** %155, align 8, !dbg !623, !tbaa !153
  %156 = getelementptr inbounds i8* %153, i64 8, !dbg !624
  %157 = bitcast i8* %156 to i32*, !dbg !624
  store i32 6, i32* %157, align 4, !dbg !624, !tbaa !158
  %158 = getelementptr inbounds i8* %153, i64 12, !dbg !625
  %159 = bitcast i8* %158 to i32*, !dbg !625
  store i32 5000, i32* %159, align 4, !dbg !625, !tbaa !160
  %160 = getelementptr inbounds i8* %153, i64 16, !dbg !626
  %161 = bitcast i8* %160 to %struct.packet**, !dbg !626
  store %struct.packet* null, %struct.packet** %161, align 8, !dbg !626, !tbaa !162
  %162 = getelementptr inbounds i8* %153, i64 24, !dbg !627
  %163 = bitcast i8* %162 to i32*, !dbg !627
  store i32 2, i32* %163, align 4, !dbg !627, !tbaa !164
  %164 = getelementptr inbounds i8* %153, i64 32, !dbg !628
  %165 = bitcast i8* %164 to %struct.task* (%struct.packet*)**, !dbg !628
  store %struct.task* (%struct.packet*)* @devfn, %struct.task* (%struct.packet*)** %165, align 8, !dbg !628, !tbaa !166
  %166 = getelementptr inbounds i8* %153, i64 40, !dbg !629
  call void @llvm.memset.p0i8.i64(i8* %166, i8 0, i64 16, i32 8, i1 false), !dbg !630
  store %struct.task* %154, %struct.task** @tasklist, align 8, !dbg !631, !tbaa !148
  store %struct.task* %154, %struct.task** @tcb, align 8, !dbg !632, !tbaa !148
  store i32 0, i32* @holdcount, align 4, !dbg !633, !tbaa !192
  store i32 0, i32* @qpktcount, align 4, !dbg !633, !tbaa !192
  %puts2 = tail call i32 @puts(i8* getelementptr inbounds ([9 x i8]* @str11, i64 0, i64 0)), !dbg !634
  store i32 0, i32* @tracing, align 4, !dbg !635, !tbaa !192
  store i32 0, i32* @layout, align 4, !dbg !636, !tbaa !192
  tail call void @schedule() #5, !dbg !637
  %puts3 = tail call i32 @puts(i8* getelementptr inbounds ([9 x i8]* @str12, i64 0, i64 0)), !dbg !638
  %167 = load i32* @qpktcount, align 4, !dbg !639, !tbaa !192
  %168 = load i32* @holdcount, align 4, !dbg !639, !tbaa !192
  %169 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str6, i64 0, i64 0), i32 %167, i32 %168) #4, !dbg !639
  %170 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str7, i64 0, i64 0)) #4, !dbg !640
  %171 = load i32* @qpktcount, align 4, !dbg !641, !tbaa !192
  %172 = icmp eq i32 %171, 23263894, !dbg !641
  %173 = load i32* @holdcount, align 4
  %174 = icmp eq i32 %173, 9305557, !dbg !641
  %or.cond = and i1 %172, %174, !dbg !641
  br i1 %or.cond, label %175, label %177, !dbg !641

; <label>:175                                     ; preds = %0
  %176 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str8, i64 0, i64 0)) #4, !dbg !643
  tail call void @llvm.dbg.value(metadata !175, i64 0, metadata !117), !dbg !645
  br label %179, !dbg !646

; <label>:177                                     ; preds = %0
  %178 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str9, i64 0, i64 0)) #4, !dbg !647
  tail call void @llvm.dbg.value(metadata !351, i64 0, metadata !117), !dbg !649
  br label %179

; <label>:179                                     ; preds = %177, %175
  %retval.0 = phi i32 [ 0, %175 ], [ 1, %177 ]
  %puts4 = tail call i32 @puts(i8* getelementptr inbounds ([12 x i8]* @str13, i64 0, i64 0)), !dbg !650
  ret i32 %retval.0, !dbg !651
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #2

; Function Attrs: nounwind
declare i32 @putchar(i32) #3

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #3

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #3

attributes #0 = { nounwind optsize uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind optsize "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind }
attributes #4 = { nounwind optsize }
attributes #5 = { optsize }

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
!213 = metadata !{i32 172, i32 0, metadata !204, null}
!214 = metadata !{i32 173, i32 0, metadata !204, null}
!215 = metadata !{i32 174, i32 0, metadata !204, null}
!216 = metadata !{i32 176, i32 0, metadata !204, null}
!217 = metadata !{i32 183, i32 0, metadata !204, null}
!218 = metadata !{i32 184, i32 0, metadata !204, null}
!219 = metadata !{i32 175, i32 0, metadata !204, null}
!220 = metadata !{i32 190, i32 0, metadata !59, null}
!221 = metadata !{i32 194, i32 0, metadata !66, null}
!222 = metadata !{i32 195, i32 0, metadata !66, null}
!223 = metadata !{i32 200, i32 0, metadata !69, null}
!224 = metadata !{i32 201, i32 0, metadata !69, null}
!225 = metadata !{i32 202, i32 0, metadata !69, null}
!226 = metadata !{i32 205, i32 0, metadata !70, null}
!227 = metadata !{%struct.task* null}
!228 = metadata !{i32 207, i32 0, metadata !70, null}
!229 = metadata !{i32 209, i32 0, metadata !230, null}
!230 = metadata !{i32 786443, metadata !1, metadata !70, i32 209, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!231 = metadata !{i32 210, i32 0, metadata !230, null}
!232 = metadata !{i32 211, i32 0, metadata !233, null}
!233 = metadata !{i32 786443, metadata !1, metadata !70, i32 211, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!234 = metadata !{i32 212, i32 0, metadata !70, null}
!235 = metadata !{i32 215, i32 0, metadata !76, null}
!236 = metadata !{i32 219, i32 0, metadata !76, null}
!237 = metadata !{i32 220, i32 0, metadata !238, null}
!238 = metadata !{i32 786443, metadata !1, metadata !76, i32 220, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!239 = metadata !{i32 222, i32 0, metadata !76, null}
!240 = metadata !{i32 223, i32 0, metadata !241, null}
!241 = metadata !{i32 786443, metadata !1, metadata !76, i32 223, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!242 = metadata !{i32 226, i32 0, metadata !76, null}
!243 = metadata !{i32 229, i32 0, metadata !80, null}
!244 = metadata !{i32 233, i32 0, metadata !80, null}
!245 = metadata !{i32 234, i32 0, metadata !246, null}
!246 = metadata !{i32 786443, metadata !1, metadata !80, i32 234, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!247 = metadata !{i32 236, i32 0, metadata !80, null}
!248 = metadata !{i32 238, i32 0, metadata !80, null}
!249 = metadata !{i32 239, i32 0, metadata !80, null}
!250 = metadata !{i32 241, i32 0, metadata !251, null}
!251 = metadata !{i32 786443, metadata !1, metadata !80, i32 241, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!252 = metadata !{i32 243, i32 0, metadata !253, null}
!253 = metadata !{i32 786443, metadata !1, metadata !251, i32 242, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!254 = metadata !{i32 244, i32 0, metadata !253, null}
!255 = metadata !{i32 245, i32 0, metadata !256, null}
!256 = metadata !{i32 786443, metadata !1, metadata !253, i32 245, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!257 = metadata !{i32 249, i32 0, metadata !258, null}
!258 = metadata !{i32 786443, metadata !1, metadata !251, i32 248, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!259 = metadata !{i32 786689, metadata !106, metadata !"pkt", metadata !5, i32 16777557, metadata !9, i32 0, metadata !257} ; [ DW_TAG_arg_variable ] [pkt] [line 341]
!260 = metadata !{i32 341, i32 0, metadata !106, metadata !257}
!261 = metadata !{i32 786689, metadata !106, metadata !"ptr", metadata !5, i32 33554773, metadata !9, i32 0, metadata !257} ; [ DW_TAG_arg_variable ] [ptr] [line 341]
!262 = metadata !{i32 343, i32 0, metadata !106, metadata !257}
!263 = metadata !{i32 345, i32 0, metadata !106, metadata !257}
!264 = metadata !{i32 347, i32 0, metadata !106, metadata !257}
!265 = metadata !{i32 252, i32 0, metadata !80, null}
!266 = metadata !{i32 253, i32 0, metadata !80, null}
!267 = metadata !{i32 341, i32 0, metadata !106, null}
!268 = metadata !{i32 343, i32 0, metadata !106, null}
!269 = metadata !{i32 345, i32 0, metadata !106, null}
!270 = metadata !{i32 347, i32 0, metadata !106, null}
!271 = metadata !{i32 348, i32 0, metadata !106, null}
!272 = metadata !{i32 255, i32 0, metadata !84, null}
!273 = metadata !{i32 257, i32 0, metadata !84, null}
!274 = metadata !{i32 258, i32 0, metadata !275, null}
!275 = metadata !{i32 786443, metadata !1, metadata !84, i32 258, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!276 = metadata !{i32 200, i32 0, metadata !69, metadata !274}
!277 = metadata !{i32 201, i32 0, metadata !69, metadata !274}
!278 = metadata !{i32 202, i32 0, metadata !69, metadata !274}
!279 = metadata !{i32 260, i32 0, metadata !280, null}
!280 = metadata !{i32 786443, metadata !1, metadata !84, i32 260, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!281 = metadata !{i32 262, i32 0, metadata !282, null}
!282 = metadata !{i32 786443, metadata !1, metadata !280, i32 261, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!283 = metadata !{i32 263, i32 0, metadata !282, null}
!284 = metadata !{i32 267, i32 0, metadata !285, null}
!285 = metadata !{i32 786443, metadata !1, metadata !280, i32 266, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!286 = metadata !{i32 268, i32 0, metadata !285, null}
!287 = metadata !{i32 270, i32 0, metadata !84, null}
!288 = metadata !{i32 272, i32 0, metadata !87, null}
!289 = metadata !{i32 274, i32 0, metadata !92, null}
!290 = metadata !{i32 194, i32 0, metadata !66, metadata !289}
!291 = metadata !{i32 279, i32 0, metadata !91, null}
!292 = metadata !{i32 280, i32 0, metadata !91, null}
!293 = metadata !{i32 282, i32 0, metadata !91, null}
!294 = metadata !{i32 283, i32 0, metadata !295, null}
!295 = metadata !{i32 786443, metadata !1, metadata !91, i32 283, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!296 = metadata !{i32 285, i32 0, metadata !297, null}
!297 = metadata !{i32 786443, metadata !1, metadata !295, i32 284, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!298 = metadata !{i32 286, i32 0, metadata !299, null}
!299 = metadata !{i32 786443, metadata !1, metadata !297, i32 286, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!300 = metadata !{i32 287, i32 0, metadata !297, null}
!301 = metadata !{metadata !150, metadata !150, i64 0}
!302 = metadata !{i32 289, i32 0, metadata !91, null}
!303 = metadata !{i32 291, i32 0, metadata !87, null}
!304 = metadata !{i32 293, i32 0, metadata !93, null}
!305 = metadata !{i32 295, i32 0, metadata !306, null}
!306 = metadata !{i32 786443, metadata !1, metadata !93, i32 295, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!307 = metadata !{i32 786689, metadata !106, metadata !"pkt", metadata !5, i32 16777557, metadata !9, i32 0, metadata !305} ; [ DW_TAG_arg_variable ] [pkt] [line 341]
!308 = metadata !{i32 341, i32 0, metadata !106, metadata !305}
!309 = metadata !{i32 786689, metadata !106, metadata !"ptr", metadata !5, i32 33554773, metadata !9, i32 0, metadata !305} ; [ DW_TAG_arg_variable ] [ptr] [line 341]
!310 = metadata !{i32 343, i32 0, metadata !106, metadata !305}
!311 = metadata !{i32 345, i32 0, metadata !106, metadata !305}
!312 = metadata !{i32 347, i32 0, metadata !106, metadata !305}
!313 = metadata !{i32 298, i32 0, metadata !98, null}
!314 = metadata !{i32 301, i32 0, metadata !97, null}
!315 = metadata !{i32 302, i32 0, metadata !97, null}
!316 = metadata !{i32 304, i32 0, metadata !317, null}
!317 = metadata !{i32 786443, metadata !1, metadata !97, i32 304, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!318 = metadata !{i32 306, i32 0, metadata !319, null}
!319 = metadata !{i32 786443, metadata !1, metadata !317, i32 305, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!320 = metadata !{i32 307, i32 0, metadata !319, null}
!321 = metadata !{i32 310, i32 0, metadata !102, null}
!322 = metadata !{i32 314, i32 0, metadata !101, null}
!323 = metadata !{i32 315, i32 0, metadata !101, null}
!324 = metadata !{i32 316, i32 0, metadata !101, null}
!325 = metadata !{i32 317, i32 0, metadata !101, null}
!326 = metadata !{i32 318, i32 0, metadata !101, null}
!327 = metadata !{i32 194, i32 0, metadata !66, metadata !328}
!328 = metadata !{i32 321, i32 0, metadata !93, null}
!329 = metadata !{i32 322, i32 0, metadata !93, null}
!330 = metadata !{i32 324, i32 0, metadata !103, null}
!331 = metadata !{i32 326, i32 0, metadata !332, null}
!332 = metadata !{i32 786443, metadata !1, metadata !103, i32 326, i32 0, i32 31} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!333 = metadata !{i32 328, i32 0, metadata !334, null}
!334 = metadata !{i32 786443, metadata !1, metadata !335, i32 328, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!335 = metadata !{i32 786443, metadata !1, metadata !332, i32 327, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!336 = metadata !{i32 194, i32 0, metadata !66, metadata !333}
!337 = metadata !{i32 329, i32 0, metadata !335, null}
!338 = metadata !{i32 330, i32 0, metadata !335, null}
!339 = metadata !{i32 331, i32 0, metadata !335, null}
!340 = metadata !{i32 335, i32 0, metadata !341, null}
!341 = metadata !{i32 786443, metadata !1, metadata !332, i32 334, i32 0, i32 34} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!342 = metadata !{i32 336, i32 0, metadata !343, null}
!343 = metadata !{i32 786443, metadata !1, metadata !341, i32 336, i32 0, i32 35} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!344 = metadata !{i32 200, i32 0, metadata !69, metadata !345}
!345 = metadata !{i32 337, i32 0, metadata !341, null}
!346 = metadata !{i32 201, i32 0, metadata !69, metadata !345}
!347 = metadata !{i32 202, i32 0, metadata !69, metadata !345}
!348 = metadata !{i32 339, i32 0, metadata !103, null}
!349 = metadata !{i32 352, i32 0, metadata !112, null}
!350 = metadata !{i32 355, i32 0, metadata !112, null}
!351 = metadata !{i32 1}
!352 = metadata !{i32 786689, metadata !4, metadata !"id", metadata !5, i32 16777316, metadata !8, i32 0, metadata !353} ; [ DW_TAG_arg_variable ] [id] [line 100]
!353 = metadata !{i32 357, i32 0, metadata !112, null}
!354 = metadata !{i32 100, i32 0, metadata !4, metadata !353}
!355 = metadata !{i32 786689, metadata !4, metadata !"pri", metadata !5, i32 33554533, metadata !8, i32 0, metadata !353} ; [ DW_TAG_arg_variable ] [pri] [line 101]
!356 = metadata !{i32 101, i32 0, metadata !4, metadata !353}
!357 = metadata !{i32 786689, metadata !4, metadata !"wkq", metadata !5, i32 50331750, metadata !9, i32 0, metadata !353} ; [ DW_TAG_arg_variable ] [wkq] [line 102]
!358 = metadata !{i32 102, i32 0, metadata !4, metadata !353}
!359 = metadata !{i32 786689, metadata !4, metadata !"state", metadata !5, i32 67108967, metadata !8, i32 0, metadata !353} ; [ DW_TAG_arg_variable ] [state] [line 103]
!360 = metadata !{i32 103, i32 0, metadata !4, metadata !353}
!361 = metadata !{%struct.task* (%struct.packet*)* @idlefn}
!362 = metadata !{i32 786689, metadata !4, metadata !"fn", metadata !5, i32 83886184, metadata !21, i32 0, metadata !353} ; [ DW_TAG_arg_variable ] [fn] [line 104]
!363 = metadata !{i32 104, i32 0, metadata !4, metadata !353}
!364 = metadata !{i64 1}
!365 = metadata !{i32 786689, metadata !4, metadata !"v1", metadata !5, i32 100663401, metadata !34, i32 0, metadata !353} ; [ DW_TAG_arg_variable ] [v1] [line 105]
!366 = metadata !{i32 105, i32 0, metadata !4, metadata !353}
!367 = metadata !{i64 10000000}
!368 = metadata !{i32 786689, metadata !4, metadata !"v2", metadata !5, i32 117440618, metadata !34, i32 0, metadata !353} ; [ DW_TAG_arg_variable ] [v2] [line 106]
!369 = metadata !{i32 106, i32 0, metadata !4, metadata !353}
!370 = metadata !{i32 108, i32 0, metadata !4, metadata !353}
!371 = metadata !{i32 786688, metadata !4, metadata !"t", metadata !5, i32 108, metadata !24, i32 0, metadata !353} ; [ DW_TAG_auto_variable ] [t] [line 108]
!372 = metadata !{i32 110, i32 0, metadata !4, metadata !353}
!373 = metadata !{i32 111, i32 0, metadata !4, metadata !353}
!374 = metadata !{i32 112, i32 0, metadata !4, metadata !353}
!375 = metadata !{i32 113, i32 0, metadata !4, metadata !353}
!376 = metadata !{i32 116, i32 0, metadata !4, metadata !353}
!377 = metadata !{i32 114, i32 0, metadata !4, metadata !353}
!378 = metadata !{i32 117, i32 0, metadata !4, metadata !353}
!379 = metadata !{i32 118, i32 0, metadata !4, metadata !353}
!380 = metadata !{i32 786689, metadata !45, metadata !"link", metadata !5, i32 16777338, metadata !9, i32 0, metadata !381} ; [ DW_TAG_arg_variable ] [link] [line 122]
!381 = metadata !{i32 359, i32 0, metadata !112, null}
!382 = metadata !{i32 122, i32 0, metadata !45, metadata !381}
!383 = metadata !{i32 786689, metadata !45, metadata !"id", metadata !5, i32 33554554, metadata !8, i32 0, metadata !381} ; [ DW_TAG_arg_variable ] [id] [line 122]
!384 = metadata !{i32 1001}
!385 = metadata !{i32 786689, metadata !45, metadata !"kind", metadata !5, i32 50331770, metadata !8, i32 0, metadata !381} ; [ DW_TAG_arg_variable ] [kind] [line 122]
!386 = metadata !{i32 125, i32 0, metadata !45, metadata !381}
!387 = metadata !{i32 786688, metadata !45, metadata !"i", metadata !5, i32 124, metadata !8, i32 0, metadata !381} ; [ DW_TAG_auto_variable ] [i] [line 124]
!388 = metadata !{i32 127, i32 0, metadata !177, metadata !381}
!389 = metadata !{i32 128, i32 0, metadata !177, metadata !381}
!390 = metadata !{i32 130, i32 0, metadata !45, metadata !381}
!391 = metadata !{i32 131, i32 0, metadata !45, metadata !381}
!392 = metadata !{i32 132, i32 0, metadata !45, metadata !381}
!393 = metadata !{i32 133, i32 0, metadata !45, metadata !381}
!394 = metadata !{i32 786689, metadata !45, metadata !"link", metadata !5, i32 16777338, metadata !9, i32 0, metadata !395} ; [ DW_TAG_arg_variable ] [link] [line 122]
!395 = metadata !{i32 360, i32 0, metadata !112, null}
!396 = metadata !{i32 122, i32 0, metadata !45, metadata !395}
!397 = metadata !{i32 786689, metadata !45, metadata !"id", metadata !5, i32 33554554, metadata !8, i32 0, metadata !395} ; [ DW_TAG_arg_variable ] [id] [line 122]
!398 = metadata !{i32 786689, metadata !45, metadata !"kind", metadata !5, i32 50331770, metadata !8, i32 0, metadata !395} ; [ DW_TAG_arg_variable ] [kind] [line 122]
!399 = metadata !{i32 125, i32 0, metadata !45, metadata !395}
!400 = metadata !{i32 786688, metadata !45, metadata !"i", metadata !5, i32 124, metadata !8, i32 0, metadata !395} ; [ DW_TAG_auto_variable ] [i] [line 124]
!401 = metadata !{i32 127, i32 0, metadata !177, metadata !395}
!402 = metadata !{i32 128, i32 0, metadata !177, metadata !395}
!403 = metadata !{i32 130, i32 0, metadata !45, metadata !395}
!404 = metadata !{i32 131, i32 0, metadata !45, metadata !395}
!405 = metadata !{i32 132, i32 0, metadata !45, metadata !395}
!406 = metadata !{i32 133, i32 0, metadata !45, metadata !395}
!407 = metadata !{i32 2}
!408 = metadata !{i32 786689, metadata !4, metadata !"id", metadata !5, i32 16777316, metadata !8, i32 0, metadata !409} ; [ DW_TAG_arg_variable ] [id] [line 100]
!409 = metadata !{i32 362, i32 0, metadata !112, null}
!410 = metadata !{i32 100, i32 0, metadata !4, metadata !409}
!411 = metadata !{i32 1000}
!412 = metadata !{i32 786689, metadata !4, metadata !"pri", metadata !5, i32 33554533, metadata !8, i32 0, metadata !409} ; [ DW_TAG_arg_variable ] [pri] [line 101]
!413 = metadata !{i32 101, i32 0, metadata !4, metadata !409}
!414 = metadata !{i32 786689, metadata !4, metadata !"wkq", metadata !5, i32 50331750, metadata !9, i32 0, metadata !409} ; [ DW_TAG_arg_variable ] [wkq] [line 102]
!415 = metadata !{i32 102, i32 0, metadata !4, metadata !409}
!416 = metadata !{i32 3}
!417 = metadata !{i32 786689, metadata !4, metadata !"state", metadata !5, i32 67108967, metadata !8, i32 0, metadata !409} ; [ DW_TAG_arg_variable ] [state] [line 103]
!418 = metadata !{i32 103, i32 0, metadata !4, metadata !409}
!419 = metadata !{%struct.task* (%struct.packet*)* @workfn}
!420 = metadata !{i32 786689, metadata !4, metadata !"fn", metadata !5, i32 83886184, metadata !21, i32 0, metadata !409} ; [ DW_TAG_arg_variable ] [fn] [line 104]
!421 = metadata !{i32 104, i32 0, metadata !4, metadata !409}
!422 = metadata !{i64 3}
!423 = metadata !{i32 786689, metadata !4, metadata !"v1", metadata !5, i32 100663401, metadata !34, i32 0, metadata !409} ; [ DW_TAG_arg_variable ] [v1] [line 105]
!424 = metadata !{i32 105, i32 0, metadata !4, metadata !409}
!425 = metadata !{i64 0}
!426 = metadata !{i32 786689, metadata !4, metadata !"v2", metadata !5, i32 117440618, metadata !34, i32 0, metadata !409} ; [ DW_TAG_arg_variable ] [v2] [line 106]
!427 = metadata !{i32 106, i32 0, metadata !4, metadata !409}
!428 = metadata !{i32 108, i32 0, metadata !4, metadata !409}
!429 = metadata !{i32 786688, metadata !4, metadata !"t", metadata !5, i32 108, metadata !24, i32 0, metadata !409} ; [ DW_TAG_auto_variable ] [t] [line 108]
!430 = metadata !{i32 110, i32 0, metadata !4, metadata !409}
!431 = metadata !{i32 111, i32 0, metadata !4, metadata !409}
!432 = metadata !{i32 112, i32 0, metadata !4, metadata !409}
!433 = metadata !{i32 113, i32 0, metadata !4, metadata !409}
!434 = metadata !{i32 114, i32 0, metadata !4, metadata !409}
!435 = metadata !{i32 115, i32 0, metadata !4, metadata !409}
!436 = metadata !{i32 116, i32 0, metadata !4, metadata !409}
!437 = metadata !{i32 117, i32 0, metadata !4, metadata !409}
!438 = metadata !{i32 118, i32 0, metadata !4, metadata !409}
!439 = metadata !{i32 786689, metadata !45, metadata !"link", metadata !5, i32 16777338, metadata !9, i32 0, metadata !440} ; [ DW_TAG_arg_variable ] [link] [line 122]
!440 = metadata !{i32 364, i32 0, metadata !112, null}
!441 = metadata !{i32 122, i32 0, metadata !45, metadata !440}
!442 = metadata !{i32 5}
!443 = metadata !{i32 786689, metadata !45, metadata !"id", metadata !5, i32 33554554, metadata !8, i32 0, metadata !440} ; [ DW_TAG_arg_variable ] [id] [line 122]
!444 = metadata !{i32 786689, metadata !45, metadata !"kind", metadata !5, i32 50331770, metadata !8, i32 0, metadata !440} ; [ DW_TAG_arg_variable ] [kind] [line 122]
!445 = metadata !{i32 125, i32 0, metadata !45, metadata !440}
!446 = metadata !{i32 786688, metadata !45, metadata !"i", metadata !5, i32 124, metadata !8, i32 0, metadata !440} ; [ DW_TAG_auto_variable ] [i] [line 124]
!447 = metadata !{i32 127, i32 0, metadata !177, metadata !440}
!448 = metadata !{i32 128, i32 0, metadata !177, metadata !440}
!449 = metadata !{i32 130, i32 0, metadata !45, metadata !440}
!450 = metadata !{i32 131, i32 0, metadata !45, metadata !440}
!451 = metadata !{i32 132, i32 0, metadata !45, metadata !440}
!452 = metadata !{i32 133, i32 0, metadata !45, metadata !440}
!453 = metadata !{i32 786689, metadata !45, metadata !"link", metadata !5, i32 16777338, metadata !9, i32 0, metadata !454} ; [ DW_TAG_arg_variable ] [link] [line 122]
!454 = metadata !{i32 365, i32 0, metadata !112, null}
!455 = metadata !{i32 122, i32 0, metadata !45, metadata !454}
!456 = metadata !{i32 786689, metadata !45, metadata !"id", metadata !5, i32 33554554, metadata !8, i32 0, metadata !454} ; [ DW_TAG_arg_variable ] [id] [line 122]
!457 = metadata !{i32 786689, metadata !45, metadata !"kind", metadata !5, i32 50331770, metadata !8, i32 0, metadata !454} ; [ DW_TAG_arg_variable ] [kind] [line 122]
!458 = metadata !{i32 125, i32 0, metadata !45, metadata !454}
!459 = metadata !{i32 786688, metadata !45, metadata !"i", metadata !5, i32 124, metadata !8, i32 0, metadata !454} ; [ DW_TAG_auto_variable ] [i] [line 124]
!460 = metadata !{i32 127, i32 0, metadata !177, metadata !454}
!461 = metadata !{i32 128, i32 0, metadata !177, metadata !454}
!462 = metadata !{i32 130, i32 0, metadata !45, metadata !454}
!463 = metadata !{i32 131, i32 0, metadata !45, metadata !454}
!464 = metadata !{i32 132, i32 0, metadata !45, metadata !454}
!465 = metadata !{i32 133, i32 0, metadata !45, metadata !454}
!466 = metadata !{i32 786689, metadata !45, metadata !"link", metadata !5, i32 16777338, metadata !9, i32 0, metadata !467} ; [ DW_TAG_arg_variable ] [link] [line 122]
!467 = metadata !{i32 366, i32 0, metadata !112, null}
!468 = metadata !{i32 122, i32 0, metadata !45, metadata !467}
!469 = metadata !{i32 786689, metadata !45, metadata !"id", metadata !5, i32 33554554, metadata !8, i32 0, metadata !467} ; [ DW_TAG_arg_variable ] [id] [line 122]
!470 = metadata !{i32 786689, metadata !45, metadata !"kind", metadata !5, i32 50331770, metadata !8, i32 0, metadata !467} ; [ DW_TAG_arg_variable ] [kind] [line 122]
!471 = metadata !{i32 125, i32 0, metadata !45, metadata !467}
!472 = metadata !{i32 786688, metadata !45, metadata !"i", metadata !5, i32 124, metadata !8, i32 0, metadata !467} ; [ DW_TAG_auto_variable ] [i] [line 124]
!473 = metadata !{i32 127, i32 0, metadata !177, metadata !467}
!474 = metadata !{i32 128, i32 0, metadata !177, metadata !467}
!475 = metadata !{i32 130, i32 0, metadata !45, metadata !467}
!476 = metadata !{i32 131, i32 0, metadata !45, metadata !467}
!477 = metadata !{i32 132, i32 0, metadata !45, metadata !467}
!478 = metadata !{i32 133, i32 0, metadata !45, metadata !467}
!479 = metadata !{i32 786689, metadata !4, metadata !"id", metadata !5, i32 16777316, metadata !8, i32 0, metadata !480} ; [ DW_TAG_arg_variable ] [id] [line 100]
!480 = metadata !{i32 368, i32 0, metadata !112, null}
!481 = metadata !{i32 100, i32 0, metadata !4, metadata !480}
!482 = metadata !{i32 2000}
!483 = metadata !{i32 786689, metadata !4, metadata !"pri", metadata !5, i32 33554533, metadata !8, i32 0, metadata !480} ; [ DW_TAG_arg_variable ] [pri] [line 101]
!484 = metadata !{i32 101, i32 0, metadata !4, metadata !480}
!485 = metadata !{i32 786689, metadata !4, metadata !"wkq", metadata !5, i32 50331750, metadata !9, i32 0, metadata !480} ; [ DW_TAG_arg_variable ] [wkq] [line 102]
!486 = metadata !{i32 102, i32 0, metadata !4, metadata !480}
!487 = metadata !{i32 786689, metadata !4, metadata !"state", metadata !5, i32 67108967, metadata !8, i32 0, metadata !480} ; [ DW_TAG_arg_variable ] [state] [line 103]
!488 = metadata !{i32 103, i32 0, metadata !4, metadata !480}
!489 = metadata !{%struct.task* (%struct.packet*)* @handlerfn}
!490 = metadata !{i32 786689, metadata !4, metadata !"fn", metadata !5, i32 83886184, metadata !21, i32 0, metadata !480} ; [ DW_TAG_arg_variable ] [fn] [line 104]
!491 = metadata !{i32 104, i32 0, metadata !4, metadata !480}
!492 = metadata !{i32 786689, metadata !4, metadata !"v1", metadata !5, i32 100663401, metadata !34, i32 0, metadata !480} ; [ DW_TAG_arg_variable ] [v1] [line 105]
!493 = metadata !{i32 105, i32 0, metadata !4, metadata !480}
!494 = metadata !{i32 786689, metadata !4, metadata !"v2", metadata !5, i32 117440618, metadata !34, i32 0, metadata !480} ; [ DW_TAG_arg_variable ] [v2] [line 106]
!495 = metadata !{i32 106, i32 0, metadata !4, metadata !480}
!496 = metadata !{i32 108, i32 0, metadata !4, metadata !480}
!497 = metadata !{i32 786688, metadata !4, metadata !"t", metadata !5, i32 108, metadata !24, i32 0, metadata !480} ; [ DW_TAG_auto_variable ] [t] [line 108]
!498 = metadata !{i32 110, i32 0, metadata !4, metadata !480}
!499 = metadata !{i32 111, i32 0, metadata !4, metadata !480}
!500 = metadata !{i32 112, i32 0, metadata !4, metadata !480}
!501 = metadata !{i32 113, i32 0, metadata !4, metadata !480}
!502 = metadata !{i32 114, i32 0, metadata !4, metadata !480}
!503 = metadata !{i32 115, i32 0, metadata !4, metadata !480}
!504 = metadata !{i32 116, i32 0, metadata !4, metadata !480}
!505 = metadata !{i32 117, i32 0, metadata !4, metadata !480}
!506 = metadata !{i32 118, i32 0, metadata !4, metadata !480}
!507 = metadata !{i32 786689, metadata !45, metadata !"link", metadata !5, i32 16777338, metadata !9, i32 0, metadata !508} ; [ DW_TAG_arg_variable ] [link] [line 122]
!508 = metadata !{i32 370, i32 0, metadata !112, null}
!509 = metadata !{i32 122, i32 0, metadata !45, metadata !508}
!510 = metadata !{i32 6}
!511 = metadata !{i32 786689, metadata !45, metadata !"id", metadata !5, i32 33554554, metadata !8, i32 0, metadata !508} ; [ DW_TAG_arg_variable ] [id] [line 122]
!512 = metadata !{i32 786689, metadata !45, metadata !"kind", metadata !5, i32 50331770, metadata !8, i32 0, metadata !508} ; [ DW_TAG_arg_variable ] [kind] [line 122]
!513 = metadata !{i32 125, i32 0, metadata !45, metadata !508}
!514 = metadata !{i32 786688, metadata !45, metadata !"i", metadata !5, i32 124, metadata !8, i32 0, metadata !508} ; [ DW_TAG_auto_variable ] [i] [line 124]
!515 = metadata !{i32 127, i32 0, metadata !177, metadata !508}
!516 = metadata !{i32 128, i32 0, metadata !177, metadata !508}
!517 = metadata !{i32 130, i32 0, metadata !45, metadata !508}
!518 = metadata !{i32 131, i32 0, metadata !45, metadata !508}
!519 = metadata !{i32 132, i32 0, metadata !45, metadata !508}
!520 = metadata !{i32 133, i32 0, metadata !45, metadata !508}
!521 = metadata !{i32 786689, metadata !45, metadata !"link", metadata !5, i32 16777338, metadata !9, i32 0, metadata !522} ; [ DW_TAG_arg_variable ] [link] [line 122]
!522 = metadata !{i32 371, i32 0, metadata !112, null}
!523 = metadata !{i32 122, i32 0, metadata !45, metadata !522}
!524 = metadata !{i32 786689, metadata !45, metadata !"id", metadata !5, i32 33554554, metadata !8, i32 0, metadata !522} ; [ DW_TAG_arg_variable ] [id] [line 122]
!525 = metadata !{i32 786689, metadata !45, metadata !"kind", metadata !5, i32 50331770, metadata !8, i32 0, metadata !522} ; [ DW_TAG_arg_variable ] [kind] [line 122]
!526 = metadata !{i32 125, i32 0, metadata !45, metadata !522}
!527 = metadata !{i32 786688, metadata !45, metadata !"i", metadata !5, i32 124, metadata !8, i32 0, metadata !522} ; [ DW_TAG_auto_variable ] [i] [line 124]
!528 = metadata !{i32 127, i32 0, metadata !177, metadata !522}
!529 = metadata !{i32 128, i32 0, metadata !177, metadata !522}
!530 = metadata !{i32 130, i32 0, metadata !45, metadata !522}
!531 = metadata !{i32 131, i32 0, metadata !45, metadata !522}
!532 = metadata !{i32 132, i32 0, metadata !45, metadata !522}
!533 = metadata !{i32 133, i32 0, metadata !45, metadata !522}
!534 = metadata !{i32 786689, metadata !45, metadata !"link", metadata !5, i32 16777338, metadata !9, i32 0, metadata !535} ; [ DW_TAG_arg_variable ] [link] [line 122]
!535 = metadata !{i32 372, i32 0, metadata !112, null}
!536 = metadata !{i32 122, i32 0, metadata !45, metadata !535}
!537 = metadata !{i32 786689, metadata !45, metadata !"id", metadata !5, i32 33554554, metadata !8, i32 0, metadata !535} ; [ DW_TAG_arg_variable ] [id] [line 122]
!538 = metadata !{i32 786689, metadata !45, metadata !"kind", metadata !5, i32 50331770, metadata !8, i32 0, metadata !535} ; [ DW_TAG_arg_variable ] [kind] [line 122]
!539 = metadata !{i32 125, i32 0, metadata !45, metadata !535}
!540 = metadata !{i32 786688, metadata !45, metadata !"i", metadata !5, i32 124, metadata !8, i32 0, metadata !535} ; [ DW_TAG_auto_variable ] [i] [line 124]
!541 = metadata !{i32 127, i32 0, metadata !177, metadata !535}
!542 = metadata !{i32 128, i32 0, metadata !177, metadata !535}
!543 = metadata !{i32 130, i32 0, metadata !45, metadata !535}
!544 = metadata !{i32 131, i32 0, metadata !45, metadata !535}
!545 = metadata !{i32 132, i32 0, metadata !45, metadata !535}
!546 = metadata !{i32 133, i32 0, metadata !45, metadata !535}
!547 = metadata !{i32 4}
!548 = metadata !{i32 786689, metadata !4, metadata !"id", metadata !5, i32 16777316, metadata !8, i32 0, metadata !549} ; [ DW_TAG_arg_variable ] [id] [line 100]
!549 = metadata !{i32 374, i32 0, metadata !112, null}
!550 = metadata !{i32 100, i32 0, metadata !4, metadata !549}
!551 = metadata !{i32 3000}
!552 = metadata !{i32 786689, metadata !4, metadata !"pri", metadata !5, i32 33554533, metadata !8, i32 0, metadata !549} ; [ DW_TAG_arg_variable ] [pri] [line 101]
!553 = metadata !{i32 101, i32 0, metadata !4, metadata !549}
!554 = metadata !{i32 786689, metadata !4, metadata !"wkq", metadata !5, i32 50331750, metadata !9, i32 0, metadata !549} ; [ DW_TAG_arg_variable ] [wkq] [line 102]
!555 = metadata !{i32 102, i32 0, metadata !4, metadata !549}
!556 = metadata !{i32 786689, metadata !4, metadata !"state", metadata !5, i32 67108967, metadata !8, i32 0, metadata !549} ; [ DW_TAG_arg_variable ] [state] [line 103]
!557 = metadata !{i32 103, i32 0, metadata !4, metadata !549}
!558 = metadata !{i32 786689, metadata !4, metadata !"fn", metadata !5, i32 83886184, metadata !21, i32 0, metadata !549} ; [ DW_TAG_arg_variable ] [fn] [line 104]
!559 = metadata !{i32 104, i32 0, metadata !4, metadata !549}
!560 = metadata !{i32 786689, metadata !4, metadata !"v1", metadata !5, i32 100663401, metadata !34, i32 0, metadata !549} ; [ DW_TAG_arg_variable ] [v1] [line 105]
!561 = metadata !{i32 105, i32 0, metadata !4, metadata !549}
!562 = metadata !{i32 786689, metadata !4, metadata !"v2", metadata !5, i32 117440618, metadata !34, i32 0, metadata !549} ; [ DW_TAG_arg_variable ] [v2] [line 106]
!563 = metadata !{i32 106, i32 0, metadata !4, metadata !549}
!564 = metadata !{i32 108, i32 0, metadata !4, metadata !549}
!565 = metadata !{i32 786688, metadata !4, metadata !"t", metadata !5, i32 108, metadata !24, i32 0, metadata !549} ; [ DW_TAG_auto_variable ] [t] [line 108]
!566 = metadata !{i32 110, i32 0, metadata !4, metadata !549}
!567 = metadata !{i32 111, i32 0, metadata !4, metadata !549}
!568 = metadata !{i32 112, i32 0, metadata !4, metadata !549}
!569 = metadata !{i32 113, i32 0, metadata !4, metadata !549}
!570 = metadata !{i32 114, i32 0, metadata !4, metadata !549}
!571 = metadata !{i32 115, i32 0, metadata !4, metadata !549}
!572 = metadata !{i32 116, i32 0, metadata !4, metadata !549}
!573 = metadata !{i32 117, i32 0, metadata !4, metadata !549}
!574 = metadata !{i32 118, i32 0, metadata !4, metadata !549}
!575 = metadata !{i32 376, i32 0, metadata !112, null}
!576 = metadata !{i32 786689, metadata !4, metadata !"id", metadata !5, i32 16777316, metadata !8, i32 0, metadata !577} ; [ DW_TAG_arg_variable ] [id] [line 100]
!577 = metadata !{i32 377, i32 0, metadata !112, null}
!578 = metadata !{i32 100, i32 0, metadata !4, metadata !577}
!579 = metadata !{i32 4000}
!580 = metadata !{i32 786689, metadata !4, metadata !"pri", metadata !5, i32 33554533, metadata !8, i32 0, metadata !577} ; [ DW_TAG_arg_variable ] [pri] [line 101]
!581 = metadata !{i32 101, i32 0, metadata !4, metadata !577}
!582 = metadata !{i32 786689, metadata !4, metadata !"wkq", metadata !5, i32 50331750, metadata !9, i32 0, metadata !577} ; [ DW_TAG_arg_variable ] [wkq] [line 102]
!583 = metadata !{i32 102, i32 0, metadata !4, metadata !577}
!584 = metadata !{i32 786689, metadata !4, metadata !"state", metadata !5, i32 67108967, metadata !8, i32 0, metadata !577} ; [ DW_TAG_arg_variable ] [state] [line 103]
!585 = metadata !{i32 103, i32 0, metadata !4, metadata !577}
!586 = metadata !{%struct.task* (%struct.packet*)* @devfn}
!587 = metadata !{i32 786689, metadata !4, metadata !"fn", metadata !5, i32 83886184, metadata !21, i32 0, metadata !577} ; [ DW_TAG_arg_variable ] [fn] [line 104]
!588 = metadata !{i32 104, i32 0, metadata !4, metadata !577}
!589 = metadata !{i32 786689, metadata !4, metadata !"v1", metadata !5, i32 100663401, metadata !34, i32 0, metadata !577} ; [ DW_TAG_arg_variable ] [v1] [line 105]
!590 = metadata !{i32 105, i32 0, metadata !4, metadata !577}
!591 = metadata !{i32 786689, metadata !4, metadata !"v2", metadata !5, i32 117440618, metadata !34, i32 0, metadata !577} ; [ DW_TAG_arg_variable ] [v2] [line 106]
!592 = metadata !{i32 106, i32 0, metadata !4, metadata !577}
!593 = metadata !{i32 108, i32 0, metadata !4, metadata !577}
!594 = metadata !{i32 786688, metadata !4, metadata !"t", metadata !5, i32 108, metadata !24, i32 0, metadata !577} ; [ DW_TAG_auto_variable ] [t] [line 108]
!595 = metadata !{i32 110, i32 0, metadata !4, metadata !577}
!596 = metadata !{i32 111, i32 0, metadata !4, metadata !577}
!597 = metadata !{i32 112, i32 0, metadata !4, metadata !577}
!598 = metadata !{i32 113, i32 0, metadata !4, metadata !577}
!599 = metadata !{i32 114, i32 0, metadata !4, metadata !577}
!600 = metadata !{i32 115, i32 0, metadata !4, metadata !577}
!601 = metadata !{i32 116, i32 0, metadata !4, metadata !577}
!602 = metadata !{i32 117, i32 0, metadata !4, metadata !577}
!603 = metadata !{i32 118, i32 0, metadata !4, metadata !577}
!604 = metadata !{i32 786689, metadata !4, metadata !"id", metadata !5, i32 16777316, metadata !8, i32 0, metadata !605} ; [ DW_TAG_arg_variable ] [id] [line 100]
!605 = metadata !{i32 378, i32 0, metadata !112, null}
!606 = metadata !{i32 100, i32 0, metadata !4, metadata !605}
!607 = metadata !{i32 5000}
!608 = metadata !{i32 786689, metadata !4, metadata !"pri", metadata !5, i32 33554533, metadata !8, i32 0, metadata !605} ; [ DW_TAG_arg_variable ] [pri] [line 101]
!609 = metadata !{i32 101, i32 0, metadata !4, metadata !605}
!610 = metadata !{i32 786689, metadata !4, metadata !"wkq", metadata !5, i32 50331750, metadata !9, i32 0, metadata !605} ; [ DW_TAG_arg_variable ] [wkq] [line 102]
!611 = metadata !{i32 102, i32 0, metadata !4, metadata !605}
!612 = metadata !{i32 786689, metadata !4, metadata !"state", metadata !5, i32 67108967, metadata !8, i32 0, metadata !605} ; [ DW_TAG_arg_variable ] [state] [line 103]
!613 = metadata !{i32 103, i32 0, metadata !4, metadata !605}
!614 = metadata !{i32 786689, metadata !4, metadata !"fn", metadata !5, i32 83886184, metadata !21, i32 0, metadata !605} ; [ DW_TAG_arg_variable ] [fn] [line 104]
!615 = metadata !{i32 104, i32 0, metadata !4, metadata !605}
!616 = metadata !{i32 786689, metadata !4, metadata !"v1", metadata !5, i32 100663401, metadata !34, i32 0, metadata !605} ; [ DW_TAG_arg_variable ] [v1] [line 105]
!617 = metadata !{i32 105, i32 0, metadata !4, metadata !605}
!618 = metadata !{i32 786689, metadata !4, metadata !"v2", metadata !5, i32 117440618, metadata !34, i32 0, metadata !605} ; [ DW_TAG_arg_variable ] [v2] [line 106]
!619 = metadata !{i32 106, i32 0, metadata !4, metadata !605}
!620 = metadata !{i32 108, i32 0, metadata !4, metadata !605}
!621 = metadata !{i32 786688, metadata !4, metadata !"t", metadata !5, i32 108, metadata !24, i32 0, metadata !605} ; [ DW_TAG_auto_variable ] [t] [line 108]
!622 = metadata !{i32 110, i32 0, metadata !4, metadata !605}
!623 = metadata !{i32 111, i32 0, metadata !4, metadata !605}
!624 = metadata !{i32 112, i32 0, metadata !4, metadata !605}
!625 = metadata !{i32 113, i32 0, metadata !4, metadata !605}
!626 = metadata !{i32 114, i32 0, metadata !4, metadata !605}
!627 = metadata !{i32 115, i32 0, metadata !4, metadata !605}
!628 = metadata !{i32 116, i32 0, metadata !4, metadata !605}
!629 = metadata !{i32 117, i32 0, metadata !4, metadata !605}
!630 = metadata !{i32 118, i32 0, metadata !4, metadata !605}
!631 = metadata !{i32 119, i32 0, metadata !4, metadata !605}
!632 = metadata !{i32 380, i32 0, metadata !112, null}
!633 = metadata !{i32 382, i32 0, metadata !112, null}
!634 = metadata !{i32 384, i32 0, metadata !112, null}
!635 = metadata !{i32 386, i32 0, metadata !112, null}
!636 = metadata !{i32 387, i32 0, metadata !112, null}
!637 = metadata !{i32 389, i32 0, metadata !112, null}
!638 = metadata !{i32 391, i32 0, metadata !112, null}
!639 = metadata !{i32 393, i32 0, metadata !112, null}
!640 = metadata !{i32 396, i32 0, metadata !112, null}
!641 = metadata !{i32 397, i32 0, metadata !642, null}
!642 = metadata !{i32 786443, metadata !1, metadata !112, i32 397, i32 0, i32 36} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!643 = metadata !{i32 398, i32 0, metadata !644, null}
!644 = metadata !{i32 786443, metadata !1, metadata !642, i32 397, i32 0, i32 37} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!645 = metadata !{i32 399, i32 0, metadata !644, null}
!646 = metadata !{i32 400, i32 0, metadata !644, null}
!647 = metadata !{i32 401, i32 0, metadata !648, null}
!648 = metadata !{i32 786443, metadata !1, metadata !642, i32 400, i32 0, i32 38} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!649 = metadata !{i32 402, i32 0, metadata !648, null}
!650 = metadata !{i32 405, i32 0, metadata !112, null}
!651 = metadata !{i32 406, i32 0, metadata !112, null}
