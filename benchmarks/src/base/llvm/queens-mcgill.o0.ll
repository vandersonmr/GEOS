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

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  %p = alloca i8*, align 8
  %usage = alloca i8*, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !40), !dbg !41
  store i8** %argv, i8*** %3, align 8
  call void @llvm.dbg.declare(metadata !{i8*** %3}, metadata !42), !dbg !41
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !43), !dbg !44
  call void @llvm.dbg.declare(metadata !{i8** %p}, metadata !45), !dbg !46
  call void @llvm.dbg.declare(metadata !{i8** %usage}, metadata !47), !dbg !48
  store i8* getelementptr inbounds ([168 x i8]* @.str, i32 0, i32 0), i8** %usage, align 8, !dbg !48
  %4 = load i8*** %3, align 8, !dbg !49
  %5 = getelementptr inbounds i8** %4, i64 0, !dbg !49
  %6 = load i8** %5, align 8, !dbg !49
  store i8* %6, i8** @progname, align 8, !dbg !49
  store i32 0, i32* @printing, align 4, !dbg !50
  store i32 14, i32* @queens, align 4, !dbg !51
  store i32 1, i32* @findall, align 4, !dbg !52
  store i32 1, i32* %i, align 4, !dbg !53
  br label %7, !dbg !53

; <label>:7                                       ; preds = %73, %0
  %8 = load i32* %i, align 4, !dbg !53
  %9 = load i32* %2, align 4, !dbg !53
  %10 = icmp slt i32 %8, %9, !dbg !53
  br i1 %10, label %11, label %76, !dbg !53

; <label>:11                                      ; preds = %7
  %12 = load i32* %i, align 4, !dbg !55
  %13 = sext i32 %12 to i64, !dbg !55
  %14 = load i8*** %3, align 8, !dbg !55
  %15 = getelementptr inbounds i8** %14, i64 %13, !dbg !55
  %16 = load i8** %15, align 8, !dbg !55
  store i8* %16, i8** %p, align 8, !dbg !55
  %17 = load i8** %p, align 8, !dbg !57
  %18 = load i8* %17, align 1, !dbg !57
  %19 = sext i8 %18 to i32, !dbg !57
  %20 = icmp eq i32 %19, 45, !dbg !57
  br i1 %20, label %21, label %48, !dbg !57

; <label>:21                                      ; preds = %11
  br label %22, !dbg !59

; <label>:22                                      ; preds = %46, %21
  %23 = load i8** %p, align 8, !dbg !59
  %24 = getelementptr inbounds i8* %23, i32 1, !dbg !59
  store i8* %24, i8** %p, align 8, !dbg !59
  %25 = load i8* %24, align 1, !dbg !59
  %26 = icmp ne i8 %25, 0, !dbg !59
  br i1 %26, label %27, label %47, !dbg !59

; <label>:27                                      ; preds = %22
  %28 = load i8** %p, align 8, !dbg !61
  %29 = load i8* %28, align 1, !dbg !61
  %30 = sext i8 %29 to i32, !dbg !61
  switch i32 %30, label %33 [
    i32 99, label %31
    i32 97, label %32
  ], !dbg !61

; <label>:31                                      ; preds = %27
  store i32 0, i32* @printing, align 4, !dbg !63
  br label %32, !dbg !63

; <label>:32                                      ; preds = %27, %31
  store i32 1, i32* @findall, align 4, !dbg !65
  br label %46, !dbg !66

; <label>:33                                      ; preds = %27
  %34 = load %struct._IO_FILE** @stderr, align 8, !dbg !67
  %35 = load i8** @progname, align 8, !dbg !67
  %36 = load i32* %i, align 4, !dbg !67
  %37 = sext i32 %36 to i64, !dbg !67
  %38 = load i8*** %3, align 8, !dbg !67
  %39 = getelementptr inbounds i8** %38, i64 %37, !dbg !67
  %40 = load i8** %39, align 8, !dbg !67
  %41 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %34, i8* getelementptr inbounds ([25 x i8]* @.str1, i32 0, i32 0), i8* %35, i8* %40), !dbg !67
  %42 = load %struct._IO_FILE** @stderr, align 8, !dbg !68
  %43 = load i8** %usage, align 8, !dbg !68
  %44 = load i8** @progname, align 8, !dbg !68
  %45 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %42, i8* %43, i8* %44), !dbg !68
  call void @exit(i32 -1) #5, !dbg !69
  unreachable, !dbg !69

; <label>:46                                      ; preds = %32
  br label %22, !dbg !70

; <label>:47                                      ; preds = %22
  br label %72, !dbg !71

; <label>:48                                      ; preds = %11
  %49 = load i8** %p, align 8, !dbg !72
  %50 = call i32 (i8*, i8*, ...)* @__isoc99_sscanf(i8* %49, i8* getelementptr inbounds ([3 x i8]* @.str2, i32 0, i32 0), i32* @queens) #6, !dbg !72
  %51 = icmp ne i32 %50, 1, !dbg !72
  br i1 %51, label %52, label %57, !dbg !72

; <label>:52                                      ; preds = %48
  %53 = load %struct._IO_FILE** @stderr, align 8, !dbg !75
  %54 = load i8** @progname, align 8, !dbg !75
  %55 = load i8** %p, align 8, !dbg !75
  %56 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %53, i8* getelementptr inbounds ([31 x i8]* @.str3, i32 0, i32 0), i8* %54, i8* %55), !dbg !75
  call void @exit(i32 -1) #5, !dbg !77
  unreachable, !dbg !77

; <label>:57                                      ; preds = %48
  %58 = load i32* @queens, align 4, !dbg !78
  %59 = icmp sle i32 %58, 0, !dbg !78
  br i1 %59, label %60, label %64, !dbg !78

; <label>:60                                      ; preds = %57
  %61 = load %struct._IO_FILE** @stderr, align 8, !dbg !80
  %62 = load i8** @progname, align 8, !dbg !80
  %63 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %61, i8* getelementptr inbounds ([32 x i8]* @.str4, i32 0, i32 0), i8* %62), !dbg !80
  call void @exit(i32 -1) #5, !dbg !82
  unreachable, !dbg !82

; <label>:64                                      ; preds = %57
  %65 = load i32* @queens, align 4, !dbg !83
  %66 = icmp sgt i32 %65, 100, !dbg !83
  br i1 %66, label %67, label %71, !dbg !83

; <label>:67                                      ; preds = %64
  %68 = load %struct._IO_FILE** @stderr, align 8, !dbg !85
  %69 = load i8** @progname, align 8, !dbg !85
  %70 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %68, i8* getelementptr inbounds ([36 x i8]* @.str5, i32 0, i32 0), i8* %69, i32 100), !dbg !85
  call void @exit(i32 -1) #5, !dbg !87
  unreachable, !dbg !87

; <label>:71                                      ; preds = %64
  br label %72

; <label>:72                                      ; preds = %71, %47
  br label %73, !dbg !88

; <label>:73                                      ; preds = %72
  %74 = load i32* %i, align 4, !dbg !53
  %75 = add nsw i32 %74, 1, !dbg !53
  store i32 %75, i32* %i, align 4, !dbg !53
  br label %7, !dbg !53

; <label>:76                                      ; preds = %7
  %77 = load i32* @queens, align 4, !dbg !89
  %78 = icmp ne i32 %77, 0, !dbg !89
  br i1 %78, label %87, label %79, !dbg !89

; <label>:79                                      ; preds = %76
  %80 = load %struct._IO_FILE** @stderr, align 8, !dbg !91
  %81 = load i8** @progname, align 8, !dbg !91
  %82 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %80, i8* getelementptr inbounds ([24 x i8]* @.str6, i32 0, i32 0), i8* %81), !dbg !91
  %83 = load %struct._IO_FILE** @stderr, align 8, !dbg !93
  %84 = load i8** %usage, align 8, !dbg !93
  %85 = load i8** @progname, align 8, !dbg !93
  %86 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %83, i8* %84, i8* %85), !dbg !93
  call void @exit(i32 -1) #5, !dbg !94
  unreachable, !dbg !94

; <label>:87                                      ; preds = %76
  %88 = load i32* @queens, align 4, !dbg !95
  store i32 %88, i32* @files, align 4, !dbg !95
  store i32 %88, i32* @ranks, align 4, !dbg !95
  %89 = load i32* @queens, align 4, !dbg !96
  %90 = load i32* @queens, align 4, !dbg !96
  %91 = icmp sgt i32 %90, 1, !dbg !96
  %92 = select i1 %91, i8* getelementptr inbounds ([2 x i8]* @.str8, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str9, i32 0, i32 0), !dbg !96
  %93 = load i32* @ranks, align 4, !dbg !96
  %94 = load i32* @files, align 4, !dbg !96
  %95 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str7, i32 0, i32 0), i32 %89, i8* %92, i32 %93, i32 %94), !dbg !96
  %96 = load %struct._IO_FILE** @stdout, align 8, !dbg !97
  %97 = call i32 @fflush(%struct._IO_FILE* %96), !dbg !97
  store i64 0, i64* @solutions, align 8, !dbg !98
  store i32 0, i32* %i, align 4, !dbg !99
  br label %98, !dbg !99

; <label>:98                                      ; preds = %105, %87
  %99 = load i32* %i, align 4, !dbg !99
  %100 = icmp slt i32 %99, 100, !dbg !99
  br i1 %100, label %101, label %108, !dbg !99

; <label>:101                                     ; preds = %98
  %102 = load i32* %i, align 4, !dbg !99
  %103 = sext i32 %102 to i64, !dbg !99
  %104 = getelementptr inbounds [100 x i32]* @file, i32 0, i64 %103, !dbg !99
  store i32 101, i32* %104, align 4, !dbg !99
  br label %105, !dbg !99

; <label>:105                                     ; preds = %101
  %106 = load i32* %i, align 4, !dbg !99
  %107 = add nsw i32 %106, 1, !dbg !99
  store i32 %107, i32* %i, align 4, !dbg !99
  br label %98, !dbg !99

; <label>:108                                     ; preds = %98
  store i32 0, i32* %i, align 4, !dbg !101
  br label %109, !dbg !101

; <label>:109                                     ; preds = %119, %108
  %110 = load i32* %i, align 4, !dbg !101
  %111 = icmp slt i32 %110, 199, !dbg !101
  br i1 %111, label %112, label %122, !dbg !101

; <label>:112                                     ; preds = %109
  %113 = load i32* %i, align 4, !dbg !101
  %114 = sext i32 %113 to i64, !dbg !101
  %115 = getelementptr inbounds [199 x i32]* @bakdiag, i32 0, i64 %114, !dbg !101
  store i32 101, i32* %115, align 4, !dbg !101
  %116 = load i32* %i, align 4, !dbg !101
  %117 = sext i32 %116 to i64, !dbg !101
  %118 = getelementptr inbounds [199 x i32]* @fordiag, i32 0, i64 %117, !dbg !101
  store i32 101, i32* %118, align 4, !dbg !101
  br label %119, !dbg !101

; <label>:119                                     ; preds = %112
  %120 = load i32* %i, align 4, !dbg !101
  %121 = add nsw i32 %120, 1, !dbg !101
  store i32 %121, i32* %i, align 4, !dbg !101
  br label %109, !dbg !101

; <label>:122                                     ; preds = %109
  call void @find(i32 0), !dbg !103
  %123 = load i32* @printing, align 4, !dbg !104
  %124 = icmp ne i32 %123, 0, !dbg !104
  br i1 %124, label %125, label %130, !dbg !104

; <label>:125                                     ; preds = %122
  %126 = load i64* @solutions, align 8, !dbg !104
  %127 = icmp ne i64 %126, 0, !dbg !104
  br i1 %127, label %128, label %130, !dbg !104

; <label>:128                                     ; preds = %125
  %129 = call i32 @putchar(i32 10), !dbg !104
  br label %130, !dbg !104

; <label>:130                                     ; preds = %128, %125, %122
  %131 = load i64* @solutions, align 8, !dbg !106
  %132 = icmp eq i64 %131, 1, !dbg !106
  br i1 %132, label %133, label %135, !dbg !106

; <label>:133                                     ; preds = %130
  %134 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([24 x i8]* @.str10, i32 0, i32 0)), !dbg !106
  br label %138, !dbg !106

; <label>:135                                     ; preds = %130
  %136 = load i64* @solutions, align 8, !dbg !108
  %137 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str11, i32 0, i32 0), i64 %136), !dbg !108
  br label %138

; <label>:138                                     ; preds = %135, %133
  call void @exit(i32 0) #5, !dbg !109
  unreachable, !dbg !109
                                                  ; No predecessors!
  %140 = load i32* %1, !dbg !110
  ret i32 %140, !dbg !110
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

; Function Attrs: nounwind
declare i32 @__isoc99_sscanf(i8*, i8*, ...) #4

declare i32 @printf(i8*, ...) #2

declare i32 @fflush(%struct._IO_FILE*) #2

; Function Attrs: nounwind uwtable
define void @find(i32 %level) #0 {
  %1 = alloca i32, align 4
  %f = alloca i32, align 4
  %fp = alloca i32*, align 8
  %fdp = alloca i32*, align 8
  %bdp = alloca i32*, align 8
  store i32 %level, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !111), !dbg !112
  call void @llvm.dbg.declare(metadata !{i32* %f}, metadata !113), !dbg !114
  call void @llvm.dbg.declare(metadata !{i32** %fp}, metadata !115), !dbg !117
  call void @llvm.dbg.declare(metadata !{i32** %fdp}, metadata !118), !dbg !117
  call void @llvm.dbg.declare(metadata !{i32** %bdp}, metadata !119), !dbg !117
  %2 = load i32* %1, align 4, !dbg !120
  %3 = load i32* @queens, align 4, !dbg !120
  %4 = icmp eq i32 %2, %3, !dbg !120
  br i1 %4, label %5, label %16, !dbg !120

; <label>:5                                       ; preds = %0
  %6 = load i64* @solutions, align 8, !dbg !122
  %7 = add i64 %6, 1, !dbg !122
  store i64 %7, i64* @solutions, align 8, !dbg !122
  %8 = load i32* @printing, align 4, !dbg !124
  %9 = icmp ne i32 %8, 0, !dbg !124
  br i1 %9, label %10, label %11, !dbg !124

; <label>:10                                      ; preds = %5
  call void @pboard(), !dbg !124
  br label %11, !dbg !124

; <label>:11                                      ; preds = %10, %5
  %12 = load i32* @findall, align 4, !dbg !126
  %13 = icmp ne i32 %12, 0, !dbg !126
  br i1 %13, label %15, label %14, !dbg !126

; <label>:14                                      ; preds = %11
  call void @exit(i32 0) #5, !dbg !126
  unreachable, !dbg !126

; <label>:15                                      ; preds = %11
  br label %70, !dbg !128

; <label>:16                                      ; preds = %0
  store i32 0, i32* %f, align 4, !dbg !129
  store i32* getelementptr inbounds ([100 x i32]* @file, i32 0, i32 0), i32** %fp, align 8, !dbg !129
  %17 = load i32* %1, align 4, !dbg !129
  %18 = sext i32 %17 to i64, !dbg !129
  %19 = getelementptr inbounds [199 x i32]* @fordiag, i32 0, i64 %18, !dbg !129
  store i32* %19, i32** %fdp, align 8, !dbg !129
  %20 = load i32* %1, align 4, !dbg !129
  %21 = load i32* @files, align 4, !dbg !129
  %22 = add nsw i32 %20, %21, !dbg !129
  %23 = sub nsw i32 %22, 1, !dbg !129
  %24 = sext i32 %23 to i64, !dbg !129
  %25 = getelementptr inbounds [199 x i32]* @bakdiag, i32 0, i64 %24, !dbg !129
  store i32* %25, i32** %bdp, align 8, !dbg !129
  br label %26, !dbg !129

; <label>:26                                      ; preds = %60, %16
  %27 = load i32* %f, align 4, !dbg !129
  %28 = load i32* @files, align 4, !dbg !129
  %29 = icmp slt i32 %27, %28, !dbg !129
  br i1 %29, label %30, label %69, !dbg !129

; <label>:30                                      ; preds = %26
  %31 = load i32** %fp, align 8, !dbg !132
  %32 = load i32* %31, align 4, !dbg !132
  %33 = load i32* %1, align 4, !dbg !132
  %34 = icmp sge i32 %32, %33, !dbg !132
  br i1 %34, label %35, label %59, !dbg !132

; <label>:35                                      ; preds = %30
  %36 = load i32** %fdp, align 8, !dbg !132
  %37 = load i32* %36, align 4, !dbg !132
  %38 = load i32* %1, align 4, !dbg !132
  %39 = icmp sge i32 %37, %38, !dbg !132
  br i1 %39, label %40, label %59, !dbg !132

; <label>:40                                      ; preds = %35
  %41 = load i32** %bdp, align 8, !dbg !132
  %42 = load i32* %41, align 4, !dbg !132
  %43 = load i32* %1, align 4, !dbg !132
  %44 = icmp sge i32 %42, %43, !dbg !132
  br i1 %44, label %45, label %59, !dbg !132

; <label>:45                                      ; preds = %40
  %46 = load i32* %f, align 4, !dbg !135
  %47 = load i32* %1, align 4, !dbg !135
  %48 = sext i32 %47 to i64, !dbg !135
  %49 = getelementptr inbounds [100 x i32]* @queen, i32 0, i64 %48, !dbg !135
  store i32 %46, i32* %49, align 4, !dbg !135
  %50 = load i32* %1, align 4, !dbg !137
  %51 = load i32** %bdp, align 8, !dbg !137
  store i32 %50, i32* %51, align 4, !dbg !137
  %52 = load i32** %fdp, align 8, !dbg !137
  store i32 %50, i32* %52, align 4, !dbg !137
  %53 = load i32** %fp, align 8, !dbg !137
  store i32 %50, i32* %53, align 4, !dbg !137
  %54 = load i32* %1, align 4, !dbg !138
  %55 = add nsw i32 %54, 1, !dbg !138
  call void @find(i32 %55), !dbg !138
  %56 = load i32** %bdp, align 8, !dbg !139
  store i32 101, i32* %56, align 4, !dbg !139
  %57 = load i32** %fdp, align 8, !dbg !139
  store i32 101, i32* %57, align 4, !dbg !139
  %58 = load i32** %fp, align 8, !dbg !139
  store i32 101, i32* %58, align 4, !dbg !139
  br label %59, !dbg !140

; <label>:59                                      ; preds = %45, %40, %35, %30
  br label %60, !dbg !141

; <label>:60                                      ; preds = %59
  %61 = load i32* %f, align 4, !dbg !142
  %62 = add nsw i32 %61, 1, !dbg !142
  store i32 %62, i32* %f, align 4, !dbg !142
  %63 = load i32** %fp, align 8, !dbg !142
  %64 = getelementptr inbounds i32* %63, i32 1, !dbg !142
  store i32* %64, i32** %fp, align 8, !dbg !142
  %65 = load i32** %fdp, align 8, !dbg !142
  %66 = getelementptr inbounds i32* %65, i32 1, !dbg !142
  store i32* %66, i32** %fdp, align 8, !dbg !142
  %67 = load i32** %bdp, align 8, !dbg !142
  %68 = getelementptr inbounds i32* %67, i32 -1, !dbg !142
  store i32* %68, i32** %bdp, align 8, !dbg !142
  br label %26, !dbg !142

; <label>:69                                      ; preds = %26
  br label %70

; <label>:70                                      ; preds = %69, %15
  ret void, !dbg !143
}

declare i32 @putchar(i32) #2

; Function Attrs: nounwind uwtable
define void @pboard() #0 {
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !144), !dbg !145
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !146), !dbg !145
  %1 = load i32* @findall, align 4, !dbg !147
  %2 = icmp ne i32 %1, 0, !dbg !147
  br i1 %2, label %3, label %6, !dbg !147

; <label>:3                                       ; preds = %0
  %4 = load i64* @solutions, align 8, !dbg !149
  %5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str12, i32 0, i32 0), i64 %4), !dbg !149
  br label %6, !dbg !149

; <label>:6                                       ; preds = %3, %0
  store i32 0, i32* %i, align 4, !dbg !150
  br label %7, !dbg !150

; <label>:7                                       ; preds = %34, %6
  %8 = load i32* %i, align 4, !dbg !150
  %9 = load i32* @ranks, align 4, !dbg !150
  %10 = icmp slt i32 %8, %9, !dbg !150
  br i1 %10, label %11, label %37, !dbg !150

; <label>:11                                      ; preds = %7
  store i32 0, i32* %j, align 4, !dbg !152
  br label %12, !dbg !152

; <label>:12                                      ; preds = %29, %11
  %13 = load i32* %j, align 4, !dbg !152
  %14 = load i32* @files, align 4, !dbg !152
  %15 = icmp slt i32 %13, %14, !dbg !152
  br i1 %15, label %16, label %32, !dbg !152

; <label>:16                                      ; preds = %12
  %17 = call i32 @putchar(i32 32), !dbg !155
  %18 = load i32* %j, align 4, !dbg !157
  %19 = load i32* %i, align 4, !dbg !157
  %20 = sext i32 %19 to i64, !dbg !157
  %21 = getelementptr inbounds [100 x i32]* @queen, i32 0, i64 %20, !dbg !157
  %22 = load i32* %21, align 4, !dbg !157
  %23 = icmp eq i32 %18, %22, !dbg !157
  br i1 %23, label %24, label %26, !dbg !157

; <label>:24                                      ; preds = %16
  %25 = call i32 @putchar(i32 81), !dbg !157
  br label %28, !dbg !157

; <label>:26                                      ; preds = %16
  %27 = call i32 @putchar(i32 45), !dbg !159
  br label %28

; <label>:28                                      ; preds = %26, %24
  br label %29, !dbg !160

; <label>:29                                      ; preds = %28
  %30 = load i32* %j, align 4, !dbg !152
  %31 = add nsw i32 %30, 1, !dbg !152
  store i32 %31, i32* %j, align 4, !dbg !152
  br label %12, !dbg !152

; <label>:32                                      ; preds = %12
  %33 = call i32 @putchar(i32 10), !dbg !161
  br label %34, !dbg !162

; <label>:34                                      ; preds = %32
  %35 = load i32* %i, align 4, !dbg !150
  %36 = add nsw i32 %35, 1, !dbg !150
  store i32 %36, i32* %i, align 4, !dbg !150
  br label %7, !dbg !150

; <label>:37                                      ; preds = %7
  %38 = load %struct._IO_FILE** @stdout, align 8, !dbg !163
  %39 = call i32 @fflush(%struct._IO_FILE* %38), !dbg !163
  ret void, !dbg !164
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

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !18, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c] [DW_LANG_C99]
!1 = metadata !{metadata !"queens-mcgill.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !12, metadata !15}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 205, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main, null, null, metadata !2, i32 206} ; [ DW_TAG_subprogram ] [line 205] [def] [scope 206] [main]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !9}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!11 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"pboard", metadata !"pboard", metadata !"", i32 299, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @pboard, null, null, metadata !2, i32 300} ; [ DW_TAG_subprogram ] [line 299] [def] [scope 300] [pboard]
!13 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = metadata !{null}
!15 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"find", metadata !"find", metadata !"", i32 328, metadata !16, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32)* @find, null, null, metadata !2, i32 329} ; [ DW_TAG_subprogram ] [line 328] [def] [scope 329] [find]
!16 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !17, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!17 = metadata !{null, metadata !8}
!18 = metadata !{metadata !19, metadata !20, metadata !21, metadata !23, metadata !24, metadata !25, metadata !26, metadata !27, metadata !31, metadata !32, metadata !36}
!19 = metadata !{i32 786484, i32 0, null, metadata !"printing", metadata !"printing", metadata !"", metadata !5, i32 183, metadata !8, i32 0, i32 1, i32* @printing, null} ; [ DW_TAG_variable ] [printing] [line 183] [def]
!20 = metadata !{i32 786484, i32 0, null, metadata !"findall", metadata !"findall", metadata !"", metadata !5, i32 184, metadata !8, i32 0, i32 1, i32* @findall, null} ; [ DW_TAG_variable ] [findall] [line 184] [def]
!21 = metadata !{i32 786484, i32 0, null, metadata !"solutions", metadata !"solutions", metadata !"", metadata !5, i32 186, metadata !22, i32 0, i32 1, i64* @solutions, null} ; [ DW_TAG_variable ] [solutions] [line 186] [def]
!22 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!23 = metadata !{i32 786484, i32 0, null, metadata !"progname", metadata !"progname", metadata !"", metadata !5, i32 191, metadata !10, i32 0, i32 1, i8** @progname, null} ; [ DW_TAG_variable ] [progname] [line 191] [def]
!24 = metadata !{i32 786484, i32 0, null, metadata !"queens", metadata !"queens", metadata !"", metadata !5, i32 180, metadata !8, i32 0, i32 1, i32* @queens, null} ; [ DW_TAG_variable ] [queens] [line 180] [def]
!25 = metadata !{i32 786484, i32 0, null, metadata !"ranks", metadata !"ranks", metadata !"", metadata !5, i32 181, metadata !8, i32 0, i32 1, i32* @ranks, null} ; [ DW_TAG_variable ] [ranks] [line 181] [def]
!26 = metadata !{i32 786484, i32 0, null, metadata !"files", metadata !"files", metadata !"", metadata !5, i32 182, metadata !8, i32 0, i32 1, i32* @files, null} ; [ DW_TAG_variable ] [files] [line 182] [def]
!27 = metadata !{i32 786484, i32 0, null, metadata !"queen", metadata !"queen", metadata !"", metadata !5, i32 187, metadata !28, i32 0, i32 1, [100 x i32]* @queen, null} ; [ DW_TAG_variable ] [queen] [line 187] [def]
!28 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 3200, i64 32, i32 0, i32 0, metadata !8, metadata !29, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 3200, align 32, offset 0] [from int]
!29 = metadata !{metadata !30}
!30 = metadata !{i32 786465, i64 0, i64 100}      ; [ DW_TAG_subrange_type ] [0, 99]
!31 = metadata !{i32 786484, i32 0, null, metadata !"file", metadata !"file", metadata !"", metadata !5, i32 188, metadata !28, i32 0, i32 1, [100 x i32]* @file, null} ; [ DW_TAG_variable ] [file] [line 188] [def]
!32 = metadata !{i32 786484, i32 0, null, metadata !"fordiag", metadata !"fordiag", metadata !"", metadata !5, i32 189, metadata !33, i32 0, i32 1, [199 x i32]* @fordiag, null} ; [ DW_TAG_variable ] [fordiag] [line 189] [def]
!33 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 6368, i64 32, i32 0, i32 0, metadata !8, metadata !34, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 6368, align 32, offset 0] [from int]
!34 = metadata !{metadata !35}
!35 = metadata !{i32 786465, i64 0, i64 199}      ; [ DW_TAG_subrange_type ] [0, 198]
!36 = metadata !{i32 786484, i32 0, null, metadata !"bakdiag", metadata !"bakdiag", metadata !"", metadata !5, i32 190, metadata !33, i32 0, i32 1, [199 x i32]* @bakdiag, null} ; [ DW_TAG_variable ] [bakdiag] [line 190] [def]
!37 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!38 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!39 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!40 = metadata !{i32 786689, metadata !4, metadata !"argc", metadata !5, i32 16777421, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 205]
!41 = metadata !{i32 205, i32 0, metadata !4, null}
!42 = metadata !{i32 786689, metadata !4, metadata !"argv", metadata !5, i32 33554637, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 205]
!43 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 207, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 207]
!44 = metadata !{i32 207, i32 0, metadata !4, null}
!45 = metadata !{i32 786688, metadata !4, metadata !"p", metadata !5, i32 208, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [p] [line 208]
!46 = metadata !{i32 208, i32 0, metadata !4, null}
!47 = metadata !{i32 786688, metadata !4, metadata !"usage", metadata !5, i32 209, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [usage] [line 209]
!48 = metadata !{i32 209, i32 0, metadata !4, null}
!49 = metadata !{i32 219, i32 0, metadata !4, null}
!50 = metadata !{i32 222, i32 0, metadata !4, null}
!51 = metadata !{i32 226, i32 0, metadata !4, null}
!52 = metadata !{i32 228, i32 0, metadata !4, null}
!53 = metadata !{i32 230, i32 0, metadata !54, null}
!54 = metadata !{i32 786443, metadata !1, metadata !4, i32 230, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!55 = metadata !{i32 231, i32 0, metadata !56, null}
!56 = metadata !{i32 786443, metadata !1, metadata !54, i32 230, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!57 = metadata !{i32 232, i32 0, metadata !58, null}
!58 = metadata !{i32 786443, metadata !1, metadata !56, i32 232, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!59 = metadata !{i32 233, i32 0, metadata !60, null}
!60 = metadata !{i32 786443, metadata !1, metadata !58, i32 232, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!61 = metadata !{i32 234, i32 0, metadata !62, null}
!62 = metadata !{i32 786443, metadata !1, metadata !60, i32 233, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!63 = metadata !{i32 236, i32 0, metadata !64, null}
!64 = metadata !{i32 786443, metadata !1, metadata !62, i32 234, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!65 = metadata !{i32 238, i32 0, metadata !64, null}
!66 = metadata !{i32 239, i32 0, metadata !64, null}
!67 = metadata !{i32 241, i32 0, metadata !64, null}
!68 = metadata !{i32 242, i32 0, metadata !64, null}
!69 = metadata !{i32 243, i32 0, metadata !64, null}
!70 = metadata !{i32 245, i32 0, metadata !62, null}
!71 = metadata !{i32 246, i32 0, metadata !60, null}
!72 = metadata !{i32 248, i32 0, metadata !73, null}
!73 = metadata !{i32 786443, metadata !1, metadata !74, i32 248, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!74 = metadata !{i32 786443, metadata !1, metadata !58, i32 247, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!75 = metadata !{i32 249, i32 0, metadata !76, null}
!76 = metadata !{i32 786443, metadata !1, metadata !73, i32 248, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!77 = metadata !{i32 250, i32 0, metadata !76, null}
!78 = metadata !{i32 252, i32 0, metadata !79, null}
!79 = metadata !{i32 786443, metadata !1, metadata !74, i32 252, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!80 = metadata !{i32 253, i32 0, metadata !81, null}
!81 = metadata !{i32 786443, metadata !1, metadata !79, i32 252, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!82 = metadata !{i32 254, i32 0, metadata !81, null}
!83 = metadata !{i32 256, i32 0, metadata !84, null}
!84 = metadata !{i32 786443, metadata !1, metadata !74, i32 256, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!85 = metadata !{i32 257, i32 0, metadata !86, null}
!86 = metadata !{i32 786443, metadata !1, metadata !84, i32 256, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!87 = metadata !{i32 259, i32 0, metadata !86, null}
!88 = metadata !{i32 262, i32 0, metadata !56, null}
!89 = metadata !{i32 263, i32 0, metadata !90, null}
!90 = metadata !{i32 786443, metadata !1, metadata !4, i32 263, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!91 = metadata !{i32 264, i32 0, metadata !92, null}
!92 = metadata !{i32 786443, metadata !1, metadata !90, i32 263, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!93 = metadata !{i32 265, i32 0, metadata !92, null}
!94 = metadata !{i32 266, i32 0, metadata !92, null}
!95 = metadata !{i32 269, i32 0, metadata !4, null}
!96 = metadata !{i32 270, i32 0, metadata !4, null}
!97 = metadata !{i32 272, i32 0, metadata !4, null}
!98 = metadata !{i32 275, i32 0, metadata !4, null}
!99 = metadata !{i32 276, i32 0, metadata !100, null}
!100 = metadata !{i32 786443, metadata !1, metadata !4, i32 276, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!101 = metadata !{i32 277, i32 0, metadata !102, null}
!102 = metadata !{i32 786443, metadata !1, metadata !4, i32 277, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!103 = metadata !{i32 280, i32 0, metadata !4, null}
!104 = metadata !{i32 281, i32 0, metadata !105, null}
!105 = metadata !{i32 786443, metadata !1, metadata !4, i32 281, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!106 = metadata !{i32 284, i32 0, metadata !107, null}
!107 = metadata !{i32 786443, metadata !1, metadata !4, i32 284, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!108 = metadata !{i32 285, i32 0, metadata !107, null}
!109 = metadata !{i32 287, i32 0, metadata !4, null}
!110 = metadata !{i32 288, i32 0, metadata !4, null}
!111 = metadata !{i32 786689, metadata !15, metadata !"level", metadata !5, i32 16777544, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [level] [line 328]
!112 = metadata !{i32 328, i32 0, metadata !15, null}
!113 = metadata !{i32 786688, metadata !15, metadata !"f", metadata !5, i32 330, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 330]
!114 = metadata !{i32 330, i32 0, metadata !15, null}
!115 = metadata !{i32 786688, metadata !15, metadata !"fp", metadata !5, i32 331, metadata !116, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [fp] [line 331]
!116 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !8} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!117 = metadata !{i32 331, i32 0, metadata !15, null}
!118 = metadata !{i32 786688, metadata !15, metadata !"fdp", metadata !5, i32 331, metadata !116, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [fdp] [line 331]
!119 = metadata !{i32 786688, metadata !15, metadata !"bdp", metadata !5, i32 331, metadata !116, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [bdp] [line 331]
!120 = metadata !{i32 338, i32 0, metadata !121, null}
!121 = metadata !{i32 786443, metadata !1, metadata !15, i32 338, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!122 = metadata !{i32 339, i32 0, metadata !123, null}
!123 = metadata !{i32 786443, metadata !1, metadata !121, i32 338, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!124 = metadata !{i32 340, i32 0, metadata !125, null}
!125 = metadata !{i32 786443, metadata !1, metadata !123, i32 340, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!126 = metadata !{i32 341, i32 0, metadata !127, null}
!127 = metadata !{i32 786443, metadata !1, metadata !123, i32 341, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!128 = metadata !{i32 345, i32 0, metadata !123, null}
!129 = metadata !{i32 348, i32 0, metadata !130, null}
!130 = metadata !{i32 786443, metadata !1, metadata !131, i32 347, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!131 = metadata !{i32 786443, metadata !1, metadata !121, i32 346, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!132 = metadata !{i32 358, i32 0, metadata !133, null}
!133 = metadata !{i32 786443, metadata !1, metadata !134, i32 358, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!134 = metadata !{i32 786443, metadata !1, metadata !130, i32 357, i32 0, i32 31} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!135 = metadata !{i32 361, i32 0, metadata !136, null}
!136 = metadata !{i32 786443, metadata !1, metadata !133, i32 360, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!137 = metadata !{i32 362, i32 0, metadata !136, null}
!138 = metadata !{i32 363, i32 0, metadata !136, null}
!139 = metadata !{i32 364, i32 0, metadata !136, null}
!140 = metadata !{i32 365, i32 0, metadata !136, null}
!141 = metadata !{i32 366, i32 0, metadata !134, null}
!142 = metadata !{i32 355, i32 0, metadata !130, null}
!143 = metadata !{i32 368, i32 0, metadata !15, null}
!144 = metadata !{i32 786688, metadata !12, metadata !"i", metadata !5, i32 301, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 301]
!145 = metadata !{i32 301, i32 0, metadata !12, null}
!146 = metadata !{i32 786688, metadata !12, metadata !"j", metadata !5, i32 301, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 301]
!147 = metadata !{i32 303, i32 0, metadata !148, null}
!148 = metadata !{i32 786443, metadata !1, metadata !12, i32 303, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!149 = metadata !{i32 304, i32 0, metadata !148, null}
!150 = metadata !{i32 306, i32 0, metadata !151, null}
!151 = metadata !{i32 786443, metadata !1, metadata !12, i32 306, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!152 = metadata !{i32 307, i32 0, metadata !153, null}
!153 = metadata !{i32 786443, metadata !1, metadata !154, i32 307, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!154 = metadata !{i32 786443, metadata !1, metadata !151, i32 306, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!155 = metadata !{i32 308, i32 0, metadata !156, null}
!156 = metadata !{i32 786443, metadata !1, metadata !153, i32 307, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!157 = metadata !{i32 309, i32 0, metadata !158, null}
!158 = metadata !{i32 786443, metadata !1, metadata !156, i32 309, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens-mcgill.c]
!159 = metadata !{i32 310, i32 0, metadata !158, null}
!160 = metadata !{i32 311, i32 0, metadata !156, null}
!161 = metadata !{i32 312, i32 0, metadata !154, null}
!162 = metadata !{i32 313, i32 0, metadata !154, null}
!163 = metadata !{i32 314, i32 0, metadata !12, null}
!164 = metadata !{i32 315, i32 0, metadata !12, null}
