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

; Function Attrs: minsize nounwind optsize uwtable
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

; Function Attrs: minsize nounwind optsize
declare noalias i8* @malloc(i64) #1

; Function Attrs: minsize nounwind optsize uwtable
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

; Function Attrs: minsize nounwind optsize uwtable
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

; Function Attrs: minsize nounwind optsize
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: minsize nounwind optsize uwtable
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

; Function Attrs: minsize nounwind optsize uwtable
define %struct.task* @Wait() #0 {
  %1 = load %struct.task** @tcb, align 8, !dbg !221, !tbaa !148
  %2 = getelementptr inbounds %struct.task* %1, i64 0, i32 4, !dbg !221
  %3 = load i32* %2, align 4, !dbg !221, !tbaa !164
  %4 = or i32 %3, 2, !dbg !221
  store i32 %4, i32* %2, align 4, !dbg !221, !tbaa !164
  ret %struct.task* %1, !dbg !222
}

; Function Attrs: minsize nounwind optsize uwtable
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

; Function Attrs: minsize nounwind optsize uwtable
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

; Function Attrs: minsize nounwind optsize uwtable
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

; Function Attrs: minsize nounwind optsize uwtable
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

; Function Attrs: minsize nounwind optsize uwtable
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

; Function Attrs: minsize nounwind optsize uwtable
define %struct.task* @idlefn(%struct.packet* nocapture readnone %pkt) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %pkt}, i64 0, metadata !86), !dbg !272
  %1 = load i64* @v2, align 8, !dbg !273, !tbaa !208
  %2 = add nsw i64 %1, -1, !dbg !273
  store i64 %2, i64* @v2, align 8, !dbg !273, !tbaa !208
  %3 = icmp eq i64 %2, 0, !dbg !274
  br i1 %3, label %4, label %6, !dbg !274

; <label>:4                                       ; preds = %0
  %5 = tail call %struct.task* @holdself() #5, !dbg !274
  br label %17, !dbg !274

; <label>:6                                       ; preds = %0
  %7 = load i64* @v1, align 8, !dbg !276, !tbaa !208
  %8 = and i64 %7, 1, !dbg !276
  %9 = icmp eq i64 %8, 0, !dbg !276
  %10 = lshr i64 %7, 1, !dbg !278
  %11 = and i64 %10, 32767, !dbg !278
  br i1 %9, label %12, label %14, !dbg !276

; <label>:12                                      ; preds = %6
  store i64 %11, i64* @v1, align 8, !dbg !278, !tbaa !208
  %13 = tail call %struct.task* @release(i32 5) #5, !dbg !280
  br label %17, !dbg !280

; <label>:14                                      ; preds = %6
  %15 = xor i64 %11, 53256, !dbg !281
  store i64 %15, i64* @v1, align 8, !dbg !281, !tbaa !208
  %16 = tail call %struct.task* @release(i32 6) #5, !dbg !283
  br label %17, !dbg !283

; <label>:17                                      ; preds = %14, %12, %4
  %.0 = phi %struct.task* [ %5, %4 ], [ %13, %12 ], [ %16, %14 ]
  ret %struct.task* %.0, !dbg !284
}

; Function Attrs: minsize nounwind optsize uwtable
define %struct.task* @workfn(%struct.packet* %pkt) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %pkt}, i64 0, metadata !89), !dbg !285
  %1 = icmp eq %struct.packet* %pkt, null, !dbg !286
  br i1 %1, label %2, label %7, !dbg !286

; <label>:2                                       ; preds = %0
  %3 = load %struct.task** @tcb, align 8, !dbg !287, !tbaa !148
  %4 = getelementptr inbounds %struct.task* %3, i64 0, i32 4, !dbg !287
  %5 = load i32* %4, align 4, !dbg !287, !tbaa !164
  %6 = or i32 %5, 2, !dbg !287
  store i32 %6, i32* %4, align 4, !dbg !287, !tbaa !164
  br label %22, !dbg !286

; <label>:7                                       ; preds = %0
  %8 = load i64* @v1, align 8, !dbg !288, !tbaa !208
  %9 = sub nsw i64 7, %8, !dbg !288
  store i64 %9, i64* @v1, align 8, !dbg !288, !tbaa !208
  %10 = trunc i64 %9 to i32, !dbg !289
  %11 = getelementptr inbounds %struct.packet* %pkt, i64 0, i32 1, !dbg !289
  store i32 %10, i32* %11, align 4, !dbg !289, !tbaa !183
  %12 = getelementptr inbounds %struct.packet* %pkt, i64 0, i32 3, !dbg !290
  store i32 0, i32* %12, align 4, !dbg !290, !tbaa !187
  tail call void @llvm.dbg.value(metadata !175, i64 0, metadata !90), !dbg !291
  br label %13, !dbg !291

; <label>:13                                      ; preds = %13, %7
  %indvars.iv = phi i64 [ 0, %7 ], [ %indvars.iv.next, %13 ]
  %14 = load i64* @v2, align 8, !dbg !293, !tbaa !208
  %15 = add nsw i64 %14, 1, !dbg !293
  %16 = icmp sgt i64 %14, 25, !dbg !295
  %. = select i1 %16, i64 1, i64 %15, !dbg !295
  store i64 %., i64* @v2, align 8, !dbg !295, !tbaa !208
  %17 = getelementptr inbounds [28 x i8]* @alphabet, i64 0, i64 %., !dbg !297
  %18 = load i8* %17, align 1, !dbg !297, !tbaa !298
  %19 = getelementptr inbounds %struct.packet* %pkt, i64 0, i32 4, i64 %indvars.iv, !dbg !297
  store i8 %18, i8* %19, align 1, !dbg !297, !tbaa !298
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !291
  %exitcond = icmp eq i64 %indvars.iv.next, 4, !dbg !291
  br i1 %exitcond, label %20, label %13, !dbg !291

; <label>:20                                      ; preds = %13
  %21 = tail call %struct.task* @qpkt(%struct.packet* %pkt) #5, !dbg !299
  br label %22, !dbg !299

; <label>:22                                      ; preds = %20, %2
  %.0 = phi %struct.task* [ %3, %2 ], [ %21, %20 ]
  ret %struct.task* %.0, !dbg !300
}

; Function Attrs: minsize nounwind optsize uwtable
define %struct.task* @handlerfn(%struct.packet* %pkt) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %pkt}, i64 0, metadata !95), !dbg !301
  %1 = icmp eq %struct.packet* %pkt, null, !dbg !302
  br i1 %1, label %12, label %2, !dbg !302

; <label>:2                                       ; preds = %0
  %3 = getelementptr inbounds %struct.packet* %pkt, i64 0, i32 2, !dbg !302
  %4 = load i32* %3, align 4, !dbg !302, !tbaa !185
  %5 = icmp eq i32 %4, 1001, !dbg !302
  %6 = select i1 %5, %struct.packet* bitcast (i64* @v1 to %struct.packet*), %struct.packet* bitcast (i64* @v2 to %struct.packet*), !dbg !302
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %pkt}, i64 0, metadata !304), !dbg !305
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %6}, i64 0, metadata !306), !dbg !305
  %7 = getelementptr inbounds %struct.packet* %pkt, i64 0, i32 0, !dbg !307
  store %struct.packet* null, %struct.packet** %7, align 8, !dbg !307, !tbaa !180
  br label %8, !dbg !308

; <label>:8                                       ; preds = %8, %2
  %.0.i = phi %struct.packet* [ %6, %2 ], [ %10, %8 ]
  %9 = getelementptr inbounds %struct.packet* %.0.i, i64 0, i32 0, !dbg !308
  %10 = load %struct.packet** %9, align 8, !dbg !308, !tbaa !180
  %11 = icmp eq %struct.packet* %10, null, !dbg !308
  br i1 %11, label %append.exit, label %8, !dbg !308

append.exit:                                      ; preds = %8
  store %struct.packet* %pkt, %struct.packet** %9, align 8, !dbg !309, !tbaa !180
  br label %12, !dbg !302

; <label>:12                                      ; preds = %0, %append.exit
  %13 = load i64* @v1, align 8, !dbg !310, !tbaa !208
  %14 = icmp eq i64 %13, 0, !dbg !310
  br i1 %14, label %40, label %15, !dbg !310

; <label>:15                                      ; preds = %12
  %16 = inttoptr i64 %13 to %struct.packet*, !dbg !311
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %16}, i64 0, metadata !99), !dbg !311
  %17 = getelementptr inbounds %struct.packet* %16, i64 0, i32 3, !dbg !312
  %18 = load i32* %17, align 4, !dbg !312, !tbaa !187
  tail call void @llvm.dbg.value(metadata !{i32 %18}, i64 0, metadata !96), !dbg !312
  %19 = icmp sgt i32 %18, 3, !dbg !313
  br i1 %19, label %20, label %25, !dbg !313

; <label>:20                                      ; preds = %15
  %21 = getelementptr inbounds %struct.packet* %16, i64 0, i32 0, !dbg !315
  %22 = load %struct.packet** %21, align 8, !dbg !315, !tbaa !180
  %23 = ptrtoint %struct.packet* %22 to i64, !dbg !315
  store i64 %23, i64* @v1, align 8, !dbg !315, !tbaa !208
  %24 = tail call %struct.task* @qpkt(%struct.packet* %16) #5, !dbg !317
  br label %45, !dbg !317

; <label>:25                                      ; preds = %15
  %26 = load i64* @v2, align 8, !dbg !318, !tbaa !208
  %27 = icmp eq i64 %26, 0, !dbg !318
  br i1 %27, label %40, label %28, !dbg !318

; <label>:28                                      ; preds = %25
  %29 = inttoptr i64 %26 to %struct.packet*, !dbg !319
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %29}, i64 0, metadata !100), !dbg !319
  %30 = getelementptr inbounds %struct.packet* %29, i64 0, i32 0, !dbg !320
  %31 = load %struct.packet** %30, align 8, !dbg !320, !tbaa !180
  %32 = ptrtoint %struct.packet* %31 to i64, !dbg !320
  store i64 %32, i64* @v2, align 8, !dbg !320, !tbaa !208
  %33 = sext i32 %18 to i64, !dbg !321
  %34 = getelementptr inbounds %struct.packet* %16, i64 0, i32 4, i64 %33, !dbg !321
  %35 = load i8* %34, align 1, !dbg !321, !tbaa !298
  %36 = sext i8 %35 to i32, !dbg !321
  %37 = getelementptr inbounds %struct.packet* %29, i64 0, i32 3, !dbg !321
  store i32 %36, i32* %37, align 4, !dbg !321, !tbaa !187
  %38 = add nsw i32 %18, 1, !dbg !322
  store i32 %38, i32* %17, align 4, !dbg !322, !tbaa !187
  %39 = tail call %struct.task* @qpkt(%struct.packet* %29) #5, !dbg !323
  br label %45, !dbg !323

; <label>:40                                      ; preds = %25, %12
  %41 = load %struct.task** @tcb, align 8, !dbg !324, !tbaa !148
  %42 = getelementptr inbounds %struct.task* %41, i64 0, i32 4, !dbg !324
  %43 = load i32* %42, align 4, !dbg !324, !tbaa !164
  %44 = or i32 %43, 2, !dbg !324
  store i32 %44, i32* %42, align 4, !dbg !324, !tbaa !164
  br label %45, !dbg !325

; <label>:45                                      ; preds = %40, %28, %20
  %.0 = phi %struct.task* [ %24, %20 ], [ %39, %28 ], [ %41, %40 ]
  ret %struct.task* %.0, !dbg !326
}

; Function Attrs: minsize nounwind optsize uwtable
define %struct.task* @devfn(%struct.packet* %pkt) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %pkt}, i64 0, metadata !105), !dbg !327
  %1 = icmp eq %struct.packet* %pkt, null, !dbg !328
  br i1 %1, label %2, label %13, !dbg !328

; <label>:2                                       ; preds = %0
  %3 = load i64* @v1, align 8, !dbg !330, !tbaa !208
  %4 = icmp eq i64 %3, 0, !dbg !330
  br i1 %4, label %5, label %10, !dbg !330

; <label>:5                                       ; preds = %2
  %6 = load %struct.task** @tcb, align 8, !dbg !333, !tbaa !148
  %7 = getelementptr inbounds %struct.task* %6, i64 0, i32 4, !dbg !333
  %8 = load i32* %7, align 4, !dbg !333, !tbaa !164
  %9 = or i32 %8, 2, !dbg !333
  store i32 %9, i32* %7, align 4, !dbg !333, !tbaa !164
  br label %23, !dbg !330

; <label>:10                                      ; preds = %2
  %11 = inttoptr i64 %3 to %struct.packet*, !dbg !334
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %11}, i64 0, metadata !105), !dbg !334
  store i64 0, i64* @v1, align 8, !dbg !335, !tbaa !208
  %12 = tail call %struct.task* @qpkt(%struct.packet* %11) #5, !dbg !336
  br label %23, !dbg !336

; <label>:13                                      ; preds = %0
  %14 = ptrtoint %struct.packet* %pkt to i64, !dbg !337
  store i64 %14, i64* @v1, align 8, !dbg !337, !tbaa !208
  %15 = load i32* @tracing, align 4, !dbg !339, !tbaa !192
  %16 = icmp eq i32 %15, 1, !dbg !339
  br i1 %16, label %17, label %21, !dbg !339

; <label>:17                                      ; preds = %13
  %18 = getelementptr inbounds %struct.packet* %pkt, i64 0, i32 3, !dbg !339
  %19 = load i32* %18, align 4, !dbg !339, !tbaa !187
  %20 = trunc i32 %19 to i8, !dbg !339
  tail call void @trace(i8 signext %20) #5, !dbg !339
  br label %21, !dbg !339

; <label>:21                                      ; preds = %17, %13
  %22 = tail call %struct.task* @holdself() #5, !dbg !341
  br label %23, !dbg !341

; <label>:23                                      ; preds = %21, %10, %5
  %.0 = phi %struct.task* [ %6, %5 ], [ %12, %10 ], [ %22, %21 ]
  ret %struct.task* %.0, !dbg !342
}

; Function Attrs: minsize nounwind optsize uwtable
define i32 @main() #0 {
  tail call void @llvm.dbg.value(metadata !200, i64 0, metadata !116), !dbg !343
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([20 x i8]* @str, i64 0, i64 0)), !dbg !344
  tail call void @createtask(i32 1, i32 0, %struct.packet* null, i32 0, %struct.task* (%struct.packet*)* @idlefn, i64 1, i64 10000000) #5, !dbg !345
  %1 = tail call %struct.packet* @pkt(%struct.packet* null, i32 0, i32 1001) #5, !dbg !346
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %1}, i64 0, metadata !116), !dbg !346
  %2 = tail call %struct.packet* @pkt(%struct.packet* %1, i32 0, i32 1001) #5, !dbg !347
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %2}, i64 0, metadata !116), !dbg !347
  tail call void @createtask(i32 2, i32 1000, %struct.packet* %2, i32 3, %struct.task* (%struct.packet*)* @workfn, i64 3, i64 0) #5, !dbg !348
  %3 = tail call %struct.packet* @pkt(%struct.packet* null, i32 5, i32 1000) #5, !dbg !349
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %3}, i64 0, metadata !116), !dbg !349
  %4 = tail call %struct.packet* @pkt(%struct.packet* %3, i32 5, i32 1000) #5, !dbg !350
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %4}, i64 0, metadata !116), !dbg !350
  %5 = tail call %struct.packet* @pkt(%struct.packet* %4, i32 5, i32 1000) #5, !dbg !351
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %5}, i64 0, metadata !116), !dbg !351
  tail call void @createtask(i32 3, i32 2000, %struct.packet* %5, i32 3, %struct.task* (%struct.packet*)* @handlerfn, i64 0, i64 0) #5, !dbg !352
  %6 = tail call %struct.packet* @pkt(%struct.packet* null, i32 6, i32 1000) #5, !dbg !353
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %6}, i64 0, metadata !116), !dbg !353
  %7 = tail call %struct.packet* @pkt(%struct.packet* %6, i32 6, i32 1000) #5, !dbg !354
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %7}, i64 0, metadata !116), !dbg !354
  %8 = tail call %struct.packet* @pkt(%struct.packet* %7, i32 6, i32 1000) #5, !dbg !355
  tail call void @llvm.dbg.value(metadata !{%struct.packet* %8}, i64 0, metadata !116), !dbg !355
  tail call void @createtask(i32 4, i32 3000, %struct.packet* %8, i32 3, %struct.task* (%struct.packet*)* @handlerfn, i64 0, i64 0) #5, !dbg !356
  tail call void @llvm.dbg.value(metadata !200, i64 0, metadata !116), !dbg !357
  tail call void @createtask(i32 5, i32 4000, %struct.packet* null, i32 2, %struct.task* (%struct.packet*)* @devfn, i64 0, i64 0) #5, !dbg !358
  tail call void @createtask(i32 6, i32 5000, %struct.packet* null, i32 2, %struct.task* (%struct.packet*)* @devfn, i64 0, i64 0) #5, !dbg !359
  %9 = load %struct.task** @tasklist, align 8, !dbg !360, !tbaa !148
  store %struct.task* %9, %struct.task** @tcb, align 8, !dbg !360, !tbaa !148
  store i32 0, i32* @holdcount, align 4, !dbg !361, !tbaa !192
  store i32 0, i32* @qpktcount, align 4, !dbg !361, !tbaa !192
  %puts2 = tail call i32 @puts(i8* getelementptr inbounds ([9 x i8]* @str11, i64 0, i64 0)), !dbg !362
  store i32 0, i32* @tracing, align 4, !dbg !363, !tbaa !192
  store i32 0, i32* @layout, align 4, !dbg !364, !tbaa !192
  tail call void @schedule() #5, !dbg !365
  %puts3 = tail call i32 @puts(i8* getelementptr inbounds ([9 x i8]* @str12, i64 0, i64 0)), !dbg !366
  %10 = load i32* @qpktcount, align 4, !dbg !367, !tbaa !192
  %11 = load i32* @holdcount, align 4, !dbg !367, !tbaa !192
  %12 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str6, i64 0, i64 0), i32 %10, i32 %11) #4, !dbg !367
  %13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str7, i64 0, i64 0)) #4, !dbg !368
  %14 = load i32* @qpktcount, align 4, !dbg !369, !tbaa !192
  %15 = icmp eq i32 %14, 23263894, !dbg !369
  %16 = load i32* @holdcount, align 4
  %17 = icmp eq i32 %16, 9305557, !dbg !369
  %or.cond = and i1 %15, %17, !dbg !369
  br i1 %or.cond, label %18, label %20, !dbg !369

; <label>:18                                      ; preds = %0
  %19 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str8, i64 0, i64 0)) #4, !dbg !371
  tail call void @llvm.dbg.value(metadata !175, i64 0, metadata !117), !dbg !373
  br label %22, !dbg !374

; <label>:20                                      ; preds = %0
  %21 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str9, i64 0, i64 0)) #4, !dbg !375
  tail call void @llvm.dbg.value(metadata !377, i64 0, metadata !117), !dbg !378
  br label %22

; <label>:22                                      ; preds = %20, %18
  %retval.0 = phi i32 [ 0, %18 ], [ 1, %20 ]
  %puts4 = tail call i32 @puts(i8* getelementptr inbounds ([12 x i8]* @str13, i64 0, i64 0)), !dbg !379
  ret i32 %retval.0, !dbg !380
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #2

; Function Attrs: nounwind
declare i32 @putchar(i32) #3

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #3

attributes #0 = { minsize nounwind optsize uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { minsize nounwind optsize "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind }
attributes #4 = { minsize nounwind optsize }
attributes #5 = { minsize optsize }

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
!276 = metadata !{i32 260, i32 0, metadata !277, null}
!277 = metadata !{i32 786443, metadata !1, metadata !84, i32 260, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!278 = metadata !{i32 262, i32 0, metadata !279, null}
!279 = metadata !{i32 786443, metadata !1, metadata !277, i32 261, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!280 = metadata !{i32 263, i32 0, metadata !279, null}
!281 = metadata !{i32 267, i32 0, metadata !282, null}
!282 = metadata !{i32 786443, metadata !1, metadata !277, i32 266, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!283 = metadata !{i32 268, i32 0, metadata !282, null}
!284 = metadata !{i32 270, i32 0, metadata !84, null}
!285 = metadata !{i32 272, i32 0, metadata !87, null}
!286 = metadata !{i32 274, i32 0, metadata !92, null}
!287 = metadata !{i32 194, i32 0, metadata !66, metadata !286}
!288 = metadata !{i32 279, i32 0, metadata !91, null}
!289 = metadata !{i32 280, i32 0, metadata !91, null}
!290 = metadata !{i32 282, i32 0, metadata !91, null}
!291 = metadata !{i32 283, i32 0, metadata !292, null}
!292 = metadata !{i32 786443, metadata !1, metadata !91, i32 283, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!293 = metadata !{i32 285, i32 0, metadata !294, null}
!294 = metadata !{i32 786443, metadata !1, metadata !292, i32 284, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!295 = metadata !{i32 286, i32 0, metadata !296, null}
!296 = metadata !{i32 786443, metadata !1, metadata !294, i32 286, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!297 = metadata !{i32 287, i32 0, metadata !294, null}
!298 = metadata !{metadata !150, metadata !150, i64 0}
!299 = metadata !{i32 289, i32 0, metadata !91, null}
!300 = metadata !{i32 291, i32 0, metadata !87, null}
!301 = metadata !{i32 293, i32 0, metadata !93, null}
!302 = metadata !{i32 295, i32 0, metadata !303, null}
!303 = metadata !{i32 786443, metadata !1, metadata !93, i32 295, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!304 = metadata !{i32 786689, metadata !106, metadata !"pkt", metadata !5, i32 16777557, metadata !9, i32 0, metadata !302} ; [ DW_TAG_arg_variable ] [pkt] [line 341]
!305 = metadata !{i32 341, i32 0, metadata !106, metadata !302}
!306 = metadata !{i32 786689, metadata !106, metadata !"ptr", metadata !5, i32 33554773, metadata !9, i32 0, metadata !302} ; [ DW_TAG_arg_variable ] [ptr] [line 341]
!307 = metadata !{i32 343, i32 0, metadata !106, metadata !302}
!308 = metadata !{i32 345, i32 0, metadata !106, metadata !302}
!309 = metadata !{i32 347, i32 0, metadata !106, metadata !302}
!310 = metadata !{i32 298, i32 0, metadata !98, null}
!311 = metadata !{i32 301, i32 0, metadata !97, null}
!312 = metadata !{i32 302, i32 0, metadata !97, null}
!313 = metadata !{i32 304, i32 0, metadata !314, null}
!314 = metadata !{i32 786443, metadata !1, metadata !97, i32 304, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!315 = metadata !{i32 306, i32 0, metadata !316, null}
!316 = metadata !{i32 786443, metadata !1, metadata !314, i32 305, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!317 = metadata !{i32 307, i32 0, metadata !316, null}
!318 = metadata !{i32 310, i32 0, metadata !102, null}
!319 = metadata !{i32 314, i32 0, metadata !101, null}
!320 = metadata !{i32 315, i32 0, metadata !101, null}
!321 = metadata !{i32 316, i32 0, metadata !101, null}
!322 = metadata !{i32 317, i32 0, metadata !101, null}
!323 = metadata !{i32 318, i32 0, metadata !101, null}
!324 = metadata !{i32 194, i32 0, metadata !66, metadata !325}
!325 = metadata !{i32 321, i32 0, metadata !93, null}
!326 = metadata !{i32 322, i32 0, metadata !93, null}
!327 = metadata !{i32 324, i32 0, metadata !103, null}
!328 = metadata !{i32 326, i32 0, metadata !329, null}
!329 = metadata !{i32 786443, metadata !1, metadata !103, i32 326, i32 0, i32 31} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!330 = metadata !{i32 328, i32 0, metadata !331, null}
!331 = metadata !{i32 786443, metadata !1, metadata !332, i32 328, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!332 = metadata !{i32 786443, metadata !1, metadata !329, i32 327, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!333 = metadata !{i32 194, i32 0, metadata !66, metadata !330}
!334 = metadata !{i32 329, i32 0, metadata !332, null}
!335 = metadata !{i32 330, i32 0, metadata !332, null}
!336 = metadata !{i32 331, i32 0, metadata !332, null}
!337 = metadata !{i32 335, i32 0, metadata !338, null}
!338 = metadata !{i32 786443, metadata !1, metadata !329, i32 334, i32 0, i32 34} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!339 = metadata !{i32 336, i32 0, metadata !340, null}
!340 = metadata !{i32 786443, metadata !1, metadata !338, i32 336, i32 0, i32 35} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!341 = metadata !{i32 337, i32 0, metadata !338, null}
!342 = metadata !{i32 339, i32 0, metadata !103, null}
!343 = metadata !{i32 352, i32 0, metadata !112, null}
!344 = metadata !{i32 355, i32 0, metadata !112, null}
!345 = metadata !{i32 357, i32 0, metadata !112, null}
!346 = metadata !{i32 359, i32 0, metadata !112, null}
!347 = metadata !{i32 360, i32 0, metadata !112, null}
!348 = metadata !{i32 362, i32 0, metadata !112, null}
!349 = metadata !{i32 364, i32 0, metadata !112, null}
!350 = metadata !{i32 365, i32 0, metadata !112, null}
!351 = metadata !{i32 366, i32 0, metadata !112, null}
!352 = metadata !{i32 368, i32 0, metadata !112, null}
!353 = metadata !{i32 370, i32 0, metadata !112, null}
!354 = metadata !{i32 371, i32 0, metadata !112, null}
!355 = metadata !{i32 372, i32 0, metadata !112, null}
!356 = metadata !{i32 374, i32 0, metadata !112, null}
!357 = metadata !{i32 376, i32 0, metadata !112, null}
!358 = metadata !{i32 377, i32 0, metadata !112, null}
!359 = metadata !{i32 378, i32 0, metadata !112, null}
!360 = metadata !{i32 380, i32 0, metadata !112, null}
!361 = metadata !{i32 382, i32 0, metadata !112, null}
!362 = metadata !{i32 384, i32 0, metadata !112, null}
!363 = metadata !{i32 386, i32 0, metadata !112, null}
!364 = metadata !{i32 387, i32 0, metadata !112, null}
!365 = metadata !{i32 389, i32 0, metadata !112, null}
!366 = metadata !{i32 391, i32 0, metadata !112, null}
!367 = metadata !{i32 393, i32 0, metadata !112, null}
!368 = metadata !{i32 396, i32 0, metadata !112, null}
!369 = metadata !{i32 397, i32 0, metadata !370, null}
!370 = metadata !{i32 786443, metadata !1, metadata !112, i32 397, i32 0, i32 36} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!371 = metadata !{i32 398, i32 0, metadata !372, null}
!372 = metadata !{i32 786443, metadata !1, metadata !370, i32 397, i32 0, i32 37} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!373 = metadata !{i32 399, i32 0, metadata !372, null}
!374 = metadata !{i32 400, i32 0, metadata !372, null}
!375 = metadata !{i32 401, i32 0, metadata !376, null}
!376 = metadata !{i32 786443, metadata !1, metadata !370, i32 400, i32 0, i32 38} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!377 = metadata !{i32 1}
!378 = metadata !{i32 402, i32 0, metadata !376, null}
!379 = metadata !{i32 405, i32 0, metadata !112, null}
!380 = metadata !{i32 406, i32 0, metadata !112, null}
