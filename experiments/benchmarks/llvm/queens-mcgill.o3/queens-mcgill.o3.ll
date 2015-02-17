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
@.str11 = private unnamed_addr constant [28 x i8] c"...there are %ld solutions\0A\00", align 1
@.str12 = private unnamed_addr constant [17 x i8] c"\0ASolution #%lu:\0A\00", align 1
@queen = common global [100 x i32] zeroinitializer, align 16
@str = private unnamed_addr constant [23 x i8] c"...there is 1 solution\00"

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !13, metadata !63), !dbg !64
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !14, metadata !63), !dbg !65
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !17, metadata !63), !dbg !66
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
  %2 = phi i32 [ 14, %for.body.lr.ph ], [ %20, %for.inc ]
  %indvars.iv107 = phi i64 [ 1, %for.body.lr.ph ], [ %indvars.iv.next108, %for.inc ]
  %arrayidx1 = getelementptr inbounds i8** %argv, i64 %indvars.iv107, !dbg !83
  %3 = load i8** %arrayidx1, align 8, !dbg !83, !tbaa !68
  tail call void @llvm.dbg.value(metadata i8* %3, i64 0, metadata !16, metadata !63), !dbg !85
  %4 = load i8* %3, align 1, !dbg !86, !tbaa !88
  %cmp2 = icmp eq i8 %4, 45, !dbg !86
  br i1 %cmp2, label %while.cond.preheader, label %if.else, !dbg !89

while.cond.preheader:                             ; preds = %for.body
  %incdec.ptr91 = getelementptr inbounds i8* %3, i64 1, !dbg !90
  tail call void @llvm.dbg.value(metadata i8* %incdec.ptr91, i64 0, metadata !16, metadata !63), !dbg !85
  %5 = load i8* %incdec.ptr91, align 1, !dbg !94, !tbaa !88
  %tobool92 = icmp eq i8 %5, 0, !dbg !95
  br i1 %tobool92, label %for.inc, label %while.body.preheader, !dbg !95

while.body.preheader:                             ; preds = %while.cond.preheader
  br label %while.body, !dbg !96

while.body:                                       ; preds = %while.body.preheader, %sw.bb5
  %6 = phi i8 [ %8, %sw.bb5 ], [ %5, %while.body.preheader ]
  %7 = phi i8* [ %incdec.ptr93, %sw.bb5 ], [ %3, %while.body.preheader ]
  %incdec.ptr93 = phi i8* [ %incdec.ptr, %sw.bb5 ], [ %incdec.ptr91, %while.body.preheader ]
  %conv4 = sext i8 %6 to i32, !dbg !96
  switch i32 %conv4, label %sw.default [
    i32 99, label %sw.bb
    i32 97, label %sw.bb5
  ], !dbg !98

sw.bb:                                            ; preds = %while.body
  store i32 0, i32* @printing, align 4, !dbg !99, !tbaa !74
  br label %sw.bb5, !dbg !99

sw.bb5:                                           ; preds = %while.body, %sw.bb
  store i32 1, i32* @findall, align 4, !dbg !101, !tbaa !74
  %incdec.ptr = getelementptr inbounds i8* %7, i64 2, !dbg !90
  tail call void @llvm.dbg.value(metadata i8* %incdec.ptr, i64 0, metadata !16, metadata !63), !dbg !85
  %8 = load i8* %incdec.ptr, align 1, !dbg !94, !tbaa !88
  %tobool = icmp eq i8 %8, 0, !dbg !95
  br i1 %tobool, label %for.inc.loopexit, label %while.body, !dbg !95

sw.default:                                       ; preds = %while.body
  %.lcssa137 = phi i8* [ %3, %while.body ]
  %9 = load %struct._IO_FILE** @stderr, align 8, !dbg !102, !tbaa !68
  %10 = load i8** @progname, align 8, !dbg !103, !tbaa !68
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([25 x i8]* @.str1, i64 0, i64 0), i8* %10, i8* %.lcssa137) #6, !dbg !104
  %11 = load %struct._IO_FILE** @stderr, align 8, !dbg !105, !tbaa !68
  %12 = load i8** @progname, align 8, !dbg !106, !tbaa !68
  %call8 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([168 x i8]* @.str, i64 0, i64 0), i8* %12) #6, !dbg !107
  tail call void @exit(i32 -1) #7, !dbg !108
  unreachable, !dbg !108

if.else:                                          ; preds = %for.body
  %call9 = tail call i32 (i8*, i8*, ...)* @__isoc99_sscanf(i8* %3, i8* getelementptr inbounds ([3 x i8]* @.str2, i64 0, i64 0), i32* @queens) #5, !dbg !109
  %cmp10 = icmp eq i32 %call9, 1, !dbg !109
  br i1 %cmp10, label %if.end, label %if.then12, !dbg !112

if.then12:                                        ; preds = %if.else
  %.lcssa = phi i8* [ %3, %if.else ]
  %13 = load %struct._IO_FILE** @stderr, align 8, !dbg !113, !tbaa !68
  %14 = load i8** @progname, align 8, !dbg !115, !tbaa !68
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([31 x i8]* @.str3, i64 0, i64 0), i8* %14, i8* %.lcssa) #6, !dbg !116
  tail call void @exit(i32 -1) #7, !dbg !117
  unreachable, !dbg !117

if.end:                                           ; preds = %if.else
  %15 = load i32* @queens, align 4, !dbg !118, !tbaa !74
  %cmp14 = icmp slt i32 %15, 1, !dbg !118
  br i1 %cmp14, label %if.then16, label %if.end18, !dbg !120

if.then16:                                        ; preds = %if.end
  %16 = load %struct._IO_FILE** @stderr, align 8, !dbg !121, !tbaa !68
  %17 = load i8** @progname, align 8, !dbg !123, !tbaa !68
  %call17 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([32 x i8]* @.str4, i64 0, i64 0), i8* %17) #6, !dbg !124
  tail call void @exit(i32 -1) #7, !dbg !125
  unreachable, !dbg !125

if.end18:                                         ; preds = %if.end
  %cmp19 = icmp sgt i32 %15, 100, !dbg !126
  br i1 %cmp19, label %if.then21, label %for.inc, !dbg !128

if.then21:                                        ; preds = %if.end18
  %18 = load %struct._IO_FILE** @stderr, align 8, !dbg !129, !tbaa !68
  %19 = load i8** @progname, align 8, !dbg !131, !tbaa !68
  %call22 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([36 x i8]* @.str5, i64 0, i64 0), i8* %19, i32 100) #6, !dbg !132
  tail call void @exit(i32 -1) #7, !dbg !133
  unreachable, !dbg !133

for.inc.loopexit:                                 ; preds = %sw.bb5
  br label %for.inc

for.inc:                                          ; preds = %for.inc.loopexit, %while.cond.preheader, %if.end18
  %20 = phi i32 [ %15, %if.end18 ], [ %2, %while.cond.preheader ], [ %2, %for.inc.loopexit ]
  %indvars.iv.next108 = add nuw nsw i64 %indvars.iv107, 1, !dbg !82
  %cmp = icmp slt i64 %indvars.iv.next108, %1, !dbg !79
  br i1 %cmp, label %for.body, label %for.end, !dbg !82

for.end:                                          ; preds = %for.inc
  %.lcssa139 = phi i32 [ %20, %for.inc ]
  %tobool25 = icmp eq i32 %.lcssa139, 0, !dbg !134
  br i1 %tobool25, label %if.then26, label %if.end29, !dbg !134

if.then26:                                        ; preds = %for.end
  %21 = load %struct._IO_FILE** @stderr, align 8, !dbg !135, !tbaa !68
  %22 = load i8** @progname, align 8, !dbg !138, !tbaa !68
  %call27 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([24 x i8]* @.str6, i64 0, i64 0), i8* %22) #6, !dbg !139
  %23 = load %struct._IO_FILE** @stderr, align 8, !dbg !140, !tbaa !68
  %24 = load i8** @progname, align 8, !dbg !141, !tbaa !68
  %call28 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([168 x i8]* @.str, i64 0, i64 0), i8* %24) #6, !dbg !142
  tail call void @exit(i32 -1) #7, !dbg !143
  unreachable, !dbg !143

if.end29:                                         ; preds = %entry, %for.end
  %25 = phi i32 [ %.lcssa139, %for.end ], [ 14, %entry ]
  store i32 %25, i32* @files, align 4, !dbg !144, !tbaa !74
  store i32 %25, i32* @ranks, align 4, !dbg !145, !tbaa !74
  %cmp30 = icmp sgt i32 %25, 1, !dbg !146
  %cond = select i1 %cmp30, i8* getelementptr inbounds ([2 x i8]* @.str8, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8]* @.str9, i64 0, i64 0), !dbg !146
  %call32 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str7, i64 0, i64 0), i32 %25, i8* %cond, i32 %25, i32 %25) #5, !dbg !147
  %26 = load %struct._IO_FILE** @stdout, align 8, !dbg !148, !tbaa !68
  %call33 = tail call i32 @fflush(%struct._IO_FILE* %26) #5, !dbg !149
  store i64 0, i64* @solutions, align 8, !dbg !150, !tbaa !151
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !15, metadata !63), !dbg !78
  br label %vector.body

vector.body:                                      ; preds = %if.end29
  store <4 x i32> <i32 101, i32 101, i32 101, i32 101>, <4 x i32>* bitcast ([100 x i32]* @file to <4 x i32>*), align 16, !dbg !153, !tbaa !74
  store <4 x i32> <i32 101, i32 101, i32 101, i32 101>, <4 x i32>* bitcast (i32* getelementptr inbounds ([100 x i32]* @file, i64 0, i64 4) to <4 x i32>*), align 16, !dbg !153, !tbaa !74
  store <4 x i32> <i32 101, i32 101, i32 101, i32 101>, <4 x i32>* bitcast (i32* getelementptr inbounds ([100 x i32]* @file, i64 0, i64 8) to <4 x i32>*), align 16, !dbg !153, !tbaa !74
  store <4 x i32> <i32 101, i32 101, i32 101, i32 101>, <4 x i32>* bitcast (i32* getelementptr inbounds ([100 x i32]* @file, i64 0, i64 12) to <4 x i32>*), align 16, !dbg !153, !tbaa !74
  store <4 x i32> <i32 101, i32 101, i32 101, i32 101>, <4 x i32>* bitcast (i32* getelementptr inbounds ([100 x i32]* @file, i64 0, i64 16) to <4 x i32>*), align 16, !dbg !153, !tbaa !74
  store <4 x i32> <i32 101, i32 101, i32 101, i32 101>, <4 x i32>* bitcast (i32* getelementptr inbounds ([100 x i32]* @file, i64 0, i64 20) to <4 x i32>*), align 16, !dbg !153, !tbaa !74
  store <4 x i32> <i32 101, i32 101, i32 101, i32 101>, <4 x i32>* bitcast (i32* getelementptr inbounds ([100 x i32]* @file, i64 0, i64 24) to <4 x i32>*), align 16, !dbg !153, !tbaa !74
  store <4 x i32> <i32 101, i32 101, i32 101, i32 101>, <4 x i32>* bitcast (i32* getelementptr inbounds ([100 x i32]* @file, i64 0, i64 28) to <4 x i32>*), align 16, !dbg !153, !tbaa !74
  store <4 x i32> <i32 101, i32 101, i32 101, i32 101>, <4 x i32>* bitcast (i32* getelementptr inbounds ([100 x i32]* @file, i64 0, i64 32) to <4 x i32>*), align 16, !dbg !153, !tbaa !74
  store <4 x i32> <i32 101, i32 101, i32 101, i32 101>, <4 x i32>* bitcast (i32* getelementptr inbounds ([100 x i32]* @file, i64 0, i64 36) to <4 x i32>*), align 16, !dbg !153, !tbaa !74
  store <4 x i32> <i32 101, i32 101, i32 101, i32 101>, <4 x i32>* bitcast (i32* getelementptr inbounds ([100 x i32]* @file, i64 0, i64 40) to <4 x i32>*), align 16, !dbg !153, !tbaa !74
  store <4 x i32> <i32 101, i32 101, i32 101, i32 101>, <4 x i32>* bitcast (i32* getelementptr inbounds ([100 x i32]* @file, i64 0, i64 44) to <4 x i32>*), align 16, !dbg !153, !tbaa !74
  store <4 x i32> <i32 101, i32 101, i32 101, i32 101>, <4 x i32>* bitcast (i32* getelementptr inbounds ([100 x i32]* @file, i64 0, i64 48) to <4 x i32>*), align 16, !dbg !153, !tbaa !74
  store <4 x i32> <i32 101, i32 101, i32 101, i32 101>, <4 x i32>* bitcast (i32* getelementptr inbounds ([100 x i32]* @file, i64 0, i64 52) to <4 x i32>*), align 16, !dbg !153, !tbaa !74
  store <4 x i32> <i32 101, i32 101, i32 101, i32 101>, <4 x i32>* bitcast (i32* getelementptr inbounds ([100 x i32]* @file, i64 0, i64 56) to <4 x i32>*), align 16, !dbg !153, !tbaa !74
  store <4 x i32> <i32 101, i32 101, i32 101, i32 101>, <4 x i32>* bitcast (i32* getelementptr inbounds ([100 x i32]* @file, i64 0, i64 60) to <4 x i32>*), align 16, !dbg !153, !tbaa !74
  store <4 x i32> <i32 101, i32 101, i32 101, i32 101>, <4 x i32>* bitcast (i32* getelementptr inbounds ([100 x i32]* @file, i64 0, i64 64) to <4 x i32>*), align 16, !dbg !153, !tbaa !74
  store <4 x i32> <i32 101, i32 101, i32 101, i32 101>, <4 x i32>* bitcast (i32* getelementptr inbounds ([100 x i32]* @file, i64 0, i64 68) to <4 x i32>*), align 16, !dbg !153, !tbaa !74
  store <4 x i32> <i32 101, i32 101, i32 101, i32 101>, <4 x i32>* bitcast (i32* getelementptr inbounds ([100 x i32]* @file, i64 0, i64 72) to <4 x i32>*), align 16, !dbg !153, !tbaa !74
  store <4 x i32> <i32 101, i32 101, i32 101, i32 101>, <4 x i32>* bitcast (i32* getelementptr inbounds ([100 x i32]* @file, i64 0, i64 76) to <4 x i32>*), align 16, !dbg !153, !tbaa !74
  store <4 x i32> <i32 101, i32 101, i32 101, i32 101>, <4 x i32>* bitcast (i32* getelementptr inbounds ([100 x i32]* @file, i64 0, i64 80) to <4 x i32>*), align 16, !dbg !153, !tbaa !74
  store <4 x i32> <i32 101, i32 101, i32 101, i32 101>, <4 x i32>* bitcast (i32* getelementptr inbounds ([100 x i32]* @file, i64 0, i64 84) to <4 x i32>*), align 16, !dbg !153, !tbaa !74
  store <4 x i32> <i32 101, i32 101, i32 101, i32 101>, <4 x i32>* bitcast (i32* getelementptr inbounds ([100 x i32]* @file, i64 0, i64 88) to <4 x i32>*), align 16, !dbg !153, !tbaa !74
  store <4 x i32> <i32 101, i32 101, i32 101, i32 101>, <4 x i32>* bitcast (i32* getelementptr inbounds ([100 x i32]* @file, i64 0, i64 92) to <4 x i32>*), align 16, !dbg !153, !tbaa !74
  store <4 x i32> <i32 101, i32 101, i32 101, i32 101>, <4 x i32>* bitcast (i32* getelementptr inbounds ([100 x i32]* @file, i64 0, i64 96) to <4 x i32>*), align 16, !dbg !153, !tbaa !74
  br label %vector.body118, !dbg !156

vector.body118:                                   ; preds = %vector.body118, %vector.body
  %index121 = phi i64 [ 0, %vector.body ], [ %index.next128.1, %vector.body118 ], !dbg !159
  %27 = getelementptr inbounds [199 x i32]* @bakdiag, i64 0, i64 %index121, !dbg !156
  %28 = bitcast i32* %27 to <4 x i32>*, !dbg !156
  store <4 x i32> <i32 101, i32 101, i32 101, i32 101>, <4 x i32>* %28, align 16, !dbg !156, !tbaa !74
  %.sum133 = or i64 %index121, 4, !dbg !156
  %29 = getelementptr [199 x i32]* @bakdiag, i64 0, i64 %.sum133, !dbg !156
  %30 = bitcast i32* %29 to <4 x i32>*, !dbg !156
  store <4 x i32> <i32 101, i32 101, i32 101, i32 101>, <4 x i32>* %30, align 16, !dbg !156, !tbaa !74
  %31 = getelementptr inbounds [199 x i32]* @fordiag, i64 0, i64 %index121, !dbg !160
  %32 = bitcast i32* %31 to <4 x i32>*, !dbg !160
  store <4 x i32> <i32 101, i32 101, i32 101, i32 101>, <4 x i32>* %32, align 16, !dbg !160, !tbaa !74
  %.sum134 = or i64 %index121, 4, !dbg !160
  %33 = getelementptr [199 x i32]* @fordiag, i64 0, i64 %.sum134, !dbg !160
  %34 = bitcast i32* %33 to <4 x i32>*, !dbg !160
  store <4 x i32> <i32 101, i32 101, i32 101, i32 101>, <4 x i32>* %34, align 16, !dbg !160, !tbaa !74
  %index.next128 = add nuw nsw i64 %index121, 8, !dbg !159
  %35 = getelementptr inbounds [199 x i32]* @bakdiag, i64 0, i64 %index.next128, !dbg !156
  %36 = bitcast i32* %35 to <4 x i32>*, !dbg !156
  store <4 x i32> <i32 101, i32 101, i32 101, i32 101>, <4 x i32>* %36, align 16, !dbg !156, !tbaa !74
  %.sum133.1 = or i64 %index.next128, 4, !dbg !156
  %37 = getelementptr [199 x i32]* @bakdiag, i64 0, i64 %.sum133.1, !dbg !156
  %38 = bitcast i32* %37 to <4 x i32>*, !dbg !156
  store <4 x i32> <i32 101, i32 101, i32 101, i32 101>, <4 x i32>* %38, align 16, !dbg !156, !tbaa !74
  %39 = getelementptr inbounds [199 x i32]* @fordiag, i64 0, i64 %index.next128, !dbg !160
  %40 = bitcast i32* %39 to <4 x i32>*, !dbg !160
  store <4 x i32> <i32 101, i32 101, i32 101, i32 101>, <4 x i32>* %40, align 16, !dbg !160, !tbaa !74
  %.sum134.1 = or i64 %index.next128, 4, !dbg !160
  %41 = getelementptr [199 x i32]* @fordiag, i64 0, i64 %.sum134.1, !dbg !160
  %42 = bitcast i32* %41 to <4 x i32>*, !dbg !160
  store <4 x i32> <i32 101, i32 101, i32 101, i32 101>, <4 x i32>* %42, align 16, !dbg !160, !tbaa !74
  %index.next128.1 = add nuw nsw i64 %index.next128, 8, !dbg !159
  %43 = icmp eq i64 %index.next128.1, 192, !dbg !159
  br i1 %43, label %for.body46.preheader, label %vector.body118, !dbg !159, !llvm.loop !161

for.body46.preheader:                             ; preds = %vector.body118
  br label %for.body46, !dbg !156

for.body46:                                       ; preds = %for.body46.preheader
  store i32 101, i32* getelementptr inbounds ([199 x i32]* @bakdiag, i64 0, i64 192), align 4, !dbg !156, !tbaa !74
  store i32 101, i32* getelementptr inbounds ([199 x i32]* @fordiag, i64 0, i64 192), align 4, !dbg !160, !tbaa !74
  store i32 101, i32* getelementptr inbounds ([199 x i32]* @bakdiag, i64 0, i64 193), align 4, !dbg !156, !tbaa !74
  store i32 101, i32* getelementptr inbounds ([199 x i32]* @fordiag, i64 0, i64 193), align 4, !dbg !160, !tbaa !74
  store i32 101, i32* getelementptr inbounds ([199 x i32]* @bakdiag, i64 0, i64 194), align 4, !dbg !156, !tbaa !74
  store i32 101, i32* getelementptr inbounds ([199 x i32]* @fordiag, i64 0, i64 194), align 4, !dbg !160, !tbaa !74
  store i32 101, i32* getelementptr inbounds ([199 x i32]* @bakdiag, i64 0, i64 195), align 4, !dbg !156, !tbaa !74
  store i32 101, i32* getelementptr inbounds ([199 x i32]* @fordiag, i64 0, i64 195), align 4, !dbg !160, !tbaa !74
  store i32 101, i32* getelementptr inbounds ([199 x i32]* @bakdiag, i64 0, i64 196), align 4, !dbg !156, !tbaa !74
  store i32 101, i32* getelementptr inbounds ([199 x i32]* @fordiag, i64 0, i64 196), align 4, !dbg !160, !tbaa !74
  store i32 101, i32* getelementptr inbounds ([199 x i32]* @bakdiag, i64 0, i64 197), align 4, !dbg !156, !tbaa !74
  store i32 101, i32* getelementptr inbounds ([199 x i32]* @fordiag, i64 0, i64 197), align 4, !dbg !160, !tbaa !74
  store i32 101, i32* getelementptr inbounds ([199 x i32]* @bakdiag, i64 0, i64 198), align 4, !dbg !156, !tbaa !74
  store i32 101, i32* getelementptr inbounds ([199 x i32]* @fordiag, i64 0, i64 198), align 4, !dbg !160, !tbaa !74
  tail call void @find(i32 0), !dbg !164
  %44 = load i32* @printing, align 4, !dbg !165, !tbaa !74
  %tobool54 = icmp ne i32 %44, 0, !dbg !167
  %45 = load i64* @solutions, align 8
  %tobool55 = icmp ne i64 %45, 0, !dbg !167
  %or.cond = and i1 %tobool54, %tobool55, !dbg !167
  br i1 %or.cond, label %if.then56, label %if.end58, !dbg !167

if.then56:                                        ; preds = %for.body46
  tail call void @llvm.dbg.value(metadata i32 10, i64 0, metadata !168, metadata !63) #5, !dbg !171
  %46 = load %struct._IO_FILE** @stdout, align 8, !dbg !172, !tbaa !68
  %call.i = tail call i32 @_IO_putc(i32 10, %struct._IO_FILE* %46) #5, !dbg !173
  %.pr = load i64* @solutions, align 8, !dbg !174
  br label %if.end58, !dbg !169

if.end58:                                         ; preds = %if.then56, %for.body46
  %47 = phi i64 [ %.pr, %if.then56 ], [ %45, %for.body46 ], !dbg !174
  %cmp59 = icmp eq i64 %47, 1, !dbg !174
  br i1 %cmp59, label %if.then61, label %if.else63, !dbg !176

if.then61:                                        ; preds = %if.end58
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([23 x i8]* @str, i64 0, i64 0)), !dbg !177
  br label %if.end65, !dbg !177

if.else63:                                        ; preds = %if.end58
  %call64 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str11, i64 0, i64 0), i64 %47) #5, !dbg !179
  br label %if.end65

if.end65:                                         ; preds = %if.else63, %if.then61
  tail call void @exit(i32 0) #7, !dbg !180
  unreachable, !dbg !180
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
  tail call void @llvm.dbg.value(metadata i32 %level, i64 0, metadata !28, metadata !63), !dbg !181
  %0 = load i32* @queens, align 4, !dbg !182, !tbaa !74
  %cmp = icmp eq i32 %0, %level, !dbg !184
  br i1 %cmp, label %if.then, label %if.else, !dbg !185

if.then:                                          ; preds = %entry
  %1 = load i64* @solutions, align 8, !dbg !186, !tbaa !151
  %inc = add i64 %1, 1, !dbg !186
  store i64 %inc, i64* @solutions, align 8, !dbg !186, !tbaa !151
  %2 = load i32* @printing, align 4, !dbg !188, !tbaa !74
  %tobool = icmp eq i32 %2, 0, !dbg !190
  br i1 %tobool, label %if.end, label %if.then1, !dbg !190

if.then1:                                         ; preds = %if.then
  tail call void @pboard(), !dbg !191
  br label %if.end, !dbg !191

if.end:                                           ; preds = %if.then, %if.then1
  %3 = load i32* @findall, align 4, !dbg !193, !tbaa !74
  %tobool2 = icmp eq i32 %3, 0, !dbg !195
  br i1 %tobool2, label %if.then3, label %if.end20, !dbg !195

if.then3:                                         ; preds = %if.end
  tail call void @exit(i32 0) #7, !dbg !196
  unreachable, !dbg !196

if.else:                                          ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !29, metadata !63), !dbg !198
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !30, metadata !63), !dbg !199
  %idxprom = sext i32 %level to i64, !dbg !200
  tail call void @llvm.dbg.value(metadata i32* %arrayidx, i64 0, metadata !32, metadata !63), !dbg !203
  tail call void @llvm.dbg.value(metadata i32* %arrayidx6, i64 0, metadata !33, metadata !63), !dbg !204
  %4 = load i32* @files, align 4, !dbg !205, !tbaa !74
  %cmp740 = icmp sgt i32 %4, 0, !dbg !207
  br i1 %cmp740, label %for.body.lr.ph, label %if.end20, !dbg !208

for.body.lr.ph:                                   ; preds = %if.else
  %add = add i32 %level, -1, !dbg !209
  %sub = add i32 %add, %4, !dbg !209
  %idxprom5 = sext i32 %sub to i64, !dbg !210
  %arrayidx6 = getelementptr inbounds [199 x i32]* @bakdiag, i64 0, i64 %idxprom5, !dbg !210
  %arrayidx = getelementptr inbounds [199 x i32]* @fordiag, i64 0, i64 %idxprom, !dbg !200
  %arrayidx14 = getelementptr inbounds [100 x i32]* @queen, i64 0, i64 %idxprom, !dbg !211
  %add15 = add nsw i32 %level, 1, !dbg !215
  br label %for.body, !dbg !208

for.body:                                         ; preds = %for.body.lr.ph, %for.inc
  %5 = phi i32 [ %4, %for.body.lr.ph ], [ %9, %for.inc ]
  %bdp.044 = phi i32* [ %arrayidx6, %for.body.lr.ph ], [ %incdec.ptr19, %for.inc ]
  %fdp.043 = phi i32* [ %arrayidx, %for.body.lr.ph ], [ %incdec.ptr18, %for.inc ]
  %fp.042 = phi i32* [ getelementptr inbounds ([100 x i32]* @file, i64 0, i64 0), %for.body.lr.ph ], [ %incdec.ptr, %for.inc ]
  %f.041 = phi i32 [ 0, %for.body.lr.ph ], [ %inc17, %for.inc ]
  %6 = load i32* %fp.042, align 4, !dbg !216, !tbaa !74
  %cmp8 = icmp slt i32 %6, %level, !dbg !216
  br i1 %cmp8, label %for.inc, label %land.lhs.true, !dbg !217

land.lhs.true:                                    ; preds = %for.body
  %7 = load i32* %fdp.043, align 4, !dbg !218, !tbaa !74
  %cmp9 = icmp slt i32 %7, %level, !dbg !218
  br i1 %cmp9, label %for.inc, label %land.lhs.true10, !dbg !217

land.lhs.true10:                                  ; preds = %land.lhs.true
  %8 = load i32* %bdp.044, align 4, !dbg !219, !tbaa !74
  %cmp11 = icmp slt i32 %8, %level, !dbg !219
  br i1 %cmp11, label %for.inc, label %if.then12, !dbg !217

if.then12:                                        ; preds = %land.lhs.true10
  store i32 %f.041, i32* %arrayidx14, align 4, !dbg !211, !tbaa !74
  store i32 %level, i32* %bdp.044, align 4, !dbg !220, !tbaa !74
  store i32 %level, i32* %fdp.043, align 4, !dbg !221, !tbaa !74
  store i32 %level, i32* %fp.042, align 4, !dbg !222, !tbaa !74
  tail call void @find(i32 %add15), !dbg !223
  store i32 101, i32* %bdp.044, align 4, !dbg !224, !tbaa !74
  store i32 101, i32* %fdp.043, align 4, !dbg !225, !tbaa !74
  store i32 101, i32* %fp.042, align 4, !dbg !226, !tbaa !74
  %.pre = load i32* @files, align 4, !dbg !205, !tbaa !74
  br label %for.inc, !dbg !227

for.inc:                                          ; preds = %land.lhs.true10, %land.lhs.true, %for.body, %if.then12
  %9 = phi i32 [ %5, %land.lhs.true10 ], [ %5, %land.lhs.true ], [ %5, %for.body ], [ %.pre, %if.then12 ], !dbg !228
  %inc17 = add nuw nsw i32 %f.041, 1, !dbg !228
  tail call void @llvm.dbg.value(metadata i32 %inc17, i64 0, metadata !29, metadata !63), !dbg !198
  %incdec.ptr = getelementptr inbounds i32* %fp.042, i64 1, !dbg !229
  tail call void @llvm.dbg.value(metadata i32* %incdec.ptr, i64 0, metadata !30, metadata !63), !dbg !199
  %incdec.ptr18 = getelementptr inbounds i32* %fdp.043, i64 1, !dbg !230
  tail call void @llvm.dbg.value(metadata i32* %incdec.ptr18, i64 0, metadata !32, metadata !63), !dbg !203
  %incdec.ptr19 = getelementptr inbounds i32* %bdp.044, i64 -1, !dbg !231
  tail call void @llvm.dbg.value(metadata i32* %incdec.ptr19, i64 0, metadata !33, metadata !63), !dbg !204
  %cmp7 = icmp slt i32 %inc17, %9, !dbg !207
  br i1 %cmp7, label %for.body, label %if.end20.loopexit, !dbg !208

if.end20.loopexit:                                ; preds = %for.inc
  br label %if.end20

if.end20:                                         ; preds = %if.end20.loopexit, %if.else, %if.end
  ret void, !dbg !232
}

; Function Attrs: nounwind uwtable
define void @pboard() #3 {
entry:
  %0 = load i32* @findall, align 4, !dbg !233, !tbaa !74
  %tobool = icmp eq i32 %0, 0, !dbg !235
  br i1 %tobool, label %for.cond.preheader, label %if.then, !dbg !235

if.then:                                          ; preds = %entry
  %1 = load i64* @solutions, align 8, !dbg !236, !tbaa !151
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str12, i64 0, i64 0), i64 %1) #5, !dbg !237
  br label %for.cond.preheader, !dbg !237

for.cond.preheader:                               ; preds = %entry, %if.then
  %2 = load i32* @ranks, align 4, !dbg !238, !tbaa !74
  %cmp24 = icmp sgt i32 %2, 0, !dbg !241
  br i1 %cmp24, label %for.cond1.preheader.preheader, label %for.end13, !dbg !242

for.cond1.preheader.preheader:                    ; preds = %for.cond.preheader
  br label %for.cond1.preheader, !dbg !243

for.cond1.preheader:                              ; preds = %for.cond1.preheader.preheader, %for.end
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.end ], [ 0, %for.cond1.preheader.preheader ]
  %3 = load i32* @files, align 4, !dbg !243, !tbaa !74
  %cmp222 = icmp sgt i32 %3, 0, !dbg !247
  %4 = load %struct._IO_FILE** @stdout, align 8, !dbg !248, !tbaa !68
  br i1 %cmp222, label %for.body3.lr.ph, label %for.end, !dbg !251

for.body3.lr.ph:                                  ; preds = %for.cond1.preheader
  %arrayidx = getelementptr inbounds [100 x i32]* @queen, i64 0, i64 %indvars.iv, !dbg !252
  br label %for.body3, !dbg !251

for.body3:                                        ; preds = %for.body3.lr.ph, %for.inc
  %5 = phi %struct._IO_FILE* [ %4, %for.body3.lr.ph ], [ %9, %for.inc ]
  %j.023 = phi i32 [ 0, %for.body3.lr.ph ], [ %inc, %for.inc ]
  tail call void @llvm.dbg.value(metadata i32 32, i64 0, metadata !254, metadata !63) #5, !dbg !255
  %call.i = tail call i32 @_IO_putc(i32 32, %struct._IO_FILE* %5) #5, !dbg !256
  %6 = load i32* %arrayidx, align 4, !dbg !252, !tbaa !74
  %cmp5 = icmp eq i32 %j.023, %6, !dbg !257
  %7 = load %struct._IO_FILE** @stdout, align 8, !dbg !258, !tbaa !68
  br i1 %cmp5, label %if.then6, label %if.else, !dbg !261

if.then6:                                         ; preds = %for.body3
  tail call void @llvm.dbg.value(metadata i32 81, i64 0, metadata !262, metadata !63) #5, !dbg !263
  %call.i19 = tail call i32 @_IO_putc(i32 81, %struct._IO_FILE* %7) #5, !dbg !264
  br label %for.inc, !dbg !259

if.else:                                          ; preds = %for.body3
  tail call void @llvm.dbg.value(metadata i32 45, i64 0, metadata !265, metadata !63) #5, !dbg !267
  %call.i20 = tail call i32 @_IO_putc(i32 45, %struct._IO_FILE* %7) #5, !dbg !268
  br label %for.inc

for.inc:                                          ; preds = %if.then6, %if.else
  %inc = add nuw nsw i32 %j.023, 1, !dbg !269
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !23, metadata !63), !dbg !270
  %8 = load i32* @files, align 4, !dbg !243, !tbaa !74
  %cmp2 = icmp slt i32 %inc, %8, !dbg !247
  %9 = load %struct._IO_FILE** @stdout, align 8, !dbg !248, !tbaa !68
  br i1 %cmp2, label %for.body3, label %for.end.loopexit, !dbg !251

for.end.loopexit:                                 ; preds = %for.inc
  %.lcssa28 = phi %struct._IO_FILE* [ %9, %for.inc ]
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.cond1.preheader
  %.lcssa = phi %struct._IO_FILE* [ %4, %for.cond1.preheader ], [ %.lcssa28, %for.end.loopexit ]
  tail call void @llvm.dbg.value(metadata i32 10, i64 0, metadata !271, metadata !63) #5, !dbg !273
  %call.i21 = tail call i32 @_IO_putc(i32 10, %struct._IO_FILE* %.lcssa) #5, !dbg !274
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !242
  %10 = load i32* @ranks, align 4, !dbg !238, !tbaa !74
  %11 = sext i32 %10 to i64, !dbg !241
  %cmp = icmp slt i64 %indvars.iv.next, %11, !dbg !241
  br i1 %cmp, label %for.cond1.preheader, label %for.end13.loopexit, !dbg !242

for.end13.loopexit:                               ; preds = %for.end
  br label %for.end13

for.end13:                                        ; preds = %for.end13.loopexit, %for.cond.preheader
  %12 = load %struct._IO_FILE** @stdout, align 8, !dbg !275, !tbaa !68
  %call14 = tail call i32 @fflush(%struct._IO_FILE* %12) #5, !dbg !276
  ret void, !dbg !277
}

; Function Attrs: nounwind
declare i32 @_IO_putc(i32, %struct._IO_FILE* nocapture) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #4

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #5

attributes #0 = { noreturn nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
attributes #5 = { nounwind }
attributes #6 = { cold nounwind }
attributes #7 = { noreturn nounwind }

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
!34 = !{!"0x2e\00putchar\00putchar\00\0079\000\001\000\000\00256\001\0080", !35, !36, !37, null, null, null, null, !39} ; [ DW_TAG_subprogram ] [line 79] [def] [scope 80] [putchar]
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
!104 = !MDLocation(line: 241, column: 19, scope: !100)
!105 = !MDLocation(line: 242, column: 27, scope: !100)
!106 = !MDLocation(line: 242, column: 40, scope: !100)
!107 = !MDLocation(line: 242, column: 19, scope: !100)
!108 = !MDLocation(line: 243, column: 19, scope: !100)
!109 = !MDLocation(line: 248, column: 13, scope: !110)
!110 = !{!"0xb\00248\0013\008", !1, !111}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!111 = !{!"0xb\00247\0012\007", !1, !87}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!112 = !MDLocation(line: 248, column: 13, scope: !111)
!113 = !MDLocation(line: 249, column: 21, scope: !114)
!114 = !{!"0xb\00248\0042\009", !1, !110}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!115 = !MDLocation(line: 249, column: 62, scope: !114)
!116 = !MDLocation(line: 249, column: 13, scope: !114)
!117 = !MDLocation(line: 250, column: 13, scope: !114)
!118 = !MDLocation(line: 252, column: 13, scope: !119)
!119 = !{!"0xb\00252\0013\0010", !1, !111}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!120 = !MDLocation(line: 252, column: 13, scope: !111)
!121 = !MDLocation(line: 253, column: 21, scope: !122)
!122 = !{!"0xb\00252\0026\0011", !1, !119}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!123 = !MDLocation(line: 253, column: 63, scope: !122)
!124 = !MDLocation(line: 253, column: 13, scope: !122)
!125 = !MDLocation(line: 254, column: 13, scope: !122)
!126 = !MDLocation(line: 256, column: 13, scope: !127)
!127 = !{!"0xb\00256\0013\0012", !1, !111}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!128 = !MDLocation(line: 256, column: 13, scope: !111)
!129 = !MDLocation(line: 257, column: 21, scope: !130)
!130 = !{!"0xb\00256\0033\0013", !1, !127}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!131 = !MDLocation(line: 258, column: 16, scope: !130)
!132 = !MDLocation(line: 257, column: 13, scope: !130)
!133 = !MDLocation(line: 259, column: 13, scope: !130)
!134 = !MDLocation(line: 263, column: 7, scope: !4)
!135 = !MDLocation(line: 264, column: 15, scope: !136)
!136 = !{!"0xb\00263\0016\0015", !1, !137}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!137 = !{!"0xb\00263\007\0014", !1, !4}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!138 = !MDLocation(line: 264, column: 49, scope: !136)
!139 = !MDLocation(line: 264, column: 7, scope: !136)
!140 = !MDLocation(line: 265, column: 15, scope: !136)
!141 = !MDLocation(line: 265, column: 28, scope: !136)
!142 = !MDLocation(line: 265, column: 7, scope: !136)
!143 = !MDLocation(line: 266, column: 7, scope: !136)
!144 = !MDLocation(line: 269, column: 12, scope: !4)
!145 = !MDLocation(line: 269, column: 4, scope: !4)
!146 = !MDLocation(line: 271, column: 15, scope: !4)
!147 = !MDLocation(line: 270, column: 4, scope: !4)
!148 = !MDLocation(line: 272, column: 11, scope: !4)
!149 = !MDLocation(line: 272, column: 4, scope: !4)
!150 = !MDLocation(line: 275, column: 4, scope: !4)
!151 = !{!152, !152, i64 0}
!152 = !{!"long", !70, i64 0}
!153 = !MDLocation(line: 276, column: 34, scope: !154)
!154 = !{!"0xb\00276\004\0017", !1, !155}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!155 = !{!"0xb\00276\004\0016", !1, !4}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!156 = !MDLocation(line: 277, column: 47, scope: !157)
!157 = !{!"0xb\00277\004\0019", !1, !158}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!158 = !{!"0xb\00277\004\0018", !1, !4}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!159 = !MDLocation(line: 277, column: 4, scope: !158)
!160 = !MDLocation(line: 277, column: 34, scope: !157)
!161 = distinct !{!161, !162, !163}
!162 = !{!"llvm.loop.vectorize.width", i32 1}
!163 = !{!"llvm.loop.interleave.count", i32 1}
!164 = !MDLocation(line: 280, column: 4, scope: !4)
!165 = !MDLocation(line: 281, column: 7, scope: !166)
!166 = !{!"0xb\00281\007\0020", !1, !4}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!167 = !MDLocation(line: 281, column: 7, scope: !4)
!168 = !{!"0x101\00__c\0016777295\000", !34, !36, !8, !169} ; [ DW_TAG_arg_variable ] [__c] [line 79]
!169 = !MDLocation(line: 281, column: 30, scope: !170)
!170 = !{!"0xb\002", !1, !166}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!171 = !MDLocation(line: 79, column: 14, scope: !34, inlinedAt: !169)
!172 = !MDLocation(line: 81, column: 25, scope: !34, inlinedAt: !169)
!173 = !MDLocation(line: 81, column: 10, scope: !34, inlinedAt: !169)
!174 = !MDLocation(line: 284, column: 7, scope: !175)
!175 = !{!"0xb\00284\007\0021", !1, !4}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!176 = !MDLocation(line: 284, column: 7, scope: !4)
!177 = !MDLocation(line: 284, column: 23, scope: !178)
!178 = !{!"0xb\001", !1, !175}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!179 = !MDLocation(line: 285, column: 9, scope: !175)
!180 = !MDLocation(line: 287, column: 4, scope: !4)
!181 = !MDLocation(line: 328, column: 24, scope: !24)
!182 = !MDLocation(line: 338, column: 16, scope: !183)
!183 = !{!"0xb\00338\007\0030", !1, !24}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!184 = !MDLocation(line: 338, column: 7, scope: !183)
!185 = !MDLocation(line: 338, column: 7, scope: !24)
!186 = !MDLocation(line: 339, column: 7, scope: !187)
!187 = !{!"0xb\00338\0024\0031", !1, !183}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!188 = !MDLocation(line: 340, column: 10, scope: !189)
!189 = !{!"0xb\00340\0010\0032", !1, !187}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!190 = !MDLocation(line: 340, column: 10, scope: !187)
!191 = !MDLocation(line: 340, column: 20, scope: !192)
!192 = !{!"0xb\001", !1, !189}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!193 = !MDLocation(line: 341, column: 11, scope: !194)
!194 = !{!"0xb\00341\0010\0033", !1, !187}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!195 = !MDLocation(line: 341, column: 10, scope: !187)
!196 = !MDLocation(line: 341, column: 20, scope: !197)
!197 = !{!"0xb\001", !1, !194}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!198 = !MDLocation(line: 330, column: 17, scope: !24)
!199 = !MDLocation(line: 331, column: 18, scope: !24)
!200 = !MDLocation(line: 350, column: 16, scope: !201)
!201 = !{!"0xb\00347\007\0035", !1, !202}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!202 = !{!"0xb\00346\009\0034", !1, !183}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!203 = !MDLocation(line: 331, column: 23, scope: !24)
!204 = !MDLocation(line: 331, column: 29, scope: !24)
!205 = !MDLocation(line: 353, column: 14, scope: !206)
!206 = !{!"0xb\00347\007\0036", !1, !201}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!207 = !MDLocation(line: 353, column: 10, scope: !206)
!208 = !MDLocation(line: 347, column: 7, scope: !201)
!209 = !MDLocation(line: 351, column: 25, scope: !201)
!210 = !MDLocation(line: 351, column: 16, scope: !201)
!211 = !MDLocation(line: 361, column: 13, scope: !212)
!212 = !{!"0xb\00360\005\0039", !1, !213}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!213 = !{!"0xb\00358\0013\0038", !1, !214}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!214 = !{!"0xb\00357\009\0037", !1, !206}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!215 = !MDLocation(line: 363, column: 18, scope: !212)
!216 = !MDLocation(line: 358, column: 13, scope: !213)
!217 = !MDLocation(line: 358, column: 13, scope: !214)
!218 = !MDLocation(line: 359, column: 13, scope: !213)
!219 = !MDLocation(line: 359, column: 30, scope: !213)
!220 = !MDLocation(line: 362, column: 26, scope: !212)
!221 = !MDLocation(line: 362, column: 19, scope: !212)
!222 = !MDLocation(line: 362, column: 13, scope: !212)
!223 = !MDLocation(line: 363, column: 13, scope: !212)
!224 = !MDLocation(line: 364, column: 26, scope: !212)
!225 = !MDLocation(line: 364, column: 19, scope: !212)
!226 = !MDLocation(line: 364, column: 13, scope: !212)
!227 = !MDLocation(line: 365, column: 10, scope: !212)
!228 = !MDLocation(line: 355, column: 10, scope: !206)
!229 = !MDLocation(line: 356, column: 10, scope: !206)
!230 = !MDLocation(line: 356, column: 16, scope: !206)
!231 = !MDLocation(line: 356, column: 23, scope: !206)
!232 = !MDLocation(line: 368, column: 1, scope: !24)
!233 = !MDLocation(line: 303, column: 7, scope: !234)
!234 = !{!"0xb\00303\007\0022", !1, !18}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!235 = !MDLocation(line: 303, column: 7, scope: !18)
!236 = !MDLocation(line: 304, column: 35, scope: !234)
!237 = !MDLocation(line: 304, column: 7, scope: !234)
!238 = !MDLocation(line: 306, column: 19, scope: !239)
!239 = !{!"0xb\00306\004\0024", !1, !240}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!240 = !{!"0xb\00306\004\0023", !1, !18}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!241 = !MDLocation(line: 306, column: 15, scope: !239)
!242 = !MDLocation(line: 306, column: 4, scope: !240)
!243 = !MDLocation(line: 307, column: 22, scope: !244)
!244 = !{!"0xb\00307\007\0027", !1, !245}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!245 = !{!"0xb\00307\007\0026", !1, !246}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!246 = !{!"0xb\00306\0031\0025", !1, !239}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!247 = !MDLocation(line: 307, column: 18, scope: !244)
!248 = !MDLocation(line: 81, column: 25, scope: !34, inlinedAt: !249)
!249 = !MDLocation(line: 308, column: 10, scope: !250)
!250 = !{!"0xb\00307\0034\0028", !1, !244}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!251 = !MDLocation(line: 307, column: 7, scope: !245)
!252 = !MDLocation(line: 309, column: 18, scope: !253)
!253 = !{!"0xb\00309\0013\0029", !1, !250}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!254 = !{!"0x101\00__c\0016777295\000", !34, !36, !8, !249} ; [ DW_TAG_arg_variable ] [__c] [line 79]
!255 = !MDLocation(line: 79, column: 14, scope: !34, inlinedAt: !249)
!256 = !MDLocation(line: 81, column: 10, scope: !34, inlinedAt: !249)
!257 = !MDLocation(line: 309, column: 13, scope: !253)
!258 = !MDLocation(line: 81, column: 25, scope: !34, inlinedAt: !259)
!259 = !MDLocation(line: 309, column: 28, scope: !260)
!260 = !{!"0xb\001", !1, !253}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens-mcgill.c]
!261 = !MDLocation(line: 309, column: 13, scope: !250)
!262 = !{!"0x101\00__c\0016777295\000", !34, !36, !8, !259} ; [ DW_TAG_arg_variable ] [__c] [line 79]
!263 = !MDLocation(line: 79, column: 14, scope: !34, inlinedAt: !259)
!264 = !MDLocation(line: 81, column: 10, scope: !34, inlinedAt: !259)
!265 = !{!"0x101\00__c\0016777295\000", !34, !36, !8, !266} ; [ DW_TAG_arg_variable ] [__c] [line 79]
!266 = !MDLocation(line: 310, column: 15, scope: !253)
!267 = !MDLocation(line: 79, column: 14, scope: !34, inlinedAt: !266)
!268 = !MDLocation(line: 81, column: 10, scope: !34, inlinedAt: !266)
!269 = !MDLocation(line: 307, column: 29, scope: !244)
!270 = !MDLocation(line: 301, column: 20, scope: !18)
!271 = !{!"0x101\00__c\0016777295\000", !34, !36, !8, !272} ; [ DW_TAG_arg_variable ] [__c] [line 79]
!272 = !MDLocation(line: 312, column: 7, scope: !246)
!273 = !MDLocation(line: 79, column: 14, scope: !34, inlinedAt: !272)
!274 = !MDLocation(line: 81, column: 10, scope: !34, inlinedAt: !272)
!275 = !MDLocation(line: 314, column: 11, scope: !18)
!276 = !MDLocation(line: 314, column: 4, scope: !18)
!277 = !MDLocation(line: 315, column: 1, scope: !18)
