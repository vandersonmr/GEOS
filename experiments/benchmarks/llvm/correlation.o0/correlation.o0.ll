; ModuleID = 'correlation.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*
@.str1 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %n = alloca i32, align 4
  %m = alloca i32, align 4
  %float_n = alloca double, align 8
  %data = alloca [1000 x [1000 x double]]*, align 8
  %symmat = alloca [1000 x [1000 x double]]*, align 8
  %mean = alloca [1000 x double]*, align 8
  %stddev = alloca [1000 x double]*, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !35, metadata !36), !dbg !37
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !38, metadata !36), !dbg !39
  call void @llvm.dbg.declare(metadata i32* %n, metadata !40, metadata !36), !dbg !41
  store i32 1000, i32* %n, align 4, !dbg !41
  call void @llvm.dbg.declare(metadata i32* %m, metadata !42, metadata !36), !dbg !43
  store i32 1000, i32* %m, align 4, !dbg !43
  call void @llvm.dbg.declare(metadata double* %float_n, metadata !44, metadata !36), !dbg !45
  call void @llvm.dbg.declare(metadata [1000 x [1000 x double]]** %data, metadata !46, metadata !36), !dbg !47
  %call = call i8* @polybench_alloc_data(i32 1000000, i32 8), !dbg !47
  %0 = bitcast i8* %call to [1000 x [1000 x double]]*, !dbg !47
  store [1000 x [1000 x double]]* %0, [1000 x [1000 x double]]** %data, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata [1000 x [1000 x double]]** %symmat, metadata !48, metadata !36), !dbg !49
  %call1 = call i8* @polybench_alloc_data(i32 1000000, i32 8), !dbg !49
  %1 = bitcast i8* %call1 to [1000 x [1000 x double]]*, !dbg !49
  store [1000 x [1000 x double]]* %1, [1000 x [1000 x double]]** %symmat, align 8, !dbg !49
  call void @llvm.dbg.declare(metadata [1000 x double]** %mean, metadata !50, metadata !36), !dbg !51
  %call2 = call i8* @polybench_alloc_data(i32 1000, i32 8), !dbg !51
  %2 = bitcast i8* %call2 to [1000 x double]*, !dbg !51
  store [1000 x double]* %2, [1000 x double]** %mean, align 8, !dbg !51
  call void @llvm.dbg.declare(metadata [1000 x double]** %stddev, metadata !52, metadata !36), !dbg !53
  %call3 = call i8* @polybench_alloc_data(i32 1000, i32 8), !dbg !53
  %3 = bitcast i8* %call3 to [1000 x double]*, !dbg !53
  store [1000 x double]* %3, [1000 x double]** %stddev, align 8, !dbg !53
  %4 = load i32* %m, align 4, !dbg !54
  %5 = load i32* %n, align 4, !dbg !55
  %6 = load [1000 x [1000 x double]]** %data, align 8, !dbg !56
  %arraydecay = getelementptr inbounds [1000 x [1000 x double]]* %6, i32 0, i32 0, !dbg !56
  call void @init_array(i32 %4, i32 %5, double* %float_n, [1000 x double]* %arraydecay), !dbg !57
  %7 = load i32* %m, align 4, !dbg !58
  %8 = load i32* %n, align 4, !dbg !59
  %9 = load double* %float_n, align 8, !dbg !60
  %10 = load [1000 x [1000 x double]]** %data, align 8, !dbg !61
  %arraydecay4 = getelementptr inbounds [1000 x [1000 x double]]* %10, i32 0, i32 0, !dbg !61
  %11 = load [1000 x [1000 x double]]** %symmat, align 8, !dbg !62
  %arraydecay5 = getelementptr inbounds [1000 x [1000 x double]]* %11, i32 0, i32 0, !dbg !62
  %12 = load [1000 x double]** %mean, align 8, !dbg !63
  %arraydecay6 = getelementptr inbounds [1000 x double]* %12, i32 0, i32 0, !dbg !63
  %13 = load [1000 x double]** %stddev, align 8, !dbg !64
  %arraydecay7 = getelementptr inbounds [1000 x double]* %13, i32 0, i32 0, !dbg !64
  call void @kernel_correlation(i32 %7, i32 %8, double %9, [1000 x double]* %arraydecay4, [1000 x double]* %arraydecay5, double* %arraydecay6, double* %arraydecay7), !dbg !65
  %14 = load i32* %argc.addr, align 4, !dbg !66
  %cmp = icmp sgt i32 %14, 42, !dbg !66
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !68

land.lhs.true:                                    ; preds = %entry
  %15 = load i8*** %argv.addr, align 8, !dbg !69
  %arrayidx = getelementptr inbounds i8** %15, i64 0, !dbg !69
  %16 = load i8** %arrayidx, align 8, !dbg !69
  %call8 = call i32 @strcmp(i8* %16, i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0)) #5, !dbg !69
  %tobool = icmp ne i32 %call8, 0, !dbg !68
  br i1 %tobool, label %if.end, label %if.then, !dbg !68

if.then:                                          ; preds = %land.lhs.true
  %17 = load i32* %m, align 4, !dbg !71
  %18 = load [1000 x [1000 x double]]** %symmat, align 8, !dbg !71
  %arraydecay9 = getelementptr inbounds [1000 x [1000 x double]]* %18, i32 0, i32 0, !dbg !71
  call void @print_array(i32 %17, [1000 x double]* %arraydecay9), !dbg !71
  br label %if.end, !dbg !71

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %19 = load [1000 x [1000 x double]]** %data, align 8, !dbg !73
  %20 = bitcast [1000 x [1000 x double]]* %19 to i8*, !dbg !73
  call void @free(i8* %20) #6, !dbg !73
  %21 = load [1000 x [1000 x double]]** %symmat, align 8, !dbg !74
  %22 = bitcast [1000 x [1000 x double]]* %21 to i8*, !dbg !74
  call void @free(i8* %22) #6, !dbg !74
  %23 = load [1000 x double]** %mean, align 8, !dbg !75
  %24 = bitcast [1000 x double]* %23 to i8*, !dbg !75
  call void @free(i8* %24) #6, !dbg !75
  %25 = load [1000 x double]** %stddev, align 8, !dbg !76
  %26 = bitcast [1000 x double]* %25 to i8*, !dbg !76
  call void @free(i8* %26) #6, !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i8* @polybench_alloc_data(i32, i32) #2

; Function Attrs: nounwind uwtable
define internal void @init_array(i32 %m, i32 %n, double* %float_n, [1000 x double]* %data) #0 {
entry:
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %float_n.addr = alloca double*, align 8
  %data.addr = alloca [1000 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %m, i32* %m.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %m.addr, metadata !78, metadata !36), !dbg !79
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !80, metadata !36), !dbg !81
  store double* %float_n, double** %float_n.addr, align 8
  call void @llvm.dbg.declare(metadata double** %float_n.addr, metadata !82, metadata !36), !dbg !83
  store [1000 x double]* %data, [1000 x double]** %data.addr, align 8
  call void @llvm.dbg.declare(metadata [1000 x double]** %data.addr, metadata !84, metadata !36), !dbg !85
  call void @llvm.dbg.declare(metadata i32* %i, metadata !86, metadata !36), !dbg !87
  call void @llvm.dbg.declare(metadata i32* %j, metadata !88, metadata !36), !dbg !89
  %0 = load double** %float_n.addr, align 8, !dbg !90
  store double 1.200000e+00, double* %0, align 8, !dbg !91
  store i32 0, i32* %i, align 4, !dbg !92
  br label %for.cond, !dbg !92

for.cond:                                         ; preds = %for.inc7, %entry
  %1 = load i32* %i, align 4, !dbg !94
  %2 = load i32* %m.addr, align 4, !dbg !98
  %cmp = icmp slt i32 %1, %2, !dbg !99
  br i1 %cmp, label %for.body, label %for.end9, !dbg !100

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !101
  br label %for.cond1, !dbg !101

for.cond1:                                        ; preds = %for.inc, %for.body
  %3 = load i32* %j, align 4, !dbg !103
  %4 = load i32* %n.addr, align 4, !dbg !107
  %cmp2 = icmp slt i32 %3, %4, !dbg !108
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !109

for.body3:                                        ; preds = %for.cond1
  %5 = load i32* %i, align 4, !dbg !110
  %conv = sitofp i32 %5 to double, !dbg !111
  %6 = load i32* %j, align 4, !dbg !112
  %conv4 = sitofp i32 %6 to double, !dbg !112
  %mul = fmul double %conv, %conv4, !dbg !111
  %div = fdiv double %mul, 1.000000e+03, !dbg !113
  %7 = load i32* %j, align 4, !dbg !114
  %idxprom = sext i32 %7 to i64, !dbg !115
  %8 = load i32* %i, align 4, !dbg !116
  %idxprom5 = sext i32 %8 to i64, !dbg !115
  %9 = load [1000 x double]** %data.addr, align 8, !dbg !115
  %arrayidx = getelementptr inbounds [1000 x double]* %9, i64 %idxprom5, !dbg !115
  %arrayidx6 = getelementptr inbounds [1000 x double]* %arrayidx, i32 0, i64 %idxprom, !dbg !115
  store double %div, double* %arrayidx6, align 8, !dbg !115
  br label %for.inc, !dbg !115

for.inc:                                          ; preds = %for.body3
  %10 = load i32* %j, align 4, !dbg !117
  %inc = add nsw i32 %10, 1, !dbg !117
  store i32 %inc, i32* %j, align 4, !dbg !117
  br label %for.cond1, !dbg !118

for.end:                                          ; preds = %for.cond1
  br label %for.inc7, !dbg !119

for.inc7:                                         ; preds = %for.end
  %11 = load i32* %i, align 4, !dbg !120
  %inc8 = add nsw i32 %11, 1, !dbg !120
  store i32 %inc8, i32* %i, align 4, !dbg !120
  br label %for.cond, !dbg !121

for.end9:                                         ; preds = %for.cond
  ret void, !dbg !122
}

; Function Attrs: nounwind uwtable
define internal void @kernel_correlation(i32 %m, i32 %n, double %float_n, [1000 x double]* %data, [1000 x double]* %symmat, double* %mean, double* %stddev) #0 {
entry:
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %float_n.addr = alloca double, align 8
  %data.addr = alloca [1000 x double]*, align 8
  %symmat.addr = alloca [1000 x double]*, align 8
  %mean.addr = alloca double*, align 8
  %stddev.addr = alloca double*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %j1 = alloca i32, align 4
  %j2 = alloca i32, align 4
  %eps = alloca double, align 8
  store i32 %m, i32* %m.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %m.addr, metadata !123, metadata !36), !dbg !124
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !125, metadata !36), !dbg !126
  store double %float_n, double* %float_n.addr, align 8
  call void @llvm.dbg.declare(metadata double* %float_n.addr, metadata !127, metadata !36), !dbg !128
  store [1000 x double]* %data, [1000 x double]** %data.addr, align 8
  call void @llvm.dbg.declare(metadata [1000 x double]** %data.addr, metadata !129, metadata !36), !dbg !130
  store [1000 x double]* %symmat, [1000 x double]** %symmat.addr, align 8
  call void @llvm.dbg.declare(metadata [1000 x double]** %symmat.addr, metadata !131, metadata !36), !dbg !132
  store double* %mean, double** %mean.addr, align 8
  call void @llvm.dbg.declare(metadata double** %mean.addr, metadata !133, metadata !36), !dbg !134
  store double* %stddev, double** %stddev.addr, align 8
  call void @llvm.dbg.declare(metadata double** %stddev.addr, metadata !135, metadata !36), !dbg !136
  call void @llvm.dbg.declare(metadata i32* %i, metadata !137, metadata !36), !dbg !138
  call void @llvm.dbg.declare(metadata i32* %j, metadata !139, metadata !36), !dbg !140
  call void @llvm.dbg.declare(metadata i32* %j1, metadata !141, metadata !36), !dbg !142
  call void @llvm.dbg.declare(metadata i32* %j2, metadata !143, metadata !36), !dbg !144
  call void @llvm.dbg.declare(metadata double* %eps, metadata !145, metadata !36), !dbg !146
  store double 0x3FB99999A0000000, double* %eps, align 8, !dbg !146
  store i32 0, i32* %j, align 4, !dbg !147
  br label %for.cond, !dbg !147

for.cond:                                         ; preds = %for.inc12, %entry
  %0 = load i32* %j, align 4, !dbg !149
  %1 = load i32* %m.addr, align 4, !dbg !153
  %cmp = icmp slt i32 %0, %1, !dbg !154
  br i1 %cmp, label %for.body, label %for.end14, !dbg !155

for.body:                                         ; preds = %for.cond
  %2 = load i32* %j, align 4, !dbg !156
  %idxprom = sext i32 %2 to i64, !dbg !158
  %3 = load double** %mean.addr, align 8, !dbg !158
  %arrayidx = getelementptr inbounds double* %3, i64 %idxprom, !dbg !158
  store double 0.000000e+00, double* %arrayidx, align 8, !dbg !158
  store i32 0, i32* %i, align 4, !dbg !159
  br label %for.cond1, !dbg !159

for.cond1:                                        ; preds = %for.inc, %for.body
  %4 = load i32* %i, align 4, !dbg !161
  %5 = load i32* %n.addr, align 4, !dbg !165
  %cmp2 = icmp slt i32 %4, %5, !dbg !166
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !167

for.body3:                                        ; preds = %for.cond1
  %6 = load i32* %j, align 4, !dbg !168
  %idxprom4 = sext i32 %6 to i64, !dbg !169
  %7 = load i32* %i, align 4, !dbg !170
  %idxprom5 = sext i32 %7 to i64, !dbg !169
  %8 = load [1000 x double]** %data.addr, align 8, !dbg !169
  %arrayidx6 = getelementptr inbounds [1000 x double]* %8, i64 %idxprom5, !dbg !169
  %arrayidx7 = getelementptr inbounds [1000 x double]* %arrayidx6, i32 0, i64 %idxprom4, !dbg !169
  %9 = load double* %arrayidx7, align 8, !dbg !169
  %10 = load i32* %j, align 4, !dbg !171
  %idxprom8 = sext i32 %10 to i64, !dbg !172
  %11 = load double** %mean.addr, align 8, !dbg !172
  %arrayidx9 = getelementptr inbounds double* %11, i64 %idxprom8, !dbg !172
  %12 = load double* %arrayidx9, align 8, !dbg !172
  %add = fadd double %12, %9, !dbg !172
  store double %add, double* %arrayidx9, align 8, !dbg !172
  br label %for.inc, !dbg !172

for.inc:                                          ; preds = %for.body3
  %13 = load i32* %i, align 4, !dbg !173
  %inc = add nsw i32 %13, 1, !dbg !173
  store i32 %inc, i32* %i, align 4, !dbg !173
  br label %for.cond1, !dbg !174

for.end:                                          ; preds = %for.cond1
  %14 = load double* %float_n.addr, align 8, !dbg !175
  %15 = load i32* %j, align 4, !dbg !176
  %idxprom10 = sext i32 %15 to i64, !dbg !177
  %16 = load double** %mean.addr, align 8, !dbg !177
  %arrayidx11 = getelementptr inbounds double* %16, i64 %idxprom10, !dbg !177
  %17 = load double* %arrayidx11, align 8, !dbg !177
  %div = fdiv double %17, %14, !dbg !177
  store double %div, double* %arrayidx11, align 8, !dbg !177
  br label %for.inc12, !dbg !178

for.inc12:                                        ; preds = %for.end
  %18 = load i32* %j, align 4, !dbg !179
  %inc13 = add nsw i32 %18, 1, !dbg !179
  store i32 %inc13, i32* %j, align 4, !dbg !179
  br label %for.cond, !dbg !180

for.end14:                                        ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !181
  br label %for.cond15, !dbg !181

for.cond15:                                       ; preds = %for.inc56, %for.end14
  %19 = load i32* %j, align 4, !dbg !183
  %20 = load i32* %m.addr, align 4, !dbg !187
  %cmp16 = icmp slt i32 %19, %20, !dbg !188
  br i1 %cmp16, label %for.body17, label %for.end58, !dbg !189

for.body17:                                       ; preds = %for.cond15
  %21 = load i32* %j, align 4, !dbg !190
  %idxprom18 = sext i32 %21 to i64, !dbg !192
  %22 = load double** %stddev.addr, align 8, !dbg !192
  %arrayidx19 = getelementptr inbounds double* %22, i64 %idxprom18, !dbg !192
  store double 0.000000e+00, double* %arrayidx19, align 8, !dbg !192
  store i32 0, i32* %i, align 4, !dbg !193
  br label %for.cond20, !dbg !193

for.cond20:                                       ; preds = %for.inc39, %for.body17
  %23 = load i32* %i, align 4, !dbg !195
  %24 = load i32* %n.addr, align 4, !dbg !199
  %cmp21 = icmp slt i32 %23, %24, !dbg !200
  br i1 %cmp21, label %for.body22, label %for.end41, !dbg !201

for.body22:                                       ; preds = %for.cond20
  %25 = load i32* %j, align 4, !dbg !202
  %idxprom23 = sext i32 %25 to i64, !dbg !203
  %26 = load i32* %i, align 4, !dbg !204
  %idxprom24 = sext i32 %26 to i64, !dbg !203
  %27 = load [1000 x double]** %data.addr, align 8, !dbg !203
  %arrayidx25 = getelementptr inbounds [1000 x double]* %27, i64 %idxprom24, !dbg !203
  %arrayidx26 = getelementptr inbounds [1000 x double]* %arrayidx25, i32 0, i64 %idxprom23, !dbg !203
  %28 = load double* %arrayidx26, align 8, !dbg !203
  %29 = load i32* %j, align 4, !dbg !205
  %idxprom27 = sext i32 %29 to i64, !dbg !206
  %30 = load double** %mean.addr, align 8, !dbg !206
  %arrayidx28 = getelementptr inbounds double* %30, i64 %idxprom27, !dbg !206
  %31 = load double* %arrayidx28, align 8, !dbg !206
  %sub = fsub double %28, %31, !dbg !203
  %32 = load i32* %j, align 4, !dbg !207
  %idxprom29 = sext i32 %32 to i64, !dbg !208
  %33 = load i32* %i, align 4, !dbg !209
  %idxprom30 = sext i32 %33 to i64, !dbg !208
  %34 = load [1000 x double]** %data.addr, align 8, !dbg !208
  %arrayidx31 = getelementptr inbounds [1000 x double]* %34, i64 %idxprom30, !dbg !208
  %arrayidx32 = getelementptr inbounds [1000 x double]* %arrayidx31, i32 0, i64 %idxprom29, !dbg !208
  %35 = load double* %arrayidx32, align 8, !dbg !208
  %36 = load i32* %j, align 4, !dbg !210
  %idxprom33 = sext i32 %36 to i64, !dbg !211
  %37 = load double** %mean.addr, align 8, !dbg !211
  %arrayidx34 = getelementptr inbounds double* %37, i64 %idxprom33, !dbg !211
  %38 = load double* %arrayidx34, align 8, !dbg !211
  %sub35 = fsub double %35, %38, !dbg !208
  %mul = fmul double %sub, %sub35, !dbg !212
  %39 = load i32* %j, align 4, !dbg !213
  %idxprom36 = sext i32 %39 to i64, !dbg !214
  %40 = load double** %stddev.addr, align 8, !dbg !214
  %arrayidx37 = getelementptr inbounds double* %40, i64 %idxprom36, !dbg !214
  %41 = load double* %arrayidx37, align 8, !dbg !214
  %add38 = fadd double %41, %mul, !dbg !214
  store double %add38, double* %arrayidx37, align 8, !dbg !214
  br label %for.inc39, !dbg !214

for.inc39:                                        ; preds = %for.body22
  %42 = load i32* %i, align 4, !dbg !215
  %inc40 = add nsw i32 %42, 1, !dbg !215
  store i32 %inc40, i32* %i, align 4, !dbg !215
  br label %for.cond20, !dbg !216

for.end41:                                        ; preds = %for.cond20
  %43 = load double* %float_n.addr, align 8, !dbg !217
  %44 = load i32* %j, align 4, !dbg !218
  %idxprom42 = sext i32 %44 to i64, !dbg !219
  %45 = load double** %stddev.addr, align 8, !dbg !219
  %arrayidx43 = getelementptr inbounds double* %45, i64 %idxprom42, !dbg !219
  %46 = load double* %arrayidx43, align 8, !dbg !219
  %div44 = fdiv double %46, %43, !dbg !219
  store double %div44, double* %arrayidx43, align 8, !dbg !219
  %47 = load i32* %j, align 4, !dbg !220
  %idxprom45 = sext i32 %47 to i64, !dbg !220
  %48 = load double** %stddev.addr, align 8, !dbg !220
  %arrayidx46 = getelementptr inbounds double* %48, i64 %idxprom45, !dbg !220
  %49 = load double* %arrayidx46, align 8, !dbg !220
  %call = call double @sqrt(double %49) #6, !dbg !220
  %50 = load i32* %j, align 4, !dbg !221
  %idxprom47 = sext i32 %50 to i64, !dbg !222
  %51 = load double** %stddev.addr, align 8, !dbg !222
  %arrayidx48 = getelementptr inbounds double* %51, i64 %idxprom47, !dbg !222
  store double %call, double* %arrayidx48, align 8, !dbg !222
  %52 = load i32* %j, align 4, !dbg !223
  %idxprom49 = sext i32 %52 to i64, !dbg !224
  %53 = load double** %stddev.addr, align 8, !dbg !224
  %arrayidx50 = getelementptr inbounds double* %53, i64 %idxprom49, !dbg !224
  %54 = load double* %arrayidx50, align 8, !dbg !224
  %55 = load double* %eps, align 8, !dbg !225
  %cmp51 = fcmp ole double %54, %55, !dbg !224
  br i1 %cmp51, label %cond.true, label %cond.false, !dbg !224

cond.true:                                        ; preds = %for.end41
  br label %cond.end, !dbg !226

cond.false:                                       ; preds = %for.end41
  %56 = load i32* %j, align 4, !dbg !228
  %idxprom52 = sext i32 %56 to i64, !dbg !230
  %57 = load double** %stddev.addr, align 8, !dbg !230
  %arrayidx53 = getelementptr inbounds double* %57, i64 %idxprom52, !dbg !230
  %58 = load double* %arrayidx53, align 8, !dbg !230
  br label %cond.end, !dbg !224

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi double [ 1.000000e+00, %cond.true ], [ %58, %cond.false ], !dbg !224
  %59 = load i32* %j, align 4, !dbg !231
  %idxprom54 = sext i32 %59 to i64, !dbg !234
  %60 = load double** %stddev.addr, align 8, !dbg !234
  %arrayidx55 = getelementptr inbounds double* %60, i64 %idxprom54, !dbg !234
  store double %cond, double* %arrayidx55, align 8, !dbg !234
  br label %for.inc56, !dbg !235

for.inc56:                                        ; preds = %cond.end
  %61 = load i32* %j, align 4, !dbg !236
  %inc57 = add nsw i32 %61, 1, !dbg !236
  store i32 %inc57, i32* %j, align 4, !dbg !236
  br label %for.cond15, !dbg !237

for.end58:                                        ; preds = %for.cond15
  store i32 0, i32* %i, align 4, !dbg !238
  br label %for.cond59, !dbg !238

for.cond59:                                       ; preds = %for.inc84, %for.end58
  %62 = load i32* %i, align 4, !dbg !240
  %63 = load i32* %n.addr, align 4, !dbg !244
  %cmp60 = icmp slt i32 %62, %63, !dbg !245
  br i1 %cmp60, label %for.body61, label %for.end86, !dbg !246

for.body61:                                       ; preds = %for.cond59
  store i32 0, i32* %j, align 4, !dbg !247
  br label %for.cond62, !dbg !247

for.cond62:                                       ; preds = %for.inc81, %for.body61
  %64 = load i32* %j, align 4, !dbg !249
  %65 = load i32* %m.addr, align 4, !dbg !253
  %cmp63 = icmp slt i32 %64, %65, !dbg !254
  br i1 %cmp63, label %for.body64, label %for.end83, !dbg !255

for.body64:                                       ; preds = %for.cond62
  %66 = load i32* %j, align 4, !dbg !256
  %idxprom65 = sext i32 %66 to i64, !dbg !258
  %67 = load double** %mean.addr, align 8, !dbg !258
  %arrayidx66 = getelementptr inbounds double* %67, i64 %idxprom65, !dbg !258
  %68 = load double* %arrayidx66, align 8, !dbg !258
  %69 = load i32* %j, align 4, !dbg !259
  %idxprom67 = sext i32 %69 to i64, !dbg !260
  %70 = load i32* %i, align 4, !dbg !261
  %idxprom68 = sext i32 %70 to i64, !dbg !260
  %71 = load [1000 x double]** %data.addr, align 8, !dbg !260
  %arrayidx69 = getelementptr inbounds [1000 x double]* %71, i64 %idxprom68, !dbg !260
  %arrayidx70 = getelementptr inbounds [1000 x double]* %arrayidx69, i32 0, i64 %idxprom67, !dbg !260
  %72 = load double* %arrayidx70, align 8, !dbg !260
  %sub71 = fsub double %72, %68, !dbg !260
  store double %sub71, double* %arrayidx70, align 8, !dbg !260
  %73 = load double* %float_n.addr, align 8, !dbg !262
  %call72 = call double @sqrt(double %73) #6, !dbg !263
  %74 = load i32* %j, align 4, !dbg !264
  %idxprom73 = sext i32 %74 to i64, !dbg !265
  %75 = load double** %stddev.addr, align 8, !dbg !265
  %arrayidx74 = getelementptr inbounds double* %75, i64 %idxprom73, !dbg !265
  %76 = load double* %arrayidx74, align 8, !dbg !265
  %mul75 = fmul double %call72, %76, !dbg !263
  %77 = load i32* %j, align 4, !dbg !266
  %idxprom76 = sext i32 %77 to i64, !dbg !267
  %78 = load i32* %i, align 4, !dbg !268
  %idxprom77 = sext i32 %78 to i64, !dbg !267
  %79 = load [1000 x double]** %data.addr, align 8, !dbg !267
  %arrayidx78 = getelementptr inbounds [1000 x double]* %79, i64 %idxprom77, !dbg !267
  %arrayidx79 = getelementptr inbounds [1000 x double]* %arrayidx78, i32 0, i64 %idxprom76, !dbg !267
  %80 = load double* %arrayidx79, align 8, !dbg !267
  %div80 = fdiv double %80, %mul75, !dbg !267
  store double %div80, double* %arrayidx79, align 8, !dbg !267
  br label %for.inc81, !dbg !269

for.inc81:                                        ; preds = %for.body64
  %81 = load i32* %j, align 4, !dbg !270
  %inc82 = add nsw i32 %81, 1, !dbg !270
  store i32 %inc82, i32* %j, align 4, !dbg !270
  br label %for.cond62, !dbg !271

for.end83:                                        ; preds = %for.cond62
  br label %for.inc84, !dbg !272

for.inc84:                                        ; preds = %for.end83
  %82 = load i32* %i, align 4, !dbg !273
  %inc85 = add nsw i32 %82, 1, !dbg !273
  store i32 %inc85, i32* %i, align 4, !dbg !273
  br label %for.cond59, !dbg !274

for.end86:                                        ; preds = %for.cond59
  store i32 0, i32* %j1, align 4, !dbg !275
  br label %for.cond87, !dbg !275

for.cond87:                                       ; preds = %for.inc134, %for.end86
  %83 = load i32* %j1, align 4, !dbg !277
  %84 = load i32* %m.addr, align 4, !dbg !281
  %sub88 = sub nsw i32 %84, 1, !dbg !281
  %cmp89 = icmp slt i32 %83, %sub88, !dbg !282
  br i1 %cmp89, label %for.body90, label %for.end136, !dbg !283

for.body90:                                       ; preds = %for.cond87
  %85 = load i32* %j1, align 4, !dbg !284
  %idxprom91 = sext i32 %85 to i64, !dbg !286
  %86 = load i32* %j1, align 4, !dbg !287
  %idxprom92 = sext i32 %86 to i64, !dbg !286
  %87 = load [1000 x double]** %symmat.addr, align 8, !dbg !286
  %arrayidx93 = getelementptr inbounds [1000 x double]* %87, i64 %idxprom92, !dbg !286
  %arrayidx94 = getelementptr inbounds [1000 x double]* %arrayidx93, i32 0, i64 %idxprom91, !dbg !286
  store double 1.000000e+00, double* %arrayidx94, align 8, !dbg !286
  %88 = load i32* %j1, align 4, !dbg !288
  %add95 = add nsw i32 %88, 1, !dbg !288
  store i32 %add95, i32* %j2, align 4, !dbg !290
  br label %for.cond96, !dbg !290

for.cond96:                                       ; preds = %for.inc131, %for.body90
  %89 = load i32* %j2, align 4, !dbg !291
  %90 = load i32* %m.addr, align 4, !dbg !295
  %cmp97 = icmp slt i32 %89, %90, !dbg !296
  br i1 %cmp97, label %for.body98, label %for.end133, !dbg !297

for.body98:                                       ; preds = %for.cond96
  %91 = load i32* %j2, align 4, !dbg !298
  %idxprom99 = sext i32 %91 to i64, !dbg !300
  %92 = load i32* %j1, align 4, !dbg !301
  %idxprom100 = sext i32 %92 to i64, !dbg !300
  %93 = load [1000 x double]** %symmat.addr, align 8, !dbg !300
  %arrayidx101 = getelementptr inbounds [1000 x double]* %93, i64 %idxprom100, !dbg !300
  %arrayidx102 = getelementptr inbounds [1000 x double]* %arrayidx101, i32 0, i64 %idxprom99, !dbg !300
  store double 0.000000e+00, double* %arrayidx102, align 8, !dbg !300
  store i32 0, i32* %i, align 4, !dbg !302
  br label %for.cond103, !dbg !302

for.cond103:                                      ; preds = %for.inc120, %for.body98
  %94 = load i32* %i, align 4, !dbg !304
  %95 = load i32* %n.addr, align 4, !dbg !308
  %cmp104 = icmp slt i32 %94, %95, !dbg !309
  br i1 %cmp104, label %for.body105, label %for.end122, !dbg !310

for.body105:                                      ; preds = %for.cond103
  %96 = load i32* %j1, align 4, !dbg !311
  %idxprom106 = sext i32 %96 to i64, !dbg !312
  %97 = load i32* %i, align 4, !dbg !313
  %idxprom107 = sext i32 %97 to i64, !dbg !312
  %98 = load [1000 x double]** %data.addr, align 8, !dbg !312
  %arrayidx108 = getelementptr inbounds [1000 x double]* %98, i64 %idxprom107, !dbg !312
  %arrayidx109 = getelementptr inbounds [1000 x double]* %arrayidx108, i32 0, i64 %idxprom106, !dbg !312
  %99 = load double* %arrayidx109, align 8, !dbg !312
  %100 = load i32* %j2, align 4, !dbg !314
  %idxprom110 = sext i32 %100 to i64, !dbg !315
  %101 = load i32* %i, align 4, !dbg !316
  %idxprom111 = sext i32 %101 to i64, !dbg !315
  %102 = load [1000 x double]** %data.addr, align 8, !dbg !315
  %arrayidx112 = getelementptr inbounds [1000 x double]* %102, i64 %idxprom111, !dbg !315
  %arrayidx113 = getelementptr inbounds [1000 x double]* %arrayidx112, i32 0, i64 %idxprom110, !dbg !315
  %103 = load double* %arrayidx113, align 8, !dbg !315
  %mul114 = fmul double %99, %103, !dbg !312
  %104 = load i32* %j2, align 4, !dbg !317
  %idxprom115 = sext i32 %104 to i64, !dbg !318
  %105 = load i32* %j1, align 4, !dbg !319
  %idxprom116 = sext i32 %105 to i64, !dbg !318
  %106 = load [1000 x double]** %symmat.addr, align 8, !dbg !318
  %arrayidx117 = getelementptr inbounds [1000 x double]* %106, i64 %idxprom116, !dbg !318
  %arrayidx118 = getelementptr inbounds [1000 x double]* %arrayidx117, i32 0, i64 %idxprom115, !dbg !318
  %107 = load double* %arrayidx118, align 8, !dbg !318
  %add119 = fadd double %107, %mul114, !dbg !318
  store double %add119, double* %arrayidx118, align 8, !dbg !318
  br label %for.inc120, !dbg !318

for.inc120:                                       ; preds = %for.body105
  %108 = load i32* %i, align 4, !dbg !320
  %inc121 = add nsw i32 %108, 1, !dbg !320
  store i32 %inc121, i32* %i, align 4, !dbg !320
  br label %for.cond103, !dbg !321

for.end122:                                       ; preds = %for.cond103
  %109 = load i32* %j2, align 4, !dbg !322
  %idxprom123 = sext i32 %109 to i64, !dbg !323
  %110 = load i32* %j1, align 4, !dbg !324
  %idxprom124 = sext i32 %110 to i64, !dbg !323
  %111 = load [1000 x double]** %symmat.addr, align 8, !dbg !323
  %arrayidx125 = getelementptr inbounds [1000 x double]* %111, i64 %idxprom124, !dbg !323
  %arrayidx126 = getelementptr inbounds [1000 x double]* %arrayidx125, i32 0, i64 %idxprom123, !dbg !323
  %112 = load double* %arrayidx126, align 8, !dbg !323
  %113 = load i32* %j1, align 4, !dbg !325
  %idxprom127 = sext i32 %113 to i64, !dbg !326
  %114 = load i32* %j2, align 4, !dbg !327
  %idxprom128 = sext i32 %114 to i64, !dbg !326
  %115 = load [1000 x double]** %symmat.addr, align 8, !dbg !326
  %arrayidx129 = getelementptr inbounds [1000 x double]* %115, i64 %idxprom128, !dbg !326
  %arrayidx130 = getelementptr inbounds [1000 x double]* %arrayidx129, i32 0, i64 %idxprom127, !dbg !326
  store double %112, double* %arrayidx130, align 8, !dbg !326
  br label %for.inc131, !dbg !328

for.inc131:                                       ; preds = %for.end122
  %116 = load i32* %j2, align 4, !dbg !329
  %inc132 = add nsw i32 %116, 1, !dbg !329
  store i32 %inc132, i32* %j2, align 4, !dbg !329
  br label %for.cond96, !dbg !330

for.end133:                                       ; preds = %for.cond96
  br label %for.inc134, !dbg !331

for.inc134:                                       ; preds = %for.end133
  %117 = load i32* %j1, align 4, !dbg !332
  %inc135 = add nsw i32 %117, 1, !dbg !332
  store i32 %inc135, i32* %j1, align 4, !dbg !332
  br label %for.cond87, !dbg !333

for.end136:                                       ; preds = %for.cond87
  %118 = load i32* %m.addr, align 4, !dbg !334
  %idxprom137 = sext i32 %118 to i64, !dbg !335
  %119 = load i32* %m.addr, align 4, !dbg !336
  %idxprom138 = sext i32 %119 to i64, !dbg !335
  %120 = load [1000 x double]** %symmat.addr, align 8, !dbg !335
  %arrayidx139 = getelementptr inbounds [1000 x double]* %120, i64 %idxprom138, !dbg !335
  %arrayidx140 = getelementptr inbounds [1000 x double]* %arrayidx139, i32 0, i64 %idxprom137, !dbg !335
  store double 1.000000e+00, double* %arrayidx140, align 8, !dbg !335
  ret void, !dbg !337
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #3

; Function Attrs: nounwind uwtable
define internal void @print_array(i32 %m, [1000 x double]* %symmat) #0 {
entry:
  %m.addr = alloca i32, align 4
  %symmat.addr = alloca [1000 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %m, i32* %m.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %m.addr, metadata !338, metadata !36), !dbg !339
  store [1000 x double]* %symmat, [1000 x double]** %symmat.addr, align 8
  call void @llvm.dbg.declare(metadata [1000 x double]** %symmat.addr, metadata !340, metadata !36), !dbg !341
  call void @llvm.dbg.declare(metadata i32* %i, metadata !342, metadata !36), !dbg !343
  call void @llvm.dbg.declare(metadata i32* %j, metadata !344, metadata !36), !dbg !345
  store i32 0, i32* %i, align 4, !dbg !346
  br label %for.cond, !dbg !346

for.cond:                                         ; preds = %for.inc8, %entry
  %0 = load i32* %i, align 4, !dbg !348
  %1 = load i32* %m.addr, align 4, !dbg !352
  %cmp = icmp slt i32 %0, %1, !dbg !353
  br i1 %cmp, label %for.body, label %for.end10, !dbg !354

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !355
  br label %for.cond1, !dbg !355

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32* %j, align 4, !dbg !357
  %3 = load i32* %m.addr, align 4, !dbg !361
  %cmp2 = icmp slt i32 %2, %3, !dbg !362
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !363

for.body3:                                        ; preds = %for.cond1
  %4 = load %struct._IO_FILE** @stderr, align 8, !dbg !364
  %5 = load i32* %j, align 4, !dbg !366
  %idxprom = sext i32 %5 to i64, !dbg !367
  %6 = load i32* %i, align 4, !dbg !368
  %idxprom4 = sext i32 %6 to i64, !dbg !367
  %7 = load [1000 x double]** %symmat.addr, align 8, !dbg !367
  %arrayidx = getelementptr inbounds [1000 x double]* %7, i64 %idxprom4, !dbg !367
  %arrayidx5 = getelementptr inbounds [1000 x double]* %arrayidx, i32 0, i64 %idxprom, !dbg !367
  %8 = load double* %arrayidx5, align 8, !dbg !367
  %call = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([8 x i8]* @.str1, i32 0, i32 0), double %8), !dbg !369
  %9 = load i32* %i, align 4, !dbg !370
  %10 = load i32* %m.addr, align 4, !dbg !372
  %mul = mul nsw i32 %9, %10, !dbg !370
  %11 = load i32* %j, align 4, !dbg !373
  %add = add nsw i32 %mul, %11, !dbg !370
  %rem = srem i32 %add, 20, !dbg !374
  %cmp6 = icmp eq i32 %rem, 0, !dbg !374
  br i1 %cmp6, label %if.then, label %if.end, !dbg !375

if.then:                                          ; preds = %for.body3
  %12 = load %struct._IO_FILE** @stderr, align 8, !dbg !376
  %call7 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)), !dbg !378
  br label %if.end, !dbg !378

if.end:                                           ; preds = %if.then, %for.body3
  br label %for.inc, !dbg !379

for.inc:                                          ; preds = %if.end
  %13 = load i32* %j, align 4, !dbg !380
  %inc = add nsw i32 %13, 1, !dbg !380
  store i32 %inc, i32* %j, align 4, !dbg !380
  br label %for.cond1, !dbg !381

for.end:                                          ; preds = %for.cond1
  br label %for.inc8, !dbg !382

for.inc8:                                         ; preds = %for.end
  %14 = load i32* %i, align 4, !dbg !383
  %inc9 = add nsw i32 %14, 1, !dbg !383
  store i32 %inc9, i32* %i, align 4, !dbg !383
  br label %for.cond, !dbg !384

for.end10:                                        ; preds = %for.cond
  %15 = load %struct._IO_FILE** @stderr, align 8, !dbg !385
  %call11 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)), !dbg !386
  ret void, !dbg !387
}

; Function Attrs: nounwind
declare void @free(i8*) #4

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind
declare double @sqrt(double) #4

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!32, !33}
!llvm.ident = !{!34}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\000\00\000\00\001", !1, !2, !3, !13, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c] [DW_LANG_C99]
!1 = !{!"correlation.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation"}
!2 = !{}
!3 = !{!4, !9, !12, !6}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!5 = !{!"0x1\00\000\0064000000\0064\000\000\000", null, null, !6, !7, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 64000000, align 64, offset 0] [from double]
!6 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!7 = !{!8, !8}
!8 = !{!"0x21\000\001000"}                        ; [ DW_TAG_subrange_type ] [0, 999]
!9 = !{!"0xf\00\000\0064\0064\000\000", null, null, !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = !{!"0x1\00\000\0064000\0064\000\000\000", null, null, !6, !11, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 64000, align 64, offset 0] [from double]
!11 = !{!8}
!12 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!13 = !{!14, !22, !25, !29}
!14 = !{!"0x2e\00main\00main\00\00122\000\001\000\000\00256\000\00123", !1, !15, !16, null, i32 (i32, i8**)* @main, null, null, !2} ; [ DW_TAG_subprogram ] [line 122] [def] [scope 123] [main]
!15 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!16 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !17, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!17 = !{!18, !18, !19}
!18 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!19 = !{!"0xf\00\000\0064\0064\000\000", null, null, !20} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!20 = !{!"0xf\00\000\0064\0064\000\000", null, null, !21} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!21 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!22 = !{!"0x2e\00print_array\00print_array\00\0041\001\001\000\000\00256\000\0044", !1, !15, !23, null, void (i32, [1000 x double]*)* @print_array, null, null, !2} ; [ DW_TAG_subprogram ] [line 41] [local] [def] [scope 44] [print_array]
!23 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !24, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!24 = !{null, !18, !9}
!25 = !{!"0x2e\00kernel_correlation\00kernel_correlation\00\0059\001\001\000\000\00256\000\0065", !1, !15, !26, null, void (i32, i32, double, [1000 x double]*, [1000 x double]*, double*, double*)* @kernel_correlation, null, null, !2} ; [ DW_TAG_subprogram ] [line 59] [local] [def] [scope 65] [kernel_correlation]
!26 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !27, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!27 = !{null, !18, !18, !6, !9, !9, !28, !28}
!28 = !{!"0xf\00\000\0064\0064\000\000", null, null, !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!29 = !{!"0x2e\00init_array\00init_array\00\0023\001\001\000\000\00256\000\0027", !1, !15, !30, null, void (i32, i32, double*, [1000 x double]*)* @init_array, null, null, !2} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [scope 27] [init_array]
!30 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !31, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!31 = !{null, !18, !18, !28, !9}
!32 = !{i32 2, !"Dwarf Version", i32 4}
!33 = !{i32 2, !"Debug Info Version", i32 2}
!34 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!35 = !{!"0x101\00argc\0016777338\000", !14, !15, !18} ; [ DW_TAG_arg_variable ] [argc] [line 122]
!36 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!37 = !MDLocation(line: 122, column: 14, scope: !14)
!38 = !{!"0x101\00argv\0033554554\000", !14, !15, !19} ; [ DW_TAG_arg_variable ] [argv] [line 122]
!39 = !MDLocation(line: 122, column: 27, scope: !14)
!40 = !{!"0x100\00n\00125\000", !14, !15, !18}    ; [ DW_TAG_auto_variable ] [n] [line 125]
!41 = !MDLocation(line: 125, column: 7, scope: !14)
!42 = !{!"0x100\00m\00126\000", !14, !15, !18}    ; [ DW_TAG_auto_variable ] [m] [line 126]
!43 = !MDLocation(line: 126, column: 7, scope: !14)
!44 = !{!"0x100\00float_n\00129\000", !14, !15, !6} ; [ DW_TAG_auto_variable ] [float_n] [line 129]
!45 = !MDLocation(line: 129, column: 13, scope: !14)
!46 = !{!"0x100\00data\00130\000", !14, !15, !4}  ; [ DW_TAG_auto_variable ] [data] [line 130]
!47 = !MDLocation(line: 130, column: 3, scope: !14)
!48 = !{!"0x100\00symmat\00131\000", !14, !15, !4} ; [ DW_TAG_auto_variable ] [symmat] [line 131]
!49 = !MDLocation(line: 131, column: 3, scope: !14)
!50 = !{!"0x100\00mean\00132\000", !14, !15, !9}  ; [ DW_TAG_auto_variable ] [mean] [line 132]
!51 = !MDLocation(line: 132, column: 3, scope: !14)
!52 = !{!"0x100\00stddev\00133\000", !14, !15, !9} ; [ DW_TAG_auto_variable ] [stddev] [line 133]
!53 = !MDLocation(line: 133, column: 3, scope: !14)
!54 = !MDLocation(line: 136, column: 15, scope: !14)
!55 = !MDLocation(line: 136, column: 18, scope: !14)
!56 = !MDLocation(line: 136, column: 31, scope: !14)
!57 = !MDLocation(line: 136, column: 3, scope: !14)
!58 = !MDLocation(line: 142, column: 23, scope: !14)
!59 = !MDLocation(line: 142, column: 26, scope: !14)
!60 = !MDLocation(line: 142, column: 29, scope: !14)
!61 = !MDLocation(line: 143, column: 9, scope: !14)
!62 = !MDLocation(line: 144, column: 9, scope: !14)
!63 = !MDLocation(line: 145, column: 9, scope: !14)
!64 = !MDLocation(line: 146, column: 9, scope: !14)
!65 = !MDLocation(line: 142, column: 3, scope: !14)
!66 = !MDLocation(line: 154, column: 3, scope: !67)
!67 = !{!"0xb\00154\003\000", !1, !14}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!68 = !MDLocation(line: 154, column: 3, scope: !14)
!69 = !MDLocation(line: 154, column: 3, scope: !70)
!70 = !{!"0xb\001", !1, !67}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!71 = !MDLocation(line: 154, column: 3, scope: !72)
!72 = !{!"0xb\002", !1, !67}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!73 = !MDLocation(line: 157, column: 3, scope: !14)
!74 = !MDLocation(line: 158, column: 3, scope: !14)
!75 = !MDLocation(line: 159, column: 3, scope: !14)
!76 = !MDLocation(line: 160, column: 3, scope: !14)
!77 = !MDLocation(line: 162, column: 3, scope: !14)
!78 = !{!"0x101\00m\0016777239\000", !29, !15, !18} ; [ DW_TAG_arg_variable ] [m] [line 23]
!79 = !MDLocation(line: 23, column: 22, scope: !29)
!80 = !{!"0x101\00n\0033554456\000", !29, !15, !18} ; [ DW_TAG_arg_variable ] [n] [line 24]
!81 = !MDLocation(line: 24, column: 8, scope: !29)
!82 = !{!"0x101\00float_n\0050331673\000", !29, !15, !28} ; [ DW_TAG_arg_variable ] [float_n] [line 25]
!83 = !MDLocation(line: 25, column: 15, scope: !29)
!84 = !{!"0x101\00data\0067108890\000", !29, !15, !9} ; [ DW_TAG_arg_variable ] [data] [line 26]
!85 = !MDLocation(line: 26, column: 14, scope: !29)
!86 = !{!"0x100\00i\0028\000", !29, !15, !18}     ; [ DW_TAG_auto_variable ] [i] [line 28]
!87 = !MDLocation(line: 28, column: 7, scope: !29)
!88 = !{!"0x100\00j\0028\000", !29, !15, !18}     ; [ DW_TAG_auto_variable ] [j] [line 28]
!89 = !MDLocation(line: 28, column: 10, scope: !29)
!90 = !MDLocation(line: 30, column: 4, scope: !29)
!91 = !MDLocation(line: 30, column: 3, scope: !29)
!92 = !MDLocation(line: 32, column: 8, scope: !93)
!93 = !{!"0xb\0032\003\0030", !1, !29}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!94 = !MDLocation(line: 32, column: 15, scope: !95)
!95 = !{!"0xb\002", !1, !96}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!96 = !{!"0xb\001", !1, !97}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!97 = !{!"0xb\0032\003\0031", !1, !93}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!98 = !MDLocation(line: 32, column: 19, scope: !97)
!99 = !MDLocation(line: 32, column: 15, scope: !97)
!100 = !MDLocation(line: 32, column: 3, scope: !93)
!101 = !MDLocation(line: 33, column: 10, scope: !102)
!102 = !{!"0xb\0033\005\0032", !1, !97}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!103 = !MDLocation(line: 33, column: 17, scope: !104)
!104 = !{!"0xb\002", !1, !105}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!105 = !{!"0xb\001", !1, !106}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!106 = !{!"0xb\0033\005\0033", !1, !102}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!107 = !MDLocation(line: 33, column: 21, scope: !106)
!108 = !MDLocation(line: 33, column: 17, scope: !106)
!109 = !MDLocation(line: 33, column: 5, scope: !102)
!110 = !MDLocation(line: 34, column: 33, scope: !106)
!111 = !MDLocation(line: 34, column: 21, scope: !106)
!112 = !MDLocation(line: 34, column: 35, scope: !106)
!113 = !MDLocation(line: 34, column: 20, scope: !106)
!114 = !MDLocation(line: 34, column: 15, scope: !106)
!115 = !MDLocation(line: 34, column: 7, scope: !106)
!116 = !MDLocation(line: 34, column: 12, scope: !106)
!117 = !MDLocation(line: 33, column: 24, scope: !106)
!118 = !MDLocation(line: 33, column: 5, scope: !106)
!119 = !MDLocation(line: 34, column: 40, scope: !102)
!120 = !MDLocation(line: 32, column: 22, scope: !97)
!121 = !MDLocation(line: 32, column: 3, scope: !97)
!122 = !MDLocation(line: 35, column: 1, scope: !29)
!123 = !{!"0x101\00m\0016777275\000", !25, !15, !18} ; [ DW_TAG_arg_variable ] [m] [line 59]
!124 = !MDLocation(line: 59, column: 29, scope: !25)
!125 = !{!"0x101\00n\0033554491\000", !25, !15, !18} ; [ DW_TAG_arg_variable ] [n] [line 59]
!126 = !MDLocation(line: 59, column: 36, scope: !25)
!127 = !{!"0x101\00float_n\0050331708\000", !25, !15, !6} ; [ DW_TAG_arg_variable ] [float_n] [line 60]
!128 = !MDLocation(line: 60, column: 14, scope: !25)
!129 = !{!"0x101\00data\0067108925\000", !25, !15, !9} ; [ DW_TAG_arg_variable ] [data] [line 61]
!130 = !MDLocation(line: 61, column: 14, scope: !25)
!131 = !{!"0x101\00symmat\0083886142\000", !25, !15, !9} ; [ DW_TAG_arg_variable ] [symmat] [line 62]
!132 = !MDLocation(line: 62, column: 14, scope: !25)
!133 = !{!"0x101\00mean\00100663359\000", !25, !15, !28} ; [ DW_TAG_arg_variable ] [mean] [line 63]
!134 = !MDLocation(line: 63, column: 14, scope: !25)
!135 = !{!"0x101\00stddev\00117440576\000", !25, !15, !28} ; [ DW_TAG_arg_variable ] [stddev] [line 64]
!136 = !MDLocation(line: 64, column: 14, scope: !25)
!137 = !{!"0x100\00i\0066\000", !25, !15, !18}    ; [ DW_TAG_auto_variable ] [i] [line 66]
!138 = !MDLocation(line: 66, column: 7, scope: !25)
!139 = !{!"0x100\00j\0066\000", !25, !15, !18}    ; [ DW_TAG_auto_variable ] [j] [line 66]
!140 = !MDLocation(line: 66, column: 10, scope: !25)
!141 = !{!"0x100\00j1\0066\000", !25, !15, !18}   ; [ DW_TAG_auto_variable ] [j1] [line 66]
!142 = !MDLocation(line: 66, column: 13, scope: !25)
!143 = !{!"0x100\00j2\0066\000", !25, !15, !18}   ; [ DW_TAG_auto_variable ] [j2] [line 66]
!144 = !MDLocation(line: 66, column: 17, scope: !25)
!145 = !{!"0x100\00eps\0068\000", !25, !15, !6}   ; [ DW_TAG_auto_variable ] [eps] [line 68]
!146 = !MDLocation(line: 68, column: 13, scope: !25)
!147 = !MDLocation(line: 74, column: 8, scope: !148)
!148 = !{!"0xb\0074\003\007", !1, !25}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!149 = !MDLocation(line: 74, column: 15, scope: !150)
!150 = !{!"0xb\002", !1, !151}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!151 = !{!"0xb\001", !1, !152}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!152 = !{!"0xb\0074\003\008", !1, !148}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!153 = !MDLocation(line: 74, column: 19, scope: !152)
!154 = !MDLocation(line: 74, column: 15, scope: !152)
!155 = !MDLocation(line: 74, column: 3, scope: !148)
!156 = !MDLocation(line: 76, column: 12, scope: !157)
!157 = !{!"0xb\0075\005\009", !1, !152}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!158 = !MDLocation(line: 76, column: 7, scope: !157)
!159 = !MDLocation(line: 77, column: 12, scope: !160)
!160 = !{!"0xb\0077\007\0010", !1, !157}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!161 = !MDLocation(line: 77, column: 19, scope: !162)
!162 = !{!"0xb\002", !1, !163}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!163 = !{!"0xb\001", !1, !164}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!164 = !{!"0xb\0077\007\0011", !1, !160}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!165 = !MDLocation(line: 77, column: 23, scope: !164)
!166 = !MDLocation(line: 77, column: 19, scope: !164)
!167 = !MDLocation(line: 77, column: 7, scope: !160)
!168 = !MDLocation(line: 78, column: 21, scope: !164)
!169 = !MDLocation(line: 78, column: 13, scope: !164)
!170 = !MDLocation(line: 78, column: 18, scope: !164)
!171 = !MDLocation(line: 78, column: 7, scope: !164)
!172 = !MDLocation(line: 78, column: 2, scope: !164)
!173 = !MDLocation(line: 77, column: 26, scope: !164)
!174 = !MDLocation(line: 77, column: 7, scope: !164)
!175 = !MDLocation(line: 79, column: 18, scope: !157)
!176 = !MDLocation(line: 79, column: 12, scope: !157)
!177 = !MDLocation(line: 79, column: 7, scope: !157)
!178 = !MDLocation(line: 80, column: 5, scope: !157)
!179 = !MDLocation(line: 74, column: 22, scope: !152)
!180 = !MDLocation(line: 74, column: 3, scope: !152)
!181 = !MDLocation(line: 83, column: 8, scope: !182)
!182 = !{!"0xb\0083\003\0012", !1, !25}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!183 = !MDLocation(line: 83, column: 15, scope: !184)
!184 = !{!"0xb\002", !1, !185}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!185 = !{!"0xb\001", !1, !186}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!186 = !{!"0xb\0083\003\0013", !1, !182}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!187 = !MDLocation(line: 83, column: 19, scope: !186)
!188 = !MDLocation(line: 83, column: 15, scope: !186)
!189 = !MDLocation(line: 83, column: 3, scope: !182)
!190 = !MDLocation(line: 85, column: 14, scope: !191)
!191 = !{!"0xb\0084\005\0014", !1, !186}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!192 = !MDLocation(line: 85, column: 7, scope: !191)
!193 = !MDLocation(line: 86, column: 12, scope: !194)
!194 = !{!"0xb\0086\007\0015", !1, !191}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!195 = !MDLocation(line: 86, column: 19, scope: !196)
!196 = !{!"0xb\002", !1, !197}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!197 = !{!"0xb\001", !1, !198}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!198 = !{!"0xb\0086\007\0016", !1, !194}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!199 = !MDLocation(line: 86, column: 23, scope: !198)
!200 = !MDLocation(line: 86, column: 19, scope: !198)
!201 = !MDLocation(line: 86, column: 7, scope: !194)
!202 = !MDLocation(line: 87, column: 24, scope: !198)
!203 = !MDLocation(line: 87, column: 16, scope: !198)
!204 = !MDLocation(line: 87, column: 21, scope: !198)
!205 = !MDLocation(line: 87, column: 34, scope: !198)
!206 = !MDLocation(line: 87, column: 29, scope: !198)
!207 = !MDLocation(line: 87, column: 49, scope: !198)
!208 = !MDLocation(line: 87, column: 41, scope: !198)
!209 = !MDLocation(line: 87, column: 46, scope: !198)
!210 = !MDLocation(line: 87, column: 59, scope: !198)
!211 = !MDLocation(line: 87, column: 54, scope: !198)
!212 = !MDLocation(line: 87, column: 15, scope: !198)
!213 = !MDLocation(line: 87, column: 9, scope: !198)
!214 = !MDLocation(line: 87, column: 2, scope: !198)
!215 = !MDLocation(line: 86, column: 26, scope: !198)
!216 = !MDLocation(line: 86, column: 7, scope: !198)
!217 = !MDLocation(line: 88, column: 20, scope: !191)
!218 = !MDLocation(line: 88, column: 14, scope: !191)
!219 = !MDLocation(line: 88, column: 7, scope: !191)
!220 = !MDLocation(line: 89, column: 19, scope: !191)
!221 = !MDLocation(line: 89, column: 14, scope: !191)
!222 = !MDLocation(line: 89, column: 7, scope: !191)
!223 = !MDLocation(line: 93, column: 26, scope: !191)
!224 = !MDLocation(line: 93, column: 19, scope: !191)
!225 = !MDLocation(line: 93, column: 32, scope: !191)
!226 = !MDLocation(line: 93, column: 19, scope: !227)
!227 = !{!"0xb\001", !1, !191}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!228 = !MDLocation(line: 93, column: 51, scope: !229)
!229 = !{!"0xb\002", !1, !191}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!230 = !MDLocation(line: 93, column: 44, scope: !191)
!231 = !MDLocation(line: 93, column: 14, scope: !232)
!232 = !{!"0xb\004", !1, !233}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!233 = !{!"0xb\003", !1, !191}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!234 = !MDLocation(line: 93, column: 7, scope: !191)
!235 = !MDLocation(line: 94, column: 5, scope: !191)
!236 = !MDLocation(line: 83, column: 22, scope: !186)
!237 = !MDLocation(line: 83, column: 3, scope: !186)
!238 = !MDLocation(line: 97, column: 8, scope: !239)
!239 = !{!"0xb\0097\003\0017", !1, !25}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!240 = !MDLocation(line: 97, column: 15, scope: !241)
!241 = !{!"0xb\002", !1, !242}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!242 = !{!"0xb\001", !1, !243}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!243 = !{!"0xb\0097\003\0018", !1, !239}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!244 = !MDLocation(line: 97, column: 19, scope: !243)
!245 = !MDLocation(line: 97, column: 15, scope: !243)
!246 = !MDLocation(line: 97, column: 3, scope: !239)
!247 = !MDLocation(line: 98, column: 10, scope: !248)
!248 = !{!"0xb\0098\005\0019", !1, !243}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!249 = !MDLocation(line: 98, column: 17, scope: !250)
!250 = !{!"0xb\002", !1, !251}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!251 = !{!"0xb\001", !1, !252}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!252 = !{!"0xb\0098\005\0020", !1, !248}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!253 = !MDLocation(line: 98, column: 21, scope: !252)
!254 = !MDLocation(line: 98, column: 17, scope: !252)
!255 = !MDLocation(line: 98, column: 5, scope: !248)
!256 = !MDLocation(line: 100, column: 21, scope: !257)
!257 = !{!"0xb\0099\007\0021", !1, !252}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!258 = !MDLocation(line: 100, column: 16, scope: !257)
!259 = !MDLocation(line: 100, column: 10, scope: !257)
!260 = !MDLocation(line: 100, column: 2, scope: !257)
!261 = !MDLocation(line: 100, column: 7, scope: !257)
!262 = !MDLocation(line: 101, column: 21, scope: !257)
!263 = !MDLocation(line: 101, column: 16, scope: !257)
!264 = !MDLocation(line: 101, column: 39, scope: !257)
!265 = !MDLocation(line: 101, column: 32, scope: !257)
!266 = !MDLocation(line: 101, column: 10, scope: !257)
!267 = !MDLocation(line: 101, column: 2, scope: !257)
!268 = !MDLocation(line: 101, column: 7, scope: !257)
!269 = !MDLocation(line: 102, column: 7, scope: !257)
!270 = !MDLocation(line: 98, column: 24, scope: !252)
!271 = !MDLocation(line: 98, column: 5, scope: !252)
!272 = !MDLocation(line: 102, column: 7, scope: !248)
!273 = !MDLocation(line: 97, column: 22, scope: !243)
!274 = !MDLocation(line: 97, column: 3, scope: !243)
!275 = !MDLocation(line: 105, column: 8, scope: !276)
!276 = !{!"0xb\00105\003\0022", !1, !25}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!277 = !MDLocation(line: 105, column: 16, scope: !278)
!278 = !{!"0xb\002", !1, !279}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!279 = !{!"0xb\001", !1, !280}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!280 = !{!"0xb\00105\003\0023", !1, !276}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!281 = !MDLocation(line: 105, column: 21, scope: !280)
!282 = !MDLocation(line: 105, column: 16, scope: !280)
!283 = !MDLocation(line: 105, column: 3, scope: !276)
!284 = !MDLocation(line: 107, column: 18, scope: !285)
!285 = !{!"0xb\00106\005\0024", !1, !280}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!286 = !MDLocation(line: 107, column: 7, scope: !285)
!287 = !MDLocation(line: 107, column: 14, scope: !285)
!288 = !MDLocation(line: 108, column: 17, scope: !289)
!289 = !{!"0xb\00108\007\0025", !1, !285}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!290 = !MDLocation(line: 108, column: 12, scope: !289)
!291 = !MDLocation(line: 108, column: 23, scope: !292)
!292 = !{!"0xb\002", !1, !293}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!293 = !{!"0xb\001", !1, !294}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!294 = !{!"0xb\00108\007\0026", !1, !289}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!295 = !MDLocation(line: 108, column: 28, scope: !294)
!296 = !MDLocation(line: 108, column: 23, scope: !294)
!297 = !MDLocation(line: 108, column: 7, scope: !289)
!298 = !MDLocation(line: 110, column: 15, scope: !299)
!299 = !{!"0xb\00109\002\0027", !1, !294}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!300 = !MDLocation(line: 110, column: 4, scope: !299)
!301 = !MDLocation(line: 110, column: 11, scope: !299)
!302 = !MDLocation(line: 111, column: 9, scope: !303)
!303 = !{!"0xb\00111\004\0028", !1, !299}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!304 = !MDLocation(line: 111, column: 16, scope: !305)
!305 = !{!"0xb\002", !1, !306}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!306 = !{!"0xb\001", !1, !307}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!307 = !{!"0xb\00111\004\0029", !1, !303}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!308 = !MDLocation(line: 111, column: 20, scope: !307)
!309 = !MDLocation(line: 111, column: 16, scope: !307)
!310 = !MDLocation(line: 111, column: 4, scope: !303)
!311 = !MDLocation(line: 112, column: 33, scope: !307)
!312 = !MDLocation(line: 112, column: 25, scope: !307)
!313 = !MDLocation(line: 112, column: 30, scope: !307)
!314 = !MDLocation(line: 112, column: 47, scope: !307)
!315 = !MDLocation(line: 112, column: 39, scope: !307)
!316 = !MDLocation(line: 112, column: 44, scope: !307)
!317 = !MDLocation(line: 112, column: 17, scope: !307)
!318 = !MDLocation(line: 112, column: 6, scope: !307)
!319 = !MDLocation(line: 112, column: 13, scope: !307)
!320 = !MDLocation(line: 111, column: 23, scope: !307)
!321 = !MDLocation(line: 111, column: 4, scope: !307)
!322 = !MDLocation(line: 113, column: 32, scope: !299)
!323 = !MDLocation(line: 113, column: 21, scope: !299)
!324 = !MDLocation(line: 113, column: 28, scope: !299)
!325 = !MDLocation(line: 113, column: 15, scope: !299)
!326 = !MDLocation(line: 113, column: 4, scope: !299)
!327 = !MDLocation(line: 113, column: 11, scope: !299)
!328 = !MDLocation(line: 114, column: 2, scope: !299)
!329 = !MDLocation(line: 108, column: 31, scope: !294)
!330 = !MDLocation(line: 108, column: 7, scope: !294)
!331 = !MDLocation(line: 115, column: 5, scope: !285)
!332 = !MDLocation(line: 105, column: 26, scope: !280)
!333 = !MDLocation(line: 105, column: 3, scope: !280)
!334 = !MDLocation(line: 116, column: 13, scope: !25)
!335 = !MDLocation(line: 116, column: 3, scope: !25)
!336 = !MDLocation(line: 116, column: 10, scope: !25)
!337 = !MDLocation(line: 119, column: 1, scope: !25)
!338 = !{!"0x101\00m\0016777257\000", !22, !15, !18} ; [ DW_TAG_arg_variable ] [m] [line 41]
!339 = !MDLocation(line: 41, column: 22, scope: !22)
!340 = !{!"0x101\00symmat\0033554474\000", !22, !15, !9} ; [ DW_TAG_arg_variable ] [symmat] [line 42]
!341 = !MDLocation(line: 42, column: 14, scope: !22)
!342 = !{!"0x100\00i\0045\000", !22, !15, !18}    ; [ DW_TAG_auto_variable ] [i] [line 45]
!343 = !MDLocation(line: 45, column: 7, scope: !22)
!344 = !{!"0x100\00j\0045\000", !22, !15, !18}    ; [ DW_TAG_auto_variable ] [j] [line 45]
!345 = !MDLocation(line: 45, column: 10, scope: !22)
!346 = !MDLocation(line: 47, column: 8, scope: !347)
!347 = !{!"0xb\0047\003\001", !1, !22}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!348 = !MDLocation(line: 47, column: 15, scope: !349)
!349 = !{!"0xb\002", !1, !350}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!350 = !{!"0xb\001", !1, !351}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!351 = !{!"0xb\0047\003\002", !1, !347}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!352 = !MDLocation(line: 47, column: 19, scope: !351)
!353 = !MDLocation(line: 47, column: 15, scope: !351)
!354 = !MDLocation(line: 47, column: 3, scope: !347)
!355 = !MDLocation(line: 48, column: 10, scope: !356)
!356 = !{!"0xb\0048\005\003", !1, !351}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!357 = !MDLocation(line: 48, column: 17, scope: !358)
!358 = !{!"0xb\002", !1, !359}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!359 = !{!"0xb\001", !1, !360}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!360 = !{!"0xb\0048\005\004", !1, !356}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!361 = !MDLocation(line: 48, column: 21, scope: !360)
!362 = !MDLocation(line: 48, column: 17, scope: !360)
!363 = !MDLocation(line: 48, column: 5, scope: !356)
!364 = !MDLocation(line: 49, column: 16, scope: !365)
!365 = !{!"0xb\0048\0029\005", !1, !360}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!366 = !MDLocation(line: 49, column: 56, scope: !365)
!367 = !MDLocation(line: 49, column: 46, scope: !365)
!368 = !MDLocation(line: 49, column: 53, scope: !365)
!369 = !MDLocation(line: 49, column: 7, scope: !365)
!370 = !MDLocation(line: 50, column: 12, scope: !371)
!371 = !{!"0xb\0050\0011\006", !1, !365}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!372 = !MDLocation(line: 50, column: 16, scope: !371)
!373 = !MDLocation(line: 50, column: 20, scope: !371)
!374 = !MDLocation(line: 50, column: 11, scope: !371)
!375 = !MDLocation(line: 50, column: 11, scope: !365)
!376 = !MDLocation(line: 50, column: 43, scope: !377)
!377 = !{!"0xb\001", !1, !371}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!378 = !MDLocation(line: 50, column: 34, scope: !371)
!379 = !MDLocation(line: 51, column: 5, scope: !365)
!380 = !MDLocation(line: 48, column: 24, scope: !360)
!381 = !MDLocation(line: 48, column: 5, scope: !360)
!382 = !MDLocation(line: 51, column: 5, scope: !356)
!383 = !MDLocation(line: 47, column: 22, scope: !351)
!384 = !MDLocation(line: 47, column: 3, scope: !351)
!385 = !MDLocation(line: 52, column: 12, scope: !22)
!386 = !MDLocation(line: 52, column: 3, scope: !22)
!387 = !MDLocation(line: 53, column: 1, scope: !22)
