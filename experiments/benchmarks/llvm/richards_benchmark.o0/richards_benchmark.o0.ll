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

; Function Attrs: nounwind uwtable
define void @createtask(i32 %id, i32 %pri, %struct.packet* %wkq, i32 %state, %struct.task* (%struct.packet*)* %fn, i64 %v1, i64 %v2) #0 {
entry:
  %id.addr = alloca i32, align 4
  %pri.addr = alloca i32, align 4
  %wkq.addr = alloca %struct.packet*, align 8
  %state.addr = alloca i32, align 4
  %fn.addr = alloca %struct.task* (%struct.packet*)*, align 8
  %v1.addr = alloca i64, align 8
  %v2.addr = alloca i64, align 8
  %t = alloca %struct.task*, align 8
  store i32 %id, i32* %id.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %id.addr, metadata !86, metadata !87), !dbg !88
  store i32 %pri, i32* %pri.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %pri.addr, metadata !89, metadata !87), !dbg !90
  store %struct.packet* %wkq, %struct.packet** %wkq.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.packet** %wkq.addr, metadata !91, metadata !87), !dbg !92
  store i32 %state, i32* %state.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %state.addr, metadata !93, metadata !87), !dbg !94
  store %struct.task* (%struct.packet*)* %fn, %struct.task* (%struct.packet*)** %fn.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.task* (%struct.packet*)** %fn.addr, metadata !95, metadata !87), !dbg !96
  store i64 %v1, i64* %v1.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %v1.addr, metadata !97, metadata !87), !dbg !98
  store i64 %v2, i64* %v2.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %v2.addr, metadata !99, metadata !87), !dbg !100
  call void @llvm.dbg.declare(metadata %struct.task** %t, metadata !101, metadata !87), !dbg !102
  %call = call noalias i8* @malloc(i64 56) #4, !dbg !103
  %0 = bitcast i8* %call to %struct.task*, !dbg !104
  store %struct.task* %0, %struct.task** %t, align 8, !dbg !102
  %1 = load %struct.task** %t, align 8, !dbg !105
  %2 = load i32* %id.addr, align 4, !dbg !106
  %idxprom = sext i32 %2 to i64, !dbg !107
  %arrayidx = getelementptr inbounds [11 x %struct.task*]* @tasktab, i32 0, i64 %idxprom, !dbg !107
  store %struct.task* %1, %struct.task** %arrayidx, align 8, !dbg !107
  %3 = load %struct.task** @tasklist, align 8, !dbg !108
  %4 = load %struct.task** %t, align 8, !dbg !109
  %t_link = getelementptr inbounds %struct.task* %4, i32 0, i32 0, !dbg !109
  store %struct.task* %3, %struct.task** %t_link, align 8, !dbg !109
  %5 = load i32* %id.addr, align 4, !dbg !110
  %6 = load %struct.task** %t, align 8, !dbg !111
  %t_id = getelementptr inbounds %struct.task* %6, i32 0, i32 1, !dbg !111
  store i32 %5, i32* %t_id, align 4, !dbg !111
  %7 = load i32* %pri.addr, align 4, !dbg !112
  %8 = load %struct.task** %t, align 8, !dbg !113
  %t_pri = getelementptr inbounds %struct.task* %8, i32 0, i32 2, !dbg !113
  store i32 %7, i32* %t_pri, align 4, !dbg !113
  %9 = load %struct.packet** %wkq.addr, align 8, !dbg !114
  %10 = load %struct.task** %t, align 8, !dbg !115
  %t_wkq = getelementptr inbounds %struct.task* %10, i32 0, i32 3, !dbg !115
  store %struct.packet* %9, %struct.packet** %t_wkq, align 8, !dbg !115
  %11 = load i32* %state.addr, align 4, !dbg !116
  %12 = load %struct.task** %t, align 8, !dbg !117
  %t_state = getelementptr inbounds %struct.task* %12, i32 0, i32 4, !dbg !117
  store i32 %11, i32* %t_state, align 4, !dbg !117
  %13 = load %struct.task* (%struct.packet*)** %fn.addr, align 8, !dbg !118
  %14 = load %struct.task** %t, align 8, !dbg !119
  %t_fn = getelementptr inbounds %struct.task* %14, i32 0, i32 5, !dbg !119
  store %struct.task* (%struct.packet*)* %13, %struct.task* (%struct.packet*)** %t_fn, align 8, !dbg !119
  %15 = load i64* %v1.addr, align 8, !dbg !120
  %16 = load %struct.task** %t, align 8, !dbg !121
  %t_v1 = getelementptr inbounds %struct.task* %16, i32 0, i32 6, !dbg !121
  store i64 %15, i64* %t_v1, align 8, !dbg !121
  %17 = load i64* %v2.addr, align 8, !dbg !122
  %18 = load %struct.task** %t, align 8, !dbg !123
  %t_v2 = getelementptr inbounds %struct.task* %18, i32 0, i32 7, !dbg !123
  store i64 %17, i64* %t_v2, align 8, !dbg !123
  %19 = load %struct.task** %t, align 8, !dbg !124
  store %struct.task* %19, %struct.task** @tasklist, align 8, !dbg !125
  ret void, !dbg !126
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind uwtable
define %struct.packet* @pkt(%struct.packet* %link, i32 %id, i32 %kind) #0 {
entry:
  %link.addr = alloca %struct.packet*, align 8
  %id.addr = alloca i32, align 4
  %kind.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %p = alloca %struct.packet*, align 8
  store %struct.packet* %link, %struct.packet** %link.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.packet** %link.addr, metadata !127, metadata !87), !dbg !128
  store i32 %id, i32* %id.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %id.addr, metadata !129, metadata !87), !dbg !130
  store i32 %kind, i32* %kind.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %kind.addr, metadata !131, metadata !87), !dbg !132
  call void @llvm.dbg.declare(metadata i32* %i, metadata !133, metadata !87), !dbg !134
  call void @llvm.dbg.declare(metadata %struct.packet** %p, metadata !135, metadata !87), !dbg !136
  %call = call noalias i8* @malloc(i64 24) #4, !dbg !137
  %0 = bitcast i8* %call to %struct.packet*, !dbg !138
  store %struct.packet* %0, %struct.packet** %p, align 8, !dbg !136
  store i32 0, i32* %i, align 4, !dbg !139
  br label %for.cond, !dbg !139

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32* %i, align 4, !dbg !141
  %cmp = icmp sle i32 %1, 3, !dbg !141
  br i1 %cmp, label %for.body, label %for.end, !dbg !145

for.body:                                         ; preds = %for.cond
  %2 = load i32* %i, align 4, !dbg !146
  %idxprom = sext i32 %2 to i64, !dbg !147
  %3 = load %struct.packet** %p, align 8, !dbg !147
  %p_a2 = getelementptr inbounds %struct.packet* %3, i32 0, i32 4, !dbg !147
  %arrayidx = getelementptr inbounds [4 x i8]* %p_a2, i32 0, i64 %idxprom, !dbg !147
  store i8 0, i8* %arrayidx, align 1, !dbg !147
  br label %for.inc, !dbg !147

for.inc:                                          ; preds = %for.body
  %4 = load i32* %i, align 4, !dbg !148
  %inc = add nsw i32 %4, 1, !dbg !148
  store i32 %inc, i32* %i, align 4, !dbg !148
  br label %for.cond, !dbg !149

for.end:                                          ; preds = %for.cond
  %5 = load %struct.packet** %link.addr, align 8, !dbg !150
  %6 = load %struct.packet** %p, align 8, !dbg !151
  %p_link = getelementptr inbounds %struct.packet* %6, i32 0, i32 0, !dbg !151
  store %struct.packet* %5, %struct.packet** %p_link, align 8, !dbg !151
  %7 = load i32* %id.addr, align 4, !dbg !152
  %8 = load %struct.packet** %p, align 8, !dbg !153
  %p_id = getelementptr inbounds %struct.packet* %8, i32 0, i32 1, !dbg !153
  store i32 %7, i32* %p_id, align 4, !dbg !153
  %9 = load i32* %kind.addr, align 4, !dbg !154
  %10 = load %struct.packet** %p, align 8, !dbg !155
  %p_kind = getelementptr inbounds %struct.packet* %10, i32 0, i32 2, !dbg !155
  store i32 %9, i32* %p_kind, align 4, !dbg !155
  %11 = load %struct.packet** %p, align 8, !dbg !156
  %p_a1 = getelementptr inbounds %struct.packet* %11, i32 0, i32 3, !dbg !156
  store i32 0, i32* %p_a1, align 4, !dbg !156
  %12 = load %struct.packet** %p, align 8, !dbg !157
  ret %struct.packet* %12, !dbg !158
}

; Function Attrs: nounwind uwtable
define void @trace(i8 signext %a) #0 {
entry:
  %a.addr = alloca i8, align 1
  store i8 %a, i8* %a.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %a.addr, metadata !159, metadata !87), !dbg !160
  %0 = load i32* @layout, align 4, !dbg !161
  %dec = add nsw i32 %0, -1, !dbg !161
  store i32 %dec, i32* @layout, align 4, !dbg !161
  %cmp = icmp sle i32 %dec, 0, !dbg !161
  br i1 %cmp, label %if.then, label %if.end, !dbg !163

if.then:                                          ; preds = %entry
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0)), !dbg !164
  store i32 50, i32* @layout, align 4, !dbg !166
  br label %if.end, !dbg !167

if.end:                                           ; preds = %if.then, %entry
  %1 = load i8* %a.addr, align 1, !dbg !168
  %conv = sext i8 %1 to i32, !dbg !168
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0), i32 %conv), !dbg !169
  ret void, !dbg !170
}

declare i32 @printf(i8*, ...) #3

; Function Attrs: nounwind uwtable
define void @schedule() #0 {
entry:
  %pkt = alloca %struct.packet*, align 8
  %newtcb = alloca %struct.task*, align 8
  br label %while.cond, !dbg !171

while.cond:                                       ; preds = %sw.epilog, %entry
  %0 = load %struct.task** @tcb, align 8, !dbg !172
  %cmp = icmp ne %struct.task* %0, null, !dbg !172
  br i1 %cmp, label %while.body, label %while.end, !dbg !171

while.body:                                       ; preds = %while.cond
  call void @llvm.dbg.declare(metadata %struct.packet** %pkt, metadata !175, metadata !87), !dbg !177
  call void @llvm.dbg.declare(metadata %struct.task** %newtcb, metadata !178, metadata !87), !dbg !179
  store %struct.packet* null, %struct.packet** %pkt, align 8, !dbg !180
  %1 = load %struct.task** @tcb, align 8, !dbg !181
  %t_state = getelementptr inbounds %struct.task* %1, i32 0, i32 4, !dbg !181
  %2 = load i32* %t_state, align 4, !dbg !181
  switch i32 %2, label %sw.default [
    i32 3, label %sw.bb
    i32 0, label %sw.bb5
    i32 1, label %sw.bb5
    i32 2, label %sw.bb11
    i32 4, label %sw.bb11
    i32 5, label %sw.bb11
    i32 6, label %sw.bb11
    i32 7, label %sw.bb11
  ], !dbg !182

sw.bb:                                            ; preds = %while.body
  %3 = load %struct.task** @tcb, align 8, !dbg !183
  %t_wkq = getelementptr inbounds %struct.task* %3, i32 0, i32 3, !dbg !183
  %4 = load %struct.packet** %t_wkq, align 8, !dbg !183
  store %struct.packet* %4, %struct.packet** %pkt, align 8, !dbg !185
  %5 = load %struct.packet** %pkt, align 8, !dbg !186
  %p_link = getelementptr inbounds %struct.packet* %5, i32 0, i32 0, !dbg !186
  %6 = load %struct.packet** %p_link, align 8, !dbg !186
  %7 = load %struct.task** @tcb, align 8, !dbg !187
  %t_wkq1 = getelementptr inbounds %struct.task* %7, i32 0, i32 3, !dbg !187
  store %struct.packet* %6, %struct.packet** %t_wkq1, align 8, !dbg !187
  %8 = load %struct.task** @tcb, align 8, !dbg !188
  %t_wkq2 = getelementptr inbounds %struct.task* %8, i32 0, i32 3, !dbg !188
  %9 = load %struct.packet** %t_wkq2, align 8, !dbg !188
  %cmp3 = icmp eq %struct.packet* %9, null, !dbg !188
  %cond = select i1 %cmp3, i32 0, i32 1, !dbg !188
  %10 = load %struct.task** @tcb, align 8, !dbg !189
  %t_state4 = getelementptr inbounds %struct.task* %10, i32 0, i32 4, !dbg !189
  store i32 %cond, i32* %t_state4, align 4, !dbg !189
  br label %sw.bb5, !dbg !189

sw.bb5:                                           ; preds = %while.body, %while.body, %sw.bb
  %11 = load %struct.task** @tcb, align 8, !dbg !190
  %t_id = getelementptr inbounds %struct.task* %11, i32 0, i32 1, !dbg !190
  %12 = load i32* %t_id, align 4, !dbg !190
  %conv = sext i32 %12 to i64, !dbg !190
  store i64 %conv, i64* @taskid, align 8, !dbg !191
  %13 = load %struct.task** @tcb, align 8, !dbg !192
  %t_v1 = getelementptr inbounds %struct.task* %13, i32 0, i32 6, !dbg !192
  %14 = load i64* %t_v1, align 8, !dbg !192
  store i64 %14, i64* @v1, align 8, !dbg !193
  %15 = load %struct.task** @tcb, align 8, !dbg !194
  %t_v2 = getelementptr inbounds %struct.task* %15, i32 0, i32 7, !dbg !194
  %16 = load i64* %t_v2, align 8, !dbg !194
  store i64 %16, i64* @v2, align 8, !dbg !195
  %17 = load i32* @tracing, align 4, !dbg !196
  %cmp6 = icmp eq i32 %17, 1, !dbg !196
  br i1 %cmp6, label %if.then, label %if.end, !dbg !198

if.then:                                          ; preds = %sw.bb5
  %18 = load i64* @taskid, align 8, !dbg !199
  %add = add nsw i64 %18, 48, !dbg !199
  %conv8 = trunc i64 %add to i8, !dbg !199
  call void @trace(i8 signext %conv8), !dbg !201
  br label %if.end, !dbg !201

if.end:                                           ; preds = %if.then, %sw.bb5
  %19 = load %struct.task** @tcb, align 8, !dbg !202
  %t_fn = getelementptr inbounds %struct.task* %19, i32 0, i32 5, !dbg !202
  %20 = load %struct.task* (%struct.packet*)** %t_fn, align 8, !dbg !202
  %21 = load %struct.packet** %pkt, align 8, !dbg !203
  %call = call %struct.task* %20(%struct.packet* %21), !dbg !202
  store %struct.task* %call, %struct.task** %newtcb, align 8, !dbg !204
  %22 = load i64* @v1, align 8, !dbg !205
  %23 = load %struct.task** @tcb, align 8, !dbg !206
  %t_v19 = getelementptr inbounds %struct.task* %23, i32 0, i32 6, !dbg !206
  store i64 %22, i64* %t_v19, align 8, !dbg !206
  %24 = load i64* @v2, align 8, !dbg !207
  %25 = load %struct.task** @tcb, align 8, !dbg !208
  %t_v210 = getelementptr inbounds %struct.task* %25, i32 0, i32 7, !dbg !208
  store i64 %24, i64* %t_v210, align 8, !dbg !208
  %26 = load %struct.task** %newtcb, align 8, !dbg !209
  store %struct.task* %26, %struct.task** @tcb, align 8, !dbg !210
  br label %sw.epilog, !dbg !211

sw.bb11:                                          ; preds = %while.body, %while.body, %while.body, %while.body, %while.body
  %27 = load %struct.task** @tcb, align 8, !dbg !212
  %t_link = getelementptr inbounds %struct.task* %27, i32 0, i32 0, !dbg !212
  %28 = load %struct.task** %t_link, align 8, !dbg !212
  store %struct.task* %28, %struct.task** @tcb, align 8, !dbg !213
  br label %sw.epilog, !dbg !214

sw.default:                                       ; preds = %while.body
  br label %while.end, !dbg !215

sw.epilog:                                        ; preds = %sw.bb11, %if.end
  br label %while.cond, !dbg !171

while.end:                                        ; preds = %sw.default, %while.cond
  ret void, !dbg !216
}

; Function Attrs: nounwind uwtable
define %struct.task* @Wait() #0 {
entry:
  %0 = load %struct.task** @tcb, align 8, !dbg !217
  %t_state = getelementptr inbounds %struct.task* %0, i32 0, i32 4, !dbg !217
  %1 = load i32* %t_state, align 4, !dbg !217
  %or = or i32 %1, 2, !dbg !217
  store i32 %or, i32* %t_state, align 4, !dbg !217
  %2 = load %struct.task** @tcb, align 8, !dbg !218
  ret %struct.task* %2, !dbg !219
}

; Function Attrs: nounwind uwtable
define %struct.task* @holdself() #0 {
entry:
  %0 = load i32* @holdcount, align 4, !dbg !220
  %inc = add nsw i32 %0, 1, !dbg !220
  store i32 %inc, i32* @holdcount, align 4, !dbg !220
  %1 = load %struct.task** @tcb, align 8, !dbg !221
  %t_state = getelementptr inbounds %struct.task* %1, i32 0, i32 4, !dbg !221
  %2 = load i32* %t_state, align 4, !dbg !221
  %or = or i32 %2, 4, !dbg !221
  store i32 %or, i32* %t_state, align 4, !dbg !221
  %3 = load %struct.task** @tcb, align 8, !dbg !222
  %t_link = getelementptr inbounds %struct.task* %3, i32 0, i32 0, !dbg !222
  %4 = load %struct.task** %t_link, align 8, !dbg !222
  ret %struct.task* %4, !dbg !223
}

; Function Attrs: nounwind uwtable
define %struct.task* @findtcb(i32 %id) #0 {
entry:
  %id.addr = alloca i32, align 4
  %t = alloca %struct.task*, align 8
  store i32 %id, i32* %id.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %id.addr, metadata !224, metadata !87), !dbg !225
  call void @llvm.dbg.declare(metadata %struct.task** %t, metadata !226, metadata !87), !dbg !227
  store %struct.task* null, %struct.task** %t, align 8, !dbg !227
  %0 = load i32* %id.addr, align 4, !dbg !228
  %cmp = icmp sle i32 1, %0, !dbg !230
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !231

land.lhs.true:                                    ; preds = %entry
  %1 = load i32* %id.addr, align 4, !dbg !232
  %conv = sext i32 %1 to i64, !dbg !232
  %cmp1 = icmp sle i64 %conv, 10, !dbg !232
  br i1 %cmp1, label %if.then, label %if.end, !dbg !231

if.then:                                          ; preds = %land.lhs.true
  %2 = load i32* %id.addr, align 4, !dbg !234
  %idxprom = sext i32 %2 to i64, !dbg !235
  %arrayidx = getelementptr inbounds [11 x %struct.task*]* @tasktab, i32 0, i64 %idxprom, !dbg !235
  %3 = load %struct.task** %arrayidx, align 8, !dbg !235
  store %struct.task* %3, %struct.task** %t, align 8, !dbg !236
  br label %if.end, !dbg !236

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %4 = load %struct.task** %t, align 8, !dbg !237
  %cmp3 = icmp eq %struct.task* %4, null, !dbg !237
  br i1 %cmp3, label %if.then5, label %if.end6, !dbg !239

if.then5:                                         ; preds = %if.end
  %5 = load i32* %id.addr, align 4, !dbg !240
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0), i32 %5), !dbg !242
  br label %if.end6, !dbg !242

if.end6:                                          ; preds = %if.then5, %if.end
  %6 = load %struct.task** %t, align 8, !dbg !243
  ret %struct.task* %6, !dbg !244
}

; Function Attrs: nounwind uwtable
define %struct.task* @release(i32 %id) #0 {
entry:
  %retval = alloca %struct.task*, align 8
  %id.addr = alloca i32, align 4
  %t = alloca %struct.task*, align 8
  store i32 %id, i32* %id.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %id.addr, metadata !245, metadata !87), !dbg !246
  call void @llvm.dbg.declare(metadata %struct.task** %t, metadata !247, metadata !87), !dbg !248
  %0 = load i32* %id.addr, align 4, !dbg !249
  %call = call %struct.task* @findtcb(i32 %0), !dbg !250
  store %struct.task* %call, %struct.task** %t, align 8, !dbg !251
  %1 = load %struct.task** %t, align 8, !dbg !252
  %cmp = icmp eq %struct.task* %1, null, !dbg !252
  br i1 %cmp, label %if.then, label %if.end, !dbg !254

if.then:                                          ; preds = %entry
  store %struct.task* null, %struct.task** %retval, !dbg !255
  br label %return, !dbg !255

if.end:                                           ; preds = %entry
  %2 = load %struct.task** %t, align 8, !dbg !257
  %t_state = getelementptr inbounds %struct.task* %2, i32 0, i32 4, !dbg !257
  %3 = load i32* %t_state, align 4, !dbg !257
  %and = and i32 %3, 65531, !dbg !257
  store i32 %and, i32* %t_state, align 4, !dbg !257
  %4 = load %struct.task** %t, align 8, !dbg !258
  %t_pri = getelementptr inbounds %struct.task* %4, i32 0, i32 2, !dbg !258
  %5 = load i32* %t_pri, align 4, !dbg !258
  %6 = load %struct.task** @tcb, align 8, !dbg !260
  %t_pri1 = getelementptr inbounds %struct.task* %6, i32 0, i32 2, !dbg !260
  %7 = load i32* %t_pri1, align 4, !dbg !260
  %cmp2 = icmp sgt i32 %5, %7, !dbg !258
  br i1 %cmp2, label %if.then3, label %if.end4, !dbg !261

if.then3:                                         ; preds = %if.end
  %8 = load %struct.task** %t, align 8, !dbg !262
  store %struct.task* %8, %struct.task** %retval, !dbg !264
  br label %return, !dbg !264

if.end4:                                          ; preds = %if.end
  %9 = load %struct.task** @tcb, align 8, !dbg !265
  store %struct.task* %9, %struct.task** %retval, !dbg !266
  br label %return, !dbg !266

return:                                           ; preds = %if.end4, %if.then3, %if.then
  %10 = load %struct.task** %retval, !dbg !267
  ret %struct.task* %10, !dbg !267
}

; Function Attrs: nounwind uwtable
define %struct.task* @qpkt(%struct.packet* %pkt) #0 {
entry:
  %retval = alloca %struct.task*, align 8
  %pkt.addr = alloca %struct.packet*, align 8
  %t = alloca %struct.task*, align 8
  store %struct.packet* %pkt, %struct.packet** %pkt.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.packet** %pkt.addr, metadata !268, metadata !87), !dbg !269
  call void @llvm.dbg.declare(metadata %struct.task** %t, metadata !270, metadata !87), !dbg !271
  %0 = load %struct.packet** %pkt.addr, align 8, !dbg !272
  %p_id = getelementptr inbounds %struct.packet* %0, i32 0, i32 1, !dbg !272
  %1 = load i32* %p_id, align 4, !dbg !272
  %call = call %struct.task* @findtcb(i32 %1), !dbg !273
  store %struct.task* %call, %struct.task** %t, align 8, !dbg !274
  %2 = load %struct.task** %t, align 8, !dbg !275
  %cmp = icmp eq %struct.task* %2, null, !dbg !275
  br i1 %cmp, label %if.then, label %if.end, !dbg !277

if.then:                                          ; preds = %entry
  %3 = load %struct.task** %t, align 8, !dbg !278
  store %struct.task* %3, %struct.task** %retval, !dbg !280
  br label %return, !dbg !280

if.end:                                           ; preds = %entry
  %4 = load i32* @qpktcount, align 4, !dbg !281
  %inc = add nsw i32 %4, 1, !dbg !281
  store i32 %inc, i32* @qpktcount, align 4, !dbg !281
  %5 = load %struct.packet** %pkt.addr, align 8, !dbg !282
  %p_link = getelementptr inbounds %struct.packet* %5, i32 0, i32 0, !dbg !282
  store %struct.packet* null, %struct.packet** %p_link, align 8, !dbg !282
  %6 = load i64* @taskid, align 8, !dbg !283
  %conv = trunc i64 %6 to i32, !dbg !283
  %7 = load %struct.packet** %pkt.addr, align 8, !dbg !284
  %p_id1 = getelementptr inbounds %struct.packet* %7, i32 0, i32 1, !dbg !284
  store i32 %conv, i32* %p_id1, align 4, !dbg !284
  %8 = load %struct.task** %t, align 8, !dbg !285
  %t_wkq = getelementptr inbounds %struct.task* %8, i32 0, i32 3, !dbg !285
  %9 = load %struct.packet** %t_wkq, align 8, !dbg !285
  %cmp2 = icmp eq %struct.packet* %9, null, !dbg !285
  br i1 %cmp2, label %if.then4, label %if.else, !dbg !287

if.then4:                                         ; preds = %if.end
  %10 = load %struct.packet** %pkt.addr, align 8, !dbg !288
  %11 = load %struct.task** %t, align 8, !dbg !290
  %t_wkq5 = getelementptr inbounds %struct.task* %11, i32 0, i32 3, !dbg !290
  store %struct.packet* %10, %struct.packet** %t_wkq5, align 8, !dbg !290
  %12 = load %struct.task** %t, align 8, !dbg !291
  %t_state = getelementptr inbounds %struct.task* %12, i32 0, i32 4, !dbg !291
  %13 = load i32* %t_state, align 4, !dbg !291
  %or = or i32 %13, 1, !dbg !291
  store i32 %or, i32* %t_state, align 4, !dbg !291
  %14 = load %struct.task** %t, align 8, !dbg !292
  %t_pri = getelementptr inbounds %struct.task* %14, i32 0, i32 2, !dbg !292
  %15 = load i32* %t_pri, align 4, !dbg !292
  %16 = load %struct.task** @tcb, align 8, !dbg !294
  %t_pri6 = getelementptr inbounds %struct.task* %16, i32 0, i32 2, !dbg !294
  %17 = load i32* %t_pri6, align 4, !dbg !294
  %cmp7 = icmp sgt i32 %15, %17, !dbg !292
  br i1 %cmp7, label %if.then9, label %if.end10, !dbg !295

if.then9:                                         ; preds = %if.then4
  %18 = load %struct.task** %t, align 8, !dbg !296
  store %struct.task* %18, %struct.task** %retval, !dbg !298
  br label %return, !dbg !298

if.end10:                                         ; preds = %if.then4
  br label %if.end12, !dbg !299

if.else:                                          ; preds = %if.end
  %19 = load %struct.packet** %pkt.addr, align 8, !dbg !300
  %20 = load %struct.task** %t, align 8, !dbg !302
  %t_wkq11 = getelementptr inbounds %struct.task* %20, i32 0, i32 3, !dbg !303
  %21 = bitcast %struct.packet** %t_wkq11 to %struct.packet*, !dbg !304
  call void @append(%struct.packet* %19, %struct.packet* %21), !dbg !305
  br label %if.end12

if.end12:                                         ; preds = %if.else, %if.end10
  %22 = load %struct.task** @tcb, align 8, !dbg !306
  store %struct.task* %22, %struct.task** %retval, !dbg !307
  br label %return, !dbg !307

return:                                           ; preds = %if.end12, %if.then9, %if.then
  %23 = load %struct.task** %retval, !dbg !308
  ret %struct.task* %23, !dbg !308
}

; Function Attrs: nounwind uwtable
define void @append(%struct.packet* %pkt, %struct.packet* %ptr) #0 {
entry:
  %pkt.addr = alloca %struct.packet*, align 8
  %ptr.addr = alloca %struct.packet*, align 8
  store %struct.packet* %pkt, %struct.packet** %pkt.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.packet** %pkt.addr, metadata !309, metadata !87), !dbg !310
  store %struct.packet* %ptr, %struct.packet** %ptr.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.packet** %ptr.addr, metadata !311, metadata !87), !dbg !312
  %0 = load %struct.packet** %pkt.addr, align 8, !dbg !313
  %p_link = getelementptr inbounds %struct.packet* %0, i32 0, i32 0, !dbg !313
  store %struct.packet* null, %struct.packet** %p_link, align 8, !dbg !313
  br label %while.cond, !dbg !314

while.cond:                                       ; preds = %while.body, %entry
  %1 = load %struct.packet** %ptr.addr, align 8, !dbg !315
  %p_link1 = getelementptr inbounds %struct.packet* %1, i32 0, i32 0, !dbg !315
  %2 = load %struct.packet** %p_link1, align 8, !dbg !315
  %tobool = icmp ne %struct.packet* %2, null, !dbg !314
  br i1 %tobool, label %while.body, label %while.end, !dbg !314

while.body:                                       ; preds = %while.cond
  %3 = load %struct.packet** %ptr.addr, align 8, !dbg !318
  %p_link2 = getelementptr inbounds %struct.packet* %3, i32 0, i32 0, !dbg !318
  %4 = load %struct.packet** %p_link2, align 8, !dbg !318
  store %struct.packet* %4, %struct.packet** %ptr.addr, align 8, !dbg !320
  br label %while.cond, !dbg !314

while.end:                                        ; preds = %while.cond
  %5 = load %struct.packet** %pkt.addr, align 8, !dbg !321
  %6 = load %struct.packet** %ptr.addr, align 8, !dbg !322
  %p_link3 = getelementptr inbounds %struct.packet* %6, i32 0, i32 0, !dbg !322
  store %struct.packet* %5, %struct.packet** %p_link3, align 8, !dbg !322
  ret void, !dbg !323
}

; Function Attrs: nounwind uwtable
define %struct.task* @idlefn(%struct.packet* %pkt) #0 {
entry:
  %retval = alloca %struct.task*, align 8
  %pkt.addr = alloca %struct.packet*, align 8
  store %struct.packet* %pkt, %struct.packet** %pkt.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.packet** %pkt.addr, metadata !324, metadata !87), !dbg !325
  %0 = load i64* @v2, align 8, !dbg !326
  %dec = add nsw i64 %0, -1, !dbg !326
  store i64 %dec, i64* @v2, align 8, !dbg !326
  %1 = load i64* @v2, align 8, !dbg !327
  %cmp = icmp eq i64 %1, 0, !dbg !327
  br i1 %cmp, label %if.then, label %if.end, !dbg !329

if.then:                                          ; preds = %entry
  %call = call %struct.task* @holdself(), !dbg !330
  store %struct.task* %call, %struct.task** %retval, !dbg !332
  br label %return, !dbg !332

if.end:                                           ; preds = %entry
  %2 = load i64* @v1, align 8, !dbg !333
  %and = and i64 %2, 1, !dbg !333
  %cmp1 = icmp eq i64 %and, 0, !dbg !335
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !336

if.then2:                                         ; preds = %if.end
  %3 = load i64* @v1, align 8, !dbg !337
  %shr = ashr i64 %3, 1, !dbg !337
  %and3 = and i64 %shr, 32767, !dbg !339
  store i64 %and3, i64* @v1, align 8, !dbg !340
  %call4 = call %struct.task* @release(i32 5), !dbg !341
  store %struct.task* %call4, %struct.task** %retval, !dbg !342
  br label %return, !dbg !342

if.else:                                          ; preds = %if.end
  %4 = load i64* @v1, align 8, !dbg !343
  %shr5 = ashr i64 %4, 1, !dbg !343
  %and6 = and i64 %shr5, 32767, !dbg !345
  %xor = xor i64 %and6, 53256, !dbg !346
  store i64 %xor, i64* @v1, align 8, !dbg !347
  %call7 = call %struct.task* @release(i32 6), !dbg !348
  store %struct.task* %call7, %struct.task** %retval, !dbg !349
  br label %return, !dbg !349

return:                                           ; preds = %if.else, %if.then2, %if.then
  %5 = load %struct.task** %retval, !dbg !350
  ret %struct.task* %5, !dbg !350
}

; Function Attrs: nounwind uwtable
define %struct.task* @workfn(%struct.packet* %pkt) #0 {
entry:
  %retval = alloca %struct.task*, align 8
  %pkt.addr = alloca %struct.packet*, align 8
  %i = alloca i32, align 4
  store %struct.packet* %pkt, %struct.packet** %pkt.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.packet** %pkt.addr, metadata !351, metadata !87), !dbg !352
  %0 = load %struct.packet** %pkt.addr, align 8, !dbg !353
  %cmp = icmp eq %struct.packet* %0, null, !dbg !353
  br i1 %cmp, label %if.then, label %if.else, !dbg !355

if.then:                                          ; preds = %entry
  %call = call %struct.task* @Wait(), !dbg !356
  store %struct.task* %call, %struct.task** %retval, !dbg !358
  br label %return, !dbg !358

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !359, metadata !87), !dbg !361
  %1 = load i64* @v1, align 8, !dbg !362
  %sub = sub nsw i64 7, %1, !dbg !363
  store i64 %sub, i64* @v1, align 8, !dbg !364
  %2 = load i64* @v1, align 8, !dbg !365
  %conv = trunc i64 %2 to i32, !dbg !365
  %3 = load %struct.packet** %pkt.addr, align 8, !dbg !366
  %p_id = getelementptr inbounds %struct.packet* %3, i32 0, i32 1, !dbg !366
  store i32 %conv, i32* %p_id, align 4, !dbg !366
  %4 = load %struct.packet** %pkt.addr, align 8, !dbg !367
  %p_a1 = getelementptr inbounds %struct.packet* %4, i32 0, i32 3, !dbg !367
  store i32 0, i32* %p_a1, align 4, !dbg !367
  store i32 0, i32* %i, align 4, !dbg !368
  br label %for.cond, !dbg !368

for.cond:                                         ; preds = %for.inc, %if.else
  %5 = load i32* %i, align 4, !dbg !370
  %cmp1 = icmp sle i32 %5, 3, !dbg !370
  br i1 %cmp1, label %for.body, label %for.end, !dbg !374

for.body:                                         ; preds = %for.cond
  %6 = load i64* @v2, align 8, !dbg !375
  %inc = add nsw i64 %6, 1, !dbg !375
  store i64 %inc, i64* @v2, align 8, !dbg !375
  %7 = load i64* @v2, align 8, !dbg !377
  %cmp3 = icmp sgt i64 %7, 26, !dbg !377
  br i1 %cmp3, label %if.then5, label %if.end, !dbg !379

if.then5:                                         ; preds = %for.body
  store i64 1, i64* @v2, align 8, !dbg !380
  br label %if.end, !dbg !380

if.end:                                           ; preds = %if.then5, %for.body
  %8 = load i64* @v2, align 8, !dbg !382
  %arrayidx = getelementptr inbounds [28 x i8]* @alphabet, i32 0, i64 %8, !dbg !383
  %9 = load i8* %arrayidx, align 1, !dbg !383
  %10 = load i32* %i, align 4, !dbg !384
  %idxprom = sext i32 %10 to i64, !dbg !385
  %11 = load %struct.packet** %pkt.addr, align 8, !dbg !386
  %p_a2 = getelementptr inbounds %struct.packet* %11, i32 0, i32 4, !dbg !385
  %arrayidx6 = getelementptr inbounds [4 x i8]* %p_a2, i32 0, i64 %idxprom, !dbg !385
  store i8 %9, i8* %arrayidx6, align 1, !dbg !385
  br label %for.inc, !dbg !387

for.inc:                                          ; preds = %if.end
  %12 = load i32* %i, align 4, !dbg !388
  %inc7 = add nsw i32 %12, 1, !dbg !388
  store i32 %inc7, i32* %i, align 4, !dbg !388
  br label %for.cond, !dbg !389

for.end:                                          ; preds = %for.cond
  %13 = load %struct.packet** %pkt.addr, align 8, !dbg !390
  %call8 = call %struct.task* @qpkt(%struct.packet* %13), !dbg !391
  store %struct.task* %call8, %struct.task** %retval, !dbg !392
  br label %return, !dbg !392

return:                                           ; preds = %for.end, %if.then
  %14 = load %struct.task** %retval, !dbg !393
  ret %struct.task* %14, !dbg !393
}

; Function Attrs: nounwind uwtable
define %struct.task* @handlerfn(%struct.packet* %pkt) #0 {
entry:
  %retval = alloca %struct.task*, align 8
  %pkt.addr = alloca %struct.packet*, align 8
  %count = alloca i32, align 4
  %workpkt = alloca %struct.packet*, align 8
  %devpkt = alloca %struct.packet*, align 8
  store %struct.packet* %pkt, %struct.packet** %pkt.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.packet** %pkt.addr, metadata !394, metadata !87), !dbg !395
  %0 = load %struct.packet** %pkt.addr, align 8, !dbg !396
  %cmp = icmp ne %struct.packet* %0, null, !dbg !396
  br i1 %cmp, label %if.then, label %if.end, !dbg !398

if.then:                                          ; preds = %entry
  %1 = load %struct.packet** %pkt.addr, align 8, !dbg !399
  %2 = load %struct.packet** %pkt.addr, align 8, !dbg !401
  %p_kind = getelementptr inbounds %struct.packet* %2, i32 0, i32 2, !dbg !401
  %3 = load i32* %p_kind, align 4, !dbg !401
  %cmp1 = icmp eq i32 %3, 1001, !dbg !401
  %cond = select i1 %cmp1, i64* @v1, i64* @v2, !dbg !401
  %4 = bitcast i64* %cond to %struct.packet*, !dbg !402
  call void @append(%struct.packet* %1, %struct.packet* %4), !dbg !403
  br label %if.end, !dbg !403

if.end:                                           ; preds = %if.then, %entry
  %5 = load i64* @v1, align 8, !dbg !404
  %cmp2 = icmp ne i64 %5, 0, !dbg !404
  br i1 %cmp2, label %if.then3, label %if.end14, !dbg !406

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %count, metadata !407, metadata !87), !dbg !409
  call void @llvm.dbg.declare(metadata %struct.packet** %workpkt, metadata !410, metadata !87), !dbg !411
  %6 = load i64* @v1, align 8, !dbg !412
  %7 = inttoptr i64 %6 to %struct.packet*, !dbg !413
  store %struct.packet* %7, %struct.packet** %workpkt, align 8, !dbg !411
  %8 = load %struct.packet** %workpkt, align 8, !dbg !414
  %p_a1 = getelementptr inbounds %struct.packet* %8, i32 0, i32 3, !dbg !414
  %9 = load i32* %p_a1, align 4, !dbg !414
  store i32 %9, i32* %count, align 4, !dbg !415
  %10 = load i32* %count, align 4, !dbg !416
  %cmp4 = icmp sgt i32 %10, 3, !dbg !416
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !418

if.then5:                                         ; preds = %if.then3
  %11 = load i64* @v1, align 8, !dbg !419
  %12 = inttoptr i64 %11 to %struct.packet*, !dbg !421
  %p_link = getelementptr inbounds %struct.packet* %12, i32 0, i32 0, !dbg !422
  %13 = load %struct.packet** %p_link, align 8, !dbg !422
  %14 = ptrtoint %struct.packet* %13 to i64, !dbg !423
  store i64 %14, i64* @v1, align 8, !dbg !424
  %15 = load %struct.packet** %workpkt, align 8, !dbg !425
  %call = call %struct.task* @qpkt(%struct.packet* %15), !dbg !426
  store %struct.task* %call, %struct.task** %retval, !dbg !427
  br label %return, !dbg !427

if.end6:                                          ; preds = %if.then3
  %16 = load i64* @v2, align 8, !dbg !428
  %cmp7 = icmp ne i64 %16, 0, !dbg !428
  br i1 %cmp7, label %if.then8, label %if.end13, !dbg !430

if.then8:                                         ; preds = %if.end6
  call void @llvm.dbg.declare(metadata %struct.packet** %devpkt, metadata !431, metadata !87), !dbg !433
  %17 = load i64* @v2, align 8, !dbg !434
  %18 = inttoptr i64 %17 to %struct.packet*, !dbg !435
  store %struct.packet* %18, %struct.packet** %devpkt, align 8, !dbg !436
  %19 = load i64* @v2, align 8, !dbg !437
  %20 = inttoptr i64 %19 to %struct.packet*, !dbg !438
  %p_link9 = getelementptr inbounds %struct.packet* %20, i32 0, i32 0, !dbg !439
  %21 = load %struct.packet** %p_link9, align 8, !dbg !439
  %22 = ptrtoint %struct.packet* %21 to i64, !dbg !440
  store i64 %22, i64* @v2, align 8, !dbg !441
  %23 = load i32* %count, align 4, !dbg !442
  %idxprom = sext i32 %23 to i64, !dbg !443
  %24 = load %struct.packet** %workpkt, align 8, !dbg !443
  %p_a2 = getelementptr inbounds %struct.packet* %24, i32 0, i32 4, !dbg !443
  %arrayidx = getelementptr inbounds [4 x i8]* %p_a2, i32 0, i64 %idxprom, !dbg !443
  %25 = load i8* %arrayidx, align 1, !dbg !443
  %conv = sext i8 %25 to i32, !dbg !443
  %26 = load %struct.packet** %devpkt, align 8, !dbg !444
  %p_a110 = getelementptr inbounds %struct.packet* %26, i32 0, i32 3, !dbg !444
  store i32 %conv, i32* %p_a110, align 4, !dbg !444
  %27 = load i32* %count, align 4, !dbg !445
  %add = add nsw i32 %27, 1, !dbg !445
  %28 = load %struct.packet** %workpkt, align 8, !dbg !446
  %p_a111 = getelementptr inbounds %struct.packet* %28, i32 0, i32 3, !dbg !446
  store i32 %add, i32* %p_a111, align 4, !dbg !446
  %29 = load %struct.packet** %devpkt, align 8, !dbg !447
  %call12 = call %struct.task* @qpkt(%struct.packet* %29), !dbg !448
  store %struct.task* %call12, %struct.task** %retval, !dbg !449
  br label %return, !dbg !449

if.end13:                                         ; preds = %if.end6
  br label %if.end14, !dbg !450

if.end14:                                         ; preds = %if.end13, %if.end
  %call15 = call %struct.task* @Wait(), !dbg !451
  store %struct.task* %call15, %struct.task** %retval, !dbg !452
  br label %return, !dbg !452

return:                                           ; preds = %if.end14, %if.then8, %if.then5
  %30 = load %struct.task** %retval, !dbg !453
  ret %struct.task* %30, !dbg !453
}

; Function Attrs: nounwind uwtable
define %struct.task* @devfn(%struct.packet* %pkt) #0 {
entry:
  %retval = alloca %struct.task*, align 8
  %pkt.addr = alloca %struct.packet*, align 8
  store %struct.packet* %pkt, %struct.packet** %pkt.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.packet** %pkt.addr, metadata !454, metadata !87), !dbg !455
  %0 = load %struct.packet** %pkt.addr, align 8, !dbg !456
  %cmp = icmp eq %struct.packet* %0, null, !dbg !456
  br i1 %cmp, label %if.then, label %if.else, !dbg !458

if.then:                                          ; preds = %entry
  %1 = load i64* @v1, align 8, !dbg !459
  %cmp1 = icmp eq i64 %1, 0, !dbg !459
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !462

if.then2:                                         ; preds = %if.then
  %call = call %struct.task* @Wait(), !dbg !463
  store %struct.task* %call, %struct.task** %retval, !dbg !465
  br label %return, !dbg !465

if.end:                                           ; preds = %if.then
  %2 = load i64* @v1, align 8, !dbg !466
  %3 = inttoptr i64 %2 to %struct.packet*, !dbg !467
  store %struct.packet* %3, %struct.packet** %pkt.addr, align 8, !dbg !468
  store i64 0, i64* @v1, align 8, !dbg !469
  %4 = load %struct.packet** %pkt.addr, align 8, !dbg !470
  %call3 = call %struct.task* @qpkt(%struct.packet* %4), !dbg !471
  store %struct.task* %call3, %struct.task** %retval, !dbg !472
  br label %return, !dbg !472

if.else:                                          ; preds = %entry
  %5 = load %struct.packet** %pkt.addr, align 8, !dbg !473
  %6 = ptrtoint %struct.packet* %5 to i64, !dbg !475
  store i64 %6, i64* @v1, align 8, !dbg !476
  %7 = load i32* @tracing, align 4, !dbg !477
  %cmp4 = icmp eq i32 %7, 1, !dbg !477
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !479

if.then5:                                         ; preds = %if.else
  %8 = load %struct.packet** %pkt.addr, align 8, !dbg !480
  %p_a1 = getelementptr inbounds %struct.packet* %8, i32 0, i32 3, !dbg !480
  %9 = load i32* %p_a1, align 4, !dbg !480
  %conv = trunc i32 %9 to i8, !dbg !480
  call void @trace(i8 signext %conv), !dbg !482
  br label %if.end6, !dbg !482

if.end6:                                          ; preds = %if.then5, %if.else
  %call7 = call %struct.task* @holdself(), !dbg !483
  store %struct.task* %call7, %struct.task** %retval, !dbg !484
  br label %return, !dbg !484

return:                                           ; preds = %if.end6, %if.end, %if.then2
  %10 = load %struct.task** %retval, !dbg !485
  ret %struct.task* %10, !dbg !485
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %wkq = alloca %struct.packet*, align 8
  %retval1 = alloca i32, align 4
  store i32 0, i32* %retval
  call void @llvm.dbg.declare(metadata %struct.packet** %wkq, metadata !486, metadata !87), !dbg !487
  store %struct.packet* null, %struct.packet** %wkq, align 8, !dbg !487
  call void @llvm.dbg.declare(metadata i32* %retval1, metadata !488, metadata !87), !dbg !489
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str3, i32 0, i32 0)), !dbg !490
  %0 = load %struct.packet** %wkq, align 8, !dbg !491
  call void @createtask(i32 1, i32 0, %struct.packet* %0, i32 0, %struct.task* (%struct.packet*)* @idlefn, i64 1, i64 10000000), !dbg !492
  %call2 = call %struct.packet* @pkt(%struct.packet* null, i32 0, i32 1001), !dbg !493
  store %struct.packet* %call2, %struct.packet** %wkq, align 8, !dbg !494
  %1 = load %struct.packet** %wkq, align 8, !dbg !495
  %call3 = call %struct.packet* @pkt(%struct.packet* %1, i32 0, i32 1001), !dbg !496
  store %struct.packet* %call3, %struct.packet** %wkq, align 8, !dbg !497
  %2 = load %struct.packet** %wkq, align 8, !dbg !498
  call void @createtask(i32 2, i32 1000, %struct.packet* %2, i32 3, %struct.task* (%struct.packet*)* @workfn, i64 3, i64 0), !dbg !499
  %call4 = call %struct.packet* @pkt(%struct.packet* null, i32 5, i32 1000), !dbg !500
  store %struct.packet* %call4, %struct.packet** %wkq, align 8, !dbg !501
  %3 = load %struct.packet** %wkq, align 8, !dbg !502
  %call5 = call %struct.packet* @pkt(%struct.packet* %3, i32 5, i32 1000), !dbg !503
  store %struct.packet* %call5, %struct.packet** %wkq, align 8, !dbg !504
  %4 = load %struct.packet** %wkq, align 8, !dbg !505
  %call6 = call %struct.packet* @pkt(%struct.packet* %4, i32 5, i32 1000), !dbg !506
  store %struct.packet* %call6, %struct.packet** %wkq, align 8, !dbg !507
  %5 = load %struct.packet** %wkq, align 8, !dbg !508
  call void @createtask(i32 3, i32 2000, %struct.packet* %5, i32 3, %struct.task* (%struct.packet*)* @handlerfn, i64 0, i64 0), !dbg !509
  %call7 = call %struct.packet* @pkt(%struct.packet* null, i32 6, i32 1000), !dbg !510
  store %struct.packet* %call7, %struct.packet** %wkq, align 8, !dbg !511
  %6 = load %struct.packet** %wkq, align 8, !dbg !512
  %call8 = call %struct.packet* @pkt(%struct.packet* %6, i32 6, i32 1000), !dbg !513
  store %struct.packet* %call8, %struct.packet** %wkq, align 8, !dbg !514
  %7 = load %struct.packet** %wkq, align 8, !dbg !515
  %call9 = call %struct.packet* @pkt(%struct.packet* %7, i32 6, i32 1000), !dbg !516
  store %struct.packet* %call9, %struct.packet** %wkq, align 8, !dbg !517
  %8 = load %struct.packet** %wkq, align 8, !dbg !518
  call void @createtask(i32 4, i32 3000, %struct.packet* %8, i32 3, %struct.task* (%struct.packet*)* @handlerfn, i64 0, i64 0), !dbg !519
  store %struct.packet* null, %struct.packet** %wkq, align 8, !dbg !520
  %9 = load %struct.packet** %wkq, align 8, !dbg !521
  call void @createtask(i32 5, i32 4000, %struct.packet* %9, i32 2, %struct.task* (%struct.packet*)* @devfn, i64 0, i64 0), !dbg !522
  %10 = load %struct.packet** %wkq, align 8, !dbg !523
  call void @createtask(i32 6, i32 5000, %struct.packet* %10, i32 2, %struct.task* (%struct.packet*)* @devfn, i64 0, i64 0), !dbg !524
  %11 = load %struct.task** @tasklist, align 8, !dbg !525
  store %struct.task* %11, %struct.task** @tcb, align 8, !dbg !526
  store i32 0, i32* @holdcount, align 4, !dbg !527
  store i32 0, i32* @qpktcount, align 4, !dbg !528
  %call10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str4, i32 0, i32 0)), !dbg !529
  store i32 0, i32* @tracing, align 4, !dbg !530
  store i32 0, i32* @layout, align 4, !dbg !531
  call void @schedule(), !dbg !532
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str5, i32 0, i32 0)), !dbg !533
  %12 = load i32* @qpktcount, align 4, !dbg !534
  %13 = load i32* @holdcount, align 4, !dbg !535
  %call12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str6, i32 0, i32 0), i32 %12, i32 %13), !dbg !536
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str7, i32 0, i32 0)), !dbg !537
  %14 = load i32* @qpktcount, align 4, !dbg !538
  %cmp = icmp eq i32 %14, 23263894, !dbg !538
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !540

land.lhs.true:                                    ; preds = %entry
  %15 = load i32* @holdcount, align 4, !dbg !541
  %cmp14 = icmp eq i32 %15, 9305557, !dbg !541
  br i1 %cmp14, label %if.then, label %if.else, !dbg !540

if.then:                                          ; preds = %land.lhs.true
  %call15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str8, i32 0, i32 0)), !dbg !543
  store i32 0, i32* %retval1, align 4, !dbg !545
  br label %if.end, !dbg !546

if.else:                                          ; preds = %land.lhs.true, %entry
  %call16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str9, i32 0, i32 0)), !dbg !547
  store i32 1, i32* %retval1, align 4, !dbg !549
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str10, i32 0, i32 0)), !dbg !550
  %16 = load i32* %retval1, align 4, !dbg !551
  ret i32 %16, !dbg !552
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!83, !84}
!llvm.ident = !{!85}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\000\00\000\00\001", !1, !2, !3, !32, !65, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c] [DW_LANG_C99]
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
!32 = !{!33, !37, !40, !43, !46, !49, !50, !53, !54, !55, !56, !57, !58, !59, !62}
!33 = !{!"0x2e\00createtask\00createtask\00\00100\000\001\000\000\00256\000\00107", !1, !34, !35, null, void (i32, i32, %struct.packet*, i32, %struct.task* (%struct.packet*)*, i64, i64)* @createtask, null, null, !2} ; [ DW_TAG_subprogram ] [line 100] [def] [scope 107] [createtask]
!34 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!35 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !36, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!36 = !{null, !9, !9, !12, !9, !26, !30, !30}
!37 = !{!"0x2e\00pkt\00pkt\00\00122\000\001\000\000\00256\000\00123", !1, !34, !38, null, %struct.packet* (%struct.packet*, i32, i32)* @pkt, null, null, !2} ; [ DW_TAG_subprogram ] [line 122] [def] [scope 123] [pkt]
!38 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !39, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!39 = !{!12, !12, !9, !9}
!40 = !{!"0x2e\00trace\00trace\00\00138\000\001\000\000\00256\000\00139", !1, !34, !41, null, void (i8)* @trace, null, null, !2} ; [ DW_TAG_subprogram ] [line 138] [def] [scope 139] [trace]
!41 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !42, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!42 = !{null, !21}
!43 = !{!"0x2e\00schedule\00schedule\00\00149\000\001\000\000\000\000\00150", !1, !34, !44, null, void ()* @schedule, null, null, !2} ; [ DW_TAG_subprogram ] [line 149] [def] [scope 150] [schedule]
!44 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !45, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!45 = !{null}
!46 = !{!"0x2e\00Wait\00Wait\00\00192\000\001\000\000\00256\000\00193", !1, !34, !47, null, %struct.task* ()* @Wait, null, null, !2} ; [ DW_TAG_subprogram ] [line 192] [def] [scope 193] [Wait]
!47 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !48, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!48 = !{!4}
!49 = !{!"0x2e\00holdself\00holdself\00\00198\000\001\000\000\00256\000\00199", !1, !34, !47, null, %struct.task* ()* @holdself, null, null, !2} ; [ DW_TAG_subprogram ] [line 198] [def] [scope 199] [holdself]
!50 = !{!"0x2e\00findtcb\00findtcb\00\00205\000\001\000\000\00256\000\00206", !1, !34, !51, null, %struct.task* (i32)* @findtcb, null, null, !2} ; [ DW_TAG_subprogram ] [line 205] [def] [scope 206] [findtcb]
!51 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !52, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!52 = !{!4, !9}
!53 = !{!"0x2e\00release\00release\00\00215\000\001\000\000\00256\000\00216", !1, !34, !51, null, %struct.task* (i32)* @release, null, null, !2} ; [ DW_TAG_subprogram ] [line 215] [def] [scope 216] [release]
!54 = !{!"0x2e\00qpkt\00qpkt\00\00229\000\001\000\000\00256\000\00230", !1, !34, !27, null, %struct.task* (%struct.packet*)* @qpkt, null, null, !2} ; [ DW_TAG_subprogram ] [line 229] [def] [scope 230] [qpkt]
!55 = !{!"0x2e\00idlefn\00idlefn\00\00255\000\001\000\000\00256\000\00256", !1, !34, !27, null, %struct.task* (%struct.packet*)* @idlefn, null, null, !2} ; [ DW_TAG_subprogram ] [line 255] [def] [scope 256] [idlefn]
!56 = !{!"0x2e\00workfn\00workfn\00\00272\000\001\000\000\00256\000\00273", !1, !34, !27, null, %struct.task* (%struct.packet*)* @workfn, null, null, !2} ; [ DW_TAG_subprogram ] [line 272] [def] [scope 273] [workfn]
!57 = !{!"0x2e\00handlerfn\00handlerfn\00\00293\000\001\000\000\00256\000\00294", !1, !34, !27, null, %struct.task* (%struct.packet*)* @handlerfn, null, null, !2} ; [ DW_TAG_subprogram ] [line 293] [def] [scope 294] [handlerfn]
!58 = !{!"0x2e\00devfn\00devfn\00\00324\000\001\000\000\00256\000\00325", !1, !34, !27, null, %struct.task* (%struct.packet*)* @devfn, null, null, !2} ; [ DW_TAG_subprogram ] [line 324] [def] [scope 325] [devfn]
!59 = !{!"0x2e\00append\00append\00\00341\000\001\000\000\00256\000\00342", !1, !34, !60, null, void (%struct.packet*, %struct.packet*)* @append, null, null, !2} ; [ DW_TAG_subprogram ] [line 341] [def] [scope 342] [append]
!60 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !61, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!61 = !{null, !12, !12}
!62 = !{!"0x2e\00main\00main\00\00350\000\001\000\000\000\000\00351", !1, !34, !63, null, i32 ()* @main, null, null, !2} ; [ DW_TAG_subprogram ] [line 350] [def] [scope 351] [main]
!63 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !64, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!64 = !{!9}
!65 = !{!66, !70, !74, !75, !76, !77, !78, !79, !80, !81, !82}
!66 = !{!"0x34\00alphabet\00alphabet\00\0086\000\001", null, !34, !67, [28 x i8]* @alphabet, null} ; [ DW_TAG_variable ] [alphabet] [line 86] [def]
!67 = !{!"0x1\00\000\00224\008\000\000\000", null, null, !21, !68, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 224, align 8, offset 0] [from char]
!68 = !{!69}
!69 = !{!"0x21\000\0028"}                         ; [ DW_TAG_subrange_type ] [0, 27]
!70 = !{!"0x34\00tasktab\00tasktab\00\0087\000\001", null, !34, !71, [11 x %struct.task*]* @tasktab, null} ; [ DW_TAG_variable ] [tasktab] [line 87] [def]
!71 = !{!"0x1\00\000\00704\0064\000\000\000", null, null, !4, !72, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 704, align 64, offset 0] [from ]
!72 = !{!73}
!73 = !{!"0x21\000\0011"}                         ; [ DW_TAG_subrange_type ] [0, 10]
!74 = !{!"0x34\00tasklist\00tasklist\00\0088\000\001", null, !34, !4, %struct.task** @tasklist, null} ; [ DW_TAG_variable ] [tasklist] [line 88] [def]
!75 = !{!"0x34\00qpktcount\00qpktcount\00\0093\000\001", null, !34, !9, i32* @qpktcount, null} ; [ DW_TAG_variable ] [qpktcount] [line 93] [def]
!76 = !{!"0x34\00holdcount\00holdcount\00\0094\000\001", null, !34, !9, i32* @holdcount, null} ; [ DW_TAG_variable ] [holdcount] [line 94] [def]
!77 = !{!"0x34\00tracing\00tracing\00\0095\000\001", null, !34, !9, i32* @tracing, null} ; [ DW_TAG_variable ] [tracing] [line 95] [def]
!78 = !{!"0x34\00layout\00layout\00\0096\000\001", null, !34, !9, i32* @layout, null} ; [ DW_TAG_variable ] [layout] [line 96] [def]
!79 = !{!"0x34\00tcb\00tcb\00\0089\000\001", null, !34, !4, %struct.task** @tcb, null} ; [ DW_TAG_variable ] [tcb] [line 89] [def]
!80 = !{!"0x34\00taskid\00taskid\00\0090\000\001", null, !34, !30, i64* @taskid, null} ; [ DW_TAG_variable ] [taskid] [line 90] [def]
!81 = !{!"0x34\00v1\00v1\00\0091\000\001", null, !34, !30, i64* @v1, null} ; [ DW_TAG_variable ] [v1] [line 91] [def]
!82 = !{!"0x34\00v2\00v2\00\0092\000\001", null, !34, !30, i64* @v2, null} ; [ DW_TAG_variable ] [v2] [line 92] [def]
!83 = !{i32 2, !"Dwarf Version", i32 4}
!84 = !{i32 2, !"Debug Info Version", i32 2}
!85 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!86 = !{!"0x101\00id\0016777316\000", !33, !34, !9} ; [ DW_TAG_arg_variable ] [id] [line 100]
!87 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!88 = !MDLocation(line: 100, column: 21, scope: !33)
!89 = !{!"0x101\00pri\0033554533\000", !33, !34, !9} ; [ DW_TAG_arg_variable ] [pri] [line 101]
!90 = !MDLocation(line: 101, column: 21, scope: !33)
!91 = !{!"0x101\00wkq\0050331750\000", !33, !34, !12} ; [ DW_TAG_arg_variable ] [wkq] [line 102]
!92 = !MDLocation(line: 102, column: 32, scope: !33)
!93 = !{!"0x101\00state\0067108967\000", !33, !34, !9} ; [ DW_TAG_arg_variable ] [state] [line 103]
!94 = !MDLocation(line: 103, column: 21, scope: !33)
!95 = !{!"0x101\00fn\0083886184\000", !33, !34, !26} ; [ DW_TAG_arg_variable ] [fn] [line 104]
!96 = !MDLocation(line: 104, column: 32, scope: !33)
!97 = !{!"0x101\00v1\00100663401\000", !33, !34, !30} ; [ DW_TAG_arg_variable ] [v1] [line 105]
!98 = !MDLocation(line: 105, column: 22, scope: !33)
!99 = !{!"0x101\00v2\00117440618\000", !33, !34, !30} ; [ DW_TAG_arg_variable ] [v2] [line 106]
!100 = !MDLocation(line: 106, column: 22, scope: !33)
!101 = !{!"0x100\00t\00108\000", !33, !34, !4}    ; [ DW_TAG_auto_variable ] [t] [line 108]
!102 = !MDLocation(line: 108, column: 18, scope: !33)
!103 = !MDLocation(line: 108, column: 37, scope: !33)
!104 = !MDLocation(line: 108, column: 22, scope: !33)
!105 = !MDLocation(line: 110, column: 19, scope: !33)
!106 = !MDLocation(line: 110, column: 13, scope: !33)
!107 = !MDLocation(line: 110, column: 5, scope: !33)
!108 = !MDLocation(line: 111, column: 19, scope: !33)
!109 = !MDLocation(line: 111, column: 5, scope: !33)
!110 = !MDLocation(line: 112, column: 19, scope: !33)
!111 = !MDLocation(line: 112, column: 5, scope: !33)
!112 = !MDLocation(line: 113, column: 19, scope: !33)
!113 = !MDLocation(line: 113, column: 5, scope: !33)
!114 = !MDLocation(line: 114, column: 19, scope: !33)
!115 = !MDLocation(line: 114, column: 5, scope: !33)
!116 = !MDLocation(line: 115, column: 19, scope: !33)
!117 = !MDLocation(line: 115, column: 5, scope: !33)
!118 = !MDLocation(line: 116, column: 19, scope: !33)
!119 = !MDLocation(line: 116, column: 5, scope: !33)
!120 = !MDLocation(line: 117, column: 19, scope: !33)
!121 = !MDLocation(line: 117, column: 5, scope: !33)
!122 = !MDLocation(line: 118, column: 19, scope: !33)
!123 = !MDLocation(line: 118, column: 5, scope: !33)
!124 = !MDLocation(line: 119, column: 19, scope: !33)
!125 = !MDLocation(line: 119, column: 5, scope: !33)
!126 = !MDLocation(line: 120, column: 1, scope: !33)
!127 = !{!"0x101\00link\0016777338\000", !37, !34, !12} ; [ DW_TAG_arg_variable ] [link] [line 122]
!128 = !MDLocation(line: 122, column: 35, scope: !37)
!129 = !{!"0x101\00id\0033554554\000", !37, !34, !9} ; [ DW_TAG_arg_variable ] [id] [line 122]
!130 = !MDLocation(line: 122, column: 45, scope: !37)
!131 = !{!"0x101\00kind\0050331770\000", !37, !34, !9} ; [ DW_TAG_arg_variable ] [kind] [line 122]
!132 = !MDLocation(line: 122, column: 53, scope: !37)
!133 = !{!"0x100\00i\00124\000", !37, !34, !9}    ; [ DW_TAG_auto_variable ] [i] [line 124]
!134 = !MDLocation(line: 124, column: 9, scope: !37)
!135 = !{!"0x100\00p\00125\000", !37, !34, !12}   ; [ DW_TAG_auto_variable ] [p] [line 125]
!136 = !MDLocation(line: 125, column: 20, scope: !37)
!137 = !MDLocation(line: 125, column: 41, scope: !37)
!138 = !MDLocation(line: 125, column: 24, scope: !37)
!139 = !MDLocation(line: 127, column: 10, scope: !140)
!140 = !{!"0xb\00127\005\000", !1, !37}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!141 = !MDLocation(line: 127, column: 15, scope: !142)
!142 = !{!"0xb\002", !1, !143}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!143 = !{!"0xb\001", !1, !144}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!144 = !{!"0xb\00127\005\001", !1, !140}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!145 = !MDLocation(line: 127, column: 5, scope: !140)
!146 = !MDLocation(line: 128, column: 17, scope: !144)
!147 = !MDLocation(line: 128, column: 9, scope: !144)
!148 = !MDLocation(line: 127, column: 27, scope: !144)
!149 = !MDLocation(line: 127, column: 5, scope: !144)
!150 = !MDLocation(line: 130, column: 17, scope: !37)
!151 = !MDLocation(line: 130, column: 5, scope: !37)
!152 = !MDLocation(line: 131, column: 15, scope: !37)
!153 = !MDLocation(line: 131, column: 5, scope: !37)
!154 = !MDLocation(line: 132, column: 17, scope: !37)
!155 = !MDLocation(line: 132, column: 5, scope: !37)
!156 = !MDLocation(line: 133, column: 5, scope: !37)
!157 = !MDLocation(line: 135, column: 13, scope: !37)
!158 = !MDLocation(line: 135, column: 5, scope: !37)
!159 = !{!"0x101\00a\0016777354\000", !40, !34, !21} ; [ DW_TAG_arg_variable ] [a] [line 138]
!160 = !MDLocation(line: 138, column: 17, scope: !40)
!161 = !MDLocation(line: 140, column: 9, scope: !162)
!162 = !{!"0xb\00140\009\002", !1, !40}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!163 = !MDLocation(line: 140, column: 9, scope: !40)
!164 = !MDLocation(line: 142, column: 9, scope: !165)
!165 = !{!"0xb\00141\004\003", !1, !162}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!166 = !MDLocation(line: 143, column: 9, scope: !165)
!167 = !MDLocation(line: 144, column: 5, scope: !165)
!168 = !MDLocation(line: 146, column: 18, scope: !40)
!169 = !MDLocation(line: 146, column: 5, scope: !40)
!170 = !MDLocation(line: 147, column: 1, scope: !40)
!171 = !MDLocation(line: 151, column: 5, scope: !43)
!172 = !MDLocation(line: 151, column: 13, scope: !173)
!173 = !{!"0xb\002", !1, !174}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!174 = !{!"0xb\001", !1, !43}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!175 = !{!"0x100\00pkt\00153\000", !176, !34, !12} ; [ DW_TAG_auto_variable ] [pkt] [line 153]
!176 = !{!"0xb\00152\005\004", !1, !43}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!177 = !MDLocation(line: 153, column: 24, scope: !176)
!178 = !{!"0x100\00newtcb\00154\000", !176, !34, !4} ; [ DW_TAG_auto_variable ] [newtcb] [line 154]
!179 = !MDLocation(line: 154, column: 22, scope: !176)
!180 = !MDLocation(line: 156, column: 9, scope: !176)
!181 = !MDLocation(line: 158, column: 18, scope: !176)
!182 = !MDLocation(line: 158, column: 9, scope: !176)
!183 = !MDLocation(line: 161, column: 23, scope: !184)
!184 = !{!"0xb\00159\009\005", !1, !176}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!185 = !MDLocation(line: 161, column: 17, scope: !184)
!186 = !MDLocation(line: 162, column: 30, scope: !184)
!187 = !MDLocation(line: 162, column: 17, scope: !184)
!188 = !MDLocation(line: 163, column: 32, scope: !184)
!189 = !MDLocation(line: 163, column: 17, scope: !184)
!190 = !MDLocation(line: 167, column: 26, scope: !184)
!191 = !MDLocation(line: 167, column: 17, scope: !184)
!192 = !MDLocation(line: 168, column: 22, scope: !184)
!193 = !MDLocation(line: 168, column: 17, scope: !184)
!194 = !MDLocation(line: 169, column: 22, scope: !184)
!195 = !MDLocation(line: 169, column: 17, scope: !184)
!196 = !MDLocation(line: 170, column: 21, scope: !197)
!197 = !{!"0xb\00170\0021\006", !1, !184}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!198 = !MDLocation(line: 170, column: 21, scope: !184)
!199 = !MDLocation(line: 170, column: 42, scope: !200)
!200 = !{!"0xb\001", !1, !197}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!201 = !MDLocation(line: 170, column: 36, scope: !197)
!202 = !MDLocation(line: 172, column: 29, scope: !184)
!203 = !MDLocation(line: 172, column: 41, scope: !184)
!204 = !MDLocation(line: 172, column: 17, scope: !184)
!205 = !MDLocation(line: 173, column: 29, scope: !184)
!206 = !MDLocation(line: 173, column: 17, scope: !184)
!207 = !MDLocation(line: 174, column: 29, scope: !184)
!208 = !MDLocation(line: 174, column: 17, scope: !184)
!209 = !MDLocation(line: 175, column: 23, scope: !184)
!210 = !MDLocation(line: 175, column: 17, scope: !184)
!211 = !MDLocation(line: 176, column: 17, scope: !184)
!212 = !MDLocation(line: 183, column: 23, scope: !184)
!213 = !MDLocation(line: 183, column: 17, scope: !184)
!214 = !MDLocation(line: 184, column: 17, scope: !184)
!215 = !MDLocation(line: 187, column: 17, scope: !184)
!216 = !MDLocation(line: 190, column: 1, scope: !43)
!217 = !MDLocation(line: 194, column: 5, scope: !46)
!218 = !MDLocation(line: 195, column: 13, scope: !46)
!219 = !MDLocation(line: 195, column: 5, scope: !46)
!220 = !MDLocation(line: 200, column: 5, scope: !49)
!221 = !MDLocation(line: 201, column: 5, scope: !49)
!222 = !MDLocation(line: 202, column: 13, scope: !49)
!223 = !MDLocation(line: 202, column: 5, scope: !49)
!224 = !{!"0x101\00id\0016777421\000", !50, !34, !9} ; [ DW_TAG_arg_variable ] [id] [line 205]
!225 = !MDLocation(line: 205, column: 26, scope: !50)
!226 = !{!"0x100\00t\00207\000", !50, !34, !4}    ; [ DW_TAG_auto_variable ] [t] [line 207]
!227 = !MDLocation(line: 207, column: 18, scope: !50)
!228 = !MDLocation(line: 209, column: 12, scope: !229)
!229 = !{!"0xb\00209\009\007", !1, !50}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!230 = !MDLocation(line: 209, column: 9, scope: !229)
!231 = !MDLocation(line: 209, column: 9, scope: !50)
!232 = !MDLocation(line: 209, column: 18, scope: !233)
!233 = !{!"0xb\001", !1, !229}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!234 = !MDLocation(line: 210, column: 17, scope: !229)
!235 = !MDLocation(line: 210, column: 9, scope: !229)
!236 = !MDLocation(line: 210, column: 5, scope: !229)
!237 = !MDLocation(line: 211, column: 9, scope: !238)
!238 = !{!"0xb\00211\009\008", !1, !50}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!239 = !MDLocation(line: 211, column: 9, scope: !50)
!240 = !MDLocation(line: 211, column: 44, scope: !241)
!241 = !{!"0xb\001", !1, !238}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!242 = !MDLocation(line: 211, column: 15, scope: !238)
!243 = !MDLocation(line: 212, column: 12, scope: !50)
!244 = !MDLocation(line: 212, column: 5, scope: !50)
!245 = !{!"0x101\00id\0016777431\000", !53, !34, !9} ; [ DW_TAG_arg_variable ] [id] [line 215]
!246 = !MDLocation(line: 215, column: 26, scope: !53)
!247 = !{!"0x100\00t\00217\000", !53, !34, !4}    ; [ DW_TAG_auto_variable ] [t] [line 217]
!248 = !MDLocation(line: 217, column: 18, scope: !53)
!249 = !MDLocation(line: 219, column: 17, scope: !53)
!250 = !MDLocation(line: 219, column: 9, scope: !53)
!251 = !MDLocation(line: 219, column: 5, scope: !53)
!252 = !MDLocation(line: 220, column: 10, scope: !253)
!253 = !{!"0xb\00220\0010\009", !1, !53}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!254 = !MDLocation(line: 220, column: 10, scope: !53)
!255 = !MDLocation(line: 220, column: 17, scope: !256)
!256 = !{!"0xb\001", !1, !253}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!257 = !MDLocation(line: 222, column: 5, scope: !53)
!258 = !MDLocation(line: 223, column: 10, scope: !259)
!259 = !{!"0xb\00223\0010\0010", !1, !53}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!260 = !MDLocation(line: 223, column: 21, scope: !259)
!261 = !MDLocation(line: 223, column: 10, scope: !53)
!262 = !MDLocation(line: 223, column: 42, scope: !263)
!263 = !{!"0xb\001", !1, !259}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!264 = !MDLocation(line: 223, column: 34, scope: !259)
!265 = !MDLocation(line: 225, column: 13, scope: !53)
!266 = !MDLocation(line: 225, column: 5, scope: !53)
!267 = !MDLocation(line: 226, column: 1, scope: !53)
!268 = !{!"0x101\00pkt\0016777445\000", !54, !34, !12} ; [ DW_TAG_arg_variable ] [pkt] [line 229]
!269 = !MDLocation(line: 229, column: 34, scope: !54)
!270 = !{!"0x100\00t\00231\000", !54, !34, !4}    ; [ DW_TAG_auto_variable ] [t] [line 231]
!271 = !MDLocation(line: 231, column: 18, scope: !54)
!272 = !MDLocation(line: 233, column: 17, scope: !54)
!273 = !MDLocation(line: 233, column: 9, scope: !54)
!274 = !MDLocation(line: 233, column: 5, scope: !54)
!275 = !MDLocation(line: 234, column: 9, scope: !276)
!276 = !{!"0xb\00234\009\0011", !1, !54}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!277 = !MDLocation(line: 234, column: 9, scope: !54)
!278 = !MDLocation(line: 234, column: 23, scope: !279)
!279 = !{!"0xb\001", !1, !276}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!280 = !MDLocation(line: 234, column: 15, scope: !276)
!281 = !MDLocation(line: 236, column: 5, scope: !54)
!282 = !MDLocation(line: 238, column: 5, scope: !54)
!283 = !MDLocation(line: 239, column: 17, scope: !54)
!284 = !MDLocation(line: 239, column: 5, scope: !54)
!285 = !MDLocation(line: 241, column: 8, scope: !286)
!286 = !{!"0xb\00241\008\0012", !1, !54}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!287 = !MDLocation(line: 241, column: 8, scope: !54)
!288 = !MDLocation(line: 243, column: 20, scope: !289)
!289 = !{!"0xb\00242\005\0013", !1, !286}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!290 = !MDLocation(line: 243, column: 9, scope: !289)
!291 = !MDLocation(line: 244, column: 9, scope: !289)
!292 = !MDLocation(line: 245, column: 13, scope: !293)
!293 = !{!"0xb\00245\0013\0014", !1, !289}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!294 = !MDLocation(line: 245, column: 24, scope: !293)
!295 = !MDLocation(line: 245, column: 13, scope: !289)
!296 = !MDLocation(line: 245, column: 44, scope: !297)
!297 = !{!"0xb\001", !1, !293}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!298 = !MDLocation(line: 245, column: 36, scope: !293)
!299 = !MDLocation(line: 246, column: 5, scope: !289)
!300 = !MDLocation(line: 249, column: 16, scope: !301)
!301 = !{!"0xb\00248\005\0015", !1, !286}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!302 = !MDLocation(line: 249, column: 40, scope: !301)
!303 = !MDLocation(line: 249, column: 38, scope: !301)
!304 = !MDLocation(line: 249, column: 21, scope: !301)
!305 = !MDLocation(line: 249, column: 9, scope: !301)
!306 = !MDLocation(line: 252, column: 13, scope: !54)
!307 = !MDLocation(line: 252, column: 5, scope: !54)
!308 = !MDLocation(line: 253, column: 1, scope: !54)
!309 = !{!"0x101\00pkt\0016777557\000", !59, !34, !12} ; [ DW_TAG_arg_variable ] [pkt] [line 341]
!310 = !MDLocation(line: 341, column: 28, scope: !59)
!311 = !{!"0x101\00ptr\0033554773\000", !59, !34, !12} ; [ DW_TAG_arg_variable ] [ptr] [line 341]
!312 = !MDLocation(line: 341, column: 48, scope: !59)
!313 = !MDLocation(line: 343, column: 5, scope: !59)
!314 = !MDLocation(line: 345, column: 5, scope: !59)
!315 = !MDLocation(line: 345, column: 13, scope: !316)
!316 = !{!"0xb\003", !1, !317}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!317 = !{!"0xb\001", !1, !59}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!318 = !MDLocation(line: 345, column: 33, scope: !319)
!319 = !{!"0xb\002", !1, !59}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!320 = !MDLocation(line: 345, column: 27, scope: !59)
!321 = !MDLocation(line: 347, column: 19, scope: !59)
!322 = !MDLocation(line: 347, column: 5, scope: !59)
!323 = !MDLocation(line: 348, column: 1, scope: !59)
!324 = !{!"0x101\00pkt\0016777471\000", !55, !34, !12} ; [ DW_TAG_arg_variable ] [pkt] [line 255]
!325 = !MDLocation(line: 255, column: 36, scope: !55)
!326 = !MDLocation(line: 257, column: 5, scope: !55)
!327 = !MDLocation(line: 258, column: 10, scope: !328)
!328 = !{!"0xb\00258\0010\0016", !1, !55}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!329 = !MDLocation(line: 258, column: 10, scope: !55)
!330 = !MDLocation(line: 258, column: 27, scope: !331)
!331 = !{!"0xb\001", !1, !328}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!332 = !MDLocation(line: 258, column: 18, scope: !328)
!333 = !MDLocation(line: 260, column: 11, scope: !334)
!334 = !{!"0xb\00260\0010\0017", !1, !55}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!335 = !MDLocation(line: 260, column: 10, scope: !334)
!336 = !MDLocation(line: 260, column: 10, scope: !55)
!337 = !MDLocation(line: 262, column: 16, scope: !338)
!338 = !{!"0xb\00261\005\0018", !1, !334}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!339 = !MDLocation(line: 262, column: 14, scope: !338)
!340 = !MDLocation(line: 262, column: 9, scope: !338)
!341 = !MDLocation(line: 263, column: 18, scope: !338)
!342 = !MDLocation(line: 263, column: 9, scope: !338)
!343 = !MDLocation(line: 267, column: 17, scope: !344)
!344 = !{!"0xb\00266\005\0019", !1, !334}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!345 = !MDLocation(line: 267, column: 16, scope: !344)
!346 = !MDLocation(line: 267, column: 14, scope: !344)
!347 = !MDLocation(line: 267, column: 9, scope: !344)
!348 = !MDLocation(line: 268, column: 18, scope: !344)
!349 = !MDLocation(line: 268, column: 9, scope: !344)
!350 = !MDLocation(line: 270, column: 1, scope: !55)
!351 = !{!"0x101\00pkt\0016777488\000", !56, !34, !12} ; [ DW_TAG_arg_variable ] [pkt] [line 272]
!352 = !MDLocation(line: 272, column: 36, scope: !56)
!353 = !MDLocation(line: 274, column: 10, scope: !354)
!354 = !{!"0xb\00274\0010\0020", !1, !56}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!355 = !MDLocation(line: 274, column: 10, scope: !56)
!356 = !MDLocation(line: 274, column: 28, scope: !357)
!357 = !{!"0xb\001", !1, !354}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!358 = !MDLocation(line: 274, column: 19, scope: !354)
!359 = !{!"0x100\00i\00277\000", !360, !34, !9}   ; [ DW_TAG_auto_variable ] [i] [line 277]
!360 = !{!"0xb\00276\005\0021", !1, !354}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!361 = !MDLocation(line: 277, column: 13, scope: !360)
!362 = !MDLocation(line: 279, column: 40, scope: !360)
!363 = !MDLocation(line: 279, column: 14, scope: !360)
!364 = !MDLocation(line: 279, column: 9, scope: !360)
!365 = !MDLocation(line: 280, column: 21, scope: !360)
!366 = !MDLocation(line: 280, column: 9, scope: !360)
!367 = !MDLocation(line: 282, column: 9, scope: !360)
!368 = !MDLocation(line: 283, column: 14, scope: !369)
!369 = !{!"0xb\00283\009\0022", !1, !360}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!370 = !MDLocation(line: 283, column: 19, scope: !371)
!371 = !{!"0xb\002", !1, !372}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!372 = !{!"0xb\001", !1, !373}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!373 = !{!"0xb\00283\009\0023", !1, !369}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!374 = !MDLocation(line: 283, column: 9, scope: !369)
!375 = !MDLocation(line: 285, column: 13, scope: !376)
!376 = !{!"0xb\00284\009\0024", !1, !373}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!377 = !MDLocation(line: 286, column: 18, scope: !378)
!378 = !{!"0xb\00286\0018\0025", !1, !376}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!379 = !MDLocation(line: 286, column: 18, scope: !376)
!380 = !MDLocation(line: 286, column: 28, scope: !381)
!381 = !{!"0xb\001", !1, !378}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!382 = !MDLocation(line: 287, column: 39, scope: !376)
!383 = !MDLocation(line: 287, column: 30, scope: !376)
!384 = !MDLocation(line: 287, column: 25, scope: !376)
!385 = !MDLocation(line: 287, column: 13, scope: !376)
!386 = !MDLocation(line: 287, column: 14, scope: !376)
!387 = !MDLocation(line: 288, column: 9, scope: !376)
!388 = !MDLocation(line: 283, column: 31, scope: !373)
!389 = !MDLocation(line: 283, column: 9, scope: !373)
!390 = !MDLocation(line: 289, column: 23, scope: !360)
!391 = !MDLocation(line: 289, column: 18, scope: !360)
!392 = !MDLocation(line: 289, column: 9, scope: !360)
!393 = !MDLocation(line: 291, column: 1, scope: !56)
!394 = !{!"0x101\00pkt\0016777509\000", !57, !34, !12} ; [ DW_TAG_arg_variable ] [pkt] [line 293]
!395 = !MDLocation(line: 293, column: 39, scope: !57)
!396 = !MDLocation(line: 295, column: 9, scope: !397)
!397 = !{!"0xb\00295\009\0026", !1, !57}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!398 = !MDLocation(line: 295, column: 9, scope: !57)
!399 = !MDLocation(line: 295, column: 24, scope: !400)
!400 = !{!"0xb\001", !1, !397}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!401 = !MDLocation(line: 296, column: 41, scope: !397)
!402 = !MDLocation(line: 296, column: 23, scope: !397)
!403 = !MDLocation(line: 295, column: 17, scope: !397)
!404 = !MDLocation(line: 298, column: 9, scope: !405)
!405 = !{!"0xb\00298\009\0027", !1, !57}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!406 = !MDLocation(line: 298, column: 9, scope: !57)
!407 = !{!"0x100\00count\00300\000", !408, !34, !9} ; [ DW_TAG_auto_variable ] [count] [line 300]
!408 = !{!"0xb\00299\005\0028", !1, !405}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!409 = !MDLocation(line: 300, column: 13, scope: !408)
!410 = !{!"0x100\00workpkt\00301\000", !408, !34, !12} ; [ DW_TAG_auto_variable ] [workpkt] [line 301]
!411 = !MDLocation(line: 301, column: 24, scope: !408)
!412 = !MDLocation(line: 301, column: 51, scope: !408)
!413 = !MDLocation(line: 301, column: 34, scope: !408)
!414 = !MDLocation(line: 302, column: 17, scope: !408)
!415 = !MDLocation(line: 302, column: 9, scope: !408)
!416 = !MDLocation(line: 304, column: 14, scope: !417)
!417 = !{!"0xb\00304\0014\0029", !1, !408}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!418 = !MDLocation(line: 304, column: 14, scope: !408)
!419 = !MDLocation(line: 306, column: 42, scope: !420)
!420 = !{!"0xb\00305\009\0030", !1, !417}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!421 = !MDLocation(line: 306, column: 25, scope: !420)
!422 = !MDLocation(line: 306, column: 24, scope: !420)
!423 = !MDLocation(line: 306, column: 17, scope: !420)
!424 = !MDLocation(line: 306, column: 12, scope: !420)
!425 = !MDLocation(line: 307, column: 26, scope: !420)
!426 = !MDLocation(line: 307, column: 21, scope: !420)
!427 = !MDLocation(line: 307, column: 12, scope: !420)
!428 = !MDLocation(line: 310, column: 14, scope: !429)
!429 = !{!"0xb\00310\0014\0031", !1, !408}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!430 = !MDLocation(line: 310, column: 14, scope: !408)
!431 = !{!"0x100\00devpkt\00312\000", !432, !34, !12} ; [ DW_TAG_auto_variable ] [devpkt] [line 312]
!432 = !{!"0xb\00311\009\0032", !1, !429}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!433 = !MDLocation(line: 312, column: 28, scope: !432)
!434 = !MDLocation(line: 314, column: 39, scope: !432)
!435 = !MDLocation(line: 314, column: 22, scope: !432)
!436 = !MDLocation(line: 314, column: 13, scope: !432)
!437 = !MDLocation(line: 315, column: 43, scope: !432)
!438 = !MDLocation(line: 315, column: 26, scope: !432)
!439 = !MDLocation(line: 315, column: 25, scope: !432)
!440 = !MDLocation(line: 315, column: 18, scope: !432)
!441 = !MDLocation(line: 315, column: 13, scope: !432)
!442 = !MDLocation(line: 316, column: 42, scope: !432)
!443 = !MDLocation(line: 316, column: 28, scope: !432)
!444 = !MDLocation(line: 316, column: 13, scope: !432)
!445 = !MDLocation(line: 317, column: 29, scope: !432)
!446 = !MDLocation(line: 317, column: 13, scope: !432)
!447 = !MDLocation(line: 318, column: 26, scope: !432)
!448 = !MDLocation(line: 318, column: 21, scope: !432)
!449 = !MDLocation(line: 318, column: 13, scope: !432)
!450 = !MDLocation(line: 320, column: 5, scope: !408)
!451 = !MDLocation(line: 321, column: 14, scope: !57)
!452 = !MDLocation(line: 321, column: 5, scope: !57)
!453 = !MDLocation(line: 322, column: 1, scope: !57)
!454 = !{!"0x101\00pkt\0016777540\000", !58, !34, !12} ; [ DW_TAG_arg_variable ] [pkt] [line 324]
!455 = !MDLocation(line: 324, column: 35, scope: !58)
!456 = !MDLocation(line: 326, column: 10, scope: !457)
!457 = !{!"0xb\00326\0010\0033", !1, !58}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!458 = !MDLocation(line: 326, column: 10, scope: !58)
!459 = !MDLocation(line: 328, column: 14, scope: !460)
!460 = !{!"0xb\00328\0014\0035", !1, !461}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!461 = !{!"0xb\00327\005\0034", !1, !457}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!462 = !MDLocation(line: 328, column: 14, scope: !461)
!463 = !MDLocation(line: 328, column: 31, scope: !464)
!464 = !{!"0xb\001", !1, !460}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!465 = !MDLocation(line: 328, column: 22, scope: !460)
!466 = !MDLocation(line: 329, column: 32, scope: !461)
!467 = !MDLocation(line: 329, column: 15, scope: !461)
!468 = !MDLocation(line: 329, column: 9, scope: !461)
!469 = !MDLocation(line: 330, column: 9, scope: !461)
!470 = !MDLocation(line: 331, column: 23, scope: !461)
!471 = !MDLocation(line: 331, column: 18, scope: !461)
!472 = !MDLocation(line: 331, column: 9, scope: !461)
!473 = !MDLocation(line: 335, column: 20, scope: !474)
!474 = !{!"0xb\00334\005\0036", !1, !457}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!475 = !MDLocation(line: 335, column: 14, scope: !474)
!476 = !MDLocation(line: 335, column: 9, scope: !474)
!477 = !MDLocation(line: 336, column: 13, scope: !478)
!478 = !{!"0xb\00336\0013\0037", !1, !474}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!479 = !MDLocation(line: 336, column: 13, scope: !474)
!480 = !MDLocation(line: 336, column: 34, scope: !481)
!481 = !{!"0xb\001", !1, !478}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!482 = !MDLocation(line: 336, column: 28, scope: !478)
!483 = !MDLocation(line: 337, column: 18, scope: !474)
!484 = !MDLocation(line: 337, column: 9, scope: !474)
!485 = !MDLocation(line: 339, column: 1, scope: !58)
!486 = !{!"0x100\00wkq\00352\000", !62, !34, !12} ; [ DW_TAG_auto_variable ] [wkq] [line 352]
!487 = !MDLocation(line: 352, column: 20, scope: !62)
!488 = !{!"0x100\00retval\00353\000", !62, !34, !9} ; [ DW_TAG_auto_variable ] [retval] [line 353]
!489 = !MDLocation(line: 353, column: 9, scope: !62)
!490 = !MDLocation(line: 355, column: 5, scope: !62)
!491 = !MDLocation(line: 357, column: 27, scope: !62)
!492 = !MDLocation(line: 357, column: 5, scope: !62)
!493 = !MDLocation(line: 359, column: 11, scope: !62)
!494 = !MDLocation(line: 359, column: 5, scope: !62)
!495 = !MDLocation(line: 360, column: 15, scope: !62)
!496 = !MDLocation(line: 360, column: 11, scope: !62)
!497 = !MDLocation(line: 360, column: 5, scope: !62)
!498 = !MDLocation(line: 362, column: 30, scope: !62)
!499 = !MDLocation(line: 362, column: 5, scope: !62)
!500 = !MDLocation(line: 364, column: 11, scope: !62)
!501 = !MDLocation(line: 364, column: 5, scope: !62)
!502 = !MDLocation(line: 365, column: 15, scope: !62)
!503 = !MDLocation(line: 365, column: 11, scope: !62)
!504 = !MDLocation(line: 365, column: 5, scope: !62)
!505 = !MDLocation(line: 366, column: 15, scope: !62)
!506 = !MDLocation(line: 366, column: 11, scope: !62)
!507 = !MDLocation(line: 366, column: 5, scope: !62)
!508 = !MDLocation(line: 368, column: 34, scope: !62)
!509 = !MDLocation(line: 368, column: 5, scope: !62)
!510 = !MDLocation(line: 370, column: 11, scope: !62)
!511 = !MDLocation(line: 370, column: 5, scope: !62)
!512 = !MDLocation(line: 371, column: 15, scope: !62)
!513 = !MDLocation(line: 371, column: 11, scope: !62)
!514 = !MDLocation(line: 371, column: 5, scope: !62)
!515 = !MDLocation(line: 372, column: 15, scope: !62)
!516 = !MDLocation(line: 372, column: 11, scope: !62)
!517 = !MDLocation(line: 372, column: 5, scope: !62)
!518 = !MDLocation(line: 374, column: 34, scope: !62)
!519 = !MDLocation(line: 374, column: 5, scope: !62)
!520 = !MDLocation(line: 376, column: 5, scope: !62)
!521 = !MDLocation(line: 377, column: 30, scope: !62)
!522 = !MDLocation(line: 377, column: 5, scope: !62)
!523 = !MDLocation(line: 378, column: 30, scope: !62)
!524 = !MDLocation(line: 378, column: 5, scope: !62)
!525 = !MDLocation(line: 380, column: 11, scope: !62)
!526 = !MDLocation(line: 380, column: 5, scope: !62)
!527 = !MDLocation(line: 382, column: 17, scope: !62)
!528 = !MDLocation(line: 382, column: 5, scope: !62)
!529 = !MDLocation(line: 384, column: 5, scope: !62)
!530 = !MDLocation(line: 386, column: 5, scope: !62)
!531 = !MDLocation(line: 387, column: 5, scope: !62)
!532 = !MDLocation(line: 389, column: 5, scope: !62)
!533 = !MDLocation(line: 391, column: 5, scope: !62)
!534 = !MDLocation(line: 394, column: 12, scope: !62)
!535 = !MDLocation(line: 394, column: 23, scope: !62)
!536 = !MDLocation(line: 393, column: 5, scope: !62)
!537 = !MDLocation(line: 396, column: 5, scope: !62)
!538 = !MDLocation(line: 397, column: 9, scope: !539)
!539 = !{!"0xb\00397\009\0038", !1, !62}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!540 = !MDLocation(line: 397, column: 9, scope: !62)
!541 = !MDLocation(line: 397, column: 38, scope: !542)
!542 = !{!"0xb\001", !1, !539}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!543 = !MDLocation(line: 398, column: 7, scope: !544)
!544 = !{!"0xb\00397\0065\0039", !1, !539}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!545 = !MDLocation(line: 399, column: 7, scope: !544)
!546 = !MDLocation(line: 400, column: 5, scope: !544)
!547 = !MDLocation(line: 401, column: 7, scope: !548)
!548 = !{!"0xb\00400\0012\0040", !1, !539}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/richards_benchmark.c]
!549 = !MDLocation(line: 402, column: 7, scope: !548)
!550 = !MDLocation(line: 405, column: 5, scope: !62)
!551 = !MDLocation(line: 406, column: 12, scope: !62)
!552 = !MDLocation(line: 406, column: 5, scope: !62)
