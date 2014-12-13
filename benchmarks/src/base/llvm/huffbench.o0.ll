; ModuleID = 'huffbench.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [33 x i8] c"ABCDEFGHIJKLMNOPQRSTUVWXYZ012345\00", align 1
@stderr = external global %struct._IO_FILE*
@.str1 = private unnamed_addr constant [26 x i8] c"error: bit code overflow\0A\00", align 1
@.str2 = private unnamed_addr constant [33 x i8] c"error: file has only one value!\0A\00", align 1
@.str3 = private unnamed_addr constant [23 x i8] c"error: no compression\0A\00", align 1
@.str4 = private unnamed_addr constant [4 x i8] c"-ga\00", align 1
@stdout = external global %struct._IO_FILE*
@.str5 = private unnamed_addr constant [3 x i8] c"%f\00", align 1
@.str6 = private unnamed_addr constant [35 x i8] c"\0Ahuffbench (Std. C) run time: %f\0A\0A\00", align 1
@seed = internal global i64 1325, align 8

; Function Attrs: nounwind uwtable
define i8* @generate_test_data(i64 %n) #0 {
  %1 = alloca i64, align 8
  %codes = alloca i8*, align 8
  %result = alloca i8*, align 8
  %ptr = alloca i8*, align 8
  %i = alloca i32, align 4
  store i64 %n, i64* %1, align 8
  call void @llvm.dbg.declare(metadata !{i64* %1}, metadata !46), !dbg !47
  call void @llvm.dbg.declare(metadata !{i8** %codes}, metadata !48), !dbg !49
  store i8* getelementptr inbounds ([33 x i8]* @.str, i32 0, i32 0), i8** %codes, align 8, !dbg !49
  call void @llvm.dbg.declare(metadata !{i8** %result}, metadata !50), !dbg !51
  %2 = load i64* %1, align 8, !dbg !51
  %3 = call noalias i8* @malloc(i64 %2) #3, !dbg !51
  store i8* %3, i8** %result, align 8, !dbg !51
  call void @llvm.dbg.declare(metadata !{i8** %ptr}, metadata !52), !dbg !53
  %4 = load i8** %result, align 8, !dbg !53
  store i8* %4, i8** %ptr, align 8, !dbg !53
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !54), !dbg !55
  store i32 0, i32* %i, align 4, !dbg !56
  br label %5, !dbg !56

; <label>:5                                       ; preds = %18, %0
  %6 = load i32* %i, align 4, !dbg !56
  %7 = sext i32 %6 to i64, !dbg !56
  %8 = load i64* %1, align 8, !dbg !56
  %9 = icmp ult i64 %7, %8, !dbg !56
  br i1 %9, label %10, label %21, !dbg !56

; <label>:10                                      ; preds = %5
  %11 = call i64 @random4(), !dbg !58
  %12 = load i8** %codes, align 8, !dbg !58
  %13 = getelementptr inbounds i8* %12, i64 %11, !dbg !58
  %14 = load i8* %13, align 1, !dbg !58
  %15 = load i8** %ptr, align 8, !dbg !58
  store i8 %14, i8* %15, align 1, !dbg !58
  %16 = load i8** %ptr, align 8, !dbg !60
  %17 = getelementptr inbounds i8* %16, i32 1, !dbg !60
  store i8* %17, i8** %ptr, align 8, !dbg !60
  br label %18, !dbg !61

; <label>:18                                      ; preds = %10
  %19 = load i32* %i, align 4, !dbg !56
  %20 = add nsw i32 %19, 1, !dbg !56
  store i32 %20, i32* %i, align 4, !dbg !56
  br label %5, !dbg !56

; <label>:21                                      ; preds = %5
  %22 = load i8** %result, align 8, !dbg !62
  ret i8* %22, !dbg !62
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind uwtable
define void @compdecomp(i8* %data, i64 %data_len) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i64, align 8
  %i = alloca i64, align 8
  %j = alloca i64, align 8
  %n = alloca i64, align 8
  %mask = alloca i64, align 8
  %k = alloca i64, align 8
  %t = alloca i64, align 8
  %c = alloca i8, align 1
  %cptr = alloca i8*, align 8
  %dptr = alloca i8*, align 8
  %comp = alloca i8*, align 8
  %freq = alloca [512 x i64], align 16
  %heap = alloca [256 x i64], align 16
  %link = alloca [512 x i32], align 16
  %code = alloca [256 x i64], align 16
  %clen = alloca [256 x i8], align 16
  %temp = alloca i64, align 8
  %m = alloca i64, align 8
  %x = alloca i64, align 8
  %maxx = alloca i64, align 8
  %maxi = alloca i64, align 8
  %l = alloca i32, align 4
  %comp_len = alloca i64, align 8
  %bout = alloca i8, align 1
  %bit = alloca i32, align 4
  %heap2 = alloca [256 x i64], align 16
  %outc = alloca [256 x i8], align 16
  %optr = alloca i8*, align 8
  store i8* %data, i8** %1, align 8
  call void @llvm.dbg.declare(metadata !{i8** %1}, metadata !63), !dbg !64
  store i64 %data_len, i64* %2, align 8
  call void @llvm.dbg.declare(metadata !{i64* %2}, metadata !65), !dbg !64
  call void @llvm.dbg.declare(metadata !{i64* %i}, metadata !66), !dbg !67
  call void @llvm.dbg.declare(metadata !{i64* %j}, metadata !68), !dbg !67
  call void @llvm.dbg.declare(metadata !{i64* %n}, metadata !69), !dbg !67
  call void @llvm.dbg.declare(metadata !{i64* %mask}, metadata !70), !dbg !67
  call void @llvm.dbg.declare(metadata !{i64* %k}, metadata !71), !dbg !73
  call void @llvm.dbg.declare(metadata !{i64* %t}, metadata !74), !dbg !73
  call void @llvm.dbg.declare(metadata !{i8* %c}, metadata !75), !dbg !76
  call void @llvm.dbg.declare(metadata !{i8** %cptr}, metadata !77), !dbg !78
  call void @llvm.dbg.declare(metadata !{i8** %dptr}, metadata !79), !dbg !80
  %3 = load i8** %1, align 8, !dbg !80
  store i8* %3, i8** %dptr, align 8, !dbg !80
  call void @llvm.dbg.declare(metadata !{i8** %comp}, metadata !81), !dbg !82
  %4 = load i64* %2, align 8, !dbg !82
  %5 = add i64 %4, 1, !dbg !82
  %6 = call noalias i8* @malloc(i64 %5) #3, !dbg !82
  store i8* %6, i8** %comp, align 8, !dbg !82
  call void @llvm.dbg.declare(metadata !{[512 x i64]* %freq}, metadata !83), !dbg !87
  call void @llvm.dbg.declare(metadata !{[256 x i64]* %heap}, metadata !88), !dbg !92
  call void @llvm.dbg.declare(metadata !{[512 x i32]* %link}, metadata !93), !dbg !95
  call void @llvm.dbg.declare(metadata !{[256 x i64]* %code}, metadata !96), !dbg !98
  call void @llvm.dbg.declare(metadata !{[256 x i8]* %clen}, metadata !99), !dbg !101
  %7 = load i8** %comp, align 8, !dbg !102
  %8 = load i64* %2, align 8, !dbg !102
  %9 = add i64 %8, 1, !dbg !102
  %10 = mul i64 1, %9, !dbg !102
  call void @llvm.memset.p0i8.i64(i8* %7, i8 0, i64 %10, i32 1, i1 false), !dbg !102
  %11 = bitcast [512 x i64]* %freq to i8*, !dbg !103
  call void @llvm.memset.p0i8.i64(i8* %11, i8 0, i64 4096, i32 16, i1 false), !dbg !103
  %12 = bitcast [256 x i64]* %heap to i8*, !dbg !104
  call void @llvm.memset.p0i8.i64(i8* %12, i8 0, i64 2048, i32 16, i1 false), !dbg !104
  %13 = bitcast [512 x i32]* %link to i8*, !dbg !105
  call void @llvm.memset.p0i8.i64(i8* %13, i8 0, i64 2048, i32 16, i1 false), !dbg !105
  %14 = bitcast [256 x i64]* %code to i8*, !dbg !106
  call void @llvm.memset.p0i8.i64(i8* %14, i8 0, i64 2048, i32 16, i1 false), !dbg !106
  %15 = bitcast [256 x i8]* %clen to i8*, !dbg !107
  call void @llvm.memset.p0i8.i64(i8* %15, i8 0, i64 256, i32 16, i1 false), !dbg !107
  store i64 0, i64* %i, align 8, !dbg !108
  br label %16, !dbg !108

; <label>:16                                      ; preds = %29, %0
  %17 = load i64* %i, align 8, !dbg !108
  %18 = load i64* %2, align 8, !dbg !108
  %19 = icmp ult i64 %17, %18, !dbg !108
  br i1 %19, label %20, label %32, !dbg !108

; <label>:20                                      ; preds = %16
  %21 = load i8** %dptr, align 8, !dbg !110
  %22 = load i8* %21, align 1, !dbg !110
  %23 = zext i8 %22 to i64, !dbg !110
  %24 = getelementptr inbounds [512 x i64]* %freq, i32 0, i64 %23, !dbg !110
  %25 = load i64* %24, align 8, !dbg !110
  %26 = add i64 %25, 1, !dbg !110
  store i64 %26, i64* %24, align 8, !dbg !110
  %27 = load i8** %dptr, align 8, !dbg !112
  %28 = getelementptr inbounds i8* %27, i32 1, !dbg !112
  store i8* %28, i8** %dptr, align 8, !dbg !112
  br label %29, !dbg !113

; <label>:29                                      ; preds = %20
  %30 = load i64* %i, align 8, !dbg !108
  %31 = add i64 %30, 1, !dbg !108
  store i64 %31, i64* %i, align 8, !dbg !108
  br label %16, !dbg !108

; <label>:32                                      ; preds = %16
  store i64 0, i64* %n, align 8, !dbg !114
  store i64 0, i64* %i, align 8, !dbg !115
  br label %33, !dbg !115

; <label>:33                                      ; preds = %48, %32
  %34 = load i64* %i, align 8, !dbg !115
  %35 = icmp ult i64 %34, 256, !dbg !115
  br i1 %35, label %36, label %51, !dbg !115

; <label>:36                                      ; preds = %33
  %37 = load i64* %i, align 8, !dbg !117
  %38 = getelementptr inbounds [512 x i64]* %freq, i32 0, i64 %37, !dbg !117
  %39 = load i64* %38, align 8, !dbg !117
  %40 = icmp ne i64 %39, 0, !dbg !117
  br i1 %40, label %41, label %47, !dbg !117

; <label>:41                                      ; preds = %36
  %42 = load i64* %i, align 8, !dbg !120
  %43 = load i64* %n, align 8, !dbg !120
  %44 = getelementptr inbounds [256 x i64]* %heap, i32 0, i64 %43, !dbg !120
  store i64 %42, i64* %44, align 8, !dbg !120
  %45 = load i64* %n, align 8, !dbg !122
  %46 = add i64 %45, 1, !dbg !122
  store i64 %46, i64* %n, align 8, !dbg !122
  br label %47, !dbg !123

; <label>:47                                      ; preds = %41, %36
  br label %48, !dbg !124

; <label>:48                                      ; preds = %47
  %49 = load i64* %i, align 8, !dbg !115
  %50 = add i64 %49, 1, !dbg !115
  store i64 %50, i64* %i, align 8, !dbg !115
  br label %33, !dbg !115

; <label>:51                                      ; preds = %33
  %52 = load i64* %n, align 8, !dbg !125
  store i64 %52, i64* %i, align 8, !dbg !125
  br label %53, !dbg !125

; <label>:53                                      ; preds = %63, %51
  %54 = load i64* %i, align 8, !dbg !125
  %55 = icmp ugt i64 %54, 0, !dbg !125
  br i1 %55, label %56, label %66, !dbg !125

; <label>:56                                      ; preds = %53
  %57 = getelementptr inbounds [512 x i64]* %freq, i32 0, i32 0, !dbg !127
  %58 = getelementptr inbounds [256 x i64]* %heap, i32 0, i32 0, !dbg !127
  %59 = load i64* %n, align 8, !dbg !127
  %60 = trunc i64 %59 to i32, !dbg !127
  %61 = load i64* %i, align 8, !dbg !127
  %62 = trunc i64 %61 to i32, !dbg !127
  call void @heap_adjust(i64* %57, i64* %58, i32 %60, i32 %62), !dbg !127
  br label %63, !dbg !127

; <label>:63                                      ; preds = %56
  %64 = load i64* %i, align 8, !dbg !125
  %65 = add i64 %64, -1, !dbg !125
  store i64 %65, i64* %i, align 8, !dbg !125
  br label %53, !dbg !125

; <label>:66                                      ; preds = %53
  call void @llvm.dbg.declare(metadata !{i64* %temp}, metadata !128), !dbg !129
  br label %67, !dbg !130

; <label>:67                                      ; preds = %70, %66
  %68 = load i64* %n, align 8, !dbg !130
  %69 = icmp ugt i64 %68, 1, !dbg !130
  br i1 %69, label %70, label %112, !dbg !130

; <label>:70                                      ; preds = %67
  %71 = load i64* %n, align 8, !dbg !131
  %72 = add i64 %71, -1, !dbg !131
  store i64 %72, i64* %n, align 8, !dbg !131
  %73 = getelementptr inbounds [256 x i64]* %heap, i32 0, i64 0, !dbg !133
  %74 = load i64* %73, align 8, !dbg !133
  store i64 %74, i64* %temp, align 8, !dbg !133
  %75 = load i64* %n, align 8, !dbg !134
  %76 = getelementptr inbounds [256 x i64]* %heap, i32 0, i64 %75, !dbg !134
  %77 = load i64* %76, align 8, !dbg !134
  %78 = getelementptr inbounds [256 x i64]* %heap, i32 0, i64 0, !dbg !134
  store i64 %77, i64* %78, align 8, !dbg !134
  %79 = getelementptr inbounds [512 x i64]* %freq, i32 0, i32 0, !dbg !135
  %80 = getelementptr inbounds [256 x i64]* %heap, i32 0, i32 0, !dbg !135
  %81 = load i64* %n, align 8, !dbg !135
  %82 = trunc i64 %81 to i32, !dbg !135
  call void @heap_adjust(i64* %79, i64* %80, i32 %82, i32 1), !dbg !135
  %83 = getelementptr inbounds [256 x i64]* %heap, i32 0, i64 0, !dbg !136
  %84 = load i64* %83, align 8, !dbg !136
  %85 = getelementptr inbounds [512 x i64]* %freq, i32 0, i64 %84, !dbg !136
  %86 = load i64* %85, align 8, !dbg !136
  %87 = load i64* %temp, align 8, !dbg !136
  %88 = getelementptr inbounds [512 x i64]* %freq, i32 0, i64 %87, !dbg !136
  %89 = load i64* %88, align 8, !dbg !136
  %90 = add i64 %86, %89, !dbg !136
  %91 = load i64* %n, align 8, !dbg !136
  %92 = add i64 256, %91, !dbg !136
  %93 = getelementptr inbounds [512 x i64]* %freq, i32 0, i64 %92, !dbg !136
  store i64 %90, i64* %93, align 8, !dbg !136
  %94 = load i64* %n, align 8, !dbg !137
  %95 = add i64 256, %94, !dbg !137
  %96 = trunc i64 %95 to i32, !dbg !137
  %97 = load i64* %temp, align 8, !dbg !137
  %98 = getelementptr inbounds [512 x i32]* %link, i32 0, i64 %97, !dbg !137
  store i32 %96, i32* %98, align 4, !dbg !137
  %99 = load i64* %n, align 8, !dbg !138
  %100 = sub i64 -256, %99, !dbg !138
  %101 = trunc i64 %100 to i32, !dbg !138
  %102 = getelementptr inbounds [256 x i64]* %heap, i32 0, i64 0, !dbg !138
  %103 = load i64* %102, align 8, !dbg !138
  %104 = getelementptr inbounds [512 x i32]* %link, i32 0, i64 %103, !dbg !138
  store i32 %101, i32* %104, align 4, !dbg !138
  %105 = load i64* %n, align 8, !dbg !139
  %106 = add i64 256, %105, !dbg !139
  %107 = getelementptr inbounds [256 x i64]* %heap, i32 0, i64 0, !dbg !139
  store i64 %106, i64* %107, align 8, !dbg !139
  %108 = getelementptr inbounds [512 x i64]* %freq, i32 0, i32 0, !dbg !140
  %109 = getelementptr inbounds [256 x i64]* %heap, i32 0, i32 0, !dbg !140
  %110 = load i64* %n, align 8, !dbg !140
  %111 = trunc i64 %110 to i32, !dbg !140
  call void @heap_adjust(i64* %108, i64* %109, i32 %111, i32 1), !dbg !140
  br label %67, !dbg !141

; <label>:112                                     ; preds = %67
  %113 = load i64* %n, align 8, !dbg !142
  %114 = add i64 256, %113, !dbg !142
  %115 = getelementptr inbounds [512 x i32]* %link, i32 0, i64 %114, !dbg !142
  store i32 0, i32* %115, align 4, !dbg !142
  call void @llvm.dbg.declare(metadata !{i64* %m}, metadata !143), !dbg !144
  call void @llvm.dbg.declare(metadata !{i64* %x}, metadata !145), !dbg !144
  call void @llvm.dbg.declare(metadata !{i64* %maxx}, metadata !146), !dbg !144
  store i64 0, i64* %maxx, align 8, !dbg !144
  call void @llvm.dbg.declare(metadata !{i64* %maxi}, metadata !147), !dbg !144
  store i64 0, i64* %maxi, align 8, !dbg !144
  call void @llvm.dbg.declare(metadata !{i32* %l}, metadata !148), !dbg !149
  store i64 0, i64* %m, align 8, !dbg !150
  br label %116, !dbg !150

; <label>:116                                     ; preds = %175, %112
  %117 = load i64* %m, align 8, !dbg !150
  %118 = icmp ult i64 %117, 256, !dbg !150
  br i1 %118, label %119, label %178, !dbg !150

; <label>:119                                     ; preds = %116
  %120 = load i64* %m, align 8, !dbg !152
  %121 = getelementptr inbounds [512 x i64]* %freq, i32 0, i64 %120, !dbg !152
  %122 = load i64* %121, align 8, !dbg !152
  %123 = icmp ne i64 %122, 0, !dbg !152
  br i1 %123, label %129, label %124, !dbg !152

; <label>:124                                     ; preds = %119
  %125 = load i64* %m, align 8, !dbg !155
  %126 = getelementptr inbounds [256 x i64]* %code, i32 0, i64 %125, !dbg !155
  store i64 0, i64* %126, align 8, !dbg !155
  %127 = load i64* %m, align 8, !dbg !157
  %128 = getelementptr inbounds [256 x i8]* %clen, i32 0, i64 %127, !dbg !157
  store i8 0, i8* %128, align 1, !dbg !157
  br label %174, !dbg !158

; <label>:129                                     ; preds = %119
  store i64 0, i64* %i, align 8, !dbg !159
  store i64 1, i64* %j, align 8, !dbg !161
  store i64 0, i64* %x, align 8, !dbg !162
  %130 = load i64* %m, align 8, !dbg !163
  %131 = getelementptr inbounds [512 x i32]* %link, i32 0, i64 %130, !dbg !163
  %132 = load i32* %131, align 4, !dbg !163
  store i32 %132, i32* %l, align 4, !dbg !163
  br label %133, !dbg !164

; <label>:133                                     ; preds = %145, %129
  %134 = load i32* %l, align 4, !dbg !164
  %135 = icmp ne i32 %134, 0, !dbg !164
  br i1 %135, label %136, label %154, !dbg !164

; <label>:136                                     ; preds = %133
  %137 = load i32* %l, align 4, !dbg !165
  %138 = icmp slt i32 %137, 0, !dbg !165
  br i1 %138, label %139, label %145, !dbg !165

; <label>:139                                     ; preds = %136
  %140 = load i64* %j, align 8, !dbg !168
  %141 = load i64* %x, align 8, !dbg !168
  %142 = add i64 %141, %140, !dbg !168
  store i64 %142, i64* %x, align 8, !dbg !168
  %143 = load i32* %l, align 4, !dbg !170
  %144 = sub nsw i32 0, %143, !dbg !170
  store i32 %144, i32* %l, align 4, !dbg !170
  br label %145, !dbg !171

; <label>:145                                     ; preds = %139, %136
  %146 = load i32* %l, align 4, !dbg !172
  %147 = sext i32 %146 to i64, !dbg !172
  %148 = getelementptr inbounds [512 x i32]* %link, i32 0, i64 %147, !dbg !172
  %149 = load i32* %148, align 4, !dbg !172
  store i32 %149, i32* %l, align 4, !dbg !172
  %150 = load i64* %j, align 8, !dbg !173
  %151 = shl i64 %150, 1, !dbg !173
  store i64 %151, i64* %j, align 8, !dbg !173
  %152 = load i64* %i, align 8, !dbg !174
  %153 = add i64 %152, 1, !dbg !174
  store i64 %153, i64* %i, align 8, !dbg !174
  br label %133, !dbg !175

; <label>:154                                     ; preds = %133
  %155 = load i64* %x, align 8, !dbg !176
  %156 = load i64* %m, align 8, !dbg !176
  %157 = getelementptr inbounds [256 x i64]* %code, i32 0, i64 %156, !dbg !176
  store i64 %155, i64* %157, align 8, !dbg !176
  %158 = load i64* %i, align 8, !dbg !177
  %159 = trunc i64 %158 to i8, !dbg !177
  %160 = load i64* %m, align 8, !dbg !177
  %161 = getelementptr inbounds [256 x i8]* %clen, i32 0, i64 %160, !dbg !177
  store i8 %159, i8* %161, align 1, !dbg !177
  %162 = load i64* %x, align 8, !dbg !178
  %163 = load i64* %maxx, align 8, !dbg !178
  %164 = icmp ugt i64 %162, %163, !dbg !178
  br i1 %164, label %165, label %167, !dbg !178

; <label>:165                                     ; preds = %154
  %166 = load i64* %x, align 8, !dbg !180
  store i64 %166, i64* %maxx, align 8, !dbg !180
  br label %167, !dbg !180

; <label>:167                                     ; preds = %165, %154
  %168 = load i64* %i, align 8, !dbg !181
  %169 = load i64* %maxi, align 8, !dbg !181
  %170 = icmp ugt i64 %168, %169, !dbg !181
  br i1 %170, label %171, label %173, !dbg !181

; <label>:171                                     ; preds = %167
  %172 = load i64* %i, align 8, !dbg !183
  store i64 %172, i64* %maxi, align 8, !dbg !183
  br label %173, !dbg !183

; <label>:173                                     ; preds = %171, %167
  br label %174

; <label>:174                                     ; preds = %173, %124
  br label %175, !dbg !184

; <label>:175                                     ; preds = %174
  %176 = load i64* %m, align 8, !dbg !150
  %177 = add i64 %176, 1, !dbg !150
  store i64 %177, i64* %m, align 8, !dbg !150
  br label %116, !dbg !150

; <label>:178                                     ; preds = %116
  %179 = load i64* %maxi, align 8, !dbg !185
  %180 = icmp ugt i64 %179, 64, !dbg !185
  br i1 %180, label %181, label %184, !dbg !185

; <label>:181                                     ; preds = %178
  %182 = load %struct._IO_FILE** @stderr, align 8, !dbg !187
  %183 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %182, i8* getelementptr inbounds ([26 x i8]* @.str1, i32 0, i32 0)), !dbg !187
  call void @exit(i32 1) #7, !dbg !189
  unreachable, !dbg !189

; <label>:184                                     ; preds = %178
  call void @llvm.dbg.declare(metadata !{i64* %comp_len}, metadata !190), !dbg !191
  store i64 0, i64* %comp_len, align 8, !dbg !191
  call void @llvm.dbg.declare(metadata !{i8* %bout}, metadata !192), !dbg !193
  store i8 0, i8* %bout, align 1, !dbg !193
  call void @llvm.dbg.declare(metadata !{i32* %bit}, metadata !194), !dbg !195
  store i32 -1, i32* %bit, align 4, !dbg !195
  %185 = load i8** %1, align 8, !dbg !196
  store i8* %185, i8** %dptr, align 8, !dbg !196
  %186 = load i64* %maxx, align 8, !dbg !197
  %187 = icmp eq i64 %186, 0, !dbg !197
  br i1 %187, label %188, label %191, !dbg !197

; <label>:188                                     ; preds = %184
  %189 = load %struct._IO_FILE** @stderr, align 8, !dbg !199
  %190 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %189, i8* getelementptr inbounds ([33 x i8]* @.str2, i32 0, i32 0)), !dbg !199
  call void @exit(i32 1) #7, !dbg !201
  unreachable, !dbg !201

; <label>:191                                     ; preds = %184
  store i64 0, i64* %j, align 8, !dbg !202
  br label %192, !dbg !202

; <label>:192                                     ; preds = %262, %191
  %193 = load i64* %j, align 8, !dbg !202
  %194 = load i64* %2, align 8, !dbg !202
  %195 = icmp ult i64 %193, %194, !dbg !202
  br i1 %195, label %196, label %265, !dbg !202

; <label>:196                                     ; preds = %192
  %197 = load i8** %dptr, align 8, !dbg !204
  %198 = load i8* %197, align 1, !dbg !204
  %199 = zext i8 %198 to i64, !dbg !204
  %200 = getelementptr inbounds [256 x i8]* %clen, i32 0, i64 %199, !dbg !204
  %201 = load i8* %200, align 1, !dbg !204
  %202 = zext i8 %201 to i32, !dbg !204
  %203 = sub nsw i32 %202, 1, !dbg !204
  %204 = shl i32 1, %203, !dbg !204
  %205 = sext i32 %204 to i64, !dbg !204
  store i64 %205, i64* %mask, align 8, !dbg !204
  store i64 0, i64* %i, align 8, !dbg !206
  br label %206, !dbg !206

; <label>:206                                     ; preds = %256, %196
  %207 = load i64* %i, align 8, !dbg !206
  %208 = load i8** %dptr, align 8, !dbg !206
  %209 = load i8* %208, align 1, !dbg !206
  %210 = zext i8 %209 to i64, !dbg !206
  %211 = getelementptr inbounds [256 x i8]* %clen, i32 0, i64 %210, !dbg !206
  %212 = load i8* %211, align 1, !dbg !206
  %213 = zext i8 %212 to i64, !dbg !206
  %214 = icmp ult i64 %207, %213, !dbg !206
  br i1 %214, label %215, label %259, !dbg !206

; <label>:215                                     ; preds = %206
  %216 = load i32* %bit, align 4, !dbg !208
  %217 = icmp eq i32 %216, 7, !dbg !208
  br i1 %217, label %218, label %232, !dbg !208

; <label>:218                                     ; preds = %215
  %219 = load i8* %bout, align 1, !dbg !211
  %220 = load i64* %comp_len, align 8, !dbg !211
  %221 = load i8** %comp, align 8, !dbg !211
  %222 = getelementptr inbounds i8* %221, i64 %220, !dbg !211
  store i8 %219, i8* %222, align 1, !dbg !211
  %223 = load i64* %comp_len, align 8, !dbg !213
  %224 = add i64 %223, 1, !dbg !213
  store i64 %224, i64* %comp_len, align 8, !dbg !213
  %225 = load i64* %comp_len, align 8, !dbg !214
  %226 = load i64* %2, align 8, !dbg !214
  %227 = icmp eq i64 %225, %226, !dbg !214
  br i1 %227, label %228, label %231, !dbg !214

; <label>:228                                     ; preds = %218
  %229 = load %struct._IO_FILE** @stderr, align 8, !dbg !216
  %230 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %229, i8* getelementptr inbounds ([23 x i8]* @.str3, i32 0, i32 0)), !dbg !216
  call void @exit(i32 1) #7, !dbg !218
  unreachable, !dbg !218

; <label>:231                                     ; preds = %218
  store i32 0, i32* %bit, align 4, !dbg !219
  store i8 0, i8* %bout, align 1, !dbg !220
  br label %239, !dbg !221

; <label>:232                                     ; preds = %215
  %233 = load i32* %bit, align 4, !dbg !222
  %234 = add nsw i32 %233, 1, !dbg !222
  store i32 %234, i32* %bit, align 4, !dbg !222
  %235 = load i8* %bout, align 1, !dbg !224
  %236 = sext i8 %235 to i32, !dbg !224
  %237 = shl i32 %236, 1, !dbg !224
  %238 = trunc i32 %237 to i8, !dbg !224
  store i8 %238, i8* %bout, align 1, !dbg !224
  br label %239

; <label>:239                                     ; preds = %232, %231
  %240 = load i8** %dptr, align 8, !dbg !225
  %241 = load i8* %240, align 1, !dbg !225
  %242 = zext i8 %241 to i64, !dbg !225
  %243 = getelementptr inbounds [256 x i64]* %code, i32 0, i64 %242, !dbg !225
  %244 = load i64* %243, align 8, !dbg !225
  %245 = load i64* %mask, align 8, !dbg !225
  %246 = and i64 %244, %245, !dbg !225
  %247 = icmp ne i64 %246, 0, !dbg !225
  br i1 %247, label %248, label %253, !dbg !225

; <label>:248                                     ; preds = %239
  %249 = load i8* %bout, align 1, !dbg !227
  %250 = sext i8 %249 to i32, !dbg !227
  %251 = or i32 %250, 1, !dbg !227
  %252 = trunc i32 %251 to i8, !dbg !227
  store i8 %252, i8* %bout, align 1, !dbg !227
  br label %253, !dbg !227

; <label>:253                                     ; preds = %248, %239
  %254 = load i64* %mask, align 8, !dbg !228
  %255 = lshr i64 %254, 1, !dbg !228
  store i64 %255, i64* %mask, align 8, !dbg !228
  br label %256, !dbg !229

; <label>:256                                     ; preds = %253
  %257 = load i64* %i, align 8, !dbg !206
  %258 = add i64 %257, 1, !dbg !206
  store i64 %258, i64* %i, align 8, !dbg !206
  br label %206, !dbg !206

; <label>:259                                     ; preds = %206
  %260 = load i8** %dptr, align 8, !dbg !230
  %261 = getelementptr inbounds i8* %260, i32 1, !dbg !230
  store i8* %261, i8** %dptr, align 8, !dbg !230
  br label %262, !dbg !231

; <label>:262                                     ; preds = %259
  %263 = load i64* %j, align 8, !dbg !202
  %264 = add i64 %263, 1, !dbg !202
  store i64 %264, i64* %j, align 8, !dbg !202
  br label %192, !dbg !202

; <label>:265                                     ; preds = %192
  %266 = load i32* %bit, align 4, !dbg !232
  %267 = sub nsw i32 7, %266, !dbg !232
  %268 = load i8* %bout, align 1, !dbg !232
  %269 = sext i8 %268 to i32, !dbg !232
  %270 = shl i32 %269, %267, !dbg !232
  %271 = trunc i32 %270 to i8, !dbg !232
  store i8 %271, i8* %bout, align 1, !dbg !232
  %272 = load i8* %bout, align 1, !dbg !233
  %273 = load i64* %comp_len, align 8, !dbg !233
  %274 = load i8** %comp, align 8, !dbg !233
  %275 = getelementptr inbounds i8* %274, i64 %273, !dbg !233
  store i8 %272, i8* %275, align 1, !dbg !233
  %276 = load i64* %comp_len, align 8, !dbg !234
  %277 = add i64 %276, 1, !dbg !234
  store i64 %277, i64* %comp_len, align 8, !dbg !234
  call void @llvm.dbg.declare(metadata !{[256 x i64]* %heap2}, metadata !235), !dbg !236
  call void @llvm.dbg.declare(metadata !{[256 x i8]* %outc}, metadata !237), !dbg !239
  %278 = bitcast [256 x i64]* %heap2 to i8*, !dbg !240
  call void @llvm.memset.p0i8.i64(i8* %278, i8 0, i64 2048, i32 16, i1 false), !dbg !240
  call void @llvm.dbg.declare(metadata !{i8** %optr}, metadata !241), !dbg !242
  %279 = getelementptr inbounds [256 x i8]* %outc, i32 0, i32 0, !dbg !242
  store i8* %279, i8** %optr, align 8, !dbg !242
  store i64 0, i64* %j, align 8, !dbg !243
  br label %280, !dbg !243

; <label>:280                                     ; preds = %337, %265
  %281 = load i64* %j, align 8, !dbg !243
  %282 = icmp ult i64 %281, 256, !dbg !243
  br i1 %282, label %283, label %340, !dbg !243

; <label>:283                                     ; preds = %280
  %284 = load i64* %j, align 8, !dbg !245
  %285 = trunc i64 %284 to i8, !dbg !245
  %286 = load i8** %optr, align 8, !dbg !245
  store i8 %285, i8* %286, align 1, !dbg !245
  %287 = load i8** %optr, align 8, !dbg !247
  %288 = getelementptr inbounds i8* %287, i32 1, !dbg !247
  store i8* %288, i8** %optr, align 8, !dbg !247
  %289 = load i64* %j, align 8, !dbg !248
  %290 = getelementptr inbounds [256 x i64]* %code, i32 0, i64 %289, !dbg !248
  %291 = load i64* %290, align 8, !dbg !248
  %292 = load i64* %j, align 8, !dbg !248
  %293 = getelementptr inbounds [256 x i8]* %clen, i32 0, i64 %292, !dbg !248
  %294 = load i8* %293, align 1, !dbg !248
  %295 = zext i8 %294 to i64, !dbg !248
  %296 = or i64 %291, %295, !dbg !248
  %297 = icmp ne i64 %296, 0, !dbg !248
  br i1 %297, label %298, label %336, !dbg !248

; <label>:298                                     ; preds = %283
  store i64 0, i64* %k, align 8, !dbg !250
  %299 = load i64* %j, align 8, !dbg !252
  %300 = getelementptr inbounds [256 x i8]* %clen, i32 0, i64 %299, !dbg !252
  %301 = load i8* %300, align 1, !dbg !252
  %302 = zext i8 %301 to i32, !dbg !252
  %303 = sub nsw i32 %302, 1, !dbg !252
  %304 = shl i32 1, %303, !dbg !252
  %305 = sext i32 %304 to i64, !dbg !252
  store i64 %305, i64* %mask, align 8, !dbg !252
  store i64 0, i64* %i, align 8, !dbg !253
  br label %306, !dbg !253

; <label>:306                                     ; preds = %329, %298
  %307 = load i64* %i, align 8, !dbg !253
  %308 = load i64* %j, align 8, !dbg !253
  %309 = getelementptr inbounds [256 x i8]* %clen, i32 0, i64 %308, !dbg !253
  %310 = load i8* %309, align 1, !dbg !253
  %311 = zext i8 %310 to i64, !dbg !253
  %312 = icmp ult i64 %307, %311, !dbg !253
  br i1 %312, label %313, label %332, !dbg !253

; <label>:313                                     ; preds = %306
  %314 = load i64* %k, align 8, !dbg !255
  %315 = mul i64 %314, 2, !dbg !255
  %316 = add i64 %315, 1, !dbg !255
  store i64 %316, i64* %k, align 8, !dbg !255
  %317 = load i64* %j, align 8, !dbg !257
  %318 = getelementptr inbounds [256 x i64]* %code, i32 0, i64 %317, !dbg !257
  %319 = load i64* %318, align 8, !dbg !257
  %320 = load i64* %mask, align 8, !dbg !257
  %321 = and i64 %319, %320, !dbg !257
  %322 = icmp ne i64 %321, 0, !dbg !257
  br i1 %322, label %323, label %326, !dbg !257

; <label>:323                                     ; preds = %313
  %324 = load i64* %k, align 8, !dbg !259
  %325 = add i64 %324, 1, !dbg !259
  store i64 %325, i64* %k, align 8, !dbg !259
  br label %326, !dbg !259

; <label>:326                                     ; preds = %323, %313
  %327 = load i64* %mask, align 8, !dbg !260
  %328 = lshr i64 %327, 1, !dbg !260
  store i64 %328, i64* %mask, align 8, !dbg !260
  br label %329, !dbg !261

; <label>:329                                     ; preds = %326
  %330 = load i64* %i, align 8, !dbg !253
  %331 = add i64 %330, 1, !dbg !253
  store i64 %331, i64* %i, align 8, !dbg !253
  br label %306, !dbg !253

; <label>:332                                     ; preds = %306
  %333 = load i64* %k, align 8, !dbg !262
  %334 = load i64* %j, align 8, !dbg !262
  %335 = getelementptr inbounds [256 x i64]* %heap2, i32 0, i64 %334, !dbg !262
  store i64 %333, i64* %335, align 8, !dbg !262
  br label %336, !dbg !263

; <label>:336                                     ; preds = %332, %283
  br label %337, !dbg !264

; <label>:337                                     ; preds = %336
  %338 = load i64* %j, align 8, !dbg !243
  %339 = add i64 %338, 1, !dbg !243
  store i64 %339, i64* %j, align 8, !dbg !243
  br label %280, !dbg !243

; <label>:340                                     ; preds = %280
  store i64 1, i64* %i, align 8, !dbg !265
  br label %341, !dbg !265

; <label>:341                                     ; preds = %386, %340
  %342 = load i64* %i, align 8, !dbg !265
  %343 = icmp ult i64 %342, 256, !dbg !265
  br i1 %343, label %344, label %389, !dbg !265

; <label>:344                                     ; preds = %341
  %345 = load i64* %i, align 8, !dbg !267
  %346 = getelementptr inbounds [256 x i64]* %heap2, i32 0, i64 %345, !dbg !267
  %347 = load i64* %346, align 8, !dbg !267
  store i64 %347, i64* %t, align 8, !dbg !267
  %348 = load i64* %i, align 8, !dbg !269
  %349 = getelementptr inbounds [256 x i8]* %outc, i32 0, i64 %348, !dbg !269
  %350 = load i8* %349, align 1, !dbg !269
  store i8 %350, i8* %c, align 1, !dbg !269
  %351 = load i64* %i, align 8, !dbg !270
  store i64 %351, i64* %j, align 8, !dbg !270
  br label %352, !dbg !271

; <label>:352                                     ; preds = %364, %344
  %353 = load i64* %j, align 8, !dbg !271
  %354 = icmp ne i64 %353, 0, !dbg !271
  br i1 %354, label %355, label %362, !dbg !271

; <label>:355                                     ; preds = %352
  %356 = load i64* %j, align 8, !dbg !271
  %357 = sub i64 %356, 1, !dbg !271
  %358 = getelementptr inbounds [256 x i64]* %heap2, i32 0, i64 %357, !dbg !271
  %359 = load i64* %358, align 8, !dbg !271
  %360 = load i64* %t, align 8, !dbg !271
  %361 = icmp ugt i64 %359, %360, !dbg !271
  br label %362

; <label>:362                                     ; preds = %355, %352
  %363 = phi i1 [ false, %352 ], [ %361, %355 ]
  br i1 %363, label %364, label %379

; <label>:364                                     ; preds = %362
  %365 = load i64* %j, align 8, !dbg !272
  %366 = sub i64 %365, 1, !dbg !272
  %367 = getelementptr inbounds [256 x i64]* %heap2, i32 0, i64 %366, !dbg !272
  %368 = load i64* %367, align 8, !dbg !272
  %369 = load i64* %j, align 8, !dbg !272
  %370 = getelementptr inbounds [256 x i64]* %heap2, i32 0, i64 %369, !dbg !272
  store i64 %368, i64* %370, align 8, !dbg !272
  %371 = load i64* %j, align 8, !dbg !274
  %372 = sub i64 %371, 1, !dbg !274
  %373 = getelementptr inbounds [256 x i8]* %outc, i32 0, i64 %372, !dbg !274
  %374 = load i8* %373, align 1, !dbg !274
  %375 = load i64* %j, align 8, !dbg !274
  %376 = getelementptr inbounds [256 x i8]* %outc, i32 0, i64 %375, !dbg !274
  store i8 %374, i8* %376, align 1, !dbg !274
  %377 = load i64* %j, align 8, !dbg !275
  %378 = add i64 %377, -1, !dbg !275
  store i64 %378, i64* %j, align 8, !dbg !275
  br label %352, !dbg !276

; <label>:379                                     ; preds = %362
  %380 = load i64* %t, align 8, !dbg !277
  %381 = load i64* %j, align 8, !dbg !277
  %382 = getelementptr inbounds [256 x i64]* %heap2, i32 0, i64 %381, !dbg !277
  store i64 %380, i64* %382, align 8, !dbg !277
  %383 = load i8* %c, align 1, !dbg !278
  %384 = load i64* %j, align 8, !dbg !278
  %385 = getelementptr inbounds [256 x i8]* %outc, i32 0, i64 %384, !dbg !278
  store i8 %383, i8* %385, align 1, !dbg !278
  br label %386, !dbg !279

; <label>:386                                     ; preds = %379
  %387 = load i64* %i, align 8, !dbg !265
  %388 = add i64 %387, 1, !dbg !265
  store i64 %388, i64* %i, align 8, !dbg !265
  br label %341, !dbg !265

; <label>:389                                     ; preds = %341
  store i64 0, i64* %j, align 8, !dbg !280
  br label %390, !dbg !280

; <label>:390                                     ; preds = %396, %389
  %391 = load i64* %j, align 8, !dbg !280
  %392 = getelementptr inbounds [256 x i64]* %heap2, i32 0, i64 %391, !dbg !280
  %393 = load i64* %392, align 8, !dbg !280
  %394 = icmp eq i64 %393, 0, !dbg !280
  br i1 %394, label %395, label %399, !dbg !280

; <label>:395                                     ; preds = %390
  br label %396, !dbg !280

; <label>:396                                     ; preds = %395
  %397 = load i64* %j, align 8, !dbg !280
  %398 = add i64 %397, 1, !dbg !280
  store i64 %398, i64* %j, align 8, !dbg !280
  br label %390, !dbg !280

; <label>:399                                     ; preds = %390
  store i64 0, i64* %k, align 8, !dbg !282
  %400 = load i64* %j, align 8, !dbg !283
  store i64 %400, i64* %i, align 8, !dbg !283
  store i64 128, i64* %mask, align 8, !dbg !284
  store i64 0, i64* %n, align 8, !dbg !285
  %401 = load i8** %comp, align 8, !dbg !286
  store i8* %401, i8** %cptr, align 8, !dbg !286
  %402 = load i8** %1, align 8, !dbg !287
  store i8* %402, i8** %dptr, align 8, !dbg !287
  br label %403, !dbg !288

; <label>:403                                     ; preds = %455, %399
  %404 = load i64* %n, align 8, !dbg !288
  %405 = load i64* %2, align 8, !dbg !288
  %406 = icmp ult i64 %404, %405, !dbg !288
  br i1 %406, label %407, label %456, !dbg !288

; <label>:407                                     ; preds = %403
  %408 = load i64* %k, align 8, !dbg !289
  %409 = mul i64 %408, 2, !dbg !289
  %410 = add i64 %409, 1, !dbg !289
  store i64 %410, i64* %k, align 8, !dbg !289
  %411 = load i8** %cptr, align 8, !dbg !291
  %412 = load i8* %411, align 1, !dbg !291
  %413 = zext i8 %412 to i64, !dbg !291
  %414 = load i64* %mask, align 8, !dbg !291
  %415 = and i64 %413, %414, !dbg !291
  %416 = icmp ne i64 %415, 0, !dbg !291
  br i1 %416, label %417, label %420, !dbg !291

; <label>:417                                     ; preds = %407
  %418 = load i64* %k, align 8, !dbg !293
  %419 = add i64 %418, 1, !dbg !293
  store i64 %419, i64* %k, align 8, !dbg !293
  br label %420, !dbg !293

; <label>:420                                     ; preds = %417, %407
  br label %421, !dbg !294

; <label>:421                                     ; preds = %427, %420
  %422 = load i64* %i, align 8, !dbg !294
  %423 = getelementptr inbounds [256 x i64]* %heap2, i32 0, i64 %422, !dbg !294
  %424 = load i64* %423, align 8, !dbg !294
  %425 = load i64* %k, align 8, !dbg !294
  %426 = icmp ult i64 %424, %425, !dbg !294
  br i1 %426, label %427, label %430, !dbg !294

; <label>:427                                     ; preds = %421
  %428 = load i64* %i, align 8, !dbg !295
  %429 = add i64 %428, 1, !dbg !295
  store i64 %429, i64* %i, align 8, !dbg !295
  br label %421, !dbg !295

; <label>:430                                     ; preds = %421
  %431 = load i64* %k, align 8, !dbg !296
  %432 = load i64* %i, align 8, !dbg !296
  %433 = getelementptr inbounds [256 x i64]* %heap2, i32 0, i64 %432, !dbg !296
  %434 = load i64* %433, align 8, !dbg !296
  %435 = icmp eq i64 %431, %434, !dbg !296
  br i1 %435, label %436, label %446, !dbg !296

; <label>:436                                     ; preds = %430
  %437 = load i64* %i, align 8, !dbg !298
  %438 = getelementptr inbounds [256 x i8]* %outc, i32 0, i64 %437, !dbg !298
  %439 = load i8* %438, align 1, !dbg !298
  %440 = load i8** %dptr, align 8, !dbg !298
  store i8 %439, i8* %440, align 1, !dbg !298
  %441 = load i8** %dptr, align 8, !dbg !300
  %442 = getelementptr inbounds i8* %441, i32 1, !dbg !300
  store i8* %442, i8** %dptr, align 8, !dbg !300
  %443 = load i64* %n, align 8, !dbg !301
  %444 = add i64 %443, 1, !dbg !301
  store i64 %444, i64* %n, align 8, !dbg !301
  store i64 0, i64* %k, align 8, !dbg !302
  %445 = load i64* %j, align 8, !dbg !303
  store i64 %445, i64* %i, align 8, !dbg !303
  br label %446, !dbg !304

; <label>:446                                     ; preds = %436, %430
  %447 = load i64* %mask, align 8, !dbg !305
  %448 = icmp ugt i64 %447, 1, !dbg !305
  br i1 %448, label %449, label %452, !dbg !305

; <label>:449                                     ; preds = %446
  %450 = load i64* %mask, align 8, !dbg !307
  %451 = lshr i64 %450, 1, !dbg !307
  store i64 %451, i64* %mask, align 8, !dbg !307
  br label %455, !dbg !307

; <label>:452                                     ; preds = %446
  store i64 128, i64* %mask, align 8, !dbg !308
  %453 = load i8** %cptr, align 8, !dbg !310
  %454 = getelementptr inbounds i8* %453, i32 1, !dbg !310
  store i8* %454, i8** %cptr, align 8, !dbg !310
  br label %455

; <label>:455                                     ; preds = %452, %449
  br label %403, !dbg !311

; <label>:456                                     ; preds = %403
  %457 = load i8** %comp, align 8, !dbg !312
  call void @free(i8* %457) #3, !dbg !312
  ret void, !dbg !313
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #3

; Function Attrs: nounwind uwtable
define internal void @heap_adjust(i64* %freq, i64* %heap, i32 %n, i32 %k) #0 {
  %1 = alloca i64*, align 8
  %2 = alloca i64*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %j = alloca i32, align 4
  %v = alloca i32, align 4
  store i64* %freq, i64** %1, align 8
  call void @llvm.dbg.declare(metadata !{i64** %1}, metadata !314), !dbg !315
  store i64* %heap, i64** %2, align 8
  call void @llvm.dbg.declare(metadata !{i64** %2}, metadata !316), !dbg !315
  store i32 %n, i32* %3, align 4
  call void @llvm.dbg.declare(metadata !{i32* %3}, metadata !317), !dbg !315
  store i32 %k, i32* %4, align 4
  call void @llvm.dbg.declare(metadata !{i32* %4}, metadata !318), !dbg !315
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !319), !dbg !320
  %5 = load i64** %2, align 8, !dbg !321
  %6 = getelementptr inbounds i64* %5, i32 -1, !dbg !321
  store i64* %6, i64** %2, align 8, !dbg !321
  call void @llvm.dbg.declare(metadata !{i32* %v}, metadata !322), !dbg !323
  %7 = load i32* %4, align 4, !dbg !323
  %8 = sext i32 %7 to i64, !dbg !323
  %9 = load i64** %2, align 8, !dbg !323
  %10 = getelementptr inbounds i64* %9, i64 %8, !dbg !323
  %11 = load i64* %10, align 8, !dbg !323
  %12 = trunc i64 %11 to i32, !dbg !323
  store i32 %12, i32* %v, align 4, !dbg !323
  br label %13, !dbg !324

; <label>:13                                      ; preds = %63, %0
  %14 = load i32* %4, align 4, !dbg !324
  %15 = load i32* %3, align 4, !dbg !324
  %16 = sdiv i32 %15, 2, !dbg !324
  %17 = icmp sle i32 %14, %16, !dbg !324
  br i1 %17, label %18, label %74, !dbg !324

; <label>:18                                      ; preds = %13
  %19 = load i32* %4, align 4, !dbg !325
  %20 = load i32* %4, align 4, !dbg !325
  %21 = add nsw i32 %19, %20, !dbg !325
  store i32 %21, i32* %j, align 4, !dbg !325
  %22 = load i32* %j, align 4, !dbg !327
  %23 = load i32* %3, align 4, !dbg !327
  %24 = icmp slt i32 %22, %23, !dbg !327
  br i1 %24, label %25, label %47, !dbg !327

; <label>:25                                      ; preds = %18
  %26 = load i32* %j, align 4, !dbg !327
  %27 = sext i32 %26 to i64, !dbg !327
  %28 = load i64** %2, align 8, !dbg !327
  %29 = getelementptr inbounds i64* %28, i64 %27, !dbg !327
  %30 = load i64* %29, align 8, !dbg !327
  %31 = load i64** %1, align 8, !dbg !327
  %32 = getelementptr inbounds i64* %31, i64 %30, !dbg !327
  %33 = load i64* %32, align 8, !dbg !327
  %34 = load i32* %j, align 4, !dbg !327
  %35 = add nsw i32 %34, 1, !dbg !327
  %36 = sext i32 %35 to i64, !dbg !327
  %37 = load i64** %2, align 8, !dbg !327
  %38 = getelementptr inbounds i64* %37, i64 %36, !dbg !327
  %39 = load i64* %38, align 8, !dbg !327
  %40 = load i64** %1, align 8, !dbg !327
  %41 = getelementptr inbounds i64* %40, i64 %39, !dbg !327
  %42 = load i64* %41, align 8, !dbg !327
  %43 = icmp ugt i64 %33, %42, !dbg !327
  br i1 %43, label %44, label %47, !dbg !327

; <label>:44                                      ; preds = %25
  %45 = load i32* %j, align 4, !dbg !329
  %46 = add nsw i32 %45, 1, !dbg !329
  store i32 %46, i32* %j, align 4, !dbg !329
  br label %47, !dbg !329

; <label>:47                                      ; preds = %44, %25, %18
  %48 = load i32* %v, align 4, !dbg !330
  %49 = sext i32 %48 to i64, !dbg !330
  %50 = load i64** %1, align 8, !dbg !330
  %51 = getelementptr inbounds i64* %50, i64 %49, !dbg !330
  %52 = load i64* %51, align 8, !dbg !330
  %53 = load i32* %j, align 4, !dbg !330
  %54 = sext i32 %53 to i64, !dbg !330
  %55 = load i64** %2, align 8, !dbg !330
  %56 = getelementptr inbounds i64* %55, i64 %54, !dbg !330
  %57 = load i64* %56, align 8, !dbg !330
  %58 = load i64** %1, align 8, !dbg !330
  %59 = getelementptr inbounds i64* %58, i64 %57, !dbg !330
  %60 = load i64* %59, align 8, !dbg !330
  %61 = icmp ult i64 %52, %60, !dbg !330
  br i1 %61, label %62, label %63, !dbg !330

; <label>:62                                      ; preds = %47
  br label %74, !dbg !332

; <label>:63                                      ; preds = %47
  %64 = load i32* %j, align 4, !dbg !333
  %65 = sext i32 %64 to i64, !dbg !333
  %66 = load i64** %2, align 8, !dbg !333
  %67 = getelementptr inbounds i64* %66, i64 %65, !dbg !333
  %68 = load i64* %67, align 8, !dbg !333
  %69 = load i32* %4, align 4, !dbg !333
  %70 = sext i32 %69 to i64, !dbg !333
  %71 = load i64** %2, align 8, !dbg !333
  %72 = getelementptr inbounds i64* %71, i64 %70, !dbg !333
  store i64 %68, i64* %72, align 8, !dbg !333
  %73 = load i32* %j, align 4, !dbg !334
  store i32 %73, i32* %4, align 4, !dbg !334
  br label %13, !dbg !335

; <label>:74                                      ; preds = %62, %13
  %75 = load i32* %v, align 4, !dbg !336
  %76 = sext i32 %75 to i64, !dbg !336
  %77 = load i32* %4, align 4, !dbg !336
  %78 = sext i32 %77 to i64, !dbg !336
  %79 = load i64** %2, align 8, !dbg !336
  %80 = getelementptr inbounds i64* %79, i64 %78, !dbg !336
  store i64 %76, i64* %80, align 8, !dbg !336
  ret void, !dbg !337
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #4

; Function Attrs: noreturn nounwind
declare void @exit(i32) #5

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  %ga_testing = alloca i8, align 1
  %test_data = alloca i8*, align 8
  %run_time = alloca double, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !338), !dbg !339
  store i8** %argv, i8*** %3, align 8
  call void @llvm.dbg.declare(metadata !{i8*** %3}, metadata !340), !dbg !339
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !341), !dbg !342
  call void @llvm.dbg.declare(metadata !{i8* %ga_testing}, metadata !343), !dbg !345
  store i8 0, i8* %ga_testing, align 1, !dbg !345
  %4 = load i32* %2, align 4, !dbg !346
  %5 = icmp sgt i32 %4, 1, !dbg !346
  br i1 %5, label %6, label %23, !dbg !346

; <label>:6                                       ; preds = %0
  store i32 1, i32* %i, align 4, !dbg !348
  br label %7, !dbg !348

; <label>:7                                       ; preds = %19, %6
  %8 = load i32* %i, align 4, !dbg !348
  %9 = load i32* %2, align 4, !dbg !348
  %10 = icmp slt i32 %8, %9, !dbg !348
  br i1 %10, label %11, label %22, !dbg !348

; <label>:11                                      ; preds = %7
  %12 = load i8*** %3, align 8, !dbg !351
  %13 = getelementptr inbounds i8** %12, i64 1, !dbg !351
  %14 = load i8** %13, align 8, !dbg !351
  %15 = call i32 @strcmp(i8* %14, i8* getelementptr inbounds ([4 x i8]* @.str4, i32 0, i32 0)) #8, !dbg !351
  %16 = icmp ne i32 %15, 0, !dbg !351
  br i1 %16, label %18, label %17, !dbg !351

; <label>:17                                      ; preds = %11
  store i8 1, i8* %ga_testing, align 1, !dbg !354
  br label %22, !dbg !356

; <label>:18                                      ; preds = %11
  br label %19, !dbg !357

; <label>:19                                      ; preds = %18
  %20 = load i32* %i, align 4, !dbg !348
  %21 = add nsw i32 %20, 1, !dbg !348
  store i32 %21, i32* %i, align 4, !dbg !348
  br label %7, !dbg !348

; <label>:22                                      ; preds = %17, %7
  br label %23, !dbg !358

; <label>:23                                      ; preds = %22, %0
  call void @llvm.dbg.declare(metadata !{i8** %test_data}, metadata !359), !dbg !360
  %24 = call i8* @generate_test_data(i64 10000000), !dbg !360
  store i8* %24, i8** %test_data, align 8, !dbg !360
  store i32 0, i32* %i, align 4, !dbg !361
  br label %25, !dbg !361

; <label>:25                                      ; preds = %30, %23
  %26 = load i32* %i, align 4, !dbg !361
  %27 = icmp slt i32 %26, 30, !dbg !361
  br i1 %27, label %28, label %33, !dbg !361

; <label>:28                                      ; preds = %25
  %29 = load i8** %test_data, align 8, !dbg !363
  call void @compdecomp(i8* %29, i64 10000000), !dbg !363
  br label %30, !dbg !363

; <label>:30                                      ; preds = %28
  %31 = load i32* %i, align 4, !dbg !361
  %32 = add nsw i32 %31, 1, !dbg !361
  store i32 %32, i32* %i, align 4, !dbg !361
  br label %25, !dbg !361

; <label>:33                                      ; preds = %25
  call void @llvm.dbg.declare(metadata !{double* %run_time}, metadata !364), !dbg !366
  store double 0.000000e+00, double* %run_time, align 8, !dbg !366
  %34 = load i8** %test_data, align 8, !dbg !367
  call void @free(i8* %34) #3, !dbg !367
  %35 = load i8* %ga_testing, align 1, !dbg !368
  %36 = trunc i8 %35 to i1, !dbg !368
  br i1 %36, label %37, label %41, !dbg !368

; <label>:37                                      ; preds = %33
  %38 = load %struct._IO_FILE** @stdout, align 8, !dbg !370
  %39 = load double* %run_time, align 8, !dbg !370
  %40 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %38, i8* getelementptr inbounds ([3 x i8]* @.str5, i32 0, i32 0), double %39), !dbg !370
  br label %45, !dbg !370

; <label>:41                                      ; preds = %33
  %42 = load %struct._IO_FILE** @stdout, align 8, !dbg !371
  %43 = load double* %run_time, align 8, !dbg !371
  %44 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %42, i8* getelementptr inbounds ([35 x i8]* @.str6, i32 0, i32 0), double %43), !dbg !371
  br label %45

; <label>:45                                      ; preds = %41, %37
  %46 = load %struct._IO_FILE** @stdout, align 8, !dbg !372
  %47 = call i32 @fflush(%struct._IO_FILE* %46), !dbg !372
  ret i32 0, !dbg !373
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #6

declare i32 @fflush(%struct._IO_FILE*) #4

; Function Attrs: nounwind uwtable
define internal i64 @random4() #0 {
  %k = alloca i64, align 8
  %result = alloca i64, align 8
  call void @llvm.dbg.declare(metadata !{i64* %k}, metadata !374), !dbg !375
  call void @llvm.dbg.declare(metadata !{i64* %result}, metadata !376), !dbg !377
  %1 = load i64* @seed, align 8, !dbg !378
  %2 = xor i64 %1, 123459876, !dbg !378
  store i64 %2, i64* @seed, align 8, !dbg !378
  %3 = load i64* @seed, align 8, !dbg !379
  %4 = sdiv i64 %3, 127773, !dbg !379
  store i64 %4, i64* %k, align 8, !dbg !379
  %5 = load i64* @seed, align 8, !dbg !380
  %6 = load i64* %k, align 8, !dbg !380
  %7 = mul nsw i64 %6, 127773, !dbg !380
  %8 = sub nsw i64 %5, %7, !dbg !380
  %9 = mul nsw i64 16807, %8, !dbg !380
  %10 = load i64* %k, align 8, !dbg !380
  %11 = mul nsw i64 2836, %10, !dbg !380
  %12 = sub nsw i64 %9, %11, !dbg !380
  store i64 %12, i64* @seed, align 8, !dbg !380
  %13 = load i64* @seed, align 8, !dbg !381
  %14 = icmp slt i64 %13, 0, !dbg !381
  br i1 %14, label %15, label %18, !dbg !381

; <label>:15                                      ; preds = %0
  %16 = load i64* @seed, align 8, !dbg !383
  %17 = add nsw i64 %16, 2147483647, !dbg !383
  store i64 %17, i64* @seed, align 8, !dbg !383
  br label %18, !dbg !383

; <label>:18                                      ; preds = %15, %0
  %19 = load i64* @seed, align 8, !dbg !384
  %20 = srem i64 %19, 32, !dbg !384
  store i64 %20, i64* %result, align 8, !dbg !384
  %21 = load i64* @seed, align 8, !dbg !385
  %22 = xor i64 %21, 123459876, !dbg !385
  store i64 %22, i64* @seed, align 8, !dbg !385
  %23 = load i64* %result, align 8, !dbg !386
  ret i64 %23, !dbg !386
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { noreturn nounwind }
attributes #8 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!43, !44}
!llvm.ident = !{!45}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !31, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c] [DW_LANG_C99]
!1 = metadata !{metadata !"huffbench.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !14, metadata !17, metadata !24, metadata !28}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"generate_test_data", metadata !"generate_test_data", metadata !"", i32 88, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i8* (i64)* @generate_test_data, null, null, metadata !2, i32 89} ; [ DW_TAG_subprogram ] [line 88] [def] [scope 89] [generate_test_data]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !11}
!8 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !9} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from byte]
!9 = metadata !{i32 786454, metadata !1, null, metadata !"byte", i32 84, i64 0, i64 0, i64 0, i32 0, metadata !10} ; [ DW_TAG_typedef ] [byte] [line 84, size 0, align 0, offset 0] [from unsigned char]
!10 = metadata !{i32 786468, null, null, metadata !"unsigned char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ] [unsigned char] [line 0, size 8, align 8, offset 0, enc DW_ATE_unsigned_char]
!11 = metadata !{i32 786454, metadata !12, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !13} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!12 = metadata !{metadata !"/usr/bin/../lib/clang/3.5/include/stddef.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!13 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!14 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"compdecomp", metadata !"compdecomp", metadata !"", i32 136, metadata !15, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i8*, i64)* @compdecomp, null, null, metadata !2, i32 137} ; [ DW_TAG_subprogram ] [line 136] [def] [scope 137] [compdecomp]
!15 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !16, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!16 = metadata !{null, metadata !8, metadata !11}
!17 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 434, metadata !18, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main, null, null, metadata !2, i32 435} ; [ DW_TAG_subprogram ] [line 434] [def] [scope 435] [main]
!18 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !19, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!19 = metadata !{metadata !20, metadata !20, metadata !21}
!20 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!21 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !22} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!22 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !23} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!23 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!24 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"heap_adjust", metadata !"heap_adjust", metadata !"", i32 106, metadata !25, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i64*, i64*, i32, i32)* @heap_adjust, null, null, metadata !2, i32 107} ; [ DW_TAG_subprogram ] [line 106] [local] [def] [scope 107] [heap_adjust]
!25 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !26, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!26 = metadata !{null, metadata !27, metadata !27, metadata !20, metadata !20}
!27 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from size_t]
!28 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"random4", metadata !"random4", metadata !"", i32 47, metadata !29, i1 true, i1 true, i32 0, i32 0, null, i32 0, i1 false, i64 ()* @random4, null, null, metadata !2, i32 48} ; [ DW_TAG_subprogram ] [line 47] [local] [def] [scope 48] [random4]
!29 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !30, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!30 = metadata !{metadata !11}
!31 = metadata !{metadata !32, metadata !34, metadata !32, metadata !35, metadata !38, metadata !39, metadata !38, metadata !40, metadata !41, metadata !35, metadata !42}
!32 = metadata !{i32 786484, i32 0, metadata !5, metadata !"TEST_SIZE", metadata !"TEST_SIZE", metadata !"TEST_SIZE", metadata !5, i32 79, metadata !33, i32 1, i32 1, i32 10000000, null} ; [ DW_TAG_variable ] [TEST_SIZE] [line 79] [local] [def]
!33 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !20} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from int]
!34 = metadata !{i32 786484, i32 0, metadata !5, metadata !"NUM_LOOPS", metadata !"NUM_LOOPS", metadata !"NUM_LOOPS", metadata !5, i32 78, metadata !33, i32 1, i32 1, i32 30, null} ; [ DW_TAG_variable ] [NUM_LOOPS] [line 78] [local] [def]
!35 = metadata !{i32 786484, i32 0, metadata !5, metadata !"MASK", metadata !"MASK", metadata !"MASK", metadata !5, i32 44, metadata !36, i32 1, i32 1, i64 123459876, null} ; [ DW_TAG_variable ] [MASK] [line 44] [local] [def]
!36 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !37} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from long int]
!37 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!38 = metadata !{i32 786484, i32 0, metadata !5, metadata !"IQ", metadata !"IQ", metadata !"IQ", metadata !5, i32 42, metadata !36, i32 1, i32 1, i64 127773, null} ; [ DW_TAG_variable ] [IQ] [line 42] [local] [def]
!39 = metadata !{i32 786484, i32 0, metadata !5, metadata !"IA", metadata !"IA", metadata !"IA", metadata !5, i32 40, metadata !36, i32 1, i32 1, i64 16807, null} ; [ DW_TAG_variable ] [IA] [line 40] [local] [def]
!40 = metadata !{i32 786484, i32 0, metadata !5, metadata !"IR", metadata !"IR", metadata !"IR", metadata !5, i32 43, metadata !36, i32 1, i32 1, i64 2836, null} ; [ DW_TAG_variable ] [IR] [line 43] [local] [def]
!41 = metadata !{i32 786484, i32 0, metadata !5, metadata !"IM", metadata !"IM", metadata !"IM", metadata !5, i32 41, metadata !36, i32 1, i32 1, i64 2147483647, null} ; [ DW_TAG_variable ] [IM] [line 41] [local] [def]
!42 = metadata !{i32 786484, i32 0, null, metadata !"seed", metadata !"seed", metadata !"", metadata !5, i32 39, metadata !37, i32 1, i32 1, i64* @seed, null} ; [ DW_TAG_variable ] [seed] [line 39] [local] [def]
!43 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!44 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!45 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!46 = metadata !{i32 786689, metadata !4, metadata !"n", metadata !5, i32 16777304, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 88]
!47 = metadata !{i32 88, i32 0, metadata !4, null}
!48 = metadata !{i32 786688, metadata !4, metadata !"codes", metadata !5, i32 90, metadata !22, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [codes] [line 90]
!49 = metadata !{i32 90, i32 0, metadata !4, null}
!50 = metadata !{i32 786688, metadata !4, metadata !"result", metadata !5, i32 92, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [result] [line 92]
!51 = metadata !{i32 92, i32 0, metadata !4, null}
!52 = metadata !{i32 786688, metadata !4, metadata !"ptr", metadata !5, i32 93, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ptr] [line 93]
!53 = metadata !{i32 93, i32 0, metadata !4, null}
!54 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 95, metadata !20, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 95]
!55 = metadata !{i32 95, i32 0, metadata !4, null}
!56 = metadata !{i32 96, i32 0, metadata !57, null}
!57 = metadata !{i32 786443, metadata !1, metadata !4, i32 96, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!58 = metadata !{i32 98, i32 0, metadata !59, null}
!59 = metadata !{i32 786443, metadata !1, metadata !57, i32 97, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!60 = metadata !{i32 99, i32 0, metadata !59, null}
!61 = metadata !{i32 100, i32 0, metadata !59, null}
!62 = metadata !{i32 102, i32 0, metadata !4, null}
!63 = metadata !{i32 786689, metadata !14, metadata !"data", metadata !5, i32 16777352, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [data] [line 136]
!64 = metadata !{i32 136, i32 0, metadata !14, null}
!65 = metadata !{i32 786689, metadata !14, metadata !"data_len", metadata !5, i32 33554568, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [data_len] [line 136]
!66 = metadata !{i32 786688, metadata !14, metadata !"i", metadata !5, i32 138, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 138]
!67 = metadata !{i32 138, i32 0, metadata !14, null}
!68 = metadata !{i32 786688, metadata !14, metadata !"j", metadata !5, i32 138, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 138]
!69 = metadata !{i32 786688, metadata !14, metadata !"n", metadata !5, i32 138, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 138]
!70 = metadata !{i32 786688, metadata !14, metadata !"mask", metadata !5, i32 138, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [mask] [line 138]
!71 = metadata !{i32 786688, metadata !14, metadata !"k", metadata !5, i32 139, metadata !72, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 139]
!72 = metadata !{i32 786454, metadata !1, null, metadata !"bits32", i32 83, i64 0, i64 0, i64 0, i32 0, metadata !13} ; [ DW_TAG_typedef ] [bits32] [line 83, size 0, align 0, offset 0] [from long unsigned int]
!73 = metadata !{i32 139, i32 0, metadata !14, null}
!74 = metadata !{i32 786688, metadata !14, metadata !"t", metadata !5, i32 139, metadata !72, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t] [line 139]
!75 = metadata !{i32 786688, metadata !14, metadata !"c", metadata !5, i32 140, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [c] [line 140]
!76 = metadata !{i32 140, i32 0, metadata !14, null}
!77 = metadata !{i32 786688, metadata !14, metadata !"cptr", metadata !5, i32 141, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cptr] [line 141]
!78 = metadata !{i32 141, i32 0, metadata !14, null}
!79 = metadata !{i32 786688, metadata !14, metadata !"dptr", metadata !5, i32 142, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dptr] [line 142]
!80 = metadata !{i32 142, i32 0, metadata !14, null}
!81 = metadata !{i32 786688, metadata !14, metadata !"comp", metadata !5, i32 149, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [comp] [line 149]
!82 = metadata !{i32 149, i32 0, metadata !14, null}
!83 = metadata !{i32 786688, metadata !14, metadata !"freq", metadata !5, i32 151, metadata !84, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [freq] [line 151]
!84 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 32768, i64 64, i32 0, i32 0, metadata !11, metadata !85, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 32768, align 64, offset 0] [from size_t]
!85 = metadata !{metadata !86}
!86 = metadata !{i32 786465, i64 0, i64 512}      ; [ DW_TAG_subrange_type ] [0, 511]
!87 = metadata !{i32 151, i32 0, metadata !14, null}
!88 = metadata !{i32 786688, metadata !14, metadata !"heap", metadata !5, i32 152, metadata !89, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [heap] [line 152]
!89 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 16384, i64 64, i32 0, i32 0, metadata !11, metadata !90, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16384, align 64, offset 0] [from size_t]
!90 = metadata !{metadata !91}
!91 = metadata !{i32 786465, i64 0, i64 256}      ; [ DW_TAG_subrange_type ] [0, 255]
!92 = metadata !{i32 152, i32 0, metadata !14, null}
!93 = metadata !{i32 786688, metadata !14, metadata !"link", metadata !5, i32 153, metadata !94, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [link] [line 153]
!94 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 16384, i64 32, i32 0, i32 0, metadata !20, metadata !85, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16384, align 32, offset 0] [from int]
!95 = metadata !{i32 153, i32 0, metadata !14, null}
!96 = metadata !{i32 786688, metadata !14, metadata !"code", metadata !5, i32 154, metadata !97, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [code] [line 154]
!97 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 16384, i64 64, i32 0, i32 0, metadata !72, metadata !90, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16384, align 64, offset 0] [from bits32]
!98 = metadata !{i32 154, i32 0, metadata !14, null}
!99 = metadata !{i32 786688, metadata !14, metadata !"clen", metadata !5, i32 155, metadata !100, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [clen] [line 155]
!100 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 2048, i64 8, i32 0, i32 0, metadata !9, metadata !90, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 2048, align 8, offset 0] [from byte]
!101 = metadata !{i32 155, i32 0, metadata !14, null}
!102 = metadata !{i32 157, i32 0, metadata !14, null}
!103 = metadata !{i32 158, i32 0, metadata !14, null}
!104 = metadata !{i32 159, i32 0, metadata !14, null}
!105 = metadata !{i32 160, i32 0, metadata !14, null}
!106 = metadata !{i32 161, i32 0, metadata !14, null}
!107 = metadata !{i32 162, i32 0, metadata !14, null}
!108 = metadata !{i32 165, i32 0, metadata !109, null}
!109 = metadata !{i32 786443, metadata !1, metadata !14, i32 165, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!110 = metadata !{i32 167, i32 0, metadata !111, null}
!111 = metadata !{i32 786443, metadata !1, metadata !109, i32 166, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!112 = metadata !{i32 168, i32 0, metadata !111, null}
!113 = metadata !{i32 169, i32 0, metadata !111, null}
!114 = metadata !{i32 172, i32 0, metadata !14, null}
!115 = metadata !{i32 174, i32 0, metadata !116, null}
!116 = metadata !{i32 786443, metadata !1, metadata !14, i32 174, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!117 = metadata !{i32 176, i32 0, metadata !118, null}
!118 = metadata !{i32 786443, metadata !1, metadata !119, i32 176, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!119 = metadata !{i32 786443, metadata !1, metadata !116, i32 175, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!120 = metadata !{i32 178, i32 0, metadata !121, null}
!121 = metadata !{i32 786443, metadata !1, metadata !118, i32 177, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!122 = metadata !{i32 179, i32 0, metadata !121, null}
!123 = metadata !{i32 180, i32 0, metadata !121, null}
!124 = metadata !{i32 181, i32 0, metadata !119, null}
!125 = metadata !{i32 183, i32 0, metadata !126, null}
!126 = metadata !{i32 786443, metadata !1, metadata !14, i32 183, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!127 = metadata !{i32 184, i32 0, metadata !126, null}
!128 = metadata !{i32 786688, metadata !14, metadata !"temp", metadata !5, i32 187, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [temp] [line 187]
!129 = metadata !{i32 187, i32 0, metadata !14, null}
!130 = metadata !{i32 191, i32 0, metadata !14, null}
!131 = metadata !{i32 194, i32 0, metadata !132, null}
!132 = metadata !{i32 786443, metadata !1, metadata !14, i32 192, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!133 = metadata !{i32 195, i32 0, metadata !132, null}
!134 = metadata !{i32 196, i32 0, metadata !132, null}
!135 = metadata !{i32 199, i32 0, metadata !132, null}
!136 = metadata !{i32 203, i32 0, metadata !132, null}
!137 = metadata !{i32 204, i32 0, metadata !132, null}
!138 = metadata !{i32 205, i32 0, metadata !132, null}
!139 = metadata !{i32 206, i32 0, metadata !132, null}
!140 = metadata !{i32 209, i32 0, metadata !132, null}
!141 = metadata !{i32 210, i32 0, metadata !132, null}
!142 = metadata !{i32 212, i32 0, metadata !14, null}
!143 = metadata !{i32 786688, metadata !14, metadata !"m", metadata !5, i32 215, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [m] [line 215]
!144 = metadata !{i32 215, i32 0, metadata !14, null}
!145 = metadata !{i32 786688, metadata !14, metadata !"x", metadata !5, i32 215, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 215]
!146 = metadata !{i32 786688, metadata !14, metadata !"maxx", metadata !5, i32 215, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [maxx] [line 215]
!147 = metadata !{i32 786688, metadata !14, metadata !"maxi", metadata !5, i32 215, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [maxi] [line 215]
!148 = metadata !{i32 786688, metadata !14, metadata !"l", metadata !5, i32 216, metadata !20, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [l] [line 216]
!149 = metadata !{i32 216, i32 0, metadata !14, null}
!150 = metadata !{i32 218, i32 0, metadata !151, null}
!151 = metadata !{i32 786443, metadata !1, metadata !14, i32 218, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!152 = metadata !{i32 220, i32 0, metadata !153, null}
!153 = metadata !{i32 786443, metadata !1, metadata !154, i32 220, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!154 = metadata !{i32 786443, metadata !1, metadata !151, i32 219, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!155 = metadata !{i32 222, i32 0, metadata !156, null}
!156 = metadata !{i32 786443, metadata !1, metadata !153, i32 221, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!157 = metadata !{i32 223, i32 0, metadata !156, null}
!158 = metadata !{i32 224, i32 0, metadata !156, null}
!159 = metadata !{i32 227, i32 0, metadata !160, null}
!160 = metadata !{i32 786443, metadata !1, metadata !153, i32 226, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!161 = metadata !{i32 228, i32 0, metadata !160, null}
!162 = metadata !{i32 229, i32 0, metadata !160, null}
!163 = metadata !{i32 230, i32 0, metadata !160, null}
!164 = metadata !{i32 232, i32 0, metadata !160, null}
!165 = metadata !{i32 234, i32 0, metadata !166, null}
!166 = metadata !{i32 786443, metadata !1, metadata !167, i32 234, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!167 = metadata !{i32 786443, metadata !1, metadata !160, i32 233, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!168 = metadata !{i32 236, i32 0, metadata !169, null}
!169 = metadata !{i32 786443, metadata !1, metadata !166, i32 235, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!170 = metadata !{i32 237, i32 0, metadata !169, null}
!171 = metadata !{i32 238, i32 0, metadata !169, null}
!172 = metadata !{i32 240, i32 0, metadata !167, null}
!173 = metadata !{i32 241, i32 0, metadata !167, null}
!174 = metadata !{i32 242, i32 0, metadata !167, null}
!175 = metadata !{i32 243, i32 0, metadata !167, null}
!176 = metadata !{i32 245, i32 0, metadata !160, null}
!177 = metadata !{i32 246, i32 0, metadata !160, null}
!178 = metadata !{i32 249, i32 0, metadata !179, null}
!179 = metadata !{i32 786443, metadata !1, metadata !160, i32 249, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!180 = metadata !{i32 250, i32 0, metadata !179, null}
!181 = metadata !{i32 253, i32 0, metadata !182, null}
!182 = metadata !{i32 786443, metadata !1, metadata !160, i32 253, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!183 = metadata !{i32 254, i32 0, metadata !182, null}
!184 = metadata !{i32 256, i32 0, metadata !154, null}
!185 = metadata !{i32 259, i32 0, metadata !186, null}
!186 = metadata !{i32 786443, metadata !1, metadata !14, i32 259, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!187 = metadata !{i32 261, i32 0, metadata !188, null}
!188 = metadata !{i32 786443, metadata !1, metadata !186, i32 260, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!189 = metadata !{i32 262, i32 0, metadata !188, null}
!190 = metadata !{i32 786688, metadata !14, metadata !"comp_len", metadata !5, i32 266, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [comp_len] [line 266]
!191 = metadata !{i32 266, i32 0, metadata !14, null}
!192 = metadata !{i32 786688, metadata !14, metadata !"bout", metadata !5, i32 267, metadata !23, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [bout] [line 267]
!193 = metadata !{i32 267, i32 0, metadata !14, null}
!194 = metadata !{i32 786688, metadata !14, metadata !"bit", metadata !5, i32 268, metadata !20, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [bit] [line 268]
!195 = metadata !{i32 268, i32 0, metadata !14, null}
!196 = metadata !{i32 269, i32 0, metadata !14, null}
!197 = metadata !{i32 272, i32 0, metadata !198, null}
!198 = metadata !{i32 786443, metadata !1, metadata !14, i32 272, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!199 = metadata !{i32 274, i32 0, metadata !200, null}
!200 = metadata !{i32 786443, metadata !1, metadata !198, i32 273, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!201 = metadata !{i32 275, i32 0, metadata !200, null}
!202 = metadata !{i32 278, i32 0, metadata !203, null}
!203 = metadata !{i32 786443, metadata !1, metadata !14, i32 278, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!204 = metadata !{i32 281, i32 0, metadata !205, null}
!205 = metadata !{i32 786443, metadata !1, metadata !203, i32 279, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!206 = metadata !{i32 284, i32 0, metadata !207, null}
!207 = metadata !{i32 786443, metadata !1, metadata !205, i32 284, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!208 = metadata !{i32 286, i32 0, metadata !209, null}
!209 = metadata !{i32 786443, metadata !1, metadata !210, i32 286, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!210 = metadata !{i32 786443, metadata !1, metadata !207, i32 285, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!211 = metadata !{i32 289, i32 0, metadata !212, null}
!212 = metadata !{i32 786443, metadata !1, metadata !209, i32 287, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!213 = metadata !{i32 290, i32 0, metadata !212, null}
!214 = metadata !{i32 293, i32 0, metadata !215, null}
!215 = metadata !{i32 786443, metadata !1, metadata !212, i32 293, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!216 = metadata !{i32 295, i32 0, metadata !217, null}
!217 = metadata !{i32 786443, metadata !1, metadata !215, i32 294, i32 0, i32 31} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!218 = metadata !{i32 296, i32 0, metadata !217, null}
!219 = metadata !{i32 299, i32 0, metadata !212, null}
!220 = metadata !{i32 300, i32 0, metadata !212, null}
!221 = metadata !{i32 301, i32 0, metadata !212, null}
!222 = metadata !{i32 305, i32 0, metadata !223, null}
!223 = metadata !{i32 786443, metadata !1, metadata !209, i32 303, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!224 = metadata !{i32 306, i32 0, metadata !223, null}
!225 = metadata !{i32 309, i32 0, metadata !226, null}
!226 = metadata !{i32 786443, metadata !1, metadata !210, i32 309, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!227 = metadata !{i32 310, i32 0, metadata !226, null}
!228 = metadata !{i32 312, i32 0, metadata !210, null}
!229 = metadata !{i32 313, i32 0, metadata !210, null}
!230 = metadata !{i32 315, i32 0, metadata !205, null}
!231 = metadata !{i32 316, i32 0, metadata !205, null}
!232 = metadata !{i32 319, i32 0, metadata !14, null}
!233 = metadata !{i32 320, i32 0, metadata !14, null}
!234 = metadata !{i32 321, i32 0, metadata !14, null}
!235 = metadata !{i32 786688, metadata !14, metadata !"heap2", metadata !5, i32 331, metadata !97, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [heap2] [line 331]
!236 = metadata !{i32 331, i32 0, metadata !14, null}
!237 = metadata !{i32 786688, metadata !14, metadata !"outc", metadata !5, i32 334, metadata !238, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [outc] [line 334]
!238 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 2048, i64 8, i32 0, i32 0, metadata !23, metadata !90, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 2048, align 8, offset 0] [from char]
!239 = metadata !{i32 334, i32 0, metadata !14, null}
!240 = metadata !{i32 337, i32 0, metadata !14, null}
!241 = metadata !{i32 786688, metadata !14, metadata !"optr", metadata !5, i32 340, metadata !22, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [optr] [line 340]
!242 = metadata !{i32 340, i32 0, metadata !14, null}
!243 = metadata !{i32 342, i32 0, metadata !244, null}
!244 = metadata !{i32 786443, metadata !1, metadata !14, i32 342, i32 0, i32 34} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!245 = metadata !{i32 344, i32 0, metadata !246, null}
!246 = metadata !{i32 786443, metadata !1, metadata !244, i32 343, i32 0, i32 35} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!247 = metadata !{i32 345, i32 0, metadata !246, null}
!248 = metadata !{i32 348, i32 0, metadata !249, null}
!249 = metadata !{i32 786443, metadata !1, metadata !246, i32 348, i32 0, i32 36} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!250 = metadata !{i32 351, i32 0, metadata !251, null}
!251 = metadata !{i32 786443, metadata !1, metadata !249, i32 349, i32 0, i32 37} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!252 = metadata !{i32 352, i32 0, metadata !251, null}
!253 = metadata !{i32 356, i32 0, metadata !254, null}
!254 = metadata !{i32 786443, metadata !1, metadata !251, i32 356, i32 0, i32 38} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!255 = metadata !{i32 358, i32 0, metadata !256, null}
!256 = metadata !{i32 786443, metadata !1, metadata !254, i32 357, i32 0, i32 39} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!257 = metadata !{i32 360, i32 0, metadata !258, null}
!258 = metadata !{i32 786443, metadata !1, metadata !256, i32 360, i32 0, i32 40} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!259 = metadata !{i32 361, i32 0, metadata !258, null}
!260 = metadata !{i32 363, i32 0, metadata !256, null}
!261 = metadata !{i32 364, i32 0, metadata !256, null}
!262 = metadata !{i32 366, i32 0, metadata !251, null}
!263 = metadata !{i32 367, i32 0, metadata !251, null}
!264 = metadata !{i32 368, i32 0, metadata !246, null}
!265 = metadata !{i32 371, i32 0, metadata !266, null}
!266 = metadata !{i32 786443, metadata !1, metadata !14, i32 371, i32 0, i32 41} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!267 = metadata !{i32 373, i32 0, metadata !268, null}
!268 = metadata !{i32 786443, metadata !1, metadata !266, i32 372, i32 0, i32 42} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!269 = metadata !{i32 374, i32 0, metadata !268, null}
!270 = metadata !{i32 375, i32 0, metadata !268, null}
!271 = metadata !{i32 377, i32 0, metadata !268, null}
!272 = metadata !{i32 379, i32 0, metadata !273, null}
!273 = metadata !{i32 786443, metadata !1, metadata !268, i32 378, i32 0, i32 43} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!274 = metadata !{i32 380, i32 0, metadata !273, null}
!275 = metadata !{i32 381, i32 0, metadata !273, null}
!276 = metadata !{i32 382, i32 0, metadata !273, null}
!277 = metadata !{i32 384, i32 0, metadata !268, null}
!278 = metadata !{i32 385, i32 0, metadata !268, null}
!279 = metadata !{i32 386, i32 0, metadata !268, null}
!280 = metadata !{i32 389, i32 0, metadata !281, null}
!281 = metadata !{i32 786443, metadata !1, metadata !14, i32 389, i32 0, i32 44} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!282 = metadata !{i32 392, i32 0, metadata !14, null}
!283 = metadata !{i32 393, i32 0, metadata !14, null}
!284 = metadata !{i32 394, i32 0, metadata !14, null}
!285 = metadata !{i32 395, i32 0, metadata !14, null}
!286 = metadata !{i32 396, i32 0, metadata !14, null}
!287 = metadata !{i32 397, i32 0, metadata !14, null}
!288 = metadata !{i32 399, i32 0, metadata !14, null}
!289 = metadata !{i32 401, i32 0, metadata !290, null}
!290 = metadata !{i32 786443, metadata !1, metadata !14, i32 400, i32 0, i32 45} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!291 = metadata !{i32 403, i32 0, metadata !292, null}
!292 = metadata !{i32 786443, metadata !1, metadata !290, i32 403, i32 0, i32 46} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!293 = metadata !{i32 404, i32 0, metadata !292, null}
!294 = metadata !{i32 407, i32 0, metadata !290, null}
!295 = metadata !{i32 408, i32 0, metadata !290, null}
!296 = metadata !{i32 411, i32 0, metadata !297, null}
!297 = metadata !{i32 786443, metadata !1, metadata !290, i32 411, i32 0, i32 47} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!298 = metadata !{i32 413, i32 0, metadata !299, null}
!299 = metadata !{i32 786443, metadata !1, metadata !297, i32 412, i32 0, i32 48} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!300 = metadata !{i32 414, i32 0, metadata !299, null}
!301 = metadata !{i32 415, i32 0, metadata !299, null}
!302 = metadata !{i32 416, i32 0, metadata !299, null}
!303 = metadata !{i32 417, i32 0, metadata !299, null}
!304 = metadata !{i32 418, i32 0, metadata !299, null}
!305 = metadata !{i32 421, i32 0, metadata !306, null}
!306 = metadata !{i32 786443, metadata !1, metadata !290, i32 421, i32 0, i32 49} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!307 = metadata !{i32 422, i32 0, metadata !306, null}
!308 = metadata !{i32 425, i32 0, metadata !309, null}
!309 = metadata !{i32 786443, metadata !1, metadata !306, i32 424, i32 0, i32 50} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!310 = metadata !{i32 426, i32 0, metadata !309, null}
!311 = metadata !{i32 428, i32 0, metadata !290, null}
!312 = metadata !{i32 431, i32 0, metadata !14, null}
!313 = metadata !{i32 432, i32 0, metadata !14, null}
!314 = metadata !{i32 786689, metadata !24, metadata !"freq", metadata !5, i32 16777322, metadata !27, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [freq] [line 106]
!315 = metadata !{i32 106, i32 0, metadata !24, null}
!316 = metadata !{i32 786689, metadata !24, metadata !"heap", metadata !5, i32 33554538, metadata !27, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [heap] [line 106]
!317 = metadata !{i32 786689, metadata !24, metadata !"n", metadata !5, i32 50331754, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 106]
!318 = metadata !{i32 786689, metadata !24, metadata !"k", metadata !5, i32 67108970, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [k] [line 106]
!319 = metadata !{i32 786688, metadata !24, metadata !"j", metadata !5, i32 112, metadata !20, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 112]
!320 = metadata !{i32 112, i32 0, metadata !24, null}
!321 = metadata !{i32 114, i32 0, metadata !24, null}
!322 = metadata !{i32 786688, metadata !24, metadata !"v", metadata !5, i32 116, metadata !20, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [v] [line 116]
!323 = metadata !{i32 116, i32 0, metadata !24, null}
!324 = metadata !{i32 118, i32 0, metadata !24, null}
!325 = metadata !{i32 120, i32 0, metadata !326, null}
!326 = metadata !{i32 786443, metadata !1, metadata !24, i32 119, i32 0, i32 59} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!327 = metadata !{i32 122, i32 0, metadata !328, null}
!328 = metadata !{i32 786443, metadata !1, metadata !326, i32 122, i32 0, i32 60} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!329 = metadata !{i32 123, i32 0, metadata !328, null}
!330 = metadata !{i32 125, i32 0, metadata !331, null}
!331 = metadata !{i32 786443, metadata !1, metadata !326, i32 125, i32 0, i32 61} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!332 = metadata !{i32 126, i32 0, metadata !331, null}
!333 = metadata !{i32 128, i32 0, metadata !326, null}
!334 = metadata !{i32 129, i32 0, metadata !326, null}
!335 = metadata !{i32 130, i32 0, metadata !326, null}
!336 = metadata !{i32 132, i32 0, metadata !24, null}
!337 = metadata !{i32 133, i32 0, metadata !24, null}
!338 = metadata !{i32 786689, metadata !17, metadata !"argc", metadata !5, i32 16777650, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 434]
!339 = metadata !{i32 434, i32 0, metadata !17, null}
!340 = metadata !{i32 786689, metadata !17, metadata !"argv", metadata !5, i32 33554866, metadata !21, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 434]
!341 = metadata !{i32 786688, metadata !17, metadata !"i", metadata !5, i32 436, metadata !20, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 436]
!342 = metadata !{i32 436, i32 0, metadata !17, null}
!343 = metadata !{i32 786688, metadata !17, metadata !"ga_testing", metadata !5, i32 439, metadata !344, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ga_testing] [line 439]
!344 = metadata !{i32 786468, null, null, metadata !"_Bool", i32 0, i64 8, i64 8, i64 0, i32 0, i32 2} ; [ DW_TAG_base_type ] [_Bool] [line 0, size 8, align 8, offset 0, enc DW_ATE_boolean]
!345 = metadata !{i32 439, i32 0, metadata !17, null}
!346 = metadata !{i32 441, i32 0, metadata !347, null}
!347 = metadata !{i32 786443, metadata !1, metadata !17, i32 441, i32 0, i32 51} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!348 = metadata !{i32 443, i32 0, metadata !349, null}
!349 = metadata !{i32 786443, metadata !1, metadata !350, i32 443, i32 0, i32 53} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!350 = metadata !{i32 786443, metadata !1, metadata !347, i32 442, i32 0, i32 52} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!351 = metadata !{i32 445, i32 0, metadata !352, null}
!352 = metadata !{i32 786443, metadata !1, metadata !353, i32 445, i32 0, i32 55} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!353 = metadata !{i32 786443, metadata !1, metadata !349, i32 444, i32 0, i32 54} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!354 = metadata !{i32 447, i32 0, metadata !355, null}
!355 = metadata !{i32 786443, metadata !1, metadata !352, i32 446, i32 0, i32 56} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!356 = metadata !{i32 448, i32 0, metadata !355, null}
!357 = metadata !{i32 450, i32 0, metadata !353, null}
!358 = metadata !{i32 451, i32 0, metadata !350, null}
!359 = metadata !{i32 786688, metadata !17, metadata !"test_data", metadata !5, i32 454, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [test_data] [line 454]
!360 = metadata !{i32 454, i32 0, metadata !17, null}
!361 = metadata !{i32 467, i32 0, metadata !362, null}
!362 = metadata !{i32 786443, metadata !1, metadata !17, i32 467, i32 0, i32 57} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!363 = metadata !{i32 468, i32 0, metadata !362, null}
!364 = metadata !{i32 786688, metadata !17, metadata !"run_time", metadata !5, i32 472, metadata !365, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [run_time] [line 472]
!365 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!366 = metadata !{i32 472, i32 0, metadata !17, null}
!367 = metadata !{i32 481, i32 0, metadata !17, null}
!368 = metadata !{i32 484, i32 0, metadata !369, null}
!369 = metadata !{i32 786443, metadata !1, metadata !17, i32 484, i32 0, i32 58} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!370 = metadata !{i32 485, i32 0, metadata !369, null}
!371 = metadata !{i32 487, i32 0, metadata !369, null}
!372 = metadata !{i32 489, i32 0, metadata !17, null}
!373 = metadata !{i32 492, i32 0, metadata !17, null}
!374 = metadata !{i32 786688, metadata !28, metadata !"k", metadata !5, i32 49, metadata !37, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 49]
!375 = metadata !{i32 49, i32 0, metadata !28, null}
!376 = metadata !{i32 786688, metadata !28, metadata !"result", metadata !5, i32 50, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [result] [line 50]
!377 = metadata !{i32 50, i32 0, metadata !28, null}
!378 = metadata !{i32 52, i32 0, metadata !28, null}
!379 = metadata !{i32 53, i32 0, metadata !28, null}
!380 = metadata !{i32 54, i32 0, metadata !28, null}
!381 = metadata !{i32 56, i32 0, metadata !382, null}
!382 = metadata !{i32 786443, metadata !1, metadata !28, i32 56, i32 0, i32 62} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/huffbench.c]
!383 = metadata !{i32 57, i32 0, metadata !382, null}
!384 = metadata !{i32 59, i32 0, metadata !28, null}
!385 = metadata !{i32 60, i32 0, metadata !28, null}
!386 = metadata !{i32 62, i32 0, metadata !28, null}
