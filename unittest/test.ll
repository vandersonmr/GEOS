; ModuleID = '3mm.o0.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@polybench_papi_counters_threadid = global i32 0, align 4
@polybench_program_total_flops = global double 0.000000e+00, align 8
@.str = private unnamed_addr constant [12 x i8] c"tmp <= 10.0\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"utilities/polybench.c\00", align 1
@__PRETTY_FUNCTION__.polybench_flush_cache = private unnamed_addr constant [29 x i8] c"void polybench_flush_cache()\00", align 1
@polybench_t_start = common global double 0.000000e+00, align 8
@polybench_t_end = common global double 0.000000e+00, align 8
@.str2 = private unnamed_addr constant [7 x i8] c"%0.6f\0A\00", align 1
@polybench_c_start = common global i64 0, align 8
@polybench_c_end = common global i64 0, align 8
@stderr = external global %struct._IO_FILE*
@.str3 = private unnamed_addr constant [51 x i8] c"[PolyBench] posix_memalign: cannot allocate memory\00", align 1
@.str4 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str15 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str26 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @polybench_flush_cache() #0 {
  %cs = alloca i32, align 4
  %flush = alloca double*, align 8
  %i = alloca i32, align 4
  %tmp = alloca double, align 8
  store i32 4194560, i32* %cs, align 4
  %1 = load i32* %cs, align 4
  %2 = sext i32 %1 to i64
  %3 = call noalias i8* @calloc(i64 %2, i64 8) #5
  %4 = bitcast i8* %3 to double*
  store double* %4, double** %flush, align 8
  store double 0.000000e+00, double* %tmp, align 8
  store i32 0, i32* %i, align 4
  br label %5

; <label>:5                                       ; preds = %17, %0
  %6 = load i32* %i, align 4
  %7 = load i32* %cs, align 4
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %9, label %20

; <label>:9                                       ; preds = %5
  %10 = load i32* %i, align 4
  %11 = sext i32 %10 to i64
  %12 = load double** %flush, align 8
  %13 = getelementptr inbounds double* %12, i64 %11
  %14 = load double* %13, align 8
  %15 = load double* %tmp, align 8
  %16 = fadd double %15, %14
  store double %16, double* %tmp, align 8
  br label %17

; <label>:17                                      ; preds = %9
  %18 = load i32* %i, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, i32* %i, align 4
  br label %5

; <label>:20                                      ; preds = %5
  %21 = load double* %tmp, align 8
  %22 = fcmp ole double %21, 1.000000e+01
  br i1 %22, label %23, label %24

; <label>:23                                      ; preds = %20
  br label %26

; <label>:24                                      ; preds = %20
  call void @__assert_fail(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 97, i8* getelementptr inbounds ([29 x i8]* @__PRETTY_FUNCTION__.polybench_flush_cache, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %26

; <label>:26                                      ; preds = %25, %23
  %27 = load double** %flush, align 8
  %28 = bitcast double* %27 to i8*
  call void @free(i8* %28) #5
  ret void
}

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #1

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #2

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind uwtable
define void @polybench_prepare_instruments() #0 {
  call void @polybench_flush_cache()
  ret void
}

; Function Attrs: nounwind uwtable
define void @polybench_timer_start() #0 {
  call void @polybench_prepare_instruments()
  %1 = call double @rtclock()
  store double %1, double* @polybench_t_start, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define void @polybench_timer_stop() #0 {
  %1 = call double @rtclock()
  store double %1, double* @polybench_t_end, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define void @polybench_timer_print() #0 {
  %1 = load double* @polybench_t_end, align 8
  %2 = load double* @polybench_t_start, align 8
  %3 = fsub double %1, %2
  %4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str2, i32 0, i32 0), double %3)
  ret void
}

declare i32 @printf(i8*, ...) #3

; Function Attrs: nounwind uwtable
define i8* @polybench_alloc_data(i32 %n, i32 %elt_size) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %ret = alloca i8*, align 8
  store i32 %n, i32* %1, align 4
  store i32 %elt_size, i32* %2, align 4
  %3 = load i32* %1, align 4
  %4 = load i32* %2, align 4
  %5 = mul nsw i32 %3, %4
  %6 = sext i32 %5 to i64
  %7 = call i8* @xmalloc(i64 %6)
  store i8* %7, i8** %ret, align 8
  %8 = load i8** %ret, align 8
  ret i8* %8
}

; Function Attrs: nounwind uwtable
define internal i8* @xmalloc(i64 %num) #0 {
  %1 = alloca i64, align 8
  %new = alloca i8*, align 8
  %ret = alloca i32, align 4
  store i64 %num, i64* %1, align 8
  store i8* null, i8** %new, align 8
  %2 = load i64* %1, align 8
  %3 = call i32 @posix_memalign(i8** %new, i64 32, i64 %2) #5
  store i32 %3, i32* %ret, align 4
  %4 = load i8** %new, align 8
  %5 = icmp ne i8* %4, null
  br i1 %5, label %6, label %9

; <label>:6                                       ; preds = %0
  %7 = load i32* %ret, align 4
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %12

; <label>:9                                       ; preds = %6, %0
  %10 = load %struct._IO_FILE** @stderr, align 8
  %11 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([51 x i8]* @.str3, i32 0, i32 0))
  call void @exit(i32 1) #6
  unreachable

; <label>:12                                      ; preds = %6
  %13 = load i8** %new, align 8
  ret i8* %13
}

; Function Attrs: nounwind
declare i32 @posix_memalign(i8**, i64, i64) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

; Function Attrs: nounwind uwtable
define internal double @rtclock() #0 {
  ret double 0.000000e+00
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %ni = alloca i32, align 4
  %nj = alloca i32, align 4
  %nk = alloca i32, align 4
  %nl = alloca i32, align 4
  %nm = alloca i32, align 4
  %E = alloca [1024 x [1024 x double]]*, align 8
  %A = alloca [1024 x [1024 x double]]*, align 8
  %B = alloca [1024 x [1024 x double]]*, align 8
  %F = alloca [1024 x [1024 x double]]*, align 8
  %C = alloca [1024 x [1024 x double]]*, align 8
  %D = alloca [1024 x [1024 x double]]*, align 8
  %G = alloca [1024 x [1024 x double]]*, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  store i32 1024, i32* %ni, align 4
  store i32 1024, i32* %nj, align 4
  store i32 1024, i32* %nk, align 4
  store i32 1024, i32* %nl, align 4
  store i32 1024, i32* %nm, align 4
  %4 = call i8* @polybench_alloc_data(i32 1048576, i32 8)
  %5 = bitcast i8* %4 to [1024 x [1024 x double]]*
  store [1024 x [1024 x double]]* %5, [1024 x [1024 x double]]** %E, align 8
  %6 = call i8* @polybench_alloc_data(i32 1048576, i32 8)
  %7 = bitcast i8* %6 to [1024 x [1024 x double]]*
  store [1024 x [1024 x double]]* %7, [1024 x [1024 x double]]** %A, align 8
  %8 = call i8* @polybench_alloc_data(i32 1048576, i32 8)
  %9 = bitcast i8* %8 to [1024 x [1024 x double]]*
  store [1024 x [1024 x double]]* %9, [1024 x [1024 x double]]** %B, align 8
  %10 = call i8* @polybench_alloc_data(i32 1048576, i32 8)
  %11 = bitcast i8* %10 to [1024 x [1024 x double]]*
  store [1024 x [1024 x double]]* %11, [1024 x [1024 x double]]** %F, align 8
  %12 = call i8* @polybench_alloc_data(i32 1048576, i32 8)
  %13 = bitcast i8* %12 to [1024 x [1024 x double]]*
  store [1024 x [1024 x double]]* %13, [1024 x [1024 x double]]** %C, align 8
  %14 = call i8* @polybench_alloc_data(i32 1048576, i32 8)
  %15 = bitcast i8* %14 to [1024 x [1024 x double]]*
  store [1024 x [1024 x double]]* %15, [1024 x [1024 x double]]** %D, align 8
  %16 = call i8* @polybench_alloc_data(i32 1048576, i32 8)
  %17 = bitcast i8* %16 to [1024 x [1024 x double]]*
  store [1024 x [1024 x double]]* %17, [1024 x [1024 x double]]** %G, align 8
  %18 = load i32* %ni, align 4
  %19 = load i32* %nj, align 4
  %20 = load i32* %nk, align 4
  %21 = load i32* %nl, align 4
  %22 = load i32* %nm, align 4
  %23 = load [1024 x [1024 x double]]** %A, align 8
  %24 = getelementptr inbounds [1024 x [1024 x double]]* %23, i32 0, i32 0
  %25 = load [1024 x [1024 x double]]** %B, align 8
  %26 = getelementptr inbounds [1024 x [1024 x double]]* %25, i32 0, i32 0
  %27 = load [1024 x [1024 x double]]** %C, align 8
  %28 = getelementptr inbounds [1024 x [1024 x double]]* %27, i32 0, i32 0
  %29 = load [1024 x [1024 x double]]** %D, align 8
  %30 = getelementptr inbounds [1024 x [1024 x double]]* %29, i32 0, i32 0
  call void @init_array(i32 %18, i32 %19, i32 %20, i32 %21, i32 %22, [1024 x double]* %24, [1024 x double]* %26, [1024 x double]* %28, [1024 x double]* %30)
  %31 = load i32* %ni, align 4
  %32 = load i32* %nj, align 4
  %33 = load i32* %nk, align 4
  %34 = load i32* %nl, align 4
  %35 = load i32* %nm, align 4
  %36 = load [1024 x [1024 x double]]** %E, align 8
  %37 = getelementptr inbounds [1024 x [1024 x double]]* %36, i32 0, i32 0
  %38 = load [1024 x [1024 x double]]** %A, align 8
  %39 = getelementptr inbounds [1024 x [1024 x double]]* %38, i32 0, i32 0
  %40 = load [1024 x [1024 x double]]** %B, align 8
  %41 = getelementptr inbounds [1024 x [1024 x double]]* %40, i32 0, i32 0
  %42 = load [1024 x [1024 x double]]** %F, align 8
  %43 = getelementptr inbounds [1024 x [1024 x double]]* %42, i32 0, i32 0
  %44 = load [1024 x [1024 x double]]** %C, align 8
  %45 = getelementptr inbounds [1024 x [1024 x double]]* %44, i32 0, i32 0
  %46 = load [1024 x [1024 x double]]** %D, align 8
  %47 = getelementptr inbounds [1024 x [1024 x double]]* %46, i32 0, i32 0
  %48 = load [1024 x [1024 x double]]** %G, align 8
  %49 = getelementptr inbounds [1024 x [1024 x double]]* %48, i32 0, i32 0
  call void @kernel_3mm(i32 %31, i32 %32, i32 %33, i32 %34, i32 %35, [1024 x double]* %37, [1024 x double]* %39, [1024 x double]* %41, [1024 x double]* %43, [1024 x double]* %45, [1024 x double]* %47, [1024 x double]* %49)
  %50 = load i32* %2, align 4
  %51 = icmp sgt i32 %50, 42
  br i1 %51, label %52, label %63

; <label>:52                                      ; preds = %0
  %53 = load i8*** %3, align 8
  %54 = getelementptr inbounds i8** %53, i64 0
  %55 = load i8** %54, align 8
  %56 = call i32 @strcmp(i8* %55, i8* getelementptr inbounds ([1 x i8]* @.str4, i32 0, i32 0)) #7
  %57 = icmp ne i32 %56, 0
  br i1 %57, label %63, label %58

; <label>:58                                      ; preds = %52
  %59 = load i32* %ni, align 4
  %60 = load i32* %nl, align 4
  %61 = load [1024 x [1024 x double]]** %G, align 8
  %62 = getelementptr inbounds [1024 x [1024 x double]]* %61, i32 0, i32 0
  call void @print_array(i32 %59, i32 %60, [1024 x double]* %62)
  br label %63

; <label>:63                                      ; preds = %58, %52, %0
  %64 = load [1024 x [1024 x double]]** %E, align 8
  %65 = bitcast [1024 x [1024 x double]]* %64 to i8*
  call void @free(i8* %65) #5
  %66 = load [1024 x [1024 x double]]** %A, align 8
  %67 = bitcast [1024 x [1024 x double]]* %66 to i8*
  call void @free(i8* %67) #5
  %68 = load [1024 x [1024 x double]]** %B, align 8
  %69 = bitcast [1024 x [1024 x double]]* %68 to i8*
  call void @free(i8* %69) #5
  %70 = load [1024 x [1024 x double]]** %F, align 8
  %71 = bitcast [1024 x [1024 x double]]* %70 to i8*
  call void @free(i8* %71) #5
  %72 = load [1024 x [1024 x double]]** %C, align 8
  %73 = bitcast [1024 x [1024 x double]]* %72 to i8*
  call void @free(i8* %73) #5
  %74 = load [1024 x [1024 x double]]** %D, align 8
  %75 = bitcast [1024 x [1024 x double]]* %74 to i8*
  call void @free(i8* %75) #5
  %76 = load [1024 x [1024 x double]]** %G, align 8
  %77 = bitcast [1024 x [1024 x double]]* %76 to i8*
  call void @free(i8* %77) #5
  ret i32 0
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #4

; Function Attrs: nounwind uwtable
define internal void @init_array(i32 %ni, i32 %nj, i32 %nk, i32 %nl, i32 %nm, [1024 x double]* %A, [1024 x double]* %B, [1024 x double]* %C, [1024 x double]* %D) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca [1024 x double]*, align 8
  %7 = alloca [1024 x double]*, align 8
  %8 = alloca [1024 x double]*, align 8
  %9 = alloca [1024 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %ni, i32* %1, align 4
  store i32 %nj, i32* %2, align 4
  store i32 %nk, i32* %3, align 4
  store i32 %nl, i32* %4, align 4
  store i32 %nm, i32* %5, align 4
  store [1024 x double]* %A, [1024 x double]** %6, align 8
  store [1024 x double]* %B, [1024 x double]** %7, align 8
  store [1024 x double]* %C, [1024 x double]** %8, align 8
  store [1024 x double]* %D, [1024 x double]** %9, align 8
  store i32 0, i32* %i, align 4
  br label %10

; <label>:10                                      ; preds = %39, %0
  %11 = load i32* %i, align 4
  %12 = load i32* %1, align 4
  %13 = icmp slt i32 %11, %12
  br i1 %13, label %14, label %42

; <label>:14                                      ; preds = %10
  store i32 0, i32* %j, align 4
  br label %15

; <label>:15                                      ; preds = %35, %14
  %16 = load i32* %j, align 4
  %17 = load i32* %3, align 4
  %18 = icmp slt i32 %16, %17
  br i1 %18, label %19, label %38

; <label>:19                                      ; preds = %15
  %20 = load i32* %i, align 4
  %21 = sitofp i32 %20 to double
  %22 = load i32* %j, align 4
  %23 = sitofp i32 %22 to double
  %24 = fmul double %21, %23
  %25 = load i32* %1, align 4
  %26 = sitofp i32 %25 to double
  %27 = fdiv double %24, %26
  %28 = load i32* %j, align 4
  %29 = sext i32 %28 to i64
  %30 = load i32* %i, align 4
  %31 = sext i32 %30 to i64
  %32 = load [1024 x double]** %6, align 8
  %33 = getelementptr inbounds [1024 x double]* %32, i64 %31
  %34 = getelementptr inbounds [1024 x double]* %33, i32 0, i64 %29
  store double %27, double* %34, align 8
  br label %35

; <label>:35                                      ; preds = %19
  %36 = load i32* %j, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, i32* %j, align 4
  br label %15

; <label>:38                                      ; preds = %15
  br label %39

; <label>:39                                      ; preds = %38
  %40 = load i32* %i, align 4
  %41 = add nsw i32 %40, 1
  store i32 %41, i32* %i, align 4
  br label %10

; <label>:42                                      ; preds = %10
  store i32 0, i32* %i, align 4
  br label %43

; <label>:43                                      ; preds = %73, %42
  %44 = load i32* %i, align 4
  %45 = load i32* %3, align 4
  %46 = icmp slt i32 %44, %45
  br i1 %46, label %47, label %76

; <label>:47                                      ; preds = %43
  store i32 0, i32* %j, align 4
  br label %48

; <label>:48                                      ; preds = %69, %47
  %49 = load i32* %j, align 4
  %50 = load i32* %2, align 4
  %51 = icmp slt i32 %49, %50
  br i1 %51, label %52, label %72

; <label>:52                                      ; preds = %48
  %53 = load i32* %i, align 4
  %54 = sitofp i32 %53 to double
  %55 = load i32* %j, align 4
  %56 = add nsw i32 %55, 1
  %57 = sitofp i32 %56 to double
  %58 = fmul double %54, %57
  %59 = load i32* %2, align 4
  %60 = sitofp i32 %59 to double
  %61 = fdiv double %58, %60
  %62 = load i32* %j, align 4
  %63 = sext i32 %62 to i64
  %64 = load i32* %i, align 4
  %65 = sext i32 %64 to i64
  %66 = load [1024 x double]** %7, align 8
  %67 = getelementptr inbounds [1024 x double]* %66, i64 %65
  %68 = getelementptr inbounds [1024 x double]* %67, i32 0, i64 %63
  store double %61, double* %68, align 8
  br label %69

; <label>:69                                      ; preds = %52
  %70 = load i32* %j, align 4
  %71 = add nsw i32 %70, 1
  store i32 %71, i32* %j, align 4
  br label %48

; <label>:72                                      ; preds = %48
  br label %73

; <label>:73                                      ; preds = %72
  %74 = load i32* %i, align 4
  %75 = add nsw i32 %74, 1
  store i32 %75, i32* %i, align 4
  br label %43

; <label>:76                                      ; preds = %43
  store i32 0, i32* %i, align 4
  br label %77

; <label>:77                                      ; preds = %107, %76
  %78 = load i32* %i, align 4
  %79 = load i32* %2, align 4
  %80 = icmp slt i32 %78, %79
  br i1 %80, label %81, label %110

; <label>:81                                      ; preds = %77
  store i32 0, i32* %j, align 4
  br label %82

; <label>:82                                      ; preds = %103, %81
  %83 = load i32* %j, align 4
  %84 = load i32* %5, align 4
  %85 = icmp slt i32 %83, %84
  br i1 %85, label %86, label %106

; <label>:86                                      ; preds = %82
  %87 = load i32* %i, align 4
  %88 = sitofp i32 %87 to double
  %89 = load i32* %j, align 4
  %90 = add nsw i32 %89, 3
  %91 = sitofp i32 %90 to double
  %92 = fmul double %88, %91
  %93 = load i32* %4, align 4
  %94 = sitofp i32 %93 to double
  %95 = fdiv double %92, %94
  %96 = load i32* %j, align 4
  %97 = sext i32 %96 to i64
  %98 = load i32* %i, align 4
  %99 = sext i32 %98 to i64
  %100 = load [1024 x double]** %8, align 8
  %101 = getelementptr inbounds [1024 x double]* %100, i64 %99
  %102 = getelementptr inbounds [1024 x double]* %101, i32 0, i64 %97
  store double %95, double* %102, align 8
  br label %103

; <label>:103                                     ; preds = %86
  %104 = load i32* %j, align 4
  %105 = add nsw i32 %104, 1
  store i32 %105, i32* %j, align 4
  br label %82

; <label>:106                                     ; preds = %82
  br label %107

; <label>:107                                     ; preds = %106
  %108 = load i32* %i, align 4
  %109 = add nsw i32 %108, 1
  store i32 %109, i32* %i, align 4
  br label %77

; <label>:110                                     ; preds = %77
  store i32 0, i32* %i, align 4
  br label %111

; <label>:111                                     ; preds = %141, %110
  %112 = load i32* %i, align 4
  %113 = load i32* %5, align 4
  %114 = icmp slt i32 %112, %113
  br i1 %114, label %115, label %144

; <label>:115                                     ; preds = %111
  store i32 0, i32* %j, align 4
  br label %116

; <label>:116                                     ; preds = %137, %115
  %117 = load i32* %j, align 4
  %118 = load i32* %4, align 4
  %119 = icmp slt i32 %117, %118
  br i1 %119, label %120, label %140

; <label>:120                                     ; preds = %116
  %121 = load i32* %i, align 4
  %122 = sitofp i32 %121 to double
  %123 = load i32* %j, align 4
  %124 = add nsw i32 %123, 2
  %125 = sitofp i32 %124 to double
  %126 = fmul double %122, %125
  %127 = load i32* %3, align 4
  %128 = sitofp i32 %127 to double
  %129 = fdiv double %126, %128
  %130 = load i32* %j, align 4
  %131 = sext i32 %130 to i64
  %132 = load i32* %i, align 4
  %133 = sext i32 %132 to i64
  %134 = load [1024 x double]** %9, align 8
  %135 = getelementptr inbounds [1024 x double]* %134, i64 %133
  %136 = getelementptr inbounds [1024 x double]* %135, i32 0, i64 %131
  store double %129, double* %136, align 8
  br label %137

; <label>:137                                     ; preds = %120
  %138 = load i32* %j, align 4
  %139 = add nsw i32 %138, 1
  store i32 %139, i32* %j, align 4
  br label %116

; <label>:140                                     ; preds = %116
  br label %141

; <label>:141                                     ; preds = %140
  %142 = load i32* %i, align 4
  %143 = add nsw i32 %142, 1
  store i32 %143, i32* %i, align 4
  br label %111

; <label>:144                                     ; preds = %111
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @kernel_3mm(i32 %ni, i32 %nj, i32 %nk, i32 %nl, i32 %nm, [1024 x double]* %E, [1024 x double]* %A, [1024 x double]* %B, [1024 x double]* %F, [1024 x double]* %C, [1024 x double]* %D, [1024 x double]* %G) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca [1024 x double]*, align 8
  %7 = alloca [1024 x double]*, align 8
  %8 = alloca [1024 x double]*, align 8
  %9 = alloca [1024 x double]*, align 8
  %10 = alloca [1024 x double]*, align 8
  %11 = alloca [1024 x double]*, align 8
  %12 = alloca [1024 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %ni, i32* %1, align 4
  store i32 %nj, i32* %2, align 4
  store i32 %nk, i32* %3, align 4
  store i32 %nl, i32* %4, align 4
  store i32 %nm, i32* %5, align 4
  store [1024 x double]* %E, [1024 x double]** %6, align 8
  store [1024 x double]* %A, [1024 x double]** %7, align 8
  store [1024 x double]* %B, [1024 x double]** %8, align 8
  store [1024 x double]* %F, [1024 x double]** %9, align 8
  store [1024 x double]* %C, [1024 x double]** %10, align 8
  store [1024 x double]* %D, [1024 x double]** %11, align 8
  store [1024 x double]* %G, [1024 x double]** %12, align 8
  store i32 0, i32* %i, align 4
  br label %13

; <label>:13                                      ; preds = %69, %0
  %14 = load i32* %i, align 4
  %15 = load i32* %1, align 4
  %16 = icmp slt i32 %14, %15
  br i1 %16, label %17, label %72

; <label>:17                                      ; preds = %13
  store i32 0, i32* %j, align 4
  br label %18

; <label>:18                                      ; preds = %65, %17
  %19 = load i32* %j, align 4
  %20 = load i32* %2, align 4
  %21 = icmp slt i32 %19, %20
  br i1 %21, label %22, label %68

; <label>:22                                      ; preds = %18
  %23 = load i32* %j, align 4
  %24 = sext i32 %23 to i64
  %25 = load i32* %i, align 4
  %26 = sext i32 %25 to i64
  %27 = load [1024 x double]** %6, align 8
  %28 = getelementptr inbounds [1024 x double]* %27, i64 %26
  %29 = getelementptr inbounds [1024 x double]* %28, i32 0, i64 %24
  store double 0.000000e+00, double* %29, align 8
  store i32 0, i32* %k, align 4
  br label %30

; <label>:30                                      ; preds = %61, %22
  %31 = load i32* %k, align 4
  %32 = load i32* %3, align 4
  %33 = icmp slt i32 %31, %32
  br i1 %33, label %34, label %64

; <label>:34                                      ; preds = %30
  %35 = load i32* %k, align 4
  %36 = sext i32 %35 to i64
  %37 = load i32* %i, align 4
  %38 = sext i32 %37 to i64
  %39 = load [1024 x double]** %7, align 8
  %40 = getelementptr inbounds [1024 x double]* %39, i64 %38
  %41 = getelementptr inbounds [1024 x double]* %40, i32 0, i64 %36
  %42 = load double* %41, align 8
  %43 = load i32* %j, align 4
  %44 = sext i32 %43 to i64
  %45 = load i32* %k, align 4
  %46 = sext i32 %45 to i64
  %47 = load [1024 x double]** %8, align 8
  %48 = getelementptr inbounds [1024 x double]* %47, i64 %46
  %49 = getelementptr inbounds [1024 x double]* %48, i32 0, i64 %44
  %50 = load double* %49, align 8
  %51 = fmul double %42, %50
  %52 = load i32* %j, align 4
  %53 = sext i32 %52 to i64
  %54 = load i32* %i, align 4
  %55 = sext i32 %54 to i64
  %56 = load [1024 x double]** %6, align 8
  %57 = getelementptr inbounds [1024 x double]* %56, i64 %55
  %58 = getelementptr inbounds [1024 x double]* %57, i32 0, i64 %53
  %59 = load double* %58, align 8
  %60 = fadd double %59, %51
  store double %60, double* %58, align 8
  br label %61

; <label>:61                                      ; preds = %34
  %62 = load i32* %k, align 4
  %63 = add nsw i32 %62, 1
  store i32 %63, i32* %k, align 4
  br label %30

; <label>:64                                      ; preds = %30
  br label %65

; <label>:65                                      ; preds = %64
  %66 = load i32* %j, align 4
  %67 = add nsw i32 %66, 1
  store i32 %67, i32* %j, align 4
  br label %18

; <label>:68                                      ; preds = %18
  br label %69

; <label>:69                                      ; preds = %68
  %70 = load i32* %i, align 4
  %71 = add nsw i32 %70, 1
  store i32 %71, i32* %i, align 4
  br label %13

; <label>:72                                      ; preds = %13
  store i32 0, i32* %i, align 4
  br label %73

; <label>:73                                      ; preds = %129, %72
  %74 = load i32* %i, align 4
  %75 = load i32* %2, align 4
  %76 = icmp slt i32 %74, %75
  br i1 %76, label %77, label %132

; <label>:77                                      ; preds = %73
  store i32 0, i32* %j, align 4
  br label %78

; <label>:78                                      ; preds = %125, %77
  %79 = load i32* %j, align 4
  %80 = load i32* %4, align 4
  %81 = icmp slt i32 %79, %80
  br i1 %81, label %82, label %128

; <label>:82                                      ; preds = %78
  %83 = load i32* %j, align 4
  %84 = sext i32 %83 to i64
  %85 = load i32* %i, align 4
  %86 = sext i32 %85 to i64
  %87 = load [1024 x double]** %9, align 8
  %88 = getelementptr inbounds [1024 x double]* %87, i64 %86
  %89 = getelementptr inbounds [1024 x double]* %88, i32 0, i64 %84
  store double 0.000000e+00, double* %89, align 8
  store i32 0, i32* %k, align 4
  br label %90

; <label>:90                                      ; preds = %121, %82
  %91 = load i32* %k, align 4
  %92 = load i32* %5, align 4
  %93 = icmp slt i32 %91, %92
  br i1 %93, label %94, label %124

; <label>:94                                      ; preds = %90
  %95 = load i32* %k, align 4
  %96 = sext i32 %95 to i64
  %97 = load i32* %i, align 4
  %98 = sext i32 %97 to i64
  %99 = load [1024 x double]** %10, align 8
  %100 = getelementptr inbounds [1024 x double]* %99, i64 %98
  %101 = getelementptr inbounds [1024 x double]* %100, i32 0, i64 %96
  %102 = load double* %101, align 8
  %103 = load i32* %j, align 4
  %104 = sext i32 %103 to i64
  %105 = load i32* %k, align 4
  %106 = sext i32 %105 to i64
  %107 = load [1024 x double]** %11, align 8
  %108 = getelementptr inbounds [1024 x double]* %107, i64 %106
  %109 = getelementptr inbounds [1024 x double]* %108, i32 0, i64 %104
  %110 = load double* %109, align 8
  %111 = fmul double %102, %110
  %112 = load i32* %j, align 4
  %113 = sext i32 %112 to i64
  %114 = load i32* %i, align 4
  %115 = sext i32 %114 to i64
  %116 = load [1024 x double]** %9, align 8
  %117 = getelementptr inbounds [1024 x double]* %116, i64 %115
  %118 = getelementptr inbounds [1024 x double]* %117, i32 0, i64 %113
  %119 = load double* %118, align 8
  %120 = fadd double %119, %111
  store double %120, double* %118, align 8
  br label %121

; <label>:121                                     ; preds = %94
  %122 = load i32* %k, align 4
  %123 = add nsw i32 %122, 1
  store i32 %123, i32* %k, align 4
  br label %90

; <label>:124                                     ; preds = %90
  br label %125

; <label>:125                                     ; preds = %124
  %126 = load i32* %j, align 4
  %127 = add nsw i32 %126, 1
  store i32 %127, i32* %j, align 4
  br label %78

; <label>:128                                     ; preds = %78
  br label %129

; <label>:129                                     ; preds = %128
  %130 = load i32* %i, align 4
  %131 = add nsw i32 %130, 1
  store i32 %131, i32* %i, align 4
  br label %73

; <label>:132                                     ; preds = %73
  store i32 0, i32* %i, align 4
  br label %133

; <label>:133                                     ; preds = %189, %132
  %134 = load i32* %i, align 4
  %135 = load i32* %1, align 4
  %136 = icmp slt i32 %134, %135
  br i1 %136, label %137, label %192

; <label>:137                                     ; preds = %133
  store i32 0, i32* %j, align 4
  br label %138

; <label>:138                                     ; preds = %185, %137
  %139 = load i32* %j, align 4
  %140 = load i32* %4, align 4
  %141 = icmp slt i32 %139, %140
  br i1 %141, label %142, label %188

; <label>:142                                     ; preds = %138
  %143 = load i32* %j, align 4
  %144 = sext i32 %143 to i64
  %145 = load i32* %i, align 4
  %146 = sext i32 %145 to i64
  %147 = load [1024 x double]** %12, align 8
  %148 = getelementptr inbounds [1024 x double]* %147, i64 %146
  %149 = getelementptr inbounds [1024 x double]* %148, i32 0, i64 %144
  store double 0.000000e+00, double* %149, align 8
  store i32 0, i32* %k, align 4
  br label %150

; <label>:150                                     ; preds = %181, %142
  %151 = load i32* %k, align 4
  %152 = load i32* %2, align 4
  %153 = icmp slt i32 %151, %152
  br i1 %153, label %154, label %184

; <label>:154                                     ; preds = %150
  %155 = load i32* %k, align 4
  %156 = sext i32 %155 to i64
  %157 = load i32* %i, align 4
  %158 = sext i32 %157 to i64
  %159 = load [1024 x double]** %6, align 8
  %160 = getelementptr inbounds [1024 x double]* %159, i64 %158
  %161 = getelementptr inbounds [1024 x double]* %160, i32 0, i64 %156
  %162 = load double* %161, align 8
  %163 = load i32* %j, align 4
  %164 = sext i32 %163 to i64
  %165 = load i32* %k, align 4
  %166 = sext i32 %165 to i64
  %167 = load [1024 x double]** %9, align 8
  %168 = getelementptr inbounds [1024 x double]* %167, i64 %166
  %169 = getelementptr inbounds [1024 x double]* %168, i32 0, i64 %164
  %170 = load double* %169, align 8
  %171 = fmul double %162, %170
  %172 = load i32* %j, align 4
  %173 = sext i32 %172 to i64
  %174 = load i32* %i, align 4
  %175 = sext i32 %174 to i64
  %176 = load [1024 x double]** %12, align 8
  %177 = getelementptr inbounds [1024 x double]* %176, i64 %175
  %178 = getelementptr inbounds [1024 x double]* %177, i32 0, i64 %173
  %179 = load double* %178, align 8
  %180 = fadd double %179, %171
  store double %180, double* %178, align 8
  br label %181

; <label>:181                                     ; preds = %154
  %182 = load i32* %k, align 4
  %183 = add nsw i32 %182, 1
  store i32 %183, i32* %k, align 4
  br label %150

; <label>:184                                     ; preds = %150
  br label %185

; <label>:185                                     ; preds = %184
  %186 = load i32* %j, align 4
  %187 = add nsw i32 %186, 1
  store i32 %187, i32* %j, align 4
  br label %138

; <label>:188                                     ; preds = %138
  br label %189

; <label>:189                                     ; preds = %188
  %190 = load i32* %i, align 4
  %191 = add nsw i32 %190, 1
  store i32 %191, i32* %i, align 4
  br label %133

; <label>:192                                     ; preds = %133
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @print_array(i32 %ni, i32 %nl, [1024 x double]* %G) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca [1024 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %ni, i32* %1, align 4
  store i32 %nl, i32* %2, align 4
  store [1024 x double]* %G, [1024 x double]** %3, align 8
  store i32 0, i32* %i, align 4
  br label %4

; <label>:4                                       ; preds = %39, %0
  %5 = load i32* %i, align 4
  %6 = load i32* %1, align 4
  %7 = icmp slt i32 %5, %6
  br i1 %7, label %8, label %42

; <label>:8                                       ; preds = %4
  store i32 0, i32* %j, align 4
  br label %9

; <label>:9                                       ; preds = %35, %8
  %10 = load i32* %j, align 4
  %11 = load i32* %2, align 4
  %12 = icmp slt i32 %10, %11
  br i1 %12, label %13, label %38

; <label>:13                                      ; preds = %9
  %14 = load %struct._IO_FILE** @stderr, align 8
  %15 = load i32* %j, align 4
  %16 = sext i32 %15 to i64
  %17 = load i32* %i, align 4
  %18 = sext i32 %17 to i64
  %19 = load [1024 x double]** %3, align 8
  %20 = getelementptr inbounds [1024 x double]* %19, i64 %18
  %21 = getelementptr inbounds [1024 x double]* %20, i32 0, i64 %16
  %22 = load double* %21, align 8
  %23 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8]* @.str15, i32 0, i32 0), double %22)
  %24 = load i32* %i, align 4
  %25 = load i32* %1, align 4
  %26 = mul nsw i32 %24, %25
  %27 = load i32* %j, align 4
  %28 = add nsw i32 %26, %27
  %29 = srem i32 %28, 20
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %31, label %34

; <label>:31                                      ; preds = %13
  %32 = load %struct._IO_FILE** @stderr, align 8
  %33 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %32, i8* getelementptr inbounds ([2 x i8]* @.str26, i32 0, i32 0))
  br label %34

; <label>:34                                      ; preds = %31, %13
  br label %35

; <label>:35                                      ; preds = %34
  %36 = load i32* %j, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, i32* %j, align 4
  br label %9

; <label>:38                                      ; preds = %9
  br label %39

; <label>:39                                      ; preds = %38
  %40 = load i32* %i, align 4
  %41 = add nsw i32 %40, 1
  store i32 %41, i32* %i, align 4
  br label %4

; <label>:42                                      ; preds = %4
  %43 = load %struct._IO_FILE** @stderr, align 8
  %44 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %43, i8* getelementptr inbounds ([2 x i8]* @.str26, i32 0, i32 0))
  ret void
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }
attributes #7 = { nounwind readonly }
