; ModuleID = 'test.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*
@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str1 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@polybench_papi_counters_threadid = global i32 0, align 4
@polybench_program_total_flops = global double 0.000000e+00, align 8
@polybench_t_start = common global double 0.000000e+00, align 8
@polybench_t_end = common global double 0.000000e+00, align 8
@polybench_c_start = common global i64 0, align 8
@polybench_c_end = common global i64 0, align 8
@.str3 = private unnamed_addr constant [12 x i8] c"tmp <= 10.0\00", align 1
@.str14 = private unnamed_addr constant [22 x i8] c"utilities/polybench.c\00", align 1
@__PRETTY_FUNCTION__.polybench_flush_cache = private unnamed_addr constant [29 x i8] c"void polybench_flush_cache()\00", align 1
@.str25 = private unnamed_addr constant [7 x i8] c"%0.6f\0A\00", align 1
@.str36 = private unnamed_addr constant [51 x i8] c"[PolyBench] posix_memalign: cannot allocate memory\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %0 = call i32 (i32, ...)* @init_PAPI(i32 16)
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %ni = alloca i32, align 4
  %nj = alloca i32, align 4
  %nk = alloca i32, align 4
  %nl = alloca i32, align 4
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %tmp = alloca [1024 x [1024 x double]]*, align 8
  %A = alloca [1024 x [1024 x double]]*, align 8
  %B = alloca [1024 x [1024 x double]]*, align 8
  %C = alloca [1024 x [1024 x double]]*, align 8
  %D = alloca [1024 x [1024 x double]]*, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  store i32 1024, i32* %ni, align 4
  store i32 1024, i32* %nj, align 4
  store i32 1024, i32* %nk, align 4
  store i32 1024, i32* %nl, align 4
  %call = call i8* @polybench_alloc_data(i32 1048576, i32 8)
  %1 = bitcast i8* %call to [1024 x [1024 x double]]*
  store [1024 x [1024 x double]]* %1, [1024 x [1024 x double]]** %tmp, align 8
  %call2 = call i8* @polybench_alloc_data(i32 1048576, i32 8)
  %2 = bitcast i8* %call2 to [1024 x [1024 x double]]*
  store [1024 x [1024 x double]]* %2, [1024 x [1024 x double]]** %A, align 8
  %call4 = call i8* @polybench_alloc_data(i32 1048576, i32 8)
  %3 = bitcast i8* %call4 to [1024 x [1024 x double]]*
  store [1024 x [1024 x double]]* %3, [1024 x [1024 x double]]** %B, align 8
  %call6 = call i8* @polybench_alloc_data(i32 1048576, i32 8)
  %4 = bitcast i8* %call6 to [1024 x [1024 x double]]*
  store [1024 x [1024 x double]]* %4, [1024 x [1024 x double]]** %C, align 8
  %call8 = call i8* @polybench_alloc_data(i32 1048576, i32 8)
  %5 = bitcast i8* %call8 to [1024 x [1024 x double]]*
  store [1024 x [1024 x double]]* %5, [1024 x [1024 x double]]** %D, align 8
  %6 = load i32* %ni, align 4
  %7 = load i32* %nj, align 4
  %8 = load i32* %nk, align 4
  %9 = load i32* %nl, align 4
  %10 = load [1024 x [1024 x double]]** %A, align 8
  %arraydecay = getelementptr inbounds [1024 x [1024 x double]]* %10, i32 0, i32 0
  %11 = load [1024 x [1024 x double]]** %B, align 8
  %arraydecay9 = getelementptr inbounds [1024 x [1024 x double]]* %11, i32 0, i32 0
  %12 = load [1024 x [1024 x double]]** %C, align 8
  %arraydecay10 = getelementptr inbounds [1024 x [1024 x double]]* %12, i32 0, i32 0
  %13 = load [1024 x [1024 x double]]** %D, align 8
  %arraydecay11 = getelementptr inbounds [1024 x [1024 x double]]* %13, i32 0, i32 0
  call void @init_array(i32 %6, i32 %7, i32 %8, i32 %9, double* %alpha, double* %beta, [1024 x double]* %arraydecay, [1024 x double]* %arraydecay9, [1024 x double]* %arraydecay10, [1024 x double]* %arraydecay11)
  %14 = load i32* %ni, align 4
  %15 = load i32* %nj, align 4
  %16 = load i32* %nk, align 4
  %17 = load i32* %nl, align 4
  %18 = load double* %alpha, align 8
  %19 = load double* %beta, align 8
  %20 = load [1024 x [1024 x double]]** %tmp, align 8
  %arraydecay12 = getelementptr inbounds [1024 x [1024 x double]]* %20, i32 0, i32 0
  %21 = load [1024 x [1024 x double]]** %A, align 8
  %arraydecay13 = getelementptr inbounds [1024 x [1024 x double]]* %21, i32 0, i32 0
  %22 = load [1024 x [1024 x double]]** %B, align 8
  %arraydecay14 = getelementptr inbounds [1024 x [1024 x double]]* %22, i32 0, i32 0
  %23 = load [1024 x [1024 x double]]** %C, align 8
  %arraydecay15 = getelementptr inbounds [1024 x [1024 x double]]* %23, i32 0, i32 0
  %24 = load [1024 x [1024 x double]]** %D, align 8
  %arraydecay16 = getelementptr inbounds [1024 x [1024 x double]]* %24, i32 0, i32 0
  call void @kernel_2mm(i32 %14, i32 %15, i32 %16, i32 %17, double %18, double %19, [1024 x double]* %arraydecay12, [1024 x double]* %arraydecay13, [1024 x double]* %arraydecay14, [1024 x double]* %arraydecay15, [1024 x double]* %arraydecay16)
  %25 = load i32* %argc.addr, align 4
  %cmp = icmp sgt i32 %25, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %26 = load i8*** %argv.addr, align 8
  %arrayidx = getelementptr inbounds i8** %26, i64 0
  %27 = load i8** %arrayidx, align 8
  call void (i32, ...)* @start_measures(i32 0)
  %call17 = call i32 @strcmp(i8* %27, i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0)) #6
  call void (...)* @get_results()
  %tobool = icmp ne i32 %call17, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true
  %28 = load i32* %ni, align 4
  %29 = load i32* %nl, align 4
  %30 = load [1024 x [1024 x double]]** %D, align 8
  %arraydecay18 = getelementptr inbounds [1024 x [1024 x double]]* %30, i32 0, i32 0
  call void @print_array(i32 %28, i32 %29, [1024 x double]* %arraydecay18)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %31 = load [1024 x [1024 x double]]** %tmp, align 8
  %32 = bitcast [1024 x [1024 x double]]* %31 to i8*
  call void (i32, ...)* @start_measures(i32 1)
  call void @free(i8* %32) #7
  call void (...)* @get_results()
  %33 = load [1024 x [1024 x double]]** %A, align 8
  %34 = bitcast [1024 x [1024 x double]]* %33 to i8*
  call void (i32, ...)* @start_measures(i32 2)
  call void @free(i8* %34) #7
  call void (...)* @get_results()
  %35 = load [1024 x [1024 x double]]** %B, align 8
  %36 = bitcast [1024 x [1024 x double]]* %35 to i8*
  call void (i32, ...)* @start_measures(i32 3)
  call void @free(i8* %36) #7
  call void (...)* @get_results()
  %37 = load [1024 x [1024 x double]]** %C, align 8
  %38 = bitcast [1024 x [1024 x double]]* %37 to i8*
  call void (i32, ...)* @start_measures(i32 4)
  call void @free(i8* %38) #7
  call void (...)* @get_results()
  %39 = load [1024 x [1024 x double]]** %D, align 8
  %40 = bitcast [1024 x [1024 x double]]* %39 to i8*
  call void (i32, ...)* @start_measures(i32 5)
  call void @free(i8* %40) #7
  call void (...)* @get_results()
  %41 = call i32 (...)* @print_results()
  ret i32 0
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #1

; Function Attrs: nounwind
declare void @free(i8*) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #3

; Function Attrs: nounwind uwtable
define internal void @init_array(i32 %ni, i32 %nj, i32 %nk, i32 %nl, double* %alpha, double* %beta, [1024 x double]* %A, [1024 x double]* %B, [1024 x double]* %C, [1024 x double]* %D) #0 {
entry:
  %ni.addr = alloca i32, align 4
  %nj.addr = alloca i32, align 4
  %nk.addr = alloca i32, align 4
  %nl.addr = alloca i32, align 4
  %alpha.addr = alloca double*, align 8
  %beta.addr = alloca double*, align 8
  %A.addr = alloca [1024 x double]*, align 8
  %B.addr = alloca [1024 x double]*, align 8
  %C.addr = alloca [1024 x double]*, align 8
  %D.addr = alloca [1024 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %ni, i32* %ni.addr, align 4
  store i32 %nj, i32* %nj.addr, align 4
  store i32 %nk, i32* %nk.addr, align 4
  store i32 %nl, i32* %nl.addr, align 4
  store double* %alpha, double** %alpha.addr, align 8
  store double* %beta, double** %beta.addr, align 8
  store [1024 x double]* %A, [1024 x double]** %A.addr, align 8
  store [1024 x double]* %B, [1024 x double]** %B.addr, align 8
  store [1024 x double]* %C, [1024 x double]** %C.addr, align 8
  store [1024 x double]* %D, [1024 x double]** %D.addr, align 8
  %0 = load double** %alpha.addr, align 8
  store double 3.241200e+04, double* %0, align 8
  %1 = load double** %beta.addr, align 8
  store double 2.123000e+03, double* %1, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc8, %entry
  %2 = load i32* %i, align 4
  %3 = load i32* %ni.addr, align 4
  %cmp = icmp slt i32 %2, %3
  br i1 %cmp, label %for.body, label %for.end10

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %4 = load i32* %j, align 4
  %5 = load i32* %nk.addr, align 4
  %cmp2 = icmp slt i32 %4, %5
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %6 = load i32* %i, align 4
  %conv = sitofp i32 %6 to double
  %7 = load i32* %j, align 4
  %conv4 = sitofp i32 %7 to double
  %mul = fmul double %conv, %conv4
  %8 = load i32* %ni.addr, align 4
  %conv5 = sitofp i32 %8 to double
  %div = fdiv double %mul, %conv5
  %9 = load i32* %j, align 4
  %idxprom = sext i32 %9 to i64
  %10 = load i32* %i, align 4
  %idxprom6 = sext i32 %10 to i64
  %11 = load [1024 x double]** %A.addr, align 8
  %arrayidx = getelementptr inbounds [1024 x double]* %11, i64 %idxprom6
  %arrayidx7 = getelementptr inbounds [1024 x double]* %arrayidx, i32 0, i64 %idxprom
  store double %div, double* %arrayidx7, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %12 = load i32* %j, align 4
  %inc = add nsw i32 %12, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc8

for.inc8:                                         ; preds = %for.end
  %13 = load i32* %i, align 4
  %inc9 = add nsw i32 %13, 1
  store i32 %inc9, i32* %i, align 4
  br label %for.cond

for.end10:                                        ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond11

for.cond11:                                       ; preds = %for.inc31, %for.end10
  %14 = load i32* %i, align 4
  %15 = load i32* %nk.addr, align 4
  %cmp12 = icmp slt i32 %14, %15
  br i1 %cmp12, label %for.body14, label %for.end33

for.body14:                                       ; preds = %for.cond11
  store i32 0, i32* %j, align 4
  br label %for.cond15

for.cond15:                                       ; preds = %for.inc28, %for.body14
  %16 = load i32* %j, align 4
  %17 = load i32* %nj.addr, align 4
  %cmp16 = icmp slt i32 %16, %17
  br i1 %cmp16, label %for.body18, label %for.end30

for.body18:                                       ; preds = %for.cond15
  %18 = load i32* %i, align 4
  %conv19 = sitofp i32 %18 to double
  %19 = load i32* %j, align 4
  %add = add nsw i32 %19, 1
  %conv20 = sitofp i32 %add to double
  %mul21 = fmul double %conv19, %conv20
  %20 = load i32* %nj.addr, align 4
  %conv22 = sitofp i32 %20 to double
  %div23 = fdiv double %mul21, %conv22
  %21 = load i32* %j, align 4
  %idxprom24 = sext i32 %21 to i64
  %22 = load i32* %i, align 4
  %idxprom25 = sext i32 %22 to i64
  %23 = load [1024 x double]** %B.addr, align 8
  %arrayidx26 = getelementptr inbounds [1024 x double]* %23, i64 %idxprom25
  %arrayidx27 = getelementptr inbounds [1024 x double]* %arrayidx26, i32 0, i64 %idxprom24
  store double %div23, double* %arrayidx27, align 8
  br label %for.inc28

for.inc28:                                        ; preds = %for.body18
  %24 = load i32* %j, align 4
  %inc29 = add nsw i32 %24, 1
  store i32 %inc29, i32* %j, align 4
  br label %for.cond15

for.end30:                                        ; preds = %for.cond15
  br label %for.inc31

for.inc31:                                        ; preds = %for.end30
  %25 = load i32* %i, align 4
  %inc32 = add nsw i32 %25, 1
  store i32 %inc32, i32* %i, align 4
  br label %for.cond11

for.end33:                                        ; preds = %for.cond11
  store i32 0, i32* %i, align 4
  br label %for.cond34

for.cond34:                                       ; preds = %for.inc55, %for.end33
  %26 = load i32* %i, align 4
  %27 = load i32* %nl.addr, align 4
  %cmp35 = icmp slt i32 %26, %27
  br i1 %cmp35, label %for.body37, label %for.end57

for.body37:                                       ; preds = %for.cond34
  store i32 0, i32* %j, align 4
  br label %for.cond38

for.cond38:                                       ; preds = %for.inc52, %for.body37
  %28 = load i32* %j, align 4
  %29 = load i32* %nj.addr, align 4
  %cmp39 = icmp slt i32 %28, %29
  br i1 %cmp39, label %for.body41, label %for.end54

for.body41:                                       ; preds = %for.cond38
  %30 = load i32* %i, align 4
  %conv42 = sitofp i32 %30 to double
  %31 = load i32* %j, align 4
  %add43 = add nsw i32 %31, 3
  %conv44 = sitofp i32 %add43 to double
  %mul45 = fmul double %conv42, %conv44
  %32 = load i32* %nl.addr, align 4
  %conv46 = sitofp i32 %32 to double
  %div47 = fdiv double %mul45, %conv46
  %33 = load i32* %j, align 4
  %idxprom48 = sext i32 %33 to i64
  %34 = load i32* %i, align 4
  %idxprom49 = sext i32 %34 to i64
  %35 = load [1024 x double]** %C.addr, align 8
  %arrayidx50 = getelementptr inbounds [1024 x double]* %35, i64 %idxprom49
  %arrayidx51 = getelementptr inbounds [1024 x double]* %arrayidx50, i32 0, i64 %idxprom48
  store double %div47, double* %arrayidx51, align 8
  br label %for.inc52

for.inc52:                                        ; preds = %for.body41
  %36 = load i32* %j, align 4
  %inc53 = add nsw i32 %36, 1
  store i32 %inc53, i32* %j, align 4
  br label %for.cond38

for.end54:                                        ; preds = %for.cond38
  br label %for.inc55

for.inc55:                                        ; preds = %for.end54
  %37 = load i32* %i, align 4
  %inc56 = add nsw i32 %37, 1
  store i32 %inc56, i32* %i, align 4
  br label %for.cond34

for.end57:                                        ; preds = %for.cond34
  store i32 0, i32* %i, align 4
  br label %for.cond58

for.cond58:                                       ; preds = %for.inc79, %for.end57
  %38 = load i32* %i, align 4
  %39 = load i32* %ni.addr, align 4
  %cmp59 = icmp slt i32 %38, %39
  br i1 %cmp59, label %for.body61, label %for.end81

for.body61:                                       ; preds = %for.cond58
  store i32 0, i32* %j, align 4
  br label %for.cond62

for.cond62:                                       ; preds = %for.inc76, %for.body61
  %40 = load i32* %j, align 4
  %41 = load i32* %nl.addr, align 4
  %cmp63 = icmp slt i32 %40, %41
  br i1 %cmp63, label %for.body65, label %for.end78

for.body65:                                       ; preds = %for.cond62
  %42 = load i32* %i, align 4
  %conv66 = sitofp i32 %42 to double
  %43 = load i32* %j, align 4
  %add67 = add nsw i32 %43, 2
  %conv68 = sitofp i32 %add67 to double
  %mul69 = fmul double %conv66, %conv68
  %44 = load i32* %nk.addr, align 4
  %conv70 = sitofp i32 %44 to double
  %div71 = fdiv double %mul69, %conv70
  %45 = load i32* %j, align 4
  %idxprom72 = sext i32 %45 to i64
  %46 = load i32* %i, align 4
  %idxprom73 = sext i32 %46 to i64
  %47 = load [1024 x double]** %D.addr, align 8
  %arrayidx74 = getelementptr inbounds [1024 x double]* %47, i64 %idxprom73
  %arrayidx75 = getelementptr inbounds [1024 x double]* %arrayidx74, i32 0, i64 %idxprom72
  store double %div71, double* %arrayidx75, align 8
  br label %for.inc76

for.inc76:                                        ; preds = %for.body65
  %48 = load i32* %j, align 4
  %inc77 = add nsw i32 %48, 1
  store i32 %inc77, i32* %j, align 4
  br label %for.cond62

for.end78:                                        ; preds = %for.cond62
  br label %for.inc79

for.inc79:                                        ; preds = %for.end78
  %49 = load i32* %i, align 4
  %inc80 = add nsw i32 %49, 1
  store i32 %inc80, i32* %i, align 4
  br label %for.cond58

for.end81:                                        ; preds = %for.cond58
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @kernel_2mm(i32 %ni, i32 %nj, i32 %nk, i32 %nl, double %alpha, double %beta, [1024 x double]* %tmp, [1024 x double]* %A, [1024 x double]* %B, [1024 x double]* %C, [1024 x double]* %D) #0 {
entry:
  %ni.addr = alloca i32, align 4
  %nj.addr = alloca i32, align 4
  %nk.addr = alloca i32, align 4
  %nl.addr = alloca i32, align 4
  %alpha.addr = alloca double, align 8
  %beta.addr = alloca double, align 8
  %tmp.addr = alloca [1024 x double]*, align 8
  %A.addr = alloca [1024 x double]*, align 8
  %B.addr = alloca [1024 x double]*, align 8
  %C.addr = alloca [1024 x double]*, align 8
  %D.addr = alloca [1024 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %ni, i32* %ni.addr, align 4
  store i32 %nj, i32* %nj.addr, align 4
  store i32 %nk, i32* %nk.addr, align 4
  store i32 %nl, i32* %nl.addr, align 4
  store double %alpha, double* %alpha.addr, align 8
  store double %beta, double* %beta.addr, align 8
  store [1024 x double]* %tmp, [1024 x double]** %tmp.addr, align 8
  store [1024 x double]* %A, [1024 x double]** %A.addr, align 8
  store [1024 x double]* %B, [1024 x double]** %B.addr, align 8
  store [1024 x double]* %C, [1024 x double]** %C.addr, align 8
  store [1024 x double]* %D, [1024 x double]** %D.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc28, %entry
  %0 = load i32* %i, align 4
  %1 = load i32* %ni.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end30

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc25, %for.body
  %2 = load i32* %j, align 4
  %3 = load i32* %nj.addr, align 4
  %cmp5 = icmp slt i32 %2, %3
  br i1 %cmp5, label %for.body6, label %for.end27

for.body6:                                        ; preds = %for.cond4
  %4 = load i32* %j, align 4
  %idxprom = sext i32 %4 to i64
  %5 = load i32* %i, align 4
  %idxprom7 = sext i32 %5 to i64
  %6 = load [1024 x double]** %tmp.addr, align 8
  %arrayidx = getelementptr inbounds [1024 x double]* %6, i64 %idxprom7
  %arrayidx8 = getelementptr inbounds [1024 x double]* %arrayidx, i32 0, i64 %idxprom
  store double 0.000000e+00, double* %arrayidx8, align 8
  store i32 0, i32* %k, align 4
  br label %for.cond9

for.cond9:                                        ; preds = %for.inc, %for.body6
  %7 = load i32* %k, align 4
  %8 = load i32* %nk.addr, align 4
  %cmp10 = icmp slt i32 %7, %8
  br i1 %cmp10, label %for.body11, label %for.end

for.body11:                                       ; preds = %for.cond9
  %9 = load double* %alpha.addr, align 8
  %10 = load i32* %k, align 4
  %idxprom12 = sext i32 %10 to i64
  %11 = load i32* %i, align 4
  %idxprom13 = sext i32 %11 to i64
  %12 = load [1024 x double]** %A.addr, align 8
  %arrayidx14 = getelementptr inbounds [1024 x double]* %12, i64 %idxprom13
  %arrayidx15 = getelementptr inbounds [1024 x double]* %arrayidx14, i32 0, i64 %idxprom12
  %13 = load double* %arrayidx15, align 8
  %mul = fmul double %9, %13
  %14 = load i32* %j, align 4
  %idxprom16 = sext i32 %14 to i64
  %15 = load i32* %k, align 4
  %idxprom17 = sext i32 %15 to i64
  %16 = load [1024 x double]** %B.addr, align 8
  %arrayidx18 = getelementptr inbounds [1024 x double]* %16, i64 %idxprom17
  %arrayidx19 = getelementptr inbounds [1024 x double]* %arrayidx18, i32 0, i64 %idxprom16
  %17 = load double* %arrayidx19, align 8
  %mul20 = fmul double %mul, %17
  %18 = load i32* %j, align 4
  %idxprom21 = sext i32 %18 to i64
  %19 = load i32* %i, align 4
  %idxprom22 = sext i32 %19 to i64
  %20 = load [1024 x double]** %tmp.addr, align 8
  %arrayidx23 = getelementptr inbounds [1024 x double]* %20, i64 %idxprom22
  %arrayidx24 = getelementptr inbounds [1024 x double]* %arrayidx23, i32 0, i64 %idxprom21
  %21 = load double* %arrayidx24, align 8
  %add = fadd double %21, %mul20
  store double %add, double* %arrayidx24, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body11
  %22 = load i32* %k, align 4
  %inc = add nsw i32 %22, 1
  store i32 %inc, i32* %k, align 4
  br label %for.cond9

for.end:                                          ; preds = %for.cond9
  br label %for.inc25

for.inc25:                                        ; preds = %for.end
  %23 = load i32* %j, align 4
  %inc26 = add nsw i32 %23, 1
  store i32 %inc26, i32* %j, align 4
  br label %for.cond4

for.end27:                                        ; preds = %for.cond4
  br label %for.inc28

for.inc28:                                        ; preds = %for.end27
  %24 = load i32* %i, align 4
  %inc29 = add nsw i32 %24, 1
  store i32 %inc29, i32* %i, align 4
  br label %for.cond

for.end30:                                        ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond31

for.cond31:                                       ; preds = %for.inc65, %for.end30
  %25 = load i32* %i, align 4
  %26 = load i32* %ni.addr, align 4
  %cmp32 = icmp slt i32 %25, %26
  br i1 %cmp32, label %for.body33, label %for.end67

for.body33:                                       ; preds = %for.cond31
  store i32 0, i32* %j, align 4
  br label %for.cond34

for.cond34:                                       ; preds = %for.inc62, %for.body33
  %27 = load i32* %j, align 4
  %28 = load i32* %nl.addr, align 4
  %cmp35 = icmp slt i32 %27, %28
  br i1 %cmp35, label %for.body36, label %for.end64

for.body36:                                       ; preds = %for.cond34
  %29 = load double* %beta.addr, align 8
  %30 = load i32* %j, align 4
  %idxprom37 = sext i32 %30 to i64
  %31 = load i32* %i, align 4
  %idxprom38 = sext i32 %31 to i64
  %32 = load [1024 x double]** %D.addr, align 8
  %arrayidx39 = getelementptr inbounds [1024 x double]* %32, i64 %idxprom38
  %arrayidx40 = getelementptr inbounds [1024 x double]* %arrayidx39, i32 0, i64 %idxprom37
  %33 = load double* %arrayidx40, align 8
  %mul41 = fmul double %33, %29
  store double %mul41, double* %arrayidx40, align 8
  store i32 0, i32* %k, align 4
  br label %for.cond42

for.cond42:                                       ; preds = %for.inc59, %for.body36
  %34 = load i32* %k, align 4
  %35 = load i32* %nj.addr, align 4
  %cmp43 = icmp slt i32 %34, %35
  br i1 %cmp43, label %for.body44, label %for.end61

for.body44:                                       ; preds = %for.cond42
  %36 = load i32* %k, align 4
  %idxprom45 = sext i32 %36 to i64
  %37 = load i32* %i, align 4
  %idxprom46 = sext i32 %37 to i64
  %38 = load [1024 x double]** %tmp.addr, align 8
  %arrayidx47 = getelementptr inbounds [1024 x double]* %38, i64 %idxprom46
  %arrayidx48 = getelementptr inbounds [1024 x double]* %arrayidx47, i32 0, i64 %idxprom45
  %39 = load double* %arrayidx48, align 8
  %40 = load i32* %j, align 4
  %idxprom49 = sext i32 %40 to i64
  %41 = load i32* %k, align 4
  %idxprom50 = sext i32 %41 to i64
  %42 = load [1024 x double]** %C.addr, align 8
  %arrayidx51 = getelementptr inbounds [1024 x double]* %42, i64 %idxprom50
  %arrayidx52 = getelementptr inbounds [1024 x double]* %arrayidx51, i32 0, i64 %idxprom49
  %43 = load double* %arrayidx52, align 8
  %mul53 = fmul double %39, %43
  %44 = load i32* %j, align 4
  %idxprom54 = sext i32 %44 to i64
  %45 = load i32* %i, align 4
  %idxprom55 = sext i32 %45 to i64
  %46 = load [1024 x double]** %D.addr, align 8
  %arrayidx56 = getelementptr inbounds [1024 x double]* %46, i64 %idxprom55
  %arrayidx57 = getelementptr inbounds [1024 x double]* %arrayidx56, i32 0, i64 %idxprom54
  %47 = load double* %arrayidx57, align 8
  %add58 = fadd double %47, %mul53
  store double %add58, double* %arrayidx57, align 8
  br label %for.inc59

for.inc59:                                        ; preds = %for.body44
  %48 = load i32* %k, align 4
  %inc60 = add nsw i32 %48, 1
  store i32 %inc60, i32* %k, align 4
  br label %for.cond42

for.end61:                                        ; preds = %for.cond42
  br label %for.inc62

for.inc62:                                        ; preds = %for.end61
  %49 = load i32* %j, align 4
  %inc63 = add nsw i32 %49, 1
  store i32 %inc63, i32* %j, align 4
  br label %for.cond34

for.end64:                                        ; preds = %for.cond34
  br label %for.inc65

for.inc65:                                        ; preds = %for.end64
  %50 = load i32* %i, align 4
  %inc66 = add nsw i32 %50, 1
  store i32 %inc66, i32* %i, align 4
  br label %for.cond31

for.end67:                                        ; preds = %for.cond31
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @print_array(i32 %ni, i32 %nl, [1024 x double]* %D) #0 {
entry:
  %ni.addr = alloca i32, align 4
  %nl.addr = alloca i32, align 4
  %D.addr = alloca [1024 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %ni, i32* %ni.addr, align 4
  store i32 %nl, i32* %nl.addr, align 4
  store [1024 x double]* %D, [1024 x double]** %D.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc8, %entry
  %0 = load i32* %i, align 4
  %1 = load i32* %ni.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end10

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32* %j, align 4
  %3 = load i32* %nl.addr, align 4
  %cmp2 = icmp slt i32 %2, %3
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %4 = load %struct._IO_FILE** @stderr, align 8
  %5 = load i32* %j, align 4
  %idxprom = sext i32 %5 to i64
  %6 = load i32* %i, align 4
  %idxprom4 = sext i32 %6 to i64
  %7 = load [1024 x double]** %D.addr, align 8
  %arrayidx = getelementptr inbounds [1024 x double]* %7, i64 %idxprom4
  %arrayidx5 = getelementptr inbounds [1024 x double]* %arrayidx, i32 0, i64 %idxprom
  %8 = load double* %arrayidx5, align 8
  call void (i32, ...)* @start_measures(i32 6)
  %call = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([8 x i8]* @.str1, i32 0, i32 0), double %8)
  call void (...)* @get_results()
  %9 = load i32* %i, align 4
  %10 = load i32* %ni.addr, align 4
  %mul = mul nsw i32 %9, %10
  %11 = load i32* %j, align 4
  %add = add nsw i32 %mul, %11
  %rem = srem i32 %add, 20
  %cmp6 = icmp eq i32 %rem, 0
  br i1 %cmp6, label %if.then, label %if.end

if.then:                                          ; preds = %for.body3
  %12 = load %struct._IO_FILE** @stderr, align 8
  call void (i32, ...)* @start_measures(i32 7)
  %call7 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0))
  call void (...)* @get_results()
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body3
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %13 = load i32* %j, align 4
  %inc = add nsw i32 %13, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc8

for.inc8:                                         ; preds = %for.end
  %14 = load i32* %i, align 4
  %inc9 = add nsw i32 %14, 1
  store i32 %inc9, i32* %i, align 4
  br label %for.cond

for.end10:                                        ; preds = %for.cond
  %15 = load %struct._IO_FILE** @stderr, align 8
  call void (i32, ...)* @start_measures(i32 8)
  %call11 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0))
  call void (...)* @get_results()
  ret void
}

; Function Attrs: nounwind uwtable
define void @polybench_flush_cache() #0 {
entry:
  %cs = alloca i32, align 4
  %flush = alloca double*, align 8
  %i = alloca i32, align 4
  %tmp = alloca double, align 8
  store i32 4194560, i32* %cs, align 4
  %0 = load i32* %cs, align 4
  %conv = sext i32 %0 to i64
  call void (i32, ...)* @start_measures(i32 9)
  %call = call noalias i8* @calloc(i64 %conv, i64 8) #7
  call void (...)* @get_results()
  %1 = bitcast i8* %call to double*
  store double* %1, double** %flush, align 8
  store double 0.000000e+00, double* %tmp, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32* %i, align 4
  %3 = load i32* %cs, align 4
  %cmp = icmp slt i32 %2, %3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load i32* %i, align 4
  %idxprom = sext i32 %4 to i64
  %5 = load double** %flush, align 8
  %arrayidx = getelementptr inbounds double* %5, i64 %idxprom
  %6 = load double* %arrayidx, align 8
  %7 = load double* %tmp, align 8
  %add = fadd double %7, %6
  store double %add, double* %tmp, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %8 = load i32* %i, align 4
  %inc = add nsw i32 %8, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %9 = load double* %tmp, align 8
  %cmp2 = fcmp ole double %9, 1.000000e+01
  br i1 %cmp2, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.end
  br label %cond.end

cond.false:                                       ; preds = %for.end
  call void (i32, ...)* @start_measures(i32 10)
  call void @__assert_fail(i8* getelementptr inbounds ([12 x i8]* @.str3, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8]* @.str14, i32 0, i32 0), i32 97, i8* getelementptr inbounds ([29 x i8]* @__PRETTY_FUNCTION__.polybench_flush_cache, i32 0, i32 0)) #8
  call void (...)* @get_results()
  unreachable
                                                  ; No predecessors!
  br label %cond.end

cond.end:                                         ; preds = %10, %cond.true
  %11 = load double** %flush, align 8
  %12 = bitcast double* %11 to i8*
  call void (i32, ...)* @start_measures(i32 11)
  call void @free(i8* %12) #7
  call void (...)* @get_results()
  ret void
}

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #2

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #4

; Function Attrs: nounwind uwtable
define void @polybench_prepare_instruments() #0 {
entry:
  call void @polybench_flush_cache()
  ret void
}

; Function Attrs: nounwind uwtable
define void @polybench_timer_start() #0 {
entry:
  call void @polybench_prepare_instruments()
  %call = call double @rtclock()
  store double %call, double* @polybench_t_start, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define void @polybench_timer_stop() #0 {
entry:
  %call = call double @rtclock()
  store double %call, double* @polybench_t_end, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define void @polybench_timer_print() #0 {
entry:
  %0 = load double* @polybench_t_end, align 8
  %1 = load double* @polybench_t_start, align 8
  %sub = fsub double %0, %1
  call void (i32, ...)* @start_measures(i32 12)
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str25, i32 0, i32 0), double %sub)
  call void (...)* @get_results()
  ret void
}

declare i32 @printf(i8*, ...) #3

; Function Attrs: nounwind uwtable
define i8* @polybench_alloc_data(i32 %n, i32 %elt_size) #0 {
entry:
  %n.addr = alloca i32, align 4
  %elt_size.addr = alloca i32, align 4
  %ret = alloca i8*, align 8
  store i32 %n, i32* %n.addr, align 4
  store i32 %elt_size, i32* %elt_size.addr, align 4
  %0 = load i32* %n.addr, align 4
  %1 = load i32* %elt_size.addr, align 4
  %mul = mul nsw i32 %0, %1
  %conv = sext i32 %mul to i64
  %call = call i8* @xmalloc(i64 %conv)
  store i8* %call, i8** %ret, align 8
  %2 = load i8** %ret, align 8
  ret i8* %2
}

; Function Attrs: nounwind
declare i32 @posix_memalign(i8**, i64, i64) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #4

; Function Attrs: nounwind uwtable
define internal double @rtclock() #0 {
entry:
  ret double 0.000000e+00
}

; Function Attrs: nounwind uwtable
define internal i8* @xmalloc(i64 %num) #0 {
entry:
  %num.addr = alloca i64, align 8
  %new = alloca i8*, align 8
  %ret = alloca i32, align 4
  store i64 %num, i64* %num.addr, align 8
  store i8* null, i8** %new, align 8
  %0 = load i64* %num.addr, align 8
  call void (i32, ...)* @start_measures(i32 13)
  %call = call i32 @posix_memalign(i8** %new, i64 32, i64 %0) #7
  call void (...)* @get_results()
  store i32 %call, i32* %ret, align 4
  %1 = load i8** %new, align 8
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32* %ret, align 4
  %tobool1 = icmp ne i32 %2, 0
  br i1 %tobool1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  %3 = load %struct._IO_FILE** @stderr, align 8
  call void (i32, ...)* @start_measures(i32 14)
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([51 x i8]* @.str36, i32 0, i32 0))
  call void (...)* @get_results()
  call void (i32, ...)* @start_measures(i32 15)
  call void @exit(i32 1) #8
  call void (...)* @get_results()
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  %4 = load i8** %new, align 8
  ret i8* %4
}

declare void @PAPI_shutdown() #5

declare void @start_measures(i32, ...) #5

declare void @get_results(...) #5

declare i32 @init_PAPI(i32, ...) #5

declare i32 @print_results(...) #5

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="8" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readonly }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.ident = !{!0, !0}
!llvm.module.flags = !{!1, !2}

!0 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang 64b6333290f9b7df5a25d4fba34611de3078a792) (llvm/ 0e9a38ba60be659d570af893e05c75b9f6cfe35d)"}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 2}
