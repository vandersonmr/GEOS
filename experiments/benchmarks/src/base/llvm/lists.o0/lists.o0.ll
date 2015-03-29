; ModuleID = 'lists.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

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

; Function Attrs: nounwind uwtable
define void @list_push_tail(%struct.DLL* %head, %struct.DLL* %item) #0 {
entry:
  %head.addr = alloca %struct.DLL*, align 8
  %item.addr = alloca %struct.DLL*, align 8
  %tail = alloca %struct.DLL*, align 8
  store %struct.DLL* %head, %struct.DLL** %head.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.DLL** %head.addr, metadata !56, metadata !57), !dbg !58
  store %struct.DLL* %item, %struct.DLL** %item.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.DLL** %item.addr, metadata !59, metadata !57), !dbg !60
  call void @llvm.dbg.declare(metadata %struct.DLL** %tail, metadata !61, metadata !57), !dbg !62
  %0 = load %struct.DLL** %head.addr, align 8, !dbg !63
  %prev = getelementptr inbounds %struct.DLL* %0, i32 0, i32 2, !dbg !63
  %1 = load %struct.DLL** %prev, align 8, !dbg !63
  store %struct.DLL* %1, %struct.DLL** %tail, align 8, !dbg !62
  %2 = load %struct.DLL** %item.addr, align 8, !dbg !64
  %3 = load %struct.DLL** %tail, align 8, !dbg !65
  %next = getelementptr inbounds %struct.DLL* %3, i32 0, i32 1, !dbg !65
  store %struct.DLL* %2, %struct.DLL** %next, align 8, !dbg !65
  %4 = load %struct.DLL** %head.addr, align 8, !dbg !66
  %5 = load %struct.DLL** %item.addr, align 8, !dbg !67
  %next1 = getelementptr inbounds %struct.DLL* %5, i32 0, i32 1, !dbg !67
  store %struct.DLL* %4, %struct.DLL** %next1, align 8, !dbg !67
  %6 = load %struct.DLL** %item.addr, align 8, !dbg !68
  %7 = load %struct.DLL** %head.addr, align 8, !dbg !69
  %prev2 = getelementptr inbounds %struct.DLL* %7, i32 0, i32 2, !dbg !69
  store %struct.DLL* %6, %struct.DLL** %prev2, align 8, !dbg !69
  %8 = load %struct.DLL** %tail, align 8, !dbg !70
  %9 = load %struct.DLL** %item.addr, align 8, !dbg !71
  %prev3 = getelementptr inbounds %struct.DLL* %9, i32 0, i32 2, !dbg !71
  store %struct.DLL* %8, %struct.DLL** %prev3, align 8, !dbg !71
  %10 = load %struct.DLL** %head.addr, align 8, !dbg !72
  %val = getelementptr inbounds %struct.DLL* %10, i32 0, i32 0, !dbg !72
  %11 = load i32* %val, align 4, !dbg !72
  %inc = add nsw i32 %11, 1, !dbg !72
  store i32 %inc, i32* %val, align 4, !dbg !72
  ret void, !dbg !73
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define %struct.DLL* @list_pop_tail(%struct.DLL* %head) #0 {
entry:
  %retval = alloca %struct.DLL*, align 8
  %head.addr = alloca %struct.DLL*, align 8
  %prev = alloca %struct.DLL*, align 8
  %tail = alloca %struct.DLL*, align 8
  store %struct.DLL* %head, %struct.DLL** %head.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.DLL** %head.addr, metadata !74, metadata !57), !dbg !75
  call void @llvm.dbg.declare(metadata %struct.DLL** %prev, metadata !76, metadata !57), !dbg !77
  call void @llvm.dbg.declare(metadata %struct.DLL** %tail, metadata !78, metadata !57), !dbg !79
  %0 = load %struct.DLL** %head.addr, align 8, !dbg !80
  %call = call i32 @list_empty(%struct.DLL* %0), !dbg !82
  %tobool = icmp ne i32 %call, 0, !dbg !83
  br i1 %tobool, label %if.then, label %if.end, !dbg !83

if.then:                                          ; preds = %entry
  store %struct.DLL* null, %struct.DLL** %retval, !dbg !84
  br label %return, !dbg !84

if.end:                                           ; preds = %entry
  %1 = load %struct.DLL** %head.addr, align 8, !dbg !86
  %prev1 = getelementptr inbounds %struct.DLL* %1, i32 0, i32 2, !dbg !86
  %2 = load %struct.DLL** %prev1, align 8, !dbg !86
  store %struct.DLL* %2, %struct.DLL** %tail, align 8, !dbg !87
  %3 = load %struct.DLL** %tail, align 8, !dbg !88
  %prev2 = getelementptr inbounds %struct.DLL* %3, i32 0, i32 2, !dbg !88
  %4 = load %struct.DLL** %prev2, align 8, !dbg !88
  store %struct.DLL* %4, %struct.DLL** %prev, align 8, !dbg !89
  %5 = load %struct.DLL** %head.addr, align 8, !dbg !90
  %6 = load %struct.DLL** %prev, align 8, !dbg !91
  %next = getelementptr inbounds %struct.DLL* %6, i32 0, i32 1, !dbg !91
  store %struct.DLL* %5, %struct.DLL** %next, align 8, !dbg !91
  %7 = load %struct.DLL** %prev, align 8, !dbg !92
  %8 = load %struct.DLL** %head.addr, align 8, !dbg !93
  %prev3 = getelementptr inbounds %struct.DLL* %8, i32 0, i32 2, !dbg !93
  store %struct.DLL* %7, %struct.DLL** %prev3, align 8, !dbg !93
  %9 = load %struct.DLL** %head.addr, align 8, !dbg !94
  %val = getelementptr inbounds %struct.DLL* %9, i32 0, i32 0, !dbg !94
  %10 = load i32* %val, align 4, !dbg !94
  %dec = add nsw i32 %10, -1, !dbg !94
  store i32 %dec, i32* %val, align 4, !dbg !94
  %11 = load %struct.DLL** %tail, align 8, !dbg !95
  store %struct.DLL* %11, %struct.DLL** %retval, !dbg !96
  br label %return, !dbg !96

return:                                           ; preds = %if.end, %if.then
  %12 = load %struct.DLL** %retval, !dbg !97
  ret %struct.DLL* %12, !dbg !97
}

; Function Attrs: nounwind uwtable
define internal i32 @list_empty(%struct.DLL* %head) #0 {
entry:
  %head.addr = alloca %struct.DLL*, align 8
  store %struct.DLL* %head, %struct.DLL** %head.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.DLL** %head.addr, metadata !98, metadata !57), !dbg !99
  %0 = load %struct.DLL** %head.addr, align 8, !dbg !100
  %call = call i32 @list_length(%struct.DLL* %0), !dbg !101
  %cmp = icmp eq i32 %call, 0, !dbg !101
  %conv = zext i1 %cmp to i32, !dbg !101
  ret i32 %conv, !dbg !102
}

; Function Attrs: nounwind uwtable
define void @list_push_head(%struct.DLL* %head, %struct.DLL* %item) #0 {
entry:
  %head.addr = alloca %struct.DLL*, align 8
  %item.addr = alloca %struct.DLL*, align 8
  %next = alloca %struct.DLL*, align 8
  store %struct.DLL* %head, %struct.DLL** %head.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.DLL** %head.addr, metadata !103, metadata !57), !dbg !104
  store %struct.DLL* %item, %struct.DLL** %item.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.DLL** %item.addr, metadata !105, metadata !57), !dbg !106
  call void @llvm.dbg.declare(metadata %struct.DLL** %next, metadata !107, metadata !57), !dbg !108
  %0 = load %struct.DLL** %head.addr, align 8, !dbg !109
  %next1 = getelementptr inbounds %struct.DLL* %0, i32 0, i32 1, !dbg !109
  %1 = load %struct.DLL** %next1, align 8, !dbg !109
  store %struct.DLL* %1, %struct.DLL** %next, align 8, !dbg !108
  %2 = load %struct.DLL** %item.addr, align 8, !dbg !110
  %3 = load %struct.DLL** %head.addr, align 8, !dbg !111
  %next2 = getelementptr inbounds %struct.DLL* %3, i32 0, i32 1, !dbg !111
  store %struct.DLL* %2, %struct.DLL** %next2, align 8, !dbg !111
  %4 = load %struct.DLL** %item.addr, align 8, !dbg !112
  %5 = load %struct.DLL** %next, align 8, !dbg !113
  %prev = getelementptr inbounds %struct.DLL* %5, i32 0, i32 2, !dbg !113
  store %struct.DLL* %4, %struct.DLL** %prev, align 8, !dbg !113
  %6 = load %struct.DLL** %next, align 8, !dbg !114
  %7 = load %struct.DLL** %item.addr, align 8, !dbg !115
  %next3 = getelementptr inbounds %struct.DLL* %7, i32 0, i32 1, !dbg !115
  store %struct.DLL* %6, %struct.DLL** %next3, align 8, !dbg !115
  %8 = load %struct.DLL** %head.addr, align 8, !dbg !116
  %9 = load %struct.DLL** %item.addr, align 8, !dbg !117
  %prev4 = getelementptr inbounds %struct.DLL* %9, i32 0, i32 2, !dbg !117
  store %struct.DLL* %8, %struct.DLL** %prev4, align 8, !dbg !117
  %10 = load %struct.DLL** %head.addr, align 8, !dbg !118
  %val = getelementptr inbounds %struct.DLL* %10, i32 0, i32 0, !dbg !118
  %11 = load i32* %val, align 4, !dbg !118
  %inc = add nsw i32 %11, 1, !dbg !118
  store i32 %inc, i32* %val, align 4, !dbg !118
  ret void, !dbg !119
}

; Function Attrs: nounwind uwtable
define %struct.DLL* @list_pop_head(%struct.DLL* %head) #0 {
entry:
  %retval = alloca %struct.DLL*, align 8
  %head.addr = alloca %struct.DLL*, align 8
  %next = alloca %struct.DLL*, align 8
  store %struct.DLL* %head, %struct.DLL** %head.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.DLL** %head.addr, metadata !120, metadata !57), !dbg !121
  call void @llvm.dbg.declare(metadata %struct.DLL** %next, metadata !122, metadata !57), !dbg !123
  %0 = load %struct.DLL** %head.addr, align 8, !dbg !124
  %call = call i32 @list_empty(%struct.DLL* %0), !dbg !126
  %tobool = icmp ne i32 %call, 0, !dbg !127
  br i1 %tobool, label %if.then, label %if.end, !dbg !127

if.then:                                          ; preds = %entry
  store %struct.DLL* null, %struct.DLL** %retval, !dbg !128
  br label %return, !dbg !128

if.end:                                           ; preds = %entry
  %1 = load %struct.DLL** %head.addr, align 8, !dbg !130
  %next1 = getelementptr inbounds %struct.DLL* %1, i32 0, i32 1, !dbg !130
  %2 = load %struct.DLL** %next1, align 8, !dbg !130
  store %struct.DLL* %2, %struct.DLL** %next, align 8, !dbg !131
  %3 = load %struct.DLL** %next, align 8, !dbg !132
  %next2 = getelementptr inbounds %struct.DLL* %3, i32 0, i32 1, !dbg !132
  %4 = load %struct.DLL** %next2, align 8, !dbg !132
  %5 = load %struct.DLL** %head.addr, align 8, !dbg !133
  %next3 = getelementptr inbounds %struct.DLL* %5, i32 0, i32 1, !dbg !133
  store %struct.DLL* %4, %struct.DLL** %next3, align 8, !dbg !133
  %6 = load %struct.DLL** %head.addr, align 8, !dbg !134
  %7 = load %struct.DLL** %next, align 8, !dbg !135
  %next4 = getelementptr inbounds %struct.DLL* %7, i32 0, i32 1, !dbg !135
  %8 = load %struct.DLL** %next4, align 8, !dbg !135
  %prev = getelementptr inbounds %struct.DLL* %8, i32 0, i32 2, !dbg !135
  store %struct.DLL* %6, %struct.DLL** %prev, align 8, !dbg !135
  %9 = load %struct.DLL** %head.addr, align 8, !dbg !136
  %val = getelementptr inbounds %struct.DLL* %9, i32 0, i32 0, !dbg !136
  %10 = load i32* %val, align 4, !dbg !136
  %dec = add nsw i32 %10, -1, !dbg !136
  store i32 %dec, i32* %val, align 4, !dbg !136
  %11 = load %struct.DLL** %next, align 8, !dbg !137
  store %struct.DLL* %11, %struct.DLL** %retval, !dbg !138
  br label %return, !dbg !138

return:                                           ; preds = %if.end, %if.then
  %12 = load %struct.DLL** %retval, !dbg !139
  ret %struct.DLL* %12, !dbg !139
}

; Function Attrs: nounwind uwtable
define i32 @list_equal(%struct.DLL* %x, %struct.DLL* %y) #0 {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca %struct.DLL*, align 8
  %y.addr = alloca %struct.DLL*, align 8
  %xp = alloca %struct.DLL*, align 8
  %yp = alloca %struct.DLL*, align 8
  store %struct.DLL* %x, %struct.DLL** %x.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.DLL** %x.addr, metadata !140, metadata !57), !dbg !141
  store %struct.DLL* %y, %struct.DLL** %y.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.DLL** %y.addr, metadata !142, metadata !57), !dbg !143
  call void @llvm.dbg.declare(metadata %struct.DLL** %xp, metadata !144, metadata !57), !dbg !145
  call void @llvm.dbg.declare(metadata %struct.DLL** %yp, metadata !146, metadata !57), !dbg !147
  %0 = load %struct.DLL** %x.addr, align 8, !dbg !148
  store %struct.DLL* %0, %struct.DLL** %xp, align 8, !dbg !150
  %1 = load %struct.DLL** %y.addr, align 8, !dbg !151
  store %struct.DLL* %1, %struct.DLL** %yp, align 8, !dbg !152
  br label %for.cond, !dbg !150

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load %struct.DLL** %xp, align 8, !dbg !153
  %next = getelementptr inbounds %struct.DLL* %2, i32 0, i32 1, !dbg !153
  %3 = load %struct.DLL** %next, align 8, !dbg !153
  %4 = load %struct.DLL** %x.addr, align 8, !dbg !157
  %cmp = icmp ne %struct.DLL* %3, %4, !dbg !158
  br i1 %cmp, label %for.body, label %for.end, !dbg !159

for.body:                                         ; preds = %for.cond
  %5 = load %struct.DLL** %xp, align 8, !dbg !160
  %val = getelementptr inbounds %struct.DLL* %5, i32 0, i32 0, !dbg !160
  %6 = load i32* %val, align 4, !dbg !160
  %7 = load %struct.DLL** %yp, align 8, !dbg !163
  %val1 = getelementptr inbounds %struct.DLL* %7, i32 0, i32 0, !dbg !163
  %8 = load i32* %val1, align 4, !dbg !163
  %cmp2 = icmp ne i32 %6, %8, !dbg !160
  br i1 %cmp2, label %if.then, label %if.end, !dbg !164

if.then:                                          ; preds = %for.body
  store i32 0, i32* %retval, !dbg !165
  br label %return, !dbg !165

if.end:                                           ; preds = %for.body
  br label %for.inc, !dbg !167

for.inc:                                          ; preds = %if.end
  %9 = load %struct.DLL** %xp, align 8, !dbg !168
  %next3 = getelementptr inbounds %struct.DLL* %9, i32 0, i32 1, !dbg !168
  %10 = load %struct.DLL** %next3, align 8, !dbg !168
  store %struct.DLL* %10, %struct.DLL** %xp, align 8, !dbg !169
  %11 = load %struct.DLL** %yp, align 8, !dbg !170
  %next4 = getelementptr inbounds %struct.DLL* %11, i32 0, i32 1, !dbg !170
  %12 = load %struct.DLL** %next4, align 8, !dbg !170
  store %struct.DLL* %12, %struct.DLL** %yp, align 8, !dbg !171
  br label %for.cond, !dbg !172

for.end:                                          ; preds = %for.cond
  %13 = load %struct.DLL** %xp, align 8, !dbg !173
  %val5 = getelementptr inbounds %struct.DLL* %13, i32 0, i32 0, !dbg !173
  %14 = load i32* %val5, align 4, !dbg !173
  %15 = load %struct.DLL** %yp, align 8, !dbg !175
  %val6 = getelementptr inbounds %struct.DLL* %15, i32 0, i32 0, !dbg !175
  %16 = load i32* %val6, align 4, !dbg !175
  %cmp7 = icmp ne i32 %14, %16, !dbg !173
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !176

if.then8:                                         ; preds = %for.end
  store i32 0, i32* %retval, !dbg !177
  br label %return, !dbg !177

if.end9:                                          ; preds = %for.end
  %17 = load %struct.DLL** %yp, align 8, !dbg !179
  %next10 = getelementptr inbounds %struct.DLL* %17, i32 0, i32 1, !dbg !179
  %18 = load %struct.DLL** %next10, align 8, !dbg !179
  %19 = load %struct.DLL** %y.addr, align 8, !dbg !180
  %cmp11 = icmp eq %struct.DLL* %18, %19, !dbg !179
  %conv = zext i1 %cmp11 to i32, !dbg !179
  store i32 %conv, i32* %retval, !dbg !181
  br label %return, !dbg !181

return:                                           ; preds = %if.end9, %if.then8, %if.then
  %20 = load i32* %retval, !dbg !182
  ret i32 %20, !dbg !182
}

; Function Attrs: nounwind uwtable
define void @list_print(i8* %msg, %struct.DLL* %x) #0 {
entry:
  %msg.addr = alloca i8*, align 8
  %x.addr = alloca %struct.DLL*, align 8
  %xp = alloca %struct.DLL*, align 8
  %first = alloca %struct.DLL*, align 8
  %i = alloca i32, align 4
  store i8* %msg, i8** %msg.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %msg.addr, metadata !183, metadata !57), !dbg !184
  store %struct.DLL* %x, %struct.DLL** %x.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.DLL** %x.addr, metadata !185, metadata !57), !dbg !186
  call void @llvm.dbg.declare(metadata %struct.DLL** %xp, metadata !187, metadata !57), !dbg !188
  call void @llvm.dbg.declare(metadata %struct.DLL** %first, metadata !189, metadata !57), !dbg !190
  %0 = load %struct.DLL** %x.addr, align 8, !dbg !191
  %next = getelementptr inbounds %struct.DLL* %0, i32 0, i32 1, !dbg !191
  %1 = load %struct.DLL** %next, align 8, !dbg !191
  store %struct.DLL* %1, %struct.DLL** %first, align 8, !dbg !190
  call void @llvm.dbg.declare(metadata i32* %i, metadata !192, metadata !57), !dbg !193
  store i32 0, i32* %i, align 4, !dbg !193
  %2 = load i8** %msg.addr, align 8, !dbg !194
  %call = call i32 @puts(i8* %2), !dbg !195
  %3 = load %struct.DLL** %x.addr, align 8, !dbg !196
  %call1 = call i32 @list_length(%struct.DLL* %3), !dbg !197
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i32 %call1), !dbg !198
  %4 = load %struct.DLL** %x.addr, align 8, !dbg !199
  %next3 = getelementptr inbounds %struct.DLL* %4, i32 0, i32 1, !dbg !199
  %5 = load %struct.DLL** %next3, align 8, !dbg !199
  store %struct.DLL* %5, %struct.DLL** %xp, align 8, !dbg !201
  br label %for.cond, !dbg !201

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load %struct.DLL** %xp, align 8, !dbg !202
  %next4 = getelementptr inbounds %struct.DLL* %6, i32 0, i32 1, !dbg !202
  %7 = load %struct.DLL** %next4, align 8, !dbg !202
  %8 = load %struct.DLL** %first, align 8, !dbg !206
  %cmp = icmp ne %struct.DLL* %7, %8, !dbg !207
  br i1 %cmp, label %for.body, label %for.end, !dbg !208

for.body:                                         ; preds = %for.cond
  %9 = load i32* %i, align 4, !dbg !209
  %inc = add nsw i32 %9, 1, !dbg !209
  store i32 %inc, i32* %i, align 4, !dbg !209
  %10 = load %struct.DLL** %xp, align 8, !dbg !211
  %val = getelementptr inbounds %struct.DLL* %10, i32 0, i32 0, !dbg !211
  %11 = load i32* %val, align 4, !dbg !211
  %12 = load %struct.DLL** %xp, align 8, !dbg !212
  %next5 = getelementptr inbounds %struct.DLL* %12, i32 0, i32 1, !dbg !212
  %13 = load %struct.DLL** %next5, align 8, !dbg !212
  %val6 = getelementptr inbounds %struct.DLL* %13, i32 0, i32 0, !dbg !212
  %14 = load i32* %val6, align 4, !dbg !212
  %15 = load %struct.DLL** %xp, align 8, !dbg !213
  %prev = getelementptr inbounds %struct.DLL* %15, i32 0, i32 2, !dbg !213
  %16 = load %struct.DLL** %prev, align 8, !dbg !213
  %val7 = getelementptr inbounds %struct.DLL* %16, i32 0, i32 0, !dbg !213
  %17 = load i32* %val7, align 4, !dbg !213
  %call8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str1, i32 0, i32 0), i32 %inc, i32 %11, i32 %14, i32 %17), !dbg !214
  br label %for.inc, !dbg !215

for.inc:                                          ; preds = %for.body
  %18 = load %struct.DLL** %xp, align 8, !dbg !216
  %next9 = getelementptr inbounds %struct.DLL* %18, i32 0, i32 1, !dbg !216
  %19 = load %struct.DLL** %next9, align 8, !dbg !216
  store %struct.DLL* %19, %struct.DLL** %xp, align 8, !dbg !217
  br label %for.cond, !dbg !218

for.end:                                          ; preds = %for.cond
  %call10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([34 x i8]* @.str2, i32 0, i32 0)), !dbg !219
  %20 = load %struct.DLL** %xp, align 8, !dbg !220
  %next11 = getelementptr inbounds %struct.DLL* %20, i32 0, i32 1, !dbg !220
  %21 = load %struct.DLL** %next11, align 8, !dbg !220
  %val12 = getelementptr inbounds %struct.DLL* %21, i32 0, i32 0, !dbg !220
  %22 = load i32* %val12, align 4, !dbg !220
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str3, i32 0, i32 0), i32 %22), !dbg !221
  ret void, !dbg !222
}

declare i32 @puts(i8*) #2

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define internal i32 @list_length(%struct.DLL* %head) #0 {
entry:
  %head.addr = alloca %struct.DLL*, align 8
  store %struct.DLL* %head, %struct.DLL** %head.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.DLL** %head.addr, metadata !223, metadata !57), !dbg !224
  %0 = load %struct.DLL** %head.addr, align 8, !dbg !225
  %val = getelementptr inbounds %struct.DLL* %0, i32 0, i32 0, !dbg !225
  %1 = load i32* %val, align 4, !dbg !225
  ret i32 %1, !dbg !226
}

; Function Attrs: nounwind uwtable
define %struct.DLL* @list_new() #0 {
entry:
  %l = alloca %struct.DLL*, align 8
  call void @llvm.dbg.declare(metadata %struct.DLL** %l, metadata !227, metadata !57), !dbg !228
  %call = call noalias i8* @malloc(i64 24) #6, !dbg !229
  %0 = bitcast i8* %call to %struct.DLL*, !dbg !230
  store %struct.DLL* %0, %struct.DLL** %l, align 8, !dbg !228
  %1 = load %struct.DLL** %l, align 8, !dbg !231
  %2 = load %struct.DLL** %l, align 8, !dbg !232
  %next = getelementptr inbounds %struct.DLL* %2, i32 0, i32 1, !dbg !232
  store %struct.DLL* %1, %struct.DLL** %next, align 8, !dbg !232
  %3 = load %struct.DLL** %l, align 8, !dbg !233
  %4 = load %struct.DLL** %l, align 8, !dbg !234
  %prev = getelementptr inbounds %struct.DLL* %4, i32 0, i32 2, !dbg !234
  store %struct.DLL* %3, %struct.DLL** %prev, align 8, !dbg !234
  %5 = load %struct.DLL** %l, align 8, !dbg !235
  %val = getelementptr inbounds %struct.DLL* %5, i32 0, i32 0, !dbg !235
  store i32 0, i32* %val, align 4, !dbg !235
  %6 = load %struct.DLL** %l, align 8, !dbg !236
  ret %struct.DLL* %6, !dbg !237
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #3

; Function Attrs: nounwind uwtable
define %struct.DLL* @list_sequence(i32 %from, i32 %to) #0 {
entry:
  %from.addr = alloca i32, align 4
  %to.addr = alloca i32, align 4
  %size = alloca i32, align 4
  %tmp = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %l = alloca %struct.DLL*, align 8
  store i32 %from, i32* %from.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %from.addr, metadata !238, metadata !57), !dbg !239
  store i32 %to, i32* %to.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %to.addr, metadata !240, metadata !57), !dbg !241
  call void @llvm.dbg.declare(metadata i32* %size, metadata !242, metadata !57), !dbg !243
  call void @llvm.dbg.declare(metadata i32* %tmp, metadata !244, metadata !57), !dbg !245
  call void @llvm.dbg.declare(metadata i32* %i, metadata !246, metadata !57), !dbg !247
  call void @llvm.dbg.declare(metadata i32* %j, metadata !248, metadata !57), !dbg !249
  call void @llvm.dbg.declare(metadata %struct.DLL** %l, metadata !250, metadata !57), !dbg !251
  %0 = load i32* %from.addr, align 4, !dbg !252
  %1 = load i32* %to.addr, align 4, !dbg !254
  %cmp = icmp sgt i32 %0, %1, !dbg !252
  br i1 %cmp, label %if.then, label %if.end, !dbg !255

if.then:                                          ; preds = %entry
  %2 = load i32* %from.addr, align 4, !dbg !256
  store i32 %2, i32* %tmp, align 4, !dbg !258
  %3 = load i32* %to.addr, align 4, !dbg !259
  store i32 %3, i32* %from.addr, align 4, !dbg !260
  %4 = load i32* %tmp, align 4, !dbg !261
  store i32 %4, i32* %to.addr, align 4, !dbg !262
  br label %if.end, !dbg !263

if.end:                                           ; preds = %if.then, %entry
  %5 = load i32* %to.addr, align 4, !dbg !264
  %6 = load i32* %from.addr, align 4, !dbg !265
  %sub = sub nsw i32 %5, %6, !dbg !264
  %add = add nsw i32 %sub, 1, !dbg !264
  store i32 %add, i32* %size, align 4, !dbg !266
  %7 = load i32* %size, align 4, !dbg !267
  %add4 = add nsw i32 %7, 1, !dbg !267
  %conv = sext i32 %add4 to i64, !dbg !268
  %mul = mul i64 %conv, 24, !dbg !268
  %call = call noalias i8* @malloc(i64 %mul) #6, !dbg !269
  %8 = bitcast i8* %call to %struct.DLL*, !dbg !270
  store %struct.DLL* %8, %struct.DLL** %l, align 8, !dbg !271
  %9 = load i32* %from.addr, align 4, !dbg !272
  %dec = add nsw i32 %9, -1, !dbg !272
  store i32 %dec, i32* %from.addr, align 4, !dbg !272
  store i32 0, i32* %i, align 4, !dbg !273
  store i32 1, i32* %j, align 4, !dbg !275
  br label %for.cond, !dbg !273

for.cond:                                         ; preds = %for.inc, %if.end
  %10 = load i32* %i, align 4, !dbg !276
  %11 = load i32* %size, align 4, !dbg !280
  %cmp5 = icmp slt i32 %10, %11, !dbg !281
  br i1 %cmp5, label %for.body, label %for.end, !dbg !282

for.body:                                         ; preds = %for.cond
  %12 = load i32* %i, align 4, !dbg !283
  %add7 = add nsw i32 %12, 1, !dbg !283
  %idxprom = sext i32 %add7 to i64, !dbg !285
  %13 = load %struct.DLL** %l, align 8, !dbg !286
  %arrayidx = getelementptr inbounds %struct.DLL* %13, i64 %idxprom, !dbg !285
  %14 = load i32* %i, align 4, !dbg !287
  %idxprom8 = sext i32 %14 to i64, !dbg !288
  %15 = load %struct.DLL** %l, align 8, !dbg !288
  %arrayidx9 = getelementptr inbounds %struct.DLL* %15, i64 %idxprom8, !dbg !288
  %next = getelementptr inbounds %struct.DLL* %arrayidx9, i32 0, i32 1, !dbg !288
  store %struct.DLL* %arrayidx, %struct.DLL** %next, align 8, !dbg !288
  %16 = load i32* %j, align 4, !dbg !289
  %sub10 = sub nsw i32 %16, 1, !dbg !289
  %idxprom11 = sext i32 %sub10 to i64, !dbg !290
  %17 = load %struct.DLL** %l, align 8, !dbg !291
  %arrayidx12 = getelementptr inbounds %struct.DLL* %17, i64 %idxprom11, !dbg !290
  %18 = load i32* %j, align 4, !dbg !292
  %idxprom13 = sext i32 %18 to i64, !dbg !293
  %19 = load %struct.DLL** %l, align 8, !dbg !293
  %arrayidx14 = getelementptr inbounds %struct.DLL* %19, i64 %idxprom13, !dbg !293
  %prev = getelementptr inbounds %struct.DLL* %arrayidx14, i32 0, i32 2, !dbg !293
  store %struct.DLL* %arrayidx12, %struct.DLL** %prev, align 8, !dbg !293
  %20 = load i32* %from.addr, align 4, !dbg !294
  %inc = add nsw i32 %20, 1, !dbg !294
  store i32 %inc, i32* %from.addr, align 4, !dbg !294
  %21 = load i32* %i, align 4, !dbg !295
  %idxprom15 = sext i32 %21 to i64, !dbg !296
  %22 = load %struct.DLL** %l, align 8, !dbg !296
  %arrayidx16 = getelementptr inbounds %struct.DLL* %22, i64 %idxprom15, !dbg !296
  %val = getelementptr inbounds %struct.DLL* %arrayidx16, i32 0, i32 0, !dbg !296
  store i32 %20, i32* %val, align 4, !dbg !296
  br label %for.inc, !dbg !297

for.inc:                                          ; preds = %for.body
  %23 = load i32* %i, align 4, !dbg !298
  %inc17 = add nsw i32 %23, 1, !dbg !298
  store i32 %inc17, i32* %i, align 4, !dbg !298
  %24 = load i32* %j, align 4, !dbg !299
  %inc18 = add nsw i32 %24, 1, !dbg !299
  store i32 %inc18, i32* %j, align 4, !dbg !299
  br label %for.cond, !dbg !300

for.end:                                          ; preds = %for.cond
  %25 = load i32* %size, align 4, !dbg !301
  %idxprom19 = sext i32 %25 to i64, !dbg !302
  %26 = load %struct.DLL** %l, align 8, !dbg !303
  %arrayidx20 = getelementptr inbounds %struct.DLL* %26, i64 %idxprom19, !dbg !302
  %27 = load %struct.DLL** %l, align 8, !dbg !304
  %arrayidx21 = getelementptr inbounds %struct.DLL* %27, i64 0, !dbg !304
  %prev22 = getelementptr inbounds %struct.DLL* %arrayidx21, i32 0, i32 2, !dbg !304
  store %struct.DLL* %arrayidx20, %struct.DLL** %prev22, align 8, !dbg !304
  %28 = load %struct.DLL** %l, align 8, !dbg !305
  %arrayidx23 = getelementptr inbounds %struct.DLL* %28, i64 0, !dbg !306
  %29 = load i32* %size, align 4, !dbg !307
  %idxprom24 = sext i32 %29 to i64, !dbg !308
  %30 = load %struct.DLL** %l, align 8, !dbg !308
  %arrayidx25 = getelementptr inbounds %struct.DLL* %30, i64 %idxprom24, !dbg !308
  %next26 = getelementptr inbounds %struct.DLL* %arrayidx25, i32 0, i32 1, !dbg !308
  store %struct.DLL* %arrayidx23, %struct.DLL** %next26, align 8, !dbg !308
  %31 = load i32* %size, align 4, !dbg !309
  %sub27 = sub nsw i32 %31, 1, !dbg !309
  %idxprom28 = sext i32 %sub27 to i64, !dbg !310
  %32 = load %struct.DLL** %l, align 8, !dbg !311
  %arrayidx29 = getelementptr inbounds %struct.DLL* %32, i64 %idxprom28, !dbg !310
  %33 = load i32* %size, align 4, !dbg !312
  %idxprom30 = sext i32 %33 to i64, !dbg !313
  %34 = load %struct.DLL** %l, align 8, !dbg !313
  %arrayidx31 = getelementptr inbounds %struct.DLL* %34, i64 %idxprom30, !dbg !313
  %prev32 = getelementptr inbounds %struct.DLL* %arrayidx31, i32 0, i32 2, !dbg !313
  store %struct.DLL* %arrayidx29, %struct.DLL** %prev32, align 8, !dbg !313
  %35 = load i32* %from.addr, align 4, !dbg !314
  %36 = load i32* %size, align 4, !dbg !315
  %idxprom33 = sext i32 %36 to i64, !dbg !316
  %37 = load %struct.DLL** %l, align 8, !dbg !316
  %arrayidx34 = getelementptr inbounds %struct.DLL* %37, i64 %idxprom33, !dbg !316
  %val35 = getelementptr inbounds %struct.DLL* %arrayidx34, i32 0, i32 0, !dbg !316
  store i32 %35, i32* %val35, align 4, !dbg !316
  %38 = load i32* %size, align 4, !dbg !317
  %39 = load %struct.DLL** %l, align 8, !dbg !318
  %arrayidx36 = getelementptr inbounds %struct.DLL* %39, i64 0, !dbg !318
  %val37 = getelementptr inbounds %struct.DLL* %arrayidx36, i32 0, i32 0, !dbg !318
  store i32 %38, i32* %val37, align 4, !dbg !318
  %40 = load %struct.DLL** %l, align 8, !dbg !319
  ret %struct.DLL* %40, !dbg !320
}

; Function Attrs: nounwind uwtable
define %struct.DLL* @list_copy(%struct.DLL* %x) #0 {
entry:
  %x.addr = alloca %struct.DLL*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %size = alloca i32, align 4
  %xp = alloca %struct.DLL*, align 8
  %l = alloca %struct.DLL*, align 8
  store %struct.DLL* %x, %struct.DLL** %x.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.DLL** %x.addr, metadata !321, metadata !57), !dbg !322
  call void @llvm.dbg.declare(metadata i32* %i, metadata !323, metadata !57), !dbg !324
  call void @llvm.dbg.declare(metadata i32* %j, metadata !325, metadata !57), !dbg !326
  call void @llvm.dbg.declare(metadata i32* %size, metadata !327, metadata !57), !dbg !328
  %0 = load %struct.DLL** %x.addr, align 8, !dbg !329
  %call = call i32 @list_length(%struct.DLL* %0), !dbg !330
  store i32 %call, i32* %size, align 4, !dbg !328
  call void @llvm.dbg.declare(metadata %struct.DLL** %xp, metadata !331, metadata !57), !dbg !332
  call void @llvm.dbg.declare(metadata %struct.DLL** %l, metadata !333, metadata !57), !dbg !334
  %1 = load i32* %size, align 4, !dbg !335
  %add = add nsw i32 %1, 1, !dbg !335
  %conv = sext i32 %add to i64, !dbg !336
  %mul = mul i64 %conv, 24, !dbg !336
  %call1 = call noalias i8* @malloc(i64 %mul) #6, !dbg !337
  %2 = bitcast i8* %call1 to %struct.DLL*, !dbg !338
  store %struct.DLL* %2, %struct.DLL** %l, align 8, !dbg !334
  store i32 0, i32* %i, align 4, !dbg !339
  store i32 1, i32* %j, align 4, !dbg !341
  %3 = load %struct.DLL** %x.addr, align 8, !dbg !342
  store %struct.DLL* %3, %struct.DLL** %xp, align 8, !dbg !343
  br label %for.cond, !dbg !339

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i32* %i, align 4, !dbg !344
  %5 = load i32* %size, align 4, !dbg !348
  %cmp = icmp slt i32 %4, %5, !dbg !349
  br i1 %cmp, label %for.body, label %for.end, !dbg !350

for.body:                                         ; preds = %for.cond
  %6 = load i32* %j, align 4, !dbg !351
  %idxprom = sext i32 %6 to i64, !dbg !353
  %7 = load %struct.DLL** %l, align 8, !dbg !354
  %arrayidx = getelementptr inbounds %struct.DLL* %7, i64 %idxprom, !dbg !353
  %8 = load i32* %i, align 4, !dbg !355
  %idxprom3 = sext i32 %8 to i64, !dbg !356
  %9 = load %struct.DLL** %l, align 8, !dbg !356
  %arrayidx4 = getelementptr inbounds %struct.DLL* %9, i64 %idxprom3, !dbg !356
  %next = getelementptr inbounds %struct.DLL* %arrayidx4, i32 0, i32 1, !dbg !356
  store %struct.DLL* %arrayidx, %struct.DLL** %next, align 8, !dbg !356
  %10 = load i32* %i, align 4, !dbg !357
  %idxprom5 = sext i32 %10 to i64, !dbg !358
  %11 = load %struct.DLL** %l, align 8, !dbg !359
  %arrayidx6 = getelementptr inbounds %struct.DLL* %11, i64 %idxprom5, !dbg !358
  %12 = load i32* %j, align 4, !dbg !360
  %idxprom7 = sext i32 %12 to i64, !dbg !361
  %13 = load %struct.DLL** %l, align 8, !dbg !361
  %arrayidx8 = getelementptr inbounds %struct.DLL* %13, i64 %idxprom7, !dbg !361
  %prev = getelementptr inbounds %struct.DLL* %arrayidx8, i32 0, i32 2, !dbg !361
  store %struct.DLL* %arrayidx6, %struct.DLL** %prev, align 8, !dbg !361
  %14 = load %struct.DLL** %xp, align 8, !dbg !362
  %val = getelementptr inbounds %struct.DLL* %14, i32 0, i32 0, !dbg !362
  %15 = load i32* %val, align 4, !dbg !362
  %16 = load i32* %i, align 4, !dbg !363
  %idxprom9 = sext i32 %16 to i64, !dbg !364
  %17 = load %struct.DLL** %l, align 8, !dbg !364
  %arrayidx10 = getelementptr inbounds %struct.DLL* %17, i64 %idxprom9, !dbg !364
  %val11 = getelementptr inbounds %struct.DLL* %arrayidx10, i32 0, i32 0, !dbg !364
  store i32 %15, i32* %val11, align 4, !dbg !364
  br label %for.inc, !dbg !365

for.inc:                                          ; preds = %for.body
  %18 = load i32* %i, align 4, !dbg !366
  %inc = add nsw i32 %18, 1, !dbg !366
  store i32 %inc, i32* %i, align 4, !dbg !366
  %19 = load i32* %j, align 4, !dbg !367
  %inc12 = add nsw i32 %19, 1, !dbg !367
  store i32 %inc12, i32* %j, align 4, !dbg !367
  %20 = load %struct.DLL** %xp, align 8, !dbg !368
  %next13 = getelementptr inbounds %struct.DLL* %20, i32 0, i32 1, !dbg !368
  %21 = load %struct.DLL** %next13, align 8, !dbg !368
  store %struct.DLL* %21, %struct.DLL** %xp, align 8, !dbg !369
  br label %for.cond, !dbg !370

for.end:                                          ; preds = %for.cond
  %22 = load i32* %size, align 4, !dbg !371
  %idxprom14 = sext i32 %22 to i64, !dbg !372
  %23 = load %struct.DLL** %l, align 8, !dbg !373
  %arrayidx15 = getelementptr inbounds %struct.DLL* %23, i64 %idxprom14, !dbg !372
  %24 = load %struct.DLL** %l, align 8, !dbg !374
  %arrayidx16 = getelementptr inbounds %struct.DLL* %24, i64 0, !dbg !374
  %prev17 = getelementptr inbounds %struct.DLL* %arrayidx16, i32 0, i32 2, !dbg !374
  store %struct.DLL* %arrayidx15, %struct.DLL** %prev17, align 8, !dbg !374
  %25 = load %struct.DLL** %l, align 8, !dbg !375
  %arrayidx18 = getelementptr inbounds %struct.DLL* %25, i64 0, !dbg !376
  %26 = load i32* %size, align 4, !dbg !377
  %idxprom19 = sext i32 %26 to i64, !dbg !378
  %27 = load %struct.DLL** %l, align 8, !dbg !378
  %arrayidx20 = getelementptr inbounds %struct.DLL* %27, i64 %idxprom19, !dbg !378
  %next21 = getelementptr inbounds %struct.DLL* %arrayidx20, i32 0, i32 1, !dbg !378
  store %struct.DLL* %arrayidx18, %struct.DLL** %next21, align 8, !dbg !378
  %28 = load %struct.DLL** %x.addr, align 8, !dbg !379
  %call22 = call %struct.DLL* @list_last(%struct.DLL* %28), !dbg !380
  %val23 = getelementptr inbounds %struct.DLL* %call22, i32 0, i32 0, !dbg !380
  %29 = load i32* %val23, align 4, !dbg !380
  %30 = load i32* %size, align 4, !dbg !381
  %idxprom24 = sext i32 %30 to i64, !dbg !382
  %31 = load %struct.DLL** %l, align 8, !dbg !382
  %arrayidx25 = getelementptr inbounds %struct.DLL* %31, i64 %idxprom24, !dbg !382
  %val26 = getelementptr inbounds %struct.DLL* %arrayidx25, i32 0, i32 0, !dbg !382
  store i32 %29, i32* %val26, align 4, !dbg !382
  %32 = load %struct.DLL** %l, align 8, !dbg !383
  ret %struct.DLL* %32, !dbg !384
}

; Function Attrs: nounwind uwtable
define internal %struct.DLL* @list_last(%struct.DLL* %head) #0 {
entry:
  %head.addr = alloca %struct.DLL*, align 8
  store %struct.DLL* %head, %struct.DLL** %head.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.DLL** %head.addr, metadata !385, metadata !57), !dbg !386
  %0 = load %struct.DLL** %head.addr, align 8, !dbg !387
  %prev = getelementptr inbounds %struct.DLL* %0, i32 0, i32 2, !dbg !387
  %1 = load %struct.DLL** %prev, align 8, !dbg !387
  ret %struct.DLL* %1, !dbg !388
}

; Function Attrs: nounwind uwtable
define void @list_reverse(%struct.DLL* %head) #0 {
entry:
  %head.addr = alloca %struct.DLL*, align 8
  %tmp = alloca %struct.DLL*, align 8
  %p = alloca %struct.DLL*, align 8
  store %struct.DLL* %head, %struct.DLL** %head.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.DLL** %head.addr, metadata !389, metadata !57), !dbg !390
  call void @llvm.dbg.declare(metadata %struct.DLL** %tmp, metadata !391, metadata !57), !dbg !392
  call void @llvm.dbg.declare(metadata %struct.DLL** %p, metadata !393, metadata !57), !dbg !394
  %0 = load %struct.DLL** %head.addr, align 8, !dbg !395
  store %struct.DLL* %0, %struct.DLL** %p, align 8, !dbg !394
  br label %do.body, !dbg !396

do.body:                                          ; preds = %do.cond, %entry
  %1 = load %struct.DLL** %p, align 8, !dbg !397
  %next = getelementptr inbounds %struct.DLL* %1, i32 0, i32 1, !dbg !397
  %2 = load %struct.DLL** %next, align 8, !dbg !397
  store %struct.DLL* %2, %struct.DLL** %tmp, align 8, !dbg !399
  %3 = load %struct.DLL** %p, align 8, !dbg !400
  %prev = getelementptr inbounds %struct.DLL* %3, i32 0, i32 2, !dbg !400
  %4 = load %struct.DLL** %prev, align 8, !dbg !400
  %5 = load %struct.DLL** %p, align 8, !dbg !401
  %next2 = getelementptr inbounds %struct.DLL* %5, i32 0, i32 1, !dbg !401
  store %struct.DLL* %4, %struct.DLL** %next2, align 8, !dbg !401
  %6 = load %struct.DLL** %tmp, align 8, !dbg !402
  %7 = load %struct.DLL** %p, align 8, !dbg !403
  %prev3 = getelementptr inbounds %struct.DLL* %7, i32 0, i32 2, !dbg !403
  store %struct.DLL* %6, %struct.DLL** %prev3, align 8, !dbg !403
  %8 = load %struct.DLL** %tmp, align 8, !dbg !404
  store %struct.DLL* %8, %struct.DLL** %p, align 8, !dbg !405
  br label %do.cond, !dbg !406

do.cond:                                          ; preds = %do.body
  %9 = load %struct.DLL** %p, align 8, !dbg !407
  %10 = load %struct.DLL** %head.addr, align 8, !dbg !409
  %cmp = icmp ne %struct.DLL* %9, %10, !dbg !410
  br i1 %cmp, label %do.body, label %do.end, !dbg !406

do.end:                                           ; preds = %do.cond
  ret void, !dbg !411
}

; Function Attrs: nounwind uwtable
define i32 @test_lists() #0 {
entry:
  %len = alloca i32, align 4
  %li1 = alloca %struct.DLL*, align 8
  %li2 = alloca %struct.DLL*, align 8
  %li3 = alloca %struct.DLL*, align 8
  call void @llvm.dbg.declare(metadata i32* %len, metadata !412, metadata !57), !dbg !413
  store i32 0, i32* %len, align 4, !dbg !413
  call void @llvm.dbg.declare(metadata %struct.DLL** %li1, metadata !414, metadata !57), !dbg !415
  %call = call %struct.DLL* @list_sequence(i32 1, i32 100), !dbg !416
  store %struct.DLL* %call, %struct.DLL** %li1, align 8, !dbg !415
  call void @llvm.dbg.declare(metadata %struct.DLL** %li2, metadata !417, metadata !57), !dbg !418
  %0 = load %struct.DLL** %li1, align 8, !dbg !419
  %call1 = call %struct.DLL* @list_copy(%struct.DLL* %0), !dbg !420
  store %struct.DLL* %call1, %struct.DLL** %li2, align 8, !dbg !418
  call void @llvm.dbg.declare(metadata %struct.DLL** %li3, metadata !421, metadata !57), !dbg !422
  %call2 = call %struct.DLL* @list_new(), !dbg !423
  store %struct.DLL* %call2, %struct.DLL** %li3, align 8, !dbg !422
  %1 = load %struct.DLL** %li2, align 8, !dbg !424
  %2 = load %struct.DLL** %li1, align 8, !dbg !426
  %call3 = call i32 @list_equal(%struct.DLL* %1, %struct.DLL* %2), !dbg !427
  %tobool = icmp ne i32 %call3, 0, !dbg !428
  br i1 %tobool, label %if.end, label %if.then, !dbg !428

if.then:                                          ; preds = %entry
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str4, i32 0, i32 0)), !dbg !429
  call void @exit(i32 1) #7, !dbg !431
  unreachable, !dbg !431

if.end:                                           ; preds = %entry
  br label %while.cond, !dbg !432

while.cond:                                       ; preds = %while.body, %if.end
  %3 = load %struct.DLL** %li2, align 8, !dbg !433
  %call5 = call i32 @list_empty(%struct.DLL* %3), !dbg !436
  %tobool6 = icmp ne i32 %call5, 0, !dbg !437
  %lnot = xor i1 %tobool6, true, !dbg !437
  br i1 %lnot, label %while.body, label %while.end, !dbg !432

while.body:                                       ; preds = %while.cond
  %4 = load %struct.DLL** %li3, align 8, !dbg !438
  %5 = load %struct.DLL** %li2, align 8, !dbg !440
  %call7 = call %struct.DLL* @list_pop_head(%struct.DLL* %5), !dbg !441
  call void @list_push_tail(%struct.DLL* %4, %struct.DLL* %call7), !dbg !442
  br label %while.cond, !dbg !432

while.end:                                        ; preds = %while.cond
  %6 = load %struct.DLL** %li2, align 8, !dbg !443
  %call8 = call i32 @list_empty(%struct.DLL* %6), !dbg !445
  %tobool9 = icmp ne i32 %call8, 0, !dbg !446
  br i1 %tobool9, label %if.end12, label %if.then10, !dbg !446

if.then10:                                        ; preds = %while.end
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str5, i32 0, i32 0)), !dbg !447
  call void @exit(i32 1) #7, !dbg !449
  unreachable, !dbg !449

if.end12:                                         ; preds = %while.end
  br label %while.cond13, !dbg !450

while.cond13:                                     ; preds = %while.body17, %if.end12
  %7 = load %struct.DLL** %li3, align 8, !dbg !451
  %call14 = call i32 @list_empty(%struct.DLL* %7), !dbg !452
  %tobool15 = icmp ne i32 %call14, 0, !dbg !453
  %lnot16 = xor i1 %tobool15, true, !dbg !453
  br i1 %lnot16, label %while.body17, label %while.end19, !dbg !450

while.body17:                                     ; preds = %while.cond13
  %8 = load %struct.DLL** %li2, align 8, !dbg !454
  %9 = load %struct.DLL** %li3, align 8, !dbg !456
  %call18 = call %struct.DLL* @list_pop_tail(%struct.DLL* %9), !dbg !457
  call void @list_push_tail(%struct.DLL* %8, %struct.DLL* %call18), !dbg !458
  br label %while.cond13, !dbg !450

while.end19:                                      ; preds = %while.cond13
  %10 = load %struct.DLL** %li3, align 8, !dbg !459
  %call20 = call i32 @list_empty(%struct.DLL* %10), !dbg !461
  %tobool21 = icmp ne i32 %call20, 0, !dbg !462
  br i1 %tobool21, label %if.end24, label %if.then22, !dbg !462

if.then22:                                        ; preds = %while.end19
  %call23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str6, i32 0, i32 0)), !dbg !463
  call void @exit(i32 1) #7, !dbg !465
  unreachable, !dbg !465

if.end24:                                         ; preds = %while.end19
  %11 = load %struct.DLL** %li1, align 8, !dbg !466
  call void @list_reverse(%struct.DLL* %11), !dbg !467
  %12 = load %struct.DLL** %li1, align 8, !dbg !468
  %call25 = call %struct.DLL* @list_first(%struct.DLL* %12), !dbg !470
  %val = getelementptr inbounds %struct.DLL* %call25, i32 0, i32 0, !dbg !470
  %13 = load i32* %val, align 4, !dbg !470
  %cmp = icmp ne i32 %13, 100, !dbg !470
  br i1 %cmp, label %if.then26, label %if.end30, !dbg !471

if.then26:                                        ; preds = %if.end24
  %14 = load %struct.DLL** %li1, align 8, !dbg !472
  %call27 = call %struct.DLL* @list_first(%struct.DLL* %14), !dbg !474
  %val28 = getelementptr inbounds %struct.DLL* %call27, i32 0, i32 0, !dbg !474
  %15 = load i32* %val28, align 4, !dbg !474
  %call29 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([42 x i8]* @.str7, i32 0, i32 0), i32 100, i32 %15), !dbg !475
  call void @exit(i32 1) #7, !dbg !476
  unreachable, !dbg !476

if.end30:                                         ; preds = %if.end24
  %16 = load %struct.DLL** %li1, align 8, !dbg !477
  %call31 = call %struct.DLL* @list_last(%struct.DLL* %16), !dbg !479
  %val32 = getelementptr inbounds %struct.DLL* %call31, i32 0, i32 0, !dbg !479
  %17 = load i32* %val32, align 4, !dbg !479
  %cmp33 = icmp ne i32 %17, 1, !dbg !479
  br i1 %cmp33, label %if.then34, label %if.end38, !dbg !480

if.then34:                                        ; preds = %if.end30
  %18 = load %struct.DLL** %li1, align 8, !dbg !481
  %call35 = call %struct.DLL* @list_last(%struct.DLL* %18), !dbg !483
  %val36 = getelementptr inbounds %struct.DLL* %call35, i32 0, i32 0, !dbg !483
  %19 = load i32* %val36, align 4, !dbg !483
  %call37 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str8, i32 0, i32 0), i32 100, i32 %19), !dbg !484
  call void @exit(i32 1) #7, !dbg !485
  unreachable, !dbg !485

if.end38:                                         ; preds = %if.end30
  %20 = load %struct.DLL** %li2, align 8, !dbg !486
  %call39 = call %struct.DLL* @list_first(%struct.DLL* %20), !dbg !488
  %val40 = getelementptr inbounds %struct.DLL* %call39, i32 0, i32 0, !dbg !488
  %21 = load i32* %val40, align 4, !dbg !488
  %cmp41 = icmp ne i32 %21, 100, !dbg !488
  br i1 %cmp41, label %if.then42, label %if.end46, !dbg !489

if.then42:                                        ; preds = %if.end38
  %22 = load %struct.DLL** %li2, align 8, !dbg !490
  %call43 = call %struct.DLL* @list_first(%struct.DLL* %22), !dbg !492
  %val44 = getelementptr inbounds %struct.DLL* %call43, i32 0, i32 0, !dbg !492
  %23 = load i32* %val44, align 4, !dbg !492
  %call45 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([42 x i8]* @.str9, i32 0, i32 0), i32 100, i32 %23), !dbg !493
  call void @exit(i32 1) #7, !dbg !494
  unreachable, !dbg !494

if.end46:                                         ; preds = %if.end38
  %24 = load %struct.DLL** %li2, align 8, !dbg !495
  %call47 = call %struct.DLL* @list_last(%struct.DLL* %24), !dbg !497
  %val48 = getelementptr inbounds %struct.DLL* %call47, i32 0, i32 0, !dbg !497
  %25 = load i32* %val48, align 4, !dbg !497
  %cmp49 = icmp ne i32 %25, 1, !dbg !497
  br i1 %cmp49, label %if.then50, label %if.end54, !dbg !498

if.then50:                                        ; preds = %if.end46
  %26 = load %struct.DLL** %li2, align 8, !dbg !499
  %call51 = call %struct.DLL* @list_last(%struct.DLL* %26), !dbg !501
  %val52 = getelementptr inbounds %struct.DLL* %call51, i32 0, i32 0, !dbg !501
  %27 = load i32* %val52, align 4, !dbg !501
  %call53 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str8, i32 0, i32 0), i32 100, i32 %27), !dbg !502
  call void @exit(i32 1) #7, !dbg !503
  unreachable, !dbg !503

if.end54:                                         ; preds = %if.end46
  %28 = load %struct.DLL** %li1, align 8, !dbg !504
  %call55 = call i32 @list_length(%struct.DLL* %28), !dbg !506
  %cmp56 = icmp ne i32 %call55, 100, !dbg !506
  br i1 %cmp56, label %if.then57, label %if.end60, !dbg !507

if.then57:                                        ; preds = %if.end54
  %29 = load %struct.DLL** %li1, align 8, !dbg !508
  %call58 = call i32 @list_length(%struct.DLL* %29), !dbg !510
  %call59 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([35 x i8]* @.str10, i32 0, i32 0), i32 100, i32 %call58), !dbg !511
  call void @exit(i32 1) #7, !dbg !512
  unreachable, !dbg !512

if.end60:                                         ; preds = %if.end54
  %30 = load %struct.DLL** %li1, align 8, !dbg !513
  %31 = load %struct.DLL** %li2, align 8, !dbg !515
  %call61 = call i32 @list_equal(%struct.DLL* %30, %struct.DLL* %31), !dbg !516
  %tobool62 = icmp ne i32 %call61, 0, !dbg !517
  br i1 %tobool62, label %if.end65, label %if.then63, !dbg !517

if.then63:                                        ; preds = %if.end60
  %call64 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str11, i32 0, i32 0)), !dbg !518
  call void @exit(i32 1) #7, !dbg !520
  unreachable, !dbg !520

if.end65:                                         ; preds = %if.end60
  %32 = load %struct.DLL** %li1, align 8, !dbg !521
  %call66 = call i32 @list_length(%struct.DLL* %32), !dbg !522
  store i32 %call66, i32* %len, align 4, !dbg !523
  %33 = load %struct.DLL** %li1, align 8, !dbg !524
  %34 = bitcast %struct.DLL* %33 to i8*, !dbg !524
  call void @free(i8* %34) #6, !dbg !525
  %35 = load %struct.DLL** %li2, align 8, !dbg !526
  %36 = bitcast %struct.DLL* %35 to i8*, !dbg !526
  call void @free(i8* %36) #6, !dbg !527
  %37 = load %struct.DLL** %li3, align 8, !dbg !528
  %38 = bitcast %struct.DLL* %37 to i8*, !dbg !528
  call void @free(i8* %38) #6, !dbg !529
  %39 = load i32* %len, align 4, !dbg !530
  ret i32 %39, !dbg !531
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #4

; Function Attrs: nounwind uwtable
define internal %struct.DLL* @list_first(%struct.DLL* %head) #0 {
entry:
  %head.addr = alloca %struct.DLL*, align 8
  store %struct.DLL* %head, %struct.DLL** %head.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.DLL** %head.addr, metadata !532, metadata !57), !dbg !533
  %0 = load %struct.DLL** %head.addr, align 8, !dbg !534
  %next = getelementptr inbounds %struct.DLL* %0, i32 0, i32 1, !dbg !534
  %1 = load %struct.DLL** %next, align 8, !dbg !534
  ret %struct.DLL* %1, !dbg !535
}

; Function Attrs: nounwind
declare void @free(i8*) #3

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %n = alloca i32, align 4
  %result = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !536, metadata !57), !dbg !537
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !538, metadata !57), !dbg !539
  call void @llvm.dbg.declare(metadata i32* %n, metadata !540, metadata !57), !dbg !541
  %0 = load i32* %argc.addr, align 4, !dbg !542
  %cmp = icmp eq i32 %0, 2, !dbg !542
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !543

cond.true:                                        ; preds = %entry
  %1 = load i8*** %argv.addr, align 8, !dbg !544
  %arrayidx = getelementptr inbounds i8** %1, i64 1, !dbg !544
  %2 = load i8** %arrayidx, align 8, !dbg !544
  %call = call i32 @atoi(i8* %2) #8, !dbg !546
  br label %cond.end, !dbg !543

cond.false:                                       ; preds = %entry
  br label %cond.end, !dbg !547

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call, %cond.true ], [ 3000000, %cond.false ], !dbg !543
  store i32 %cond, i32* %n, align 4, !dbg !549
  call void @llvm.dbg.declare(metadata i32* %result, metadata !552, metadata !57), !dbg !553
  store i32 0, i32* %result, align 4, !dbg !553
  br label %while.cond, !dbg !554

while.cond:                                       ; preds = %while.body, %cond.end
  %3 = load i32* %n, align 4, !dbg !555
  %dec = add nsw i32 %3, -1, !dbg !555
  store i32 %dec, i32* %n, align 4, !dbg !555
  %tobool = icmp ne i32 %3, 0, !dbg !554
  br i1 %tobool, label %while.body, label %while.end, !dbg !554

while.body:                                       ; preds = %while.cond
  %call1 = call i32 @test_lists(), !dbg !557
  store i32 %call1, i32* %result, align 4, !dbg !558
  br label %while.cond, !dbg !554

while.end:                                        ; preds = %while.cond
  %4 = load i32* %result, align 4, !dbg !559
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str12, i32 0, i32 0), i32 %4), !dbg !560
  ret i32 0, !dbg !561
}

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #5

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }
attributes #8 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!53, !54}
!llvm.ident = !{!55}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\000\00\000\00\001", !1, !2, !3, !13, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c] [DW_LANG_C99]
!1 = !{!"lists.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from DLL]
!5 = !{!"0x16\00DLL\0019\000\000\000\000", !1, null, !6} ; [ DW_TAG_typedef ] [DLL] [line 19, size 0, align 0, offset 0] [from DLL]
!6 = !{!"0x13\00DLL\0015\00192\0064\000\000\000", !1, null, null, !7, null, null, null} ; [ DW_TAG_structure_type ] [DLL] [line 15, size 192, align 64, offset 0] [def] [from ]
!7 = !{!8, !10, !12}
!8 = !{!"0xd\00val\0016\0032\0032\000\000", !1, !6, !9} ; [ DW_TAG_member ] [val] [line 16, size 32, align 32, offset 0] [from int]
!9 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!10 = !{!"0xd\00next\0017\0064\0064\0064\000", !1, !6, !11} ; [ DW_TAG_member ] [next] [line 17, size 64, align 64, offset 64] [from ]
!11 = !{!"0xf\00\000\0064\0064\000\000", null, null, !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from DLL]
!12 = !{!"0xd\00prev\0018\0064\0064\00128\000", !1, !6, !11} ; [ DW_TAG_member ] [prev] [line 18, size 64, align 64, offset 128] [from ]
!13 = !{!14, !18, !21, !22, !23, !26, !31, !33, !36, !37, !40, !43, !47, !48, !49, !52}
!14 = !{!"0x2e\00list_push_tail\00list_push_tail\00\0026\000\001\000\000\00256\000\0026", !1, !15, !16, null, void (%struct.DLL*, %struct.DLL*)* @list_push_tail, null, null, !2} ; [ DW_TAG_subprogram ] [line 26] [def] [list_push_tail]
!15 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!16 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !17, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!17 = !{null, !4, !4}
!18 = !{!"0x2e\00list_pop_tail\00list_pop_tail\00\0035\000\001\000\000\00256\000\0035", !1, !15, !19, null, %struct.DLL* (%struct.DLL*)* @list_pop_tail, null, null, !2} ; [ DW_TAG_subprogram ] [line 35] [def] [list_pop_tail]
!19 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !20, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!20 = !{!4, !4}
!21 = !{!"0x2e\00list_push_head\00list_push_head\00\0046\000\001\000\000\00256\000\0046", !1, !15, !16, null, void (%struct.DLL*, %struct.DLL*)* @list_push_head, null, null, !2} ; [ DW_TAG_subprogram ] [line 46] [def] [list_push_head]
!22 = !{!"0x2e\00list_pop_head\00list_pop_head\00\0055\000\001\000\000\00256\000\0055", !1, !15, !19, null, %struct.DLL* (%struct.DLL*)* @list_pop_head, null, null, !2} ; [ DW_TAG_subprogram ] [line 55] [def] [list_pop_head]
!23 = !{!"0x2e\00list_equal\00list_equal\00\0065\000\001\000\000\00256\000\0065", !1, !15, !24, null, i32 (%struct.DLL*, %struct.DLL*)* @list_equal, null, null, !2} ; [ DW_TAG_subprogram ] [line 65] [def] [list_equal]
!24 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !25, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!25 = !{!9, !4, !4}
!26 = !{!"0x2e\00list_print\00list_print\00\0075\000\001\000\000\00256\000\0075", !1, !15, !27, null, void (i8*, %struct.DLL*)* @list_print, null, null, !2} ; [ DW_TAG_subprogram ] [line 75] [def] [list_print]
!27 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !28, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!28 = !{null, !29, !4}
!29 = !{!"0xf\00\000\0064\0064\000\000", null, null, !30} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!30 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!31 = !{!"0x2e\00list_new\00list_new\00\0088\000\001\000\000\000\000\0088", !1, !15, !32, null, %struct.DLL* ()* @list_new, null, null, !2} ; [ DW_TAG_subprogram ] [line 88] [def] [list_new]
!32 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !3, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!33 = !{!"0x2e\00list_sequence\00list_sequence\00\0097\000\001\000\000\00256\000\0097", !1, !15, !34, null, %struct.DLL* (i32, i32)* @list_sequence, null, null, !2} ; [ DW_TAG_subprogram ] [line 97] [def] [list_sequence]
!34 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !35, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!35 = !{!4, !9, !9}
!36 = !{!"0x2e\00list_copy\00list_copy\00\00118\000\001\000\000\00256\000\00118", !1, !15, !19, null, %struct.DLL* (%struct.DLL*)* @list_copy, null, null, !2} ; [ DW_TAG_subprogram ] [line 118] [def] [list_copy]
!37 = !{!"0x2e\00list_reverse\00list_reverse\00\00132\000\001\000\000\00256\000\00132", !1, !15, !38, null, void (%struct.DLL*)* @list_reverse, null, null, !2} ; [ DW_TAG_subprogram ] [line 132] [def] [list_reverse]
!38 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !39, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!39 = !{null, !4}
!40 = !{!"0x2e\00test_lists\00test_lists\00\00142\000\001\000\000\000\000\00142", !1, !15, !41, null, i32 ()* @test_lists, null, null, !2} ; [ DW_TAG_subprogram ] [line 142] [def] [test_lists]
!41 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !42, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!42 = !{!9}
!43 = !{!"0x2e\00main\00main\00\00219\000\001\000\000\00256\000\00219", !1, !15, !44, null, i32 (i32, i8**)* @main, null, null, !2} ; [ DW_TAG_subprogram ] [line 219] [def] [main]
!44 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !45, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!45 = !{!9, !9, !46}
!46 = !{!"0xf\00\000\0064\0064\000\000", null, null, !29} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!47 = !{!"0x2e\00list_first\00list_first\00\0023\001\001\000\000\00256\000\0023", !1, !15, !19, null, %struct.DLL* (%struct.DLL*)* @list_first, null, null, !2} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [list_first]
!48 = !{!"0x2e\00list_last\00list_last\00\0024\001\001\000\000\00256\000\0024", !1, !15, !19, null, %struct.DLL* (%struct.DLL*)* @list_last, null, null, !2} ; [ DW_TAG_subprogram ] [line 24] [local] [def] [list_last]
!49 = !{!"0x2e\00list_length\00list_length\00\0021\001\001\000\000\00256\000\0021", !1, !15, !50, null, i32 (%struct.DLL*)* @list_length, null, null, !2} ; [ DW_TAG_subprogram ] [line 21] [local] [def] [list_length]
!50 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !51, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!51 = !{!9, !4}
!52 = !{!"0x2e\00list_empty\00list_empty\00\0022\001\001\000\000\00256\000\0022", !1, !15, !50, null, i32 (%struct.DLL*)* @list_empty, null, null, !2} ; [ DW_TAG_subprogram ] [line 22] [local] [def] [list_empty]
!53 = !{i32 2, !"Dwarf Version", i32 4}
!54 = !{i32 2, !"Debug Info Version", i32 2}
!55 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!56 = !{!"0x101\00head\0016777242\000", !14, !15, !4} ; [ DW_TAG_arg_variable ] [head] [line 26]
!57 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!58 = !MDLocation(line: 26, column: 26, scope: !14)
!59 = !{!"0x101\00item\0033554458\000", !14, !15, !4} ; [ DW_TAG_arg_variable ] [item] [line 26]
!60 = !MDLocation(line: 26, column: 37, scope: !14)
!61 = !{!"0x100\00tail\0027\000", !14, !15, !4}   ; [ DW_TAG_auto_variable ] [tail] [line 27]
!62 = !MDLocation(line: 27, column: 8, scope: !14)
!63 = !MDLocation(line: 27, column: 15, scope: !14)
!64 = !MDLocation(line: 28, column: 16, scope: !14)
!65 = !MDLocation(line: 28, column: 3, scope: !14)
!66 = !MDLocation(line: 29, column: 16, scope: !14)
!67 = !MDLocation(line: 29, column: 3, scope: !14)
!68 = !MDLocation(line: 30, column: 16, scope: !14)
!69 = !MDLocation(line: 30, column: 3, scope: !14)
!70 = !MDLocation(line: 31, column: 16, scope: !14)
!71 = !MDLocation(line: 31, column: 3, scope: !14)
!72 = !MDLocation(line: 32, column: 3, scope: !14)
!73 = !MDLocation(line: 33, column: 1, scope: !14)
!74 = !{!"0x101\00head\0016777251\000", !18, !15, !4} ; [ DW_TAG_arg_variable ] [head] [line 35]
!75 = !MDLocation(line: 35, column: 25, scope: !18)
!76 = !{!"0x100\00prev\0036\000", !18, !15, !4}   ; [ DW_TAG_auto_variable ] [prev] [line 36]
!77 = !MDLocation(line: 36, column: 8, scope: !18)
!78 = !{!"0x100\00tail\0036\000", !18, !15, !4}   ; [ DW_TAG_auto_variable ] [tail] [line 36]
!79 = !MDLocation(line: 36, column: 15, scope: !18)
!80 = !MDLocation(line: 37, column: 18, scope: !81)
!81 = !{!"0xb\0037\007\000", !1, !18}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!82 = !MDLocation(line: 37, column: 7, scope: !81)
!83 = !MDLocation(line: 37, column: 7, scope: !18)
!84 = !MDLocation(line: 37, column: 25, scope: !85)
!85 = !{!"0xb\001", !1, !81}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!86 = !MDLocation(line: 38, column: 10, scope: !18)
!87 = !MDLocation(line: 38, column: 3, scope: !18)
!88 = !MDLocation(line: 39, column: 10, scope: !18)
!89 = !MDLocation(line: 39, column: 3, scope: !18)
!90 = !MDLocation(line: 40, column: 16, scope: !18)
!91 = !MDLocation(line: 40, column: 3, scope: !18)
!92 = !MDLocation(line: 41, column: 16, scope: !18)
!93 = !MDLocation(line: 41, column: 3, scope: !18)
!94 = !MDLocation(line: 42, column: 3, scope: !18)
!95 = !MDLocation(line: 43, column: 10, scope: !18)
!96 = !MDLocation(line: 43, column: 3, scope: !18)
!97 = !MDLocation(line: 44, column: 1, scope: !18)
!98 = !{!"0x101\00head\0016777238\000", !52, !15, !4} ; [ DW_TAG_arg_variable ] [head] [line 22]
!99 = !MDLocation(line: 22, column: 28, scope: !52)
!100 = !MDLocation(line: 22, column: 55, scope: !52)
!101 = !MDLocation(line: 22, column: 43, scope: !52)
!102 = !MDLocation(line: 22, column: 36, scope: !52)
!103 = !{!"0x101\00head\0016777262\000", !21, !15, !4} ; [ DW_TAG_arg_variable ] [head] [line 46]
!104 = !MDLocation(line: 46, column: 26, scope: !21)
!105 = !{!"0x101\00item\0033554478\000", !21, !15, !4} ; [ DW_TAG_arg_variable ] [item] [line 46]
!106 = !MDLocation(line: 46, column: 37, scope: !21)
!107 = !{!"0x100\00next\0047\000", !21, !15, !4}  ; [ DW_TAG_auto_variable ] [next] [line 47]
!108 = !MDLocation(line: 47, column: 8, scope: !21)
!109 = !MDLocation(line: 47, column: 15, scope: !21)
!110 = !MDLocation(line: 48, column: 16, scope: !21)
!111 = !MDLocation(line: 48, column: 3, scope: !21)
!112 = !MDLocation(line: 49, column: 16, scope: !21)
!113 = !MDLocation(line: 49, column: 3, scope: !21)
!114 = !MDLocation(line: 50, column: 16, scope: !21)
!115 = !MDLocation(line: 50, column: 3, scope: !21)
!116 = !MDLocation(line: 51, column: 16, scope: !21)
!117 = !MDLocation(line: 51, column: 3, scope: !21)
!118 = !MDLocation(line: 52, column: 3, scope: !21)
!119 = !MDLocation(line: 53, column: 1, scope: !21)
!120 = !{!"0x101\00head\0016777271\000", !22, !15, !4} ; [ DW_TAG_arg_variable ] [head] [line 55]
!121 = !MDLocation(line: 55, column: 25, scope: !22)
!122 = !{!"0x100\00next\0056\000", !22, !15, !4}  ; [ DW_TAG_auto_variable ] [next] [line 56]
!123 = !MDLocation(line: 56, column: 8, scope: !22)
!124 = !MDLocation(line: 57, column: 18, scope: !125)
!125 = !{!"0xb\0057\007\001", !1, !22}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!126 = !MDLocation(line: 57, column: 7, scope: !125)
!127 = !MDLocation(line: 57, column: 7, scope: !22)
!128 = !MDLocation(line: 57, column: 25, scope: !129)
!129 = !{!"0xb\001", !1, !125}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!130 = !MDLocation(line: 58, column: 10, scope: !22)
!131 = !MDLocation(line: 58, column: 3, scope: !22)
!132 = !MDLocation(line: 59, column: 16, scope: !22)
!133 = !MDLocation(line: 59, column: 3, scope: !22)
!134 = !MDLocation(line: 60, column: 22, scope: !22)
!135 = !MDLocation(line: 60, column: 3, scope: !22)
!136 = !MDLocation(line: 61, column: 3, scope: !22)
!137 = !MDLocation(line: 62, column: 10, scope: !22)
!138 = !MDLocation(line: 62, column: 3, scope: !22)
!139 = !MDLocation(line: 63, column: 1, scope: !22)
!140 = !{!"0x101\00x\0016777281\000", !23, !15, !4} ; [ DW_TAG_arg_variable ] [x] [line 65]
!141 = !MDLocation(line: 65, column: 21, scope: !23)
!142 = !{!"0x101\00y\0033554497\000", !23, !15, !4} ; [ DW_TAG_arg_variable ] [y] [line 65]
!143 = !MDLocation(line: 65, column: 29, scope: !23)
!144 = !{!"0x100\00xp\0066\000", !23, !15, !4}    ; [ DW_TAG_auto_variable ] [xp] [line 66]
!145 = !MDLocation(line: 66, column: 8, scope: !23)
!146 = !{!"0x100\00yp\0066\000", !23, !15, !4}    ; [ DW_TAG_auto_variable ] [yp] [line 66]
!147 = !MDLocation(line: 66, column: 13, scope: !23)
!148 = !MDLocation(line: 68, column: 11, scope: !149)
!149 = !{!"0xb\0068\003\002", !1, !23}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!150 = !MDLocation(line: 68, column: 8, scope: !149)
!151 = !MDLocation(line: 68, column: 17, scope: !149)
!152 = !MDLocation(line: 68, column: 14, scope: !149)
!153 = !MDLocation(line: 68, column: 20, scope: !154)
!154 = !{!"0xb\002", !1, !155}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!155 = !{!"0xb\001", !1, !156}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!156 = !{!"0xb\0068\003\003", !1, !149}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!157 = !MDLocation(line: 68, column: 32, scope: !156)
!158 = !MDLocation(line: 68, column: 20, scope: !156)
!159 = !MDLocation(line: 68, column: 3, scope: !149)
!160 = !MDLocation(line: 69, column: 9, scope: !161)
!161 = !{!"0xb\0069\009\005", !1, !162}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!162 = !{!"0xb\0068\0061\004", !1, !156}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!163 = !MDLocation(line: 69, column: 20, scope: !161)
!164 = !MDLocation(line: 69, column: 9, scope: !162)
!165 = !MDLocation(line: 69, column: 29, scope: !166)
!166 = !{!"0xb\001", !1, !161}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!167 = !MDLocation(line: 70, column: 3, scope: !162)
!168 = !MDLocation(line: 68, column: 38, scope: !156)
!169 = !MDLocation(line: 68, column: 35, scope: !156)
!170 = !MDLocation(line: 68, column: 51, scope: !156)
!171 = !MDLocation(line: 68, column: 48, scope: !156)
!172 = !MDLocation(line: 68, column: 3, scope: !156)
!173 = !MDLocation(line: 71, column: 7, scope: !174)
!174 = !{!"0xb\0071\007\006", !1, !23}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!175 = !MDLocation(line: 71, column: 18, scope: !174)
!176 = !MDLocation(line: 71, column: 7, scope: !23)
!177 = !MDLocation(line: 71, column: 27, scope: !178)
!178 = !{!"0xb\001", !1, !174}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!179 = !MDLocation(line: 72, column: 10, scope: !23)
!180 = !MDLocation(line: 72, column: 22, scope: !23)
!181 = !MDLocation(line: 72, column: 3, scope: !23)
!182 = !MDLocation(line: 73, column: 1, scope: !23)
!183 = !{!"0x101\00msg\0016777291\000", !26, !15, !29} ; [ DW_TAG_arg_variable ] [msg] [line 75]
!184 = !MDLocation(line: 75, column: 23, scope: !26)
!185 = !{!"0x101\00x\0033554507\000", !26, !15, !4} ; [ DW_TAG_arg_variable ] [x] [line 75]
!186 = !MDLocation(line: 75, column: 33, scope: !26)
!187 = !{!"0x100\00xp\0076\000", !26, !15, !4}    ; [ DW_TAG_auto_variable ] [xp] [line 76]
!188 = !MDLocation(line: 76, column: 8, scope: !26)
!189 = !{!"0x100\00first\0076\000", !26, !15, !4} ; [ DW_TAG_auto_variable ] [first] [line 76]
!190 = !MDLocation(line: 76, column: 13, scope: !26)
!191 = !MDLocation(line: 76, column: 21, scope: !26)
!192 = !{!"0x100\00i\0077\000", !26, !15, !9}     ; [ DW_TAG_auto_variable ] [i] [line 77]
!193 = !MDLocation(line: 77, column: 7, scope: !26)
!194 = !MDLocation(line: 78, column: 8, scope: !26)
!195 = !MDLocation(line: 78, column: 3, scope: !26)
!196 = !MDLocation(line: 79, column: 38, scope: !26)
!197 = !MDLocation(line: 79, column: 26, scope: !26)
!198 = !MDLocation(line: 79, column: 3, scope: !26)
!199 = !MDLocation(line: 80, column: 11, scope: !200)
!200 = !{!"0xb\0080\003\007", !1, !26}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!201 = !MDLocation(line: 80, column: 8, scope: !200)
!202 = !MDLocation(line: 80, column: 20, scope: !203)
!203 = !{!"0xb\002", !1, !204}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!204 = !{!"0xb\001", !1, !205}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!205 = !{!"0xb\0080\003\008", !1, !200}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!206 = !MDLocation(line: 80, column: 32, scope: !205)
!207 = !MDLocation(line: 80, column: 20, scope: !205)
!208 = !MDLocation(line: 80, column: 3, scope: !200)
!209 = !MDLocation(line: 81, column: 44, scope: !210)
!210 = !{!"0xb\0080\0052\009", !1, !205}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!211 = !MDLocation(line: 82, column: 12, scope: !210)
!212 = !MDLocation(line: 82, column: 21, scope: !210)
!213 = !MDLocation(line: 82, column: 36, scope: !210)
!214 = !MDLocation(line: 81, column: 5, scope: !210)
!215 = !MDLocation(line: 83, column: 3, scope: !210)
!216 = !MDLocation(line: 80, column: 42, scope: !205)
!217 = !MDLocation(line: 80, column: 39, scope: !205)
!218 = !MDLocation(line: 80, column: 3, scope: !205)
!219 = !MDLocation(line: 84, column: 3, scope: !26)
!220 = !MDLocation(line: 85, column: 45, scope: !26)
!221 = !MDLocation(line: 85, column: 3, scope: !26)
!222 = !MDLocation(line: 86, column: 1, scope: !26)
!223 = !{!"0x101\00head\0016777237\000", !49, !15, !4} ; [ DW_TAG_arg_variable ] [head] [line 21]
!224 = !MDLocation(line: 21, column: 29, scope: !49)
!225 = !MDLocation(line: 21, column: 44, scope: !49)
!226 = !MDLocation(line: 21, column: 37, scope: !49)
!227 = !{!"0x100\00l\0089\000", !31, !15, !4}     ; [ DW_TAG_auto_variable ] [l] [line 89]
!228 = !MDLocation(line: 89, column: 8, scope: !31)
!229 = !MDLocation(line: 89, column: 19, scope: !31)
!230 = !MDLocation(line: 89, column: 12, scope: !31)
!231 = !MDLocation(line: 90, column: 13, scope: !31)
!232 = !MDLocation(line: 90, column: 3, scope: !31)
!233 = !MDLocation(line: 91, column: 13, scope: !31)
!234 = !MDLocation(line: 91, column: 3, scope: !31)
!235 = !MDLocation(line: 92, column: 3, scope: !31)
!236 = !MDLocation(line: 93, column: 10, scope: !31)
!237 = !MDLocation(line: 93, column: 3, scope: !31)
!238 = !{!"0x101\00from\0016777313\000", !33, !15, !9} ; [ DW_TAG_arg_variable ] [from] [line 97]
!239 = !MDLocation(line: 97, column: 24, scope: !33)
!240 = !{!"0x101\00to\0033554529\000", !33, !15, !9} ; [ DW_TAG_arg_variable ] [to] [line 97]
!241 = !MDLocation(line: 97, column: 34, scope: !33)
!242 = !{!"0x100\00size\0098\000", !33, !15, !9}  ; [ DW_TAG_auto_variable ] [size] [line 98]
!243 = !MDLocation(line: 98, column: 7, scope: !33)
!244 = !{!"0x100\00tmp\0098\000", !33, !15, !9}   ; [ DW_TAG_auto_variable ] [tmp] [line 98]
!245 = !MDLocation(line: 98, column: 13, scope: !33)
!246 = !{!"0x100\00i\0098\000", !33, !15, !9}     ; [ DW_TAG_auto_variable ] [i] [line 98]
!247 = !MDLocation(line: 98, column: 18, scope: !33)
!248 = !{!"0x100\00j\0098\000", !33, !15, !9}     ; [ DW_TAG_auto_variable ] [j] [line 98]
!249 = !MDLocation(line: 98, column: 21, scope: !33)
!250 = !{!"0x100\00l\0099\000", !33, !15, !4}     ; [ DW_TAG_auto_variable ] [l] [line 99]
!251 = !MDLocation(line: 99, column: 8, scope: !33)
!252 = !MDLocation(line: 100, column: 7, scope: !253)
!253 = !{!"0xb\00100\007\0010", !1, !33}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!254 = !MDLocation(line: 100, column: 14, scope: !253)
!255 = !MDLocation(line: 100, column: 7, scope: !33)
!256 = !MDLocation(line: 101, column: 11, scope: !257)
!257 = !{!"0xb\00100\0018\0011", !1, !253}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!258 = !MDLocation(line: 101, column: 5, scope: !257)
!259 = !MDLocation(line: 101, column: 24, scope: !257)
!260 = !MDLocation(line: 101, column: 17, scope: !257)
!261 = !MDLocation(line: 101, column: 33, scope: !257)
!262 = !MDLocation(line: 101, column: 28, scope: !257)
!263 = !MDLocation(line: 102, column: 3, scope: !257)
!264 = !MDLocation(line: 103, column: 10, scope: !33)
!265 = !MDLocation(line: 103, column: 15, scope: !33)
!266 = !MDLocation(line: 103, column: 3, scope: !33)
!267 = !MDLocation(line: 104, column: 22, scope: !33)
!268 = !MDLocation(line: 104, column: 21, scope: !33)
!269 = !MDLocation(line: 104, column: 14, scope: !33)
!270 = !MDLocation(line: 104, column: 7, scope: !33)
!271 = !MDLocation(line: 104, column: 3, scope: !33)
!272 = !MDLocation(line: 105, column: 3, scope: !33)
!273 = !MDLocation(line: 106, column: 8, scope: !274)
!274 = !{!"0xb\00106\003\0012", !1, !33}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!275 = !MDLocation(line: 106, column: 13, scope: !274)
!276 = !MDLocation(line: 106, column: 18, scope: !277)
!277 = !{!"0xb\002", !1, !278}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!278 = !{!"0xb\001", !1, !279}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!279 = !{!"0xb\00106\003\0013", !1, !274}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!280 = !MDLocation(line: 106, column: 20, scope: !279)
!281 = !MDLocation(line: 106, column: 18, scope: !279)
!282 = !MDLocation(line: 106, column: 3, scope: !274)
!283 = !MDLocation(line: 107, column: 20, scope: !284)
!284 = !{!"0xb\00106\0036\0014", !1, !279}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!285 = !MDLocation(line: 107, column: 17, scope: !284)
!286 = !MDLocation(line: 107, column: 18, scope: !284)
!287 = !MDLocation(line: 107, column: 7, scope: !284)
!288 = !MDLocation(line: 107, column: 5, scope: !284)
!289 = !MDLocation(line: 108, column: 20, scope: !284)
!290 = !MDLocation(line: 108, column: 17, scope: !284)
!291 = !MDLocation(line: 108, column: 18, scope: !284)
!292 = !MDLocation(line: 108, column: 7, scope: !284)
!293 = !MDLocation(line: 108, column: 5, scope: !284)
!294 = !MDLocation(line: 109, column: 16, scope: !284)
!295 = !MDLocation(line: 109, column: 7, scope: !284)
!296 = !MDLocation(line: 109, column: 5, scope: !284)
!297 = !MDLocation(line: 110, column: 3, scope: !284)
!298 = !MDLocation(line: 106, column: 26, scope: !279)
!299 = !MDLocation(line: 106, column: 31, scope: !279)
!300 = !MDLocation(line: 106, column: 3, scope: !279)
!301 = !MDLocation(line: 111, column: 18, scope: !33)
!302 = !MDLocation(line: 111, column: 15, scope: !33)
!303 = !MDLocation(line: 111, column: 16, scope: !33)
!304 = !MDLocation(line: 111, column: 3, scope: !33)
!305 = !MDLocation(line: 112, column: 19, scope: !33)
!306 = !MDLocation(line: 112, column: 18, scope: !33)
!307 = !MDLocation(line: 112, column: 5, scope: !33)
!308 = !MDLocation(line: 112, column: 3, scope: !33)
!309 = !MDLocation(line: 113, column: 21, scope: !33)
!310 = !MDLocation(line: 113, column: 18, scope: !33)
!311 = !MDLocation(line: 113, column: 19, scope: !33)
!312 = !MDLocation(line: 113, column: 5, scope: !33)
!313 = !MDLocation(line: 113, column: 3, scope: !33)
!314 = !MDLocation(line: 114, column: 17, scope: !33)
!315 = !MDLocation(line: 114, column: 5, scope: !33)
!316 = !MDLocation(line: 114, column: 3, scope: !33)
!317 = !MDLocation(line: 115, column: 14, scope: !33)
!318 = !MDLocation(line: 115, column: 3, scope: !33)
!319 = !MDLocation(line: 116, column: 10, scope: !33)
!320 = !MDLocation(line: 116, column: 3, scope: !33)
!321 = !{!"0x101\00x\0016777334\000", !36, !15, !4} ; [ DW_TAG_arg_variable ] [x] [line 118]
!322 = !MDLocation(line: 118, column: 21, scope: !36)
!323 = !{!"0x100\00i\00119\000", !36, !15, !9}    ; [ DW_TAG_auto_variable ] [i] [line 119]
!324 = !MDLocation(line: 119, column: 7, scope: !36)
!325 = !{!"0x100\00j\00119\000", !36, !15, !9}    ; [ DW_TAG_auto_variable ] [j] [line 119]
!326 = !MDLocation(line: 119, column: 10, scope: !36)
!327 = !{!"0x100\00size\00119\000", !36, !15, !9} ; [ DW_TAG_auto_variable ] [size] [line 119]
!328 = !MDLocation(line: 119, column: 13, scope: !36)
!329 = !MDLocation(line: 119, column: 32, scope: !36)
!330 = !MDLocation(line: 119, column: 20, scope: !36)
!331 = !{!"0x100\00xp\00120\000", !36, !15, !4}   ; [ DW_TAG_auto_variable ] [xp] [line 120]
!332 = !MDLocation(line: 120, column: 8, scope: !36)
!333 = !{!"0x100\00l\00120\000", !36, !15, !4}    ; [ DW_TAG_auto_variable ] [l] [line 120]
!334 = !MDLocation(line: 120, column: 13, scope: !36)
!335 = !MDLocation(line: 120, column: 32, scope: !36)
!336 = !MDLocation(line: 120, column: 31, scope: !36)
!337 = !MDLocation(line: 120, column: 24, scope: !36)
!338 = !MDLocation(line: 120, column: 17, scope: !36)
!339 = !MDLocation(line: 121, column: 8, scope: !340)
!340 = !{!"0xb\00121\003\0015", !1, !36}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!341 = !MDLocation(line: 121, column: 13, scope: !340)
!342 = !MDLocation(line: 121, column: 21, scope: !340)
!343 = !MDLocation(line: 121, column: 18, scope: !340)
!344 = !MDLocation(line: 121, column: 24, scope: !345)
!345 = !{!"0xb\002", !1, !346}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!346 = !{!"0xb\001", !1, !347}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!347 = !{!"0xb\00121\003\0016", !1, !340}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!348 = !MDLocation(line: 121, column: 26, scope: !347)
!349 = !MDLocation(line: 121, column: 24, scope: !347)
!350 = !MDLocation(line: 121, column: 3, scope: !340)
!351 = !MDLocation(line: 122, column: 20, scope: !352)
!352 = !{!"0xb\00121\0055\0017", !1, !347}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!353 = !MDLocation(line: 122, column: 17, scope: !352)
!354 = !MDLocation(line: 122, column: 18, scope: !352)
!355 = !MDLocation(line: 122, column: 7, scope: !352)
!356 = !MDLocation(line: 122, column: 5, scope: !352)
!357 = !MDLocation(line: 123, column: 20, scope: !352)
!358 = !MDLocation(line: 123, column: 17, scope: !352)
!359 = !MDLocation(line: 123, column: 18, scope: !352)
!360 = !MDLocation(line: 123, column: 7, scope: !352)
!361 = !MDLocation(line: 123, column: 5, scope: !352)
!362 = !MDLocation(line: 124, column: 16, scope: !352)
!363 = !MDLocation(line: 124, column: 7, scope: !352)
!364 = !MDLocation(line: 124, column: 5, scope: !352)
!365 = !MDLocation(line: 125, column: 3, scope: !352)
!366 = !MDLocation(line: 121, column: 32, scope: !347)
!367 = !MDLocation(line: 121, column: 37, scope: !347)
!368 = !MDLocation(line: 121, column: 45, scope: !347)
!369 = !MDLocation(line: 121, column: 42, scope: !347)
!370 = !MDLocation(line: 121, column: 3, scope: !347)
!371 = !MDLocation(line: 126, column: 18, scope: !36)
!372 = !MDLocation(line: 126, column: 15, scope: !36)
!373 = !MDLocation(line: 126, column: 16, scope: !36)
!374 = !MDLocation(line: 126, column: 3, scope: !36)
!375 = !MDLocation(line: 127, column: 19, scope: !36)
!376 = !MDLocation(line: 127, column: 18, scope: !36)
!377 = !MDLocation(line: 127, column: 5, scope: !36)
!378 = !MDLocation(line: 127, column: 3, scope: !36)
!379 = !MDLocation(line: 128, column: 27, scope: !36)
!380 = !MDLocation(line: 128, column: 17, scope: !36)
!381 = !MDLocation(line: 128, column: 5, scope: !36)
!382 = !MDLocation(line: 128, column: 3, scope: !36)
!383 = !MDLocation(line: 129, column: 10, scope: !36)
!384 = !MDLocation(line: 129, column: 3, scope: !36)
!385 = !{!"0x101\00head\0016777240\000", !48, !15, !4} ; [ DW_TAG_arg_variable ] [head] [line 24]
!386 = !MDLocation(line: 24, column: 28, scope: !48)
!387 = !MDLocation(line: 24, column: 43, scope: !48)
!388 = !MDLocation(line: 24, column: 36, scope: !48)
!389 = !{!"0x101\00head\0016777348\000", !37, !15, !4} ; [ DW_TAG_arg_variable ] [head] [line 132]
!390 = !MDLocation(line: 132, column: 25, scope: !37)
!391 = !{!"0x100\00tmp\00133\000", !37, !15, !4}  ; [ DW_TAG_auto_variable ] [tmp] [line 133]
!392 = !MDLocation(line: 133, column: 8, scope: !37)
!393 = !{!"0x100\00p\00133\000", !37, !15, !4}    ; [ DW_TAG_auto_variable ] [p] [line 133]
!394 = !MDLocation(line: 133, column: 14, scope: !37)
!395 = !MDLocation(line: 133, column: 18, scope: !37)
!396 = !MDLocation(line: 134, column: 3, scope: !37)
!397 = !MDLocation(line: 135, column: 11, scope: !398)
!398 = !{!"0xb\00134\006\0018", !1, !37}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!399 = !MDLocation(line: 135, column: 5, scope: !398)
!400 = !MDLocation(line: 136, column: 15, scope: !398)
!401 = !MDLocation(line: 136, column: 5, scope: !398)
!402 = !MDLocation(line: 137, column: 15, scope: !398)
!403 = !MDLocation(line: 137, column: 5, scope: !398)
!404 = !MDLocation(line: 138, column: 9, scope: !398)
!405 = !MDLocation(line: 138, column: 5, scope: !398)
!406 = !MDLocation(line: 139, column: 3, scope: !398)
!407 = !MDLocation(line: 139, column: 12, scope: !408)
!408 = !{!"0xb\001", !1, !37}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!409 = !MDLocation(line: 139, column: 17, scope: !37)
!410 = !MDLocation(line: 139, column: 12, scope: !37)
!411 = !MDLocation(line: 140, column: 1, scope: !37)
!412 = !{!"0x100\00len\00143\000", !40, !15, !9}  ; [ DW_TAG_auto_variable ] [len] [line 143]
!413 = !MDLocation(line: 143, column: 7, scope: !40)
!414 = !{!"0x100\00li1\00145\000", !40, !15, !4}  ; [ DW_TAG_auto_variable ] [li1] [line 145]
!415 = !MDLocation(line: 145, column: 8, scope: !40)
!416 = !MDLocation(line: 145, column: 14, scope: !40)
!417 = !{!"0x100\00li2\00147\000", !40, !15, !4}  ; [ DW_TAG_auto_variable ] [li2] [line 147]
!418 = !MDLocation(line: 147, column: 8, scope: !40)
!419 = !MDLocation(line: 147, column: 24, scope: !40)
!420 = !MDLocation(line: 147, column: 14, scope: !40)
!421 = !{!"0x100\00li3\00150\000", !40, !15, !4}  ; [ DW_TAG_auto_variable ] [li3] [line 150]
!422 = !MDLocation(line: 150, column: 8, scope: !40)
!423 = !MDLocation(line: 150, column: 14, scope: !40)
!424 = !MDLocation(line: 152, column: 19, scope: !425)
!425 = !{!"0xb\00152\007\0019", !1, !40}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!426 = !MDLocation(line: 152, column: 24, scope: !425)
!427 = !MDLocation(line: 152, column: 8, scope: !425)
!428 = !MDLocation(line: 152, column: 7, scope: !40)
!429 = !MDLocation(line: 153, column: 5, scope: !430)
!430 = !{!"0xb\00152\0030\0020", !1, !425}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!431 = !MDLocation(line: 154, column: 5, scope: !430)
!432 = !MDLocation(line: 156, column: 3, scope: !40)
!433 = !MDLocation(line: 156, column: 22, scope: !434)
!434 = !{!"0xb\002", !1, !435}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!435 = !{!"0xb\001", !1, !40}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!436 = !MDLocation(line: 156, column: 11, scope: !40)
!437 = !MDLocation(line: 156, column: 10, scope: !40)
!438 = !MDLocation(line: 157, column: 20, scope: !439)
!439 = !{!"0xb\00156\0028\0021", !1, !40}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!440 = !MDLocation(line: 157, column: 39, scope: !439)
!441 = !MDLocation(line: 157, column: 25, scope: !439)
!442 = !MDLocation(line: 157, column: 5, scope: !439)
!443 = !MDLocation(line: 160, column: 19, scope: !444)
!444 = !{!"0xb\00160\007\0022", !1, !40}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!445 = !MDLocation(line: 160, column: 8, scope: !444)
!446 = !MDLocation(line: 160, column: 7, scope: !40)
!447 = !MDLocation(line: 161, column: 5, scope: !448)
!448 = !{!"0xb\00160\0025\0023", !1, !444}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!449 = !MDLocation(line: 162, column: 5, scope: !448)
!450 = !MDLocation(line: 166, column: 3, scope: !40)
!451 = !MDLocation(line: 166, column: 22, scope: !434)
!452 = !MDLocation(line: 166, column: 11, scope: !40)
!453 = !MDLocation(line: 166, column: 10, scope: !40)
!454 = !MDLocation(line: 167, column: 20, scope: !455)
!455 = !{!"0xb\00166\0028\0024", !1, !40}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!456 = !MDLocation(line: 167, column: 39, scope: !455)
!457 = !MDLocation(line: 167, column: 25, scope: !455)
!458 = !MDLocation(line: 167, column: 5, scope: !455)
!459 = !MDLocation(line: 170, column: 19, scope: !460)
!460 = !{!"0xb\00170\007\0025", !1, !40}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!461 = !MDLocation(line: 170, column: 8, scope: !460)
!462 = !MDLocation(line: 170, column: 7, scope: !40)
!463 = !MDLocation(line: 171, column: 5, scope: !464)
!464 = !{!"0xb\00170\0025\0026", !1, !460}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!465 = !MDLocation(line: 172, column: 5, scope: !464)
!466 = !MDLocation(line: 175, column: 16, scope: !40)
!467 = !MDLocation(line: 175, column: 3, scope: !40)
!468 = !MDLocation(line: 177, column: 18, scope: !469)
!469 = !{!"0xb\00177\007\0027", !1, !40}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!470 = !MDLocation(line: 177, column: 7, scope: !469)
!471 = !MDLocation(line: 177, column: 7, scope: !40)
!472 = !MDLocation(line: 179, column: 29, scope: !473)
!473 = !{!"0xb\00177\0037\0028", !1, !469}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!474 = !MDLocation(line: 179, column: 18, scope: !473)
!475 = !MDLocation(line: 178, column: 5, scope: !473)
!476 = !MDLocation(line: 180, column: 5, scope: !473)
!477 = !MDLocation(line: 183, column: 17, scope: !478)
!478 = !{!"0xb\00183\007\0029", !1, !40}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!479 = !MDLocation(line: 183, column: 7, scope: !478)
!480 = !MDLocation(line: 183, column: 7, scope: !40)
!481 = !MDLocation(line: 185, column: 28, scope: !482)
!482 = !{!"0xb\00183\0033\0030", !1, !478}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!483 = !MDLocation(line: 185, column: 18, scope: !482)
!484 = !MDLocation(line: 184, column: 5, scope: !482)
!485 = !MDLocation(line: 186, column: 5, scope: !482)
!486 = !MDLocation(line: 189, column: 18, scope: !487)
!487 = !{!"0xb\00189\007\0031", !1, !40}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!488 = !MDLocation(line: 189, column: 7, scope: !487)
!489 = !MDLocation(line: 189, column: 7, scope: !40)
!490 = !MDLocation(line: 191, column: 29, scope: !491)
!491 = !{!"0xb\00189\0037\0032", !1, !487}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!492 = !MDLocation(line: 191, column: 18, scope: !491)
!493 = !MDLocation(line: 190, column: 5, scope: !491)
!494 = !MDLocation(line: 192, column: 5, scope: !491)
!495 = !MDLocation(line: 195, column: 17, scope: !496)
!496 = !{!"0xb\00195\007\0033", !1, !40}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!497 = !MDLocation(line: 195, column: 7, scope: !496)
!498 = !MDLocation(line: 195, column: 7, scope: !40)
!499 = !MDLocation(line: 197, column: 28, scope: !500)
!500 = !{!"0xb\00195\0033\0034", !1, !496}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!501 = !MDLocation(line: 197, column: 18, scope: !500)
!502 = !MDLocation(line: 196, column: 5, scope: !500)
!503 = !MDLocation(line: 198, column: 5, scope: !500)
!504 = !MDLocation(line: 201, column: 19, scope: !505)
!505 = !{!"0xb\00201\007\0035", !1, !40}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!506 = !MDLocation(line: 201, column: 7, scope: !505)
!507 = !MDLocation(line: 201, column: 7, scope: !40)
!508 = !MDLocation(line: 203, column: 30, scope: !509)
!509 = !{!"0xb\00201\0033\0036", !1, !505}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!510 = !MDLocation(line: 203, column: 18, scope: !509)
!511 = !MDLocation(line: 202, column: 5, scope: !509)
!512 = !MDLocation(line: 204, column: 5, scope: !509)
!513 = !MDLocation(line: 207, column: 19, scope: !514)
!514 = !{!"0xb\00207\007\0037", !1, !40}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!515 = !MDLocation(line: 207, column: 24, scope: !514)
!516 = !MDLocation(line: 207, column: 8, scope: !514)
!517 = !MDLocation(line: 207, column: 7, scope: !40)
!518 = !MDLocation(line: 208, column: 5, scope: !519)
!519 = !{!"0xb\00207\0030\0038", !1, !514}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!520 = !MDLocation(line: 209, column: 5, scope: !519)
!521 = !MDLocation(line: 211, column: 21, scope: !40)
!522 = !MDLocation(line: 211, column: 9, scope: !40)
!523 = !MDLocation(line: 211, column: 3, scope: !40)
!524 = !MDLocation(line: 212, column: 8, scope: !40)
!525 = !MDLocation(line: 212, column: 3, scope: !40)
!526 = !MDLocation(line: 213, column: 8, scope: !40)
!527 = !MDLocation(line: 213, column: 3, scope: !40)
!528 = !MDLocation(line: 214, column: 8, scope: !40)
!529 = !MDLocation(line: 214, column: 3, scope: !40)
!530 = !MDLocation(line: 216, column: 10, scope: !40)
!531 = !MDLocation(line: 216, column: 3, scope: !40)
!532 = !{!"0x101\00head\0016777239\000", !47, !15, !4} ; [ DW_TAG_arg_variable ] [head] [line 23]
!533 = !MDLocation(line: 23, column: 29, scope: !47)
!534 = !MDLocation(line: 23, column: 44, scope: !47)
!535 = !MDLocation(line: 23, column: 37, scope: !47)
!536 = !{!"0x101\00argc\0016777435\000", !43, !15, !9} ; [ DW_TAG_arg_variable ] [argc] [line 219]
!537 = !MDLocation(line: 219, column: 14, scope: !43)
!538 = !{!"0x101\00argv\0033554651\000", !43, !15, !46} ; [ DW_TAG_arg_variable ] [argv] [line 219]
!539 = !MDLocation(line: 219, column: 26, scope: !43)
!540 = !{!"0x100\00n\00225\000", !43, !15, !9}    ; [ DW_TAG_auto_variable ] [n] [line 225]
!541 = !MDLocation(line: 225, column: 7, scope: !43)
!542 = !MDLocation(line: 225, column: 13, scope: !43)
!543 = !MDLocation(line: 225, column: 12, scope: !43)
!544 = !MDLocation(line: 225, column: 31, scope: !545)
!545 = !{!"0xb\001", !1, !43}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!546 = !MDLocation(line: 225, column: 26, scope: !43)
!547 = !MDLocation(line: 225, column: 12, scope: !548)
!548 = !{!"0xb\002", !1, !43}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!549 = !MDLocation(line: 225, column: 7, scope: !550)
!550 = !{!"0xb\004", !1, !551}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!551 = !{!"0xb\003", !1, !43}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!552 = !{!"0x100\00result\00226\000", !43, !15, !9} ; [ DW_TAG_auto_variable ] [result] [line 226]
!553 = !MDLocation(line: 226, column: 7, scope: !43)
!554 = !MDLocation(line: 227, column: 3, scope: !43)
!555 = !MDLocation(line: 227, column: 9, scope: !556)
!556 = !{!"0xb\003", !1, !545}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lists.c]
!557 = !MDLocation(line: 227, column: 23, scope: !548)
!558 = !MDLocation(line: 227, column: 14, scope: !43)
!559 = !MDLocation(line: 228, column: 18, scope: !43)
!560 = !MDLocation(line: 228, column: 3, scope: !43)
!561 = !MDLocation(line: 229, column: 3, scope: !43)
