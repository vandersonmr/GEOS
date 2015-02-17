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
@str = private unnamed_addr constant [23 x i8] c"...there is 1 solution\00"

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !13, metadata !63), !dbg !64
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !14, metadata !63), !dbg !65
  tail call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([168 x i8]* @.str, i32 0, i32 0), i64 0, metadata !17, metadata !63), !dbg !66
  %0 = load i8** %argv, align 8, !dbg !67, !tbaa !68
  store i8* %0, i8** @progname, align 8, !dbg !72, !tbaa !68
  store i32 0, i32* @printing, align 4, !dbg !73, !tbaa !74
  store i32 14, i32* @queens, align 4, !dbg !76, !tbaa !74
  store i32 1, i32* @findall, align 4, !dbg !77, !tbaa !74
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !15, metadata !63), !dbg !78
  %cmp94 = icmp sgt i32 %argc, 1, !dbg !79
  br i1 %cmp94, label %for.body.lr.ph, label %if.end29, !dbg !82

for.body.lr.ph:                                   ; preds = %entry
  %1 = sext i32 %argc to i64, !dbg !82
  br label %for.body, !dbg !82

for.body:                                         ; preds = %for.body.lr.ph, %for.inc
  %indvars.iv107 = phi i64 [ 1, %for.body.lr.ph ], [ %indvars.iv.next108, %for.inc ]
  %arrayidx1 = getelementptr inbounds i8** %argv, i64 %indvars.iv107, !dbg !83
  %2 = load i8** %arrayidx1, align 8, !dbg !83, !tbaa !68
  tail call void @llvm.dbg.value(metadata i8* %2, i64 0, metadata !16, metadata !63), !dbg !85
  %3 = load i8* %2, align 1, !dbg !86, !tbaa !88
  %cmp2 = icmp eq i8 %3, 45, !dbg !86
  br i1 %cmp2, label %while.cond.preheader, label %if.else, !dbg !89

while.cond.preheader:                             ; preds = %for.body
  %incdec.ptr91 = getelementptr inbounds i8* %2, i64 1, !dbg !90
  tail call void @llvm.dbg.value(metadata i8* %incdec.ptr91, i64 0, metadata !16, metadata !63), !dbg !85
  %4 = load i8* %incdec.ptr91, align 1, !dbg !94, !tbaa !88
  %tobool92 = icmp eq i8 %4, 0, !dbg !95
  br i1 %tobool92, label %for.inc, label %while.body, !dbg !95

while.body:                                       ; preds = %while.cond.preheader, %sw.bb5
  %5 = phi i8 [ %7, %sw.bb5 ], [ %4, %while.cond.preheader ]
  %6 = phi i8* [ %incdec.ptr93, %sw.bb5 ], [ %2, %while.cond.preheader ]
  %incdec.ptr93 = phi i8* [ %incdec.ptr, %sw.bb5 ], [ %incdec.ptr91, %while.cond.preheader ]
  %conv4 = sext i8 %5 to i32, !dbg !96
  switch i32 %conv4, label %sw.default [
    i32 99, label %sw.bb
    i32 97, label %sw.bb5
  ], !dbg !98

sw.bb:                                            ; preds = %while.body
  store i32 0, i32* @printing, align 4, !dbg !99, !tbaa !74
  br label %sw.bb5, !dbg !99

sw.bb5:                                           ; preds = %while.body, %sw.bb
  store i32 1, i32* @findall, align 4, !dbg !101, !tbaa !74
  %incdec.ptr = getelementptr inbounds i8* %6, i64 2, !dbg !90
  tail call void @llvm.dbg.value(metadata i8* %incdec.ptr, i64 0, metadata !16, metadata !63), !dbg !85
  %7 = load i8* %incdec.ptr, align 1, !dbg !94, !tbaa !88
  %tobool = icmp eq i8 %7, 0, !dbg !95
  br i1 %tobool, label %for.inc, label %while.body, !dbg !95

sw.default:                                       ; preds = %while.body
  %8 = load %struct._IO_FILE** @stderr, align 8, !dbg !102, !tbaa !68
  %9 = load i8** @progname, align 8, !dbg !103, !tbaa !68
  %10 = load i8** %arrayidx1, align 8, !dbg !104, !tbaa !68
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([25 x i8]* @.str1, i64 0, i64 0), i8* %9, i8* %10) #7, !dbg !105
  %11 = load %struct._IO_FILE** @stderr, align 8, !dbg !106, !tbaa !68
  %12 = load i8** @progname, align 8, !dbg !107, !tbaa !68
  %call8 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([168 x i8]* @.str, i64 0, i64 0), i8* %12) #7, !dbg !108
  tail call void @exit(i32 -1) #8, !dbg !109
  unreachable, !dbg !109

if.else:                                          ; preds = %for.body
  %call9 = tail call i32 (i8*, i8*, ...)* @__isoc99_sscanf(i8* %2, i8* getelementptr inbounds ([3 x i8]* @.str2, i64 0, i64 0), i32* @queens) #6, !dbg !110
  %cmp10 = icmp eq i32 %call9, 1, !dbg !110
  br i1 %cmp10, label %if.end, label %if.then12, !dbg !113

if.then12:                                        ; preds = %if.else
  %13 = load %struct._IO_FILE** @stderr, align 8, !dbg !114, !tbaa !68
  %14 = load i8** @progname, align 8, !dbg !116, !tbaa !68
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([31 x i8]* @.str3, i64 0, i64 0), i8* %14, i8* %2) #7, !dbg !117
  tail call void @exit(i32 -1) #8, !dbg !118
  unreachable, !dbg !118

if.end:                                           ; preds = %if.else
  %15 = load i32* @queens, align 4, !dbg !119, !tbaa !74
  %cmp14 = icmp slt i32 %15, 1, !dbg !119
  br i1 %cmp14, label %if.then16, label %if.end18, !dbg !121

if.then16:                                        ; preds = %if.end
  %16 = load %struct._IO_FILE** @stderr, align 8, !dbg !122, !tbaa !68
  %17 = load i8** @progname, align 8, !dbg !124, !tbaa !68
  %call17 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([32 x i8]* @.str4, i64 0, i64 0), i8* %17) #7, !dbg !125
  tail call void @exit(i32 -1) #8, !dbg !126
  unreachable, !dbg !126

if.end18:                                         ; preds = %if.end
  %cmp19 = icmp sgt i32 %15, 100, !dbg !127
  br i1 %cmp19, label %if.then21, label %for.inc, !dbg !129

if.then21:                                        ; preds = %if.end18
  %18 = load %struct._IO_FILE** @stderr, align 8, !dbg !130, !tbaa !68
  %19 = load i8** @progname, align 8, !dbg !132, !tbaa !68
  %call22 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([36 x i8]* @.str5, i64 0, i64 0), i8* %19, i32 100) #7, !dbg !133
  tail call void @exit(i32 -1) #8, !dbg !134
  unreachable, !dbg !134

for.inc:                                          ; preds = %sw.bb5, %while.cond.preheader, %if.end18
  %indvars.iv.next108 = add nuw nsw i64 %indvars.iv107, 1, !dbg !82
  %cmp = icmp slt i64 %indvars.iv.next108, %1, !dbg !79
  br i1 %cmp, label %for.body, label %for.end, !dbg !82

for.end:                                          ; preds = %for.inc
  %.pr109 = load i32* @queens, align 4, !dbg !135, !tbaa !74
  %tobool25 = icmp eq i32 %.pr109, 0, !dbg !137
  br i1 %tobool25, label %if.then26, label %if.end29, !dbg !137

if.then26:                                        ; preds = %for.end
  %20 = load %struct._IO_FILE** @stderr, align 8, !dbg !138, !tbaa !68
  %21 = load i8** @progname, align 8, !dbg !140, !tbaa !68
  %call27 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([24 x i8]* @.str6, i64 0, i64 0), i8* %21) #7, !dbg !141
  %22 = load %struct._IO_FILE** @stderr, align 8, !dbg !142, !tbaa !68
  %23 = load i8** @progname, align 8, !dbg !143, !tbaa !68
  %call28 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([168 x i8]* @.str, i64 0, i64 0), i8* %23) #7, !dbg !144
  tail call void @exit(i32 -1) #8, !dbg !145
  unreachable, !dbg !145

if.end29:                                         ; preds = %entry, %for.end
  %24 = phi i32 [ %.pr109, %for.end ], [ 14, %entry ]
  store i32 %24, i32* @files, align 4, !dbg !146, !tbaa !74
  store i32 %24, i32* @ranks, align 4, !dbg !147, !tbaa !74
  %25 = load i32* @queens, align 4, !dbg !148, !tbaa !74
  %cmp30 = icmp sgt i32 %25, 1, !dbg !149
  %cond = select i1 %cmp30, i8* getelementptr inbounds ([2 x i8]* @.str8, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8]* @.str9, i64 0, i64 0), !dbg !149
  %call32 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str7, i64 0, i64 0), i32 %25, i8* %cond, i32 %24, i32 %24) #6, !dbg !150
  %26 = load %struct._IO_FILE** @stdout, align 8, !dbg !151, !tbaa !68
  %call33 = tail call i32 @fflush(%struct._IO_FILE* %26) #6, !dbg !152
  store i64 0, i64* @solutions, align 8, !dbg !153, !tbaa !154
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !15, metadata !63), !dbg !78
  br label %for.body37, !dbg !156

for.body37:                                       ; preds = %for.body37, %if.end29
  %indvars.iv104 = phi i64 [ 0, %if.end29 ], [ %indvars.iv.next105, %for.body37 ]
  %arrayidx39 = getelementptr inbounds [100 x i32]* @file, i64 0, i64 %indvars.iv104, !dbg !158
  store i32 101, i32* %arrayidx39, align 4, !dbg !158, !tbaa !74
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104, 1, !dbg !156
  %exitcond106 = icmp eq i64 %indvars.iv.next105, 100, !dbg !156
  br i1 %exitcond106, label %for.body46, label %for.body37, !dbg !156

for.body46:                                       ; preds = %for.body37, %for.body46
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body46 ], [ 0, %for.body37 ]
  %arrayidx48 = getelementptr inbounds [199 x i32]* @bakdiag, i64 0, i64 %indvars.iv, !dbg !160
  store i32 101, i32* %arrayidx48, align 4, !dbg !160, !tbaa !74
  %arrayidx50 = getelementptr inbounds [199 x i32]* @fordiag, i64 0, i64 %indvars.iv, !dbg !163
  store i32 101, i32* %arrayidx50, align 4, !dbg !163, !tbaa !74
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !164
  %exitcond = icmp eq i64 %indvars.iv.next, 199, !dbg !164
  br i1 %exitcond, label %for.end53, label %for.body46, !dbg !164

for.end53:                                        ; preds = %for.body46
  tail call void @find(i32 0), !dbg !165
  %27 = load i32* @printing, align 4, !dbg !166, !tbaa !74
  %tobool54 = icmp ne i32 %27, 0, !dbg !168
  %28 = load i64* @solutions, align 8
  %tobool55 = icmp ne i64 %28, 0, !dbg !168
  %or.cond = and i1 %tobool54, %tobool55, !dbg !168
  br i1 %or.cond, label %if.then56, label %if.end58, !dbg !168

if.then56:                                        ; preds = %for.end53
  %call57 = tail call i32 @putchar(i32 10), !dbg !169
  %.pr = load i64* @solutions, align 8, !dbg !171
  br label %if.end58, !dbg !169

if.end58:                                         ; preds = %if.then56, %for.end53
  %29 = phi i64 [ %.pr, %if.then56 ], [ %28, %for.end53 ], !dbg !171
  %cmp59 = icmp eq i64 %29, 1, !dbg !171
  br i1 %cmp59, label %if.then61, label %if.else63, !dbg !173

if.then61:                                        ; preds = %if.end58
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([23 x i8]* @str, i64 0, i64 0)), !dbg !174
  br label %if.end65, !dbg !174

if.else63:                                        ; preds = %if.end58
  %call64 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str11, i64 0, i64 0), i64 %29) #6, !dbg !176
  br label %if.end65

if.end65:                                         ; preds = %if.else63, %if.then61
  tail call void @exit(i32 0) #8, !dbg !177
  unreachable, !dbg !177
}

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

; Function Attrs: nounwind
declare i32 @__isoc99_sscanf(i8* nocapture readonly, i8* nocapture readonly, ...) #1

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind
declare i32 @fflush(%struct._IO_FILE* nocapture) #1

; Function Attrs: nounwind uwtable
define void @find(i32 %level) #3 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %level, i64 0, metadata !28, metadata !63), !dbg !178
  %0 = load i32* @queens, align 4, !dbg !179, !tbaa !74
  %cmp = icmp eq i32 %0, %level, !dbg !181
  br i1 %cmp, label %if.then, label %if.else, !dbg !182

if.then:                                          ; preds = %entry
  %1 = load i64* @solutions, align 8, !dbg !183, !tbaa !154
  %inc = add i64 %1, 1, !dbg !183
  store i64 %inc, i64* @solutions, align 8, !dbg !183, !tbaa !154
  %2 = load i32* @printing, align 4, !dbg !185, !tbaa !74
  %tobool = icmp eq i32 %2, 0, !dbg !187
  br i1 %tobool, label %if.end, label %if.then1, !dbg !187

if.then1:                                         ; preds = %if.then
  tail call void @pboard(), !dbg !188
  br label %if.end, !dbg !188

if.end:                                           ; preds = %if.then, %if.then1
  %3 = load i32* @findall, align 4, !dbg !190, !tbaa !74
  %tobool2 = icmp eq i32 %3, 0, !dbg !192
  br i1 %tobool2, label %if.then3, label %if.end20, !dbg !192

if.then3:                                         ; preds = %if.end
  tail call void @exit(i32 0) #8, !dbg !193
  unreachable, !dbg !193

if.else:                                          ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !29, metadata !63), !dbg !195
  tail call void @llvm.dbg.value(metadata i32* getelementptr inbounds ([100 x i32]* @file, i32 0, i32 0), i64 0, metadata !30, metadata !63), !dbg !196
  %idxprom = sext i32 %level to i64, !dbg !197
  tail call void @llvm.dbg.value(metadata i32* %arrayidx, i64 0, metadata !32, metadata !63), !dbg !200
  tail call void @llvm.dbg.value(metadata i32* %arrayidx6, i64 0, metadata !33, metadata !63), !dbg !201
  %4 = load i32* @files, align 4, !dbg !202, !tbaa !74
  %cmp740 = icmp sgt i32 %4, 0, !dbg !204
  br i1 %cmp740, label %for.body.lr.ph, label %if.end20, !dbg !205

for.body.lr.ph:                                   ; preds = %if.else
  %add = add i32 %level, -1, !dbg !206
  %5 = load i32* @files, align 4, !dbg !207, !tbaa !74
  %sub = add i32 %add, %5, !dbg !206
  %idxprom5 = sext i32 %sub to i64, !dbg !208
  %arrayidx6 = getelementptr inbounds [199 x i32]* @bakdiag, i64 0, i64 %idxprom5, !dbg !208
  %arrayidx = getelementptr inbounds [199 x i32]* @fordiag, i64 0, i64 %idxprom, !dbg !197
  %arrayidx14 = getelementptr inbounds [100 x i32]* @queen, i64 0, i64 %idxprom, !dbg !209
  %add15 = add nsw i32 %level, 1, !dbg !213
  br label %for.body, !dbg !205

for.body:                                         ; preds = %for.body.lr.ph, %for.inc
  %bdp.044 = phi i32* [ %arrayidx6, %for.body.lr.ph ], [ %incdec.ptr19, %for.inc ]
  %fdp.043 = phi i32* [ %arrayidx, %for.body.lr.ph ], [ %incdec.ptr18, %for.inc ]
  %fp.042 = phi i32* [ getelementptr inbounds ([100 x i32]* @file, i64 0, i64 0), %for.body.lr.ph ], [ %incdec.ptr, %for.inc ]
  %f.041 = phi i32 [ 0, %for.body.lr.ph ], [ %inc17, %for.inc ]
  %6 = load i32* %fp.042, align 4, !dbg !214, !tbaa !74
  %cmp8 = icmp slt i32 %6, %level, !dbg !214
  br i1 %cmp8, label %for.inc, label %land.lhs.true, !dbg !215

land.lhs.true:                                    ; preds = %for.body
  %7 = load i32* %fdp.043, align 4, !dbg !216, !tbaa !74
  %cmp9 = icmp slt i32 %7, %level, !dbg !216
  br i1 %cmp9, label %for.inc, label %land.lhs.true10, !dbg !215

land.lhs.true10:                                  ; preds = %land.lhs.true
  %8 = load i32* %bdp.044, align 4, !dbg !217, !tbaa !74
  %cmp11 = icmp slt i32 %8, %level, !dbg !217
  br i1 %cmp11, label %for.inc, label %if.then12, !dbg !215

if.then12:                                        ; preds = %land.lhs.true10
  store i32 %f.041, i32* %arrayidx14, align 4, !dbg !209, !tbaa !74
  store i32 %level, i32* %bdp.044, align 4, !dbg !218, !tbaa !74
  store i32 %level, i32* %fdp.043, align 4, !dbg !219, !tbaa !74
  store i32 %level, i32* %fp.042, align 4, !dbg !220, !tbaa !74
  tail call void @find(i32 %add15), !dbg !221
  store i32 101, i32* %bdp.044, align 4, !dbg !222, !tbaa !74
  store i32 101, i32* %fdp.043, align 4, !dbg !223, !tbaa !74
  store i32 101, i32* %fp.042, align 4, !dbg !224, !tbaa !74
  br label %for.inc, !dbg !225

for.inc:                                          ; preds = %land.lhs.true10, %land.lhs.true, %for.body, %if.then12
  %inc17 = add nuw nsw i32 %f.041, 1, !dbg !226
  tail call void @llvm.dbg.value(metadata i32 %inc17, i64 0, metadata !29, metadata !63), !dbg !195
  %incdec.ptr = getelementptr inbounds i32* %fp.042, i64 1, !dbg !227
  tail call void @llvm.dbg.value(metadata i32* %incdec.ptr, i64 0, metadata !30, metadata !63), !dbg !196
  %incdec.ptr18 = getelementptr inbounds i32* %fdp.043, i64 1, !dbg !228
  tail call void @llvm.dbg.value(metadata i32* %incdec.ptr18, i64 0, metadata !32, metadata !63), !dbg !200
  %incdec.ptr19 = getelementptr inbounds i32* %bdp.044, i64 -1, !dbg !229
  tail call void @llvm.dbg.value(metadata i32* %incdec.ptr19, i64 0, metadata !33, metadata !63), !dbg !201
  %9 = load i32* @files, align 4, !dbg !202, !tbaa !74
  %cmp7 = icmp slt i32 %inc17, %9, !dbg !204
  br i1 %cmp7, label %for.body, label %if.end20, !dbg !205

if.end20:                                         ; preds = %for.inc, %if.else, %if.end
  ret void, !dbg !230
}

; Function Attrs: inlinehint nounwind uwtable
define available_externally i32 @putchar(i32 %__c) #4 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %__c, i64 0, metadata !40, metadata !63), !dbg !231
  %0 = load %struct._IO_FILE** @stdout, align 8, !dbg !232, !tbaa !68
  %call = tail call i32 @_IO_putc(i32 %__c, %struct._IO_FILE* %0) #6, !dbg !233
  ret i32 %call, !dbg !234
}

; Function Attrs: nounwind uwtable
define void @pboard() #3 {
entry:
  %0 = load i32* @findall, align 4, !dbg !235, !tbaa !74
  %tobool = icmp eq i32 %0, 0, !dbg !237
  br i1 %tobool, label %for.cond.preheader, label %if.then, !dbg !237

if.then:                                          ; preds = %entry
  %1 = load i64* @solutions, align 8, !dbg !238, !tbaa !154
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str12, i64 0, i64 0), i64 %1) #6, !dbg !239
  br label %for.cond.preheader, !dbg !239

for.cond.preheader:                               ; preds = %entry, %if.then
  %2 = load i32* @ranks, align 4, !dbg !240, !tbaa !74
  %cmp21 = icmp sgt i32 %2, 0, !dbg !243
  br i1 %cmp21, label %for.cond1.preheader, label %for.end13, !dbg !244

for.cond1.preheader:                              ; preds = %for.cond.preheader, %for.end
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.end ], [ 0, %for.cond.preheader ]
  %3 = load i32* @files, align 4, !dbg !245, !tbaa !74
  %cmp219 = icmp sgt i32 %3, 0, !dbg !249
  br i1 %cmp219, label %for.body3.lr.ph, label %for.end, !dbg !250

for.body3.lr.ph:                                  ; preds = %for.cond1.preheader
  %arrayidx = getelementptr inbounds [100 x i32]* @queen, i64 0, i64 %indvars.iv, !dbg !251
  br label %for.body3, !dbg !250

for.body3:                                        ; preds = %for.body3.lr.ph, %for.inc
  %j.020 = phi i32 [ 0, %for.body3.lr.ph ], [ %inc, %for.inc ]
  %call4 = tail call i32 @putchar(i32 32), !dbg !254
  %4 = load i32* %arrayidx, align 4, !dbg !251, !tbaa !74
  %cmp5 = icmp eq i32 %j.020, %4, !dbg !255
  br i1 %cmp5, label %if.then6, label %if.else, !dbg !256

if.then6:                                         ; preds = %for.body3
  %call7 = tail call i32 @putchar(i32 81), !dbg !257
  br label %for.inc, !dbg !257

if.else:                                          ; preds = %for.body3
  %call8 = tail call i32 @putchar(i32 45), !dbg !259
  br label %for.inc

for.inc:                                          ; preds = %if.then6, %if.else
  %inc = add nuw nsw i32 %j.020, 1, !dbg !260
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !23, metadata !63), !dbg !261
  %5 = load i32* @files, align 4, !dbg !245, !tbaa !74
  %cmp2 = icmp slt i32 %inc, %5, !dbg !249
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !250

for.end:                                          ; preds = %for.inc, %for.cond1.preheader
  %call10 = tail call i32 @putchar(i32 10), !dbg !262
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !244
  %6 = load i32* @ranks, align 4, !dbg !240, !tbaa !74
  %7 = sext i32 %6 to i64, !dbg !243
  %cmp = icmp slt i64 %indvars.iv.next, %7, !dbg !243
  br i1 %cmp, label %for.cond1.preheader, label %for.end13, !dbg !244

for.end13:                                        ; preds = %for.end, %for.cond.preheader
  %8 = load %struct._IO_FILE** @stdout, align 8, !dbg !263, !tbaa !68
  %call14 = tail call i32 @fflush(%struct._IO_FILE* %8) #6, !dbg !264
  ret void, !dbg !265
}

; Function Attrs: nounwind
declare i32 @_IO_putc(i32, %struct._IO_FILE* nocapture) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #5

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #6

attributes #0 = { noreturn nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { inlinehint nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone }
attributes #6 = { nounwind }
attributes #7 = { cold nounwind }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!60, !61}
!llvm.ident = !{!62}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !2, !3, !41, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c] [DW_LANG_C99]
!1 = !{!"queens-mcgill.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4, !18, !24, !34}
!4 = !{!"0x2e\00main\00main\00\00205\000\001\000\000\00256\001\00206", !1, !5, !6, null, i32 (i32, i8**)* @main, null, null, !12} ; [ DW_TAG_subprogram ] [line 205] [def] [scope 206] [main]
!5 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!6 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !7, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = !{!8, !8, !9}
!8 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = !{!"0xf\00\000\0064\0064\000\000", null, null, !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = !{!"0xf\00\000\0064\0064\000\000", null, null, !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!11 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!12 = !{!13, !14, !15, !16, !17}
!13 = !{!"0x101\00argc\0016777421\000", !4, !5, !8} ; [ DW_TAG_arg_variable ] [argc] [line 205]
!14 = !{!"0x101\00argv\0033554637\000", !4, !5, !9} ; [ DW_TAG_arg_variable ] [argv] [line 205]
!15 = !{!"0x100\00i\00207\000", !4, !5, !8}       ; [ DW_TAG_auto_variable ] [i] [line 207]
!16 = !{!"0x100\00p\00208\000", !4, !5, !10}      ; [ DW_TAG_auto_variable ] [p] [line 208]
!17 = !{!"0x100\00usage\00209\000", !4, !5, !10}  ; [ DW_TAG_auto_variable ] [usage] [line 209]
!18 = !{!"0x2e\00pboard\00pboard\00\00299\000\001\000\000\00256\001\00300", !1, !5, !19, null, void ()* @pboard, null, null, !21} ; [ DW_TAG_subprogram ] [line 299] [def] [scope 300] [pboard]
!19 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !20, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!20 = !{null}
!21 = !{!22, !23}
!22 = !{!"0x100\00i\00301\000", !18, !5, !8}      ; [ DW_TAG_auto_variable ] [i] [line 301]
!23 = !{!"0x100\00j\00301\000", !18, !5, !8}      ; [ DW_TAG_auto_variable ] [j] [line 301]
!24 = !{!"0x2e\00find\00find\00\00328\000\001\000\000\00256\001\00329", !1, !5, !25, null, void (i32)* @find, null, null, !27} ; [ DW_TAG_subprogram ] [line 328] [def] [scope 329] [find]
!25 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !26, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!26 = !{null, !8}
!27 = !{!28, !29, !30, !32, !33}
!28 = !{!"0x101\00level\0016777544\000", !24, !5, !8} ; [ DW_TAG_arg_variable ] [level] [line 328]
!29 = !{!"0x100\00f\00330\000", !24, !5, !8}      ; [ DW_TAG_auto_variable ] [f] [line 330]
!30 = !{!"0x100\00fp\00331\000", !24, !5, !31}    ; [ DW_TAG_auto_variable ] [fp] [line 331]
!31 = !{!"0xf\00\000\0064\0064\000\000", null, null, !8} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!32 = !{!"0x100\00fdp\00331\000", !24, !5, !31}   ; [ DW_TAG_auto_variable ] [fdp] [line 331]
!33 = !{!"0x100\00bdp\00331\000", !24, !5, !31}   ; [ DW_TAG_auto_variable ] [bdp] [line 331]
!34 = !{!"0x2e\00putchar\00putchar\00\0079\000\001\000\000\00256\001\0080", !35, !36, !37, null, i32 (i32)* @putchar, null, null, !39} ; [ DW_TAG_subprogram ] [line 79] [def] [scope 80] [putchar]
!35 = !{!"/usr/include/x86_64-linux-gnu/bits/stdio.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!36 = !{!"0x29", !35}                             ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base//usr/include/x86_64-linux-gnu/bits/stdio.h]
!37 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !38, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!38 = !{!8, !8}
!39 = !{!40}
!40 = !{!"0x101\00__c\0016777295\000", !34, !36, !8} ; [ DW_TAG_arg_variable ] [__c] [line 79]
!41 = !{!42, !43, !44, !46, !47, !48, !49, !50, !54, !55, !59}
!42 = !{!"0x34\00printing\00printing\00\00183\000\001", null, !5, !8, i32* @printing, null} ; [ DW_TAG_variable ] [printing] [line 183] [def]
!43 = !{!"0x34\00findall\00findall\00\00184\000\001", null, !5, !8, i32* @findall, null} ; [ DW_TAG_variable ] [findall] [line 184] [def]
!44 = !{!"0x34\00solutions\00solutions\00\00186\000\001", null, !5, !45, i64* @solutions, null} ; [ DW_TAG_variable ] [solutions] [line 186] [def]
!45 = !{!"0x24\00long unsigned int\000\0064\0064\000\000\007", null, null} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!46 = !{!"0x34\00progname\00progname\00\00191\000\001", null, !5, !10, i8** @progname, null} ; [ DW_TAG_variable ] [progname] [line 191] [def]
!47 = !{!"0x34\00queens\00queens\00\00180\000\001", null, !5, !8, i32* @queens, null} ; [ DW_TAG_variable ] [queens] [line 180] [def]
!48 = !{!"0x34\00ranks\00ranks\00\00181\000\001", null, !5, !8, i32* @ranks, null} ; [ DW_TAG_variable ] [ranks] [line 181] [def]
!49 = !{!"0x34\00files\00files\00\00182\000\001", null, !5, !8, i32* @files, null} ; [ DW_TAG_variable ] [files] [line 182] [def]
!50 = !{!"0x34\00queen\00queen\00\00187\000\001", null, !5, !51, [100 x i32]* @queen, null} ; [ DW_TAG_variable ] [queen] [line 187] [def]
!51 = !{!"0x1\00\000\003200\0032\000\000\000", null, null, !8, !52, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 3200, align 32, offset 0] [from int]
!52 = !{!53}
!53 = !{!"0x21\000\00100"}                        ; [ DW_TAG_subrange_type ] [0, 99]
!54 = !{!"0x34\00file\00file\00\00188\000\001", null, !5, !51, [100 x i32]* @file, null} ; [ DW_TAG_variable ] [file] [line 188] [def]
!55 = !{!"0x34\00fordiag\00fordiag\00\00189\000\001", null, !5, !56, [199 x i32]* @fordiag, null} ; [ DW_TAG_variable ] [fordiag] [line 189] [def]
!56 = !{!"0x1\00\000\006368\0032\000\000\000", null, null, !8, !57, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 6368, align 32, offset 0] [from int]
!57 = !{!58}
!58 = !{!"0x21\000\00199"}                        ; [ DW_TAG_subrange_type ] [0, 198]
!59 = !{!"0x34\00bakdiag\00bakdiag\00\00190\000\001", null, !5, !56, [199 x i32]* @bakdiag, null} ; [ DW_TAG_variable ] [bakdiag] [line 190] [def]
!60 = !{i32 2, !"Dwarf Version", i32 4}
!61 = !{i32 2, !"Debug Info Version", i32 2}
!62 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!63 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!64 = !MDLocation(line: 205, column: 14, scope: !4)
!65 = !MDLocation(line: 205, column: 27, scope: !4)
!66 = !MDLocation(line: 209, column: 10, scope: !4)
!67 = !MDLocation(line: 219, column: 15, scope: !4)
!68 = !{!69, !69, i64 0}
!69 = !{!"any pointer", !70, i64 0}
!70 = !{!"omnipotent char", !71, i64 0}
!71 = !{!"Simple C/C++ TBAA"}
!72 = !MDLocation(line: 219, column: 4, scope: !4)
!73 = !MDLocation(line: 222, column: 4, scope: !4)
!74 = !{!75, !75, i64 0}
!75 = !{!"int", !70, i64 0}
!76 = !MDLocation(line: 226, column: 4, scope: !4)
!77 = !MDLocation(line: 228, column: 4, scope: !4)
!78 = !MDLocation(line: 207, column: 18, scope: !4)
!79 = !MDLocation(line: 230, column: 15, scope: !80)
!80 = !{!"0xb\00230\004\001", !1, !81}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!81 = !{!"0xb\00230\004\000", !1, !4}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!82 = !MDLocation(line: 230, column: 4, scope: !81)
!83 = !MDLocation(line: 231, column: 11, scope: !84)
!84 = !{!"0xb\00230\0030\002", !1, !80}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!85 = !MDLocation(line: 208, column: 19, scope: !4)
!86 = !MDLocation(line: 232, column: 10, scope: !87)
!87 = !{!"0xb\00232\0010\003", !1, !84}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!88 = !{!70, !70, i64 0}
!89 = !MDLocation(line: 232, column: 10, scope: !84)
!90 = !MDLocation(line: 233, column: 17, scope: !91)
!91 = !{!"0xb\002", !1, !92}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!92 = !{!"0xb\001", !1, !93}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!93 = !{!"0xb\00232\0021\004", !1, !87}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!94 = !MDLocation(line: 233, column: 16, scope: !93)
!95 = !MDLocation(line: 233, column: 10, scope: !93)
!96 = !MDLocation(line: 234, column: 20, scope: !97)
!97 = !{!"0xb\00233\0022\005", !1, !93}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!98 = !MDLocation(line: 234, column: 13, scope: !97)
!99 = !MDLocation(line: 236, column: 19, scope: !100)
!100 = !{!"0xb\00234\0024\006", !1, !97}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!101 = !MDLocation(line: 238, column: 19, scope: !100)
!102 = !MDLocation(line: 241, column: 27, scope: !100)
!103 = !MDLocation(line: 241, column: 62, scope: !100)
!104 = !MDLocation(line: 241, column: 71, scope: !100)
!105 = !MDLocation(line: 241, column: 19, scope: !100)
!106 = !MDLocation(line: 242, column: 27, scope: !100)
!107 = !MDLocation(line: 242, column: 40, scope: !100)
!108 = !MDLocation(line: 242, column: 19, scope: !100)
!109 = !MDLocation(line: 243, column: 19, scope: !100)
!110 = !MDLocation(line: 248, column: 13, scope: !111)
!111 = !{!"0xb\00248\0013\008", !1, !112}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!112 = !{!"0xb\00247\0012\007", !1, !87}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!113 = !MDLocation(line: 248, column: 13, scope: !112)
!114 = !MDLocation(line: 249, column: 21, scope: !115)
!115 = !{!"0xb\00248\0042\009", !1, !111}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!116 = !MDLocation(line: 249, column: 62, scope: !115)
!117 = !MDLocation(line: 249, column: 13, scope: !115)
!118 = !MDLocation(line: 250, column: 13, scope: !115)
!119 = !MDLocation(line: 252, column: 13, scope: !120)
!120 = !{!"0xb\00252\0013\0010", !1, !112}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!121 = !MDLocation(line: 252, column: 13, scope: !112)
!122 = !MDLocation(line: 253, column: 21, scope: !123)
!123 = !{!"0xb\00252\0026\0011", !1, !120}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!124 = !MDLocation(line: 253, column: 63, scope: !123)
!125 = !MDLocation(line: 253, column: 13, scope: !123)
!126 = !MDLocation(line: 254, column: 13, scope: !123)
!127 = !MDLocation(line: 256, column: 13, scope: !128)
!128 = !{!"0xb\00256\0013\0012", !1, !112}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!129 = !MDLocation(line: 256, column: 13, scope: !112)
!130 = !MDLocation(line: 257, column: 21, scope: !131)
!131 = !{!"0xb\00256\0033\0013", !1, !128}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!132 = !MDLocation(line: 258, column: 16, scope: !131)
!133 = !MDLocation(line: 257, column: 13, scope: !131)
!134 = !MDLocation(line: 259, column: 13, scope: !131)
!135 = !MDLocation(line: 263, column: 8, scope: !136)
!136 = !{!"0xb\00263\007\0014", !1, !4}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!137 = !MDLocation(line: 263, column: 7, scope: !4)
!138 = !MDLocation(line: 264, column: 15, scope: !139)
!139 = !{!"0xb\00263\0016\0015", !1, !136}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!140 = !MDLocation(line: 264, column: 49, scope: !139)
!141 = !MDLocation(line: 264, column: 7, scope: !139)
!142 = !MDLocation(line: 265, column: 15, scope: !139)
!143 = !MDLocation(line: 265, column: 28, scope: !139)
!144 = !MDLocation(line: 265, column: 7, scope: !139)
!145 = !MDLocation(line: 266, column: 7, scope: !139)
!146 = !MDLocation(line: 269, column: 12, scope: !4)
!147 = !MDLocation(line: 269, column: 4, scope: !4)
!148 = !MDLocation(line: 271, column: 7, scope: !4)
!149 = !MDLocation(line: 271, column: 15, scope: !4)
!150 = !MDLocation(line: 270, column: 4, scope: !4)
!151 = !MDLocation(line: 272, column: 11, scope: !4)
!152 = !MDLocation(line: 272, column: 4, scope: !4)
!153 = !MDLocation(line: 275, column: 4, scope: !4)
!154 = !{!155, !155, i64 0}
!155 = !{!"long", !70, i64 0}
!156 = !MDLocation(line: 276, column: 4, scope: !157)
!157 = !{!"0xb\00276\004\0016", !1, !4}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!158 = !MDLocation(line: 276, column: 34, scope: !159)
!159 = !{!"0xb\00276\004\0017", !1, !157}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!160 = !MDLocation(line: 277, column: 47, scope: !161)
!161 = !{!"0xb\00277\004\0019", !1, !162}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!162 = !{!"0xb\00277\004\0018", !1, !4}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!163 = !MDLocation(line: 277, column: 34, scope: !161)
!164 = !MDLocation(line: 277, column: 4, scope: !162)
!165 = !MDLocation(line: 280, column: 4, scope: !4)
!166 = !MDLocation(line: 281, column: 7, scope: !167)
!167 = !{!"0xb\00281\007\0020", !1, !4}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!168 = !MDLocation(line: 281, column: 7, scope: !4)
!169 = !MDLocation(line: 281, column: 30, scope: !170)
!170 = !{!"0xb\002", !1, !167}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!171 = !MDLocation(line: 284, column: 7, scope: !172)
!172 = !{!"0xb\00284\007\0021", !1, !4}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!173 = !MDLocation(line: 284, column: 7, scope: !4)
!174 = !MDLocation(line: 284, column: 23, scope: !175)
!175 = !{!"0xb\001", !1, !172}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!176 = !MDLocation(line: 285, column: 9, scope: !172)
!177 = !MDLocation(line: 287, column: 4, scope: !4)
!178 = !MDLocation(line: 328, column: 24, scope: !24)
!179 = !MDLocation(line: 338, column: 16, scope: !180)
!180 = !{!"0xb\00338\007\0030", !1, !24}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!181 = !MDLocation(line: 338, column: 7, scope: !180)
!182 = !MDLocation(line: 338, column: 7, scope: !24)
!183 = !MDLocation(line: 339, column: 7, scope: !184)
!184 = !{!"0xb\00338\0024\0031", !1, !180}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!185 = !MDLocation(line: 340, column: 10, scope: !186)
!186 = !{!"0xb\00340\0010\0032", !1, !184}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!187 = !MDLocation(line: 340, column: 10, scope: !184)
!188 = !MDLocation(line: 340, column: 20, scope: !189)
!189 = !{!"0xb\001", !1, !186}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!190 = !MDLocation(line: 341, column: 11, scope: !191)
!191 = !{!"0xb\00341\0010\0033", !1, !184}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!192 = !MDLocation(line: 341, column: 10, scope: !184)
!193 = !MDLocation(line: 341, column: 20, scope: !194)
!194 = !{!"0xb\001", !1, !191}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!195 = !MDLocation(line: 330, column: 17, scope: !24)
!196 = !MDLocation(line: 331, column: 18, scope: !24)
!197 = !MDLocation(line: 350, column: 16, scope: !198)
!198 = !{!"0xb\00347\007\0035", !1, !199}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!199 = !{!"0xb\00346\009\0034", !1, !180}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!200 = !MDLocation(line: 331, column: 23, scope: !24)
!201 = !MDLocation(line: 331, column: 29, scope: !24)
!202 = !MDLocation(line: 353, column: 14, scope: !203)
!203 = !{!"0xb\00347\007\0036", !1, !198}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!204 = !MDLocation(line: 353, column: 10, scope: !203)
!205 = !MDLocation(line: 347, column: 7, scope: !198)
!206 = !MDLocation(line: 351, column: 25, scope: !198)
!207 = !MDLocation(line: 351, column: 31, scope: !198)
!208 = !MDLocation(line: 351, column: 16, scope: !198)
!209 = !MDLocation(line: 361, column: 13, scope: !210)
!210 = !{!"0xb\00360\005\0039", !1, !211}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!211 = !{!"0xb\00358\0013\0038", !1, !212}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!212 = !{!"0xb\00357\009\0037", !1, !203}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!213 = !MDLocation(line: 363, column: 18, scope: !210)
!214 = !MDLocation(line: 358, column: 13, scope: !211)
!215 = !MDLocation(line: 358, column: 13, scope: !212)
!216 = !MDLocation(line: 359, column: 13, scope: !211)
!217 = !MDLocation(line: 359, column: 30, scope: !211)
!218 = !MDLocation(line: 362, column: 26, scope: !210)
!219 = !MDLocation(line: 362, column: 19, scope: !210)
!220 = !MDLocation(line: 362, column: 13, scope: !210)
!221 = !MDLocation(line: 363, column: 13, scope: !210)
!222 = !MDLocation(line: 364, column: 26, scope: !210)
!223 = !MDLocation(line: 364, column: 19, scope: !210)
!224 = !MDLocation(line: 364, column: 13, scope: !210)
!225 = !MDLocation(line: 365, column: 10, scope: !210)
!226 = !MDLocation(line: 355, column: 10, scope: !203)
!227 = !MDLocation(line: 356, column: 10, scope: !203)
!228 = !MDLocation(line: 356, column: 16, scope: !203)
!229 = !MDLocation(line: 356, column: 23, scope: !203)
!230 = !MDLocation(line: 368, column: 1, scope: !24)
!231 = !MDLocation(line: 79, column: 14, scope: !34)
!232 = !MDLocation(line: 81, column: 25, scope: !34)
!233 = !MDLocation(line: 81, column: 10, scope: !34)
!234 = !MDLocation(line: 81, column: 3, scope: !34)
!235 = !MDLocation(line: 303, column: 7, scope: !236)
!236 = !{!"0xb\00303\007\0022", !1, !18}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!237 = !MDLocation(line: 303, column: 7, scope: !18)
!238 = !MDLocation(line: 304, column: 35, scope: !236)
!239 = !MDLocation(line: 304, column: 7, scope: !236)
!240 = !MDLocation(line: 306, column: 19, scope: !241)
!241 = !{!"0xb\00306\004\0024", !1, !242}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!242 = !{!"0xb\00306\004\0023", !1, !18}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!243 = !MDLocation(line: 306, column: 15, scope: !241)
!244 = !MDLocation(line: 306, column: 4, scope: !242)
!245 = !MDLocation(line: 307, column: 22, scope: !246)
!246 = !{!"0xb\00307\007\0027", !1, !247}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!247 = !{!"0xb\00307\007\0026", !1, !248}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!248 = !{!"0xb\00306\0031\0025", !1, !241}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!249 = !MDLocation(line: 307, column: 18, scope: !246)
!250 = !MDLocation(line: 307, column: 7, scope: !247)
!251 = !MDLocation(line: 309, column: 18, scope: !252)
!252 = !{!"0xb\00309\0013\0029", !1, !253}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!253 = !{!"0xb\00307\0034\0028", !1, !246}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!254 = !MDLocation(line: 308, column: 10, scope: !253)
!255 = !MDLocation(line: 309, column: 13, scope: !252)
!256 = !MDLocation(line: 309, column: 13, scope: !253)
!257 = !MDLocation(line: 309, column: 28, scope: !258)
!258 = !{!"0xb\001", !1, !252}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!259 = !MDLocation(line: 310, column: 15, scope: !252)
!260 = !MDLocation(line: 307, column: 29, scope: !246)
!261 = !MDLocation(line: 301, column: 20, scope: !18)
!262 = !MDLocation(line: 312, column: 7, scope: !248)
!263 = !MDLocation(line: 314, column: 11, scope: !18)
!264 = !MDLocation(line: 314, column: 4, scope: !18)
!265 = !MDLocation(line: 315, column: 1, scope: !18)
