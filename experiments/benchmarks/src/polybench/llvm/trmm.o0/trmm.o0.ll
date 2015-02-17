; ModuleID = 'trmm.c'
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
  %ni = alloca i32, align 4
  %alpha = alloca double, align 8
  %A = alloca [1024 x [1024 x double]]*, align 8
  %B = alloca [1024 x [1024 x double]]*, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !35, metadata !36), !dbg !37
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !38, metadata !36), !dbg !39
  call void @llvm.dbg.declare(metadata i32* %ni, metadata !40, metadata !36), !dbg !41
  store i32 1024, i32* %ni, align 4, !dbg !41
  call void @llvm.dbg.declare(metadata double* %alpha, metadata !42, metadata !36), !dbg !43
  call void @llvm.dbg.declare(metadata [1024 x [1024 x double]]** %A, metadata !44, metadata !36), !dbg !45
  %call = call i8* @polybench_alloc_data(i32 1048576, i32 8), !dbg !45
  %0 = bitcast i8* %call to [1024 x [1024 x double]]*, !dbg !45
  store [1024 x [1024 x double]]* %0, [1024 x [1024 x double]]** %A, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata [1024 x [1024 x double]]** %B, metadata !46, metadata !36), !dbg !47
  %call1 = call i8* @polybench_alloc_data(i32 1048576, i32 8), !dbg !47
  %1 = bitcast i8* %call1 to [1024 x [1024 x double]]*, !dbg !47
  store [1024 x [1024 x double]]* %1, [1024 x [1024 x double]]** %B, align 8, !dbg !47
  %2 = load i32* %ni, align 4, !dbg !48
  %3 = load [1024 x [1024 x double]]** %A, align 8, !dbg !49
  %arraydecay = getelementptr inbounds [1024 x [1024 x double]]* %3, i32 0, i32 0, !dbg !49
  %4 = load [1024 x [1024 x double]]** %B, align 8, !dbg !50
  %arraydecay2 = getelementptr inbounds [1024 x [1024 x double]]* %4, i32 0, i32 0, !dbg !50
  call void @init_array(i32 %2, double* %alpha, [1024 x double]* %arraydecay, [1024 x double]* %arraydecay2), !dbg !51
  %5 = load i32* %ni, align 4, !dbg !52
  %6 = load double* %alpha, align 8, !dbg !53
  %7 = load [1024 x [1024 x double]]** %A, align 8, !dbg !54
  %arraydecay3 = getelementptr inbounds [1024 x [1024 x double]]* %7, i32 0, i32 0, !dbg !54
  %8 = load [1024 x [1024 x double]]** %B, align 8, !dbg !55
  %arraydecay4 = getelementptr inbounds [1024 x [1024 x double]]* %8, i32 0, i32 0, !dbg !55
  call void @kernel_trmm(i32 %5, double %6, [1024 x double]* %arraydecay3, [1024 x double]* %arraydecay4), !dbg !56
  %9 = load i32* %argc.addr, align 4, !dbg !57
  %cmp = icmp sgt i32 %9, 42, !dbg !57
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !59

land.lhs.true:                                    ; preds = %entry
  %10 = load i8*** %argv.addr, align 8, !dbg !60
  %arrayidx = getelementptr inbounds i8** %10, i64 0, !dbg !60
  %11 = load i8** %arrayidx, align 8, !dbg !60
  %call5 = call i32 @strcmp(i8* %11, i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0)) #5, !dbg !60
  %tobool = icmp ne i32 %call5, 0, !dbg !59
  br i1 %tobool, label %if.end, label %if.then, !dbg !59

if.then:                                          ; preds = %land.lhs.true
  %12 = load i32* %ni, align 4, !dbg !62
  %13 = load [1024 x [1024 x double]]** %B, align 8, !dbg !62
  %arraydecay6 = getelementptr inbounds [1024 x [1024 x double]]* %13, i32 0, i32 0, !dbg !62
  call void @print_array(i32 %12, [1024 x double]* %arraydecay6), !dbg !62
  br label %if.end, !dbg !62

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %14 = load [1024 x [1024 x double]]** %A, align 8, !dbg !64
  %15 = bitcast [1024 x [1024 x double]]* %14 to i8*, !dbg !64
  call void @free(i8* %15) #6, !dbg !64
  %16 = load [1024 x [1024 x double]]** %B, align 8, !dbg !65
  %17 = bitcast [1024 x [1024 x double]]* %16 to i8*, !dbg !65
  call void @free(i8* %17) #6, !dbg !65
  ret i32 0, !dbg !66
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i8* @polybench_alloc_data(i32, i32) #2

; Function Attrs: nounwind uwtable
define internal void @init_array(i32 %ni, double* %alpha, [1024 x double]* %A, [1024 x double]* %B) #0 {
entry:
  %ni.addr = alloca i32, align 4
  %alpha.addr = alloca double*, align 8
  %A.addr = alloca [1024 x double]*, align 8
  %B.addr = alloca [1024 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %ni, i32* %ni.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ni.addr, metadata !67, metadata !36), !dbg !68
  store double* %alpha, double** %alpha.addr, align 8
  call void @llvm.dbg.declare(metadata double** %alpha.addr, metadata !69, metadata !36), !dbg !70
  store [1024 x double]* %A, [1024 x double]** %A.addr, align 8
  call void @llvm.dbg.declare(metadata [1024 x double]** %A.addr, metadata !71, metadata !36), !dbg !72
  store [1024 x double]* %B, [1024 x double]** %B.addr, align 8
  call void @llvm.dbg.declare(metadata [1024 x double]** %B.addr, metadata !73, metadata !36), !dbg !74
  call void @llvm.dbg.declare(metadata i32* %i, metadata !75, metadata !36), !dbg !76
  call void @llvm.dbg.declare(metadata i32* %j, metadata !77, metadata !36), !dbg !78
  %0 = load double** %alpha.addr, align 8, !dbg !79
  store double 3.241200e+04, double* %0, align 8, !dbg !80
  store i32 0, i32* %i, align 4, !dbg !81
  br label %for.cond, !dbg !81

for.cond:                                         ; preds = %for.inc17, %entry
  %1 = load i32* %i, align 4, !dbg !83
  %2 = load i32* %ni.addr, align 4, !dbg !87
  %cmp = icmp slt i32 %1, %2, !dbg !88
  br i1 %cmp, label %for.body, label %for.end19, !dbg !89

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !90
  br label %for.cond1, !dbg !90

for.cond1:                                        ; preds = %for.inc, %for.body
  %3 = load i32* %j, align 4, !dbg !92
  %4 = load i32* %ni.addr, align 4, !dbg !96
  %cmp2 = icmp slt i32 %3, %4, !dbg !97
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !98

for.body3:                                        ; preds = %for.cond1
  %5 = load i32* %i, align 4, !dbg !99
  %conv = sitofp i32 %5 to double, !dbg !101
  %6 = load i32* %j, align 4, !dbg !102
  %conv4 = sitofp i32 %6 to double, !dbg !102
  %mul = fmul double %conv, %conv4, !dbg !101
  %7 = load i32* %ni.addr, align 4, !dbg !103
  %conv5 = sitofp i32 %7 to double, !dbg !103
  %div = fdiv double %mul, %conv5, !dbg !104
  %8 = load i32* %j, align 4, !dbg !105
  %idxprom = sext i32 %8 to i64, !dbg !106
  %9 = load i32* %i, align 4, !dbg !107
  %idxprom6 = sext i32 %9 to i64, !dbg !106
  %10 = load [1024 x double]** %A.addr, align 8, !dbg !106
  %arrayidx = getelementptr inbounds [1024 x double]* %10, i64 %idxprom6, !dbg !106
  %arrayidx7 = getelementptr inbounds [1024 x double]* %arrayidx, i32 0, i64 %idxprom, !dbg !106
  store double %div, double* %arrayidx7, align 8, !dbg !106
  %11 = load i32* %i, align 4, !dbg !108
  %conv8 = sitofp i32 %11 to double, !dbg !109
  %12 = load i32* %j, align 4, !dbg !110
  %conv9 = sitofp i32 %12 to double, !dbg !110
  %mul10 = fmul double %conv8, %conv9, !dbg !109
  %13 = load i32* %ni.addr, align 4, !dbg !111
  %conv11 = sitofp i32 %13 to double, !dbg !111
  %div12 = fdiv double %mul10, %conv11, !dbg !112
  %14 = load i32* %j, align 4, !dbg !113
  %idxprom13 = sext i32 %14 to i64, !dbg !114
  %15 = load i32* %i, align 4, !dbg !115
  %idxprom14 = sext i32 %15 to i64, !dbg !114
  %16 = load [1024 x double]** %B.addr, align 8, !dbg !114
  %arrayidx15 = getelementptr inbounds [1024 x double]* %16, i64 %idxprom14, !dbg !114
  %arrayidx16 = getelementptr inbounds [1024 x double]* %arrayidx15, i32 0, i64 %idxprom13, !dbg !114
  store double %div12, double* %arrayidx16, align 8, !dbg !114
  br label %for.inc, !dbg !116

for.inc:                                          ; preds = %for.body3
  %17 = load i32* %j, align 4, !dbg !117
  %inc = add nsw i32 %17, 1, !dbg !117
  store i32 %inc, i32* %j, align 4, !dbg !117
  br label %for.cond1, !dbg !118

for.end:                                          ; preds = %for.cond1
  br label %for.inc17, !dbg !119

for.inc17:                                        ; preds = %for.end
  %18 = load i32* %i, align 4, !dbg !120
  %inc18 = add nsw i32 %18, 1, !dbg !120
  store i32 %inc18, i32* %i, align 4, !dbg !120
  br label %for.cond, !dbg !121

for.end19:                                        ; preds = %for.cond
  ret void, !dbg !122
}

; Function Attrs: nounwind uwtable
define internal void @kernel_trmm(i32 %ni, double %alpha, [1024 x double]* %A, [1024 x double]* %B) #0 {
entry:
  %ni.addr = alloca i32, align 4
  %alpha.addr = alloca double, align 8
  %A.addr = alloca [1024 x double]*, align 8
  %B.addr = alloca [1024 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %ni, i32* %ni.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ni.addr, metadata !123, metadata !36), !dbg !124
  store double %alpha, double* %alpha.addr, align 8
  call void @llvm.dbg.declare(metadata double* %alpha.addr, metadata !125, metadata !36), !dbg !126
  store [1024 x double]* %A, [1024 x double]** %A.addr, align 8
  call void @llvm.dbg.declare(metadata [1024 x double]** %A.addr, metadata !127, metadata !36), !dbg !128
  store [1024 x double]* %B, [1024 x double]** %B.addr, align 8
  call void @llvm.dbg.declare(metadata [1024 x double]** %B.addr, metadata !129, metadata !36), !dbg !130
  call void @llvm.dbg.declare(metadata i32* %i, metadata !131, metadata !36), !dbg !132
  call void @llvm.dbg.declare(metadata i32* %j, metadata !133, metadata !36), !dbg !134
  call void @llvm.dbg.declare(metadata i32* %k, metadata !135, metadata !36), !dbg !136
  store i32 1, i32* %i, align 4, !dbg !137
  br label %for.cond, !dbg !137

for.cond:                                         ; preds = %for.inc21, %entry
  %0 = load i32* %i, align 4, !dbg !139
  %1 = load i32* %ni.addr, align 4, !dbg !143
  %cmp = icmp slt i32 %0, %1, !dbg !144
  br i1 %cmp, label %for.body, label %for.end23, !dbg !145

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !146
  br label %for.cond1, !dbg !146

for.cond1:                                        ; preds = %for.inc18, %for.body
  %2 = load i32* %j, align 4, !dbg !148
  %3 = load i32* %ni.addr, align 4, !dbg !152
  %cmp2 = icmp slt i32 %2, %3, !dbg !153
  br i1 %cmp2, label %for.body3, label %for.end20, !dbg !154

for.body3:                                        ; preds = %for.cond1
  store i32 0, i32* %k, align 4, !dbg !155
  br label %for.cond4, !dbg !155

for.cond4:                                        ; preds = %for.inc, %for.body3
  %4 = load i32* %k, align 4, !dbg !157
  %5 = load i32* %i, align 4, !dbg !161
  %cmp5 = icmp slt i32 %4, %5, !dbg !162
  br i1 %cmp5, label %for.body6, label %for.end, !dbg !163

for.body6:                                        ; preds = %for.cond4
  %6 = load double* %alpha.addr, align 8, !dbg !164
  %7 = load i32* %k, align 4, !dbg !165
  %idxprom = sext i32 %7 to i64, !dbg !166
  %8 = load i32* %i, align 4, !dbg !167
  %idxprom7 = sext i32 %8 to i64, !dbg !166
  %9 = load [1024 x double]** %A.addr, align 8, !dbg !166
  %arrayidx = getelementptr inbounds [1024 x double]* %9, i64 %idxprom7, !dbg !166
  %arrayidx8 = getelementptr inbounds [1024 x double]* %arrayidx, i32 0, i64 %idxprom, !dbg !166
  %10 = load double* %arrayidx8, align 8, !dbg !166
  %mul = fmul double %6, %10, !dbg !164
  %11 = load i32* %k, align 4, !dbg !168
  %idxprom9 = sext i32 %11 to i64, !dbg !169
  %12 = load i32* %j, align 4, !dbg !170
  %idxprom10 = sext i32 %12 to i64, !dbg !169
  %13 = load [1024 x double]** %B.addr, align 8, !dbg !169
  %arrayidx11 = getelementptr inbounds [1024 x double]* %13, i64 %idxprom10, !dbg !169
  %arrayidx12 = getelementptr inbounds [1024 x double]* %arrayidx11, i32 0, i64 %idxprom9, !dbg !169
  %14 = load double* %arrayidx12, align 8, !dbg !169
  %mul13 = fmul double %mul, %14, !dbg !164
  %15 = load i32* %j, align 4, !dbg !171
  %idxprom14 = sext i32 %15 to i64, !dbg !172
  %16 = load i32* %i, align 4, !dbg !173
  %idxprom15 = sext i32 %16 to i64, !dbg !172
  %17 = load [1024 x double]** %B.addr, align 8, !dbg !172
  %arrayidx16 = getelementptr inbounds [1024 x double]* %17, i64 %idxprom15, !dbg !172
  %arrayidx17 = getelementptr inbounds [1024 x double]* %arrayidx16, i32 0, i64 %idxprom14, !dbg !172
  %18 = load double* %arrayidx17, align 8, !dbg !172
  %add = fadd double %18, %mul13, !dbg !172
  store double %add, double* %arrayidx17, align 8, !dbg !172
  br label %for.inc, !dbg !172

for.inc:                                          ; preds = %for.body6
  %19 = load i32* %k, align 4, !dbg !174
  %inc = add nsw i32 %19, 1, !dbg !174
  store i32 %inc, i32* %k, align 4, !dbg !174
  br label %for.cond4, !dbg !175

for.end:                                          ; preds = %for.cond4
  br label %for.inc18, !dbg !176

for.inc18:                                        ; preds = %for.end
  %20 = load i32* %j, align 4, !dbg !177
  %inc19 = add nsw i32 %20, 1, !dbg !177
  store i32 %inc19, i32* %j, align 4, !dbg !177
  br label %for.cond1, !dbg !178

for.end20:                                        ; preds = %for.cond1
  br label %for.inc21, !dbg !179

for.inc21:                                        ; preds = %for.end20
  %21 = load i32* %i, align 4, !dbg !180
  %inc22 = add nsw i32 %21, 1, !dbg !180
  store i32 %inc22, i32* %i, align 4, !dbg !180
  br label %for.cond, !dbg !181

for.end23:                                        ; preds = %for.cond
  ret void, !dbg !182
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #3

; Function Attrs: nounwind uwtable
define internal void @print_array(i32 %ni, [1024 x double]* %B) #0 {
entry:
  %ni.addr = alloca i32, align 4
  %B.addr = alloca [1024 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %ni, i32* %ni.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ni.addr, metadata !183, metadata !36), !dbg !184
  store [1024 x double]* %B, [1024 x double]** %B.addr, align 8
  call void @llvm.dbg.declare(metadata [1024 x double]** %B.addr, metadata !185, metadata !36), !dbg !186
  call void @llvm.dbg.declare(metadata i32* %i, metadata !187, metadata !36), !dbg !188
  call void @llvm.dbg.declare(metadata i32* %j, metadata !189, metadata !36), !dbg !190
  store i32 0, i32* %i, align 4, !dbg !191
  br label %for.cond, !dbg !191

for.cond:                                         ; preds = %for.inc8, %entry
  %0 = load i32* %i, align 4, !dbg !193
  %1 = load i32* %ni.addr, align 4, !dbg !197
  %cmp = icmp slt i32 %0, %1, !dbg !198
  br i1 %cmp, label %for.body, label %for.end10, !dbg !199

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !200
  br label %for.cond1, !dbg !200

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32* %j, align 4, !dbg !202
  %3 = load i32* %ni.addr, align 4, !dbg !206
  %cmp2 = icmp slt i32 %2, %3, !dbg !207
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !208

for.body3:                                        ; preds = %for.cond1
  %4 = load %struct._IO_FILE** @stderr, align 8, !dbg !209
  %5 = load i32* %j, align 4, !dbg !211
  %idxprom = sext i32 %5 to i64, !dbg !212
  %6 = load i32* %i, align 4, !dbg !213
  %idxprom4 = sext i32 %6 to i64, !dbg !212
  %7 = load [1024 x double]** %B.addr, align 8, !dbg !212
  %arrayidx = getelementptr inbounds [1024 x double]* %7, i64 %idxprom4, !dbg !212
  %arrayidx5 = getelementptr inbounds [1024 x double]* %arrayidx, i32 0, i64 %idxprom, !dbg !212
  %8 = load double* %arrayidx5, align 8, !dbg !212
  %call = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([8 x i8]* @.str1, i32 0, i32 0), double %8), !dbg !214
  %9 = load i32* %i, align 4, !dbg !215
  %10 = load i32* %ni.addr, align 4, !dbg !217
  %mul = mul nsw i32 %9, %10, !dbg !215
  %11 = load i32* %j, align 4, !dbg !218
  %add = add nsw i32 %mul, %11, !dbg !215
  %rem = srem i32 %add, 20, !dbg !219
  %cmp6 = icmp eq i32 %rem, 0, !dbg !219
  br i1 %cmp6, label %if.then, label %if.end, !dbg !220

if.then:                                          ; preds = %for.body3
  %12 = load %struct._IO_FILE** @stderr, align 8, !dbg !221
  %call7 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)), !dbg !223
  br label %if.end, !dbg !223

if.end:                                           ; preds = %if.then, %for.body3
  br label %for.inc, !dbg !224

for.inc:                                          ; preds = %if.end
  %13 = load i32* %j, align 4, !dbg !225
  %inc = add nsw i32 %13, 1, !dbg !225
  store i32 %inc, i32* %j, align 4, !dbg !225
  br label %for.cond1, !dbg !226

for.end:                                          ; preds = %for.cond1
  br label %for.inc8, !dbg !227

for.inc8:                                         ; preds = %for.end
  %14 = load i32* %i, align 4, !dbg !228
  %inc9 = add nsw i32 %14, 1, !dbg !228
  store i32 %inc9, i32* %i, align 4, !dbg !228
  br label %for.cond, !dbg !229

for.end10:                                        ; preds = %for.cond
  %15 = load %struct._IO_FILE** @stderr, align 8, !dbg !230
  %call11 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)), !dbg !231
  ret void, !dbg !232
}

; Function Attrs: nounwind
declare void @free(i8*) #4

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

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

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\000\00\000\00\001", !1, !2, !3, !10, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c] [DW_LANG_C99]
!1 = !{!"trmm.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm"}
!2 = !{}
!3 = !{!4, !9, !6}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!5 = !{!"0x1\00\000\0067108864\0064\000\000\000", null, null, !6, !7, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 67108864, align 64, offset 0] [from double]
!6 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!7 = !{!8, !8}
!8 = !{!"0x21\000\001024"}                        ; [ DW_TAG_subrange_type ] [0, 1023]
!9 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = !{!11, !19, !25, !28}
!11 = !{!"0x2e\00main\00main\00\0077\000\001\000\000\00256\000\0078", !1, !12, !13, null, i32 (i32, i8**)* @main, null, null, !2} ; [ DW_TAG_subprogram ] [line 77] [def] [scope 78] [main]
!12 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!13 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !14, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = !{!15, !15, !16}
!15 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!16 = !{!"0xf\00\000\0064\0064\000\000", null, null, !17} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!17 = !{!"0xf\00\000\0064\0064\000\000", null, null, !18} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!18 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!19 = !{!"0x2e\00print_array\00print_array\00\0042\001\001\000\000\00256\000\0044", !1, !12, !20, null, void (i32, [1024 x double]*)* @print_array, null, null, !2} ; [ DW_TAG_subprogram ] [line 42] [local] [def] [scope 44] [print_array]
!20 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !21, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!21 = !{null, !15, !22}
!22 = !{!"0xf\00\000\0064\0064\000\000", null, null, !23} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!23 = !{!"0x1\00\000\0065536\0064\000\000\000", null, null, !6, !24, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 65536, align 64, offset 0] [from double]
!24 = !{!8}
!25 = !{!"0x2e\00kernel_trmm\00kernel_trmm\00\0059\001\001\000\000\00256\000\0063", !1, !12, !26, null, void (i32, double, [1024 x double]*, [1024 x double]*)* @kernel_trmm, null, null, !2} ; [ DW_TAG_subprogram ] [line 59] [local] [def] [scope 63] [kernel_trmm]
!26 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !27, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!27 = !{null, !15, !6, !22, !22}
!28 = !{!"0x2e\00init_array\00init_array\00\0023\001\001\000\000\00256\000\0027", !1, !12, !29, null, void (i32, double*, [1024 x double]*, [1024 x double]*)* @init_array, null, null, !2} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [scope 27] [init_array]
!29 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !30, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!30 = !{null, !15, !31, !22, !22}
!31 = !{!"0xf\00\000\0064\0064\000\000", null, null, !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!32 = !{i32 2, !"Dwarf Version", i32 4}
!33 = !{i32 2, !"Debug Info Version", i32 2}
!34 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!35 = !{!"0x101\00argc\0016777293\000", !11, !12, !15} ; [ DW_TAG_arg_variable ] [argc] [line 77]
!36 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!37 = !MDLocation(line: 77, column: 14, scope: !11)
!38 = !{!"0x101\00argv\0033554509\000", !11, !12, !16} ; [ DW_TAG_arg_variable ] [argv] [line 77]
!39 = !MDLocation(line: 77, column: 27, scope: !11)
!40 = !{!"0x100\00ni\0080\000", !11, !12, !15}    ; [ DW_TAG_auto_variable ] [ni] [line 80]
!41 = !MDLocation(line: 80, column: 7, scope: !11)
!42 = !{!"0x100\00alpha\0083\000", !11, !12, !6}  ; [ DW_TAG_auto_variable ] [alpha] [line 83]
!43 = !MDLocation(line: 83, column: 13, scope: !11)
!44 = !{!"0x100\00A\0084\000", !11, !12, !4}      ; [ DW_TAG_auto_variable ] [A] [line 84]
!45 = !MDLocation(line: 84, column: 3, scope: !11)
!46 = !{!"0x100\00B\0085\000", !11, !12, !4}      ; [ DW_TAG_auto_variable ] [B] [line 85]
!47 = !MDLocation(line: 85, column: 3, scope: !11)
!48 = !MDLocation(line: 88, column: 15, scope: !11)
!49 = !MDLocation(line: 88, column: 27, scope: !11)
!50 = !MDLocation(line: 88, column: 47, scope: !11)
!51 = !MDLocation(line: 88, column: 3, scope: !11)
!52 = !MDLocation(line: 94, column: 16, scope: !11)
!53 = !MDLocation(line: 94, column: 20, scope: !11)
!54 = !MDLocation(line: 94, column: 27, scope: !11)
!55 = !MDLocation(line: 94, column: 47, scope: !11)
!56 = !MDLocation(line: 94, column: 3, scope: !11)
!57 = !MDLocation(line: 102, column: 3, scope: !58)
!58 = !{!"0xb\00102\003\000", !1, !11}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!59 = !MDLocation(line: 102, column: 3, scope: !11)
!60 = !MDLocation(line: 102, column: 3, scope: !61)
!61 = !{!"0xb\001", !1, !58}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!62 = !MDLocation(line: 102, column: 3, scope: !63)
!63 = !{!"0xb\002", !1, !58}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!64 = !MDLocation(line: 105, column: 3, scope: !11)
!65 = !MDLocation(line: 106, column: 3, scope: !11)
!66 = !MDLocation(line: 108, column: 3, scope: !11)
!67 = !{!"0x101\00ni\0016777239\000", !28, !12, !15} ; [ DW_TAG_arg_variable ] [ni] [line 23]
!68 = !MDLocation(line: 23, column: 21, scope: !28)
!69 = !{!"0x101\00alpha\0033554456\000", !28, !12, !31} ; [ DW_TAG_arg_variable ] [alpha] [line 24]
!70 = !MDLocation(line: 24, column: 14, scope: !28)
!71 = !{!"0x101\00A\0050331673\000", !28, !12, !22} ; [ DW_TAG_arg_variable ] [A] [line 25]
!72 = !MDLocation(line: 25, column: 13, scope: !28)
!73 = !{!"0x101\00B\0067108890\000", !28, !12, !22} ; [ DW_TAG_arg_variable ] [B] [line 26]
!74 = !MDLocation(line: 26, column: 13, scope: !28)
!75 = !{!"0x100\00i\0028\000", !28, !12, !15}     ; [ DW_TAG_auto_variable ] [i] [line 28]
!76 = !MDLocation(line: 28, column: 7, scope: !28)
!77 = !{!"0x100\00j\0028\000", !28, !12, !15}     ; [ DW_TAG_auto_variable ] [j] [line 28]
!78 = !MDLocation(line: 28, column: 10, scope: !28)
!79 = !MDLocation(line: 30, column: 4, scope: !28)
!80 = !MDLocation(line: 30, column: 3, scope: !28)
!81 = !MDLocation(line: 31, column: 8, scope: !82)
!82 = !{!"0xb\0031\003\0013", !1, !28}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!83 = !MDLocation(line: 31, column: 15, scope: !84)
!84 = !{!"0xb\002", !1, !85}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!85 = !{!"0xb\001", !1, !86}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!86 = !{!"0xb\0031\003\0014", !1, !82}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!87 = !MDLocation(line: 31, column: 19, scope: !86)
!88 = !MDLocation(line: 31, column: 15, scope: !86)
!89 = !MDLocation(line: 31, column: 3, scope: !82)
!90 = !MDLocation(line: 32, column: 10, scope: !91)
!91 = !{!"0xb\0032\005\0015", !1, !86}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!92 = !MDLocation(line: 32, column: 17, scope: !93)
!93 = !{!"0xb\002", !1, !94}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!94 = !{!"0xb\001", !1, !95}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!95 = !{!"0xb\0032\005\0016", !1, !91}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!96 = !MDLocation(line: 32, column: 21, scope: !95)
!97 = !MDLocation(line: 32, column: 17, scope: !95)
!98 = !MDLocation(line: 32, column: 5, scope: !91)
!99 = !MDLocation(line: 33, column: 30, scope: !100)
!100 = !{!"0xb\0032\0030\0017", !1, !95}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!101 = !MDLocation(line: 33, column: 18, scope: !100)
!102 = !MDLocation(line: 33, column: 32, scope: !100)
!103 = !MDLocation(line: 33, column: 37, scope: !100)
!104 = !MDLocation(line: 33, column: 17, scope: !100)
!105 = !MDLocation(line: 33, column: 12, scope: !100)
!106 = !MDLocation(line: 33, column: 7, scope: !100)
!107 = !MDLocation(line: 33, column: 9, scope: !100)
!108 = !MDLocation(line: 34, column: 30, scope: !100)
!109 = !MDLocation(line: 34, column: 18, scope: !100)
!110 = !MDLocation(line: 34, column: 32, scope: !100)
!111 = !MDLocation(line: 34, column: 37, scope: !100)
!112 = !MDLocation(line: 34, column: 17, scope: !100)
!113 = !MDLocation(line: 34, column: 12, scope: !100)
!114 = !MDLocation(line: 34, column: 7, scope: !100)
!115 = !MDLocation(line: 34, column: 9, scope: !100)
!116 = !MDLocation(line: 35, column: 5, scope: !100)
!117 = !MDLocation(line: 32, column: 25, scope: !95)
!118 = !MDLocation(line: 32, column: 5, scope: !95)
!119 = !MDLocation(line: 35, column: 5, scope: !91)
!120 = !MDLocation(line: 31, column: 23, scope: !86)
!121 = !MDLocation(line: 31, column: 3, scope: !86)
!122 = !MDLocation(line: 36, column: 1, scope: !28)
!123 = !{!"0x101\00ni\0016777275\000", !25, !12, !15} ; [ DW_TAG_arg_variable ] [ni] [line 59]
!124 = !MDLocation(line: 59, column: 22, scope: !25)
!125 = !{!"0x101\00alpha\0033554492\000", !25, !12, !6} ; [ DW_TAG_arg_variable ] [alpha] [line 60]
!126 = !MDLocation(line: 60, column: 14, scope: !25)
!127 = !{!"0x101\00A\0050331709\000", !25, !12, !22} ; [ DW_TAG_arg_variable ] [A] [line 61]
!128 = !MDLocation(line: 61, column: 14, scope: !25)
!129 = !{!"0x101\00B\0067108926\000", !25, !12, !22} ; [ DW_TAG_arg_variable ] [B] [line 62]
!130 = !MDLocation(line: 62, column: 14, scope: !25)
!131 = !{!"0x100\00i\0064\000", !25, !12, !15}    ; [ DW_TAG_auto_variable ] [i] [line 64]
!132 = !MDLocation(line: 64, column: 7, scope: !25)
!133 = !{!"0x100\00j\0064\000", !25, !12, !15}    ; [ DW_TAG_auto_variable ] [j] [line 64]
!134 = !MDLocation(line: 64, column: 10, scope: !25)
!135 = !{!"0x100\00k\0064\000", !25, !12, !15}    ; [ DW_TAG_auto_variable ] [k] [line 64]
!136 = !MDLocation(line: 64, column: 13, scope: !25)
!137 = !MDLocation(line: 68, column: 8, scope: !138)
!138 = !{!"0xb\0068\003\007", !1, !25}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!139 = !MDLocation(line: 68, column: 15, scope: !140)
!140 = !{!"0xb\002", !1, !141}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!141 = !{!"0xb\001", !1, !142}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!142 = !{!"0xb\0068\003\008", !1, !138}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!143 = !MDLocation(line: 68, column: 19, scope: !142)
!144 = !MDLocation(line: 68, column: 15, scope: !142)
!145 = !MDLocation(line: 68, column: 3, scope: !138)
!146 = !MDLocation(line: 69, column: 10, scope: !147)
!147 = !{!"0xb\0069\005\009", !1, !142}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!148 = !MDLocation(line: 69, column: 17, scope: !149)
!149 = !{!"0xb\002", !1, !150}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!150 = !{!"0xb\001", !1, !151}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!151 = !{!"0xb\0069\005\0010", !1, !147}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!152 = !MDLocation(line: 69, column: 21, scope: !151)
!153 = !MDLocation(line: 69, column: 17, scope: !151)
!154 = !MDLocation(line: 69, column: 5, scope: !147)
!155 = !MDLocation(line: 70, column: 12, scope: !156)
!156 = !{!"0xb\0070\007\0011", !1, !151}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!157 = !MDLocation(line: 70, column: 19, scope: !158)
!158 = !{!"0xb\002", !1, !159}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!159 = !{!"0xb\001", !1, !160}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!160 = !{!"0xb\0070\007\0012", !1, !156}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!161 = !MDLocation(line: 70, column: 23, scope: !160)
!162 = !MDLocation(line: 70, column: 19, scope: !160)
!163 = !MDLocation(line: 70, column: 7, scope: !156)
!164 = !MDLocation(line: 71, column: 20, scope: !160)
!165 = !MDLocation(line: 71, column: 33, scope: !160)
!166 = !MDLocation(line: 71, column: 28, scope: !160)
!167 = !MDLocation(line: 71, column: 30, scope: !160)
!168 = !MDLocation(line: 71, column: 43, scope: !160)
!169 = !MDLocation(line: 71, column: 38, scope: !160)
!170 = !MDLocation(line: 71, column: 40, scope: !160)
!171 = !MDLocation(line: 71, column: 14, scope: !160)
!172 = !MDLocation(line: 71, column: 9, scope: !160)
!173 = !MDLocation(line: 71, column: 11, scope: !160)
!174 = !MDLocation(line: 70, column: 26, scope: !160)
!175 = !MDLocation(line: 70, column: 7, scope: !160)
!176 = !MDLocation(line: 71, column: 44, scope: !156)
!177 = !MDLocation(line: 69, column: 25, scope: !151)
!178 = !MDLocation(line: 69, column: 5, scope: !151)
!179 = !MDLocation(line: 71, column: 44, scope: !147)
!180 = !MDLocation(line: 68, column: 23, scope: !142)
!181 = !MDLocation(line: 68, column: 3, scope: !142)
!182 = !MDLocation(line: 74, column: 1, scope: !25)
!183 = !{!"0x101\00ni\0016777258\000", !19, !12, !15} ; [ DW_TAG_arg_variable ] [ni] [line 42]
!184 = !MDLocation(line: 42, column: 22, scope: !19)
!185 = !{!"0x101\00B\0033554475\000", !19, !12, !22} ; [ DW_TAG_arg_variable ] [B] [line 43]
!186 = !MDLocation(line: 43, column: 14, scope: !19)
!187 = !{!"0x100\00i\0045\000", !19, !12, !15}    ; [ DW_TAG_auto_variable ] [i] [line 45]
!188 = !MDLocation(line: 45, column: 7, scope: !19)
!189 = !{!"0x100\00j\0045\000", !19, !12, !15}    ; [ DW_TAG_auto_variable ] [j] [line 45]
!190 = !MDLocation(line: 45, column: 10, scope: !19)
!191 = !MDLocation(line: 47, column: 8, scope: !192)
!192 = !{!"0xb\0047\003\001", !1, !19}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!193 = !MDLocation(line: 47, column: 15, scope: !194)
!194 = !{!"0xb\002", !1, !195}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!195 = !{!"0xb\001", !1, !196}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!196 = !{!"0xb\0047\003\002", !1, !192}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!197 = !MDLocation(line: 47, column: 19, scope: !196)
!198 = !MDLocation(line: 47, column: 15, scope: !196)
!199 = !MDLocation(line: 47, column: 3, scope: !192)
!200 = !MDLocation(line: 48, column: 10, scope: !201)
!201 = !{!"0xb\0048\005\003", !1, !196}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!202 = !MDLocation(line: 48, column: 17, scope: !203)
!203 = !{!"0xb\002", !1, !204}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!204 = !{!"0xb\001", !1, !205}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!205 = !{!"0xb\0048\005\004", !1, !201}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!206 = !MDLocation(line: 48, column: 21, scope: !205)
!207 = !MDLocation(line: 48, column: 17, scope: !205)
!208 = !MDLocation(line: 48, column: 5, scope: !201)
!209 = !MDLocation(line: 49, column: 11, scope: !210)
!210 = !{!"0xb\0048\0030\005", !1, !205}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!211 = !MDLocation(line: 49, column: 46, scope: !210)
!212 = !MDLocation(line: 49, column: 41, scope: !210)
!213 = !MDLocation(line: 49, column: 43, scope: !210)
!214 = !MDLocation(line: 49, column: 2, scope: !210)
!215 = !MDLocation(line: 50, column: 7, scope: !216)
!216 = !{!"0xb\0050\006\006", !1, !210}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!217 = !MDLocation(line: 50, column: 11, scope: !216)
!218 = !MDLocation(line: 50, column: 16, scope: !216)
!219 = !MDLocation(line: 50, column: 6, scope: !216)
!220 = !MDLocation(line: 50, column: 6, scope: !210)
!221 = !MDLocation(line: 50, column: 39, scope: !222)
!222 = !{!"0xb\001", !1, !216}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trmm/trmm.c]
!223 = !MDLocation(line: 50, column: 30, scope: !216)
!224 = !MDLocation(line: 51, column: 5, scope: !210)
!225 = !MDLocation(line: 48, column: 25, scope: !205)
!226 = !MDLocation(line: 48, column: 5, scope: !205)
!227 = !MDLocation(line: 51, column: 5, scope: !201)
!228 = !MDLocation(line: 47, column: 23, scope: !196)
!229 = !MDLocation(line: 47, column: 3, scope: !196)
!230 = !MDLocation(line: 52, column: 12, scope: !19)
!231 = !MDLocation(line: 52, column: 3, scope: !19)
!232 = !MDLocation(line: 53, column: 1, scope: !19)
