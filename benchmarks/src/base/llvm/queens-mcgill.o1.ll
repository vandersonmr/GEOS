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
@.str10 = private unnamed_addr constant [24 x i8] c"...there is 1 solution\0A\00", align 1
@.str11 = private unnamed_addr constant [28 x i8] c"...there are %ld solutions\0A\00", align 1
@.str12 = private unnamed_addr constant [17 x i8] c"\0ASolution #%lu:\0A\00", align 1
@queen = common global [100 x i32] zeroinitializer, align 16
@str = private unnamed_addr constant [23 x i8] c"...there is 1 solution\00"

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !13), !dbg !63
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !14), !dbg !63
  tail call void @llvm.dbg.value(metadata !64, i64 0, metadata !17), !dbg !65
  %1 = load i8** %argv, align 8, !dbg !66, !tbaa !67
  store i8* %1, i8** @progname, align 8, !dbg !66, !tbaa !67
  store i32 0, i32* @printing, align 4, !dbg !71, !tbaa !72
  store i32 14, i32* @queens, align 4, !dbg !74, !tbaa !72
  store i32 1, i32* @findall, align 4, !dbg !75, !tbaa !72
  tail call void @llvm.dbg.value(metadata !76, i64 0, metadata !15), !dbg !77
  %2 = icmp sgt i32 %argc, 1, !dbg !77
  br i1 %2, label %.lr.ph12, label %._crit_edge.thread, !dbg !77

.lr.ph12:                                         ; preds = %0, %.loopexit
  %indvars.iv24 = phi i64 [ %indvars.iv.next25, %.loopexit ], [ 1, %0 ]
  %3 = getelementptr inbounds i8** %argv, i64 %indvars.iv24, !dbg !79
  %4 = load i8** %3, align 8, !dbg !79, !tbaa !67
  tail call void @llvm.dbg.value(metadata !{i8* %4}, i64 0, metadata !16), !dbg !79
  %5 = load i8* %4, align 1, !dbg !81, !tbaa !83
  %6 = icmp eq i8 %5, 45, !dbg !81
  br i1 %6, label %.preheader2, label %26, !dbg !81

.preheader2:                                      ; preds = %.lr.ph12
  %7 = getelementptr inbounds i8* %4, i64 1, !dbg !84
  tail call void @llvm.dbg.value(metadata !{i8* %7}, i64 0, metadata !16), !dbg !84
  %8 = load i8* %7, align 1, !dbg !84, !tbaa !83
  %9 = icmp eq i8 %8, 0, !dbg !84
  br i1 %9, label %.loopexit, label %.lr.ph, !dbg !84

.lr.ph:                                           ; preds = %.preheader2, %14
  %10 = phi i8 [ %16, %14 ], [ %8, %.preheader2 ]
  %11 = phi i8* [ %15, %14 ], [ %7, %.preheader2 ]
  %12 = sext i8 %10 to i32, !dbg !86
  switch i32 %12, label %18 [
    i32 99, label %13
    i32 97, label %14
  ], !dbg !86

; <label>:13                                      ; preds = %.lr.ph
  store i32 0, i32* @printing, align 4, !dbg !88, !tbaa !72
  br label %14, !dbg !88

; <label>:14                                      ; preds = %.lr.ph, %13
  store i32 1, i32* @findall, align 4, !dbg !90, !tbaa !72
  %15 = getelementptr inbounds i8* %11, i64 1, !dbg !84
  tail call void @llvm.dbg.value(metadata !{i8* %11}, i64 0, metadata !16), !dbg !84
  %16 = load i8* %15, align 1, !dbg !84, !tbaa !83
  %17 = icmp eq i8 %16, 0, !dbg !84
  br i1 %17, label %.loopexit, label %.lr.ph, !dbg !84

; <label>:18                                      ; preds = %.lr.ph
  %19 = load %struct._IO_FILE** @stderr, align 8, !dbg !91, !tbaa !67
  %20 = load i8** @progname, align 8, !dbg !91, !tbaa !67
  %21 = load i8** %3, align 8, !dbg !91, !tbaa !67
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([25 x i8]* @.str1, i64 0, i64 0), i8* %20, i8* %21) #7, !dbg !91
  %23 = load %struct._IO_FILE** @stderr, align 8, !dbg !92, !tbaa !67
  %24 = load i8** @progname, align 8, !dbg !92, !tbaa !67
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([168 x i8]* @.str, i64 0, i64 0), i8* %24) #7, !dbg !92
  tail call void @exit(i32 -1) #8, !dbg !93
  unreachable, !dbg !93

; <label>:26                                      ; preds = %.lr.ph12
  %27 = tail call i32 (i8*, i8*, ...)* @__isoc99_sscanf(i8* %4, i8* getelementptr inbounds ([3 x i8]* @.str2, i64 0, i64 0), i32* @queens) #6, !dbg !94
  %28 = icmp eq i32 %27, 1, !dbg !94
  br i1 %28, label %33, label %29, !dbg !94

; <label>:29                                      ; preds = %26
  %30 = load %struct._IO_FILE** @stderr, align 8, !dbg !97, !tbaa !67
  %31 = load i8** @progname, align 8, !dbg !97, !tbaa !67
  %32 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %30, i8* getelementptr inbounds ([31 x i8]* @.str3, i64 0, i64 0), i8* %31, i8* %4) #7, !dbg !97
  tail call void @exit(i32 -1) #8, !dbg !99
  unreachable, !dbg !99

; <label>:33                                      ; preds = %26
  %34 = load i32* @queens, align 4, !dbg !100, !tbaa !72
  %35 = icmp slt i32 %34, 1, !dbg !100
  br i1 %35, label %36, label %40, !dbg !100

; <label>:36                                      ; preds = %33
  %37 = load %struct._IO_FILE** @stderr, align 8, !dbg !102, !tbaa !67
  %38 = load i8** @progname, align 8, !dbg !102, !tbaa !67
  %39 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([32 x i8]* @.str4, i64 0, i64 0), i8* %38) #7, !dbg !102
  tail call void @exit(i32 -1) #8, !dbg !104
  unreachable, !dbg !104

; <label>:40                                      ; preds = %33
  %41 = icmp sgt i32 %34, 100, !dbg !105
  br i1 %41, label %42, label %.loopexit, !dbg !105

; <label>:42                                      ; preds = %40
  %43 = load %struct._IO_FILE** @stderr, align 8, !dbg !107, !tbaa !67
  %44 = load i8** @progname, align 8, !dbg !107, !tbaa !67
  %45 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %43, i8* getelementptr inbounds ([36 x i8]* @.str5, i64 0, i64 0), i8* %44, i32 100) #7, !dbg !107
  tail call void @exit(i32 -1) #8, !dbg !109
  unreachable, !dbg !109

.loopexit:                                        ; preds = %14, %.preheader2, %40
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1, !dbg !77
  %46 = trunc i64 %indvars.iv.next25 to i32, !dbg !77
  %47 = icmp slt i32 %46, %argc, !dbg !77
  br i1 %47, label %.lr.ph12, label %._crit_edge, !dbg !77

._crit_edge:                                      ; preds = %.loopexit
  %.pr26 = load i32* @queens, align 4, !dbg !110, !tbaa !72
  %48 = icmp eq i32 %.pr26, 0, !dbg !110
  br i1 %48, label %49, label %._crit_edge.thread, !dbg !110

; <label>:49                                      ; preds = %._crit_edge
  %50 = load %struct._IO_FILE** @stderr, align 8, !dbg !112, !tbaa !67
  %51 = load i8** @progname, align 8, !dbg !112, !tbaa !67
  %52 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %50, i8* getelementptr inbounds ([24 x i8]* @.str6, i64 0, i64 0), i8* %51) #7, !dbg !112
  %53 = load %struct._IO_FILE** @stderr, align 8, !dbg !114, !tbaa !67
  %54 = load i8** @progname, align 8, !dbg !114, !tbaa !67
  %55 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %53, i8* getelementptr inbounds ([168 x i8]* @.str, i64 0, i64 0), i8* %54) #7, !dbg !114
  tail call void @exit(i32 -1) #8, !dbg !115
  unreachable, !dbg !115

._crit_edge.thread:                               ; preds = %0, %._crit_edge
  %56 = phi i32 [ %.pr26, %._crit_edge ], [ 14, %0 ]
  store i32 %56, i32* @files, align 4, !dbg !116, !tbaa !72
  store i32 %56, i32* @ranks, align 4, !dbg !116, !tbaa !72
  %57 = load i32* @queens, align 4, !dbg !117, !tbaa !72
  %58 = icmp sgt i32 %57, 1, !dbg !117
  %59 = select i1 %58, i8* getelementptr inbounds ([2 x i8]* @.str8, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8]* @.str9, i64 0, i64 0), !dbg !117
  %60 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str7, i64 0, i64 0), i32 %57, i8* %59, i32 %56, i32 %56) #6, !dbg !117
  %61 = load %struct._IO_FILE** @stdout, align 8, !dbg !118, !tbaa !67
  %62 = tail call i32 @fflush(%struct._IO_FILE* %61) #6, !dbg !118
  store i64 0, i64* @solutions, align 8, !dbg !119, !tbaa !120
  tail call void @llvm.dbg.value(metadata !122, i64 0, metadata !15), !dbg !123
  br label %63, !dbg !123

; <label>:63                                      ; preds = %63, %._crit_edge.thread
  %indvars.iv21 = phi i64 [ 0, %._crit_edge.thread ], [ %indvars.iv.next22, %63 ]
  %64 = getelementptr inbounds [100 x i32]* @file, i64 0, i64 %indvars.iv21, !dbg !123
  store i32 101, i32* %64, align 4, !dbg !123, !tbaa !72
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1, !dbg !123
  %exitcond23 = icmp eq i64 %indvars.iv.next22, 100, !dbg !123
  br i1 %exitcond23, label %.preheader, label %63, !dbg !123

.preheader:                                       ; preds = %63, %.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %.preheader ], [ 0, %63 ]
  %65 = getelementptr inbounds [199 x i32]* @bakdiag, i64 0, i64 %indvars.iv, !dbg !125
  store i32 101, i32* %65, align 4, !dbg !125, !tbaa !72
  %66 = getelementptr inbounds [199 x i32]* @fordiag, i64 0, i64 %indvars.iv, !dbg !125
  store i32 101, i32* %66, align 4, !dbg !125, !tbaa !72
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !125
  %exitcond = icmp eq i64 %indvars.iv.next, 199, !dbg !125
  br i1 %exitcond, label %67, label %.preheader, !dbg !125

; <label>:67                                      ; preds = %.preheader
  tail call void @find(i32 0), !dbg !127
  %68 = load i32* @printing, align 4, !dbg !128, !tbaa !72
  %69 = icmp ne i32 %68, 0, !dbg !128
  %70 = load i64* @solutions, align 8
  %71 = icmp ne i64 %70, 0, !dbg !128
  %or.cond = and i1 %69, %71, !dbg !128
  br i1 %or.cond, label %72, label %74, !dbg !128

; <label>:72                                      ; preds = %67
  %73 = tail call i32 @putchar(i32 10), !dbg !128
  %.pr = load i64* @solutions, align 8, !dbg !130
  br label %74, !dbg !128

; <label>:74                                      ; preds = %72, %67
  %75 = phi i64 [ %.pr, %72 ], [ %70, %67 ], !dbg !130
  %76 = icmp eq i64 %75, 1, !dbg !130
  br i1 %76, label %77, label %78, !dbg !130

; <label>:77                                      ; preds = %74
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([23 x i8]* @str, i64 0, i64 0)), !dbg !130
  br label %80, !dbg !130

; <label>:78                                      ; preds = %74
  %79 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str11, i64 0, i64 0), i64 %75) #6, !dbg !132
  br label %80

; <label>:80                                      ; preds = %78, %77
  tail call void @exit(i32 0) #8, !dbg !133
  unreachable, !dbg !133
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
  tail call void @llvm.dbg.value(metadata !{i32 %level}, i64 0, metadata !28), !dbg !134
  %1 = load i32* @queens, align 4, !dbg !135, !tbaa !72
  %2 = icmp eq i32 %1, %level, !dbg !135
  br i1 %2, label %3, label %13, !dbg !135

; <label>:3                                       ; preds = %0
  %4 = load i64* @solutions, align 8, !dbg !137, !tbaa !120
  %5 = add i64 %4, 1, !dbg !137
  store i64 %5, i64* @solutions, align 8, !dbg !137, !tbaa !120
  %6 = load i32* @printing, align 4, !dbg !139, !tbaa !72
  %7 = icmp eq i32 %6, 0, !dbg !139
  br i1 %7, label %9, label %8, !dbg !139

; <label>:8                                       ; preds = %3
  tail call void @pboard(), !dbg !139
  br label %9, !dbg !139

; <label>:9                                       ; preds = %3, %8
  %10 = load i32* @findall, align 4, !dbg !141, !tbaa !72
  %11 = icmp eq i32 %10, 0, !dbg !141
  br i1 %11, label %12, label %.loopexit, !dbg !141

; <label>:12                                      ; preds = %9
  tail call void @exit(i32 0) #8, !dbg !141
  unreachable, !dbg !141

; <label>:13                                      ; preds = %0
  tail call void @llvm.dbg.value(metadata !122, i64 0, metadata !29), !dbg !143
  tail call void @llvm.dbg.value(metadata !146, i64 0, metadata !30), !dbg !143
  %14 = sext i32 %level to i64, !dbg !143
  tail call void @llvm.dbg.value(metadata !{i32* %21}, i64 0, metadata !32), !dbg !143
  %15 = load i32* @files, align 4, !dbg !143, !tbaa !72
  tail call void @llvm.dbg.value(metadata !{i32* %20}, i64 0, metadata !33), !dbg !143
  %16 = icmp sgt i32 %15, 0, !dbg !143
  br i1 %16, label %.lr.ph, label %.loopexit, !dbg !143

.lr.ph:                                           ; preds = %13
  %17 = add i32 %level, -1, !dbg !143
  %18 = add i32 %17, %15, !dbg !143
  %19 = sext i32 %18 to i64, !dbg !143
  %20 = getelementptr inbounds [199 x i32]* @bakdiag, i64 0, i64 %19, !dbg !143
  %21 = getelementptr inbounds [199 x i32]* @fordiag, i64 0, i64 %14, !dbg !143
  %22 = getelementptr inbounds [100 x i32]* @queen, i64 0, i64 %14, !dbg !147
  %23 = add nsw i32 %level, 1, !dbg !151
  br label %24, !dbg !143

; <label>:24                                      ; preds = %.lr.ph, %34
  %bdp.04 = phi i32* [ %20, %.lr.ph ], [ %38, %34 ]
  %fdp.03 = phi i32* [ %21, %.lr.ph ], [ %37, %34 ]
  %fp.02 = phi i32* [ getelementptr inbounds ([100 x i32]* @file, i64 0, i64 0), %.lr.ph ], [ %36, %34 ]
  %f.01 = phi i32 [ 0, %.lr.ph ], [ %35, %34 ]
  %25 = load i32* %fp.02, align 4, !dbg !152, !tbaa !72
  %26 = icmp slt i32 %25, %level, !dbg !152
  br i1 %26, label %34, label %27, !dbg !152

; <label>:27                                      ; preds = %24
  %28 = load i32* %fdp.03, align 4, !dbg !152, !tbaa !72
  %29 = icmp slt i32 %28, %level, !dbg !152
  br i1 %29, label %34, label %30, !dbg !152

; <label>:30                                      ; preds = %27
  %31 = load i32* %bdp.04, align 4, !dbg !152, !tbaa !72
  %32 = icmp slt i32 %31, %level, !dbg !152
  br i1 %32, label %34, label %33, !dbg !152

; <label>:33                                      ; preds = %30
  store i32 %f.01, i32* %22, align 4, !dbg !147, !tbaa !72
  store i32 %level, i32* %bdp.04, align 4, !dbg !153, !tbaa !72
  store i32 %level, i32* %fdp.03, align 4, !dbg !153, !tbaa !72
  store i32 %level, i32* %fp.02, align 4, !dbg !153, !tbaa !72
  tail call void @find(i32 %23), !dbg !151
  store i32 101, i32* %bdp.04, align 4, !dbg !154, !tbaa !72
  store i32 101, i32* %fdp.03, align 4, !dbg !154, !tbaa !72
  store i32 101, i32* %fp.02, align 4, !dbg !154, !tbaa !72
  br label %34, !dbg !155

; <label>:34                                      ; preds = %30, %27, %24, %33
  %35 = add nsw i32 %f.01, 1, !dbg !156
  tail call void @llvm.dbg.value(metadata !{i32 %35}, i64 0, metadata !29), !dbg !156
  %36 = getelementptr inbounds i32* %fp.02, i64 1, !dbg !156
  tail call void @llvm.dbg.value(metadata !{i32* %36}, i64 0, metadata !30), !dbg !156
  %37 = getelementptr inbounds i32* %fdp.03, i64 1, !dbg !156
  tail call void @llvm.dbg.value(metadata !{i32* %37}, i64 0, metadata !32), !dbg !156
  %38 = getelementptr inbounds i32* %bdp.04, i64 -1, !dbg !156
  tail call void @llvm.dbg.value(metadata !{i32* %38}, i64 0, metadata !33), !dbg !156
  %39 = load i32* @files, align 4, !dbg !143, !tbaa !72
  %40 = icmp slt i32 %35, %39, !dbg !143
  br i1 %40, label %24, label %.loopexit, !dbg !143

.loopexit:                                        ; preds = %34, %13, %9
  ret void, !dbg !157
}

; Function Attrs: inlinehint nounwind uwtable
define available_externally i32 @putchar(i32 %__c) #4 {
  tail call void @llvm.dbg.value(metadata !{i32 %__c}, i64 0, metadata !40), !dbg !158
  %1 = load %struct._IO_FILE** @stdout, align 8, !dbg !159, !tbaa !67
  %2 = tail call i32 @_IO_putc(i32 %__c, %struct._IO_FILE* %1) #6, !dbg !159
  ret i32 %2, !dbg !159
}

; Function Attrs: nounwind uwtable
define void @pboard() #3 {
  %1 = load i32* @findall, align 4, !dbg !161, !tbaa !72
  %2 = icmp eq i32 %1, 0, !dbg !161
  br i1 %2, label %.preheader1, label %3, !dbg !161

; <label>:3                                       ; preds = %0
  %4 = load i64* @solutions, align 8, !dbg !163, !tbaa !120
  %5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str12, i64 0, i64 0), i64 %4) #6, !dbg !163
  br label %.preheader1, !dbg !163

.preheader1:                                      ; preds = %0, %3
  %6 = load i32* @ranks, align 4, !dbg !164, !tbaa !72
  %7 = icmp sgt i32 %6, 0, !dbg !164
  br i1 %7, label %.preheader, label %._crit_edge4, !dbg !164

.preheader:                                       ; preds = %.preheader1, %._crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge ], [ 0, %.preheader1 ]
  %8 = load i32* @files, align 4, !dbg !166, !tbaa !72
  %9 = icmp sgt i32 %8, 0, !dbg !166
  br i1 %9, label %.lr.ph, label %._crit_edge, !dbg !166

.lr.ph:                                           ; preds = %.preheader
  %10 = getelementptr inbounds [100 x i32]* @queen, i64 0, i64 %indvars.iv, !dbg !169
  br label %11, !dbg !166

; <label>:11                                      ; preds = %.lr.ph, %19
  %j.02 = phi i32 [ 0, %.lr.ph ], [ %20, %19 ]
  %12 = tail call i32 @putchar(i32 32), !dbg !172
  %13 = load i32* %10, align 4, !dbg !169, !tbaa !72
  %14 = icmp eq i32 %j.02, %13, !dbg !169
  br i1 %14, label %15, label %17, !dbg !169

; <label>:15                                      ; preds = %11
  %16 = tail call i32 @putchar(i32 81), !dbg !169
  br label %19, !dbg !169

; <label>:17                                      ; preds = %11
  %18 = tail call i32 @putchar(i32 45), !dbg !173
  br label %19

; <label>:19                                      ; preds = %15, %17
  %20 = add nsw i32 %j.02, 1, !dbg !166
  tail call void @llvm.dbg.value(metadata !{i32 %20}, i64 0, metadata !23), !dbg !166
  %21 = load i32* @files, align 4, !dbg !166, !tbaa !72
  %22 = icmp slt i32 %20, %21, !dbg !166
  br i1 %22, label %11, label %._crit_edge, !dbg !166

._crit_edge:                                      ; preds = %19, %.preheader
  %23 = tail call i32 @putchar(i32 10), !dbg !174
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !164
  %24 = load i32* @ranks, align 4, !dbg !164, !tbaa !72
  %25 = trunc i64 %indvars.iv.next to i32, !dbg !164
  %26 = icmp slt i32 %25, %24, !dbg !164
  br i1 %26, label %.preheader, label %._crit_edge4, !dbg !164

._crit_edge4:                                     ; preds = %._crit_edge, %.preheader1
  %27 = load %struct._IO_FILE** @stdout, align 8, !dbg !175, !tbaa !67
  %28 = tail call i32 @fflush(%struct._IO_FILE* %27) #6, !dbg !175
  ret void, !dbg !176
}

; Function Attrs: nounwind
declare i32 @_IO_putc(i32, %struct._IO_FILE* nocapture) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #5

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

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !41, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c] [DW_LANG_C99]
!1 = metadata !{metadata !"queens-mcgill.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !18, metadata !24, metadata !34}
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
!34 = metadata !{i32 786478, metadata !35, metadata !36, metadata !"putchar", metadata !"putchar", metadata !"", i32 79, metadata !37, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @putchar, null, null, metadata !39, i32 80} ; [ DW_TAG_subprogram ] [line 79] [def] [scope 80] [putchar]
!35 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/stdio.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!36 = metadata !{i32 786473, metadata !35}        ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base//usr/include/x86_64-linux-gnu/bits/stdio.h]
!37 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !38, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!38 = metadata !{metadata !8, metadata !8}
!39 = metadata !{metadata !40}
!40 = metadata !{i32 786689, metadata !34, metadata !"__c", metadata !36, i32 16777295, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [__c] [line 79]
!41 = metadata !{metadata !42, metadata !43, metadata !44, metadata !46, metadata !47, metadata !48, metadata !49, metadata !50, metadata !54, metadata !55, metadata !59}
!42 = metadata !{i32 786484, i32 0, null, metadata !"printing", metadata !"printing", metadata !"", metadata !5, i32 183, metadata !8, i32 0, i32 1, i32* @printing, null} ; [ DW_TAG_variable ] [printing] [line 183] [def]
!43 = metadata !{i32 786484, i32 0, null, metadata !"findall", metadata !"findall", metadata !"", metadata !5, i32 184, metadata !8, i32 0, i32 1, i32* @findall, null} ; [ DW_TAG_variable ] [findall] [line 184] [def]
!44 = metadata !{i32 786484, i32 0, null, metadata !"solutions", metadata !"solutions", metadata !"", metadata !5, i32 186, metadata !45, i32 0, i32 1, i64* @solutions, null} ; [ DW_TAG_variable ] [solutions] [line 186] [def]
!45 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!46 = metadata !{i32 786484, i32 0, null, metadata !"progname", metadata !"progname", metadata !"", metadata !5, i32 191, metadata !10, i32 0, i32 1, i8** @progname, null} ; [ DW_TAG_variable ] [progname] [line 191] [def]
!47 = metadata !{i32 786484, i32 0, null, metadata !"queens", metadata !"queens", metadata !"", metadata !5, i32 180, metadata !8, i32 0, i32 1, i32* @queens, null} ; [ DW_TAG_variable ] [queens] [line 180] [def]
!48 = metadata !{i32 786484, i32 0, null, metadata !"ranks", metadata !"ranks", metadata !"", metadata !5, i32 181, metadata !8, i32 0, i32 1, i32* @ranks, null} ; [ DW_TAG_variable ] [ranks] [line 181] [def]
!49 = metadata !{i32 786484, i32 0, null, metadata !"files", metadata !"files", metadata !"", metadata !5, i32 182, metadata !8, i32 0, i32 1, i32* @files, null} ; [ DW_TAG_variable ] [files] [line 182] [def]
!50 = metadata !{i32 786484, i32 0, null, metadata !"queen", metadata !"queen", metadata !"", metadata !5, i32 187, metadata !51, i32 0, i32 1, [100 x i32]* @queen, null} ; [ DW_TAG_variable ] [queen] [line 187] [def]
!51 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 3200, i64 32, i32 0, i32 0, metadata !8, metadata !52, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 3200, align 32, offset 0] [from int]
!52 = metadata !{metadata !53}
!53 = metadata !{i32 786465, i64 0, i64 100}      ; [ DW_TAG_subrange_type ] [0, 99]
!54 = metadata !{i32 786484, i32 0, null, metadata !"file", metadata !"file", metadata !"", metadata !5, i32 188, metadata !51, i32 0, i32 1, [100 x i32]* @file, null} ; [ DW_TAG_variable ] [file] [line 188] [def]
!55 = metadata !{i32 786484, i32 0, null, metadata !"fordiag", metadata !"fordiag", metadata !"", metadata !5, i32 189, metadata !56, i32 0, i32 1, [199 x i32]* @fordiag, null} ; [ DW_TAG_variable ] [fordiag] [line 189] [def]
!56 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 6368, i64 32, i32 0, i32 0, metadata !8, metadata !57, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 6368, align 32, offset 0] [from int]
!57 = metadata !{metadata !58}
!58 = metadata !{i32 786465, i64 0, i64 199}      ; [ DW_TAG_subrange_type ] [0, 198]
!59 = metadata !{i32 786484, i32 0, null, metadata !"bakdiag", metadata !"bakdiag", metadata !"", metadata !5, i32 190, metadata !56, i32 0, i32 1, [199 x i32]* @bakdiag, null} ; [ DW_TAG_variable ] [bakdiag] [line 190] [def]
!60 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!61 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!62 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!63 = metadata !{i32 205, i32 0, metadata !4, null}
!64 = metadata !{i8* getelementptr inbounds ([168 x i8]* @.str, i32 0, i32 0)}
!65 = metadata !{i32 209, i32 0, metadata !4, null}
!66 = metadata !{i32 219, i32 0, metadata !4, null}
!67 = metadata !{metadata !68, metadata !68, i64 0}
!68 = metadata !{metadata !"any pointer", metadata !69, i64 0}
!69 = metadata !{metadata !"omnipotent char", metadata !70, i64 0}
!70 = metadata !{metadata !"Simple C/C++ TBAA"}
!71 = metadata !{i32 222, i32 0, metadata !4, null}
!72 = metadata !{metadata !73, metadata !73, i64 0}
!73 = metadata !{metadata !"int", metadata !69, i64 0}
!74 = metadata !{i32 226, i32 0, metadata !4, null}
!75 = metadata !{i32 228, i32 0, metadata !4, null}
!76 = metadata !{i32 1}
!77 = metadata !{i32 230, i32 0, metadata !78, null}
!78 = metadata !{i32 786443, metadata !1, metadata !4, i32 230, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!79 = metadata !{i32 231, i32 0, metadata !80, null}
!80 = metadata !{i32 786443, metadata !1, metadata !78, i32 230, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!81 = metadata !{i32 232, i32 0, metadata !82, null}
!82 = metadata !{i32 786443, metadata !1, metadata !80, i32 232, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!83 = metadata !{metadata !69, metadata !69, i64 0}
!84 = metadata !{i32 233, i32 0, metadata !85, null}
!85 = metadata !{i32 786443, metadata !1, metadata !82, i32 232, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!86 = metadata !{i32 234, i32 0, metadata !87, null}
!87 = metadata !{i32 786443, metadata !1, metadata !85, i32 233, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!88 = metadata !{i32 236, i32 0, metadata !89, null}
!89 = metadata !{i32 786443, metadata !1, metadata !87, i32 234, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!90 = metadata !{i32 238, i32 0, metadata !89, null}
!91 = metadata !{i32 241, i32 0, metadata !89, null}
!92 = metadata !{i32 242, i32 0, metadata !89, null}
!93 = metadata !{i32 243, i32 0, metadata !89, null}
!94 = metadata !{i32 248, i32 0, metadata !95, null}
!95 = metadata !{i32 786443, metadata !1, metadata !96, i32 248, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!96 = metadata !{i32 786443, metadata !1, metadata !82, i32 247, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!97 = metadata !{i32 249, i32 0, metadata !98, null}
!98 = metadata !{i32 786443, metadata !1, metadata !95, i32 248, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!99 = metadata !{i32 250, i32 0, metadata !98, null}
!100 = metadata !{i32 252, i32 0, metadata !101, null}
!101 = metadata !{i32 786443, metadata !1, metadata !96, i32 252, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!102 = metadata !{i32 253, i32 0, metadata !103, null}
!103 = metadata !{i32 786443, metadata !1, metadata !101, i32 252, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!104 = metadata !{i32 254, i32 0, metadata !103, null}
!105 = metadata !{i32 256, i32 0, metadata !106, null}
!106 = metadata !{i32 786443, metadata !1, metadata !96, i32 256, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!107 = metadata !{i32 257, i32 0, metadata !108, null}
!108 = metadata !{i32 786443, metadata !1, metadata !106, i32 256, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!109 = metadata !{i32 259, i32 0, metadata !108, null}
!110 = metadata !{i32 263, i32 0, metadata !111, null}
!111 = metadata !{i32 786443, metadata !1, metadata !4, i32 263, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!112 = metadata !{i32 264, i32 0, metadata !113, null}
!113 = metadata !{i32 786443, metadata !1, metadata !111, i32 263, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!114 = metadata !{i32 265, i32 0, metadata !113, null}
!115 = metadata !{i32 266, i32 0, metadata !113, null}
!116 = metadata !{i32 269, i32 0, metadata !4, null}
!117 = metadata !{i32 270, i32 0, metadata !4, null}
!118 = metadata !{i32 272, i32 0, metadata !4, null}
!119 = metadata !{i32 275, i32 0, metadata !4, null}
!120 = metadata !{metadata !121, metadata !121, i64 0}
!121 = metadata !{metadata !"long", metadata !69, i64 0}
!122 = metadata !{i32 0}
!123 = metadata !{i32 276, i32 0, metadata !124, null}
!124 = metadata !{i32 786443, metadata !1, metadata !4, i32 276, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!125 = metadata !{i32 277, i32 0, metadata !126, null}
!126 = metadata !{i32 786443, metadata !1, metadata !4, i32 277, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!127 = metadata !{i32 280, i32 0, metadata !4, null}
!128 = metadata !{i32 281, i32 0, metadata !129, null}
!129 = metadata !{i32 786443, metadata !1, metadata !4, i32 281, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!130 = metadata !{i32 284, i32 0, metadata !131, null}
!131 = metadata !{i32 786443, metadata !1, metadata !4, i32 284, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!132 = metadata !{i32 285, i32 0, metadata !131, null}
!133 = metadata !{i32 287, i32 0, metadata !4, null}
!134 = metadata !{i32 328, i32 0, metadata !24, null}
!135 = metadata !{i32 338, i32 0, metadata !136, null}
!136 = metadata !{i32 786443, metadata !1, metadata !24, i32 338, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!137 = metadata !{i32 339, i32 0, metadata !138, null}
!138 = metadata !{i32 786443, metadata !1, metadata !136, i32 338, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!139 = metadata !{i32 340, i32 0, metadata !140, null}
!140 = metadata !{i32 786443, metadata !1, metadata !138, i32 340, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!141 = metadata !{i32 341, i32 0, metadata !142, null}
!142 = metadata !{i32 786443, metadata !1, metadata !138, i32 341, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!143 = metadata !{i32 348, i32 0, metadata !144, null}
!144 = metadata !{i32 786443, metadata !1, metadata !145, i32 347, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!145 = metadata !{i32 786443, metadata !1, metadata !136, i32 346, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!146 = metadata !{i32* getelementptr inbounds ([100 x i32]* @file, i32 0, i32 0)}
!147 = metadata !{i32 361, i32 0, metadata !148, null}
!148 = metadata !{i32 786443, metadata !1, metadata !149, i32 360, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!149 = metadata !{i32 786443, metadata !1, metadata !150, i32 358, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!150 = metadata !{i32 786443, metadata !1, metadata !144, i32 357, i32 0, i32 31} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!151 = metadata !{i32 363, i32 0, metadata !148, null}
!152 = metadata !{i32 358, i32 0, metadata !149, null}
!153 = metadata !{i32 362, i32 0, metadata !148, null}
!154 = metadata !{i32 364, i32 0, metadata !148, null}
!155 = metadata !{i32 365, i32 0, metadata !148, null}
!156 = metadata !{i32 355, i32 0, metadata !144, null}
!157 = metadata !{i32 368, i32 0, metadata !24, null}
!158 = metadata !{i32 79, i32 0, metadata !34, null}
!159 = metadata !{i32 81, i32 0, metadata !160, null}
!160 = metadata !{i32 786443, metadata !35, metadata !34} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base//usr/include/x86_64-linux-gnu/bits/stdio.h]
!161 = metadata !{i32 303, i32 0, metadata !162, null}
!162 = metadata !{i32 786443, metadata !1, metadata !18, i32 303, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!163 = metadata !{i32 304, i32 0, metadata !162, null}
!164 = metadata !{i32 306, i32 0, metadata !165, null}
!165 = metadata !{i32 786443, metadata !1, metadata !18, i32 306, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!166 = metadata !{i32 307, i32 0, metadata !167, null}
!167 = metadata !{i32 786443, metadata !1, metadata !168, i32 307, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!168 = metadata !{i32 786443, metadata !1, metadata !165, i32 306, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!169 = metadata !{i32 309, i32 0, metadata !170, null}
!170 = metadata !{i32 786443, metadata !1, metadata !171, i32 309, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!171 = metadata !{i32 786443, metadata !1, metadata !167, i32 307, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!172 = metadata !{i32 308, i32 0, metadata !171, null}
!173 = metadata !{i32 310, i32 0, metadata !170, null}
!174 = metadata !{i32 312, i32 0, metadata !168, null}
!175 = metadata !{i32 314, i32 0, metadata !18, null}
!176 = metadata !{i32 315, i32 0, metadata !18, null}
