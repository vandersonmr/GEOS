; ModuleID = 'queens-mcgill.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@printing = global i32 1, align 4
@findall = global i32 0, align 4
@solutions = global i64 0, align 8
@progname = global i8* null, align 8
@.str = private unnamed_addr constant [168 x i8] c"Usage:  %s [-ac] n\0A\09n\09Number of queens (rows and columns). An integer from 1 to 100.\0A\09-a\09Find and print all solutions.\0A\09-c\09Count all solutions, but do not print them.\0A\00", align 1
@queens = common global i32 0, align 4
@stderr = external global %struct._IO_FILE*
@.str1 = private unnamed_addr constant [25 x i8] c"%s: Illegal option '%s'\0A\00", align 1
@.str2 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str3 = private unnamed_addr constant [31 x i8] c"%s: Non-integer argument '%s'\0A\00", align 1
@.str4 = private unnamed_addr constant [32 x i8] c"%s: n must be positive integer\0A\00", align 1
@.str5 = private unnamed_addr constant [36 x i8] c"%s: Can't have more than %d queens\0A\00", align 1
@.str6 = private unnamed_addr constant [24 x i8] c"%s: Missing n argument\0A\00", align 1
@files = common global i32 0, align 4
@ranks = common global i32 0, align 4
@.str7 = private unnamed_addr constant [32 x i8] c"%d queen%s on a %dx%d board...\0A\00", align 1
@.str8 = private unnamed_addr constant [2 x i8] c"s\00", align 1
@.str9 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stdout = external global %struct._IO_FILE*
@file = common global [100 x i32] zeroinitializer, align 16
@bakdiag = common global [199 x i32] zeroinitializer, align 16
@fordiag = common global [199 x i32] zeroinitializer, align 16
@.str10 = private unnamed_addr constant [24 x i8] c"...there is 1 solution\0A\00", align 1
@.str11 = private unnamed_addr constant [28 x i8] c"...there are %ld solutions\0A\00", align 1
@.str12 = private unnamed_addr constant [17 x i8] c"\0ASolution #%lu:\0A\00", align 1
@queen = common global [100 x i32] zeroinitializer, align 16

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  %p = alloca i8*, align 8
  %usage = alloca i8*, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !40, metadata !41), !dbg !42
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !43, metadata !41), !dbg !44
  call void @llvm.dbg.declare(metadata i32* %i, metadata !45, metadata !41), !dbg !46
  call void @llvm.dbg.declare(metadata i8** %p, metadata !47, metadata !41), !dbg !48
  call void @llvm.dbg.declare(metadata i8** %usage, metadata !49, metadata !41), !dbg !50
  store i8* getelementptr inbounds ([168 x i8]* @.str, i32 0, i32 0), i8** %usage, align 8, !dbg !50
  %0 = load i8*** %argv.addr, align 8, !dbg !51
  %arrayidx = getelementptr inbounds i8** %0, i64 0, !dbg !51
  %1 = load i8** %arrayidx, align 8, !dbg !51
  store i8* %1, i8** @progname, align 8, !dbg !52
  store i32 0, i32* @printing, align 4, !dbg !53
  store i32 14, i32* @queens, align 4, !dbg !54
  store i32 1, i32* @findall, align 4, !dbg !55
  store i32 1, i32* %i, align 4, !dbg !56
  br label %for.cond, !dbg !56

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32* %i, align 4, !dbg !58
  %3 = load i32* %argc.addr, align 4, !dbg !62
  %cmp = icmp slt i32 %2, %3, !dbg !63
  br i1 %cmp, label %for.body, label %for.end, !dbg !64

for.body:                                         ; preds = %for.cond
  %4 = load i32* %i, align 4, !dbg !65
  %idxprom = sext i32 %4 to i64, !dbg !67
  %5 = load i8*** %argv.addr, align 8, !dbg !67
  %arrayidx1 = getelementptr inbounds i8** %5, i64 %idxprom, !dbg !67
  %6 = load i8** %arrayidx1, align 8, !dbg !67
  store i8* %6, i8** %p, align 8, !dbg !68
  %7 = load i8** %p, align 8, !dbg !69
  %8 = load i8* %7, align 1, !dbg !71
  %conv = sext i8 %8 to i32, !dbg !71
  %cmp2 = icmp eq i32 %conv, 45, !dbg !71
  br i1 %cmp2, label %if.then, label %if.else, !dbg !72

if.then:                                          ; preds = %for.body
  br label %while.cond, !dbg !73

while.cond:                                       ; preds = %sw.epilog, %if.then
  %9 = load i8** %p, align 8, !dbg !75
  %incdec.ptr = getelementptr inbounds i8* %9, i32 1, !dbg !75
  store i8* %incdec.ptr, i8** %p, align 8, !dbg !75
  %10 = load i8* %incdec.ptr, align 1, !dbg !78
  %tobool = icmp ne i8 %10, 0, !dbg !73
  br i1 %tobool, label %while.body, label %while.end, !dbg !73

while.body:                                       ; preds = %while.cond
  %11 = load i8** %p, align 8, !dbg !79
  %12 = load i8* %11, align 1, !dbg !81
  %conv4 = sext i8 %12 to i32, !dbg !81
  switch i32 %conv4, label %sw.default [
    i32 99, label %sw.bb
    i32 97, label %sw.bb5
  ], !dbg !82

sw.bb:                                            ; preds = %while.body
  store i32 0, i32* @printing, align 4, !dbg !83
  br label %sw.bb5, !dbg !83

sw.bb5:                                           ; preds = %while.body, %sw.bb
  store i32 1, i32* @findall, align 4, !dbg !85
  br label %sw.epilog, !dbg !86

sw.default:                                       ; preds = %while.body
  %13 = load %struct._IO_FILE** @stderr, align 8, !dbg !87
  %14 = load i8** @progname, align 8, !dbg !88
  %15 = load i32* %i, align 4, !dbg !89
  %idxprom6 = sext i32 %15 to i64, !dbg !90
  %16 = load i8*** %argv.addr, align 8, !dbg !90
  %arrayidx7 = getelementptr inbounds i8** %16, i64 %idxprom6, !dbg !90
  %17 = load i8** %arrayidx7, align 8, !dbg !90
  %call = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([25 x i8]* @.str1, i32 0, i32 0), i8* %14, i8* %17), !dbg !91
  %18 = load %struct._IO_FILE** @stderr, align 8, !dbg !92
  %19 = load i8** %usage, align 8, !dbg !93
  %20 = load i8** @progname, align 8, !dbg !94
  %call8 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %18, i8* %19, i8* %20), !dbg !95
  call void @exit(i32 -1) #5, !dbg !96
  unreachable, !dbg !96

sw.epilog:                                        ; preds = %sw.bb5
  br label %while.cond, !dbg !73

while.end:                                        ; preds = %while.cond
  br label %if.end24, !dbg !97

if.else:                                          ; preds = %for.body
  %21 = load i8** %p, align 8, !dbg !98
  %call9 = call i32 (i8*, i8*, ...)* @__isoc99_sscanf(i8* %21, i8* getelementptr inbounds ([3 x i8]* @.str2, i32 0, i32 0), i32* @queens) #6, !dbg !101
  %cmp10 = icmp ne i32 %call9, 1, !dbg !101
  br i1 %cmp10, label %if.then12, label %if.end, !dbg !102

if.then12:                                        ; preds = %if.else
  %22 = load %struct._IO_FILE** @stderr, align 8, !dbg !103
  %23 = load i8** @progname, align 8, !dbg !105
  %24 = load i8** %p, align 8, !dbg !106
  %call13 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([31 x i8]* @.str3, i32 0, i32 0), i8* %23, i8* %24), !dbg !107
  call void @exit(i32 -1) #5, !dbg !108
  unreachable, !dbg !108

if.end:                                           ; preds = %if.else
  %25 = load i32* @queens, align 4, !dbg !109
  %cmp14 = icmp sle i32 %25, 0, !dbg !109
  br i1 %cmp14, label %if.then16, label %if.end18, !dbg !111

if.then16:                                        ; preds = %if.end
  %26 = load %struct._IO_FILE** @stderr, align 8, !dbg !112
  %27 = load i8** @progname, align 8, !dbg !114
  %call17 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([32 x i8]* @.str4, i32 0, i32 0), i8* %27), !dbg !115
  call void @exit(i32 -1) #5, !dbg !116
  unreachable, !dbg !116

if.end18:                                         ; preds = %if.end
  %28 = load i32* @queens, align 4, !dbg !117
  %cmp19 = icmp sgt i32 %28, 100, !dbg !117
  br i1 %cmp19, label %if.then21, label %if.end23, !dbg !119

if.then21:                                        ; preds = %if.end18
  %29 = load %struct._IO_FILE** @stderr, align 8, !dbg !120
  %30 = load i8** @progname, align 8, !dbg !122
  %call22 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %29, i8* getelementptr inbounds ([36 x i8]* @.str5, i32 0, i32 0), i8* %30, i32 100), !dbg !123
  call void @exit(i32 -1) #5, !dbg !124
  unreachable, !dbg !124

if.end23:                                         ; preds = %if.end18
  br label %if.end24

if.end24:                                         ; preds = %if.end23, %while.end
  br label %for.inc, !dbg !125

for.inc:                                          ; preds = %if.end24
  %31 = load i32* %i, align 4, !dbg !126
  %inc = add nsw i32 %31, 1, !dbg !126
  store i32 %inc, i32* %i, align 4, !dbg !126
  br label %for.cond, !dbg !127

for.end:                                          ; preds = %for.cond
  %32 = load i32* @queens, align 4, !dbg !128
  %tobool25 = icmp ne i32 %32, 0, !dbg !130
  br i1 %tobool25, label %if.end29, label %if.then26, !dbg !130

if.then26:                                        ; preds = %for.end
  %33 = load %struct._IO_FILE** @stderr, align 8, !dbg !131
  %34 = load i8** @progname, align 8, !dbg !133
  %call27 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %33, i8* getelementptr inbounds ([24 x i8]* @.str6, i32 0, i32 0), i8* %34), !dbg !134
  %35 = load %struct._IO_FILE** @stderr, align 8, !dbg !135
  %36 = load i8** %usage, align 8, !dbg !136
  %37 = load i8** @progname, align 8, !dbg !137
  %call28 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %35, i8* %36, i8* %37), !dbg !138
  call void @exit(i32 -1) #5, !dbg !139
  unreachable, !dbg !139

if.end29:                                         ; preds = %for.end
  %38 = load i32* @queens, align 4, !dbg !140
  store i32 %38, i32* @files, align 4, !dbg !141
  store i32 %38, i32* @ranks, align 4, !dbg !142
  %39 = load i32* @queens, align 4, !dbg !143
  %40 = load i32* @queens, align 4, !dbg !144
  %cmp30 = icmp sgt i32 %40, 1, !dbg !144
  %cond = select i1 %cmp30, i8* getelementptr inbounds ([2 x i8]* @.str8, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str9, i32 0, i32 0), !dbg !144
  %41 = load i32* @ranks, align 4, !dbg !145
  %42 = load i32* @files, align 4, !dbg !146
  %call32 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str7, i32 0, i32 0), i32 %39, i8* %cond, i32 %41, i32 %42), !dbg !147
  %43 = load %struct._IO_FILE** @stdout, align 8, !dbg !148
  %call33 = call i32 @fflush(%struct._IO_FILE* %43), !dbg !149
  store i64 0, i64* @solutions, align 8, !dbg !150
  store i32 0, i32* %i, align 4, !dbg !151
  br label %for.cond34, !dbg !151

for.cond34:                                       ; preds = %for.inc40, %if.end29
  %44 = load i32* %i, align 4, !dbg !153
  %cmp35 = icmp slt i32 %44, 100, !dbg !153
  br i1 %cmp35, label %for.body37, label %for.end42, !dbg !157

for.body37:                                       ; preds = %for.cond34
  %45 = load i32* %i, align 4, !dbg !158
  %idxprom38 = sext i32 %45 to i64, !dbg !160
  %arrayidx39 = getelementptr inbounds [100 x i32]* @file, i32 0, i64 %idxprom38, !dbg !160
  store i32 101, i32* %arrayidx39, align 4, !dbg !160
  br label %for.inc40, !dbg !160

for.inc40:                                        ; preds = %for.body37
  %46 = load i32* %i, align 4, !dbg !161
  %inc41 = add nsw i32 %46, 1, !dbg !161
  store i32 %inc41, i32* %i, align 4, !dbg !161
  br label %for.cond34, !dbg !163

for.end42:                                        ; preds = %for.cond34
  store i32 0, i32* %i, align 4, !dbg !164
  br label %for.cond43, !dbg !164

for.cond43:                                       ; preds = %for.inc51, %for.end42
  %47 = load i32* %i, align 4, !dbg !166
  %cmp44 = icmp slt i32 %47, 199, !dbg !166
  br i1 %cmp44, label %for.body46, label %for.end53, !dbg !170

for.body46:                                       ; preds = %for.cond43
  %48 = load i32* %i, align 4, !dbg !171
  %idxprom47 = sext i32 %48 to i64, !dbg !173
  %arrayidx48 = getelementptr inbounds [199 x i32]* @bakdiag, i32 0, i64 %idxprom47, !dbg !173
  store i32 101, i32* %arrayidx48, align 4, !dbg !173
  %49 = load i32* %i, align 4, !dbg !174
  %idxprom49 = sext i32 %49 to i64, !dbg !175
  %arrayidx50 = getelementptr inbounds [199 x i32]* @fordiag, i32 0, i64 %idxprom49, !dbg !175
  store i32 101, i32* %arrayidx50, align 4, !dbg !175
  br label %for.inc51, !dbg !175

for.inc51:                                        ; preds = %for.body46
  %50 = load i32* %i, align 4, !dbg !176
  %inc52 = add nsw i32 %50, 1, !dbg !176
  store i32 %inc52, i32* %i, align 4, !dbg !176
  br label %for.cond43, !dbg !178

for.end53:                                        ; preds = %for.cond43
  call void @find(i32 0), !dbg !179
  %51 = load i32* @printing, align 4, !dbg !180
  %tobool54 = icmp ne i32 %51, 0, !dbg !182
  br i1 %tobool54, label %land.lhs.true, label %if.end58, !dbg !182

land.lhs.true:                                    ; preds = %for.end53
  %52 = load i64* @solutions, align 8, !dbg !183
  %tobool55 = icmp ne i64 %52, 0, !dbg !182
  br i1 %tobool55, label %if.then56, label %if.end58, !dbg !182

if.then56:                                        ; preds = %land.lhs.true
  %call57 = call i32 @putchar(i32 10), !dbg !185
  br label %if.end58, !dbg !185

if.end58:                                         ; preds = %if.then56, %land.lhs.true, %for.end53
  %53 = load i64* @solutions, align 8, !dbg !187
  %cmp59 = icmp eq i64 %53, 1, !dbg !187
  br i1 %cmp59, label %if.then61, label %if.else63, !dbg !189

if.then61:                                        ; preds = %if.end58
  %call62 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([24 x i8]* @.str10, i32 0, i32 0)), !dbg !190
  br label %if.end65, !dbg !190

if.else63:                                        ; preds = %if.end58
  %54 = load i64* @solutions, align 8, !dbg !192
  %call64 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str11, i32 0, i32 0), i64 %54), !dbg !193
  br label %if.end65

if.end65:                                         ; preds = %if.else63, %if.then61
  call void @exit(i32 0) #5, !dbg !194
  unreachable, !dbg !194

return:                                           ; No predecessors!
  %55 = load i32* %retval, !dbg !195
  ret i32 %55, !dbg !195
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

; Function Attrs: nounwind
declare i32 @__isoc99_sscanf(i8*, i8*, ...) #4

declare i32 @printf(i8*, ...) #2

declare i32 @fflush(%struct._IO_FILE*) #2

; Function Attrs: nounwind uwtable
define void @find(i32 %level) #0 {
entry:
  %level.addr = alloca i32, align 4
  %f = alloca i32, align 4
  %fp = alloca i32*, align 8
  %fdp = alloca i32*, align 8
  %bdp = alloca i32*, align 8
  store i32 %level, i32* %level.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %level.addr, metadata !196, metadata !41), !dbg !197
  call void @llvm.dbg.declare(metadata i32* %f, metadata !198, metadata !41), !dbg !199
  call void @llvm.dbg.declare(metadata i32** %fp, metadata !200, metadata !41), !dbg !202
  call void @llvm.dbg.declare(metadata i32** %fdp, metadata !203, metadata !41), !dbg !204
  call void @llvm.dbg.declare(metadata i32** %bdp, metadata !205, metadata !41), !dbg !206
  %0 = load i32* %level.addr, align 4, !dbg !207
  %1 = load i32* @queens, align 4, !dbg !209
  %cmp = icmp eq i32 %0, %1, !dbg !207
  br i1 %cmp, label %if.then, label %if.else, !dbg !210

if.then:                                          ; preds = %entry
  %2 = load i64* @solutions, align 8, !dbg !211
  %inc = add i64 %2, 1, !dbg !211
  store i64 %inc, i64* @solutions, align 8, !dbg !211
  %3 = load i32* @printing, align 4, !dbg !213
  %tobool = icmp ne i32 %3, 0, !dbg !215
  br i1 %tobool, label %if.then1, label %if.end, !dbg !215

if.then1:                                         ; preds = %if.then
  call void @pboard(), !dbg !216
  br label %if.end, !dbg !216

if.end:                                           ; preds = %if.then1, %if.then
  %4 = load i32* @findall, align 4, !dbg !218
  %tobool2 = icmp ne i32 %4, 0, !dbg !220
  br i1 %tobool2, label %if.end4, label %if.then3, !dbg !220

if.then3:                                         ; preds = %if.end
  call void @exit(i32 0) #5, !dbg !221
  unreachable, !dbg !221

if.end4:                                          ; preds = %if.end
  br label %if.end20, !dbg !223

if.else:                                          ; preds = %entry
  store i32 0, i32* %f, align 4, !dbg !224
  store i32* getelementptr inbounds ([100 x i32]* @file, i32 0, i32 0), i32** %fp, align 8, !dbg !227
  %5 = load i32* %level.addr, align 4, !dbg !228
  %idxprom = sext i32 %5 to i64, !dbg !229
  %arrayidx = getelementptr inbounds [199 x i32]* @fordiag, i32 0, i64 %idxprom, !dbg !229
  store i32* %arrayidx, i32** %fdp, align 8, !dbg !230
  %6 = load i32* %level.addr, align 4, !dbg !231
  %7 = load i32* @files, align 4, !dbg !232
  %add = add nsw i32 %6, %7, !dbg !231
  %sub = sub nsw i32 %add, 1, !dbg !231
  %idxprom5 = sext i32 %sub to i64, !dbg !233
  %arrayidx6 = getelementptr inbounds [199 x i32]* @bakdiag, i32 0, i64 %idxprom5, !dbg !233
  store i32* %arrayidx6, i32** %bdp, align 8, !dbg !234
  br label %for.cond, !dbg !224

for.cond:                                         ; preds = %for.inc, %if.else
  %8 = load i32* %f, align 4, !dbg !235
  %9 = load i32* @files, align 4, !dbg !237
  %cmp7 = icmp slt i32 %8, %9, !dbg !235
  br i1 %cmp7, label %for.body, label %for.end, !dbg !238

for.body:                                         ; preds = %for.cond
  %10 = load i32** %fp, align 8, !dbg !239
  %11 = load i32* %10, align 4, !dbg !242
  %12 = load i32* %level.addr, align 4, !dbg !243
  %cmp8 = icmp sge i32 %11, %12, !dbg !242
  br i1 %cmp8, label %land.lhs.true, label %if.end16, !dbg !244

land.lhs.true:                                    ; preds = %for.body
  %13 = load i32** %fdp, align 8, !dbg !245
  %14 = load i32* %13, align 4, !dbg !246
  %15 = load i32* %level.addr, align 4, !dbg !247
  %cmp9 = icmp sge i32 %14, %15, !dbg !246
  br i1 %cmp9, label %land.lhs.true10, label %if.end16, !dbg !244

land.lhs.true10:                                  ; preds = %land.lhs.true
  %16 = load i32** %bdp, align 8, !dbg !248
  %17 = load i32* %16, align 4, !dbg !249
  %18 = load i32* %level.addr, align 4, !dbg !250
  %cmp11 = icmp sge i32 %17, %18, !dbg !249
  br i1 %cmp11, label %if.then12, label %if.end16, !dbg !244

if.then12:                                        ; preds = %land.lhs.true10
  %19 = load i32* %f, align 4, !dbg !251
  %20 = load i32* %level.addr, align 4, !dbg !253
  %idxprom13 = sext i32 %20 to i64, !dbg !254
  %arrayidx14 = getelementptr inbounds [100 x i32]* @queen, i32 0, i64 %idxprom13, !dbg !254
  store i32 %19, i32* %arrayidx14, align 4, !dbg !254
  %21 = load i32* %level.addr, align 4, !dbg !255
  %22 = load i32** %bdp, align 8, !dbg !256
  store i32 %21, i32* %22, align 4, !dbg !257
  %23 = load i32** %fdp, align 8, !dbg !258
  store i32 %21, i32* %23, align 4, !dbg !259
  %24 = load i32** %fp, align 8, !dbg !260
  store i32 %21, i32* %24, align 4, !dbg !261
  %25 = load i32* %level.addr, align 4, !dbg !262
  %add15 = add nsw i32 %25, 1, !dbg !262
  call void @find(i32 %add15), !dbg !263
  %26 = load i32** %bdp, align 8, !dbg !264
  store i32 101, i32* %26, align 4, !dbg !265
  %27 = load i32** %fdp, align 8, !dbg !266
  store i32 101, i32* %27, align 4, !dbg !267
  %28 = load i32** %fp, align 8, !dbg !268
  store i32 101, i32* %28, align 4, !dbg !269
  br label %if.end16, !dbg !270

if.end16:                                         ; preds = %if.then12, %land.lhs.true10, %land.lhs.true, %for.body
  br label %for.inc, !dbg !271

for.inc:                                          ; preds = %if.end16
  %29 = load i32* %f, align 4, !dbg !272
  %inc17 = add nsw i32 %29, 1, !dbg !272
  store i32 %inc17, i32* %f, align 4, !dbg !272
  %30 = load i32** %fp, align 8, !dbg !273
  %incdec.ptr = getelementptr inbounds i32* %30, i32 1, !dbg !273
  store i32* %incdec.ptr, i32** %fp, align 8, !dbg !273
  %31 = load i32** %fdp, align 8, !dbg !274
  %incdec.ptr18 = getelementptr inbounds i32* %31, i32 1, !dbg !274
  store i32* %incdec.ptr18, i32** %fdp, align 8, !dbg !274
  %32 = load i32** %bdp, align 8, !dbg !275
  %incdec.ptr19 = getelementptr inbounds i32* %32, i32 -1, !dbg !275
  store i32* %incdec.ptr19, i32** %bdp, align 8, !dbg !275
  br label %for.cond, !dbg !276

for.end:                                          ; preds = %for.cond
  br label %if.end20

if.end20:                                         ; preds = %for.end, %if.end4
  ret void, !dbg !277
}

declare i32 @putchar(i32) #2

; Function Attrs: nounwind uwtable
define void @pboard() #0 {
entry:
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !278, metadata !41), !dbg !279
  call void @llvm.dbg.declare(metadata i32* %j, metadata !280, metadata !41), !dbg !281
  %0 = load i32* @findall, align 4, !dbg !282
  %tobool = icmp ne i32 %0, 0, !dbg !284
  br i1 %tobool, label %if.then, label %if.end, !dbg !284

if.then:                                          ; preds = %entry
  %1 = load i64* @solutions, align 8, !dbg !285
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str12, i32 0, i32 0), i64 %1), !dbg !286
  br label %if.end, !dbg !286

if.end:                                           ; preds = %if.then, %entry
  store i32 0, i32* %i, align 4, !dbg !287
  br label %for.cond, !dbg !287

for.cond:                                         ; preds = %for.inc11, %if.end
  %2 = load i32* %i, align 4, !dbg !289
  %3 = load i32* @ranks, align 4, !dbg !293
  %cmp = icmp slt i32 %2, %3, !dbg !294
  br i1 %cmp, label %for.body, label %for.end13, !dbg !295

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !296
  br label %for.cond1, !dbg !296

for.cond1:                                        ; preds = %for.inc, %for.body
  %4 = load i32* %j, align 4, !dbg !299
  %5 = load i32* @files, align 4, !dbg !303
  %cmp2 = icmp slt i32 %4, %5, !dbg !304
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !305

for.body3:                                        ; preds = %for.cond1
  %call4 = call i32 @putchar(i32 32), !dbg !306
  %6 = load i32* %j, align 4, !dbg !308
  %7 = load i32* %i, align 4, !dbg !310
  %idxprom = sext i32 %7 to i64, !dbg !311
  %arrayidx = getelementptr inbounds [100 x i32]* @queen, i32 0, i64 %idxprom, !dbg !311
  %8 = load i32* %arrayidx, align 4, !dbg !311
  %cmp5 = icmp eq i32 %6, %8, !dbg !308
  br i1 %cmp5, label %if.then6, label %if.else, !dbg !312

if.then6:                                         ; preds = %for.body3
  %call7 = call i32 @putchar(i32 81), !dbg !313
  br label %if.end9, !dbg !313

if.else:                                          ; preds = %for.body3
  %call8 = call i32 @putchar(i32 45), !dbg !315
  br label %if.end9

if.end9:                                          ; preds = %if.else, %if.then6
  br label %for.inc, !dbg !316

for.inc:                                          ; preds = %if.end9
  %9 = load i32* %j, align 4, !dbg !317
  %inc = add nsw i32 %9, 1, !dbg !317
  store i32 %inc, i32* %j, align 4, !dbg !317
  br label %for.cond1, !dbg !318

for.end:                                          ; preds = %for.cond1
  %call10 = call i32 @putchar(i32 10), !dbg !319
  br label %for.inc11, !dbg !320

for.inc11:                                        ; preds = %for.end
  %10 = load i32* %i, align 4, !dbg !321
  %inc12 = add nsw i32 %10, 1, !dbg !321
  store i32 %inc12, i32* %i, align 4, !dbg !321
  br label %for.cond, !dbg !322

for.end13:                                        ; preds = %for.cond
  %11 = load %struct._IO_FILE** @stdout, align 8, !dbg !323
  %call14 = call i32 @fflush(%struct._IO_FILE* %11), !dbg !324
  ret void, !dbg !325
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!37, !38}
!llvm.ident = !{!39}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\000\00\000\00\001", !1, !2, !2, !3, !18, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c] [DW_LANG_C99]
!1 = !{!"queens-mcgill.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4, !12, !15}
!4 = !{!"0x2e\00main\00main\00\00205\000\001\000\000\00256\000\00206", !1, !5, !6, null, i32 (i32, i8**)* @main, null, null, !2} ; [ DW_TAG_subprogram ] [line 205] [def] [scope 206] [main]
!5 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!6 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !7, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = !{!8, !8, !9}
!8 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = !{!"0xf\00\000\0064\0064\000\000", null, null, !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = !{!"0xf\00\000\0064\0064\000\000", null, null, !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!11 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!12 = !{!"0x2e\00pboard\00pboard\00\00299\000\001\000\000\00256\000\00300", !1, !5, !13, null, void ()* @pboard, null, null, !2} ; [ DW_TAG_subprogram ] [line 299] [def] [scope 300] [pboard]
!13 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !14, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = !{null}
!15 = !{!"0x2e\00find\00find\00\00328\000\001\000\000\00256\000\00329", !1, !5, !16, null, void (i32)* @find, null, null, !2} ; [ DW_TAG_subprogram ] [line 328] [def] [scope 329] [find]
!16 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !17, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!17 = !{null, !8}
!18 = !{!19, !20, !21, !23, !24, !25, !26, !27, !31, !32, !36}
!19 = !{!"0x34\00printing\00printing\00\00183\000\001", null, !5, !8, i32* @printing, null} ; [ DW_TAG_variable ] [printing] [line 183] [def]
!20 = !{!"0x34\00findall\00findall\00\00184\000\001", null, !5, !8, i32* @findall, null} ; [ DW_TAG_variable ] [findall] [line 184] [def]
!21 = !{!"0x34\00solutions\00solutions\00\00186\000\001", null, !5, !22, i64* @solutions, null} ; [ DW_TAG_variable ] [solutions] [line 186] [def]
!22 = !{!"0x24\00long unsigned int\000\0064\0064\000\000\007", null, null} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!23 = !{!"0x34\00progname\00progname\00\00191\000\001", null, !5, !10, i8** @progname, null} ; [ DW_TAG_variable ] [progname] [line 191] [def]
!24 = !{!"0x34\00queens\00queens\00\00180\000\001", null, !5, !8, i32* @queens, null} ; [ DW_TAG_variable ] [queens] [line 180] [def]
!25 = !{!"0x34\00ranks\00ranks\00\00181\000\001", null, !5, !8, i32* @ranks, null} ; [ DW_TAG_variable ] [ranks] [line 181] [def]
!26 = !{!"0x34\00files\00files\00\00182\000\001", null, !5, !8, i32* @files, null} ; [ DW_TAG_variable ] [files] [line 182] [def]
!27 = !{!"0x34\00queen\00queen\00\00187\000\001", null, !5, !28, [100 x i32]* @queen, null} ; [ DW_TAG_variable ] [queen] [line 187] [def]
!28 = !{!"0x1\00\000\003200\0032\000\000\000", null, null, !8, !29, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 3200, align 32, offset 0] [from int]
!29 = !{!30}
!30 = !{!"0x21\000\00100"}                        ; [ DW_TAG_subrange_type ] [0, 99]
!31 = !{!"0x34\00file\00file\00\00188\000\001", null, !5, !28, [100 x i32]* @file, null} ; [ DW_TAG_variable ] [file] [line 188] [def]
!32 = !{!"0x34\00fordiag\00fordiag\00\00189\000\001", null, !5, !33, [199 x i32]* @fordiag, null} ; [ DW_TAG_variable ] [fordiag] [line 189] [def]
!33 = !{!"0x1\00\000\006368\0032\000\000\000", null, null, !8, !34, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 6368, align 32, offset 0] [from int]
!34 = !{!35}
!35 = !{!"0x21\000\00199"}                        ; [ DW_TAG_subrange_type ] [0, 198]
!36 = !{!"0x34\00bakdiag\00bakdiag\00\00190\000\001", null, !5, !33, [199 x i32]* @bakdiag, null} ; [ DW_TAG_variable ] [bakdiag] [line 190] [def]
!37 = !{i32 2, !"Dwarf Version", i32 4}
!38 = !{i32 2, !"Debug Info Version", i32 2}
!39 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!40 = !{!"0x101\00argc\0016777421\000", !4, !5, !8} ; [ DW_TAG_arg_variable ] [argc] [line 205]
!41 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!42 = !MDLocation(line: 205, column: 14, scope: !4)
!43 = !{!"0x101\00argv\0033554637\000", !4, !5, !9} ; [ DW_TAG_arg_variable ] [argv] [line 205]
!44 = !MDLocation(line: 205, column: 27, scope: !4)
!45 = !{!"0x100\00i\00207\000", !4, !5, !8}       ; [ DW_TAG_auto_variable ] [i] [line 207]
!46 = !MDLocation(line: 207, column: 18, scope: !4)
!47 = !{!"0x100\00p\00208\000", !4, !5, !10}      ; [ DW_TAG_auto_variable ] [p] [line 208]
!48 = !MDLocation(line: 208, column: 19, scope: !4)
!49 = !{!"0x100\00usage\00209\000", !4, !5, !10}  ; [ DW_TAG_auto_variable ] [usage] [line 209]
!50 = !MDLocation(line: 209, column: 10, scope: !4)
!51 = !MDLocation(line: 219, column: 15, scope: !4)
!52 = !MDLocation(line: 219, column: 4, scope: !4)
!53 = !MDLocation(line: 222, column: 4, scope: !4)
!54 = !MDLocation(line: 226, column: 4, scope: !4)
!55 = !MDLocation(line: 228, column: 4, scope: !4)
!56 = !MDLocation(line: 230, column: 8, scope: !57)
!57 = !{!"0xb\00230\004\000", !1, !4}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!58 = !MDLocation(line: 230, column: 15, scope: !59)
!59 = !{!"0xb\002", !1, !60}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!60 = !{!"0xb\001", !1, !61}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!61 = !{!"0xb\00230\004\001", !1, !57}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!62 = !MDLocation(line: 230, column: 19, scope: !61)
!63 = !MDLocation(line: 230, column: 15, scope: !61)
!64 = !MDLocation(line: 230, column: 4, scope: !57)
!65 = !MDLocation(line: 231, column: 16, scope: !66)
!66 = !{!"0xb\00230\0030\002", !1, !61}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!67 = !MDLocation(line: 231, column: 11, scope: !66)
!68 = !MDLocation(line: 231, column: 7, scope: !66)
!69 = !MDLocation(line: 232, column: 11, scope: !70)
!70 = !{!"0xb\00232\0010\003", !1, !66}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!71 = !MDLocation(line: 232, column: 10, scope: !70)
!72 = !MDLocation(line: 232, column: 10, scope: !66)
!73 = !MDLocation(line: 233, column: 10, scope: !74)
!74 = !{!"0xb\00232\0021\004", !1, !70}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!75 = !MDLocation(line: 233, column: 17, scope: !76)
!76 = !{!"0xb\002", !1, !77}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!77 = !{!"0xb\001", !1, !74}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!78 = !MDLocation(line: 233, column: 16, scope: !74)
!79 = !MDLocation(line: 234, column: 21, scope: !80)
!80 = !{!"0xb\00233\0022\005", !1, !74}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!81 = !MDLocation(line: 234, column: 20, scope: !80)
!82 = !MDLocation(line: 234, column: 13, scope: !80)
!83 = !MDLocation(line: 236, column: 19, scope: !84)
!84 = !{!"0xb\00234\0024\006", !1, !80}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!85 = !MDLocation(line: 238, column: 19, scope: !84)
!86 = !MDLocation(line: 239, column: 19, scope: !84)
!87 = !MDLocation(line: 241, column: 27, scope: !84)
!88 = !MDLocation(line: 241, column: 62, scope: !84)
!89 = !MDLocation(line: 241, column: 76, scope: !84)
!90 = !MDLocation(line: 241, column: 71, scope: !84)
!91 = !MDLocation(line: 241, column: 19, scope: !84)
!92 = !MDLocation(line: 242, column: 27, scope: !84)
!93 = !MDLocation(line: 242, column: 34, scope: !84)
!94 = !MDLocation(line: 242, column: 40, scope: !84)
!95 = !MDLocation(line: 242, column: 19, scope: !84)
!96 = !MDLocation(line: 243, column: 19, scope: !84)
!97 = !MDLocation(line: 246, column: 7, scope: !74)
!98 = !MDLocation(line: 248, column: 20, scope: !99)
!99 = !{!"0xb\00248\0013\008", !1, !100}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!100 = !{!"0xb\00247\0012\007", !1, !70}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!101 = !MDLocation(line: 248, column: 13, scope: !99)
!102 = !MDLocation(line: 248, column: 13, scope: !100)
!103 = !MDLocation(line: 249, column: 21, scope: !104)
!104 = !{!"0xb\00248\0042\009", !1, !99}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!105 = !MDLocation(line: 249, column: 62, scope: !104)
!106 = !MDLocation(line: 249, column: 71, scope: !104)
!107 = !MDLocation(line: 249, column: 13, scope: !104)
!108 = !MDLocation(line: 250, column: 13, scope: !104)
!109 = !MDLocation(line: 252, column: 13, scope: !110)
!110 = !{!"0xb\00252\0013\0010", !1, !100}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!111 = !MDLocation(line: 252, column: 13, scope: !100)
!112 = !MDLocation(line: 253, column: 21, scope: !113)
!113 = !{!"0xb\00252\0026\0011", !1, !110}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!114 = !MDLocation(line: 253, column: 63, scope: !113)
!115 = !MDLocation(line: 253, column: 13, scope: !113)
!116 = !MDLocation(line: 254, column: 13, scope: !113)
!117 = !MDLocation(line: 256, column: 13, scope: !118)
!118 = !{!"0xb\00256\0013\0012", !1, !100}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!119 = !MDLocation(line: 256, column: 13, scope: !100)
!120 = !MDLocation(line: 257, column: 21, scope: !121)
!121 = !{!"0xb\00256\0033\0013", !1, !118}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!122 = !MDLocation(line: 258, column: 16, scope: !121)
!123 = !MDLocation(line: 257, column: 13, scope: !121)
!124 = !MDLocation(line: 259, column: 13, scope: !121)
!125 = !MDLocation(line: 262, column: 4, scope: !66)
!126 = !MDLocation(line: 230, column: 25, scope: !61)
!127 = !MDLocation(line: 230, column: 4, scope: !61)
!128 = !MDLocation(line: 263, column: 8, scope: !129)
!129 = !{!"0xb\00263\007\0014", !1, !4}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!130 = !MDLocation(line: 263, column: 7, scope: !4)
!131 = !MDLocation(line: 264, column: 15, scope: !132)
!132 = !{!"0xb\00263\0016\0015", !1, !129}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!133 = !MDLocation(line: 264, column: 49, scope: !132)
!134 = !MDLocation(line: 264, column: 7, scope: !132)
!135 = !MDLocation(line: 265, column: 15, scope: !132)
!136 = !MDLocation(line: 265, column: 22, scope: !132)
!137 = !MDLocation(line: 265, column: 28, scope: !132)
!138 = !MDLocation(line: 265, column: 7, scope: !132)
!139 = !MDLocation(line: 266, column: 7, scope: !132)
!140 = !MDLocation(line: 269, column: 20, scope: !4)
!141 = !MDLocation(line: 269, column: 12, scope: !4)
!142 = !MDLocation(line: 269, column: 4, scope: !4)
!143 = !MDLocation(line: 271, column: 7, scope: !4)
!144 = !MDLocation(line: 271, column: 15, scope: !4)
!145 = !MDLocation(line: 271, column: 38, scope: !4)
!146 = !MDLocation(line: 271, column: 45, scope: !4)
!147 = !MDLocation(line: 270, column: 4, scope: !4)
!148 = !MDLocation(line: 272, column: 11, scope: !4)
!149 = !MDLocation(line: 272, column: 4, scope: !4)
!150 = !MDLocation(line: 275, column: 4, scope: !4)
!151 = !MDLocation(line: 276, column: 8, scope: !152)
!152 = !{!"0xb\00276\004\0016", !1, !4}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!153 = !MDLocation(line: 276, column: 15, scope: !154)
!154 = !{!"0xb\004", !1, !155}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!155 = !{!"0xb\001", !1, !156}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!156 = !{!"0xb\00276\004\0017", !1, !152}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!157 = !MDLocation(line: 276, column: 4, scope: !152)
!158 = !MDLocation(line: 276, column: 39, scope: !159)
!159 = !{!"0xb\002", !1, !156}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!160 = !MDLocation(line: 276, column: 34, scope: !156)
!161 = !MDLocation(line: 276, column: 29, scope: !162)
!162 = !{!"0xb\003", !1, !156}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!163 = !MDLocation(line: 276, column: 4, scope: !156)
!164 = !MDLocation(line: 277, column: 8, scope: !165)
!165 = !{!"0xb\00277\004\0018", !1, !4}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!166 = !MDLocation(line: 277, column: 15, scope: !167)
!167 = !{!"0xb\004", !1, !168}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!168 = !{!"0xb\001", !1, !169}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!169 = !{!"0xb\00277\004\0019", !1, !165}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!170 = !MDLocation(line: 277, column: 4, scope: !165)
!171 = !MDLocation(line: 277, column: 55, scope: !172)
!172 = !{!"0xb\002", !1, !169}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!173 = !MDLocation(line: 277, column: 47, scope: !169)
!174 = !MDLocation(line: 277, column: 42, scope: !169)
!175 = !MDLocation(line: 277, column: 34, scope: !169)
!176 = !MDLocation(line: 277, column: 29, scope: !177)
!177 = !{!"0xb\003", !1, !169}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!178 = !MDLocation(line: 277, column: 4, scope: !169)
!179 = !MDLocation(line: 280, column: 4, scope: !4)
!180 = !MDLocation(line: 281, column: 7, scope: !181)
!181 = !{!"0xb\00281\007\0020", !1, !4}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!182 = !MDLocation(line: 281, column: 7, scope: !4)
!183 = !MDLocation(line: 281, column: 19, scope: !184)
!184 = !{!"0xb\001", !1, !181}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!185 = !MDLocation(line: 281, column: 30, scope: !186)
!186 = !{!"0xb\002", !1, !181}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!187 = !MDLocation(line: 284, column: 7, scope: !188)
!188 = !{!"0xb\00284\007\0021", !1, !4}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!189 = !MDLocation(line: 284, column: 7, scope: !4)
!190 = !MDLocation(line: 284, column: 23, scope: !191)
!191 = !{!"0xb\001", !1, !188}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!192 = !MDLocation(line: 285, column: 48, scope: !188)
!193 = !MDLocation(line: 285, column: 9, scope: !188)
!194 = !MDLocation(line: 287, column: 4, scope: !4)
!195 = !MDLocation(line: 288, column: 1, scope: !4)
!196 = !{!"0x101\00level\0016777544\000", !15, !5, !8} ; [ DW_TAG_arg_variable ] [level] [line 328]
!197 = !MDLocation(line: 328, column: 24, scope: !15)
!198 = !{!"0x100\00f\00330\000", !15, !5, !8}     ; [ DW_TAG_auto_variable ] [f] [line 330]
!199 = !MDLocation(line: 330, column: 17, scope: !15)
!200 = !{!"0x100\00fp\00331\000", !15, !5, !201}  ; [ DW_TAG_auto_variable ] [fp] [line 331]
!201 = !{!"0xf\00\000\0064\0064\000\000", null, null, !8} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!202 = !MDLocation(line: 331, column: 18, scope: !15)
!203 = !{!"0x100\00fdp\00331\000", !15, !5, !201} ; [ DW_TAG_auto_variable ] [fdp] [line 331]
!204 = !MDLocation(line: 331, column: 23, scope: !15)
!205 = !{!"0x100\00bdp\00331\000", !15, !5, !201} ; [ DW_TAG_auto_variable ] [bdp] [line 331]
!206 = !MDLocation(line: 331, column: 29, scope: !15)
!207 = !MDLocation(line: 338, column: 7, scope: !208)
!208 = !{!"0xb\00338\007\0030", !1, !15}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!209 = !MDLocation(line: 338, column: 16, scope: !208)
!210 = !MDLocation(line: 338, column: 7, scope: !15)
!211 = !MDLocation(line: 339, column: 7, scope: !212)
!212 = !{!"0xb\00338\0024\0031", !1, !208}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!213 = !MDLocation(line: 340, column: 10, scope: !214)
!214 = !{!"0xb\00340\0010\0032", !1, !212}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!215 = !MDLocation(line: 340, column: 10, scope: !212)
!216 = !MDLocation(line: 340, column: 20, scope: !217)
!217 = !{!"0xb\001", !1, !214}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!218 = !MDLocation(line: 341, column: 11, scope: !219)
!219 = !{!"0xb\00341\0010\0033", !1, !212}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!220 = !MDLocation(line: 341, column: 10, scope: !212)
!221 = !MDLocation(line: 341, column: 20, scope: !222)
!222 = !{!"0xb\001", !1, !219}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!223 = !MDLocation(line: 345, column: 4, scope: !212)
!224 = !MDLocation(line: 348, column: 10, scope: !225)
!225 = !{!"0xb\00347\007\0035", !1, !226}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!226 = !{!"0xb\00346\009\0034", !1, !208}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!227 = !MDLocation(line: 349, column: 10, scope: !225)
!228 = !MDLocation(line: 350, column: 25, scope: !225)
!229 = !MDLocation(line: 350, column: 16, scope: !225)
!230 = !MDLocation(line: 350, column: 10, scope: !225)
!231 = !MDLocation(line: 351, column: 25, scope: !225)
!232 = !MDLocation(line: 351, column: 31, scope: !225)
!233 = !MDLocation(line: 351, column: 16, scope: !225)
!234 = !MDLocation(line: 351, column: 10, scope: !225)
!235 = !MDLocation(line: 353, column: 10, scope: !236)
!236 = !{!"0xb\00347\007\0036", !1, !225}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!237 = !MDLocation(line: 353, column: 14, scope: !236)
!238 = !MDLocation(line: 347, column: 7, scope: !225)
!239 = !MDLocation(line: 358, column: 14, scope: !240)
!240 = !{!"0xb\00358\0013\0038", !1, !241}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!241 = !{!"0xb\00357\009\0037", !1, !236}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!242 = !MDLocation(line: 358, column: 13, scope: !240)
!243 = !MDLocation(line: 358, column: 20, scope: !240)
!244 = !MDLocation(line: 358, column: 13, scope: !241)
!245 = !MDLocation(line: 359, column: 14, scope: !240)
!246 = !MDLocation(line: 359, column: 13, scope: !240)
!247 = !MDLocation(line: 359, column: 21, scope: !240)
!248 = !MDLocation(line: 359, column: 31, scope: !240)
!249 = !MDLocation(line: 359, column: 30, scope: !240)
!250 = !MDLocation(line: 359, column: 38, scope: !240)
!251 = !MDLocation(line: 361, column: 28, scope: !252)
!252 = !{!"0xb\00360\005\0039", !1, !240}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!253 = !MDLocation(line: 361, column: 19, scope: !252)
!254 = !MDLocation(line: 361, column: 13, scope: !252)
!255 = !MDLocation(line: 362, column: 33, scope: !252)
!256 = !MDLocation(line: 362, column: 27, scope: !252)
!257 = !MDLocation(line: 362, column: 26, scope: !252)
!258 = !MDLocation(line: 362, column: 20, scope: !252)
!259 = !MDLocation(line: 362, column: 19, scope: !252)
!260 = !MDLocation(line: 362, column: 14, scope: !252)
!261 = !MDLocation(line: 362, column: 13, scope: !252)
!262 = !MDLocation(line: 363, column: 18, scope: !252)
!263 = !MDLocation(line: 363, column: 13, scope: !252)
!264 = !MDLocation(line: 364, column: 27, scope: !252)
!265 = !MDLocation(line: 364, column: 26, scope: !252)
!266 = !MDLocation(line: 364, column: 20, scope: !252)
!267 = !MDLocation(line: 364, column: 19, scope: !252)
!268 = !MDLocation(line: 364, column: 14, scope: !252)
!269 = !MDLocation(line: 364, column: 13, scope: !252)
!270 = !MDLocation(line: 365, column: 10, scope: !252)
!271 = !MDLocation(line: 366, column: 7, scope: !241)
!272 = !MDLocation(line: 355, column: 10, scope: !236)
!273 = !MDLocation(line: 356, column: 10, scope: !236)
!274 = !MDLocation(line: 356, column: 16, scope: !236)
!275 = !MDLocation(line: 356, column: 23, scope: !236)
!276 = !MDLocation(line: 347, column: 7, scope: !236)
!277 = !MDLocation(line: 368, column: 1, scope: !15)
!278 = !{!"0x100\00i\00301\000", !12, !5, !8}     ; [ DW_TAG_auto_variable ] [i] [line 301]
!279 = !MDLocation(line: 301, column: 17, scope: !12)
!280 = !{!"0x100\00j\00301\000", !12, !5, !8}     ; [ DW_TAG_auto_variable ] [j] [line 301]
!281 = !MDLocation(line: 301, column: 20, scope: !12)
!282 = !MDLocation(line: 303, column: 7, scope: !283)
!283 = !{!"0xb\00303\007\0022", !1, !12}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!284 = !MDLocation(line: 303, column: 7, scope: !12)
!285 = !MDLocation(line: 304, column: 35, scope: !283)
!286 = !MDLocation(line: 304, column: 7, scope: !283)
!287 = !MDLocation(line: 306, column: 8, scope: !288)
!288 = !{!"0xb\00306\004\0023", !1, !12}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!289 = !MDLocation(line: 306, column: 15, scope: !290)
!290 = !{!"0xb\002", !1, !291}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!291 = !{!"0xb\001", !1, !292}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!292 = !{!"0xb\00306\004\0024", !1, !288}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!293 = !MDLocation(line: 306, column: 19, scope: !292)
!294 = !MDLocation(line: 306, column: 15, scope: !292)
!295 = !MDLocation(line: 306, column: 4, scope: !288)
!296 = !MDLocation(line: 307, column: 11, scope: !297)
!297 = !{!"0xb\00307\007\0026", !1, !298}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!298 = !{!"0xb\00306\0031\0025", !1, !292}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!299 = !MDLocation(line: 307, column: 18, scope: !300)
!300 = !{!"0xb\002", !1, !301}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!301 = !{!"0xb\001", !1, !302}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!302 = !{!"0xb\00307\007\0027", !1, !297}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!303 = !MDLocation(line: 307, column: 22, scope: !302)
!304 = !MDLocation(line: 307, column: 18, scope: !302)
!305 = !MDLocation(line: 307, column: 7, scope: !297)
!306 = !MDLocation(line: 308, column: 10, scope: !307)
!307 = !{!"0xb\00307\0034\0028", !1, !302}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!308 = !MDLocation(line: 309, column: 13, scope: !309)
!309 = !{!"0xb\00309\0013\0029", !1, !307}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!310 = !MDLocation(line: 309, column: 24, scope: !309)
!311 = !MDLocation(line: 309, column: 18, scope: !309)
!312 = !MDLocation(line: 309, column: 13, scope: !307)
!313 = !MDLocation(line: 309, column: 28, scope: !314)
!314 = !{!"0xb\001", !1, !309}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!315 = !MDLocation(line: 310, column: 15, scope: !309)
!316 = !MDLocation(line: 311, column: 7, scope: !307)
!317 = !MDLocation(line: 307, column: 29, scope: !302)
!318 = !MDLocation(line: 307, column: 7, scope: !302)
!319 = !MDLocation(line: 312, column: 7, scope: !298)
!320 = !MDLocation(line: 313, column: 4, scope: !298)
!321 = !MDLocation(line: 306, column: 26, scope: !292)
!322 = !MDLocation(line: 306, column: 4, scope: !292)
!323 = !MDLocation(line: 314, column: 11, scope: !12)
!324 = !MDLocation(line: 314, column: 4, scope: !12)
!325 = !MDLocation(line: 315, column: 1, scope: !12)
