; ModuleID = 'chomp.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._play = type { i32, i32*, %struct._list*, %struct._play* }
%struct._list = type { i32*, %struct._list* }

@ncol = common global i32 0, align 4
@nrow = common global i32 0, align 4
@game_tree = common global %struct._play* null, align 8
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str1 = private unnamed_addr constant [3 x i8] c")\0A\00", align 1
@.str2 = private unnamed_addr constant [13 x i8] c"For state :\0A\00", align 1
@.str3 = private unnamed_addr constant [14 x i8] c"  value = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [20 x i8] c"We get, in order :\0A\00", align 1
@wanted = common global %struct._list* null, align 8
@.str5 = private unnamed_addr constant [34 x i8] c"Mode : 1 -> multiple first moves\0A\00", align 1
@.str6 = private unnamed_addr constant [25 x i8] c"       2 -> report game\0A\00", align 1
@.str7 = private unnamed_addr constant [28 x i8] c"       3 -> good positions\0A\00", align 1
@.str8 = private unnamed_addr constant [14 x i8] c" Selection : \00", align 1
@.str9 = private unnamed_addr constant [33 x i8] c"Enter number of Columns       : \00", align 1
@.str10 = private unnamed_addr constant [32 x i8] c"Enter Initial number of Rows : \00", align 1
@.str11 = private unnamed_addr constant [32 x i8] c"Enter Maximum number of Rows : \00", align 1
@.str12 = private unnamed_addr constant [55 x i8] c"The winning initial move for %d x %d CHOMP is (%d,%d)\0A\00", align 1
@.str13 = private unnamed_addr constant [27 x i8] c"Enter number of Columns : \00", align 1
@.str14 = private unnamed_addr constant [27 x i8] c"Enter number of Rows    : \00", align 1
@.str15 = private unnamed_addr constant [28 x i8] c"player %d plays at (%d,%d)\0A\00", align 1
@.str16 = private unnamed_addr constant [17 x i8] c"player %d loses\0A\00", align 1
@.str17 = private unnamed_addr constant [55 x i8] c"ATTENTION : representation is as in a _data structure\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32* @copy_data(i32* %data) #0 {
  %1 = alloca i32*, align 8
  %new = alloca i32*, align 8
  %counter = alloca i32, align 4
  store i32* %data, i32** %1, align 8
  call void @llvm.dbg.declare(metadata !{i32** %1}, metadata !79), !dbg !80
  call void @llvm.dbg.declare(metadata !{i32** %new}, metadata !81), !dbg !82
  %2 = load i32* @ncol, align 4, !dbg !82
  %3 = sext i32 %2 to i64, !dbg !82
  %4 = mul i64 %3, 4, !dbg !82
  %5 = call noalias i8* @malloc(i64 %4) #4, !dbg !82
  %6 = bitcast i8* %5 to i32*, !dbg !82
  store i32* %6, i32** %new, align 8, !dbg !82
  call void @llvm.dbg.declare(metadata !{i32* %counter}, metadata !83), !dbg !84
  %7 = load i32* @ncol, align 4, !dbg !84
  store i32 %7, i32* %counter, align 4, !dbg !84
  br label %8, !dbg !85

; <label>:8                                       ; preds = %12, %0
  %9 = load i32* %counter, align 4, !dbg !85
  %10 = add nsw i32 %9, -1, !dbg !85
  store i32 %10, i32* %counter, align 4, !dbg !85
  %11 = icmp ne i32 %9, 0, !dbg !85
  br i1 %11, label %12, label %22, !dbg !85

; <label>:12                                      ; preds = %8
  %13 = load i32* %counter, align 4, !dbg !86
  %14 = sext i32 %13 to i64, !dbg !86
  %15 = load i32** %1, align 8, !dbg !86
  %16 = getelementptr inbounds i32* %15, i64 %14, !dbg !86
  %17 = load i32* %16, align 4, !dbg !86
  %18 = load i32* %counter, align 4, !dbg !86
  %19 = sext i32 %18 to i64, !dbg !86
  %20 = load i32** %new, align 8, !dbg !86
  %21 = getelementptr inbounds i32* %20, i64 %19, !dbg !86
  store i32 %17, i32* %21, align 4, !dbg !86
  br label %8, !dbg !86

; <label>:22                                      ; preds = %8
  %23 = load i32** %new, align 8, !dbg !87
  ret i32* %23, !dbg !87
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind uwtable
define i32 @next_data(i32* %data) #0 {
  %1 = alloca i32*, align 8
  %counter = alloca i32, align 4
  %valid = alloca i32, align 4
  store i32* %data, i32** %1, align 8
  call void @llvm.dbg.declare(metadata !{i32** %1}, metadata !88), !dbg !89
  call void @llvm.dbg.declare(metadata !{i32* %counter}, metadata !90), !dbg !91
  store i32 0, i32* %counter, align 4, !dbg !91
  call void @llvm.dbg.declare(metadata !{i32* %valid}, metadata !92), !dbg !93
  store i32 0, i32* %valid, align 4, !dbg !93
  br label %2, !dbg !94

; <label>:2                                       ; preds = %34, %0
  %3 = load i32* %counter, align 4, !dbg !94
  %4 = load i32* @ncol, align 4, !dbg !94
  %5 = icmp ne i32 %3, %4, !dbg !94
  br i1 %5, label %6, label %10, !dbg !94

; <label>:6                                       ; preds = %2
  %7 = load i32* %valid, align 4, !dbg !94
  %8 = icmp ne i32 %7, 0, !dbg !94
  %9 = xor i1 %8, true, !dbg !94
  br label %10

; <label>:10                                      ; preds = %6, %2
  %11 = phi i1 [ false, %2 ], [ %9, %6 ]
  br i1 %11, label %12, label %35

; <label>:12                                      ; preds = %10
  %13 = load i32* %counter, align 4, !dbg !95
  %14 = sext i32 %13 to i64, !dbg !95
  %15 = load i32** %1, align 8, !dbg !95
  %16 = getelementptr inbounds i32* %15, i64 %14, !dbg !95
  %17 = load i32* %16, align 4, !dbg !95
  %18 = load i32* @nrow, align 4, !dbg !95
  %19 = icmp eq i32 %17, %18, !dbg !95
  br i1 %19, label %20, label %27, !dbg !95

; <label>:20                                      ; preds = %12
  %21 = load i32* %counter, align 4, !dbg !98
  %22 = sext i32 %21 to i64, !dbg !98
  %23 = load i32** %1, align 8, !dbg !98
  %24 = getelementptr inbounds i32* %23, i64 %22, !dbg !98
  store i32 0, i32* %24, align 4, !dbg !98
  %25 = load i32* %counter, align 4, !dbg !100
  %26 = add nsw i32 %25, 1, !dbg !100
  store i32 %26, i32* %counter, align 4, !dbg !100
  br label %34, !dbg !101

; <label>:27                                      ; preds = %12
  %28 = load i32* %counter, align 4, !dbg !102
  %29 = sext i32 %28 to i64, !dbg !102
  %30 = load i32** %1, align 8, !dbg !102
  %31 = getelementptr inbounds i32* %30, i64 %29, !dbg !102
  %32 = load i32* %31, align 4, !dbg !102
  %33 = add nsw i32 %32, 1, !dbg !102
  store i32 %33, i32* %31, align 4, !dbg !102
  store i32 1, i32* %valid, align 4, !dbg !104
  br label %34

; <label>:34                                      ; preds = %27, %20
  br label %2, !dbg !105

; <label>:35                                      ; preds = %10
  %36 = load i32* %valid, align 4, !dbg !106
  ret i32 %36, !dbg !106
}

; Function Attrs: nounwind uwtable
define void @melt_data(i32* %data1, i32* %data2) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca i32*, align 8
  %counter = alloca i32, align 4
  store i32* %data1, i32** %1, align 8
  call void @llvm.dbg.declare(metadata !{i32** %1}, metadata !107), !dbg !108
  store i32* %data2, i32** %2, align 8
  call void @llvm.dbg.declare(metadata !{i32** %2}, metadata !109), !dbg !108
  call void @llvm.dbg.declare(metadata !{i32* %counter}, metadata !110), !dbg !111
  %3 = load i32* @ncol, align 4, !dbg !111
  store i32 %3, i32* %counter, align 4, !dbg !111
  br label %4, !dbg !112

; <label>:4                                       ; preds = %30, %0
  %5 = load i32* %counter, align 4, !dbg !112
  %6 = add nsw i32 %5, -1, !dbg !112
  store i32 %6, i32* %counter, align 4, !dbg !112
  %7 = icmp ne i32 %5, 0, !dbg !112
  br i1 %7, label %8, label %31, !dbg !112

; <label>:8                                       ; preds = %4
  %9 = load i32* %counter, align 4, !dbg !113
  %10 = sext i32 %9 to i64, !dbg !113
  %11 = load i32** %1, align 8, !dbg !113
  %12 = getelementptr inbounds i32* %11, i64 %10, !dbg !113
  %13 = load i32* %12, align 4, !dbg !113
  %14 = load i32* %counter, align 4, !dbg !113
  %15 = sext i32 %14 to i64, !dbg !113
  %16 = load i32** %2, align 8, !dbg !113
  %17 = getelementptr inbounds i32* %16, i64 %15, !dbg !113
  %18 = load i32* %17, align 4, !dbg !113
  %19 = icmp sgt i32 %13, %18, !dbg !113
  br i1 %19, label %20, label %30, !dbg !113

; <label>:20                                      ; preds = %8
  %21 = load i32* %counter, align 4, !dbg !116
  %22 = sext i32 %21 to i64, !dbg !116
  %23 = load i32** %2, align 8, !dbg !116
  %24 = getelementptr inbounds i32* %23, i64 %22, !dbg !116
  %25 = load i32* %24, align 4, !dbg !116
  %26 = load i32* %counter, align 4, !dbg !116
  %27 = sext i32 %26 to i64, !dbg !116
  %28 = load i32** %1, align 8, !dbg !116
  %29 = getelementptr inbounds i32* %28, i64 %27, !dbg !116
  store i32 %25, i32* %29, align 4, !dbg !116
  br label %30, !dbg !116

; <label>:30                                      ; preds = %20, %8
  br label %4, !dbg !117

; <label>:31                                      ; preds = %4
  ret void, !dbg !118
}

; Function Attrs: nounwind uwtable
define i32 @equal_data(i32* %data1, i32* %data2) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca i32*, align 8
  %counter = alloca i32, align 4
  store i32* %data1, i32** %1, align 8
  call void @llvm.dbg.declare(metadata !{i32** %1}, metadata !119), !dbg !120
  store i32* %data2, i32** %2, align 8
  call void @llvm.dbg.declare(metadata !{i32** %2}, metadata !121), !dbg !120
  call void @llvm.dbg.declare(metadata !{i32* %counter}, metadata !122), !dbg !123
  %3 = load i32* @ncol, align 4, !dbg !123
  store i32 %3, i32* %counter, align 4, !dbg !123
  br label %4, !dbg !124

; <label>:4                                       ; preds = %22, %0
  %5 = load i32* %counter, align 4, !dbg !124
  %6 = add nsw i32 %5, -1, !dbg !124
  store i32 %6, i32* %counter, align 4, !dbg !124
  %7 = icmp ne i32 %5, 0, !dbg !124
  br i1 %7, label %8, label %20, !dbg !124

; <label>:8                                       ; preds = %4
  %9 = load i32* %counter, align 4, !dbg !124
  %10 = sext i32 %9 to i64, !dbg !124
  %11 = load i32** %1, align 8, !dbg !124
  %12 = getelementptr inbounds i32* %11, i64 %10, !dbg !124
  %13 = load i32* %12, align 4, !dbg !124
  %14 = load i32* %counter, align 4, !dbg !124
  %15 = sext i32 %14 to i64, !dbg !124
  %16 = load i32** %2, align 8, !dbg !124
  %17 = getelementptr inbounds i32* %16, i64 %15, !dbg !124
  %18 = load i32* %17, align 4, !dbg !124
  %19 = icmp eq i32 %13, %18, !dbg !124
  br label %20

; <label>:20                                      ; preds = %8, %4
  %21 = phi i1 [ false, %4 ], [ %19, %8 ]
  br i1 %21, label %22, label %23

; <label>:22                                      ; preds = %20
  br label %4

; <label>:23                                      ; preds = %20
  %24 = load i32* %counter, align 4, !dbg !125
  %25 = icmp slt i32 %24, 0, !dbg !125
  %26 = zext i1 %25 to i32, !dbg !125
  ret i32 %26, !dbg !125
}

; Function Attrs: nounwind uwtable
define i32 @valid_data(i32* %data) #0 {
  %1 = alloca i32*, align 8
  %low = alloca i32, align 4
  %counter = alloca i32, align 4
  store i32* %data, i32** %1, align 8
  call void @llvm.dbg.declare(metadata !{i32** %1}, metadata !126), !dbg !127
  call void @llvm.dbg.declare(metadata !{i32* %low}, metadata !128), !dbg !129
  call void @llvm.dbg.declare(metadata !{i32* %counter}, metadata !130), !dbg !131
  store i32 0, i32* %counter, align 4, !dbg !131
  %2 = load i32* @nrow, align 4, !dbg !132
  store i32 %2, i32* %low, align 4, !dbg !132
  br label %3, !dbg !133

; <label>:3                                       ; preds = %16, %0
  %4 = load i32* %counter, align 4, !dbg !133
  %5 = load i32* @ncol, align 4, !dbg !133
  %6 = icmp ne i32 %4, %5, !dbg !133
  br i1 %6, label %7, label %24, !dbg !133

; <label>:7                                       ; preds = %3
  %8 = load i32* %counter, align 4, !dbg !134
  %9 = sext i32 %8 to i64, !dbg !134
  %10 = load i32** %1, align 8, !dbg !134
  %11 = getelementptr inbounds i32* %10, i64 %9, !dbg !134
  %12 = load i32* %11, align 4, !dbg !134
  %13 = load i32* %low, align 4, !dbg !134
  %14 = icmp sgt i32 %12, %13, !dbg !134
  br i1 %14, label %15, label %16, !dbg !134

; <label>:15                                      ; preds = %7
  br label %24, !dbg !134

; <label>:16                                      ; preds = %7
  %17 = load i32* %counter, align 4, !dbg !137
  %18 = sext i32 %17 to i64, !dbg !137
  %19 = load i32** %1, align 8, !dbg !137
  %20 = getelementptr inbounds i32* %19, i64 %18, !dbg !137
  %21 = load i32* %20, align 4, !dbg !137
  store i32 %21, i32* %low, align 4, !dbg !137
  %22 = load i32* %counter, align 4, !dbg !138
  %23 = add nsw i32 %22, 1, !dbg !138
  store i32 %23, i32* %counter, align 4, !dbg !138
  br label %3, !dbg !139

; <label>:24                                      ; preds = %15, %3
  %25 = load i32* %counter, align 4, !dbg !140
  %26 = load i32* @ncol, align 4, !dbg !140
  %27 = icmp eq i32 %25, %26, !dbg !140
  %28 = zext i1 %27 to i32, !dbg !140
  ret i32 %28, !dbg !140
}

; Function Attrs: nounwind uwtable
define void @dump_list(%struct._list* %list) #0 {
  %1 = alloca %struct._list*, align 8
  store %struct._list* %list, %struct._list** %1, align 8
  call void @llvm.dbg.declare(metadata !{%struct._list** %1}, metadata !141), !dbg !142
  %2 = load %struct._list** %1, align 8, !dbg !143
  %3 = icmp ne %struct._list* %2, null, !dbg !143
  br i1 %3, label %4, label %14, !dbg !143

; <label>:4                                       ; preds = %0
  %5 = load %struct._list** %1, align 8, !dbg !145
  %6 = getelementptr inbounds %struct._list* %5, i32 0, i32 1, !dbg !145
  %7 = load %struct._list** %6, align 8, !dbg !145
  call void @dump_list(%struct._list* %7), !dbg !145
  %8 = load %struct._list** %1, align 8, !dbg !147
  %9 = getelementptr inbounds %struct._list* %8, i32 0, i32 0, !dbg !147
  %10 = load i32** %9, align 8, !dbg !147
  %11 = bitcast i32* %10 to i8*, !dbg !147
  call void @free(i8* %11) #4, !dbg !147
  %12 = load %struct._list** %1, align 8, !dbg !148
  %13 = bitcast %struct._list* %12 to i8*, !dbg !148
  call void @free(i8* %13) #4, !dbg !148
  br label %14, !dbg !149

; <label>:14                                      ; preds = %4, %0
  ret void, !dbg !150
}

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: nounwind uwtable
define void @dump_play(%struct._play* %play) #0 {
  %1 = alloca %struct._play*, align 8
  store %struct._play* %play, %struct._play** %1, align 8
  call void @llvm.dbg.declare(metadata !{%struct._play** %1}, metadata !151), !dbg !152
  %2 = load %struct._play** %1, align 8, !dbg !153
  %3 = icmp ne %struct._play* %2, null, !dbg !153
  br i1 %3, label %4, label %17, !dbg !153

; <label>:4                                       ; preds = %0
  %5 = load %struct._play** %1, align 8, !dbg !155
  %6 = getelementptr inbounds %struct._play* %5, i32 0, i32 3, !dbg !155
  %7 = load %struct._play** %6, align 8, !dbg !155
  call void @dump_play(%struct._play* %7), !dbg !155
  %8 = load %struct._play** %1, align 8, !dbg !157
  %9 = getelementptr inbounds %struct._play* %8, i32 0, i32 2, !dbg !157
  %10 = load %struct._list** %9, align 8, !dbg !157
  call void @dump_list(%struct._list* %10), !dbg !157
  %11 = load %struct._play** %1, align 8, !dbg !158
  %12 = getelementptr inbounds %struct._play* %11, i32 0, i32 1, !dbg !158
  %13 = load i32** %12, align 8, !dbg !158
  %14 = bitcast i32* %13 to i8*, !dbg !158
  call void @free(i8* %14) #4, !dbg !158
  %15 = load %struct._play** %1, align 8, !dbg !159
  %16 = bitcast %struct._play* %15 to i8*, !dbg !159
  call void @free(i8* %16) #4, !dbg !159
  br label %17, !dbg !160

; <label>:17                                      ; preds = %4, %0
  ret void, !dbg !161
}

; Function Attrs: nounwind uwtable
define i32 @get_value(i32* %data) #0 {
  %1 = alloca i32*, align 8
  %search = alloca %struct._play*, align 8
  store i32* %data, i32** %1, align 8
  call void @llvm.dbg.declare(metadata !{i32** %1}, metadata !162), !dbg !163
  call void @llvm.dbg.declare(metadata !{%struct._play** %search}, metadata !164), !dbg !165
  %2 = load %struct._play** @game_tree, align 8, !dbg !166
  store %struct._play* %2, %struct._play** %search, align 8, !dbg !166
  br label %3, !dbg !167

; <label>:3                                       ; preds = %11, %0
  %4 = load %struct._play** %search, align 8, !dbg !167
  %5 = getelementptr inbounds %struct._play* %4, i32 0, i32 1, !dbg !167
  %6 = load i32** %5, align 8, !dbg !167
  %7 = load i32** %1, align 8, !dbg !167
  %8 = call i32 @equal_data(i32* %6, i32* %7), !dbg !167
  %9 = icmp ne i32 %8, 0, !dbg !167
  %10 = xor i1 %9, true, !dbg !167
  br i1 %10, label %11, label %15, !dbg !167

; <label>:11                                      ; preds = %3
  %12 = load %struct._play** %search, align 8, !dbg !168
  %13 = getelementptr inbounds %struct._play* %12, i32 0, i32 3, !dbg !168
  %14 = load %struct._play** %13, align 8, !dbg !168
  store %struct._play* %14, %struct._play** %search, align 8, !dbg !168
  br label %3, !dbg !168

; <label>:15                                      ; preds = %3
  %16 = load %struct._play** %search, align 8, !dbg !169
  %17 = getelementptr inbounds %struct._play* %16, i32 0, i32 0, !dbg !169
  %18 = load i32* %17, align 4, !dbg !169
  ret i32 %18, !dbg !169
}

; Function Attrs: nounwind uwtable
define void @show_data(i32* %data) #0 {
  %1 = alloca i32*, align 8
  %counter = alloca i32, align 4
  store i32* %data, i32** %1, align 8
  call void @llvm.dbg.declare(metadata !{i32** %1}, metadata !170), !dbg !171
  call void @llvm.dbg.declare(metadata !{i32* %counter}, metadata !172), !dbg !173
  store i32 0, i32* %counter, align 4, !dbg !173
  br label %2, !dbg !174

; <label>:2                                       ; preds = %19, %0
  %3 = load i32* %counter, align 4, !dbg !174
  %4 = load i32* @ncol, align 4, !dbg !174
  %5 = icmp ne i32 %3, %4, !dbg !174
  br i1 %5, label %6, label %20, !dbg !174

; <label>:6                                       ; preds = %2
  %7 = load i32* %counter, align 4, !dbg !175
  %8 = add nsw i32 %7, 1, !dbg !175
  store i32 %8, i32* %counter, align 4, !dbg !175
  %9 = sext i32 %7 to i64, !dbg !175
  %10 = load i32** %1, align 8, !dbg !175
  %11 = getelementptr inbounds i32* %10, i64 %9, !dbg !175
  %12 = load i32* %11, align 4, !dbg !175
  %13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str, i32 0, i32 0), i32 %12), !dbg !175
  %14 = load i32* %counter, align 4, !dbg !177
  %15 = load i32* @ncol, align 4, !dbg !177
  %16 = icmp ne i32 %14, %15, !dbg !177
  br i1 %16, label %17, label %19, !dbg !177

; <label>:17                                      ; preds = %6
  %18 = call i32 @putchar(i32 44), !dbg !177
  br label %19, !dbg !177

; <label>:19                                      ; preds = %17, %6
  br label %2, !dbg !179

; <label>:20                                      ; preds = %2
  ret void, !dbg !180
}

declare i32 @printf(i8*, ...) #3

declare i32 @putchar(i32) #3

; Function Attrs: nounwind uwtable
define void @show_move(i32* %data) #0 {
  %1 = alloca i32*, align 8
  store i32* %data, i32** %1, align 8
  call void @llvm.dbg.declare(metadata !{i32** %1}, metadata !181), !dbg !182
  %2 = call i32 @putchar(i32 40), !dbg !183
  %3 = load i32** %1, align 8, !dbg !184
  call void @show_data(i32* %3), !dbg !184
  %4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0)), !dbg !185
  ret void, !dbg !186
}

; Function Attrs: nounwind uwtable
define void @show_list(%struct._list* %list) #0 {
  %1 = alloca %struct._list*, align 8
  store %struct._list* %list, %struct._list** %1, align 8
  call void @llvm.dbg.declare(metadata !{%struct._list** %1}, metadata !187), !dbg !188
  br label %2, !dbg !189

; <label>:2                                       ; preds = %5, %0
  %3 = load %struct._list** %1, align 8, !dbg !189
  %4 = icmp ne %struct._list* %3, null, !dbg !189
  br i1 %4, label %5, label %12, !dbg !189

; <label>:5                                       ; preds = %2
  %6 = load %struct._list** %1, align 8, !dbg !190
  %7 = getelementptr inbounds %struct._list* %6, i32 0, i32 0, !dbg !190
  %8 = load i32** %7, align 8, !dbg !190
  call void @show_move(i32* %8), !dbg !190
  %9 = load %struct._list** %1, align 8, !dbg !192
  %10 = getelementptr inbounds %struct._list* %9, i32 0, i32 1, !dbg !192
  %11 = load %struct._list** %10, align 8, !dbg !192
  store %struct._list* %11, %struct._list** %1, align 8, !dbg !192
  br label %2, !dbg !193

; <label>:12                                      ; preds = %2
  ret void, !dbg !194
}

; Function Attrs: nounwind uwtable
define void @show_play(%struct._play* %play) #0 {
  %1 = alloca %struct._play*, align 8
  store %struct._play* %play, %struct._play** %1, align 8
  call void @llvm.dbg.declare(metadata !{%struct._play** %1}, metadata !195), !dbg !196
  br label %2, !dbg !197

; <label>:2                                       ; preds = %5, %0
  %3 = load %struct._play** %1, align 8, !dbg !197
  %4 = icmp ne %struct._play* %3, null, !dbg !197
  br i1 %4, label %5, label %21, !dbg !197

; <label>:5                                       ; preds = %2
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str2, i32 0, i32 0)), !dbg !198
  %7 = load %struct._play** %1, align 8, !dbg !200
  %8 = getelementptr inbounds %struct._play* %7, i32 0, i32 1, !dbg !200
  %9 = load i32** %8, align 8, !dbg !200
  call void @show_data(i32* %9), !dbg !200
  %10 = load %struct._play** %1, align 8, !dbg !201
  %11 = getelementptr inbounds %struct._play* %10, i32 0, i32 0, !dbg !201
  %12 = load i32* %11, align 4, !dbg !201
  %13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str3, i32 0, i32 0), i32 %12), !dbg !201
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str4, i32 0, i32 0)), !dbg !202
  %15 = load %struct._play** %1, align 8, !dbg !203
  %16 = getelementptr inbounds %struct._play* %15, i32 0, i32 2, !dbg !203
  %17 = load %struct._list** %16, align 8, !dbg !203
  call void @show_list(%struct._list* %17), !dbg !203
  %18 = load %struct._play** %1, align 8, !dbg !204
  %19 = getelementptr inbounds %struct._play* %18, i32 0, i32 3, !dbg !204
  %20 = load %struct._play** %19, align 8, !dbg !204
  store %struct._play* %20, %struct._play** %1, align 8, !dbg !204
  br label %2, !dbg !205

; <label>:21                                      ; preds = %2
  ret void, !dbg !206
}

; Function Attrs: nounwind uwtable
define i32 @in_wanted(i32* %data) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32*, align 8
  %current = alloca %struct._list*, align 8
  store i32* %data, i32** %2, align 8
  call void @llvm.dbg.declare(metadata !{i32** %2}, metadata !207), !dbg !208
  call void @llvm.dbg.declare(metadata !{%struct._list** %current}, metadata !209), !dbg !210
  %3 = load %struct._list** @wanted, align 8, !dbg !211
  store %struct._list* %3, %struct._list** %current, align 8, !dbg !211
  br label %4, !dbg !212

; <label>:4                                       ; preds = %15, %0
  %5 = load %struct._list** %current, align 8, !dbg !212
  %6 = icmp ne %struct._list* %5, null, !dbg !212
  br i1 %6, label %7, label %19, !dbg !212

; <label>:7                                       ; preds = %4
  %8 = load %struct._list** %current, align 8, !dbg !213
  %9 = getelementptr inbounds %struct._list* %8, i32 0, i32 0, !dbg !213
  %10 = load i32** %9, align 8, !dbg !213
  %11 = load i32** %2, align 8, !dbg !213
  %12 = call i32 @equal_data(i32* %10, i32* %11), !dbg !213
  %13 = icmp ne i32 %12, 0, !dbg !213
  br i1 %13, label %14, label %15, !dbg !213

; <label>:14                                      ; preds = %7
  br label %19, !dbg !213

; <label>:15                                      ; preds = %7
  %16 = load %struct._list** %current, align 8, !dbg !216
  %17 = getelementptr inbounds %struct._list* %16, i32 0, i32 1, !dbg !216
  %18 = load %struct._list** %17, align 8, !dbg !216
  store %struct._list* %18, %struct._list** %current, align 8, !dbg !216
  br label %4, !dbg !217

; <label>:19                                      ; preds = %14, %4
  %20 = load %struct._list** %current, align 8, !dbg !218
  %21 = icmp eq %struct._list* %20, null, !dbg !218
  br i1 %21, label %22, label %23, !dbg !218

; <label>:22                                      ; preds = %19
  store i32 0, i32* %1, !dbg !218
  br label %24, !dbg !218

; <label>:23                                      ; preds = %19
  store i32 1, i32* %1, !dbg !220
  br label %24, !dbg !220

; <label>:24                                      ; preds = %23, %22
  %25 = load i32* %1, !dbg !221
  ret i32 %25, !dbg !221
}

; Function Attrs: nounwind uwtable
define i32* @make_data(i32 %row, i32 %col) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %count = alloca i32, align 4
  %new = alloca i32*, align 8
  store i32 %row, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !222), !dbg !223
  store i32 %col, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !224), !dbg !223
  call void @llvm.dbg.declare(metadata !{i32* %count}, metadata !225), !dbg !226
  call void @llvm.dbg.declare(metadata !{i32** %new}, metadata !227), !dbg !228
  %3 = load i32* @ncol, align 4, !dbg !228
  %4 = sext i32 %3 to i64, !dbg !228
  %5 = mul i64 %4, 4, !dbg !228
  %6 = call noalias i8* @malloc(i64 %5) #4, !dbg !228
  %7 = bitcast i8* %6 to i32*, !dbg !228
  store i32* %7, i32** %new, align 8, !dbg !228
  store i32 0, i32* %count, align 4, !dbg !229
  br label %8, !dbg !229

; <label>:8                                       ; preds = %18, %0
  %9 = load i32* %count, align 4, !dbg !229
  %10 = load i32* %2, align 4, !dbg !229
  %11 = icmp ne i32 %9, %10, !dbg !229
  br i1 %11, label %12, label %21, !dbg !229

; <label>:12                                      ; preds = %8
  %13 = load i32* @nrow, align 4, !dbg !231
  %14 = load i32* %count, align 4, !dbg !231
  %15 = sext i32 %14 to i64, !dbg !231
  %16 = load i32** %new, align 8, !dbg !231
  %17 = getelementptr inbounds i32* %16, i64 %15, !dbg !231
  store i32 %13, i32* %17, align 4, !dbg !231
  br label %18, !dbg !231

; <label>:18                                      ; preds = %12
  %19 = load i32* %count, align 4, !dbg !229
  %20 = add nsw i32 %19, 1, !dbg !229
  store i32 %20, i32* %count, align 4, !dbg !229
  br label %8, !dbg !229

; <label>:21                                      ; preds = %8
  br label %22, !dbg !232

; <label>:22                                      ; preds = %32, %21
  %23 = load i32* %count, align 4, !dbg !232
  %24 = load i32* @ncol, align 4, !dbg !232
  %25 = icmp ne i32 %23, %24, !dbg !232
  br i1 %25, label %26, label %35, !dbg !232

; <label>:26                                      ; preds = %22
  %27 = load i32* %1, align 4, !dbg !234
  %28 = load i32* %count, align 4, !dbg !234
  %29 = sext i32 %28 to i64, !dbg !234
  %30 = load i32** %new, align 8, !dbg !234
  %31 = getelementptr inbounds i32* %30, i64 %29, !dbg !234
  store i32 %27, i32* %31, align 4, !dbg !234
  br label %32, !dbg !234

; <label>:32                                      ; preds = %26
  %33 = load i32* %count, align 4, !dbg !232
  %34 = add nsw i32 %33, 1, !dbg !232
  store i32 %34, i32* %count, align 4, !dbg !232
  br label %22, !dbg !232

; <label>:35                                      ; preds = %22
  %36 = load i32** %new, align 8, !dbg !235
  ret i32* %36, !dbg !235
}

; Function Attrs: nounwind uwtable
define %struct._list* @make_list(i32* %data, i32* %value, i32* %all) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca i32*, align 8
  %3 = alloca i32*, align 8
  %row = alloca i32, align 4
  %col = alloca i32, align 4
  %temp = alloca i32*, align 8
  %head = alloca %struct._list*, align 8
  %current = alloca %struct._list*, align 8
  store i32* %data, i32** %1, align 8
  call void @llvm.dbg.declare(metadata !{i32** %1}, metadata !236), !dbg !237
  store i32* %value, i32** %2, align 8
  call void @llvm.dbg.declare(metadata !{i32** %2}, metadata !238), !dbg !237
  store i32* %all, i32** %3, align 8
  call void @llvm.dbg.declare(metadata !{i32** %3}, metadata !239), !dbg !237
  call void @llvm.dbg.declare(metadata !{i32* %row}, metadata !240), !dbg !241
  call void @llvm.dbg.declare(metadata !{i32* %col}, metadata !242), !dbg !241
  call void @llvm.dbg.declare(metadata !{i32** %temp}, metadata !243), !dbg !244
  call void @llvm.dbg.declare(metadata !{%struct._list** %head}, metadata !245), !dbg !246
  call void @llvm.dbg.declare(metadata !{%struct._list** %current}, metadata !247), !dbg !246
  %4 = load i32** %2, align 8, !dbg !248
  store i32 1, i32* %4, align 4, !dbg !248
  %5 = call noalias i8* @malloc(i64 16) #4, !dbg !249
  %6 = bitcast i8* %5 to %struct._list*, !dbg !249
  store %struct._list* %6, %struct._list** %head, align 8, !dbg !249
  %7 = load %struct._list** %head, align 8, !dbg !250
  %8 = getelementptr inbounds %struct._list* %7, i32 0, i32 1, !dbg !250
  store %struct._list* null, %struct._list** %8, align 8, !dbg !250
  %9 = load %struct._list** %head, align 8, !dbg !251
  store %struct._list* %9, %struct._list** %current, align 8, !dbg !251
  store i32 0, i32* %row, align 4, !dbg !252
  br label %10, !dbg !252

; <label>:10                                      ; preds = %90, %0
  %11 = load i32* %row, align 4, !dbg !252
  %12 = load i32* @nrow, align 4, !dbg !252
  %13 = icmp ne i32 %11, %12, !dbg !252
  br i1 %13, label %14, label %93, !dbg !252

; <label>:14                                      ; preds = %10
  store i32 0, i32* %col, align 4, !dbg !254
  br label %15, !dbg !254

; <label>:15                                      ; preds = %86, %14
  %16 = load i32* %col, align 4, !dbg !254
  %17 = load i32* @ncol, align 4, !dbg !254
  %18 = icmp ne i32 %16, %17, !dbg !254
  br i1 %18, label %19, label %89, !dbg !254

; <label>:19                                      ; preds = %15
  %20 = load i32* %row, align 4, !dbg !257
  %21 = load i32* %col, align 4, !dbg !257
  %22 = call i32* @make_data(i32 %20, i32 %21), !dbg !257
  store i32* %22, i32** %temp, align 8, !dbg !257
  %23 = load i32** %temp, align 8, !dbg !259
  %24 = load i32** %1, align 8, !dbg !259
  call void @melt_data(i32* %23, i32* %24), !dbg !259
  %25 = load i32** %temp, align 8, !dbg !260
  %26 = load i32** %1, align 8, !dbg !260
  %27 = call i32 @equal_data(i32* %25, i32* %26), !dbg !260
  %28 = icmp ne i32 %27, 0, !dbg !260
  br i1 %28, label %74, label %29, !dbg !260

; <label>:29                                      ; preds = %19
  %30 = call noalias i8* @malloc(i64 16) #4, !dbg !262
  %31 = bitcast i8* %30 to %struct._list*, !dbg !262
  %32 = load %struct._list** %current, align 8, !dbg !262
  %33 = getelementptr inbounds %struct._list* %32, i32 0, i32 1, !dbg !262
  store %struct._list* %31, %struct._list** %33, align 8, !dbg !262
  %34 = load i32** %temp, align 8, !dbg !264
  %35 = call i32* @copy_data(i32* %34), !dbg !264
  %36 = load %struct._list** %current, align 8, !dbg !264
  %37 = getelementptr inbounds %struct._list* %36, i32 0, i32 1, !dbg !264
  %38 = load %struct._list** %37, align 8, !dbg !264
  %39 = getelementptr inbounds %struct._list* %38, i32 0, i32 0, !dbg !264
  store i32* %35, i32** %39, align 8, !dbg !264
  %40 = load %struct._list** %current, align 8, !dbg !265
  %41 = getelementptr inbounds %struct._list* %40, i32 0, i32 1, !dbg !265
  %42 = load %struct._list** %41, align 8, !dbg !265
  %43 = getelementptr inbounds %struct._list* %42, i32 0, i32 1, !dbg !265
  store %struct._list* null, %struct._list** %43, align 8, !dbg !265
  %44 = load %struct._list** %current, align 8, !dbg !266
  %45 = getelementptr inbounds %struct._list* %44, i32 0, i32 1, !dbg !266
  %46 = load %struct._list** %45, align 8, !dbg !266
  store %struct._list* %46, %struct._list** %current, align 8, !dbg !266
  %47 = load i32** %2, align 8, !dbg !267
  %48 = load i32* %47, align 4, !dbg !267
  %49 = icmp eq i32 %48, 1, !dbg !267
  br i1 %49, label %50, label %54, !dbg !267

; <label>:50                                      ; preds = %29
  %51 = load i32** %temp, align 8, !dbg !269
  %52 = call i32 @get_value(i32* %51), !dbg !269
  %53 = load i32** %2, align 8, !dbg !269
  store i32 %52, i32* %53, align 4, !dbg !269
  br label %54, !dbg !269

; <label>:54                                      ; preds = %50, %29
  %55 = load i32** %3, align 8, !dbg !270
  %56 = load i32* %55, align 4, !dbg !270
  %57 = icmp ne i32 %56, 0, !dbg !270
  br i1 %57, label %73, label %58, !dbg !270

; <label>:58                                      ; preds = %54
  %59 = load i32** %2, align 8, !dbg !270
  %60 = load i32* %59, align 4, !dbg !270
  %61 = icmp eq i32 %60, 0, !dbg !270
  br i1 %61, label %62, label %73, !dbg !270

; <label>:62                                      ; preds = %58
  %63 = load i32* @ncol, align 4, !dbg !272
  %64 = sub nsw i32 %63, 1, !dbg !272
  store i32 %64, i32* %col, align 4, !dbg !272
  %65 = load i32* @nrow, align 4, !dbg !274
  %66 = sub nsw i32 %65, 1, !dbg !274
  store i32 %66, i32* %row, align 4, !dbg !274
  %67 = load i32** %temp, align 8, !dbg !275
  %68 = call i32 @in_wanted(i32* %67), !dbg !275
  %69 = icmp ne i32 %68, 0, !dbg !275
  br i1 %69, label %70, label %72, !dbg !275

; <label>:70                                      ; preds = %62
  %71 = load i32** %3, align 8, !dbg !277
  store i32 2, i32* %71, align 4, !dbg !277
  br label %72, !dbg !277

; <label>:72                                      ; preds = %70, %62
  br label %73, !dbg !278

; <label>:73                                      ; preds = %72, %58, %54
  br label %83, !dbg !279

; <label>:74                                      ; preds = %19
  %75 = load i32* %col, align 4, !dbg !280
  %76 = icmp eq i32 %75, 0, !dbg !280
  br i1 %76, label %77, label %80, !dbg !280

; <label>:77                                      ; preds = %74
  %78 = load i32* @nrow, align 4, !dbg !280
  %79 = sub nsw i32 %78, 1, !dbg !280
  store i32 %79, i32* %row, align 4, !dbg !280
  br label %80, !dbg !280

; <label>:80                                      ; preds = %77, %74
  %81 = load i32* @ncol, align 4, !dbg !283
  %82 = sub nsw i32 %81, 1, !dbg !283
  store i32 %82, i32* %col, align 4, !dbg !283
  br label %83

; <label>:83                                      ; preds = %80, %73
  %84 = load i32** %temp, align 8, !dbg !284
  %85 = bitcast i32* %84 to i8*, !dbg !284
  call void @free(i8* %85) #4, !dbg !284
  br label %86, !dbg !285

; <label>:86                                      ; preds = %83
  %87 = load i32* %col, align 4, !dbg !254
  %88 = add nsw i32 %87, 1, !dbg !254
  store i32 %88, i32* %col, align 4, !dbg !254
  br label %15, !dbg !254

; <label>:89                                      ; preds = %15
  br label %90, !dbg !286

; <label>:90                                      ; preds = %89
  %91 = load i32* %row, align 4, !dbg !252
  %92 = add nsw i32 %91, 1, !dbg !252
  store i32 %92, i32* %row, align 4, !dbg !252
  br label %10, !dbg !252

; <label>:93                                      ; preds = %10
  %94 = load %struct._list** %head, align 8, !dbg !287
  %95 = getelementptr inbounds %struct._list* %94, i32 0, i32 1, !dbg !287
  %96 = load %struct._list** %95, align 8, !dbg !287
  store %struct._list* %96, %struct._list** %current, align 8, !dbg !287
  %97 = load %struct._list** %head, align 8, !dbg !288
  %98 = bitcast %struct._list* %97 to i8*, !dbg !288
  call void @free(i8* %98) #4, !dbg !288
  %99 = load %struct._list** %current, align 8, !dbg !289
  %100 = icmp ne %struct._list* %99, null, !dbg !289
  br i1 %100, label %101, label %106, !dbg !289

; <label>:101                                     ; preds = %93
  %102 = load i32** %2, align 8, !dbg !289
  %103 = load i32* %102, align 4, !dbg !289
  %104 = sub nsw i32 1, %103, !dbg !289
  %105 = load i32** %2, align 8, !dbg !289
  store i32 %104, i32* %105, align 4, !dbg !289
  br label %106, !dbg !289

; <label>:106                                     ; preds = %101, %93
  %107 = load %struct._list** %current, align 8, !dbg !291
  ret %struct._list* %107, !dbg !291
}

; Function Attrs: nounwind uwtable
define %struct._play* @make_play(i32 %all) #0 {
  %1 = alloca i32, align 4
  %val = alloca i32, align 4
  %temp = alloca i32*, align 8
  %head = alloca %struct._play*, align 8
  %current = alloca %struct._play*, align 8
  store i32 %all, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !292), !dbg !293
  call void @llvm.dbg.declare(metadata !{i32* %val}, metadata !294), !dbg !295
  call void @llvm.dbg.declare(metadata !{i32** %temp}, metadata !296), !dbg !297
  call void @llvm.dbg.declare(metadata !{%struct._play** %head}, metadata !298), !dbg !299
  call void @llvm.dbg.declare(metadata !{%struct._play** %current}, metadata !300), !dbg !299
  %2 = call noalias i8* @malloc(i64 32) #4, !dbg !301
  %3 = bitcast i8* %2 to %struct._play*, !dbg !301
  store %struct._play* %3, %struct._play** %head, align 8, !dbg !301
  %4 = load %struct._play** %head, align 8, !dbg !302
  store %struct._play* %4, %struct._play** %current, align 8, !dbg !302
  store %struct._play* null, %struct._play** @game_tree, align 8, !dbg !303
  %5 = call i32* @make_data(i32 0, i32 0), !dbg !304
  store i32* %5, i32** %temp, align 8, !dbg !304
  %6 = load i32** %temp, align 8, !dbg !305
  %7 = getelementptr inbounds i32* %6, i64 0, !dbg !305
  %8 = load i32* %7, align 4, !dbg !305
  %9 = add nsw i32 %8, -1, !dbg !305
  store i32 %9, i32* %7, align 4, !dbg !305
  br label %10, !dbg !306

; <label>:10                                      ; preds = %63, %0
  %11 = load i32** %temp, align 8, !dbg !306
  %12 = call i32 @next_data(i32* %11), !dbg !306
  %13 = icmp ne i32 %12, 0, !dbg !306
  br i1 %13, label %14, label %64, !dbg !306

; <label>:14                                      ; preds = %10
  %15 = load i32** %temp, align 8, !dbg !307
  %16 = call i32 @valid_data(i32* %15), !dbg !307
  %17 = icmp ne i32 %16, 0, !dbg !307
  br i1 %17, label %18, label %63, !dbg !307

; <label>:18                                      ; preds = %14
  %19 = call noalias i8* @malloc(i64 32) #4, !dbg !310
  %20 = bitcast i8* %19 to %struct._play*, !dbg !310
  %21 = load %struct._play** %current, align 8, !dbg !310
  %22 = getelementptr inbounds %struct._play* %21, i32 0, i32 3, !dbg !310
  store %struct._play* %20, %struct._play** %22, align 8, !dbg !310
  %23 = load %struct._play** @game_tree, align 8, !dbg !312
  %24 = icmp eq %struct._play* %23, null, !dbg !312
  br i1 %24, label %25, label %29, !dbg !312

; <label>:25                                      ; preds = %18
  %26 = load %struct._play** %current, align 8, !dbg !312
  %27 = getelementptr inbounds %struct._play* %26, i32 0, i32 3, !dbg !312
  %28 = load %struct._play** %27, align 8, !dbg !312
  store %struct._play* %28, %struct._play** @game_tree, align 8, !dbg !312
  br label %29, !dbg !312

; <label>:29                                      ; preds = %25, %18
  %30 = load i32** %temp, align 8, !dbg !314
  %31 = call i32* @copy_data(i32* %30), !dbg !314
  %32 = load %struct._play** %current, align 8, !dbg !314
  %33 = getelementptr inbounds %struct._play* %32, i32 0, i32 3, !dbg !314
  %34 = load %struct._play** %33, align 8, !dbg !314
  %35 = getelementptr inbounds %struct._play* %34, i32 0, i32 1, !dbg !314
  store i32* %31, i32** %35, align 8, !dbg !314
  %36 = load i32** %temp, align 8, !dbg !315
  %37 = call %struct._list* @make_list(i32* %36, i32* %val, i32* %1), !dbg !315
  %38 = load %struct._play** %current, align 8, !dbg !315
  %39 = getelementptr inbounds %struct._play* %38, i32 0, i32 3, !dbg !315
  %40 = load %struct._play** %39, align 8, !dbg !315
  %41 = getelementptr inbounds %struct._play* %40, i32 0, i32 2, !dbg !315
  store %struct._list* %37, %struct._list** %41, align 8, !dbg !315
  %42 = load i32* %val, align 4, !dbg !316
  %43 = load %struct._play** %current, align 8, !dbg !316
  %44 = getelementptr inbounds %struct._play* %43, i32 0, i32 3, !dbg !316
  %45 = load %struct._play** %44, align 8, !dbg !316
  %46 = getelementptr inbounds %struct._play* %45, i32 0, i32 0, !dbg !316
  store i32 %42, i32* %46, align 4, !dbg !316
  %47 = load %struct._play** %current, align 8, !dbg !317
  %48 = getelementptr inbounds %struct._play* %47, i32 0, i32 3, !dbg !317
  %49 = load %struct._play** %48, align 8, !dbg !317
  %50 = getelementptr inbounds %struct._play* %49, i32 0, i32 3, !dbg !317
  store %struct._play* null, %struct._play** %50, align 8, !dbg !317
  %51 = load %struct._play** %current, align 8, !dbg !318
  %52 = getelementptr inbounds %struct._play* %51, i32 0, i32 3, !dbg !318
  %53 = load %struct._play** %52, align 8, !dbg !318
  store %struct._play* %53, %struct._play** %current, align 8, !dbg !318
  %54 = load i32* %1, align 4, !dbg !319
  %55 = icmp eq i32 %54, 2, !dbg !319
  br i1 %55, label %56, label %62, !dbg !319

; <label>:56                                      ; preds = %29
  %57 = load i32** %temp, align 8, !dbg !321
  %58 = bitcast i32* %57 to i8*, !dbg !321
  call void @free(i8* %58) #4, !dbg !321
  %59 = load i32* @nrow, align 4, !dbg !323
  %60 = load i32* @ncol, align 4, !dbg !323
  %61 = call i32* @make_data(i32 %59, i32 %60), !dbg !323
  store i32* %61, i32** %temp, align 8, !dbg !323
  br label %62, !dbg !324

; <label>:62                                      ; preds = %56, %29
  br label %63, !dbg !325

; <label>:63                                      ; preds = %62, %14
  br label %10, !dbg !326

; <label>:64                                      ; preds = %10
  %65 = load %struct._play** %head, align 8, !dbg !327
  %66 = getelementptr inbounds %struct._play* %65, i32 0, i32 3, !dbg !327
  %67 = load %struct._play** %66, align 8, !dbg !327
  store %struct._play* %67, %struct._play** %current, align 8, !dbg !327
  %68 = load %struct._play** %head, align 8, !dbg !328
  %69 = bitcast %struct._play* %68 to i8*, !dbg !328
  call void @free(i8* %69) #4, !dbg !328
  %70 = load %struct._play** %current, align 8, !dbg !329
  ret %struct._play* %70, !dbg !329
}

; Function Attrs: nounwind uwtable
define void @make_wanted(i32* %data) #0 {
  %1 = alloca i32*, align 8
  %row = alloca i32, align 4
  %col = alloca i32, align 4
  %temp = alloca i32*, align 8
  %head = alloca %struct._list*, align 8
  %current = alloca %struct._list*, align 8
  store i32* %data, i32** %1, align 8
  call void @llvm.dbg.declare(metadata !{i32** %1}, metadata !330), !dbg !331
  call void @llvm.dbg.declare(metadata !{i32* %row}, metadata !332), !dbg !333
  call void @llvm.dbg.declare(metadata !{i32* %col}, metadata !334), !dbg !333
  call void @llvm.dbg.declare(metadata !{i32** %temp}, metadata !335), !dbg !336
  call void @llvm.dbg.declare(metadata !{%struct._list** %head}, metadata !337), !dbg !338
  call void @llvm.dbg.declare(metadata !{%struct._list** %current}, metadata !339), !dbg !338
  %2 = call noalias i8* @malloc(i64 16) #4, !dbg !340
  %3 = bitcast i8* %2 to %struct._list*, !dbg !340
  store %struct._list* %3, %struct._list** %head, align 8, !dbg !340
  %4 = load %struct._list** %head, align 8, !dbg !341
  %5 = getelementptr inbounds %struct._list* %4, i32 0, i32 1, !dbg !341
  store %struct._list* null, %struct._list** %5, align 8, !dbg !341
  %6 = load %struct._list** %head, align 8, !dbg !342
  store %struct._list* %6, %struct._list** %current, align 8, !dbg !342
  store i32 0, i32* %row, align 4, !dbg !343
  br label %7, !dbg !343

; <label>:7                                       ; preds = %60, %0
  %8 = load i32* %row, align 4, !dbg !343
  %9 = load i32* @nrow, align 4, !dbg !343
  %10 = icmp ne i32 %8, %9, !dbg !343
  br i1 %10, label %11, label %63, !dbg !343

; <label>:11                                      ; preds = %7
  store i32 0, i32* %col, align 4, !dbg !345
  br label %12, !dbg !345

; <label>:12                                      ; preds = %56, %11
  %13 = load i32* %col, align 4, !dbg !345
  %14 = load i32* @ncol, align 4, !dbg !345
  %15 = icmp ne i32 %13, %14, !dbg !345
  br i1 %15, label %16, label %59, !dbg !345

; <label>:16                                      ; preds = %12
  %17 = load i32* %row, align 4, !dbg !348
  %18 = load i32* %col, align 4, !dbg !348
  %19 = call i32* @make_data(i32 %17, i32 %18), !dbg !348
  store i32* %19, i32** %temp, align 8, !dbg !348
  %20 = load i32** %temp, align 8, !dbg !350
  %21 = load i32** %1, align 8, !dbg !350
  call void @melt_data(i32* %20, i32* %21), !dbg !350
  %22 = load i32** %temp, align 8, !dbg !351
  %23 = load i32** %1, align 8, !dbg !351
  %24 = call i32 @equal_data(i32* %22, i32* %23), !dbg !351
  %25 = icmp ne i32 %24, 0, !dbg !351
  br i1 %25, label %44, label %26, !dbg !351

; <label>:26                                      ; preds = %16
  %27 = call noalias i8* @malloc(i64 16) #4, !dbg !353
  %28 = bitcast i8* %27 to %struct._list*, !dbg !353
  %29 = load %struct._list** %current, align 8, !dbg !353
  %30 = getelementptr inbounds %struct._list* %29, i32 0, i32 1, !dbg !353
  store %struct._list* %28, %struct._list** %30, align 8, !dbg !353
  %31 = load i32** %temp, align 8, !dbg !355
  %32 = call i32* @copy_data(i32* %31), !dbg !355
  %33 = load %struct._list** %current, align 8, !dbg !355
  %34 = getelementptr inbounds %struct._list* %33, i32 0, i32 1, !dbg !355
  %35 = load %struct._list** %34, align 8, !dbg !355
  %36 = getelementptr inbounds %struct._list* %35, i32 0, i32 0, !dbg !355
  store i32* %32, i32** %36, align 8, !dbg !355
  %37 = load %struct._list** %current, align 8, !dbg !356
  %38 = getelementptr inbounds %struct._list* %37, i32 0, i32 1, !dbg !356
  %39 = load %struct._list** %38, align 8, !dbg !356
  %40 = getelementptr inbounds %struct._list* %39, i32 0, i32 1, !dbg !356
  store %struct._list* null, %struct._list** %40, align 8, !dbg !356
  %41 = load %struct._list** %current, align 8, !dbg !357
  %42 = getelementptr inbounds %struct._list* %41, i32 0, i32 1, !dbg !357
  %43 = load %struct._list** %42, align 8, !dbg !357
  store %struct._list* %43, %struct._list** %current, align 8, !dbg !357
  br label %53, !dbg !358

; <label>:44                                      ; preds = %16
  %45 = load i32* %col, align 4, !dbg !359
  %46 = icmp eq i32 %45, 0, !dbg !359
  br i1 %46, label %47, label %50, !dbg !359

; <label>:47                                      ; preds = %44
  %48 = load i32* @nrow, align 4, !dbg !359
  %49 = sub nsw i32 %48, 1, !dbg !359
  store i32 %49, i32* %row, align 4, !dbg !359
  br label %50, !dbg !359

; <label>:50                                      ; preds = %47, %44
  %51 = load i32* @ncol, align 4, !dbg !362
  %52 = sub nsw i32 %51, 1, !dbg !362
  store i32 %52, i32* %col, align 4, !dbg !362
  br label %53

; <label>:53                                      ; preds = %50, %26
  %54 = load i32** %temp, align 8, !dbg !363
  %55 = bitcast i32* %54 to i8*, !dbg !363
  call void @free(i8* %55) #4, !dbg !363
  br label %56, !dbg !364

; <label>:56                                      ; preds = %53
  %57 = load i32* %col, align 4, !dbg !345
  %58 = add nsw i32 %57, 1, !dbg !345
  store i32 %58, i32* %col, align 4, !dbg !345
  br label %12, !dbg !345

; <label>:59                                      ; preds = %12
  br label %60, !dbg !365

; <label>:60                                      ; preds = %59
  %61 = load i32* %row, align 4, !dbg !343
  %62 = add nsw i32 %61, 1, !dbg !343
  store i32 %62, i32* %row, align 4, !dbg !343
  br label %7, !dbg !343

; <label>:63                                      ; preds = %7
  %64 = load %struct._list** %head, align 8, !dbg !366
  %65 = getelementptr inbounds %struct._list* %64, i32 0, i32 1, !dbg !366
  %66 = load %struct._list** %65, align 8, !dbg !366
  store %struct._list* %66, %struct._list** %current, align 8, !dbg !366
  %67 = load %struct._list** %head, align 8, !dbg !367
  %68 = bitcast %struct._list* %67 to i8*, !dbg !367
  call void @free(i8* %68) #4, !dbg !367
  %69 = load %struct._list** %current, align 8, !dbg !368
  store %struct._list* %69, %struct._list** @wanted, align 8, !dbg !368
  ret void, !dbg !369
}

; Function Attrs: nounwind uwtable
define i32* @get_good_move(%struct._list* %list) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca %struct._list*, align 8
  store %struct._list* %list, %struct._list** %2, align 8
  call void @llvm.dbg.declare(metadata !{%struct._list** %2}, metadata !370), !dbg !371
  %3 = load %struct._list** %2, align 8, !dbg !372
  %4 = icmp eq %struct._list* %3, null, !dbg !372
  br i1 %4, label %5, label %6, !dbg !372

; <label>:5                                       ; preds = %0
  store i32* null, i32** %1, !dbg !372
  br label %29, !dbg !372

; <label>:6                                       ; preds = %0
  br label %7, !dbg !374

; <label>:7                                       ; preds = %20, %6
  %8 = load %struct._list** %2, align 8, !dbg !374
  %9 = getelementptr inbounds %struct._list* %8, i32 0, i32 1, !dbg !374
  %10 = load %struct._list** %9, align 8, !dbg !374
  %11 = icmp ne %struct._list* %10, null, !dbg !374
  br i1 %11, label %12, label %18, !dbg !374

; <label>:12                                      ; preds = %7
  %13 = load %struct._list** %2, align 8, !dbg !374
  %14 = getelementptr inbounds %struct._list* %13, i32 0, i32 0, !dbg !374
  %15 = load i32** %14, align 8, !dbg !374
  %16 = call i32 @get_value(i32* %15), !dbg !374
  %17 = icmp ne i32 %16, 0, !dbg !374
  br label %18

; <label>:18                                      ; preds = %12, %7
  %19 = phi i1 [ false, %7 ], [ %17, %12 ]
  br i1 %19, label %20, label %24

; <label>:20                                      ; preds = %18
  %21 = load %struct._list** %2, align 8, !dbg !375
  %22 = getelementptr inbounds %struct._list* %21, i32 0, i32 1, !dbg !375
  %23 = load %struct._list** %22, align 8, !dbg !375
  store %struct._list* %23, %struct._list** %2, align 8, !dbg !375
  br label %7, !dbg !375

; <label>:24                                      ; preds = %18
  %25 = load %struct._list** %2, align 8, !dbg !376
  %26 = getelementptr inbounds %struct._list* %25, i32 0, i32 0, !dbg !376
  %27 = load i32** %26, align 8, !dbg !376
  %28 = call i32* @copy_data(i32* %27), !dbg !376
  store i32* %28, i32** %1, !dbg !376
  br label %29, !dbg !376

; <label>:29                                      ; preds = %24, %5
  %30 = load i32** %1, !dbg !377
  ret i32* %30, !dbg !377
}

; Function Attrs: nounwind uwtable
define i32* @get_winning_move(%struct._play* %play) #0 {
  %1 = alloca %struct._play*, align 8
  %temp = alloca i32*, align 8
  store %struct._play* %play, %struct._play** %1, align 8
  call void @llvm.dbg.declare(metadata !{%struct._play** %1}, metadata !378), !dbg !379
  call void @llvm.dbg.declare(metadata !{i32** %temp}, metadata !380), !dbg !381
  br label %2, !dbg !382

; <label>:2                                       ; preds = %7, %0
  %3 = load %struct._play** %1, align 8, !dbg !382
  %4 = getelementptr inbounds %struct._play* %3, i32 0, i32 3, !dbg !382
  %5 = load %struct._play** %4, align 8, !dbg !382
  %6 = icmp ne %struct._play* %5, null, !dbg !382
  br i1 %6, label %7, label %11, !dbg !382

; <label>:7                                       ; preds = %2
  %8 = load %struct._play** %1, align 8, !dbg !382
  %9 = getelementptr inbounds %struct._play* %8, i32 0, i32 3, !dbg !382
  %10 = load %struct._play** %9, align 8, !dbg !382
  store %struct._play* %10, %struct._play** %1, align 8, !dbg !382
  br label %2, !dbg !382

; <label>:11                                      ; preds = %2
  %12 = load %struct._play** %1, align 8, !dbg !383
  %13 = getelementptr inbounds %struct._play* %12, i32 0, i32 2, !dbg !383
  %14 = load %struct._list** %13, align 8, !dbg !383
  %15 = call i32* @get_good_move(%struct._list* %14), !dbg !383
  store i32* %15, i32** %temp, align 8, !dbg !383
  %16 = load i32** %temp, align 8, !dbg !384
  ret i32* %16, !dbg !384
}

; Function Attrs: nounwind uwtable
define %struct._list* @where(i32* %data, %struct._play* %play) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca %struct._play*, align 8
  store i32* %data, i32** %1, align 8
  call void @llvm.dbg.declare(metadata !{i32** %1}, metadata !385), !dbg !386
  store %struct._play* %play, %struct._play** %2, align 8
  call void @llvm.dbg.declare(metadata !{%struct._play** %2}, metadata !387), !dbg !386
  br label %3, !dbg !388

; <label>:3                                       ; preds = %11, %0
  %4 = load %struct._play** %2, align 8, !dbg !388
  %5 = getelementptr inbounds %struct._play* %4, i32 0, i32 1, !dbg !388
  %6 = load i32** %5, align 8, !dbg !388
  %7 = load i32** %1, align 8, !dbg !388
  %8 = call i32 @equal_data(i32* %6, i32* %7), !dbg !388
  %9 = icmp ne i32 %8, 0, !dbg !388
  %10 = xor i1 %9, true, !dbg !388
  br i1 %10, label %11, label %15, !dbg !388

; <label>:11                                      ; preds = %3
  %12 = load %struct._play** %2, align 8, !dbg !389
  %13 = getelementptr inbounds %struct._play* %12, i32 0, i32 3, !dbg !389
  %14 = load %struct._play** %13, align 8, !dbg !389
  store %struct._play* %14, %struct._play** %2, align 8, !dbg !389
  br label %3, !dbg !389

; <label>:15                                      ; preds = %3
  %16 = load %struct._play** %2, align 8, !dbg !390
  %17 = getelementptr inbounds %struct._play* %16, i32 0, i32 2, !dbg !390
  %18 = load %struct._list** %17, align 8, !dbg !390
  ret %struct._list* %18, !dbg !390
}

; Function Attrs: nounwind uwtable
define void @get_real_move(i32* %data1, i32* %data2, i32* %row, i32* %col) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca i32*, align 8
  %3 = alloca i32*, align 8
  %4 = alloca i32*, align 8
  store i32* %data1, i32** %1, align 8
  call void @llvm.dbg.declare(metadata !{i32** %1}, metadata !391), !dbg !392
  store i32* %data2, i32** %2, align 8
  call void @llvm.dbg.declare(metadata !{i32** %2}, metadata !393), !dbg !392
  store i32* %row, i32** %3, align 8
  call void @llvm.dbg.declare(metadata !{i32** %3}, metadata !394), !dbg !392
  store i32* %col, i32** %4, align 8
  call void @llvm.dbg.declare(metadata !{i32** %4}, metadata !395), !dbg !392
  %5 = load i32** %4, align 8, !dbg !396
  store i32 0, i32* %5, align 4, !dbg !396
  br label %6, !dbg !397

; <label>:6                                       ; preds = %20, %0
  %7 = load i32** %4, align 8, !dbg !397
  %8 = load i32* %7, align 4, !dbg !397
  %9 = sext i32 %8 to i64, !dbg !397
  %10 = load i32** %1, align 8, !dbg !397
  %11 = getelementptr inbounds i32* %10, i64 %9, !dbg !397
  %12 = load i32* %11, align 4, !dbg !397
  %13 = load i32** %4, align 8, !dbg !397
  %14 = load i32* %13, align 4, !dbg !397
  %15 = sext i32 %14 to i64, !dbg !397
  %16 = load i32** %2, align 8, !dbg !397
  %17 = getelementptr inbounds i32* %16, i64 %15, !dbg !397
  %18 = load i32* %17, align 4, !dbg !397
  %19 = icmp eq i32 %12, %18, !dbg !397
  br i1 %19, label %20, label %24, !dbg !397

; <label>:20                                      ; preds = %6
  %21 = load i32** %4, align 8, !dbg !398
  %22 = load i32* %21, align 4, !dbg !398
  %23 = add nsw i32 %22, 1, !dbg !398
  store i32 %23, i32* %21, align 4, !dbg !398
  br label %6, !dbg !398

; <label>:24                                      ; preds = %6
  %25 = load i32** %4, align 8, !dbg !399
  %26 = load i32* %25, align 4, !dbg !399
  %27 = sext i32 %26 to i64, !dbg !399
  %28 = load i32** %1, align 8, !dbg !399
  %29 = getelementptr inbounds i32* %28, i64 %27, !dbg !399
  %30 = load i32* %29, align 4, !dbg !399
  %31 = load i32** %3, align 8, !dbg !399
  store i32 %30, i32* %31, align 4, !dbg !399
  ret void, !dbg !400
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %row = alloca i32, align 4
  %col = alloca i32, align 4
  %maxrow = alloca i32, align 4
  %player = alloca i32, align 4
  %win = alloca i32*, align 8
  %current = alloca i32*, align 8
  %temp = alloca i32*, align 8
  %tree = alloca %struct._play*, align 8
  %look = alloca %struct._play*, align 8
  store i32 0, i32* %1
  call void @llvm.dbg.declare(metadata !{i32* %row}, metadata !401), !dbg !402
  call void @llvm.dbg.declare(metadata !{i32* %col}, metadata !403), !dbg !402
  call void @llvm.dbg.declare(metadata !{i32* %maxrow}, metadata !404), !dbg !402
  call void @llvm.dbg.declare(metadata !{i32* %player}, metadata !405), !dbg !402
  call void @llvm.dbg.declare(metadata !{i32** %win}, metadata !406), !dbg !407
  call void @llvm.dbg.declare(metadata !{i32** %current}, metadata !408), !dbg !407
  call void @llvm.dbg.declare(metadata !{i32** %temp}, metadata !409), !dbg !407
  call void @llvm.dbg.declare(metadata !{%struct._play** %tree}, metadata !410), !dbg !411
  call void @llvm.dbg.declare(metadata !{%struct._play** %look}, metadata !412), !dbg !411
  %2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([34 x i8]* @.str5, i32 0, i32 0)), !dbg !413
  %3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str6, i32 0, i32 0)), !dbg !414
  %4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str7, i32 0, i32 0)), !dbg !415
  %5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str8, i32 0, i32 0)), !dbg !416
  store i32 2, i32* %row, align 4, !dbg !417
  %6 = load i32* %row, align 4, !dbg !418
  switch i32 %6, label %101 [
    i32 1, label %7
    i32 2, label %40
    i32 3, label %75
  ], !dbg !418

; <label>:7                                       ; preds = %0
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str9, i32 0, i32 0)), !dbg !419
  %9 = call i32 (i8*, ...)* @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8]* @.str, i32 0, i32 0), i32* @ncol), !dbg !421
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str10, i32 0, i32 0)), !dbg !422
  %11 = call i32 (i8*, ...)* @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8]* @.str, i32 0, i32 0), i32* @nrow), !dbg !423
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str11, i32 0, i32 0)), !dbg !424
  %13 = call i32 (i8*, ...)* @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8]* @.str, i32 0, i32 0), i32* %maxrow), !dbg !425
  br label %14, !dbg !426

; <label>:14                                      ; preds = %36, %7
  %15 = load i32* @nrow, align 4, !dbg !426
  %16 = load i32* %maxrow, align 4, !dbg !426
  %17 = icmp sle i32 %15, %16, !dbg !426
  br i1 %17, label %18, label %39, !dbg !426

; <label>:18                                      ; preds = %14
  %19 = load i32* @nrow, align 4, !dbg !428
  %20 = load i32* @ncol, align 4, !dbg !428
  %21 = call i32* @make_data(i32 %19, i32 %20), !dbg !428
  call void @make_wanted(i32* %21), !dbg !428
  %22 = call %struct._play* @make_play(i32 0), !dbg !430
  store %struct._play* %22, %struct._play** %tree, align 8, !dbg !430
  %23 = load %struct._play** %tree, align 8, !dbg !431
  %24 = call i32* @get_winning_move(%struct._play* %23), !dbg !431
  store i32* %24, i32** %win, align 8, !dbg !431
  %25 = load i32** %win, align 8, !dbg !432
  %26 = load i32* @nrow, align 4, !dbg !432
  %27 = load i32* @ncol, align 4, !dbg !432
  %28 = call i32* @make_data(i32 %26, i32 %27), !dbg !432
  call void @get_real_move(i32* %25, i32* %28, i32* %row, i32* %col), !dbg !432
  %29 = load i32* @nrow, align 4, !dbg !433
  %30 = load i32* @ncol, align 4, !dbg !433
  %31 = load i32* %row, align 4, !dbg !433
  %32 = load i32* %col, align 4, !dbg !433
  %33 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([55 x i8]* @.str12, i32 0, i32 0), i32 %29, i32 %30, i32 %31, i32 %32), !dbg !433
  %34 = load %struct._play** %tree, align 8, !dbg !434
  call void @dump_play(%struct._play* %34), !dbg !434
  %35 = load %struct._list** @wanted, align 8, !dbg !435
  call void @dump_list(%struct._list* %35), !dbg !435
  br label %36, !dbg !436

; <label>:36                                      ; preds = %18
  %37 = load i32* @nrow, align 4, !dbg !426
  %38 = add nsw i32 %37, 1, !dbg !426
  store i32 %38, i32* @nrow, align 4, !dbg !426
  br label %14, !dbg !426

; <label>:39                                      ; preds = %14
  br label %101, !dbg !437

; <label>:40                                      ; preds = %0
  %41 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str13, i32 0, i32 0)), !dbg !438
  store i32 7, i32* @ncol, align 4, !dbg !439
  %42 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str14, i32 0, i32 0)), !dbg !440
  store i32 8, i32* @nrow, align 4, !dbg !441
  %43 = call %struct._play* @make_play(i32 1), !dbg !442
  store %struct._play* %43, %struct._play** %tree, align 8, !dbg !442
  store i32 0, i32* %player, align 4, !dbg !443
  %44 = load i32* @nrow, align 4, !dbg !444
  %45 = load i32* @ncol, align 4, !dbg !444
  %46 = call i32* @make_data(i32 %44, i32 %45), !dbg !444
  store i32* %46, i32** %current, align 8, !dbg !444
  br label %47, !dbg !445

; <label>:47                                      ; preds = %68, %40
  %48 = load i32** %current, align 8, !dbg !445
  %49 = icmp ne i32* %48, null, !dbg !445
  br i1 %49, label %50, label %70, !dbg !445

; <label>:50                                      ; preds = %47
  %51 = load i32** %current, align 8, !dbg !446
  %52 = load %struct._play** %tree, align 8, !dbg !446
  %53 = call %struct._list* @where(i32* %51, %struct._play* %52), !dbg !446
  %54 = call i32* @get_good_move(%struct._list* %53), !dbg !446
  store i32* %54, i32** %temp, align 8, !dbg !446
  %55 = load i32** %temp, align 8, !dbg !448
  %56 = icmp ne i32* %55, null, !dbg !448
  br i1 %56, label %57, label %68, !dbg !448

; <label>:57                                      ; preds = %50
  %58 = load i32** %temp, align 8, !dbg !450
  %59 = load i32** %current, align 8, !dbg !450
  call void @get_real_move(i32* %58, i32* %59, i32* %row, i32* %col), !dbg !450
  %60 = load i32* %player, align 4, !dbg !452
  %61 = load i32* %row, align 4, !dbg !452
  %62 = load i32* %col, align 4, !dbg !452
  %63 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str15, i32 0, i32 0), i32 %60, i32 %61, i32 %62), !dbg !452
  %64 = load i32* %player, align 4, !dbg !453
  %65 = sub nsw i32 1, %64, !dbg !453
  store i32 %65, i32* %player, align 4, !dbg !453
  %66 = load i32** %current, align 8, !dbg !454
  %67 = bitcast i32* %66 to i8*, !dbg !454
  call void @free(i8* %67) #4, !dbg !454
  br label %68, !dbg !455

; <label>:68                                      ; preds = %57, %50
  %69 = load i32** %temp, align 8, !dbg !456
  store i32* %69, i32** %current, align 8, !dbg !456
  br label %47, !dbg !457

; <label>:70                                      ; preds = %47
  %71 = load %struct._play** %tree, align 8, !dbg !458
  call void @dump_play(%struct._play* %71), !dbg !458
  %72 = load i32* %player, align 4, !dbg !459
  %73 = sub nsw i32 1, %72, !dbg !459
  %74 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str16, i32 0, i32 0), i32 %73), !dbg !459
  br label %101, !dbg !460

; <label>:75                                      ; preds = %0
  %76 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str13, i32 0, i32 0)), !dbg !461
  %77 = call i32 (i8*, ...)* @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8]* @.str, i32 0, i32 0), i32* @ncol), !dbg !462
  %78 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str14, i32 0, i32 0)), !dbg !463
  %79 = call i32 (i8*, ...)* @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8]* @.str, i32 0, i32 0), i32* @nrow), !dbg !464
  %80 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([55 x i8]* @.str17, i32 0, i32 0)), !dbg !465
  %81 = call %struct._play* @make_play(i32 1), !dbg !466
  store %struct._play* %81, %struct._play** %tree, align 8, !dbg !466
  %82 = load %struct._play** %tree, align 8, !dbg !467
  store %struct._play* %82, %struct._play** %look, align 8, !dbg !467
  br label %83, !dbg !468

; <label>:83                                      ; preds = %95, %75
  %84 = load %struct._play** %look, align 8, !dbg !468
  %85 = icmp ne %struct._play* %84, null, !dbg !468
  br i1 %85, label %86, label %99, !dbg !468

; <label>:86                                      ; preds = %83
  %87 = load %struct._play** %look, align 8, !dbg !469
  %88 = getelementptr inbounds %struct._play* %87, i32 0, i32 0, !dbg !469
  %89 = load i32* %88, align 4, !dbg !469
  %90 = icmp eq i32 %89, 0, !dbg !469
  br i1 %90, label %91, label %95, !dbg !469

; <label>:91                                      ; preds = %86
  %92 = load %struct._play** %look, align 8, !dbg !472
  %93 = getelementptr inbounds %struct._play* %92, i32 0, i32 1, !dbg !472
  %94 = load i32** %93, align 8, !dbg !472
  call void @show_move(i32* %94), !dbg !472
  br label %95, !dbg !472

; <label>:95                                      ; preds = %91, %86
  %96 = load %struct._play** %look, align 8, !dbg !473
  %97 = getelementptr inbounds %struct._play* %96, i32 0, i32 3, !dbg !473
  %98 = load %struct._play** %97, align 8, !dbg !473
  store %struct._play* %98, %struct._play** %look, align 8, !dbg !473
  br label %83, !dbg !474

; <label>:99                                      ; preds = %83
  %100 = load %struct._play** %tree, align 8, !dbg !475
  call void @dump_play(%struct._play* %100), !dbg !475
  br label %101, !dbg !476

; <label>:101                                     ; preds = %0, %99, %70, %39
  ret i32 0, !dbg !477
}

declare i32 @__isoc99_scanf(i8*, ...) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!76, !77}
!llvm.ident = !{!78}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !71, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c] [DW_LANG_C99]
!1 = metadata !{metadata !"chomp.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !10, metadata !13, metadata !16, metadata !19, metadata !20, metadata !28, metadata !38, metadata !39, metadata !42, metadata !43, metadata !44, metadata !45, metadata !46, metadata !49, metadata !52, metadata !55, metadata !56, metadata !59, metadata !62, metadata !65, metadata !68}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"copy_data", metadata !"copy_data", metadata !"", i32 24, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32* (i32*)* @copy_data, null, null, metadata !2, i32 26} ; [ DW_TAG_subprogram ] [line 24] [def] [scope 26] [copy_data]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8}
!8 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !9} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!9 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!10 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"next_data", metadata !"next_data", metadata !"", i32 34, metadata !11, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32*)* @next_data, null, null, metadata !2, i32 36} ; [ DW_TAG_subprogram ] [line 34] [def] [scope 36] [next_data]
!11 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !12, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!12 = metadata !{metadata !9, metadata !8}
!13 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"melt_data", metadata !"melt_data", metadata !"", i32 55, metadata !14, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32*, i32*)* @melt_data, null, null, metadata !2, i32 56} ; [ DW_TAG_subprogram ] [line 55] [def] [scope 56] [melt_data]
!14 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !15, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!15 = metadata !{null, metadata !8, metadata !8}
!16 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"equal_data", metadata !"equal_data", metadata !"", i32 65, metadata !17, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32*, i32*)* @equal_data, null, null, metadata !2, i32 66} ; [ DW_TAG_subprogram ] [line 65] [def] [scope 66] [equal_data]
!17 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !18, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!18 = metadata !{metadata !9, metadata !8, metadata !8}
!19 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"valid_data", metadata !"valid_data", metadata !"", i32 72, metadata !11, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32*)* @valid_data, null, null, metadata !2, i32 73} ; [ DW_TAG_subprogram ] [line 72] [def] [scope 73] [valid_data]
!20 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"dump_list", metadata !"dump_list", metadata !"", i32 86, metadata !21, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct._list*)* @dump_list, null, null, metadata !2, i32 87} ; [ DW_TAG_subprogram ] [line 86] [def] [scope 87] [dump_list]
!21 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !22, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!22 = metadata !{null, metadata !23}
!23 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !24} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _list]
!24 = metadata !{i32 786451, metadata !1, null, metadata !"_list", i32 8, i64 128, i64 64, i32 0, i32 0, null, metadata !25, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [_list] [line 8, size 128, align 64, offset 0] [def] [from ]
!25 = metadata !{metadata !26, metadata !27}
!26 = metadata !{i32 786445, metadata !1, metadata !24, metadata !"data", i32 10, i64 64, i64 64, i64 0, i32 0, metadata !8} ; [ DW_TAG_member ] [data] [line 10, size 64, align 64, offset 0] [from ]
!27 = metadata !{i32 786445, metadata !1, metadata !24, metadata !"next", i32 11, i64 64, i64 64, i64 64, i32 0, metadata !23} ; [ DW_TAG_member ] [next] [line 11, size 64, align 64, offset 64] [from ]
!28 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"dump_play", metadata !"dump_play", metadata !"", i32 96, metadata !29, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, void (%struct._play*)* @dump_play, null, null, metadata !2, i32 98} ; [ DW_TAG_subprogram ] [line 96] [def] [scope 98] [dump_play]
!29 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !30, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!30 = metadata !{null, metadata !31}
!31 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !32} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _play]
!32 = metadata !{i32 786451, metadata !1, null, metadata !"_play", i32 14, i64 256, i64 64, i32 0, i32 0, null, metadata !33, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [_play] [line 14, size 256, align 64, offset 0] [def] [from ]
!33 = metadata !{metadata !34, metadata !35, metadata !36, metadata !37}
!34 = metadata !{i32 786445, metadata !1, metadata !32, metadata !"value", i32 16, i64 32, i64 32, i64 0, i32 0, metadata !9} ; [ DW_TAG_member ] [value] [line 16, size 32, align 32, offset 0] [from int]
!35 = metadata !{i32 786445, metadata !1, metadata !32, metadata !"state", i32 17, i64 64, i64 64, i64 64, i32 0, metadata !8} ; [ DW_TAG_member ] [state] [line 17, size 64, align 64, offset 64] [from ]
!36 = metadata !{i32 786445, metadata !1, metadata !32, metadata !"first", i32 18, i64 64, i64 64, i64 128, i32 0, metadata !23} ; [ DW_TAG_member ] [first] [line 18, size 64, align 64, offset 128] [from ]
!37 = metadata !{i32 786445, metadata !1, metadata !32, metadata !"next", i32 19, i64 64, i64 64, i64 192, i32 0, metadata !31} ; [ DW_TAG_member ] [next] [line 19, size 64, align 64, offset 192] [from ]
!38 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"get_value", metadata !"get_value", metadata !"", i32 108, metadata !11, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32*)* @get_value, null, null, metadata !2, i32 109} ; [ DW_TAG_subprogram ] [line 108] [def] [scope 109] [get_value]
!39 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"show_data", metadata !"show_data", metadata !"", i32 117, metadata !40, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32*)* @show_data, null, null, metadata !2, i32 118} ; [ DW_TAG_subprogram ] [line 117] [def] [scope 118] [show_data]
!40 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !41, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!41 = metadata !{null, metadata !8}
!42 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"show_move", metadata !"show_move", metadata !"", i32 127, metadata !40, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32*)* @show_move, null, null, metadata !2, i32 128} ; [ DW_TAG_subprogram ] [line 127] [def] [scope 128] [show_move]
!43 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"show_list", metadata !"show_list", metadata !"", i32 134, metadata !21, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct._list*)* @show_list, null, null, metadata !2, i32 135} ; [ DW_TAG_subprogram ] [line 134] [def] [scope 135] [show_list]
!44 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"show_play", metadata !"show_play", metadata !"", i32 143, metadata !29, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct._play*)* @show_play, null, null, metadata !2, i32 144} ; [ DW_TAG_subprogram ] [line 143] [def] [scope 144] [show_play]
!45 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"in_wanted", metadata !"in_wanted", metadata !"", i32 156, metadata !11, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32*)* @in_wanted, null, null, metadata !2, i32 157} ; [ DW_TAG_subprogram ] [line 156] [def] [scope 157] [in_wanted]
!46 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"make_data", metadata !"make_data", metadata !"", i32 169, metadata !47, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32* (i32, i32)* @make_data, null, null, metadata !2, i32 171} ; [ DW_TAG_subprogram ] [line 169] [def] [scope 171] [make_data]
!47 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !48, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!48 = metadata !{metadata !8, metadata !9, metadata !9}
!49 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"make_list", metadata !"make_list", metadata !"", i32 181, metadata !50, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, %struct._list* (i32*, i32*, i32*)* @make_list, null, null, metadata !2, i32 183} ; [ DW_TAG_subprogram ] [line 181] [def] [scope 183] [make_list]
!50 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !51, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!51 = metadata !{metadata !23, metadata !8, metadata !8, metadata !8}
!52 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"make_play", metadata !"make_play", metadata !"", i32 227, metadata !53, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, %struct._play* (i32)* @make_play, null, null, metadata !2, i32 228} ; [ DW_TAG_subprogram ] [line 227] [def] [scope 228] [make_play]
!53 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !54, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!54 = metadata !{metadata !31, metadata !9}
!55 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"make_wanted", metadata !"make_wanted", metadata !"", i32 262, metadata !40, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32*)* @make_wanted, null, null, metadata !2, i32 263} ; [ DW_TAG_subprogram ] [line 262] [def] [scope 263] [make_wanted]
!56 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"get_good_move", metadata !"get_good_move", metadata !"", i32 301, metadata !57, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32* (%struct._list*)* @get_good_move, null, null, metadata !2, i32 302} ; [ DW_TAG_subprogram ] [line 301] [def] [scope 302] [get_good_move]
!57 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !58, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!58 = metadata !{metadata !8, metadata !23}
!59 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"get_winning_move", metadata !"get_winning_move", metadata !"", i32 311, metadata !60, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32* (%struct._play*)* @get_winning_move, null, null, metadata !2, i32 313} ; [ DW_TAG_subprogram ] [line 311] [def] [scope 313] [get_winning_move]
!60 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !61, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!61 = metadata !{metadata !8, metadata !31}
!62 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"where", metadata !"where", metadata !"", i32 320, metadata !63, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, %struct._list* (i32*, %struct._play*)* @where, null, null, metadata !2, i32 321} ; [ DW_TAG_subprogram ] [line 320] [def] [scope 321] [where]
!63 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !64, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!64 = metadata !{metadata !23, metadata !8, metadata !31}
!65 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"get_real_move", metadata !"get_real_move", metadata !"", i32 327, metadata !66, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32*, i32*, i32*, i32*)* @get_real_move, null, null, metadata !2, i32 329} ; [ DW_TAG_subprogram ] [line 327] [def] [scope 329] [get_real_move]
!66 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !67, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!67 = metadata !{null, metadata !8, metadata !8, metadata !8, metadata !8}
!68 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 336, metadata !69, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @main, null, null, metadata !2, i32 337} ; [ DW_TAG_subprogram ] [line 336] [def] [scope 337] [main]
!69 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !70, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!70 = metadata !{metadata !9}
!71 = metadata !{metadata !72, metadata !73, metadata !74, metadata !75}
!72 = metadata !{i32 786484, i32 0, null, metadata !"wanted", metadata !"wanted", metadata !"", metadata !5, i32 12, metadata !23, i32 0, i32 1, %struct._list** @wanted, null} ; [ DW_TAG_variable ] [wanted] [line 12] [def]
!73 = metadata !{i32 786484, i32 0, null, metadata !"game_tree", metadata !"game_tree", metadata !"", metadata !5, i32 20, metadata !31, i32 0, i32 1, %struct._play** @game_tree, null} ; [ DW_TAG_variable ] [game_tree] [line 20] [def]
!74 = metadata !{i32 786484, i32 0, null, metadata !"nrow", metadata !"nrow", metadata !"", metadata !5, i32 22, metadata !9, i32 0, i32 1, i32* @nrow, null} ; [ DW_TAG_variable ] [nrow] [line 22] [def]
!75 = metadata !{i32 786484, i32 0, null, metadata !"ncol", metadata !"ncol", metadata !"", metadata !5, i32 22, metadata !9, i32 0, i32 1, i32* @ncol, null} ; [ DW_TAG_variable ] [ncol] [line 22] [def]
!76 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!77 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!78 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!79 = metadata !{i32 786689, metadata !4, metadata !"data", metadata !5, i32 16777241, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [data] [line 25]
!80 = metadata !{i32 25, i32 0, metadata !4, null}
!81 = metadata !{i32 786688, metadata !4, metadata !"new", metadata !5, i32 27, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [new] [line 27]
!82 = metadata !{i32 27, i32 0, metadata !4, null}
!83 = metadata !{i32 786688, metadata !4, metadata !"counter", metadata !5, i32 28, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [counter] [line 28]
!84 = metadata !{i32 28, i32 0, metadata !4, null}
!85 = metadata !{i32 29, i32 0, metadata !4, null}
!86 = metadata !{i32 30, i32 0, metadata !4, null}
!87 = metadata !{i32 31, i32 0, metadata !4, null}
!88 = metadata !{i32 786689, metadata !10, metadata !"data", metadata !5, i32 16777250, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [data] [line 34]
!89 = metadata !{i32 34, i32 0, metadata !10, null}
!90 = metadata !{i32 786688, metadata !10, metadata !"counter", metadata !5, i32 37, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [counter] [line 37]
!91 = metadata !{i32 37, i32 0, metadata !10, null}
!92 = metadata !{i32 786688, metadata !10, metadata !"valid", metadata !5, i32 38, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [valid] [line 38]
!93 = metadata !{i32 38, i32 0, metadata !10, null}
!94 = metadata !{i32 39, i32 0, metadata !10, null}
!95 = metadata !{i32 41, i32 0, metadata !96, null}
!96 = metadata !{i32 786443, metadata !1, metadata !97, i32 41, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!97 = metadata !{i32 786443, metadata !1, metadata !10, i32 40, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!98 = metadata !{i32 43, i32 0, metadata !99, null}
!99 = metadata !{i32 786443, metadata !1, metadata !96, i32 42, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!100 = metadata !{i32 44, i32 0, metadata !99, null}
!101 = metadata !{i32 45, i32 0, metadata !99, null}
!102 = metadata !{i32 48, i32 0, metadata !103, null}
!103 = metadata !{i32 786443, metadata !1, metadata !96, i32 47, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!104 = metadata !{i32 49, i32 0, metadata !103, null}
!105 = metadata !{i32 51, i32 0, metadata !97, null}
!106 = metadata !{i32 52, i32 0, metadata !10, null}
!107 = metadata !{i32 786689, metadata !13, metadata !"data1", metadata !5, i32 16777271, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [data1] [line 55]
!108 = metadata !{i32 55, i32 0, metadata !13, null}
!109 = metadata !{i32 786689, metadata !13, metadata !"data2", metadata !5, i32 33554487, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [data2] [line 55]
!110 = metadata !{i32 786688, metadata !13, metadata !"counter", metadata !5, i32 57, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [counter] [line 57]
!111 = metadata !{i32 57, i32 0, metadata !13, null}
!112 = metadata !{i32 58, i32 0, metadata !13, null} ; [ DW_TAG_imported_module ]
!113 = metadata !{i32 60, i32 0, metadata !114, null}
!114 = metadata !{i32 786443, metadata !1, metadata !115, i32 60, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!115 = metadata !{i32 786443, metadata !1, metadata !13, i32 59, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!116 = metadata !{i32 61, i32 0, metadata !114, null}
!117 = metadata !{i32 62, i32 0, metadata !115, null}
!118 = metadata !{i32 63, i32 0, metadata !13, null}
!119 = metadata !{i32 786689, metadata !16, metadata !"data1", metadata !5, i32 16777281, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [data1] [line 65]
!120 = metadata !{i32 65, i32 0, metadata !16, null}
!121 = metadata !{i32 786689, metadata !16, metadata !"data2", metadata !5, i32 33554497, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [data2] [line 65]
!122 = metadata !{i32 786688, metadata !16, metadata !"counter", metadata !5, i32 67, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [counter] [line 67]
!123 = metadata !{i32 67, i32 0, metadata !16, null}
!124 = metadata !{i32 68, i32 0, metadata !16, null}
!125 = metadata !{i32 69, i32 0, metadata !16, null}
!126 = metadata !{i32 786689, metadata !19, metadata !"data", metadata !5, i32 16777288, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [data] [line 72]
!127 = metadata !{i32 72, i32 0, metadata !19, null}
!128 = metadata !{i32 786688, metadata !19, metadata !"low", metadata !5, i32 74, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [low] [line 74]
!129 = metadata !{i32 74, i32 0, metadata !19, null}
!130 = metadata !{i32 786688, metadata !19, metadata !"counter", metadata !5, i32 75, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [counter] [line 75]
!131 = metadata !{i32 75, i32 0, metadata !19, null}
!132 = metadata !{i32 76, i32 0, metadata !19, null}
!133 = metadata !{i32 77, i32 0, metadata !19, null}
!134 = metadata !{i32 79, i32 0, metadata !135, null}
!135 = metadata !{i32 786443, metadata !1, metadata !136, i32 79, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!136 = metadata !{i32 786443, metadata !1, metadata !19, i32 78, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!137 = metadata !{i32 80, i32 0, metadata !136, null}
!138 = metadata !{i32 81, i32 0, metadata !136, null}
!139 = metadata !{i32 82, i32 0, metadata !136, null}
!140 = metadata !{i32 83, i32 0, metadata !19, null}
!141 = metadata !{i32 786689, metadata !20, metadata !"list", metadata !5, i32 16777302, metadata !23, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [list] [line 86]
!142 = metadata !{i32 86, i32 0, metadata !20, null}
!143 = metadata !{i32 88, i32 0, metadata !144, null}
!144 = metadata !{i32 786443, metadata !1, metadata !20, i32 88, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!145 = metadata !{i32 90, i32 0, metadata !146, null}
!146 = metadata !{i32 786443, metadata !1, metadata !144, i32 89, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!147 = metadata !{i32 91, i32 0, metadata !146, null}
!148 = metadata !{i32 92, i32 0, metadata !146, null}
!149 = metadata !{i32 93, i32 0, metadata !146, null}
!150 = metadata !{i32 94, i32 0, metadata !20, null}
!151 = metadata !{i32 786689, metadata !28, metadata !"play", metadata !5, i32 16777313, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [play] [line 97]
!152 = metadata !{i32 97, i32 0, metadata !28, null}
!153 = metadata !{i32 99, i32 0, metadata !154, null}
!154 = metadata !{i32 786443, metadata !1, metadata !28, i32 99, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!155 = metadata !{i32 101, i32 0, metadata !156, null}
!156 = metadata !{i32 786443, metadata !1, metadata !154, i32 100, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!157 = metadata !{i32 102, i32 0, metadata !156, null}
!158 = metadata !{i32 103, i32 0, metadata !156, null}
!159 = metadata !{i32 104, i32 0, metadata !156, null}
!160 = metadata !{i32 105, i32 0, metadata !156, null}
!161 = metadata !{i32 106, i32 0, metadata !28, null}
!162 = metadata !{i32 786689, metadata !38, metadata !"data", metadata !5, i32 16777324, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [data] [line 108]
!163 = metadata !{i32 108, i32 0, metadata !38, null}
!164 = metadata !{i32 786688, metadata !38, metadata !"search", metadata !5, i32 110, metadata !31, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [search] [line 110]
!165 = metadata !{i32 110, i32 0, metadata !38, null}
!166 = metadata !{i32 111, i32 0, metadata !38, null}
!167 = metadata !{i32 112, i32 0, metadata !38, null}
!168 = metadata !{i32 113, i32 0, metadata !38, null}
!169 = metadata !{i32 114, i32 0, metadata !38, null}
!170 = metadata !{i32 786689, metadata !39, metadata !"data", metadata !5, i32 16777333, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [data] [line 117]
!171 = metadata !{i32 117, i32 0, metadata !39, null}
!172 = metadata !{i32 786688, metadata !39, metadata !"counter", metadata !5, i32 119, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [counter] [line 119]
!173 = metadata !{i32 119, i32 0, metadata !39, null}
!174 = metadata !{i32 120, i32 0, metadata !39, null}
!175 = metadata !{i32 122, i32 0, metadata !176, null}
!176 = metadata !{i32 786443, metadata !1, metadata !39, i32 121, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!177 = metadata !{i32 123, i32 0, metadata !178, null}
!178 = metadata !{i32 786443, metadata !1, metadata !176, i32 123, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!179 = metadata !{i32 124, i32 0, metadata !176, null}
!180 = metadata !{i32 125, i32 0, metadata !39, null}
!181 = metadata !{i32 786689, metadata !42, metadata !"data", metadata !5, i32 16777343, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [data] [line 127]
!182 = metadata !{i32 127, i32 0, metadata !42, null}
!183 = metadata !{i32 129, i32 0, metadata !42, null}
!184 = metadata !{i32 130, i32 0, metadata !42, null}
!185 = metadata !{i32 131, i32 0, metadata !42, null}
!186 = metadata !{i32 132, i32 0, metadata !42, null}
!187 = metadata !{i32 786689, metadata !43, metadata !"list", metadata !5, i32 16777350, metadata !23, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [list] [line 134]
!188 = metadata !{i32 134, i32 0, metadata !43, null}
!189 = metadata !{i32 136, i32 0, metadata !43, null}
!190 = metadata !{i32 138, i32 0, metadata !191, null}
!191 = metadata !{i32 786443, metadata !1, metadata !43, i32 137, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!192 = metadata !{i32 139, i32 0, metadata !191, null}
!193 = metadata !{i32 140, i32 0, metadata !191, null}
!194 = metadata !{i32 141, i32 0, metadata !43, null}
!195 = metadata !{i32 786689, metadata !44, metadata !"play", metadata !5, i32 16777359, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [play] [line 143]
!196 = metadata !{i32 143, i32 0, metadata !44, null}
!197 = metadata !{i32 145, i32 0, metadata !44, null}
!198 = metadata !{i32 147, i32 0, metadata !199, null}
!199 = metadata !{i32 786443, metadata !1, metadata !44, i32 146, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!200 = metadata !{i32 148, i32 0, metadata !199, null}
!201 = metadata !{i32 149, i32 0, metadata !199, null}
!202 = metadata !{i32 150, i32 0, metadata !199, null}
!203 = metadata !{i32 151, i32 0, metadata !199, null}
!204 = metadata !{i32 152, i32 0, metadata !199, null}
!205 = metadata !{i32 153, i32 0, metadata !199, null}
!206 = metadata !{i32 154, i32 0, metadata !44, null}
!207 = metadata !{i32 786689, metadata !45, metadata !"data", metadata !5, i32 16777372, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [data] [line 156]
!208 = metadata !{i32 156, i32 0, metadata !45, null}
!209 = metadata !{i32 786688, metadata !45, metadata !"current", metadata !5, i32 158, metadata !23, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [current] [line 158]
!210 = metadata !{i32 158, i32 0, metadata !45, null}
!211 = metadata !{i32 159, i32 0, metadata !45, null}
!212 = metadata !{i32 160, i32 0, metadata !45, null}
!213 = metadata !{i32 162, i32 0, metadata !214, null}
!214 = metadata !{i32 786443, metadata !1, metadata !215, i32 162, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!215 = metadata !{i32 786443, metadata !1, metadata !45, i32 161, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!216 = metadata !{i32 163, i32 0, metadata !215, null}
!217 = metadata !{i32 164, i32 0, metadata !215, null}
!218 = metadata !{i32 165, i32 0, metadata !219, null}
!219 = metadata !{i32 786443, metadata !1, metadata !45, i32 165, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!220 = metadata !{i32 166, i32 0, metadata !45, null}
!221 = metadata !{i32 167, i32 0, metadata !45, null}
!222 = metadata !{i32 786689, metadata !46, metadata !"row", metadata !5, i32 16777385, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [row] [line 169]
!223 = metadata !{i32 169, i32 0, metadata !46, null}
!224 = metadata !{i32 786689, metadata !46, metadata !"col", metadata !5, i32 33554601, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [col] [line 169]
!225 = metadata !{i32 786688, metadata !46, metadata !"count", metadata !5, i32 172, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 172]
!226 = metadata !{i32 172, i32 0, metadata !46, null}
!227 = metadata !{i32 786688, metadata !46, metadata !"new", metadata !5, i32 173, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [new] [line 173]
!228 = metadata !{i32 173, i32 0, metadata !46, null}
!229 = metadata !{i32 174, i32 0, metadata !230, null}
!230 = metadata !{i32 786443, metadata !1, metadata !46, i32 174, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!231 = metadata !{i32 175, i32 0, metadata !230, null}
!232 = metadata !{i32 176, i32 0, metadata !233, null}
!233 = metadata !{i32 786443, metadata !1, metadata !46, i32 176, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!234 = metadata !{i32 177, i32 0, metadata !233, null}
!235 = metadata !{i32 178, i32 0, metadata !46, null}
!236 = metadata !{i32 786689, metadata !49, metadata !"data", metadata !5, i32 16777397, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [data] [line 181]
!237 = metadata !{i32 181, i32 0, metadata !49, null}
!238 = metadata !{i32 786689, metadata !49, metadata !"value", metadata !5, i32 33554613, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 181]
!239 = metadata !{i32 786689, metadata !49, metadata !"all", metadata !5, i32 50331829, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [all] [line 181]
!240 = metadata !{i32 786688, metadata !49, metadata !"row", metadata !5, i32 184, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [row] [line 184]
!241 = metadata !{i32 184, i32 0, metadata !49, null}
!242 = metadata !{i32 786688, metadata !49, metadata !"col", metadata !5, i32 184, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [col] [line 184]
!243 = metadata !{i32 786688, metadata !49, metadata !"temp", metadata !5, i32 185, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [temp] [line 185]
!244 = metadata !{i32 185, i32 0, metadata !49, null}
!245 = metadata !{i32 786688, metadata !49, metadata !"head", metadata !5, i32 186, metadata !23, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [head] [line 186]
!246 = metadata !{i32 186, i32 0, metadata !49, null}
!247 = metadata !{i32 786688, metadata !49, metadata !"current", metadata !5, i32 186, metadata !23, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [current] [line 186]
!248 = metadata !{i32 187, i32 0, metadata !49, null}
!249 = metadata !{i32 188, i32 0, metadata !49, null}
!250 = metadata !{i32 189, i32 0, metadata !49, null}
!251 = metadata !{i32 190, i32 0, metadata !49, null}
!252 = metadata !{i32 191, i32 0, metadata !253, null}
!253 = metadata !{i32 786443, metadata !1, metadata !49, i32 191, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!254 = metadata !{i32 193, i32 0, metadata !255, null}
!255 = metadata !{i32 786443, metadata !1, metadata !256, i32 193, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!256 = metadata !{i32 786443, metadata !1, metadata !253, i32 192, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!257 = metadata !{i32 195, i32 0, metadata !258, null}
!258 = metadata !{i32 786443, metadata !1, metadata !255, i32 194, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!259 = metadata !{i32 196, i32 0, metadata !258, null}
!260 = metadata !{i32 197, i32 0, metadata !261, null}
!261 = metadata !{i32 786443, metadata !1, metadata !258, i32 197, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!262 = metadata !{i32 199, i32 0, metadata !263, null}
!263 = metadata !{i32 786443, metadata !1, metadata !261, i32 198, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!264 = metadata !{i32 200, i32 0, metadata !263, null}
!265 = metadata !{i32 201, i32 0, metadata !263, null}
!266 = metadata !{i32 202, i32 0, metadata !263, null}
!267 = metadata !{i32 203, i32 0, metadata !268, null}
!268 = metadata !{i32 786443, metadata !1, metadata !263, i32 203, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!269 = metadata !{i32 204, i32 0, metadata !268, null}
!270 = metadata !{i32 205, i32 0, metadata !271, null}
!271 = metadata !{i32 786443, metadata !1, metadata !263, i32 205, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!272 = metadata !{i32 207, i32 0, metadata !273, null}
!273 = metadata !{i32 786443, metadata !1, metadata !271, i32 206, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!274 = metadata !{i32 208, i32 0, metadata !273, null}
!275 = metadata !{i32 209, i32 0, metadata !276, null}
!276 = metadata !{i32 786443, metadata !1, metadata !273, i32 209, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!277 = metadata !{i32 210, i32 0, metadata !276, null}
!278 = metadata !{i32 211, i32 0, metadata !273, null}
!279 = metadata !{i32 212, i32 0, metadata !263, null}
!280 = metadata !{i32 215, i32 0, metadata !281, null}
!281 = metadata !{i32 786443, metadata !1, metadata !282, i32 215, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!282 = metadata !{i32 786443, metadata !1, metadata !261, i32 214, i32 0, i32 31} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!283 = metadata !{i32 216, i32 0, metadata !282, null}
!284 = metadata !{i32 218, i32 0, metadata !258, null}
!285 = metadata !{i32 219, i32 0, metadata !258, null}
!286 = metadata !{i32 220, i32 0, metadata !256, null}
!287 = metadata !{i32 221, i32 0, metadata !49, null}
!288 = metadata !{i32 222, i32 0, metadata !49, null}
!289 = metadata !{i32 223, i32 0, metadata !290, null}
!290 = metadata !{i32 786443, metadata !1, metadata !49, i32 223, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!291 = metadata !{i32 224, i32 0, metadata !49, null}
!292 = metadata !{i32 786689, metadata !52, metadata !"all", metadata !5, i32 16777443, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [all] [line 227]
!293 = metadata !{i32 227, i32 0, metadata !52, null}
!294 = metadata !{i32 786688, metadata !52, metadata !"val", metadata !5, i32 229, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [val] [line 229]
!295 = metadata !{i32 229, i32 0, metadata !52, null}
!296 = metadata !{i32 786688, metadata !52, metadata !"temp", metadata !5, i32 230, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [temp] [line 230]
!297 = metadata !{i32 230, i32 0, metadata !52, null}
!298 = metadata !{i32 786688, metadata !52, metadata !"head", metadata !5, i32 231, metadata !31, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [head] [line 231]
!299 = metadata !{i32 231, i32 0, metadata !52, null}
!300 = metadata !{i32 786688, metadata !52, metadata !"current", metadata !5, i32 231, metadata !31, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [current] [line 231]
!301 = metadata !{i32 232, i32 0, metadata !52, null}
!302 = metadata !{i32 233, i32 0, metadata !52, null}
!303 = metadata !{i32 234, i32 0, metadata !52, null}
!304 = metadata !{i32 235, i32 0, metadata !52, null}
!305 = metadata !{i32 236, i32 0, metadata !52, null}
!306 = metadata !{i32 237, i32 0, metadata !52, null}
!307 = metadata !{i32 239, i32 0, metadata !308, null}
!308 = metadata !{i32 786443, metadata !1, metadata !309, i32 239, i32 0, i32 35} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!309 = metadata !{i32 786443, metadata !1, metadata !52, i32 238, i32 0, i32 34} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!310 = metadata !{i32 241, i32 0, metadata !311, null}
!311 = metadata !{i32 786443, metadata !1, metadata !308, i32 240, i32 0, i32 36} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!312 = metadata !{i32 242, i32 0, metadata !313, null}
!313 = metadata !{i32 786443, metadata !1, metadata !311, i32 242, i32 0, i32 37} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!314 = metadata !{i32 244, i32 0, metadata !311, null}
!315 = metadata !{i32 245, i32 0, metadata !311, null}
!316 = metadata !{i32 247, i32 0, metadata !311, null}
!317 = metadata !{i32 248, i32 0, metadata !311, null}
!318 = metadata !{i32 249, i32 0, metadata !311, null}
!319 = metadata !{i32 250, i32 0, metadata !320, null}
!320 = metadata !{i32 786443, metadata !1, metadata !311, i32 250, i32 0, i32 38} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!321 = metadata !{i32 252, i32 0, metadata !322, null}
!322 = metadata !{i32 786443, metadata !1, metadata !320, i32 251, i32 0, i32 39} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!323 = metadata !{i32 253, i32 0, metadata !322, null}
!324 = metadata !{i32 254, i32 0, metadata !322, null}
!325 = metadata !{i32 255, i32 0, metadata !311, null}
!326 = metadata !{i32 256, i32 0, metadata !309, null}
!327 = metadata !{i32 257, i32 0, metadata !52, null}
!328 = metadata !{i32 258, i32 0, metadata !52, null}
!329 = metadata !{i32 259, i32 0, metadata !52, null}
!330 = metadata !{i32 786689, metadata !55, metadata !"data", metadata !5, i32 16777478, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [data] [line 262]
!331 = metadata !{i32 262, i32 0, metadata !55, null}
!332 = metadata !{i32 786688, metadata !55, metadata !"row", metadata !5, i32 269, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [row] [line 269]
!333 = metadata !{i32 269, i32 0, metadata !55, null}
!334 = metadata !{i32 786688, metadata !55, metadata !"col", metadata !5, i32 269, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [col] [line 269]
!335 = metadata !{i32 786688, metadata !55, metadata !"temp", metadata !5, i32 270, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [temp] [line 270]
!336 = metadata !{i32 270, i32 0, metadata !55, null}
!337 = metadata !{i32 786688, metadata !55, metadata !"head", metadata !5, i32 271, metadata !23, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [head] [line 271]
!338 = metadata !{i32 271, i32 0, metadata !55, null}
!339 = metadata !{i32 786688, metadata !55, metadata !"current", metadata !5, i32 271, metadata !23, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [current] [line 271]
!340 = metadata !{i32 272, i32 0, metadata !55, null}
!341 = metadata !{i32 273, i32 0, metadata !55, null}
!342 = metadata !{i32 274, i32 0, metadata !55, null}
!343 = metadata !{i32 275, i32 0, metadata !344, null}
!344 = metadata !{i32 786443, metadata !1, metadata !55, i32 275, i32 0, i32 40} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!345 = metadata !{i32 277, i32 0, metadata !346, null}
!346 = metadata !{i32 786443, metadata !1, metadata !347, i32 277, i32 0, i32 42} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!347 = metadata !{i32 786443, metadata !1, metadata !344, i32 276, i32 0, i32 41} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!348 = metadata !{i32 279, i32 0, metadata !349, null}
!349 = metadata !{i32 786443, metadata !1, metadata !346, i32 278, i32 0, i32 43} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!350 = metadata !{i32 280, i32 0, metadata !349, null}
!351 = metadata !{i32 281, i32 0, metadata !352, null}
!352 = metadata !{i32 786443, metadata !1, metadata !349, i32 281, i32 0, i32 44} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!353 = metadata !{i32 283, i32 0, metadata !354, null}
!354 = metadata !{i32 786443, metadata !1, metadata !352, i32 282, i32 0, i32 45} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!355 = metadata !{i32 284, i32 0, metadata !354, null}
!356 = metadata !{i32 285, i32 0, metadata !354, null}
!357 = metadata !{i32 286, i32 0, metadata !354, null}
!358 = metadata !{i32 287, i32 0, metadata !354, null}
!359 = metadata !{i32 290, i32 0, metadata !360, null}
!360 = metadata !{i32 786443, metadata !1, metadata !361, i32 290, i32 0, i32 47} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!361 = metadata !{i32 786443, metadata !1, metadata !352, i32 289, i32 0, i32 46} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!362 = metadata !{i32 291, i32 0, metadata !361, null}
!363 = metadata !{i32 293, i32 0, metadata !349, null}
!364 = metadata !{i32 294, i32 0, metadata !349, null}
!365 = metadata !{i32 295, i32 0, metadata !347, null}
!366 = metadata !{i32 296, i32 0, metadata !55, null}
!367 = metadata !{i32 297, i32 0, metadata !55, null}
!368 = metadata !{i32 298, i32 0, metadata !55, null}
!369 = metadata !{i32 299, i32 0, metadata !55, null}
!370 = metadata !{i32 786689, metadata !56, metadata !"list", metadata !5, i32 16777517, metadata !23, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [list] [line 301]
!371 = metadata !{i32 301, i32 0, metadata !56, null}
!372 = metadata !{i32 303, i32 0, metadata !373, null}
!373 = metadata !{i32 786443, metadata !1, metadata !56, i32 303, i32 0, i32 48} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!374 = metadata !{i32 306, i32 0, metadata !56, null}
!375 = metadata !{i32 307, i32 0, metadata !56, null}
!376 = metadata !{i32 308, i32 0, metadata !56, null}
!377 = metadata !{i32 309, i32 0, metadata !56, null}
!378 = metadata !{i32 786689, metadata !59, metadata !"play", metadata !5, i32 16777527, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [play] [line 311]
!379 = metadata !{i32 311, i32 0, metadata !59, null}
!380 = metadata !{i32 786688, metadata !59, metadata !"temp", metadata !5, i32 314, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [temp] [line 314]
!381 = metadata !{i32 314, i32 0, metadata !59, null}
!382 = metadata !{i32 315, i32 0, metadata !59, null}
!383 = metadata !{i32 316, i32 0, metadata !59, null}
!384 = metadata !{i32 317, i32 0, metadata !59, null}
!385 = metadata !{i32 786689, metadata !62, metadata !"data", metadata !5, i32 16777536, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [data] [line 320]
!386 = metadata !{i32 320, i32 0, metadata !62, null}
!387 = metadata !{i32 786689, metadata !62, metadata !"play", metadata !5, i32 33554752, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [play] [line 320]
!388 = metadata !{i32 322, i32 0, metadata !62, null}
!389 = metadata !{i32 323, i32 0, metadata !62, null}
!390 = metadata !{i32 324, i32 0, metadata !62, null}
!391 = metadata !{i32 786689, metadata !65, metadata !"data1", metadata !5, i32 16777543, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [data1] [line 327]
!392 = metadata !{i32 327, i32 0, metadata !65, null}
!393 = metadata !{i32 786689, metadata !65, metadata !"data2", metadata !5, i32 33554759, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [data2] [line 327]
!394 = metadata !{i32 786689, metadata !65, metadata !"row", metadata !5, i32 50331975, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [row] [line 327]
!395 = metadata !{i32 786689, metadata !65, metadata !"col", metadata !5, i32 67109191, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [col] [line 327]
!396 = metadata !{i32 330, i32 0, metadata !65, null}
!397 = metadata !{i32 331, i32 0, metadata !65, null}
!398 = metadata !{i32 332, i32 0, metadata !65, null}
!399 = metadata !{i32 333, i32 0, metadata !65, null}
!400 = metadata !{i32 334, i32 0, metadata !65, null}
!401 = metadata !{i32 786688, metadata !68, metadata !"row", metadata !5, i32 338, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [row] [line 338]
!402 = metadata !{i32 338, i32 0, metadata !68, null}
!403 = metadata !{i32 786688, metadata !68, metadata !"col", metadata !5, i32 338, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [col] [line 338]
!404 = metadata !{i32 786688, metadata !68, metadata !"maxrow", metadata !5, i32 338, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [maxrow] [line 338]
!405 = metadata !{i32 786688, metadata !68, metadata !"player", metadata !5, i32 338, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [player] [line 338]
!406 = metadata !{i32 786688, metadata !68, metadata !"win", metadata !5, i32 339, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [win] [line 339]
!407 = metadata !{i32 339, i32 0, metadata !68, null}
!408 = metadata !{i32 786688, metadata !68, metadata !"current", metadata !5, i32 339, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [current] [line 339]
!409 = metadata !{i32 786688, metadata !68, metadata !"temp", metadata !5, i32 339, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [temp] [line 339]
!410 = metadata !{i32 786688, metadata !68, metadata !"tree", metadata !5, i32 340, metadata !31, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tree] [line 340]
!411 = metadata !{i32 340, i32 0, metadata !68, null}
!412 = metadata !{i32 786688, metadata !68, metadata !"look", metadata !5, i32 340, metadata !31, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [look] [line 340]
!413 = metadata !{i32 342, i32 0, metadata !68, null}
!414 = metadata !{i32 343, i32 0, metadata !68, null}
!415 = metadata !{i32 344, i32 0, metadata !68, null}
!416 = metadata !{i32 345, i32 0, metadata !68, null}
!417 = metadata !{i32 349, i32 0, metadata !68, null}
!418 = metadata !{i32 351, i32 0, metadata !68, null}
!419 = metadata !{i32 354, i32 0, metadata !420, null}
!420 = metadata !{i32 786443, metadata !1, metadata !68, i32 352, i32 0, i32 49} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!421 = metadata !{i32 355, i32 0, metadata !420, null}
!422 = metadata !{i32 356, i32 0, metadata !420, null}
!423 = metadata !{i32 357, i32 0, metadata !420, null}
!424 = metadata !{i32 358, i32 0, metadata !420, null}
!425 = metadata !{i32 359, i32 0, metadata !420, null}
!426 = metadata !{i32 360, i32 0, metadata !427, null}
!427 = metadata !{i32 786443, metadata !1, metadata !420, i32 360, i32 0, i32 50} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!428 = metadata !{i32 362, i32 0, metadata !429, null}
!429 = metadata !{i32 786443, metadata !1, metadata !427, i32 361, i32 0, i32 51} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!430 = metadata !{i32 363, i32 0, metadata !429, null}
!431 = metadata !{i32 364, i32 0, metadata !429, null}
!432 = metadata !{i32 366, i32 0, metadata !429, null}
!433 = metadata !{i32 368, i32 0, metadata !429, null}
!434 = metadata !{i32 369, i32 0, metadata !429, null}
!435 = metadata !{i32 370, i32 0, metadata !429, null}
!436 = metadata !{i32 371, i32 0, metadata !429, null}
!437 = metadata !{i32 372, i32 0, metadata !420, null}
!438 = metadata !{i32 374, i32 0, metadata !420, null}
!439 = metadata !{i32 378, i32 0, metadata !420, null}
!440 = metadata !{i32 380, i32 0, metadata !420, null}
!441 = metadata !{i32 387, i32 0, metadata !420, null}
!442 = metadata !{i32 390, i32 0, metadata !420, null}
!443 = metadata !{i32 391, i32 0, metadata !420, null}
!444 = metadata !{i32 392, i32 0, metadata !420, null}
!445 = metadata !{i32 393, i32 0, metadata !420, null}
!446 = metadata !{i32 395, i32 0, metadata !447, null}
!447 = metadata !{i32 786443, metadata !1, metadata !420, i32 394, i32 0, i32 52} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!448 = metadata !{i32 396, i32 0, metadata !449, null}
!449 = metadata !{i32 786443, metadata !1, metadata !447, i32 396, i32 0, i32 53} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!450 = metadata !{i32 398, i32 0, metadata !451, null}
!451 = metadata !{i32 786443, metadata !1, metadata !449, i32 397, i32 0, i32 54} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!452 = metadata !{i32 400, i32 0, metadata !451, null}
!453 = metadata !{i32 401, i32 0, metadata !451, null}
!454 = metadata !{i32 402, i32 0, metadata !451, null}
!455 = metadata !{i32 403, i32 0, metadata !451, null}
!456 = metadata !{i32 404, i32 0, metadata !447, null}
!457 = metadata !{i32 405, i32 0, metadata !447, null}
!458 = metadata !{i32 406, i32 0, metadata !420, null}
!459 = metadata !{i32 407, i32 0, metadata !420, null}
!460 = metadata !{i32 408, i32 0, metadata !420, null}
!461 = metadata !{i32 410, i32 0, metadata !420, null}
!462 = metadata !{i32 411, i32 0, metadata !420, null}
!463 = metadata !{i32 412, i32 0, metadata !420, null}
!464 = metadata !{i32 413, i32 0, metadata !420, null}
!465 = metadata !{i32 414, i32 0, metadata !420, null}
!466 = metadata !{i32 415, i32 0, metadata !420, null}
!467 = metadata !{i32 416, i32 0, metadata !420, null}
!468 = metadata !{i32 417, i32 0, metadata !420, null}
!469 = metadata !{i32 419, i32 0, metadata !470, null}
!470 = metadata !{i32 786443, metadata !1, metadata !471, i32 419, i32 0, i32 56} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!471 = metadata !{i32 786443, metadata !1, metadata !420, i32 418, i32 0, i32 55} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/chomp.c]
!472 = metadata !{i32 420, i32 0, metadata !470, null}
!473 = metadata !{i32 421, i32 0, metadata !471, null}
!474 = metadata !{i32 422, i32 0, metadata !471, null}
!475 = metadata !{i32 423, i32 0, metadata !420, null}
!476 = metadata !{i32 424, i32 0, metadata !420, null}
!477 = metadata !{i32 426, i32 0, metadata !68, null}
