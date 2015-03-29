; ModuleID = '2mm.o0.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%0 = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %1*, %0*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%1 = type { %1*, %0*, i32 }

@stderr = external global %0*
@0 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@1 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@polybench_papi_counters_threadid = global i32 0, align 4
@polybench_program_total_flops = global double 0.000000e+00, align 8
@polybench_t_start = common global double 0.000000e+00, align 8
@polybench_t_end = common global double 0.000000e+00, align 8
@polybench_c_start = common global i64 0, align 8
@polybench_c_end = common global i64 0, align 8
@3 = private unnamed_addr constant [12 x i8] c"tmp <= 10.0\00", align 1
@4 = private unnamed_addr constant [22 x i8] c"utilities/polybench.c\00", align 1
@5 = private unnamed_addr constant [29 x i8] c"void polybench_flush_cache()\00", align 1
@6 = private unnamed_addr constant [7 x i8] c"%0.6f\0A\00", align 1
@7 = private unnamed_addr constant [51 x i8] c"[PolyBench] posix_memalign: cannot allocate memory\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca double, align 8
  %11 = alloca double, align 8
  %12 = alloca [1024 x [1024 x double]]*, align 8
  %13 = alloca [1024 x [1024 x double]]*, align 8
  %14 = alloca [1024 x [1024 x double]]*, align 8
  %15 = alloca [1024 x [1024 x double]]*, align 8
  %16 = alloca [1024 x [1024 x double]]*, align 8
  store i32 0, i32* %3
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  store i32 1024, i32* %6, align 4
  store i32 1024, i32* %7, align 4
  store i32 1024, i32* %8, align 4
  store i32 1024, i32* %9, align 4
  %17 = call i8* @polybench_alloc_data(i32 1048576, i32 8)
  %18 = bitcast i8* %17 to [1024 x [1024 x double]]*
  store [1024 x [1024 x double]]* %18, [1024 x [1024 x double]]** %12, align 8
  %19 = call i8* @polybench_alloc_data(i32 1048576, i32 8)
  %20 = bitcast i8* %19 to [1024 x [1024 x double]]*
  store [1024 x [1024 x double]]* %20, [1024 x [1024 x double]]** %13, align 8
  %21 = call i8* @polybench_alloc_data(i32 1048576, i32 8)
  %22 = bitcast i8* %21 to [1024 x [1024 x double]]*
  store [1024 x [1024 x double]]* %22, [1024 x [1024 x double]]** %14, align 8
  %23 = call i8* @polybench_alloc_data(i32 1048576, i32 8)
  %24 = bitcast i8* %23 to [1024 x [1024 x double]]*
  store [1024 x [1024 x double]]* %24, [1024 x [1024 x double]]** %15, align 8
  %25 = call i8* @polybench_alloc_data(i32 1048576, i32 8)
  %26 = bitcast i8* %25 to [1024 x [1024 x double]]*
  store [1024 x [1024 x double]]* %26, [1024 x [1024 x double]]** %16, align 8
  %27 = load i32* %6, align 4
  %28 = load i32* %7, align 4
  %29 = load i32* %8, align 4
  %30 = load i32* %9, align 4
  %31 = load [1024 x [1024 x double]]** %13, align 8
  %32 = getelementptr inbounds [1024 x [1024 x double]]* %31, i32 0, i32 0
  %33 = load [1024 x [1024 x double]]** %14, align 8
  %34 = getelementptr inbounds [1024 x [1024 x double]]* %33, i32 0, i32 0
  %35 = load [1024 x [1024 x double]]** %15, align 8
  %36 = getelementptr inbounds [1024 x [1024 x double]]* %35, i32 0, i32 0
  %37 = load [1024 x [1024 x double]]** %16, align 8
  %38 = getelementptr inbounds [1024 x [1024 x double]]* %37, i32 0, i32 0
  call void @8(i32 %27, i32 %28, i32 %29, i32 %30, double* %10, double* %11, [1024 x double]* %32, [1024 x double]* %34, [1024 x double]* %36, [1024 x double]* %38)
  %39 = load i32* %6, align 4
  %40 = load i32* %7, align 4
  %41 = load i32* %8, align 4
  %42 = load i32* %9, align 4
  %43 = load double* %10, align 8
  %44 = load double* %11, align 8
  %45 = load [1024 x [1024 x double]]** %12, align 8
  %46 = getelementptr inbounds [1024 x [1024 x double]]* %45, i32 0, i32 0
  %47 = load [1024 x [1024 x double]]** %13, align 8
  %48 = getelementptr inbounds [1024 x [1024 x double]]* %47, i32 0, i32 0
  %49 = load [1024 x [1024 x double]]** %14, align 8
  %50 = getelementptr inbounds [1024 x [1024 x double]]* %49, i32 0, i32 0
  %51 = load [1024 x [1024 x double]]** %15, align 8
  %52 = getelementptr inbounds [1024 x [1024 x double]]* %51, i32 0, i32 0
  %53 = load [1024 x [1024 x double]]** %16, align 8
  %54 = getelementptr inbounds [1024 x [1024 x double]]* %53, i32 0, i32 0
  call void @9(i32 %39, i32 %40, i32 %41, i32 %42, double %43, double %44, [1024 x double]* %46, [1024 x double]* %48, [1024 x double]* %50, [1024 x double]* %52, [1024 x double]* %54)
  %55 = load i32* %4, align 4
  %56 = icmp sgt i32 %55, 42
  br i1 %56, label %57, label %68

; <label>:57                                      ; preds = %2
  %58 = load i8*** %5, align 8
  %59 = getelementptr inbounds i8** %58, i64 0
  %60 = load i8** %59, align 8
  %61 = call i32 @strcmp(i8* %60, i8* getelementptr inbounds ([1 x i8]* @0, i32 0, i32 0)) #5
  %62 = icmp ne i32 %61, 0
  br i1 %62, label %68, label %63

; <label>:63                                      ; preds = %57
  %64 = load i32* %6, align 4
  %65 = load i32* %9, align 4
  %66 = load [1024 x [1024 x double]]** %16, align 8
  %67 = getelementptr inbounds [1024 x [1024 x double]]* %66, i32 0, i32 0
  call void @10(i32 %64, i32 %65, [1024 x double]* %67)
  br label %68

; <label>:68                                      ; preds = %63, %57, %2
  %69 = load [1024 x [1024 x double]]** %12, align 8
  %70 = bitcast [1024 x [1024 x double]]* %69 to i8*
  call void @free(i8* %70) #6
  %71 = load [1024 x [1024 x double]]** %13, align 8
  %72 = bitcast [1024 x [1024 x double]]* %71 to i8*
  call void @free(i8* %72) #6
  %73 = load [1024 x [1024 x double]]** %14, align 8
  %74 = bitcast [1024 x [1024 x double]]* %73 to i8*
  call void @free(i8* %74) #6
  %75 = load [1024 x [1024 x double]]** %15, align 8
  %76 = bitcast [1024 x [1024 x double]]* %75 to i8*
  call void @free(i8* %76) #6
  %77 = load [1024 x [1024 x double]]** %16, align 8
  %78 = bitcast [1024 x [1024 x double]]* %77 to i8*
  call void @free(i8* %78) #6
  ret i32 0
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #1

; Function Attrs: nounwind
declare void @free(i8*) #2

declare i32 @fprintf(%0*, i8*, ...) #3

; Function Attrs: nounwind uwtable
define internal void @8(i32, i32, i32, i32, double*, double*, [1024 x double]*, [1024 x double]*, [1024 x double]*, [1024 x double]*) #0 {
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca double*, align 8
  %16 = alloca double*, align 8
  %17 = alloca [1024 x double]*, align 8
  %18 = alloca [1024 x double]*, align 8
  %19 = alloca [1024 x double]*, align 8
  %20 = alloca [1024 x double]*, align 8
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  store i32 %0, i32* %11, align 4
  store i32 %1, i32* %12, align 4
  store i32 %2, i32* %13, align 4
  store i32 %3, i32* %14, align 4
  store double* %4, double** %15, align 8
  store double* %5, double** %16, align 8
  store [1024 x double]* %6, [1024 x double]** %17, align 8
  store [1024 x double]* %7, [1024 x double]** %18, align 8
  store [1024 x double]* %8, [1024 x double]** %19, align 8
  store [1024 x double]* %9, [1024 x double]** %20, align 8
  %23 = load double** %15, align 8
  store double 3.241200e+04, double* %23, align 8
  %24 = load double** %16, align 8
  store double 2.123000e+03, double* %24, align 8
  store i32 0, i32* %21, align 4
  br label %25

; <label>:25                                      ; preds = %54, %10
  %26 = load i32* %21, align 4
  %27 = load i32* %11, align 4
  %28 = icmp slt i32 %26, %27
  br i1 %28, label %29, label %57

; <label>:29                                      ; preds = %25
  store i32 0, i32* %22, align 4
  br label %30

; <label>:30                                      ; preds = %50, %29
  %31 = load i32* %22, align 4
  %32 = load i32* %13, align 4
  %33 = icmp slt i32 %31, %32
  br i1 %33, label %34, label %53

; <label>:34                                      ; preds = %30
  %35 = load i32* %21, align 4
  %36 = sitofp i32 %35 to double
  %37 = load i32* %22, align 4
  %38 = sitofp i32 %37 to double
  %39 = fmul double %36, %38
  %40 = load i32* %11, align 4
  %41 = sitofp i32 %40 to double
  %42 = fdiv double %39, %41
  %43 = load i32* %22, align 4
  %44 = sext i32 %43 to i64
  %45 = load i32* %21, align 4
  %46 = sext i32 %45 to i64
  %47 = load [1024 x double]** %17, align 8
  %48 = getelementptr inbounds [1024 x double]* %47, i64 %46
  %49 = getelementptr inbounds [1024 x double]* %48, i32 0, i64 %44
  store double %42, double* %49, align 8
  br label %50

; <label>:50                                      ; preds = %34
  %51 = load i32* %22, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, i32* %22, align 4
  br label %30

; <label>:53                                      ; preds = %30
  br label %54

; <label>:54                                      ; preds = %53
  %55 = load i32* %21, align 4
  %56 = add nsw i32 %55, 1
  store i32 %56, i32* %21, align 4
  br label %25

; <label>:57                                      ; preds = %25
  store i32 0, i32* %21, align 4
  br label %58

; <label>:58                                      ; preds = %88, %57
  %59 = load i32* %21, align 4
  %60 = load i32* %13, align 4
  %61 = icmp slt i32 %59, %60
  br i1 %61, label %62, label %91

; <label>:62                                      ; preds = %58
  store i32 0, i32* %22, align 4
  br label %63

; <label>:63                                      ; preds = %84, %62
  %64 = load i32* %22, align 4
  %65 = load i32* %12, align 4
  %66 = icmp slt i32 %64, %65
  br i1 %66, label %67, label %87

; <label>:67                                      ; preds = %63
  %68 = load i32* %21, align 4
  %69 = sitofp i32 %68 to double
  %70 = load i32* %22, align 4
  %71 = add nsw i32 %70, 1
  %72 = sitofp i32 %71 to double
  %73 = fmul double %69, %72
  %74 = load i32* %12, align 4
  %75 = sitofp i32 %74 to double
  %76 = fdiv double %73, %75
  %77 = load i32* %22, align 4
  %78 = sext i32 %77 to i64
  %79 = load i32* %21, align 4
  %80 = sext i32 %79 to i64
  %81 = load [1024 x double]** %18, align 8
  %82 = getelementptr inbounds [1024 x double]* %81, i64 %80
  %83 = getelementptr inbounds [1024 x double]* %82, i32 0, i64 %78
  store double %76, double* %83, align 8
  br label %84

; <label>:84                                      ; preds = %67
  %85 = load i32* %22, align 4
  %86 = add nsw i32 %85, 1
  store i32 %86, i32* %22, align 4
  br label %63

; <label>:87                                      ; preds = %63
  br label %88

; <label>:88                                      ; preds = %87
  %89 = load i32* %21, align 4
  %90 = add nsw i32 %89, 1
  store i32 %90, i32* %21, align 4
  br label %58

; <label>:91                                      ; preds = %58
  store i32 0, i32* %21, align 4
  br label %92

; <label>:92                                      ; preds = %122, %91
  %93 = load i32* %21, align 4
  %94 = load i32* %14, align 4
  %95 = icmp slt i32 %93, %94
  br i1 %95, label %96, label %125

; <label>:96                                      ; preds = %92
  store i32 0, i32* %22, align 4
  br label %97

; <label>:97                                      ; preds = %118, %96
  %98 = load i32* %22, align 4
  %99 = load i32* %12, align 4
  %100 = icmp slt i32 %98, %99
  br i1 %100, label %101, label %121

; <label>:101                                     ; preds = %97
  %102 = load i32* %21, align 4
  %103 = sitofp i32 %102 to double
  %104 = load i32* %22, align 4
  %105 = add nsw i32 %104, 3
  %106 = sitofp i32 %105 to double
  %107 = fmul double %103, %106
  %108 = load i32* %14, align 4
  %109 = sitofp i32 %108 to double
  %110 = fdiv double %107, %109
  %111 = load i32* %22, align 4
  %112 = sext i32 %111 to i64
  %113 = load i32* %21, align 4
  %114 = sext i32 %113 to i64
  %115 = load [1024 x double]** %19, align 8
  %116 = getelementptr inbounds [1024 x double]* %115, i64 %114
  %117 = getelementptr inbounds [1024 x double]* %116, i32 0, i64 %112
  store double %110, double* %117, align 8
  br label %118

; <label>:118                                     ; preds = %101
  %119 = load i32* %22, align 4
  %120 = add nsw i32 %119, 1
  store i32 %120, i32* %22, align 4
  br label %97

; <label>:121                                     ; preds = %97
  br label %122

; <label>:122                                     ; preds = %121
  %123 = load i32* %21, align 4
  %124 = add nsw i32 %123, 1
  store i32 %124, i32* %21, align 4
  br label %92

; <label>:125                                     ; preds = %92
  store i32 0, i32* %21, align 4
  br label %126

; <label>:126                                     ; preds = %156, %125
  %127 = load i32* %21, align 4
  %128 = load i32* %11, align 4
  %129 = icmp slt i32 %127, %128
  br i1 %129, label %130, label %159

; <label>:130                                     ; preds = %126
  store i32 0, i32* %22, align 4
  br label %131

; <label>:131                                     ; preds = %152, %130
  %132 = load i32* %22, align 4
  %133 = load i32* %14, align 4
  %134 = icmp slt i32 %132, %133
  br i1 %134, label %135, label %155

; <label>:135                                     ; preds = %131
  %136 = load i32* %21, align 4
  %137 = sitofp i32 %136 to double
  %138 = load i32* %22, align 4
  %139 = add nsw i32 %138, 2
  %140 = sitofp i32 %139 to double
  %141 = fmul double %137, %140
  %142 = load i32* %13, align 4
  %143 = sitofp i32 %142 to double
  %144 = fdiv double %141, %143
  %145 = load i32* %22, align 4
  %146 = sext i32 %145 to i64
  %147 = load i32* %21, align 4
  %148 = sext i32 %147 to i64
  %149 = load [1024 x double]** %20, align 8
  %150 = getelementptr inbounds [1024 x double]* %149, i64 %148
  %151 = getelementptr inbounds [1024 x double]* %150, i32 0, i64 %146
  store double %144, double* %151, align 8
  br label %152

; <label>:152                                     ; preds = %135
  %153 = load i32* %22, align 4
  %154 = add nsw i32 %153, 1
  store i32 %154, i32* %22, align 4
  br label %131

; <label>:155                                     ; preds = %131
  br label %156

; <label>:156                                     ; preds = %155
  %157 = load i32* %21, align 4
  %158 = add nsw i32 %157, 1
  store i32 %158, i32* %21, align 4
  br label %126

; <label>:159                                     ; preds = %126
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @9(i32, i32, i32, i32, double, double, [1024 x double]*, [1024 x double]*, [1024 x double]*, [1024 x double]*, [1024 x double]*) #0 {
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca double, align 8
  %17 = alloca double, align 8
  %18 = alloca [1024 x double]*, align 8
  %19 = alloca [1024 x double]*, align 8
  %20 = alloca [1024 x double]*, align 8
  %21 = alloca [1024 x double]*, align 8
  %22 = alloca [1024 x double]*, align 8
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  store i32 %0, i32* %12, align 4
  store i32 %1, i32* %13, align 4
  store i32 %2, i32* %14, align 4
  store i32 %3, i32* %15, align 4
  store double %4, double* %16, align 8
  store double %5, double* %17, align 8
  store [1024 x double]* %6, [1024 x double]** %18, align 8
  store [1024 x double]* %7, [1024 x double]** %19, align 8
  store [1024 x double]* %8, [1024 x double]** %20, align 8
  store [1024 x double]* %9, [1024 x double]** %21, align 8
  store [1024 x double]* %10, [1024 x double]** %22, align 8
  store i32 0, i32* %23, align 4
  br label %26

; <label>:26                                      ; preds = %84, %11
  %27 = load i32* %23, align 4
  %28 = load i32* %12, align 4
  %29 = icmp slt i32 %27, %28
  br i1 %29, label %30, label %87

; <label>:30                                      ; preds = %26
  store i32 0, i32* %24, align 4
  br label %31

; <label>:31                                      ; preds = %80, %30
  %32 = load i32* %24, align 4
  %33 = load i32* %13, align 4
  %34 = icmp slt i32 %32, %33
  br i1 %34, label %35, label %83

; <label>:35                                      ; preds = %31
  %36 = load i32* %24, align 4
  %37 = sext i32 %36 to i64
  %38 = load i32* %23, align 4
  %39 = sext i32 %38 to i64
  %40 = load [1024 x double]** %18, align 8
  %41 = getelementptr inbounds [1024 x double]* %40, i64 %39
  %42 = getelementptr inbounds [1024 x double]* %41, i32 0, i64 %37
  store double 0.000000e+00, double* %42, align 8
  store i32 0, i32* %25, align 4
  br label %43

; <label>:43                                      ; preds = %76, %35
  %44 = load i32* %25, align 4
  %45 = load i32* %14, align 4
  %46 = icmp slt i32 %44, %45
  br i1 %46, label %47, label %79

; <label>:47                                      ; preds = %43
  %48 = load double* %16, align 8
  %49 = load i32* %25, align 4
  %50 = sext i32 %49 to i64
  %51 = load i32* %23, align 4
  %52 = sext i32 %51 to i64
  %53 = load [1024 x double]** %19, align 8
  %54 = getelementptr inbounds [1024 x double]* %53, i64 %52
  %55 = getelementptr inbounds [1024 x double]* %54, i32 0, i64 %50
  %56 = load double* %55, align 8
  %57 = fmul double %48, %56
  %58 = load i32* %24, align 4
  %59 = sext i32 %58 to i64
  %60 = load i32* %25, align 4
  %61 = sext i32 %60 to i64
  %62 = load [1024 x double]** %20, align 8
  %63 = getelementptr inbounds [1024 x double]* %62, i64 %61
  %64 = getelementptr inbounds [1024 x double]* %63, i32 0, i64 %59
  %65 = load double* %64, align 8
  %66 = fmul double %57, %65
  %67 = load i32* %24, align 4
  %68 = sext i32 %67 to i64
  %69 = load i32* %23, align 4
  %70 = sext i32 %69 to i64
  %71 = load [1024 x double]** %18, align 8
  %72 = getelementptr inbounds [1024 x double]* %71, i64 %70
  %73 = getelementptr inbounds [1024 x double]* %72, i32 0, i64 %68
  %74 = load double* %73, align 8
  %75 = fadd double %74, %66
  store double %75, double* %73, align 8
  br label %76

; <label>:76                                      ; preds = %47
  %77 = load i32* %25, align 4
  %78 = add nsw i32 %77, 1
  store i32 %78, i32* %25, align 4
  br label %43

; <label>:79                                      ; preds = %43
  br label %80

; <label>:80                                      ; preds = %79
  %81 = load i32* %24, align 4
  %82 = add nsw i32 %81, 1
  store i32 %82, i32* %24, align 4
  br label %31

; <label>:83                                      ; preds = %31
  br label %84

; <label>:84                                      ; preds = %83
  %85 = load i32* %23, align 4
  %86 = add nsw i32 %85, 1
  store i32 %86, i32* %23, align 4
  br label %26

; <label>:87                                      ; preds = %26
  store i32 0, i32* %23, align 4
  br label %88

; <label>:88                                      ; preds = %147, %87
  %89 = load i32* %23, align 4
  %90 = load i32* %12, align 4
  %91 = icmp slt i32 %89, %90
  br i1 %91, label %92, label %150

; <label>:92                                      ; preds = %88
  store i32 0, i32* %24, align 4
  br label %93

; <label>:93                                      ; preds = %143, %92
  %94 = load i32* %24, align 4
  %95 = load i32* %15, align 4
  %96 = icmp slt i32 %94, %95
  br i1 %96, label %97, label %146

; <label>:97                                      ; preds = %93
  %98 = load double* %17, align 8
  %99 = load i32* %24, align 4
  %100 = sext i32 %99 to i64
  %101 = load i32* %23, align 4
  %102 = sext i32 %101 to i64
  %103 = load [1024 x double]** %22, align 8
  %104 = getelementptr inbounds [1024 x double]* %103, i64 %102
  %105 = getelementptr inbounds [1024 x double]* %104, i32 0, i64 %100
  %106 = load double* %105, align 8
  %107 = fmul double %106, %98
  store double %107, double* %105, align 8
  store i32 0, i32* %25, align 4
  br label %108

; <label>:108                                     ; preds = %139, %97
  %109 = load i32* %25, align 4
  %110 = load i32* %13, align 4
  %111 = icmp slt i32 %109, %110
  br i1 %111, label %112, label %142

; <label>:112                                     ; preds = %108
  %113 = load i32* %25, align 4
  %114 = sext i32 %113 to i64
  %115 = load i32* %23, align 4
  %116 = sext i32 %115 to i64
  %117 = load [1024 x double]** %18, align 8
  %118 = getelementptr inbounds [1024 x double]* %117, i64 %116
  %119 = getelementptr inbounds [1024 x double]* %118, i32 0, i64 %114
  %120 = load double* %119, align 8
  %121 = load i32* %24, align 4
  %122 = sext i32 %121 to i64
  %123 = load i32* %25, align 4
  %124 = sext i32 %123 to i64
  %125 = load [1024 x double]** %21, align 8
  %126 = getelementptr inbounds [1024 x double]* %125, i64 %124
  %127 = getelementptr inbounds [1024 x double]* %126, i32 0, i64 %122
  %128 = load double* %127, align 8
  %129 = fmul double %120, %128
  %130 = load i32* %24, align 4
  %131 = sext i32 %130 to i64
  %132 = load i32* %23, align 4
  %133 = sext i32 %132 to i64
  %134 = load [1024 x double]** %22, align 8
  %135 = getelementptr inbounds [1024 x double]* %134, i64 %133
  %136 = getelementptr inbounds [1024 x double]* %135, i32 0, i64 %131
  %137 = load double* %136, align 8
  %138 = fadd double %137, %129
  store double %138, double* %136, align 8
  br label %139

; <label>:139                                     ; preds = %112
  %140 = load i32* %25, align 4
  %141 = add nsw i32 %140, 1
  store i32 %141, i32* %25, align 4
  br label %108

; <label>:142                                     ; preds = %108
  br label %143

; <label>:143                                     ; preds = %142
  %144 = load i32* %24, align 4
  %145 = add nsw i32 %144, 1
  store i32 %145, i32* %24, align 4
  br label %93

; <label>:146                                     ; preds = %93
  br label %147

; <label>:147                                     ; preds = %146
  %148 = load i32* %23, align 4
  %149 = add nsw i32 %148, 1
  store i32 %149, i32* %23, align 4
  br label %88

; <label>:150                                     ; preds = %88
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @10(i32, i32, [1024 x double]*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca [1024 x double]*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 %0, i32* %4, align 4
  store i32 %1, i32* %5, align 4
  store [1024 x double]* %2, [1024 x double]** %6, align 8
  store i32 0, i32* %7, align 4
  br label %9

; <label>:9                                       ; preds = %44, %3
  %10 = load i32* %7, align 4
  %11 = load i32* %4, align 4
  %12 = icmp slt i32 %10, %11
  br i1 %12, label %13, label %47

; <label>:13                                      ; preds = %9
  store i32 0, i32* %8, align 4
  br label %14

; <label>:14                                      ; preds = %40, %13
  %15 = load i32* %8, align 4
  %16 = load i32* %5, align 4
  %17 = icmp slt i32 %15, %16
  br i1 %17, label %18, label %43

; <label>:18                                      ; preds = %14
  %19 = load %0** @stderr, align 8
  %20 = load i32* %8, align 4
  %21 = sext i32 %20 to i64
  %22 = load i32* %7, align 4
  %23 = sext i32 %22 to i64
  %24 = load [1024 x double]** %6, align 8
  %25 = getelementptr inbounds [1024 x double]* %24, i64 %23
  %26 = getelementptr inbounds [1024 x double]* %25, i32 0, i64 %21
  %27 = load double* %26, align 8
  %28 = call i32 (%0*, i8*, ...)* @fprintf(%0* %19, i8* getelementptr inbounds ([8 x i8]* @1, i32 0, i32 0), double %27)
  %29 = load i32* %7, align 4
  %30 = load i32* %4, align 4
  %31 = mul nsw i32 %29, %30
  %32 = load i32* %8, align 4
  %33 = add nsw i32 %31, %32
  %34 = srem i32 %33, 20
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %36, label %39

; <label>:36                                      ; preds = %18
  %37 = load %0** @stderr, align 8
  %38 = call i32 (%0*, i8*, ...)* @fprintf(%0* %37, i8* getelementptr inbounds ([2 x i8]* @2, i32 0, i32 0))
  br label %39

; <label>:39                                      ; preds = %36, %18
  br label %40

; <label>:40                                      ; preds = %39
  %41 = load i32* %8, align 4
  %42 = add nsw i32 %41, 1
  store i32 %42, i32* %8, align 4
  br label %14

; <label>:43                                      ; preds = %14
  br label %44

; <label>:44                                      ; preds = %43
  %45 = load i32* %7, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, i32* %7, align 4
  br label %9

; <label>:47                                      ; preds = %9
  %48 = load %0** @stderr, align 8
  %49 = call i32 (%0*, i8*, ...)* @fprintf(%0* %48, i8* getelementptr inbounds ([2 x i8]* @2, i32 0, i32 0))
  ret void
}

; Function Attrs: nounwind uwtable
define void @polybench_flush_cache() #0 {
  %1 = alloca i32, align 4
  %2 = alloca double*, align 8
  %3 = alloca i32, align 4
  %4 = alloca double, align 8
  store i32 4194560, i32* %1, align 4
  %5 = load i32* %1, align 4
  %6 = sext i32 %5 to i64
  %7 = call noalias i8* @calloc(i64 %6, i64 8) #6
  %8 = bitcast i8* %7 to double*
  store double* %8, double** %2, align 8
  store double 0.000000e+00, double* %4, align 8
  store i32 0, i32* %3, align 4
  br label %9

; <label>:9                                       ; preds = %21, %0
  %10 = load i32* %3, align 4
  %11 = load i32* %1, align 4
  %12 = icmp slt i32 %10, %11
  br i1 %12, label %13, label %24

; <label>:13                                      ; preds = %9
  %14 = load i32* %3, align 4
  %15 = sext i32 %14 to i64
  %16 = load double** %2, align 8
  %17 = getelementptr inbounds double* %16, i64 %15
  %18 = load double* %17, align 8
  %19 = load double* %4, align 8
  %20 = fadd double %19, %18
  store double %20, double* %4, align 8
  br label %21

; <label>:21                                      ; preds = %13
  %22 = load i32* %3, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, i32* %3, align 4
  br label %9

; <label>:24                                      ; preds = %9
  %25 = load double* %4, align 8
  %26 = fcmp ole double %25, 1.000000e+01
  br i1 %26, label %27, label %28

; <label>:27                                      ; preds = %24
  br label %30

; <label>:28                                      ; preds = %24
  call void @__assert_fail(i8* getelementptr inbounds ([12 x i8]* @3, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8]* @4, i32 0, i32 0), i32 97, i8* getelementptr inbounds ([29 x i8]* @5, i32 0, i32 0)) #7
  unreachable
                                                  ; No predecessors!
  br label %30

; <label>:30                                      ; preds = %29, %27
  %31 = load double** %2, align 8
  %32 = bitcast double* %31 to i8*
  call void @free(i8* %32) #6
  ret void
}

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #2

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #4

; Function Attrs: nounwind uwtable
define void @polybench_prepare_instruments() #0 {
  call void @polybench_flush_cache()
  ret void
}

; Function Attrs: nounwind uwtable
define void @polybench_timer_start() #0 {
  call void @polybench_prepare_instruments()
  %1 = call double @11()
  store double %1, double* @polybench_t_start, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define void @polybench_timer_stop() #0 {
  %1 = call double @11()
  store double %1, double* @polybench_t_end, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define void @polybench_timer_print() #0 {
  %1 = load double* @polybench_t_end, align 8
  %2 = load double* @polybench_t_start, align 8
  %3 = fsub double %1, %2
  %4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @6, i32 0, i32 0), double %3)
  ret void
}

declare i32 @printf(i8*, ...) #3

; Function Attrs: nounwind uwtable
define i8* @polybench_alloc_data(i32, i32) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  store i32 %0, i32* %3, align 4
  store i32 %1, i32* %4, align 4
  %6 = load i32* %3, align 4
  %7 = load i32* %4, align 4
  %8 = mul nsw i32 %6, %7
  %9 = sext i32 %8 to i64
  %10 = call i8* @12(i64 %9)
  store i8* %10, i8** %5, align 8
  %11 = load i8** %5, align 8
  ret i8* %11
}

; Function Attrs: nounwind
declare i32 @posix_memalign(i8**, i64, i64) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #4

; Function Attrs: nounwind uwtable
define internal double @11() #0 {
  ret double 0.000000e+00
}

; Function Attrs: nounwind uwtable
define internal i8* @12(i64) #0 {
  %2 = alloca i64, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  store i64 %0, i64* %2, align 8
  store i8* null, i8** %3, align 8
  %5 = load i64* %2, align 8
  %6 = call i32 @posix_memalign(i8** %3, i64 32, i64 %5) #6
  store i32 %6, i32* %4, align 4
  %7 = load i8** %3, align 8
  %8 = icmp ne i8* %7, null
  br i1 %8, label %9, label %12

; <label>:9                                       ; preds = %1
  %10 = load i32* %4, align 4
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %15

; <label>:12                                      ; preds = %9, %1
  %13 = load %0** @stderr, align 8
  %14 = call i32 (%0*, i8*, ...)* @fprintf(%0* %13, i8* getelementptr inbounds ([51 x i8]* @7, i32 0, i32 0))
  call void @exit(i32 1) #7
  unreachable

; <label>:15                                      ; preds = %9
  %16 = load i8** %3, align 8
  ret i8* %16
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.ident = !{!0, !0}
!llvm.module.flags = !{!1, !2}

!0 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang 64b6333290f9b7df5a25d4fba34611de3078a792) (llvm/ 0e9a38ba60be659d570af893e05c75b9f6cfe35d)"}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 2}
