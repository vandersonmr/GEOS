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
@.str = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str1 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@tcb = common global %struct.task* null, align 8
@taskid = common global i64 0, align 8
@v1 = common global i64 0, align 8
@v2 = common global i64 0, align 8
@.str2 = private unnamed_addr constant [17 x i8] c"\0ABad task id %d\0A\00", align 1
@.str3 = private unnamed_addr constant [21 x i8] c"Bench mark starting\0A\00", align 1
@.str4 = private unnamed_addr constant [10 x i8] c"Starting\0A\00", align 1
@.str5 = private unnamed_addr constant [10 x i8] c"finished\0A\00", align 1
@.str6 = private unnamed_addr constant [33 x i8] c"qpkt count = %d  holdcount = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [19 x i8] c"These results are \00", align 1
@.str8 = private unnamed_addr constant [8 x i8] c"correct\00", align 1
@.str9 = private unnamed_addr constant [10 x i8] c"incorrect\00", align 1
@.str10 = private unnamed_addr constant [13 x i8] c"\0Aend of run\0A\00", align 1
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
for.end:
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
  br i1 %cmp13, label %while.end, label %while.body, !dbg !211

while.body:                                       ; preds = %entry, %while.cond.backedge
  %0 = phi %struct.task* [ %storemerge, %while.cond.backedge ], [ %.pr, %entry ]
  tail call void @llvm.dbg.value(metadata %struct.packet* null, i64 0, metadata !64, metadata !140), !dbg !212
  %t_state = getelementptr inbounds %struct.task* %0, i64 0, i32 4, !dbg !213
  %1 = load i32* %t_state, align 4, !dbg !213, !tbaa !167
  switch i32 %1, label %while.end [
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
  %pkt.0 = phi %struct.packet* [ null, %while.body ], [ null, %while.body ], [ %2, %sw.bb ]
  %6 = load %struct.task** @tcb, align 8, !dbg !221, !tbaa !150
  %t_id = getelementptr inbounds %struct.task* %6, i64 0, i32 1, !dbg !221
  %7 = load i32* %t_id, align 4, !dbg !221, !tbaa !161
  %conv = sext i32 %7 to i64, !dbg !221
  store i64 %conv, i64* @taskid, align 8, !dbg !222, !tbaa !223
  %t_v1 = getelementptr inbounds %struct.task* %6, i64 0, i32 6, !dbg !224
  %8 = load i64* %t_v1, align 8, !dbg !224, !tbaa !171
  store i64 %8, i64* @v1, align 8, !dbg !225, !tbaa !223
  %9 = load %struct.task** @tcb, align 8, !dbg !226, !tbaa !150
  %t_v2 = getelementptr inbounds %struct.task* %9, i64 0, i32 7, !dbg !226
  %10 = load i64* %t_v2, align 8, !dbg !226, !tbaa !173
  store i64 %10, i64* @v2, align 8, !dbg !227, !tbaa !223
  %11 = load i32* @tracing, align 4, !dbg !228, !tbaa !199
  %cmp6 = icmp eq i32 %11, 1, !dbg !228
  br i1 %cmp6, label %if.then, label %if.end, !dbg !230

if.then:                                          ; preds = %sw.bb5
  %12 = load i64* @taskid, align 8, !dbg !231, !tbaa !223
  %add = add nsw i64 %12, 48, !dbg !231
  %conv8 = trunc i64 %add to i8, !dbg !231
  tail call void @trace(i8 signext %conv8), !dbg !233
  br label %if.end, !dbg !233

if.end:                                           ; preds = %if.then, %sw.bb5
  %13 = load %struct.task** @tcb, align 8, !dbg !234, !tbaa !150
  %t_fn = getelementptr inbounds %struct.task* %13, i64 0, i32 5, !dbg !234
  %14 = load %struct.task* (%struct.packet*)** %t_fn, align 8, !dbg !234, !tbaa !169
  %call = tail call %struct.task* %14(%struct.packet* %pkt.0) #3, !dbg !234
  tail call void @llvm.dbg.value(metadata %struct.task* %call, i64 0, metadata !66, metadata !140), !dbg !235
  %15 = load i64* @v1, align 8, !dbg !236, !tbaa !223
  %16 = load %struct.task** @tcb, align 8, !dbg !237, !tbaa !150
  %t_v19 = getelementptr inbounds %struct.task* %16, i64 0, i32 6, !dbg !237
  store i64 %15, i64* %t_v19, align 8, !dbg !237, !tbaa !171
  %17 = load i64* @v2, align 8, !dbg !238, !tbaa !223
  %18 = load %struct.task** @tcb, align 8, !dbg !239, !tbaa !150
  %t_v210 = getelementptr inbounds %struct.task* %18, i64 0, i32 7, !dbg !239
  store i64 %17, i64* %t_v210, align 8, !dbg !239, !tbaa !173
  br label %while.cond.backedge, !dbg !240

sw.bb11:                                          ; preds = %while.body, %while.body, %while.body, %while.body, %while.body
  %19 = load %struct.task** @tcb, align 8, !dbg !241, !tbaa !150
  %t_link = getelementptr inbounds %struct.task* %19, i64 0, i32 0, !dbg !241
  %20 = load %struct.task** %t_link, align 8, !dbg !241, !tbaa !156
  br label %while.cond.backedge, !dbg !242

while.cond.backedge:                              ; preds = %sw.bb11, %if.end
  %storemerge = phi %struct.task* [ %20, %sw.bb11 ], [ %call, %if.end ]
  store %struct.task* %storemerge, %struct.task** @tcb, align 8, !dbg !243, !tbaa !150
  %cmp = icmp eq %struct.task* %storemerge, null, !dbg !208
  br i1 %cmp, label %while.end, label %while.body, !dbg !211

while.end:                                        ; preds = %while.body, %while.cond.backedge, %entry
  ret void, !dbg !244
}

; Function Attrs: nounwind uwtable
define %struct.task* @Wait() #0 {
entry:
  %0 = load %struct.task** @tcb, align 8, !dbg !245, !tbaa !150
  %t_state = getelementptr inbounds %struct.task* %0, i64 0, i32 4, !dbg !245
  %1 = load i32* %t_state, align 4, !dbg !245, !tbaa !167
  %or = or i32 %1, 2, !dbg !245
  store i32 %or, i32* %t_state, align 4, !dbg !245, !tbaa !167
  %2 = load %struct.task** @tcb, align 8, !dbg !246, !tbaa !150
  ret %struct.task* %2, !dbg !247
}

; Function Attrs: nounwind uwtable
define %struct.task* @holdself() #0 {
entry:
  %0 = load i32* @holdcount, align 4, !dbg !248, !tbaa !199
  %inc = add nsw i32 %0, 1, !dbg !248
  store i32 %inc, i32* @holdcount, align 4, !dbg !248, !tbaa !199
  %1 = load %struct.task** @tcb, align 8, !dbg !249, !tbaa !150
  %t_state = getelementptr inbounds %struct.task* %1, i64 0, i32 4, !dbg !249
  %2 = load i32* %t_state, align 4, !dbg !249, !tbaa !167
  %or = or i32 %2, 4, !dbg !249
  store i32 %or, i32* %t_state, align 4, !dbg !249, !tbaa !167
  %3 = load %struct.task** @tcb, align 8, !dbg !250, !tbaa !150
  %t_link = getelementptr inbounds %struct.task* %3, i64 0, i32 0, !dbg !250
  %4 = load %struct.task** %t_link, align 8, !dbg !250, !tbaa !156
  ret %struct.task* %4, !dbg !251
}

; Function Attrs: nounwind uwtable
define %struct.task* @findtcb(i32 %id) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %id, i64 0, metadata !75, metadata !140), !dbg !252
  tail call void @llvm.dbg.value(metadata %struct.task* null, i64 0, metadata !76, metadata !140), !dbg !253
  %id.off = add i32 %id, -1, !dbg !254
  %0 = icmp ult i32 %id.off, 10, !dbg !254
  br i1 %0, label %if.end, label %if.then5, !dbg !254

if.end:                                           ; preds = %entry
  %conv = sext i32 %id to i64, !dbg !255
  %arrayidx = getelementptr inbounds [11 x %struct.task*]* @tasktab, i64 0, i64 %conv, !dbg !258
  %1 = load %struct.task** %arrayidx, align 8, !dbg !258, !tbaa !150
  tail call void @llvm.dbg.value(metadata %struct.task* %1, i64 0, metadata !76, metadata !140), !dbg !253
  %cmp3 = icmp eq %struct.task* %1, null, !dbg !259
  br i1 %cmp3, label %if.then5, label %if.end6, !dbg !261

if.then5:                                         ; preds = %entry, %if.end
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str2, i64 0, i64 0), i32 %id) #3, !dbg !262
  br label %if.end6, !dbg !262

if.end6:                                          ; preds = %if.then5, %if.end
  %t.012 = phi %struct.task* [ null, %if.then5 ], [ %1, %if.end ]
  ret %struct.task* %t.012, !dbg !263
}

; Function Attrs: nounwind uwtable
define %struct.task* @release(i32 %id) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %id, i64 0, metadata !79, metadata !140), !dbg !264
  %call = tail call %struct.task* @findtcb(i32 %id), !dbg !265
  tail call void @llvm.dbg.value(metadata %struct.task* %call, i64 0, metadata !80, metadata !140), !dbg !266
  %cmp = icmp eq %struct.task* %call, null, !dbg !267
  br i1 %cmp, label %return, label %if.end, !dbg !269

if.end:                                           ; preds = %entry
  %t_state = getelementptr inbounds %struct.task* %call, i64 0, i32 4, !dbg !270
  %0 = load i32* %t_state, align 4, !dbg !270, !tbaa !167
  %and = and i32 %0, 65531, !dbg !270
  store i32 %and, i32* %t_state, align 4, !dbg !270, !tbaa !167
  %t_pri = getelementptr inbounds %struct.task* %call, i64 0, i32 2, !dbg !271
  %1 = load i32* %t_pri, align 4, !dbg !271, !tbaa !163
  %2 = load %struct.task** @tcb, align 8, !dbg !273, !tbaa !150
  %t_pri1 = getelementptr inbounds %struct.task* %2, i64 0, i32 2, !dbg !273
  %3 = load i32* %t_pri1, align 4, !dbg !273, !tbaa !163
  %cmp2 = icmp sgt i32 %1, %3, !dbg !271
  %call. = select i1 %cmp2, %struct.task* %call, %struct.task* %2, !dbg !274
  br label %return, !dbg !274

return:                                           ; preds = %if.end, %entry
  %retval.0 = phi %struct.task* [ null, %entry ], [ %call., %if.end ]
  ret %struct.task* %retval.0, !dbg !275
}

; Function Attrs: nounwind uwtable
define %struct.task* @qpkt(%struct.packet* %pkt) #0 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.packet* %pkt, i64 0, metadata !83, metadata !140), !dbg !276
  %p_id = getelementptr inbounds %struct.packet* %pkt, i64 0, i32 1, !dbg !277
  %0 = load i32* %p_id, align 4, !dbg !277, !tbaa !190
  %call = tail call %struct.task* @findtcb(i32 %0), !dbg !278
  tail call void @llvm.dbg.value(metadata %struct.task* %call, i64 0, metadata !84, metadata !140), !dbg !279
  %cmp = icmp eq %struct.task* %call, null, !dbg !280
  br i1 %cmp, label %return, label %if.end, !dbg !282

if.end:                                           ; preds = %entry
  %1 = load i32* @qpktcount, align 4, !dbg !283, !tbaa !199
  %inc = add nsw i32 %1, 1, !dbg !283
  store i32 %inc, i32* @qpktcount, align 4, !dbg !283, !tbaa !199
  %p_link = getelementptr inbounds %struct.packet* %pkt, i64 0, i32 0, !dbg !284
  store %struct.packet* null, %struct.packet** %p_link, align 8, !dbg !284, !tbaa !187
  %2 = load i64* @taskid, align 8, !dbg !285, !tbaa !223
  %conv = trunc i64 %2 to i32, !dbg !285
  store i32 %conv, i32* %p_id, align 4, !dbg !286, !tbaa !190
  %t_wkq = getelementptr inbounds %struct.task* %call, i64 0, i32 3, !dbg !287
  %3 = load %struct.packet** %t_wkq, align 8, !dbg !287, !tbaa !165
  %cmp2 = icmp eq %struct.packet* %3, null, !dbg !287
  br i1 %cmp2, label %if.then4, label %if.else, !dbg !289

if.then4:                                         ; preds = %if.end
  store %struct.packet* %pkt, %struct.packet** %t_wkq, align 8, !dbg !290, !tbaa !165
  %t_state = getelementptr inbounds %struct.task* %call, i64 0, i32 4, !dbg !292
  %4 = load i32* %t_state, align 4, !dbg !292, !tbaa !167
  %or = or i32 %4, 1, !dbg !292
  store i32 %or, i32* %t_state, align 4, !dbg !292, !tbaa !167
  %t_pri = getelementptr inbounds %struct.task* %call, i64 0, i32 2, !dbg !293
  %5 = load i32* %t_pri, align 4, !dbg !293, !tbaa !163
  %6 = load %struct.task** @tcb, align 8, !dbg !295, !tbaa !150
  %t_pri6 = getelementptr inbounds %struct.task* %6, i64 0, i32 2, !dbg !295
  %7 = load i32* %t_pri6, align 4, !dbg !295, !tbaa !163
  %cmp7 = icmp sgt i32 %5, %7, !dbg !293
  br i1 %cmp7, label %return, label %if.end12, !dbg !296

if.else:                                          ; preds = %if.end
  %8 = bitcast %struct.packet** %t_wkq to %struct.packet*, !dbg !297
  tail call void @append(%struct.packet* %pkt, %struct.packet* %8), !dbg !299
  br label %if.end12

if.end12:                                         ; preds = %if.then4, %if.else
  %9 = load %struct.task** @tcb, align 8, !dbg !300, !tbaa !150
  br label %return, !dbg !301

return:                                           ; preds = %if.then4, %entry, %if.end12
  %retval.0 = phi %struct.task* [ %9, %if.end12 ], [ null, %entry ], [ %call, %if.then4 ]
  ret %struct.task* %retval.0, !dbg !302
}

; Function Attrs: nounwind uwtable
define void @append(%struct.packet* %pkt, %struct.packet* nocapture %ptr) #0 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.packet* %pkt, i64 0, metadata !111, metadata !140), !dbg !303
  tail call void @llvm.dbg.value(metadata %struct.packet* %ptr, i64 0, metadata !112, metadata !140), !dbg !304
  %p_link = getelementptr inbounds %struct.packet* %pkt, i64 0, i32 0, !dbg !305
  store %struct.packet* null, %struct.packet** %p_link, align 8, !dbg !305, !tbaa !187
  br label %while.cond, !dbg !306

while.cond:                                       ; preds = %while.cond, %entry
  %ptr.addr.0 = phi %struct.packet* [ %ptr, %entry ], [ %0, %while.cond ]
  %p_link1 = getelementptr inbounds %struct.packet* %ptr.addr.0, i64 0, i32 0, !dbg !307
  %0 = load %struct.packet** %p_link1, align 8, !dbg !307, !tbaa !187
  %tobool = icmp eq %struct.packet* %0, null, !dbg !306
  br i1 %tobool, label %while.end, label %while.cond, !dbg !306

while.end:                                        ; preds = %while.cond
  store %struct.packet* %pkt, %struct.packet** %p_link1, align 8, !dbg !310, !tbaa !187
  ret void, !dbg !311
}

; Function Attrs: nounwind uwtable
define %struct.task* @idlefn(%struct.packet* nocapture readnone %pkt) #0 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.packet* %pkt, i64 0, metadata !87, metadata !140), !dbg !312
  %0 = load i64* @v2, align 8, !dbg !313, !tbaa !223
  %dec = add nsw i64 %0, -1, !dbg !313
  store i64 %dec, i64* @v2, align 8, !dbg !313, !tbaa !223
  %cmp = icmp eq i64 %dec, 0, !dbg !314
  br i1 %cmp, label %if.then, label %if.end, !dbg !316

if.then:                                          ; preds = %entry
  %call = tail call %struct.task* @holdself(), !dbg !317
  br label %return, !dbg !319

if.end:                                           ; preds = %entry
  %1 = load i64* @v1, align 8, !dbg !320, !tbaa !223
  %and = and i64 %1, 1, !dbg !320
  %cmp1 = icmp eq i64 %and, 0, !dbg !322
  %shr8 = lshr i64 %1, 1, !dbg !323
  %and3 = and i64 %shr8, 32767, !dbg !325
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !326

if.then2:                                         ; preds = %if.end
  store i64 %and3, i64* @v1, align 8, !dbg !327, !tbaa !223
  %call4 = tail call %struct.task* @release(i32 5), !dbg !328
  br label %return, !dbg !329

if.else:                                          ; preds = %if.end
  %xor = xor i64 %and3, 53256, !dbg !330
  store i64 %xor, i64* @v1, align 8, !dbg !332, !tbaa !223
  %call7 = tail call %struct.task* @release(i32 6), !dbg !333
  br label %return, !dbg !334

return:                                           ; preds = %if.else, %if.then2, %if.then
  %retval.0 = phi %struct.task* [ %call, %if.then ], [ %call4, %if.then2 ], [ %call7, %if.else ]
  ret %struct.task* %retval.0, !dbg !335
}

; Function Attrs: nounwind uwtable
define %struct.task* @workfn(%struct.packet* %pkt) #0 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.packet* %pkt, i64 0, metadata !90, metadata !140), !dbg !336
  %cmp = icmp eq %struct.packet* %pkt, null, !dbg !337
  br i1 %cmp, label %if.then, label %if.else, !dbg !338

if.then:                                          ; preds = %entry
  %call = tail call %struct.task* @Wait(), !dbg !339
  br label %return, !dbg !341

if.else:                                          ; preds = %entry
  %0 = load i64* @v1, align 8, !dbg !342, !tbaa !223
  %sub = sub nsw i64 7, %0, !dbg !343
  store i64 %sub, i64* @v1, align 8, !dbg !344, !tbaa !223
  %conv = trunc i64 %sub to i32, !dbg !345
  %p_id = getelementptr inbounds %struct.packet* %pkt, i64 0, i32 1, !dbg !346
  store i32 %conv, i32* %p_id, align 4, !dbg !346, !tbaa !190
  %p_a1 = getelementptr inbounds %struct.packet* %pkt, i64 0, i32 3, !dbg !347
  store i32 0, i32* %p_a1, align 4, !dbg !347, !tbaa !194
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !91, metadata !140), !dbg !348
  br label %for.body, !dbg !349

for.body:                                         ; preds = %for.body, %if.else
  %indvars.iv = phi i64 [ 0, %if.else ], [ %indvars.iv.next, %for.body ]
  %1 = load i64* @v2, align 8, !dbg !351, !tbaa !223
  %inc = add nsw i64 %1, 1, !dbg !351
  %cmp3 = icmp sgt i64 %1, 25, !dbg !354
  %.inc = select i1 %cmp3, i64 1, i64 %inc, !dbg !356
  store i64 %.inc, i64* @v2, align 8, !dbg !357, !tbaa !223
  %arrayidx = getelementptr inbounds [28 x i8]* @alphabet, i64 0, i64 %.inc, !dbg !359
  %2 = load i8* %arrayidx, align 1, !dbg !359, !tbaa !360
  %arrayidx6 = getelementptr inbounds %struct.packet* %pkt, i64 0, i32 4, i64 %indvars.iv, !dbg !361
  store i8 %2, i8* %arrayidx6, align 1, !dbg !361, !tbaa !360
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !349
  %exitcond = icmp eq i64 %indvars.iv.next, 4, !dbg !349
  br i1 %exitcond, label %for.end, label %for.body, !dbg !349

for.end:                                          ; preds = %for.body
  %call8 = tail call %struct.task* @qpkt(%struct.packet* %pkt), !dbg !362
  br label %return, !dbg !363

return:                                           ; preds = %for.end, %if.then
  %retval.0 = phi %struct.task* [ %call, %if.then ], [ %call8, %for.end ]
  ret %struct.task* %retval.0, !dbg !364
}

; Function Attrs: nounwind uwtable
define %struct.task* @handlerfn(%struct.packet* %pkt) #0 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.packet* %pkt, i64 0, metadata !96, metadata !140), !dbg !365
  %cmp = icmp eq %struct.packet* %pkt, null, !dbg !366
  br i1 %cmp, label %if.end, label %if.then, !dbg !368

if.then:                                          ; preds = %entry
  %p_kind = getelementptr inbounds %struct.packet* %pkt, i64 0, i32 2, !dbg !369
  %0 = load i32* %p_kind, align 4, !dbg !369, !tbaa !192
  %cmp1 = icmp eq i32 %0, 1001, !dbg !369
  %1 = select i1 %cmp1, %struct.packet* bitcast (i64* @v1 to %struct.packet*), %struct.packet* bitcast (i64* @v2 to %struct.packet*), !dbg !370
  tail call void @append(%struct.packet* %pkt, %struct.packet* %1), !dbg !371
  br label %if.end, !dbg !371

if.end:                                           ; preds = %entry, %if.then
  %2 = load i64* @v1, align 8, !dbg !372, !tbaa !223
  %cmp2 = icmp eq i64 %2, 0, !dbg !372
  br i1 %cmp2, label %if.end14, label %if.then3, !dbg !373

if.then3:                                         ; preds = %if.end
  %3 = inttoptr i64 %2 to %struct.packet*, !dbg !374
  tail call void @llvm.dbg.value(metadata %struct.packet* %3, i64 0, metadata !100, metadata !140), !dbg !375
  %p_a1 = getelementptr inbounds %struct.packet* %3, i64 0, i32 3, !dbg !376
  %4 = load i32* %p_a1, align 4, !dbg !376, !tbaa !194
  tail call void @llvm.dbg.value(metadata i32 %4, i64 0, metadata !97, metadata !140), !dbg !377
  %cmp4 = icmp sgt i32 %4, 3, !dbg !378
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !380

if.then5:                                         ; preds = %if.then3
  %p_link = getelementptr inbounds %struct.packet* %3, i64 0, i32 0, !dbg !381
  %5 = load %struct.packet** %p_link, align 8, !dbg !381, !tbaa !187
  %6 = ptrtoint %struct.packet* %5 to i64, !dbg !383
  store i64 %6, i64* @v1, align 8, !dbg !384, !tbaa !223
  %call = tail call %struct.task* @qpkt(%struct.packet* %3), !dbg !385
  br label %return, !dbg !386

if.end6:                                          ; preds = %if.then3
  %7 = load i64* @v2, align 8, !dbg !387, !tbaa !223
  %cmp7 = icmp eq i64 %7, 0, !dbg !387
  br i1 %cmp7, label %if.end14, label %if.then8, !dbg !388

if.then8:                                         ; preds = %if.end6
  %8 = inttoptr i64 %7 to %struct.packet*, !dbg !389
  tail call void @llvm.dbg.value(metadata %struct.packet* %8, i64 0, metadata !101, metadata !140), !dbg !390
  %p_link9 = getelementptr inbounds %struct.packet* %8, i64 0, i32 0, !dbg !391
  %9 = load %struct.packet** %p_link9, align 8, !dbg !391, !tbaa !187
  %10 = ptrtoint %struct.packet* %9 to i64, !dbg !392
  store i64 %10, i64* @v2, align 8, !dbg !393, !tbaa !223
  %idxprom = sext i32 %4 to i64, !dbg !394
  %arrayidx = getelementptr inbounds %struct.packet* %3, i64 0, i32 4, i64 %idxprom, !dbg !394
  %11 = load i8* %arrayidx, align 1, !dbg !394, !tbaa !360
  %conv = sext i8 %11 to i32, !dbg !394
  %p_a110 = getelementptr inbounds %struct.packet* %8, i64 0, i32 3, !dbg !395
  store i32 %conv, i32* %p_a110, align 4, !dbg !395, !tbaa !194
  %add = add nsw i32 %4, 1, !dbg !396
  store i32 %add, i32* %p_a1, align 4, !dbg !397, !tbaa !194
  %call12 = tail call %struct.task* @qpkt(%struct.packet* %8), !dbg !398
  br label %return, !dbg !399

if.end14:                                         ; preds = %if.end6, %if.end
  %call15 = tail call %struct.task* @Wait(), !dbg !400
  br label %return, !dbg !401

return:                                           ; preds = %if.end14, %if.then8, %if.then5
  %retval.0 = phi %struct.task* [ %call, %if.then5 ], [ %call12, %if.then8 ], [ %call15, %if.end14 ]
  ret %struct.task* %retval.0, !dbg !402
}

; Function Attrs: nounwind uwtable
define %struct.task* @devfn(%struct.packet* %pkt) #0 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.packet* %pkt, i64 0, metadata !106, metadata !140), !dbg !403
  %cmp = icmp eq %struct.packet* %pkt, null, !dbg !404
  br i1 %cmp, label %if.then, label %if.else, !dbg !406

if.then:                                          ; preds = %entry
  %0 = load i64* @v1, align 8, !dbg !407, !tbaa !223
  %cmp1 = icmp eq i64 %0, 0, !dbg !407
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !410

if.then2:                                         ; preds = %if.then
  %call = tail call %struct.task* @Wait(), !dbg !411
  br label %return, !dbg !413

if.end:                                           ; preds = %if.then
  %1 = inttoptr i64 %0 to %struct.packet*, !dbg !414
  tail call void @llvm.dbg.value(metadata %struct.packet* %1, i64 0, metadata !106, metadata !140), !dbg !403
  store i64 0, i64* @v1, align 8, !dbg !415, !tbaa !223
  %call3 = tail call %struct.task* @qpkt(%struct.packet* %1), !dbg !416
  br label %return, !dbg !417

if.else:                                          ; preds = %entry
  %2 = ptrtoint %struct.packet* %pkt to i64, !dbg !418
  store i64 %2, i64* @v1, align 8, !dbg !420, !tbaa !223
  %3 = load i32* @tracing, align 4, !dbg !421, !tbaa !199
  %cmp4 = icmp eq i32 %3, 1, !dbg !421
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !423

if.then5:                                         ; preds = %if.else
  %p_a1 = getelementptr inbounds %struct.packet* %pkt, i64 0, i32 3, !dbg !424
  %4 = load i32* %p_a1, align 4, !dbg !424, !tbaa !194
  %conv = trunc i32 %4 to i8, !dbg !424
  tail call void @trace(i8 signext %conv), !dbg !426
  br label %if.end6, !dbg !426

if.end6:                                          ; preds = %if.then5, %if.else
  %call7 = tail call %struct.task* @holdself(), !dbg !427
  br label %return, !dbg !428

return:                                           ; preds = %if.end6, %if.end, %if.then2
  %retval.0 = phi %struct.task* [ %call, %if.then2 ], [ %call3, %if.end ], [ %call7, %if.end6 ]
  ret %struct.task* %retval.0, !dbg !429
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.packet* null, i64 0, metadata !117, metadata !140), !dbg !430
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([20 x i8]* @str, i64 0, i64 0)), !dbg !431
  tail call void @createtask(i32 1, i32 0, %struct.packet* null, i32 0, %struct.task* (%struct.packet*)* @idlefn, i64 1, i64 10000000), !dbg !432
  %call2 = tail call %struct.packet* @pkt(%struct.packet* null, i32 0, i32 1001), !dbg !433
  tail call void @llvm.dbg.value(metadata %struct.packet* %call2, i64 0, metadata !117, metadata !140), !dbg !430
  %call3 = tail call %struct.packet* @pkt(%struct.packet* %call2, i32 0, i32 1001), !dbg !434
  tail call void @llvm.dbg.value(metadata %struct.packet* %call3, i64 0, metadata !117, metadata !140), !dbg !430
  tail call void @createtask(i32 2, i32 1000, %struct.packet* %call3, i32 3, %struct.task* (%struct.packet*)* @workfn, i64 3, i64 0), !dbg !435
  %call4 = tail call %struct.packet* @pkt(%struct.packet* null, i32 5, i32 1000), !dbg !436
  tail call void @llvm.dbg.value(metadata %struct.packet* %call4, i64 0, metadata !117, metadata !140), !dbg !430
  %call5 = tail call %struct.packet* @pkt(%struct.packet* %call4, i32 5, i32 1000), !dbg !437
  tail call void @llvm.dbg.value(metadata %struct.packet* %call5, i64 0, metadata !117, metadata !140), !dbg !430
  %call6 = tail call %struct.packet* @pkt(%struct.packet* %call5, i32 5, i32 1000), !dbg !438
  tail call void @llvm.dbg.value(metadata %struct.packet* %call6, i64 0, metadata !117, metadata !140), !dbg !430
  tail call void @createtask(i32 3, i32 2000, %struct.packet* %call6, i32 3, %struct.task* (%struct.packet*)* @handlerfn, i64 0, i64 0), !dbg !439
  %call7 = tail call %struct.packet* @pkt(%struct.packet* null, i32 6, i32 1000), !dbg !440
  tail call void @llvm.dbg.value(metadata %struct.packet* %call7, i64 0, metadata !117, metadata !140), !dbg !430
  %call8 = tail call %struct.packet* @pkt(%struct.packet* %call7, i32 6, i32 1000), !dbg !441
  tail call void @llvm.dbg.value(metadata %struct.packet* %call8, i64 0, metadata !117, metadata !140), !dbg !430
  %call9 = tail call %struct.packet* @pkt(%struct.packet* %call8, i32 6, i32 1000), !dbg !442
  tail call void @llvm.dbg.value(metadata %struct.packet* %call9, i64 0, metadata !117, metadata !140), !dbg !430
  tail call void @createtask(i32 4, i32 3000, %struct.packet* %call9, i32 3, %struct.task* (%struct.packet*)* @handlerfn, i64 0, i64 0), !dbg !443
  tail call void @llvm.dbg.value(metadata %struct.packet* null, i64 0, metadata !117, metadata !140), !dbg !430
  tail call void @createtask(i32 5, i32 4000, %struct.packet* null, i32 2, %struct.task* (%struct.packet*)* @devfn, i64 0, i64 0), !dbg !444
  tail call void @createtask(i32 6, i32 5000, %struct.packet* null, i32 2, %struct.task* (%struct.packet*)* @devfn, i64 0, i64 0), !dbg !445
  %0 = load %struct.task** @tasklist, align 8, !dbg !446, !tbaa !150
  store %struct.task* %0, %struct.task** @tcb, align 8, !dbg !447, !tbaa !150
  store i32 0, i32* @holdcount, align 4, !dbg !448, !tbaa !199
  store i32 0, i32* @qpktcount, align 4, !dbg !449, !tbaa !199
  %puts28 = tail call i32 @puts(i8* getelementptr inbounds ([9 x i8]* @str11, i64 0, i64 0)), !dbg !450
  store i32 0, i32* @tracing, align 4, !dbg !451, !tbaa !199
  store i32 0, i32* @layout, align 4, !dbg !452, !tbaa !199
  tail call void @schedule(), !dbg !453
  %puts29 = tail call i32 @puts(i8* getelementptr inbounds ([9 x i8]* @str12, i64 0, i64 0)), !dbg !454
  %1 = load i32* @qpktcount, align 4, !dbg !455, !tbaa !199
  %2 = load i32* @holdcount, align 4, !dbg !456, !tbaa !199
  %call12 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str6, i64 0, i64 0), i32 %1, i32 %2) #3, !dbg !457
  %call13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str7, i64 0, i64 0)) #3, !dbg !458
  %3 = load i32* @qpktcount, align 4, !dbg !459, !tbaa !199
  %cmp = icmp eq i32 %3, 23263894, !dbg !459
  %4 = load i32* @holdcount, align 4
  %cmp14 = icmp eq i32 %4, 9305557, !dbg !461
  %or.cond = and i1 %cmp, %cmp14, !dbg !463
  br i1 %or.cond, label %if.then, label %if.else, !dbg !463

if.then:                                          ; preds = %entry
  %call15 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str8, i64 0, i64 0)) #3, !dbg !464
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !118, metadata !140), !dbg !466
  br label %if.end, !dbg !467

if.else:                                          ; preds = %entry
  %call16 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str9, i64 0, i64 0)) #3, !dbg !468
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !118, metadata !140), !dbg !466
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %retval1.0 = phi i32 [ 0, %if.then ], [ 1, %if.else ]
  %puts30 = tail call i32 @puts(i8* getelementptr inbounds ([12 x i8]* @str13, i64 0, i64 0)), !dbg !470
  ret i32 %retval1.0, !dbg !471
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #2

; Function Attrs: nounwind
declare i32 @putchar(i32) #3

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #3

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
!231 = !MDLocation(line: 170, column: 42, scope: !232)
!232 = !{!"0xb\001", !1, !229}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!233 = !MDLocation(line: 170, column: 36, scope: !229)
!234 = !MDLocation(line: 172, column: 29, scope: !216)
!235 = !MDLocation(line: 154, column: 22, scope: !65)
!236 = !MDLocation(line: 173, column: 29, scope: !216)
!237 = !MDLocation(line: 173, column: 17, scope: !216)
!238 = !MDLocation(line: 174, column: 29, scope: !216)
!239 = !MDLocation(line: 174, column: 17, scope: !216)
!240 = !MDLocation(line: 176, column: 17, scope: !216)
!241 = !MDLocation(line: 183, column: 23, scope: !216)
!242 = !MDLocation(line: 184, column: 17, scope: !216)
!243 = !MDLocation(line: 175, column: 17, scope: !216)
!244 = !MDLocation(line: 190, column: 1, scope: !60)
!245 = !MDLocation(line: 194, column: 5, scope: !67)
!246 = !MDLocation(line: 195, column: 13, scope: !67)
!247 = !MDLocation(line: 195, column: 5, scope: !67)
!248 = !MDLocation(line: 200, column: 5, scope: !70)
!249 = !MDLocation(line: 201, column: 5, scope: !70)
!250 = !MDLocation(line: 202, column: 13, scope: !70)
!251 = !MDLocation(line: 202, column: 5, scope: !70)
!252 = !MDLocation(line: 205, column: 26, scope: !71)
!253 = !MDLocation(line: 207, column: 18, scope: !71)
!254 = !MDLocation(line: 209, column: 9, scope: !71)
!255 = !MDLocation(line: 209, column: 18, scope: !256)
!256 = !{!"0xb\001", !1, !257}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!257 = !{!"0xb\00209\009\007", !1, !71}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!258 = !MDLocation(line: 210, column: 9, scope: !257)
!259 = !MDLocation(line: 211, column: 9, scope: !260)
!260 = !{!"0xb\00211\009\008", !1, !71}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!261 = !MDLocation(line: 211, column: 9, scope: !71)
!262 = !MDLocation(line: 211, column: 15, scope: !260)
!263 = !MDLocation(line: 212, column: 5, scope: !71)
!264 = !MDLocation(line: 215, column: 26, scope: !77)
!265 = !MDLocation(line: 219, column: 9, scope: !77)
!266 = !MDLocation(line: 217, column: 18, scope: !77)
!267 = !MDLocation(line: 220, column: 10, scope: !268)
!268 = !{!"0xb\00220\0010\009", !1, !77}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!269 = !MDLocation(line: 220, column: 10, scope: !77)
!270 = !MDLocation(line: 222, column: 5, scope: !77)
!271 = !MDLocation(line: 223, column: 10, scope: !272)
!272 = !{!"0xb\00223\0010\0010", !1, !77}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!273 = !MDLocation(line: 223, column: 21, scope: !272)
!274 = !MDLocation(line: 223, column: 34, scope: !272)
!275 = !MDLocation(line: 226, column: 1, scope: !77)
!276 = !MDLocation(line: 229, column: 34, scope: !81)
!277 = !MDLocation(line: 233, column: 17, scope: !81)
!278 = !MDLocation(line: 233, column: 9, scope: !81)
!279 = !MDLocation(line: 231, column: 18, scope: !81)
!280 = !MDLocation(line: 234, column: 9, scope: !281)
!281 = !{!"0xb\00234\009\0011", !1, !81}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!282 = !MDLocation(line: 234, column: 9, scope: !81)
!283 = !MDLocation(line: 236, column: 5, scope: !81)
!284 = !MDLocation(line: 238, column: 5, scope: !81)
!285 = !MDLocation(line: 239, column: 17, scope: !81)
!286 = !MDLocation(line: 239, column: 5, scope: !81)
!287 = !MDLocation(line: 241, column: 8, scope: !288)
!288 = !{!"0xb\00241\008\0012", !1, !81}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!289 = !MDLocation(line: 241, column: 8, scope: !81)
!290 = !MDLocation(line: 243, column: 9, scope: !291)
!291 = !{!"0xb\00242\005\0013", !1, !288}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!292 = !MDLocation(line: 244, column: 9, scope: !291)
!293 = !MDLocation(line: 245, column: 13, scope: !294)
!294 = !{!"0xb\00245\0013\0014", !1, !291}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!295 = !MDLocation(line: 245, column: 24, scope: !294)
!296 = !MDLocation(line: 245, column: 13, scope: !291)
!297 = !MDLocation(line: 249, column: 21, scope: !298)
!298 = !{!"0xb\00248\005\0015", !1, !288}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!299 = !MDLocation(line: 249, column: 9, scope: !298)
!300 = !MDLocation(line: 252, column: 13, scope: !81)
!301 = !MDLocation(line: 252, column: 5, scope: !81)
!302 = !MDLocation(line: 253, column: 1, scope: !81)
!303 = !MDLocation(line: 341, column: 28, scope: !107)
!304 = !MDLocation(line: 341, column: 48, scope: !107)
!305 = !MDLocation(line: 343, column: 5, scope: !107)
!306 = !MDLocation(line: 345, column: 5, scope: !107)
!307 = !MDLocation(line: 345, column: 13, scope: !308)
!308 = !{!"0xb\003", !1, !309}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!309 = !{!"0xb\001", !1, !107}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!310 = !MDLocation(line: 347, column: 5, scope: !107)
!311 = !MDLocation(line: 348, column: 1, scope: !107)
!312 = !MDLocation(line: 255, column: 36, scope: !85)
!313 = !MDLocation(line: 257, column: 5, scope: !85)
!314 = !MDLocation(line: 258, column: 10, scope: !315)
!315 = !{!"0xb\00258\0010\0016", !1, !85}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!316 = !MDLocation(line: 258, column: 10, scope: !85)
!317 = !MDLocation(line: 258, column: 27, scope: !318)
!318 = !{!"0xb\001", !1, !315}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!319 = !MDLocation(line: 258, column: 18, scope: !315)
!320 = !MDLocation(line: 260, column: 11, scope: !321)
!321 = !{!"0xb\00260\0010\0017", !1, !85}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!322 = !MDLocation(line: 260, column: 10, scope: !321)
!323 = !MDLocation(line: 262, column: 16, scope: !324)
!324 = !{!"0xb\00261\005\0018", !1, !321}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!325 = !MDLocation(line: 262, column: 14, scope: !324)
!326 = !MDLocation(line: 260, column: 10, scope: !85)
!327 = !MDLocation(line: 262, column: 9, scope: !324)
!328 = !MDLocation(line: 263, column: 18, scope: !324)
!329 = !MDLocation(line: 263, column: 9, scope: !324)
!330 = !MDLocation(line: 267, column: 14, scope: !331)
!331 = !{!"0xb\00266\005\0019", !1, !321}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!332 = !MDLocation(line: 267, column: 9, scope: !331)
!333 = !MDLocation(line: 268, column: 18, scope: !331)
!334 = !MDLocation(line: 268, column: 9, scope: !331)
!335 = !MDLocation(line: 270, column: 1, scope: !85)
!336 = !MDLocation(line: 272, column: 36, scope: !88)
!337 = !MDLocation(line: 274, column: 10, scope: !93)
!338 = !MDLocation(line: 274, column: 10, scope: !88)
!339 = !MDLocation(line: 274, column: 28, scope: !340)
!340 = !{!"0xb\001", !1, !93}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!341 = !MDLocation(line: 274, column: 19, scope: !93)
!342 = !MDLocation(line: 279, column: 40, scope: !92)
!343 = !MDLocation(line: 279, column: 14, scope: !92)
!344 = !MDLocation(line: 279, column: 9, scope: !92)
!345 = !MDLocation(line: 280, column: 21, scope: !92)
!346 = !MDLocation(line: 280, column: 9, scope: !92)
!347 = !MDLocation(line: 282, column: 9, scope: !92)
!348 = !MDLocation(line: 277, column: 13, scope: !92)
!349 = !MDLocation(line: 283, column: 9, scope: !350)
!350 = !{!"0xb\00283\009\0022", !1, !92}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!351 = !MDLocation(line: 285, column: 13, scope: !352)
!352 = !{!"0xb\00284\009\0024", !1, !353}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!353 = !{!"0xb\00283\009\0023", !1, !350}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!354 = !MDLocation(line: 286, column: 18, scope: !355)
!355 = !{!"0xb\00286\0018\0025", !1, !352}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!356 = !MDLocation(line: 286, column: 18, scope: !352)
!357 = !MDLocation(line: 286, column: 28, scope: !358)
!358 = !{!"0xb\001", !1, !355}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!359 = !MDLocation(line: 287, column: 30, scope: !352)
!360 = !{!152, !152, i64 0}
!361 = !MDLocation(line: 287, column: 13, scope: !352)
!362 = !MDLocation(line: 289, column: 18, scope: !92)
!363 = !MDLocation(line: 289, column: 9, scope: !92)
!364 = !MDLocation(line: 291, column: 1, scope: !88)
!365 = !MDLocation(line: 293, column: 39, scope: !94)
!366 = !MDLocation(line: 295, column: 9, scope: !367)
!367 = !{!"0xb\00295\009\0026", !1, !94}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!368 = !MDLocation(line: 295, column: 9, scope: !94)
!369 = !MDLocation(line: 296, column: 41, scope: !367)
!370 = !MDLocation(line: 296, column: 23, scope: !367)
!371 = !MDLocation(line: 295, column: 17, scope: !367)
!372 = !MDLocation(line: 298, column: 9, scope: !99)
!373 = !MDLocation(line: 298, column: 9, scope: !94)
!374 = !MDLocation(line: 301, column: 34, scope: !98)
!375 = !MDLocation(line: 301, column: 24, scope: !98)
!376 = !MDLocation(line: 302, column: 17, scope: !98)
!377 = !MDLocation(line: 300, column: 13, scope: !98)
!378 = !MDLocation(line: 304, column: 14, scope: !379)
!379 = !{!"0xb\00304\0014\0029", !1, !98}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!380 = !MDLocation(line: 304, column: 14, scope: !98)
!381 = !MDLocation(line: 306, column: 24, scope: !382)
!382 = !{!"0xb\00305\009\0030", !1, !379}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!383 = !MDLocation(line: 306, column: 17, scope: !382)
!384 = !MDLocation(line: 306, column: 12, scope: !382)
!385 = !MDLocation(line: 307, column: 21, scope: !382)
!386 = !MDLocation(line: 307, column: 12, scope: !382)
!387 = !MDLocation(line: 310, column: 14, scope: !103)
!388 = !MDLocation(line: 310, column: 14, scope: !98)
!389 = !MDLocation(line: 314, column: 22, scope: !102)
!390 = !MDLocation(line: 312, column: 28, scope: !102)
!391 = !MDLocation(line: 315, column: 25, scope: !102)
!392 = !MDLocation(line: 315, column: 18, scope: !102)
!393 = !MDLocation(line: 315, column: 13, scope: !102)
!394 = !MDLocation(line: 316, column: 28, scope: !102)
!395 = !MDLocation(line: 316, column: 13, scope: !102)
!396 = !MDLocation(line: 317, column: 29, scope: !102)
!397 = !MDLocation(line: 317, column: 13, scope: !102)
!398 = !MDLocation(line: 318, column: 21, scope: !102)
!399 = !MDLocation(line: 318, column: 13, scope: !102)
!400 = !MDLocation(line: 321, column: 14, scope: !94)
!401 = !MDLocation(line: 321, column: 5, scope: !94)
!402 = !MDLocation(line: 322, column: 1, scope: !94)
!403 = !MDLocation(line: 324, column: 35, scope: !104)
!404 = !MDLocation(line: 326, column: 10, scope: !405)
!405 = !{!"0xb\00326\0010\0033", !1, !104}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!406 = !MDLocation(line: 326, column: 10, scope: !104)
!407 = !MDLocation(line: 328, column: 14, scope: !408)
!408 = !{!"0xb\00328\0014\0035", !1, !409}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!409 = !{!"0xb\00327\005\0034", !1, !405}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!410 = !MDLocation(line: 328, column: 14, scope: !409)
!411 = !MDLocation(line: 328, column: 31, scope: !412)
!412 = !{!"0xb\001", !1, !408}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!413 = !MDLocation(line: 328, column: 22, scope: !408)
!414 = !MDLocation(line: 329, column: 15, scope: !409)
!415 = !MDLocation(line: 330, column: 9, scope: !409)
!416 = !MDLocation(line: 331, column: 18, scope: !409)
!417 = !MDLocation(line: 331, column: 9, scope: !409)
!418 = !MDLocation(line: 335, column: 14, scope: !419)
!419 = !{!"0xb\00334\005\0036", !1, !405}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!420 = !MDLocation(line: 335, column: 9, scope: !419)
!421 = !MDLocation(line: 336, column: 13, scope: !422)
!422 = !{!"0xb\00336\0013\0037", !1, !419}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!423 = !MDLocation(line: 336, column: 13, scope: !419)
!424 = !MDLocation(line: 336, column: 34, scope: !425)
!425 = !{!"0xb\001", !1, !422}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!426 = !MDLocation(line: 336, column: 28, scope: !422)
!427 = !MDLocation(line: 337, column: 18, scope: !419)
!428 = !MDLocation(line: 337, column: 9, scope: !419)
!429 = !MDLocation(line: 339, column: 1, scope: !104)
!430 = !MDLocation(line: 352, column: 20, scope: !113)
!431 = !MDLocation(line: 355, column: 5, scope: !113)
!432 = !MDLocation(line: 357, column: 5, scope: !113)
!433 = !MDLocation(line: 359, column: 11, scope: !113)
!434 = !MDLocation(line: 360, column: 11, scope: !113)
!435 = !MDLocation(line: 362, column: 5, scope: !113)
!436 = !MDLocation(line: 364, column: 11, scope: !113)
!437 = !MDLocation(line: 365, column: 11, scope: !113)
!438 = !MDLocation(line: 366, column: 11, scope: !113)
!439 = !MDLocation(line: 368, column: 5, scope: !113)
!440 = !MDLocation(line: 370, column: 11, scope: !113)
!441 = !MDLocation(line: 371, column: 11, scope: !113)
!442 = !MDLocation(line: 372, column: 11, scope: !113)
!443 = !MDLocation(line: 374, column: 5, scope: !113)
!444 = !MDLocation(line: 377, column: 5, scope: !113)
!445 = !MDLocation(line: 378, column: 5, scope: !113)
!446 = !MDLocation(line: 380, column: 11, scope: !113)
!447 = !MDLocation(line: 380, column: 5, scope: !113)
!448 = !MDLocation(line: 382, column: 17, scope: !113)
!449 = !MDLocation(line: 382, column: 5, scope: !113)
!450 = !MDLocation(line: 384, column: 5, scope: !113)
!451 = !MDLocation(line: 386, column: 5, scope: !113)
!452 = !MDLocation(line: 387, column: 5, scope: !113)
!453 = !MDLocation(line: 389, column: 5, scope: !113)
!454 = !MDLocation(line: 391, column: 5, scope: !113)
!455 = !MDLocation(line: 394, column: 12, scope: !113)
!456 = !MDLocation(line: 394, column: 23, scope: !113)
!457 = !MDLocation(line: 393, column: 5, scope: !113)
!458 = !MDLocation(line: 396, column: 5, scope: !113)
!459 = !MDLocation(line: 397, column: 9, scope: !460)
!460 = !{!"0xb\00397\009\0038", !1, !113}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!461 = !MDLocation(line: 397, column: 38, scope: !462)
!462 = !{!"0xb\001", !1, !460}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!463 = !MDLocation(line: 397, column: 9, scope: !113)
!464 = !MDLocation(line: 398, column: 7, scope: !465)
!465 = !{!"0xb\00397\0065\0039", !1, !460}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!466 = !MDLocation(line: 353, column: 9, scope: !113)
!467 = !MDLocation(line: 400, column: 5, scope: !465)
!468 = !MDLocation(line: 401, column: 7, scope: !469)
!469 = !{!"0xb\00400\0012\0040", !1, !460}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!470 = !MDLocation(line: 405, column: 5, scope: !113)
!471 = !MDLocation(line: 406, column: 5, scope: !113)
