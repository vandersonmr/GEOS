; ModuleID = 'hash.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ht_node = type { i8*, i32, %struct.ht_node* }
%struct.ht_ht = type { i32, %struct.ht_node**, i32, %struct.ht_node*, i32 }

@.str = private unnamed_addr constant [15 x i8] c"malloc ht_node\00", align 1
@.str1 = private unnamed_addr constant [14 x i8] c"strdup newkey\00", align 1
@ht_prime_list = internal global [28 x i64] [i64 53, i64 97, i64 193, i64 389, i64 769, i64 1543, i64 3079, i64 6151, i64 12289, i64 24593, i64 49157, i64 98317, i64 196613, i64 393241, i64 786433, i64 1572869, i64 3145739, i64 6291469, i64 12582917, i64 25165843, i64 50331653, i64 100663319, i64 201326611, i64 402653189, i64 805306457, i64 1610612741, i64 3221225473, i64 4294967291], align 16
@.str2 = private unnamed_addr constant [3 x i8] c"%x\00", align 1
@.str3 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str4 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define %struct.ht_node* @ht_node_create(i8* %key) #0 {
  %1 = alloca i8*, align 8
  %newkey = alloca i8*, align 8
  %node = alloca %struct.ht_node*, align 8
  store i8* %key, i8** %1, align 8
  call void @llvm.dbg.declare(metadata !{i8** %1}, metadata !54), !dbg !55
  call void @llvm.dbg.declare(metadata !{i8** %newkey}, metadata !56), !dbg !57
  call void @llvm.dbg.declare(metadata !{%struct.ht_node** %node}, metadata !58), !dbg !59
  %2 = call noalias i8* @malloc(i64 24) #6, !dbg !60
  %3 = bitcast i8* %2 to %struct.ht_node*, !dbg !60
  store %struct.ht_node* %3, %struct.ht_node** %node, align 8, !dbg !60
  %4 = icmp eq %struct.ht_node* %3, null, !dbg !60
  br i1 %4, label %5, label %6, !dbg !60

; <label>:5                                       ; preds = %0
  call void @perror(i8* getelementptr inbounds ([15 x i8]* @.str, i32 0, i32 0)), !dbg !62
  call void @exit(i32 1) #7, !dbg !64
  unreachable, !dbg !64

; <label>:6                                       ; preds = %0
  %7 = load i8** %1, align 8, !dbg !65
  %8 = call noalias i8* @strdup(i8* %7) #6, !dbg !65
  store i8* %8, i8** %newkey, align 8, !dbg !65
  %9 = icmp eq i8* %8, null, !dbg !65
  br i1 %9, label %10, label %11, !dbg !65

; <label>:10                                      ; preds = %6
  call void @perror(i8* getelementptr inbounds ([14 x i8]* @.str1, i32 0, i32 0)), !dbg !67
  call void @exit(i32 1) #7, !dbg !69
  unreachable, !dbg !69

; <label>:11                                      ; preds = %6
  %12 = load i8** %newkey, align 8, !dbg !70
  %13 = load %struct.ht_node** %node, align 8, !dbg !70
  %14 = getelementptr inbounds %struct.ht_node* %13, i32 0, i32 0, !dbg !70
  store i8* %12, i8** %14, align 8, !dbg !70
  %15 = load %struct.ht_node** %node, align 8, !dbg !71
  %16 = getelementptr inbounds %struct.ht_node* %15, i32 0, i32 1, !dbg !71
  store i32 0, i32* %16, align 4, !dbg !71
  %17 = load %struct.ht_node** %node, align 8, !dbg !72
  %18 = getelementptr inbounds %struct.ht_node* %17, i32 0, i32 2, !dbg !72
  store %struct.ht_node* null, %struct.ht_node** %18, align 8, !dbg !72
  %19 = load %struct.ht_node** %node, align 8, !dbg !73
  ret %struct.ht_node* %19, !dbg !73
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

declare void @perror(i8*) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32) #4

; Function Attrs: nounwind
declare noalias i8* @strdup(i8*) #2

; Function Attrs: nounwind uwtable
define %struct.ht_ht* @ht_create(i32 %size) #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %ht = alloca %struct.ht_ht*, align 8
  store i32 %size, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !74), !dbg !75
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !76), !dbg !77
  store i32 0, i32* %i, align 4, !dbg !77
  call void @llvm.dbg.declare(metadata !{%struct.ht_ht** %ht}, metadata !78), !dbg !79
  %2 = call noalias i8* @malloc(i64 40) #6, !dbg !79
  %3 = bitcast i8* %2 to %struct.ht_ht*, !dbg !79
  store %struct.ht_ht* %3, %struct.ht_ht** %ht, align 8, !dbg !79
  br label %4, !dbg !80

; <label>:4                                       ; preds = %12, %0
  %5 = load i32* %i, align 4, !dbg !80
  %6 = sext i32 %5 to i64, !dbg !80
  %7 = getelementptr inbounds [28 x i64]* @ht_prime_list, i32 0, i64 %6, !dbg !80
  %8 = load i64* %7, align 8, !dbg !80
  %9 = load i32* %1, align 4, !dbg !80
  %10 = sext i32 %9 to i64, !dbg !80
  %11 = icmp ult i64 %8, %10, !dbg !80
  br i1 %11, label %12, label %15, !dbg !80

; <label>:12                                      ; preds = %4
  %13 = load i32* %i, align 4, !dbg !81
  %14 = add nsw i32 %13, 1, !dbg !81
  store i32 %14, i32* %i, align 4, !dbg !81
  br label %4, !dbg !81

; <label>:15                                      ; preds = %4
  %16 = load i32* %i, align 4, !dbg !83
  %17 = sext i32 %16 to i64, !dbg !83
  %18 = getelementptr inbounds [28 x i64]* @ht_prime_list, i32 0, i64 %17, !dbg !83
  %19 = load i64* %18, align 8, !dbg !83
  %20 = trunc i64 %19 to i32, !dbg !83
  %21 = load %struct.ht_ht** %ht, align 8, !dbg !83
  %22 = getelementptr inbounds %struct.ht_ht* %21, i32 0, i32 0, !dbg !83
  store i32 %20, i32* %22, align 4, !dbg !83
  %23 = load %struct.ht_ht** %ht, align 8, !dbg !84
  %24 = getelementptr inbounds %struct.ht_ht* %23, i32 0, i32 0, !dbg !84
  %25 = load i32* %24, align 4, !dbg !84
  %26 = sext i32 %25 to i64, !dbg !84
  %27 = call noalias i8* @calloc(i64 %26, i64 8) #6, !dbg !84
  %28 = bitcast i8* %27 to %struct.ht_node**, !dbg !84
  %29 = load %struct.ht_ht** %ht, align 8, !dbg !84
  %30 = getelementptr inbounds %struct.ht_ht* %29, i32 0, i32 1, !dbg !84
  store %struct.ht_node** %28, %struct.ht_node*** %30, align 8, !dbg !84
  %31 = load %struct.ht_ht** %ht, align 8, !dbg !85
  %32 = getelementptr inbounds %struct.ht_ht* %31, i32 0, i32 2, !dbg !85
  store i32 0, i32* %32, align 4, !dbg !85
  %33 = load %struct.ht_ht** %ht, align 8, !dbg !86
  %34 = getelementptr inbounds %struct.ht_ht* %33, i32 0, i32 3, !dbg !86
  store %struct.ht_node* null, %struct.ht_node** %34, align 8, !dbg !86
  %35 = load %struct.ht_ht** %ht, align 8, !dbg !87
  %36 = getelementptr inbounds %struct.ht_ht* %35, i32 0, i32 4, !dbg !87
  store i32 0, i32* %36, align 4, !dbg !87
  %37 = load %struct.ht_ht** %ht, align 8, !dbg !88
  ret %struct.ht_ht* %37, !dbg !88
}

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #2

; Function Attrs: nounwind uwtable
define void @ht_destroy(%struct.ht_ht* %ht) #0 {
  %1 = alloca %struct.ht_ht*, align 8
  %cur = alloca %struct.ht_node*, align 8
  %next = alloca %struct.ht_node*, align 8
  %i = alloca i32, align 4
  store %struct.ht_ht* %ht, %struct.ht_ht** %1, align 8
  call void @llvm.dbg.declare(metadata !{%struct.ht_ht** %1}, metadata !89), !dbg !90
  call void @llvm.dbg.declare(metadata !{%struct.ht_node** %cur}, metadata !91), !dbg !92
  call void @llvm.dbg.declare(metadata !{%struct.ht_node** %next}, metadata !93), !dbg !92
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !94), !dbg !95
  store i32 0, i32* %i, align 4, !dbg !96
  br label %2, !dbg !96

; <label>:2                                       ; preds = %30, %0
  %3 = load i32* %i, align 4, !dbg !96
  %4 = load %struct.ht_ht** %1, align 8, !dbg !96
  %5 = getelementptr inbounds %struct.ht_ht* %4, i32 0, i32 0, !dbg !96
  %6 = load i32* %5, align 4, !dbg !96
  %7 = icmp slt i32 %3, %6, !dbg !96
  br i1 %7, label %8, label %33, !dbg !96

; <label>:8                                       ; preds = %2
  %9 = load i32* %i, align 4, !dbg !98
  %10 = sext i32 %9 to i64, !dbg !98
  %11 = load %struct.ht_ht** %1, align 8, !dbg !98
  %12 = getelementptr inbounds %struct.ht_ht* %11, i32 0, i32 1, !dbg !98
  %13 = load %struct.ht_node*** %12, align 8, !dbg !98
  %14 = getelementptr inbounds %struct.ht_node** %13, i64 %10, !dbg !98
  %15 = load %struct.ht_node** %14, align 8, !dbg !98
  store %struct.ht_node* %15, %struct.ht_node** %next, align 8, !dbg !98
  br label %16, !dbg !100

; <label>:16                                      ; preds = %19, %8
  %17 = load %struct.ht_node** %next, align 8, !dbg !100
  %18 = icmp ne %struct.ht_node* %17, null, !dbg !100
  br i1 %18, label %19, label %29, !dbg !100

; <label>:19                                      ; preds = %16
  %20 = load %struct.ht_node** %next, align 8, !dbg !101
  store %struct.ht_node* %20, %struct.ht_node** %cur, align 8, !dbg !101
  %21 = load %struct.ht_node** %next, align 8, !dbg !103
  %22 = getelementptr inbounds %struct.ht_node* %21, i32 0, i32 2, !dbg !103
  %23 = load %struct.ht_node** %22, align 8, !dbg !103
  store %struct.ht_node* %23, %struct.ht_node** %next, align 8, !dbg !103
  %24 = load %struct.ht_node** %cur, align 8, !dbg !104
  %25 = getelementptr inbounds %struct.ht_node* %24, i32 0, i32 0, !dbg !104
  %26 = load i8** %25, align 8, !dbg !104
  call void @free(i8* %26) #6, !dbg !104
  %27 = load %struct.ht_node** %cur, align 8, !dbg !105
  %28 = bitcast %struct.ht_node* %27 to i8*, !dbg !105
  call void @free(i8* %28) #6, !dbg !105
  br label %16, !dbg !106

; <label>:29                                      ; preds = %16
  br label %30, !dbg !107

; <label>:30                                      ; preds = %29
  %31 = load i32* %i, align 4, !dbg !96
  %32 = add nsw i32 %31, 1, !dbg !96
  store i32 %32, i32* %i, align 4, !dbg !96
  br label %2, !dbg !96

; <label>:33                                      ; preds = %2
  %34 = load %struct.ht_ht** %1, align 8, !dbg !108
  %35 = getelementptr inbounds %struct.ht_ht* %34, i32 0, i32 1, !dbg !108
  %36 = load %struct.ht_node*** %35, align 8, !dbg !108
  %37 = bitcast %struct.ht_node** %36 to i8*, !dbg !108
  call void @free(i8* %37) #6, !dbg !108
  %38 = load %struct.ht_ht** %1, align 8, !dbg !109
  %39 = bitcast %struct.ht_ht* %38 to i8*, !dbg !109
  call void @free(i8* %39) #6, !dbg !109
  ret void, !dbg !110
}

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  %c = alloca i32, align 4
  %n = alloca i32, align 4
  %buf = alloca [32 x i8], align 16
  %ht = alloca %struct.ht_ht*, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !111), !dbg !112
  store i8** %argv, i8*** %3, align 8
  call void @llvm.dbg.declare(metadata !{i8*** %3}, metadata !113), !dbg !112
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !114), !dbg !116
  call void @llvm.dbg.declare(metadata !{i32* %c}, metadata !117), !dbg !116
  store i32 0, i32* %c, align 4, !dbg !116
  call void @llvm.dbg.declare(metadata !{i32* %n}, metadata !118), !dbg !116
  %4 = load i32* %2, align 4, !dbg !116
  %5 = icmp eq i32 %4, 2, !dbg !116
  br i1 %5, label %6, label %11, !dbg !116

; <label>:6                                       ; preds = %0
  %7 = load i8*** %3, align 8, !dbg !116
  %8 = getelementptr inbounds i8** %7, i64 1, !dbg !116
  %9 = load i8** %8, align 8, !dbg !116
  %10 = call i32 @atoi(i8* %9) #8, !dbg !116
  br label %12, !dbg !116

; <label>:11                                      ; preds = %0
  br label %12, !dbg !116

; <label>:12                                      ; preds = %11, %6
  %13 = phi i32 [ %10, %6 ], [ 3500000, %11 ], !dbg !116
  store i32 %13, i32* %n, align 4, !dbg !116
  call void @llvm.dbg.declare(metadata !{[32 x i8]* %buf}, metadata !119), !dbg !123
  call void @llvm.dbg.declare(metadata !{%struct.ht_ht** %ht}, metadata !124), !dbg !125
  %14 = load i32* %n, align 4, !dbg !125
  %15 = call %struct.ht_ht* @ht_create(i32 %14), !dbg !125
  store %struct.ht_ht* %15, %struct.ht_ht** %ht, align 8, !dbg !125
  store i32 1, i32* %i, align 4, !dbg !126
  br label %16, !dbg !126

; <label>:16                                      ; preds = %29, %12
  %17 = load i32* %i, align 4, !dbg !126
  %18 = load i32* %n, align 4, !dbg !126
  %19 = icmp sle i32 %17, %18, !dbg !126
  br i1 %19, label %20, label %32, !dbg !126

; <label>:20                                      ; preds = %16
  %21 = getelementptr inbounds [32 x i8]* %buf, i32 0, i32 0, !dbg !128
  %22 = load i32* %i, align 4, !dbg !128
  %23 = call i32 (i8*, i8*, ...)* @sprintf(i8* %21, i8* getelementptr inbounds ([3 x i8]* @.str2, i32 0, i32 0), i32 %22) #6, !dbg !128
  %24 = load i32* %i, align 4, !dbg !130
  %25 = load %struct.ht_ht** %ht, align 8, !dbg !130
  %26 = getelementptr inbounds [32 x i8]* %buf, i32 0, i32 0, !dbg !130
  %27 = call %struct.ht_node* @ht_find_new(%struct.ht_ht* %25, i8* %26), !dbg !130
  %28 = getelementptr inbounds %struct.ht_node* %27, i32 0, i32 1, !dbg !130
  store i32 %24, i32* %28, align 4, !dbg !130
  br label %29, !dbg !131

; <label>:29                                      ; preds = %20
  %30 = load i32* %i, align 4, !dbg !126
  %31 = add nsw i32 %30, 1, !dbg !126
  store i32 %31, i32* %i, align 4, !dbg !126
  br label %16, !dbg !126

; <label>:32                                      ; preds = %16
  %33 = load i32* %n, align 4, !dbg !132
  store i32 %33, i32* %i, align 4, !dbg !132
  br label %34, !dbg !132

; <label>:34                                      ; preds = %49, %32
  %35 = load i32* %i, align 4, !dbg !132
  %36 = icmp sgt i32 %35, 0, !dbg !132
  br i1 %36, label %37, label %52, !dbg !132

; <label>:37                                      ; preds = %34
  %38 = getelementptr inbounds [32 x i8]* %buf, i32 0, i32 0, !dbg !134
  %39 = load i32* %i, align 4, !dbg !134
  %40 = call i32 (i8*, i8*, ...)* @sprintf(i8* %38, i8* getelementptr inbounds ([3 x i8]* @.str3, i32 0, i32 0), i32 %39) #6, !dbg !134
  %41 = load %struct.ht_ht** %ht, align 8, !dbg !136
  %42 = getelementptr inbounds [32 x i8]* %buf, i32 0, i32 0, !dbg !136
  %43 = call %struct.ht_node* @ht_find(%struct.ht_ht* %41, i8* %42), !dbg !136
  %44 = icmp ne %struct.ht_node* %43, null, !dbg !136
  br i1 %44, label %45, label %48, !dbg !136

; <label>:45                                      ; preds = %37
  %46 = load i32* %c, align 4, !dbg !136
  %47 = add nsw i32 %46, 1, !dbg !136
  store i32 %47, i32* %c, align 4, !dbg !136
  br label %48, !dbg !136

; <label>:48                                      ; preds = %45, %37
  br label %49, !dbg !138

; <label>:49                                      ; preds = %48
  %50 = load i32* %i, align 4, !dbg !132
  %51 = add nsw i32 %50, -1, !dbg !132
  store i32 %51, i32* %i, align 4, !dbg !132
  br label %34, !dbg !132

; <label>:52                                      ; preds = %34
  %53 = load %struct.ht_ht** %ht, align 8, !dbg !139
  call void @ht_destroy(%struct.ht_ht* %53), !dbg !139
  %54 = load i32* %c, align 4, !dbg !140
  %55 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str4, i32 0, i32 0), i32 %54), !dbg !140
  ret i32 0, !dbg !141
}

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #5

; Function Attrs: nounwind
declare i32 @sprintf(i8*, i8*, ...) #2

; Function Attrs: nounwind uwtable
define internal %struct.ht_node* @ht_find_new(%struct.ht_ht* %ht, i8* %key) #0 {
  %1 = alloca %struct.ht_node*, align 8
  %2 = alloca %struct.ht_ht*, align 8
  %3 = alloca i8*, align 8
  %hash_code = alloca i32, align 4
  %prev = alloca %struct.ht_node*, align 8
  %node = alloca %struct.ht_node*, align 8
  store %struct.ht_ht* %ht, %struct.ht_ht** %2, align 8
  call void @llvm.dbg.declare(metadata !{%struct.ht_ht** %2}, metadata !142), !dbg !143
  store i8* %key, i8** %3, align 8
  call void @llvm.dbg.declare(metadata !{i8** %3}, metadata !144), !dbg !143
  call void @llvm.dbg.declare(metadata !{i32* %hash_code}, metadata !145), !dbg !146
  %4 = load %struct.ht_ht** %2, align 8, !dbg !146
  %5 = load i8** %3, align 8, !dbg !146
  %6 = call i32 @ht_hashcode(%struct.ht_ht* %4, i8* %5), !dbg !146
  store i32 %6, i32* %hash_code, align 4, !dbg !146
  call void @llvm.dbg.declare(metadata !{%struct.ht_node** %prev}, metadata !147), !dbg !148
  store %struct.ht_node* null, %struct.ht_node** %prev, align 8, !dbg !148
  call void @llvm.dbg.declare(metadata !{%struct.ht_node** %node}, metadata !149), !dbg !148
  %7 = load i32* %hash_code, align 4, !dbg !148
  %8 = sext i32 %7 to i64, !dbg !148
  %9 = load %struct.ht_ht** %2, align 8, !dbg !148
  %10 = getelementptr inbounds %struct.ht_ht* %9, i32 0, i32 1, !dbg !148
  %11 = load %struct.ht_node*** %10, align 8, !dbg !148
  %12 = getelementptr inbounds %struct.ht_node** %11, i64 %8, !dbg !148
  %13 = load %struct.ht_node** %12, align 8, !dbg !148
  store %struct.ht_node* %13, %struct.ht_node** %node, align 8, !dbg !148
  br label %14, !dbg !150

; <label>:14                                      ; preds = %26, %0
  %15 = load %struct.ht_node** %node, align 8, !dbg !150
  %16 = icmp ne %struct.ht_node* %15, null, !dbg !150
  br i1 %16, label %17, label %31, !dbg !150

; <label>:17                                      ; preds = %14
  %18 = load i8** %3, align 8, !dbg !151
  %19 = load %struct.ht_node** %node, align 8, !dbg !151
  %20 = getelementptr inbounds %struct.ht_node* %19, i32 0, i32 0, !dbg !151
  %21 = load i8** %20, align 8, !dbg !151
  %22 = call i32 @strcmp(i8* %18, i8* %21) #8, !dbg !151
  %23 = icmp eq i32 %22, 0, !dbg !151
  br i1 %23, label %24, label %26, !dbg !151

; <label>:24                                      ; preds = %17
  %25 = load %struct.ht_node** %node, align 8, !dbg !151
  store %struct.ht_node* %25, %struct.ht_node** %1, !dbg !151
  br label %52, !dbg !151

; <label>:26                                      ; preds = %17
  %27 = load %struct.ht_node** %node, align 8, !dbg !154
  store %struct.ht_node* %27, %struct.ht_node** %prev, align 8, !dbg !154
  %28 = load %struct.ht_node** %node, align 8, !dbg !155
  %29 = getelementptr inbounds %struct.ht_node* %28, i32 0, i32 2, !dbg !155
  %30 = load %struct.ht_node** %29, align 8, !dbg !155
  store %struct.ht_node* %30, %struct.ht_node** %node, align 8, !dbg !155
  br label %14, !dbg !156

; <label>:31                                      ; preds = %14
  %32 = load %struct.ht_ht** %2, align 8, !dbg !157
  %33 = getelementptr inbounds %struct.ht_ht* %32, i32 0, i32 4, !dbg !157
  %34 = load i32* %33, align 4, !dbg !157
  %35 = add nsw i32 %34, 1, !dbg !157
  store i32 %35, i32* %33, align 4, !dbg !157
  %36 = load %struct.ht_node** %prev, align 8, !dbg !158
  %37 = icmp ne %struct.ht_node* %36, null, !dbg !158
  br i1 %37, label %38, label %43, !dbg !158

; <label>:38                                      ; preds = %31
  %39 = load i8** %3, align 8, !dbg !160
  %40 = call %struct.ht_node* @ht_node_create(i8* %39), !dbg !160
  %41 = load %struct.ht_node** %prev, align 8, !dbg !160
  %42 = getelementptr inbounds %struct.ht_node* %41, i32 0, i32 2, !dbg !160
  store %struct.ht_node* %40, %struct.ht_node** %42, align 8, !dbg !160
  store %struct.ht_node* %40, %struct.ht_node** %1, !dbg !160
  br label %52, !dbg !160

; <label>:43                                      ; preds = %31
  %44 = load i8** %3, align 8, !dbg !162
  %45 = call %struct.ht_node* @ht_node_create(i8* %44), !dbg !162
  %46 = load i32* %hash_code, align 4, !dbg !162
  %47 = sext i32 %46 to i64, !dbg !162
  %48 = load %struct.ht_ht** %2, align 8, !dbg !162
  %49 = getelementptr inbounds %struct.ht_ht* %48, i32 0, i32 1, !dbg !162
  %50 = load %struct.ht_node*** %49, align 8, !dbg !162
  %51 = getelementptr inbounds %struct.ht_node** %50, i64 %47, !dbg !162
  store %struct.ht_node* %45, %struct.ht_node** %51, align 8, !dbg !162
  store %struct.ht_node* %45, %struct.ht_node** %1, !dbg !162
  br label %52, !dbg !162

; <label>:52                                      ; preds = %43, %38, %24
  %53 = load %struct.ht_node** %1, !dbg !164
  ret %struct.ht_node* %53, !dbg !164
}

; Function Attrs: nounwind uwtable
define internal %struct.ht_node* @ht_find(%struct.ht_ht* %ht, i8* %key) #0 {
  %1 = alloca %struct.ht_node*, align 8
  %2 = alloca %struct.ht_ht*, align 8
  %3 = alloca i8*, align 8
  %hash_code = alloca i32, align 4
  %node = alloca %struct.ht_node*, align 8
  store %struct.ht_ht* %ht, %struct.ht_ht** %2, align 8
  call void @llvm.dbg.declare(metadata !{%struct.ht_ht** %2}, metadata !165), !dbg !166
  store i8* %key, i8** %3, align 8
  call void @llvm.dbg.declare(metadata !{i8** %3}, metadata !167), !dbg !166
  call void @llvm.dbg.declare(metadata !{i32* %hash_code}, metadata !168), !dbg !170
  %4 = load %struct.ht_ht** %2, align 8, !dbg !170
  %5 = load i8** %3, align 8, !dbg !170
  %6 = call i32 @ht_hashcode(%struct.ht_ht* %4, i8* %5), !dbg !170
  store i32 %6, i32* %hash_code, align 4, !dbg !170
  call void @llvm.dbg.declare(metadata !{%struct.ht_node** %node}, metadata !171), !dbg !172
  %7 = load i32* %hash_code, align 4, !dbg !172
  %8 = sext i32 %7 to i64, !dbg !172
  %9 = load %struct.ht_ht** %2, align 8, !dbg !172
  %10 = getelementptr inbounds %struct.ht_ht* %9, i32 0, i32 1, !dbg !172
  %11 = load %struct.ht_node*** %10, align 8, !dbg !172
  %12 = getelementptr inbounds %struct.ht_node** %11, i64 %8, !dbg !172
  %13 = load %struct.ht_node** %12, align 8, !dbg !172
  store %struct.ht_node* %13, %struct.ht_node** %node, align 8, !dbg !172
  br label %14, !dbg !173

; <label>:14                                      ; preds = %26, %0
  %15 = load %struct.ht_node** %node, align 8, !dbg !173
  %16 = icmp ne %struct.ht_node* %15, null, !dbg !173
  br i1 %16, label %17, label %30, !dbg !173

; <label>:17                                      ; preds = %14
  %18 = load i8** %3, align 8, !dbg !174
  %19 = load %struct.ht_node** %node, align 8, !dbg !174
  %20 = getelementptr inbounds %struct.ht_node* %19, i32 0, i32 0, !dbg !174
  %21 = load i8** %20, align 8, !dbg !174
  %22 = call i32 @strcmp(i8* %18, i8* %21) #8, !dbg !174
  %23 = icmp eq i32 %22, 0, !dbg !174
  br i1 %23, label %24, label %26, !dbg !174

; <label>:24                                      ; preds = %17
  %25 = load %struct.ht_node** %node, align 8, !dbg !174
  store %struct.ht_node* %25, %struct.ht_node** %1, !dbg !174
  br label %31, !dbg !174

; <label>:26                                      ; preds = %17
  %27 = load %struct.ht_node** %node, align 8, !dbg !177
  %28 = getelementptr inbounds %struct.ht_node* %27, i32 0, i32 2, !dbg !177
  %29 = load %struct.ht_node** %28, align 8, !dbg !177
  store %struct.ht_node* %29, %struct.ht_node** %node, align 8, !dbg !177
  br label %14, !dbg !178

; <label>:30                                      ; preds = %14
  store %struct.ht_node* null, %struct.ht_node** %1, !dbg !179
  br label %31, !dbg !179

; <label>:31                                      ; preds = %30, %24
  %32 = load %struct.ht_node** %1, !dbg !180
  ret %struct.ht_node* %32, !dbg !180
}

declare i32 @printf(i8*, ...) #3

; Function Attrs: nounwind uwtable
define internal i32 @ht_hashcode(%struct.ht_ht* %ht, i8* %key) #0 {
  %1 = alloca %struct.ht_ht*, align 8
  %2 = alloca i8*, align 8
  %val = alloca i64, align 8
  store %struct.ht_ht* %ht, %struct.ht_ht** %1, align 8
  call void @llvm.dbg.declare(metadata !{%struct.ht_ht** %1}, metadata !181), !dbg !182
  store i8* %key, i8** %2, align 8
  call void @llvm.dbg.declare(metadata !{i8** %2}, metadata !183), !dbg !182
  call void @llvm.dbg.declare(metadata !{i64* %val}, metadata !184), !dbg !185
  store i64 0, i64* %val, align 8, !dbg !185
  br label %3, !dbg !186

; <label>:3                                       ; preds = %14, %0
  %4 = load i8** %2, align 8, !dbg !186
  %5 = load i8* %4, align 1, !dbg !186
  %6 = icmp ne i8 %5, 0, !dbg !186
  br i1 %6, label %7, label %17, !dbg !186

; <label>:7                                       ; preds = %3
  %8 = load i64* %val, align 8, !dbg !186
  %9 = mul i64 5, %8, !dbg !186
  %10 = load i8** %2, align 8, !dbg !186
  %11 = load i8* %10, align 1, !dbg !186
  %12 = sext i8 %11 to i64, !dbg !186
  %13 = add i64 %9, %12, !dbg !186
  store i64 %13, i64* %val, align 8, !dbg !186
  br label %14, !dbg !186

; <label>:14                                      ; preds = %7
  %15 = load i8** %2, align 8, !dbg !186
  %16 = getelementptr inbounds i8* %15, i32 1, !dbg !186
  store i8* %16, i8** %2, align 8, !dbg !186
  br label %3, !dbg !186

; <label>:17                                      ; preds = %3
  %18 = load i64* %val, align 8, !dbg !188
  %19 = load %struct.ht_ht** %1, align 8, !dbg !188
  %20 = getelementptr inbounds %struct.ht_ht* %19, i32 0, i32 0, !dbg !188
  %21 = load i32* %20, align 4, !dbg !188
  %22 = sext i32 %21 to i64, !dbg !188
  %23 = urem i64 %18, %22, !dbg !188
  %24 = trunc i64 %23 to i32, !dbg !188
  ret i32 %24, !dbg !188
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #5

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }
attributes #8 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!51, !52}
!llvm.ident = !{!53}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !45, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/hash.c] [DW_LANG_C99]
!1 = metadata !{metadata !"hash.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !18, metadata !30, metadata !33, metadata !38, metadata !41, metadata !44}
!4 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"ht_node_create", metadata !"ht_node_create", metadata !"", i32 52, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, %struct.ht_node* (i8*)* @ht_node_create, null, null, metadata !2, i32 52} ; [ DW_TAG_subprogram ] [line 52] [def] [ht_node_create]
!5 = metadata !{metadata !"./simple_hash.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!6 = metadata !{i32 786473, metadata !5}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/./simple_hash.h]
!7 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{metadata !9, metadata !13}
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ht_node]
!10 = metadata !{i32 786451, metadata !5, null, metadata !"ht_node", i32 21, i64 192, i64 64, i32 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [ht_node] [line 21, size 192, align 64, offset 0] [def] [from ]
!11 = metadata !{metadata !12, metadata !15, metadata !17}
!12 = metadata !{i32 786445, metadata !5, metadata !10, metadata !"key", i32 22, i64 64, i64 64, i64 0, i32 0, metadata !13} ; [ DW_TAG_member ] [key] [line 22, size 64, align 64, offset 0] [from ]
!13 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !14} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!14 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!15 = metadata !{i32 786445, metadata !5, metadata !10, metadata !"val", i32 23, i64 32, i64 32, i64 64, i32 0, metadata !16} ; [ DW_TAG_member ] [val] [line 23, size 32, align 32, offset 64] [from int]
!16 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!17 = metadata !{i32 786445, metadata !5, metadata !10, metadata !"next", i32 24, i64 64, i64 64, i64 128, i32 0, metadata !9} ; [ DW_TAG_member ] [next] [line 24, size 64, align 64, offset 128] [from ]
!18 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"ht_create", metadata !"ht_create", metadata !"", i32 69, metadata !19, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, %struct.ht_ht* (i32)* @ht_create, null, null, metadata !2, i32 69} ; [ DW_TAG_subprogram ] [line 69] [def] [ht_create]
!19 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !20, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!20 = metadata !{metadata !21, metadata !16}
!21 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !22} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ht_ht]
!22 = metadata !{i32 786451, metadata !5, null, metadata !"ht_ht", i32 27, i64 320, i64 64, i32 0, i32 0, null, metadata !23, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [ht_ht] [line 27, size 320, align 64, offset 0] [def] [from ]
!23 = metadata !{metadata !24, metadata !25, metadata !27, metadata !28, metadata !29}
!24 = metadata !{i32 786445, metadata !5, metadata !22, metadata !"size", i32 28, i64 32, i64 32, i64 0, i32 0, metadata !16} ; [ DW_TAG_member ] [size] [line 28, size 32, align 32, offset 0] [from int]
!25 = metadata !{i32 786445, metadata !5, metadata !22, metadata !"tbl", i32 29, i64 64, i64 64, i64 64, i32 0, metadata !26} ; [ DW_TAG_member ] [tbl] [line 29, size 64, align 64, offset 64] [from ]
!26 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !9} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!27 = metadata !{i32 786445, metadata !5, metadata !22, metadata !"iter_index", i32 30, i64 32, i64 32, i64 128, i32 0, metadata !16} ; [ DW_TAG_member ] [iter_index] [line 30, size 32, align 32, offset 128] [from int]
!28 = metadata !{i32 786445, metadata !5, metadata !22, metadata !"iter_next", i32 31, i64 64, i64 64, i64 192, i32 0, metadata !9} ; [ DW_TAG_member ] [iter_next] [line 31, size 64, align 64, offset 192] [from ]
!29 = metadata !{i32 786445, metadata !5, metadata !22, metadata !"items", i32 32, i64 32, i64 32, i64 256, i32 0, metadata !16} ; [ DW_TAG_member ] [items] [line 32, size 32, align 32, offset 256] [from int]
!30 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"ht_destroy", metadata !"ht_destroy", metadata !"", i32 84, metadata !31, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.ht_ht*)* @ht_destroy, null, null, metadata !2, i32 84} ; [ DW_TAG_subprogram ] [line 84] [def] [ht_destroy]
!31 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !32, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!32 = metadata !{null, metadata !21}
!33 = metadata !{i32 786478, metadata !1, metadata !34, metadata !"main", metadata !"main", metadata !"", i32 11, metadata !35, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main, null, null, metadata !2, i32 11} ; [ DW_TAG_subprogram ] [line 11] [def] [main]
!34 = metadata !{i32 786473, metadata !1}         ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/hash.c]
!35 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !36, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!36 = metadata !{metadata !16, metadata !16, metadata !37}
!37 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !13} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!38 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"ht_find", metadata !"ht_find", metadata !"", i32 125, metadata !39, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, %struct.ht_node* (%struct.ht_ht*, i8*)* @ht_find, null, null, metadata !2, i32 125} ; [ DW_TAG_subprogram ] [line 125] [local] [def] [ht_find]
!39 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !40, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!40 = metadata !{metadata !9, metadata !21, metadata !13}
!41 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"ht_hashcode", metadata !"ht_hashcode", metadata !"", i32 46, metadata !42, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (%struct.ht_ht*, i8*)* @ht_hashcode, null, null, metadata !2, i32 46} ; [ DW_TAG_subprogram ] [line 46] [local] [def] [ht_hashcode]
!42 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !43, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!43 = metadata !{metadata !16, metadata !21, metadata !13}
!44 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"ht_find_new", metadata !"ht_find_new", metadata !"", i32 135, metadata !39, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, %struct.ht_node* (%struct.ht_ht*, i8*)* @ht_find_new, null, null, metadata !2, i32 135} ; [ DW_TAG_subprogram ] [line 135] [local] [def] [ht_find_new]
!45 = metadata !{metadata !46}
!46 = metadata !{i32 786484, i32 0, null, metadata !"ht_prime_list", metadata !"ht_prime_list", metadata !"", metadata !6, i32 12, metadata !47, i32 1, i32 1, [28 x i64]* @ht_prime_list, null} ; [ DW_TAG_variable ] [ht_prime_list] [line 12] [local] [def]
!47 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 1792, i64 64, i32 0, i32 0, metadata !48, metadata !49, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1792, align 64, offset 0] [from long unsigned int]
!48 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!49 = metadata !{metadata !50}
!50 = metadata !{i32 786465, i64 0, i64 28}       ; [ DW_TAG_subrange_type ] [0, 27]
!51 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!52 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!53 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!54 = metadata !{i32 786689, metadata !4, metadata !"key", metadata !6, i32 16777268, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [key] [line 52]
!55 = metadata !{i32 52, i32 0, metadata !4, null}
!56 = metadata !{i32 786688, metadata !4, metadata !"newkey", metadata !6, i32 53, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [newkey] [line 53]
!57 = metadata !{i32 53, i32 0, metadata !4, null}
!58 = metadata !{i32 786688, metadata !4, metadata !"node", metadata !6, i32 54, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [node] [line 54]
!59 = metadata !{i32 54, i32 0, metadata !4, null}
!60 = metadata !{i32 55, i32 0, metadata !61, null}
!61 = metadata !{i32 786443, metadata !5, metadata !4, i32 55, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/./simple_hash.h]
!62 = metadata !{i32 56, i32 0, metadata !63, null}
!63 = metadata !{i32 786443, metadata !5, metadata !61, i32 55, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/./simple_hash.h]
!64 = metadata !{i32 57, i32 0, metadata !63, null}
!65 = metadata !{i32 59, i32 0, metadata !66, null}
!66 = metadata !{i32 786443, metadata !5, metadata !4, i32 59, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/./simple_hash.h]
!67 = metadata !{i32 60, i32 0, metadata !68, null}
!68 = metadata !{i32 786443, metadata !5, metadata !66, i32 59, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/./simple_hash.h]
!69 = metadata !{i32 61, i32 0, metadata !68, null}
!70 = metadata !{i32 63, i32 0, metadata !4, null}
!71 = metadata !{i32 64, i32 0, metadata !4, null}
!72 = metadata !{i32 65, i32 0, metadata !4, null}
!73 = metadata !{i32 66, i32 0, metadata !4, null}
!74 = metadata !{i32 786689, metadata !18, metadata !"size", metadata !6, i32 16777285, metadata !16, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 69]
!75 = metadata !{i32 69, i32 0, metadata !18, null}
!76 = metadata !{i32 786688, metadata !18, metadata !"i", metadata !6, i32 70, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 70]
!77 = metadata !{i32 70, i32 0, metadata !18, null}
!78 = metadata !{i32 786688, metadata !18, metadata !"ht", metadata !6, i32 71, metadata !21, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ht] [line 71]
!79 = metadata !{i32 71, i32 0, metadata !18, null}
!80 = metadata !{i32 72, i32 0, metadata !18, null}
!81 = metadata !{i32 72, i32 0, metadata !82, null}
!82 = metadata !{i32 786443, metadata !5, metadata !18, i32 72, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/./simple_hash.h]
!83 = metadata !{i32 73, i32 0, metadata !18, null}
!84 = metadata !{i32 74, i32 0, metadata !18, null}
!85 = metadata !{i32 75, i32 0, metadata !18, null}
!86 = metadata !{i32 76, i32 0, metadata !18, null}
!87 = metadata !{i32 77, i32 0, metadata !18, null}
!88 = metadata !{i32 81, i32 0, metadata !18, null}
!89 = metadata !{i32 786689, metadata !30, metadata !"ht", metadata !6, i32 16777300, metadata !21, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ht] [line 84]
!90 = metadata !{i32 84, i32 0, metadata !30, null}
!91 = metadata !{i32 786688, metadata !30, metadata !"cur", metadata !6, i32 85, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cur] [line 85]
!92 = metadata !{i32 85, i32 0, metadata !30, null}
!93 = metadata !{i32 786688, metadata !30, metadata !"next", metadata !6, i32 85, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [next] [line 85]
!94 = metadata !{i32 786688, metadata !30, metadata !"i", metadata !6, i32 86, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 86]
!95 = metadata !{i32 86, i32 0, metadata !30, null}
!96 = metadata !{i32 95, i32 0, metadata !97, null}
!97 = metadata !{i32 786443, metadata !5, metadata !30, i32 95, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/./simple_hash.h]
!98 = metadata !{i32 96, i32 0, metadata !99, null}
!99 = metadata !{i32 786443, metadata !5, metadata !97, i32 95, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/./simple_hash.h]
!100 = metadata !{i32 103, i32 0, metadata !99, null}
!101 = metadata !{i32 104, i32 0, metadata !102, null}
!102 = metadata !{i32 786443, metadata !5, metadata !99, i32 103, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/./simple_hash.h]
!103 = metadata !{i32 105, i32 0, metadata !102, null}
!104 = metadata !{i32 106, i32 0, metadata !102, null}
!105 = metadata !{i32 107, i32 0, metadata !102, null}
!106 = metadata !{i32 111, i32 0, metadata !102, null}
!107 = metadata !{i32 116, i32 0, metadata !99, null}
!108 = metadata !{i32 117, i32 0, metadata !30, null}
!109 = metadata !{i32 118, i32 0, metadata !30, null}
!110 = metadata !{i32 123, i32 0, metadata !30, null}
!111 = metadata !{i32 786689, metadata !33, metadata !"argc", metadata !34, i32 16777227, metadata !16, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 11]
!112 = metadata !{i32 11, i32 0, metadata !33, null}
!113 = metadata !{i32 786689, metadata !33, metadata !"argv", metadata !34, i32 33554443, metadata !37, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 11]
!114 = metadata !{i32 786688, metadata !115, metadata !"i", metadata !34, i32 17, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 17]
!115 = metadata !{i32 786443, metadata !1, metadata !33} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/hash.c]
!116 = metadata !{i32 17, i32 0, metadata !115, null}
!117 = metadata !{i32 786688, metadata !115, metadata !"c", metadata !34, i32 17, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [c] [line 17]
!118 = metadata !{i32 786688, metadata !115, metadata !"n", metadata !34, i32 17, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 17]
!119 = metadata !{i32 786688, metadata !115, metadata !"buf", metadata !34, i32 18, metadata !120, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [buf] [line 18]
!120 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 256, i64 8, i32 0, i32 0, metadata !14, metadata !121, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 256, align 8, offset 0] [from char]
!121 = metadata !{metadata !122}
!122 = metadata !{i32 786465, i64 0, i64 32}      ; [ DW_TAG_subrange_type ] [0, 31]
!123 = metadata !{i32 18, i32 0, metadata !115, null}
!124 = metadata !{i32 786688, metadata !115, metadata !"ht", metadata !34, i32 20, metadata !21, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ht] [line 20]
!125 = metadata !{i32 20, i32 0, metadata !115, null}
!126 = metadata !{i32 22, i32 0, metadata !127, null}
!127 = metadata !{i32 786443, metadata !1, metadata !115, i32 22, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/hash.c]
!128 = metadata !{i32 23, i32 0, metadata !129, null}
!129 = metadata !{i32 786443, metadata !1, metadata !127, i32 22, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/hash.c]
!130 = metadata !{i32 24, i32 0, metadata !129, null}
!131 = metadata !{i32 25, i32 0, metadata !129, null}
!132 = metadata !{i32 27, i32 0, metadata !133, null}
!133 = metadata !{i32 786443, metadata !1, metadata !115, i32 27, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/hash.c]
!134 = metadata !{i32 28, i32 0, metadata !135, null}
!135 = metadata !{i32 786443, metadata !1, metadata !133, i32 27, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/hash.c]
!136 = metadata !{i32 29, i32 0, metadata !137, null}
!137 = metadata !{i32 786443, metadata !1, metadata !135, i32 29, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/hash.c]
!138 = metadata !{i32 30, i32 0, metadata !135, null}
!139 = metadata !{i32 32, i32 0, metadata !115, null}
!140 = metadata !{i32 34, i32 0, metadata !115, null}
!141 = metadata !{i32 35, i32 0, metadata !115, null}
!142 = metadata !{i32 786689, metadata !44, metadata !"ht", metadata !6, i32 16777351, metadata !21, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ht] [line 135]
!143 = metadata !{i32 135, i32 0, metadata !44, null}
!144 = metadata !{i32 786689, metadata !44, metadata !"key", metadata !6, i32 33554567, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [key] [line 135]
!145 = metadata !{i32 786688, metadata !44, metadata !"hash_code", metadata !6, i32 136, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [hash_code] [line 136]
!146 = metadata !{i32 136, i32 0, metadata !44, null}
!147 = metadata !{i32 786688, metadata !44, metadata !"prev", metadata !6, i32 137, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [prev] [line 137]
!148 = metadata !{i32 137, i32 0, metadata !44, null}
!149 = metadata !{i32 786688, metadata !44, metadata !"node", metadata !6, i32 137, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [node] [line 137]
!150 = metadata !{i32 138, i32 0, metadata !44, null}
!151 = metadata !{i32 139, i32 0, metadata !152, null}
!152 = metadata !{i32 786443, metadata !5, metadata !153, i32 139, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/./simple_hash.h]
!153 = metadata !{i32 786443, metadata !5, metadata !44, i32 138, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/./simple_hash.h]
!154 = metadata !{i32 140, i32 0, metadata !153, null}
!155 = metadata !{i32 141, i32 0, metadata !153, null}
!156 = metadata !{i32 145, i32 0, metadata !153, null}
!157 = metadata !{i32 146, i32 0, metadata !44, null}
!158 = metadata !{i32 147, i32 0, metadata !159, null}
!159 = metadata !{i32 786443, metadata !5, metadata !44, i32 147, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/./simple_hash.h]
!160 = metadata !{i32 148, i32 0, metadata !161, null}
!161 = metadata !{i32 786443, metadata !5, metadata !159, i32 147, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/./simple_hash.h]
!162 = metadata !{i32 150, i32 0, metadata !163, null}
!163 = metadata !{i32 786443, metadata !5, metadata !159, i32 149, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/./simple_hash.h]
!164 = metadata !{i32 152, i32 0, metadata !44, null}
!165 = metadata !{i32 786689, metadata !38, metadata !"ht", metadata !6, i32 16777341, metadata !21, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ht] [line 125]
!166 = metadata !{i32 125, i32 0, metadata !38, null}
!167 = metadata !{i32 786689, metadata !38, metadata !"key", metadata !6, i32 33554557, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [key] [line 125]
!168 = metadata !{i32 786688, metadata !169, metadata !"hash_code", metadata !6, i32 126, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [hash_code] [line 126]
!169 = metadata !{i32 786443, metadata !5, metadata !38} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/./simple_hash.h]
!170 = metadata !{i32 126, i32 0, metadata !169, null}
!171 = metadata !{i32 786688, metadata !169, metadata !"node", metadata !6, i32 127, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [node] [line 127]
!172 = metadata !{i32 127, i32 0, metadata !169, null}
!173 = metadata !{i32 128, i32 0, metadata !169, null}
!174 = metadata !{i32 129, i32 0, metadata !175, null}
!175 = metadata !{i32 786443, metadata !5, metadata !176, i32 129, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/./simple_hash.h]
!176 = metadata !{i32 786443, metadata !5, metadata !169, i32 128, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/./simple_hash.h]
!177 = metadata !{i32 130, i32 0, metadata !176, null}
!178 = metadata !{i32 131, i32 0, metadata !176, null}
!179 = metadata !{i32 132, i32 0, metadata !169, null}
!180 = metadata !{i32 133, i32 0, metadata !169, null}
!181 = metadata !{i32 786689, metadata !41, metadata !"ht", metadata !6, i32 16777262, metadata !21, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ht] [line 46]
!182 = metadata !{i32 46, i32 0, metadata !41, null}
!183 = metadata !{i32 786689, metadata !41, metadata !"key", metadata !6, i32 33554478, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [key] [line 46]
!184 = metadata !{i32 786688, metadata !41, metadata !"val", metadata !6, i32 47, metadata !48, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [val] [line 47]
!185 = metadata !{i32 47, i32 0, metadata !41, null}
!186 = metadata !{i32 48, i32 0, metadata !187, null}
!187 = metadata !{i32 786443, metadata !5, metadata !41, i32 48, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/./simple_hash.h]
!188 = metadata !{i32 49, i32 0, metadata !41, null}
