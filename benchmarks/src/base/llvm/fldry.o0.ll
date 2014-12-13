; ModuleID = 'fldry.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Record = type { %struct.Record*, i32, i32, double, [31 x i8] }

@Version = global [4 x i8] c"1.1\00", align 1
@.str = private unnamed_addr constant [53 x i8] c"calculate floating dhrystones using doubles size %d\0A\00", align 1
@PtrGlbNext = common global %struct.Record* null, align 8
@PtrGlb = common global %struct.Record* null, align 8
@.str1 = private unnamed_addr constant [31 x i8] c"DHRYSTONE PROGRAM, SOME STRING\00", align 1
@.str2 = private unnamed_addr constant [31 x i8] c"DHRYSTONE PROGRAM, 1'ST STRING\00", align 1
@Array2Glob = common global [51 x [51 x double]] zeroinitializer, align 16
@.str3 = private unnamed_addr constant [31 x i8] c"DHRYSTONE PROGRAM, 2'ND STRING\00", align 1
@BoolGlob = common global i32 0, align 4
@Array1Glob = common global [51 x double] zeroinitializer, align 16
@Char2Glob = common global i8 0, align 1
@Char1Glob = common global i8 0, align 1
@IntGlob = common global double 0.000000e+00, align 8

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !100), !dbg !101
  store i8** %argv, i8*** %3, align 8
  call void @llvm.dbg.declare(metadata !{i8*** %3}, metadata !102), !dbg !103
  %4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([53 x i8]* @.str, i32 0, i32 0), i64 8), !dbg !104
  %5 = call i32 @Proc0(), !dbg !105
  ret i32 0, !dbg !106
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define i32 @Proc0() #0 {
  %1 = alloca i32, align 4
  %IntLoc1 = alloca double, align 8
  %IntLoc2 = alloca double, align 8
  %IntLoc3 = alloca double, align 8
  %CharLoc = alloca i8, align 1
  %CharIndex = alloca i8, align 1
  %EnumLoc = alloca i32, align 4
  %String1Loc = alloca [31 x i8], align 16
  %String2Loc = alloca [31 x i8], align 16
  %i = alloca i32, align 4
  %starttime = alloca i64, align 8
  %benchtime = alloca i64, align 8
  %nulltime = alloca i64, align 8
  call void @llvm.dbg.declare(metadata !{double* %IntLoc1}, metadata !107), !dbg !108
  call void @llvm.dbg.declare(metadata !{double* %IntLoc2}, metadata !109), !dbg !110
  call void @llvm.dbg.declare(metadata !{double* %IntLoc3}, metadata !111), !dbg !112
  call void @llvm.dbg.declare(metadata !{i8* %CharLoc}, metadata !113), !dbg !114
  call void @llvm.dbg.declare(metadata !{i8* %CharIndex}, metadata !115), !dbg !116
  call void @llvm.dbg.declare(metadata !{i32* %EnumLoc}, metadata !117), !dbg !118
  call void @llvm.dbg.declare(metadata !{[31 x i8]* %String1Loc}, metadata !119), !dbg !120
  call void @llvm.dbg.declare(metadata !{[31 x i8]* %String2Loc}, metadata !121), !dbg !122
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !123), !dbg !125
  call void @llvm.dbg.declare(metadata !{i64* %starttime}, metadata !126), !dbg !128
  call void @llvm.dbg.declare(metadata !{i64* %benchtime}, metadata !129), !dbg !130
  call void @llvm.dbg.declare(metadata !{i64* %nulltime}, metadata !131), !dbg !132
  %2 = call i32 (...)* @clock(), !dbg !133
  %3 = sext i32 %2 to i64, !dbg !133
  store i64 %3, i64* %starttime, align 8, !dbg !133
  store i32 0, i32* %i, align 4, !dbg !134
  br label %4, !dbg !134

; <label>:4                                       ; preds = %8, %0
  %5 = load i32* %i, align 4, !dbg !134
  %6 = icmp ult i32 %5, 100000000, !dbg !134
  br i1 %6, label %7, label %11, !dbg !134

; <label>:7                                       ; preds = %4
  br label %8, !dbg !134

; <label>:8                                       ; preds = %7
  %9 = load i32* %i, align 4, !dbg !134
  %10 = add i32 %9, 1, !dbg !134
  store i32 %10, i32* %i, align 4, !dbg !134
  br label %4, !dbg !134

; <label>:11                                      ; preds = %4
  %12 = call i32 (...)* @clock(), !dbg !136
  %13 = sext i32 %12 to i64, !dbg !136
  %14 = load i64* %starttime, align 8, !dbg !136
  %15 = sub nsw i64 %13, %14, !dbg !136
  store i64 %15, i64* %nulltime, align 8, !dbg !136
  %16 = call noalias i8* @malloc(i64 56) #5, !dbg !137
  %17 = bitcast i8* %16 to %struct.Record*, !dbg !137
  store %struct.Record* %17, %struct.Record** @PtrGlbNext, align 8, !dbg !137
  %18 = call noalias i8* @malloc(i64 56) #5, !dbg !138
  %19 = bitcast i8* %18 to %struct.Record*, !dbg !138
  store %struct.Record* %19, %struct.Record** @PtrGlb, align 8, !dbg !138
  %20 = load %struct.Record** @PtrGlbNext, align 8, !dbg !139
  %21 = load %struct.Record** @PtrGlb, align 8, !dbg !139
  %22 = getelementptr inbounds %struct.Record* %21, i32 0, i32 0, !dbg !139
  store %struct.Record* %20, %struct.Record** %22, align 8, !dbg !139
  %23 = load %struct.Record** @PtrGlb, align 8, !dbg !140
  %24 = getelementptr inbounds %struct.Record* %23, i32 0, i32 1, !dbg !140
  store i32 0, i32* %24, align 4, !dbg !140
  %25 = load %struct.Record** @PtrGlb, align 8, !dbg !141
  %26 = getelementptr inbounds %struct.Record* %25, i32 0, i32 2, !dbg !141
  store i32 10001, i32* %26, align 4, !dbg !141
  %27 = load %struct.Record** @PtrGlb, align 8, !dbg !142
  %28 = getelementptr inbounds %struct.Record* %27, i32 0, i32 3, !dbg !142
  store double 4.000000e+01, double* %28, align 8, !dbg !142
  %29 = load %struct.Record** @PtrGlb, align 8, !dbg !143
  %30 = getelementptr inbounds %struct.Record* %29, i32 0, i32 4, !dbg !143
  %31 = getelementptr inbounds [31 x i8]* %30, i32 0, i32 0, !dbg !143
  %32 = call i8* @strcpy(i8* %31, i8* getelementptr inbounds ([31 x i8]* @.str1, i32 0, i32 0)) #5, !dbg !143
  %33 = getelementptr inbounds [31 x i8]* %String1Loc, i32 0, i32 0, !dbg !144
  %34 = call i8* @strcpy(i8* %33, i8* getelementptr inbounds ([31 x i8]* @.str2, i32 0, i32 0)) #5, !dbg !144
  store double 1.000000e+01, double* getelementptr inbounds ([51 x [51 x double]]* @Array2Glob, i32 0, i64 8, i64 7), align 8, !dbg !145
  %35 = call i32 (...)* @clock(), !dbg !146
  %36 = sext i32 %35 to i64, !dbg !146
  store i64 %36, i64* %starttime, align 8, !dbg !146
  store i32 0, i32* %i, align 4, !dbg !147
  br label %37, !dbg !147

; <label>:37                                      ; preds = %103, %11
  %38 = load i32* %i, align 4, !dbg !147
  %39 = icmp ult i32 %38, 100000000, !dbg !147
  br i1 %39, label %40, label %106, !dbg !147

; <label>:40                                      ; preds = %37
  %41 = call i32 @Proc5(), !dbg !149
  %42 = call i32 @Proc4(), !dbg !151
  store double 2.000000e+00, double* %IntLoc1, align 8, !dbg !152
  store double 3.000000e+00, double* %IntLoc2, align 8, !dbg !153
  %43 = getelementptr inbounds [31 x i8]* %String2Loc, i32 0, i32 0, !dbg !154
  %44 = call i8* @strcpy(i8* %43, i8* getelementptr inbounds ([31 x i8]* @.str3, i32 0, i32 0)) #5, !dbg !154
  store i32 10000, i32* %EnumLoc, align 4, !dbg !155
  %45 = getelementptr inbounds [31 x i8]* %String1Loc, i32 0, i32 0, !dbg !156
  %46 = getelementptr inbounds [31 x i8]* %String2Loc, i32 0, i32 0, !dbg !156
  %47 = call i32 @Func2(i8* %45, i8* %46), !dbg !156
  %48 = icmp ne i32 %47, 0, !dbg !156
  %49 = xor i1 %48, true, !dbg !156
  %50 = zext i1 %49 to i32, !dbg !156
  store i32 %50, i32* @BoolGlob, align 4, !dbg !156
  br label %51, !dbg !157

; <label>:51                                      ; preds = %55, %40
  %52 = load double* %IntLoc1, align 8, !dbg !157
  %53 = load double* %IntLoc2, align 8, !dbg !157
  %54 = fcmp olt double %52, %53, !dbg !157
  br i1 %54, label %55, label %65, !dbg !157

; <label>:55                                      ; preds = %51
  %56 = load double* %IntLoc1, align 8, !dbg !158
  %57 = fmul double 5.000000e+00, %56, !dbg !158
  %58 = load double* %IntLoc2, align 8, !dbg !158
  %59 = fsub double %57, %58, !dbg !158
  store double %59, double* %IntLoc3, align 8, !dbg !158
  %60 = load double* %IntLoc1, align 8, !dbg !160
  %61 = load double* %IntLoc2, align 8, !dbg !160
  %62 = call i32 @Proc7(double %60, double %61, double* %IntLoc3), !dbg !160
  %63 = load double* %IntLoc1, align 8, !dbg !161
  %64 = fadd double %63, 1.000000e+00, !dbg !161
  store double %64, double* %IntLoc1, align 8, !dbg !161
  br label %51, !dbg !162

; <label>:65                                      ; preds = %51
  %66 = load double* %IntLoc1, align 8, !dbg !163
  %67 = load double* %IntLoc3, align 8, !dbg !163
  %68 = call i32 @Proc8(double* getelementptr inbounds ([51 x double]* @Array1Glob, i32 0, i32 0), [51 x double]* getelementptr inbounds ([51 x [51 x double]]* @Array2Glob, i32 0, i32 0), double %66, double %67), !dbg !163
  %69 = load %struct.Record** @PtrGlb, align 8, !dbg !164
  %70 = call i32 @Proc1(%struct.Record* %69), !dbg !164
  store i8 65, i8* %CharIndex, align 1, !dbg !165
  br label %71, !dbg !165

; <label>:71                                      ; preds = %86, %65
  %72 = load i8* %CharIndex, align 1, !dbg !165
  %73 = sext i8 %72 to i32, !dbg !165
  %74 = load i8* @Char2Glob, align 1, !dbg !165
  %75 = sext i8 %74 to i32, !dbg !165
  %76 = icmp sle i32 %73, %75, !dbg !165
  br i1 %76, label %77, label %89, !dbg !165

; <label>:77                                      ; preds = %71
  %78 = load i32* %EnumLoc, align 4, !dbg !167
  %79 = load i8* %CharIndex, align 1, !dbg !167
  %80 = sext i8 %79 to i32, !dbg !167
  %81 = call i32 @Func1(i32 %80, i32 67), !dbg !167
  %82 = icmp eq i32 %78, %81, !dbg !167
  br i1 %82, label %83, label %85, !dbg !167

; <label>:83                                      ; preds = %77
  %84 = call i32 @Proc6(i32 0, i32* %EnumLoc), !dbg !169
  br label %85, !dbg !169

; <label>:85                                      ; preds = %83, %77
  br label %86, !dbg !169

; <label>:86                                      ; preds = %85
  %87 = load i8* %CharIndex, align 1, !dbg !165
  %88 = add i8 %87, 1, !dbg !165
  store i8 %88, i8* %CharIndex, align 1, !dbg !165
  br label %71, !dbg !165

; <label>:89                                      ; preds = %71
  %90 = load double* %IntLoc2, align 8, !dbg !170
  %91 = load double* %IntLoc1, align 8, !dbg !170
  %92 = fmul double %90, %91, !dbg !170
  store double %92, double* %IntLoc3, align 8, !dbg !170
  %93 = load double* %IntLoc3, align 8, !dbg !171
  %94 = load double* %IntLoc1, align 8, !dbg !171
  %95 = fdiv double %93, %94, !dbg !171
  store double %95, double* %IntLoc2, align 8, !dbg !171
  %96 = load double* %IntLoc3, align 8, !dbg !172
  %97 = load double* %IntLoc2, align 8, !dbg !172
  %98 = fsub double %96, %97, !dbg !172
  %99 = fmul double 7.000000e+00, %98, !dbg !172
  %100 = load double* %IntLoc1, align 8, !dbg !172
  %101 = fsub double %99, %100, !dbg !172
  store double %101, double* %IntLoc2, align 8, !dbg !172
  %102 = call i32 @Proc2(double* %IntLoc1), !dbg !173
  br label %103, !dbg !174

; <label>:103                                     ; preds = %89
  %104 = load i32* %i, align 4, !dbg !147
  %105 = add i32 %104, 1, !dbg !147
  store i32 %105, i32* %i, align 4, !dbg !147
  br label %37, !dbg !147

; <label>:106                                     ; preds = %37
  %107 = load i32* %1, !dbg !175
  ret i32 %107, !dbg !175
}

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
  call void @llvm.dbg.declare(metadata !{%struct.Record** %2}, metadata !176), !dbg !177
  %3 = load %struct.Record** %2, align 8, !dbg !178
  %4 = getelementptr inbounds %struct.Record* %3, i32 0, i32 3, !dbg !178
  store double 5.000000e+00, double* %4, align 8, !dbg !178
  %5 = load %struct.Record** %2, align 8, !dbg !179
  %6 = getelementptr inbounds %struct.Record* %5, i32 0, i32 3, !dbg !179
  %7 = load double* %6, align 8, !dbg !179
  %8 = load %struct.Record** %2, align 8, !dbg !179
  %9 = getelementptr inbounds %struct.Record* %8, i32 0, i32 0, !dbg !179
  %10 = load %struct.Record** %9, align 8, !dbg !179
  %11 = getelementptr inbounds %struct.Record* %10, i32 0, i32 3, !dbg !179
  store double %7, double* %11, align 8, !dbg !179
  %12 = load %struct.Record** %2, align 8, !dbg !180
  %13 = getelementptr inbounds %struct.Record* %12, i32 0, i32 0, !dbg !180
  %14 = load %struct.Record** %13, align 8, !dbg !180
  %15 = load %struct.Record** %2, align 8, !dbg !180
  %16 = getelementptr inbounds %struct.Record* %15, i32 0, i32 0, !dbg !180
  %17 = load %struct.Record** %16, align 8, !dbg !180
  %18 = getelementptr inbounds %struct.Record* %17, i32 0, i32 0, !dbg !180
  store %struct.Record* %14, %struct.Record** %18, align 8, !dbg !180
  %19 = load i32* %1, !dbg !181
  ret i32 %19, !dbg !181
}

; Function Attrs: nounwind uwtable
define i32 @Proc2(double* %IntParIO) #0 {
  %1 = alloca i32, align 4
  %2 = alloca double*, align 8
  %IntLoc = alloca double, align 8
  %EnumLoc = alloca i32, align 4
  store double* %IntParIO, double** %2, align 8
  call void @llvm.dbg.declare(metadata !{double** %2}, metadata !182), !dbg !183
  call void @llvm.dbg.declare(metadata !{double* %IntLoc}, metadata !184), !dbg !185
  call void @llvm.dbg.declare(metadata !{i32* %EnumLoc}, metadata !186), !dbg !187
  %3 = load double** %2, align 8, !dbg !188
  %4 = load double* %3, align 8, !dbg !188
  %5 = fadd double %4, 1.000000e+01, !dbg !188
  store double %5, double* %IntLoc, align 8, !dbg !188
  br label %6, !dbg !189

; <label>:6                                       ; preds = %21, %0
  %7 = load i8* @Char1Glob, align 1, !dbg !191
  %8 = sext i8 %7 to i32, !dbg !191
  %9 = icmp eq i32 %8, 65, !dbg !191
  br i1 %9, label %10, label %17, !dbg !191

; <label>:10                                      ; preds = %6
  %11 = load double* %IntLoc, align 8, !dbg !194
  %12 = fadd double %11, -1.000000e+00, !dbg !194
  store double %12, double* %IntLoc, align 8, !dbg !194
  %13 = load double* %IntLoc, align 8, !dbg !196
  %14 = load double* @IntGlob, align 8, !dbg !196
  %15 = fsub double %13, %14, !dbg !196
  %16 = load double** %2, align 8, !dbg !196
  store double %15, double* %16, align 8, !dbg !196
  store i32 0, i32* %EnumLoc, align 4, !dbg !197
  br label %17, !dbg !198

; <label>:17                                      ; preds = %10, %6
  %18 = load i32* %EnumLoc, align 4, !dbg !199
  %19 = icmp eq i32 %18, 0, !dbg !199
  br i1 %19, label %20, label %21, !dbg !199

; <label>:20                                      ; preds = %17
  br label %22, !dbg !201

; <label>:21                                      ; preds = %17
  br label %6, !dbg !202

; <label>:22                                      ; preds = %20
  %23 = load i32* %1, !dbg !203
  ret i32 %23, !dbg !203
}

; Function Attrs: nounwind uwtable
define i32 @Proc3(%struct.Record** %PtrParOut) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.Record**, align 8
  store %struct.Record** %PtrParOut, %struct.Record*** %2, align 8
  call void @llvm.dbg.declare(metadata !{%struct.Record*** %2}, metadata !204), !dbg !205
  %3 = load %struct.Record** @PtrGlb, align 8, !dbg !206
  %4 = icmp ne %struct.Record* %3, null, !dbg !206
  br i1 %4, label %5, label %10, !dbg !206

; <label>:5                                       ; preds = %0
  %6 = load %struct.Record** @PtrGlb, align 8, !dbg !208
  %7 = getelementptr inbounds %struct.Record* %6, i32 0, i32 0, !dbg !208
  %8 = load %struct.Record** %7, align 8, !dbg !208
  %9 = load %struct.Record*** %2, align 8, !dbg !208
  store %struct.Record* %8, %struct.Record** %9, align 8, !dbg !208
  br label %11, !dbg !208

; <label>:10                                      ; preds = %0
  store double 1.000000e+02, double* @IntGlob, align 8, !dbg !209
  br label %11

; <label>:11                                      ; preds = %10, %5
  %12 = load double* @IntGlob, align 8, !dbg !210
  %13 = load %struct.Record** @PtrGlb, align 8, !dbg !210
  %14 = getelementptr inbounds %struct.Record* %13, i32 0, i32 3, !dbg !210
  %15 = call i32 (i32, double, double*, ...)* bitcast (i32 (double, double, double*)* @Proc7 to i32 (i32, double, double*, ...)*)(i32 10, double %12, double* %14), !dbg !210
  %16 = load i32* %1, !dbg !211
  ret i32 %16, !dbg !211
}

; Function Attrs: nounwind uwtable
define i32 @Proc4() #0 {
  %1 = alloca i32, align 4
  %BoolLoc = alloca i32, align 4
  call void @llvm.dbg.declare(metadata !{i32* %BoolLoc}, metadata !212), !dbg !213
  %2 = load i8* @Char1Glob, align 1, !dbg !214
  %3 = sext i8 %2 to i32, !dbg !214
  %4 = icmp eq i32 %3, 65, !dbg !214
  %5 = zext i1 %4 to i32, !dbg !214
  store i32 %5, i32* %BoolLoc, align 4, !dbg !214
  %6 = load i32* @BoolGlob, align 4, !dbg !215
  %7 = load i32* %BoolLoc, align 4, !dbg !215
  %8 = or i32 %7, %6, !dbg !215
  store i32 %8, i32* %BoolLoc, align 4, !dbg !215
  store i8 66, i8* @Char2Glob, align 1, !dbg !216
  %9 = load i32* %1, !dbg !217
  ret i32 %9, !dbg !217
}

; Function Attrs: nounwind uwtable
define i32 @Proc5() #0 {
  %1 = alloca i32, align 4
  store i8 65, i8* @Char1Glob, align 1, !dbg !218
  store i32 0, i32* @BoolGlob, align 4, !dbg !219
  %2 = load i32* %1, !dbg !220
  ret i32 %2, !dbg !220
}

; Function Attrs: nounwind uwtable
define i32 @Proc6(i32 %EnumParIn, i32* %EnumParOut) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32*, align 8
  store i32 %EnumParIn, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !221), !dbg !222
  store i32* %EnumParOut, i32** %3, align 8
  call void @llvm.dbg.declare(metadata !{i32** %3}, metadata !223), !dbg !224
  %4 = load i32* %2, align 4, !dbg !225
  %5 = load i32** %3, align 8, !dbg !225
  store i32 %4, i32* %5, align 4, !dbg !225
  %6 = load i32* %2, align 4, !dbg !226
  %7 = call i32 @Func3(i32 %6), !dbg !226
  %8 = icmp ne i32 %7, 0, !dbg !226
  br i1 %8, label %11, label %9, !dbg !226

; <label>:9                                       ; preds = %0
  %10 = load i32** %3, align 8, !dbg !228
  store i32 10002, i32* %10, align 4, !dbg !228
  br label %11, !dbg !228

; <label>:11                                      ; preds = %9, %0
  %12 = load i32* %2, align 4, !dbg !229
  switch i32 %12, label %28 [
    i32 0, label %13
    i32 10000, label %15
    i32 10001, label %23
    i32 10002, label %25
    i32 10003, label %26
  ], !dbg !229

; <label>:13                                      ; preds = %11
  %14 = load i32** %3, align 8, !dbg !230
  store i32 0, i32* %14, align 4, !dbg !230
  br label %28, !dbg !230

; <label>:15                                      ; preds = %11
  %16 = load double* @IntGlob, align 8, !dbg !232
  %17 = fcmp ogt double %16, 1.000000e+02, !dbg !232
  br i1 %17, label %18, label %20, !dbg !232

; <label>:18                                      ; preds = %15
  %19 = load i32** %3, align 8, !dbg !232
  store i32 0, i32* %19, align 4, !dbg !232
  br label %22, !dbg !232

; <label>:20                                      ; preds = %15
  %21 = load i32** %3, align 8, !dbg !234
  store i32 10002, i32* %21, align 4, !dbg !234
  br label %22

; <label>:22                                      ; preds = %20, %18
  br label %28, !dbg !235

; <label>:23                                      ; preds = %11
  %24 = load i32** %3, align 8, !dbg !236
  store i32 10000, i32* %24, align 4, !dbg !236
  br label %28, !dbg !236

; <label>:25                                      ; preds = %11
  br label %28, !dbg !237

; <label>:26                                      ; preds = %11
  %27 = load i32** %3, align 8, !dbg !238
  store i32 10001, i32* %27, align 4, !dbg !238
  br label %28, !dbg !239

; <label>:28                                      ; preds = %26, %11, %25, %23, %22, %13
  %29 = load i32* %1, !dbg !240
  ret i32 %29, !dbg !240
}

; Function Attrs: nounwind uwtable
define i32 @Proc7(double %IntParI1, double %IntParI2, double* %IntParOut) #0 {
  %1 = alloca i32, align 4
  %2 = alloca double, align 8
  %3 = alloca double, align 8
  %4 = alloca double*, align 8
  %IntLoc = alloca double, align 8
  store double %IntParI1, double* %2, align 8
  call void @llvm.dbg.declare(metadata !{double* %2}, metadata !241), !dbg !242
  store double %IntParI2, double* %3, align 8
  call void @llvm.dbg.declare(metadata !{double* %3}, metadata !243), !dbg !244
  store double* %IntParOut, double** %4, align 8
  call void @llvm.dbg.declare(metadata !{double** %4}, metadata !245), !dbg !246
  call void @llvm.dbg.declare(metadata !{double* %IntLoc}, metadata !247), !dbg !248
  %5 = load double* %2, align 8, !dbg !249
  %6 = fadd double %5, 2.000000e+00, !dbg !249
  store double %6, double* %IntLoc, align 8, !dbg !249
  %7 = load double* %3, align 8, !dbg !250
  %8 = load double* %IntLoc, align 8, !dbg !250
  %9 = fadd double %7, %8, !dbg !250
  %10 = load double** %4, align 8, !dbg !250
  store double %9, double* %10, align 8, !dbg !250
  %11 = load i32* %1, !dbg !251
  ret i32 %11, !dbg !251
}

; Function Attrs: nounwind uwtable
define i32 @Proc8(double* %Array1Par, [51 x double]* %Array2Par, double %IntParI1, double %IntParI2) #0 {
  %1 = alloca i32, align 4
  %2 = alloca double*, align 8
  %3 = alloca [51 x double]*, align 8
  %4 = alloca double, align 8
  %5 = alloca double, align 8
  %IntLoc = alloca double, align 8
  %IntIndex = alloca double, align 8
  store double* %Array1Par, double** %2, align 8
  call void @llvm.dbg.declare(metadata !{double** %2}, metadata !252), !dbg !253
  store [51 x double]* %Array2Par, [51 x double]** %3, align 8
  call void @llvm.dbg.declare(metadata !{[51 x double]** %3}, metadata !254), !dbg !255
  store double %IntParI1, double* %4, align 8
  call void @llvm.dbg.declare(metadata !{double* %4}, metadata !256), !dbg !257
  store double %IntParI2, double* %5, align 8
  call void @llvm.dbg.declare(metadata !{double* %5}, metadata !258), !dbg !259
  call void @llvm.dbg.declare(metadata !{double* %IntLoc}, metadata !260), !dbg !261
  call void @llvm.dbg.declare(metadata !{double* %IntIndex}, metadata !262), !dbg !263
  %6 = load double* %4, align 8, !dbg !264
  %7 = fadd double %6, 5.000000e+00, !dbg !264
  store double %7, double* %IntLoc, align 8, !dbg !264
  %8 = load double* %5, align 8, !dbg !265
  %9 = load double* %IntLoc, align 8, !dbg !265
  %10 = fptosi double %9 to i32, !dbg !265
  %11 = sext i32 %10 to i64, !dbg !265
  %12 = load double** %2, align 8, !dbg !265
  %13 = getelementptr inbounds double* %12, i64 %11, !dbg !265
  store double %8, double* %13, align 8, !dbg !265
  %14 = load double* %IntLoc, align 8, !dbg !266
  %15 = fptosi double %14 to i32, !dbg !266
  %16 = sext i32 %15 to i64, !dbg !266
  %17 = load double** %2, align 8, !dbg !266
  %18 = getelementptr inbounds double* %17, i64 %16, !dbg !266
  %19 = load double* %18, align 8, !dbg !266
  %20 = load double* %IntLoc, align 8, !dbg !266
  %21 = fptosi double %20 to i32, !dbg !266
  %22 = add nsw i32 %21, 1, !dbg !266
  %23 = sext i32 %22 to i64, !dbg !266
  %24 = load double** %2, align 8, !dbg !266
  %25 = getelementptr inbounds double* %24, i64 %23, !dbg !266
  store double %19, double* %25, align 8, !dbg !266
  %26 = load double* %IntLoc, align 8, !dbg !267
  %27 = load double* %IntLoc, align 8, !dbg !267
  %28 = fptosi double %27 to i32, !dbg !267
  %29 = add nsw i32 %28, 30, !dbg !267
  %30 = sext i32 %29 to i64, !dbg !267
  %31 = load double** %2, align 8, !dbg !267
  %32 = getelementptr inbounds double* %31, i64 %30, !dbg !267
  store double %26, double* %32, align 8, !dbg !267
  %33 = load double* %IntLoc, align 8, !dbg !268
  store double %33, double* %IntIndex, align 8, !dbg !268
  br label %34, !dbg !268

; <label>:34                                      ; preds = %50, %0
  %35 = load double* %IntIndex, align 8, !dbg !268
  %36 = load double* %IntLoc, align 8, !dbg !268
  %37 = fadd double %36, 1.000000e+00, !dbg !268
  %38 = fcmp ole double %35, %37, !dbg !268
  br i1 %38, label %39, label %53, !dbg !268

; <label>:39                                      ; preds = %34
  %40 = load double* %IntLoc, align 8, !dbg !270
  %41 = load double* %IntIndex, align 8, !dbg !270
  %42 = fptosi double %41 to i32, !dbg !270
  %43 = sext i32 %42 to i64, !dbg !270
  %44 = load double* %IntLoc, align 8, !dbg !270
  %45 = fptosi double %44 to i32, !dbg !270
  %46 = sext i32 %45 to i64, !dbg !270
  %47 = load [51 x double]** %3, align 8, !dbg !270
  %48 = getelementptr inbounds [51 x double]* %47, i64 %46, !dbg !270
  %49 = getelementptr inbounds [51 x double]* %48, i32 0, i64 %43, !dbg !270
  store double %40, double* %49, align 8, !dbg !270
  br label %50, !dbg !270

; <label>:50                                      ; preds = %39
  %51 = load double* %IntIndex, align 8, !dbg !268
  %52 = fadd double %51, 1.000000e+00, !dbg !268
  store double %52, double* %IntIndex, align 8, !dbg !268
  br label %34, !dbg !268

; <label>:53                                      ; preds = %34
  %54 = load double* %IntLoc, align 8, !dbg !271
  %55 = fptosi double %54 to i32, !dbg !271
  %56 = sub nsw i32 %55, 1, !dbg !271
  %57 = sext i32 %56 to i64, !dbg !271
  %58 = load double* %IntLoc, align 8, !dbg !271
  %59 = fptosi double %58 to i32, !dbg !271
  %60 = sext i32 %59 to i64, !dbg !271
  %61 = load [51 x double]** %3, align 8, !dbg !271
  %62 = getelementptr inbounds [51 x double]* %61, i64 %60, !dbg !271
  %63 = getelementptr inbounds [51 x double]* %62, i32 0, i64 %57, !dbg !271
  %64 = load double* %63, align 8, !dbg !271
  %65 = fadd double %64, 1.000000e+00, !dbg !271
  store double %65, double* %63, align 8, !dbg !271
  %66 = load double* %IntLoc, align 8, !dbg !272
  %67 = fptosi double %66 to i32, !dbg !272
  %68 = sext i32 %67 to i64, !dbg !272
  %69 = load double** %2, align 8, !dbg !272
  %70 = getelementptr inbounds double* %69, i64 %68, !dbg !272
  %71 = load double* %70, align 8, !dbg !272
  %72 = load double* %IntLoc, align 8, !dbg !272
  %73 = fptosi double %72 to i32, !dbg !272
  %74 = sext i32 %73 to i64, !dbg !272
  %75 = load double* %IntLoc, align 8, !dbg !272
  %76 = fptosi double %75 to i32, !dbg !272
  %77 = add nsw i32 %76, 20, !dbg !272
  %78 = sext i32 %77 to i64, !dbg !272
  %79 = load [51 x double]** %3, align 8, !dbg !272
  %80 = getelementptr inbounds [51 x double]* %79, i64 %78, !dbg !272
  %81 = getelementptr inbounds [51 x double]* %80, i32 0, i64 %74, !dbg !272
  store double %71, double* %81, align 8, !dbg !272
  store double 5.000000e+00, double* @IntGlob, align 8, !dbg !273
  %82 = load i32* %1, !dbg !274
  ret i32 %82, !dbg !274
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
  call void @llvm.dbg.declare(metadata !{i8* %4}, metadata !275), !dbg !276
  store i8 %CharPar2, i8* %5, align 1
  call void @llvm.dbg.declare(metadata !{i8* %5}, metadata !277), !dbg !278
  call void @llvm.dbg.declare(metadata !{i8* %CharLoc1}, metadata !279), !dbg !280
  call void @llvm.dbg.declare(metadata !{i8* %CharLoc2}, metadata !281), !dbg !282
  %6 = load i8* %4, align 1, !dbg !283
  store i8 %6, i8* %CharLoc1, align 1, !dbg !283
  %7 = load i8* %CharLoc1, align 1, !dbg !284
  store i8 %7, i8* %CharLoc2, align 1, !dbg !284
  %8 = load i8* %CharLoc2, align 1, !dbg !285
  %9 = sext i8 %8 to i32, !dbg !285
  %10 = load i8* %5, align 1, !dbg !285
  %11 = sext i8 %10 to i32, !dbg !285
  %12 = icmp ne i32 %9, %11, !dbg !285
  br i1 %12, label %13, label %14, !dbg !285

; <label>:13                                      ; preds = %2
  store i32 0, i32* %3, !dbg !287
  br label %15, !dbg !287

; <label>:14                                      ; preds = %2
  store i32 10000, i32* %3, !dbg !288
  br label %15, !dbg !288

; <label>:15                                      ; preds = %14, %13
  %16 = load i32* %3, !dbg !289
  ret i32 %16, !dbg !289
}

; Function Attrs: nounwind uwtable
define i32 @Func2(i8* %StrParI1, i8* %StrParI2) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %IntLoc = alloca double, align 8
  %CharLoc = alloca i8, align 1
  store i8* %StrParI1, i8** %2, align 8
  call void @llvm.dbg.declare(metadata !{i8** %2}, metadata !290), !dbg !291
  store i8* %StrParI2, i8** %3, align 8
  call void @llvm.dbg.declare(metadata !{i8** %3}, metadata !292), !dbg !293
  call void @llvm.dbg.declare(metadata !{double* %IntLoc}, metadata !294), !dbg !296
  call void @llvm.dbg.declare(metadata !{i8* %CharLoc}, metadata !297), !dbg !298
  store double 1.000000e+00, double* %IntLoc, align 8, !dbg !299
  br label %4, !dbg !300

; <label>:4                                       ; preds = %28, %0
  %5 = load double* %IntLoc, align 8, !dbg !300
  %6 = fcmp ole double %5, 1.000000e+00, !dbg !300
  br i1 %6, label %7, label %29, !dbg !300

; <label>:7                                       ; preds = %4
  %8 = load double* %IntLoc, align 8, !dbg !301
  %9 = fptosi double %8 to i32, !dbg !301
  %10 = sext i32 %9 to i64, !dbg !301
  %11 = load i8** %2, align 8, !dbg !301
  %12 = getelementptr inbounds i8* %11, i64 %10, !dbg !301
  %13 = load i8* %12, align 1, !dbg !301
  %14 = sext i8 %13 to i32, !dbg !301
  %15 = load double* %IntLoc, align 8, !dbg !301
  %16 = fptosi double %15 to i32, !dbg !301
  %17 = add nsw i32 %16, 1, !dbg !301
  %18 = sext i32 %17 to i64, !dbg !301
  %19 = load i8** %3, align 8, !dbg !301
  %20 = getelementptr inbounds i8* %19, i64 %18, !dbg !301
  %21 = load i8* %20, align 1, !dbg !301
  %22 = sext i8 %21 to i32, !dbg !301
  %23 = call i32 @Func1(i32 %14, i32 %22), !dbg !301
  %24 = icmp eq i32 %23, 0, !dbg !301
  br i1 %24, label %25, label %28, !dbg !301

; <label>:25                                      ; preds = %7
  store i8 65, i8* %CharLoc, align 1, !dbg !303
  %26 = load double* %IntLoc, align 8, !dbg !305
  %27 = fadd double %26, 1.000000e+00, !dbg !305
  store double %27, double* %IntLoc, align 8, !dbg !305
  br label %28, !dbg !306

; <label>:28                                      ; preds = %25, %7
  br label %4, !dbg !307

; <label>:29                                      ; preds = %4
  %30 = load i8* %CharLoc, align 1, !dbg !308
  %31 = sext i8 %30 to i32, !dbg !308
  %32 = icmp sge i32 %31, 87, !dbg !308
  br i1 %32, label %33, label %38, !dbg !308

; <label>:33                                      ; preds = %29
  %34 = load i8* %CharLoc, align 1, !dbg !308
  %35 = sext i8 %34 to i32, !dbg !308
  %36 = icmp sle i32 %35, 90, !dbg !308
  br i1 %36, label %37, label %38, !dbg !308

; <label>:37                                      ; preds = %33
  store double 7.000000e+00, double* %IntLoc, align 8, !dbg !310
  br label %38, !dbg !310

; <label>:38                                      ; preds = %37, %33, %29
  %39 = load i8* %CharLoc, align 1, !dbg !311
  %40 = sext i8 %39 to i32, !dbg !311
  %41 = icmp eq i32 %40, 88, !dbg !311
  br i1 %41, label %42, label %43, !dbg !311

; <label>:42                                      ; preds = %38
  store i32 1, i32* %1, !dbg !313
  br label %52, !dbg !313

; <label>:43                                      ; preds = %38
  %44 = load i8** %2, align 8, !dbg !314
  %45 = load i8** %3, align 8, !dbg !314
  %46 = call i32 @strcmp(i8* %44, i8* %45) #6, !dbg !314
  %47 = icmp sgt i32 %46, 0, !dbg !314
  br i1 %47, label %48, label %51, !dbg !314

; <label>:48                                      ; preds = %43
  %49 = load double* %IntLoc, align 8, !dbg !317
  %50 = fadd double %49, 7.000000e+00, !dbg !317
  store double %50, double* %IntLoc, align 8, !dbg !317
  store i32 1, i32* %1, !dbg !319
  br label %52, !dbg !319

; <label>:51                                      ; preds = %43
  store i32 0, i32* %1, !dbg !320
  br label %52, !dbg !320

; <label>:52                                      ; preds = %51, %48, %42
  %53 = load i32* %1, !dbg !321
  ret i32 %53, !dbg !321
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #4

; Function Attrs: nounwind uwtable
define i32 @Func3(i32 %EnumParIn) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %EnumLoc = alloca i32, align 4
  store i32 %EnumParIn, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !322), !dbg !323
  call void @llvm.dbg.declare(metadata !{i32* %EnumLoc}, metadata !324), !dbg !325
  %3 = load i32* %2, align 4, !dbg !326
  store i32 %3, i32* %EnumLoc, align 4, !dbg !326
  %4 = load i32* %EnumLoc, align 4, !dbg !327
  %5 = icmp eq i32 %4, 10001, !dbg !327
  br i1 %5, label %6, label %7, !dbg !327

; <label>:6                                       ; preds = %0
  store i32 1, i32* %1, !dbg !327
  br label %8, !dbg !327

; <label>:7                                       ; preds = %0
  store i32 0, i32* %1, !dbg !329
  br label %8, !dbg !329

; <label>:8                                       ; preds = %7, %6
  %9 = load i32* %1, !dbg !330
  ret i32 %9, !dbg !330
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!97, !98}
!llvm.ident = !{!99}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 false, metadata !"", i32 0, metadata !2, metadata !10, metadata !11, metadata !80, metadata !10, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fldry.c] [DW_LANG_C99]
!1 = metadata !{metadata !"fldry.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{metadata !3}
!3 = metadata !{i32 786436, metadata !1, null, metadata !"", i32 134, i64 32, i64 32, i32 0, i32 0, null, metadata !4, i32 0, null, null, null} ; [ DW_TAG_enumeration_type ] [line 134, size 32, align 32, offset 0] [def] [from ]
!4 = metadata !{metadata !5, metadata !6, metadata !7, metadata !8, metadata !9}
!5 = metadata !{i32 786472, metadata !"Ident1", i64 0} ; [ DW_TAG_enumerator ] [Ident1 :: 0]
!6 = metadata !{i32 786472, metadata !"Ident2", i64 10000} ; [ DW_TAG_enumerator ] [Ident2 :: 10000]
!7 = metadata !{i32 786472, metadata !"Ident3", i64 10001} ; [ DW_TAG_enumerator ] [Ident3 :: 10001]
!8 = metadata !{i32 786472, metadata !"Ident4", i64 10002} ; [ DW_TAG_enumerator ] [Ident4 :: 10002]
!9 = metadata !{i32 786472, metadata !"Ident5", i64 10003} ; [ DW_TAG_enumerator ] [Ident5 :: 10003]
!10 = metadata !{}
!11 = metadata !{metadata !12, metadata !20, metadata !23, metadata !44, metadata !48, metadata !52, metadata !53, metadata !54, metadata !58, metadata !61, metadata !69, metadata !73, metadata !77}
!12 = metadata !{i32 786478, metadata !1, metadata !13, metadata !"main", metadata !"main", metadata !"", i32 176, metadata !14, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 (i32, i8**)* @main, null, null, metadata !10, i32 179} ; [ DW_TAG_subprogram ] [line 176] [def] [scope 179] [main]
!13 = metadata !{i32 786473, metadata !1}         ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fldry.c]
!14 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !15, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!15 = metadata !{metadata !16, metadata !16, metadata !17}
!16 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!17 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !18} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!18 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !19} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!19 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!20 = metadata !{i32 786478, metadata !1, metadata !13, metadata !"Proc0", metadata !"Proc0", metadata !"", i32 199, metadata !21, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @Proc0, null, null, metadata !10, i32 200} ; [ DW_TAG_subprogram ] [line 199] [def] [scope 200] [Proc0]
!21 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !22, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!22 = metadata !{metadata !16}
!23 = metadata !{i32 786478, metadata !1, metadata !13, metadata !"Proc1", metadata !"Proc1", metadata !"", i32 326, metadata !24, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 (%struct.Record*)* @Proc1, null, null, metadata !10, i32 328} ; [ DW_TAG_subprogram ] [line 326] [def] [scope 328] [Proc1]
!24 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !25, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!25 = metadata !{metadata !16, metadata !26}
!26 = metadata !{i32 786454, metadata !1, null, metadata !"RecordPtr", i32 154, i64 0, i64 0, i64 0, i32 0, metadata !27} ; [ DW_TAG_typedef ] [RecordPtr] [line 154, size 0, align 0, offset 0] [from ]
!27 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !28} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from RecordType]
!28 = metadata !{i32 786454, metadata !1, null, metadata !"RecordType", i32 153, i64 0, i64 0, i64 0, i32 0, metadata !29} ; [ DW_TAG_typedef ] [RecordType] [line 153, size 0, align 0, offset 0] [from Record]
!29 = metadata !{i32 786451, metadata !1, null, metadata !"Record", i32 144, i64 448, i64 64, i32 0, i32 0, null, metadata !30, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [Record] [line 144, size 448, align 64, offset 0] [def] [from ]
!30 = metadata !{metadata !31, metadata !33, metadata !35, metadata !36, metadata !39}
!31 = metadata !{i32 786445, metadata !1, metadata !29, metadata !"PtrComp", i32 146, i64 64, i64 64, i64 0, i32 0, metadata !32} ; [ DW_TAG_member ] [PtrComp] [line 146, size 64, align 64, offset 0] [from ]
!32 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !29} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from Record]
!33 = metadata !{i32 786445, metadata !1, metadata !29, metadata !"Discr", i32 147, i64 32, i64 32, i64 64, i32 0, metadata !34} ; [ DW_TAG_member ] [Discr] [line 147, size 32, align 32, offset 64] [from Enumeration]
!34 = metadata !{i32 786454, metadata !1, null, metadata !"Enumeration", i32 134, i64 0, i64 0, i64 0, i32 0, metadata !3} ; [ DW_TAG_typedef ] [Enumeration] [line 134, size 0, align 0, offset 0] [from ]
!35 = metadata !{i32 786445, metadata !1, metadata !29, metadata !"EnumComp", i32 148, i64 32, i64 32, i64 96, i32 0, metadata !34} ; [ DW_TAG_member ] [EnumComp] [line 148, size 32, align 32, offset 96] [from Enumeration]
!36 = metadata !{i32 786445, metadata !1, metadata !29, metadata !"IntComp", i32 149, i64 64, i64 64, i64 128, i32 0, metadata !37} ; [ DW_TAG_member ] [IntComp] [line 149, size 64, align 64, offset 128] [from OneToFifty]
!37 = metadata !{i32 786454, metadata !1, null, metadata !"OneToFifty", i32 138, i64 0, i64 0, i64 0, i32 0, metadata !38} ; [ DW_TAG_typedef ] [OneToFifty] [line 138, size 0, align 0, offset 0] [from double]
!38 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!39 = metadata !{i32 786445, metadata !1, metadata !29, metadata !"StringComp", i32 150, i64 248, i64 8, i64 192, i32 0, metadata !40} ; [ DW_TAG_member ] [StringComp] [line 150, size 248, align 8, offset 192] [from String30]
!40 = metadata !{i32 786454, metadata !1, null, metadata !"String30", i32 140, i64 0, i64 0, i64 0, i32 0, metadata !41} ; [ DW_TAG_typedef ] [String30] [line 140, size 0, align 0, offset 0] [from ]
!41 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 248, i64 8, i32 0, i32 0, metadata !19, metadata !42, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 248, align 8, offset 0] [from char]
!42 = metadata !{metadata !43}
!43 = metadata !{i32 786465, i64 0, i64 31}       ; [ DW_TAG_subrange_type ] [0, 30]
!44 = metadata !{i32 786478, metadata !1, metadata !13, metadata !"Proc2", metadata !"Proc2", metadata !"", i32 350, metadata !45, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 (double*)* @Proc2, null, null, metadata !10, i32 352} ; [ DW_TAG_subprogram ] [line 350] [def] [scope 352] [Proc2]
!45 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !46, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!46 = metadata !{metadata !16, metadata !47}
!47 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !37} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from OneToFifty]
!48 = metadata !{i32 786478, metadata !1, metadata !13, metadata !"Proc3", metadata !"Proc3", metadata !"", i32 370, metadata !49, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 (%struct.Record**)* @Proc3, null, null, metadata !10, i32 372} ; [ DW_TAG_subprogram ] [line 370] [def] [scope 372] [Proc3]
!49 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !50, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!50 = metadata !{metadata !16, metadata !51}
!51 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !26} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from RecordPtr]
!52 = metadata !{i32 786478, metadata !1, metadata !13, metadata !"Proc4", metadata !"Proc4", metadata !"", i32 380, metadata !21, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @Proc4, null, null, metadata !10, i32 381} ; [ DW_TAG_subprogram ] [line 380] [def] [scope 381] [Proc4]
!53 = metadata !{i32 786478, metadata !1, metadata !13, metadata !"Proc5", metadata !"Proc5", metadata !"", i32 389, metadata !21, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @Proc5, null, null, metadata !10, i32 390} ; [ DW_TAG_subprogram ] [line 389] [def] [scope 390] [Proc5]
!54 = metadata !{i32 786478, metadata !1, metadata !13, metadata !"Proc6", metadata !"Proc6", metadata !"", i32 397, metadata !55, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 (i32, i32*)* @Proc6, null, null, metadata !10, i32 400} ; [ DW_TAG_subprogram ] [line 397] [def] [scope 400] [Proc6]
!55 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !56, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!56 = metadata !{metadata !16, metadata !34, metadata !57}
!57 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !34} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from Enumeration]
!58 = metadata !{i32 786478, metadata !1, metadata !13, metadata !"Proc7", metadata !"Proc7", metadata !"", i32 416, metadata !59, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 (double, double, double*)* @Proc7, null, null, metadata !10, i32 420} ; [ DW_TAG_subprogram ] [line 416] [def] [scope 420] [Proc7]
!59 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !60, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!60 = metadata !{metadata !16, metadata !37, metadata !37, metadata !47}
!61 = metadata !{i32 786478, metadata !1, metadata !13, metadata !"Proc8", metadata !"Proc8", metadata !"", i32 427, metadata !62, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 (double*, [51 x double]*, double, double)* @Proc8, null, null, metadata !10, i32 432} ; [ DW_TAG_subprogram ] [line 427] [def] [scope 432] [Proc8]
!62 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !63, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!63 = metadata !{metadata !16, metadata !64, metadata !65, metadata !37, metadata !37}
!64 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !38} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!65 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !66} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!66 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 3264, i64 64, i32 0, i32 0, metadata !38, metadata !67, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 3264, align 64, offset 0] [from double]
!67 = metadata !{metadata !68}
!68 = metadata !{i32 786465, i64 0, i64 51}       ; [ DW_TAG_subrange_type ] [0, 50]
!69 = metadata !{i32 786478, metadata !1, metadata !13, metadata !"Func1", metadata !"Func1", metadata !"", i32 447, metadata !70, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 (i32, i32)* @Func1, null, null, metadata !10, i32 450} ; [ DW_TAG_subprogram ] [line 447] [def] [scope 450] [Func1]
!70 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !71, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!71 = metadata !{metadata !34, metadata !72, metadata !72}
!72 = metadata !{i32 786454, metadata !1, null, metadata !"CapitalLetter", i32 139, i64 0, i64 0, i64 0, i32 0, metadata !19} ; [ DW_TAG_typedef ] [CapitalLetter] [line 139, size 0, align 0, offset 0] [from char]
!73 = metadata !{i32 786478, metadata !1, metadata !13, metadata !"Func2", metadata !"Func2", metadata !"", i32 462, metadata !74, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 (i8*, i8*)* @Func2, null, null, metadata !10, i32 465} ; [ DW_TAG_subprogram ] [line 462] [def] [scope 465] [Func2]
!74 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !75, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!75 = metadata !{metadata !76, metadata !18, metadata !18}
!76 = metadata !{i32 786454, metadata !1, null, metadata !"boolean", i32 155, i64 0, i64 0, i64 0, i32 0, metadata !16} ; [ DW_TAG_typedef ] [boolean] [line 155, size 0, align 0, offset 0] [from int]
!77 = metadata !{i32 786478, metadata !1, metadata !13, metadata !"Func3", metadata !"Func3", metadata !"", i32 492, metadata !78, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 (i32)* @Func3, null, null, metadata !10, i32 494} ; [ DW_TAG_subprogram ] [line 492] [def] [scope 494] [Func3]
!78 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !79, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!79 = metadata !{metadata !76, metadata !34}
!80 = metadata !{metadata !81, metadata !85, metadata !86, metadata !87, metadata !88, metadata !89, metadata !91, metadata !95, metadata !96}
!81 = metadata !{i32 786484, i32 0, null, metadata !"Version", metadata !"Version", metadata !"", metadata !13, i32 117, metadata !82, i32 0, i32 1, [4 x i8]* @Version, null} ; [ DW_TAG_variable ] [Version] [line 117] [def]
!82 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 32, i64 8, i32 0, i32 0, metadata !19, metadata !83, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 32, align 8, offset 0] [from char]
!83 = metadata !{metadata !84}
!84 = metadata !{i32 786465, i64 0, i64 4}        ; [ DW_TAG_subrange_type ] [0, 3]
!85 = metadata !{i32 786484, i32 0, null, metadata !"IntGlob", metadata !"IntGlob", metadata !"", metadata !13, i32 190, metadata !38, i32 0, i32 1, double* @IntGlob, null} ; [ DW_TAG_variable ] [IntGlob] [line 190] [def]
!86 = metadata !{i32 786484, i32 0, null, metadata !"BoolGlob", metadata !"BoolGlob", metadata !"", metadata !13, i32 191, metadata !76, i32 0, i32 1, i32* @BoolGlob, null} ; [ DW_TAG_variable ] [BoolGlob] [line 191] [def]
!87 = metadata !{i32 786484, i32 0, null, metadata !"Char1Glob", metadata !"Char1Glob", metadata !"", metadata !13, i32 192, metadata !19, i32 0, i32 1, i8* @Char1Glob, null} ; [ DW_TAG_variable ] [Char1Glob] [line 192] [def]
!88 = metadata !{i32 786484, i32 0, null, metadata !"Char2Glob", metadata !"Char2Glob", metadata !"", metadata !13, i32 193, metadata !19, i32 0, i32 1, i8* @Char2Glob, null} ; [ DW_TAG_variable ] [Char2Glob] [line 193] [def]
!89 = metadata !{i32 786484, i32 0, null, metadata !"Array1Glob", metadata !"Array1Glob", metadata !"", metadata !13, i32 194, metadata !90, i32 0, i32 1, [51 x double]* @Array1Glob, null} ; [ DW_TAG_variable ] [Array1Glob] [line 194] [def]
!90 = metadata !{i32 786454, metadata !1, null, metadata !"Array1Dim", i32 141, i64 0, i64 0, i64 0, i32 0, metadata !66} ; [ DW_TAG_typedef ] [Array1Dim] [line 141, size 0, align 0, offset 0] [from ]
!91 = metadata !{i32 786484, i32 0, null, metadata !"Array2Glob", metadata !"Array2Glob", metadata !"", metadata !13, i32 195, metadata !92, i32 0, i32 1, [51 x [51 x double]]* @Array2Glob, null} ; [ DW_TAG_variable ] [Array2Glob] [line 195] [def]
!92 = metadata !{i32 786454, metadata !1, null, metadata !"Array2Dim", i32 142, i64 0, i64 0, i64 0, i32 0, metadata !93} ; [ DW_TAG_typedef ] [Array2Dim] [line 142, size 0, align 0, offset 0] [from ]
!93 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 166464, i64 64, i32 0, i32 0, metadata !38, metadata !94, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 166464, align 64, offset 0] [from double]
!94 = metadata !{metadata !68, metadata !68}
!95 = metadata !{i32 786484, i32 0, null, metadata !"PtrGlb", metadata !"PtrGlb", metadata !"", metadata !13, i32 196, metadata !26, i32 0, i32 1, %struct.Record** @PtrGlb, null} ; [ DW_TAG_variable ] [PtrGlb] [line 196] [def]
!96 = metadata !{i32 786484, i32 0, null, metadata !"PtrGlbNext", metadata !"PtrGlbNext", metadata !"", metadata !13, i32 197, metadata !26, i32 0, i32 1, %struct.Record** @PtrGlbNext, null} ; [ DW_TAG_variable ] [PtrGlbNext] [line 197] [def]
!97 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!98 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!99 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!100 = metadata !{i32 786689, metadata !12, metadata !"argc", metadata !13, i32 16777393, metadata !16, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 177]
!101 = metadata !{i32 177, i32 0, metadata !12, null}
!102 = metadata !{i32 786689, metadata !12, metadata !"argv", metadata !13, i32 33554610, metadata !17, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 178]
!103 = metadata !{i32 178, i32 0, metadata !12, null}
!104 = metadata !{i32 180, i32 0, metadata !12, null}
!105 = metadata !{i32 183, i32 0, metadata !12, null}
!106 = metadata !{i32 184, i32 0, metadata !12, null}
!107 = metadata !{i32 786688, metadata !20, metadata !"IntLoc1", metadata !13, i32 201, metadata !37, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [IntLoc1] [line 201]
!108 = metadata !{i32 201, i32 0, metadata !20, null}
!109 = metadata !{i32 786688, metadata !20, metadata !"IntLoc2", metadata !13, i32 202, metadata !37, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [IntLoc2] [line 202]
!110 = metadata !{i32 202, i32 0, metadata !20, null}
!111 = metadata !{i32 786688, metadata !20, metadata !"IntLoc3", metadata !13, i32 203, metadata !37, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [IntLoc3] [line 203]
!112 = metadata !{i32 203, i32 0, metadata !20, null}
!113 = metadata !{i32 786688, metadata !20, metadata !"CharLoc", metadata !13, i32 204, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [CharLoc] [line 204]
!114 = metadata !{i32 204, i32 0, metadata !20, null}
!115 = metadata !{i32 786688, metadata !20, metadata !"CharIndex", metadata !13, i32 205, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [CharIndex] [line 205]
!116 = metadata !{i32 205, i32 0, metadata !20, null}
!117 = metadata !{i32 786688, metadata !20, metadata !"EnumLoc", metadata !13, i32 206, metadata !34, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [EnumLoc] [line 206]
!118 = metadata !{i32 206, i32 0, metadata !20, null}
!119 = metadata !{i32 786688, metadata !20, metadata !"String1Loc", metadata !13, i32 207, metadata !40, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [String1Loc] [line 207]
!120 = metadata !{i32 207, i32 0, metadata !20, null}
!121 = metadata !{i32 786688, metadata !20, metadata !"String2Loc", metadata !13, i32 208, metadata !40, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [String2Loc] [line 208]
!122 = metadata !{i32 208, i32 0, metadata !20, null}
!123 = metadata !{i32 786688, metadata !20, metadata !"i", metadata !13, i32 209, metadata !124, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 209]
!124 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!125 = metadata !{i32 209, i32 0, metadata !20, null}
!126 = metadata !{i32 786688, metadata !20, metadata !"starttime", metadata !13, i32 212, metadata !127, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [starttime] [line 212]
!127 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!128 = metadata !{i32 212, i32 0, metadata !20, null}
!129 = metadata !{i32 786688, metadata !20, metadata !"benchtime", metadata !13, i32 213, metadata !127, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [benchtime] [line 213]
!130 = metadata !{i32 213, i32 0, metadata !20, null}
!131 = metadata !{i32 786688, metadata !20, metadata !"nulltime", metadata !13, i32 214, metadata !127, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [nulltime] [line 214]
!132 = metadata !{i32 214, i32 0, metadata !20, null}
!133 = metadata !{i32 216, i32 0, metadata !20, null}
!134 = metadata !{i32 217, i32 0, metadata !135, null}
!135 = metadata !{i32 786443, metadata !1, metadata !20, i32 217, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fldry.c]
!136 = metadata !{i32 218, i32 0, metadata !20, null}
!137 = metadata !{i32 242, i32 0, metadata !20, null}
!138 = metadata !{i32 243, i32 0, metadata !20, null}
!139 = metadata !{i32 244, i32 0, metadata !20, null}
!140 = metadata !{i32 245, i32 0, metadata !20, null}
!141 = metadata !{i32 246, i32 0, metadata !20, null}
!142 = metadata !{i32 247, i32 0, metadata !20, null}
!143 = metadata !{i32 248, i32 0, metadata !20, null}
!144 = metadata !{i32 250, i32 0, metadata !20, null}
!145 = metadata !{i32 252, i32 0, metadata !20, null}
!146 = metadata !{i32 258, i32 0, metadata !20, null}
!147 = metadata !{i32 266, i32 0, metadata !148, null}
!148 = metadata !{i32 786443, metadata !1, metadata !20, i32 266, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fldry.c]
!149 = metadata !{i32 268, i32 0, metadata !150, null}
!150 = metadata !{i32 786443, metadata !1, metadata !148, i32 267, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fldry.c]
!151 = metadata !{i32 269, i32 0, metadata !150, null}
!152 = metadata !{i32 270, i32 0, metadata !150, null}
!153 = metadata !{i32 271, i32 0, metadata !150, null}
!154 = metadata !{i32 272, i32 0, metadata !150, null}
!155 = metadata !{i32 273, i32 0, metadata !150, null}
!156 = metadata !{i32 274, i32 0, metadata !150, null}
!157 = metadata !{i32 275, i32 0, metadata !150, null}
!158 = metadata !{i32 277, i32 0, metadata !159, null}
!159 = metadata !{i32 786443, metadata !1, metadata !150, i32 276, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fldry.c]
!160 = metadata !{i32 278, i32 0, metadata !159, null}
!161 = metadata !{i32 279, i32 0, metadata !159, null}
!162 = metadata !{i32 280, i32 0, metadata !159, null}
!163 = metadata !{i32 281, i32 0, metadata !150, null}
!164 = metadata !{i32 282, i32 0, metadata !150, null}
!165 = metadata !{i32 283, i32 0, metadata !166, null}
!166 = metadata !{i32 786443, metadata !1, metadata !150, i32 283, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fldry.c]
!167 = metadata !{i32 284, i32 0, metadata !168, null}
!168 = metadata !{i32 786443, metadata !1, metadata !166, i32 284, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fldry.c]
!169 = metadata !{i32 285, i32 0, metadata !168, null}
!170 = metadata !{i32 286, i32 0, metadata !150, null}
!171 = metadata !{i32 287, i32 0, metadata !150, null}
!172 = metadata !{i32 288, i32 0, metadata !150, null}
!173 = metadata !{i32 289, i32 0, metadata !150, null}
!174 = metadata !{i32 290, i32 0, metadata !150, null}
!175 = metadata !{i32 324, i32 0, metadata !20, null}
!176 = metadata !{i32 786689, metadata !23, metadata !"PtrParIn", metadata !13, i32 16777543, metadata !26, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [PtrParIn] [line 327]
!177 = metadata !{i32 327, i32 0, metadata !23, null}
!178 = metadata !{i32 332, i32 0, metadata !23, null}
!179 = metadata !{i32 333, i32 0, metadata !23, null}
!180 = metadata !{i32 334, i32 0, metadata !23, null}
!181 = metadata !{i32 348, i32 0, metadata !23, null}
!182 = metadata !{i32 786689, metadata !44, metadata !"IntParIO", metadata !13, i32 16777567, metadata !47, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [IntParIO] [line 351]
!183 = metadata !{i32 351, i32 0, metadata !44, null}
!184 = metadata !{i32 786688, metadata !44, metadata !"IntLoc", metadata !13, i32 353, metadata !37, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [IntLoc] [line 353]
!185 = metadata !{i32 353, i32 0, metadata !44, null}
!186 = metadata !{i32 786688, metadata !44, metadata !"EnumLoc", metadata !13, i32 354, metadata !34, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [EnumLoc] [line 354]
!187 = metadata !{i32 354, i32 0, metadata !44, null}
!188 = metadata !{i32 356, i32 0, metadata !44, null}
!189 = metadata !{i32 357, i32 0, metadata !190, null}
!190 = metadata !{i32 786443, metadata !1, metadata !44, i32 357, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fldry.c]
!191 = metadata !{i32 359, i32 0, metadata !192, null}
!192 = metadata !{i32 786443, metadata !1, metadata !193, i32 359, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fldry.c]
!193 = metadata !{i32 786443, metadata !1, metadata !190, i32 358, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fldry.c]
!194 = metadata !{i32 361, i32 0, metadata !195, null}
!195 = metadata !{i32 786443, metadata !1, metadata !192, i32 360, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fldry.c]
!196 = metadata !{i32 362, i32 0, metadata !195, null}
!197 = metadata !{i32 363, i32 0, metadata !195, null}
!198 = metadata !{i32 364, i32 0, metadata !195, null}
!199 = metadata !{i32 365, i32 0, metadata !200, null}
!200 = metadata !{i32 786443, metadata !1, metadata !193, i32 365, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fldry.c]
!201 = metadata !{i32 366, i32 0, metadata !200, null}
!202 = metadata !{i32 367, i32 0, metadata !193, null}
!203 = metadata !{i32 368, i32 0, metadata !44, null}
!204 = metadata !{i32 786689, metadata !48, metadata !"PtrParOut", metadata !13, i32 16777587, metadata !51, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [PtrParOut] [line 371]
!205 = metadata !{i32 371, i32 0, metadata !48, null}
!206 = metadata !{i32 373, i32 0, metadata !207, null}
!207 = metadata !{i32 786443, metadata !1, metadata !48, i32 373, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fldry.c]
!208 = metadata !{i32 374, i32 0, metadata !207, null}
!209 = metadata !{i32 376, i32 0, metadata !207, null}
!210 = metadata !{i32 377, i32 0, metadata !48, null}
!211 = metadata !{i32 378, i32 0, metadata !48, null}
!212 = metadata !{i32 786688, metadata !52, metadata !"BoolLoc", metadata !13, i32 382, metadata !76, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [BoolLoc] [line 382]
!213 = metadata !{i32 382, i32 0, metadata !52, null}
!214 = metadata !{i32 384, i32 0, metadata !52, null}
!215 = metadata !{i32 385, i32 0, metadata !52, null}
!216 = metadata !{i32 386, i32 0, metadata !52, null}
!217 = metadata !{i32 387, i32 0, metadata !52, null}
!218 = metadata !{i32 391, i32 0, metadata !53, null}
!219 = metadata !{i32 392, i32 0, metadata !53, null}
!220 = metadata !{i32 393, i32 0, metadata !53, null}
!221 = metadata !{i32 786689, metadata !54, metadata !"EnumParIn", metadata !13, i32 16777614, metadata !34, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [EnumParIn] [line 398]
!222 = metadata !{i32 398, i32 0, metadata !54, null}
!223 = metadata !{i32 786689, metadata !54, metadata !"EnumParOut", metadata !13, i32 33554831, metadata !57, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [EnumParOut] [line 399]
!224 = metadata !{i32 399, i32 0, metadata !54, null}
!225 = metadata !{i32 401, i32 0, metadata !54, null}
!226 = metadata !{i32 402, i32 0, metadata !227, null}
!227 = metadata !{i32 786443, metadata !1, metadata !54, i32 402, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fldry.c]
!228 = metadata !{i32 403, i32 0, metadata !227, null}
!229 = metadata !{i32 404, i32 0, metadata !54, null}
!230 = metadata !{i32 406, i32 0, metadata !231, null}
!231 = metadata !{i32 786443, metadata !1, metadata !54, i32 405, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fldry.c]
!232 = metadata !{i32 407, i32 0, metadata !233, null}
!233 = metadata !{i32 786443, metadata !1, metadata !231, i32 407, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fldry.c]
!234 = metadata !{i32 408, i32 0, metadata !233, null}
!235 = metadata !{i32 409, i32 0, metadata !231, null}
!236 = metadata !{i32 410, i32 0, metadata !231, null}
!237 = metadata !{i32 411, i32 0, metadata !231, null}
!238 = metadata !{i32 412, i32 0, metadata !231, null}
!239 = metadata !{i32 413, i32 0, metadata !231, null}
!240 = metadata !{i32 414, i32 0, metadata !54, null}
!241 = metadata !{i32 786689, metadata !58, metadata !"IntParI1", metadata !13, i32 16777633, metadata !37, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [IntParI1] [line 417]
!242 = metadata !{i32 417, i32 0, metadata !58, null}
!243 = metadata !{i32 786689, metadata !58, metadata !"IntParI2", metadata !13, i32 33554850, metadata !37, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [IntParI2] [line 418]
!244 = metadata !{i32 418, i32 0, metadata !58, null}
!245 = metadata !{i32 786689, metadata !58, metadata !"IntParOut", metadata !13, i32 50332067, metadata !47, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [IntParOut] [line 419]
!246 = metadata !{i32 419, i32 0, metadata !58, null}
!247 = metadata !{i32 786688, metadata !58, metadata !"IntLoc", metadata !13, i32 421, metadata !37, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [IntLoc] [line 421]
!248 = metadata !{i32 421, i32 0, metadata !58, null}
!249 = metadata !{i32 423, i32 0, metadata !58, null}
!250 = metadata !{i32 424, i32 0, metadata !58, null}
!251 = metadata !{i32 425, i32 0, metadata !58, null}
!252 = metadata !{i32 786689, metadata !61, metadata !"Array1Par", metadata !13, i32 16777644, metadata !64, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [Array1Par] [line 428]
!253 = metadata !{i32 428, i32 0, metadata !61, null}
!254 = metadata !{i32 786689, metadata !61, metadata !"Array2Par", metadata !13, i32 33554861, metadata !65, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [Array2Par] [line 429]
!255 = metadata !{i32 429, i32 0, metadata !61, null}
!256 = metadata !{i32 786689, metadata !61, metadata !"IntParI1", metadata !13, i32 50332078, metadata !37, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [IntParI1] [line 430]
!257 = metadata !{i32 430, i32 0, metadata !61, null}
!258 = metadata !{i32 786689, metadata !61, metadata !"IntParI2", metadata !13, i32 67109295, metadata !37, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [IntParI2] [line 431]
!259 = metadata !{i32 431, i32 0, metadata !61, null}
!260 = metadata !{i32 786688, metadata !61, metadata !"IntLoc", metadata !13, i32 433, metadata !37, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [IntLoc] [line 433]
!261 = metadata !{i32 433, i32 0, metadata !61, null}
!262 = metadata !{i32 786688, metadata !61, metadata !"IntIndex", metadata !13, i32 434, metadata !37, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [IntIndex] [line 434]
!263 = metadata !{i32 434, i32 0, metadata !61, null}
!264 = metadata !{i32 436, i32 0, metadata !61, null}
!265 = metadata !{i32 437, i32 0, metadata !61, null}
!266 = metadata !{i32 438, i32 0, metadata !61, null}
!267 = metadata !{i32 439, i32 0, metadata !61, null}
!268 = metadata !{i32 440, i32 0, metadata !269, null}
!269 = metadata !{i32 786443, metadata !1, metadata !61, i32 440, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fldry.c]
!270 = metadata !{i32 441, i32 0, metadata !269, null}
!271 = metadata !{i32 442, i32 0, metadata !61, null}
!272 = metadata !{i32 443, i32 0, metadata !61, null}
!273 = metadata !{i32 444, i32 0, metadata !61, null}
!274 = metadata !{i32 445, i32 0, metadata !61, null}
!275 = metadata !{i32 786689, metadata !69, metadata !"CharPar1", metadata !13, i32 16777664, metadata !72, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [CharPar1] [line 448]
!276 = metadata !{i32 448, i32 0, metadata !69, null}
!277 = metadata !{i32 786689, metadata !69, metadata !"CharPar2", metadata !13, i32 33554881, metadata !72, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [CharPar2] [line 449]
!278 = metadata !{i32 449, i32 0, metadata !69, null}
!279 = metadata !{i32 786688, metadata !69, metadata !"CharLoc1", metadata !13, i32 451, metadata !72, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [CharLoc1] [line 451]
!280 = metadata !{i32 451, i32 0, metadata !69, null}
!281 = metadata !{i32 786688, metadata !69, metadata !"CharLoc2", metadata !13, i32 452, metadata !72, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [CharLoc2] [line 452]
!282 = metadata !{i32 452, i32 0, metadata !69, null}
!283 = metadata !{i32 454, i32 0, metadata !69, null}
!284 = metadata !{i32 455, i32 0, metadata !69, null}
!285 = metadata !{i32 456, i32 0, metadata !286, null}
!286 = metadata !{i32 786443, metadata !1, metadata !69, i32 456, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fldry.c]
!287 = metadata !{i32 457, i32 0, metadata !286, null}
!288 = metadata !{i32 459, i32 0, metadata !286, null}
!289 = metadata !{i32 460, i32 0, metadata !69, null}
!290 = metadata !{i32 786689, metadata !73, metadata !"StrParI1", metadata !13, i32 16777679, metadata !18, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [StrParI1] [line 463]
!291 = metadata !{i32 463, i32 0, metadata !73, null}
!292 = metadata !{i32 786689, metadata !73, metadata !"StrParI2", metadata !13, i32 33554896, metadata !18, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [StrParI2] [line 464]
!293 = metadata !{i32 464, i32 0, metadata !73, null}
!294 = metadata !{i32 786688, metadata !73, metadata !"IntLoc", metadata !13, i32 466, metadata !295, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [IntLoc] [line 466]
!295 = metadata !{i32 786454, metadata !1, null, metadata !"OneToThirty", i32 137, i64 0, i64 0, i64 0, i32 0, metadata !38} ; [ DW_TAG_typedef ] [OneToThirty] [line 137, size 0, align 0, offset 0] [from double]
!296 = metadata !{i32 466, i32 0, metadata !73, null}
!297 = metadata !{i32 786688, metadata !73, metadata !"CharLoc", metadata !13, i32 467, metadata !72, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [CharLoc] [line 467]
!298 = metadata !{i32 467, i32 0, metadata !73, null}
!299 = metadata !{i32 469, i32 0, metadata !73, null}
!300 = metadata !{i32 470, i32 0, metadata !73, null}
!301 = metadata !{i32 471, i32 0, metadata !302, null}
!302 = metadata !{i32 786443, metadata !1, metadata !73, i32 471, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fldry.c]
!303 = metadata !{i32 473, i32 0, metadata !304, null}
!304 = metadata !{i32 786443, metadata !1, metadata !302, i32 472, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fldry.c]
!305 = metadata !{i32 474, i32 0, metadata !304, null}
!306 = metadata !{i32 475, i32 0, metadata !304, null}
!307 = metadata !{i32 475, i32 0, metadata !302, null}
!308 = metadata !{i32 476, i32 0, metadata !309, null}
!309 = metadata !{i32 786443, metadata !1, metadata !73, i32 476, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fldry.c]
!310 = metadata !{i32 477, i32 0, metadata !309, null}
!311 = metadata !{i32 478, i32 0, metadata !312, null}
!312 = metadata !{i32 786443, metadata !1, metadata !73, i32 478, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fldry.c]
!313 = metadata !{i32 479, i32 0, metadata !312, null}
!314 = metadata !{i32 482, i32 0, metadata !315, null}
!315 = metadata !{i32 786443, metadata !1, metadata !316, i32 482, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fldry.c]
!316 = metadata !{i32 786443, metadata !1, metadata !312, i32 481, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fldry.c]
!317 = metadata !{i32 484, i32 0, metadata !318, null}
!318 = metadata !{i32 786443, metadata !1, metadata !315, i32 483, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fldry.c]
!319 = metadata !{i32 485, i32 0, metadata !318, null}
!320 = metadata !{i32 488, i32 0, metadata !315, null}
!321 = metadata !{i32 490, i32 0, metadata !73, null}
!322 = metadata !{i32 786689, metadata !77, metadata !"EnumParIn", metadata !13, i32 16777709, metadata !34, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [EnumParIn] [line 493]
!323 = metadata !{i32 493, i32 0, metadata !77, null}
!324 = metadata !{i32 786688, metadata !77, metadata !"EnumLoc", metadata !13, i32 495, metadata !34, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [EnumLoc] [line 495]
!325 = metadata !{i32 495, i32 0, metadata !77, null}
!326 = metadata !{i32 497, i32 0, metadata !77, null}
!327 = metadata !{i32 498, i32 0, metadata !328, null}
!328 = metadata !{i32 786443, metadata !1, metadata !77, i32 498, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fldry.c]
!329 = metadata !{i32 499, i32 0, metadata !77, null}
!330 = metadata !{i32 500, i32 0, metadata !77, null}
