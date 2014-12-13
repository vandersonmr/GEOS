; ModuleID = 'lists.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

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
  %1 = alloca %struct.DLL*, align 8
  %2 = alloca %struct.DLL*, align 8
  %tail = alloca %struct.DLL*, align 8
  store %struct.DLL* %head, %struct.DLL** %1, align 8
  call void @llvm.dbg.declare(metadata !{%struct.DLL** %1}, metadata !56), !dbg !57
  store %struct.DLL* %item, %struct.DLL** %2, align 8
  call void @llvm.dbg.declare(metadata !{%struct.DLL** %2}, metadata !58), !dbg !57
  call void @llvm.dbg.declare(metadata !{%struct.DLL** %tail}, metadata !59), !dbg !60
  %3 = load %struct.DLL** %1, align 8, !dbg !60
  %4 = getelementptr inbounds %struct.DLL* %3, i32 0, i32 2, !dbg !60
  %5 = load %struct.DLL** %4, align 8, !dbg !60
  store %struct.DLL* %5, %struct.DLL** %tail, align 8, !dbg !60
  %6 = load %struct.DLL** %2, align 8, !dbg !61
  %7 = load %struct.DLL** %tail, align 8, !dbg !61
  %8 = getelementptr inbounds %struct.DLL* %7, i32 0, i32 1, !dbg !61
  store %struct.DLL* %6, %struct.DLL** %8, align 8, !dbg !61
  %9 = load %struct.DLL** %1, align 8, !dbg !62
  %10 = load %struct.DLL** %2, align 8, !dbg !62
  %11 = getelementptr inbounds %struct.DLL* %10, i32 0, i32 1, !dbg !62
  store %struct.DLL* %9, %struct.DLL** %11, align 8, !dbg !62
  %12 = load %struct.DLL** %2, align 8, !dbg !63
  %13 = load %struct.DLL** %1, align 8, !dbg !63
  %14 = getelementptr inbounds %struct.DLL* %13, i32 0, i32 2, !dbg !63
  store %struct.DLL* %12, %struct.DLL** %14, align 8, !dbg !63
  %15 = load %struct.DLL** %tail, align 8, !dbg !64
  %16 = load %struct.DLL** %2, align 8, !dbg !64
  %17 = getelementptr inbounds %struct.DLL* %16, i32 0, i32 2, !dbg !64
  store %struct.DLL* %15, %struct.DLL** %17, align 8, !dbg !64
  %18 = load %struct.DLL** %1, align 8, !dbg !65
  %19 = getelementptr inbounds %struct.DLL* %18, i32 0, i32 0, !dbg !65
  %20 = load i32* %19, align 4, !dbg !65
  %21 = add nsw i32 %20, 1, !dbg !65
  store i32 %21, i32* %19, align 4, !dbg !65
  ret void, !dbg !66
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define %struct.DLL* @list_pop_tail(%struct.DLL* %head) #0 {
  %1 = alloca %struct.DLL*, align 8
  %2 = alloca %struct.DLL*, align 8
  %prev = alloca %struct.DLL*, align 8
  %tail = alloca %struct.DLL*, align 8
  store %struct.DLL* %head, %struct.DLL** %2, align 8
  call void @llvm.dbg.declare(metadata !{%struct.DLL** %2}, metadata !67), !dbg !68
  call void @llvm.dbg.declare(metadata !{%struct.DLL** %prev}, metadata !69), !dbg !70
  call void @llvm.dbg.declare(metadata !{%struct.DLL** %tail}, metadata !71), !dbg !70
  %3 = load %struct.DLL** %2, align 8, !dbg !72
  %4 = call i32 @list_empty(%struct.DLL* %3), !dbg !72
  %5 = icmp ne i32 %4, 0, !dbg !72
  br i1 %5, label %6, label %7, !dbg !72

; <label>:6                                       ; preds = %0
  store %struct.DLL* null, %struct.DLL** %1, !dbg !72
  br label %25, !dbg !72

; <label>:7                                       ; preds = %0
  %8 = load %struct.DLL** %2, align 8, !dbg !74
  %9 = getelementptr inbounds %struct.DLL* %8, i32 0, i32 2, !dbg !74
  %10 = load %struct.DLL** %9, align 8, !dbg !74
  store %struct.DLL* %10, %struct.DLL** %tail, align 8, !dbg !74
  %11 = load %struct.DLL** %tail, align 8, !dbg !75
  %12 = getelementptr inbounds %struct.DLL* %11, i32 0, i32 2, !dbg !75
  %13 = load %struct.DLL** %12, align 8, !dbg !75
  store %struct.DLL* %13, %struct.DLL** %prev, align 8, !dbg !75
  %14 = load %struct.DLL** %2, align 8, !dbg !76
  %15 = load %struct.DLL** %prev, align 8, !dbg !76
  %16 = getelementptr inbounds %struct.DLL* %15, i32 0, i32 1, !dbg !76
  store %struct.DLL* %14, %struct.DLL** %16, align 8, !dbg !76
  %17 = load %struct.DLL** %prev, align 8, !dbg !77
  %18 = load %struct.DLL** %2, align 8, !dbg !77
  %19 = getelementptr inbounds %struct.DLL* %18, i32 0, i32 2, !dbg !77
  store %struct.DLL* %17, %struct.DLL** %19, align 8, !dbg !77
  %20 = load %struct.DLL** %2, align 8, !dbg !78
  %21 = getelementptr inbounds %struct.DLL* %20, i32 0, i32 0, !dbg !78
  %22 = load i32* %21, align 4, !dbg !78
  %23 = add nsw i32 %22, -1, !dbg !78
  store i32 %23, i32* %21, align 4, !dbg !78
  %24 = load %struct.DLL** %tail, align 8, !dbg !79
  store %struct.DLL* %24, %struct.DLL** %1, !dbg !79
  br label %25, !dbg !79

; <label>:25                                      ; preds = %7, %6
  %26 = load %struct.DLL** %1, !dbg !80
  ret %struct.DLL* %26, !dbg !80
}

; Function Attrs: nounwind uwtable
define internal i32 @list_empty(%struct.DLL* %head) #0 {
  %1 = alloca %struct.DLL*, align 8
  store %struct.DLL* %head, %struct.DLL** %1, align 8
  call void @llvm.dbg.declare(metadata !{%struct.DLL** %1}, metadata !81), !dbg !82
  %2 = load %struct.DLL** %1, align 8, !dbg !82
  %3 = call i32 @list_length(%struct.DLL* %2), !dbg !82
  %4 = icmp eq i32 %3, 0, !dbg !82
  %5 = zext i1 %4 to i32, !dbg !82
  ret i32 %5, !dbg !82
}

; Function Attrs: nounwind uwtable
define void @list_push_head(%struct.DLL* %head, %struct.DLL* %item) #0 {
  %1 = alloca %struct.DLL*, align 8
  %2 = alloca %struct.DLL*, align 8
  %next = alloca %struct.DLL*, align 8
  store %struct.DLL* %head, %struct.DLL** %1, align 8
  call void @llvm.dbg.declare(metadata !{%struct.DLL** %1}, metadata !83), !dbg !84
  store %struct.DLL* %item, %struct.DLL** %2, align 8
  call void @llvm.dbg.declare(metadata !{%struct.DLL** %2}, metadata !85), !dbg !84
  call void @llvm.dbg.declare(metadata !{%struct.DLL** %next}, metadata !86), !dbg !87
  %3 = load %struct.DLL** %1, align 8, !dbg !87
  %4 = getelementptr inbounds %struct.DLL* %3, i32 0, i32 1, !dbg !87
  %5 = load %struct.DLL** %4, align 8, !dbg !87
  store %struct.DLL* %5, %struct.DLL** %next, align 8, !dbg !87
  %6 = load %struct.DLL** %2, align 8, !dbg !88
  %7 = load %struct.DLL** %1, align 8, !dbg !88
  %8 = getelementptr inbounds %struct.DLL* %7, i32 0, i32 1, !dbg !88
  store %struct.DLL* %6, %struct.DLL** %8, align 8, !dbg !88
  %9 = load %struct.DLL** %2, align 8, !dbg !89
  %10 = load %struct.DLL** %next, align 8, !dbg !89
  %11 = getelementptr inbounds %struct.DLL* %10, i32 0, i32 2, !dbg !89
  store %struct.DLL* %9, %struct.DLL** %11, align 8, !dbg !89
  %12 = load %struct.DLL** %next, align 8, !dbg !90
  %13 = load %struct.DLL** %2, align 8, !dbg !90
  %14 = getelementptr inbounds %struct.DLL* %13, i32 0, i32 1, !dbg !90
  store %struct.DLL* %12, %struct.DLL** %14, align 8, !dbg !90
  %15 = load %struct.DLL** %1, align 8, !dbg !91
  %16 = load %struct.DLL** %2, align 8, !dbg !91
  %17 = getelementptr inbounds %struct.DLL* %16, i32 0, i32 2, !dbg !91
  store %struct.DLL* %15, %struct.DLL** %17, align 8, !dbg !91
  %18 = load %struct.DLL** %1, align 8, !dbg !92
  %19 = getelementptr inbounds %struct.DLL* %18, i32 0, i32 0, !dbg !92
  %20 = load i32* %19, align 4, !dbg !92
  %21 = add nsw i32 %20, 1, !dbg !92
  store i32 %21, i32* %19, align 4, !dbg !92
  ret void, !dbg !93
}

; Function Attrs: nounwind uwtable
define %struct.DLL* @list_pop_head(%struct.DLL* %head) #0 {
  %1 = alloca %struct.DLL*, align 8
  %2 = alloca %struct.DLL*, align 8
  %next = alloca %struct.DLL*, align 8
  store %struct.DLL* %head, %struct.DLL** %2, align 8
  call void @llvm.dbg.declare(metadata !{%struct.DLL** %2}, metadata !94), !dbg !95
  call void @llvm.dbg.declare(metadata !{%struct.DLL** %next}, metadata !96), !dbg !97
  %3 = load %struct.DLL** %2, align 8, !dbg !98
  %4 = call i32 @list_empty(%struct.DLL* %3), !dbg !98
  %5 = icmp ne i32 %4, 0, !dbg !98
  br i1 %5, label %6, label %7, !dbg !98

; <label>:6                                       ; preds = %0
  store %struct.DLL* null, %struct.DLL** %1, !dbg !98
  br label %26, !dbg !98

; <label>:7                                       ; preds = %0
  %8 = load %struct.DLL** %2, align 8, !dbg !100
  %9 = getelementptr inbounds %struct.DLL* %8, i32 0, i32 1, !dbg !100
  %10 = load %struct.DLL** %9, align 8, !dbg !100
  store %struct.DLL* %10, %struct.DLL** %next, align 8, !dbg !100
  %11 = load %struct.DLL** %next, align 8, !dbg !101
  %12 = getelementptr inbounds %struct.DLL* %11, i32 0, i32 1, !dbg !101
  %13 = load %struct.DLL** %12, align 8, !dbg !101
  %14 = load %struct.DLL** %2, align 8, !dbg !101
  %15 = getelementptr inbounds %struct.DLL* %14, i32 0, i32 1, !dbg !101
  store %struct.DLL* %13, %struct.DLL** %15, align 8, !dbg !101
  %16 = load %struct.DLL** %2, align 8, !dbg !102
  %17 = load %struct.DLL** %next, align 8, !dbg !102
  %18 = getelementptr inbounds %struct.DLL* %17, i32 0, i32 1, !dbg !102
  %19 = load %struct.DLL** %18, align 8, !dbg !102
  %20 = getelementptr inbounds %struct.DLL* %19, i32 0, i32 2, !dbg !102
  store %struct.DLL* %16, %struct.DLL** %20, align 8, !dbg !102
  %21 = load %struct.DLL** %2, align 8, !dbg !103
  %22 = getelementptr inbounds %struct.DLL* %21, i32 0, i32 0, !dbg !103
  %23 = load i32* %22, align 4, !dbg !103
  %24 = add nsw i32 %23, -1, !dbg !103
  store i32 %24, i32* %22, align 4, !dbg !103
  %25 = load %struct.DLL** %next, align 8, !dbg !104
  store %struct.DLL* %25, %struct.DLL** %1, !dbg !104
  br label %26, !dbg !104

; <label>:26                                      ; preds = %7, %6
  %27 = load %struct.DLL** %1, !dbg !105
  ret %struct.DLL* %27, !dbg !105
}

; Function Attrs: nounwind uwtable
define i32 @list_equal(%struct.DLL* %x, %struct.DLL* %y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.DLL*, align 8
  %3 = alloca %struct.DLL*, align 8
  %xp = alloca %struct.DLL*, align 8
  %yp = alloca %struct.DLL*, align 8
  store %struct.DLL* %x, %struct.DLL** %2, align 8
  call void @llvm.dbg.declare(metadata !{%struct.DLL** %2}, metadata !106), !dbg !107
  store %struct.DLL* %y, %struct.DLL** %3, align 8
  call void @llvm.dbg.declare(metadata !{%struct.DLL** %3}, metadata !108), !dbg !107
  call void @llvm.dbg.declare(metadata !{%struct.DLL** %xp}, metadata !109), !dbg !110
  call void @llvm.dbg.declare(metadata !{%struct.DLL** %yp}, metadata !111), !dbg !110
  %4 = load %struct.DLL** %2, align 8, !dbg !112
  store %struct.DLL* %4, %struct.DLL** %xp, align 8, !dbg !112
  %5 = load %struct.DLL** %3, align 8, !dbg !112
  store %struct.DLL* %5, %struct.DLL** %yp, align 8, !dbg !112
  br label %6, !dbg !112

; <label>:6                                       ; preds = %22, %0
  %7 = load %struct.DLL** %xp, align 8, !dbg !112
  %8 = getelementptr inbounds %struct.DLL* %7, i32 0, i32 1, !dbg !112
  %9 = load %struct.DLL** %8, align 8, !dbg !112
  %10 = load %struct.DLL** %2, align 8, !dbg !112
  %11 = icmp ne %struct.DLL* %9, %10, !dbg !112
  br i1 %11, label %12, label %29, !dbg !112

; <label>:12                                      ; preds = %6
  %13 = load %struct.DLL** %xp, align 8, !dbg !114
  %14 = getelementptr inbounds %struct.DLL* %13, i32 0, i32 0, !dbg !114
  %15 = load i32* %14, align 4, !dbg !114
  %16 = load %struct.DLL** %yp, align 8, !dbg !114
  %17 = getelementptr inbounds %struct.DLL* %16, i32 0, i32 0, !dbg !114
  %18 = load i32* %17, align 4, !dbg !114
  %19 = icmp ne i32 %15, %18, !dbg !114
  br i1 %19, label %20, label %21, !dbg !114

; <label>:20                                      ; preds = %12
  store i32 0, i32* %1, !dbg !114
  br label %45, !dbg !114

; <label>:21                                      ; preds = %12
  br label %22, !dbg !117

; <label>:22                                      ; preds = %21
  %23 = load %struct.DLL** %xp, align 8, !dbg !112
  %24 = getelementptr inbounds %struct.DLL* %23, i32 0, i32 1, !dbg !112
  %25 = load %struct.DLL** %24, align 8, !dbg !112
  store %struct.DLL* %25, %struct.DLL** %xp, align 8, !dbg !112
  %26 = load %struct.DLL** %yp, align 8, !dbg !112
  %27 = getelementptr inbounds %struct.DLL* %26, i32 0, i32 1, !dbg !112
  %28 = load %struct.DLL** %27, align 8, !dbg !112
  store %struct.DLL* %28, %struct.DLL** %yp, align 8, !dbg !112
  br label %6, !dbg !112

; <label>:29                                      ; preds = %6
  %30 = load %struct.DLL** %xp, align 8, !dbg !118
  %31 = getelementptr inbounds %struct.DLL* %30, i32 0, i32 0, !dbg !118
  %32 = load i32* %31, align 4, !dbg !118
  %33 = load %struct.DLL** %yp, align 8, !dbg !118
  %34 = getelementptr inbounds %struct.DLL* %33, i32 0, i32 0, !dbg !118
  %35 = load i32* %34, align 4, !dbg !118
  %36 = icmp ne i32 %32, %35, !dbg !118
  br i1 %36, label %37, label %38, !dbg !118

; <label>:37                                      ; preds = %29
  store i32 0, i32* %1, !dbg !118
  br label %45, !dbg !118

; <label>:38                                      ; preds = %29
  %39 = load %struct.DLL** %yp, align 8, !dbg !120
  %40 = getelementptr inbounds %struct.DLL* %39, i32 0, i32 1, !dbg !120
  %41 = load %struct.DLL** %40, align 8, !dbg !120
  %42 = load %struct.DLL** %3, align 8, !dbg !120
  %43 = icmp eq %struct.DLL* %41, %42, !dbg !120
  %44 = zext i1 %43 to i32, !dbg !120
  store i32 %44, i32* %1, !dbg !120
  br label %45, !dbg !120

; <label>:45                                      ; preds = %38, %37, %20
  %46 = load i32* %1, !dbg !121
  ret i32 %46, !dbg !121
}

; Function Attrs: nounwind uwtable
define void @list_print(i8* %msg, %struct.DLL* %x) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca %struct.DLL*, align 8
  %xp = alloca %struct.DLL*, align 8
  %first = alloca %struct.DLL*, align 8
  %i = alloca i32, align 4
  store i8* %msg, i8** %1, align 8
  call void @llvm.dbg.declare(metadata !{i8** %1}, metadata !122), !dbg !123
  store %struct.DLL* %x, %struct.DLL** %2, align 8
  call void @llvm.dbg.declare(metadata !{%struct.DLL** %2}, metadata !124), !dbg !123
  call void @llvm.dbg.declare(metadata !{%struct.DLL** %xp}, metadata !125), !dbg !126
  call void @llvm.dbg.declare(metadata !{%struct.DLL** %first}, metadata !127), !dbg !126
  %3 = load %struct.DLL** %2, align 8, !dbg !126
  %4 = getelementptr inbounds %struct.DLL* %3, i32 0, i32 1, !dbg !126
  %5 = load %struct.DLL** %4, align 8, !dbg !126
  store %struct.DLL* %5, %struct.DLL** %first, align 8, !dbg !126
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !128), !dbg !129
  store i32 0, i32* %i, align 4, !dbg !129
  %6 = load i8** %1, align 8, !dbg !130
  %7 = call i32 @puts(i8* %6), !dbg !130
  %8 = load %struct.DLL** %2, align 8, !dbg !131
  %9 = call i32 @list_length(%struct.DLL* %8), !dbg !131
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i32 %9), !dbg !131
  %11 = load %struct.DLL** %2, align 8, !dbg !132
  %12 = getelementptr inbounds %struct.DLL* %11, i32 0, i32 1, !dbg !132
  %13 = load %struct.DLL** %12, align 8, !dbg !132
  store %struct.DLL* %13, %struct.DLL** %xp, align 8, !dbg !132
  br label %14, !dbg !132

; <label>:14                                      ; preds = %37, %0
  %15 = load %struct.DLL** %xp, align 8, !dbg !132
  %16 = getelementptr inbounds %struct.DLL* %15, i32 0, i32 1, !dbg !132
  %17 = load %struct.DLL** %16, align 8, !dbg !132
  %18 = load %struct.DLL** %first, align 8, !dbg !132
  %19 = icmp ne %struct.DLL* %17, %18, !dbg !132
  br i1 %19, label %20, label %41, !dbg !132

; <label>:20                                      ; preds = %14
  %21 = load i32* %i, align 4, !dbg !134
  %22 = add nsw i32 %21, 1, !dbg !134
  store i32 %22, i32* %i, align 4, !dbg !134
  %23 = load %struct.DLL** %xp, align 8, !dbg !134
  %24 = getelementptr inbounds %struct.DLL* %23, i32 0, i32 0, !dbg !134
  %25 = load i32* %24, align 4, !dbg !134
  %26 = load %struct.DLL** %xp, align 8, !dbg !134
  %27 = getelementptr inbounds %struct.DLL* %26, i32 0, i32 1, !dbg !134
  %28 = load %struct.DLL** %27, align 8, !dbg !134
  %29 = getelementptr inbounds %struct.DLL* %28, i32 0, i32 0, !dbg !134
  %30 = load i32* %29, align 4, !dbg !134
  %31 = load %struct.DLL** %xp, align 8, !dbg !134
  %32 = getelementptr inbounds %struct.DLL* %31, i32 0, i32 2, !dbg !134
  %33 = load %struct.DLL** %32, align 8, !dbg !134
  %34 = getelementptr inbounds %struct.DLL* %33, i32 0, i32 0, !dbg !134
  %35 = load i32* %34, align 4, !dbg !134
  %36 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str1, i32 0, i32 0), i32 %22, i32 %25, i32 %30, i32 %35), !dbg !134
  br label %37, !dbg !136

; <label>:37                                      ; preds = %20
  %38 = load %struct.DLL** %xp, align 8, !dbg !132
  %39 = getelementptr inbounds %struct.DLL* %38, i32 0, i32 1, !dbg !132
  %40 = load %struct.DLL** %39, align 8, !dbg !132
  store %struct.DLL* %40, %struct.DLL** %xp, align 8, !dbg !132
  br label %14, !dbg !132

; <label>:41                                      ; preds = %14
  %42 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([34 x i8]* @.str2, i32 0, i32 0)), !dbg !137
  %43 = load %struct.DLL** %xp, align 8, !dbg !138
  %44 = getelementptr inbounds %struct.DLL* %43, i32 0, i32 1, !dbg !138
  %45 = load %struct.DLL** %44, align 8, !dbg !138
  %46 = getelementptr inbounds %struct.DLL* %45, i32 0, i32 0, !dbg !138
  %47 = load i32* %46, align 4, !dbg !138
  %48 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str3, i32 0, i32 0), i32 %47), !dbg !138
  ret void, !dbg !139
}

declare i32 @puts(i8*) #2

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define internal i32 @list_length(%struct.DLL* %head) #0 {
  %1 = alloca %struct.DLL*, align 8
  store %struct.DLL* %head, %struct.DLL** %1, align 8
  call void @llvm.dbg.declare(metadata !{%struct.DLL** %1}, metadata !140), !dbg !141
  %2 = load %struct.DLL** %1, align 8, !dbg !141
  %3 = getelementptr inbounds %struct.DLL* %2, i32 0, i32 0, !dbg !141
  %4 = load i32* %3, align 4, !dbg !141
  ret i32 %4, !dbg !141
}

; Function Attrs: nounwind uwtable
define %struct.DLL* @list_new() #0 {
  %l = alloca %struct.DLL*, align 8
  call void @llvm.dbg.declare(metadata !{%struct.DLL** %l}, metadata !142), !dbg !143
  %1 = call noalias i8* @malloc(i64 24) #6, !dbg !143
  %2 = bitcast i8* %1 to %struct.DLL*, !dbg !143
  store %struct.DLL* %2, %struct.DLL** %l, align 8, !dbg !143
  %3 = load %struct.DLL** %l, align 8, !dbg !144
  %4 = load %struct.DLL** %l, align 8, !dbg !144
  %5 = getelementptr inbounds %struct.DLL* %4, i32 0, i32 1, !dbg !144
  store %struct.DLL* %3, %struct.DLL** %5, align 8, !dbg !144
  %6 = load %struct.DLL** %l, align 8, !dbg !145
  %7 = load %struct.DLL** %l, align 8, !dbg !145
  %8 = getelementptr inbounds %struct.DLL* %7, i32 0, i32 2, !dbg !145
  store %struct.DLL* %6, %struct.DLL** %8, align 8, !dbg !145
  %9 = load %struct.DLL** %l, align 8, !dbg !146
  %10 = getelementptr inbounds %struct.DLL* %9, i32 0, i32 0, !dbg !146
  store i32 0, i32* %10, align 4, !dbg !146
  %11 = load %struct.DLL** %l, align 8, !dbg !147
  ret %struct.DLL* %11, !dbg !147
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #3

; Function Attrs: nounwind uwtable
define %struct.DLL* @list_sequence(i32 %from, i32 %to) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %size = alloca i32, align 4
  %tmp = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %l = alloca %struct.DLL*, align 8
  store i32 %from, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !148), !dbg !149
  store i32 %to, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !150), !dbg !149
  call void @llvm.dbg.declare(metadata !{i32* %size}, metadata !151), !dbg !152
  call void @llvm.dbg.declare(metadata !{i32* %tmp}, metadata !153), !dbg !152
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !154), !dbg !152
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !155), !dbg !152
  call void @llvm.dbg.declare(metadata !{%struct.DLL** %l}, metadata !156), !dbg !157
  %3 = load i32* %1, align 4, !dbg !158
  %4 = load i32* %2, align 4, !dbg !158
  %5 = icmp sgt i32 %3, %4, !dbg !158
  br i1 %5, label %6, label %10, !dbg !158

; <label>:6                                       ; preds = %0
  %7 = load i32* %1, align 4, !dbg !160
  store i32 %7, i32* %tmp, align 4, !dbg !160
  %8 = load i32* %2, align 4, !dbg !160
  store i32 %8, i32* %1, align 4, !dbg !160
  %9 = load i32* %tmp, align 4, !dbg !160
  store i32 %9, i32* %2, align 4, !dbg !160
  br label %10, !dbg !162

; <label>:10                                      ; preds = %6, %0
  %11 = load i32* %2, align 4, !dbg !163
  %12 = load i32* %1, align 4, !dbg !163
  %13 = sub nsw i32 %11, %12, !dbg !163
  %14 = add nsw i32 %13, 1, !dbg !163
  store i32 %14, i32* %size, align 4, !dbg !163
  %15 = load i32* %size, align 4, !dbg !164
  %16 = add nsw i32 %15, 1, !dbg !164
  %17 = sext i32 %16 to i64, !dbg !164
  %18 = mul i64 %17, 24, !dbg !164
  %19 = call noalias i8* @malloc(i64 %18) #6, !dbg !164
  %20 = bitcast i8* %19 to %struct.DLL*, !dbg !164
  store %struct.DLL* %20, %struct.DLL** %l, align 8, !dbg !164
  %21 = load i32* %1, align 4, !dbg !165
  %22 = add nsw i32 %21, -1, !dbg !165
  store i32 %22, i32* %1, align 4, !dbg !165
  store i32 0, i32* %i, align 4, !dbg !166
  store i32 1, i32* %j, align 4, !dbg !166
  br label %23, !dbg !166

; <label>:23                                      ; preds = %55, %10
  %24 = load i32* %i, align 4, !dbg !166
  %25 = load i32* %size, align 4, !dbg !166
  %26 = icmp slt i32 %24, %25, !dbg !166
  br i1 %26, label %27, label %60, !dbg !166

; <label>:27                                      ; preds = %23
  %28 = load i32* %i, align 4, !dbg !168
  %29 = add nsw i32 %28, 1, !dbg !168
  %30 = sext i32 %29 to i64, !dbg !168
  %31 = load %struct.DLL** %l, align 8, !dbg !168
  %32 = getelementptr inbounds %struct.DLL* %31, i64 %30, !dbg !168
  %33 = load i32* %i, align 4, !dbg !168
  %34 = sext i32 %33 to i64, !dbg !168
  %35 = load %struct.DLL** %l, align 8, !dbg !168
  %36 = getelementptr inbounds %struct.DLL* %35, i64 %34, !dbg !168
  %37 = getelementptr inbounds %struct.DLL* %36, i32 0, i32 1, !dbg !168
  store %struct.DLL* %32, %struct.DLL** %37, align 8, !dbg !168
  %38 = load i32* %j, align 4, !dbg !170
  %39 = sub nsw i32 %38, 1, !dbg !170
  %40 = sext i32 %39 to i64, !dbg !170
  %41 = load %struct.DLL** %l, align 8, !dbg !170
  %42 = getelementptr inbounds %struct.DLL* %41, i64 %40, !dbg !170
  %43 = load i32* %j, align 4, !dbg !170
  %44 = sext i32 %43 to i64, !dbg !170
  %45 = load %struct.DLL** %l, align 8, !dbg !170
  %46 = getelementptr inbounds %struct.DLL* %45, i64 %44, !dbg !170
  %47 = getelementptr inbounds %struct.DLL* %46, i32 0, i32 2, !dbg !170
  store %struct.DLL* %42, %struct.DLL** %47, align 8, !dbg !170
  %48 = load i32* %1, align 4, !dbg !171
  %49 = add nsw i32 %48, 1, !dbg !171
  store i32 %49, i32* %1, align 4, !dbg !171
  %50 = load i32* %i, align 4, !dbg !171
  %51 = sext i32 %50 to i64, !dbg !171
  %52 = load %struct.DLL** %l, align 8, !dbg !171
  %53 = getelementptr inbounds %struct.DLL* %52, i64 %51, !dbg !171
  %54 = getelementptr inbounds %struct.DLL* %53, i32 0, i32 0, !dbg !171
  store i32 %48, i32* %54, align 4, !dbg !171
  br label %55, !dbg !172

; <label>:55                                      ; preds = %27
  %56 = load i32* %i, align 4, !dbg !166
  %57 = add nsw i32 %56, 1, !dbg !166
  store i32 %57, i32* %i, align 4, !dbg !166
  %58 = load i32* %j, align 4, !dbg !166
  %59 = add nsw i32 %58, 1, !dbg !166
  store i32 %59, i32* %j, align 4, !dbg !166
  br label %23, !dbg !166

; <label>:60                                      ; preds = %23
  %61 = load i32* %size, align 4, !dbg !173
  %62 = sext i32 %61 to i64, !dbg !173
  %63 = load %struct.DLL** %l, align 8, !dbg !173
  %64 = getelementptr inbounds %struct.DLL* %63, i64 %62, !dbg !173
  %65 = load %struct.DLL** %l, align 8, !dbg !173
  %66 = getelementptr inbounds %struct.DLL* %65, i64 0, !dbg !173
  %67 = getelementptr inbounds %struct.DLL* %66, i32 0, i32 2, !dbg !173
  store %struct.DLL* %64, %struct.DLL** %67, align 8, !dbg !173
  %68 = load %struct.DLL** %l, align 8, !dbg !174
  %69 = getelementptr inbounds %struct.DLL* %68, i64 0, !dbg !174
  %70 = load i32* %size, align 4, !dbg !174
  %71 = sext i32 %70 to i64, !dbg !174
  %72 = load %struct.DLL** %l, align 8, !dbg !174
  %73 = getelementptr inbounds %struct.DLL* %72, i64 %71, !dbg !174
  %74 = getelementptr inbounds %struct.DLL* %73, i32 0, i32 1, !dbg !174
  store %struct.DLL* %69, %struct.DLL** %74, align 8, !dbg !174
  %75 = load i32* %size, align 4, !dbg !175
  %76 = sub nsw i32 %75, 1, !dbg !175
  %77 = sext i32 %76 to i64, !dbg !175
  %78 = load %struct.DLL** %l, align 8, !dbg !175
  %79 = getelementptr inbounds %struct.DLL* %78, i64 %77, !dbg !175
  %80 = load i32* %size, align 4, !dbg !175
  %81 = sext i32 %80 to i64, !dbg !175
  %82 = load %struct.DLL** %l, align 8, !dbg !175
  %83 = getelementptr inbounds %struct.DLL* %82, i64 %81, !dbg !175
  %84 = getelementptr inbounds %struct.DLL* %83, i32 0, i32 2, !dbg !175
  store %struct.DLL* %79, %struct.DLL** %84, align 8, !dbg !175
  %85 = load i32* %1, align 4, !dbg !176
  %86 = load i32* %size, align 4, !dbg !176
  %87 = sext i32 %86 to i64, !dbg !176
  %88 = load %struct.DLL** %l, align 8, !dbg !176
  %89 = getelementptr inbounds %struct.DLL* %88, i64 %87, !dbg !176
  %90 = getelementptr inbounds %struct.DLL* %89, i32 0, i32 0, !dbg !176
  store i32 %85, i32* %90, align 4, !dbg !176
  %91 = load i32* %size, align 4, !dbg !177
  %92 = load %struct.DLL** %l, align 8, !dbg !177
  %93 = getelementptr inbounds %struct.DLL* %92, i64 0, !dbg !177
  %94 = getelementptr inbounds %struct.DLL* %93, i32 0, i32 0, !dbg !177
  store i32 %91, i32* %94, align 4, !dbg !177
  %95 = load %struct.DLL** %l, align 8, !dbg !178
  ret %struct.DLL* %95, !dbg !178
}

; Function Attrs: nounwind uwtable
define %struct.DLL* @list_copy(%struct.DLL* %x) #0 {
  %1 = alloca %struct.DLL*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %size = alloca i32, align 4
  %xp = alloca %struct.DLL*, align 8
  %l = alloca %struct.DLL*, align 8
  store %struct.DLL* %x, %struct.DLL** %1, align 8
  call void @llvm.dbg.declare(metadata !{%struct.DLL** %1}, metadata !179), !dbg !180
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !181), !dbg !182
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !183), !dbg !182
  call void @llvm.dbg.declare(metadata !{i32* %size}, metadata !184), !dbg !182
  %2 = load %struct.DLL** %1, align 8, !dbg !182
  %3 = call i32 @list_length(%struct.DLL* %2), !dbg !182
  store i32 %3, i32* %size, align 4, !dbg !182
  call void @llvm.dbg.declare(metadata !{%struct.DLL** %xp}, metadata !185), !dbg !186
  call void @llvm.dbg.declare(metadata !{%struct.DLL** %l}, metadata !187), !dbg !186
  %4 = load i32* %size, align 4, !dbg !186
  %5 = add nsw i32 %4, 1, !dbg !186
  %6 = sext i32 %5 to i64, !dbg !186
  %7 = mul i64 %6, 24, !dbg !186
  %8 = call noalias i8* @malloc(i64 %7) #6, !dbg !186
  %9 = bitcast i8* %8 to %struct.DLL*, !dbg !186
  store %struct.DLL* %9, %struct.DLL** %l, align 8, !dbg !186
  store i32 0, i32* %i, align 4, !dbg !188
  store i32 1, i32* %j, align 4, !dbg !188
  %10 = load %struct.DLL** %1, align 8, !dbg !188
  store %struct.DLL* %10, %struct.DLL** %xp, align 8, !dbg !188
  br label %11, !dbg !188

; <label>:11                                      ; preds = %42, %0
  %12 = load i32* %i, align 4, !dbg !188
  %13 = load i32* %size, align 4, !dbg !188
  %14 = icmp slt i32 %12, %13, !dbg !188
  br i1 %14, label %15, label %50, !dbg !188

; <label>:15                                      ; preds = %11
  %16 = load i32* %j, align 4, !dbg !190
  %17 = sext i32 %16 to i64, !dbg !190
  %18 = load %struct.DLL** %l, align 8, !dbg !190
  %19 = getelementptr inbounds %struct.DLL* %18, i64 %17, !dbg !190
  %20 = load i32* %i, align 4, !dbg !190
  %21 = sext i32 %20 to i64, !dbg !190
  %22 = load %struct.DLL** %l, align 8, !dbg !190
  %23 = getelementptr inbounds %struct.DLL* %22, i64 %21, !dbg !190
  %24 = getelementptr inbounds %struct.DLL* %23, i32 0, i32 1, !dbg !190
  store %struct.DLL* %19, %struct.DLL** %24, align 8, !dbg !190
  %25 = load i32* %i, align 4, !dbg !192
  %26 = sext i32 %25 to i64, !dbg !192
  %27 = load %struct.DLL** %l, align 8, !dbg !192
  %28 = getelementptr inbounds %struct.DLL* %27, i64 %26, !dbg !192
  %29 = load i32* %j, align 4, !dbg !192
  %30 = sext i32 %29 to i64, !dbg !192
  %31 = load %struct.DLL** %l, align 8, !dbg !192
  %32 = getelementptr inbounds %struct.DLL* %31, i64 %30, !dbg !192
  %33 = getelementptr inbounds %struct.DLL* %32, i32 0, i32 2, !dbg !192
  store %struct.DLL* %28, %struct.DLL** %33, align 8, !dbg !192
  %34 = load %struct.DLL** %xp, align 8, !dbg !193
  %35 = getelementptr inbounds %struct.DLL* %34, i32 0, i32 0, !dbg !193
  %36 = load i32* %35, align 4, !dbg !193
  %37 = load i32* %i, align 4, !dbg !193
  %38 = sext i32 %37 to i64, !dbg !193
  %39 = load %struct.DLL** %l, align 8, !dbg !193
  %40 = getelementptr inbounds %struct.DLL* %39, i64 %38, !dbg !193
  %41 = getelementptr inbounds %struct.DLL* %40, i32 0, i32 0, !dbg !193
  store i32 %36, i32* %41, align 4, !dbg !193
  br label %42, !dbg !194

; <label>:42                                      ; preds = %15
  %43 = load i32* %i, align 4, !dbg !188
  %44 = add nsw i32 %43, 1, !dbg !188
  store i32 %44, i32* %i, align 4, !dbg !188
  %45 = load i32* %j, align 4, !dbg !188
  %46 = add nsw i32 %45, 1, !dbg !188
  store i32 %46, i32* %j, align 4, !dbg !188
  %47 = load %struct.DLL** %xp, align 8, !dbg !188
  %48 = getelementptr inbounds %struct.DLL* %47, i32 0, i32 1, !dbg !188
  %49 = load %struct.DLL** %48, align 8, !dbg !188
  store %struct.DLL* %49, %struct.DLL** %xp, align 8, !dbg !188
  br label %11, !dbg !188

; <label>:50                                      ; preds = %11
  %51 = load i32* %size, align 4, !dbg !195
  %52 = sext i32 %51 to i64, !dbg !195
  %53 = load %struct.DLL** %l, align 8, !dbg !195
  %54 = getelementptr inbounds %struct.DLL* %53, i64 %52, !dbg !195
  %55 = load %struct.DLL** %l, align 8, !dbg !195
  %56 = getelementptr inbounds %struct.DLL* %55, i64 0, !dbg !195
  %57 = getelementptr inbounds %struct.DLL* %56, i32 0, i32 2, !dbg !195
  store %struct.DLL* %54, %struct.DLL** %57, align 8, !dbg !195
  %58 = load %struct.DLL** %l, align 8, !dbg !196
  %59 = getelementptr inbounds %struct.DLL* %58, i64 0, !dbg !196
  %60 = load i32* %size, align 4, !dbg !196
  %61 = sext i32 %60 to i64, !dbg !196
  %62 = load %struct.DLL** %l, align 8, !dbg !196
  %63 = getelementptr inbounds %struct.DLL* %62, i64 %61, !dbg !196
  %64 = getelementptr inbounds %struct.DLL* %63, i32 0, i32 1, !dbg !196
  store %struct.DLL* %59, %struct.DLL** %64, align 8, !dbg !196
  %65 = load %struct.DLL** %1, align 8, !dbg !197
  %66 = call %struct.DLL* @list_last(%struct.DLL* %65), !dbg !197
  %67 = getelementptr inbounds %struct.DLL* %66, i32 0, i32 0, !dbg !197
  %68 = load i32* %67, align 4, !dbg !197
  %69 = load i32* %size, align 4, !dbg !197
  %70 = sext i32 %69 to i64, !dbg !197
  %71 = load %struct.DLL** %l, align 8, !dbg !197
  %72 = getelementptr inbounds %struct.DLL* %71, i64 %70, !dbg !197
  %73 = getelementptr inbounds %struct.DLL* %72, i32 0, i32 0, !dbg !197
  store i32 %68, i32* %73, align 4, !dbg !197
  %74 = load %struct.DLL** %l, align 8, !dbg !198
  ret %struct.DLL* %74, !dbg !198
}

; Function Attrs: nounwind uwtable
define internal %struct.DLL* @list_last(%struct.DLL* %head) #0 {
  %1 = alloca %struct.DLL*, align 8
  store %struct.DLL* %head, %struct.DLL** %1, align 8
  call void @llvm.dbg.declare(metadata !{%struct.DLL** %1}, metadata !199), !dbg !200
  %2 = load %struct.DLL** %1, align 8, !dbg !200
  %3 = getelementptr inbounds %struct.DLL* %2, i32 0, i32 2, !dbg !200
  %4 = load %struct.DLL** %3, align 8, !dbg !200
  ret %struct.DLL* %4, !dbg !200
}

; Function Attrs: nounwind uwtable
define void @list_reverse(%struct.DLL* %head) #0 {
  %1 = alloca %struct.DLL*, align 8
  %tmp = alloca %struct.DLL*, align 8
  %p = alloca %struct.DLL*, align 8
  store %struct.DLL* %head, %struct.DLL** %1, align 8
  call void @llvm.dbg.declare(metadata !{%struct.DLL** %1}, metadata !201), !dbg !202
  call void @llvm.dbg.declare(metadata !{%struct.DLL** %tmp}, metadata !203), !dbg !204
  call void @llvm.dbg.declare(metadata !{%struct.DLL** %p}, metadata !205), !dbg !204
  %2 = load %struct.DLL** %1, align 8, !dbg !204
  store %struct.DLL* %2, %struct.DLL** %p, align 8, !dbg !204
  br label %3, !dbg !206

; <label>:3                                       ; preds = %16, %0
  %4 = load %struct.DLL** %p, align 8, !dbg !207
  %5 = getelementptr inbounds %struct.DLL* %4, i32 0, i32 1, !dbg !207
  %6 = load %struct.DLL** %5, align 8, !dbg !207
  store %struct.DLL* %6, %struct.DLL** %tmp, align 8, !dbg !207
  %7 = load %struct.DLL** %p, align 8, !dbg !209
  %8 = getelementptr inbounds %struct.DLL* %7, i32 0, i32 2, !dbg !209
  %9 = load %struct.DLL** %8, align 8, !dbg !209
  %10 = load %struct.DLL** %p, align 8, !dbg !209
  %11 = getelementptr inbounds %struct.DLL* %10, i32 0, i32 1, !dbg !209
  store %struct.DLL* %9, %struct.DLL** %11, align 8, !dbg !209
  %12 = load %struct.DLL** %tmp, align 8, !dbg !210
  %13 = load %struct.DLL** %p, align 8, !dbg !210
  %14 = getelementptr inbounds %struct.DLL* %13, i32 0, i32 2, !dbg !210
  store %struct.DLL* %12, %struct.DLL** %14, align 8, !dbg !210
  %15 = load %struct.DLL** %tmp, align 8, !dbg !211
  store %struct.DLL* %15, %struct.DLL** %p, align 8, !dbg !211
  br label %16, !dbg !212

; <label>:16                                      ; preds = %3
  %17 = load %struct.DLL** %p, align 8, !dbg !212
  %18 = load %struct.DLL** %1, align 8, !dbg !212
  %19 = icmp ne %struct.DLL* %17, %18, !dbg !212
  br i1 %19, label %3, label %20, !dbg !212

; <label>:20                                      ; preds = %16
  ret void, !dbg !213
}

; Function Attrs: nounwind uwtable
define i32 @test_lists() #0 {
  %len = alloca i32, align 4
  %li1 = alloca %struct.DLL*, align 8
  %li2 = alloca %struct.DLL*, align 8
  %li3 = alloca %struct.DLL*, align 8
  call void @llvm.dbg.declare(metadata !{i32* %len}, metadata !214), !dbg !215
  store i32 0, i32* %len, align 4, !dbg !215
  call void @llvm.dbg.declare(metadata !{%struct.DLL** %li1}, metadata !216), !dbg !217
  %1 = call %struct.DLL* @list_sequence(i32 1, i32 100), !dbg !217
  store %struct.DLL* %1, %struct.DLL** %li1, align 8, !dbg !217
  call void @llvm.dbg.declare(metadata !{%struct.DLL** %li2}, metadata !218), !dbg !219
  %2 = load %struct.DLL** %li1, align 8, !dbg !219
  %3 = call %struct.DLL* @list_copy(%struct.DLL* %2), !dbg !219
  store %struct.DLL* %3, %struct.DLL** %li2, align 8, !dbg !219
  call void @llvm.dbg.declare(metadata !{%struct.DLL** %li3}, metadata !220), !dbg !221
  %4 = call %struct.DLL* @list_new(), !dbg !221
  store %struct.DLL* %4, %struct.DLL** %li3, align 8, !dbg !221
  %5 = load %struct.DLL** %li2, align 8, !dbg !222
  %6 = load %struct.DLL** %li1, align 8, !dbg !222
  %7 = call i32 @list_equal(%struct.DLL* %5, %struct.DLL* %6), !dbg !222
  %8 = icmp ne i32 %7, 0, !dbg !222
  br i1 %8, label %11, label %9, !dbg !222

; <label>:9                                       ; preds = %0
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str4, i32 0, i32 0)), !dbg !224
  call void @exit(i32 1) #7, !dbg !226
  unreachable, !dbg !226

; <label>:11                                      ; preds = %0
  br label %12, !dbg !227

; <label>:12                                      ; preds = %17, %11
  %13 = load %struct.DLL** %li2, align 8, !dbg !227
  %14 = call i32 @list_empty(%struct.DLL* %13), !dbg !227
  %15 = icmp ne i32 %14, 0, !dbg !227
  %16 = xor i1 %15, true, !dbg !227
  br i1 %16, label %17, label %21, !dbg !227

; <label>:17                                      ; preds = %12
  %18 = load %struct.DLL** %li3, align 8, !dbg !228
  %19 = load %struct.DLL** %li2, align 8, !dbg !228
  %20 = call %struct.DLL* @list_pop_head(%struct.DLL* %19), !dbg !228
  call void @list_push_tail(%struct.DLL* %18, %struct.DLL* %20), !dbg !228
  br label %12, !dbg !230

; <label>:21                                      ; preds = %12
  %22 = load %struct.DLL** %li2, align 8, !dbg !231
  %23 = call i32 @list_empty(%struct.DLL* %22), !dbg !231
  %24 = icmp ne i32 %23, 0, !dbg !231
  br i1 %24, label %27, label %25, !dbg !231

; <label>:25                                      ; preds = %21
  %26 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str5, i32 0, i32 0)), !dbg !233
  call void @exit(i32 1) #7, !dbg !235
  unreachable, !dbg !235

; <label>:27                                      ; preds = %21
  br label %28, !dbg !236

; <label>:28                                      ; preds = %33, %27
  %29 = load %struct.DLL** %li3, align 8, !dbg !236
  %30 = call i32 @list_empty(%struct.DLL* %29), !dbg !236
  %31 = icmp ne i32 %30, 0, !dbg !236
  %32 = xor i1 %31, true, !dbg !236
  br i1 %32, label %33, label %37, !dbg !236

; <label>:33                                      ; preds = %28
  %34 = load %struct.DLL** %li2, align 8, !dbg !237
  %35 = load %struct.DLL** %li3, align 8, !dbg !237
  %36 = call %struct.DLL* @list_pop_tail(%struct.DLL* %35), !dbg !237
  call void @list_push_tail(%struct.DLL* %34, %struct.DLL* %36), !dbg !237
  br label %28, !dbg !239

; <label>:37                                      ; preds = %28
  %38 = load %struct.DLL** %li3, align 8, !dbg !240
  %39 = call i32 @list_empty(%struct.DLL* %38), !dbg !240
  %40 = icmp ne i32 %39, 0, !dbg !240
  br i1 %40, label %43, label %41, !dbg !240

; <label>:41                                      ; preds = %37
  %42 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str6, i32 0, i32 0)), !dbg !242
  call void @exit(i32 1) #7, !dbg !244
  unreachable, !dbg !244

; <label>:43                                      ; preds = %37
  %44 = load %struct.DLL** %li1, align 8, !dbg !245
  call void @list_reverse(%struct.DLL* %44), !dbg !245
  %45 = load %struct.DLL** %li1, align 8, !dbg !246
  %46 = call %struct.DLL* @list_first(%struct.DLL* %45), !dbg !246
  %47 = getelementptr inbounds %struct.DLL* %46, i32 0, i32 0, !dbg !246
  %48 = load i32* %47, align 4, !dbg !246
  %49 = icmp ne i32 %48, 100, !dbg !246
  br i1 %49, label %50, label %56, !dbg !246

; <label>:50                                      ; preds = %43
  %51 = load %struct.DLL** %li1, align 8, !dbg !248
  %52 = call %struct.DLL* @list_first(%struct.DLL* %51), !dbg !248
  %53 = getelementptr inbounds %struct.DLL* %52, i32 0, i32 0, !dbg !248
  %54 = load i32* %53, align 4, !dbg !248
  %55 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([42 x i8]* @.str7, i32 0, i32 0), i32 100, i32 %54), !dbg !250
  call void @exit(i32 1) #7, !dbg !251
  unreachable, !dbg !251

; <label>:56                                      ; preds = %43
  %57 = load %struct.DLL** %li1, align 8, !dbg !252
  %58 = call %struct.DLL* @list_last(%struct.DLL* %57), !dbg !252
  %59 = getelementptr inbounds %struct.DLL* %58, i32 0, i32 0, !dbg !252
  %60 = load i32* %59, align 4, !dbg !252
  %61 = icmp ne i32 %60, 1, !dbg !252
  br i1 %61, label %62, label %68, !dbg !252

; <label>:62                                      ; preds = %56
  %63 = load %struct.DLL** %li1, align 8, !dbg !254
  %64 = call %struct.DLL* @list_last(%struct.DLL* %63), !dbg !254
  %65 = getelementptr inbounds %struct.DLL* %64, i32 0, i32 0, !dbg !254
  %66 = load i32* %65, align 4, !dbg !254
  %67 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str8, i32 0, i32 0), i32 100, i32 %66), !dbg !256
  call void @exit(i32 1) #7, !dbg !257
  unreachable, !dbg !257

; <label>:68                                      ; preds = %56
  %69 = load %struct.DLL** %li2, align 8, !dbg !258
  %70 = call %struct.DLL* @list_first(%struct.DLL* %69), !dbg !258
  %71 = getelementptr inbounds %struct.DLL* %70, i32 0, i32 0, !dbg !258
  %72 = load i32* %71, align 4, !dbg !258
  %73 = icmp ne i32 %72, 100, !dbg !258
  br i1 %73, label %74, label %80, !dbg !258

; <label>:74                                      ; preds = %68
  %75 = load %struct.DLL** %li2, align 8, !dbg !260
  %76 = call %struct.DLL* @list_first(%struct.DLL* %75), !dbg !260
  %77 = getelementptr inbounds %struct.DLL* %76, i32 0, i32 0, !dbg !260
  %78 = load i32* %77, align 4, !dbg !260
  %79 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([42 x i8]* @.str9, i32 0, i32 0), i32 100, i32 %78), !dbg !262
  call void @exit(i32 1) #7, !dbg !263
  unreachable, !dbg !263

; <label>:80                                      ; preds = %68
  %81 = load %struct.DLL** %li2, align 8, !dbg !264
  %82 = call %struct.DLL* @list_last(%struct.DLL* %81), !dbg !264
  %83 = getelementptr inbounds %struct.DLL* %82, i32 0, i32 0, !dbg !264
  %84 = load i32* %83, align 4, !dbg !264
  %85 = icmp ne i32 %84, 1, !dbg !264
  br i1 %85, label %86, label %92, !dbg !264

; <label>:86                                      ; preds = %80
  %87 = load %struct.DLL** %li2, align 8, !dbg !266
  %88 = call %struct.DLL* @list_last(%struct.DLL* %87), !dbg !266
  %89 = getelementptr inbounds %struct.DLL* %88, i32 0, i32 0, !dbg !266
  %90 = load i32* %89, align 4, !dbg !266
  %91 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str8, i32 0, i32 0), i32 100, i32 %90), !dbg !268
  call void @exit(i32 1) #7, !dbg !269
  unreachable, !dbg !269

; <label>:92                                      ; preds = %80
  %93 = load %struct.DLL** %li1, align 8, !dbg !270
  %94 = call i32 @list_length(%struct.DLL* %93), !dbg !270
  %95 = icmp ne i32 %94, 100, !dbg !270
  br i1 %95, label %96, label %100, !dbg !270

; <label>:96                                      ; preds = %92
  %97 = load %struct.DLL** %li1, align 8, !dbg !272
  %98 = call i32 @list_length(%struct.DLL* %97), !dbg !272
  %99 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([35 x i8]* @.str10, i32 0, i32 0), i32 100, i32 %98), !dbg !274
  call void @exit(i32 1) #7, !dbg !275
  unreachable, !dbg !275

; <label>:100                                     ; preds = %92
  %101 = load %struct.DLL** %li1, align 8, !dbg !276
  %102 = load %struct.DLL** %li2, align 8, !dbg !276
  %103 = call i32 @list_equal(%struct.DLL* %101, %struct.DLL* %102), !dbg !276
  %104 = icmp ne i32 %103, 0, !dbg !276
  br i1 %104, label %107, label %105, !dbg !276

; <label>:105                                     ; preds = %100
  %106 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str11, i32 0, i32 0)), !dbg !278
  call void @exit(i32 1) #7, !dbg !280
  unreachable, !dbg !280

; <label>:107                                     ; preds = %100
  %108 = load %struct.DLL** %li1, align 8, !dbg !281
  %109 = call i32 @list_length(%struct.DLL* %108), !dbg !281
  store i32 %109, i32* %len, align 4, !dbg !281
  %110 = load %struct.DLL** %li1, align 8, !dbg !282
  %111 = bitcast %struct.DLL* %110 to i8*, !dbg !282
  call void @free(i8* %111) #6, !dbg !282
  %112 = load %struct.DLL** %li2, align 8, !dbg !283
  %113 = bitcast %struct.DLL* %112 to i8*, !dbg !283
  call void @free(i8* %113) #6, !dbg !283
  %114 = load %struct.DLL** %li3, align 8, !dbg !284
  %115 = bitcast %struct.DLL* %114 to i8*, !dbg !284
  call void @free(i8* %115) #6, !dbg !284
  %116 = load i32* %len, align 4, !dbg !285
  ret i32 %116, !dbg !285
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #4

; Function Attrs: nounwind uwtable
define internal %struct.DLL* @list_first(%struct.DLL* %head) #0 {
  %1 = alloca %struct.DLL*, align 8
  store %struct.DLL* %head, %struct.DLL** %1, align 8
  call void @llvm.dbg.declare(metadata !{%struct.DLL** %1}, metadata !286), !dbg !287
  %2 = load %struct.DLL** %1, align 8, !dbg !287
  %3 = getelementptr inbounds %struct.DLL* %2, i32 0, i32 1, !dbg !287
  %4 = load %struct.DLL** %3, align 8, !dbg !287
  ret %struct.DLL* %4, !dbg !287
}

; Function Attrs: nounwind
declare void @free(i8*) #3

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %n = alloca i32, align 4
  %result = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !288), !dbg !289
  store i8** %argv, i8*** %3, align 8
  call void @llvm.dbg.declare(metadata !{i8*** %3}, metadata !290), !dbg !289
  call void @llvm.dbg.declare(metadata !{i32* %n}, metadata !291), !dbg !292
  %4 = load i32* %2, align 4, !dbg !292
  %5 = icmp eq i32 %4, 2, !dbg !292
  br i1 %5, label %6, label %11, !dbg !292

; <label>:6                                       ; preds = %0
  %7 = load i8*** %3, align 8, !dbg !292
  %8 = getelementptr inbounds i8** %7, i64 1, !dbg !292
  %9 = load i8** %8, align 8, !dbg !292
  %10 = call i32 @atoi(i8* %9) #8, !dbg !292
  br label %12, !dbg !292

; <label>:11                                      ; preds = %0
  br label %12, !dbg !292

; <label>:12                                      ; preds = %11, %6
  %13 = phi i32 [ %10, %6 ], [ 3000000, %11 ], !dbg !292
  store i32 %13, i32* %n, align 4, !dbg !292
  call void @llvm.dbg.declare(metadata !{i32* %result}, metadata !293), !dbg !294
  store i32 0, i32* %result, align 4, !dbg !294
  br label %14, !dbg !295

; <label>:14                                      ; preds = %18, %12
  %15 = load i32* %n, align 4, !dbg !295
  %16 = add nsw i32 %15, -1, !dbg !295
  store i32 %16, i32* %n, align 4, !dbg !295
  %17 = icmp ne i32 %15, 0, !dbg !295
  br i1 %17, label %18, label %20, !dbg !295

; <label>:18                                      ; preds = %14
  %19 = call i32 @test_lists(), !dbg !295
  store i32 %19, i32* %result, align 4, !dbg !295
  br label %14, !dbg !295

; <label>:20                                      ; preds = %14
  %21 = load i32* %result, align 4, !dbg !296
  %22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str12, i32 0, i32 0), i32 %21), !dbg !296
  ret i32 0, !dbg !297
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

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c] [DW_LANG_C99]
!1 = metadata !{metadata !"lists.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !17, metadata !20, metadata !21, metadata !22, metadata !25, metadata !30, metadata !33, metadata !36, metadata !37, metadata !40, metadata !43, metadata !47, metadata !48, metadata !49, metadata !52}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"list_push_tail", metadata !"list_push_tail", metadata !"", i32 26, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.DLL*, %struct.DLL*)* @list_push_tail, null, null, metadata !2, i32 26} ; [ DW_TAG_subprogram ] [line 26] [def] [list_push_tail]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{null, metadata !8, metadata !8}
!8 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !9} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from DLL]
!9 = metadata !{i32 786454, metadata !1, null, metadata !"DLL", i32 19, i64 0, i64 0, i64 0, i32 0, metadata !10} ; [ DW_TAG_typedef ] [DLL] [line 19, size 0, align 0, offset 0] [from DLL]
!10 = metadata !{i32 786451, metadata !1, null, metadata !"DLL", i32 15, i64 192, i64 64, i32 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [DLL] [line 15, size 192, align 64, offset 0] [def] [from ]
!11 = metadata !{metadata !12, metadata !14, metadata !16}
!12 = metadata !{i32 786445, metadata !1, metadata !10, metadata !"val", i32 16, i64 32, i64 32, i64 0, i32 0, metadata !13} ; [ DW_TAG_member ] [val] [line 16, size 32, align 32, offset 0] [from int]
!13 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!14 = metadata !{i32 786445, metadata !1, metadata !10, metadata !"next", i32 17, i64 64, i64 64, i64 64, i32 0, metadata !15} ; [ DW_TAG_member ] [next] [line 17, size 64, align 64, offset 64] [from ]
!15 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from DLL]
!16 = metadata !{i32 786445, metadata !1, metadata !10, metadata !"prev", i32 18, i64 64, i64 64, i64 128, i32 0, metadata !15} ; [ DW_TAG_member ] [prev] [line 18, size 64, align 64, offset 128] [from ]
!17 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"list_pop_tail", metadata !"list_pop_tail", metadata !"", i32 35, metadata !18, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, %struct.DLL* (%struct.DLL*)* @list_pop_tail, null, null, metadata !2, i32 35} ; [ DW_TAG_subprogram ] [line 35] [def] [list_pop_tail]
!18 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !19, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!19 = metadata !{metadata !8, metadata !8}
!20 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"list_push_head", metadata !"list_push_head", metadata !"", i32 46, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.DLL*, %struct.DLL*)* @list_push_head, null, null, metadata !2, i32 46} ; [ DW_TAG_subprogram ] [line 46] [def] [list_push_head]
!21 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"list_pop_head", metadata !"list_pop_head", metadata !"", i32 55, metadata !18, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, %struct.DLL* (%struct.DLL*)* @list_pop_head, null, null, metadata !2, i32 55} ; [ DW_TAG_subprogram ] [line 55] [def] [list_pop_head]
!22 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"list_equal", metadata !"list_equal", metadata !"", i32 65, metadata !23, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (%struct.DLL*, %struct.DLL*)* @list_equal, null, null, metadata !2, i32 65} ; [ DW_TAG_subprogram ] [line 65] [def] [list_equal]
!23 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !24, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!24 = metadata !{metadata !13, metadata !8, metadata !8}
!25 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"list_print", metadata !"list_print", metadata !"", i32 75, metadata !26, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i8*, %struct.DLL*)* @list_print, null, null, metadata !2, i32 75} ; [ DW_TAG_subprogram ] [line 75] [def] [list_print]
!26 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !27, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!27 = metadata !{null, metadata !28, metadata !8}
!28 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !29} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!29 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!30 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"list_new", metadata !"list_new", metadata !"", i32 88, metadata !31, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, %struct.DLL* ()* @list_new, null, null, metadata !2, i32 88} ; [ DW_TAG_subprogram ] [line 88] [def] [list_new]
!31 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !32, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!32 = metadata !{metadata !8}
!33 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"list_sequence", metadata !"list_sequence", metadata !"", i32 97, metadata !34, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, %struct.DLL* (i32, i32)* @list_sequence, null, null, metadata !2, i32 97} ; [ DW_TAG_subprogram ] [line 97] [def] [list_sequence]
!34 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !35, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!35 = metadata !{metadata !8, metadata !13, metadata !13}
!36 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"list_copy", metadata !"list_copy", metadata !"", i32 118, metadata !18, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, %struct.DLL* (%struct.DLL*)* @list_copy, null, null, metadata !2, i32 118} ; [ DW_TAG_subprogram ] [line 118] [def] [list_copy]
!37 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"list_reverse", metadata !"list_reverse", metadata !"", i32 132, metadata !38, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.DLL*)* @list_reverse, null, null, metadata !2, i32 132} ; [ DW_TAG_subprogram ] [line 132] [def] [list_reverse]
!38 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !39, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!39 = metadata !{null, metadata !8}
!40 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"test_lists", metadata !"test_lists", metadata !"", i32 142, metadata !41, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @test_lists, null, null, metadata !2, i32 142} ; [ DW_TAG_subprogram ] [line 142] [def] [test_lists]
!41 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !42, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!42 = metadata !{metadata !13}
!43 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 219, metadata !44, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main, null, null, metadata !2, i32 219} ; [ DW_TAG_subprogram ] [line 219] [def] [main]
!44 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !45, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!45 = metadata !{metadata !13, metadata !13, metadata !46}
!46 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !28} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!47 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"list_first", metadata !"list_first", metadata !"", i32 23, metadata !18, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, %struct.DLL* (%struct.DLL*)* @list_first, null, null, metadata !2, i32 23} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [list_first]
!48 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"list_last", metadata !"list_last", metadata !"", i32 24, metadata !18, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, %struct.DLL* (%struct.DLL*)* @list_last, null, null, metadata !2, i32 24} ; [ DW_TAG_subprogram ] [line 24] [local] [def] [list_last]
!49 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"list_length", metadata !"list_length", metadata !"", i32 21, metadata !50, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (%struct.DLL*)* @list_length, null, null, metadata !2, i32 21} ; [ DW_TAG_subprogram ] [line 21] [local] [def] [list_length]
!50 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !51, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!51 = metadata !{metadata !13, metadata !8}
!52 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"list_empty", metadata !"list_empty", metadata !"", i32 22, metadata !50, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (%struct.DLL*)* @list_empty, null, null, metadata !2, i32 22} ; [ DW_TAG_subprogram ] [line 22] [local] [def] [list_empty]
!53 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!54 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!55 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!56 = metadata !{i32 786689, metadata !4, metadata !"head", metadata !5, i32 16777242, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [head] [line 26]
!57 = metadata !{i32 26, i32 0, metadata !4, null}
!58 = metadata !{i32 786689, metadata !4, metadata !"item", metadata !5, i32 33554458, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [item] [line 26]
!59 = metadata !{i32 786688, metadata !4, metadata !"tail", metadata !5, i32 27, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tail] [line 27]
!60 = metadata !{i32 27, i32 0, metadata !4, null}
!61 = metadata !{i32 28, i32 0, metadata !4, null}
!62 = metadata !{i32 29, i32 0, metadata !4, null}
!63 = metadata !{i32 30, i32 0, metadata !4, null}
!64 = metadata !{i32 31, i32 0, metadata !4, null}
!65 = metadata !{i32 32, i32 0, metadata !4, null}
!66 = metadata !{i32 33, i32 0, metadata !4, null}
!67 = metadata !{i32 786689, metadata !17, metadata !"head", metadata !5, i32 16777251, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [head] [line 35]
!68 = metadata !{i32 35, i32 0, metadata !17, null}
!69 = metadata !{i32 786688, metadata !17, metadata !"prev", metadata !5, i32 36, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [prev] [line 36]
!70 = metadata !{i32 36, i32 0, metadata !17, null}
!71 = metadata !{i32 786688, metadata !17, metadata !"tail", metadata !5, i32 36, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tail] [line 36]
!72 = metadata !{i32 37, i32 0, metadata !73, null}
!73 = metadata !{i32 786443, metadata !1, metadata !17, i32 37, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!74 = metadata !{i32 38, i32 0, metadata !17, null}
!75 = metadata !{i32 39, i32 0, metadata !17, null}
!76 = metadata !{i32 40, i32 0, metadata !17, null}
!77 = metadata !{i32 41, i32 0, metadata !17, null}
!78 = metadata !{i32 42, i32 0, metadata !17, null}
!79 = metadata !{i32 43, i32 0, metadata !17, null}
!80 = metadata !{i32 44, i32 0, metadata !17, null}
!81 = metadata !{i32 786689, metadata !52, metadata !"head", metadata !5, i32 16777238, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [head] [line 22]
!82 = metadata !{i32 22, i32 0, metadata !52, null}
!83 = metadata !{i32 786689, metadata !20, metadata !"head", metadata !5, i32 16777262, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [head] [line 46]
!84 = metadata !{i32 46, i32 0, metadata !20, null}
!85 = metadata !{i32 786689, metadata !20, metadata !"item", metadata !5, i32 33554478, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [item] [line 46]
!86 = metadata !{i32 786688, metadata !20, metadata !"next", metadata !5, i32 47, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [next] [line 47]
!87 = metadata !{i32 47, i32 0, metadata !20, null}
!88 = metadata !{i32 48, i32 0, metadata !20, null}
!89 = metadata !{i32 49, i32 0, metadata !20, null}
!90 = metadata !{i32 50, i32 0, metadata !20, null}
!91 = metadata !{i32 51, i32 0, metadata !20, null}
!92 = metadata !{i32 52, i32 0, metadata !20, null}
!93 = metadata !{i32 53, i32 0, metadata !20, null}
!94 = metadata !{i32 786689, metadata !21, metadata !"head", metadata !5, i32 16777271, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [head] [line 55]
!95 = metadata !{i32 55, i32 0, metadata !21, null}
!96 = metadata !{i32 786688, metadata !21, metadata !"next", metadata !5, i32 56, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [next] [line 56]
!97 = metadata !{i32 56, i32 0, metadata !21, null}
!98 = metadata !{i32 57, i32 0, metadata !99, null}
!99 = metadata !{i32 786443, metadata !1, metadata !21, i32 57, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!100 = metadata !{i32 58, i32 0, metadata !21, null} ; [ DW_TAG_imported_module ]
!101 = metadata !{i32 59, i32 0, metadata !21, null}
!102 = metadata !{i32 60, i32 0, metadata !21, null}
!103 = metadata !{i32 61, i32 0, metadata !21, null}
!104 = metadata !{i32 62, i32 0, metadata !21, null}
!105 = metadata !{i32 63, i32 0, metadata !21, null}
!106 = metadata !{i32 786689, metadata !22, metadata !"x", metadata !5, i32 16777281, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 65]
!107 = metadata !{i32 65, i32 0, metadata !22, null}
!108 = metadata !{i32 786689, metadata !22, metadata !"y", metadata !5, i32 33554497, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [y] [line 65]
!109 = metadata !{i32 786688, metadata !22, metadata !"xp", metadata !5, i32 66, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [xp] [line 66]
!110 = metadata !{i32 66, i32 0, metadata !22, null}
!111 = metadata !{i32 786688, metadata !22, metadata !"yp", metadata !5, i32 66, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [yp] [line 66]
!112 = metadata !{i32 68, i32 0, metadata !113, null}
!113 = metadata !{i32 786443, metadata !1, metadata !22, i32 68, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!114 = metadata !{i32 69, i32 0, metadata !115, null}
!115 = metadata !{i32 786443, metadata !1, metadata !116, i32 69, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!116 = metadata !{i32 786443, metadata !1, metadata !113, i32 68, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!117 = metadata !{i32 70, i32 0, metadata !116, null}
!118 = metadata !{i32 71, i32 0, metadata !119, null}
!119 = metadata !{i32 786443, metadata !1, metadata !22, i32 71, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!120 = metadata !{i32 72, i32 0, metadata !22, null}
!121 = metadata !{i32 73, i32 0, metadata !22, null}
!122 = metadata !{i32 786689, metadata !25, metadata !"msg", metadata !5, i32 16777291, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [msg] [line 75]
!123 = metadata !{i32 75, i32 0, metadata !25, null}
!124 = metadata !{i32 786689, metadata !25, metadata !"x", metadata !5, i32 33554507, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 75]
!125 = metadata !{i32 786688, metadata !25, metadata !"xp", metadata !5, i32 76, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [xp] [line 76]
!126 = metadata !{i32 76, i32 0, metadata !25, null}
!127 = metadata !{i32 786688, metadata !25, metadata !"first", metadata !5, i32 76, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [first] [line 76]
!128 = metadata !{i32 786688, metadata !25, metadata !"i", metadata !5, i32 77, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 77]
!129 = metadata !{i32 77, i32 0, metadata !25, null}
!130 = metadata !{i32 78, i32 0, metadata !25, null}
!131 = metadata !{i32 79, i32 0, metadata !25, null}
!132 = metadata !{i32 80, i32 0, metadata !133, null}
!133 = metadata !{i32 786443, metadata !1, metadata !25, i32 80, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!134 = metadata !{i32 81, i32 0, metadata !135, null}
!135 = metadata !{i32 786443, metadata !1, metadata !133, i32 80, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!136 = metadata !{i32 83, i32 0, metadata !135, null}
!137 = metadata !{i32 84, i32 0, metadata !25, null}
!138 = metadata !{i32 85, i32 0, metadata !25, null}
!139 = metadata !{i32 86, i32 0, metadata !25, null}
!140 = metadata !{i32 786689, metadata !49, metadata !"head", metadata !5, i32 16777237, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [head] [line 21]
!141 = metadata !{i32 21, i32 0, metadata !49, null}
!142 = metadata !{i32 786688, metadata !30, metadata !"l", metadata !5, i32 89, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [l] [line 89]
!143 = metadata !{i32 89, i32 0, metadata !30, null}
!144 = metadata !{i32 90, i32 0, metadata !30, null}
!145 = metadata !{i32 91, i32 0, metadata !30, null}
!146 = metadata !{i32 92, i32 0, metadata !30, null}
!147 = metadata !{i32 93, i32 0, metadata !30, null}
!148 = metadata !{i32 786689, metadata !33, metadata !"from", metadata !5, i32 16777313, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [from] [line 97]
!149 = metadata !{i32 97, i32 0, metadata !33, null}
!150 = metadata !{i32 786689, metadata !33, metadata !"to", metadata !5, i32 33554529, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [to] [line 97]
!151 = metadata !{i32 786688, metadata !33, metadata !"size", metadata !5, i32 98, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [size] [line 98]
!152 = metadata !{i32 98, i32 0, metadata !33, null}
!153 = metadata !{i32 786688, metadata !33, metadata !"tmp", metadata !5, i32 98, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tmp] [line 98]
!154 = metadata !{i32 786688, metadata !33, metadata !"i", metadata !5, i32 98, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 98]
!155 = metadata !{i32 786688, metadata !33, metadata !"j", metadata !5, i32 98, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 98]
!156 = metadata !{i32 786688, metadata !33, metadata !"l", metadata !5, i32 99, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [l] [line 99]
!157 = metadata !{i32 99, i32 0, metadata !33, null}
!158 = metadata !{i32 100, i32 0, metadata !159, null}
!159 = metadata !{i32 786443, metadata !1, metadata !33, i32 100, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!160 = metadata !{i32 101, i32 0, metadata !161, null}
!161 = metadata !{i32 786443, metadata !1, metadata !159, i32 100, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!162 = metadata !{i32 102, i32 0, metadata !161, null}
!163 = metadata !{i32 103, i32 0, metadata !33, null}
!164 = metadata !{i32 104, i32 0, metadata !33, null}
!165 = metadata !{i32 105, i32 0, metadata !33, null}
!166 = metadata !{i32 106, i32 0, metadata !167, null}
!167 = metadata !{i32 786443, metadata !1, metadata !33, i32 106, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!168 = metadata !{i32 107, i32 0, metadata !169, null}
!169 = metadata !{i32 786443, metadata !1, metadata !167, i32 106, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!170 = metadata !{i32 108, i32 0, metadata !169, null}
!171 = metadata !{i32 109, i32 0, metadata !169, null}
!172 = metadata !{i32 110, i32 0, metadata !169, null}
!173 = metadata !{i32 111, i32 0, metadata !33, null}
!174 = metadata !{i32 112, i32 0, metadata !33, null}
!175 = metadata !{i32 113, i32 0, metadata !33, null}
!176 = metadata !{i32 114, i32 0, metadata !33, null}
!177 = metadata !{i32 115, i32 0, metadata !33, null}
!178 = metadata !{i32 116, i32 0, metadata !33, null}
!179 = metadata !{i32 786689, metadata !36, metadata !"x", metadata !5, i32 16777334, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 118]
!180 = metadata !{i32 118, i32 0, metadata !36, null}
!181 = metadata !{i32 786688, metadata !36, metadata !"i", metadata !5, i32 119, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 119]
!182 = metadata !{i32 119, i32 0, metadata !36, null}
!183 = metadata !{i32 786688, metadata !36, metadata !"j", metadata !5, i32 119, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 119]
!184 = metadata !{i32 786688, metadata !36, metadata !"size", metadata !5, i32 119, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [size] [line 119]
!185 = metadata !{i32 786688, metadata !36, metadata !"xp", metadata !5, i32 120, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [xp] [line 120]
!186 = metadata !{i32 120, i32 0, metadata !36, null}
!187 = metadata !{i32 786688, metadata !36, metadata !"l", metadata !5, i32 120, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [l] [line 120]
!188 = metadata !{i32 121, i32 0, metadata !189, null}
!189 = metadata !{i32 786443, metadata !1, metadata !36, i32 121, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!190 = metadata !{i32 122, i32 0, metadata !191, null}
!191 = metadata !{i32 786443, metadata !1, metadata !189, i32 121, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!192 = metadata !{i32 123, i32 0, metadata !191, null}
!193 = metadata !{i32 124, i32 0, metadata !191, null}
!194 = metadata !{i32 125, i32 0, metadata !191, null}
!195 = metadata !{i32 126, i32 0, metadata !36, null}
!196 = metadata !{i32 127, i32 0, metadata !36, null}
!197 = metadata !{i32 128, i32 0, metadata !36, null}
!198 = metadata !{i32 129, i32 0, metadata !36, null}
!199 = metadata !{i32 786689, metadata !48, metadata !"head", metadata !5, i32 16777240, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [head] [line 24]
!200 = metadata !{i32 24, i32 0, metadata !48, null}
!201 = metadata !{i32 786689, metadata !37, metadata !"head", metadata !5, i32 16777348, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [head] [line 132]
!202 = metadata !{i32 132, i32 0, metadata !37, null}
!203 = metadata !{i32 786688, metadata !37, metadata !"tmp", metadata !5, i32 133, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tmp] [line 133]
!204 = metadata !{i32 133, i32 0, metadata !37, null}
!205 = metadata !{i32 786688, metadata !37, metadata !"p", metadata !5, i32 133, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [p] [line 133]
!206 = metadata !{i32 134, i32 0, metadata !37, null}
!207 = metadata !{i32 135, i32 0, metadata !208, null}
!208 = metadata !{i32 786443, metadata !1, metadata !37, i32 134, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!209 = metadata !{i32 136, i32 0, metadata !208, null}
!210 = metadata !{i32 137, i32 0, metadata !208, null}
!211 = metadata !{i32 138, i32 0, metadata !208, null}
!212 = metadata !{i32 139, i32 0, metadata !208, null}
!213 = metadata !{i32 140, i32 0, metadata !37, null}
!214 = metadata !{i32 786688, metadata !40, metadata !"len", metadata !5, i32 143, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [len] [line 143]
!215 = metadata !{i32 143, i32 0, metadata !40, null}
!216 = metadata !{i32 786688, metadata !40, metadata !"li1", metadata !5, i32 145, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [li1] [line 145]
!217 = metadata !{i32 145, i32 0, metadata !40, null}
!218 = metadata !{i32 786688, metadata !40, metadata !"li2", metadata !5, i32 147, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [li2] [line 147]
!219 = metadata !{i32 147, i32 0, metadata !40, null}
!220 = metadata !{i32 786688, metadata !40, metadata !"li3", metadata !5, i32 150, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [li3] [line 150]
!221 = metadata !{i32 150, i32 0, metadata !40, null}
!222 = metadata !{i32 152, i32 0, metadata !223, null}
!223 = metadata !{i32 786443, metadata !1, metadata !40, i32 152, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!224 = metadata !{i32 153, i32 0, metadata !225, null}
!225 = metadata !{i32 786443, metadata !1, metadata !223, i32 152, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!226 = metadata !{i32 154, i32 0, metadata !225, null}
!227 = metadata !{i32 156, i32 0, metadata !40, null}
!228 = metadata !{i32 157, i32 0, metadata !229, null}
!229 = metadata !{i32 786443, metadata !1, metadata !40, i32 156, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!230 = metadata !{i32 158, i32 0, metadata !229, null}
!231 = metadata !{i32 160, i32 0, metadata !232, null}
!232 = metadata !{i32 786443, metadata !1, metadata !40, i32 160, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!233 = metadata !{i32 161, i32 0, metadata !234, null}
!234 = metadata !{i32 786443, metadata !1, metadata !232, i32 160, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!235 = metadata !{i32 162, i32 0, metadata !234, null}
!236 = metadata !{i32 166, i32 0, metadata !40, null}
!237 = metadata !{i32 167, i32 0, metadata !238, null}
!238 = metadata !{i32 786443, metadata !1, metadata !40, i32 166, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!239 = metadata !{i32 168, i32 0, metadata !238, null}
!240 = metadata !{i32 170, i32 0, metadata !241, null}
!241 = metadata !{i32 786443, metadata !1, metadata !40, i32 170, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!242 = metadata !{i32 171, i32 0, metadata !243, null}
!243 = metadata !{i32 786443, metadata !1, metadata !241, i32 170, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!244 = metadata !{i32 172, i32 0, metadata !243, null}
!245 = metadata !{i32 175, i32 0, metadata !40, null}
!246 = metadata !{i32 177, i32 0, metadata !247, null}
!247 = metadata !{i32 786443, metadata !1, metadata !40, i32 177, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!248 = metadata !{i32 179, i32 0, metadata !249, null}
!249 = metadata !{i32 786443, metadata !1, metadata !247, i32 177, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!250 = metadata !{i32 178, i32 0, metadata !249, null}
!251 = metadata !{i32 180, i32 0, metadata !249, null}
!252 = metadata !{i32 183, i32 0, metadata !253, null}
!253 = metadata !{i32 786443, metadata !1, metadata !40, i32 183, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!254 = metadata !{i32 185, i32 0, metadata !255, null}
!255 = metadata !{i32 786443, metadata !1, metadata !253, i32 183, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!256 = metadata !{i32 184, i32 0, metadata !255, null}
!257 = metadata !{i32 186, i32 0, metadata !255, null}
!258 = metadata !{i32 189, i32 0, metadata !259, null}
!259 = metadata !{i32 786443, metadata !1, metadata !40, i32 189, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!260 = metadata !{i32 191, i32 0, metadata !261, null}
!261 = metadata !{i32 786443, metadata !1, metadata !259, i32 189, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!262 = metadata !{i32 190, i32 0, metadata !261, null}
!263 = metadata !{i32 192, i32 0, metadata !261, null}
!264 = metadata !{i32 195, i32 0, metadata !265, null}
!265 = metadata !{i32 786443, metadata !1, metadata !40, i32 195, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!266 = metadata !{i32 197, i32 0, metadata !267, null}
!267 = metadata !{i32 786443, metadata !1, metadata !265, i32 195, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!268 = metadata !{i32 196, i32 0, metadata !267, null}
!269 = metadata !{i32 198, i32 0, metadata !267, null}
!270 = metadata !{i32 201, i32 0, metadata !271, null}
!271 = metadata !{i32 786443, metadata !1, metadata !40, i32 201, i32 0, i32 31} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!272 = metadata !{i32 203, i32 0, metadata !273, null}
!273 = metadata !{i32 786443, metadata !1, metadata !271, i32 201, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!274 = metadata !{i32 202, i32 0, metadata !273, null}
!275 = metadata !{i32 204, i32 0, metadata !273, null}
!276 = metadata !{i32 207, i32 0, metadata !277, null}
!277 = metadata !{i32 786443, metadata !1, metadata !40, i32 207, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!278 = metadata !{i32 208, i32 0, metadata !279, null}
!279 = metadata !{i32 786443, metadata !1, metadata !277, i32 207, i32 0, i32 34} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lists.c]
!280 = metadata !{i32 209, i32 0, metadata !279, null}
!281 = metadata !{i32 211, i32 0, metadata !40, null}
!282 = metadata !{i32 212, i32 0, metadata !40, null}
!283 = metadata !{i32 213, i32 0, metadata !40, null}
!284 = metadata !{i32 214, i32 0, metadata !40, null}
!285 = metadata !{i32 216, i32 0, metadata !40, null}
!286 = metadata !{i32 786689, metadata !47, metadata !"head", metadata !5, i32 16777239, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [head] [line 23]
!287 = metadata !{i32 23, i32 0, metadata !47, null}
!288 = metadata !{i32 786689, metadata !43, metadata !"argc", metadata !5, i32 16777435, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 219]
!289 = metadata !{i32 219, i32 0, metadata !43, null}
!290 = metadata !{i32 786689, metadata !43, metadata !"argv", metadata !5, i32 33554651, metadata !46, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 219]
!291 = metadata !{i32 786688, metadata !43, metadata !"n", metadata !5, i32 225, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 225]
!292 = metadata !{i32 225, i32 0, metadata !43, null}
!293 = metadata !{i32 786688, metadata !43, metadata !"result", metadata !5, i32 226, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [result] [line 226]
!294 = metadata !{i32 226, i32 0, metadata !43, null}
!295 = metadata !{i32 227, i32 0, metadata !43, null}
!296 = metadata !{i32 228, i32 0, metadata !43, null}
!297 = metadata !{i32 229, i32 0, metadata !43, null}
