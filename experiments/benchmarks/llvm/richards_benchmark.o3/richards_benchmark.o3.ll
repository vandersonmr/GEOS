; ModuleID = 'richards_benchmark.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

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
entry:
  tail call void @llvm.dbg.value(metadata i32 %id, i64 0, metadata !38, metadata !140), !dbg !141
  tail call void @llvm.dbg.value(metadata i32 %pri, i64 0, metadata !39, metadata !140), !dbg !142
  tail call void @llvm.dbg.value(metadata %struct.packet* %wkq, i64 0, metadata !40, metadata !140), !dbg !143
  tail call void @llvm.dbg.value(metadata i32 %state, i64 0, metadata !41, metadata !140), !dbg !144
  tail call void @llvm.dbg.value(metadata %struct.task* (%struct.packet*)* %fn, i64 0, metadata !42, metadata !140), !dbg !145
  tail call void @llvm.dbg.value(metadata i64 %v1, i64 0, metadata !43, metadata !140), !dbg !146
  tail call void @llvm.dbg.value(metadata i64 %v2, i64 0, metadata !44, metadata !140), !dbg !147
  %call = tail call noalias i8* @malloc(i64 56) #3, !dbg !148
  %idxprom = sext i32 %id to i64, !dbg !149
  %arrayidx = getelementptr inbounds [11 x %struct.task*]* @tasktab, i64 0, i64 %idxprom, !dbg !149
  %0 = bitcast %struct.task** %arrayidx to i8**, !dbg !149
  store i8* %call, i8** %0, align 8, !dbg !149, !tbaa !150
  %1 = load %struct.task** @tasklist, align 8, !dbg !154, !tbaa !150
  %t_link = bitcast i8* %call to %struct.task**, !dbg !155
  store %struct.task* %1, %struct.task** %t_link, align 8, !dbg !155, !tbaa !156
  %t_id = getelementptr inbounds i8* %call, i64 8, !dbg !160
  %2 = bitcast i8* %t_id to i32*, !dbg !160
  store i32 %id, i32* %2, align 4, !dbg !160, !tbaa !161
  %t_pri = getelementptr inbounds i8* %call, i64 12, !dbg !162
  %3 = bitcast i8* %t_pri to i32*, !dbg !162
  store i32 %pri, i32* %3, align 4, !dbg !162, !tbaa !163
  %t_wkq = getelementptr inbounds i8* %call, i64 16, !dbg !164
  %4 = bitcast i8* %t_wkq to %struct.packet**, !dbg !164
  store %struct.packet* %wkq, %struct.packet** %4, align 8, !dbg !164, !tbaa !165
  %t_state = getelementptr inbounds i8* %call, i64 24, !dbg !166
  %5 = bitcast i8* %t_state to i32*, !dbg !166
  store i32 %state, i32* %5, align 4, !dbg !166, !tbaa !167
  %t_fn = getelementptr inbounds i8* %call, i64 32, !dbg !168
  %6 = bitcast i8* %t_fn to %struct.task* (%struct.packet*)**, !dbg !168
  store %struct.task* (%struct.packet*)* %fn, %struct.task* (%struct.packet*)** %6, align 8, !dbg !168, !tbaa !169
  %t_v1 = getelementptr inbounds i8* %call, i64 40, !dbg !170
  %7 = bitcast i8* %t_v1 to i64*, !dbg !170
  store i64 %v1, i64* %7, align 8, !dbg !170, !tbaa !171
  %t_v2 = getelementptr inbounds i8* %call, i64 48, !dbg !172
  %8 = bitcast i8* %t_v2 to i64*, !dbg !172
  store i64 %v2, i64* %8, align 8, !dbg !172, !tbaa !173
  store i8* %call, i8** bitcast (%struct.task** @tasklist to i8**), align 8, !dbg !174, !tbaa !150
  ret void, !dbg !175
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind uwtable
define noalias %struct.packet* @pkt(%struct.packet* %link, i32 %id, i32 %kind) #0 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.packet* %link, i64 0, metadata !50, metadata !140), !dbg !176
  tail call void @llvm.dbg.value(metadata i32 %id, i64 0, metadata !51, metadata !140), !dbg !177
  tail call void @llvm.dbg.value(metadata i32 %kind, i64 0, metadata !52, metadata !140), !dbg !178
  %call = tail call noalias i8* @malloc(i64 24) #3, !dbg !179
  tail call void @llvm.dbg.value(metadata %struct.packet* %1, i64 0, metadata !54, metadata !140), !dbg !180
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !53, metadata !140), !dbg !181
  %scevgep = getelementptr i8* %call, i64 20
  %0 = bitcast i8* %scevgep to i32*, !dbg !182
  store i32 0, i32* %0, align 1, !dbg !182
  %1 = bitcast i8* %call to %struct.packet*, !dbg !185
  %p_link = bitcast i8* %call to %struct.packet**, !dbg !186
  store %struct.packet* %link, %struct.packet** %p_link, align 8, !dbg !186, !tbaa !187
  %p_id = getelementptr inbounds i8* %call, i64 8, !dbg !189
  %2 = bitcast i8* %p_id to i32*, !dbg !189
  store i32 %id, i32* %2, align 4, !dbg !189, !tbaa !190
  %p_kind = getelementptr inbounds i8* %call, i64 12, !dbg !191
  %3 = bitcast i8* %p_kind to i32*, !dbg !191
  store i32 %kind, i32* %3, align 4, !dbg !191, !tbaa !192
  %p_a1 = getelementptr inbounds i8* %call, i64 16, !dbg !193
  %4 = bitcast i8* %p_a1 to i32*, !dbg !193
  store i32 0, i32* %4, align 4, !dbg !193, !tbaa !194
  ret %struct.packet* %1, !dbg !195
}

; Function Attrs: nounwind uwtable
define void @trace(i8 signext %a) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i8 %a, i64 0, metadata !59, metadata !140), !dbg !196
  %0 = load i32* @layout, align 4, !dbg !197, !tbaa !199
  %dec = add nsw i32 %0, -1, !dbg !197
  store i32 %dec, i32* @layout, align 4, !dbg !197, !tbaa !199
  %cmp = icmp slt i32 %0, 2, !dbg !197
  br i1 %cmp, label %if.then, label %if.end, !dbg !200

if.then:                                          ; preds = %entry
  %putchar2 = tail call i32 @putchar(i32 10) #3, !dbg !201
  store i32 50, i32* @layout, align 4, !dbg !203, !tbaa !199
  br label %if.end, !dbg !204

if.end:                                           ; preds = %if.then, %entry
  %conv = sext i8 %a to i32, !dbg !205
  %putchar = tail call i32 @putchar(i32 %conv) #3, !dbg !206
  ret void, !dbg !207
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind uwtable
define void @schedule() #0 {
entry:
  %.pr = load %struct.task** @tcb, align 8, !dbg !208, !tbaa !150
  %cmp13 = icmp eq %struct.task* %.pr, null, !dbg !208
  br i1 %cmp13, label %while.end, label %while.body.preheader, !dbg !211

while.body.preheader:                             ; preds = %entry
  br label %while.body, !dbg !212

while.body:                                       ; preds = %while.body.preheader, %while.cond.backedge
  %0 = phi %struct.task* [ %storemerge, %while.cond.backedge ], [ %.pr, %while.body.preheader ]
  tail call void @llvm.dbg.value(metadata %struct.packet* null, i64 0, metadata !64, metadata !140), !dbg !212
  %t_state = getelementptr inbounds %struct.task* %0, i64 0, i32 4, !dbg !213
  %1 = load i32* %t_state, align 4, !dbg !213, !tbaa !167
  switch i32 %1, label %while.end.loopexit [
    i32 3, label %sw.bb
    i32 0, label %sw.bb5
    i32 1, label %sw.bb5
    i32 2, label %sw.bb11
    i32 4, label %sw.bb11
    i32 5, label %sw.bb11
    i32 6, label %sw.bb11
    i32 7, label %sw.bb11
  ], !dbg !214

sw.bb:                                            ; preds = %while.body
  %t_wkq = getelementptr inbounds %struct.task* %0, i64 0, i32 3, !dbg !215
  %2 = load %struct.packet** %t_wkq, align 8, !dbg !215, !tbaa !165
  tail call void @llvm.dbg.value(metadata %struct.packet* %2, i64 0, metadata !64, metadata !140), !dbg !212
  %p_link = getelementptr inbounds %struct.packet* %2, i64 0, i32 0, !dbg !217
  %3 = load %struct.packet** %p_link, align 8, !dbg !217, !tbaa !187
  store %struct.packet* %3, %struct.packet** %t_wkq, align 8, !dbg !218, !tbaa !165
  %4 = load %struct.task** @tcb, align 8, !dbg !219, !tbaa !150
  %t_wkq2 = getelementptr inbounds %struct.task* %4, i64 0, i32 3, !dbg !219
  %5 = load %struct.packet** %t_wkq2, align 8, !dbg !219, !tbaa !165
  %not.cmp3 = icmp ne %struct.packet* %5, null, !dbg !219
  %cond = zext i1 %not.cmp3 to i32, !dbg !219
  %t_state4 = getelementptr inbounds %struct.task* %4, i64 0, i32 4, !dbg !220
  store i32 %cond, i32* %t_state4, align 4, !dbg !220, !tbaa !167
  br label %sw.bb5, !dbg !220

sw.bb5:                                           ; preds = %while.body, %while.body, %sw.bb
  %6 = phi %struct.task* [ %0, %while.body ], [ %0, %while.body ], [ %4, %sw.bb ]
  %pkt.0 = phi %struct.packet* [ null, %while.body ], [ null, %while.body ], [ %2, %sw.bb ]
  %t_id = getelementptr inbounds %struct.task* %6, i64 0, i32 1, !dbg !221
  %7 = load i32* %t_id, align 4, !dbg !221, !tbaa !161
  %conv = sext i32 %7 to i64, !dbg !221
  store i64 %conv, i64* @taskid, align 8, !dbg !222, !tbaa !223
  %t_v1 = getelementptr inbounds %struct.task* %6, i64 0, i32 6, !dbg !224
  %8 = load i64* %t_v1, align 8, !dbg !224, !tbaa !171
  store i64 %8, i64* @v1, align 8, !dbg !225, !tbaa !223
  %t_v2 = getelementptr inbounds %struct.task* %6, i64 0, i32 7, !dbg !226
  %9 = load i64* %t_v2, align 8, !dbg !226, !tbaa !173
  store i64 %9, i64* @v2, align 8, !dbg !227, !tbaa !223
  %10 = load i32* @tracing, align 4, !dbg !228, !tbaa !199
  %cmp6 = icmp eq i32 %10, 1, !dbg !228
  br i1 %cmp6, label %if.then, label %if.end, !dbg !230

if.then:                                          ; preds = %sw.bb5
  %11 = load i32* @layout, align 4, !dbg !231, !tbaa !199
  %dec.i = add nsw i32 %11, -1, !dbg !231
  store i32 %dec.i, i32* @layout, align 4, !dbg !231, !tbaa !199
  %cmp.i = icmp slt i32 %11, 2, !dbg !231
  br i1 %cmp.i, label %if.then.i, label %trace.exit, !dbg !233

if.then.i:                                        ; preds = %if.then
  %putchar2.i = tail call i32 @putchar(i32 10) #3, !dbg !234
  store i32 50, i32* @layout, align 4, !dbg !235, !tbaa !199
  br label %trace.exit, !dbg !236

trace.exit:                                       ; preds = %if.then, %if.then.i
  %add = shl i32 %7, 24, !dbg !237
  %sext = add i32 %add, 805306368, !dbg !237
  %conv.i = ashr exact i32 %sext, 24, !dbg !237
  %putchar.i = tail call i32 @putchar(i32 %conv.i) #3, !dbg !238
  %.pre = load %struct.task** @tcb, align 8, !dbg !239, !tbaa !150
  br label %if.end, !dbg !232

if.end:                                           ; preds = %trace.exit, %sw.bb5
  %12 = phi %struct.task* [ %.pre, %trace.exit ], [ %6, %sw.bb5 ]
  %t_fn = getelementptr inbounds %struct.task* %12, i64 0, i32 5, !dbg !239
  %13 = load %struct.task* (%struct.packet*)** %t_fn, align 8, !dbg !239, !tbaa !169
  %call = tail call %struct.task* %13(%struct.packet* %pkt.0) #3, !dbg !239
  tail call void @llvm.dbg.value(metadata %struct.task* %call, i64 0, metadata !66, metadata !140), !dbg !240
  %14 = load i64* @v1, align 8, !dbg !241, !tbaa !223
  %15 = load %struct.task** @tcb, align 8, !dbg !242, !tbaa !150
  %t_v19 = getelementptr inbounds %struct.task* %15, i64 0, i32 6, !dbg !242
  store i64 %14, i64* %t_v19, align 8, !dbg !242, !tbaa !171
  %16 = load i64* @v2, align 8, !dbg !243, !tbaa !223
  %t_v210 = getelementptr inbounds %struct.task* %15, i64 0, i32 7, !dbg !244
  store i64 %16, i64* %t_v210, align 8, !dbg !244, !tbaa !173
  br label %while.cond.backedge, !dbg !245

sw.bb11:                                          ; preds = %while.body, %while.body, %while.body, %while.body, %while.body
  %t_link = getelementptr inbounds %struct.task* %0, i64 0, i32 0, !dbg !246
  %17 = load %struct.task** %t_link, align 8, !dbg !246, !tbaa !156
  br label %while.cond.backedge, !dbg !247

while.cond.backedge:                              ; preds = %sw.bb11, %if.end
  %storemerge = phi %struct.task* [ %17, %sw.bb11 ], [ %call, %if.end ]
  store %struct.task* %storemerge, %struct.task** @tcb, align 8, !dbg !248, !tbaa !150
  %cmp = icmp eq %struct.task* %storemerge, null, !dbg !208
  br i1 %cmp, label %while.end.loopexit, label %while.body, !dbg !211

while.end.loopexit:                               ; preds = %while.cond.backedge, %while.body
  br label %while.end

while.end:                                        ; preds = %while.end.loopexit, %entry
  ret void, !dbg !249
}

; Function Attrs: nounwind uwtable
define %struct.task* @Wait() #0 {
entry:
  %0 = load %struct.task** @tcb, align 8, !dbg !250, !tbaa !150
  %t_state = getelementptr inbounds %struct.task* %0, i64 0, i32 4, !dbg !250
  %1 = load i32* %t_state, align 4, !dbg !250, !tbaa !167
  %or = or i32 %1, 2, !dbg !250
  store i32 %or, i32* %t_state, align 4, !dbg !250, !tbaa !167
  ret %struct.task* %0, !dbg !251
}

; Function Attrs: nounwind uwtable
define %struct.task* @holdself() #0 {
entry:
  %0 = load i32* @holdcount, align 4, !dbg !252, !tbaa !199
  %inc = add nsw i32 %0, 1, !dbg !252
  store i32 %inc, i32* @holdcount, align 4, !dbg !252, !tbaa !199
  %1 = load %struct.task** @tcb, align 8, !dbg !253, !tbaa !150
  %t_state = getelementptr inbounds %struct.task* %1, i64 0, i32 4, !dbg !253
  %2 = load i32* %t_state, align 4, !dbg !253, !tbaa !167
  %or = or i32 %2, 4, !dbg !253
  store i32 %or, i32* %t_state, align 4, !dbg !253, !tbaa !167
  %t_link = getelementptr inbounds %struct.task* %1, i64 0, i32 0, !dbg !254
  %3 = load %struct.task** %t_link, align 8, !dbg !254, !tbaa !156
  ret %struct.task* %3, !dbg !255
}

; Function Attrs: nounwind uwtable
define %struct.task* @findtcb(i32 %id) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %id, i64 0, metadata !75, metadata !140), !dbg !256
  tail call void @llvm.dbg.value(metadata %struct.task* null, i64 0, metadata !76, metadata !140), !dbg !257
  %id.off = add i32 %id, -1, !dbg !258
  %0 = icmp ult i32 %id.off, 10, !dbg !258
  br i1 %0, label %if.end, label %if.then5, !dbg !258

if.end:                                           ; preds = %entry
  %conv = sext i32 %id to i64, !dbg !259
  %arrayidx = getelementptr inbounds [11 x %struct.task*]* @tasktab, i64 0, i64 %conv, !dbg !262
  %1 = load %struct.task** %arrayidx, align 8, !dbg !262, !tbaa !150
  tail call void @llvm.dbg.value(metadata %struct.task* %1, i64 0, metadata !76, metadata !140), !dbg !257
  %cmp3 = icmp eq %struct.task* %1, null, !dbg !263
  br i1 %cmp3, label %if.then5, label %if.end6, !dbg !265

if.then5:                                         ; preds = %entry, %if.end
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str2, i64 0, i64 0), i32 %id) #3, !dbg !266
  br label %if.end6, !dbg !266

if.end6:                                          ; preds = %if.then5, %if.end
  %t.012 = phi %struct.task* [ null, %if.then5 ], [ %1, %if.end ]
  ret %struct.task* %t.012, !dbg !267
}

; Function Attrs: nounwind uwtable
define %struct.task* @release(i32 %id) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %id, i64 0, metadata !79, metadata !140), !dbg !268
  tail call void @llvm.dbg.value(metadata i32 %id, i64 0, metadata !269, metadata !140) #3, !dbg !271
  tail call void @llvm.dbg.value(metadata %struct.task* null, i64 0, metadata !272, metadata !140) #3, !dbg !273
  %id.off.i = add i32 %id, -1, !dbg !274
  %0 = icmp ult i32 %id.off.i, 10, !dbg !274
  br i1 %0, label %if.end.i, label %findtcb.exit.thread, !dbg !274

if.end.i:                                         ; preds = %entry
  %conv.i = sext i32 %id to i64, !dbg !275
  %arrayidx.i = getelementptr inbounds [11 x %struct.task*]* @tasktab, i64 0, i64 %conv.i, !dbg !276
  %1 = load %struct.task** %arrayidx.i, align 8, !dbg !276, !tbaa !150
  tail call void @llvm.dbg.value(metadata %struct.task* %1, i64 0, metadata !272, metadata !140) #3, !dbg !273
  %cmp3.i = icmp eq %struct.task* %1, null, !dbg !277
  br i1 %cmp3.i, label %findtcb.exit.thread, label %if.end, !dbg !278

findtcb.exit.thread:                              ; preds = %entry, %if.end.i
  %call.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str2, i64 0, i64 0), i32 %id) #3, !dbg !279
  br label %return, !dbg !280

if.end:                                           ; preds = %if.end.i
  %t_state = getelementptr inbounds %struct.task* %1, i64 0, i32 4, !dbg !281
  %2 = load i32* %t_state, align 4, !dbg !281, !tbaa !167
  %and = and i32 %2, 65531, !dbg !281
  store i32 %and, i32* %t_state, align 4, !dbg !281, !tbaa !167
  %t_pri = getelementptr inbounds %struct.task* %1, i64 0, i32 2, !dbg !282
  %3 = load i32* %t_pri, align 4, !dbg !282, !tbaa !163
  %4 = load %struct.task** @tcb, align 8, !dbg !284, !tbaa !150
  %t_pri1 = getelementptr inbounds %struct.task* %4, i64 0, i32 2, !dbg !284
  %5 = load i32* %t_pri1, align 4, !dbg !284, !tbaa !163
  %cmp2 = icmp sgt i32 %3, %5, !dbg !282
  %call. = select i1 %cmp2, %struct.task* %1, %struct.task* %4, !dbg !285
  br label %return, !dbg !285

return:                                           ; preds = %findtcb.exit.thread, %if.end
  %retval.0 = phi %struct.task* [ %call., %if.end ], [ null, %findtcb.exit.thread ]
  ret %struct.task* %retval.0, !dbg !286
}

; Function Attrs: nounwind uwtable
define %struct.task* @qpkt(%struct.packet* %pkt) #0 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.packet* %pkt, i64 0, metadata !83, metadata !140), !dbg !287
  %p_id = getelementptr inbounds %struct.packet* %pkt, i64 0, i32 1, !dbg !288
  %0 = load i32* %p_id, align 4, !dbg !288, !tbaa !190
  tail call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !289, metadata !140) #3, !dbg !291
  tail call void @llvm.dbg.value(metadata %struct.task* null, i64 0, metadata !292, metadata !140) #3, !dbg !293
  %id.off.i = add i32 %0, -1, !dbg !294
  %1 = icmp ult i32 %id.off.i, 10, !dbg !294
  br i1 %1, label %if.end.i, label %findtcb.exit.thread, !dbg !294

if.end.i:                                         ; preds = %entry
  %conv.i = sext i32 %0 to i64, !dbg !295
  %arrayidx.i = getelementptr inbounds [11 x %struct.task*]* @tasktab, i64 0, i64 %conv.i, !dbg !296
  %2 = load %struct.task** %arrayidx.i, align 8, !dbg !296, !tbaa !150
  tail call void @llvm.dbg.value(metadata %struct.task* %2, i64 0, metadata !292, metadata !140) #3, !dbg !293
  %cmp3.i = icmp eq %struct.task* %2, null, !dbg !297
  br i1 %cmp3.i, label %findtcb.exit.thread, label %if.end, !dbg !298

findtcb.exit.thread:                              ; preds = %entry, %if.end.i
  %call.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str2, i64 0, i64 0), i32 %0) #3, !dbg !299
  br label %return, !dbg !300

if.end:                                           ; preds = %if.end.i
  %3 = load i32* @qpktcount, align 4, !dbg !301, !tbaa !199
  %inc = add nsw i32 %3, 1, !dbg !301
  store i32 %inc, i32* @qpktcount, align 4, !dbg !301, !tbaa !199
  %p_link = getelementptr inbounds %struct.packet* %pkt, i64 0, i32 0, !dbg !302
  store %struct.packet* null, %struct.packet** %p_link, align 8, !dbg !302, !tbaa !187
  %4 = load i64* @taskid, align 8, !dbg !303, !tbaa !223
  %conv = trunc i64 %4 to i32, !dbg !303
  store i32 %conv, i32* %p_id, align 4, !dbg !304, !tbaa !190
  %t_wkq = getelementptr inbounds %struct.task* %2, i64 0, i32 3, !dbg !305
  %5 = load %struct.packet** %t_wkq, align 8, !dbg !305, !tbaa !165
  %cmp2 = icmp eq %struct.packet* %5, null, !dbg !305
  br i1 %cmp2, label %if.then4, label %if.else, !dbg !307

if.then4:                                         ; preds = %if.end
  store %struct.packet* %pkt, %struct.packet** %t_wkq, align 8, !dbg !308, !tbaa !165
  %t_state = getelementptr inbounds %struct.task* %2, i64 0, i32 4, !dbg !310
  %6 = load i32* %t_state, align 4, !dbg !310, !tbaa !167
  %or = or i32 %6, 1, !dbg !310
  store i32 %or, i32* %t_state, align 4, !dbg !310, !tbaa !167
  %t_pri = getelementptr inbounds %struct.task* %2, i64 0, i32 2, !dbg !311
  %7 = load i32* %t_pri, align 4, !dbg !311, !tbaa !163
  %8 = load %struct.task** @tcb, align 8, !dbg !313, !tbaa !150
  %t_pri6 = getelementptr inbounds %struct.task* %8, i64 0, i32 2, !dbg !313
  %9 = load i32* %t_pri6, align 4, !dbg !313, !tbaa !163
  %cmp7 = icmp sgt i32 %7, %9, !dbg !311
  br i1 %cmp7, label %return, label %if.end12, !dbg !314

if.else:                                          ; preds = %if.end
  %10 = bitcast %struct.packet** %t_wkq to %struct.packet*, !dbg !315
  tail call void @llvm.dbg.value(metadata %struct.packet* %pkt, i64 0, metadata !317, metadata !140), !dbg !319
  tail call void @llvm.dbg.value(metadata %struct.packet* %10, i64 0, metadata !320, metadata !140), !dbg !321
  store %struct.packet* null, %struct.packet** %p_link, align 8, !dbg !322, !tbaa !187
  br label %while.cond.i, !dbg !323

while.cond.i:                                     ; preds = %while.cond.i, %if.else
  %ptr.addr.0.i = phi %struct.packet* [ %10, %if.else ], [ %11, %while.cond.i ], !dbg !318
  %p_link1.i = getelementptr inbounds %struct.packet* %ptr.addr.0.i, i64 0, i32 0, !dbg !324
  %11 = load %struct.packet** %p_link1.i, align 8, !dbg !324, !tbaa !187
  %tobool.i = icmp eq %struct.packet* %11, null, !dbg !323
  br i1 %tobool.i, label %append.exit, label %while.cond.i, !dbg !323

append.exit:                                      ; preds = %while.cond.i
  %p_link1.i.lcssa = phi %struct.packet** [ %p_link1.i, %while.cond.i ]
  store %struct.packet* %pkt, %struct.packet** %p_link1.i.lcssa, align 8, !dbg !327, !tbaa !187
  %.pre = load %struct.task** @tcb, align 8, !dbg !328, !tbaa !150
  br label %if.end12

if.end12:                                         ; preds = %if.then4, %append.exit
  %12 = phi %struct.task* [ %8, %if.then4 ], [ %.pre, %append.exit ]
  br label %return, !dbg !329

return:                                           ; preds = %findtcb.exit.thread, %if.then4, %if.end12
  %retval.0 = phi %struct.task* [ %12, %if.end12 ], [ %2, %if.then4 ], [ null, %findtcb.exit.thread ]
  ret %struct.task* %retval.0, !dbg !330
}

; Function Attrs: nounwind uwtable
define void @append(%struct.packet* %pkt, %struct.packet* nocapture %ptr) #0 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.packet* %pkt, i64 0, metadata !111, metadata !140), !dbg !331
  tail call void @llvm.dbg.value(metadata %struct.packet* %ptr, i64 0, metadata !112, metadata !140), !dbg !332
  %p_link = getelementptr inbounds %struct.packet* %pkt, i64 0, i32 0, !dbg !333
  store %struct.packet* null, %struct.packet** %p_link, align 8, !dbg !333, !tbaa !187
  br label %while.cond, !dbg !334

while.cond:                                       ; preds = %while.cond, %entry
  %ptr.addr.0 = phi %struct.packet* [ %ptr, %entry ], [ %0, %while.cond ]
  %p_link1 = getelementptr inbounds %struct.packet* %ptr.addr.0, i64 0, i32 0, !dbg !335
  %0 = load %struct.packet** %p_link1, align 8, !dbg !335, !tbaa !187
  %tobool = icmp eq %struct.packet* %0, null, !dbg !334
  br i1 %tobool, label %while.end, label %while.cond, !dbg !334

while.end:                                        ; preds = %while.cond
  %p_link1.lcssa = phi %struct.packet** [ %p_link1, %while.cond ]
  store %struct.packet* %pkt, %struct.packet** %p_link1.lcssa, align 8, !dbg !336, !tbaa !187
  ret void, !dbg !337
}

; Function Attrs: nounwind uwtable
define %struct.task* @idlefn(%struct.packet* nocapture readnone %pkt) #0 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.packet* %pkt, i64 0, metadata !87, metadata !140), !dbg !338
  %0 = load i64* @v2, align 8, !dbg !339, !tbaa !223
  %dec = add nsw i64 %0, -1, !dbg !339
  store i64 %dec, i64* @v2, align 8, !dbg !339, !tbaa !223
  %cmp = icmp eq i64 %dec, 0, !dbg !340
  br i1 %cmp, label %if.then, label %if.end, !dbg !342

if.then:                                          ; preds = %entry
  %1 = load i32* @holdcount, align 4, !dbg !343, !tbaa !199
  %inc.i = add nsw i32 %1, 1, !dbg !343
  store i32 %inc.i, i32* @holdcount, align 4, !dbg !343, !tbaa !199
  %2 = load %struct.task** @tcb, align 8, !dbg !346, !tbaa !150
  %t_state.i = getelementptr inbounds %struct.task* %2, i64 0, i32 4, !dbg !346
  %3 = load i32* %t_state.i, align 4, !dbg !346, !tbaa !167
  %or.i = or i32 %3, 4, !dbg !346
  store i32 %or.i, i32* %t_state.i, align 4, !dbg !346, !tbaa !167
  %t_link.i = getelementptr inbounds %struct.task* %2, i64 0, i32 0, !dbg !347
  %4 = load %struct.task** %t_link.i, align 8, !dbg !347, !tbaa !156
  br label %return, !dbg !348

if.end:                                           ; preds = %entry
  %5 = load i64* @v1, align 8, !dbg !349, !tbaa !223
  %and = and i64 %5, 1, !dbg !349
  %cmp1 = icmp eq i64 %and, 0, !dbg !351
  %shr8 = lshr i64 %5, 1, !dbg !352
  %and3 = and i64 %shr8, 32767, !dbg !354
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !355

if.then2:                                         ; preds = %if.end
  store i64 %and3, i64* @v1, align 8, !dbg !356, !tbaa !223
  tail call void @llvm.dbg.value(metadata i32 5, i64 0, metadata !357, metadata !140) #3, !dbg !359
  tail call void @llvm.dbg.value(metadata i32 5, i64 0, metadata !360, metadata !140) #3, !dbg !362
  tail call void @llvm.dbg.value(metadata %struct.task* null, i64 0, metadata !363, metadata !140) #3, !dbg !364
  %6 = load %struct.task** getelementptr inbounds ([11 x %struct.task*]* @tasktab, i64 0, i64 5), align 8, !dbg !365, !tbaa !150
  tail call void @llvm.dbg.value(metadata %struct.task* %6, i64 0, metadata !363, metadata !140) #3, !dbg !364
  %cmp3.i.i10 = icmp eq %struct.task* %6, null, !dbg !366
  br i1 %cmp3.i.i10, label %findtcb.exit.thread.i12, label %if.end.i19, !dbg !367

findtcb.exit.thread.i12:                          ; preds = %if.then2
  %call.i.i11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str2, i64 0, i64 0), i32 5) #3, !dbg !368
  br label %return, !dbg !369

if.end.i19:                                       ; preds = %if.then2
  %t_state.i13 = getelementptr inbounds %struct.task* %6, i64 0, i32 4, !dbg !370
  %7 = load i32* %t_state.i13, align 4, !dbg !370, !tbaa !167
  %and.i14 = and i32 %7, 65531, !dbg !370
  store i32 %and.i14, i32* %t_state.i13, align 4, !dbg !370, !tbaa !167
  %t_pri.i15 = getelementptr inbounds %struct.task* %6, i64 0, i32 2, !dbg !371
  %8 = load i32* %t_pri.i15, align 4, !dbg !371, !tbaa !163
  %9 = load %struct.task** @tcb, align 8, !dbg !372, !tbaa !150
  %t_pri1.i16 = getelementptr inbounds %struct.task* %9, i64 0, i32 2, !dbg !372
  %10 = load i32* %t_pri1.i16, align 4, !dbg !372, !tbaa !163
  %cmp2.i17 = icmp sgt i32 %8, %10, !dbg !371
  %call..i18 = select i1 %cmp2.i17, %struct.task* %6, %struct.task* %9, !dbg !373
  br label %return, !dbg !373

if.else:                                          ; preds = %if.end
  %xor = xor i64 %and3, 53256, !dbg !374
  store i64 %xor, i64* @v1, align 8, !dbg !376, !tbaa !223
  tail call void @llvm.dbg.value(metadata i32 6, i64 0, metadata !377, metadata !140) #3, !dbg !379
  tail call void @llvm.dbg.value(metadata i32 6, i64 0, metadata !380, metadata !140) #3, !dbg !382
  tail call void @llvm.dbg.value(metadata %struct.task* null, i64 0, metadata !383, metadata !140) #3, !dbg !384
  %11 = load %struct.task** getelementptr inbounds ([11 x %struct.task*]* @tasktab, i64 0, i64 6), align 16, !dbg !385, !tbaa !150
  tail call void @llvm.dbg.value(metadata %struct.task* %11, i64 0, metadata !383, metadata !140) #3, !dbg !384
  %cmp3.i.i = icmp eq %struct.task* %11, null, !dbg !386
  br i1 %cmp3.i.i, label %findtcb.exit.thread.i, label %if.end.i, !dbg !387

findtcb.exit.thread.i:                            ; preds = %if.else
  %call.i.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str2, i64 0, i64 0), i32 6) #3, !dbg !388
  br label %return, !dbg !389

if.end.i:                                         ; preds = %if.else
  %t_state.i9 = getelementptr inbounds %struct.task* %11, i64 0, i32 4, !dbg !390
  %12 = load i32* %t_state.i9, align 4, !dbg !390, !tbaa !167
  %and.i = and i32 %12, 65531, !dbg !390
  store i32 %and.i, i32* %t_state.i9, align 4, !dbg !390, !tbaa !167
  %t_pri.i = getelementptr inbounds %struct.task* %11, i64 0, i32 2, !dbg !391
  %13 = load i32* %t_pri.i, align 4, !dbg !391, !tbaa !163
  %14 = load %struct.task** @tcb, align 8, !dbg !392, !tbaa !150
  %t_pri1.i = getelementptr inbounds %struct.task* %14, i64 0, i32 2, !dbg !392
  %15 = load i32* %t_pri1.i, align 4, !dbg !392, !tbaa !163
  %cmp2.i = icmp sgt i32 %13, %15, !dbg !391
  %call..i = select i1 %cmp2.i, %struct.task* %11, %struct.task* %14, !dbg !393
  br label %return, !dbg !393

return:                                           ; preds = %if.end.i, %findtcb.exit.thread.i, %if.end.i19, %findtcb.exit.thread.i12, %if.then
  %retval.0 = phi %struct.task* [ %4, %if.then ], [ %call..i18, %if.end.i19 ], [ null, %findtcb.exit.thread.i12 ], [ %call..i, %if.end.i ], [ null, %findtcb.exit.thread.i ]
  ret %struct.task* %retval.0, !dbg !394
}

; Function Attrs: nounwind uwtable
define %struct.task* @workfn(%struct.packet* %pkt) #0 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.packet* %pkt, i64 0, metadata !90, metadata !140), !dbg !395
  %cmp = icmp eq %struct.packet* %pkt, null, !dbg !396
  br i1 %cmp, label %if.then, label %if.else, !dbg !397

if.then:                                          ; preds = %entry
  %0 = load %struct.task** @tcb, align 8, !dbg !398, !tbaa !150
  %t_state.i = getelementptr inbounds %struct.task* %0, i64 0, i32 4, !dbg !398
  %1 = load i32* %t_state.i, align 4, !dbg !398, !tbaa !167
  %or.i = or i32 %1, 2, !dbg !398
  store i32 %or.i, i32* %t_state.i, align 4, !dbg !398, !tbaa !167
  br label %return, !dbg !401

if.else:                                          ; preds = %entry
  %2 = load i64* @v1, align 8, !dbg !402, !tbaa !223
  %sub = sub nsw i64 7, %2, !dbg !403
  store i64 %sub, i64* @v1, align 8, !dbg !404, !tbaa !223
  %conv = trunc i64 %sub to i32, !dbg !405
  %p_id = getelementptr inbounds %struct.packet* %pkt, i64 0, i32 1, !dbg !406
  store i32 %conv, i32* %p_id, align 4, !dbg !406, !tbaa !190
  %p_a1 = getelementptr inbounds %struct.packet* %pkt, i64 0, i32 3, !dbg !407
  store i32 0, i32* %p_a1, align 4, !dbg !407, !tbaa !194
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !91, metadata !140), !dbg !408
  %3 = load i64* @v2, align 8, !dbg !409, !tbaa !223
  %inc = add nsw i64 %3, 1, !dbg !409
  %cmp3 = icmp sgt i64 %3, 25, !dbg !413
  %.inc = select i1 %cmp3, i64 1, i64 %inc, !dbg !415
  store i64 %.inc, i64* @v2, align 8, !dbg !416, !tbaa !223
  %arrayidx = getelementptr inbounds [28 x i8]* @alphabet, i64 0, i64 %.inc, !dbg !418
  %4 = load i8* %arrayidx, align 1, !dbg !418, !tbaa !419
  %arrayidx6 = getelementptr inbounds %struct.packet* %pkt, i64 0, i32 4, i64 0, !dbg !420
  store i8 %4, i8* %arrayidx6, align 1, !dbg !420, !tbaa !419
  %5 = load i64* @v2, align 8, !dbg !409, !tbaa !223
  %inc.1 = add nsw i64 %5, 1, !dbg !409
  %cmp3.1 = icmp sgt i64 %5, 25, !dbg !413
  %.inc.1 = select i1 %cmp3.1, i64 1, i64 %inc.1, !dbg !415
  store i64 %.inc.1, i64* @v2, align 8, !dbg !416, !tbaa !223
  %arrayidx.1 = getelementptr inbounds [28 x i8]* @alphabet, i64 0, i64 %.inc.1, !dbg !418
  %6 = load i8* %arrayidx.1, align 1, !dbg !418, !tbaa !419
  %arrayidx6.1 = getelementptr inbounds %struct.packet* %pkt, i64 0, i32 4, i64 1, !dbg !420
  store i8 %6, i8* %arrayidx6.1, align 1, !dbg !420, !tbaa !419
  %7 = load i64* @v2, align 8, !dbg !409, !tbaa !223
  %inc.2 = add nsw i64 %7, 1, !dbg !409
  %cmp3.2 = icmp sgt i64 %7, 25, !dbg !413
  %.inc.2 = select i1 %cmp3.2, i64 1, i64 %inc.2, !dbg !415
  store i64 %.inc.2, i64* @v2, align 8, !dbg !416, !tbaa !223
  %arrayidx.2 = getelementptr inbounds [28 x i8]* @alphabet, i64 0, i64 %.inc.2, !dbg !418
  %8 = load i8* %arrayidx.2, align 1, !dbg !418, !tbaa !419
  %arrayidx6.2 = getelementptr inbounds %struct.packet* %pkt, i64 0, i32 4, i64 2, !dbg !420
  store i8 %8, i8* %arrayidx6.2, align 1, !dbg !420, !tbaa !419
  %9 = load i64* @v2, align 8, !dbg !409, !tbaa !223
  %inc.3 = add nsw i64 %9, 1, !dbg !409
  %cmp3.3 = icmp sgt i64 %9, 25, !dbg !413
  %.inc.3 = select i1 %cmp3.3, i64 1, i64 %inc.3, !dbg !415
  store i64 %.inc.3, i64* @v2, align 8, !dbg !416, !tbaa !223
  %arrayidx.3 = getelementptr inbounds [28 x i8]* @alphabet, i64 0, i64 %.inc.3, !dbg !418
  %10 = load i8* %arrayidx.3, align 1, !dbg !418, !tbaa !419
  %arrayidx6.3 = getelementptr inbounds %struct.packet* %pkt, i64 0, i32 4, i64 3, !dbg !420
  store i8 %10, i8* %arrayidx6.3, align 1, !dbg !420, !tbaa !419
  tail call void @llvm.dbg.value(metadata %struct.packet* %pkt, i64 0, metadata !421, metadata !140) #3, !dbg !423
  tail call void @llvm.dbg.value(metadata i32 %conv, i64 0, metadata !424, metadata !140) #3, !dbg !426
  tail call void @llvm.dbg.value(metadata %struct.task* null, i64 0, metadata !427, metadata !140) #3, !dbg !428
  %id.off.i.i = add i32 %conv, -1, !dbg !429
  %11 = icmp ult i32 %id.off.i.i, 10, !dbg !429
  br i1 %11, label %if.end.i.i, label %findtcb.exit.thread.i, !dbg !429

if.end.i.i:                                       ; preds = %if.else
  %sext = shl i64 %sub, 32, !dbg !430
  %conv.i.i = ashr exact i64 %sext, 32, !dbg !430
  %arrayidx.i.i = getelementptr inbounds [11 x %struct.task*]* @tasktab, i64 0, i64 %conv.i.i, !dbg !431
  %12 = load %struct.task** %arrayidx.i.i, align 8, !dbg !431, !tbaa !150
  tail call void @llvm.dbg.value(metadata %struct.task* %12, i64 0, metadata !427, metadata !140) #3, !dbg !428
  %cmp3.i.i = icmp eq %struct.task* %12, null, !dbg !432
  br i1 %cmp3.i.i, label %findtcb.exit.thread.i, label %if.end.i, !dbg !433

findtcb.exit.thread.i:                            ; preds = %if.end.i.i, %if.else
  %call.i.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str2, i64 0, i64 0), i32 %conv) #3, !dbg !434
  br label %return, !dbg !435

if.end.i:                                         ; preds = %if.end.i.i
  %13 = load i32* @qpktcount, align 4, !dbg !436, !tbaa !199
  %inc.i = add nsw i32 %13, 1, !dbg !436
  store i32 %inc.i, i32* @qpktcount, align 4, !dbg !436, !tbaa !199
  %p_link.i = getelementptr inbounds %struct.packet* %pkt, i64 0, i32 0, !dbg !437
  store %struct.packet* null, %struct.packet** %p_link.i, align 8, !dbg !437, !tbaa !187
  %14 = load i64* @taskid, align 8, !dbg !438, !tbaa !223
  %conv.i = trunc i64 %14 to i32, !dbg !438
  store i32 %conv.i, i32* %p_id, align 4, !dbg !439, !tbaa !190
  %t_wkq.i = getelementptr inbounds %struct.task* %12, i64 0, i32 3, !dbg !440
  %15 = load %struct.packet** %t_wkq.i, align 8, !dbg !440, !tbaa !165
  %cmp2.i = icmp eq %struct.packet* %15, null, !dbg !440
  br i1 %cmp2.i, label %if.then4.i, label %if.else.i, !dbg !441

if.then4.i:                                       ; preds = %if.end.i
  store %struct.packet* %pkt, %struct.packet** %t_wkq.i, align 8, !dbg !442, !tbaa !165
  %t_state.i15 = getelementptr inbounds %struct.task* %12, i64 0, i32 4, !dbg !443
  %16 = load i32* %t_state.i15, align 4, !dbg !443, !tbaa !167
  %or.i16 = or i32 %16, 1, !dbg !443
  store i32 %or.i16, i32* %t_state.i15, align 4, !dbg !443, !tbaa !167
  %t_pri.i = getelementptr inbounds %struct.task* %12, i64 0, i32 2, !dbg !444
  %17 = load i32* %t_pri.i, align 4, !dbg !444, !tbaa !163
  %18 = load %struct.task** @tcb, align 8, !dbg !445, !tbaa !150
  %t_pri6.i = getelementptr inbounds %struct.task* %18, i64 0, i32 2, !dbg !445
  %19 = load i32* %t_pri6.i, align 4, !dbg !445, !tbaa !163
  %cmp7.i = icmp sgt i32 %17, %19, !dbg !444
  br i1 %cmp7.i, label %return, label %if.end12.i, !dbg !446

if.else.i:                                        ; preds = %if.end.i
  %20 = bitcast %struct.packet** %t_wkq.i to %struct.packet*, !dbg !447
  tail call void @llvm.dbg.value(metadata %struct.packet* %pkt, i64 0, metadata !448, metadata !140) #3, !dbg !450
  tail call void @llvm.dbg.value(metadata %struct.packet* %20, i64 0, metadata !451, metadata !140) #3, !dbg !452
  store %struct.packet* null, %struct.packet** %p_link.i, align 8, !dbg !453, !tbaa !187
  br label %while.cond.i.i, !dbg !454

while.cond.i.i:                                   ; preds = %while.cond.i.i, %if.else.i
  %ptr.addr.0.i.i = phi %struct.packet* [ %20, %if.else.i ], [ %21, %while.cond.i.i ], !dbg !449
  %p_link1.i.i = getelementptr inbounds %struct.packet* %ptr.addr.0.i.i, i64 0, i32 0, !dbg !455
  %21 = load %struct.packet** %p_link1.i.i, align 8, !dbg !455, !tbaa !187
  %tobool.i.i = icmp eq %struct.packet* %21, null, !dbg !454
  br i1 %tobool.i.i, label %append.exit.i, label %while.cond.i.i, !dbg !454

append.exit.i:                                    ; preds = %while.cond.i.i
  %p_link1.i.i.lcssa = phi %struct.packet** [ %p_link1.i.i, %while.cond.i.i ]
  store %struct.packet* %pkt, %struct.packet** %p_link1.i.i.lcssa, align 8, !dbg !456, !tbaa !187
  %.pre.i = load %struct.task** @tcb, align 8, !dbg !457, !tbaa !150
  br label %if.end12.i, !dbg !422

if.end12.i:                                       ; preds = %append.exit.i, %if.then4.i
  %22 = phi %struct.task* [ %18, %if.then4.i ], [ %.pre.i, %append.exit.i ], !dbg !422
  br label %return, !dbg !458

return:                                           ; preds = %if.end12.i, %if.then4.i, %findtcb.exit.thread.i, %if.then
  %retval.0 = phi %struct.task* [ %0, %if.then ], [ %22, %if.end12.i ], [ %12, %if.then4.i ], [ null, %findtcb.exit.thread.i ]
  ret %struct.task* %retval.0, !dbg !459
}

; Function Attrs: nounwind uwtable
define %struct.task* @handlerfn(%struct.packet* %pkt) #0 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.packet* %pkt, i64 0, metadata !96, metadata !140), !dbg !460
  %cmp = icmp eq %struct.packet* %pkt, null, !dbg !461
  br i1 %cmp, label %if.end, label %if.then, !dbg !463

if.then:                                          ; preds = %entry
  %p_kind = getelementptr inbounds %struct.packet* %pkt, i64 0, i32 2, !dbg !464
  %0 = load i32* %p_kind, align 4, !dbg !464, !tbaa !192
  %cmp1 = icmp eq i32 %0, 1001, !dbg !464
  %1 = select i1 %cmp1, %struct.packet* bitcast (i64* @v1 to %struct.packet*), %struct.packet* bitcast (i64* @v2 to %struct.packet*), !dbg !465
  tail call void @llvm.dbg.value(metadata %struct.packet* %pkt, i64 0, metadata !466, metadata !140), !dbg !468
  tail call void @llvm.dbg.value(metadata %struct.packet* %1, i64 0, metadata !469, metadata !140), !dbg !470
  %p_link.i = getelementptr inbounds %struct.packet* %pkt, i64 0, i32 0, !dbg !471
  store %struct.packet* null, %struct.packet** %p_link.i, align 8, !dbg !471, !tbaa !187
  br label %while.cond.i, !dbg !472

while.cond.i:                                     ; preds = %while.cond.i, %if.then
  %ptr.addr.0.i = phi %struct.packet* [ %1, %if.then ], [ %2, %while.cond.i ], !dbg !467
  %p_link1.i = getelementptr inbounds %struct.packet* %ptr.addr.0.i, i64 0, i32 0, !dbg !473
  %2 = load %struct.packet** %p_link1.i, align 8, !dbg !473, !tbaa !187
  %tobool.i = icmp eq %struct.packet* %2, null, !dbg !472
  br i1 %tobool.i, label %append.exit, label %while.cond.i, !dbg !472

append.exit:                                      ; preds = %while.cond.i
  %p_link1.i.lcssa = phi %struct.packet** [ %p_link1.i, %while.cond.i ]
  store %struct.packet* %pkt, %struct.packet** %p_link1.i.lcssa, align 8, !dbg !474, !tbaa !187
  br label %if.end, !dbg !467

if.end:                                           ; preds = %entry, %append.exit
  %3 = load i64* @v1, align 8, !dbg !475, !tbaa !223
  %cmp2 = icmp eq i64 %3, 0, !dbg !475
  br i1 %cmp2, label %if.end14, label %if.then3, !dbg !476

if.then3:                                         ; preds = %if.end
  %4 = inttoptr i64 %3 to %struct.packet*, !dbg !477
  tail call void @llvm.dbg.value(metadata %struct.packet* %4, i64 0, metadata !100, metadata !140), !dbg !478
  %p_a1 = getelementptr inbounds %struct.packet* %4, i64 0, i32 3, !dbg !479
  %5 = load i32* %p_a1, align 4, !dbg !479, !tbaa !194
  tail call void @llvm.dbg.value(metadata i32 %5, i64 0, metadata !97, metadata !140), !dbg !480
  %cmp4 = icmp sgt i32 %5, 3, !dbg !481
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !483

if.then5:                                         ; preds = %if.then3
  %p_link = getelementptr inbounds %struct.packet* %4, i64 0, i32 0, !dbg !484
  %6 = load %struct.packet** %p_link, align 8, !dbg !484, !tbaa !187
  %7 = ptrtoint %struct.packet* %6 to i64, !dbg !486
  store i64 %7, i64* @v1, align 8, !dbg !487, !tbaa !223
  tail call void @llvm.dbg.value(metadata %struct.packet* %4, i64 0, metadata !488, metadata !140) #3, !dbg !490
  %p_id.i27 = getelementptr inbounds %struct.packet* %4, i64 0, i32 1, !dbg !491
  %8 = load i32* %p_id.i27, align 4, !dbg !491, !tbaa !190
  tail call void @llvm.dbg.value(metadata i32 %8, i64 0, metadata !492, metadata !140) #3, !dbg !494
  tail call void @llvm.dbg.value(metadata %struct.task* null, i64 0, metadata !495, metadata !140) #3, !dbg !496
  %id.off.i.i28 = add i32 %8, -1, !dbg !497
  %9 = icmp ult i32 %id.off.i.i28, 10, !dbg !497
  br i1 %9, label %if.end.i.i32, label %findtcb.exit.thread.i34, !dbg !497

if.end.i.i32:                                     ; preds = %if.then5
  %conv.i.i29 = sext i32 %8 to i64, !dbg !498
  %arrayidx.i.i30 = getelementptr inbounds [11 x %struct.task*]* @tasktab, i64 0, i64 %conv.i.i29, !dbg !499
  %10 = load %struct.task** %arrayidx.i.i30, align 8, !dbg !499, !tbaa !150
  tail call void @llvm.dbg.value(metadata %struct.task* %10, i64 0, metadata !495, metadata !140) #3, !dbg !496
  %cmp3.i.i31 = icmp eq %struct.task* %10, null, !dbg !500
  br i1 %cmp3.i.i31, label %findtcb.exit.thread.i34, label %if.end.i40, !dbg !501

findtcb.exit.thread.i34:                          ; preds = %if.end.i.i32, %if.then5
  %call.i.i33 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str2, i64 0, i64 0), i32 %8) #3, !dbg !502
  br label %return, !dbg !503

if.end.i40:                                       ; preds = %if.end.i.i32
  %11 = load i32* @qpktcount, align 4, !dbg !504, !tbaa !199
  %inc.i35 = add nsw i32 %11, 1, !dbg !504
  store i32 %inc.i35, i32* @qpktcount, align 4, !dbg !504, !tbaa !199
  store %struct.packet* null, %struct.packet** %p_link, align 8, !dbg !505, !tbaa !187
  %12 = load i64* @taskid, align 8, !dbg !506, !tbaa !223
  %conv.i37 = trunc i64 %12 to i32, !dbg !506
  store i32 %conv.i37, i32* %p_id.i27, align 4, !dbg !507, !tbaa !190
  %t_wkq.i38 = getelementptr inbounds %struct.task* %10, i64 0, i32 3, !dbg !508
  %13 = load %struct.packet** %t_wkq.i38, align 8, !dbg !508, !tbaa !165
  %cmp2.i39 = icmp eq %struct.packet* %13, null, !dbg !508
  br i1 %cmp2.i39, label %if.then4.i46, label %if.else.i47, !dbg !509

if.then4.i46:                                     ; preds = %if.end.i40
  store %struct.packet* %4, %struct.packet** %t_wkq.i38, align 8, !dbg !510, !tbaa !165
  %t_state.i41 = getelementptr inbounds %struct.task* %10, i64 0, i32 4, !dbg !511
  %14 = load i32* %t_state.i41, align 4, !dbg !511, !tbaa !167
  %or.i42 = or i32 %14, 1, !dbg !511
  store i32 %or.i42, i32* %t_state.i41, align 4, !dbg !511, !tbaa !167
  %t_pri.i43 = getelementptr inbounds %struct.task* %10, i64 0, i32 2, !dbg !512
  %15 = load i32* %t_pri.i43, align 4, !dbg !512, !tbaa !163
  %16 = load %struct.task** @tcb, align 8, !dbg !513, !tbaa !150
  %t_pri6.i44 = getelementptr inbounds %struct.task* %16, i64 0, i32 2, !dbg !513
  %17 = load i32* %t_pri6.i44, align 4, !dbg !513, !tbaa !163
  %cmp7.i45 = icmp sgt i32 %15, %17, !dbg !512
  br i1 %cmp7.i45, label %return, label %if.end12.i54, !dbg !514

if.else.i47:                                      ; preds = %if.end.i40
  %18 = bitcast %struct.packet** %t_wkq.i38 to %struct.packet*, !dbg !515
  tail call void @llvm.dbg.value(metadata %struct.packet* %4, i64 0, metadata !516, metadata !140) #3, !dbg !518
  tail call void @llvm.dbg.value(metadata %struct.packet* %18, i64 0, metadata !519, metadata !140) #3, !dbg !520
  store %struct.packet* null, %struct.packet** %p_link, align 8, !dbg !521, !tbaa !187
  br label %while.cond.i.i51, !dbg !522

while.cond.i.i51:                                 ; preds = %while.cond.i.i51, %if.else.i47
  %ptr.addr.0.i.i48 = phi %struct.packet* [ %18, %if.else.i47 ], [ %19, %while.cond.i.i51 ], !dbg !517
  %p_link1.i.i49 = getelementptr inbounds %struct.packet* %ptr.addr.0.i.i48, i64 0, i32 0, !dbg !523
  %19 = load %struct.packet** %p_link1.i.i49, align 8, !dbg !523, !tbaa !187
  %tobool.i.i50 = icmp eq %struct.packet* %19, null, !dbg !522
  br i1 %tobool.i.i50, label %append.exit.i53, label %while.cond.i.i51, !dbg !522

append.exit.i53:                                  ; preds = %while.cond.i.i51
  %p_link1.i.i49.lcssa = phi %struct.packet** [ %p_link1.i.i49, %while.cond.i.i51 ]
  store %struct.packet* %4, %struct.packet** %p_link1.i.i49.lcssa, align 8, !dbg !524, !tbaa !187
  %.pre.i52 = load %struct.task** @tcb, align 8, !dbg !525, !tbaa !150
  br label %if.end12.i54, !dbg !489

if.end12.i54:                                     ; preds = %append.exit.i53, %if.then4.i46
  %20 = phi %struct.task* [ %16, %if.then4.i46 ], [ %.pre.i52, %append.exit.i53 ], !dbg !489
  br label %return, !dbg !526

if.end6:                                          ; preds = %if.then3
  %21 = load i64* @v2, align 8, !dbg !527, !tbaa !223
  %cmp7 = icmp eq i64 %21, 0, !dbg !527
  br i1 %cmp7, label %if.end14, label %if.then8, !dbg !528

if.then8:                                         ; preds = %if.end6
  %22 = inttoptr i64 %21 to %struct.packet*, !dbg !529
  tail call void @llvm.dbg.value(metadata %struct.packet* %22, i64 0, metadata !101, metadata !140), !dbg !530
  %p_link9 = getelementptr inbounds %struct.packet* %22, i64 0, i32 0, !dbg !531
  %23 = load %struct.packet** %p_link9, align 8, !dbg !531, !tbaa !187
  %24 = ptrtoint %struct.packet* %23 to i64, !dbg !532
  store i64 %24, i64* @v2, align 8, !dbg !533, !tbaa !223
  %idxprom = sext i32 %5 to i64, !dbg !534
  %arrayidx = getelementptr inbounds %struct.packet* %4, i64 0, i32 4, i64 %idxprom, !dbg !534
  %25 = load i8* %arrayidx, align 1, !dbg !534, !tbaa !419
  %conv = sext i8 %25 to i32, !dbg !534
  %p_a110 = getelementptr inbounds %struct.packet* %22, i64 0, i32 3, !dbg !535
  store i32 %conv, i32* %p_a110, align 4, !dbg !535, !tbaa !194
  %add = add nsw i32 %5, 1, !dbg !536
  store i32 %add, i32* %p_a1, align 4, !dbg !537, !tbaa !194
  tail call void @llvm.dbg.value(metadata %struct.packet* %22, i64 0, metadata !538, metadata !140) #3, !dbg !540
  %p_id.i = getelementptr inbounds %struct.packet* %22, i64 0, i32 1, !dbg !541
  %26 = load i32* %p_id.i, align 4, !dbg !541, !tbaa !190
  tail call void @llvm.dbg.value(metadata i32 %26, i64 0, metadata !542, metadata !140) #3, !dbg !544
  tail call void @llvm.dbg.value(metadata %struct.task* null, i64 0, metadata !545, metadata !140) #3, !dbg !546
  %id.off.i.i = add i32 %26, -1, !dbg !547
  %27 = icmp ult i32 %id.off.i.i, 10, !dbg !547
  br i1 %27, label %if.end.i.i, label %findtcb.exit.thread.i, !dbg !547

if.end.i.i:                                       ; preds = %if.then8
  %conv.i.i = sext i32 %26 to i64, !dbg !548
  %arrayidx.i.i = getelementptr inbounds [11 x %struct.task*]* @tasktab, i64 0, i64 %conv.i.i, !dbg !549
  %28 = load %struct.task** %arrayidx.i.i, align 8, !dbg !549, !tbaa !150
  tail call void @llvm.dbg.value(metadata %struct.task* %28, i64 0, metadata !545, metadata !140) #3, !dbg !546
  %cmp3.i.i = icmp eq %struct.task* %28, null, !dbg !550
  br i1 %cmp3.i.i, label %findtcb.exit.thread.i, label %if.end.i, !dbg !551

findtcb.exit.thread.i:                            ; preds = %if.end.i.i, %if.then8
  %call.i.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str2, i64 0, i64 0), i32 %26) #3, !dbg !552
  br label %return, !dbg !553

if.end.i:                                         ; preds = %if.end.i.i
  %29 = load i32* @qpktcount, align 4, !dbg !554, !tbaa !199
  %inc.i = add nsw i32 %29, 1, !dbg !554
  store i32 %inc.i, i32* @qpktcount, align 4, !dbg !554, !tbaa !199
  store %struct.packet* null, %struct.packet** %p_link9, align 8, !dbg !555, !tbaa !187
  %30 = load i64* @taskid, align 8, !dbg !556, !tbaa !223
  %conv.i = trunc i64 %30 to i32, !dbg !556
  store i32 %conv.i, i32* %p_id.i, align 4, !dbg !557, !tbaa !190
  %t_wkq.i = getelementptr inbounds %struct.task* %28, i64 0, i32 3, !dbg !558
  %31 = load %struct.packet** %t_wkq.i, align 8, !dbg !558, !tbaa !165
  %cmp2.i = icmp eq %struct.packet* %31, null, !dbg !558
  br i1 %cmp2.i, label %if.then4.i, label %if.else.i, !dbg !559

if.then4.i:                                       ; preds = %if.end.i
  store %struct.packet* %22, %struct.packet** %t_wkq.i, align 8, !dbg !560, !tbaa !165
  %t_state.i25 = getelementptr inbounds %struct.task* %28, i64 0, i32 4, !dbg !561
  %32 = load i32* %t_state.i25, align 4, !dbg !561, !tbaa !167
  %or.i26 = or i32 %32, 1, !dbg !561
  store i32 %or.i26, i32* %t_state.i25, align 4, !dbg !561, !tbaa !167
  %t_pri.i = getelementptr inbounds %struct.task* %28, i64 0, i32 2, !dbg !562
  %33 = load i32* %t_pri.i, align 4, !dbg !562, !tbaa !163
  %34 = load %struct.task** @tcb, align 8, !dbg !563, !tbaa !150
  %t_pri6.i = getelementptr inbounds %struct.task* %34, i64 0, i32 2, !dbg !563
  %35 = load i32* %t_pri6.i, align 4, !dbg !563, !tbaa !163
  %cmp7.i = icmp sgt i32 %33, %35, !dbg !562
  br i1 %cmp7.i, label %return, label %if.end12.i, !dbg !564

if.else.i:                                        ; preds = %if.end.i
  %36 = bitcast %struct.packet** %t_wkq.i to %struct.packet*, !dbg !565
  tail call void @llvm.dbg.value(metadata %struct.packet* %22, i64 0, metadata !566, metadata !140) #3, !dbg !568
  tail call void @llvm.dbg.value(metadata %struct.packet* %36, i64 0, metadata !569, metadata !140) #3, !dbg !570
  store %struct.packet* null, %struct.packet** %p_link9, align 8, !dbg !571, !tbaa !187
  br label %while.cond.i.i, !dbg !572

while.cond.i.i:                                   ; preds = %while.cond.i.i, %if.else.i
  %ptr.addr.0.i.i = phi %struct.packet* [ %36, %if.else.i ], [ %37, %while.cond.i.i ], !dbg !567
  %p_link1.i.i = getelementptr inbounds %struct.packet* %ptr.addr.0.i.i, i64 0, i32 0, !dbg !573
  %37 = load %struct.packet** %p_link1.i.i, align 8, !dbg !573, !tbaa !187
  %tobool.i.i = icmp eq %struct.packet* %37, null, !dbg !572
  br i1 %tobool.i.i, label %append.exit.i, label %while.cond.i.i, !dbg !572

append.exit.i:                                    ; preds = %while.cond.i.i
  %p_link1.i.i.lcssa = phi %struct.packet** [ %p_link1.i.i, %while.cond.i.i ]
  store %struct.packet* %22, %struct.packet** %p_link1.i.i.lcssa, align 8, !dbg !574, !tbaa !187
  %.pre.i = load %struct.task** @tcb, align 8, !dbg !575, !tbaa !150
  br label %if.end12.i, !dbg !539

if.end12.i:                                       ; preds = %append.exit.i, %if.then4.i
  %38 = phi %struct.task* [ %34, %if.then4.i ], [ %.pre.i, %append.exit.i ], !dbg !539
  br label %return, !dbg !576

if.end14:                                         ; preds = %if.end6, %if.end
  %39 = load %struct.task** @tcb, align 8, !dbg !577, !tbaa !150
  %t_state.i = getelementptr inbounds %struct.task* %39, i64 0, i32 4, !dbg !577
  %40 = load i32* %t_state.i, align 4, !dbg !577, !tbaa !167
  %or.i = or i32 %40, 2, !dbg !577
  store i32 %or.i, i32* %t_state.i, align 4, !dbg !577, !tbaa !167
  br label %return, !dbg !579

return:                                           ; preds = %if.end12.i, %if.then4.i, %findtcb.exit.thread.i, %if.end12.i54, %if.then4.i46, %findtcb.exit.thread.i34, %if.end14
  %retval.0 = phi %struct.task* [ %39, %if.end14 ], [ %20, %if.end12.i54 ], [ %10, %if.then4.i46 ], [ null, %findtcb.exit.thread.i34 ], [ %38, %if.end12.i ], [ %28, %if.then4.i ], [ null, %findtcb.exit.thread.i ]
  ret %struct.task* %retval.0, !dbg !580
}

; Function Attrs: nounwind uwtable
define %struct.task* @devfn(%struct.packet* %pkt) #0 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.packet* %pkt, i64 0, metadata !106, metadata !140), !dbg !581
  %cmp = icmp eq %struct.packet* %pkt, null, !dbg !582
  br i1 %cmp, label %if.then, label %if.else, !dbg !584

if.then:                                          ; preds = %entry
  %0 = load i64* @v1, align 8, !dbg !585, !tbaa !223
  %cmp1 = icmp eq i64 %0, 0, !dbg !585
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !588

if.then2:                                         ; preds = %if.then
  %1 = load %struct.task** @tcb, align 8, !dbg !589, !tbaa !150
  %t_state.i = getelementptr inbounds %struct.task* %1, i64 0, i32 4, !dbg !589
  %2 = load i32* %t_state.i, align 4, !dbg !589, !tbaa !167
  %or.i = or i32 %2, 2, !dbg !589
  store i32 %or.i, i32* %t_state.i, align 4, !dbg !589, !tbaa !167
  br label %return, !dbg !592

if.end:                                           ; preds = %if.then
  %3 = inttoptr i64 %0 to %struct.packet*, !dbg !593
  tail call void @llvm.dbg.value(metadata %struct.packet* %3, i64 0, metadata !106, metadata !140), !dbg !581
  store i64 0, i64* @v1, align 8, !dbg !594, !tbaa !223
  tail call void @llvm.dbg.value(metadata %struct.packet* %3, i64 0, metadata !595, metadata !140) #3, !dbg !597
  %p_id.i = getelementptr inbounds %struct.packet* %3, i64 0, i32 1, !dbg !598
  %4 = load i32* %p_id.i, align 4, !dbg !598, !tbaa !190
  tail call void @llvm.dbg.value(metadata i32 %4, i64 0, metadata !599, metadata !140) #3, !dbg !601
  tail call void @llvm.dbg.value(metadata %struct.task* null, i64 0, metadata !602, metadata !140) #3, !dbg !603
  %id.off.i.i = add i32 %4, -1, !dbg !604
  %5 = icmp ult i32 %id.off.i.i, 10, !dbg !604
  br i1 %5, label %if.end.i.i, label %findtcb.exit.thread.i, !dbg !604

if.end.i.i:                                       ; preds = %if.end
  %conv.i.i = sext i32 %4 to i64, !dbg !605
  %arrayidx.i.i = getelementptr inbounds [11 x %struct.task*]* @tasktab, i64 0, i64 %conv.i.i, !dbg !606
  %6 = load %struct.task** %arrayidx.i.i, align 8, !dbg !606, !tbaa !150
  tail call void @llvm.dbg.value(metadata %struct.task* %6, i64 0, metadata !602, metadata !140) #3, !dbg !603
  %cmp3.i.i = icmp eq %struct.task* %6, null, !dbg !607
  br i1 %cmp3.i.i, label %findtcb.exit.thread.i, label %if.end.i, !dbg !608

findtcb.exit.thread.i:                            ; preds = %if.end.i.i, %if.end
  %call.i.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str2, i64 0, i64 0), i32 %4) #3, !dbg !609
  br label %return, !dbg !610

if.end.i:                                         ; preds = %if.end.i.i
  %7 = load i32* @qpktcount, align 4, !dbg !611, !tbaa !199
  %inc.i13 = add nsw i32 %7, 1, !dbg !611
  store i32 %inc.i13, i32* @qpktcount, align 4, !dbg !611, !tbaa !199
  %p_link.i = getelementptr inbounds %struct.packet* %3, i64 0, i32 0, !dbg !612
  store %struct.packet* null, %struct.packet** %p_link.i, align 8, !dbg !612, !tbaa !187
  %8 = load i64* @taskid, align 8, !dbg !613, !tbaa !223
  %conv.i14 = trunc i64 %8 to i32, !dbg !613
  store i32 %conv.i14, i32* %p_id.i, align 4, !dbg !614, !tbaa !190
  %t_wkq.i = getelementptr inbounds %struct.task* %6, i64 0, i32 3, !dbg !615
  %9 = load %struct.packet** %t_wkq.i, align 8, !dbg !615, !tbaa !165
  %cmp2.i = icmp eq %struct.packet* %9, null, !dbg !615
  br i1 %cmp2.i, label %if.then4.i, label %if.else.i, !dbg !616

if.then4.i:                                       ; preds = %if.end.i
  store %struct.packet* %3, %struct.packet** %t_wkq.i, align 8, !dbg !617, !tbaa !165
  %t_state.i15 = getelementptr inbounds %struct.task* %6, i64 0, i32 4, !dbg !618
  %10 = load i32* %t_state.i15, align 4, !dbg !618, !tbaa !167
  %or.i16 = or i32 %10, 1, !dbg !618
  store i32 %or.i16, i32* %t_state.i15, align 4, !dbg !618, !tbaa !167
  %t_pri.i = getelementptr inbounds %struct.task* %6, i64 0, i32 2, !dbg !619
  %11 = load i32* %t_pri.i, align 4, !dbg !619, !tbaa !163
  %12 = load %struct.task** @tcb, align 8, !dbg !620, !tbaa !150
  %t_pri6.i = getelementptr inbounds %struct.task* %12, i64 0, i32 2, !dbg !620
  %13 = load i32* %t_pri6.i, align 4, !dbg !620, !tbaa !163
  %cmp7.i = icmp sgt i32 %11, %13, !dbg !619
  br i1 %cmp7.i, label %return, label %if.end12.i, !dbg !621

if.else.i:                                        ; preds = %if.end.i
  %14 = bitcast %struct.packet** %t_wkq.i to %struct.packet*, !dbg !622
  tail call void @llvm.dbg.value(metadata %struct.packet* %3, i64 0, metadata !623, metadata !140) #3, !dbg !625
  tail call void @llvm.dbg.value(metadata %struct.packet* %14, i64 0, metadata !626, metadata !140) #3, !dbg !627
  store %struct.packet* null, %struct.packet** %p_link.i, align 8, !dbg !628, !tbaa !187
  br label %while.cond.i.i, !dbg !629

while.cond.i.i:                                   ; preds = %while.cond.i.i, %if.else.i
  %ptr.addr.0.i.i = phi %struct.packet* [ %14, %if.else.i ], [ %15, %while.cond.i.i ], !dbg !624
  %p_link1.i.i = getelementptr inbounds %struct.packet* %ptr.addr.0.i.i, i64 0, i32 0, !dbg !630
  %15 = load %struct.packet** %p_link1.i.i, align 8, !dbg !630, !tbaa !187
  %tobool.i.i = icmp eq %struct.packet* %15, null, !dbg !629
  br i1 %tobool.i.i, label %append.exit.i, label %while.cond.i.i, !dbg !629

append.exit.i:                                    ; preds = %while.cond.i.i
  %p_link1.i.i.lcssa = phi %struct.packet** [ %p_link1.i.i, %while.cond.i.i ]
  store %struct.packet* %3, %struct.packet** %p_link1.i.i.lcssa, align 8, !dbg !631, !tbaa !187
  %.pre.i = load %struct.task** @tcb, align 8, !dbg !632, !tbaa !150
  br label %if.end12.i, !dbg !596

if.end12.i:                                       ; preds = %append.exit.i, %if.then4.i
  %16 = phi %struct.task* [ %12, %if.then4.i ], [ %.pre.i, %append.exit.i ], !dbg !596
  br label %return, !dbg !633

if.else:                                          ; preds = %entry
  %17 = ptrtoint %struct.packet* %pkt to i64, !dbg !634
  store i64 %17, i64* @v1, align 8, !dbg !636, !tbaa !223
  %18 = load i32* @tracing, align 4, !dbg !637, !tbaa !199
  %cmp4 = icmp eq i32 %18, 1, !dbg !637
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !639

if.then5:                                         ; preds = %if.else
  %p_a1 = getelementptr inbounds %struct.packet* %pkt, i64 0, i32 3, !dbg !640
  %19 = load i32* %p_a1, align 4, !dbg !640, !tbaa !194
  %20 = load i32* @layout, align 4, !dbg !642, !tbaa !199
  %dec.i = add nsw i32 %20, -1, !dbg !642
  store i32 %dec.i, i32* @layout, align 4, !dbg !642, !tbaa !199
  %cmp.i = icmp slt i32 %20, 2, !dbg !642
  br i1 %cmp.i, label %if.then.i, label %trace.exit, !dbg !644

if.then.i:                                        ; preds = %if.then5
  %putchar2.i = tail call i32 @putchar(i32 10) #3, !dbg !645
  store i32 50, i32* @layout, align 4, !dbg !646, !tbaa !199
  br label %trace.exit, !dbg !647

trace.exit:                                       ; preds = %if.then5, %if.then.i
  %sext = shl i32 %19, 24, !dbg !648
  %conv.i = ashr exact i32 %sext, 24, !dbg !648
  %putchar.i = tail call i32 @putchar(i32 %conv.i) #3, !dbg !649
  br label %if.end6, !dbg !643

if.end6:                                          ; preds = %trace.exit, %if.else
  %21 = load i32* @holdcount, align 4, !dbg !650, !tbaa !199
  %inc.i = add nsw i32 %21, 1, !dbg !650
  store i32 %inc.i, i32* @holdcount, align 4, !dbg !650, !tbaa !199
  %22 = load %struct.task** @tcb, align 8, !dbg !652, !tbaa !150
  %t_state.i11 = getelementptr inbounds %struct.task* %22, i64 0, i32 4, !dbg !652
  %23 = load i32* %t_state.i11, align 4, !dbg !652, !tbaa !167
  %or.i12 = or i32 %23, 4, !dbg !652
  store i32 %or.i12, i32* %t_state.i11, align 4, !dbg !652, !tbaa !167
  %t_link.i = getelementptr inbounds %struct.task* %22, i64 0, i32 0, !dbg !653
  %24 = load %struct.task** %t_link.i, align 8, !dbg !653, !tbaa !156
  br label %return, !dbg !654

return:                                           ; preds = %if.end12.i, %if.then4.i, %findtcb.exit.thread.i, %if.end6, %if.then2
  %retval.0 = phi %struct.task* [ %1, %if.then2 ], [ %24, %if.end6 ], [ %16, %if.end12.i ], [ %6, %if.then4.i ], [ null, %findtcb.exit.thread.i ]
  ret %struct.task* %retval.0, !dbg !655
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.packet* null, i64 0, metadata !117, metadata !140), !dbg !656
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([20 x i8]* @str, i64 0, i64 0)), !dbg !657
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !658, metadata !140) #3, !dbg !660
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !661, metadata !140) #3, !dbg !662
  tail call void @llvm.dbg.value(metadata %struct.packet* null, i64 0, metadata !663, metadata !140) #3, !dbg !664
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !665, metadata !140) #3, !dbg !666
  tail call void @llvm.dbg.value(metadata %struct.task* (%struct.packet*)* @idlefn, i64 0, metadata !667, metadata !140) #3, !dbg !668
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !669, metadata !140) #3, !dbg !670
  tail call void @llvm.dbg.value(metadata i64 10000000, i64 0, metadata !671, metadata !140) #3, !dbg !672
  %call.i = tail call noalias i8* @malloc(i64 56) #3, !dbg !673
  store i8* %call.i, i8** bitcast (%struct.task** getelementptr inbounds ([11 x %struct.task*]* @tasktab, i64 0, i64 1) to i8**), align 8, !dbg !674, !tbaa !150
  %0 = load %struct.task** @tasklist, align 8, !dbg !675, !tbaa !150
  %t_link.i = bitcast i8* %call.i to %struct.task**, !dbg !676
  store %struct.task* %0, %struct.task** %t_link.i, align 8, !dbg !676, !tbaa !156
  %t_id.i = getelementptr inbounds i8* %call.i, i64 8, !dbg !677
  %1 = bitcast i8* %t_id.i to i32*, !dbg !677
  store i32 1, i32* %1, align 4, !dbg !677, !tbaa !161
  %t_pri.i = getelementptr inbounds i8* %call.i, i64 12, !dbg !678
  %t_fn.i = getelementptr inbounds i8* %call.i, i64 32, !dbg !679
  %2 = bitcast i8* %t_fn.i to %struct.task* (%struct.packet*)**, !dbg !679
  call void @llvm.memset.p0i8.i64(i8* %t_pri.i, i8 0, i64 16, i32 4, i1 false), !dbg !680
  store %struct.task* (%struct.packet*)* @idlefn, %struct.task* (%struct.packet*)** %2, align 8, !dbg !679, !tbaa !169
  %t_v1.i = getelementptr inbounds i8* %call.i, i64 40, !dbg !681
  %3 = bitcast i8* %t_v1.i to i64*, !dbg !681
  store i64 1, i64* %3, align 8, !dbg !681, !tbaa !171
  %t_v2.i = getelementptr inbounds i8* %call.i, i64 48, !dbg !682
  %4 = bitcast i8* %t_v2.i to i64*, !dbg !682
  store i64 10000000, i64* %4, align 8, !dbg !682, !tbaa !173
  tail call void @llvm.dbg.value(metadata %struct.packet* null, i64 0, metadata !683, metadata !140) #3, !dbg !685
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !686, metadata !140) #3, !dbg !687
  tail call void @llvm.dbg.value(metadata i32 1001, i64 0, metadata !688, metadata !140) #3, !dbg !689
  %call.i31 = tail call noalias i8* @malloc(i64 24) #3, !dbg !690
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !691, metadata !140) #3, !dbg !692
  %scevgep.i = getelementptr i8* %call.i31, i64 20, !dbg !684
  %5 = bitcast i8* %scevgep.i to i32*, !dbg !693
  store i32 0, i32* %5, align 1, !dbg !693
  %p_link.i = bitcast i8* %call.i31 to %struct.packet**, !dbg !694
  store %struct.packet* null, %struct.packet** %p_link.i, align 8, !dbg !694, !tbaa !187
  %p_id.i = getelementptr inbounds i8* %call.i31, i64 8, !dbg !695
  %6 = bitcast i8* %p_id.i to i32*, !dbg !695
  store i32 0, i32* %6, align 4, !dbg !695, !tbaa !190
  %p_kind.i = getelementptr inbounds i8* %call.i31, i64 12, !dbg !696
  %7 = bitcast i8* %p_kind.i to i32*, !dbg !696
  store i32 1001, i32* %7, align 4, !dbg !696, !tbaa !192
  %p_a1.i = getelementptr inbounds i8* %call.i31, i64 16, !dbg !697
  %8 = bitcast i8* %p_a1.i to i32*, !dbg !697
  store i32 0, i32* %8, align 4, !dbg !697, !tbaa !194
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !698, metadata !140) #3, !dbg !700
  tail call void @llvm.dbg.value(metadata i32 1001, i64 0, metadata !701, metadata !140) #3, !dbg !702
  %call.i32 = tail call noalias i8* @malloc(i64 24) #3, !dbg !703
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !704, metadata !140) #3, !dbg !705
  %scevgep.i33 = getelementptr i8* %call.i32, i64 20, !dbg !699
  %9 = bitcast i8* %scevgep.i33 to i32*, !dbg !706
  store i32 0, i32* %9, align 1, !dbg !706
  %10 = bitcast i8* %call.i32 to i8**, !dbg !707
  store i8* %call.i31, i8** %10, align 8, !dbg !707, !tbaa !187
  %p_id.i35 = getelementptr inbounds i8* %call.i32, i64 8, !dbg !708
  %11 = bitcast i8* %p_id.i35 to i32*, !dbg !708
  store i32 0, i32* %11, align 4, !dbg !708, !tbaa !190
  %p_kind.i36 = getelementptr inbounds i8* %call.i32, i64 12, !dbg !709
  %12 = bitcast i8* %p_kind.i36 to i32*, !dbg !709
  store i32 1001, i32* %12, align 4, !dbg !709, !tbaa !192
  %p_a1.i37 = getelementptr inbounds i8* %call.i32, i64 16, !dbg !710
  %13 = bitcast i8* %p_a1.i37 to i32*, !dbg !710
  store i32 0, i32* %13, align 4, !dbg !710, !tbaa !194
  tail call void @llvm.dbg.value(metadata i32 2, i64 0, metadata !711, metadata !140) #3, !dbg !713
  tail call void @llvm.dbg.value(metadata i32 1000, i64 0, metadata !714, metadata !140) #3, !dbg !715
  tail call void @llvm.dbg.value(metadata i32 3, i64 0, metadata !716, metadata !140) #3, !dbg !717
  tail call void @llvm.dbg.value(metadata %struct.task* (%struct.packet*)* @workfn, i64 0, metadata !718, metadata !140) #3, !dbg !719
  tail call void @llvm.dbg.value(metadata i64 3, i64 0, metadata !720, metadata !140) #3, !dbg !721
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !722, metadata !140) #3, !dbg !723
  %call.i38 = tail call noalias i8* @malloc(i64 56) #3, !dbg !724
  store i8* %call.i38, i8** bitcast (%struct.task** getelementptr inbounds ([11 x %struct.task*]* @tasktab, i64 0, i64 2) to i8**), align 16, !dbg !725, !tbaa !150
  %14 = bitcast i8* %call.i38 to i8**, !dbg !726
  store i8* %call.i, i8** %14, align 8, !dbg !726, !tbaa !156
  %t_id.i40 = getelementptr inbounds i8* %call.i38, i64 8, !dbg !727
  %15 = bitcast i8* %t_id.i40 to i32*, !dbg !727
  store i32 2, i32* %15, align 4, !dbg !727, !tbaa !161
  %t_pri.i41 = getelementptr inbounds i8* %call.i38, i64 12, !dbg !728
  %16 = bitcast i8* %t_pri.i41 to i32*, !dbg !728
  store i32 1000, i32* %16, align 4, !dbg !728, !tbaa !163
  %t_wkq.i42 = getelementptr inbounds i8* %call.i38, i64 16, !dbg !729
  %17 = bitcast i8* %t_wkq.i42 to i8**, !dbg !729
  store i8* %call.i32, i8** %17, align 8, !dbg !729, !tbaa !165
  %t_state.i43 = getelementptr inbounds i8* %call.i38, i64 24, !dbg !730
  %18 = bitcast i8* %t_state.i43 to i32*, !dbg !730
  store i32 3, i32* %18, align 4, !dbg !730, !tbaa !167
  %t_fn.i44 = getelementptr inbounds i8* %call.i38, i64 32, !dbg !731
  %19 = bitcast i8* %t_fn.i44 to %struct.task* (%struct.packet*)**, !dbg !731
  store %struct.task* (%struct.packet*)* @workfn, %struct.task* (%struct.packet*)** %19, align 8, !dbg !731, !tbaa !169
  %t_v1.i45 = getelementptr inbounds i8* %call.i38, i64 40, !dbg !732
  %20 = bitcast i8* %t_v1.i45 to i64*, !dbg !732
  store i64 3, i64* %20, align 8, !dbg !732, !tbaa !171
  %t_v2.i46 = getelementptr inbounds i8* %call.i38, i64 48, !dbg !733
  %21 = bitcast i8* %t_v2.i46 to i64*, !dbg !733
  store i64 0, i64* %21, align 8, !dbg !733, !tbaa !173
  tail call void @llvm.dbg.value(metadata %struct.packet* null, i64 0, metadata !734, metadata !140) #3, !dbg !736
  tail call void @llvm.dbg.value(metadata i32 5, i64 0, metadata !737, metadata !140) #3, !dbg !738
  tail call void @llvm.dbg.value(metadata i32 1000, i64 0, metadata !739, metadata !140) #3, !dbg !740
  %call.i47 = tail call noalias i8* @malloc(i64 24) #3, !dbg !741
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !742, metadata !140) #3, !dbg !743
  %scevgep.i48 = getelementptr i8* %call.i47, i64 20, !dbg !735
  %22 = bitcast i8* %scevgep.i48 to i32*, !dbg !744
  store i32 0, i32* %22, align 1, !dbg !744
  %p_link.i49 = bitcast i8* %call.i47 to %struct.packet**, !dbg !745
  store %struct.packet* null, %struct.packet** %p_link.i49, align 8, !dbg !745, !tbaa !187
  %p_id.i50 = getelementptr inbounds i8* %call.i47, i64 8, !dbg !746
  %23 = bitcast i8* %p_id.i50 to i32*, !dbg !746
  store i32 5, i32* %23, align 4, !dbg !746, !tbaa !190
  %p_kind.i51 = getelementptr inbounds i8* %call.i47, i64 12, !dbg !747
  %24 = bitcast i8* %p_kind.i51 to i32*, !dbg !747
  store i32 1000, i32* %24, align 4, !dbg !747, !tbaa !192
  %p_a1.i52 = getelementptr inbounds i8* %call.i47, i64 16, !dbg !748
  %25 = bitcast i8* %p_a1.i52 to i32*, !dbg !748
  store i32 0, i32* %25, align 4, !dbg !748, !tbaa !194
  tail call void @llvm.dbg.value(metadata i32 5, i64 0, metadata !749, metadata !140) #3, !dbg !751
  tail call void @llvm.dbg.value(metadata i32 1000, i64 0, metadata !752, metadata !140) #3, !dbg !753
  %call.i53 = tail call noalias i8* @malloc(i64 24) #3, !dbg !754
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !755, metadata !140) #3, !dbg !756
  %scevgep.i54 = getelementptr i8* %call.i53, i64 20, !dbg !750
  %26 = bitcast i8* %scevgep.i54 to i32*, !dbg !757
  store i32 0, i32* %26, align 1, !dbg !757
  %27 = bitcast i8* %call.i53 to i8**, !dbg !758
  store i8* %call.i47, i8** %27, align 8, !dbg !758, !tbaa !187
  %p_id.i56 = getelementptr inbounds i8* %call.i53, i64 8, !dbg !759
  %28 = bitcast i8* %p_id.i56 to i32*, !dbg !759
  store i32 5, i32* %28, align 4, !dbg !759, !tbaa !190
  %p_kind.i57 = getelementptr inbounds i8* %call.i53, i64 12, !dbg !760
  %29 = bitcast i8* %p_kind.i57 to i32*, !dbg !760
  store i32 1000, i32* %29, align 4, !dbg !760, !tbaa !192
  %p_a1.i58 = getelementptr inbounds i8* %call.i53, i64 16, !dbg !761
  %30 = bitcast i8* %p_a1.i58 to i32*, !dbg !761
  store i32 0, i32* %30, align 4, !dbg !761, !tbaa !194
  tail call void @llvm.dbg.value(metadata i32 5, i64 0, metadata !762, metadata !140) #3, !dbg !764
  tail call void @llvm.dbg.value(metadata i32 1000, i64 0, metadata !765, metadata !140) #3, !dbg !766
  %call.i59 = tail call noalias i8* @malloc(i64 24) #3, !dbg !767
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !768, metadata !140) #3, !dbg !769
  %scevgep.i60 = getelementptr i8* %call.i59, i64 20, !dbg !763
  %31 = bitcast i8* %scevgep.i60 to i32*, !dbg !770
  store i32 0, i32* %31, align 1, !dbg !770
  %32 = bitcast i8* %call.i59 to i8**, !dbg !771
  store i8* %call.i53, i8** %32, align 8, !dbg !771, !tbaa !187
  %p_id.i62 = getelementptr inbounds i8* %call.i59, i64 8, !dbg !772
  %33 = bitcast i8* %p_id.i62 to i32*, !dbg !772
  store i32 5, i32* %33, align 4, !dbg !772, !tbaa !190
  %p_kind.i63 = getelementptr inbounds i8* %call.i59, i64 12, !dbg !773
  %34 = bitcast i8* %p_kind.i63 to i32*, !dbg !773
  store i32 1000, i32* %34, align 4, !dbg !773, !tbaa !192
  %p_a1.i64 = getelementptr inbounds i8* %call.i59, i64 16, !dbg !774
  %35 = bitcast i8* %p_a1.i64 to i32*, !dbg !774
  store i32 0, i32* %35, align 4, !dbg !774, !tbaa !194
  tail call void @llvm.dbg.value(metadata i32 3, i64 0, metadata !775, metadata !140) #3, !dbg !777
  tail call void @llvm.dbg.value(metadata i32 2000, i64 0, metadata !778, metadata !140) #3, !dbg !779
  tail call void @llvm.dbg.value(metadata i32 3, i64 0, metadata !780, metadata !140) #3, !dbg !781
  tail call void @llvm.dbg.value(metadata %struct.task* (%struct.packet*)* @handlerfn, i64 0, metadata !782, metadata !140) #3, !dbg !783
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !784, metadata !140) #3, !dbg !785
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !786, metadata !140) #3, !dbg !787
  %call.i65 = tail call noalias i8* @malloc(i64 56) #3, !dbg !788
  store i8* %call.i65, i8** bitcast (%struct.task** getelementptr inbounds ([11 x %struct.task*]* @tasktab, i64 0, i64 3) to i8**), align 8, !dbg !789, !tbaa !150
  %36 = bitcast i8* %call.i65 to i8**, !dbg !790
  store i8* %call.i38, i8** %36, align 8, !dbg !790, !tbaa !156
  %t_id.i67 = getelementptr inbounds i8* %call.i65, i64 8, !dbg !791
  %37 = bitcast i8* %t_id.i67 to i32*, !dbg !791
  store i32 3, i32* %37, align 4, !dbg !791, !tbaa !161
  %t_pri.i68 = getelementptr inbounds i8* %call.i65, i64 12, !dbg !792
  %38 = bitcast i8* %t_pri.i68 to i32*, !dbg !792
  store i32 2000, i32* %38, align 4, !dbg !792, !tbaa !163
  %t_wkq.i69 = getelementptr inbounds i8* %call.i65, i64 16, !dbg !793
  %39 = bitcast i8* %t_wkq.i69 to i8**, !dbg !793
  store i8* %call.i59, i8** %39, align 8, !dbg !793, !tbaa !165
  %t_state.i70 = getelementptr inbounds i8* %call.i65, i64 24, !dbg !794
  %40 = bitcast i8* %t_state.i70 to i32*, !dbg !794
  store i32 3, i32* %40, align 4, !dbg !794, !tbaa !167
  %t_fn.i71 = getelementptr inbounds i8* %call.i65, i64 32, !dbg !795
  %41 = bitcast i8* %t_fn.i71 to %struct.task* (%struct.packet*)**, !dbg !795
  store %struct.task* (%struct.packet*)* @handlerfn, %struct.task* (%struct.packet*)** %41, align 8, !dbg !795, !tbaa !169
  %t_v1.i72 = getelementptr inbounds i8* %call.i65, i64 40, !dbg !796
  call void @llvm.memset.p0i8.i64(i8* %t_v1.i72, i8 0, i64 16, i32 8, i1 false), !dbg !797
  tail call void @llvm.dbg.value(metadata %struct.packet* null, i64 0, metadata !798, metadata !140) #3, !dbg !800
  tail call void @llvm.dbg.value(metadata i32 6, i64 0, metadata !801, metadata !140) #3, !dbg !802
  tail call void @llvm.dbg.value(metadata i32 1000, i64 0, metadata !803, metadata !140) #3, !dbg !804
  %call.i74 = tail call noalias i8* @malloc(i64 24) #3, !dbg !805
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !806, metadata !140) #3, !dbg !807
  %scevgep.i75 = getelementptr i8* %call.i74, i64 20, !dbg !799
  %42 = bitcast i8* %scevgep.i75 to i32*, !dbg !808
  store i32 0, i32* %42, align 1, !dbg !808
  %p_link.i76 = bitcast i8* %call.i74 to %struct.packet**, !dbg !809
  store %struct.packet* null, %struct.packet** %p_link.i76, align 8, !dbg !809, !tbaa !187
  %p_id.i77 = getelementptr inbounds i8* %call.i74, i64 8, !dbg !810
  %43 = bitcast i8* %p_id.i77 to i32*, !dbg !810
  store i32 6, i32* %43, align 4, !dbg !810, !tbaa !190
  %p_kind.i78 = getelementptr inbounds i8* %call.i74, i64 12, !dbg !811
  %44 = bitcast i8* %p_kind.i78 to i32*, !dbg !811
  store i32 1000, i32* %44, align 4, !dbg !811, !tbaa !192
  %p_a1.i79 = getelementptr inbounds i8* %call.i74, i64 16, !dbg !812
  %45 = bitcast i8* %p_a1.i79 to i32*, !dbg !812
  store i32 0, i32* %45, align 4, !dbg !812, !tbaa !194
  tail call void @llvm.dbg.value(metadata i32 6, i64 0, metadata !813, metadata !140) #3, !dbg !815
  tail call void @llvm.dbg.value(metadata i32 1000, i64 0, metadata !816, metadata !140) #3, !dbg !817
  %call.i80 = tail call noalias i8* @malloc(i64 24) #3, !dbg !818
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !819, metadata !140) #3, !dbg !820
  %scevgep.i81 = getelementptr i8* %call.i80, i64 20, !dbg !814
  %46 = bitcast i8* %scevgep.i81 to i32*, !dbg !821
  store i32 0, i32* %46, align 1, !dbg !821
  %47 = bitcast i8* %call.i80 to i8**, !dbg !822
  store i8* %call.i74, i8** %47, align 8, !dbg !822, !tbaa !187
  %p_id.i83 = getelementptr inbounds i8* %call.i80, i64 8, !dbg !823
  %48 = bitcast i8* %p_id.i83 to i32*, !dbg !823
  store i32 6, i32* %48, align 4, !dbg !823, !tbaa !190
  %p_kind.i84 = getelementptr inbounds i8* %call.i80, i64 12, !dbg !824
  %49 = bitcast i8* %p_kind.i84 to i32*, !dbg !824
  store i32 1000, i32* %49, align 4, !dbg !824, !tbaa !192
  %p_a1.i85 = getelementptr inbounds i8* %call.i80, i64 16, !dbg !825
  %50 = bitcast i8* %p_a1.i85 to i32*, !dbg !825
  store i32 0, i32* %50, align 4, !dbg !825, !tbaa !194
  tail call void @llvm.dbg.value(metadata i32 6, i64 0, metadata !826, metadata !140) #3, !dbg !828
  tail call void @llvm.dbg.value(metadata i32 1000, i64 0, metadata !829, metadata !140) #3, !dbg !830
  %call.i86 = tail call noalias i8* @malloc(i64 24) #3, !dbg !831
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !832, metadata !140) #3, !dbg !833
  %scevgep.i87 = getelementptr i8* %call.i86, i64 20, !dbg !827
  %51 = bitcast i8* %scevgep.i87 to i32*, !dbg !834
  store i32 0, i32* %51, align 1, !dbg !834
  %52 = bitcast i8* %call.i86 to i8**, !dbg !835
  store i8* %call.i80, i8** %52, align 8, !dbg !835, !tbaa !187
  %p_id.i89 = getelementptr inbounds i8* %call.i86, i64 8, !dbg !836
  %53 = bitcast i8* %p_id.i89 to i32*, !dbg !836
  store i32 6, i32* %53, align 4, !dbg !836, !tbaa !190
  %p_kind.i90 = getelementptr inbounds i8* %call.i86, i64 12, !dbg !837
  %54 = bitcast i8* %p_kind.i90 to i32*, !dbg !837
  store i32 1000, i32* %54, align 4, !dbg !837, !tbaa !192
  %p_a1.i91 = getelementptr inbounds i8* %call.i86, i64 16, !dbg !838
  %55 = bitcast i8* %p_a1.i91 to i32*, !dbg !838
  store i32 0, i32* %55, align 4, !dbg !838, !tbaa !194
  tail call void @llvm.dbg.value(metadata i32 4, i64 0, metadata !839, metadata !140) #3, !dbg !841
  tail call void @llvm.dbg.value(metadata i32 3000, i64 0, metadata !842, metadata !140) #3, !dbg !843
  tail call void @llvm.dbg.value(metadata i32 3, i64 0, metadata !844, metadata !140) #3, !dbg !845
  tail call void @llvm.dbg.value(metadata %struct.task* (%struct.packet*)* @handlerfn, i64 0, metadata !846, metadata !140) #3, !dbg !847
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !848, metadata !140) #3, !dbg !849
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !850, metadata !140) #3, !dbg !851
  %call.i92 = tail call noalias i8* @malloc(i64 56) #3, !dbg !852
  store i8* %call.i92, i8** bitcast (%struct.task** getelementptr inbounds ([11 x %struct.task*]* @tasktab, i64 0, i64 4) to i8**), align 16, !dbg !853, !tbaa !150
  %56 = bitcast i8* %call.i92 to i8**, !dbg !854
  store i8* %call.i65, i8** %56, align 8, !dbg !854, !tbaa !156
  %t_id.i94 = getelementptr inbounds i8* %call.i92, i64 8, !dbg !855
  %57 = bitcast i8* %t_id.i94 to i32*, !dbg !855
  store i32 4, i32* %57, align 4, !dbg !855, !tbaa !161
  %t_pri.i95 = getelementptr inbounds i8* %call.i92, i64 12, !dbg !856
  %58 = bitcast i8* %t_pri.i95 to i32*, !dbg !856
  store i32 3000, i32* %58, align 4, !dbg !856, !tbaa !163
  %t_wkq.i96 = getelementptr inbounds i8* %call.i92, i64 16, !dbg !857
  %59 = bitcast i8* %t_wkq.i96 to i8**, !dbg !857
  store i8* %call.i86, i8** %59, align 8, !dbg !857, !tbaa !165
  %t_state.i97 = getelementptr inbounds i8* %call.i92, i64 24, !dbg !858
  %60 = bitcast i8* %t_state.i97 to i32*, !dbg !858
  store i32 3, i32* %60, align 4, !dbg !858, !tbaa !167
  %t_fn.i98 = getelementptr inbounds i8* %call.i92, i64 32, !dbg !859
  %61 = bitcast i8* %t_fn.i98 to %struct.task* (%struct.packet*)**, !dbg !859
  store %struct.task* (%struct.packet*)* @handlerfn, %struct.task* (%struct.packet*)** %61, align 8, !dbg !859, !tbaa !169
  %t_v1.i99 = getelementptr inbounds i8* %call.i92, i64 40, !dbg !860
  call void @llvm.memset.p0i8.i64(i8* %t_v1.i99, i8 0, i64 16, i32 8, i1 false), !dbg !861
  tail call void @llvm.dbg.value(metadata %struct.packet* null, i64 0, metadata !117, metadata !140), !dbg !656
  tail call void @llvm.dbg.value(metadata i32 5, i64 0, metadata !862, metadata !140) #3, !dbg !864
  tail call void @llvm.dbg.value(metadata i32 4000, i64 0, metadata !865, metadata !140) #3, !dbg !866
  tail call void @llvm.dbg.value(metadata %struct.packet* null, i64 0, metadata !867, metadata !140) #3, !dbg !868
  tail call void @llvm.dbg.value(metadata i32 2, i64 0, metadata !869, metadata !140) #3, !dbg !870
  tail call void @llvm.dbg.value(metadata %struct.task* (%struct.packet*)* @devfn, i64 0, metadata !871, metadata !140) #3, !dbg !872
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !873, metadata !140) #3, !dbg !874
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !875, metadata !140) #3, !dbg !876
  %call.i101 = tail call noalias i8* @malloc(i64 56) #3, !dbg !877
  store i8* %call.i101, i8** bitcast (%struct.task** getelementptr inbounds ([11 x %struct.task*]* @tasktab, i64 0, i64 5) to i8**), align 8, !dbg !878, !tbaa !150
  %62 = bitcast i8* %call.i101 to i8**, !dbg !879
  store i8* %call.i92, i8** %62, align 8, !dbg !879, !tbaa !156
  %t_id.i103 = getelementptr inbounds i8* %call.i101, i64 8, !dbg !880
  %63 = bitcast i8* %t_id.i103 to i32*, !dbg !880
  store i32 5, i32* %63, align 4, !dbg !880, !tbaa !161
  %t_pri.i104 = getelementptr inbounds i8* %call.i101, i64 12, !dbg !881
  %64 = bitcast i8* %t_pri.i104 to i32*, !dbg !881
  store i32 4000, i32* %64, align 4, !dbg !881, !tbaa !163
  %t_wkq.i105 = getelementptr inbounds i8* %call.i101, i64 16, !dbg !882
  %65 = bitcast i8* %t_wkq.i105 to %struct.packet**, !dbg !882
  store %struct.packet* null, %struct.packet** %65, align 8, !dbg !882, !tbaa !165
  %t_state.i106 = getelementptr inbounds i8* %call.i101, i64 24, !dbg !883
  %66 = bitcast i8* %t_state.i106 to i32*, !dbg !883
  store i32 2, i32* %66, align 4, !dbg !883, !tbaa !167
  %t_fn.i107 = getelementptr inbounds i8* %call.i101, i64 32, !dbg !884
  %67 = bitcast i8* %t_fn.i107 to %struct.task* (%struct.packet*)**, !dbg !884
  store %struct.task* (%struct.packet*)* @devfn, %struct.task* (%struct.packet*)** %67, align 8, !dbg !884, !tbaa !169
  %t_v1.i108 = getelementptr inbounds i8* %call.i101, i64 40, !dbg !885
  call void @llvm.memset.p0i8.i64(i8* %t_v1.i108, i8 0, i64 16, i32 8, i1 false), !dbg !886
  tail call void @llvm.dbg.value(metadata i32 6, i64 0, metadata !887, metadata !140) #3, !dbg !889
  tail call void @llvm.dbg.value(metadata i32 5000, i64 0, metadata !890, metadata !140) #3, !dbg !891
  tail call void @llvm.dbg.value(metadata %struct.packet* null, i64 0, metadata !892, metadata !140) #3, !dbg !893
  tail call void @llvm.dbg.value(metadata i32 2, i64 0, metadata !894, metadata !140) #3, !dbg !895
  tail call void @llvm.dbg.value(metadata %struct.task* (%struct.packet*)* @devfn, i64 0, metadata !896, metadata !140) #3, !dbg !897
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !898, metadata !140) #3, !dbg !899
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !900, metadata !140) #3, !dbg !901
  %call.i110 = tail call noalias i8* @malloc(i64 56) #3, !dbg !902
  store i8* %call.i110, i8** bitcast (%struct.task** getelementptr inbounds ([11 x %struct.task*]* @tasktab, i64 0, i64 6) to i8**), align 16, !dbg !903, !tbaa !150
  %68 = bitcast i8* %call.i110 to i8**, !dbg !904
  store i8* %call.i101, i8** %68, align 8, !dbg !904, !tbaa !156
  %t_id.i112 = getelementptr inbounds i8* %call.i110, i64 8, !dbg !905
  %69 = bitcast i8* %t_id.i112 to i32*, !dbg !905
  store i32 6, i32* %69, align 4, !dbg !905, !tbaa !161
  %t_pri.i113 = getelementptr inbounds i8* %call.i110, i64 12, !dbg !906
  %70 = bitcast i8* %t_pri.i113 to i32*, !dbg !906
  store i32 5000, i32* %70, align 4, !dbg !906, !tbaa !163
  %t_wkq.i114 = getelementptr inbounds i8* %call.i110, i64 16, !dbg !907
  %71 = bitcast i8* %t_wkq.i114 to %struct.packet**, !dbg !907
  store %struct.packet* null, %struct.packet** %71, align 8, !dbg !907, !tbaa !165
  %t_state.i115 = getelementptr inbounds i8* %call.i110, i64 24, !dbg !908
  %72 = bitcast i8* %t_state.i115 to i32*, !dbg !908
  store i32 2, i32* %72, align 4, !dbg !908, !tbaa !167
  %t_fn.i116 = getelementptr inbounds i8* %call.i110, i64 32, !dbg !909
  %73 = bitcast i8* %t_fn.i116 to %struct.task* (%struct.packet*)**, !dbg !909
  store %struct.task* (%struct.packet*)* @devfn, %struct.task* (%struct.packet*)** %73, align 8, !dbg !909, !tbaa !169
  %t_v1.i117 = getelementptr inbounds i8* %call.i110, i64 40, !dbg !910
  call void @llvm.memset.p0i8.i64(i8* %t_v1.i117, i8 0, i64 16, i32 8, i1 false), !dbg !911
  store i8* %call.i110, i8** bitcast (%struct.task** @tasklist to i8**), align 8, !dbg !912, !tbaa !150
  store i8* %call.i110, i8** bitcast (%struct.task** @tcb to i8**), align 8, !dbg !913, !tbaa !150
  store i32 0, i32* @holdcount, align 4, !dbg !914, !tbaa !199
  store i32 0, i32* @qpktcount, align 4, !dbg !915, !tbaa !199
  %puts28 = tail call i32 @puts(i8* getelementptr inbounds ([9 x i8]* @str11, i64 0, i64 0)), !dbg !916
  store i32 0, i32* @tracing, align 4, !dbg !917, !tbaa !199
  store i32 0, i32* @layout, align 4, !dbg !918, !tbaa !199
  tail call void @schedule(), !dbg !919
  %puts29 = tail call i32 @puts(i8* getelementptr inbounds ([9 x i8]* @str12, i64 0, i64 0)), !dbg !920
  %74 = load i32* @qpktcount, align 4, !dbg !921, !tbaa !199
  %75 = load i32* @holdcount, align 4, !dbg !922, !tbaa !199
  %call12 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str6, i64 0, i64 0), i32 %74, i32 %75) #3, !dbg !923
  %call13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str7, i64 0, i64 0)) #3, !dbg !924
  %76 = load i32* @qpktcount, align 4, !dbg !925, !tbaa !199
  %cmp = icmp eq i32 %76, 23263894, !dbg !925
  %77 = load i32* @holdcount, align 4
  %cmp14 = icmp eq i32 %77, 9305557, !dbg !927
  %or.cond = and i1 %cmp, %cmp14, !dbg !929
  br i1 %or.cond, label %if.then, label %if.else, !dbg !929

if.then:                                          ; preds = %entry
  %call15 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str8, i64 0, i64 0)) #3, !dbg !930
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !118, metadata !140), !dbg !932
  br label %if.end, !dbg !933

if.else:                                          ; preds = %entry
  %call16 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str9, i64 0, i64 0)) #3, !dbg !934
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !118, metadata !140), !dbg !932
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %retval1.0 = phi i32 [ 0, %if.then ], [ 1, %if.else ]
  %puts30 = tail call i32 @puts(i8* getelementptr inbounds ([12 x i8]* @str13, i64 0, i64 0)), !dbg !936
  ret i32 %retval1.0, !dbg !937
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #2

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
!llvm.module.flags = !{!137, !138}
!llvm.ident = !{!139}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !32, !119, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c] [DW_LANG_C99]
!1 = !{!"richards_benchmark.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4, !12, !30}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from task]
!5 = !{!"0x13\00task\0074\00448\0064\000\000\000", !1, null, null, !6, null, null, null} ; [ DW_TAG_structure_type ] [task] [line 74, size 448, align 64, offset 0] [def] [from ]
!6 = !{!7, !8, !10, !11, !24, !25, !29, !31}
!7 = !{!"0xd\00t_link\0076\0064\0064\000\000", !1, !5, !4} ; [ DW_TAG_member ] [t_link] [line 76, size 64, align 64, offset 0] [from ]
!8 = !{!"0xd\00t_id\0077\0032\0032\0064\000", !1, !5, !9} ; [ DW_TAG_member ] [t_id] [line 77, size 32, align 32, offset 64] [from int]
!9 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!10 = !{!"0xd\00t_pri\0078\0032\0032\0096\000", !1, !5, !9} ; [ DW_TAG_member ] [t_pri] [line 78, size 32, align 32, offset 96] [from int]
!11 = !{!"0xd\00t_wkq\0079\0064\0064\00128\000", !1, !5, !12} ; [ DW_TAG_member ] [t_wkq] [line 79, size 64, align 64, offset 128] [from ]
!12 = !{!"0xf\00\000\0064\0064\000\000", null, null, !13} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from packet]
!13 = !{!"0x13\00packet\0065\00192\0064\000\000\000", !1, null, null, !14, null, null, null} ; [ DW_TAG_structure_type ] [packet] [line 65, size 192, align 64, offset 0] [def] [from ]
!14 = !{!15, !16, !17, !18, !19}
!15 = !{!"0xd\00p_link\0067\0064\0064\000\000", !1, !13, !12} ; [ DW_TAG_member ] [p_link] [line 67, size 64, align 64, offset 0] [from ]
!16 = !{!"0xd\00p_id\0068\0032\0032\0064\000", !1, !13, !9} ; [ DW_TAG_member ] [p_id] [line 68, size 32, align 32, offset 64] [from int]
!17 = !{!"0xd\00p_kind\0069\0032\0032\0096\000", !1, !13, !9} ; [ DW_TAG_member ] [p_kind] [line 69, size 32, align 32, offset 96] [from int]
!18 = !{!"0xd\00p_a1\0070\0032\0032\00128\000", !1, !13, !9} ; [ DW_TAG_member ] [p_a1] [line 70, size 32, align 32, offset 128] [from int]
!19 = !{!"0xd\00p_a2\0071\0032\008\00160\000", !1, !13, !20} ; [ DW_TAG_member ] [p_a2] [line 71, size 32, align 8, offset 160] [from ]
!20 = !{!"0x1\00\000\0032\008\000\000\000", null, null, !21, !22, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 32, align 8, offset 0] [from char]
!21 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!22 = !{!23}
!23 = !{!"0x21\000\004"}                          ; [ DW_TAG_subrange_type ] [0, 3]
!24 = !{!"0xd\00t_state\0080\0032\0032\00192\000", !1, !5, !9} ; [ DW_TAG_member ] [t_state] [line 80, size 32, align 32, offset 192] [from int]
!25 = !{!"0xd\00t_fn\0081\0064\0064\00256\000", !1, !5, !26} ; [ DW_TAG_member ] [t_fn] [line 81, size 64, align 64, offset 256] [from ]
!26 = !{!"0xf\00\000\0064\0064\000\000", null, null, !27} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!27 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !28, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!28 = !{!4, !12}
!29 = !{!"0xd\00t_v1\0082\0064\0064\00320\000", !1, !5, !30} ; [ DW_TAG_member ] [t_v1] [line 82, size 64, align 64, offset 320] [from long int]
!30 = !{!"0x24\00long int\000\0064\0064\000\000\005", null, null} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!31 = !{!"0xd\00t_v2\0083\0064\0064\00384\000", !1, !5, !30} ; [ DW_TAG_member ] [t_v2] [line 83, size 64, align 64, offset 384] [from long int]
!32 = !{!33, !46, !55, !60, !67, !70, !71, !77, !81, !85, !88, !94, !104, !107, !113}
!33 = !{!"0x2e\00createtask\00createtask\00\00100\000\001\000\000\00256\001\00107", !1, !34, !35, null, void (i32, i32, %struct.packet*, i32, %struct.task* (%struct.packet*)*, i64, i64)* @createtask, null, null, !37} ; [ DW_TAG_subprogram ] [line 100] [def] [scope 107] [createtask]
!34 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!35 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !36, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!36 = !{null, !9, !9, !12, !9, !26, !30, !30}
!37 = !{!38, !39, !40, !41, !42, !43, !44, !45}
!38 = !{!"0x101\00id\0016777316\000", !33, !34, !9} ; [ DW_TAG_arg_variable ] [id] [line 100]
!39 = !{!"0x101\00pri\0033554533\000", !33, !34, !9} ; [ DW_TAG_arg_variable ] [pri] [line 101]
!40 = !{!"0x101\00wkq\0050331750\000", !33, !34, !12} ; [ DW_TAG_arg_variable ] [wkq] [line 102]
!41 = !{!"0x101\00state\0067108967\000", !33, !34, !9} ; [ DW_TAG_arg_variable ] [state] [line 103]
!42 = !{!"0x101\00fn\0083886184\000", !33, !34, !26} ; [ DW_TAG_arg_variable ] [fn] [line 104]
!43 = !{!"0x101\00v1\00100663401\000", !33, !34, !30} ; [ DW_TAG_arg_variable ] [v1] [line 105]
!44 = !{!"0x101\00v2\00117440618\000", !33, !34, !30} ; [ DW_TAG_arg_variable ] [v2] [line 106]
!45 = !{!"0x100\00t\00108\000", !33, !34, !4}     ; [ DW_TAG_auto_variable ] [t] [line 108]
!46 = !{!"0x2e\00pkt\00pkt\00\00122\000\001\000\000\00256\001\00123", !1, !34, !47, null, %struct.packet* (%struct.packet*, i32, i32)* @pkt, null, null, !49} ; [ DW_TAG_subprogram ] [line 122] [def] [scope 123] [pkt]
!47 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !48, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!48 = !{!12, !12, !9, !9}
!49 = !{!50, !51, !52, !53, !54}
!50 = !{!"0x101\00link\0016777338\000", !46, !34, !12} ; [ DW_TAG_arg_variable ] [link] [line 122]
!51 = !{!"0x101\00id\0033554554\000", !46, !34, !9} ; [ DW_TAG_arg_variable ] [id] [line 122]
!52 = !{!"0x101\00kind\0050331770\000", !46, !34, !9} ; [ DW_TAG_arg_variable ] [kind] [line 122]
!53 = !{!"0x100\00i\00124\000", !46, !34, !9}     ; [ DW_TAG_auto_variable ] [i] [line 124]
!54 = !{!"0x100\00p\00125\000", !46, !34, !12}    ; [ DW_TAG_auto_variable ] [p] [line 125]
!55 = !{!"0x2e\00trace\00trace\00\00138\000\001\000\000\00256\001\00139", !1, !34, !56, null, void (i8)* @trace, null, null, !58} ; [ DW_TAG_subprogram ] [line 138] [def] [scope 139] [trace]
!56 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !57, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!57 = !{null, !21}
!58 = !{!59}
!59 = !{!"0x101\00a\0016777354\000", !55, !34, !21} ; [ DW_TAG_arg_variable ] [a] [line 138]
!60 = !{!"0x2e\00schedule\00schedule\00\00149\000\001\000\000\000\001\00150", !1, !34, !61, null, void ()* @schedule, null, null, !63} ; [ DW_TAG_subprogram ] [line 149] [def] [scope 150] [schedule]
!61 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !62, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!62 = !{null}
!63 = !{!64, !66}
!64 = !{!"0x100\00pkt\00153\000", !65, !34, !12}  ; [ DW_TAG_auto_variable ] [pkt] [line 153]
!65 = !{!"0xb\00152\005\004", !1, !60}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!66 = !{!"0x100\00newtcb\00154\000", !65, !34, !4} ; [ DW_TAG_auto_variable ] [newtcb] [line 154]
!67 = !{!"0x2e\00Wait\00Wait\00\00192\000\001\000\000\00256\001\00193", !1, !34, !68, null, %struct.task* ()* @Wait, null, null, !2} ; [ DW_TAG_subprogram ] [line 192] [def] [scope 193] [Wait]
!68 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !69, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!69 = !{!4}
!70 = !{!"0x2e\00holdself\00holdself\00\00198\000\001\000\000\00256\001\00199", !1, !34, !68, null, %struct.task* ()* @holdself, null, null, !2} ; [ DW_TAG_subprogram ] [line 198] [def] [scope 199] [holdself]
!71 = !{!"0x2e\00findtcb\00findtcb\00\00205\000\001\000\000\00256\001\00206", !1, !34, !72, null, %struct.task* (i32)* @findtcb, null, null, !74} ; [ DW_TAG_subprogram ] [line 205] [def] [scope 206] [findtcb]
!72 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !73, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!73 = !{!4, !9}
!74 = !{!75, !76}
!75 = !{!"0x101\00id\0016777421\000", !71, !34, !9} ; [ DW_TAG_arg_variable ] [id] [line 205]
!76 = !{!"0x100\00t\00207\000", !71, !34, !4}     ; [ DW_TAG_auto_variable ] [t] [line 207]
!77 = !{!"0x2e\00release\00release\00\00215\000\001\000\000\00256\001\00216", !1, !34, !72, null, %struct.task* (i32)* @release, null, null, !78} ; [ DW_TAG_subprogram ] [line 215] [def] [scope 216] [release]
!78 = !{!79, !80}
!79 = !{!"0x101\00id\0016777431\000", !77, !34, !9} ; [ DW_TAG_arg_variable ] [id] [line 215]
!80 = !{!"0x100\00t\00217\000", !77, !34, !4}     ; [ DW_TAG_auto_variable ] [t] [line 217]
!81 = !{!"0x2e\00qpkt\00qpkt\00\00229\000\001\000\000\00256\001\00230", !1, !34, !27, null, %struct.task* (%struct.packet*)* @qpkt, null, null, !82} ; [ DW_TAG_subprogram ] [line 229] [def] [scope 230] [qpkt]
!82 = !{!83, !84}
!83 = !{!"0x101\00pkt\0016777445\000", !81, !34, !12} ; [ DW_TAG_arg_variable ] [pkt] [line 229]
!84 = !{!"0x100\00t\00231\000", !81, !34, !4}     ; [ DW_TAG_auto_variable ] [t] [line 231]
!85 = !{!"0x2e\00idlefn\00idlefn\00\00255\000\001\000\000\00256\001\00256", !1, !34, !27, null, %struct.task* (%struct.packet*)* @idlefn, null, null, !86} ; [ DW_TAG_subprogram ] [line 255] [def] [scope 256] [idlefn]
!86 = !{!87}
!87 = !{!"0x101\00pkt\0016777471\000", !85, !34, !12} ; [ DW_TAG_arg_variable ] [pkt] [line 255]
!88 = !{!"0x2e\00workfn\00workfn\00\00272\000\001\000\000\00256\001\00273", !1, !34, !27, null, %struct.task* (%struct.packet*)* @workfn, null, null, !89} ; [ DW_TAG_subprogram ] [line 272] [def] [scope 273] [workfn]
!89 = !{!90, !91}
!90 = !{!"0x101\00pkt\0016777488\000", !88, !34, !12} ; [ DW_TAG_arg_variable ] [pkt] [line 272]
!91 = !{!"0x100\00i\00277\000", !92, !34, !9}     ; [ DW_TAG_auto_variable ] [i] [line 277]
!92 = !{!"0xb\00276\005\0021", !1, !93}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!93 = !{!"0xb\00274\0010\0020", !1, !88}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!94 = !{!"0x2e\00handlerfn\00handlerfn\00\00293\000\001\000\000\00256\001\00294", !1, !34, !27, null, %struct.task* (%struct.packet*)* @handlerfn, null, null, !95} ; [ DW_TAG_subprogram ] [line 293] [def] [scope 294] [handlerfn]
!95 = !{!96, !97, !100, !101}
!96 = !{!"0x101\00pkt\0016777509\000", !94, !34, !12} ; [ DW_TAG_arg_variable ] [pkt] [line 293]
!97 = !{!"0x100\00count\00300\000", !98, !34, !9} ; [ DW_TAG_auto_variable ] [count] [line 300]
!98 = !{!"0xb\00299\005\0028", !1, !99}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!99 = !{!"0xb\00298\009\0027", !1, !94}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!100 = !{!"0x100\00workpkt\00301\000", !98, !34, !12} ; [ DW_TAG_auto_variable ] [workpkt] [line 301]
!101 = !{!"0x100\00devpkt\00312\000", !102, !34, !12} ; [ DW_TAG_auto_variable ] [devpkt] [line 312]
!102 = !{!"0xb\00311\009\0032", !1, !103}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!103 = !{!"0xb\00310\0014\0031", !1, !98}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!104 = !{!"0x2e\00devfn\00devfn\00\00324\000\001\000\000\00256\001\00325", !1, !34, !27, null, %struct.task* (%struct.packet*)* @devfn, null, null, !105} ; [ DW_TAG_subprogram ] [line 324] [def] [scope 325] [devfn]
!105 = !{!106}
!106 = !{!"0x101\00pkt\0016777540\000", !104, !34, !12} ; [ DW_TAG_arg_variable ] [pkt] [line 324]
!107 = !{!"0x2e\00append\00append\00\00341\000\001\000\000\00256\001\00342", !1, !34, !108, null, void (%struct.packet*, %struct.packet*)* @append, null, null, !110} ; [ DW_TAG_subprogram ] [line 341] [def] [scope 342] [append]
!108 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !109, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!109 = !{null, !12, !12}
!110 = !{!111, !112}
!111 = !{!"0x101\00pkt\0016777557\000", !107, !34, !12} ; [ DW_TAG_arg_variable ] [pkt] [line 341]
!112 = !{!"0x101\00ptr\0033554773\000", !107, !34, !12} ; [ DW_TAG_arg_variable ] [ptr] [line 341]
!113 = !{!"0x2e\00main\00main\00\00350\000\001\000\000\000\001\00351", !1, !34, !114, null, i32 ()* @main, null, null, !116} ; [ DW_TAG_subprogram ] [line 350] [def] [scope 351] [main]
!114 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !115, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!115 = !{!9}
!116 = !{!117, !118}
!117 = !{!"0x100\00wkq\00352\000", !113, !34, !12} ; [ DW_TAG_auto_variable ] [wkq] [line 352]
!118 = !{!"0x100\00retval\00353\000", !113, !34, !9} ; [ DW_TAG_auto_variable ] [retval] [line 353]
!119 = !{!120, !124, !128, !129, !130, !131, !132, !133, !134, !135, !136}
!120 = !{!"0x34\00alphabet\00alphabet\00\0086\000\001", null, !34, !121, [28 x i8]* @alphabet, null} ; [ DW_TAG_variable ] [alphabet] [line 86] [def]
!121 = !{!"0x1\00\000\00224\008\000\000\000", null, null, !21, !122, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 224, align 8, offset 0] [from char]
!122 = !{!123}
!123 = !{!"0x21\000\0028"}                        ; [ DW_TAG_subrange_type ] [0, 27]
!124 = !{!"0x34\00tasktab\00tasktab\00\0087\000\001", null, !34, !125, [11 x %struct.task*]* @tasktab, null} ; [ DW_TAG_variable ] [tasktab] [line 87] [def]
!125 = !{!"0x1\00\000\00704\0064\000\000\000", null, null, !4, !126, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 704, align 64, offset 0] [from ]
!126 = !{!127}
!127 = !{!"0x21\000\0011"}                        ; [ DW_TAG_subrange_type ] [0, 10]
!128 = !{!"0x34\00tasklist\00tasklist\00\0088\000\001", null, !34, !4, %struct.task** @tasklist, null} ; [ DW_TAG_variable ] [tasklist] [line 88] [def]
!129 = !{!"0x34\00qpktcount\00qpktcount\00\0093\000\001", null, !34, !9, i32* @qpktcount, null} ; [ DW_TAG_variable ] [qpktcount] [line 93] [def]
!130 = !{!"0x34\00holdcount\00holdcount\00\0094\000\001", null, !34, !9, i32* @holdcount, null} ; [ DW_TAG_variable ] [holdcount] [line 94] [def]
!131 = !{!"0x34\00tracing\00tracing\00\0095\000\001", null, !34, !9, i32* @tracing, null} ; [ DW_TAG_variable ] [tracing] [line 95] [def]
!132 = !{!"0x34\00layout\00layout\00\0096\000\001", null, !34, !9, i32* @layout, null} ; [ DW_TAG_variable ] [layout] [line 96] [def]
!133 = !{!"0x34\00tcb\00tcb\00\0089\000\001", null, !34, !4, %struct.task** @tcb, null} ; [ DW_TAG_variable ] [tcb] [line 89] [def]
!134 = !{!"0x34\00taskid\00taskid\00\0090\000\001", null, !34, !30, i64* @taskid, null} ; [ DW_TAG_variable ] [taskid] [line 90] [def]
!135 = !{!"0x34\00v1\00v1\00\0091\000\001", null, !34, !30, i64* @v1, null} ; [ DW_TAG_variable ] [v1] [line 91] [def]
!136 = !{!"0x34\00v2\00v2\00\0092\000\001", null, !34, !30, i64* @v2, null} ; [ DW_TAG_variable ] [v2] [line 92] [def]
!137 = !{i32 2, !"Dwarf Version", i32 4}
!138 = !{i32 2, !"Debug Info Version", i32 2}
!139 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!140 = !{!"0x102"}                                ; [ DW_TAG_expression ]
!141 = !MDLocation(line: 100, column: 21, scope: !33)
!142 = !MDLocation(line: 101, column: 21, scope: !33)
!143 = !MDLocation(line: 102, column: 32, scope: !33)
!144 = !MDLocation(line: 103, column: 21, scope: !33)
!145 = !MDLocation(line: 104, column: 32, scope: !33)
!146 = !MDLocation(line: 105, column: 22, scope: !33)
!147 = !MDLocation(line: 106, column: 22, scope: !33)
!148 = !MDLocation(line: 108, column: 37, scope: !33)
!149 = !MDLocation(line: 110, column: 5, scope: !33)
!150 = !{!151, !151, i64 0}
!151 = !{!"any pointer", !152, i64 0}
!152 = !{!"omnipotent char", !153, i64 0}
!153 = !{!"Simple C/C++ TBAA"}
!154 = !MDLocation(line: 111, column: 19, scope: !33)
!155 = !MDLocation(line: 111, column: 5, scope: !33)
!156 = !{!157, !151, i64 0}
!157 = !{!"task", !151, i64 0, !158, i64 8, !158, i64 12, !151, i64 16, !158, i64 24, !151, i64 32, !159, i64 40, !159, i64 48}
!158 = !{!"int", !152, i64 0}
!159 = !{!"long", !152, i64 0}
!160 = !MDLocation(line: 112, column: 5, scope: !33)
!161 = !{!157, !158, i64 8}
!162 = !MDLocation(line: 113, column: 5, scope: !33)
!163 = !{!157, !158, i64 12}
!164 = !MDLocation(line: 114, column: 5, scope: !33)
!165 = !{!157, !151, i64 16}
!166 = !MDLocation(line: 115, column: 5, scope: !33)
!167 = !{!157, !158, i64 24}
!168 = !MDLocation(line: 116, column: 5, scope: !33)
!169 = !{!157, !151, i64 32}
!170 = !MDLocation(line: 117, column: 5, scope: !33)
!171 = !{!157, !159, i64 40}
!172 = !MDLocation(line: 118, column: 5, scope: !33)
!173 = !{!157, !159, i64 48}
!174 = !MDLocation(line: 119, column: 5, scope: !33)
!175 = !MDLocation(line: 120, column: 1, scope: !33)
!176 = !MDLocation(line: 122, column: 35, scope: !46)
!177 = !MDLocation(line: 122, column: 45, scope: !46)
!178 = !MDLocation(line: 122, column: 53, scope: !46)
!179 = !MDLocation(line: 125, column: 41, scope: !46)
!180 = !MDLocation(line: 125, column: 20, scope: !46)
!181 = !MDLocation(line: 124, column: 9, scope: !46)
!182 = !MDLocation(line: 128, column: 9, scope: !183)
!183 = !{!"0xb\00127\005\001", !1, !184}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!184 = !{!"0xb\00127\005\000", !1, !46}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!185 = !MDLocation(line: 125, column: 24, scope: !46)
!186 = !MDLocation(line: 130, column: 5, scope: !46)
!187 = !{!188, !151, i64 0}
!188 = !{!"packet", !151, i64 0, !158, i64 8, !158, i64 12, !158, i64 16, !152, i64 20}
!189 = !MDLocation(line: 131, column: 5, scope: !46)
!190 = !{!188, !158, i64 8}
!191 = !MDLocation(line: 132, column: 5, scope: !46)
!192 = !{!188, !158, i64 12}
!193 = !MDLocation(line: 133, column: 5, scope: !46)
!194 = !{!188, !158, i64 16}
!195 = !MDLocation(line: 135, column: 5, scope: !46)
!196 = !MDLocation(line: 138, column: 17, scope: !55)
!197 = !MDLocation(line: 140, column: 9, scope: !198)
!198 = !{!"0xb\00140\009\002", !1, !55}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!199 = !{!158, !158, i64 0}
!200 = !MDLocation(line: 140, column: 9, scope: !55)
!201 = !MDLocation(line: 142, column: 9, scope: !202)
!202 = !{!"0xb\00141\004\003", !1, !198}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!203 = !MDLocation(line: 143, column: 9, scope: !202)
!204 = !MDLocation(line: 144, column: 5, scope: !202)
!205 = !MDLocation(line: 146, column: 18, scope: !55)
!206 = !MDLocation(line: 146, column: 5, scope: !55)
!207 = !MDLocation(line: 147, column: 1, scope: !55)
!208 = !MDLocation(line: 151, column: 13, scope: !209)
!209 = !{!"0xb\002", !1, !210}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!210 = !{!"0xb\001", !1, !60}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!211 = !MDLocation(line: 151, column: 5, scope: !60)
!212 = !MDLocation(line: 153, column: 24, scope: !65)
!213 = !MDLocation(line: 158, column: 18, scope: !65)
!214 = !MDLocation(line: 158, column: 9, scope: !65)
!215 = !MDLocation(line: 161, column: 23, scope: !216)
!216 = !{!"0xb\00159\009\005", !1, !65}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!217 = !MDLocation(line: 162, column: 30, scope: !216)
!218 = !MDLocation(line: 162, column: 17, scope: !216)
!219 = !MDLocation(line: 163, column: 32, scope: !216)
!220 = !MDLocation(line: 163, column: 17, scope: !216)
!221 = !MDLocation(line: 167, column: 26, scope: !216)
!222 = !MDLocation(line: 167, column: 17, scope: !216)
!223 = !{!159, !159, i64 0}
!224 = !MDLocation(line: 168, column: 22, scope: !216)
!225 = !MDLocation(line: 168, column: 17, scope: !216)
!226 = !MDLocation(line: 169, column: 22, scope: !216)
!227 = !MDLocation(line: 169, column: 17, scope: !216)
!228 = !MDLocation(line: 170, column: 21, scope: !229)
!229 = !{!"0xb\00170\0021\006", !1, !216}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!230 = !MDLocation(line: 170, column: 21, scope: !216)
!231 = !MDLocation(line: 140, column: 9, scope: !198, inlinedAt: !232)
!232 = !MDLocation(line: 170, column: 36, scope: !229)
!233 = !MDLocation(line: 140, column: 9, scope: !55, inlinedAt: !232)
!234 = !MDLocation(line: 142, column: 9, scope: !202, inlinedAt: !232)
!235 = !MDLocation(line: 143, column: 9, scope: !202, inlinedAt: !232)
!236 = !MDLocation(line: 144, column: 5, scope: !202, inlinedAt: !232)
!237 = !MDLocation(line: 146, column: 18, scope: !55, inlinedAt: !232)
!238 = !MDLocation(line: 146, column: 5, scope: !55, inlinedAt: !232)
!239 = !MDLocation(line: 172, column: 29, scope: !216)
!240 = !MDLocation(line: 154, column: 22, scope: !65)
!241 = !MDLocation(line: 173, column: 29, scope: !216)
!242 = !MDLocation(line: 173, column: 17, scope: !216)
!243 = !MDLocation(line: 174, column: 29, scope: !216)
!244 = !MDLocation(line: 174, column: 17, scope: !216)
!245 = !MDLocation(line: 176, column: 17, scope: !216)
!246 = !MDLocation(line: 183, column: 23, scope: !216)
!247 = !MDLocation(line: 184, column: 17, scope: !216)
!248 = !MDLocation(line: 175, column: 17, scope: !216)
!249 = !MDLocation(line: 190, column: 1, scope: !60)
!250 = !MDLocation(line: 194, column: 5, scope: !67)
!251 = !MDLocation(line: 195, column: 5, scope: !67)
!252 = !MDLocation(line: 200, column: 5, scope: !70)
!253 = !MDLocation(line: 201, column: 5, scope: !70)
!254 = !MDLocation(line: 202, column: 13, scope: !70)
!255 = !MDLocation(line: 202, column: 5, scope: !70)
!256 = !MDLocation(line: 205, column: 26, scope: !71)
!257 = !MDLocation(line: 207, column: 18, scope: !71)
!258 = !MDLocation(line: 209, column: 9, scope: !71)
!259 = !MDLocation(line: 209, column: 18, scope: !260)
!260 = !{!"0xb\001", !1, !261}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!261 = !{!"0xb\00209\009\007", !1, !71}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!262 = !MDLocation(line: 210, column: 9, scope: !261)
!263 = !MDLocation(line: 211, column: 9, scope: !264)
!264 = !{!"0xb\00211\009\008", !1, !71}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!265 = !MDLocation(line: 211, column: 9, scope: !71)
!266 = !MDLocation(line: 211, column: 15, scope: !264)
!267 = !MDLocation(line: 212, column: 5, scope: !71)
!268 = !MDLocation(line: 215, column: 26, scope: !77)
!269 = !{!"0x101\00id\0016777421\000", !71, !34, !9, !270} ; [ DW_TAG_arg_variable ] [id] [line 205]
!270 = !MDLocation(line: 219, column: 9, scope: !77)
!271 = !MDLocation(line: 205, column: 26, scope: !71, inlinedAt: !270)
!272 = !{!"0x100\00t\00207\000", !71, !34, !4, !270} ; [ DW_TAG_auto_variable ] [t] [line 207]
!273 = !MDLocation(line: 207, column: 18, scope: !71, inlinedAt: !270)
!274 = !MDLocation(line: 209, column: 9, scope: !71, inlinedAt: !270)
!275 = !MDLocation(line: 209, column: 18, scope: !260, inlinedAt: !270)
!276 = !MDLocation(line: 210, column: 9, scope: !261, inlinedAt: !270)
!277 = !MDLocation(line: 211, column: 9, scope: !264, inlinedAt: !270)
!278 = !MDLocation(line: 211, column: 9, scope: !71, inlinedAt: !270)
!279 = !MDLocation(line: 211, column: 15, scope: !264, inlinedAt: !270)
!280 = !MDLocation(line: 220, column: 10, scope: !77)
!281 = !MDLocation(line: 222, column: 5, scope: !77)
!282 = !MDLocation(line: 223, column: 10, scope: !283)
!283 = !{!"0xb\00223\0010\0010", !1, !77}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!284 = !MDLocation(line: 223, column: 21, scope: !283)
!285 = !MDLocation(line: 223, column: 34, scope: !283)
!286 = !MDLocation(line: 226, column: 1, scope: !77)
!287 = !MDLocation(line: 229, column: 34, scope: !81)
!288 = !MDLocation(line: 233, column: 17, scope: !81)
!289 = !{!"0x101\00id\0016777421\000", !71, !34, !9, !290} ; [ DW_TAG_arg_variable ] [id] [line 205]
!290 = !MDLocation(line: 233, column: 9, scope: !81)
!291 = !MDLocation(line: 205, column: 26, scope: !71, inlinedAt: !290)
!292 = !{!"0x100\00t\00207\000", !71, !34, !4, !290} ; [ DW_TAG_auto_variable ] [t] [line 207]
!293 = !MDLocation(line: 207, column: 18, scope: !71, inlinedAt: !290)
!294 = !MDLocation(line: 209, column: 9, scope: !71, inlinedAt: !290)
!295 = !MDLocation(line: 209, column: 18, scope: !260, inlinedAt: !290)
!296 = !MDLocation(line: 210, column: 9, scope: !261, inlinedAt: !290)
!297 = !MDLocation(line: 211, column: 9, scope: !264, inlinedAt: !290)
!298 = !MDLocation(line: 211, column: 9, scope: !71, inlinedAt: !290)
!299 = !MDLocation(line: 211, column: 15, scope: !264, inlinedAt: !290)
!300 = !MDLocation(line: 234, column: 9, scope: !81)
!301 = !MDLocation(line: 236, column: 5, scope: !81)
!302 = !MDLocation(line: 238, column: 5, scope: !81)
!303 = !MDLocation(line: 239, column: 17, scope: !81)
!304 = !MDLocation(line: 239, column: 5, scope: !81)
!305 = !MDLocation(line: 241, column: 8, scope: !306)
!306 = !{!"0xb\00241\008\0012", !1, !81}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!307 = !MDLocation(line: 241, column: 8, scope: !81)
!308 = !MDLocation(line: 243, column: 9, scope: !309)
!309 = !{!"0xb\00242\005\0013", !1, !306}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!310 = !MDLocation(line: 244, column: 9, scope: !309)
!311 = !MDLocation(line: 245, column: 13, scope: !312)
!312 = !{!"0xb\00245\0013\0014", !1, !309}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!313 = !MDLocation(line: 245, column: 24, scope: !312)
!314 = !MDLocation(line: 245, column: 13, scope: !309)
!315 = !MDLocation(line: 249, column: 21, scope: !316)
!316 = !{!"0xb\00248\005\0015", !1, !306}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!317 = !{!"0x101\00pkt\0016777557\000", !107, !34, !12, !318} ; [ DW_TAG_arg_variable ] [pkt] [line 341]
!318 = !MDLocation(line: 249, column: 9, scope: !316)
!319 = !MDLocation(line: 341, column: 28, scope: !107, inlinedAt: !318)
!320 = !{!"0x101\00ptr\0033554773\000", !107, !34, !12, !318} ; [ DW_TAG_arg_variable ] [ptr] [line 341]
!321 = !MDLocation(line: 341, column: 48, scope: !107, inlinedAt: !318)
!322 = !MDLocation(line: 343, column: 5, scope: !107, inlinedAt: !318)
!323 = !MDLocation(line: 345, column: 5, scope: !107, inlinedAt: !318)
!324 = !MDLocation(line: 345, column: 13, scope: !325, inlinedAt: !318)
!325 = !{!"0xb\003", !1, !326}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!326 = !{!"0xb\001", !1, !107}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!327 = !MDLocation(line: 347, column: 5, scope: !107, inlinedAt: !318)
!328 = !MDLocation(line: 252, column: 13, scope: !81)
!329 = !MDLocation(line: 252, column: 5, scope: !81)
!330 = !MDLocation(line: 253, column: 1, scope: !81)
!331 = !MDLocation(line: 341, column: 28, scope: !107)
!332 = !MDLocation(line: 341, column: 48, scope: !107)
!333 = !MDLocation(line: 343, column: 5, scope: !107)
!334 = !MDLocation(line: 345, column: 5, scope: !107)
!335 = !MDLocation(line: 345, column: 13, scope: !325)
!336 = !MDLocation(line: 347, column: 5, scope: !107)
!337 = !MDLocation(line: 348, column: 1, scope: !107)
!338 = !MDLocation(line: 255, column: 36, scope: !85)
!339 = !MDLocation(line: 257, column: 5, scope: !85)
!340 = !MDLocation(line: 258, column: 10, scope: !341)
!341 = !{!"0xb\00258\0010\0016", !1, !85}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!342 = !MDLocation(line: 258, column: 10, scope: !85)
!343 = !MDLocation(line: 200, column: 5, scope: !70, inlinedAt: !344)
!344 = !MDLocation(line: 258, column: 27, scope: !345)
!345 = !{!"0xb\001", !1, !341}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!346 = !MDLocation(line: 201, column: 5, scope: !70, inlinedAt: !344)
!347 = !MDLocation(line: 202, column: 13, scope: !70, inlinedAt: !344)
!348 = !MDLocation(line: 258, column: 18, scope: !341)
!349 = !MDLocation(line: 260, column: 11, scope: !350)
!350 = !{!"0xb\00260\0010\0017", !1, !85}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!351 = !MDLocation(line: 260, column: 10, scope: !350)
!352 = !MDLocation(line: 262, column: 16, scope: !353)
!353 = !{!"0xb\00261\005\0018", !1, !350}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!354 = !MDLocation(line: 262, column: 14, scope: !353)
!355 = !MDLocation(line: 260, column: 10, scope: !85)
!356 = !MDLocation(line: 262, column: 9, scope: !353)
!357 = !{!"0x101\00id\0016777431\000", !77, !34, !9, !358} ; [ DW_TAG_arg_variable ] [id] [line 215]
!358 = !MDLocation(line: 263, column: 18, scope: !353)
!359 = !MDLocation(line: 215, column: 26, scope: !77, inlinedAt: !358)
!360 = !{!"0x101\00id\0016777421\000", !71, !34, !9, !361} ; [ DW_TAG_arg_variable ] [id] [line 205]
!361 = !MDLocation(line: 219, column: 9, scope: !77, inlinedAt: !358)
!362 = !MDLocation(line: 205, column: 26, scope: !71, inlinedAt: !361)
!363 = !{!"0x100\00t\00207\000", !71, !34, !4, !361} ; [ DW_TAG_auto_variable ] [t] [line 207]
!364 = !MDLocation(line: 207, column: 18, scope: !71, inlinedAt: !361)
!365 = !MDLocation(line: 210, column: 9, scope: !261, inlinedAt: !361)
!366 = !MDLocation(line: 211, column: 9, scope: !264, inlinedAt: !361)
!367 = !MDLocation(line: 211, column: 9, scope: !71, inlinedAt: !361)
!368 = !MDLocation(line: 211, column: 15, scope: !264, inlinedAt: !361)
!369 = !MDLocation(line: 220, column: 10, scope: !77, inlinedAt: !358)
!370 = !MDLocation(line: 222, column: 5, scope: !77, inlinedAt: !358)
!371 = !MDLocation(line: 223, column: 10, scope: !283, inlinedAt: !358)
!372 = !MDLocation(line: 223, column: 21, scope: !283, inlinedAt: !358)
!373 = !MDLocation(line: 223, column: 34, scope: !283, inlinedAt: !358)
!374 = !MDLocation(line: 267, column: 14, scope: !375)
!375 = !{!"0xb\00266\005\0019", !1, !350}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!376 = !MDLocation(line: 267, column: 9, scope: !375)
!377 = !{!"0x101\00id\0016777431\000", !77, !34, !9, !378} ; [ DW_TAG_arg_variable ] [id] [line 215]
!378 = !MDLocation(line: 268, column: 18, scope: !375)
!379 = !MDLocation(line: 215, column: 26, scope: !77, inlinedAt: !378)
!380 = !{!"0x101\00id\0016777421\000", !71, !34, !9, !381} ; [ DW_TAG_arg_variable ] [id] [line 205]
!381 = !MDLocation(line: 219, column: 9, scope: !77, inlinedAt: !378)
!382 = !MDLocation(line: 205, column: 26, scope: !71, inlinedAt: !381)
!383 = !{!"0x100\00t\00207\000", !71, !34, !4, !381} ; [ DW_TAG_auto_variable ] [t] [line 207]
!384 = !MDLocation(line: 207, column: 18, scope: !71, inlinedAt: !381)
!385 = !MDLocation(line: 210, column: 9, scope: !261, inlinedAt: !381)
!386 = !MDLocation(line: 211, column: 9, scope: !264, inlinedAt: !381)
!387 = !MDLocation(line: 211, column: 9, scope: !71, inlinedAt: !381)
!388 = !MDLocation(line: 211, column: 15, scope: !264, inlinedAt: !381)
!389 = !MDLocation(line: 220, column: 10, scope: !77, inlinedAt: !378)
!390 = !MDLocation(line: 222, column: 5, scope: !77, inlinedAt: !378)
!391 = !MDLocation(line: 223, column: 10, scope: !283, inlinedAt: !378)
!392 = !MDLocation(line: 223, column: 21, scope: !283, inlinedAt: !378)
!393 = !MDLocation(line: 223, column: 34, scope: !283, inlinedAt: !378)
!394 = !MDLocation(line: 270, column: 1, scope: !85)
!395 = !MDLocation(line: 272, column: 36, scope: !88)
!396 = !MDLocation(line: 274, column: 10, scope: !93)
!397 = !MDLocation(line: 274, column: 10, scope: !88)
!398 = !MDLocation(line: 194, column: 5, scope: !67, inlinedAt: !399)
!399 = !MDLocation(line: 274, column: 28, scope: !400)
!400 = !{!"0xb\001", !1, !93}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!401 = !MDLocation(line: 274, column: 19, scope: !93)
!402 = !MDLocation(line: 279, column: 40, scope: !92)
!403 = !MDLocation(line: 279, column: 14, scope: !92)
!404 = !MDLocation(line: 279, column: 9, scope: !92)
!405 = !MDLocation(line: 280, column: 21, scope: !92)
!406 = !MDLocation(line: 280, column: 9, scope: !92)
!407 = !MDLocation(line: 282, column: 9, scope: !92)
!408 = !MDLocation(line: 277, column: 13, scope: !92)
!409 = !MDLocation(line: 285, column: 13, scope: !410)
!410 = !{!"0xb\00284\009\0024", !1, !411}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!411 = !{!"0xb\00283\009\0023", !1, !412}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!412 = !{!"0xb\00283\009\0022", !1, !92}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!413 = !MDLocation(line: 286, column: 18, scope: !414)
!414 = !{!"0xb\00286\0018\0025", !1, !410}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!415 = !MDLocation(line: 286, column: 18, scope: !410)
!416 = !MDLocation(line: 286, column: 28, scope: !417)
!417 = !{!"0xb\001", !1, !414}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!418 = !MDLocation(line: 287, column: 30, scope: !410)
!419 = !{!152, !152, i64 0}
!420 = !MDLocation(line: 287, column: 13, scope: !410)
!421 = !{!"0x101\00pkt\0016777445\000", !81, !34, !12, !422} ; [ DW_TAG_arg_variable ] [pkt] [line 229]
!422 = !MDLocation(line: 289, column: 18, scope: !92)
!423 = !MDLocation(line: 229, column: 34, scope: !81, inlinedAt: !422)
!424 = !{!"0x101\00id\0016777421\000", !71, !34, !9, !425} ; [ DW_TAG_arg_variable ] [id] [line 205]
!425 = !MDLocation(line: 233, column: 9, scope: !81, inlinedAt: !422)
!426 = !MDLocation(line: 205, column: 26, scope: !71, inlinedAt: !425)
!427 = !{!"0x100\00t\00207\000", !71, !34, !4, !425} ; [ DW_TAG_auto_variable ] [t] [line 207]
!428 = !MDLocation(line: 207, column: 18, scope: !71, inlinedAt: !425)
!429 = !MDLocation(line: 209, column: 9, scope: !71, inlinedAt: !425)
!430 = !MDLocation(line: 209, column: 18, scope: !260, inlinedAt: !425)
!431 = !MDLocation(line: 210, column: 9, scope: !261, inlinedAt: !425)
!432 = !MDLocation(line: 211, column: 9, scope: !264, inlinedAt: !425)
!433 = !MDLocation(line: 211, column: 9, scope: !71, inlinedAt: !425)
!434 = !MDLocation(line: 211, column: 15, scope: !264, inlinedAt: !425)
!435 = !MDLocation(line: 234, column: 9, scope: !81, inlinedAt: !422)
!436 = !MDLocation(line: 236, column: 5, scope: !81, inlinedAt: !422)
!437 = !MDLocation(line: 238, column: 5, scope: !81, inlinedAt: !422)
!438 = !MDLocation(line: 239, column: 17, scope: !81, inlinedAt: !422)
!439 = !MDLocation(line: 239, column: 5, scope: !81, inlinedAt: !422)
!440 = !MDLocation(line: 241, column: 8, scope: !306, inlinedAt: !422)
!441 = !MDLocation(line: 241, column: 8, scope: !81, inlinedAt: !422)
!442 = !MDLocation(line: 243, column: 9, scope: !309, inlinedAt: !422)
!443 = !MDLocation(line: 244, column: 9, scope: !309, inlinedAt: !422)
!444 = !MDLocation(line: 245, column: 13, scope: !312, inlinedAt: !422)
!445 = !MDLocation(line: 245, column: 24, scope: !312, inlinedAt: !422)
!446 = !MDLocation(line: 245, column: 13, scope: !309, inlinedAt: !422)
!447 = !MDLocation(line: 249, column: 21, scope: !316, inlinedAt: !422)
!448 = !{!"0x101\00pkt\0016777557\000", !107, !34, !12, !449} ; [ DW_TAG_arg_variable ] [pkt] [line 341]
!449 = !MDLocation(line: 249, column: 9, scope: !316, inlinedAt: !422)
!450 = !MDLocation(line: 341, column: 28, scope: !107, inlinedAt: !449)
!451 = !{!"0x101\00ptr\0033554773\000", !107, !34, !12, !449} ; [ DW_TAG_arg_variable ] [ptr] [line 341]
!452 = !MDLocation(line: 341, column: 48, scope: !107, inlinedAt: !449)
!453 = !MDLocation(line: 343, column: 5, scope: !107, inlinedAt: !449)
!454 = !MDLocation(line: 345, column: 5, scope: !107, inlinedAt: !449)
!455 = !MDLocation(line: 345, column: 13, scope: !325, inlinedAt: !449)
!456 = !MDLocation(line: 347, column: 5, scope: !107, inlinedAt: !449)
!457 = !MDLocation(line: 252, column: 13, scope: !81, inlinedAt: !422)
!458 = !MDLocation(line: 252, column: 5, scope: !81, inlinedAt: !422)
!459 = !MDLocation(line: 291, column: 1, scope: !88)
!460 = !MDLocation(line: 293, column: 39, scope: !94)
!461 = !MDLocation(line: 295, column: 9, scope: !462)
!462 = !{!"0xb\00295\009\0026", !1, !94}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!463 = !MDLocation(line: 295, column: 9, scope: !94)
!464 = !MDLocation(line: 296, column: 41, scope: !462)
!465 = !MDLocation(line: 296, column: 23, scope: !462)
!466 = !{!"0x101\00pkt\0016777557\000", !107, !34, !12, !467} ; [ DW_TAG_arg_variable ] [pkt] [line 341]
!467 = !MDLocation(line: 295, column: 17, scope: !462)
!468 = !MDLocation(line: 341, column: 28, scope: !107, inlinedAt: !467)
!469 = !{!"0x101\00ptr\0033554773\000", !107, !34, !12, !467} ; [ DW_TAG_arg_variable ] [ptr] [line 341]
!470 = !MDLocation(line: 341, column: 48, scope: !107, inlinedAt: !467)
!471 = !MDLocation(line: 343, column: 5, scope: !107, inlinedAt: !467)
!472 = !MDLocation(line: 345, column: 5, scope: !107, inlinedAt: !467)
!473 = !MDLocation(line: 345, column: 13, scope: !325, inlinedAt: !467)
!474 = !MDLocation(line: 347, column: 5, scope: !107, inlinedAt: !467)
!475 = !MDLocation(line: 298, column: 9, scope: !99)
!476 = !MDLocation(line: 298, column: 9, scope: !94)
!477 = !MDLocation(line: 301, column: 34, scope: !98)
!478 = !MDLocation(line: 301, column: 24, scope: !98)
!479 = !MDLocation(line: 302, column: 17, scope: !98)
!480 = !MDLocation(line: 300, column: 13, scope: !98)
!481 = !MDLocation(line: 304, column: 14, scope: !482)
!482 = !{!"0xb\00304\0014\0029", !1, !98}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!483 = !MDLocation(line: 304, column: 14, scope: !98)
!484 = !MDLocation(line: 306, column: 24, scope: !485)
!485 = !{!"0xb\00305\009\0030", !1, !482}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!486 = !MDLocation(line: 306, column: 17, scope: !485)
!487 = !MDLocation(line: 306, column: 12, scope: !485)
!488 = !{!"0x101\00pkt\0016777445\000", !81, !34, !12, !489} ; [ DW_TAG_arg_variable ] [pkt] [line 229]
!489 = !MDLocation(line: 307, column: 21, scope: !485)
!490 = !MDLocation(line: 229, column: 34, scope: !81, inlinedAt: !489)
!491 = !MDLocation(line: 233, column: 17, scope: !81, inlinedAt: !489)
!492 = !{!"0x101\00id\0016777421\000", !71, !34, !9, !493} ; [ DW_TAG_arg_variable ] [id] [line 205]
!493 = !MDLocation(line: 233, column: 9, scope: !81, inlinedAt: !489)
!494 = !MDLocation(line: 205, column: 26, scope: !71, inlinedAt: !493)
!495 = !{!"0x100\00t\00207\000", !71, !34, !4, !493} ; [ DW_TAG_auto_variable ] [t] [line 207]
!496 = !MDLocation(line: 207, column: 18, scope: !71, inlinedAt: !493)
!497 = !MDLocation(line: 209, column: 9, scope: !71, inlinedAt: !493)
!498 = !MDLocation(line: 209, column: 18, scope: !260, inlinedAt: !493)
!499 = !MDLocation(line: 210, column: 9, scope: !261, inlinedAt: !493)
!500 = !MDLocation(line: 211, column: 9, scope: !264, inlinedAt: !493)
!501 = !MDLocation(line: 211, column: 9, scope: !71, inlinedAt: !493)
!502 = !MDLocation(line: 211, column: 15, scope: !264, inlinedAt: !493)
!503 = !MDLocation(line: 234, column: 9, scope: !81, inlinedAt: !489)
!504 = !MDLocation(line: 236, column: 5, scope: !81, inlinedAt: !489)
!505 = !MDLocation(line: 238, column: 5, scope: !81, inlinedAt: !489)
!506 = !MDLocation(line: 239, column: 17, scope: !81, inlinedAt: !489)
!507 = !MDLocation(line: 239, column: 5, scope: !81, inlinedAt: !489)
!508 = !MDLocation(line: 241, column: 8, scope: !306, inlinedAt: !489)
!509 = !MDLocation(line: 241, column: 8, scope: !81, inlinedAt: !489)
!510 = !MDLocation(line: 243, column: 9, scope: !309, inlinedAt: !489)
!511 = !MDLocation(line: 244, column: 9, scope: !309, inlinedAt: !489)
!512 = !MDLocation(line: 245, column: 13, scope: !312, inlinedAt: !489)
!513 = !MDLocation(line: 245, column: 24, scope: !312, inlinedAt: !489)
!514 = !MDLocation(line: 245, column: 13, scope: !309, inlinedAt: !489)
!515 = !MDLocation(line: 249, column: 21, scope: !316, inlinedAt: !489)
!516 = !{!"0x101\00pkt\0016777557\000", !107, !34, !12, !517} ; [ DW_TAG_arg_variable ] [pkt] [line 341]
!517 = !MDLocation(line: 249, column: 9, scope: !316, inlinedAt: !489)
!518 = !MDLocation(line: 341, column: 28, scope: !107, inlinedAt: !517)
!519 = !{!"0x101\00ptr\0033554773\000", !107, !34, !12, !517} ; [ DW_TAG_arg_variable ] [ptr] [line 341]
!520 = !MDLocation(line: 341, column: 48, scope: !107, inlinedAt: !517)
!521 = !MDLocation(line: 343, column: 5, scope: !107, inlinedAt: !517)
!522 = !MDLocation(line: 345, column: 5, scope: !107, inlinedAt: !517)
!523 = !MDLocation(line: 345, column: 13, scope: !325, inlinedAt: !517)
!524 = !MDLocation(line: 347, column: 5, scope: !107, inlinedAt: !517)
!525 = !MDLocation(line: 252, column: 13, scope: !81, inlinedAt: !489)
!526 = !MDLocation(line: 252, column: 5, scope: !81, inlinedAt: !489)
!527 = !MDLocation(line: 310, column: 14, scope: !103)
!528 = !MDLocation(line: 310, column: 14, scope: !98)
!529 = !MDLocation(line: 314, column: 22, scope: !102)
!530 = !MDLocation(line: 312, column: 28, scope: !102)
!531 = !MDLocation(line: 315, column: 25, scope: !102)
!532 = !MDLocation(line: 315, column: 18, scope: !102)
!533 = !MDLocation(line: 315, column: 13, scope: !102)
!534 = !MDLocation(line: 316, column: 28, scope: !102)
!535 = !MDLocation(line: 316, column: 13, scope: !102)
!536 = !MDLocation(line: 317, column: 29, scope: !102)
!537 = !MDLocation(line: 317, column: 13, scope: !102)
!538 = !{!"0x101\00pkt\0016777445\000", !81, !34, !12, !539} ; [ DW_TAG_arg_variable ] [pkt] [line 229]
!539 = !MDLocation(line: 318, column: 21, scope: !102)
!540 = !MDLocation(line: 229, column: 34, scope: !81, inlinedAt: !539)
!541 = !MDLocation(line: 233, column: 17, scope: !81, inlinedAt: !539)
!542 = !{!"0x101\00id\0016777421\000", !71, !34, !9, !543} ; [ DW_TAG_arg_variable ] [id] [line 205]
!543 = !MDLocation(line: 233, column: 9, scope: !81, inlinedAt: !539)
!544 = !MDLocation(line: 205, column: 26, scope: !71, inlinedAt: !543)
!545 = !{!"0x100\00t\00207\000", !71, !34, !4, !543} ; [ DW_TAG_auto_variable ] [t] [line 207]
!546 = !MDLocation(line: 207, column: 18, scope: !71, inlinedAt: !543)
!547 = !MDLocation(line: 209, column: 9, scope: !71, inlinedAt: !543)
!548 = !MDLocation(line: 209, column: 18, scope: !260, inlinedAt: !543)
!549 = !MDLocation(line: 210, column: 9, scope: !261, inlinedAt: !543)
!550 = !MDLocation(line: 211, column: 9, scope: !264, inlinedAt: !543)
!551 = !MDLocation(line: 211, column: 9, scope: !71, inlinedAt: !543)
!552 = !MDLocation(line: 211, column: 15, scope: !264, inlinedAt: !543)
!553 = !MDLocation(line: 234, column: 9, scope: !81, inlinedAt: !539)
!554 = !MDLocation(line: 236, column: 5, scope: !81, inlinedAt: !539)
!555 = !MDLocation(line: 238, column: 5, scope: !81, inlinedAt: !539)
!556 = !MDLocation(line: 239, column: 17, scope: !81, inlinedAt: !539)
!557 = !MDLocation(line: 239, column: 5, scope: !81, inlinedAt: !539)
!558 = !MDLocation(line: 241, column: 8, scope: !306, inlinedAt: !539)
!559 = !MDLocation(line: 241, column: 8, scope: !81, inlinedAt: !539)
!560 = !MDLocation(line: 243, column: 9, scope: !309, inlinedAt: !539)
!561 = !MDLocation(line: 244, column: 9, scope: !309, inlinedAt: !539)
!562 = !MDLocation(line: 245, column: 13, scope: !312, inlinedAt: !539)
!563 = !MDLocation(line: 245, column: 24, scope: !312, inlinedAt: !539)
!564 = !MDLocation(line: 245, column: 13, scope: !309, inlinedAt: !539)
!565 = !MDLocation(line: 249, column: 21, scope: !316, inlinedAt: !539)
!566 = !{!"0x101\00pkt\0016777557\000", !107, !34, !12, !567} ; [ DW_TAG_arg_variable ] [pkt] [line 341]
!567 = !MDLocation(line: 249, column: 9, scope: !316, inlinedAt: !539)
!568 = !MDLocation(line: 341, column: 28, scope: !107, inlinedAt: !567)
!569 = !{!"0x101\00ptr\0033554773\000", !107, !34, !12, !567} ; [ DW_TAG_arg_variable ] [ptr] [line 341]
!570 = !MDLocation(line: 341, column: 48, scope: !107, inlinedAt: !567)
!571 = !MDLocation(line: 343, column: 5, scope: !107, inlinedAt: !567)
!572 = !MDLocation(line: 345, column: 5, scope: !107, inlinedAt: !567)
!573 = !MDLocation(line: 345, column: 13, scope: !325, inlinedAt: !567)
!574 = !MDLocation(line: 347, column: 5, scope: !107, inlinedAt: !567)
!575 = !MDLocation(line: 252, column: 13, scope: !81, inlinedAt: !539)
!576 = !MDLocation(line: 252, column: 5, scope: !81, inlinedAt: !539)
!577 = !MDLocation(line: 194, column: 5, scope: !67, inlinedAt: !578)
!578 = !MDLocation(line: 321, column: 14, scope: !94)
!579 = !MDLocation(line: 321, column: 5, scope: !94)
!580 = !MDLocation(line: 322, column: 1, scope: !94)
!581 = !MDLocation(line: 324, column: 35, scope: !104)
!582 = !MDLocation(line: 326, column: 10, scope: !583)
!583 = !{!"0xb\00326\0010\0033", !1, !104}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!584 = !MDLocation(line: 326, column: 10, scope: !104)
!585 = !MDLocation(line: 328, column: 14, scope: !586)
!586 = !{!"0xb\00328\0014\0035", !1, !587}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!587 = !{!"0xb\00327\005\0034", !1, !583}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!588 = !MDLocation(line: 328, column: 14, scope: !587)
!589 = !MDLocation(line: 194, column: 5, scope: !67, inlinedAt: !590)
!590 = !MDLocation(line: 328, column: 31, scope: !591)
!591 = !{!"0xb\001", !1, !586}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!592 = !MDLocation(line: 328, column: 22, scope: !586)
!593 = !MDLocation(line: 329, column: 15, scope: !587)
!594 = !MDLocation(line: 330, column: 9, scope: !587)
!595 = !{!"0x101\00pkt\0016777445\000", !81, !34, !12, !596} ; [ DW_TAG_arg_variable ] [pkt] [line 229]
!596 = !MDLocation(line: 331, column: 18, scope: !587)
!597 = !MDLocation(line: 229, column: 34, scope: !81, inlinedAt: !596)
!598 = !MDLocation(line: 233, column: 17, scope: !81, inlinedAt: !596)
!599 = !{!"0x101\00id\0016777421\000", !71, !34, !9, !600} ; [ DW_TAG_arg_variable ] [id] [line 205]
!600 = !MDLocation(line: 233, column: 9, scope: !81, inlinedAt: !596)
!601 = !MDLocation(line: 205, column: 26, scope: !71, inlinedAt: !600)
!602 = !{!"0x100\00t\00207\000", !71, !34, !4, !600} ; [ DW_TAG_auto_variable ] [t] [line 207]
!603 = !MDLocation(line: 207, column: 18, scope: !71, inlinedAt: !600)
!604 = !MDLocation(line: 209, column: 9, scope: !71, inlinedAt: !600)
!605 = !MDLocation(line: 209, column: 18, scope: !260, inlinedAt: !600)
!606 = !MDLocation(line: 210, column: 9, scope: !261, inlinedAt: !600)
!607 = !MDLocation(line: 211, column: 9, scope: !264, inlinedAt: !600)
!608 = !MDLocation(line: 211, column: 9, scope: !71, inlinedAt: !600)
!609 = !MDLocation(line: 211, column: 15, scope: !264, inlinedAt: !600)
!610 = !MDLocation(line: 234, column: 9, scope: !81, inlinedAt: !596)
!611 = !MDLocation(line: 236, column: 5, scope: !81, inlinedAt: !596)
!612 = !MDLocation(line: 238, column: 5, scope: !81, inlinedAt: !596)
!613 = !MDLocation(line: 239, column: 17, scope: !81, inlinedAt: !596)
!614 = !MDLocation(line: 239, column: 5, scope: !81, inlinedAt: !596)
!615 = !MDLocation(line: 241, column: 8, scope: !306, inlinedAt: !596)
!616 = !MDLocation(line: 241, column: 8, scope: !81, inlinedAt: !596)
!617 = !MDLocation(line: 243, column: 9, scope: !309, inlinedAt: !596)
!618 = !MDLocation(line: 244, column: 9, scope: !309, inlinedAt: !596)
!619 = !MDLocation(line: 245, column: 13, scope: !312, inlinedAt: !596)
!620 = !MDLocation(line: 245, column: 24, scope: !312, inlinedAt: !596)
!621 = !MDLocation(line: 245, column: 13, scope: !309, inlinedAt: !596)
!622 = !MDLocation(line: 249, column: 21, scope: !316, inlinedAt: !596)
!623 = !{!"0x101\00pkt\0016777557\000", !107, !34, !12, !624} ; [ DW_TAG_arg_variable ] [pkt] [line 341]
!624 = !MDLocation(line: 249, column: 9, scope: !316, inlinedAt: !596)
!625 = !MDLocation(line: 341, column: 28, scope: !107, inlinedAt: !624)
!626 = !{!"0x101\00ptr\0033554773\000", !107, !34, !12, !624} ; [ DW_TAG_arg_variable ] [ptr] [line 341]
!627 = !MDLocation(line: 341, column: 48, scope: !107, inlinedAt: !624)
!628 = !MDLocation(line: 343, column: 5, scope: !107, inlinedAt: !624)
!629 = !MDLocation(line: 345, column: 5, scope: !107, inlinedAt: !624)
!630 = !MDLocation(line: 345, column: 13, scope: !325, inlinedAt: !624)
!631 = !MDLocation(line: 347, column: 5, scope: !107, inlinedAt: !624)
!632 = !MDLocation(line: 252, column: 13, scope: !81, inlinedAt: !596)
!633 = !MDLocation(line: 252, column: 5, scope: !81, inlinedAt: !596)
!634 = !MDLocation(line: 335, column: 14, scope: !635)
!635 = !{!"0xb\00334\005\0036", !1, !583}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!636 = !MDLocation(line: 335, column: 9, scope: !635)
!637 = !MDLocation(line: 336, column: 13, scope: !638)
!638 = !{!"0xb\00336\0013\0037", !1, !635}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!639 = !MDLocation(line: 336, column: 13, scope: !635)
!640 = !MDLocation(line: 336, column: 34, scope: !641)
!641 = !{!"0xb\001", !1, !638}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!642 = !MDLocation(line: 140, column: 9, scope: !198, inlinedAt: !643)
!643 = !MDLocation(line: 336, column: 28, scope: !638)
!644 = !MDLocation(line: 140, column: 9, scope: !55, inlinedAt: !643)
!645 = !MDLocation(line: 142, column: 9, scope: !202, inlinedAt: !643)
!646 = !MDLocation(line: 143, column: 9, scope: !202, inlinedAt: !643)
!647 = !MDLocation(line: 144, column: 5, scope: !202, inlinedAt: !643)
!648 = !MDLocation(line: 146, column: 18, scope: !55, inlinedAt: !643)
!649 = !MDLocation(line: 146, column: 5, scope: !55, inlinedAt: !643)
!650 = !MDLocation(line: 200, column: 5, scope: !70, inlinedAt: !651)
!651 = !MDLocation(line: 337, column: 18, scope: !635)
!652 = !MDLocation(line: 201, column: 5, scope: !70, inlinedAt: !651)
!653 = !MDLocation(line: 202, column: 13, scope: !70, inlinedAt: !651)
!654 = !MDLocation(line: 337, column: 9, scope: !635)
!655 = !MDLocation(line: 339, column: 1, scope: !104)
!656 = !MDLocation(line: 352, column: 20, scope: !113)
!657 = !MDLocation(line: 355, column: 5, scope: !113)
!658 = !{!"0x101\00id\0016777316\000", !33, !34, !9, !659} ; [ DW_TAG_arg_variable ] [id] [line 100]
!659 = !MDLocation(line: 357, column: 5, scope: !113)
!660 = !MDLocation(line: 100, column: 21, scope: !33, inlinedAt: !659)
!661 = !{!"0x101\00pri\0033554533\000", !33, !34, !9, !659} ; [ DW_TAG_arg_variable ] [pri] [line 101]
!662 = !MDLocation(line: 101, column: 21, scope: !33, inlinedAt: !659)
!663 = !{!"0x101\00wkq\0050331750\000", !33, !34, !12, !659} ; [ DW_TAG_arg_variable ] [wkq] [line 102]
!664 = !MDLocation(line: 102, column: 32, scope: !33, inlinedAt: !659)
!665 = !{!"0x101\00state\0067108967\000", !33, !34, !9, !659} ; [ DW_TAG_arg_variable ] [state] [line 103]
!666 = !MDLocation(line: 103, column: 21, scope: !33, inlinedAt: !659)
!667 = !{!"0x101\00fn\0083886184\000", !33, !34, !26, !659} ; [ DW_TAG_arg_variable ] [fn] [line 104]
!668 = !MDLocation(line: 104, column: 32, scope: !33, inlinedAt: !659)
!669 = !{!"0x101\00v1\00100663401\000", !33, !34, !30, !659} ; [ DW_TAG_arg_variable ] [v1] [line 105]
!670 = !MDLocation(line: 105, column: 22, scope: !33, inlinedAt: !659)
!671 = !{!"0x101\00v2\00117440618\000", !33, !34, !30, !659} ; [ DW_TAG_arg_variable ] [v2] [line 106]
!672 = !MDLocation(line: 106, column: 22, scope: !33, inlinedAt: !659)
!673 = !MDLocation(line: 108, column: 37, scope: !33, inlinedAt: !659)
!674 = !MDLocation(line: 110, column: 5, scope: !33, inlinedAt: !659)
!675 = !MDLocation(line: 111, column: 19, scope: !33, inlinedAt: !659)
!676 = !MDLocation(line: 111, column: 5, scope: !33, inlinedAt: !659)
!677 = !MDLocation(line: 112, column: 5, scope: !33, inlinedAt: !659)
!678 = !MDLocation(line: 113, column: 5, scope: !33, inlinedAt: !659)
!679 = !MDLocation(line: 116, column: 5, scope: !33, inlinedAt: !659)
!680 = !MDLocation(line: 114, column: 5, scope: !33, inlinedAt: !659)
!681 = !MDLocation(line: 117, column: 5, scope: !33, inlinedAt: !659)
!682 = !MDLocation(line: 118, column: 5, scope: !33, inlinedAt: !659)
!683 = !{!"0x101\00link\0016777338\000", !46, !34, !12, !684} ; [ DW_TAG_arg_variable ] [link] [line 122]
!684 = !MDLocation(line: 359, column: 11, scope: !113)
!685 = !MDLocation(line: 122, column: 35, scope: !46, inlinedAt: !684)
!686 = !{!"0x101\00id\0033554554\000", !46, !34, !9, !684} ; [ DW_TAG_arg_variable ] [id] [line 122]
!687 = !MDLocation(line: 122, column: 45, scope: !46, inlinedAt: !684)
!688 = !{!"0x101\00kind\0050331770\000", !46, !34, !9, !684} ; [ DW_TAG_arg_variable ] [kind] [line 122]
!689 = !MDLocation(line: 122, column: 53, scope: !46, inlinedAt: !684)
!690 = !MDLocation(line: 125, column: 41, scope: !46, inlinedAt: !684)
!691 = !{!"0x100\00i\00124\000", !46, !34, !9, !684} ; [ DW_TAG_auto_variable ] [i] [line 124]
!692 = !MDLocation(line: 124, column: 9, scope: !46, inlinedAt: !684)
!693 = !MDLocation(line: 128, column: 9, scope: !183, inlinedAt: !684)
!694 = !MDLocation(line: 130, column: 5, scope: !46, inlinedAt: !684)
!695 = !MDLocation(line: 131, column: 5, scope: !46, inlinedAt: !684)
!696 = !MDLocation(line: 132, column: 5, scope: !46, inlinedAt: !684)
!697 = !MDLocation(line: 133, column: 5, scope: !46, inlinedAt: !684)
!698 = !{!"0x101\00id\0033554554\000", !46, !34, !9, !699} ; [ DW_TAG_arg_variable ] [id] [line 122]
!699 = !MDLocation(line: 360, column: 11, scope: !113)
!700 = !MDLocation(line: 122, column: 45, scope: !46, inlinedAt: !699)
!701 = !{!"0x101\00kind\0050331770\000", !46, !34, !9, !699} ; [ DW_TAG_arg_variable ] [kind] [line 122]
!702 = !MDLocation(line: 122, column: 53, scope: !46, inlinedAt: !699)
!703 = !MDLocation(line: 125, column: 41, scope: !46, inlinedAt: !699)
!704 = !{!"0x100\00i\00124\000", !46, !34, !9, !699} ; [ DW_TAG_auto_variable ] [i] [line 124]
!705 = !MDLocation(line: 124, column: 9, scope: !46, inlinedAt: !699)
!706 = !MDLocation(line: 128, column: 9, scope: !183, inlinedAt: !699)
!707 = !MDLocation(line: 130, column: 5, scope: !46, inlinedAt: !699)
!708 = !MDLocation(line: 131, column: 5, scope: !46, inlinedAt: !699)
!709 = !MDLocation(line: 132, column: 5, scope: !46, inlinedAt: !699)
!710 = !MDLocation(line: 133, column: 5, scope: !46, inlinedAt: !699)
!711 = !{!"0x101\00id\0016777316\000", !33, !34, !9, !712} ; [ DW_TAG_arg_variable ] [id] [line 100]
!712 = !MDLocation(line: 362, column: 5, scope: !113)
!713 = !MDLocation(line: 100, column: 21, scope: !33, inlinedAt: !712)
!714 = !{!"0x101\00pri\0033554533\000", !33, !34, !9, !712} ; [ DW_TAG_arg_variable ] [pri] [line 101]
!715 = !MDLocation(line: 101, column: 21, scope: !33, inlinedAt: !712)
!716 = !{!"0x101\00state\0067108967\000", !33, !34, !9, !712} ; [ DW_TAG_arg_variable ] [state] [line 103]
!717 = !MDLocation(line: 103, column: 21, scope: !33, inlinedAt: !712)
!718 = !{!"0x101\00fn\0083886184\000", !33, !34, !26, !712} ; [ DW_TAG_arg_variable ] [fn] [line 104]
!719 = !MDLocation(line: 104, column: 32, scope: !33, inlinedAt: !712)
!720 = !{!"0x101\00v1\00100663401\000", !33, !34, !30, !712} ; [ DW_TAG_arg_variable ] [v1] [line 105]
!721 = !MDLocation(line: 105, column: 22, scope: !33, inlinedAt: !712)
!722 = !{!"0x101\00v2\00117440618\000", !33, !34, !30, !712} ; [ DW_TAG_arg_variable ] [v2] [line 106]
!723 = !MDLocation(line: 106, column: 22, scope: !33, inlinedAt: !712)
!724 = !MDLocation(line: 108, column: 37, scope: !33, inlinedAt: !712)
!725 = !MDLocation(line: 110, column: 5, scope: !33, inlinedAt: !712)
!726 = !MDLocation(line: 111, column: 5, scope: !33, inlinedAt: !712)
!727 = !MDLocation(line: 112, column: 5, scope: !33, inlinedAt: !712)
!728 = !MDLocation(line: 113, column: 5, scope: !33, inlinedAt: !712)
!729 = !MDLocation(line: 114, column: 5, scope: !33, inlinedAt: !712)
!730 = !MDLocation(line: 115, column: 5, scope: !33, inlinedAt: !712)
!731 = !MDLocation(line: 116, column: 5, scope: !33, inlinedAt: !712)
!732 = !MDLocation(line: 117, column: 5, scope: !33, inlinedAt: !712)
!733 = !MDLocation(line: 118, column: 5, scope: !33, inlinedAt: !712)
!734 = !{!"0x101\00link\0016777338\000", !46, !34, !12, !735} ; [ DW_TAG_arg_variable ] [link] [line 122]
!735 = !MDLocation(line: 364, column: 11, scope: !113)
!736 = !MDLocation(line: 122, column: 35, scope: !46, inlinedAt: !735)
!737 = !{!"0x101\00id\0033554554\000", !46, !34, !9, !735} ; [ DW_TAG_arg_variable ] [id] [line 122]
!738 = !MDLocation(line: 122, column: 45, scope: !46, inlinedAt: !735)
!739 = !{!"0x101\00kind\0050331770\000", !46, !34, !9, !735} ; [ DW_TAG_arg_variable ] [kind] [line 122]
!740 = !MDLocation(line: 122, column: 53, scope: !46, inlinedAt: !735)
!741 = !MDLocation(line: 125, column: 41, scope: !46, inlinedAt: !735)
!742 = !{!"0x100\00i\00124\000", !46, !34, !9, !735} ; [ DW_TAG_auto_variable ] [i] [line 124]
!743 = !MDLocation(line: 124, column: 9, scope: !46, inlinedAt: !735)
!744 = !MDLocation(line: 128, column: 9, scope: !183, inlinedAt: !735)
!745 = !MDLocation(line: 130, column: 5, scope: !46, inlinedAt: !735)
!746 = !MDLocation(line: 131, column: 5, scope: !46, inlinedAt: !735)
!747 = !MDLocation(line: 132, column: 5, scope: !46, inlinedAt: !735)
!748 = !MDLocation(line: 133, column: 5, scope: !46, inlinedAt: !735)
!749 = !{!"0x101\00id\0033554554\000", !46, !34, !9, !750} ; [ DW_TAG_arg_variable ] [id] [line 122]
!750 = !MDLocation(line: 365, column: 11, scope: !113)
!751 = !MDLocation(line: 122, column: 45, scope: !46, inlinedAt: !750)
!752 = !{!"0x101\00kind\0050331770\000", !46, !34, !9, !750} ; [ DW_TAG_arg_variable ] [kind] [line 122]
!753 = !MDLocation(line: 122, column: 53, scope: !46, inlinedAt: !750)
!754 = !MDLocation(line: 125, column: 41, scope: !46, inlinedAt: !750)
!755 = !{!"0x100\00i\00124\000", !46, !34, !9, !750} ; [ DW_TAG_auto_variable ] [i] [line 124]
!756 = !MDLocation(line: 124, column: 9, scope: !46, inlinedAt: !750)
!757 = !MDLocation(line: 128, column: 9, scope: !183, inlinedAt: !750)
!758 = !MDLocation(line: 130, column: 5, scope: !46, inlinedAt: !750)
!759 = !MDLocation(line: 131, column: 5, scope: !46, inlinedAt: !750)
!760 = !MDLocation(line: 132, column: 5, scope: !46, inlinedAt: !750)
!761 = !MDLocation(line: 133, column: 5, scope: !46, inlinedAt: !750)
!762 = !{!"0x101\00id\0033554554\000", !46, !34, !9, !763} ; [ DW_TAG_arg_variable ] [id] [line 122]
!763 = !MDLocation(line: 366, column: 11, scope: !113)
!764 = !MDLocation(line: 122, column: 45, scope: !46, inlinedAt: !763)
!765 = !{!"0x101\00kind\0050331770\000", !46, !34, !9, !763} ; [ DW_TAG_arg_variable ] [kind] [line 122]
!766 = !MDLocation(line: 122, column: 53, scope: !46, inlinedAt: !763)
!767 = !MDLocation(line: 125, column: 41, scope: !46, inlinedAt: !763)
!768 = !{!"0x100\00i\00124\000", !46, !34, !9, !763} ; [ DW_TAG_auto_variable ] [i] [line 124]
!769 = !MDLocation(line: 124, column: 9, scope: !46, inlinedAt: !763)
!770 = !MDLocation(line: 128, column: 9, scope: !183, inlinedAt: !763)
!771 = !MDLocation(line: 130, column: 5, scope: !46, inlinedAt: !763)
!772 = !MDLocation(line: 131, column: 5, scope: !46, inlinedAt: !763)
!773 = !MDLocation(line: 132, column: 5, scope: !46, inlinedAt: !763)
!774 = !MDLocation(line: 133, column: 5, scope: !46, inlinedAt: !763)
!775 = !{!"0x101\00id\0016777316\000", !33, !34, !9, !776} ; [ DW_TAG_arg_variable ] [id] [line 100]
!776 = !MDLocation(line: 368, column: 5, scope: !113)
!777 = !MDLocation(line: 100, column: 21, scope: !33, inlinedAt: !776)
!778 = !{!"0x101\00pri\0033554533\000", !33, !34, !9, !776} ; [ DW_TAG_arg_variable ] [pri] [line 101]
!779 = !MDLocation(line: 101, column: 21, scope: !33, inlinedAt: !776)
!780 = !{!"0x101\00state\0067108967\000", !33, !34, !9, !776} ; [ DW_TAG_arg_variable ] [state] [line 103]
!781 = !MDLocation(line: 103, column: 21, scope: !33, inlinedAt: !776)
!782 = !{!"0x101\00fn\0083886184\000", !33, !34, !26, !776} ; [ DW_TAG_arg_variable ] [fn] [line 104]
!783 = !MDLocation(line: 104, column: 32, scope: !33, inlinedAt: !776)
!784 = !{!"0x101\00v1\00100663401\000", !33, !34, !30, !776} ; [ DW_TAG_arg_variable ] [v1] [line 105]
!785 = !MDLocation(line: 105, column: 22, scope: !33, inlinedAt: !776)
!786 = !{!"0x101\00v2\00117440618\000", !33, !34, !30, !776} ; [ DW_TAG_arg_variable ] [v2] [line 106]
!787 = !MDLocation(line: 106, column: 22, scope: !33, inlinedAt: !776)
!788 = !MDLocation(line: 108, column: 37, scope: !33, inlinedAt: !776)
!789 = !MDLocation(line: 110, column: 5, scope: !33, inlinedAt: !776)
!790 = !MDLocation(line: 111, column: 5, scope: !33, inlinedAt: !776)
!791 = !MDLocation(line: 112, column: 5, scope: !33, inlinedAt: !776)
!792 = !MDLocation(line: 113, column: 5, scope: !33, inlinedAt: !776)
!793 = !MDLocation(line: 114, column: 5, scope: !33, inlinedAt: !776)
!794 = !MDLocation(line: 115, column: 5, scope: !33, inlinedAt: !776)
!795 = !MDLocation(line: 116, column: 5, scope: !33, inlinedAt: !776)
!796 = !MDLocation(line: 117, column: 5, scope: !33, inlinedAt: !776)
!797 = !MDLocation(line: 118, column: 5, scope: !33, inlinedAt: !776)
!798 = !{!"0x101\00link\0016777338\000", !46, !34, !12, !799} ; [ DW_TAG_arg_variable ] [link] [line 122]
!799 = !MDLocation(line: 370, column: 11, scope: !113)
!800 = !MDLocation(line: 122, column: 35, scope: !46, inlinedAt: !799)
!801 = !{!"0x101\00id\0033554554\000", !46, !34, !9, !799} ; [ DW_TAG_arg_variable ] [id] [line 122]
!802 = !MDLocation(line: 122, column: 45, scope: !46, inlinedAt: !799)
!803 = !{!"0x101\00kind\0050331770\000", !46, !34, !9, !799} ; [ DW_TAG_arg_variable ] [kind] [line 122]
!804 = !MDLocation(line: 122, column: 53, scope: !46, inlinedAt: !799)
!805 = !MDLocation(line: 125, column: 41, scope: !46, inlinedAt: !799)
!806 = !{!"0x100\00i\00124\000", !46, !34, !9, !799} ; [ DW_TAG_auto_variable ] [i] [line 124]
!807 = !MDLocation(line: 124, column: 9, scope: !46, inlinedAt: !799)
!808 = !MDLocation(line: 128, column: 9, scope: !183, inlinedAt: !799)
!809 = !MDLocation(line: 130, column: 5, scope: !46, inlinedAt: !799)
!810 = !MDLocation(line: 131, column: 5, scope: !46, inlinedAt: !799)
!811 = !MDLocation(line: 132, column: 5, scope: !46, inlinedAt: !799)
!812 = !MDLocation(line: 133, column: 5, scope: !46, inlinedAt: !799)
!813 = !{!"0x101\00id\0033554554\000", !46, !34, !9, !814} ; [ DW_TAG_arg_variable ] [id] [line 122]
!814 = !MDLocation(line: 371, column: 11, scope: !113)
!815 = !MDLocation(line: 122, column: 45, scope: !46, inlinedAt: !814)
!816 = !{!"0x101\00kind\0050331770\000", !46, !34, !9, !814} ; [ DW_TAG_arg_variable ] [kind] [line 122]
!817 = !MDLocation(line: 122, column: 53, scope: !46, inlinedAt: !814)
!818 = !MDLocation(line: 125, column: 41, scope: !46, inlinedAt: !814)
!819 = !{!"0x100\00i\00124\000", !46, !34, !9, !814} ; [ DW_TAG_auto_variable ] [i] [line 124]
!820 = !MDLocation(line: 124, column: 9, scope: !46, inlinedAt: !814)
!821 = !MDLocation(line: 128, column: 9, scope: !183, inlinedAt: !814)
!822 = !MDLocation(line: 130, column: 5, scope: !46, inlinedAt: !814)
!823 = !MDLocation(line: 131, column: 5, scope: !46, inlinedAt: !814)
!824 = !MDLocation(line: 132, column: 5, scope: !46, inlinedAt: !814)
!825 = !MDLocation(line: 133, column: 5, scope: !46, inlinedAt: !814)
!826 = !{!"0x101\00id\0033554554\000", !46, !34, !9, !827} ; [ DW_TAG_arg_variable ] [id] [line 122]
!827 = !MDLocation(line: 372, column: 11, scope: !113)
!828 = !MDLocation(line: 122, column: 45, scope: !46, inlinedAt: !827)
!829 = !{!"0x101\00kind\0050331770\000", !46, !34, !9, !827} ; [ DW_TAG_arg_variable ] [kind] [line 122]
!830 = !MDLocation(line: 122, column: 53, scope: !46, inlinedAt: !827)
!831 = !MDLocation(line: 125, column: 41, scope: !46, inlinedAt: !827)
!832 = !{!"0x100\00i\00124\000", !46, !34, !9, !827} ; [ DW_TAG_auto_variable ] [i] [line 124]
!833 = !MDLocation(line: 124, column: 9, scope: !46, inlinedAt: !827)
!834 = !MDLocation(line: 128, column: 9, scope: !183, inlinedAt: !827)
!835 = !MDLocation(line: 130, column: 5, scope: !46, inlinedAt: !827)
!836 = !MDLocation(line: 131, column: 5, scope: !46, inlinedAt: !827)
!837 = !MDLocation(line: 132, column: 5, scope: !46, inlinedAt: !827)
!838 = !MDLocation(line: 133, column: 5, scope: !46, inlinedAt: !827)
!839 = !{!"0x101\00id\0016777316\000", !33, !34, !9, !840} ; [ DW_TAG_arg_variable ] [id] [line 100]
!840 = !MDLocation(line: 374, column: 5, scope: !113)
!841 = !MDLocation(line: 100, column: 21, scope: !33, inlinedAt: !840)
!842 = !{!"0x101\00pri\0033554533\000", !33, !34, !9, !840} ; [ DW_TAG_arg_variable ] [pri] [line 101]
!843 = !MDLocation(line: 101, column: 21, scope: !33, inlinedAt: !840)
!844 = !{!"0x101\00state\0067108967\000", !33, !34, !9, !840} ; [ DW_TAG_arg_variable ] [state] [line 103]
!845 = !MDLocation(line: 103, column: 21, scope: !33, inlinedAt: !840)
!846 = !{!"0x101\00fn\0083886184\000", !33, !34, !26, !840} ; [ DW_TAG_arg_variable ] [fn] [line 104]
!847 = !MDLocation(line: 104, column: 32, scope: !33, inlinedAt: !840)
!848 = !{!"0x101\00v1\00100663401\000", !33, !34, !30, !840} ; [ DW_TAG_arg_variable ] [v1] [line 105]
!849 = !MDLocation(line: 105, column: 22, scope: !33, inlinedAt: !840)
!850 = !{!"0x101\00v2\00117440618\000", !33, !34, !30, !840} ; [ DW_TAG_arg_variable ] [v2] [line 106]
!851 = !MDLocation(line: 106, column: 22, scope: !33, inlinedAt: !840)
!852 = !MDLocation(line: 108, column: 37, scope: !33, inlinedAt: !840)
!853 = !MDLocation(line: 110, column: 5, scope: !33, inlinedAt: !840)
!854 = !MDLocation(line: 111, column: 5, scope: !33, inlinedAt: !840)
!855 = !MDLocation(line: 112, column: 5, scope: !33, inlinedAt: !840)
!856 = !MDLocation(line: 113, column: 5, scope: !33, inlinedAt: !840)
!857 = !MDLocation(line: 114, column: 5, scope: !33, inlinedAt: !840)
!858 = !MDLocation(line: 115, column: 5, scope: !33, inlinedAt: !840)
!859 = !MDLocation(line: 116, column: 5, scope: !33, inlinedAt: !840)
!860 = !MDLocation(line: 117, column: 5, scope: !33, inlinedAt: !840)
!861 = !MDLocation(line: 118, column: 5, scope: !33, inlinedAt: !840)
!862 = !{!"0x101\00id\0016777316\000", !33, !34, !9, !863} ; [ DW_TAG_arg_variable ] [id] [line 100]
!863 = !MDLocation(line: 377, column: 5, scope: !113)
!864 = !MDLocation(line: 100, column: 21, scope: !33, inlinedAt: !863)
!865 = !{!"0x101\00pri\0033554533\000", !33, !34, !9, !863} ; [ DW_TAG_arg_variable ] [pri] [line 101]
!866 = !MDLocation(line: 101, column: 21, scope: !33, inlinedAt: !863)
!867 = !{!"0x101\00wkq\0050331750\000", !33, !34, !12, !863} ; [ DW_TAG_arg_variable ] [wkq] [line 102]
!868 = !MDLocation(line: 102, column: 32, scope: !33, inlinedAt: !863)
!869 = !{!"0x101\00state\0067108967\000", !33, !34, !9, !863} ; [ DW_TAG_arg_variable ] [state] [line 103]
!870 = !MDLocation(line: 103, column: 21, scope: !33, inlinedAt: !863)
!871 = !{!"0x101\00fn\0083886184\000", !33, !34, !26, !863} ; [ DW_TAG_arg_variable ] [fn] [line 104]
!872 = !MDLocation(line: 104, column: 32, scope: !33, inlinedAt: !863)
!873 = !{!"0x101\00v1\00100663401\000", !33, !34, !30, !863} ; [ DW_TAG_arg_variable ] [v1] [line 105]
!874 = !MDLocation(line: 105, column: 22, scope: !33, inlinedAt: !863)
!875 = !{!"0x101\00v2\00117440618\000", !33, !34, !30, !863} ; [ DW_TAG_arg_variable ] [v2] [line 106]
!876 = !MDLocation(line: 106, column: 22, scope: !33, inlinedAt: !863)
!877 = !MDLocation(line: 108, column: 37, scope: !33, inlinedAt: !863)
!878 = !MDLocation(line: 110, column: 5, scope: !33, inlinedAt: !863)
!879 = !MDLocation(line: 111, column: 5, scope: !33, inlinedAt: !863)
!880 = !MDLocation(line: 112, column: 5, scope: !33, inlinedAt: !863)
!881 = !MDLocation(line: 113, column: 5, scope: !33, inlinedAt: !863)
!882 = !MDLocation(line: 114, column: 5, scope: !33, inlinedAt: !863)
!883 = !MDLocation(line: 115, column: 5, scope: !33, inlinedAt: !863)
!884 = !MDLocation(line: 116, column: 5, scope: !33, inlinedAt: !863)
!885 = !MDLocation(line: 117, column: 5, scope: !33, inlinedAt: !863)
!886 = !MDLocation(line: 118, column: 5, scope: !33, inlinedAt: !863)
!887 = !{!"0x101\00id\0016777316\000", !33, !34, !9, !888} ; [ DW_TAG_arg_variable ] [id] [line 100]
!888 = !MDLocation(line: 378, column: 5, scope: !113)
!889 = !MDLocation(line: 100, column: 21, scope: !33, inlinedAt: !888)
!890 = !{!"0x101\00pri\0033554533\000", !33, !34, !9, !888} ; [ DW_TAG_arg_variable ] [pri] [line 101]
!891 = !MDLocation(line: 101, column: 21, scope: !33, inlinedAt: !888)
!892 = !{!"0x101\00wkq\0050331750\000", !33, !34, !12, !888} ; [ DW_TAG_arg_variable ] [wkq] [line 102]
!893 = !MDLocation(line: 102, column: 32, scope: !33, inlinedAt: !888)
!894 = !{!"0x101\00state\0067108967\000", !33, !34, !9, !888} ; [ DW_TAG_arg_variable ] [state] [line 103]
!895 = !MDLocation(line: 103, column: 21, scope: !33, inlinedAt: !888)
!896 = !{!"0x101\00fn\0083886184\000", !33, !34, !26, !888} ; [ DW_TAG_arg_variable ] [fn] [line 104]
!897 = !MDLocation(line: 104, column: 32, scope: !33, inlinedAt: !888)
!898 = !{!"0x101\00v1\00100663401\000", !33, !34, !30, !888} ; [ DW_TAG_arg_variable ] [v1] [line 105]
!899 = !MDLocation(line: 105, column: 22, scope: !33, inlinedAt: !888)
!900 = !{!"0x101\00v2\00117440618\000", !33, !34, !30, !888} ; [ DW_TAG_arg_variable ] [v2] [line 106]
!901 = !MDLocation(line: 106, column: 22, scope: !33, inlinedAt: !888)
!902 = !MDLocation(line: 108, column: 37, scope: !33, inlinedAt: !888)
!903 = !MDLocation(line: 110, column: 5, scope: !33, inlinedAt: !888)
!904 = !MDLocation(line: 111, column: 5, scope: !33, inlinedAt: !888)
!905 = !MDLocation(line: 112, column: 5, scope: !33, inlinedAt: !888)
!906 = !MDLocation(line: 113, column: 5, scope: !33, inlinedAt: !888)
!907 = !MDLocation(line: 114, column: 5, scope: !33, inlinedAt: !888)
!908 = !MDLocation(line: 115, column: 5, scope: !33, inlinedAt: !888)
!909 = !MDLocation(line: 116, column: 5, scope: !33, inlinedAt: !888)
!910 = !MDLocation(line: 117, column: 5, scope: !33, inlinedAt: !888)
!911 = !MDLocation(line: 118, column: 5, scope: !33, inlinedAt: !888)
!912 = !MDLocation(line: 119, column: 5, scope: !33, inlinedAt: !888)
!913 = !MDLocation(line: 380, column: 5, scope: !113)
!914 = !MDLocation(line: 382, column: 17, scope: !113)
!915 = !MDLocation(line: 382, column: 5, scope: !113)
!916 = !MDLocation(line: 384, column: 5, scope: !113)
!917 = !MDLocation(line: 386, column: 5, scope: !113)
!918 = !MDLocation(line: 387, column: 5, scope: !113)
!919 = !MDLocation(line: 389, column: 5, scope: !113)
!920 = !MDLocation(line: 391, column: 5, scope: !113)
!921 = !MDLocation(line: 394, column: 12, scope: !113)
!922 = !MDLocation(line: 394, column: 23, scope: !113)
!923 = !MDLocation(line: 393, column: 5, scope: !113)
!924 = !MDLocation(line: 396, column: 5, scope: !113)
!925 = !MDLocation(line: 397, column: 9, scope: !926)
!926 = !{!"0xb\00397\009\0038", !1, !113}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!927 = !MDLocation(line: 397, column: 38, scope: !928)
!928 = !{!"0xb\001", !1, !926}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!929 = !MDLocation(line: 397, column: 9, scope: !113)
!930 = !MDLocation(line: 398, column: 7, scope: !931)
!931 = !{!"0xb\00397\0065\0039", !1, !926}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!932 = !MDLocation(line: 353, column: 9, scope: !113)
!933 = !MDLocation(line: 400, column: 5, scope: !931)
!934 = !MDLocation(line: 401, column: 7, scope: !935)
!935 = !{!"0xb\00400\0012\0040", !1, !926}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!936 = !MDLocation(line: 405, column: 5, scope: !113)
!937 = !MDLocation(line: 406, column: 5, scope: !113)
