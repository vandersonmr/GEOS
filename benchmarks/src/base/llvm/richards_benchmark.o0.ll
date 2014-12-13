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
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca %struct.packet*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct.task* (%struct.packet*)*, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %t = alloca %struct.task*, align 8
  store i32 %id, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !85), !dbg !86
  store i32 %pri, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !87), !dbg !88
  store %struct.packet* %wkq, %struct.packet** %3, align 8
  call void @llvm.dbg.declare(metadata !{%struct.packet** %3}, metadata !89), !dbg !90
  store i32 %state, i32* %4, align 4
  call void @llvm.dbg.declare(metadata !{i32* %4}, metadata !91), !dbg !92
  store %struct.task* (%struct.packet*)* %fn, %struct.task* (%struct.packet*)** %5, align 8
  call void @llvm.dbg.declare(metadata !{%struct.task* (%struct.packet*)** %5}, metadata !93), !dbg !94
  store i64 %v1, i64* %6, align 8
  call void @llvm.dbg.declare(metadata !{i64* %6}, metadata !95), !dbg !96
  store i64 %v2, i64* %7, align 8
  call void @llvm.dbg.declare(metadata !{i64* %7}, metadata !97), !dbg !98
  call void @llvm.dbg.declare(metadata !{%struct.task** %t}, metadata !99), !dbg !100
  %8 = call noalias i8* @malloc(i64 56) #4, !dbg !100
  %9 = bitcast i8* %8 to %struct.task*, !dbg !100
  store %struct.task* %9, %struct.task** %t, align 8, !dbg !100
  %10 = load %struct.task** %t, align 8, !dbg !101
  %11 = load i32* %1, align 4, !dbg !101
  %12 = sext i32 %11 to i64, !dbg !101
  %13 = getelementptr inbounds [11 x %struct.task*]* @tasktab, i32 0, i64 %12, !dbg !101
  store %struct.task* %10, %struct.task** %13, align 8, !dbg !101
  %14 = load %struct.task** @tasklist, align 8, !dbg !102
  %15 = load %struct.task** %t, align 8, !dbg !102
  %16 = getelementptr inbounds %struct.task* %15, i32 0, i32 0, !dbg !102
  store %struct.task* %14, %struct.task** %16, align 8, !dbg !102
  %17 = load i32* %1, align 4, !dbg !103
  %18 = load %struct.task** %t, align 8, !dbg !103
  %19 = getelementptr inbounds %struct.task* %18, i32 0, i32 1, !dbg !103
  store i32 %17, i32* %19, align 4, !dbg !103
  %20 = load i32* %2, align 4, !dbg !104
  %21 = load %struct.task** %t, align 8, !dbg !104
  %22 = getelementptr inbounds %struct.task* %21, i32 0, i32 2, !dbg !104
  store i32 %20, i32* %22, align 4, !dbg !104
  %23 = load %struct.packet** %3, align 8, !dbg !105
  %24 = load %struct.task** %t, align 8, !dbg !105
  %25 = getelementptr inbounds %struct.task* %24, i32 0, i32 3, !dbg !105
  store %struct.packet* %23, %struct.packet** %25, align 8, !dbg !105
  %26 = load i32* %4, align 4, !dbg !106
  %27 = load %struct.task** %t, align 8, !dbg !106
  %28 = getelementptr inbounds %struct.task* %27, i32 0, i32 4, !dbg !106
  store i32 %26, i32* %28, align 4, !dbg !106
  %29 = load %struct.task* (%struct.packet*)** %5, align 8, !dbg !107
  %30 = load %struct.task** %t, align 8, !dbg !107
  %31 = getelementptr inbounds %struct.task* %30, i32 0, i32 5, !dbg !107
  store %struct.task* (%struct.packet*)* %29, %struct.task* (%struct.packet*)** %31, align 8, !dbg !107
  %32 = load i64* %6, align 8, !dbg !108
  %33 = load %struct.task** %t, align 8, !dbg !108
  %34 = getelementptr inbounds %struct.task* %33, i32 0, i32 6, !dbg !108
  store i64 %32, i64* %34, align 8, !dbg !108
  %35 = load i64* %7, align 8, !dbg !109
  %36 = load %struct.task** %t, align 8, !dbg !109
  %37 = getelementptr inbounds %struct.task* %36, i32 0, i32 7, !dbg !109
  store i64 %35, i64* %37, align 8, !dbg !109
  %38 = load %struct.task** %t, align 8, !dbg !110
  store %struct.task* %38, %struct.task** @tasklist, align 8, !dbg !110
  ret void, !dbg !111
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind uwtable
define %struct.packet* @pkt(%struct.packet* %link, i32 %id, i32 %kind) #0 {
  %1 = alloca %struct.packet*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %i = alloca i32, align 4
  %p = alloca %struct.packet*, align 8
  store %struct.packet* %link, %struct.packet** %1, align 8
  call void @llvm.dbg.declare(metadata !{%struct.packet** %1}, metadata !112), !dbg !113
  store i32 %id, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !114), !dbg !113
  store i32 %kind, i32* %3, align 4
  call void @llvm.dbg.declare(metadata !{i32* %3}, metadata !115), !dbg !113
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !116), !dbg !117
  call void @llvm.dbg.declare(metadata !{%struct.packet** %p}, metadata !118), !dbg !119
  %4 = call noalias i8* @malloc(i64 24) #4, !dbg !119
  %5 = bitcast i8* %4 to %struct.packet*, !dbg !119
  store %struct.packet* %5, %struct.packet** %p, align 8, !dbg !119
  store i32 0, i32* %i, align 4, !dbg !120
  br label %6, !dbg !120

; <label>:6                                       ; preds = %15, %0
  %7 = load i32* %i, align 4, !dbg !120
  %8 = icmp sle i32 %7, 3, !dbg !120
  br i1 %8, label %9, label %18, !dbg !120

; <label>:9                                       ; preds = %6
  %10 = load i32* %i, align 4, !dbg !122
  %11 = sext i32 %10 to i64, !dbg !122
  %12 = load %struct.packet** %p, align 8, !dbg !122
  %13 = getelementptr inbounds %struct.packet* %12, i32 0, i32 4, !dbg !122
  %14 = getelementptr inbounds [4 x i8]* %13, i32 0, i64 %11, !dbg !122
  store i8 0, i8* %14, align 1, !dbg !122
  br label %15, !dbg !122

; <label>:15                                      ; preds = %9
  %16 = load i32* %i, align 4, !dbg !120
  %17 = add nsw i32 %16, 1, !dbg !120
  store i32 %17, i32* %i, align 4, !dbg !120
  br label %6, !dbg !120

; <label>:18                                      ; preds = %6
  %19 = load %struct.packet** %1, align 8, !dbg !123
  %20 = load %struct.packet** %p, align 8, !dbg !123
  %21 = getelementptr inbounds %struct.packet* %20, i32 0, i32 0, !dbg !123
  store %struct.packet* %19, %struct.packet** %21, align 8, !dbg !123
  %22 = load i32* %2, align 4, !dbg !124
  %23 = load %struct.packet** %p, align 8, !dbg !124
  %24 = getelementptr inbounds %struct.packet* %23, i32 0, i32 1, !dbg !124
  store i32 %22, i32* %24, align 4, !dbg !124
  %25 = load i32* %3, align 4, !dbg !125
  %26 = load %struct.packet** %p, align 8, !dbg !125
  %27 = getelementptr inbounds %struct.packet* %26, i32 0, i32 2, !dbg !125
  store i32 %25, i32* %27, align 4, !dbg !125
  %28 = load %struct.packet** %p, align 8, !dbg !126
  %29 = getelementptr inbounds %struct.packet* %28, i32 0, i32 3, !dbg !126
  store i32 0, i32* %29, align 4, !dbg !126
  %30 = load %struct.packet** %p, align 8, !dbg !127
  ret %struct.packet* %30, !dbg !127
}

; Function Attrs: nounwind uwtable
define void @trace(i8 signext %a) #0 {
  %1 = alloca i8, align 1
  store i8 %a, i8* %1, align 1
  call void @llvm.dbg.declare(metadata !{i8* %1}, metadata !128), !dbg !129
  %2 = load i32* @layout, align 4, !dbg !130
  %3 = add nsw i32 %2, -1, !dbg !130
  store i32 %3, i32* @layout, align 4, !dbg !130
  %4 = icmp sle i32 %3, 0, !dbg !130
  br i1 %4, label %5, label %7, !dbg !130

; <label>:5                                       ; preds = %0
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0)), !dbg !132
  store i32 50, i32* @layout, align 4, !dbg !134
  br label %7, !dbg !135

; <label>:7                                       ; preds = %5, %0
  %8 = load i8* %1, align 1, !dbg !136
  %9 = sext i8 %8 to i32, !dbg !136
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0), i32 %9), !dbg !136
  ret void, !dbg !137
}

declare i32 @printf(i8*, ...) #3

; Function Attrs: nounwind uwtable
define void @schedule() #0 {
  %pkt = alloca %struct.packet*, align 8
  %newtcb = alloca %struct.task*, align 8
  br label %1, !dbg !138

; <label>:1                                       ; preds = %59, %0
  %2 = load %struct.task** @tcb, align 8, !dbg !138
  %3 = icmp ne %struct.task* %2, null, !dbg !138
  br i1 %3, label %4, label %60, !dbg !138

; <label>:4                                       ; preds = %1
  call void @llvm.dbg.declare(metadata !{%struct.packet** %pkt}, metadata !139), !dbg !141
  call void @llvm.dbg.declare(metadata !{%struct.task** %newtcb}, metadata !142), !dbg !143
  store %struct.packet* null, %struct.packet** %pkt, align 8, !dbg !144
  %5 = load %struct.task** @tcb, align 8, !dbg !145
  %6 = getelementptr inbounds %struct.task* %5, i32 0, i32 4, !dbg !145
  %7 = load i32* %6, align 4, !dbg !145
  switch i32 %7, label %58 [
    i32 3, label %8
    i32 0, label %24
    i32 1, label %24
    i32 2, label %54
    i32 4, label %54
    i32 5, label %54
    i32 6, label %54
    i32 7, label %54
  ], !dbg !145

; <label>:8                                       ; preds = %4
  %9 = load %struct.task** @tcb, align 8, !dbg !146
  %10 = getelementptr inbounds %struct.task* %9, i32 0, i32 3, !dbg !146
  %11 = load %struct.packet** %10, align 8, !dbg !146
  store %struct.packet* %11, %struct.packet** %pkt, align 8, !dbg !146
  %12 = load %struct.packet** %pkt, align 8, !dbg !148
  %13 = getelementptr inbounds %struct.packet* %12, i32 0, i32 0, !dbg !148
  %14 = load %struct.packet** %13, align 8, !dbg !148
  %15 = load %struct.task** @tcb, align 8, !dbg !148
  %16 = getelementptr inbounds %struct.task* %15, i32 0, i32 3, !dbg !148
  store %struct.packet* %14, %struct.packet** %16, align 8, !dbg !148
  %17 = load %struct.task** @tcb, align 8, !dbg !149
  %18 = getelementptr inbounds %struct.task* %17, i32 0, i32 3, !dbg !149
  %19 = load %struct.packet** %18, align 8, !dbg !149
  %20 = icmp eq %struct.packet* %19, null, !dbg !149
  %21 = select i1 %20, i32 0, i32 1, !dbg !149
  %22 = load %struct.task** @tcb, align 8, !dbg !149
  %23 = getelementptr inbounds %struct.task* %22, i32 0, i32 4, !dbg !149
  store i32 %21, i32* %23, align 4, !dbg !149
  br label %24, !dbg !149

; <label>:24                                      ; preds = %4, %4, %8
  %25 = load %struct.task** @tcb, align 8, !dbg !150
  %26 = getelementptr inbounds %struct.task* %25, i32 0, i32 1, !dbg !150
  %27 = load i32* %26, align 4, !dbg !150
  %28 = sext i32 %27 to i64, !dbg !150
  store i64 %28, i64* @taskid, align 8, !dbg !150
  %29 = load %struct.task** @tcb, align 8, !dbg !151
  %30 = getelementptr inbounds %struct.task* %29, i32 0, i32 6, !dbg !151
  %31 = load i64* %30, align 8, !dbg !151
  store i64 %31, i64* @v1, align 8, !dbg !151
  %32 = load %struct.task** @tcb, align 8, !dbg !152
  %33 = getelementptr inbounds %struct.task* %32, i32 0, i32 7, !dbg !152
  %34 = load i64* %33, align 8, !dbg !152
  store i64 %34, i64* @v2, align 8, !dbg !152
  %35 = load i32* @tracing, align 4, !dbg !153
  %36 = icmp eq i32 %35, 1, !dbg !153
  br i1 %36, label %37, label %41, !dbg !153

; <label>:37                                      ; preds = %24
  %38 = load i64* @taskid, align 8, !dbg !153
  %39 = add nsw i64 %38, 48, !dbg !153
  %40 = trunc i64 %39 to i8, !dbg !153
  call void @trace(i8 signext %40), !dbg !153
  br label %41, !dbg !153

; <label>:41                                      ; preds = %37, %24
  %42 = load %struct.task** @tcb, align 8, !dbg !155
  %43 = getelementptr inbounds %struct.task* %42, i32 0, i32 5, !dbg !155
  %44 = load %struct.task* (%struct.packet*)** %43, align 8, !dbg !155
  %45 = load %struct.packet** %pkt, align 8, !dbg !155
  %46 = call %struct.task* %44(%struct.packet* %45), !dbg !155
  store %struct.task* %46, %struct.task** %newtcb, align 8, !dbg !155
  %47 = load i64* @v1, align 8, !dbg !156
  %48 = load %struct.task** @tcb, align 8, !dbg !156
  %49 = getelementptr inbounds %struct.task* %48, i32 0, i32 6, !dbg !156
  store i64 %47, i64* %49, align 8, !dbg !156
  %50 = load i64* @v2, align 8, !dbg !157
  %51 = load %struct.task** @tcb, align 8, !dbg !157
  %52 = getelementptr inbounds %struct.task* %51, i32 0, i32 7, !dbg !157
  store i64 %50, i64* %52, align 8, !dbg !157
  %53 = load %struct.task** %newtcb, align 8, !dbg !158
  store %struct.task* %53, %struct.task** @tcb, align 8, !dbg !158
  br label %59, !dbg !159

; <label>:54                                      ; preds = %4, %4, %4, %4, %4
  %55 = load %struct.task** @tcb, align 8, !dbg !160
  %56 = getelementptr inbounds %struct.task* %55, i32 0, i32 0, !dbg !160
  %57 = load %struct.task** %56, align 8, !dbg !160
  store %struct.task* %57, %struct.task** @tcb, align 8, !dbg !160
  br label %59, !dbg !161

; <label>:58                                      ; preds = %4
  br label %60, !dbg !162

; <label>:59                                      ; preds = %54, %41
  br label %1, !dbg !163

; <label>:60                                      ; preds = %58, %1
  ret void, !dbg !164
}

; Function Attrs: nounwind uwtable
define %struct.task* @Wait() #0 {
  %1 = load %struct.task** @tcb, align 8, !dbg !165
  %2 = getelementptr inbounds %struct.task* %1, i32 0, i32 4, !dbg !165
  %3 = load i32* %2, align 4, !dbg !165
  %4 = or i32 %3, 2, !dbg !165
  store i32 %4, i32* %2, align 4, !dbg !165
  %5 = load %struct.task** @tcb, align 8, !dbg !166
  ret %struct.task* %5, !dbg !166
}

; Function Attrs: nounwind uwtable
define %struct.task* @holdself() #0 {
  %1 = load i32* @holdcount, align 4, !dbg !167
  %2 = add nsw i32 %1, 1, !dbg !167
  store i32 %2, i32* @holdcount, align 4, !dbg !167
  %3 = load %struct.task** @tcb, align 8, !dbg !168
  %4 = getelementptr inbounds %struct.task* %3, i32 0, i32 4, !dbg !168
  %5 = load i32* %4, align 4, !dbg !168
  %6 = or i32 %5, 4, !dbg !168
  store i32 %6, i32* %4, align 4, !dbg !168
  %7 = load %struct.task** @tcb, align 8, !dbg !169
  %8 = getelementptr inbounds %struct.task* %7, i32 0, i32 0, !dbg !169
  %9 = load %struct.task** %8, align 8, !dbg !169
  ret %struct.task* %9, !dbg !169
}

; Function Attrs: nounwind uwtable
define %struct.task* @findtcb(i32 %id) #0 {
  %1 = alloca i32, align 4
  %t = alloca %struct.task*, align 8
  store i32 %id, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !170), !dbg !171
  call void @llvm.dbg.declare(metadata !{%struct.task** %t}, metadata !172), !dbg !173
  store %struct.task* null, %struct.task** %t, align 8, !dbg !173
  %2 = load i32* %1, align 4, !dbg !174
  %3 = icmp sle i32 1, %2, !dbg !174
  br i1 %3, label %4, label %13, !dbg !174

; <label>:4                                       ; preds = %0
  %5 = load i32* %1, align 4, !dbg !174
  %6 = sext i32 %5 to i64, !dbg !174
  %7 = icmp sle i64 %6, 10, !dbg !174
  br i1 %7, label %8, label %13, !dbg !174

; <label>:8                                       ; preds = %4
  %9 = load i32* %1, align 4, !dbg !176
  %10 = sext i32 %9 to i64, !dbg !176
  %11 = getelementptr inbounds [11 x %struct.task*]* @tasktab, i32 0, i64 %10, !dbg !176
  %12 = load %struct.task** %11, align 8, !dbg !176
  store %struct.task* %12, %struct.task** %t, align 8, !dbg !176
  br label %13, !dbg !176

; <label>:13                                      ; preds = %8, %4, %0
  %14 = load %struct.task** %t, align 8, !dbg !177
  %15 = icmp eq %struct.task* %14, null, !dbg !177
  br i1 %15, label %16, label %19, !dbg !177

; <label>:16                                      ; preds = %13
  %17 = load i32* %1, align 4, !dbg !177
  %18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0), i32 %17), !dbg !177
  br label %19, !dbg !177

; <label>:19                                      ; preds = %16, %13
  %20 = load %struct.task** %t, align 8, !dbg !179
  ret %struct.task* %20, !dbg !179
}

; Function Attrs: nounwind uwtable
define %struct.task* @release(i32 %id) #0 {
  %1 = alloca %struct.task*, align 8
  %2 = alloca i32, align 4
  %t = alloca %struct.task*, align 8
  store i32 %id, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !180), !dbg !181
  call void @llvm.dbg.declare(metadata !{%struct.task** %t}, metadata !182), !dbg !183
  %3 = load i32* %2, align 4, !dbg !184
  %4 = call %struct.task* @findtcb(i32 %3), !dbg !184
  store %struct.task* %4, %struct.task** %t, align 8, !dbg !184
  %5 = load %struct.task** %t, align 8, !dbg !185
  %6 = icmp eq %struct.task* %5, null, !dbg !185
  br i1 %6, label %7, label %8, !dbg !185

; <label>:7                                       ; preds = %0
  store %struct.task* null, %struct.task** %1, !dbg !185
  br label %24, !dbg !185

; <label>:8                                       ; preds = %0
  %9 = load %struct.task** %t, align 8, !dbg !187
  %10 = getelementptr inbounds %struct.task* %9, i32 0, i32 4, !dbg !187
  %11 = load i32* %10, align 4, !dbg !187
  %12 = and i32 %11, 65531, !dbg !187
  store i32 %12, i32* %10, align 4, !dbg !187
  %13 = load %struct.task** %t, align 8, !dbg !188
  %14 = getelementptr inbounds %struct.task* %13, i32 0, i32 2, !dbg !188
  %15 = load i32* %14, align 4, !dbg !188
  %16 = load %struct.task** @tcb, align 8, !dbg !188
  %17 = getelementptr inbounds %struct.task* %16, i32 0, i32 2, !dbg !188
  %18 = load i32* %17, align 4, !dbg !188
  %19 = icmp sgt i32 %15, %18, !dbg !188
  br i1 %19, label %20, label %22, !dbg !188

; <label>:20                                      ; preds = %8
  %21 = load %struct.task** %t, align 8, !dbg !188
  store %struct.task* %21, %struct.task** %1, !dbg !188
  br label %24, !dbg !188

; <label>:22                                      ; preds = %8
  %23 = load %struct.task** @tcb, align 8, !dbg !190
  store %struct.task* %23, %struct.task** %1, !dbg !190
  br label %24, !dbg !190

; <label>:24                                      ; preds = %22, %20, %7
  %25 = load %struct.task** %1, !dbg !191
  ret %struct.task* %25, !dbg !191
}

; Function Attrs: nounwind uwtable
define %struct.task* @qpkt(%struct.packet* %pkt) #0 {
  %1 = alloca %struct.task*, align 8
  %2 = alloca %struct.packet*, align 8
  %t = alloca %struct.task*, align 8
  store %struct.packet* %pkt, %struct.packet** %2, align 8
  call void @llvm.dbg.declare(metadata !{%struct.packet** %2}, metadata !192), !dbg !193
  call void @llvm.dbg.declare(metadata !{%struct.task** %t}, metadata !194), !dbg !195
  %3 = load %struct.packet** %2, align 8, !dbg !196
  %4 = getelementptr inbounds %struct.packet* %3, i32 0, i32 1, !dbg !196
  %5 = load i32* %4, align 4, !dbg !196
  %6 = call %struct.task* @findtcb(i32 %5), !dbg !196
  store %struct.task* %6, %struct.task** %t, align 8, !dbg !196
  %7 = load %struct.task** %t, align 8, !dbg !197
  %8 = icmp eq %struct.task* %7, null, !dbg !197
  br i1 %8, label %9, label %11, !dbg !197

; <label>:9                                       ; preds = %0
  %10 = load %struct.task** %t, align 8, !dbg !197
  store %struct.task* %10, %struct.task** %1, !dbg !197
  br label %49, !dbg !197

; <label>:11                                      ; preds = %0
  %12 = load i32* @qpktcount, align 4, !dbg !199
  %13 = add nsw i32 %12, 1, !dbg !199
  store i32 %13, i32* @qpktcount, align 4, !dbg !199
  %14 = load %struct.packet** %2, align 8, !dbg !200
  %15 = getelementptr inbounds %struct.packet* %14, i32 0, i32 0, !dbg !200
  store %struct.packet* null, %struct.packet** %15, align 8, !dbg !200
  %16 = load i64* @taskid, align 8, !dbg !201
  %17 = trunc i64 %16 to i32, !dbg !201
  %18 = load %struct.packet** %2, align 8, !dbg !201
  %19 = getelementptr inbounds %struct.packet* %18, i32 0, i32 1, !dbg !201
  store i32 %17, i32* %19, align 4, !dbg !201
  %20 = load %struct.task** %t, align 8, !dbg !202
  %21 = getelementptr inbounds %struct.task* %20, i32 0, i32 3, !dbg !202
  %22 = load %struct.packet** %21, align 8, !dbg !202
  %23 = icmp eq %struct.packet* %22, null, !dbg !202
  br i1 %23, label %24, label %42, !dbg !202

; <label>:24                                      ; preds = %11
  %25 = load %struct.packet** %2, align 8, !dbg !204
  %26 = load %struct.task** %t, align 8, !dbg !204
  %27 = getelementptr inbounds %struct.task* %26, i32 0, i32 3, !dbg !204
  store %struct.packet* %25, %struct.packet** %27, align 8, !dbg !204
  %28 = load %struct.task** %t, align 8, !dbg !206
  %29 = getelementptr inbounds %struct.task* %28, i32 0, i32 4, !dbg !206
  %30 = load i32* %29, align 4, !dbg !206
  %31 = or i32 %30, 1, !dbg !206
  store i32 %31, i32* %29, align 4, !dbg !206
  %32 = load %struct.task** %t, align 8, !dbg !207
  %33 = getelementptr inbounds %struct.task* %32, i32 0, i32 2, !dbg !207
  %34 = load i32* %33, align 4, !dbg !207
  %35 = load %struct.task** @tcb, align 8, !dbg !207
  %36 = getelementptr inbounds %struct.task* %35, i32 0, i32 2, !dbg !207
  %37 = load i32* %36, align 4, !dbg !207
  %38 = icmp sgt i32 %34, %37, !dbg !207
  br i1 %38, label %39, label %41, !dbg !207

; <label>:39                                      ; preds = %24
  %40 = load %struct.task** %t, align 8, !dbg !207
  store %struct.task* %40, %struct.task** %1, !dbg !207
  br label %49, !dbg !207

; <label>:41                                      ; preds = %24
  br label %47, !dbg !209

; <label>:42                                      ; preds = %11
  %43 = load %struct.packet** %2, align 8, !dbg !210
  %44 = load %struct.task** %t, align 8, !dbg !210
  %45 = getelementptr inbounds %struct.task* %44, i32 0, i32 3, !dbg !210
  %46 = bitcast %struct.packet** %45 to %struct.packet*, !dbg !210
  call void @append(%struct.packet* %43, %struct.packet* %46), !dbg !210
  br label %47

; <label>:47                                      ; preds = %42, %41
  %48 = load %struct.task** @tcb, align 8, !dbg !212
  store %struct.task* %48, %struct.task** %1, !dbg !212
  br label %49, !dbg !212

; <label>:49                                      ; preds = %47, %39, %9
  %50 = load %struct.task** %1, !dbg !213
  ret %struct.task* %50, !dbg !213
}

; Function Attrs: nounwind uwtable
define void @append(%struct.packet* %pkt, %struct.packet* %ptr) #0 {
  %1 = alloca %struct.packet*, align 8
  %2 = alloca %struct.packet*, align 8
  store %struct.packet* %pkt, %struct.packet** %1, align 8
  call void @llvm.dbg.declare(metadata !{%struct.packet** %1}, metadata !214), !dbg !215
  store %struct.packet* %ptr, %struct.packet** %2, align 8
  call void @llvm.dbg.declare(metadata !{%struct.packet** %2}, metadata !216), !dbg !215
  %3 = load %struct.packet** %1, align 8, !dbg !217
  %4 = getelementptr inbounds %struct.packet* %3, i32 0, i32 0, !dbg !217
  store %struct.packet* null, %struct.packet** %4, align 8, !dbg !217
  br label %5, !dbg !218

; <label>:5                                       ; preds = %10, %0
  %6 = load %struct.packet** %2, align 8, !dbg !218
  %7 = getelementptr inbounds %struct.packet* %6, i32 0, i32 0, !dbg !218
  %8 = load %struct.packet** %7, align 8, !dbg !218
  %9 = icmp ne %struct.packet* %8, null, !dbg !218
  br i1 %9, label %10, label %14, !dbg !218

; <label>:10                                      ; preds = %5
  %11 = load %struct.packet** %2, align 8, !dbg !218
  %12 = getelementptr inbounds %struct.packet* %11, i32 0, i32 0, !dbg !218
  %13 = load %struct.packet** %12, align 8, !dbg !218
  store %struct.packet* %13, %struct.packet** %2, align 8, !dbg !218
  br label %5, !dbg !218

; <label>:14                                      ; preds = %5
  %15 = load %struct.packet** %1, align 8, !dbg !219
  %16 = load %struct.packet** %2, align 8, !dbg !219
  %17 = getelementptr inbounds %struct.packet* %16, i32 0, i32 0, !dbg !219
  store %struct.packet* %15, %struct.packet** %17, align 8, !dbg !219
  ret void, !dbg !220
}

; Function Attrs: nounwind uwtable
define %struct.task* @idlefn(%struct.packet* %pkt) #0 {
  %1 = alloca %struct.task*, align 8
  %2 = alloca %struct.packet*, align 8
  store %struct.packet* %pkt, %struct.packet** %2, align 8
  call void @llvm.dbg.declare(metadata !{%struct.packet** %2}, metadata !221), !dbg !222
  %3 = load i64* @v2, align 8, !dbg !223
  %4 = add nsw i64 %3, -1, !dbg !223
  store i64 %4, i64* @v2, align 8, !dbg !223
  %5 = load i64* @v2, align 8, !dbg !224
  %6 = icmp eq i64 %5, 0, !dbg !224
  br i1 %6, label %7, label %9, !dbg !224

; <label>:7                                       ; preds = %0
  %8 = call %struct.task* @holdself(), !dbg !224
  store %struct.task* %8, %struct.task** %1, !dbg !224
  br label %24, !dbg !224

; <label>:9                                       ; preds = %0
  %10 = load i64* @v1, align 8, !dbg !226
  %11 = and i64 %10, 1, !dbg !226
  %12 = icmp eq i64 %11, 0, !dbg !226
  br i1 %12, label %13, label %18, !dbg !226

; <label>:13                                      ; preds = %9
  %14 = load i64* @v1, align 8, !dbg !228
  %15 = ashr i64 %14, 1, !dbg !228
  %16 = and i64 %15, 32767, !dbg !228
  store i64 %16, i64* @v1, align 8, !dbg !228
  %17 = call %struct.task* @release(i32 5), !dbg !230
  store %struct.task* %17, %struct.task** %1, !dbg !230
  br label %24, !dbg !230

; <label>:18                                      ; preds = %9
  %19 = load i64* @v1, align 8, !dbg !231
  %20 = ashr i64 %19, 1, !dbg !231
  %21 = and i64 %20, 32767, !dbg !231
  %22 = xor i64 %21, 53256, !dbg !231
  store i64 %22, i64* @v1, align 8, !dbg !231
  %23 = call %struct.task* @release(i32 6), !dbg !233
  store %struct.task* %23, %struct.task** %1, !dbg !233
  br label %24, !dbg !233

; <label>:24                                      ; preds = %18, %13, %7
  %25 = load %struct.task** %1, !dbg !234
  ret %struct.task* %25, !dbg !234
}

; Function Attrs: nounwind uwtable
define %struct.task* @workfn(%struct.packet* %pkt) #0 {
  %1 = alloca %struct.task*, align 8
  %2 = alloca %struct.packet*, align 8
  %i = alloca i32, align 4
  store %struct.packet* %pkt, %struct.packet** %2, align 8
  call void @llvm.dbg.declare(metadata !{%struct.packet** %2}, metadata !235), !dbg !236
  %3 = load %struct.packet** %2, align 8, !dbg !237
  %4 = icmp eq %struct.packet* %3, null, !dbg !237
  br i1 %4, label %5, label %7, !dbg !237

; <label>:5                                       ; preds = %0
  %6 = call %struct.task* @Wait(), !dbg !237
  store %struct.task* %6, %struct.task** %1, !dbg !237
  br label %40, !dbg !237

; <label>:7                                       ; preds = %0
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !239), !dbg !241
  %8 = load i64* @v1, align 8, !dbg !242
  %9 = sub nsw i64 7, %8, !dbg !242
  store i64 %9, i64* @v1, align 8, !dbg !242
  %10 = load i64* @v1, align 8, !dbg !243
  %11 = trunc i64 %10 to i32, !dbg !243
  %12 = load %struct.packet** %2, align 8, !dbg !243
  %13 = getelementptr inbounds %struct.packet* %12, i32 0, i32 1, !dbg !243
  store i32 %11, i32* %13, align 4, !dbg !243
  %14 = load %struct.packet** %2, align 8, !dbg !244
  %15 = getelementptr inbounds %struct.packet* %14, i32 0, i32 3, !dbg !244
  store i32 0, i32* %15, align 4, !dbg !244
  store i32 0, i32* %i, align 4, !dbg !245
  br label %16, !dbg !245

; <label>:16                                      ; preds = %34, %7
  %17 = load i32* %i, align 4, !dbg !245
  %18 = icmp sle i32 %17, 3, !dbg !245
  br i1 %18, label %19, label %37, !dbg !245

; <label>:19                                      ; preds = %16
  %20 = load i64* @v2, align 8, !dbg !247
  %21 = add nsw i64 %20, 1, !dbg !247
  store i64 %21, i64* @v2, align 8, !dbg !247
  %22 = load i64* @v2, align 8, !dbg !249
  %23 = icmp sgt i64 %22, 26, !dbg !249
  br i1 %23, label %24, label %25, !dbg !249

; <label>:24                                      ; preds = %19
  store i64 1, i64* @v2, align 8, !dbg !249
  br label %25, !dbg !249

; <label>:25                                      ; preds = %24, %19
  %26 = load i64* @v2, align 8, !dbg !251
  %27 = getelementptr inbounds [28 x i8]* @alphabet, i32 0, i64 %26, !dbg !251
  %28 = load i8* %27, align 1, !dbg !251
  %29 = load i32* %i, align 4, !dbg !251
  %30 = sext i32 %29 to i64, !dbg !251
  %31 = load %struct.packet** %2, align 8, !dbg !251
  %32 = getelementptr inbounds %struct.packet* %31, i32 0, i32 4, !dbg !251
  %33 = getelementptr inbounds [4 x i8]* %32, i32 0, i64 %30, !dbg !251
  store i8 %28, i8* %33, align 1, !dbg !251
  br label %34, !dbg !252

; <label>:34                                      ; preds = %25
  %35 = load i32* %i, align 4, !dbg !245
  %36 = add nsw i32 %35, 1, !dbg !245
  store i32 %36, i32* %i, align 4, !dbg !245
  br label %16, !dbg !245

; <label>:37                                      ; preds = %16
  %38 = load %struct.packet** %2, align 8, !dbg !253
  %39 = call %struct.task* @qpkt(%struct.packet* %38), !dbg !253
  store %struct.task* %39, %struct.task** %1, !dbg !253
  br label %40, !dbg !253

; <label>:40                                      ; preds = %37, %5
  %41 = load %struct.task** %1, !dbg !254
  ret %struct.task* %41, !dbg !254
}

; Function Attrs: nounwind uwtable
define %struct.task* @handlerfn(%struct.packet* %pkt) #0 {
  %1 = alloca %struct.task*, align 8
  %2 = alloca %struct.packet*, align 8
  %count = alloca i32, align 4
  %workpkt = alloca %struct.packet*, align 8
  %devpkt = alloca %struct.packet*, align 8
  store %struct.packet* %pkt, %struct.packet** %2, align 8
  call void @llvm.dbg.declare(metadata !{%struct.packet** %2}, metadata !255), !dbg !256
  %3 = load %struct.packet** %2, align 8, !dbg !257
  %4 = icmp ne %struct.packet* %3, null, !dbg !257
  br i1 %4, label %5, label %13, !dbg !257

; <label>:5                                       ; preds = %0
  %6 = load %struct.packet** %2, align 8, !dbg !257
  %7 = load %struct.packet** %2, align 8, !dbg !257
  %8 = getelementptr inbounds %struct.packet* %7, i32 0, i32 2, !dbg !257
  %9 = load i32* %8, align 4, !dbg !257
  %10 = icmp eq i32 %9, 1001, !dbg !257
  %11 = select i1 %10, i64* @v1, i64* @v2, !dbg !257
  %12 = bitcast i64* %11 to %struct.packet*, !dbg !257
  call void @append(%struct.packet* %6, %struct.packet* %12), !dbg !257
  br label %13, !dbg !257

; <label>:13                                      ; preds = %5, %0
  %14 = load i64* @v1, align 8, !dbg !259
  %15 = icmp ne i64 %14, 0, !dbg !259
  br i1 %15, label %16, label %59, !dbg !259

; <label>:16                                      ; preds = %13
  call void @llvm.dbg.declare(metadata !{i32* %count}, metadata !261), !dbg !263
  call void @llvm.dbg.declare(metadata !{%struct.packet** %workpkt}, metadata !264), !dbg !265
  %17 = load i64* @v1, align 8, !dbg !265
  %18 = inttoptr i64 %17 to %struct.packet*, !dbg !265
  store %struct.packet* %18, %struct.packet** %workpkt, align 8, !dbg !265
  %19 = load %struct.packet** %workpkt, align 8, !dbg !266
  %20 = getelementptr inbounds %struct.packet* %19, i32 0, i32 3, !dbg !266
  %21 = load i32* %20, align 4, !dbg !266
  store i32 %21, i32* %count, align 4, !dbg !266
  %22 = load i32* %count, align 4, !dbg !267
  %23 = icmp sgt i32 %22, 3, !dbg !267
  br i1 %23, label %24, label %32, !dbg !267

; <label>:24                                      ; preds = %16
  %25 = load i64* @v1, align 8, !dbg !269
  %26 = inttoptr i64 %25 to %struct.packet*, !dbg !269
  %27 = getelementptr inbounds %struct.packet* %26, i32 0, i32 0, !dbg !269
  %28 = load %struct.packet** %27, align 8, !dbg !269
  %29 = ptrtoint %struct.packet* %28 to i64, !dbg !269
  store i64 %29, i64* @v1, align 8, !dbg !269
  %30 = load %struct.packet** %workpkt, align 8, !dbg !271
  %31 = call %struct.task* @qpkt(%struct.packet* %30), !dbg !271
  store %struct.task* %31, %struct.task** %1, !dbg !271
  br label %61, !dbg !271

; <label>:32                                      ; preds = %16
  %33 = load i64* @v2, align 8, !dbg !272
  %34 = icmp ne i64 %33, 0, !dbg !272
  br i1 %34, label %35, label %58, !dbg !272

; <label>:35                                      ; preds = %32
  call void @llvm.dbg.declare(metadata !{%struct.packet** %devpkt}, metadata !274), !dbg !276
  %36 = load i64* @v2, align 8, !dbg !277
  %37 = inttoptr i64 %36 to %struct.packet*, !dbg !277
  store %struct.packet* %37, %struct.packet** %devpkt, align 8, !dbg !277
  %38 = load i64* @v2, align 8, !dbg !278
  %39 = inttoptr i64 %38 to %struct.packet*, !dbg !278
  %40 = getelementptr inbounds %struct.packet* %39, i32 0, i32 0, !dbg !278
  %41 = load %struct.packet** %40, align 8, !dbg !278
  %42 = ptrtoint %struct.packet* %41 to i64, !dbg !278
  store i64 %42, i64* @v2, align 8, !dbg !278
  %43 = load i32* %count, align 4, !dbg !279
  %44 = sext i32 %43 to i64, !dbg !279
  %45 = load %struct.packet** %workpkt, align 8, !dbg !279
  %46 = getelementptr inbounds %struct.packet* %45, i32 0, i32 4, !dbg !279
  %47 = getelementptr inbounds [4 x i8]* %46, i32 0, i64 %44, !dbg !279
  %48 = load i8* %47, align 1, !dbg !279
  %49 = sext i8 %48 to i32, !dbg !279
  %50 = load %struct.packet** %devpkt, align 8, !dbg !279
  %51 = getelementptr inbounds %struct.packet* %50, i32 0, i32 3, !dbg !279
  store i32 %49, i32* %51, align 4, !dbg !279
  %52 = load i32* %count, align 4, !dbg !280
  %53 = add nsw i32 %52, 1, !dbg !280
  %54 = load %struct.packet** %workpkt, align 8, !dbg !280
  %55 = getelementptr inbounds %struct.packet* %54, i32 0, i32 3, !dbg !280
  store i32 %53, i32* %55, align 4, !dbg !280
  %56 = load %struct.packet** %devpkt, align 8, !dbg !281
  %57 = call %struct.task* @qpkt(%struct.packet* %56), !dbg !281
  store %struct.task* %57, %struct.task** %1, !dbg !281
  br label %61, !dbg !281

; <label>:58                                      ; preds = %32
  br label %59, !dbg !282

; <label>:59                                      ; preds = %58, %13
  %60 = call %struct.task* @Wait(), !dbg !283
  store %struct.task* %60, %struct.task** %1, !dbg !283
  br label %61, !dbg !283

; <label>:61                                      ; preds = %59, %35, %24
  %62 = load %struct.task** %1, !dbg !284
  ret %struct.task* %62, !dbg !284
}

; Function Attrs: nounwind uwtable
define %struct.task* @devfn(%struct.packet* %pkt) #0 {
  %1 = alloca %struct.task*, align 8
  %2 = alloca %struct.packet*, align 8
  store %struct.packet* %pkt, %struct.packet** %2, align 8
  call void @llvm.dbg.declare(metadata !{%struct.packet** %2}, metadata !285), !dbg !286
  %3 = load %struct.packet** %2, align 8, !dbg !287
  %4 = icmp eq %struct.packet* %3, null, !dbg !287
  br i1 %4, label %5, label %15, !dbg !287

; <label>:5                                       ; preds = %0
  %6 = load i64* @v1, align 8, !dbg !289
  %7 = icmp eq i64 %6, 0, !dbg !289
  br i1 %7, label %8, label %10, !dbg !289

; <label>:8                                       ; preds = %5
  %9 = call %struct.task* @Wait(), !dbg !289
  store %struct.task* %9, %struct.task** %1, !dbg !289
  br label %27, !dbg !289

; <label>:10                                      ; preds = %5
  %11 = load i64* @v1, align 8, !dbg !292
  %12 = inttoptr i64 %11 to %struct.packet*, !dbg !292
  store %struct.packet* %12, %struct.packet** %2, align 8, !dbg !292
  store i64 0, i64* @v1, align 8, !dbg !293
  %13 = load %struct.packet** %2, align 8, !dbg !294
  %14 = call %struct.task* @qpkt(%struct.packet* %13), !dbg !294
  store %struct.task* %14, %struct.task** %1, !dbg !294
  br label %27, !dbg !294

; <label>:15                                      ; preds = %0
  %16 = load %struct.packet** %2, align 8, !dbg !295
  %17 = ptrtoint %struct.packet* %16 to i64, !dbg !295
  store i64 %17, i64* @v1, align 8, !dbg !295
  %18 = load i32* @tracing, align 4, !dbg !297
  %19 = icmp eq i32 %18, 1, !dbg !297
  br i1 %19, label %20, label %25, !dbg !297

; <label>:20                                      ; preds = %15
  %21 = load %struct.packet** %2, align 8, !dbg !297
  %22 = getelementptr inbounds %struct.packet* %21, i32 0, i32 3, !dbg !297
  %23 = load i32* %22, align 4, !dbg !297
  %24 = trunc i32 %23 to i8, !dbg !297
  call void @trace(i8 signext %24), !dbg !297
  br label %25, !dbg !297

; <label>:25                                      ; preds = %20, %15
  %26 = call %struct.task* @holdself(), !dbg !299
  store %struct.task* %26, %struct.task** %1, !dbg !299
  br label %27, !dbg !299

; <label>:27                                      ; preds = %25, %10, %8
  %28 = load %struct.task** %1, !dbg !300
  ret %struct.task* %28, !dbg !300
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %wkq = alloca %struct.packet*, align 8
  %retval = alloca i32, align 4
  store i32 0, i32* %1
  call void @llvm.dbg.declare(metadata !{%struct.packet** %wkq}, metadata !301), !dbg !302
  store %struct.packet* null, %struct.packet** %wkq, align 8, !dbg !302
  call void @llvm.dbg.declare(metadata !{i32* %retval}, metadata !303), !dbg !304
  %2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str3, i32 0, i32 0)), !dbg !305
  %3 = load %struct.packet** %wkq, align 8, !dbg !306
  call void @createtask(i32 1, i32 0, %struct.packet* %3, i32 0, %struct.task* (%struct.packet*)* @idlefn, i64 1, i64 10000000), !dbg !306
  %4 = call %struct.packet* @pkt(%struct.packet* null, i32 0, i32 1001), !dbg !307
  store %struct.packet* %4, %struct.packet** %wkq, align 8, !dbg !307
  %5 = load %struct.packet** %wkq, align 8, !dbg !308
  %6 = call %struct.packet* @pkt(%struct.packet* %5, i32 0, i32 1001), !dbg !308
  store %struct.packet* %6, %struct.packet** %wkq, align 8, !dbg !308
  %7 = load %struct.packet** %wkq, align 8, !dbg !309
  call void @createtask(i32 2, i32 1000, %struct.packet* %7, i32 3, %struct.task* (%struct.packet*)* @workfn, i64 3, i64 0), !dbg !309
  %8 = call %struct.packet* @pkt(%struct.packet* null, i32 5, i32 1000), !dbg !310
  store %struct.packet* %8, %struct.packet** %wkq, align 8, !dbg !310
  %9 = load %struct.packet** %wkq, align 8, !dbg !311
  %10 = call %struct.packet* @pkt(%struct.packet* %9, i32 5, i32 1000), !dbg !311
  store %struct.packet* %10, %struct.packet** %wkq, align 8, !dbg !311
  %11 = load %struct.packet** %wkq, align 8, !dbg !312
  %12 = call %struct.packet* @pkt(%struct.packet* %11, i32 5, i32 1000), !dbg !312
  store %struct.packet* %12, %struct.packet** %wkq, align 8, !dbg !312
  %13 = load %struct.packet** %wkq, align 8, !dbg !313
  call void @createtask(i32 3, i32 2000, %struct.packet* %13, i32 3, %struct.task* (%struct.packet*)* @handlerfn, i64 0, i64 0), !dbg !313
  %14 = call %struct.packet* @pkt(%struct.packet* null, i32 6, i32 1000), !dbg !314
  store %struct.packet* %14, %struct.packet** %wkq, align 8, !dbg !314
  %15 = load %struct.packet** %wkq, align 8, !dbg !315
  %16 = call %struct.packet* @pkt(%struct.packet* %15, i32 6, i32 1000), !dbg !315
  store %struct.packet* %16, %struct.packet** %wkq, align 8, !dbg !315
  %17 = load %struct.packet** %wkq, align 8, !dbg !316
  %18 = call %struct.packet* @pkt(%struct.packet* %17, i32 6, i32 1000), !dbg !316
  store %struct.packet* %18, %struct.packet** %wkq, align 8, !dbg !316
  %19 = load %struct.packet** %wkq, align 8, !dbg !317
  call void @createtask(i32 4, i32 3000, %struct.packet* %19, i32 3, %struct.task* (%struct.packet*)* @handlerfn, i64 0, i64 0), !dbg !317
  store %struct.packet* null, %struct.packet** %wkq, align 8, !dbg !318
  %20 = load %struct.packet** %wkq, align 8, !dbg !319
  call void @createtask(i32 5, i32 4000, %struct.packet* %20, i32 2, %struct.task* (%struct.packet*)* @devfn, i64 0, i64 0), !dbg !319
  %21 = load %struct.packet** %wkq, align 8, !dbg !320
  call void @createtask(i32 6, i32 5000, %struct.packet* %21, i32 2, %struct.task* (%struct.packet*)* @devfn, i64 0, i64 0), !dbg !320
  %22 = load %struct.task** @tasklist, align 8, !dbg !321
  store %struct.task* %22, %struct.task** @tcb, align 8, !dbg !321
  store i32 0, i32* @holdcount, align 4, !dbg !322
  store i32 0, i32* @qpktcount, align 4, !dbg !322
  %23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str4, i32 0, i32 0)), !dbg !323
  store i32 0, i32* @tracing, align 4, !dbg !324
  store i32 0, i32* @layout, align 4, !dbg !325
  call void @schedule(), !dbg !326
  %24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str5, i32 0, i32 0)), !dbg !327
  %25 = load i32* @qpktcount, align 4, !dbg !328
  %26 = load i32* @holdcount, align 4, !dbg !328
  %27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str6, i32 0, i32 0), i32 %25, i32 %26), !dbg !328
  %28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str7, i32 0, i32 0)), !dbg !329
  %29 = load i32* @qpktcount, align 4, !dbg !330
  %30 = icmp eq i32 %29, 23263894, !dbg !330
  br i1 %30, label %31, label %36, !dbg !330

; <label>:31                                      ; preds = %0
  %32 = load i32* @holdcount, align 4, !dbg !330
  %33 = icmp eq i32 %32, 9305557, !dbg !330
  br i1 %33, label %34, label %36, !dbg !330

; <label>:34                                      ; preds = %31
  %35 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str8, i32 0, i32 0)), !dbg !332
  store i32 0, i32* %retval, align 4, !dbg !334
  br label %38, !dbg !335

; <label>:36                                      ; preds = %31, %0
  %37 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str9, i32 0, i32 0)), !dbg !336
  store i32 1, i32* %retval, align 4, !dbg !338
  br label %38

; <label>:38                                      ; preds = %36, %34
  %39 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str10, i32 0, i32 0)), !dbg !339
  %40 = load i32* %retval, align 4, !dbg !340
  ret i32 %40, !dbg !340
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!82, !83}
!llvm.ident = !{!84}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !64, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c] [DW_LANG_C99]
!1 = metadata !{metadata !"richards_benchmark.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !36, metadata !39, metadata !42, metadata !45, metadata !48, metadata !49, metadata !52, metadata !53, metadata !54, metadata !55, metadata !56, metadata !57, metadata !58, metadata !61}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"createtask", metadata !"createtask", metadata !"", i32 100, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32, i32, %struct.packet*, i32, %struct.task* (%struct.packet*)*, i64, i64)* @createtask, null, null, metadata !2, i32 107} ; [ DW_TAG_subprogram ] [line 100] [def] [scope 107] [createtask]
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
!36 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"pkt", metadata !"pkt", metadata !"", i32 122, metadata !37, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, %struct.packet* (%struct.packet*, i32, i32)* @pkt, null, null, metadata !2, i32 123} ; [ DW_TAG_subprogram ] [line 122] [def] [scope 123] [pkt]
!37 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !38, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!38 = metadata !{metadata !9, metadata !9, metadata !8, metadata !8}
!39 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"trace", metadata !"trace", metadata !"", i32 138, metadata !40, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i8)* @trace, null, null, metadata !2, i32 139} ; [ DW_TAG_subprogram ] [line 138] [def] [scope 139] [trace]
!40 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !41, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!41 = metadata !{null, metadata !18}
!42 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"schedule", metadata !"schedule", metadata !"", i32 149, metadata !43, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, void ()* @schedule, null, null, metadata !2, i32 150} ; [ DW_TAG_subprogram ] [line 149] [def] [scope 150] [schedule]
!43 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !44, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!44 = metadata !{null}
!45 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Wait", metadata !"Wait", metadata !"", i32 192, metadata !46, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, %struct.task* ()* @Wait, null, null, metadata !2, i32 193} ; [ DW_TAG_subprogram ] [line 192] [def] [scope 193] [Wait]
!46 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !47, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!47 = metadata !{metadata !24}
!48 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"holdself", metadata !"holdself", metadata !"", i32 198, metadata !46, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, %struct.task* ()* @holdself, null, null, metadata !2, i32 199} ; [ DW_TAG_subprogram ] [line 198] [def] [scope 199] [holdself]
!49 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"findtcb", metadata !"findtcb", metadata !"", i32 205, metadata !50, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, %struct.task* (i32)* @findtcb, null, null, metadata !2, i32 206} ; [ DW_TAG_subprogram ] [line 205] [def] [scope 206] [findtcb]
!50 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !51, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!51 = metadata !{metadata !24, metadata !8}
!52 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"release", metadata !"release", metadata !"", i32 215, metadata !50, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, %struct.task* (i32)* @release, null, null, metadata !2, i32 216} ; [ DW_TAG_subprogram ] [line 215] [def] [scope 216] [release]
!53 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"qpkt", metadata !"qpkt", metadata !"", i32 229, metadata !22, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, %struct.task* (%struct.packet*)* @qpkt, null, null, metadata !2, i32 230} ; [ DW_TAG_subprogram ] [line 229] [def] [scope 230] [qpkt]
!54 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"idlefn", metadata !"idlefn", metadata !"", i32 255, metadata !22, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, %struct.task* (%struct.packet*)* @idlefn, null, null, metadata !2, i32 256} ; [ DW_TAG_subprogram ] [line 255] [def] [scope 256] [idlefn]
!55 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"workfn", metadata !"workfn", metadata !"", i32 272, metadata !22, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, %struct.task* (%struct.packet*)* @workfn, null, null, metadata !2, i32 273} ; [ DW_TAG_subprogram ] [line 272] [def] [scope 273] [workfn]
!56 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"handlerfn", metadata !"handlerfn", metadata !"", i32 293, metadata !22, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, %struct.task* (%struct.packet*)* @handlerfn, null, null, metadata !2, i32 294} ; [ DW_TAG_subprogram ] [line 293] [def] [scope 294] [handlerfn]
!57 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"devfn", metadata !"devfn", metadata !"", i32 324, metadata !22, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, %struct.task* (%struct.packet*)* @devfn, null, null, metadata !2, i32 325} ; [ DW_TAG_subprogram ] [line 324] [def] [scope 325] [devfn]
!58 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"append", metadata !"append", metadata !"", i32 341, metadata !59, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.packet*, %struct.packet*)* @append, null, null, metadata !2, i32 342} ; [ DW_TAG_subprogram ] [line 341] [def] [scope 342] [append]
!59 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !60, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!60 = metadata !{null, metadata !9, metadata !9}
!61 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 350, metadata !62, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 351} ; [ DW_TAG_subprogram ] [line 350] [def] [scope 351] [main]
!62 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !63, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!63 = metadata !{metadata !8}
!64 = metadata !{metadata !65, metadata !69, metadata !73, metadata !74, metadata !75, metadata !76, metadata !77, metadata !78, metadata !79, metadata !80, metadata !81}
!65 = metadata !{i32 786484, i32 0, null, metadata !"alphabet", metadata !"alphabet", metadata !"", metadata !5, i32 86, metadata !66, i32 0, i32 1, [28 x i8]* @alphabet, null} ; [ DW_TAG_variable ] [alphabet] [line 86] [def]
!66 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 224, i64 8, i32 0, i32 0, metadata !18, metadata !67, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 224, align 8, offset 0] [from char]
!67 = metadata !{metadata !68}
!68 = metadata !{i32 786465, i64 0, i64 28}       ; [ DW_TAG_subrange_type ] [0, 27]
!69 = metadata !{i32 786484, i32 0, null, metadata !"tasktab", metadata !"tasktab", metadata !"", metadata !5, i32 87, metadata !70, i32 0, i32 1, [11 x %struct.task*]* @tasktab, null} ; [ DW_TAG_variable ] [tasktab] [line 87] [def]
!70 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 704, i64 64, i32 0, i32 0, metadata !24, metadata !71, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 704, align 64, offset 0] [from ]
!71 = metadata !{metadata !72}
!72 = metadata !{i32 786465, i64 0, i64 11}       ; [ DW_TAG_subrange_type ] [0, 10]
!73 = metadata !{i32 786484, i32 0, null, metadata !"tasklist", metadata !"tasklist", metadata !"", metadata !5, i32 88, metadata !24, i32 0, i32 1, %struct.task** @tasklist, null} ; [ DW_TAG_variable ] [tasklist] [line 88] [def]
!74 = metadata !{i32 786484, i32 0, null, metadata !"qpktcount", metadata !"qpktcount", metadata !"", metadata !5, i32 93, metadata !8, i32 0, i32 1, i32* @qpktcount, null} ; [ DW_TAG_variable ] [qpktcount] [line 93] [def]
!75 = metadata !{i32 786484, i32 0, null, metadata !"holdcount", metadata !"holdcount", metadata !"", metadata !5, i32 94, metadata !8, i32 0, i32 1, i32* @holdcount, null} ; [ DW_TAG_variable ] [holdcount] [line 94] [def]
!76 = metadata !{i32 786484, i32 0, null, metadata !"tracing", metadata !"tracing", metadata !"", metadata !5, i32 95, metadata !8, i32 0, i32 1, i32* @tracing, null} ; [ DW_TAG_variable ] [tracing] [line 95] [def]
!77 = metadata !{i32 786484, i32 0, null, metadata !"layout", metadata !"layout", metadata !"", metadata !5, i32 96, metadata !8, i32 0, i32 1, i32* @layout, null} ; [ DW_TAG_variable ] [layout] [line 96] [def]
!78 = metadata !{i32 786484, i32 0, null, metadata !"tcb", metadata !"tcb", metadata !"", metadata !5, i32 89, metadata !24, i32 0, i32 1, %struct.task** @tcb, null} ; [ DW_TAG_variable ] [tcb] [line 89] [def]
!79 = metadata !{i32 786484, i32 0, null, metadata !"taskid", metadata !"taskid", metadata !"", metadata !5, i32 90, metadata !34, i32 0, i32 1, i64* @taskid, null} ; [ DW_TAG_variable ] [taskid] [line 90] [def]
!80 = metadata !{i32 786484, i32 0, null, metadata !"v1", metadata !"v1", metadata !"", metadata !5, i32 91, metadata !34, i32 0, i32 1, i64* @v1, null} ; [ DW_TAG_variable ] [v1] [line 91] [def]
!81 = metadata !{i32 786484, i32 0, null, metadata !"v2", metadata !"v2", metadata !"", metadata !5, i32 92, metadata !34, i32 0, i32 1, i64* @v2, null} ; [ DW_TAG_variable ] [v2] [line 92] [def]
!82 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!83 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!84 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!85 = metadata !{i32 786689, metadata !4, metadata !"id", metadata !5, i32 16777316, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [id] [line 100]
!86 = metadata !{i32 100, i32 0, metadata !4, null}
!87 = metadata !{i32 786689, metadata !4, metadata !"pri", metadata !5, i32 33554533, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pri] [line 101]
!88 = metadata !{i32 101, i32 0, metadata !4, null}
!89 = metadata !{i32 786689, metadata !4, metadata !"wkq", metadata !5, i32 50331750, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wkq] [line 102]
!90 = metadata !{i32 102, i32 0, metadata !4, null}
!91 = metadata !{i32 786689, metadata !4, metadata !"state", metadata !5, i32 67108967, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [state] [line 103]
!92 = metadata !{i32 103, i32 0, metadata !4, null}
!93 = metadata !{i32 786689, metadata !4, metadata !"fn", metadata !5, i32 83886184, metadata !21, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fn] [line 104]
!94 = metadata !{i32 104, i32 0, metadata !4, null}
!95 = metadata !{i32 786689, metadata !4, metadata !"v1", metadata !5, i32 100663401, metadata !34, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [v1] [line 105]
!96 = metadata !{i32 105, i32 0, metadata !4, null}
!97 = metadata !{i32 786689, metadata !4, metadata !"v2", metadata !5, i32 117440618, metadata !34, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [v2] [line 106]
!98 = metadata !{i32 106, i32 0, metadata !4, null}
!99 = metadata !{i32 786688, metadata !4, metadata !"t", metadata !5, i32 108, metadata !24, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t] [line 108]
!100 = metadata !{i32 108, i32 0, metadata !4, null}
!101 = metadata !{i32 110, i32 0, metadata !4, null}
!102 = metadata !{i32 111, i32 0, metadata !4, null}
!103 = metadata !{i32 112, i32 0, metadata !4, null}
!104 = metadata !{i32 113, i32 0, metadata !4, null}
!105 = metadata !{i32 114, i32 0, metadata !4, null}
!106 = metadata !{i32 115, i32 0, metadata !4, null}
!107 = metadata !{i32 116, i32 0, metadata !4, null}
!108 = metadata !{i32 117, i32 0, metadata !4, null}
!109 = metadata !{i32 118, i32 0, metadata !4, null}
!110 = metadata !{i32 119, i32 0, metadata !4, null}
!111 = metadata !{i32 120, i32 0, metadata !4, null}
!112 = metadata !{i32 786689, metadata !36, metadata !"link", metadata !5, i32 16777338, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [link] [line 122]
!113 = metadata !{i32 122, i32 0, metadata !36, null}
!114 = metadata !{i32 786689, metadata !36, metadata !"id", metadata !5, i32 33554554, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [id] [line 122]
!115 = metadata !{i32 786689, metadata !36, metadata !"kind", metadata !5, i32 50331770, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 122]
!116 = metadata !{i32 786688, metadata !36, metadata !"i", metadata !5, i32 124, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 124]
!117 = metadata !{i32 124, i32 0, metadata !36, null}
!118 = metadata !{i32 786688, metadata !36, metadata !"p", metadata !5, i32 125, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [p] [line 125]
!119 = metadata !{i32 125, i32 0, metadata !36, null}
!120 = metadata !{i32 127, i32 0, metadata !121, null}
!121 = metadata !{i32 786443, metadata !1, metadata !36, i32 127, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!122 = metadata !{i32 128, i32 0, metadata !121, null}
!123 = metadata !{i32 130, i32 0, metadata !36, null}
!124 = metadata !{i32 131, i32 0, metadata !36, null}
!125 = metadata !{i32 132, i32 0, metadata !36, null}
!126 = metadata !{i32 133, i32 0, metadata !36, null}
!127 = metadata !{i32 135, i32 0, metadata !36, null}
!128 = metadata !{i32 786689, metadata !39, metadata !"a", metadata !5, i32 16777354, metadata !18, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [a] [line 138]
!129 = metadata !{i32 138, i32 0, metadata !39, null}
!130 = metadata !{i32 140, i32 0, metadata !131, null}
!131 = metadata !{i32 786443, metadata !1, metadata !39, i32 140, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!132 = metadata !{i32 142, i32 0, metadata !133, null}
!133 = metadata !{i32 786443, metadata !1, metadata !131, i32 141, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!134 = metadata !{i32 143, i32 0, metadata !133, null}
!135 = metadata !{i32 144, i32 0, metadata !133, null}
!136 = metadata !{i32 146, i32 0, metadata !39, null}
!137 = metadata !{i32 147, i32 0, metadata !39, null}
!138 = metadata !{i32 151, i32 0, metadata !42, null}
!139 = metadata !{i32 786688, metadata !140, metadata !"pkt", metadata !5, i32 153, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [pkt] [line 153]
!140 = metadata !{i32 786443, metadata !1, metadata !42, i32 152, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!141 = metadata !{i32 153, i32 0, metadata !140, null}
!142 = metadata !{i32 786688, metadata !140, metadata !"newtcb", metadata !5, i32 154, metadata !24, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [newtcb] [line 154]
!143 = metadata !{i32 154, i32 0, metadata !140, null}
!144 = metadata !{i32 156, i32 0, metadata !140, null}
!145 = metadata !{i32 158, i32 0, metadata !140, null}
!146 = metadata !{i32 161, i32 0, metadata !147, null}
!147 = metadata !{i32 786443, metadata !1, metadata !140, i32 159, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!148 = metadata !{i32 162, i32 0, metadata !147, null}
!149 = metadata !{i32 163, i32 0, metadata !147, null}
!150 = metadata !{i32 167, i32 0, metadata !147, null}
!151 = metadata !{i32 168, i32 0, metadata !147, null}
!152 = metadata !{i32 169, i32 0, metadata !147, null}
!153 = metadata !{i32 170, i32 0, metadata !154, null}
!154 = metadata !{i32 786443, metadata !1, metadata !147, i32 170, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!155 = metadata !{i32 172, i32 0, metadata !147, null}
!156 = metadata !{i32 173, i32 0, metadata !147, null}
!157 = metadata !{i32 174, i32 0, metadata !147, null}
!158 = metadata !{i32 175, i32 0, metadata !147, null}
!159 = metadata !{i32 176, i32 0, metadata !147, null}
!160 = metadata !{i32 183, i32 0, metadata !147, null}
!161 = metadata !{i32 184, i32 0, metadata !147, null}
!162 = metadata !{i32 187, i32 0, metadata !147, null}
!163 = metadata !{i32 189, i32 0, metadata !140, null}
!164 = metadata !{i32 190, i32 0, metadata !42, null}
!165 = metadata !{i32 194, i32 0, metadata !45, null}
!166 = metadata !{i32 195, i32 0, metadata !45, null}
!167 = metadata !{i32 200, i32 0, metadata !48, null}
!168 = metadata !{i32 201, i32 0, metadata !48, null}
!169 = metadata !{i32 202, i32 0, metadata !48, null}
!170 = metadata !{i32 786689, metadata !49, metadata !"id", metadata !5, i32 16777421, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [id] [line 205]
!171 = metadata !{i32 205, i32 0, metadata !49, null}
!172 = metadata !{i32 786688, metadata !49, metadata !"t", metadata !5, i32 207, metadata !24, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t] [line 207]
!173 = metadata !{i32 207, i32 0, metadata !49, null}
!174 = metadata !{i32 209, i32 0, metadata !175, null}
!175 = metadata !{i32 786443, metadata !1, metadata !49, i32 209, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!176 = metadata !{i32 210, i32 0, metadata !175, null}
!177 = metadata !{i32 211, i32 0, metadata !178, null}
!178 = metadata !{i32 786443, metadata !1, metadata !49, i32 211, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!179 = metadata !{i32 212, i32 0, metadata !49, null}
!180 = metadata !{i32 786689, metadata !52, metadata !"id", metadata !5, i32 16777431, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [id] [line 215]
!181 = metadata !{i32 215, i32 0, metadata !52, null}
!182 = metadata !{i32 786688, metadata !52, metadata !"t", metadata !5, i32 217, metadata !24, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t] [line 217]
!183 = metadata !{i32 217, i32 0, metadata !52, null}
!184 = metadata !{i32 219, i32 0, metadata !52, null}
!185 = metadata !{i32 220, i32 0, metadata !186, null}
!186 = metadata !{i32 786443, metadata !1, metadata !52, i32 220, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!187 = metadata !{i32 222, i32 0, metadata !52, null}
!188 = metadata !{i32 223, i32 0, metadata !189, null}
!189 = metadata !{i32 786443, metadata !1, metadata !52, i32 223, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!190 = metadata !{i32 225, i32 0, metadata !52, null}
!191 = metadata !{i32 226, i32 0, metadata !52, null}
!192 = metadata !{i32 786689, metadata !53, metadata !"pkt", metadata !5, i32 16777445, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pkt] [line 229]
!193 = metadata !{i32 229, i32 0, metadata !53, null}
!194 = metadata !{i32 786688, metadata !53, metadata !"t", metadata !5, i32 231, metadata !24, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t] [line 231]
!195 = metadata !{i32 231, i32 0, metadata !53, null}
!196 = metadata !{i32 233, i32 0, metadata !53, null}
!197 = metadata !{i32 234, i32 0, metadata !198, null}
!198 = metadata !{i32 786443, metadata !1, metadata !53, i32 234, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!199 = metadata !{i32 236, i32 0, metadata !53, null}
!200 = metadata !{i32 238, i32 0, metadata !53, null}
!201 = metadata !{i32 239, i32 0, metadata !53, null}
!202 = metadata !{i32 241, i32 0, metadata !203, null}
!203 = metadata !{i32 786443, metadata !1, metadata !53, i32 241, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!204 = metadata !{i32 243, i32 0, metadata !205, null}
!205 = metadata !{i32 786443, metadata !1, metadata !203, i32 242, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!206 = metadata !{i32 244, i32 0, metadata !205, null}
!207 = metadata !{i32 245, i32 0, metadata !208, null}
!208 = metadata !{i32 786443, metadata !1, metadata !205, i32 245, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!209 = metadata !{i32 246, i32 0, metadata !205, null}
!210 = metadata !{i32 249, i32 0, metadata !211, null}
!211 = metadata !{i32 786443, metadata !1, metadata !203, i32 248, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!212 = metadata !{i32 252, i32 0, metadata !53, null}
!213 = metadata !{i32 253, i32 0, metadata !53, null}
!214 = metadata !{i32 786689, metadata !58, metadata !"pkt", metadata !5, i32 16777557, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pkt] [line 341]
!215 = metadata !{i32 341, i32 0, metadata !58, null}
!216 = metadata !{i32 786689, metadata !58, metadata !"ptr", metadata !5, i32 33554773, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 341]
!217 = metadata !{i32 343, i32 0, metadata !58, null}
!218 = metadata !{i32 345, i32 0, metadata !58, null}
!219 = metadata !{i32 347, i32 0, metadata !58, null}
!220 = metadata !{i32 348, i32 0, metadata !58, null}
!221 = metadata !{i32 786689, metadata !54, metadata !"pkt", metadata !5, i32 16777471, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pkt] [line 255]
!222 = metadata !{i32 255, i32 0, metadata !54, null}
!223 = metadata !{i32 257, i32 0, metadata !54, null}
!224 = metadata !{i32 258, i32 0, metadata !225, null}
!225 = metadata !{i32 786443, metadata !1, metadata !54, i32 258, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!226 = metadata !{i32 260, i32 0, metadata !227, null}
!227 = metadata !{i32 786443, metadata !1, metadata !54, i32 260, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!228 = metadata !{i32 262, i32 0, metadata !229, null}
!229 = metadata !{i32 786443, metadata !1, metadata !227, i32 261, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!230 = metadata !{i32 263, i32 0, metadata !229, null}
!231 = metadata !{i32 267, i32 0, metadata !232, null}
!232 = metadata !{i32 786443, metadata !1, metadata !227, i32 266, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!233 = metadata !{i32 268, i32 0, metadata !232, null}
!234 = metadata !{i32 270, i32 0, metadata !54, null}
!235 = metadata !{i32 786689, metadata !55, metadata !"pkt", metadata !5, i32 16777488, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pkt] [line 272]
!236 = metadata !{i32 272, i32 0, metadata !55, null}
!237 = metadata !{i32 274, i32 0, metadata !238, null}
!238 = metadata !{i32 786443, metadata !1, metadata !55, i32 274, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!239 = metadata !{i32 786688, metadata !240, metadata !"i", metadata !5, i32 277, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 277]
!240 = metadata !{i32 786443, metadata !1, metadata !238, i32 276, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!241 = metadata !{i32 277, i32 0, metadata !240, null}
!242 = metadata !{i32 279, i32 0, metadata !240, null}
!243 = metadata !{i32 280, i32 0, metadata !240, null}
!244 = metadata !{i32 282, i32 0, metadata !240, null}
!245 = metadata !{i32 283, i32 0, metadata !246, null}
!246 = metadata !{i32 786443, metadata !1, metadata !240, i32 283, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!247 = metadata !{i32 285, i32 0, metadata !248, null}
!248 = metadata !{i32 786443, metadata !1, metadata !246, i32 284, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!249 = metadata !{i32 286, i32 0, metadata !250, null}
!250 = metadata !{i32 786443, metadata !1, metadata !248, i32 286, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!251 = metadata !{i32 287, i32 0, metadata !248, null}
!252 = metadata !{i32 288, i32 0, metadata !248, null}
!253 = metadata !{i32 289, i32 0, metadata !240, null}
!254 = metadata !{i32 291, i32 0, metadata !55, null}
!255 = metadata !{i32 786689, metadata !56, metadata !"pkt", metadata !5, i32 16777509, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pkt] [line 293]
!256 = metadata !{i32 293, i32 0, metadata !56, null}
!257 = metadata !{i32 295, i32 0, metadata !258, null}
!258 = metadata !{i32 786443, metadata !1, metadata !56, i32 295, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!259 = metadata !{i32 298, i32 0, metadata !260, null}
!260 = metadata !{i32 786443, metadata !1, metadata !56, i32 298, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!261 = metadata !{i32 786688, metadata !262, metadata !"count", metadata !5, i32 300, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 300]
!262 = metadata !{i32 786443, metadata !1, metadata !260, i32 299, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!263 = metadata !{i32 300, i32 0, metadata !262, null}
!264 = metadata !{i32 786688, metadata !262, metadata !"workpkt", metadata !5, i32 301, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [workpkt] [line 301]
!265 = metadata !{i32 301, i32 0, metadata !262, null}
!266 = metadata !{i32 302, i32 0, metadata !262, null}
!267 = metadata !{i32 304, i32 0, metadata !268, null}
!268 = metadata !{i32 786443, metadata !1, metadata !262, i32 304, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!269 = metadata !{i32 306, i32 0, metadata !270, null}
!270 = metadata !{i32 786443, metadata !1, metadata !268, i32 305, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!271 = metadata !{i32 307, i32 0, metadata !270, null}
!272 = metadata !{i32 310, i32 0, metadata !273, null}
!273 = metadata !{i32 786443, metadata !1, metadata !262, i32 310, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!274 = metadata !{i32 786688, metadata !275, metadata !"devpkt", metadata !5, i32 312, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [devpkt] [line 312]
!275 = metadata !{i32 786443, metadata !1, metadata !273, i32 311, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!276 = metadata !{i32 312, i32 0, metadata !275, null}
!277 = metadata !{i32 314, i32 0, metadata !275, null}
!278 = metadata !{i32 315, i32 0, metadata !275, null}
!279 = metadata !{i32 316, i32 0, metadata !275, null}
!280 = metadata !{i32 317, i32 0, metadata !275, null}
!281 = metadata !{i32 318, i32 0, metadata !275, null}
!282 = metadata !{i32 320, i32 0, metadata !262, null}
!283 = metadata !{i32 321, i32 0, metadata !56, null}
!284 = metadata !{i32 322, i32 0, metadata !56, null}
!285 = metadata !{i32 786689, metadata !57, metadata !"pkt", metadata !5, i32 16777540, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pkt] [line 324]
!286 = metadata !{i32 324, i32 0, metadata !57, null}
!287 = metadata !{i32 326, i32 0, metadata !288, null}
!288 = metadata !{i32 786443, metadata !1, metadata !57, i32 326, i32 0, i32 31} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!289 = metadata !{i32 328, i32 0, metadata !290, null}
!290 = metadata !{i32 786443, metadata !1, metadata !291, i32 328, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!291 = metadata !{i32 786443, metadata !1, metadata !288, i32 327, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!292 = metadata !{i32 329, i32 0, metadata !291, null}
!293 = metadata !{i32 330, i32 0, metadata !291, null}
!294 = metadata !{i32 331, i32 0, metadata !291, null}
!295 = metadata !{i32 335, i32 0, metadata !296, null}
!296 = metadata !{i32 786443, metadata !1, metadata !288, i32 334, i32 0, i32 34} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!297 = metadata !{i32 336, i32 0, metadata !298, null}
!298 = metadata !{i32 786443, metadata !1, metadata !296, i32 336, i32 0, i32 35} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!299 = metadata !{i32 337, i32 0, metadata !296, null}
!300 = metadata !{i32 339, i32 0, metadata !57, null}
!301 = metadata !{i32 786688, metadata !61, metadata !"wkq", metadata !5, i32 352, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [wkq] [line 352]
!302 = metadata !{i32 352, i32 0, metadata !61, null}
!303 = metadata !{i32 786688, metadata !61, metadata !"retval", metadata !5, i32 353, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [retval] [line 353]
!304 = metadata !{i32 353, i32 0, metadata !61, null}
!305 = metadata !{i32 355, i32 0, metadata !61, null}
!306 = metadata !{i32 357, i32 0, metadata !61, null}
!307 = metadata !{i32 359, i32 0, metadata !61, null}
!308 = metadata !{i32 360, i32 0, metadata !61, null}
!309 = metadata !{i32 362, i32 0, metadata !61, null}
!310 = metadata !{i32 364, i32 0, metadata !61, null}
!311 = metadata !{i32 365, i32 0, metadata !61, null}
!312 = metadata !{i32 366, i32 0, metadata !61, null}
!313 = metadata !{i32 368, i32 0, metadata !61, null}
!314 = metadata !{i32 370, i32 0, metadata !61, null}
!315 = metadata !{i32 371, i32 0, metadata !61, null}
!316 = metadata !{i32 372, i32 0, metadata !61, null}
!317 = metadata !{i32 374, i32 0, metadata !61, null}
!318 = metadata !{i32 376, i32 0, metadata !61, null}
!319 = metadata !{i32 377, i32 0, metadata !61, null}
!320 = metadata !{i32 378, i32 0, metadata !61, null}
!321 = metadata !{i32 380, i32 0, metadata !61, null}
!322 = metadata !{i32 382, i32 0, metadata !61, null}
!323 = metadata !{i32 384, i32 0, metadata !61, null}
!324 = metadata !{i32 386, i32 0, metadata !61, null}
!325 = metadata !{i32 387, i32 0, metadata !61, null}
!326 = metadata !{i32 389, i32 0, metadata !61, null}
!327 = metadata !{i32 391, i32 0, metadata !61, null}
!328 = metadata !{i32 393, i32 0, metadata !61, null}
!329 = metadata !{i32 396, i32 0, metadata !61, null}
!330 = metadata !{i32 397, i32 0, metadata !331, null}
!331 = metadata !{i32 786443, metadata !1, metadata !61, i32 397, i32 0, i32 36} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!332 = metadata !{i32 398, i32 0, metadata !333, null}
!333 = metadata !{i32 786443, metadata !1, metadata !331, i32 397, i32 0, i32 37} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!334 = metadata !{i32 399, i32 0, metadata !333, null}
!335 = metadata !{i32 400, i32 0, metadata !333, null}
!336 = metadata !{i32 401, i32 0, metadata !337, null}
!337 = metadata !{i32 786443, metadata !1, metadata !331, i32 400, i32 0, i32 38} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/richards_benchmark.c]
!338 = metadata !{i32 402, i32 0, metadata !337, null}
!339 = metadata !{i32 405, i32 0, metadata !61, null}
!340 = metadata !{i32 406, i32 0, metadata !61, null}
