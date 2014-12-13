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
  %3 = phi i32 [ %46, %.loopexit ], [ 14, %0 ]
  %indvars.iv24 = phi i64 [ %indvars.iv.next25, %.loopexit ], [ 1, %0 ]
  %4 = getelementptr inbounds i8** %argv, i64 %indvars.iv24, !dbg !79
  %5 = load i8** %4, align 8, !dbg !79, !tbaa !67
  tail call void @llvm.dbg.value(metadata !{i8* %5}, i64 0, metadata !16), !dbg !79
  %6 = load i8* %5, align 1, !dbg !81, !tbaa !83
  %7 = icmp eq i8 %6, 45, !dbg !81
  br i1 %7, label %.preheader2, label %26, !dbg !81

.preheader2:                                      ; preds = %.lr.ph12
  %8 = getelementptr inbounds i8* %5, i64 1, !dbg !84
  tail call void @llvm.dbg.value(metadata !{i8* %8}, i64 0, metadata !16), !dbg !84
  %9 = load i8* %8, align 1, !dbg !84, !tbaa !83
  %10 = icmp eq i8 %9, 0, !dbg !84
  br i1 %10, label %.loopexit, label %.lr.ph, !dbg !84

.lr.ph:                                           ; preds = %.preheader2, %15
  %11 = phi i8 [ %17, %15 ], [ %9, %.preheader2 ]
  %12 = phi i8* [ %16, %15 ], [ %8, %.preheader2 ]
  %13 = sext i8 %11 to i32, !dbg !86
  switch i32 %13, label %19 [
    i32 99, label %14
    i32 97, label %15
  ], !dbg !86

; <label>:14                                      ; preds = %.lr.ph
  store i32 0, i32* @printing, align 4, !dbg !88, !tbaa !72
  br label %15, !dbg !88

; <label>:15                                      ; preds = %.lr.ph, %14
  store i32 1, i32* @findall, align 4, !dbg !90, !tbaa !72
  %16 = getelementptr inbounds i8* %12, i64 1, !dbg !84
  tail call void @llvm.dbg.value(metadata !{i8* %12}, i64 0, metadata !16), !dbg !84
  %17 = load i8* %16, align 1, !dbg !84, !tbaa !83
  %18 = icmp eq i8 %17, 0, !dbg !84
  br i1 %18, label %.loopexit, label %.lr.ph, !dbg !84

; <label>:19                                      ; preds = %.lr.ph
  %20 = load %struct._IO_FILE** @stderr, align 8, !dbg !91, !tbaa !67
  %21 = load i8** @progname, align 8, !dbg !91, !tbaa !67
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([25 x i8]* @.str1, i64 0, i64 0), i8* %21, i8* %5) #6, !dbg !91
  %23 = load %struct._IO_FILE** @stderr, align 8, !dbg !92, !tbaa !67
  %24 = load i8** @progname, align 8, !dbg !92, !tbaa !67
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([168 x i8]* @.str, i64 0, i64 0), i8* %24) #6, !dbg !92
  tail call void @exit(i32 -1) #7, !dbg !93
  unreachable, !dbg !93

; <label>:26                                      ; preds = %.lr.ph12
  %27 = tail call i32 (i8*, i8*, ...)* @__isoc99_sscanf(i8* %5, i8* getelementptr inbounds ([3 x i8]* @.str2, i64 0, i64 0), i32* @queens) #5, !dbg !94
  %28 = icmp eq i32 %27, 1, !dbg !94
  br i1 %28, label %33, label %29, !dbg !94

; <label>:29                                      ; preds = %26
  %30 = load %struct._IO_FILE** @stderr, align 8, !dbg !97, !tbaa !67
  %31 = load i8** @progname, align 8, !dbg !97, !tbaa !67
  %32 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %30, i8* getelementptr inbounds ([31 x i8]* @.str3, i64 0, i64 0), i8* %31, i8* %5) #6, !dbg !97
  tail call void @exit(i32 -1) #7, !dbg !99
  unreachable, !dbg !99

; <label>:33                                      ; preds = %26
  %34 = load i32* @queens, align 4, !dbg !100, !tbaa !72
  %35 = icmp slt i32 %34, 1, !dbg !100
  br i1 %35, label %36, label %40, !dbg !100

; <label>:36                                      ; preds = %33
  %37 = load %struct._IO_FILE** @stderr, align 8, !dbg !102, !tbaa !67
  %38 = load i8** @progname, align 8, !dbg !102, !tbaa !67
  %39 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([32 x i8]* @.str4, i64 0, i64 0), i8* %38) #6, !dbg !102
  tail call void @exit(i32 -1) #7, !dbg !104
  unreachable, !dbg !104

; <label>:40                                      ; preds = %33
  %41 = icmp sgt i32 %34, 100, !dbg !105
  br i1 %41, label %42, label %.loopexit, !dbg !105

; <label>:42                                      ; preds = %40
  %43 = load %struct._IO_FILE** @stderr, align 8, !dbg !107, !tbaa !67
  %44 = load i8** @progname, align 8, !dbg !107, !tbaa !67
  %45 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %43, i8* getelementptr inbounds ([36 x i8]* @.str5, i64 0, i64 0), i8* %44, i32 100) #6, !dbg !107
  tail call void @exit(i32 -1) #7, !dbg !109
  unreachable, !dbg !109

.loopexit:                                        ; preds = %15, %.preheader2, %40
  %46 = phi i32 [ %34, %40 ], [ %3, %.preheader2 ], [ %3, %15 ]
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1, !dbg !77
  %47 = trunc i64 %indvars.iv.next25 to i32, !dbg !77
  %48 = icmp slt i32 %47, %argc, !dbg !77
  br i1 %48, label %.lr.ph12, label %._crit_edge, !dbg !77

._crit_edge:                                      ; preds = %.loopexit
  %49 = icmp eq i32 %46, 0, !dbg !110
  br i1 %49, label %50, label %._crit_edge.thread, !dbg !110

; <label>:50                                      ; preds = %._crit_edge
  %51 = load %struct._IO_FILE** @stderr, align 8, !dbg !112, !tbaa !67
  %52 = load i8** @progname, align 8, !dbg !112, !tbaa !67
  %53 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %51, i8* getelementptr inbounds ([24 x i8]* @.str6, i64 0, i64 0), i8* %52) #6, !dbg !112
  %54 = load %struct._IO_FILE** @stderr, align 8, !dbg !114, !tbaa !67
  %55 = load i8** @progname, align 8, !dbg !114, !tbaa !67
  %56 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %54, i8* getelementptr inbounds ([168 x i8]* @.str, i64 0, i64 0), i8* %55) #6, !dbg !114
  tail call void @exit(i32 -1) #7, !dbg !115
  unreachable, !dbg !115

._crit_edge.thread:                               ; preds = %0, %._crit_edge
  %57 = phi i32 [ %46, %._crit_edge ], [ 14, %0 ]
  store i32 %57, i32* @files, align 4, !dbg !116, !tbaa !72
  store i32 %57, i32* @ranks, align 4, !dbg !116, !tbaa !72
  %58 = icmp sgt i32 %57, 1, !dbg !117
  %59 = select i1 %58, i8* getelementptr inbounds ([2 x i8]* @.str8, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8]* @.str9, i64 0, i64 0), !dbg !117
  %60 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str7, i64 0, i64 0), i32 %57, i8* %59, i32 %57, i32 %57) #5, !dbg !117
  %61 = load %struct._IO_FILE** @stdout, align 8, !dbg !118, !tbaa !67
  %62 = tail call i32 @fflush(%struct._IO_FILE* %61) #5, !dbg !118
  store i64 0, i64* @solutions, align 8, !dbg !119, !tbaa !120
  tail call void @llvm.dbg.value(metadata !122, i64 0, metadata !15), !dbg !123
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %._crit_edge.thread
  %index = phi i64 [ 0, %._crit_edge.thread ], [ %index.next, %vector.body ], !dbg !123
  %63 = getelementptr inbounds [100 x i32]* @file, i64 0, i64 %index, !dbg !123
  %64 = bitcast i32* %63 to <4 x i32>*, !dbg !123
  store <4 x i32> <i32 101, i32 101, i32 101, i32 101>, <4 x i32>* %64, align 16, !dbg !123
  %index.next = add i64 %index, 4, !dbg !123
  %65 = icmp eq i64 %index.next, 100, !dbg !123
  br i1 %65, label %vector.body32, label %vector.body, !dbg !123, !llvm.loop !125

vector.body32:                                    ; preds = %vector.body, %vector.body32
  %index35 = phi i64 [ %index.next39, %vector.body32 ], [ 0, %vector.body ], !dbg !128
  %66 = getelementptr inbounds [199 x i32]* @bakdiag, i64 0, i64 %index35, !dbg !128
  %67 = bitcast i32* %66 to <4 x i32>*, !dbg !128
  store <4 x i32> <i32 101, i32 101, i32 101, i32 101>, <4 x i32>* %67, align 16, !dbg !128
  %.sum44 = or i64 %index35, 4, !dbg !128
  %68 = getelementptr [199 x i32]* @bakdiag, i64 0, i64 %.sum44, !dbg !128
  %69 = bitcast i32* %68 to <4 x i32>*, !dbg !128
  store <4 x i32> <i32 101, i32 101, i32 101, i32 101>, <4 x i32>* %69, align 16, !dbg !128
  %70 = getelementptr inbounds [199 x i32]* @fordiag, i64 0, i64 %index35, !dbg !128
  %71 = bitcast i32* %70 to <4 x i32>*, !dbg !128
  store <4 x i32> <i32 101, i32 101, i32 101, i32 101>, <4 x i32>* %71, align 16, !dbg !128
  %.sum45 = or i64 %index35, 4, !dbg !128
  %72 = getelementptr [199 x i32]* @fordiag, i64 0, i64 %.sum45, !dbg !128
  %73 = bitcast i32* %72 to <4 x i32>*, !dbg !128
  store <4 x i32> <i32 101, i32 101, i32 101, i32 101>, <4 x i32>* %73, align 16, !dbg !128
  %index.next39 = add i64 %index35, 8, !dbg !128
  %74 = icmp eq i64 %index.next39, 192, !dbg !128
  br i1 %74, label %.preheader, label %vector.body32, !dbg !128, !llvm.loop !130

.preheader:                                       ; preds = %vector.body32, %.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %.preheader ], [ 192, %vector.body32 ]
  %75 = getelementptr inbounds [199 x i32]* @bakdiag, i64 0, i64 %indvars.iv, !dbg !128
  store i32 101, i32* %75, align 4, !dbg !128, !tbaa !72
  %76 = getelementptr inbounds [199 x i32]* @fordiag, i64 0, i64 %indvars.iv, !dbg !128
  store i32 101, i32* %76, align 4, !dbg !128, !tbaa !72
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !128
  %exitcond = icmp eq i64 %indvars.iv.next, 199, !dbg !128
  br i1 %exitcond, label %77, label %.preheader, !dbg !128, !llvm.loop !131

; <label>:77                                      ; preds = %.preheader
  tail call void @find(i32 0), !dbg !132
  %78 = load i32* @printing, align 4, !dbg !133, !tbaa !72
  %79 = icmp ne i32 %78, 0, !dbg !133
  %80 = load i64* @solutions, align 8
  %81 = icmp ne i64 %80, 0, !dbg !133
  %or.cond = and i1 %79, %81, !dbg !133
  br i1 %or.cond, label %82, label %85, !dbg !133

; <label>:82                                      ; preds = %77
  tail call void @llvm.dbg.value(metadata !135, i64 0, metadata !136) #5, !dbg !137
  %83 = load %struct._IO_FILE** @stdout, align 8, !dbg !138, !tbaa !67
  %84 = tail call i32 @_IO_putc(i32 10, %struct._IO_FILE* %83) #5, !dbg !138
  %.pr = load i64* @solutions, align 8, !dbg !140
  br label %85, !dbg !133

; <label>:85                                      ; preds = %82, %77
  %86 = phi i64 [ %.pr, %82 ], [ %80, %77 ], !dbg !140
  %87 = icmp eq i64 %86, 1, !dbg !140
  br i1 %87, label %88, label %89, !dbg !140

; <label>:88                                      ; preds = %85
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([23 x i8]* @str, i64 0, i64 0)), !dbg !140
  br label %91, !dbg !140

; <label>:89                                      ; preds = %85
  %90 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str11, i64 0, i64 0), i64 %86) #5, !dbg !142
  br label %91

; <label>:91                                      ; preds = %89, %88
  tail call void @exit(i32 0) #7, !dbg !143
  unreachable, !dbg !143
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
  tail call void @llvm.dbg.value(metadata !{i32 %level}, i64 0, metadata !28), !dbg !144
  %1 = load i32* @queens, align 4, !dbg !145, !tbaa !72
  %2 = icmp eq i32 %1, %level, !dbg !145
  br i1 %2, label %3, label %13, !dbg !145

; <label>:3                                       ; preds = %0
  %4 = load i64* @solutions, align 8, !dbg !147, !tbaa !120
  %5 = add i64 %4, 1, !dbg !147
  store i64 %5, i64* @solutions, align 8, !dbg !147, !tbaa !120
  %6 = load i32* @printing, align 4, !dbg !149, !tbaa !72
  %7 = icmp eq i32 %6, 0, !dbg !149
  br i1 %7, label %9, label %8, !dbg !149

; <label>:8                                       ; preds = %3
  tail call void @pboard(), !dbg !149
  br label %9, !dbg !149

; <label>:9                                       ; preds = %3, %8
  %10 = load i32* @findall, align 4, !dbg !151, !tbaa !72
  %11 = icmp eq i32 %10, 0, !dbg !151
  br i1 %11, label %12, label %.loopexit, !dbg !151

; <label>:12                                      ; preds = %9
  tail call void @exit(i32 0) #7, !dbg !151
  unreachable, !dbg !151

; <label>:13                                      ; preds = %0
  tail call void @llvm.dbg.value(metadata !122, i64 0, metadata !29), !dbg !153
  tail call void @llvm.dbg.value(metadata !156, i64 0, metadata !30), !dbg !153
  %14 = sext i32 %level to i64, !dbg !153
  tail call void @llvm.dbg.value(metadata !{i32* %21}, i64 0, metadata !32), !dbg !153
  %15 = load i32* @files, align 4, !dbg !153, !tbaa !72
  tail call void @llvm.dbg.value(metadata !{i32* %20}, i64 0, metadata !33), !dbg !153
  %16 = icmp sgt i32 %15, 0, !dbg !153
  br i1 %16, label %.lr.ph, label %.loopexit, !dbg !153

.lr.ph:                                           ; preds = %13
  %17 = add i32 %level, -1, !dbg !153
  %18 = add i32 %17, %15, !dbg !153
  %19 = sext i32 %18 to i64, !dbg !153
  %20 = getelementptr inbounds [199 x i32]* @bakdiag, i64 0, i64 %19, !dbg !153
  %21 = getelementptr inbounds [199 x i32]* @fordiag, i64 0, i64 %14, !dbg !153
  %22 = getelementptr inbounds [100 x i32]* @queen, i64 0, i64 %14, !dbg !157
  %23 = add nsw i32 %level, 1, !dbg !161
  br label %24, !dbg !153

; <label>:24                                      ; preds = %.lr.ph, %35
  %25 = phi i32 [ %15, %.lr.ph ], [ %36, %35 ]
  %bdp.04 = phi i32* [ %20, %.lr.ph ], [ %40, %35 ]
  %fdp.03 = phi i32* [ %21, %.lr.ph ], [ %39, %35 ]
  %fp.02 = phi i32* [ getelementptr inbounds ([100 x i32]* @file, i64 0, i64 0), %.lr.ph ], [ %38, %35 ]
  %f.01 = phi i32 [ 0, %.lr.ph ], [ %37, %35 ]
  %26 = load i32* %fp.02, align 4, !dbg !162, !tbaa !72
  %27 = icmp slt i32 %26, %level, !dbg !162
  br i1 %27, label %35, label %28, !dbg !162

; <label>:28                                      ; preds = %24
  %29 = load i32* %fdp.03, align 4, !dbg !162, !tbaa !72
  %30 = icmp slt i32 %29, %level, !dbg !162
  br i1 %30, label %35, label %31, !dbg !162

; <label>:31                                      ; preds = %28
  %32 = load i32* %bdp.04, align 4, !dbg !162, !tbaa !72
  %33 = icmp slt i32 %32, %level, !dbg !162
  br i1 %33, label %35, label %34, !dbg !162

; <label>:34                                      ; preds = %31
  store i32 %f.01, i32* %22, align 4, !dbg !157, !tbaa !72
  store i32 %level, i32* %bdp.04, align 4, !dbg !163, !tbaa !72
  store i32 %level, i32* %fdp.03, align 4, !dbg !163, !tbaa !72
  store i32 %level, i32* %fp.02, align 4, !dbg !163, !tbaa !72
  tail call void @find(i32 %23), !dbg !161
  store i32 101, i32* %bdp.04, align 4, !dbg !164, !tbaa !72
  store i32 101, i32* %fdp.03, align 4, !dbg !164, !tbaa !72
  store i32 101, i32* %fp.02, align 4, !dbg !164, !tbaa !72
  %.pre = load i32* @files, align 4, !dbg !153, !tbaa !72
  br label %35, !dbg !165

; <label>:35                                      ; preds = %31, %28, %24, %34
  %36 = phi i32 [ %25, %31 ], [ %25, %28 ], [ %25, %24 ], [ %.pre, %34 ], !dbg !166
  %37 = add nsw i32 %f.01, 1, !dbg !166
  tail call void @llvm.dbg.value(metadata !{i32 %37}, i64 0, metadata !29), !dbg !166
  %38 = getelementptr inbounds i32* %fp.02, i64 1, !dbg !166
  tail call void @llvm.dbg.value(metadata !{i32* %38}, i64 0, metadata !30), !dbg !166
  %39 = getelementptr inbounds i32* %fdp.03, i64 1, !dbg !166
  tail call void @llvm.dbg.value(metadata !{i32* %39}, i64 0, metadata !32), !dbg !166
  %40 = getelementptr inbounds i32* %bdp.04, i64 -1, !dbg !166
  tail call void @llvm.dbg.value(metadata !{i32* %40}, i64 0, metadata !33), !dbg !166
  %41 = icmp slt i32 %37, %36, !dbg !153
  br i1 %41, label %24, label %.loopexit, !dbg !153

.loopexit:                                        ; preds = %35, %13, %9
  ret void, !dbg !167
}

; Function Attrs: nounwind uwtable
define void @pboard() #3 {
  %1 = load i32* @findall, align 4, !dbg !168, !tbaa !72
  %2 = icmp eq i32 %1, 0, !dbg !168
  br i1 %2, label %.preheader1, label %3, !dbg !168

; <label>:3                                       ; preds = %0
  %4 = load i64* @solutions, align 8, !dbg !170, !tbaa !120
  %5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str12, i64 0, i64 0), i64 %4) #5, !dbg !170
  br label %.preheader1, !dbg !170

.preheader1:                                      ; preds = %0, %3
  %6 = load i32* @ranks, align 4, !dbg !171, !tbaa !72
  %7 = icmp sgt i32 %6, 0, !dbg !171
  br i1 %7, label %.preheader, label %._crit_edge4, !dbg !171

.preheader:                                       ; preds = %.preheader1, %._crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge ], [ 0, %.preheader1 ]
  %8 = load i32* @files, align 4, !dbg !173, !tbaa !72
  %9 = icmp sgt i32 %8, 0, !dbg !173
  %10 = load %struct._IO_FILE** @stdout, align 8, !dbg !176, !tbaa !67
  br i1 %9, label %.lr.ph, label %._crit_edge, !dbg !173

.lr.ph:                                           ; preds = %.preheader
  %11 = getelementptr inbounds [100 x i32]* @queen, i64 0, i64 %indvars.iv, !dbg !179
  br label %12, !dbg !173

; <label>:12                                      ; preds = %.lr.ph, %22
  %13 = phi %struct._IO_FILE* [ %10, %.lr.ph ], [ %26, %22 ]
  %j.02 = phi i32 [ 0, %.lr.ph ], [ %23, %22 ]
  tail call void @llvm.dbg.value(metadata !181, i64 0, metadata !182) #5, !dbg !183
  %14 = tail call i32 @_IO_putc(i32 32, %struct._IO_FILE* %13) #5, !dbg !176
  %15 = load i32* %11, align 4, !dbg !179, !tbaa !72
  %16 = icmp eq i32 %j.02, %15, !dbg !179
  %17 = load %struct._IO_FILE** @stdout, align 8, !dbg !184, !tbaa !67
  br i1 %16, label %18, label %20, !dbg !179

; <label>:18                                      ; preds = %12
  tail call void @llvm.dbg.value(metadata !185, i64 0, metadata !186) #5, !dbg !187
  %19 = tail call i32 @_IO_putc(i32 81, %struct._IO_FILE* %17) #5, !dbg !184
  br label %22, !dbg !179

; <label>:20                                      ; preds = %12
  tail call void @llvm.dbg.value(metadata !188, i64 0, metadata !189) #5, !dbg !191
  %21 = tail call i32 @_IO_putc(i32 45, %struct._IO_FILE* %17) #5, !dbg !192
  br label %22

; <label>:22                                      ; preds = %18, %20
  %23 = add nsw i32 %j.02, 1, !dbg !173
  tail call void @llvm.dbg.value(metadata !{i32 %23}, i64 0, metadata !23), !dbg !173
  %24 = load i32* @files, align 4, !dbg !173, !tbaa !72
  %25 = icmp slt i32 %23, %24, !dbg !173
  %26 = load %struct._IO_FILE** @stdout, align 8, !dbg !176, !tbaa !67
  br i1 %25, label %12, label %._crit_edge, !dbg !173

._crit_edge:                                      ; preds = %22, %.preheader
  %.lcssa = phi %struct._IO_FILE* [ %10, %.preheader ], [ %26, %22 ]
  tail call void @llvm.dbg.value(metadata !135, i64 0, metadata !193) #5, !dbg !195
  %27 = tail call i32 @_IO_putc(i32 10, %struct._IO_FILE* %.lcssa) #5, !dbg !196
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !171
  %28 = load i32* @ranks, align 4, !dbg !171, !tbaa !72
  %29 = trunc i64 %indvars.iv.next to i32, !dbg !171
  %30 = icmp slt i32 %29, %28, !dbg !171
  br i1 %30, label %.preheader, label %._crit_edge4, !dbg !171

._crit_edge4:                                     ; preds = %._crit_edge, %.preheader1
  %31 = load %struct._IO_FILE** @stdout, align 8, !dbg !197, !tbaa !67
  %32 = tail call i32 @fflush(%struct._IO_FILE* %31) #5, !dbg !197
  ret void, !dbg !198
}

; Function Attrs: nounwind
declare i32 @_IO_putc(i32, %struct._IO_FILE* nocapture) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #4

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
!34 = metadata !{i32 786478, metadata !35, metadata !36, metadata !"putchar", metadata !"putchar", metadata !"", i32 79, metadata !37, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !39, i32 80} ; [ DW_TAG_subprogram ] [line 79] [def] [scope 80] [putchar]
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
!64 = metadata !{null}
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
!125 = metadata !{metadata !125, metadata !126, metadata !127}
!126 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!127 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!128 = metadata !{i32 277, i32 0, metadata !129, null}
!129 = metadata !{i32 786443, metadata !1, metadata !4, i32 277, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!130 = metadata !{metadata !130, metadata !126, metadata !127}
!131 = metadata !{metadata !131, metadata !126, metadata !127}
!132 = metadata !{i32 280, i32 0, metadata !4, null}
!133 = metadata !{i32 281, i32 0, metadata !134, null}
!134 = metadata !{i32 786443, metadata !1, metadata !4, i32 281, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!135 = metadata !{i32 10}
!136 = metadata !{i32 786689, metadata !34, metadata !"__c", metadata !36, i32 16777295, metadata !8, i32 0, metadata !133} ; [ DW_TAG_arg_variable ] [__c] [line 79]
!137 = metadata !{i32 79, i32 0, metadata !34, metadata !133}
!138 = metadata !{i32 81, i32 0, metadata !139, metadata !133}
!139 = metadata !{i32 786443, metadata !35, metadata !34} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base//usr/include/x86_64-linux-gnu/bits/stdio.h]
!140 = metadata !{i32 284, i32 0, metadata !141, null}
!141 = metadata !{i32 786443, metadata !1, metadata !4, i32 284, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!142 = metadata !{i32 285, i32 0, metadata !141, null}
!143 = metadata !{i32 287, i32 0, metadata !4, null}
!144 = metadata !{i32 328, i32 0, metadata !24, null}
!145 = metadata !{i32 338, i32 0, metadata !146, null}
!146 = metadata !{i32 786443, metadata !1, metadata !24, i32 338, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!147 = metadata !{i32 339, i32 0, metadata !148, null}
!148 = metadata !{i32 786443, metadata !1, metadata !146, i32 338, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!149 = metadata !{i32 340, i32 0, metadata !150, null}
!150 = metadata !{i32 786443, metadata !1, metadata !148, i32 340, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!151 = metadata !{i32 341, i32 0, metadata !152, null}
!152 = metadata !{i32 786443, metadata !1, metadata !148, i32 341, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!153 = metadata !{i32 348, i32 0, metadata !154, null}
!154 = metadata !{i32 786443, metadata !1, metadata !155, i32 347, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!155 = metadata !{i32 786443, metadata !1, metadata !146, i32 346, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!156 = metadata !{null}
!157 = metadata !{i32 361, i32 0, metadata !158, null}
!158 = metadata !{i32 786443, metadata !1, metadata !159, i32 360, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!159 = metadata !{i32 786443, metadata !1, metadata !160, i32 358, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!160 = metadata !{i32 786443, metadata !1, metadata !154, i32 357, i32 0, i32 31} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!161 = metadata !{i32 363, i32 0, metadata !158, null}
!162 = metadata !{i32 358, i32 0, metadata !159, null}
!163 = metadata !{i32 362, i32 0, metadata !158, null}
!164 = metadata !{i32 364, i32 0, metadata !158, null}
!165 = metadata !{i32 365, i32 0, metadata !158, null}
!166 = metadata !{i32 355, i32 0, metadata !154, null}
!167 = metadata !{i32 368, i32 0, metadata !24, null}
!168 = metadata !{i32 303, i32 0, metadata !169, null}
!169 = metadata !{i32 786443, metadata !1, metadata !18, i32 303, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!170 = metadata !{i32 304, i32 0, metadata !169, null}
!171 = metadata !{i32 306, i32 0, metadata !172, null}
!172 = metadata !{i32 786443, metadata !1, metadata !18, i32 306, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!173 = metadata !{i32 307, i32 0, metadata !174, null}
!174 = metadata !{i32 786443, metadata !1, metadata !175, i32 307, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!175 = metadata !{i32 786443, metadata !1, metadata !172, i32 306, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!176 = metadata !{i32 81, i32 0, metadata !139, metadata !177}
!177 = metadata !{i32 308, i32 0, metadata !178, null}
!178 = metadata !{i32 786443, metadata !1, metadata !174, i32 307, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!179 = metadata !{i32 309, i32 0, metadata !180, null}
!180 = metadata !{i32 786443, metadata !1, metadata !178, i32 309, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!181 = metadata !{i32 32}
!182 = metadata !{i32 786689, metadata !34, metadata !"__c", metadata !36, i32 16777295, metadata !8, i32 0, metadata !177} ; [ DW_TAG_arg_variable ] [__c] [line 79]
!183 = metadata !{i32 79, i32 0, metadata !34, metadata !177}
!184 = metadata !{i32 81, i32 0, metadata !139, metadata !179}
!185 = metadata !{i32 81}
!186 = metadata !{i32 786689, metadata !34, metadata !"__c", metadata !36, i32 16777295, metadata !8, i32 0, metadata !179} ; [ DW_TAG_arg_variable ] [__c] [line 79]
!187 = metadata !{i32 79, i32 0, metadata !34, metadata !179}
!188 = metadata !{i32 45}
!189 = metadata !{i32 786689, metadata !34, metadata !"__c", metadata !36, i32 16777295, metadata !8, i32 0, metadata !190} ; [ DW_TAG_arg_variable ] [__c] [line 79]
!190 = metadata !{i32 310, i32 0, metadata !180, null}
!191 = metadata !{i32 79, i32 0, metadata !34, metadata !190}
!192 = metadata !{i32 81, i32 0, metadata !139, metadata !190}
!193 = metadata !{i32 786689, metadata !34, metadata !"__c", metadata !36, i32 16777295, metadata !8, i32 0, metadata !194} ; [ DW_TAG_arg_variable ] [__c] [line 79]
!194 = metadata !{i32 312, i32 0, metadata !175, null}
!195 = metadata !{i32 79, i32 0, metadata !34, metadata !194}
!196 = metadata !{i32 81, i32 0, metadata !139, metadata !194}
!197 = metadata !{i32 314, i32 0, metadata !18, null}
!198 = metadata !{i32 315, i32 0, metadata !18, null}
