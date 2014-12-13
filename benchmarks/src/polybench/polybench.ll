; ModuleID = 'utilities/polybench.c'
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

; Function Attrs: nounwind uwtable
define void @polybench_flush_cache() #0 {
  %cs = alloca i32, align 4
  %flush = alloca double*, align 8
  %i = alloca i32, align 4
  %tmp = alloca double, align 8
  store i32 4194560, i32* %cs, align 4
  %1 = load i32* %cs, align 4
  %2 = sext i32 %1 to i64
  %3 = call noalias i8* @calloc(i64 %2, i64 8) #4
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
  call void @__assert_fail(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 97, i8* getelementptr inbounds ([29 x i8]* @__PRETTY_FUNCTION__.polybench_flush_cache, i32 0, i32 0)) #5
  unreachable
                                                  ; No predecessors!
  br label %26

; <label>:26                                      ; preds = %25, %23
  %27 = load double** %flush, align 8
  %28 = bitcast double* %27 to i8*
  call void @free(i8* %28) #4
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
  %3 = call i32 @posix_memalign(i8** %new, i64 32, i64 %2) #4
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
  call void @exit(i32 1) #5
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

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
