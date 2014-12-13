; ModuleID = 'misr.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.cells = type { i32, i32, %struct.cells* }

@reg_len = common global i32 0, align 4
@.str = private unnamed_addr constant [4 x i8] c"%hu\00", align 1
@.str1 = private unnamed_addr constant [30 x i8] c"Register too long; Max. = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [31 x i8] c"Prob. out of range 0=<Prob>=1\0A\00", align 1
@.str3 = private unnamed_addr constant [43 x i8] c"Structure does not match Register length:\0A\00", align 1
@.str4 = private unnamed_addr constant [75 x i8] c"reg_len\09#_vect\09prob      #_tms\09struct\09seed1\09seed2\09seed3\09Prob same output\0A \00", align 1
@.str5 = private unnamed_addr constant [32 x i8] c"%d\09%d\09%.3e %d\09%s\09%d\09%d\09%d\09%.8e\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %cell_array = alloca %struct.cells, align 8
  %num_vect = alloca i32, align 4
  %num_times = alloca i32, align 4
  %num_true = alloca i32, align 4
  %i = alloca i32, align 4
  %prob = alloca double, align 8
  %structure = alloca [100 x i8], align 16
  %seed = alloca [3 x i16], align 2
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !34), !dbg !35
  store i8** %argv, i8*** %3, align 8
  call void @llvm.dbg.declare(metadata !{i8*** %3}, metadata !36), !dbg !35
  call void @llvm.dbg.declare(metadata !{%struct.cells* %cell_array}, metadata !37), !dbg !38
  call void @llvm.dbg.declare(metadata !{i32* %num_vect}, metadata !39), !dbg !40
  call void @llvm.dbg.declare(metadata !{i32* %num_times}, metadata !41), !dbg !40
  call void @llvm.dbg.declare(metadata !{i32* %num_true}, metadata !42), !dbg !40
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !43), !dbg !40
  call void @llvm.dbg.declare(metadata !{double* %prob}, metadata !44), !dbg !45
  call void @llvm.dbg.declare(metadata !{[100 x i8]* %structure}, metadata !46), !dbg !50
  call void @llvm.dbg.declare(metadata !{[3 x i16]* %seed}, metadata !51), !dbg !56
  store i32 10, i32* %num_vect, align 4, !dbg !57
  store i32 10, i32* @reg_len, align 4, !dbg !57
  store double 2.500000e-01, double* %prob, align 8, !dbg !58
  store i32 100000, i32* %num_times, align 4, !dbg !59
  %4 = load i32* %2, align 4, !dbg !60
  %5 = icmp sgt i32 %4, 6, !dbg !60
  br i1 %5, label %6, label %12, !dbg !60

; <label>:6                                       ; preds = %0
  %7 = getelementptr inbounds [100 x i8]* %structure, i32 0, i32 0, !dbg !60
  %8 = load i8*** %3, align 8, !dbg !60
  %9 = getelementptr inbounds i8** %8, i64 6, !dbg !60
  %10 = load i8** %9, align 8, !dbg !60
  %11 = call i8* @strcpy(i8* %7, i8* %10) #5, !dbg !60
  br label %29, !dbg !60

; <label>:12                                      ; preds = %0
  store i32 1, i32* %i, align 4, !dbg !62
  br label %13, !dbg !62

; <label>:13                                      ; preds = %21, %12
  %14 = load i32* %i, align 4, !dbg !62
  %15 = load i32* @reg_len, align 4, !dbg !62
  %16 = icmp slt i32 %14, %15, !dbg !62
  br i1 %16, label %17, label %24, !dbg !62

; <label>:17                                      ; preds = %13
  %18 = load i32* %i, align 4, !dbg !65
  %19 = sext i32 %18 to i64, !dbg !65
  %20 = getelementptr inbounds [100 x i8]* %structure, i32 0, i64 %19, !dbg !65
  store i8 48, i8* %20, align 1, !dbg !65
  br label %21, !dbg !65

; <label>:21                                      ; preds = %17
  %22 = load i32* %i, align 4, !dbg !62
  %23 = add nsw i32 %22, 1, !dbg !62
  store i32 %23, i32* %i, align 4, !dbg !62
  br label %13, !dbg !62

; <label>:24                                      ; preds = %13
  %25 = getelementptr inbounds [100 x i8]* %structure, i32 0, i64 0, !dbg !66
  store i8 49, i8* %25, align 1, !dbg !66
  %26 = load i32* @reg_len, align 4, !dbg !67
  %27 = sext i32 %26 to i64, !dbg !67
  %28 = getelementptr inbounds [100 x i8]* %structure, i32 0, i64 %27, !dbg !67
  store i8 0, i8* %28, align 1, !dbg !67
  br label %29

; <label>:29                                      ; preds = %24, %6
  %30 = load i32* %2, align 4, !dbg !68
  %31 = icmp sgt i32 %30, 7, !dbg !68
  br i1 %31, label %32, label %38, !dbg !68

; <label>:32                                      ; preds = %29
  %33 = load i8*** %3, align 8, !dbg !68
  %34 = getelementptr inbounds i8** %33, i64 7, !dbg !68
  %35 = load i8** %34, align 8, !dbg !68
  %36 = getelementptr inbounds [3 x i16]* %seed, i32 0, i64 0, !dbg !68
  %37 = call i32 (i8*, i8*, ...)* @__isoc99_sscanf(i8* %35, i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i16* %36) #5, !dbg !68
  br label %40, !dbg !68

; <label>:38                                      ; preds = %29
  %39 = getelementptr inbounds [3 x i16]* %seed, i32 0, i64 0, !dbg !68
  store i16 1, i16* %39, align 2, !dbg !68
  br label %40

; <label>:40                                      ; preds = %38, %32
  %41 = load i32* %2, align 4, !dbg !70
  %42 = icmp sgt i32 %41, 8, !dbg !70
  br i1 %42, label %43, label %49, !dbg !70

; <label>:43                                      ; preds = %40
  %44 = load i8*** %3, align 8, !dbg !70
  %45 = getelementptr inbounds i8** %44, i64 8, !dbg !70
  %46 = load i8** %45, align 8, !dbg !70
  %47 = getelementptr inbounds [3 x i16]* %seed, i32 0, i64 1, !dbg !70
  %48 = call i32 (i8*, i8*, ...)* @__isoc99_sscanf(i8* %46, i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i16* %47) #5, !dbg !70
  br label %51, !dbg !70

; <label>:49                                      ; preds = %40
  %50 = getelementptr inbounds [3 x i16]* %seed, i32 0, i64 1, !dbg !70
  store i16 0, i16* %50, align 2, !dbg !70
  br label %51

; <label>:51                                      ; preds = %49, %43
  %52 = load i32* %2, align 4, !dbg !72
  %53 = icmp sgt i32 %52, 9, !dbg !72
  br i1 %53, label %54, label %60, !dbg !72

; <label>:54                                      ; preds = %51
  %55 = load i8*** %3, align 8, !dbg !72
  %56 = getelementptr inbounds i8** %55, i64 9, !dbg !72
  %57 = load i8** %56, align 8, !dbg !72
  %58 = getelementptr inbounds [3 x i16]* %seed, i32 0, i64 2, !dbg !72
  %59 = call i32 (i8*, i8*, ...)* @__isoc99_sscanf(i8* %57, i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i16* %58) #5, !dbg !72
  br label %62, !dbg !72

; <label>:60                                      ; preds = %51
  %61 = getelementptr inbounds [3 x i16]* %seed, i32 0, i64 2, !dbg !72
  store i16 0, i16* %61, align 2, !dbg !72
  br label %62

; <label>:62                                      ; preds = %60, %54
  %63 = load i32* @reg_len, align 4, !dbg !74
  %64 = icmp sgt i32 %63, 100, !dbg !74
  br i1 %64, label %65, label %67, !dbg !74

; <label>:65                                      ; preds = %62
  %66 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str1, i32 0, i32 0), i32 100), !dbg !76
  store i32 2, i32* %1, !dbg !78
  br label %146, !dbg !78

; <label>:67                                      ; preds = %62
  %68 = load double* %prob, align 8, !dbg !79
  %69 = fcmp ogt double %68, 1.000000e+00, !dbg !79
  br i1 %69, label %73, label %70, !dbg !79

; <label>:70                                      ; preds = %67
  %71 = load double* %prob, align 8, !dbg !79
  %72 = fcmp olt double %71, 0.000000e+00, !dbg !79
  br i1 %72, label %73, label %75, !dbg !79

; <label>:73                                      ; preds = %70, %67
  %74 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str2, i32 0, i32 0)), !dbg !81
  store i32 3, i32* %1, !dbg !83
  br label %146, !dbg !83

; <label>:75                                      ; preds = %70
  %76 = getelementptr inbounds [100 x i8]* %structure, i32 0, i32 0, !dbg !84
  %77 = call i64 @strlen(i8* %76) #6, !dbg !84
  %78 = load i32* @reg_len, align 4, !dbg !84
  %79 = sext i32 %78 to i64, !dbg !84
  %80 = icmp ne i64 %77, %79, !dbg !84
  br i1 %80, label %81, label %83, !dbg !84

; <label>:81                                      ; preds = %75
  %82 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([43 x i8]* @.str3, i32 0, i32 0)), !dbg !86
  store i32 4, i32* %1, !dbg !88
  br label %146, !dbg !88

; <label>:83                                      ; preds = %75
  %84 = getelementptr inbounds [3 x i16]* %seed, i32 0, i32 0, !dbg !89
  %85 = call i16* @seed48(i16* %84) #5, !dbg !89
  call void @create_link_list(%struct.cells* %cell_array), !dbg !90
  store i32 0, i32* %num_true, align 4, !dbg !91
  %86 = load i32* %num_vect, align 4, !dbg !92
  %87 = icmp ne i32 %86, 0, !dbg !92
  br i1 %87, label %88, label %104, !dbg !92

; <label>:88                                      ; preds = %83
  store i32 0, i32* %i, align 4, !dbg !94
  br label %89, !dbg !94

; <label>:89                                      ; preds = %100, %88
  %90 = load i32* %i, align 4, !dbg !94
  %91 = load i32* %num_times, align 4, !dbg !94
  %92 = icmp slt i32 %90, %91, !dbg !94
  br i1 %92, label %93, label %103, !dbg !94

; <label>:93                                      ; preds = %89
  call void @init(%struct.cells* %cell_array), !dbg !97
  %94 = load i32* %num_vect, align 4, !dbg !99
  %95 = load double* %prob, align 8, !dbg !99
  %96 = getelementptr inbounds [100 x i8]* %structure, i32 0, i32 0, !dbg !99
  %97 = call i32 @simulate(i32 %94, %struct.cells* %cell_array, double %95, i8* %96), !dbg !99
  %98 = load i32* %num_true, align 4, !dbg !99
  %99 = add nsw i32 %98, %97, !dbg !99
  store i32 %99, i32* %num_true, align 4, !dbg !99
  br label %100, !dbg !100

; <label>:100                                     ; preds = %93
  %101 = load i32* %i, align 4, !dbg !94
  %102 = add nsw i32 %101, 1, !dbg !94
  store i32 %102, i32* %i, align 4, !dbg !94
  br label %89, !dbg !94

; <label>:103                                     ; preds = %89
  br label %122, !dbg !101

; <label>:104                                     ; preds = %83
  call void @init(%struct.cells* %cell_array), !dbg !102
  %105 = load double* %prob, align 8, !dbg !104
  %106 = getelementptr inbounds [100 x i8]* %structure, i32 0, i32 0, !dbg !104
  %107 = call i32 @simulate(i32 10000, %struct.cells* %cell_array, double %105, i8* %106), !dbg !104
  store i32 0, i32* %i, align 4, !dbg !105
  br label %108, !dbg !105

; <label>:108                                     ; preds = %118, %104
  %109 = load i32* %i, align 4, !dbg !105
  %110 = load i32* %num_times, align 4, !dbg !105
  %111 = icmp slt i32 %109, %110, !dbg !105
  br i1 %111, label %112, label %121, !dbg !105

; <label>:112                                     ; preds = %108
  %113 = load double* %prob, align 8, !dbg !107
  %114 = getelementptr inbounds [100 x i8]* %structure, i32 0, i32 0, !dbg !107
  %115 = call i32 @simulate(i32 1, %struct.cells* %cell_array, double %113, i8* %114), !dbg !107
  %116 = load i32* %num_true, align 4, !dbg !107
  %117 = add nsw i32 %116, %115, !dbg !107
  store i32 %117, i32* %num_true, align 4, !dbg !107
  br label %118, !dbg !109

; <label>:118                                     ; preds = %112
  %119 = load i32* %i, align 4, !dbg !105
  %120 = add nsw i32 %119, 1, !dbg !105
  store i32 %120, i32* %i, align 4, !dbg !105
  br label %108, !dbg !105

; <label>:121                                     ; preds = %108
  br label %122

; <label>:122                                     ; preds = %121, %103
  %123 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([75 x i8]* @.str4, i32 0, i32 0)), !dbg !110
  %124 = load i32* @reg_len, align 4, !dbg !111
  %125 = load i32* %num_vect, align 4, !dbg !111
  %126 = load double* %prob, align 8, !dbg !111
  %127 = load i32* %num_times, align 4, !dbg !111
  %128 = getelementptr inbounds [100 x i8]* %structure, i32 0, i32 0, !dbg !111
  %129 = getelementptr inbounds [3 x i16]* %seed, i32 0, i64 0, !dbg !111
  %130 = load i16* %129, align 2, !dbg !111
  %131 = zext i16 %130 to i32, !dbg !111
  %132 = getelementptr inbounds [3 x i16]* %seed, i32 0, i64 1, !dbg !111
  %133 = load i16* %132, align 2, !dbg !111
  %134 = zext i16 %133 to i32, !dbg !111
  %135 = getelementptr inbounds [3 x i16]* %seed, i32 0, i64 2, !dbg !111
  %136 = load i16* %135, align 2, !dbg !111
  %137 = zext i16 %136 to i32, !dbg !111
  %138 = load i32* %num_times, align 4, !dbg !111
  %139 = load i32* %num_true, align 4, !dbg !111
  %140 = sub nsw i32 %138, %139, !dbg !111
  %141 = sitofp i32 %140 to double, !dbg !111
  %142 = load i32* %num_times, align 4, !dbg !111
  %143 = sitofp i32 %142 to double, !dbg !111
  %144 = fdiv double %141, %143, !dbg !111
  %145 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str5, i32 0, i32 0), i32 %124, i32 %125, double %126, i32 %127, i8* %128, i32 %131, i32 %134, i32 %137, double %144), !dbg !111
  store i32 0, i32* %1, !dbg !112
  br label %146, !dbg !112

; <label>:146                                     ; preds = %122, %81, %73, %65
  %147 = load i32* %1, !dbg !113
  ret i32 %147, !dbg !113
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind
declare i8* @strcpy(i8*, i8*) #2

; Function Attrs: nounwind
declare i32 @__isoc99_sscanf(i8*, i8*, ...) #2

declare i32 @printf(i8*, ...) #3

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #4

; Function Attrs: nounwind
declare i16* @seed48(i16*) #2

; Function Attrs: nounwind uwtable
define void @create_link_list(%struct.cells* %cell_array) #0 {
  %1 = alloca %struct.cells*, align 8
  %i = alloca i32, align 4
  %temp = alloca %struct.cells*, align 8
  %present = alloca %struct.cells*, align 8
  store %struct.cells* %cell_array, %struct.cells** %1, align 8
  call void @llvm.dbg.declare(metadata !{%struct.cells** %1}, metadata !114), !dbg !115
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !116), !dbg !117
  call void @llvm.dbg.declare(metadata !{%struct.cells** %temp}, metadata !118), !dbg !119
  call void @llvm.dbg.declare(metadata !{%struct.cells** %present}, metadata !120), !dbg !119
  %2 = load %struct.cells** %1, align 8, !dbg !121
  %3 = bitcast %struct.cells* %2 to i8*, !dbg !121
  call void @llvm.memset.p0i8.i64(i8* %3, i8 0, i64 16, i32 8, i1 false), !dbg !121
  %4 = load %struct.cells** %1, align 8, !dbg !122
  store %struct.cells* %4, %struct.cells** %present, align 8, !dbg !122
  store i32 0, i32* %i, align 4, !dbg !123
  br label %5, !dbg !123

; <label>:5                                       ; preds = %25, %0
  %6 = load i32* %i, align 4, !dbg !123
  %7 = load i32* @reg_len, align 4, !dbg !123
  %8 = add nsw i32 %7, 1, !dbg !123
  %9 = icmp slt i32 %6, %8, !dbg !123
  br i1 %9, label %10, label %28, !dbg !123

; <label>:10                                      ; preds = %5
  %11 = call noalias i8* @malloc(i64 16) #5, !dbg !125
  %12 = bitcast i8* %11 to %struct.cells*, !dbg !125
  store %struct.cells* %12, %struct.cells** %temp, align 8, !dbg !125
  %13 = load %struct.cells** %temp, align 8, !dbg !127
  %14 = getelementptr inbounds %struct.cells* %13, i32 0, i32 0, !dbg !127
  store i32 1, i32* %14, align 4, !dbg !127
  %15 = load %struct.cells** %temp, align 8, !dbg !128
  %16 = getelementptr inbounds %struct.cells* %15, i32 0, i32 1, !dbg !128
  store i32 1, i32* %16, align 4, !dbg !128
  %17 = load %struct.cells** %temp, align 8, !dbg !129
  %18 = getelementptr inbounds %struct.cells* %17, i32 0, i32 2, !dbg !129
  store %struct.cells* null, %struct.cells** %18, align 8, !dbg !129
  %19 = load %struct.cells** %temp, align 8, !dbg !130
  %20 = load %struct.cells** %present, align 8, !dbg !130
  %21 = getelementptr inbounds %struct.cells* %20, i32 0, i32 2, !dbg !130
  store %struct.cells* %19, %struct.cells** %21, align 8, !dbg !130
  %22 = load %struct.cells** %present, align 8, !dbg !131
  %23 = getelementptr inbounds %struct.cells* %22, i32 0, i32 2, !dbg !131
  %24 = load %struct.cells** %23, align 8, !dbg !131
  store %struct.cells* %24, %struct.cells** %present, align 8, !dbg !131
  br label %25, !dbg !132

; <label>:25                                      ; preds = %10
  %26 = load i32* %i, align 4, !dbg !123
  %27 = add nsw i32 %26, 1, !dbg !123
  store i32 %27, i32* %i, align 4, !dbg !123
  br label %5, !dbg !123

; <label>:28                                      ; preds = %5
  ret void, !dbg !133
}

; Function Attrs: nounwind uwtable
define void @init(%struct.cells* %present) #0 {
  %1 = alloca %struct.cells*, align 8
  store %struct.cells* %present, %struct.cells** %1, align 8
  call void @llvm.dbg.declare(metadata !{%struct.cells** %1}, metadata !134), !dbg !135
  br label %2, !dbg !136

; <label>:2                                       ; preds = %7, %0
  %3 = load %struct.cells** %1, align 8, !dbg !136
  %4 = getelementptr inbounds %struct.cells* %3, i32 0, i32 2, !dbg !136
  %5 = load %struct.cells** %4, align 8, !dbg !136
  %6 = icmp ne %struct.cells* %5, null, !dbg !136
  br i1 %6, label %7, label %16, !dbg !136

; <label>:7                                       ; preds = %2
  %8 = load %struct.cells** %1, align 8, !dbg !137
  %9 = getelementptr inbounds %struct.cells* %8, i32 0, i32 0, !dbg !137
  %10 = load i32* %9, align 4, !dbg !137
  %11 = load %struct.cells** %1, align 8, !dbg !137
  %12 = getelementptr inbounds %struct.cells* %11, i32 0, i32 1, !dbg !137
  store i32 %10, i32* %12, align 4, !dbg !137
  %13 = load %struct.cells** %1, align 8, !dbg !139
  %14 = getelementptr inbounds %struct.cells* %13, i32 0, i32 2, !dbg !139
  %15 = load %struct.cells** %14, align 8, !dbg !139
  store %struct.cells* %15, %struct.cells** %1, align 8, !dbg !139
  br label %2, !dbg !140

; <label>:16                                      ; preds = %2
  ret void, !dbg !141
}

; Function Attrs: nounwind uwtable
define i32 @simulate(i32 %iterations, %struct.cells* %present, double %prob, i8* %structure) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.cells*, align 8
  %3 = alloca double, align 8
  %4 = alloca i8*, align 8
  %temp = alloca %struct.cells*, align 8
  %different = alloca i32, align 4
  %savef_free = alloca i32, align 4
  %savefaulty = alloca i32, align 4
  %rem = alloca i32, align 4
  %quot = alloca i32, align 4
  %h = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %randv = alloca i64, align 8
  %randprob = alloca double, align 8
  store i32 %iterations, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !142), !dbg !143
  store %struct.cells* %present, %struct.cells** %2, align 8
  call void @llvm.dbg.declare(metadata !{%struct.cells** %2}, metadata !144), !dbg !143
  store double %prob, double* %3, align 8
  call void @llvm.dbg.declare(metadata !{double* %3}, metadata !145), !dbg !143
  store i8* %structure, i8** %4, align 8
  call void @llvm.dbg.declare(metadata !{i8** %4}, metadata !146), !dbg !143
  call void @llvm.dbg.declare(metadata !{%struct.cells** %temp}, metadata !147), !dbg !148
  call void @llvm.dbg.declare(metadata !{i32* %different}, metadata !149), !dbg !150
  call void @llvm.dbg.declare(metadata !{i32* %savef_free}, metadata !151), !dbg !150
  call void @llvm.dbg.declare(metadata !{i32* %savefaulty}, metadata !152), !dbg !150
  call void @llvm.dbg.declare(metadata !{i32* %rem}, metadata !153), !dbg !154
  call void @llvm.dbg.declare(metadata !{i32* %quot}, metadata !155), !dbg !154
  call void @llvm.dbg.declare(metadata !{i32* %h}, metadata !156), !dbg !154
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !157), !dbg !154
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !158), !dbg !154
  call void @llvm.dbg.declare(metadata !{i64* %randv}, metadata !159), !dbg !161
  call void @llvm.dbg.declare(metadata !{double* %randprob}, metadata !162), !dbg !163
  store i32 0, i32* %different, align 4, !dbg !164
  %5 = load i32* @reg_len, align 4, !dbg !165
  %6 = sub nsw i32 %5, 1, !dbg !165
  %7 = sdiv i32 %6, 31, !dbg !165
  store i32 %7, i32* %quot, align 4, !dbg !165
  %8 = load i32* @reg_len, align 4, !dbg !166
  %9 = sub nsw i32 %8, 1, !dbg !166
  %10 = srem i32 %9, 31, !dbg !166
  store i32 %10, i32* %rem, align 4, !dbg !166
  %11 = load %struct.cells** %2, align 8, !dbg !167
  store %struct.cells* %11, %struct.cells** %temp, align 8, !dbg !167
  store i32 0, i32* %h, align 4, !dbg !168
  br label %12, !dbg !168

; <label>:12                                      ; preds = %218, %0
  %13 = load i32* %h, align 4, !dbg !168
  %14 = load i32* %1, align 4, !dbg !168
  %15 = icmp slt i32 %13, %14, !dbg !168
  br i1 %15, label %16, label %221, !dbg !168

; <label>:16                                      ; preds = %12
  store i32 0, i32* %savef_free, align 4, !dbg !170
  store i32 0, i32* %savefaulty, align 4, !dbg !172
  store i32 0, i32* %i, align 4, !dbg !173
  br label %17, !dbg !173

; <label>:17                                      ; preds = %93, %16
  %18 = load i32* %i, align 4, !dbg !173
  %19 = load i32* %quot, align 4, !dbg !173
  %20 = icmp slt i32 %18, %19, !dbg !173
  br i1 %20, label %21, label %96, !dbg !173

; <label>:21                                      ; preds = %17
  %22 = call i64 @lrand48() #5, !dbg !175
  store i64 %22, i64* %randv, align 8, !dbg !175
  store i32 0, i32* %j, align 4, !dbg !177
  br label %23, !dbg !177

; <label>:23                                      ; preds = %89, %21
  %24 = load i32* %j, align 4, !dbg !177
  %25 = icmp slt i32 %24, 31, !dbg !177
  br i1 %25, label %26, label %92, !dbg !177

; <label>:26                                      ; preds = %23
  %27 = load i32* %i, align 4, !dbg !179
  %28 = mul nsw i32 %27, 31, !dbg !179
  %29 = load i32* %j, align 4, !dbg !179
  %30 = add nsw i32 %28, %29, !dbg !179
  %31 = sext i32 %30 to i64, !dbg !179
  %32 = load i8** %4, align 8, !dbg !179
  %33 = getelementptr inbounds i8* %32, i64 %31, !dbg !179
  %34 = load i8* %33, align 1, !dbg !179
  %35 = sext i8 %34 to i32, !dbg !179
  %36 = icmp eq i32 %35, 49, !dbg !179
  br i1 %36, label %37, label %48, !dbg !179

; <label>:37                                      ; preds = %26
  %38 = load %struct.cells** %temp, align 8, !dbg !182
  %39 = getelementptr inbounds %struct.cells* %38, i32 0, i32 0, !dbg !182
  %40 = load i32* %39, align 4, !dbg !182
  %41 = load i32* %savef_free, align 4, !dbg !182
  %42 = add nsw i32 %41, %40, !dbg !182
  store i32 %42, i32* %savef_free, align 4, !dbg !182
  %43 = load %struct.cells** %temp, align 8, !dbg !184
  %44 = getelementptr inbounds %struct.cells* %43, i32 0, i32 1, !dbg !184
  %45 = load i32* %44, align 4, !dbg !184
  %46 = load i32* %savefaulty, align 4, !dbg !184
  %47 = add nsw i32 %46, %45, !dbg !184
  store i32 %47, i32* %savefaulty, align 4, !dbg !184
  br label %48, !dbg !185

; <label>:48                                      ; preds = %37, %26
  %49 = load %struct.cells** %temp, align 8, !dbg !186
  %50 = getelementptr inbounds %struct.cells* %49, i32 0, i32 2, !dbg !186
  %51 = load %struct.cells** %50, align 8, !dbg !186
  %52 = getelementptr inbounds %struct.cells* %51, i32 0, i32 0, !dbg !186
  %53 = load i32* %52, align 4, !dbg !186
  %54 = sext i32 %53 to i64, !dbg !186
  %55 = load i64* %randv, align 8, !dbg !186
  %56 = add nsw i64 %54, %55, !dbg !186
  %57 = and i64 %56, 1, !dbg !186
  %58 = trunc i64 %57 to i32, !dbg !186
  %59 = load %struct.cells** %temp, align 8, !dbg !186
  %60 = getelementptr inbounds %struct.cells* %59, i32 0, i32 0, !dbg !186
  store i32 %58, i32* %60, align 4, !dbg !186
  %61 = call i64 @lrand48() #5, !dbg !187
  %62 = srem i64 %61, 1000, !dbg !187
  %63 = sitofp i64 %62 to double, !dbg !187
  %64 = fdiv double %63, 1.000000e+03, !dbg !187
  store double %64, double* %randprob, align 8, !dbg !187
  %65 = load double* %3, align 8, !dbg !188
  %66 = load double* %randprob, align 8, !dbg !188
  %67 = fcmp ogt double %65, %66, !dbg !188
  br i1 %67, label %68, label %71, !dbg !188

; <label>:68                                      ; preds = %48
  %69 = load i64* %randv, align 8, !dbg !188
  %70 = xor i64 %69, 1, !dbg !188
  store i64 %70, i64* %randv, align 8, !dbg !188
  br label %71, !dbg !188

; <label>:71                                      ; preds = %68, %48
  %72 = load %struct.cells** %temp, align 8, !dbg !190
  %73 = getelementptr inbounds %struct.cells* %72, i32 0, i32 2, !dbg !190
  %74 = load %struct.cells** %73, align 8, !dbg !190
  %75 = getelementptr inbounds %struct.cells* %74, i32 0, i32 1, !dbg !190
  %76 = load i32* %75, align 4, !dbg !190
  %77 = sext i32 %76 to i64, !dbg !190
  %78 = load i64* %randv, align 8, !dbg !190
  %79 = add nsw i64 %77, %78, !dbg !190
  %80 = and i64 %79, 1, !dbg !190
  %81 = trunc i64 %80 to i32, !dbg !190
  %82 = load %struct.cells** %temp, align 8, !dbg !190
  %83 = getelementptr inbounds %struct.cells* %82, i32 0, i32 1, !dbg !190
  store i32 %81, i32* %83, align 4, !dbg !190
  %84 = load %struct.cells** %temp, align 8, !dbg !191
  %85 = getelementptr inbounds %struct.cells* %84, i32 0, i32 2, !dbg !191
  %86 = load %struct.cells** %85, align 8, !dbg !191
  store %struct.cells* %86, %struct.cells** %temp, align 8, !dbg !191
  %87 = load i64* %randv, align 8, !dbg !192
  %88 = ashr i64 %87, 1, !dbg !192
  store i64 %88, i64* %randv, align 8, !dbg !192
  br label %89, !dbg !193

; <label>:89                                      ; preds = %71
  %90 = load i32* %j, align 4, !dbg !177
  %91 = add nsw i32 %90, 1, !dbg !177
  store i32 %91, i32* %j, align 4, !dbg !177
  br label %23, !dbg !177

; <label>:92                                      ; preds = %23
  br label %93, !dbg !194

; <label>:93                                      ; preds = %92
  %94 = load i32* %i, align 4, !dbg !173
  %95 = add nsw i32 %94, 1, !dbg !173
  store i32 %95, i32* %i, align 4, !dbg !173
  br label %17, !dbg !173

; <label>:96                                      ; preds = %17
  %97 = call i64 @lrand48() #5, !dbg !195
  store i64 %97, i64* %randv, align 8, !dbg !195
  store i32 0, i32* %j, align 4, !dbg !196
  br label %98, !dbg !196

; <label>:98                                      ; preds = %165, %96
  %99 = load i32* %j, align 4, !dbg !196
  %100 = load i32* %rem, align 4, !dbg !196
  %101 = icmp slt i32 %99, %100, !dbg !196
  br i1 %101, label %102, label %168, !dbg !196

; <label>:102                                     ; preds = %98
  %103 = load i32* %quot, align 4, !dbg !198
  %104 = mul nsw i32 %103, 31, !dbg !198
  %105 = load i32* %j, align 4, !dbg !198
  %106 = add nsw i32 %104, %105, !dbg !198
  %107 = sext i32 %106 to i64, !dbg !198
  %108 = load i8** %4, align 8, !dbg !198
  %109 = getelementptr inbounds i8* %108, i64 %107, !dbg !198
  %110 = load i8* %109, align 1, !dbg !198
  %111 = sext i8 %110 to i32, !dbg !198
  %112 = icmp eq i32 %111, 49, !dbg !198
  br i1 %112, label %113, label %124, !dbg !198

; <label>:113                                     ; preds = %102
  %114 = load %struct.cells** %temp, align 8, !dbg !201
  %115 = getelementptr inbounds %struct.cells* %114, i32 0, i32 0, !dbg !201
  %116 = load i32* %115, align 4, !dbg !201
  %117 = load i32* %savef_free, align 4, !dbg !201
  %118 = add nsw i32 %117, %116, !dbg !201
  store i32 %118, i32* %savef_free, align 4, !dbg !201
  %119 = load %struct.cells** %temp, align 8, !dbg !203
  %120 = getelementptr inbounds %struct.cells* %119, i32 0, i32 1, !dbg !203
  %121 = load i32* %120, align 4, !dbg !203
  %122 = load i32* %savefaulty, align 4, !dbg !203
  %123 = add nsw i32 %122, %121, !dbg !203
  store i32 %123, i32* %savefaulty, align 4, !dbg !203
  br label %124, !dbg !204

; <label>:124                                     ; preds = %113, %102
  %125 = load %struct.cells** %temp, align 8, !dbg !205
  %126 = getelementptr inbounds %struct.cells* %125, i32 0, i32 2, !dbg !205
  %127 = load %struct.cells** %126, align 8, !dbg !205
  %128 = getelementptr inbounds %struct.cells* %127, i32 0, i32 0, !dbg !205
  %129 = load i32* %128, align 4, !dbg !205
  %130 = sext i32 %129 to i64, !dbg !205
  %131 = load i64* %randv, align 8, !dbg !205
  %132 = add nsw i64 %130, %131, !dbg !205
  %133 = and i64 %132, 1, !dbg !205
  %134 = trunc i64 %133 to i32, !dbg !205
  %135 = load %struct.cells** %temp, align 8, !dbg !205
  %136 = getelementptr inbounds %struct.cells* %135, i32 0, i32 0, !dbg !205
  store i32 %134, i32* %136, align 4, !dbg !205
  %137 = call i64 @lrand48() #5, !dbg !206
  %138 = srem i64 %137, 1000, !dbg !206
  %139 = sitofp i64 %138 to double, !dbg !206
  %140 = fdiv double %139, 1.000000e+03, !dbg !206
  store double %140, double* %randprob, align 8, !dbg !206
  %141 = load double* %3, align 8, !dbg !207
  %142 = load double* %randprob, align 8, !dbg !207
  %143 = fcmp ogt double %141, %142, !dbg !207
  br i1 %143, label %144, label %147, !dbg !207

; <label>:144                                     ; preds = %124
  %145 = load i64* %randv, align 8, !dbg !207
  %146 = xor i64 %145, 1, !dbg !207
  store i64 %146, i64* %randv, align 8, !dbg !207
  br label %147, !dbg !207

; <label>:147                                     ; preds = %144, %124
  %148 = load %struct.cells** %temp, align 8, !dbg !209
  %149 = getelementptr inbounds %struct.cells* %148, i32 0, i32 2, !dbg !209
  %150 = load %struct.cells** %149, align 8, !dbg !209
  %151 = getelementptr inbounds %struct.cells* %150, i32 0, i32 1, !dbg !209
  %152 = load i32* %151, align 4, !dbg !209
  %153 = sext i32 %152 to i64, !dbg !209
  %154 = load i64* %randv, align 8, !dbg !209
  %155 = add nsw i64 %153, %154, !dbg !209
  %156 = and i64 %155, 1, !dbg !209
  %157 = trunc i64 %156 to i32, !dbg !209
  %158 = load %struct.cells** %temp, align 8, !dbg !209
  %159 = getelementptr inbounds %struct.cells* %158, i32 0, i32 1, !dbg !209
  store i32 %157, i32* %159, align 4, !dbg !209
  %160 = load %struct.cells** %temp, align 8, !dbg !210
  %161 = getelementptr inbounds %struct.cells* %160, i32 0, i32 2, !dbg !210
  %162 = load %struct.cells** %161, align 8, !dbg !210
  store %struct.cells* %162, %struct.cells** %temp, align 8, !dbg !210
  %163 = load i64* %randv, align 8, !dbg !211
  %164 = ashr i64 %163, 1, !dbg !211
  store i64 %164, i64* %randv, align 8, !dbg !211
  br label %165, !dbg !212

; <label>:165                                     ; preds = %147
  %166 = load i32* %j, align 4, !dbg !196
  %167 = add nsw i32 %166, 1, !dbg !196
  store i32 %167, i32* %j, align 4, !dbg !196
  br label %98, !dbg !196

; <label>:168                                     ; preds = %98
  %169 = call i64 @lrand48() #5, !dbg !213
  store i64 %169, i64* %randv, align 8, !dbg !213
  %170 = load i32* @reg_len, align 4, !dbg !214
  %171 = sub nsw i32 %170, 1, !dbg !214
  %172 = sext i32 %171 to i64, !dbg !214
  %173 = load i8** %4, align 8, !dbg !214
  %174 = getelementptr inbounds i8* %173, i64 %172, !dbg !214
  %175 = load i8* %174, align 1, !dbg !214
  %176 = sext i8 %175 to i32, !dbg !214
  %177 = icmp eq i32 %176, 49, !dbg !214
  br i1 %177, label %178, label %189, !dbg !214

; <label>:178                                     ; preds = %168
  %179 = load %struct.cells** %temp, align 8, !dbg !216
  %180 = getelementptr inbounds %struct.cells* %179, i32 0, i32 0, !dbg !216
  %181 = load i32* %180, align 4, !dbg !216
  %182 = load i32* %savef_free, align 4, !dbg !216
  %183 = add nsw i32 %182, %181, !dbg !216
  store i32 %183, i32* %savef_free, align 4, !dbg !216
  %184 = load %struct.cells** %temp, align 8, !dbg !218
  %185 = getelementptr inbounds %struct.cells* %184, i32 0, i32 1, !dbg !218
  %186 = load i32* %185, align 4, !dbg !218
  %187 = load i32* %savefaulty, align 4, !dbg !218
  %188 = add nsw i32 %187, %186, !dbg !218
  store i32 %188, i32* %savefaulty, align 4, !dbg !218
  br label %189, !dbg !219

; <label>:189                                     ; preds = %178, %168
  %190 = load i32* %savef_free, align 4, !dbg !220
  %191 = sext i32 %190 to i64, !dbg !220
  %192 = load i64* %randv, align 8, !dbg !220
  %193 = add nsw i64 %191, %192, !dbg !220
  %194 = and i64 %193, 1, !dbg !220
  %195 = trunc i64 %194 to i32, !dbg !220
  %196 = load %struct.cells** %temp, align 8, !dbg !220
  %197 = getelementptr inbounds %struct.cells* %196, i32 0, i32 0, !dbg !220
  store i32 %195, i32* %197, align 4, !dbg !220
  %198 = call i64 @lrand48() #5, !dbg !221
  %199 = srem i64 %198, 10000, !dbg !221
  %200 = sitofp i64 %199 to double, !dbg !221
  %201 = fdiv double %200, 1.000000e+04, !dbg !221
  store double %201, double* %randprob, align 8, !dbg !221
  %202 = load double* %3, align 8, !dbg !222
  %203 = load double* %randprob, align 8, !dbg !222
  %204 = fcmp ogt double %202, %203, !dbg !222
  br i1 %204, label %205, label %208, !dbg !222

; <label>:205                                     ; preds = %189
  %206 = load i64* %randv, align 8, !dbg !222
  %207 = xor i64 %206, 1, !dbg !222
  store i64 %207, i64* %randv, align 8, !dbg !222
  br label %208, !dbg !222

; <label>:208                                     ; preds = %205, %189
  %209 = load i32* %savefaulty, align 4, !dbg !224
  %210 = sext i32 %209 to i64, !dbg !224
  %211 = load i64* %randv, align 8, !dbg !224
  %212 = add nsw i64 %210, %211, !dbg !224
  %213 = and i64 %212, 1, !dbg !224
  %214 = trunc i64 %213 to i32, !dbg !224
  %215 = load %struct.cells** %temp, align 8, !dbg !224
  %216 = getelementptr inbounds %struct.cells* %215, i32 0, i32 1, !dbg !224
  store i32 %214, i32* %216, align 4, !dbg !224
  %217 = load %struct.cells** %2, align 8, !dbg !225
  store %struct.cells* %217, %struct.cells** %temp, align 8, !dbg !225
  br label %218, !dbg !226

; <label>:218                                     ; preds = %208
  %219 = load i32* %h, align 4, !dbg !168
  %220 = add nsw i32 %219, 1, !dbg !168
  store i32 %220, i32* %h, align 4, !dbg !168
  br label %12, !dbg !168

; <label>:221                                     ; preds = %12
  store i32 0, i32* %i, align 4, !dbg !227
  br label %222, !dbg !227

; <label>:222                                     ; preds = %239, %221
  %223 = load i32* %i, align 4, !dbg !227
  %224 = load i32* @reg_len, align 4, !dbg !227
  %225 = icmp slt i32 %223, %224, !dbg !227
  br i1 %225, label %226, label %242, !dbg !227

; <label>:226                                     ; preds = %222
  %227 = load %struct.cells** %temp, align 8, !dbg !229
  %228 = getelementptr inbounds %struct.cells* %227, i32 0, i32 0, !dbg !229
  %229 = load i32* %228, align 4, !dbg !229
  %230 = load %struct.cells** %temp, align 8, !dbg !229
  %231 = getelementptr inbounds %struct.cells* %230, i32 0, i32 1, !dbg !229
  %232 = load i32* %231, align 4, !dbg !229
  %233 = icmp ne i32 %229, %232, !dbg !229
  br i1 %233, label %234, label %235, !dbg !229

; <label>:234                                     ; preds = %226
  store i32 1, i32* %different, align 4, !dbg !229
  br label %235, !dbg !229

; <label>:235                                     ; preds = %234, %226
  %236 = load %struct.cells** %temp, align 8, !dbg !232
  %237 = getelementptr inbounds %struct.cells* %236, i32 0, i32 2, !dbg !232
  %238 = load %struct.cells** %237, align 8, !dbg !232
  store %struct.cells* %238, %struct.cells** %temp, align 8, !dbg !232
  br label %239, !dbg !233

; <label>:239                                     ; preds = %235
  %240 = load i32* %i, align 4, !dbg !227
  %241 = add nsw i32 %240, 1, !dbg !227
  store i32 %241, i32* %i, align 4, !dbg !227
  br label %222, !dbg !227

; <label>:242                                     ; preds = %222
  %243 = load i32* %different, align 4, !dbg !234
  ret i32 %243, !dbg !234
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #5

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind uwtable
define void @kill_list(%struct.cells* %present) #0 {
  %1 = alloca %struct.cells*, align 8
  %temp = alloca %struct.cells*, align 8
  store %struct.cells* %present, %struct.cells** %1, align 8
  call void @llvm.dbg.declare(metadata !{%struct.cells** %1}, metadata !235), !dbg !236
  call void @llvm.dbg.declare(metadata !{%struct.cells** %temp}, metadata !237), !dbg !238
  br label %2, !dbg !239

; <label>:2                                       ; preds = %5, %0
  %3 = load %struct.cells** %1, align 8, !dbg !239
  %4 = icmp ne %struct.cells* %3, null, !dbg !239
  br i1 %4, label %5, label %12, !dbg !239

; <label>:5                                       ; preds = %2
  %6 = load %struct.cells** %1, align 8, !dbg !240
  %7 = getelementptr inbounds %struct.cells* %6, i32 0, i32 2, !dbg !240
  %8 = load %struct.cells** %7, align 8, !dbg !240
  store %struct.cells* %8, %struct.cells** %temp, align 8, !dbg !240
  %9 = load %struct.cells** %1, align 8, !dbg !242
  %10 = bitcast %struct.cells* %9 to i8*, !dbg !242
  call void @free(i8* %10) #5, !dbg !242
  %11 = load %struct.cells** %temp, align 8, !dbg !243
  store %struct.cells* %11, %struct.cells** %1, align 8, !dbg !243
  br label %2, !dbg !244

; <label>:12                                      ; preds = %2
  ret void, !dbg !245
}

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: nounwind
declare i64 @lrand48() #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!31, !32}
!llvm.ident = !{!33}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !29, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c] [DW_LANG_C99]
!1 = metadata !{metadata !"misr.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !12, metadata !23, metadata !24, metadata !25}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 65, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main, null, null, metadata !2, i32 66} ; [ DW_TAG_subprogram ] [line 65] [def] [scope 66] [main]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !9}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!11 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"create_link_list", metadata !"create_link_list", metadata !"", i32 165, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.cells*)* @create_link_list, null, null, metadata !2, i32 166} ; [ DW_TAG_subprogram ] [line 165] [def] [scope 166] [create_link_list]
!13 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = metadata !{null, metadata !15}
!15 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !16} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from misr_type]
!16 = metadata !{i32 786454, metadata !1, null, metadata !"misr_type", i32 54, i64 0, i64 0, i64 0, i32 0, metadata !17} ; [ DW_TAG_typedef ] [misr_type] [line 54, size 0, align 0, offset 0] [from cells]
!17 = metadata !{i32 786451, metadata !1, null, metadata !"cells", i32 50, i64 128, i64 64, i32 0, i32 0, null, metadata !18, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [cells] [line 50, size 128, align 64, offset 0] [def] [from ]
!18 = metadata !{metadata !19, metadata !20, metadata !21}
!19 = metadata !{i32 786445, metadata !1, metadata !17, metadata !"f_free", i32 51, i64 32, i64 32, i64 0, i32 0, metadata !8} ; [ DW_TAG_member ] [f_free] [line 51, size 32, align 32, offset 0] [from int]
!20 = metadata !{i32 786445, metadata !1, metadata !17, metadata !"faulty", i32 52, i64 32, i64 32, i64 32, i32 0, metadata !8} ; [ DW_TAG_member ] [faulty] [line 52, size 32, align 32, offset 32] [from int]
!21 = metadata !{i32 786445, metadata !1, metadata !17, metadata !"next", i32 53, i64 64, i64 64, i64 64, i32 0, metadata !22} ; [ DW_TAG_member ] [next] [line 53, size 64, align 64, offset 64] [from ]
!22 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !17} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cells]
!23 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"kill_list", metadata !"kill_list", metadata !"", i32 187, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.cells*)* @kill_list, null, null, metadata !2, i32 188} ; [ DW_TAG_subprogram ] [line 187] [def] [scope 188] [kill_list]
!24 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"init", metadata !"init", metadata !"", i32 204, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.cells*)* @init, null, null, metadata !2, i32 205} ; [ DW_TAG_subprogram ] [line 204] [def] [scope 205] [init]
!25 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"simulate", metadata !"simulate", metadata !"", i32 220, metadata !26, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, %struct.cells*, double, i8*)* @simulate, null, null, metadata !2, i32 221} ; [ DW_TAG_subprogram ] [line 220] [def] [scope 221] [simulate]
!26 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !27, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!27 = metadata !{metadata !8, metadata !8, metadata !15, metadata !28, metadata !10}
!28 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!29 = metadata !{metadata !30}
!30 = metadata !{i32 786484, i32 0, null, metadata !"reg_len", metadata !"reg_len", metadata !"", metadata !5, i32 48, metadata !8, i32 0, i32 1, i32* @reg_len, null} ; [ DW_TAG_variable ] [reg_len] [line 48] [def]
!31 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!32 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!33 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!34 = metadata !{i32 786689, metadata !4, metadata !"argc", metadata !5, i32 16777281, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 65]
!35 = metadata !{i32 65, i32 0, metadata !4, null}
!36 = metadata !{i32 786689, metadata !4, metadata !"argv", metadata !5, i32 33554497, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 65]
!37 = metadata !{i32 786688, metadata !4, metadata !"cell_array", metadata !5, i32 67, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cell_array] [line 67]
!38 = metadata !{i32 67, i32 0, metadata !4, null}
!39 = metadata !{i32 786688, metadata !4, metadata !"num_vect", metadata !5, i32 68, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [num_vect] [line 68]
!40 = metadata !{i32 68, i32 0, metadata !4, null}
!41 = metadata !{i32 786688, metadata !4, metadata !"num_times", metadata !5, i32 68, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [num_times] [line 68]
!42 = metadata !{i32 786688, metadata !4, metadata !"num_true", metadata !5, i32 68, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [num_true] [line 68]
!43 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 68, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 68]
!44 = metadata !{i32 786688, metadata !4, metadata !"prob", metadata !5, i32 69, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [prob] [line 69]
!45 = metadata !{i32 69, i32 0, metadata !4, null}
!46 = metadata !{i32 786688, metadata !4, metadata !"structure", metadata !5, i32 70, metadata !47, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [structure] [line 70]
!47 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 800, i64 8, i32 0, i32 0, metadata !11, metadata !48, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 800, align 8, offset 0] [from char]
!48 = metadata !{metadata !49}
!49 = metadata !{i32 786465, i64 0, i64 100}      ; [ DW_TAG_subrange_type ] [0, 99]
!50 = metadata !{i32 70, i32 0, metadata !4, null}
!51 = metadata !{i32 786688, metadata !4, metadata !"seed", metadata !5, i32 71, metadata !52, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [seed] [line 71]
!52 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 48, i64 16, i32 0, i32 0, metadata !53, metadata !54, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 48, align 16, offset 0] [from unsigned short]
!53 = metadata !{i32 786468, null, null, metadata !"unsigned short", i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned short] [line 0, size 16, align 16, offset 0, enc DW_ATE_unsigned]
!54 = metadata !{metadata !55}
!55 = metadata !{i32 786465, i64 0, i64 3}        ; [ DW_TAG_subrange_type ] [0, 2]
!56 = metadata !{i32 71, i32 0, metadata !4, null}
!57 = metadata !{i32 86, i32 0, metadata !4, null}
!58 = metadata !{i32 87, i32 0, metadata !4, null}
!59 = metadata !{i32 91, i32 0, metadata !4, null}
!60 = metadata !{i32 95, i32 0, metadata !61, null}
!61 = metadata !{i32 786443, metadata !1, metadata !4, i32 95, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!62 = metadata !{i32 97, i32 0, metadata !63, null}
!63 = metadata !{i32 786443, metadata !1, metadata !64, i32 97, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!64 = metadata !{i32 786443, metadata !1, metadata !61, i32 96, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!65 = metadata !{i32 98, i32 0, metadata !63, null}
!66 = metadata !{i32 99, i32 0, metadata !64, null}
!67 = metadata !{i32 100, i32 0, metadata !64, null}
!68 = metadata !{i32 102, i32 0, metadata !69, null}
!69 = metadata !{i32 786443, metadata !1, metadata !4, i32 102, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!70 = metadata !{i32 103, i32 0, metadata !71, null}
!71 = metadata !{i32 786443, metadata !1, metadata !4, i32 103, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!72 = metadata !{i32 104, i32 0, metadata !73, null}
!73 = metadata !{i32 786443, metadata !1, metadata !4, i32 104, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!74 = metadata !{i32 108, i32 0, metadata !75, null}
!75 = metadata !{i32 786443, metadata !1, metadata !4, i32 108, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!76 = metadata !{i32 110, i32 0, metadata !77, null}
!77 = metadata !{i32 786443, metadata !1, metadata !75, i32 109, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!78 = metadata !{i32 111, i32 0, metadata !77, null}
!79 = metadata !{i32 113, i32 0, metadata !80, null}
!80 = metadata !{i32 786443, metadata !1, metadata !4, i32 113, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!81 = metadata !{i32 115, i32 0, metadata !82, null}
!82 = metadata !{i32 786443, metadata !1, metadata !80, i32 114, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!83 = metadata !{i32 116, i32 0, metadata !82, null}
!84 = metadata !{i32 118, i32 0, metadata !85, null}
!85 = metadata !{i32 786443, metadata !1, metadata !4, i32 118, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!86 = metadata !{i32 120, i32 0, metadata !87, null}
!87 = metadata !{i32 786443, metadata !1, metadata !85, i32 119, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!88 = metadata !{i32 121, i32 0, metadata !87, null}
!89 = metadata !{i32 126, i32 0, metadata !4, null}
!90 = metadata !{i32 130, i32 0, metadata !4, null}
!91 = metadata !{i32 133, i32 0, metadata !4, null}
!92 = metadata !{i32 134, i32 0, metadata !93, null}
!93 = metadata !{i32 786443, metadata !1, metadata !4, i32 134, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!94 = metadata !{i32 136, i32 0, metadata !95, null}
!95 = metadata !{i32 786443, metadata !1, metadata !96, i32 136, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!96 = metadata !{i32 786443, metadata !1, metadata !93, i32 135, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!97 = metadata !{i32 138, i32 0, metadata !98, null}
!98 = metadata !{i32 786443, metadata !1, metadata !95, i32 137, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!99 = metadata !{i32 139, i32 0, metadata !98, null}
!100 = metadata !{i32 140, i32 0, metadata !98, null}
!101 = metadata !{i32 141, i32 0, metadata !96, null}
!102 = metadata !{i32 144, i32 0, metadata !103, null}
!103 = metadata !{i32 786443, metadata !1, metadata !93, i32 143, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!104 = metadata !{i32 145, i32 0, metadata !103, null}
!105 = metadata !{i32 146, i32 0, metadata !106, null}
!106 = metadata !{i32 786443, metadata !1, metadata !103, i32 146, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!107 = metadata !{i32 148, i32 0, metadata !108, null}
!108 = metadata !{i32 786443, metadata !1, metadata !106, i32 147, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!109 = metadata !{i32 149, i32 0, metadata !108, null}
!110 = metadata !{i32 154, i32 0, metadata !4, null}
!111 = metadata !{i32 156, i32 0, metadata !4, null}
!112 = metadata !{i32 158, i32 0, metadata !4, null}
!113 = metadata !{i32 159, i32 0, metadata !4, null}
!114 = metadata !{i32 786689, metadata !12, metadata !"cell_array", metadata !5, i32 16777381, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [cell_array] [line 165]
!115 = metadata !{i32 165, i32 0, metadata !12, null}
!116 = metadata !{i32 786688, metadata !12, metadata !"i", metadata !5, i32 167, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 167]
!117 = metadata !{i32 167, i32 0, metadata !12, null}
!118 = metadata !{i32 786688, metadata !12, metadata !"temp", metadata !5, i32 168, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [temp] [line 168]
!119 = metadata !{i32 168, i32 0, metadata !12, null}
!120 = metadata !{i32 786688, metadata !12, metadata !"present", metadata !5, i32 168, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [present] [line 168]
!121 = metadata !{i32 170, i32 0, metadata !12, null}
!122 = metadata !{i32 171, i32 0, metadata !12, null}
!123 = metadata !{i32 172, i32 0, metadata !124, null}
!124 = metadata !{i32 786443, metadata !1, metadata !12, i32 172, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!125 = metadata !{i32 174, i32 0, metadata !126, null}
!126 = metadata !{i32 786443, metadata !1, metadata !124, i32 173, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!127 = metadata !{i32 175, i32 0, metadata !126, null}
!128 = metadata !{i32 176, i32 0, metadata !126, null}
!129 = metadata !{i32 177, i32 0, metadata !126, null}
!130 = metadata !{i32 178, i32 0, metadata !126, null}
!131 = metadata !{i32 179, i32 0, metadata !126, null}
!132 = metadata !{i32 180, i32 0, metadata !126, null}
!133 = metadata !{i32 181, i32 0, metadata !12, null}
!134 = metadata !{i32 786689, metadata !24, metadata !"present", metadata !5, i32 16777420, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [present] [line 204]
!135 = metadata !{i32 204, i32 0, metadata !24, null}
!136 = metadata !{i32 207, i32 0, metadata !24, null}
!137 = metadata !{i32 209, i32 0, metadata !138, null}
!138 = metadata !{i32 786443, metadata !1, metadata !24, i32 208, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!139 = metadata !{i32 210, i32 0, metadata !138, null}
!140 = metadata !{i32 211, i32 0, metadata !138, null}
!141 = metadata !{i32 212, i32 0, metadata !24, null}
!142 = metadata !{i32 786689, metadata !25, metadata !"iterations", metadata !5, i32 16777436, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [iterations] [line 220]
!143 = metadata !{i32 220, i32 0, metadata !25, null}
!144 = metadata !{i32 786689, metadata !25, metadata !"present", metadata !5, i32 33554652, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [present] [line 220]
!145 = metadata !{i32 786689, metadata !25, metadata !"prob", metadata !5, i32 50331868, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [prob] [line 220]
!146 = metadata !{i32 786689, metadata !25, metadata !"structure", metadata !5, i32 67109084, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [structure] [line 220]
!147 = metadata !{i32 786688, metadata !25, metadata !"temp", metadata !5, i32 222, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [temp] [line 222]
!148 = metadata !{i32 222, i32 0, metadata !25, null}
!149 = metadata !{i32 786688, metadata !25, metadata !"different", metadata !5, i32 223, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [different] [line 223]
!150 = metadata !{i32 223, i32 0, metadata !25, null}
!151 = metadata !{i32 786688, metadata !25, metadata !"savef_free", metadata !5, i32 223, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [savef_free] [line 223]
!152 = metadata !{i32 786688, metadata !25, metadata !"savefaulty", metadata !5, i32 223, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [savefaulty] [line 223]
!153 = metadata !{i32 786688, metadata !25, metadata !"rem", metadata !5, i32 224, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [rem] [line 224]
!154 = metadata !{i32 224, i32 0, metadata !25, null}
!155 = metadata !{i32 786688, metadata !25, metadata !"quot", metadata !5, i32 224, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [quot] [line 224]
!156 = metadata !{i32 786688, metadata !25, metadata !"h", metadata !5, i32 224, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [h] [line 224]
!157 = metadata !{i32 786688, metadata !25, metadata !"i", metadata !5, i32 224, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 224]
!158 = metadata !{i32 786688, metadata !25, metadata !"j", metadata !5, i32 224, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 224]
!159 = metadata !{i32 786688, metadata !25, metadata !"randv", metadata !5, i32 225, metadata !160, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [randv] [line 225]
!160 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!161 = metadata !{i32 225, i32 0, metadata !25, null}
!162 = metadata !{i32 786688, metadata !25, metadata !"randprob", metadata !5, i32 226, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [randprob] [line 226]
!163 = metadata !{i32 226, i32 0, metadata !25, null}
!164 = metadata !{i32 228, i32 0, metadata !25, null}
!165 = metadata !{i32 229, i32 0, metadata !25, null}
!166 = metadata !{i32 230, i32 0, metadata !25, null}
!167 = metadata !{i32 231, i32 0, metadata !25, null}
!168 = metadata !{i32 233, i32 0, metadata !169, null}
!169 = metadata !{i32 786443, metadata !1, metadata !25, i32 233, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!170 = metadata !{i32 235, i32 0, metadata !171, null}
!171 = metadata !{i32 786443, metadata !1, metadata !169, i32 234, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!172 = metadata !{i32 236, i32 0, metadata !171, null}
!173 = metadata !{i32 237, i32 0, metadata !174, null}
!174 = metadata !{i32 786443, metadata !1, metadata !171, i32 237, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!175 = metadata !{i32 239, i32 0, metadata !176, null}
!176 = metadata !{i32 786443, metadata !1, metadata !174, i32 238, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!177 = metadata !{i32 240, i32 0, metadata !178, null}
!178 = metadata !{i32 786443, metadata !1, metadata !176, i32 240, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!179 = metadata !{i32 242, i32 0, metadata !180, null}
!180 = metadata !{i32 786443, metadata !1, metadata !181, i32 242, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!181 = metadata !{i32 786443, metadata !1, metadata !178, i32 241, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!182 = metadata !{i32 244, i32 0, metadata !183, null}
!183 = metadata !{i32 786443, metadata !1, metadata !180, i32 243, i32 0, i32 31} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!184 = metadata !{i32 245, i32 0, metadata !183, null}
!185 = metadata !{i32 246, i32 0, metadata !183, null}
!186 = metadata !{i32 247, i32 0, metadata !181, null}
!187 = metadata !{i32 248, i32 0, metadata !181, null}
!188 = metadata !{i32 249, i32 0, metadata !189, null}
!189 = metadata !{i32 786443, metadata !1, metadata !181, i32 249, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!190 = metadata !{i32 250, i32 0, metadata !181, null}
!191 = metadata !{i32 251, i32 0, metadata !181, null}
!192 = metadata !{i32 252, i32 0, metadata !181, null}
!193 = metadata !{i32 253, i32 0, metadata !181, null}
!194 = metadata !{i32 254, i32 0, metadata !176, null}
!195 = metadata !{i32 255, i32 0, metadata !171, null}
!196 = metadata !{i32 256, i32 0, metadata !197, null}
!197 = metadata !{i32 786443, metadata !1, metadata !171, i32 256, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!198 = metadata !{i32 258, i32 0, metadata !199, null}
!199 = metadata !{i32 786443, metadata !1, metadata !200, i32 258, i32 0, i32 35} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!200 = metadata !{i32 786443, metadata !1, metadata !197, i32 257, i32 0, i32 34} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!201 = metadata !{i32 260, i32 0, metadata !202, null}
!202 = metadata !{i32 786443, metadata !1, metadata !199, i32 259, i32 0, i32 36} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!203 = metadata !{i32 261, i32 0, metadata !202, null}
!204 = metadata !{i32 262, i32 0, metadata !202, null}
!205 = metadata !{i32 263, i32 0, metadata !200, null}
!206 = metadata !{i32 264, i32 0, metadata !200, null}
!207 = metadata !{i32 265, i32 0, metadata !208, null}
!208 = metadata !{i32 786443, metadata !1, metadata !200, i32 265, i32 0, i32 37} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!209 = metadata !{i32 266, i32 0, metadata !200, null}
!210 = metadata !{i32 267, i32 0, metadata !200, null}
!211 = metadata !{i32 268, i32 0, metadata !200, null}
!212 = metadata !{i32 269, i32 0, metadata !200, null}
!213 = metadata !{i32 270, i32 0, metadata !171, null}
!214 = metadata !{i32 271, i32 0, metadata !215, null}
!215 = metadata !{i32 786443, metadata !1, metadata !171, i32 271, i32 0, i32 38} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!216 = metadata !{i32 273, i32 0, metadata !217, null}
!217 = metadata !{i32 786443, metadata !1, metadata !215, i32 272, i32 0, i32 39} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!218 = metadata !{i32 274, i32 0, metadata !217, null}
!219 = metadata !{i32 275, i32 0, metadata !217, null}
!220 = metadata !{i32 276, i32 0, metadata !171, null}
!221 = metadata !{i32 277, i32 0, metadata !171, null}
!222 = metadata !{i32 278, i32 0, metadata !223, null}
!223 = metadata !{i32 786443, metadata !1, metadata !171, i32 278, i32 0, i32 40} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!224 = metadata !{i32 279, i32 0, metadata !171, null}
!225 = metadata !{i32 281, i32 0, metadata !171, null}
!226 = metadata !{i32 282, i32 0, metadata !171, null}
!227 = metadata !{i32 284, i32 0, metadata !228, null}
!228 = metadata !{i32 786443, metadata !1, metadata !25, i32 284, i32 0, i32 41} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!229 = metadata !{i32 286, i32 0, metadata !230, null}
!230 = metadata !{i32 786443, metadata !1, metadata !231, i32 286, i32 0, i32 43} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!231 = metadata !{i32 786443, metadata !1, metadata !228, i32 285, i32 0, i32 42} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!232 = metadata !{i32 287, i32 0, metadata !231, null}
!233 = metadata !{i32 288, i32 0, metadata !231, null}
!234 = metadata !{i32 289, i32 0, metadata !25, null}
!235 = metadata !{i32 786689, metadata !23, metadata !"present", metadata !5, i32 16777403, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [present] [line 187]
!236 = metadata !{i32 187, i32 0, metadata !23, null}
!237 = metadata !{i32 786688, metadata !23, metadata !"temp", metadata !5, i32 189, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [temp] [line 189]
!238 = metadata !{i32 189, i32 0, metadata !23, null}
!239 = metadata !{i32 191, i32 0, metadata !23, null}
!240 = metadata !{i32 193, i32 0, metadata !241, null}
!241 = metadata !{i32 786443, metadata !1, metadata !23, i32 192, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/misr.c]
!242 = metadata !{i32 194, i32 0, metadata !241, null}
!243 = metadata !{i32 195, i32 0, metadata !241, null}
!244 = metadata !{i32 196, i32 0, metadata !241, null}
!245 = metadata !{i32 197, i32 0, metadata !23, null}
