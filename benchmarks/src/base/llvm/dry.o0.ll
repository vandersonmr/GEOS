; ModuleID = 'dry.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Record = type { %struct.Record*, i32, i32, i32, [31 x i8] }

@Version = global [4 x i8] c"1.1\00", align 1
@PtrGlbNext = common global %struct.Record* null, align 8
@PtrGlb = common global %struct.Record* null, align 8
@.str = private unnamed_addr constant [31 x i8] c"DHRYSTONE PROGRAM, SOME STRING\00", align 1
@.str1 = private unnamed_addr constant [31 x i8] c"DHRYSTONE PROGRAM, 1'ST STRING\00", align 1
@Array2Glob = common global [51 x [51 x i32]] zeroinitializer, align 16
@.str2 = private unnamed_addr constant [31 x i8] c"DHRYSTONE PROGRAM, 2'ND STRING\00", align 1
@BoolGlob = common global i32 0, align 4
@Array1Glob = common global [51 x i32] zeroinitializer, align 16
@Char2Glob = common global i8 0, align 1
@Char1Glob = common global i8 0, align 1
@IntGlob = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @Proc0(), !dbg !96
  ret i32 0, !dbg !97
}

; Function Attrs: nounwind uwtable
define i32 @Proc0() #0 {
  %1 = alloca i32, align 4
  %IntLoc1 = alloca i32, align 4
  %IntLoc2 = alloca i32, align 4
  %IntLoc3 = alloca i32, align 4
  %CharLoc = alloca i8, align 1
  %CharIndex = alloca i8, align 1
  %EnumLoc = alloca i32, align 4
  %String1Loc = alloca [31 x i8], align 16
  %String2Loc = alloca [31 x i8], align 16
  %i = alloca i32, align 4
  %starttime = alloca i64, align 8
  %benchtime = alloca i64, align 8
  %nulltime = alloca i64, align 8
  call void @llvm.dbg.declare(metadata !{i32* %IntLoc1}, metadata !98), !dbg !99
  call void @llvm.dbg.declare(metadata !{i32* %IntLoc2}, metadata !100), !dbg !101
  call void @llvm.dbg.declare(metadata !{i32* %IntLoc3}, metadata !102), !dbg !103
  call void @llvm.dbg.declare(metadata !{i8* %CharLoc}, metadata !104), !dbg !105
  call void @llvm.dbg.declare(metadata !{i8* %CharIndex}, metadata !106), !dbg !107
  call void @llvm.dbg.declare(metadata !{i32* %EnumLoc}, metadata !108), !dbg !109
  call void @llvm.dbg.declare(metadata !{[31 x i8]* %String1Loc}, metadata !110), !dbg !111
  call void @llvm.dbg.declare(metadata !{[31 x i8]* %String2Loc}, metadata !112), !dbg !113
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !114), !dbg !116
  call void @llvm.dbg.declare(metadata !{i64* %starttime}, metadata !117), !dbg !119
  call void @llvm.dbg.declare(metadata !{i64* %benchtime}, metadata !120), !dbg !121
  call void @llvm.dbg.declare(metadata !{i64* %nulltime}, metadata !122), !dbg !123
  %2 = call i32 (...)* @clock(), !dbg !124
  %3 = sext i32 %2 to i64, !dbg !124
  store i64 %3, i64* %starttime, align 8, !dbg !124
  store i32 0, i32* %i, align 4, !dbg !125
  br label %4, !dbg !125

; <label>:4                                       ; preds = %8, %0
  %5 = load i32* %i, align 4, !dbg !125
  %6 = icmp ult i32 %5, 100000000, !dbg !125
  br i1 %6, label %7, label %11, !dbg !125

; <label>:7                                       ; preds = %4
  br label %8, !dbg !125

; <label>:8                                       ; preds = %7
  %9 = load i32* %i, align 4, !dbg !125
  %10 = add i32 %9, 1, !dbg !125
  store i32 %10, i32* %i, align 4, !dbg !125
  br label %4, !dbg !125

; <label>:11                                      ; preds = %4
  %12 = call i32 (...)* @clock(), !dbg !127
  %13 = sext i32 %12 to i64, !dbg !127
  %14 = load i64* %starttime, align 8, !dbg !127
  %15 = sub nsw i64 %13, %14, !dbg !127
  store i64 %15, i64* %nulltime, align 8, !dbg !127
  %16 = call noalias i8* @malloc(i64 56) #5, !dbg !128
  %17 = bitcast i8* %16 to %struct.Record*, !dbg !128
  store %struct.Record* %17, %struct.Record** @PtrGlbNext, align 8, !dbg !128
  %18 = call noalias i8* @malloc(i64 56) #5, !dbg !129
  %19 = bitcast i8* %18 to %struct.Record*, !dbg !129
  store %struct.Record* %19, %struct.Record** @PtrGlb, align 8, !dbg !129
  %20 = load %struct.Record** @PtrGlbNext, align 8, !dbg !130
  %21 = load %struct.Record** @PtrGlb, align 8, !dbg !130
  %22 = getelementptr inbounds %struct.Record* %21, i32 0, i32 0, !dbg !130
  store %struct.Record* %20, %struct.Record** %22, align 8, !dbg !130
  %23 = load %struct.Record** @PtrGlb, align 8, !dbg !131
  %24 = getelementptr inbounds %struct.Record* %23, i32 0, i32 1, !dbg !131
  store i32 0, i32* %24, align 4, !dbg !131
  %25 = load %struct.Record** @PtrGlb, align 8, !dbg !132
  %26 = getelementptr inbounds %struct.Record* %25, i32 0, i32 2, !dbg !132
  store i32 10001, i32* %26, align 4, !dbg !132
  %27 = load %struct.Record** @PtrGlb, align 8, !dbg !133
  %28 = getelementptr inbounds %struct.Record* %27, i32 0, i32 3, !dbg !133
  store i32 40, i32* %28, align 4, !dbg !133
  %29 = load %struct.Record** @PtrGlb, align 8, !dbg !134
  %30 = getelementptr inbounds %struct.Record* %29, i32 0, i32 4, !dbg !134
  %31 = getelementptr inbounds [31 x i8]* %30, i32 0, i32 0, !dbg !134
  %32 = call i8* @strcpy(i8* %31, i8* getelementptr inbounds ([31 x i8]* @.str, i32 0, i32 0)) #5, !dbg !134
  %33 = getelementptr inbounds [31 x i8]* %String1Loc, i32 0, i32 0, !dbg !135
  %34 = call i8* @strcpy(i8* %33, i8* getelementptr inbounds ([31 x i8]* @.str1, i32 0, i32 0)) #5, !dbg !135
  store i32 10, i32* getelementptr inbounds ([51 x [51 x i32]]* @Array2Glob, i32 0, i64 8, i64 7), align 4, !dbg !136
  %35 = call i32 (...)* @clock(), !dbg !137
  %36 = sext i32 %35 to i64, !dbg !137
  store i64 %36, i64* %starttime, align 8, !dbg !137
  store i32 0, i32* %i, align 4, !dbg !138
  br label %37, !dbg !138

; <label>:37                                      ; preds = %103, %11
  %38 = load i32* %i, align 4, !dbg !138
  %39 = icmp ult i32 %38, 100000000, !dbg !138
  br i1 %39, label %40, label %106, !dbg !138

; <label>:40                                      ; preds = %37
  %41 = call i32 @Proc5(), !dbg !140
  %42 = call i32 @Proc4(), !dbg !142
  store i32 2, i32* %IntLoc1, align 4, !dbg !143
  store i32 3, i32* %IntLoc2, align 4, !dbg !144
  %43 = getelementptr inbounds [31 x i8]* %String2Loc, i32 0, i32 0, !dbg !145
  %44 = call i8* @strcpy(i8* %43, i8* getelementptr inbounds ([31 x i8]* @.str2, i32 0, i32 0)) #5, !dbg !145
  store i32 10000, i32* %EnumLoc, align 4, !dbg !146
  %45 = getelementptr inbounds [31 x i8]* %String1Loc, i32 0, i32 0, !dbg !147
  %46 = getelementptr inbounds [31 x i8]* %String2Loc, i32 0, i32 0, !dbg !147
  %47 = call i32 @Func2(i8* %45, i8* %46), !dbg !147
  %48 = icmp ne i32 %47, 0, !dbg !147
  %49 = xor i1 %48, true, !dbg !147
  %50 = zext i1 %49 to i32, !dbg !147
  store i32 %50, i32* @BoolGlob, align 4, !dbg !147
  br label %51, !dbg !148

; <label>:51                                      ; preds = %55, %40
  %52 = load i32* %IntLoc1, align 4, !dbg !148
  %53 = load i32* %IntLoc2, align 4, !dbg !148
  %54 = icmp slt i32 %52, %53, !dbg !148
  br i1 %54, label %55, label %65, !dbg !148

; <label>:55                                      ; preds = %51
  %56 = load i32* %IntLoc1, align 4, !dbg !149
  %57 = mul nsw i32 5, %56, !dbg !149
  %58 = load i32* %IntLoc2, align 4, !dbg !149
  %59 = sub nsw i32 %57, %58, !dbg !149
  store i32 %59, i32* %IntLoc3, align 4, !dbg !149
  %60 = load i32* %IntLoc1, align 4, !dbg !151
  %61 = load i32* %IntLoc2, align 4, !dbg !151
  %62 = call i32 @Proc7(i32 %60, i32 %61, i32* %IntLoc3), !dbg !151
  %63 = load i32* %IntLoc1, align 4, !dbg !152
  %64 = add nsw i32 %63, 1, !dbg !152
  store i32 %64, i32* %IntLoc1, align 4, !dbg !152
  br label %51, !dbg !153

; <label>:65                                      ; preds = %51
  %66 = load i32* %IntLoc1, align 4, !dbg !154
  %67 = load i32* %IntLoc3, align 4, !dbg !154
  %68 = call i32 @Proc8(i32* getelementptr inbounds ([51 x i32]* @Array1Glob, i32 0, i32 0), [51 x i32]* getelementptr inbounds ([51 x [51 x i32]]* @Array2Glob, i32 0, i32 0), i32 %66, i32 %67), !dbg !154
  %69 = load %struct.Record** @PtrGlb, align 8, !dbg !155
  %70 = call i32 @Proc1(%struct.Record* %69), !dbg !155
  store i8 65, i8* %CharIndex, align 1, !dbg !156
  br label %71, !dbg !156

; <label>:71                                      ; preds = %86, %65
  %72 = load i8* %CharIndex, align 1, !dbg !156
  %73 = sext i8 %72 to i32, !dbg !156
  %74 = load i8* @Char2Glob, align 1, !dbg !156
  %75 = sext i8 %74 to i32, !dbg !156
  %76 = icmp sle i32 %73, %75, !dbg !156
  br i1 %76, label %77, label %89, !dbg !156

; <label>:77                                      ; preds = %71
  %78 = load i32* %EnumLoc, align 4, !dbg !158
  %79 = load i8* %CharIndex, align 1, !dbg !158
  %80 = sext i8 %79 to i32, !dbg !158
  %81 = call i32 @Func1(i32 %80, i32 67), !dbg !158
  %82 = icmp eq i32 %78, %81, !dbg !158
  br i1 %82, label %83, label %85, !dbg !158

; <label>:83                                      ; preds = %77
  %84 = call i32 @Proc6(i32 0, i32* %EnumLoc), !dbg !160
  br label %85, !dbg !160

; <label>:85                                      ; preds = %83, %77
  br label %86, !dbg !160

; <label>:86                                      ; preds = %85
  %87 = load i8* %CharIndex, align 1, !dbg !156
  %88 = add i8 %87, 1, !dbg !156
  store i8 %88, i8* %CharIndex, align 1, !dbg !156
  br label %71, !dbg !156

; <label>:89                                      ; preds = %71
  %90 = load i32* %IntLoc2, align 4, !dbg !161
  %91 = load i32* %IntLoc1, align 4, !dbg !161
  %92 = mul nsw i32 %90, %91, !dbg !161
  store i32 %92, i32* %IntLoc3, align 4, !dbg !161
  %93 = load i32* %IntLoc3, align 4, !dbg !162
  %94 = load i32* %IntLoc1, align 4, !dbg !162
  %95 = sdiv i32 %93, %94, !dbg !162
  store i32 %95, i32* %IntLoc2, align 4, !dbg !162
  %96 = load i32* %IntLoc3, align 4, !dbg !163
  %97 = load i32* %IntLoc2, align 4, !dbg !163
  %98 = sub nsw i32 %96, %97, !dbg !163
  %99 = mul nsw i32 7, %98, !dbg !163
  %100 = load i32* %IntLoc1, align 4, !dbg !163
  %101 = sub nsw i32 %99, %100, !dbg !163
  store i32 %101, i32* %IntLoc2, align 4, !dbg !163
  %102 = call i32 @Proc2(i32* %IntLoc1), !dbg !164
  br label %103, !dbg !165

; <label>:103                                     ; preds = %89
  %104 = load i32* %i, align 4, !dbg !138
  %105 = add i32 %104, 1, !dbg !138
  store i32 %105, i32* %i, align 4, !dbg !138
  br label %37, !dbg !138

; <label>:106                                     ; preds = %37
  %107 = load i32* %1, !dbg !166
  ret i32 %107, !dbg !166
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

declare i32 @clock(...) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #3

; Function Attrs: nounwind
declare i8* @strcpy(i8*, i8*) #3

; Function Attrs: nounwind uwtable
define i32 @Proc1(%struct.Record* %PtrParIn) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.Record*, align 8
  store %struct.Record* %PtrParIn, %struct.Record** %2, align 8
  call void @llvm.dbg.declare(metadata !{%struct.Record** %2}, metadata !167), !dbg !168
  %3 = load %struct.Record** %2, align 8, !dbg !169
  %4 = getelementptr inbounds %struct.Record* %3, i32 0, i32 3, !dbg !169
  store i32 5, i32* %4, align 4, !dbg !169
  %5 = load %struct.Record** %2, align 8, !dbg !170
  %6 = getelementptr inbounds %struct.Record* %5, i32 0, i32 3, !dbg !170
  %7 = load i32* %6, align 4, !dbg !170
  %8 = load %struct.Record** %2, align 8, !dbg !170
  %9 = getelementptr inbounds %struct.Record* %8, i32 0, i32 0, !dbg !170
  %10 = load %struct.Record** %9, align 8, !dbg !170
  %11 = getelementptr inbounds %struct.Record* %10, i32 0, i32 3, !dbg !170
  store i32 %7, i32* %11, align 4, !dbg !170
  %12 = load %struct.Record** %2, align 8, !dbg !171
  %13 = getelementptr inbounds %struct.Record* %12, i32 0, i32 0, !dbg !171
  %14 = load %struct.Record** %13, align 8, !dbg !171
  %15 = load %struct.Record** %2, align 8, !dbg !171
  %16 = getelementptr inbounds %struct.Record* %15, i32 0, i32 0, !dbg !171
  %17 = load %struct.Record** %16, align 8, !dbg !171
  %18 = getelementptr inbounds %struct.Record* %17, i32 0, i32 0, !dbg !171
  store %struct.Record* %14, %struct.Record** %18, align 8, !dbg !171
  %19 = load i32* %1, !dbg !172
  ret i32 %19, !dbg !172
}

; Function Attrs: nounwind uwtable
define i32 @Proc2(i32* %IntParIO) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32*, align 8
  %IntLoc = alloca i32, align 4
  %EnumLoc = alloca i32, align 4
  store i32* %IntParIO, i32** %2, align 8
  call void @llvm.dbg.declare(metadata !{i32** %2}, metadata !173), !dbg !174
  call void @llvm.dbg.declare(metadata !{i32* %IntLoc}, metadata !175), !dbg !176
  call void @llvm.dbg.declare(metadata !{i32* %EnumLoc}, metadata !177), !dbg !178
  %3 = load i32** %2, align 8, !dbg !179
  %4 = load i32* %3, align 4, !dbg !179
  %5 = add nsw i32 %4, 10, !dbg !179
  store i32 %5, i32* %IntLoc, align 4, !dbg !179
  br label %6, !dbg !180

; <label>:6                                       ; preds = %21, %0
  %7 = load i8* @Char1Glob, align 1, !dbg !182
  %8 = sext i8 %7 to i32, !dbg !182
  %9 = icmp eq i32 %8, 65, !dbg !182
  br i1 %9, label %10, label %17, !dbg !182

; <label>:10                                      ; preds = %6
  %11 = load i32* %IntLoc, align 4, !dbg !185
  %12 = add nsw i32 %11, -1, !dbg !185
  store i32 %12, i32* %IntLoc, align 4, !dbg !185
  %13 = load i32* %IntLoc, align 4, !dbg !187
  %14 = load i32* @IntGlob, align 4, !dbg !187
  %15 = sub nsw i32 %13, %14, !dbg !187
  %16 = load i32** %2, align 8, !dbg !187
  store i32 %15, i32* %16, align 4, !dbg !187
  store i32 0, i32* %EnumLoc, align 4, !dbg !188
  br label %17, !dbg !189

; <label>:17                                      ; preds = %10, %6
  %18 = load i32* %EnumLoc, align 4, !dbg !190
  %19 = icmp eq i32 %18, 0, !dbg !190
  br i1 %19, label %20, label %21, !dbg !190

; <label>:20                                      ; preds = %17
  br label %22, !dbg !192

; <label>:21                                      ; preds = %17
  br label %6, !dbg !193

; <label>:22                                      ; preds = %20
  %23 = load i32* %1, !dbg !194
  ret i32 %23, !dbg !194
}

; Function Attrs: nounwind uwtable
define i32 @Proc3(%struct.Record** %PtrParOut) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.Record**, align 8
  store %struct.Record** %PtrParOut, %struct.Record*** %2, align 8
  call void @llvm.dbg.declare(metadata !{%struct.Record*** %2}, metadata !195), !dbg !196
  %3 = load %struct.Record** @PtrGlb, align 8, !dbg !197
  %4 = icmp ne %struct.Record* %3, null, !dbg !197
  br i1 %4, label %5, label %10, !dbg !197

; <label>:5                                       ; preds = %0
  %6 = load %struct.Record** @PtrGlb, align 8, !dbg !199
  %7 = getelementptr inbounds %struct.Record* %6, i32 0, i32 0, !dbg !199
  %8 = load %struct.Record** %7, align 8, !dbg !199
  %9 = load %struct.Record*** %2, align 8, !dbg !199
  store %struct.Record* %8, %struct.Record** %9, align 8, !dbg !199
  br label %11, !dbg !199

; <label>:10                                      ; preds = %0
  store i32 100, i32* @IntGlob, align 4, !dbg !200
  br label %11

; <label>:11                                      ; preds = %10, %5
  %12 = load i32* @IntGlob, align 4, !dbg !201
  %13 = load %struct.Record** @PtrGlb, align 8, !dbg !201
  %14 = getelementptr inbounds %struct.Record* %13, i32 0, i32 3, !dbg !201
  %15 = call i32 @Proc7(i32 10, i32 %12, i32* %14), !dbg !201
  %16 = load i32* %1, !dbg !202
  ret i32 %16, !dbg !202
}

; Function Attrs: nounwind uwtable
define i32 @Proc4() #0 {
  %1 = alloca i32, align 4
  %BoolLoc = alloca i32, align 4
  call void @llvm.dbg.declare(metadata !{i32* %BoolLoc}, metadata !203), !dbg !204
  %2 = load i8* @Char1Glob, align 1, !dbg !205
  %3 = sext i8 %2 to i32, !dbg !205
  %4 = icmp eq i32 %3, 65, !dbg !205
  %5 = zext i1 %4 to i32, !dbg !205
  store i32 %5, i32* %BoolLoc, align 4, !dbg !205
  %6 = load i32* @BoolGlob, align 4, !dbg !206
  %7 = load i32* %BoolLoc, align 4, !dbg !206
  %8 = or i32 %7, %6, !dbg !206
  store i32 %8, i32* %BoolLoc, align 4, !dbg !206
  store i8 66, i8* @Char2Glob, align 1, !dbg !207
  %9 = load i32* %1, !dbg !208
  ret i32 %9, !dbg !208
}

; Function Attrs: nounwind uwtable
define i32 @Proc5() #0 {
  %1 = alloca i32, align 4
  store i8 65, i8* @Char1Glob, align 1, !dbg !209
  store i32 0, i32* @BoolGlob, align 4, !dbg !210
  %2 = load i32* %1, !dbg !211
  ret i32 %2, !dbg !211
}

; Function Attrs: nounwind uwtable
define i32 @Proc6(i32 %EnumParIn, i32* %EnumParOut) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32*, align 8
  store i32 %EnumParIn, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !212), !dbg !213
  store i32* %EnumParOut, i32** %3, align 8
  call void @llvm.dbg.declare(metadata !{i32** %3}, metadata !214), !dbg !215
  %4 = load i32* %2, align 4, !dbg !216
  %5 = load i32** %3, align 8, !dbg !216
  store i32 %4, i32* %5, align 4, !dbg !216
  %6 = load i32* %2, align 4, !dbg !217
  %7 = call i32 @Func3(i32 %6), !dbg !217
  %8 = icmp ne i32 %7, 0, !dbg !217
  br i1 %8, label %11, label %9, !dbg !217

; <label>:9                                       ; preds = %0
  %10 = load i32** %3, align 8, !dbg !219
  store i32 10002, i32* %10, align 4, !dbg !219
  br label %11, !dbg !219

; <label>:11                                      ; preds = %9, %0
  %12 = load i32* %2, align 4, !dbg !220
  switch i32 %12, label %28 [
    i32 0, label %13
    i32 10000, label %15
    i32 10001, label %23
    i32 10002, label %25
    i32 10003, label %26
  ], !dbg !220

; <label>:13                                      ; preds = %11
  %14 = load i32** %3, align 8, !dbg !221
  store i32 0, i32* %14, align 4, !dbg !221
  br label %28, !dbg !221

; <label>:15                                      ; preds = %11
  %16 = load i32* @IntGlob, align 4, !dbg !223
  %17 = icmp sgt i32 %16, 100, !dbg !223
  br i1 %17, label %18, label %20, !dbg !223

; <label>:18                                      ; preds = %15
  %19 = load i32** %3, align 8, !dbg !223
  store i32 0, i32* %19, align 4, !dbg !223
  br label %22, !dbg !223

; <label>:20                                      ; preds = %15
  %21 = load i32** %3, align 8, !dbg !225
  store i32 10002, i32* %21, align 4, !dbg !225
  br label %22

; <label>:22                                      ; preds = %20, %18
  br label %28, !dbg !226

; <label>:23                                      ; preds = %11
  %24 = load i32** %3, align 8, !dbg !227
  store i32 10000, i32* %24, align 4, !dbg !227
  br label %28, !dbg !227

; <label>:25                                      ; preds = %11
  br label %28, !dbg !228

; <label>:26                                      ; preds = %11
  %27 = load i32** %3, align 8, !dbg !229
  store i32 10001, i32* %27, align 4, !dbg !229
  br label %28, !dbg !230

; <label>:28                                      ; preds = %26, %11, %25, %23, %22, %13
  %29 = load i32* %1, !dbg !231
  ret i32 %29, !dbg !231
}

; Function Attrs: nounwind uwtable
define i32 @Proc7(i32 %IntParI1, i32 %IntParI2, i32* %IntParOut) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32*, align 8
  %IntLoc = alloca i32, align 4
  store i32 %IntParI1, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !232), !dbg !233
  store i32 %IntParI2, i32* %3, align 4
  call void @llvm.dbg.declare(metadata !{i32* %3}, metadata !234), !dbg !235
  store i32* %IntParOut, i32** %4, align 8
  call void @llvm.dbg.declare(metadata !{i32** %4}, metadata !236), !dbg !237
  call void @llvm.dbg.declare(metadata !{i32* %IntLoc}, metadata !238), !dbg !239
  %5 = load i32* %2, align 4, !dbg !240
  %6 = add nsw i32 %5, 2, !dbg !240
  store i32 %6, i32* %IntLoc, align 4, !dbg !240
  %7 = load i32* %3, align 4, !dbg !241
  %8 = load i32* %IntLoc, align 4, !dbg !241
  %9 = add nsw i32 %7, %8, !dbg !241
  %10 = load i32** %4, align 8, !dbg !241
  store i32 %9, i32* %10, align 4, !dbg !241
  %11 = load i32* %1, !dbg !242
  ret i32 %11, !dbg !242
}

; Function Attrs: nounwind uwtable
define i32 @Proc8(i32* %Array1Par, [51 x i32]* %Array2Par, i32 %IntParI1, i32 %IntParI2) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32*, align 8
  %3 = alloca [51 x i32]*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %IntLoc = alloca i32, align 4
  %IntIndex = alloca i32, align 4
  store i32* %Array1Par, i32** %2, align 8
  call void @llvm.dbg.declare(metadata !{i32** %2}, metadata !243), !dbg !244
  store [51 x i32]* %Array2Par, [51 x i32]** %3, align 8
  call void @llvm.dbg.declare(metadata !{[51 x i32]** %3}, metadata !245), !dbg !246
  store i32 %IntParI1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata !{i32* %4}, metadata !247), !dbg !248
  store i32 %IntParI2, i32* %5, align 4
  call void @llvm.dbg.declare(metadata !{i32* %5}, metadata !249), !dbg !250
  call void @llvm.dbg.declare(metadata !{i32* %IntLoc}, metadata !251), !dbg !252
  call void @llvm.dbg.declare(metadata !{i32* %IntIndex}, metadata !253), !dbg !254
  %6 = load i32* %4, align 4, !dbg !255
  %7 = add nsw i32 %6, 5, !dbg !255
  store i32 %7, i32* %IntLoc, align 4, !dbg !255
  %8 = load i32* %5, align 4, !dbg !256
  %9 = load i32* %IntLoc, align 4, !dbg !256
  %10 = sext i32 %9 to i64, !dbg !256
  %11 = load i32** %2, align 8, !dbg !256
  %12 = getelementptr inbounds i32* %11, i64 %10, !dbg !256
  store i32 %8, i32* %12, align 4, !dbg !256
  %13 = load i32* %IntLoc, align 4, !dbg !257
  %14 = sext i32 %13 to i64, !dbg !257
  %15 = load i32** %2, align 8, !dbg !257
  %16 = getelementptr inbounds i32* %15, i64 %14, !dbg !257
  %17 = load i32* %16, align 4, !dbg !257
  %18 = load i32* %IntLoc, align 4, !dbg !257
  %19 = add nsw i32 %18, 1, !dbg !257
  %20 = sext i32 %19 to i64, !dbg !257
  %21 = load i32** %2, align 8, !dbg !257
  %22 = getelementptr inbounds i32* %21, i64 %20, !dbg !257
  store i32 %17, i32* %22, align 4, !dbg !257
  %23 = load i32* %IntLoc, align 4, !dbg !258
  %24 = load i32* %IntLoc, align 4, !dbg !258
  %25 = add nsw i32 %24, 30, !dbg !258
  %26 = sext i32 %25 to i64, !dbg !258
  %27 = load i32** %2, align 8, !dbg !258
  %28 = getelementptr inbounds i32* %27, i64 %26, !dbg !258
  store i32 %23, i32* %28, align 4, !dbg !258
  %29 = load i32* %IntLoc, align 4, !dbg !259
  store i32 %29, i32* %IntIndex, align 4, !dbg !259
  br label %30, !dbg !259

; <label>:30                                      ; preds = %44, %0
  %31 = load i32* %IntIndex, align 4, !dbg !259
  %32 = load i32* %IntLoc, align 4, !dbg !259
  %33 = add nsw i32 %32, 1, !dbg !259
  %34 = icmp sle i32 %31, %33, !dbg !259
  br i1 %34, label %35, label %47, !dbg !259

; <label>:35                                      ; preds = %30
  %36 = load i32* %IntLoc, align 4, !dbg !261
  %37 = load i32* %IntIndex, align 4, !dbg !261
  %38 = sext i32 %37 to i64, !dbg !261
  %39 = load i32* %IntLoc, align 4, !dbg !261
  %40 = sext i32 %39 to i64, !dbg !261
  %41 = load [51 x i32]** %3, align 8, !dbg !261
  %42 = getelementptr inbounds [51 x i32]* %41, i64 %40, !dbg !261
  %43 = getelementptr inbounds [51 x i32]* %42, i32 0, i64 %38, !dbg !261
  store i32 %36, i32* %43, align 4, !dbg !261
  br label %44, !dbg !261

; <label>:44                                      ; preds = %35
  %45 = load i32* %IntIndex, align 4, !dbg !259
  %46 = add nsw i32 %45, 1, !dbg !259
  store i32 %46, i32* %IntIndex, align 4, !dbg !259
  br label %30, !dbg !259

; <label>:47                                      ; preds = %30
  %48 = load i32* %IntLoc, align 4, !dbg !262
  %49 = sub nsw i32 %48, 1, !dbg !262
  %50 = sext i32 %49 to i64, !dbg !262
  %51 = load i32* %IntLoc, align 4, !dbg !262
  %52 = sext i32 %51 to i64, !dbg !262
  %53 = load [51 x i32]** %3, align 8, !dbg !262
  %54 = getelementptr inbounds [51 x i32]* %53, i64 %52, !dbg !262
  %55 = getelementptr inbounds [51 x i32]* %54, i32 0, i64 %50, !dbg !262
  %56 = load i32* %55, align 4, !dbg !262
  %57 = add nsw i32 %56, 1, !dbg !262
  store i32 %57, i32* %55, align 4, !dbg !262
  %58 = load i32* %IntLoc, align 4, !dbg !263
  %59 = sext i32 %58 to i64, !dbg !263
  %60 = load i32** %2, align 8, !dbg !263
  %61 = getelementptr inbounds i32* %60, i64 %59, !dbg !263
  %62 = load i32* %61, align 4, !dbg !263
  %63 = load i32* %IntLoc, align 4, !dbg !263
  %64 = sext i32 %63 to i64, !dbg !263
  %65 = load i32* %IntLoc, align 4, !dbg !263
  %66 = add nsw i32 %65, 20, !dbg !263
  %67 = sext i32 %66 to i64, !dbg !263
  %68 = load [51 x i32]** %3, align 8, !dbg !263
  %69 = getelementptr inbounds [51 x i32]* %68, i64 %67, !dbg !263
  %70 = getelementptr inbounds [51 x i32]* %69, i32 0, i64 %64, !dbg !263
  store i32 %62, i32* %70, align 4, !dbg !263
  store i32 5, i32* @IntGlob, align 4, !dbg !264
  %71 = load i32* %1, !dbg !265
  ret i32 %71, !dbg !265
}

; Function Attrs: nounwind uwtable
define i32 @Func1(i32, i32) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8, align 1
  %5 = alloca i8, align 1
  %CharLoc1 = alloca i8, align 1
  %CharLoc2 = alloca i8, align 1
  %CharPar1 = trunc i32 %0 to i8
  %CharPar2 = trunc i32 %1 to i8
  store i8 %CharPar1, i8* %4, align 1
  call void @llvm.dbg.declare(metadata !{i8* %4}, metadata !266), !dbg !267
  store i8 %CharPar2, i8* %5, align 1
  call void @llvm.dbg.declare(metadata !{i8* %5}, metadata !268), !dbg !269
  call void @llvm.dbg.declare(metadata !{i8* %CharLoc1}, metadata !270), !dbg !271
  call void @llvm.dbg.declare(metadata !{i8* %CharLoc2}, metadata !272), !dbg !273
  %6 = load i8* %4, align 1, !dbg !274
  store i8 %6, i8* %CharLoc1, align 1, !dbg !274
  %7 = load i8* %CharLoc1, align 1, !dbg !275
  store i8 %7, i8* %CharLoc2, align 1, !dbg !275
  %8 = load i8* %CharLoc2, align 1, !dbg !276
  %9 = sext i8 %8 to i32, !dbg !276
  %10 = load i8* %5, align 1, !dbg !276
  %11 = sext i8 %10 to i32, !dbg !276
  %12 = icmp ne i32 %9, %11, !dbg !276
  br i1 %12, label %13, label %14, !dbg !276

; <label>:13                                      ; preds = %2
  store i32 0, i32* %3, !dbg !278
  br label %15, !dbg !278

; <label>:14                                      ; preds = %2
  store i32 10000, i32* %3, !dbg !279
  br label %15, !dbg !279

; <label>:15                                      ; preds = %14, %13
  %16 = load i32* %3, !dbg !280
  ret i32 %16, !dbg !280
}

; Function Attrs: nounwind uwtable
define i32 @Func2(i8* %StrParI1, i8* %StrParI2) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %IntLoc = alloca i32, align 4
  %CharLoc = alloca i8, align 1
  store i8* %StrParI1, i8** %2, align 8
  call void @llvm.dbg.declare(metadata !{i8** %2}, metadata !281), !dbg !282
  store i8* %StrParI2, i8** %3, align 8
  call void @llvm.dbg.declare(metadata !{i8** %3}, metadata !283), !dbg !284
  call void @llvm.dbg.declare(metadata !{i32* %IntLoc}, metadata !285), !dbg !287
  call void @llvm.dbg.declare(metadata !{i8* %CharLoc}, metadata !288), !dbg !289
  store i32 1, i32* %IntLoc, align 4, !dbg !290
  br label %4, !dbg !291

; <label>:4                                       ; preds = %26, %0
  %5 = load i32* %IntLoc, align 4, !dbg !291
  %6 = icmp sle i32 %5, 1, !dbg !291
  br i1 %6, label %7, label %27, !dbg !291

; <label>:7                                       ; preds = %4
  %8 = load i32* %IntLoc, align 4, !dbg !292
  %9 = sext i32 %8 to i64, !dbg !292
  %10 = load i8** %2, align 8, !dbg !292
  %11 = getelementptr inbounds i8* %10, i64 %9, !dbg !292
  %12 = load i8* %11, align 1, !dbg !292
  %13 = sext i8 %12 to i32, !dbg !292
  %14 = load i32* %IntLoc, align 4, !dbg !292
  %15 = add nsw i32 %14, 1, !dbg !292
  %16 = sext i32 %15 to i64, !dbg !292
  %17 = load i8** %3, align 8, !dbg !292
  %18 = getelementptr inbounds i8* %17, i64 %16, !dbg !292
  %19 = load i8* %18, align 1, !dbg !292
  %20 = sext i8 %19 to i32, !dbg !292
  %21 = call i32 @Func1(i32 %13, i32 %20), !dbg !292
  %22 = icmp eq i32 %21, 0, !dbg !292
  br i1 %22, label %23, label %26, !dbg !292

; <label>:23                                      ; preds = %7
  store i8 65, i8* %CharLoc, align 1, !dbg !294
  %24 = load i32* %IntLoc, align 4, !dbg !296
  %25 = add nsw i32 %24, 1, !dbg !296
  store i32 %25, i32* %IntLoc, align 4, !dbg !296
  br label %26, !dbg !297

; <label>:26                                      ; preds = %23, %7
  br label %4, !dbg !298

; <label>:27                                      ; preds = %4
  %28 = load i8* %CharLoc, align 1, !dbg !299
  %29 = sext i8 %28 to i32, !dbg !299
  %30 = icmp sge i32 %29, 87, !dbg !299
  br i1 %30, label %31, label %36, !dbg !299

; <label>:31                                      ; preds = %27
  %32 = load i8* %CharLoc, align 1, !dbg !299
  %33 = sext i8 %32 to i32, !dbg !299
  %34 = icmp sle i32 %33, 90, !dbg !299
  br i1 %34, label %35, label %36, !dbg !299

; <label>:35                                      ; preds = %31
  store i32 7, i32* %IntLoc, align 4, !dbg !301
  br label %36, !dbg !301

; <label>:36                                      ; preds = %35, %31, %27
  %37 = load i8* %CharLoc, align 1, !dbg !302
  %38 = sext i8 %37 to i32, !dbg !302
  %39 = icmp eq i32 %38, 88, !dbg !302
  br i1 %39, label %40, label %41, !dbg !302

; <label>:40                                      ; preds = %36
  store i32 1, i32* %1, !dbg !304
  br label %50, !dbg !304

; <label>:41                                      ; preds = %36
  %42 = load i8** %2, align 8, !dbg !305
  %43 = load i8** %3, align 8, !dbg !305
  %44 = call i32 @strcmp(i8* %42, i8* %43) #6, !dbg !305
  %45 = icmp sgt i32 %44, 0, !dbg !305
  br i1 %45, label %46, label %49, !dbg !305

; <label>:46                                      ; preds = %41
  %47 = load i32* %IntLoc, align 4, !dbg !308
  %48 = add nsw i32 %47, 7, !dbg !308
  store i32 %48, i32* %IntLoc, align 4, !dbg !308
  store i32 1, i32* %1, !dbg !310
  br label %50, !dbg !310

; <label>:49                                      ; preds = %41
  store i32 0, i32* %1, !dbg !311
  br label %50, !dbg !311

; <label>:50                                      ; preds = %49, %46, %40
  %51 = load i32* %1, !dbg !312
  ret i32 %51, !dbg !312
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #4

; Function Attrs: nounwind uwtable
define i32 @Func3(i32 %EnumParIn) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %EnumLoc = alloca i32, align 4
  store i32 %EnumParIn, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !313), !dbg !314
  call void @llvm.dbg.declare(metadata !{i32* %EnumLoc}, metadata !315), !dbg !316
  %3 = load i32* %2, align 4, !dbg !317
  store i32 %3, i32* %EnumLoc, align 4, !dbg !317
  %4 = load i32* %EnumLoc, align 4, !dbg !318
  %5 = icmp eq i32 %4, 10001, !dbg !318
  br i1 %5, label %6, label %7, !dbg !318

; <label>:6                                       ; preds = %0
  store i32 1, i32* %1, !dbg !318
  br label %8, !dbg !318

; <label>:7                                       ; preds = %0
  store i32 0, i32* %1, !dbg !320
  br label %8, !dbg !320

; <label>:8                                       ; preds = %7, %6
  %9 = load i32* %1, !dbg !321
  ret i32 %9, !dbg !321
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!93, !94}
!llvm.ident = !{!95}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 false, metadata !"", i32 0, metadata !2, metadata !10, metadata !11, metadata !76, metadata !10, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dry.c] [DW_LANG_C99]
!1 = metadata !{metadata !"dry.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{metadata !3}
!3 = metadata !{i32 786436, metadata !1, null, metadata !"", i32 133, i64 32, i64 32, i32 0, i32 0, null, metadata !4, i32 0, null, null, null} ; [ DW_TAG_enumeration_type ] [line 133, size 32, align 32, offset 0] [def] [from ]
!4 = metadata !{metadata !5, metadata !6, metadata !7, metadata !8, metadata !9}
!5 = metadata !{i32 786472, metadata !"Ident1", i64 0} ; [ DW_TAG_enumerator ] [Ident1 :: 0]
!6 = metadata !{i32 786472, metadata !"Ident2", i64 10000} ; [ DW_TAG_enumerator ] [Ident2 :: 10000]
!7 = metadata !{i32 786472, metadata !"Ident3", i64 10001} ; [ DW_TAG_enumerator ] [Ident3 :: 10001]
!8 = metadata !{i32 786472, metadata !"Ident4", i64 10002} ; [ DW_TAG_enumerator ] [Ident4 :: 10002]
!9 = metadata !{i32 786472, metadata !"Ident5", i64 10003} ; [ DW_TAG_enumerator ] [Ident5 :: 10003]
!10 = metadata !{}
!11 = metadata !{metadata !12, metadata !17, metadata !18, metadata !39, metadata !43, metadata !47, metadata !48, metadata !49, metadata !53, metadata !56, metadata !64, metadata !68, metadata !73}
!12 = metadata !{i32 786478, metadata !1, metadata !13, metadata !"main", metadata !"main", metadata !"", i32 173, metadata !14, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !10, i32 174} ; [ DW_TAG_subprogram ] [line 173] [def] [scope 174] [main]
!13 = metadata !{i32 786473, metadata !1}         ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dry.c]
!14 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !15, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!15 = metadata !{metadata !16}
!16 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!17 = metadata !{i32 786478, metadata !1, metadata !13, metadata !"Proc0", metadata !"Proc0", metadata !"", i32 191, metadata !14, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @Proc0, null, null, metadata !10, i32 192} ; [ DW_TAG_subprogram ] [line 191] [def] [scope 192] [Proc0]
!18 = metadata !{i32 786478, metadata !1, metadata !13, metadata !"Proc1", metadata !"Proc1", metadata !"", i32 318, metadata !19, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 (%struct.Record*)* @Proc1, null, null, metadata !10, i32 320} ; [ DW_TAG_subprogram ] [line 318] [def] [scope 320] [Proc1]
!19 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !20, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!20 = metadata !{metadata !16, metadata !21}
!21 = metadata !{i32 786454, metadata !1, null, metadata !"RecordPtr", i32 153, i64 0, i64 0, i64 0, i32 0, metadata !22} ; [ DW_TAG_typedef ] [RecordPtr] [line 153, size 0, align 0, offset 0] [from ]
!22 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !23} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from RecordType]
!23 = metadata !{i32 786454, metadata !1, null, metadata !"RecordType", i32 152, i64 0, i64 0, i64 0, i32 0, metadata !24} ; [ DW_TAG_typedef ] [RecordType] [line 152, size 0, align 0, offset 0] [from Record]
!24 = metadata !{i32 786451, metadata !1, null, metadata !"Record", i32 143, i64 448, i64 64, i32 0, i32 0, null, metadata !25, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [Record] [line 143, size 448, align 64, offset 0] [def] [from ]
!25 = metadata !{metadata !26, metadata !28, metadata !30, metadata !31, metadata !33}
!26 = metadata !{i32 786445, metadata !1, metadata !24, metadata !"PtrComp", i32 145, i64 64, i64 64, i64 0, i32 0, metadata !27} ; [ DW_TAG_member ] [PtrComp] [line 145, size 64, align 64, offset 0] [from ]
!27 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !24} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from Record]
!28 = metadata !{i32 786445, metadata !1, metadata !24, metadata !"Discr", i32 146, i64 32, i64 32, i64 64, i32 0, metadata !29} ; [ DW_TAG_member ] [Discr] [line 146, size 32, align 32, offset 64] [from Enumeration]
!29 = metadata !{i32 786454, metadata !1, null, metadata !"Enumeration", i32 133, i64 0, i64 0, i64 0, i32 0, metadata !3} ; [ DW_TAG_typedef ] [Enumeration] [line 133, size 0, align 0, offset 0] [from ]
!30 = metadata !{i32 786445, metadata !1, metadata !24, metadata !"EnumComp", i32 147, i64 32, i64 32, i64 96, i32 0, metadata !29} ; [ DW_TAG_member ] [EnumComp] [line 147, size 32, align 32, offset 96] [from Enumeration]
!31 = metadata !{i32 786445, metadata !1, metadata !24, metadata !"IntComp", i32 148, i64 32, i64 32, i64 128, i32 0, metadata !32} ; [ DW_TAG_member ] [IntComp] [line 148, size 32, align 32, offset 128] [from OneToFifty]
!32 = metadata !{i32 786454, metadata !1, null, metadata !"OneToFifty", i32 137, i64 0, i64 0, i64 0, i32 0, metadata !16} ; [ DW_TAG_typedef ] [OneToFifty] [line 137, size 0, align 0, offset 0] [from int]
!33 = metadata !{i32 786445, metadata !1, metadata !24, metadata !"StringComp", i32 149, i64 248, i64 8, i64 160, i32 0, metadata !34} ; [ DW_TAG_member ] [StringComp] [line 149, size 248, align 8, offset 160] [from String30]
!34 = metadata !{i32 786454, metadata !1, null, metadata !"String30", i32 139, i64 0, i64 0, i64 0, i32 0, metadata !35} ; [ DW_TAG_typedef ] [String30] [line 139, size 0, align 0, offset 0] [from ]
!35 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 248, i64 8, i32 0, i32 0, metadata !36, metadata !37, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 248, align 8, offset 0] [from char]
!36 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!37 = metadata !{metadata !38}
!38 = metadata !{i32 786465, i64 0, i64 31}       ; [ DW_TAG_subrange_type ] [0, 30]
!39 = metadata !{i32 786478, metadata !1, metadata !13, metadata !"Proc2", metadata !"Proc2", metadata !"", i32 342, metadata !40, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 (i32*)* @Proc2, null, null, metadata !10, i32 344} ; [ DW_TAG_subprogram ] [line 342] [def] [scope 344] [Proc2]
!40 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !41, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!41 = metadata !{metadata !16, metadata !42}
!42 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !32} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from OneToFifty]
!43 = metadata !{i32 786478, metadata !1, metadata !13, metadata !"Proc3", metadata !"Proc3", metadata !"", i32 362, metadata !44, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 (%struct.Record**)* @Proc3, null, null, metadata !10, i32 364} ; [ DW_TAG_subprogram ] [line 362] [def] [scope 364] [Proc3]
!44 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !45, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!45 = metadata !{metadata !16, metadata !46}
!46 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !21} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from RecordPtr]
!47 = metadata !{i32 786478, metadata !1, metadata !13, metadata !"Proc4", metadata !"Proc4", metadata !"", i32 372, metadata !14, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @Proc4, null, null, metadata !10, i32 373} ; [ DW_TAG_subprogram ] [line 372] [def] [scope 373] [Proc4]
!48 = metadata !{i32 786478, metadata !1, metadata !13, metadata !"Proc5", metadata !"Proc5", metadata !"", i32 381, metadata !14, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @Proc5, null, null, metadata !10, i32 382} ; [ DW_TAG_subprogram ] [line 381] [def] [scope 382] [Proc5]
!49 = metadata !{i32 786478, metadata !1, metadata !13, metadata !"Proc6", metadata !"Proc6", metadata !"", i32 389, metadata !50, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 (i32, i32*)* @Proc6, null, null, metadata !10, i32 392} ; [ DW_TAG_subprogram ] [line 389] [def] [scope 392] [Proc6]
!50 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !51, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!51 = metadata !{metadata !16, metadata !29, metadata !52}
!52 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !29} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from Enumeration]
!53 = metadata !{i32 786478, metadata !1, metadata !13, metadata !"Proc7", metadata !"Proc7", metadata !"", i32 408, metadata !54, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 (i32, i32, i32*)* @Proc7, null, null, metadata !10, i32 412} ; [ DW_TAG_subprogram ] [line 408] [def] [scope 412] [Proc7]
!54 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !55, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!55 = metadata !{metadata !16, metadata !32, metadata !32, metadata !42}
!56 = metadata !{i32 786478, metadata !1, metadata !13, metadata !"Proc8", metadata !"Proc8", metadata !"", i32 419, metadata !57, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 (i32*, [51 x i32]*, i32, i32)* @Proc8, null, null, metadata !10, i32 424} ; [ DW_TAG_subprogram ] [line 419] [def] [scope 424] [Proc8]
!57 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !58, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!58 = metadata !{metadata !16, metadata !59, metadata !60, metadata !32, metadata !32}
!59 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !16} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!60 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !61} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!61 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 1632, i64 32, i32 0, i32 0, metadata !16, metadata !62, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1632, align 32, offset 0] [from int]
!62 = metadata !{metadata !63}
!63 = metadata !{i32 786465, i64 0, i64 51}       ; [ DW_TAG_subrange_type ] [0, 50]
!64 = metadata !{i32 786478, metadata !1, metadata !13, metadata !"Func1", metadata !"Func1", metadata !"", i32 439, metadata !65, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 (i32, i32)* @Func1, null, null, metadata !10, i32 442} ; [ DW_TAG_subprogram ] [line 439] [def] [scope 442] [Func1]
!65 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !66, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!66 = metadata !{metadata !29, metadata !67, metadata !67}
!67 = metadata !{i32 786454, metadata !1, null, metadata !"CapitalLetter", i32 138, i64 0, i64 0, i64 0, i32 0, metadata !36} ; [ DW_TAG_typedef ] [CapitalLetter] [line 138, size 0, align 0, offset 0] [from char]
!68 = metadata !{i32 786478, metadata !1, metadata !13, metadata !"Func2", metadata !"Func2", metadata !"", i32 454, metadata !69, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 (i8*, i8*)* @Func2, null, null, metadata !10, i32 457} ; [ DW_TAG_subprogram ] [line 454] [def] [scope 457] [Func2]
!69 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !70, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!70 = metadata !{metadata !71, metadata !72, metadata !72}
!71 = metadata !{i32 786454, metadata !1, null, metadata !"boolean", i32 154, i64 0, i64 0, i64 0, i32 0, metadata !16} ; [ DW_TAG_typedef ] [boolean] [line 154, size 0, align 0, offset 0] [from int]
!72 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !36} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!73 = metadata !{i32 786478, metadata !1, metadata !13, metadata !"Func3", metadata !"Func3", metadata !"", i32 484, metadata !74, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 (i32)* @Func3, null, null, metadata !10, i32 486} ; [ DW_TAG_subprogram ] [line 484] [def] [scope 486] [Func3]
!74 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !75, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!75 = metadata !{metadata !71, metadata !29}
!76 = metadata !{metadata !77, metadata !81, metadata !82, metadata !83, metadata !84, metadata !85, metadata !87, metadata !91, metadata !92}
!77 = metadata !{i32 786484, i32 0, null, metadata !"Version", metadata !"Version", metadata !"", metadata !13, i32 116, metadata !78, i32 0, i32 1, [4 x i8]* @Version, null} ; [ DW_TAG_variable ] [Version] [line 116] [def]
!78 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 32, i64 8, i32 0, i32 0, metadata !36, metadata !79, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 32, align 8, offset 0] [from char]
!79 = metadata !{metadata !80}
!80 = metadata !{i32 786465, i64 0, i64 4}        ; [ DW_TAG_subrange_type ] [0, 3]
!81 = metadata !{i32 786484, i32 0, null, metadata !"IntGlob", metadata !"IntGlob", metadata !"", metadata !13, i32 182, metadata !16, i32 0, i32 1, i32* @IntGlob, null} ; [ DW_TAG_variable ] [IntGlob] [line 182] [def]
!82 = metadata !{i32 786484, i32 0, null, metadata !"BoolGlob", metadata !"BoolGlob", metadata !"", metadata !13, i32 183, metadata !71, i32 0, i32 1, i32* @BoolGlob, null} ; [ DW_TAG_variable ] [BoolGlob] [line 183] [def]
!83 = metadata !{i32 786484, i32 0, null, metadata !"Char1Glob", metadata !"Char1Glob", metadata !"", metadata !13, i32 184, metadata !36, i32 0, i32 1, i8* @Char1Glob, null} ; [ DW_TAG_variable ] [Char1Glob] [line 184] [def]
!84 = metadata !{i32 786484, i32 0, null, metadata !"Char2Glob", metadata !"Char2Glob", metadata !"", metadata !13, i32 185, metadata !36, i32 0, i32 1, i8* @Char2Glob, null} ; [ DW_TAG_variable ] [Char2Glob] [line 185] [def]
!85 = metadata !{i32 786484, i32 0, null, metadata !"Array1Glob", metadata !"Array1Glob", metadata !"", metadata !13, i32 186, metadata !86, i32 0, i32 1, [51 x i32]* @Array1Glob, null} ; [ DW_TAG_variable ] [Array1Glob] [line 186] [def]
!86 = metadata !{i32 786454, metadata !1, null, metadata !"Array1Dim", i32 140, i64 0, i64 0, i64 0, i32 0, metadata !61} ; [ DW_TAG_typedef ] [Array1Dim] [line 140, size 0, align 0, offset 0] [from ]
!87 = metadata !{i32 786484, i32 0, null, metadata !"Array2Glob", metadata !"Array2Glob", metadata !"", metadata !13, i32 187, metadata !88, i32 0, i32 1, [51 x [51 x i32]]* @Array2Glob, null} ; [ DW_TAG_variable ] [Array2Glob] [line 187] [def]
!88 = metadata !{i32 786454, metadata !1, null, metadata !"Array2Dim", i32 141, i64 0, i64 0, i64 0, i32 0, metadata !89} ; [ DW_TAG_typedef ] [Array2Dim] [line 141, size 0, align 0, offset 0] [from ]
!89 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 83232, i64 32, i32 0, i32 0, metadata !16, metadata !90, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 83232, align 32, offset 0] [from int]
!90 = metadata !{metadata !63, metadata !63}
!91 = metadata !{i32 786484, i32 0, null, metadata !"PtrGlb", metadata !"PtrGlb", metadata !"", metadata !13, i32 188, metadata !21, i32 0, i32 1, %struct.Record** @PtrGlb, null} ; [ DW_TAG_variable ] [PtrGlb] [line 188] [def]
!92 = metadata !{i32 786484, i32 0, null, metadata !"PtrGlbNext", metadata !"PtrGlbNext", metadata !"", metadata !13, i32 189, metadata !21, i32 0, i32 1, %struct.Record** @PtrGlbNext, null} ; [ DW_TAG_variable ] [PtrGlbNext] [line 189] [def]
!93 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!94 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!95 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!96 = metadata !{i32 175, i32 0, metadata !12, null}
!97 = metadata !{i32 176, i32 0, metadata !12, null}
!98 = metadata !{i32 786688, metadata !17, metadata !"IntLoc1", metadata !13, i32 193, metadata !32, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [IntLoc1] [line 193]
!99 = metadata !{i32 193, i32 0, metadata !17, null}
!100 = metadata !{i32 786688, metadata !17, metadata !"IntLoc2", metadata !13, i32 194, metadata !32, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [IntLoc2] [line 194]
!101 = metadata !{i32 194, i32 0, metadata !17, null}
!102 = metadata !{i32 786688, metadata !17, metadata !"IntLoc3", metadata !13, i32 195, metadata !32, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [IntLoc3] [line 195]
!103 = metadata !{i32 195, i32 0, metadata !17, null}
!104 = metadata !{i32 786688, metadata !17, metadata !"CharLoc", metadata !13, i32 196, metadata !36, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [CharLoc] [line 196]
!105 = metadata !{i32 196, i32 0, metadata !17, null}
!106 = metadata !{i32 786688, metadata !17, metadata !"CharIndex", metadata !13, i32 197, metadata !36, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [CharIndex] [line 197]
!107 = metadata !{i32 197, i32 0, metadata !17, null}
!108 = metadata !{i32 786688, metadata !17, metadata !"EnumLoc", metadata !13, i32 198, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [EnumLoc] [line 198]
!109 = metadata !{i32 198, i32 0, metadata !17, null}
!110 = metadata !{i32 786688, metadata !17, metadata !"String1Loc", metadata !13, i32 199, metadata !34, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [String1Loc] [line 199]
!111 = metadata !{i32 199, i32 0, metadata !17, null}
!112 = metadata !{i32 786688, metadata !17, metadata !"String2Loc", metadata !13, i32 200, metadata !34, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [String2Loc] [line 200]
!113 = metadata !{i32 200, i32 0, metadata !17, null}
!114 = metadata !{i32 786688, metadata !17, metadata !"i", metadata !13, i32 201, metadata !115, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 201]
!115 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!116 = metadata !{i32 201, i32 0, metadata !17, null}
!117 = metadata !{i32 786688, metadata !17, metadata !"starttime", metadata !13, i32 204, metadata !118, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [starttime] [line 204]
!118 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!119 = metadata !{i32 204, i32 0, metadata !17, null}
!120 = metadata !{i32 786688, metadata !17, metadata !"benchtime", metadata !13, i32 205, metadata !118, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [benchtime] [line 205]
!121 = metadata !{i32 205, i32 0, metadata !17, null}
!122 = metadata !{i32 786688, metadata !17, metadata !"nulltime", metadata !13, i32 206, metadata !118, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [nulltime] [line 206]
!123 = metadata !{i32 206, i32 0, metadata !17, null}
!124 = metadata !{i32 208, i32 0, metadata !17, null}
!125 = metadata !{i32 209, i32 0, metadata !126, null}
!126 = metadata !{i32 786443, metadata !1, metadata !17, i32 209, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dry.c]
!127 = metadata !{i32 210, i32 0, metadata !17, null}
!128 = metadata !{i32 234, i32 0, metadata !17, null}
!129 = metadata !{i32 235, i32 0, metadata !17, null}
!130 = metadata !{i32 236, i32 0, metadata !17, null}
!131 = metadata !{i32 237, i32 0, metadata !17, null}
!132 = metadata !{i32 238, i32 0, metadata !17, null}
!133 = metadata !{i32 239, i32 0, metadata !17, null}
!134 = metadata !{i32 240, i32 0, metadata !17, null}
!135 = metadata !{i32 242, i32 0, metadata !17, null}
!136 = metadata !{i32 244, i32 0, metadata !17, null}
!137 = metadata !{i32 250, i32 0, metadata !17, null}
!138 = metadata !{i32 258, i32 0, metadata !139, null}
!139 = metadata !{i32 786443, metadata !1, metadata !17, i32 258, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dry.c]
!140 = metadata !{i32 260, i32 0, metadata !141, null}
!141 = metadata !{i32 786443, metadata !1, metadata !139, i32 259, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dry.c]
!142 = metadata !{i32 261, i32 0, metadata !141, null}
!143 = metadata !{i32 262, i32 0, metadata !141, null}
!144 = metadata !{i32 263, i32 0, metadata !141, null}
!145 = metadata !{i32 264, i32 0, metadata !141, null}
!146 = metadata !{i32 265, i32 0, metadata !141, null}
!147 = metadata !{i32 266, i32 0, metadata !141, null}
!148 = metadata !{i32 267, i32 0, metadata !141, null}
!149 = metadata !{i32 269, i32 0, metadata !150, null}
!150 = metadata !{i32 786443, metadata !1, metadata !141, i32 268, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dry.c]
!151 = metadata !{i32 270, i32 0, metadata !150, null}
!152 = metadata !{i32 271, i32 0, metadata !150, null}
!153 = metadata !{i32 272, i32 0, metadata !150, null}
!154 = metadata !{i32 273, i32 0, metadata !141, null}
!155 = metadata !{i32 274, i32 0, metadata !141, null}
!156 = metadata !{i32 275, i32 0, metadata !157, null}
!157 = metadata !{i32 786443, metadata !1, metadata !141, i32 275, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dry.c]
!158 = metadata !{i32 276, i32 0, metadata !159, null}
!159 = metadata !{i32 786443, metadata !1, metadata !157, i32 276, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dry.c]
!160 = metadata !{i32 277, i32 0, metadata !159, null}
!161 = metadata !{i32 278, i32 0, metadata !141, null}
!162 = metadata !{i32 279, i32 0, metadata !141, null}
!163 = metadata !{i32 280, i32 0, metadata !141, null}
!164 = metadata !{i32 281, i32 0, metadata !141, null}
!165 = metadata !{i32 282, i32 0, metadata !141, null}
!166 = metadata !{i32 316, i32 0, metadata !17, null}
!167 = metadata !{i32 786689, metadata !18, metadata !"PtrParIn", metadata !13, i32 16777535, metadata !21, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [PtrParIn] [line 319]
!168 = metadata !{i32 319, i32 0, metadata !18, null}
!169 = metadata !{i32 324, i32 0, metadata !18, null}
!170 = metadata !{i32 325, i32 0, metadata !18, null}
!171 = metadata !{i32 326, i32 0, metadata !18, null}
!172 = metadata !{i32 340, i32 0, metadata !18, null}
!173 = metadata !{i32 786689, metadata !39, metadata !"IntParIO", metadata !13, i32 16777559, metadata !42, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [IntParIO] [line 343]
!174 = metadata !{i32 343, i32 0, metadata !39, null}
!175 = metadata !{i32 786688, metadata !39, metadata !"IntLoc", metadata !13, i32 345, metadata !32, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [IntLoc] [line 345]
!176 = metadata !{i32 345, i32 0, metadata !39, null}
!177 = metadata !{i32 786688, metadata !39, metadata !"EnumLoc", metadata !13, i32 346, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [EnumLoc] [line 346]
!178 = metadata !{i32 346, i32 0, metadata !39, null}
!179 = metadata !{i32 348, i32 0, metadata !39, null}
!180 = metadata !{i32 349, i32 0, metadata !181, null}
!181 = metadata !{i32 786443, metadata !1, metadata !39, i32 349, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dry.c]
!182 = metadata !{i32 351, i32 0, metadata !183, null}
!183 = metadata !{i32 786443, metadata !1, metadata !184, i32 351, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dry.c]
!184 = metadata !{i32 786443, metadata !1, metadata !181, i32 350, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dry.c]
!185 = metadata !{i32 353, i32 0, metadata !186, null}
!186 = metadata !{i32 786443, metadata !1, metadata !183, i32 352, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dry.c]
!187 = metadata !{i32 354, i32 0, metadata !186, null}
!188 = metadata !{i32 355, i32 0, metadata !186, null}
!189 = metadata !{i32 356, i32 0, metadata !186, null}
!190 = metadata !{i32 357, i32 0, metadata !191, null}
!191 = metadata !{i32 786443, metadata !1, metadata !184, i32 357, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dry.c]
!192 = metadata !{i32 358, i32 0, metadata !191, null}
!193 = metadata !{i32 359, i32 0, metadata !184, null}
!194 = metadata !{i32 360, i32 0, metadata !39, null}
!195 = metadata !{i32 786689, metadata !43, metadata !"PtrParOut", metadata !13, i32 16777579, metadata !46, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [PtrParOut] [line 363]
!196 = metadata !{i32 363, i32 0, metadata !43, null}
!197 = metadata !{i32 365, i32 0, metadata !198, null}
!198 = metadata !{i32 786443, metadata !1, metadata !43, i32 365, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dry.c]
!199 = metadata !{i32 366, i32 0, metadata !198, null}
!200 = metadata !{i32 368, i32 0, metadata !198, null}
!201 = metadata !{i32 369, i32 0, metadata !43, null}
!202 = metadata !{i32 370, i32 0, metadata !43, null}
!203 = metadata !{i32 786688, metadata !47, metadata !"BoolLoc", metadata !13, i32 374, metadata !71, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [BoolLoc] [line 374]
!204 = metadata !{i32 374, i32 0, metadata !47, null}
!205 = metadata !{i32 376, i32 0, metadata !47, null}
!206 = metadata !{i32 377, i32 0, metadata !47, null}
!207 = metadata !{i32 378, i32 0, metadata !47, null}
!208 = metadata !{i32 379, i32 0, metadata !47, null}
!209 = metadata !{i32 383, i32 0, metadata !48, null}
!210 = metadata !{i32 384, i32 0, metadata !48, null}
!211 = metadata !{i32 385, i32 0, metadata !48, null}
!212 = metadata !{i32 786689, metadata !49, metadata !"EnumParIn", metadata !13, i32 16777606, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [EnumParIn] [line 390]
!213 = metadata !{i32 390, i32 0, metadata !49, null}
!214 = metadata !{i32 786689, metadata !49, metadata !"EnumParOut", metadata !13, i32 33554823, metadata !52, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [EnumParOut] [line 391]
!215 = metadata !{i32 391, i32 0, metadata !49, null}
!216 = metadata !{i32 393, i32 0, metadata !49, null}
!217 = metadata !{i32 394, i32 0, metadata !218, null}
!218 = metadata !{i32 786443, metadata !1, metadata !49, i32 394, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dry.c]
!219 = metadata !{i32 395, i32 0, metadata !218, null}
!220 = metadata !{i32 396, i32 0, metadata !49, null}
!221 = metadata !{i32 398, i32 0, metadata !222, null}
!222 = metadata !{i32 786443, metadata !1, metadata !49, i32 397, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dry.c]
!223 = metadata !{i32 399, i32 0, metadata !224, null}
!224 = metadata !{i32 786443, metadata !1, metadata !222, i32 399, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dry.c]
!225 = metadata !{i32 400, i32 0, metadata !224, null}
!226 = metadata !{i32 401, i32 0, metadata !222, null}
!227 = metadata !{i32 402, i32 0, metadata !222, null}
!228 = metadata !{i32 403, i32 0, metadata !222, null}
!229 = metadata !{i32 404, i32 0, metadata !222, null}
!230 = metadata !{i32 405, i32 0, metadata !222, null}
!231 = metadata !{i32 406, i32 0, metadata !49, null}
!232 = metadata !{i32 786689, metadata !53, metadata !"IntParI1", metadata !13, i32 16777625, metadata !32, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [IntParI1] [line 409]
!233 = metadata !{i32 409, i32 0, metadata !53, null}
!234 = metadata !{i32 786689, metadata !53, metadata !"IntParI2", metadata !13, i32 33554842, metadata !32, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [IntParI2] [line 410]
!235 = metadata !{i32 410, i32 0, metadata !53, null}
!236 = metadata !{i32 786689, metadata !53, metadata !"IntParOut", metadata !13, i32 50332059, metadata !42, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [IntParOut] [line 411]
!237 = metadata !{i32 411, i32 0, metadata !53, null}
!238 = metadata !{i32 786688, metadata !53, metadata !"IntLoc", metadata !13, i32 413, metadata !32, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [IntLoc] [line 413]
!239 = metadata !{i32 413, i32 0, metadata !53, null}
!240 = metadata !{i32 415, i32 0, metadata !53, null}
!241 = metadata !{i32 416, i32 0, metadata !53, null}
!242 = metadata !{i32 417, i32 0, metadata !53, null}
!243 = metadata !{i32 786689, metadata !56, metadata !"Array1Par", metadata !13, i32 16777636, metadata !59, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [Array1Par] [line 420]
!244 = metadata !{i32 420, i32 0, metadata !56, null}
!245 = metadata !{i32 786689, metadata !56, metadata !"Array2Par", metadata !13, i32 33554853, metadata !60, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [Array2Par] [line 421]
!246 = metadata !{i32 421, i32 0, metadata !56, null}
!247 = metadata !{i32 786689, metadata !56, metadata !"IntParI1", metadata !13, i32 50332070, metadata !32, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [IntParI1] [line 422]
!248 = metadata !{i32 422, i32 0, metadata !56, null}
!249 = metadata !{i32 786689, metadata !56, metadata !"IntParI2", metadata !13, i32 67109287, metadata !32, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [IntParI2] [line 423]
!250 = metadata !{i32 423, i32 0, metadata !56, null}
!251 = metadata !{i32 786688, metadata !56, metadata !"IntLoc", metadata !13, i32 425, metadata !32, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [IntLoc] [line 425]
!252 = metadata !{i32 425, i32 0, metadata !56, null}
!253 = metadata !{i32 786688, metadata !56, metadata !"IntIndex", metadata !13, i32 426, metadata !32, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [IntIndex] [line 426]
!254 = metadata !{i32 426, i32 0, metadata !56, null}
!255 = metadata !{i32 428, i32 0, metadata !56, null}
!256 = metadata !{i32 429, i32 0, metadata !56, null}
!257 = metadata !{i32 430, i32 0, metadata !56, null}
!258 = metadata !{i32 431, i32 0, metadata !56, null}
!259 = metadata !{i32 432, i32 0, metadata !260, null}
!260 = metadata !{i32 786443, metadata !1, metadata !56, i32 432, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dry.c]
!261 = metadata !{i32 433, i32 0, metadata !260, null}
!262 = metadata !{i32 434, i32 0, metadata !56, null}
!263 = metadata !{i32 435, i32 0, metadata !56, null}
!264 = metadata !{i32 436, i32 0, metadata !56, null}
!265 = metadata !{i32 437, i32 0, metadata !56, null}
!266 = metadata !{i32 786689, metadata !64, metadata !"CharPar1", metadata !13, i32 16777656, metadata !67, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [CharPar1] [line 440]
!267 = metadata !{i32 440, i32 0, metadata !64, null}
!268 = metadata !{i32 786689, metadata !64, metadata !"CharPar2", metadata !13, i32 33554873, metadata !67, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [CharPar2] [line 441]
!269 = metadata !{i32 441, i32 0, metadata !64, null}
!270 = metadata !{i32 786688, metadata !64, metadata !"CharLoc1", metadata !13, i32 443, metadata !67, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [CharLoc1] [line 443]
!271 = metadata !{i32 443, i32 0, metadata !64, null}
!272 = metadata !{i32 786688, metadata !64, metadata !"CharLoc2", metadata !13, i32 444, metadata !67, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [CharLoc2] [line 444]
!273 = metadata !{i32 444, i32 0, metadata !64, null}
!274 = metadata !{i32 446, i32 0, metadata !64, null}
!275 = metadata !{i32 447, i32 0, metadata !64, null}
!276 = metadata !{i32 448, i32 0, metadata !277, null}
!277 = metadata !{i32 786443, metadata !1, metadata !64, i32 448, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dry.c]
!278 = metadata !{i32 449, i32 0, metadata !277, null}
!279 = metadata !{i32 451, i32 0, metadata !277, null}
!280 = metadata !{i32 452, i32 0, metadata !64, null}
!281 = metadata !{i32 786689, metadata !68, metadata !"StrParI1", metadata !13, i32 16777671, metadata !72, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [StrParI1] [line 455]
!282 = metadata !{i32 455, i32 0, metadata !68, null}
!283 = metadata !{i32 786689, metadata !68, metadata !"StrParI2", metadata !13, i32 33554888, metadata !72, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [StrParI2] [line 456]
!284 = metadata !{i32 456, i32 0, metadata !68, null}
!285 = metadata !{i32 786688, metadata !68, metadata !"IntLoc", metadata !13, i32 458, metadata !286, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [IntLoc] [line 458]
!286 = metadata !{i32 786454, metadata !1, null, metadata !"OneToThirty", i32 136, i64 0, i64 0, i64 0, i32 0, metadata !16} ; [ DW_TAG_typedef ] [OneToThirty] [line 136, size 0, align 0, offset 0] [from int]
!287 = metadata !{i32 458, i32 0, metadata !68, null}
!288 = metadata !{i32 786688, metadata !68, metadata !"CharLoc", metadata !13, i32 459, metadata !67, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [CharLoc] [line 459]
!289 = metadata !{i32 459, i32 0, metadata !68, null}
!290 = metadata !{i32 461, i32 0, metadata !68, null}
!291 = metadata !{i32 462, i32 0, metadata !68, null}
!292 = metadata !{i32 463, i32 0, metadata !293, null}
!293 = metadata !{i32 786443, metadata !1, metadata !68, i32 463, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dry.c]
!294 = metadata !{i32 465, i32 0, metadata !295, null}
!295 = metadata !{i32 786443, metadata !1, metadata !293, i32 464, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dry.c]
!296 = metadata !{i32 466, i32 0, metadata !295, null}
!297 = metadata !{i32 467, i32 0, metadata !295, null}
!298 = metadata !{i32 467, i32 0, metadata !293, null}
!299 = metadata !{i32 468, i32 0, metadata !300, null}
!300 = metadata !{i32 786443, metadata !1, metadata !68, i32 468, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dry.c]
!301 = metadata !{i32 469, i32 0, metadata !300, null}
!302 = metadata !{i32 470, i32 0, metadata !303, null}
!303 = metadata !{i32 786443, metadata !1, metadata !68, i32 470, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dry.c]
!304 = metadata !{i32 471, i32 0, metadata !303, null}
!305 = metadata !{i32 474, i32 0, metadata !306, null}
!306 = metadata !{i32 786443, metadata !1, metadata !307, i32 474, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dry.c]
!307 = metadata !{i32 786443, metadata !1, metadata !303, i32 473, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dry.c]
!308 = metadata !{i32 476, i32 0, metadata !309, null}
!309 = metadata !{i32 786443, metadata !1, metadata !306, i32 475, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dry.c]
!310 = metadata !{i32 477, i32 0, metadata !309, null}
!311 = metadata !{i32 480, i32 0, metadata !306, null}
!312 = metadata !{i32 482, i32 0, metadata !68, null}
!313 = metadata !{i32 786689, metadata !73, metadata !"EnumParIn", metadata !13, i32 16777701, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [EnumParIn] [line 485]
!314 = metadata !{i32 485, i32 0, metadata !73, null}
!315 = metadata !{i32 786688, metadata !73, metadata !"EnumLoc", metadata !13, i32 487, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [EnumLoc] [line 487]
!316 = metadata !{i32 487, i32 0, metadata !73, null}
!317 = metadata !{i32 489, i32 0, metadata !73, null}
!318 = metadata !{i32 490, i32 0, metadata !319, null}
!319 = metadata !{i32 786443, metadata !1, metadata !73, i32 490, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dry.c]
!320 = metadata !{i32 491, i32 0, metadata !73, null}
!321 = metadata !{i32 492, i32 0, metadata !73, null}
