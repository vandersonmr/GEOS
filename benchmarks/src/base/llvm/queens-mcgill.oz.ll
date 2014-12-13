; ModuleID = 'queens-mcgill.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

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

; Function Attrs: minsize noreturn nounwind optsize uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !13), !dbg !56
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !14), !dbg !56
  tail call void @llvm.dbg.value(metadata !57, i64 0, metadata !17), !dbg !58
  %1 = load i8** %argv, align 8, !dbg !59, !tbaa !60
  store i8* %1, i8** @progname, align 8, !dbg !59, !tbaa !60
  store i32 0, i32* @printing, align 4, !dbg !64, !tbaa !65
  store i32 14, i32* @queens, align 4, !dbg !67, !tbaa !65
  store i32 1, i32* @findall, align 4, !dbg !68, !tbaa !65
  tail call void @llvm.dbg.value(metadata !69, i64 0, metadata !15), !dbg !70
  %2 = icmp sgt i32 %argc, 1, !dbg !70
  br i1 %2, label %.lr.ph12, label %._crit_edge.thread, !dbg !70

.lr.ph12:                                         ; preds = %0, %.loopexit
  %3 = phi i32 [ %46, %.loopexit ], [ 14, %0 ]
  %indvars.iv24 = phi i64 [ %indvars.iv.next25, %.loopexit ], [ 1, %0 ]
  %4 = getelementptr inbounds i8** %argv, i64 %indvars.iv24, !dbg !72
  %5 = load i8** %4, align 8, !dbg !72, !tbaa !60
  tail call void @llvm.dbg.value(metadata !{i8* %5}, i64 0, metadata !16), !dbg !72
  %6 = load i8* %5, align 1, !dbg !74, !tbaa !76
  %7 = icmp eq i8 %6, 45, !dbg !74
  br i1 %7, label %.preheader2, label %26, !dbg !74

.preheader2:                                      ; preds = %.lr.ph12
  %8 = getelementptr inbounds i8* %5, i64 1, !dbg !77
  tail call void @llvm.dbg.value(metadata !{i8* %8}, i64 0, metadata !16), !dbg !77
  %9 = load i8* %8, align 1, !dbg !77, !tbaa !76
  %10 = icmp eq i8 %9, 0, !dbg !77
  br i1 %10, label %.loopexit, label %.lr.ph, !dbg !77

.lr.ph:                                           ; preds = %.preheader2, %15
  %11 = phi i8 [ %17, %15 ], [ %9, %.preheader2 ]
  %12 = phi i8* [ %16, %15 ], [ %8, %.preheader2 ]
  %13 = sext i8 %11 to i32, !dbg !79
  switch i32 %13, label %19 [
    i32 99, label %14
    i32 97, label %15
  ], !dbg !79

; <label>:14                                      ; preds = %.lr.ph
  store i32 0, i32* @printing, align 4, !dbg !81, !tbaa !65
  br label %15, !dbg !81

; <label>:15                                      ; preds = %.lr.ph, %14
  store i32 1, i32* @findall, align 4, !dbg !83, !tbaa !65
  %16 = getelementptr inbounds i8* %12, i64 1, !dbg !77
  tail call void @llvm.dbg.value(metadata !{i8* %12}, i64 0, metadata !16), !dbg !77
  %17 = load i8* %16, align 1, !dbg !77, !tbaa !76
  %18 = icmp eq i8 %17, 0, !dbg !77
  br i1 %18, label %.loopexit, label %.lr.ph, !dbg !77

; <label>:19                                      ; preds = %.lr.ph
  %20 = load %struct._IO_FILE** @stderr, align 8, !dbg !84, !tbaa !60
  %21 = load i8** @progname, align 8, !dbg !84, !tbaa !60
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([25 x i8]* @.str1, i64 0, i64 0), i8* %21, i8* %5) #6, !dbg !84
  %23 = load %struct._IO_FILE** @stderr, align 8, !dbg !85, !tbaa !60
  %24 = load i8** @progname, align 8, !dbg !85, !tbaa !60
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([168 x i8]* @.str, i64 0, i64 0), i8* %24) #6, !dbg !85
  tail call void @exit(i32 -1) #7, !dbg !86
  unreachable, !dbg !86

; <label>:26                                      ; preds = %.lr.ph12
  %27 = tail call i32 (i8*, i8*, ...)* @__isoc99_sscanf(i8* %5, i8* getelementptr inbounds ([3 x i8]* @.str2, i64 0, i64 0), i32* @queens) #8, !dbg !87
  %28 = icmp eq i32 %27, 1, !dbg !87
  br i1 %28, label %33, label %29, !dbg !87

; <label>:29                                      ; preds = %26
  %30 = load %struct._IO_FILE** @stderr, align 8, !dbg !90, !tbaa !60
  %31 = load i8** @progname, align 8, !dbg !90, !tbaa !60
  %32 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %30, i8* getelementptr inbounds ([31 x i8]* @.str3, i64 0, i64 0), i8* %31, i8* %5) #6, !dbg !90
  tail call void @exit(i32 -1) #7, !dbg !92
  unreachable, !dbg !92

; <label>:33                                      ; preds = %26
  %34 = load i32* @queens, align 4, !dbg !93, !tbaa !65
  %35 = icmp slt i32 %34, 1, !dbg !93
  br i1 %35, label %36, label %40, !dbg !93

; <label>:36                                      ; preds = %33
  %37 = load %struct._IO_FILE** @stderr, align 8, !dbg !95, !tbaa !60
  %38 = load i8** @progname, align 8, !dbg !95, !tbaa !60
  %39 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([32 x i8]* @.str4, i64 0, i64 0), i8* %38) #6, !dbg !95
  tail call void @exit(i32 -1) #7, !dbg !97
  unreachable, !dbg !97

; <label>:40                                      ; preds = %33
  %41 = icmp sgt i32 %34, 100, !dbg !98
  br i1 %41, label %42, label %.loopexit, !dbg !98

; <label>:42                                      ; preds = %40
  %43 = load %struct._IO_FILE** @stderr, align 8, !dbg !100, !tbaa !60
  %44 = load i8** @progname, align 8, !dbg !100, !tbaa !60
  %45 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %43, i8* getelementptr inbounds ([36 x i8]* @.str5, i64 0, i64 0), i8* %44, i32 100) #6, !dbg !100
  tail call void @exit(i32 -1) #7, !dbg !102
  unreachable, !dbg !102

.loopexit:                                        ; preds = %15, %.preheader2, %40
  %46 = phi i32 [ %34, %40 ], [ %3, %.preheader2 ], [ %3, %15 ]
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1, !dbg !70
  %47 = trunc i64 %indvars.iv.next25 to i32, !dbg !70
  %48 = icmp slt i32 %47, %argc, !dbg !70
  br i1 %48, label %.lr.ph12, label %._crit_edge, !dbg !70

._crit_edge:                                      ; preds = %.loopexit
  %49 = icmp eq i32 %46, 0, !dbg !103
  br i1 %49, label %50, label %._crit_edge.thread, !dbg !103

; <label>:50                                      ; preds = %._crit_edge
  %51 = load %struct._IO_FILE** @stderr, align 8, !dbg !105, !tbaa !60
  %52 = load i8** @progname, align 8, !dbg !105, !tbaa !60
  %53 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %51, i8* getelementptr inbounds ([24 x i8]* @.str6, i64 0, i64 0), i8* %52) #6, !dbg !105
  %54 = load %struct._IO_FILE** @stderr, align 8, !dbg !107, !tbaa !60
  %55 = load i8** @progname, align 8, !dbg !107, !tbaa !60
  %56 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %54, i8* getelementptr inbounds ([168 x i8]* @.str, i64 0, i64 0), i8* %55) #6, !dbg !107
  tail call void @exit(i32 -1) #7, !dbg !108
  unreachable, !dbg !108

._crit_edge.thread:                               ; preds = %0, %._crit_edge
  %57 = phi i32 [ %46, %._crit_edge ], [ 14, %0 ]
  store i32 %57, i32* @files, align 4, !dbg !109, !tbaa !65
  store i32 %57, i32* @ranks, align 4, !dbg !109, !tbaa !65
  %58 = icmp sgt i32 %57, 1, !dbg !110
  %59 = select i1 %58, i8* getelementptr inbounds ([2 x i8]* @.str8, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8]* @.str9, i64 0, i64 0), !dbg !110
  %60 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str7, i64 0, i64 0), i32 %57, i8* %59, i32 %57, i32 %57) #8, !dbg !110
  %61 = load %struct._IO_FILE** @stdout, align 8, !dbg !111, !tbaa !60
  %62 = tail call i32 @fflush(%struct._IO_FILE* %61) #8, !dbg !111
  store i64 0, i64* @solutions, align 8, !dbg !112, !tbaa !113
  tail call void @llvm.dbg.value(metadata !115, i64 0, metadata !15), !dbg !116
  br label %63, !dbg !116

; <label>:63                                      ; preds = %63, %._crit_edge.thread
  %indvars.iv21 = phi i64 [ 0, %._crit_edge.thread ], [ %indvars.iv.next22, %63 ]
  %64 = getelementptr inbounds [100 x i32]* @file, i64 0, i64 %indvars.iv21, !dbg !116
  store i32 101, i32* %64, align 4, !dbg !116, !tbaa !65
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1, !dbg !116
  %exitcond23 = icmp eq i64 %indvars.iv.next22, 100, !dbg !116
  br i1 %exitcond23, label %.preheader, label %63, !dbg !116

.preheader:                                       ; preds = %63, %.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %.preheader ], [ 0, %63 ]
  %65 = getelementptr inbounds [199 x i32]* @bakdiag, i64 0, i64 %indvars.iv, !dbg !118
  store i32 101, i32* %65, align 4, !dbg !118, !tbaa !65
  %66 = getelementptr inbounds [199 x i32]* @fordiag, i64 0, i64 %indvars.iv, !dbg !118
  store i32 101, i32* %66, align 4, !dbg !118, !tbaa !65
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !118
  %exitcond = icmp eq i64 %indvars.iv.next, 199, !dbg !118
  br i1 %exitcond, label %67, label %.preheader, !dbg !118

; <label>:67                                      ; preds = %.preheader
  tail call void @find(i32 0) #9, !dbg !120
  %68 = load i32* @printing, align 4, !dbg !121, !tbaa !65
  %69 = icmp ne i32 %68, 0, !dbg !121
  %70 = load i64* @solutions, align 8
  %71 = icmp ne i64 %70, 0, !dbg !121
  %or.cond = and i1 %69, %71, !dbg !121
  br i1 %or.cond, label %72, label %74, !dbg !121

; <label>:72                                      ; preds = %67
  %73 = tail call i32 @putchar(i32 10) #8, !dbg !121
  %.pr = load i64* @solutions, align 8, !dbg !123
  br label %74, !dbg !121

; <label>:74                                      ; preds = %72, %67
  %75 = phi i64 [ %.pr, %72 ], [ %70, %67 ], !dbg !123
  %76 = icmp eq i64 %75, 1, !dbg !123
  br i1 %76, label %77, label %78, !dbg !123

; <label>:77                                      ; preds = %74
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([23 x i8]* @str, i64 0, i64 0)), !dbg !123
  br label %80, !dbg !123

; <label>:78                                      ; preds = %74
  %79 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str11, i64 0, i64 0), i64 %75) #8, !dbg !125
  br label %80

; <label>:80                                      ; preds = %78, %77
  tail call void @exit(i32 0) #7, !dbg !126
  unreachable, !dbg !126
}

; Function Attrs: minsize nounwind optsize
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #1

; Function Attrs: minsize noreturn nounwind optsize
declare void @exit(i32) #2

; Function Attrs: minsize nounwind optsize
declare i32 @__isoc99_sscanf(i8* nocapture readonly, i8* nocapture readonly, ...) #1

; Function Attrs: minsize nounwind optsize
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: minsize nounwind optsize
declare i32 @fflush(%struct._IO_FILE* nocapture) #1

; Function Attrs: minsize nounwind optsize uwtable
define void @find(i32 %level) #3 {
  tail call void @llvm.dbg.value(metadata !{i32 %level}, i64 0, metadata !28), !dbg !127
  %1 = load i32* @queens, align 4, !dbg !128, !tbaa !65
  %2 = icmp eq i32 %1, %level, !dbg !128
  br i1 %2, label %3, label %13, !dbg !128

; <label>:3                                       ; preds = %0
  %4 = load i64* @solutions, align 8, !dbg !130, !tbaa !113
  %5 = add i64 %4, 1, !dbg !130
  store i64 %5, i64* @solutions, align 8, !dbg !130, !tbaa !113
  %6 = load i32* @printing, align 4, !dbg !132, !tbaa !65
  %7 = icmp eq i32 %6, 0, !dbg !132
  br i1 %7, label %9, label %8, !dbg !132

; <label>:8                                       ; preds = %3
  tail call void @pboard() #9, !dbg !132
  br label %9, !dbg !132

; <label>:9                                       ; preds = %3, %8
  %10 = load i32* @findall, align 4, !dbg !134, !tbaa !65
  %11 = icmp eq i32 %10, 0, !dbg !134
  br i1 %11, label %12, label %.loopexit, !dbg !134

; <label>:12                                      ; preds = %9
  tail call void @exit(i32 0) #7, !dbg !134
  unreachable, !dbg !134

; <label>:13                                      ; preds = %0
  tail call void @llvm.dbg.value(metadata !115, i64 0, metadata !29), !dbg !136
  tail call void @llvm.dbg.value(metadata !139, i64 0, metadata !30), !dbg !136
  %14 = sext i32 %level to i64, !dbg !136
  tail call void @llvm.dbg.value(metadata !{i32* %21}, i64 0, metadata !32), !dbg !136
  %15 = load i32* @files, align 4, !dbg !136, !tbaa !65
  tail call void @llvm.dbg.value(metadata !{i32* %20}, i64 0, metadata !33), !dbg !136
  %16 = icmp sgt i32 %15, 0, !dbg !136
  br i1 %16, label %.lr.ph, label %.loopexit, !dbg !136

.lr.ph:                                           ; preds = %13
  %17 = add i32 %level, -1, !dbg !136
  %18 = add i32 %17, %15, !dbg !136
  %19 = sext i32 %18 to i64, !dbg !136
  %20 = getelementptr inbounds [199 x i32]* @bakdiag, i64 0, i64 %19, !dbg !136
  %21 = getelementptr inbounds [199 x i32]* @fordiag, i64 0, i64 %14, !dbg !136
  %22 = getelementptr inbounds [100 x i32]* @queen, i64 0, i64 %14, !dbg !140
  %23 = add nsw i32 %level, 1, !dbg !144
  br label %24, !dbg !136

; <label>:24                                      ; preds = %.lr.ph, %35
  %25 = phi i32 [ %15, %.lr.ph ], [ %36, %35 ]
  %bdp.04 = phi i32* [ %20, %.lr.ph ], [ %40, %35 ]
  %fdp.03 = phi i32* [ %21, %.lr.ph ], [ %39, %35 ]
  %fp.02 = phi i32* [ getelementptr inbounds ([100 x i32]* @file, i64 0, i64 0), %.lr.ph ], [ %38, %35 ]
  %f.01 = phi i32 [ 0, %.lr.ph ], [ %37, %35 ]
  %26 = load i32* %fp.02, align 4, !dbg !145, !tbaa !65
  %27 = icmp slt i32 %26, %level, !dbg !145
  br i1 %27, label %35, label %28, !dbg !145

; <label>:28                                      ; preds = %24
  %29 = load i32* %fdp.03, align 4, !dbg !145, !tbaa !65
  %30 = icmp slt i32 %29, %level, !dbg !145
  br i1 %30, label %35, label %31, !dbg !145

; <label>:31                                      ; preds = %28
  %32 = load i32* %bdp.04, align 4, !dbg !145, !tbaa !65
  %33 = icmp slt i32 %32, %level, !dbg !145
  br i1 %33, label %35, label %34, !dbg !145

; <label>:34                                      ; preds = %31
  store i32 %f.01, i32* %22, align 4, !dbg !140, !tbaa !65
  store i32 %level, i32* %bdp.04, align 4, !dbg !146, !tbaa !65
  store i32 %level, i32* %fdp.03, align 4, !dbg !146, !tbaa !65
  store i32 %level, i32* %fp.02, align 4, !dbg !146, !tbaa !65
  tail call void @find(i32 %23) #9, !dbg !144
  store i32 101, i32* %bdp.04, align 4, !dbg !147, !tbaa !65
  store i32 101, i32* %fdp.03, align 4, !dbg !147, !tbaa !65
  store i32 101, i32* %fp.02, align 4, !dbg !147, !tbaa !65
  %.pre = load i32* @files, align 4, !dbg !136, !tbaa !65
  br label %35, !dbg !148

; <label>:35                                      ; preds = %31, %28, %24, %34
  %36 = phi i32 [ %25, %31 ], [ %25, %28 ], [ %25, %24 ], [ %.pre, %34 ], !dbg !149
  %37 = add nsw i32 %f.01, 1, !dbg !149
  tail call void @llvm.dbg.value(metadata !{i32 %37}, i64 0, metadata !29), !dbg !149
  %38 = getelementptr inbounds i32* %fp.02, i64 1, !dbg !149
  tail call void @llvm.dbg.value(metadata !{i32* %38}, i64 0, metadata !30), !dbg !149
  %39 = getelementptr inbounds i32* %fdp.03, i64 1, !dbg !149
  tail call void @llvm.dbg.value(metadata !{i32* %39}, i64 0, metadata !32), !dbg !149
  %40 = getelementptr inbounds i32* %bdp.04, i64 -1, !dbg !149
  tail call void @llvm.dbg.value(metadata !{i32* %40}, i64 0, metadata !33), !dbg !149
  %41 = icmp slt i32 %37, %36, !dbg !136
  br i1 %41, label %24, label %.loopexit, !dbg !136

.loopexit:                                        ; preds = %35, %13, %9
  ret void, !dbg !150
}

; Function Attrs: minsize nounwind optsize
declare i32 @putchar(i32) #1

; Function Attrs: minsize nounwind optsize uwtable
define void @pboard() #3 {
  %1 = load i32* @findall, align 4, !dbg !151, !tbaa !65
  %2 = icmp eq i32 %1, 0, !dbg !151
  br i1 %2, label %.preheader1, label %3, !dbg !151

; <label>:3                                       ; preds = %0
  %4 = load i64* @solutions, align 8, !dbg !153, !tbaa !113
  %5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str12, i64 0, i64 0), i64 %4) #8, !dbg !153
  br label %.preheader1, !dbg !153

.preheader1:                                      ; preds = %0, %3
  %6 = load i32* @ranks, align 4, !dbg !154, !tbaa !65
  %7 = icmp sgt i32 %6, 0, !dbg !154
  br i1 %7, label %.preheader, label %._crit_edge4, !dbg !154

.preheader:                                       ; preds = %.preheader1, %._crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge ], [ 0, %.preheader1 ]
  %8 = load i32* @files, align 4, !dbg !156, !tbaa !65
  %9 = icmp sgt i32 %8, 0, !dbg !156
  br i1 %9, label %.lr.ph, label %._crit_edge, !dbg !156

.lr.ph:                                           ; preds = %.preheader
  %10 = getelementptr inbounds [100 x i32]* @queen, i64 0, i64 %indvars.iv, !dbg !159
  br label %11, !dbg !156

; <label>:11                                      ; preds = %.lr.ph, %19
  %j.02 = phi i32 [ 0, %.lr.ph ], [ %20, %19 ]
  %12 = tail call i32 @putchar(i32 32) #8, !dbg !162
  %13 = load i32* %10, align 4, !dbg !159, !tbaa !65
  %14 = icmp eq i32 %j.02, %13, !dbg !159
  br i1 %14, label %15, label %17, !dbg !159

; <label>:15                                      ; preds = %11
  %16 = tail call i32 @putchar(i32 81) #8, !dbg !159
  br label %19, !dbg !159

; <label>:17                                      ; preds = %11
  %18 = tail call i32 @putchar(i32 45) #8, !dbg !163
  br label %19

; <label>:19                                      ; preds = %15, %17
  %20 = add nsw i32 %j.02, 1, !dbg !156
  tail call void @llvm.dbg.value(metadata !{i32 %20}, i64 0, metadata !23), !dbg !156
  %21 = load i32* @files, align 4, !dbg !156, !tbaa !65
  %22 = icmp slt i32 %20, %21, !dbg !156
  br i1 %22, label %11, label %._crit_edge, !dbg !156

._crit_edge:                                      ; preds = %19, %.preheader
  %23 = tail call i32 @putchar(i32 10) #8, !dbg !164
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !154
  %24 = load i32* @ranks, align 4, !dbg !154, !tbaa !65
  %25 = trunc i64 %indvars.iv.next to i32, !dbg !154
  %26 = icmp slt i32 %25, %24, !dbg !154
  br i1 %26, label %.preheader, label %._crit_edge4, !dbg !154

._crit_edge4:                                     ; preds = %._crit_edge, %.preheader1
  %27 = load %struct._IO_FILE** @stdout, align 8, !dbg !165, !tbaa !60
  %28 = tail call i32 @fflush(%struct._IO_FILE* %27) #8, !dbg !165
  ret void, !dbg !166
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #4

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #5

attributes #0 = { minsize noreturn nounwind optsize uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { minsize nounwind optsize "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { minsize noreturn nounwind optsize "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { minsize nounwind optsize uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
attributes #5 = { nounwind }
attributes #6 = { cold minsize nounwind optsize }
attributes #7 = { minsize noreturn nounwind optsize }
attributes #8 = { minsize nounwind optsize }
attributes #9 = { minsize optsize }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!53, !54}
!llvm.ident = !{!55}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !34, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c] [DW_LANG_C99]
!1 = metadata !{metadata !"queens-mcgill.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !18, metadata !24}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 205, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8**)* @main, null, null, metadata !12, i32 206} ; [ DW_TAG_subprogram ] [line 205] [def] [scope 206] [main]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !9}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!11 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!12 = metadata !{metadata !13, metadata !14, metadata !15, metadata !16, metadata !17}
!13 = metadata !{i32 786689, metadata !4, metadata !"argc", metadata !5, i32 16777421, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 205]
!14 = metadata !{i32 786689, metadata !4, metadata !"argv", metadata !5, i32 33554637, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 205]
!15 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 207, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 207]
!16 = metadata !{i32 786688, metadata !4, metadata !"p", metadata !5, i32 208, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [p] [line 208]
!17 = metadata !{i32 786688, metadata !4, metadata !"usage", metadata !5, i32 209, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [usage] [line 209]
!18 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"pboard", metadata !"pboard", metadata !"", i32 299, metadata !19, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void ()* @pboard, null, null, metadata !21, i32 300} ; [ DW_TAG_subprogram ] [line 299] [def] [scope 300] [pboard]
!19 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !20, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!20 = metadata !{null}
!21 = metadata !{metadata !22, metadata !23}
!22 = metadata !{i32 786688, metadata !18, metadata !"i", metadata !5, i32 301, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 301]
!23 = metadata !{i32 786688, metadata !18, metadata !"j", metadata !5, i32 301, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 301]
!24 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"find", metadata !"find", metadata !"", i32 328, metadata !25, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32)* @find, null, null, metadata !27, i32 329} ; [ DW_TAG_subprogram ] [line 328] [def] [scope 329] [find]
!25 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !26, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!26 = metadata !{null, metadata !8}
!27 = metadata !{metadata !28, metadata !29, metadata !30, metadata !32, metadata !33}
!28 = metadata !{i32 786689, metadata !24, metadata !"level", metadata !5, i32 16777544, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [level] [line 328]
!29 = metadata !{i32 786688, metadata !24, metadata !"f", metadata !5, i32 330, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 330]
!30 = metadata !{i32 786688, metadata !24, metadata !"fp", metadata !5, i32 331, metadata !31, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [fp] [line 331]
!31 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !8} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!32 = metadata !{i32 786688, metadata !24, metadata !"fdp", metadata !5, i32 331, metadata !31, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [fdp] [line 331]
!33 = metadata !{i32 786688, metadata !24, metadata !"bdp", metadata !5, i32 331, metadata !31, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [bdp] [line 331]
!34 = metadata !{metadata !35, metadata !36, metadata !37, metadata !39, metadata !40, metadata !41, metadata !42, metadata !43, metadata !47, metadata !48, metadata !52}
!35 = metadata !{i32 786484, i32 0, null, metadata !"printing", metadata !"printing", metadata !"", metadata !5, i32 183, metadata !8, i32 0, i32 1, i32* @printing, null} ; [ DW_TAG_variable ] [printing] [line 183] [def]
!36 = metadata !{i32 786484, i32 0, null, metadata !"findall", metadata !"findall", metadata !"", metadata !5, i32 184, metadata !8, i32 0, i32 1, i32* @findall, null} ; [ DW_TAG_variable ] [findall] [line 184] [def]
!37 = metadata !{i32 786484, i32 0, null, metadata !"solutions", metadata !"solutions", metadata !"", metadata !5, i32 186, metadata !38, i32 0, i32 1, i64* @solutions, null} ; [ DW_TAG_variable ] [solutions] [line 186] [def]
!38 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!39 = metadata !{i32 786484, i32 0, null, metadata !"progname", metadata !"progname", metadata !"", metadata !5, i32 191, metadata !10, i32 0, i32 1, i8** @progname, null} ; [ DW_TAG_variable ] [progname] [line 191] [def]
!40 = metadata !{i32 786484, i32 0, null, metadata !"queens", metadata !"queens", metadata !"", metadata !5, i32 180, metadata !8, i32 0, i32 1, i32* @queens, null} ; [ DW_TAG_variable ] [queens] [line 180] [def]
!41 = metadata !{i32 786484, i32 0, null, metadata !"ranks", metadata !"ranks", metadata !"", metadata !5, i32 181, metadata !8, i32 0, i32 1, i32* @ranks, null} ; [ DW_TAG_variable ] [ranks] [line 181] [def]
!42 = metadata !{i32 786484, i32 0, null, metadata !"files", metadata !"files", metadata !"", metadata !5, i32 182, metadata !8, i32 0, i32 1, i32* @files, null} ; [ DW_TAG_variable ] [files] [line 182] [def]
!43 = metadata !{i32 786484, i32 0, null, metadata !"queen", metadata !"queen", metadata !"", metadata !5, i32 187, metadata !44, i32 0, i32 1, [100 x i32]* @queen, null} ; [ DW_TAG_variable ] [queen] [line 187] [def]
!44 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 3200, i64 32, i32 0, i32 0, metadata !8, metadata !45, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 3200, align 32, offset 0] [from int]
!45 = metadata !{metadata !46}
!46 = metadata !{i32 786465, i64 0, i64 100}      ; [ DW_TAG_subrange_type ] [0, 99]
!47 = metadata !{i32 786484, i32 0, null, metadata !"file", metadata !"file", metadata !"", metadata !5, i32 188, metadata !44, i32 0, i32 1, [100 x i32]* @file, null} ; [ DW_TAG_variable ] [file] [line 188] [def]
!48 = metadata !{i32 786484, i32 0, null, metadata !"fordiag", metadata !"fordiag", metadata !"", metadata !5, i32 189, metadata !49, i32 0, i32 1, [199 x i32]* @fordiag, null} ; [ DW_TAG_variable ] [fordiag] [line 189] [def]
!49 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 6368, i64 32, i32 0, i32 0, metadata !8, metadata !50, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 6368, align 32, offset 0] [from int]
!50 = metadata !{metadata !51}
!51 = metadata !{i32 786465, i64 0, i64 199}      ; [ DW_TAG_subrange_type ] [0, 198]
!52 = metadata !{i32 786484, i32 0, null, metadata !"bakdiag", metadata !"bakdiag", metadata !"", metadata !5, i32 190, metadata !49, i32 0, i32 1, [199 x i32]* @bakdiag, null} ; [ DW_TAG_variable ] [bakdiag] [line 190] [def]
!53 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!54 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!55 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!56 = metadata !{i32 205, i32 0, metadata !4, null}
!57 = metadata !{null}
!58 = metadata !{i32 209, i32 0, metadata !4, null}
!59 = metadata !{i32 219, i32 0, metadata !4, null}
!60 = metadata !{metadata !61, metadata !61, i64 0}
!61 = metadata !{metadata !"any pointer", metadata !62, i64 0}
!62 = metadata !{metadata !"omnipotent char", metadata !63, i64 0}
!63 = metadata !{metadata !"Simple C/C++ TBAA"}
!64 = metadata !{i32 222, i32 0, metadata !4, null}
!65 = metadata !{metadata !66, metadata !66, i64 0}
!66 = metadata !{metadata !"int", metadata !62, i64 0}
!67 = metadata !{i32 226, i32 0, metadata !4, null}
!68 = metadata !{i32 228, i32 0, metadata !4, null}
!69 = metadata !{i32 1}
!70 = metadata !{i32 230, i32 0, metadata !71, null}
!71 = metadata !{i32 786443, metadata !1, metadata !4, i32 230, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!72 = metadata !{i32 231, i32 0, metadata !73, null}
!73 = metadata !{i32 786443, metadata !1, metadata !71, i32 230, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!74 = metadata !{i32 232, i32 0, metadata !75, null}
!75 = metadata !{i32 786443, metadata !1, metadata !73, i32 232, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!76 = metadata !{metadata !62, metadata !62, i64 0}
!77 = metadata !{i32 233, i32 0, metadata !78, null}
!78 = metadata !{i32 786443, metadata !1, metadata !75, i32 232, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!79 = metadata !{i32 234, i32 0, metadata !80, null}
!80 = metadata !{i32 786443, metadata !1, metadata !78, i32 233, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!81 = metadata !{i32 236, i32 0, metadata !82, null}
!82 = metadata !{i32 786443, metadata !1, metadata !80, i32 234, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!83 = metadata !{i32 238, i32 0, metadata !82, null}
!84 = metadata !{i32 241, i32 0, metadata !82, null}
!85 = metadata !{i32 242, i32 0, metadata !82, null}
!86 = metadata !{i32 243, i32 0, metadata !82, null}
!87 = metadata !{i32 248, i32 0, metadata !88, null}
!88 = metadata !{i32 786443, metadata !1, metadata !89, i32 248, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!89 = metadata !{i32 786443, metadata !1, metadata !75, i32 247, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!90 = metadata !{i32 249, i32 0, metadata !91, null}
!91 = metadata !{i32 786443, metadata !1, metadata !88, i32 248, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!92 = metadata !{i32 250, i32 0, metadata !91, null}
!93 = metadata !{i32 252, i32 0, metadata !94, null}
!94 = metadata !{i32 786443, metadata !1, metadata !89, i32 252, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!95 = metadata !{i32 253, i32 0, metadata !96, null}
!96 = metadata !{i32 786443, metadata !1, metadata !94, i32 252, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!97 = metadata !{i32 254, i32 0, metadata !96, null}
!98 = metadata !{i32 256, i32 0, metadata !99, null}
!99 = metadata !{i32 786443, metadata !1, metadata !89, i32 256, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!100 = metadata !{i32 257, i32 0, metadata !101, null}
!101 = metadata !{i32 786443, metadata !1, metadata !99, i32 256, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!102 = metadata !{i32 259, i32 0, metadata !101, null}
!103 = metadata !{i32 263, i32 0, metadata !104, null}
!104 = metadata !{i32 786443, metadata !1, metadata !4, i32 263, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!105 = metadata !{i32 264, i32 0, metadata !106, null}
!106 = metadata !{i32 786443, metadata !1, metadata !104, i32 263, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!107 = metadata !{i32 265, i32 0, metadata !106, null}
!108 = metadata !{i32 266, i32 0, metadata !106, null}
!109 = metadata !{i32 269, i32 0, metadata !4, null}
!110 = metadata !{i32 270, i32 0, metadata !4, null}
!111 = metadata !{i32 272, i32 0, metadata !4, null}
!112 = metadata !{i32 275, i32 0, metadata !4, null}
!113 = metadata !{metadata !114, metadata !114, i64 0}
!114 = metadata !{metadata !"long", metadata !62, i64 0}
!115 = metadata !{i32 0}
!116 = metadata !{i32 276, i32 0, metadata !117, null}
!117 = metadata !{i32 786443, metadata !1, metadata !4, i32 276, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!118 = metadata !{i32 277, i32 0, metadata !119, null}
!119 = metadata !{i32 786443, metadata !1, metadata !4, i32 277, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!120 = metadata !{i32 280, i32 0, metadata !4, null}
!121 = metadata !{i32 281, i32 0, metadata !122, null}
!122 = metadata !{i32 786443, metadata !1, metadata !4, i32 281, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!123 = metadata !{i32 284, i32 0, metadata !124, null}
!124 = metadata !{i32 786443, metadata !1, metadata !4, i32 284, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!125 = metadata !{i32 285, i32 0, metadata !124, null}
!126 = metadata !{i32 287, i32 0, metadata !4, null}
!127 = metadata !{i32 328, i32 0, metadata !24, null}
!128 = metadata !{i32 338, i32 0, metadata !129, null}
!129 = metadata !{i32 786443, metadata !1, metadata !24, i32 338, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!130 = metadata !{i32 339, i32 0, metadata !131, null}
!131 = metadata !{i32 786443, metadata !1, metadata !129, i32 338, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!132 = metadata !{i32 340, i32 0, metadata !133, null}
!133 = metadata !{i32 786443, metadata !1, metadata !131, i32 340, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!134 = metadata !{i32 341, i32 0, metadata !135, null}
!135 = metadata !{i32 786443, metadata !1, metadata !131, i32 341, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!136 = metadata !{i32 348, i32 0, metadata !137, null}
!137 = metadata !{i32 786443, metadata !1, metadata !138, i32 347, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!138 = metadata !{i32 786443, metadata !1, metadata !129, i32 346, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!139 = metadata !{null}
!140 = metadata !{i32 361, i32 0, metadata !141, null}
!141 = metadata !{i32 786443, metadata !1, metadata !142, i32 360, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!142 = metadata !{i32 786443, metadata !1, metadata !143, i32 358, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!143 = metadata !{i32 786443, metadata !1, metadata !137, i32 357, i32 0, i32 31} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!144 = metadata !{i32 363, i32 0, metadata !141, null}
!145 = metadata !{i32 358, i32 0, metadata !142, null}
!146 = metadata !{i32 362, i32 0, metadata !141, null}
!147 = metadata !{i32 364, i32 0, metadata !141, null}
!148 = metadata !{i32 365, i32 0, metadata !141, null}
!149 = metadata !{i32 355, i32 0, metadata !137, null}
!150 = metadata !{i32 368, i32 0, metadata !24, null}
!151 = metadata !{i32 303, i32 0, metadata !152, null}
!152 = metadata !{i32 786443, metadata !1, metadata !18, i32 303, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!153 = metadata !{i32 304, i32 0, metadata !152, null}
!154 = metadata !{i32 306, i32 0, metadata !155, null}
!155 = metadata !{i32 786443, metadata !1, metadata !18, i32 306, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!156 = metadata !{i32 307, i32 0, metadata !157, null}
!157 = metadata !{i32 786443, metadata !1, metadata !158, i32 307, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!158 = metadata !{i32 786443, metadata !1, metadata !155, i32 306, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!159 = metadata !{i32 309, i32 0, metadata !160, null}
!160 = metadata !{i32 786443, metadata !1, metadata !161, i32 309, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!161 = metadata !{i32 786443, metadata !1, metadata !157, i32 307, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!162 = metadata !{i32 308, i32 0, metadata !161, null}
!163 = metadata !{i32 310, i32 0, metadata !160, null}
!164 = metadata !{i32 312, i32 0, metadata !158, null}
!165 = metadata !{i32 314, i32 0, metadata !18, null}
!166 = metadata !{i32 315, i32 0, metadata !18, null}
