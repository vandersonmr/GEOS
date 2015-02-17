; ModuleID = 'gramschmidt.c'
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
  %nj = alloca i32, align 4
  %A = alloca [512 x [512 x double]]*, align 8
  %R = alloca [512 x [512 x double]]*, align 8
  %Q = alloca [512 x [512 x double]]*, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !30, metadata !31), !dbg !32
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !33, metadata !31), !dbg !34
  call void @llvm.dbg.declare(metadata i32* %ni, metadata !35, metadata !31), !dbg !36
  store i32 512, i32* %ni, align 4, !dbg !36
  call void @llvm.dbg.declare(metadata i32* %nj, metadata !37, metadata !31), !dbg !38
  store i32 512, i32* %nj, align 4, !dbg !38
  call void @llvm.dbg.declare(metadata [512 x [512 x double]]** %A, metadata !39, metadata !31), !dbg !40
  %call = call i8* @polybench_alloc_data(i32 262144, i32 8), !dbg !40
  %0 = bitcast i8* %call to [512 x [512 x double]]*, !dbg !40
  store [512 x [512 x double]]* %0, [512 x [512 x double]]** %A, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata [512 x [512 x double]]** %R, metadata !41, metadata !31), !dbg !42
  %call1 = call i8* @polybench_alloc_data(i32 262144, i32 8), !dbg !42
  %1 = bitcast i8* %call1 to [512 x [512 x double]]*, !dbg !42
  store [512 x [512 x double]]* %1, [512 x [512 x double]]** %R, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata [512 x [512 x double]]** %Q, metadata !43, metadata !31), !dbg !44
  %call2 = call i8* @polybench_alloc_data(i32 262144, i32 8), !dbg !44
  %2 = bitcast i8* %call2 to [512 x [512 x double]]*, !dbg !44
  store [512 x [512 x double]]* %2, [512 x [512 x double]]** %Q, align 8, !dbg !44
  %3 = load i32* %ni, align 4, !dbg !45
  %4 = load i32* %nj, align 4, !dbg !46
  %5 = load [512 x [512 x double]]** %A, align 8, !dbg !47
  %arraydecay = getelementptr inbounds [512 x [512 x double]]* %5, i32 0, i32 0, !dbg !47
  %6 = load [512 x [512 x double]]** %R, align 8, !dbg !48
  %arraydecay3 = getelementptr inbounds [512 x [512 x double]]* %6, i32 0, i32 0, !dbg !48
  %7 = load [512 x [512 x double]]** %Q, align 8, !dbg !49
  %arraydecay4 = getelementptr inbounds [512 x [512 x double]]* %7, i32 0, i32 0, !dbg !49
  call void @init_array(i32 %3, i32 %4, [512 x double]* %arraydecay, [512 x double]* %arraydecay3, [512 x double]* %arraydecay4), !dbg !50
  %8 = load i32* %ni, align 4, !dbg !51
  %9 = load i32* %nj, align 4, !dbg !52
  %10 = load [512 x [512 x double]]** %A, align 8, !dbg !53
  %arraydecay5 = getelementptr inbounds [512 x [512 x double]]* %10, i32 0, i32 0, !dbg !53
  %11 = load [512 x [512 x double]]** %R, align 8, !dbg !54
  %arraydecay6 = getelementptr inbounds [512 x [512 x double]]* %11, i32 0, i32 0, !dbg !54
  %12 = load [512 x [512 x double]]** %Q, align 8, !dbg !55
  %arraydecay7 = getelementptr inbounds [512 x [512 x double]]* %12, i32 0, i32 0, !dbg !55
  call void @kernel_gramschmidt(i32 %8, i32 %9, [512 x double]* %arraydecay5, [512 x double]* %arraydecay6, [512 x double]* %arraydecay7), !dbg !56
  %13 = load i32* %argc.addr, align 4, !dbg !57
  %cmp = icmp sgt i32 %13, 42, !dbg !57
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !59

land.lhs.true:                                    ; preds = %entry
  %14 = load i8*** %argv.addr, align 8, !dbg !60
  %arrayidx = getelementptr inbounds i8** %14, i64 0, !dbg !60
  %15 = load i8** %arrayidx, align 8, !dbg !60
  %call8 = call i32 @strcmp(i8* %15, i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0)) #5, !dbg !60
  %tobool = icmp ne i32 %call8, 0, !dbg !59
  br i1 %tobool, label %if.end, label %if.then, !dbg !59

if.then:                                          ; preds = %land.lhs.true
  %16 = load i32* %ni, align 4, !dbg !62
  %17 = load i32* %nj, align 4, !dbg !62
  %18 = load [512 x [512 x double]]** %A, align 8, !dbg !62
  %arraydecay9 = getelementptr inbounds [512 x [512 x double]]* %18, i32 0, i32 0, !dbg !62
  %19 = load [512 x [512 x double]]** %R, align 8, !dbg !62
  %arraydecay10 = getelementptr inbounds [512 x [512 x double]]* %19, i32 0, i32 0, !dbg !62
  %20 = load [512 x [512 x double]]** %Q, align 8, !dbg !62
  %arraydecay11 = getelementptr inbounds [512 x [512 x double]]* %20, i32 0, i32 0, !dbg !62
  call void @print_array(i32 %16, i32 %17, [512 x double]* %arraydecay9, [512 x double]* %arraydecay10, [512 x double]* %arraydecay11), !dbg !62
  br label %if.end, !dbg !62

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %21 = load [512 x [512 x double]]** %A, align 8, !dbg !64
  %22 = bitcast [512 x [512 x double]]* %21 to i8*, !dbg !64
  call void @free(i8* %22) #6, !dbg !64
  %23 = load [512 x [512 x double]]** %R, align 8, !dbg !65
  %24 = bitcast [512 x [512 x double]]* %23 to i8*, !dbg !65
  call void @free(i8* %24) #6, !dbg !65
  %25 = load [512 x [512 x double]]** %Q, align 8, !dbg !66
  %26 = bitcast [512 x [512 x double]]* %25 to i8*, !dbg !66
  call void @free(i8* %26) #6, !dbg !66
  ret i32 0, !dbg !67
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i8* @polybench_alloc_data(i32, i32) #2

; Function Attrs: nounwind uwtable
define internal void @init_array(i32 %ni, i32 %nj, [512 x double]* %A, [512 x double]* %R, [512 x double]* %Q) #0 {
entry:
  %ni.addr = alloca i32, align 4
  %nj.addr = alloca i32, align 4
  %A.addr = alloca [512 x double]*, align 8
  %R.addr = alloca [512 x double]*, align 8
  %Q.addr = alloca [512 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %ni, i32* %ni.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ni.addr, metadata !68, metadata !31), !dbg !69
  store i32 %nj, i32* %nj.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nj.addr, metadata !70, metadata !31), !dbg !71
  store [512 x double]* %A, [512 x double]** %A.addr, align 8
  call void @llvm.dbg.declare(metadata [512 x double]** %A.addr, metadata !72, metadata !31), !dbg !73
  store [512 x double]* %R, [512 x double]** %R.addr, align 8
  call void @llvm.dbg.declare(metadata [512 x double]** %R.addr, metadata !74, metadata !31), !dbg !75
  store [512 x double]* %Q, [512 x double]** %Q.addr, align 8
  call void @llvm.dbg.declare(metadata [512 x double]** %Q.addr, metadata !76, metadata !31), !dbg !77
  call void @llvm.dbg.declare(metadata i32* %i, metadata !78, metadata !31), !dbg !79
  call void @llvm.dbg.declare(metadata i32* %j, metadata !80, metadata !31), !dbg !81
  store i32 0, i32* %i, align 4, !dbg !82
  br label %for.cond, !dbg !82

for.cond:                                         ; preds = %for.inc17, %entry
  %0 = load i32* %i, align 4, !dbg !84
  %1 = load i32* %ni.addr, align 4, !dbg !88
  %cmp = icmp slt i32 %0, %1, !dbg !89
  br i1 %cmp, label %for.body, label %for.end19, !dbg !90

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !91
  br label %for.cond1, !dbg !91

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32* %j, align 4, !dbg !93
  %3 = load i32* %nj.addr, align 4, !dbg !97
  %cmp2 = icmp slt i32 %2, %3, !dbg !98
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !99

for.body3:                                        ; preds = %for.cond1
  %4 = load i32* %i, align 4, !dbg !100
  %conv = sitofp i32 %4 to double, !dbg !102
  %5 = load i32* %j, align 4, !dbg !103
  %conv4 = sitofp i32 %5 to double, !dbg !103
  %mul = fmul double %conv, %conv4, !dbg !102
  %6 = load i32* %ni.addr, align 4, !dbg !104
  %conv5 = sitofp i32 %6 to double, !dbg !104
  %div = fdiv double %mul, %conv5, !dbg !105
  %7 = load i32* %j, align 4, !dbg !106
  %idxprom = sext i32 %7 to i64, !dbg !107
  %8 = load i32* %i, align 4, !dbg !108
  %idxprom6 = sext i32 %8 to i64, !dbg !107
  %9 = load [512 x double]** %A.addr, align 8, !dbg !107
  %arrayidx = getelementptr inbounds [512 x double]* %9, i64 %idxprom6, !dbg !107
  %arrayidx7 = getelementptr inbounds [512 x double]* %arrayidx, i32 0, i64 %idxprom, !dbg !107
  store double %div, double* %arrayidx7, align 8, !dbg !107
  %10 = load i32* %i, align 4, !dbg !109
  %conv8 = sitofp i32 %10 to double, !dbg !110
  %11 = load i32* %j, align 4, !dbg !111
  %add = add nsw i32 %11, 1, !dbg !111
  %conv9 = sitofp i32 %add to double, !dbg !112
  %mul10 = fmul double %conv8, %conv9, !dbg !110
  %12 = load i32* %nj.addr, align 4, !dbg !113
  %conv11 = sitofp i32 %12 to double, !dbg !113
  %div12 = fdiv double %mul10, %conv11, !dbg !114
  %13 = load i32* %j, align 4, !dbg !115
  %idxprom13 = sext i32 %13 to i64, !dbg !116
  %14 = load i32* %i, align 4, !dbg !117
  %idxprom14 = sext i32 %14 to i64, !dbg !116
  %15 = load [512 x double]** %Q.addr, align 8, !dbg !116
  %arrayidx15 = getelementptr inbounds [512 x double]* %15, i64 %idxprom14, !dbg !116
  %arrayidx16 = getelementptr inbounds [512 x double]* %arrayidx15, i32 0, i64 %idxprom13, !dbg !116
  store double %div12, double* %arrayidx16, align 8, !dbg !116
  br label %for.inc, !dbg !118

for.inc:                                          ; preds = %for.body3
  %16 = load i32* %j, align 4, !dbg !119
  %inc = add nsw i32 %16, 1, !dbg !119
  store i32 %inc, i32* %j, align 4, !dbg !119
  br label %for.cond1, !dbg !120

for.end:                                          ; preds = %for.cond1
  br label %for.inc17, !dbg !121

for.inc17:                                        ; preds = %for.end
  %17 = load i32* %i, align 4, !dbg !122
  %inc18 = add nsw i32 %17, 1, !dbg !122
  store i32 %inc18, i32* %i, align 4, !dbg !122
  br label %for.cond, !dbg !123

for.end19:                                        ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !124
  br label %for.cond20, !dbg !124

for.cond20:                                       ; preds = %for.inc41, %for.end19
  %18 = load i32* %i, align 4, !dbg !126
  %19 = load i32* %nj.addr, align 4, !dbg !130
  %cmp21 = icmp slt i32 %18, %19, !dbg !131
  br i1 %cmp21, label %for.body23, label %for.end43, !dbg !132

for.body23:                                       ; preds = %for.cond20
  store i32 0, i32* %j, align 4, !dbg !133
  br label %for.cond24, !dbg !133

for.cond24:                                       ; preds = %for.inc38, %for.body23
  %20 = load i32* %j, align 4, !dbg !135
  %21 = load i32* %nj.addr, align 4, !dbg !139
  %cmp25 = icmp slt i32 %20, %21, !dbg !140
  br i1 %cmp25, label %for.body27, label %for.end40, !dbg !141

for.body27:                                       ; preds = %for.cond24
  %22 = load i32* %i, align 4, !dbg !142
  %conv28 = sitofp i32 %22 to double, !dbg !143
  %23 = load i32* %j, align 4, !dbg !144
  %add29 = add nsw i32 %23, 2, !dbg !144
  %conv30 = sitofp i32 %add29 to double, !dbg !145
  %mul31 = fmul double %conv28, %conv30, !dbg !143
  %24 = load i32* %nj.addr, align 4, !dbg !146
  %conv32 = sitofp i32 %24 to double, !dbg !146
  %div33 = fdiv double %mul31, %conv32, !dbg !147
  %25 = load i32* %j, align 4, !dbg !148
  %idxprom34 = sext i32 %25 to i64, !dbg !149
  %26 = load i32* %i, align 4, !dbg !150
  %idxprom35 = sext i32 %26 to i64, !dbg !149
  %27 = load [512 x double]** %R.addr, align 8, !dbg !149
  %arrayidx36 = getelementptr inbounds [512 x double]* %27, i64 %idxprom35, !dbg !149
  %arrayidx37 = getelementptr inbounds [512 x double]* %arrayidx36, i32 0, i64 %idxprom34, !dbg !149
  store double %div33, double* %arrayidx37, align 8, !dbg !149
  br label %for.inc38, !dbg !149

for.inc38:                                        ; preds = %for.body27
  %28 = load i32* %j, align 4, !dbg !151
  %inc39 = add nsw i32 %28, 1, !dbg !151
  store i32 %inc39, i32* %j, align 4, !dbg !151
  br label %for.cond24, !dbg !152

for.end40:                                        ; preds = %for.cond24
  br label %for.inc41, !dbg !153

for.inc41:                                        ; preds = %for.end40
  %29 = load i32* %i, align 4, !dbg !154
  %inc42 = add nsw i32 %29, 1, !dbg !154
  store i32 %inc42, i32* %i, align 4, !dbg !154
  br label %for.cond20, !dbg !155

for.end43:                                        ; preds = %for.cond20
  ret void, !dbg !156
}

; Function Attrs: nounwind uwtable
define internal void @kernel_gramschmidt(i32 %ni, i32 %nj, [512 x double]* %A, [512 x double]* %R, [512 x double]* %Q) #0 {
entry:
  %ni.addr = alloca i32, align 4
  %nj.addr = alloca i32, align 4
  %A.addr = alloca [512 x double]*, align 8
  %R.addr = alloca [512 x double]*, align 8
  %Q.addr = alloca [512 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %nrm = alloca double, align 8
  store i32 %ni, i32* %ni.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ni.addr, metadata !157, metadata !31), !dbg !158
  store i32 %nj, i32* %nj.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nj.addr, metadata !159, metadata !31), !dbg !160
  store [512 x double]* %A, [512 x double]** %A.addr, align 8
  call void @llvm.dbg.declare(metadata [512 x double]** %A.addr, metadata !161, metadata !31), !dbg !162
  store [512 x double]* %R, [512 x double]** %R.addr, align 8
  call void @llvm.dbg.declare(metadata [512 x double]** %R.addr, metadata !163, metadata !31), !dbg !164
  store [512 x double]* %Q, [512 x double]** %Q.addr, align 8
  call void @llvm.dbg.declare(metadata [512 x double]** %Q.addr, metadata !165, metadata !31), !dbg !166
  call void @llvm.dbg.declare(metadata i32* %i, metadata !167, metadata !31), !dbg !168
  call void @llvm.dbg.declare(metadata i32* %j, metadata !169, metadata !31), !dbg !170
  call void @llvm.dbg.declare(metadata i32* %k, metadata !171, metadata !31), !dbg !172
  call void @llvm.dbg.declare(metadata double* %nrm, metadata !173, metadata !31), !dbg !174
  store i32 0, i32* %k, align 4, !dbg !175
  br label %for.cond, !dbg !175

for.cond:                                         ; preds = %for.inc86, %entry
  %0 = load i32* %k, align 4, !dbg !177
  %1 = load i32* %nj.addr, align 4, !dbg !181
  %cmp = icmp slt i32 %0, %1, !dbg !182
  br i1 %cmp, label %for.body, label %for.end88, !dbg !183

for.body:                                         ; preds = %for.cond
  store double 0.000000e+00, double* %nrm, align 8, !dbg !184
  store i32 0, i32* %i, align 4, !dbg !186
  br label %for.cond1, !dbg !186

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32* %i, align 4, !dbg !188
  %3 = load i32* %ni.addr, align 4, !dbg !192
  %cmp2 = icmp slt i32 %2, %3, !dbg !193
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !194

for.body3:                                        ; preds = %for.cond1
  %4 = load i32* %k, align 4, !dbg !195
  %idxprom = sext i32 %4 to i64, !dbg !196
  %5 = load i32* %i, align 4, !dbg !197
  %idxprom4 = sext i32 %5 to i64, !dbg !196
  %6 = load [512 x double]** %A.addr, align 8, !dbg !196
  %arrayidx = getelementptr inbounds [512 x double]* %6, i64 %idxprom4, !dbg !196
  %arrayidx5 = getelementptr inbounds [512 x double]* %arrayidx, i32 0, i64 %idxprom, !dbg !196
  %7 = load double* %arrayidx5, align 8, !dbg !196
  %8 = load i32* %k, align 4, !dbg !198
  %idxprom6 = sext i32 %8 to i64, !dbg !199
  %9 = load i32* %i, align 4, !dbg !200
  %idxprom7 = sext i32 %9 to i64, !dbg !199
  %10 = load [512 x double]** %A.addr, align 8, !dbg !199
  %arrayidx8 = getelementptr inbounds [512 x double]* %10, i64 %idxprom7, !dbg !199
  %arrayidx9 = getelementptr inbounds [512 x double]* %arrayidx8, i32 0, i64 %idxprom6, !dbg !199
  %11 = load double* %arrayidx9, align 8, !dbg !199
  %mul = fmul double %7, %11, !dbg !196
  %12 = load double* %nrm, align 8, !dbg !201
  %add = fadd double %12, %mul, !dbg !201
  store double %add, double* %nrm, align 8, !dbg !201
  br label %for.inc, !dbg !201

for.inc:                                          ; preds = %for.body3
  %13 = load i32* %i, align 4, !dbg !202
  %inc = add nsw i32 %13, 1, !dbg !202
  store i32 %inc, i32* %i, align 4, !dbg !202
  br label %for.cond1, !dbg !203

for.end:                                          ; preds = %for.cond1
  %14 = load double* %nrm, align 8, !dbg !204
  %call = call double @sqrt(double %14) #6, !dbg !205
  %15 = load i32* %k, align 4, !dbg !206
  %idxprom10 = sext i32 %15 to i64, !dbg !207
  %16 = load i32* %k, align 4, !dbg !208
  %idxprom11 = sext i32 %16 to i64, !dbg !207
  %17 = load [512 x double]** %R.addr, align 8, !dbg !207
  %arrayidx12 = getelementptr inbounds [512 x double]* %17, i64 %idxprom11, !dbg !207
  %arrayidx13 = getelementptr inbounds [512 x double]* %arrayidx12, i32 0, i64 %idxprom10, !dbg !207
  store double %call, double* %arrayidx13, align 8, !dbg !207
  store i32 0, i32* %i, align 4, !dbg !209
  br label %for.cond14, !dbg !209

for.cond14:                                       ; preds = %for.inc29, %for.end
  %18 = load i32* %i, align 4, !dbg !211
  %19 = load i32* %ni.addr, align 4, !dbg !215
  %cmp15 = icmp slt i32 %18, %19, !dbg !216
  br i1 %cmp15, label %for.body16, label %for.end31, !dbg !217

for.body16:                                       ; preds = %for.cond14
  %20 = load i32* %k, align 4, !dbg !218
  %idxprom17 = sext i32 %20 to i64, !dbg !219
  %21 = load i32* %i, align 4, !dbg !220
  %idxprom18 = sext i32 %21 to i64, !dbg !219
  %22 = load [512 x double]** %A.addr, align 8, !dbg !219
  %arrayidx19 = getelementptr inbounds [512 x double]* %22, i64 %idxprom18, !dbg !219
  %arrayidx20 = getelementptr inbounds [512 x double]* %arrayidx19, i32 0, i64 %idxprom17, !dbg !219
  %23 = load double* %arrayidx20, align 8, !dbg !219
  %24 = load i32* %k, align 4, !dbg !221
  %idxprom21 = sext i32 %24 to i64, !dbg !222
  %25 = load i32* %k, align 4, !dbg !223
  %idxprom22 = sext i32 %25 to i64, !dbg !222
  %26 = load [512 x double]** %R.addr, align 8, !dbg !222
  %arrayidx23 = getelementptr inbounds [512 x double]* %26, i64 %idxprom22, !dbg !222
  %arrayidx24 = getelementptr inbounds [512 x double]* %arrayidx23, i32 0, i64 %idxprom21, !dbg !222
  %27 = load double* %arrayidx24, align 8, !dbg !222
  %div = fdiv double %23, %27, !dbg !219
  %28 = load i32* %k, align 4, !dbg !224
  %idxprom25 = sext i32 %28 to i64, !dbg !225
  %29 = load i32* %i, align 4, !dbg !226
  %idxprom26 = sext i32 %29 to i64, !dbg !225
  %30 = load [512 x double]** %Q.addr, align 8, !dbg !225
  %arrayidx27 = getelementptr inbounds [512 x double]* %30, i64 %idxprom26, !dbg !225
  %arrayidx28 = getelementptr inbounds [512 x double]* %arrayidx27, i32 0, i64 %idxprom25, !dbg !225
  store double %div, double* %arrayidx28, align 8, !dbg !225
  br label %for.inc29, !dbg !225

for.inc29:                                        ; preds = %for.body16
  %31 = load i32* %i, align 4, !dbg !227
  %inc30 = add nsw i32 %31, 1, !dbg !227
  store i32 %inc30, i32* %i, align 4, !dbg !227
  br label %for.cond14, !dbg !228

for.end31:                                        ; preds = %for.cond14
  %32 = load i32* %k, align 4, !dbg !229
  %add32 = add nsw i32 %32, 1, !dbg !229
  store i32 %add32, i32* %j, align 4, !dbg !231
  br label %for.cond33, !dbg !231

for.cond33:                                       ; preds = %for.inc83, %for.end31
  %33 = load i32* %j, align 4, !dbg !232
  %34 = load i32* %nj.addr, align 4, !dbg !236
  %cmp34 = icmp slt i32 %33, %34, !dbg !237
  br i1 %cmp34, label %for.body35, label %for.end85, !dbg !238

for.body35:                                       ; preds = %for.cond33
  %35 = load i32* %j, align 4, !dbg !239
  %idxprom36 = sext i32 %35 to i64, !dbg !241
  %36 = load i32* %k, align 4, !dbg !242
  %idxprom37 = sext i32 %36 to i64, !dbg !241
  %37 = load [512 x double]** %R.addr, align 8, !dbg !241
  %arrayidx38 = getelementptr inbounds [512 x double]* %37, i64 %idxprom37, !dbg !241
  %arrayidx39 = getelementptr inbounds [512 x double]* %arrayidx38, i32 0, i64 %idxprom36, !dbg !241
  store double 0.000000e+00, double* %arrayidx39, align 8, !dbg !241
  store i32 0, i32* %i, align 4, !dbg !243
  br label %for.cond40, !dbg !243

for.cond40:                                       ; preds = %for.inc57, %for.body35
  %38 = load i32* %i, align 4, !dbg !245
  %39 = load i32* %ni.addr, align 4, !dbg !249
  %cmp41 = icmp slt i32 %38, %39, !dbg !250
  br i1 %cmp41, label %for.body42, label %for.end59, !dbg !251

for.body42:                                       ; preds = %for.cond40
  %40 = load i32* %k, align 4, !dbg !252
  %idxprom43 = sext i32 %40 to i64, !dbg !253
  %41 = load i32* %i, align 4, !dbg !254
  %idxprom44 = sext i32 %41 to i64, !dbg !253
  %42 = load [512 x double]** %Q.addr, align 8, !dbg !253
  %arrayidx45 = getelementptr inbounds [512 x double]* %42, i64 %idxprom44, !dbg !253
  %arrayidx46 = getelementptr inbounds [512 x double]* %arrayidx45, i32 0, i64 %idxprom43, !dbg !253
  %43 = load double* %arrayidx46, align 8, !dbg !253
  %44 = load i32* %j, align 4, !dbg !255
  %idxprom47 = sext i32 %44 to i64, !dbg !256
  %45 = load i32* %i, align 4, !dbg !257
  %idxprom48 = sext i32 %45 to i64, !dbg !256
  %46 = load [512 x double]** %A.addr, align 8, !dbg !256
  %arrayidx49 = getelementptr inbounds [512 x double]* %46, i64 %idxprom48, !dbg !256
  %arrayidx50 = getelementptr inbounds [512 x double]* %arrayidx49, i32 0, i64 %idxprom47, !dbg !256
  %47 = load double* %arrayidx50, align 8, !dbg !256
  %mul51 = fmul double %43, %47, !dbg !253
  %48 = load i32* %j, align 4, !dbg !258
  %idxprom52 = sext i32 %48 to i64, !dbg !259
  %49 = load i32* %k, align 4, !dbg !260
  %idxprom53 = sext i32 %49 to i64, !dbg !259
  %50 = load [512 x double]** %R.addr, align 8, !dbg !259
  %arrayidx54 = getelementptr inbounds [512 x double]* %50, i64 %idxprom53, !dbg !259
  %arrayidx55 = getelementptr inbounds [512 x double]* %arrayidx54, i32 0, i64 %idxprom52, !dbg !259
  %51 = load double* %arrayidx55, align 8, !dbg !259
  %add56 = fadd double %51, %mul51, !dbg !259
  store double %add56, double* %arrayidx55, align 8, !dbg !259
  br label %for.inc57, !dbg !259

for.inc57:                                        ; preds = %for.body42
  %52 = load i32* %i, align 4, !dbg !261
  %inc58 = add nsw i32 %52, 1, !dbg !261
  store i32 %inc58, i32* %i, align 4, !dbg !261
  br label %for.cond40, !dbg !262

for.end59:                                        ; preds = %for.cond40
  store i32 0, i32* %i, align 4, !dbg !263
  br label %for.cond60, !dbg !263

for.cond60:                                       ; preds = %for.inc80, %for.end59
  %53 = load i32* %i, align 4, !dbg !265
  %54 = load i32* %ni.addr, align 4, !dbg !269
  %cmp61 = icmp slt i32 %53, %54, !dbg !270
  br i1 %cmp61, label %for.body62, label %for.end82, !dbg !271

for.body62:                                       ; preds = %for.cond60
  %55 = load i32* %j, align 4, !dbg !272
  %idxprom63 = sext i32 %55 to i64, !dbg !273
  %56 = load i32* %i, align 4, !dbg !274
  %idxprom64 = sext i32 %56 to i64, !dbg !273
  %57 = load [512 x double]** %A.addr, align 8, !dbg !273
  %arrayidx65 = getelementptr inbounds [512 x double]* %57, i64 %idxprom64, !dbg !273
  %arrayidx66 = getelementptr inbounds [512 x double]* %arrayidx65, i32 0, i64 %idxprom63, !dbg !273
  %58 = load double* %arrayidx66, align 8, !dbg !273
  %59 = load i32* %k, align 4, !dbg !275
  %idxprom67 = sext i32 %59 to i64, !dbg !276
  %60 = load i32* %i, align 4, !dbg !277
  %idxprom68 = sext i32 %60 to i64, !dbg !276
  %61 = load [512 x double]** %Q.addr, align 8, !dbg !276
  %arrayidx69 = getelementptr inbounds [512 x double]* %61, i64 %idxprom68, !dbg !276
  %arrayidx70 = getelementptr inbounds [512 x double]* %arrayidx69, i32 0, i64 %idxprom67, !dbg !276
  %62 = load double* %arrayidx70, align 8, !dbg !276
  %63 = load i32* %j, align 4, !dbg !278
  %idxprom71 = sext i32 %63 to i64, !dbg !279
  %64 = load i32* %k, align 4, !dbg !280
  %idxprom72 = sext i32 %64 to i64, !dbg !279
  %65 = load [512 x double]** %R.addr, align 8, !dbg !279
  %arrayidx73 = getelementptr inbounds [512 x double]* %65, i64 %idxprom72, !dbg !279
  %arrayidx74 = getelementptr inbounds [512 x double]* %arrayidx73, i32 0, i64 %idxprom71, !dbg !279
  %66 = load double* %arrayidx74, align 8, !dbg !279
  %mul75 = fmul double %62, %66, !dbg !276
  %sub = fsub double %58, %mul75, !dbg !273
  %67 = load i32* %j, align 4, !dbg !281
  %idxprom76 = sext i32 %67 to i64, !dbg !282
  %68 = load i32* %i, align 4, !dbg !283
  %idxprom77 = sext i32 %68 to i64, !dbg !282
  %69 = load [512 x double]** %A.addr, align 8, !dbg !282
  %arrayidx78 = getelementptr inbounds [512 x double]* %69, i64 %idxprom77, !dbg !282
  %arrayidx79 = getelementptr inbounds [512 x double]* %arrayidx78, i32 0, i64 %idxprom76, !dbg !282
  store double %sub, double* %arrayidx79, align 8, !dbg !282
  br label %for.inc80, !dbg !282

for.inc80:                                        ; preds = %for.body62
  %70 = load i32* %i, align 4, !dbg !284
  %inc81 = add nsw i32 %70, 1, !dbg !284
  store i32 %inc81, i32* %i, align 4, !dbg !284
  br label %for.cond60, !dbg !285

for.end82:                                        ; preds = %for.cond60
  br label %for.inc83, !dbg !286

for.inc83:                                        ; preds = %for.end82
  %71 = load i32* %j, align 4, !dbg !287
  %inc84 = add nsw i32 %71, 1, !dbg !287
  store i32 %inc84, i32* %j, align 4, !dbg !287
  br label %for.cond33, !dbg !288

for.end85:                                        ; preds = %for.cond33
  br label %for.inc86, !dbg !289

for.inc86:                                        ; preds = %for.end85
  %72 = load i32* %k, align 4, !dbg !290
  %inc87 = add nsw i32 %72, 1, !dbg !290
  store i32 %inc87, i32* %k, align 4, !dbg !290
  br label %for.cond, !dbg !291

for.end88:                                        ; preds = %for.cond
  ret void, !dbg !292
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #3

; Function Attrs: nounwind uwtable
define internal void @print_array(i32 %ni, i32 %nj, [512 x double]* %A, [512 x double]* %R, [512 x double]* %Q) #0 {
entry:
  %ni.addr = alloca i32, align 4
  %nj.addr = alloca i32, align 4
  %A.addr = alloca [512 x double]*, align 8
  %R.addr = alloca [512 x double]*, align 8
  %Q.addr = alloca [512 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %ni, i32* %ni.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ni.addr, metadata !293, metadata !31), !dbg !294
  store i32 %nj, i32* %nj.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nj.addr, metadata !295, metadata !31), !dbg !296
  store [512 x double]* %A, [512 x double]** %A.addr, align 8
  call void @llvm.dbg.declare(metadata [512 x double]** %A.addr, metadata !297, metadata !31), !dbg !298
  store [512 x double]* %R, [512 x double]** %R.addr, align 8
  call void @llvm.dbg.declare(metadata [512 x double]** %R.addr, metadata !299, metadata !31), !dbg !300
  store [512 x double]* %Q, [512 x double]** %Q.addr, align 8
  call void @llvm.dbg.declare(metadata [512 x double]** %Q.addr, metadata !301, metadata !31), !dbg !302
  call void @llvm.dbg.declare(metadata i32* %i, metadata !303, metadata !31), !dbg !304
  call void @llvm.dbg.declare(metadata i32* %j, metadata !305, metadata !31), !dbg !306
  store i32 0, i32* %i, align 4, !dbg !307
  br label %for.cond, !dbg !307

for.cond:                                         ; preds = %for.inc8, %entry
  %0 = load i32* %i, align 4, !dbg !309
  %1 = load i32* %ni.addr, align 4, !dbg !313
  %cmp = icmp slt i32 %0, %1, !dbg !314
  br i1 %cmp, label %for.body, label %for.end10, !dbg !315

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !316
  br label %for.cond1, !dbg !316

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32* %j, align 4, !dbg !318
  %3 = load i32* %nj.addr, align 4, !dbg !322
  %cmp2 = icmp slt i32 %2, %3, !dbg !323
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !324

for.body3:                                        ; preds = %for.cond1
  %4 = load %struct._IO_FILE** @stderr, align 8, !dbg !325
  %5 = load i32* %j, align 4, !dbg !327
  %idxprom = sext i32 %5 to i64, !dbg !328
  %6 = load i32* %i, align 4, !dbg !329
  %idxprom4 = sext i32 %6 to i64, !dbg !328
  %7 = load [512 x double]** %A.addr, align 8, !dbg !328
  %arrayidx = getelementptr inbounds [512 x double]* %7, i64 %idxprom4, !dbg !328
  %arrayidx5 = getelementptr inbounds [512 x double]* %arrayidx, i32 0, i64 %idxprom, !dbg !328
  %8 = load double* %arrayidx5, align 8, !dbg !328
  %call = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([8 x i8]* @.str1, i32 0, i32 0), double %8), !dbg !330
  %9 = load i32* %i, align 4, !dbg !331
  %rem = srem i32 %9, 20, !dbg !331
  %cmp6 = icmp eq i32 %rem, 0, !dbg !331
  br i1 %cmp6, label %if.then, label %if.end, !dbg !333

if.then:                                          ; preds = %for.body3
  %10 = load %struct._IO_FILE** @stderr, align 8, !dbg !334
  %call7 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)), !dbg !336
  br label %if.end, !dbg !336

if.end:                                           ; preds = %if.then, %for.body3
  br label %for.inc, !dbg !337

for.inc:                                          ; preds = %if.end
  %11 = load i32* %j, align 4, !dbg !338
  %inc = add nsw i32 %11, 1, !dbg !338
  store i32 %inc, i32* %j, align 4, !dbg !338
  br label %for.cond1, !dbg !339

for.end:                                          ; preds = %for.cond1
  br label %for.inc8, !dbg !340

for.inc8:                                         ; preds = %for.end
  %12 = load i32* %i, align 4, !dbg !341
  %inc9 = add nsw i32 %12, 1, !dbg !341
  store i32 %inc9, i32* %i, align 4, !dbg !341
  br label %for.cond, !dbg !342

for.end10:                                        ; preds = %for.cond
  %13 = load %struct._IO_FILE** @stderr, align 8, !dbg !343
  %call11 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)), !dbg !344
  store i32 0, i32* %i, align 4, !dbg !345
  br label %for.cond12, !dbg !345

for.cond12:                                       ; preds = %for.inc31, %for.end10
  %14 = load i32* %i, align 4, !dbg !347
  %15 = load i32* %nj.addr, align 4, !dbg !351
  %cmp13 = icmp slt i32 %14, %15, !dbg !352
  br i1 %cmp13, label %for.body14, label %for.end33, !dbg !353

for.body14:                                       ; preds = %for.cond12
  store i32 0, i32* %j, align 4, !dbg !354
  br label %for.cond15, !dbg !354

for.cond15:                                       ; preds = %for.inc28, %for.body14
  %16 = load i32* %j, align 4, !dbg !356
  %17 = load i32* %nj.addr, align 4, !dbg !360
  %cmp16 = icmp slt i32 %16, %17, !dbg !361
  br i1 %cmp16, label %for.body17, label %for.end30, !dbg !362

for.body17:                                       ; preds = %for.cond15
  %18 = load %struct._IO_FILE** @stderr, align 8, !dbg !363
  %19 = load i32* %j, align 4, !dbg !365
  %idxprom18 = sext i32 %19 to i64, !dbg !366
  %20 = load i32* %i, align 4, !dbg !367
  %idxprom19 = sext i32 %20 to i64, !dbg !366
  %21 = load [512 x double]** %R.addr, align 8, !dbg !366
  %arrayidx20 = getelementptr inbounds [512 x double]* %21, i64 %idxprom19, !dbg !366
  %arrayidx21 = getelementptr inbounds [512 x double]* %arrayidx20, i32 0, i64 %idxprom18, !dbg !366
  %22 = load double* %arrayidx21, align 8, !dbg !366
  %call22 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8]* @.str1, i32 0, i32 0), double %22), !dbg !368
  %23 = load i32* %i, align 4, !dbg !369
  %rem23 = srem i32 %23, 20, !dbg !369
  %cmp24 = icmp eq i32 %rem23, 0, !dbg !369
  br i1 %cmp24, label %if.then25, label %if.end27, !dbg !371

if.then25:                                        ; preds = %for.body17
  %24 = load %struct._IO_FILE** @stderr, align 8, !dbg !372
  %call26 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)), !dbg !374
  br label %if.end27, !dbg !374

if.end27:                                         ; preds = %if.then25, %for.body17
  br label %for.inc28, !dbg !375

for.inc28:                                        ; preds = %if.end27
  %25 = load i32* %j, align 4, !dbg !376
  %inc29 = add nsw i32 %25, 1, !dbg !376
  store i32 %inc29, i32* %j, align 4, !dbg !376
  br label %for.cond15, !dbg !377

for.end30:                                        ; preds = %for.cond15
  br label %for.inc31, !dbg !378

for.inc31:                                        ; preds = %for.end30
  %26 = load i32* %i, align 4, !dbg !379
  %inc32 = add nsw i32 %26, 1, !dbg !379
  store i32 %inc32, i32* %i, align 4, !dbg !379
  br label %for.cond12, !dbg !380

for.end33:                                        ; preds = %for.cond12
  %27 = load %struct._IO_FILE** @stderr, align 8, !dbg !381
  %call34 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)), !dbg !382
  store i32 0, i32* %i, align 4, !dbg !383
  br label %for.cond35, !dbg !383

for.cond35:                                       ; preds = %for.inc54, %for.end33
  %28 = load i32* %i, align 4, !dbg !385
  %29 = load i32* %ni.addr, align 4, !dbg !389
  %cmp36 = icmp slt i32 %28, %29, !dbg !390
  br i1 %cmp36, label %for.body37, label %for.end56, !dbg !391

for.body37:                                       ; preds = %for.cond35
  store i32 0, i32* %j, align 4, !dbg !392
  br label %for.cond38, !dbg !392

for.cond38:                                       ; preds = %for.inc51, %for.body37
  %30 = load i32* %j, align 4, !dbg !394
  %31 = load i32* %nj.addr, align 4, !dbg !398
  %cmp39 = icmp slt i32 %30, %31, !dbg !399
  br i1 %cmp39, label %for.body40, label %for.end53, !dbg !400

for.body40:                                       ; preds = %for.cond38
  %32 = load %struct._IO_FILE** @stderr, align 8, !dbg !401
  %33 = load i32* %j, align 4, !dbg !403
  %idxprom41 = sext i32 %33 to i64, !dbg !404
  %34 = load i32* %i, align 4, !dbg !405
  %idxprom42 = sext i32 %34 to i64, !dbg !404
  %35 = load [512 x double]** %Q.addr, align 8, !dbg !404
  %arrayidx43 = getelementptr inbounds [512 x double]* %35, i64 %idxprom42, !dbg !404
  %arrayidx44 = getelementptr inbounds [512 x double]* %arrayidx43, i32 0, i64 %idxprom41, !dbg !404
  %36 = load double* %arrayidx44, align 8, !dbg !404
  %call45 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %32, i8* getelementptr inbounds ([8 x i8]* @.str1, i32 0, i32 0), double %36), !dbg !406
  %37 = load i32* %i, align 4, !dbg !407
  %rem46 = srem i32 %37, 20, !dbg !407
  %cmp47 = icmp eq i32 %rem46, 0, !dbg !407
  br i1 %cmp47, label %if.then48, label %if.end50, !dbg !409

if.then48:                                        ; preds = %for.body40
  %38 = load %struct._IO_FILE** @stderr, align 8, !dbg !410
  %call49 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %38, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)), !dbg !412
  br label %if.end50, !dbg !412

if.end50:                                         ; preds = %if.then48, %for.body40
  br label %for.inc51, !dbg !413

for.inc51:                                        ; preds = %if.end50
  %39 = load i32* %j, align 4, !dbg !414
  %inc52 = add nsw i32 %39, 1, !dbg !414
  store i32 %inc52, i32* %j, align 4, !dbg !414
  br label %for.cond38, !dbg !415

for.end53:                                        ; preds = %for.cond38
  br label %for.inc54, !dbg !416

for.inc54:                                        ; preds = %for.end53
  %40 = load i32* %i, align 4, !dbg !417
  %inc55 = add nsw i32 %40, 1, !dbg !417
  store i32 %inc55, i32* %i, align 4, !dbg !417
  br label %for.cond35, !dbg !418

for.end56:                                        ; preds = %for.cond35
  %41 = load %struct._IO_FILE** @stderr, align 8, !dbg !419
  %call57 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %41, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)), !dbg !420
  ret void, !dbg !421
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
!llvm.module.flags = !{!27, !28}
!llvm.ident = !{!29}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\000\00\000\00\001", !1, !2, !3, !10, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c] [DW_LANG_C99]
!1 = !{!"gramschmidt.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt"}
!2 = !{}
!3 = !{!4, !9, !6}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!5 = !{!"0x1\00\000\0016777216\0064\000\000\000", null, null, !6, !7, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16777216, align 64, offset 0] [from double]
!6 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!7 = !{!8, !8}
!8 = !{!"0x21\000\00512"}                         ; [ DW_TAG_subrange_type ] [0, 511]
!9 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = !{!11, !19, !25, !26}
!11 = !{!"0x2e\00main\00main\00\00107\000\001\000\000\00256\000\00108", !1, !12, !13, null, i32 (i32, i8**)* @main, null, null, !2} ; [ DW_TAG_subprogram ] [line 107] [def] [scope 108] [main]
!12 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!13 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !14, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = !{!15, !15, !16}
!15 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!16 = !{!"0xf\00\000\0064\0064\000\000", null, null, !17} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!17 = !{!"0xf\00\000\0064\0064\000\000", null, null, !18} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!18 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!19 = !{!"0x2e\00print_array\00print_array\00\0044\001\001\000\000\00256\000\0048", !1, !12, !20, null, void (i32, i32, [512 x double]*, [512 x double]*, [512 x double]*)* @print_array, null, null, !2} ; [ DW_TAG_subprogram ] [line 44] [local] [def] [scope 48] [print_array]
!20 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !21, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!21 = !{null, !15, !15, !22, !22, !22}
!22 = !{!"0xf\00\000\0064\0064\000\000", null, null, !23} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!23 = !{!"0x1\00\000\0032768\0064\000\000\000", null, null, !6, !24, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 32768, align 64, offset 0] [from double]
!24 = !{!8}
!25 = !{!"0x2e\00kernel_gramschmidt\00kernel_gramschmidt\00\0075\001\001\000\000\00256\000\0079", !1, !12, !20, null, void (i32, i32, [512 x double]*, [512 x double]*, [512 x double]*)* @kernel_gramschmidt, null, null, !2} ; [ DW_TAG_subprogram ] [line 75] [local] [def] [scope 79] [kernel_gramschmidt]
!26 = !{!"0x2e\00init_array\00init_array\00\0023\001\001\000\000\00256\000\0027", !1, !12, !20, null, void (i32, i32, [512 x double]*, [512 x double]*, [512 x double]*)* @init_array, null, null, !2} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [scope 27] [init_array]
!27 = !{i32 2, !"Dwarf Version", i32 4}
!28 = !{i32 2, !"Debug Info Version", i32 2}
!29 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!30 = !{!"0x101\00argc\0016777323\000", !11, !12, !15} ; [ DW_TAG_arg_variable ] [argc] [line 107]
!31 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!32 = !MDLocation(line: 107, column: 14, scope: !11)
!33 = !{!"0x101\00argv\0033554539\000", !11, !12, !16} ; [ DW_TAG_arg_variable ] [argv] [line 107]
!34 = !MDLocation(line: 107, column: 27, scope: !11)
!35 = !{!"0x100\00ni\00110\000", !11, !12, !15}   ; [ DW_TAG_auto_variable ] [ni] [line 110]
!36 = !MDLocation(line: 110, column: 7, scope: !11)
!37 = !{!"0x100\00nj\00111\000", !11, !12, !15}   ; [ DW_TAG_auto_variable ] [nj] [line 111]
!38 = !MDLocation(line: 111, column: 7, scope: !11)
!39 = !{!"0x100\00A\00114\000", !11, !12, !4}     ; [ DW_TAG_auto_variable ] [A] [line 114]
!40 = !MDLocation(line: 114, column: 3, scope: !11)
!41 = !{!"0x100\00R\00115\000", !11, !12, !4}     ; [ DW_TAG_auto_variable ] [R] [line 115]
!42 = !MDLocation(line: 115, column: 3, scope: !11)
!43 = !{!"0x100\00Q\00116\000", !11, !12, !4}     ; [ DW_TAG_auto_variable ] [Q] [line 116]
!44 = !MDLocation(line: 116, column: 3, scope: !11)
!45 = !MDLocation(line: 119, column: 15, scope: !11)
!46 = !MDLocation(line: 119, column: 19, scope: !11)
!47 = !MDLocation(line: 120, column: 8, scope: !11)
!48 = !MDLocation(line: 121, column: 8, scope: !11)
!49 = !MDLocation(line: 122, column: 8, scope: !11)
!50 = !MDLocation(line: 119, column: 3, scope: !11)
!51 = !MDLocation(line: 128, column: 23, scope: !11)
!52 = !MDLocation(line: 128, column: 27, scope: !11)
!53 = !MDLocation(line: 129, column: 9, scope: !11)
!54 = !MDLocation(line: 130, column: 9, scope: !11)
!55 = !MDLocation(line: 131, column: 9, scope: !11)
!56 = !MDLocation(line: 128, column: 3, scope: !11)
!57 = !MDLocation(line: 139, column: 3, scope: !58)
!58 = !{!"0xb\00139\003\000", !1, !11}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!59 = !MDLocation(line: 139, column: 3, scope: !11)
!60 = !MDLocation(line: 139, column: 3, scope: !61)
!61 = !{!"0xb\001", !1, !58}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!62 = !MDLocation(line: 139, column: 3, scope: !63)
!63 = !{!"0xb\002", !1, !58}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!64 = !MDLocation(line: 142, column: 3, scope: !11)
!65 = !MDLocation(line: 143, column: 3, scope: !11)
!66 = !MDLocation(line: 144, column: 3, scope: !11)
!67 = !MDLocation(line: 146, column: 3, scope: !11)
!68 = !{!"0x101\00ni\0016777239\000", !26, !12, !15} ; [ DW_TAG_arg_variable ] [ni] [line 23]
!69 = !MDLocation(line: 23, column: 21, scope: !26)
!70 = !{!"0x101\00nj\0033554455\000", !26, !12, !15} ; [ DW_TAG_arg_variable ] [nj] [line 23]
!71 = !MDLocation(line: 23, column: 29, scope: !26)
!72 = !{!"0x101\00A\0050331672\000", !26, !12, !22} ; [ DW_TAG_arg_variable ] [A] [line 24]
!73 = !MDLocation(line: 24, column: 13, scope: !26)
!74 = !{!"0x101\00R\0067108889\000", !26, !12, !22} ; [ DW_TAG_arg_variable ] [R] [line 25]
!75 = !MDLocation(line: 25, column: 13, scope: !26)
!76 = !{!"0x101\00Q\0083886106\000", !26, !12, !22} ; [ DW_TAG_arg_variable ] [Q] [line 26]
!77 = !MDLocation(line: 26, column: 13, scope: !26)
!78 = !{!"0x100\00i\0028\000", !26, !12, !15}     ; [ DW_TAG_auto_variable ] [i] [line 28]
!79 = !MDLocation(line: 28, column: 7, scope: !26)
!80 = !{!"0x100\00j\0028\000", !26, !12, !15}     ; [ DW_TAG_auto_variable ] [j] [line 28]
!81 = !MDLocation(line: 28, column: 10, scope: !26)
!82 = !MDLocation(line: 30, column: 8, scope: !83)
!83 = !{!"0xb\0030\003\0033", !1, !26}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!84 = !MDLocation(line: 30, column: 15, scope: !85)
!85 = !{!"0xb\002", !1, !86}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!86 = !{!"0xb\001", !1, !87}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!87 = !{!"0xb\0030\003\0034", !1, !83}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!88 = !MDLocation(line: 30, column: 19, scope: !87)
!89 = !MDLocation(line: 30, column: 15, scope: !87)
!90 = !MDLocation(line: 30, column: 3, scope: !83)
!91 = !MDLocation(line: 31, column: 10, scope: !92)
!92 = !{!"0xb\0031\005\0035", !1, !87}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!93 = !MDLocation(line: 31, column: 17, scope: !94)
!94 = !{!"0xb\002", !1, !95}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!95 = !{!"0xb\001", !1, !96}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!96 = !{!"0xb\0031\005\0036", !1, !92}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!97 = !MDLocation(line: 31, column: 21, scope: !96)
!98 = !MDLocation(line: 31, column: 17, scope: !96)
!99 = !MDLocation(line: 31, column: 5, scope: !92)
!100 = !MDLocation(line: 32, column: 30, scope: !101)
!101 = !{!"0xb\0031\0030\0037", !1, !96}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!102 = !MDLocation(line: 32, column: 18, scope: !101)
!103 = !MDLocation(line: 32, column: 32, scope: !101)
!104 = !MDLocation(line: 32, column: 37, scope: !101)
!105 = !MDLocation(line: 32, column: 17, scope: !101)
!106 = !MDLocation(line: 32, column: 12, scope: !101)
!107 = !MDLocation(line: 32, column: 7, scope: !101)
!108 = !MDLocation(line: 32, column: 9, scope: !101)
!109 = !MDLocation(line: 33, column: 30, scope: !101)
!110 = !MDLocation(line: 33, column: 18, scope: !101)
!111 = !MDLocation(line: 33, column: 33, scope: !101)
!112 = !MDLocation(line: 33, column: 32, scope: !101)
!113 = !MDLocation(line: 33, column: 41, scope: !101)
!114 = !MDLocation(line: 33, column: 17, scope: !101)
!115 = !MDLocation(line: 33, column: 12, scope: !101)
!116 = !MDLocation(line: 33, column: 7, scope: !101)
!117 = !MDLocation(line: 33, column: 9, scope: !101)
!118 = !MDLocation(line: 34, column: 5, scope: !101)
!119 = !MDLocation(line: 31, column: 25, scope: !96)
!120 = !MDLocation(line: 31, column: 5, scope: !96)
!121 = !MDLocation(line: 34, column: 5, scope: !92)
!122 = !MDLocation(line: 30, column: 23, scope: !87)
!123 = !MDLocation(line: 30, column: 3, scope: !87)
!124 = !MDLocation(line: 35, column: 8, scope: !125)
!125 = !{!"0xb\0035\003\0038", !1, !26}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!126 = !MDLocation(line: 35, column: 15, scope: !127)
!127 = !{!"0xb\002", !1, !128}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!128 = !{!"0xb\001", !1, !129}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!129 = !{!"0xb\0035\003\0039", !1, !125}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!130 = !MDLocation(line: 35, column: 19, scope: !129)
!131 = !MDLocation(line: 35, column: 15, scope: !129)
!132 = !MDLocation(line: 35, column: 3, scope: !125)
!133 = !MDLocation(line: 36, column: 10, scope: !134)
!134 = !{!"0xb\0036\005\0040", !1, !129}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!135 = !MDLocation(line: 36, column: 17, scope: !136)
!136 = !{!"0xb\002", !1, !137}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!137 = !{!"0xb\001", !1, !138}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!138 = !{!"0xb\0036\005\0041", !1, !134}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!139 = !MDLocation(line: 36, column: 21, scope: !138)
!140 = !MDLocation(line: 36, column: 17, scope: !138)
!141 = !MDLocation(line: 36, column: 5, scope: !134)
!142 = !MDLocation(line: 37, column: 30, scope: !138)
!143 = !MDLocation(line: 37, column: 18, scope: !138)
!144 = !MDLocation(line: 37, column: 33, scope: !138)
!145 = !MDLocation(line: 37, column: 32, scope: !138)
!146 = !MDLocation(line: 37, column: 41, scope: !138)
!147 = !MDLocation(line: 37, column: 17, scope: !138)
!148 = !MDLocation(line: 37, column: 12, scope: !138)
!149 = !MDLocation(line: 37, column: 7, scope: !138)
!150 = !MDLocation(line: 37, column: 9, scope: !138)
!151 = !MDLocation(line: 36, column: 25, scope: !138)
!152 = !MDLocation(line: 36, column: 5, scope: !138)
!153 = !MDLocation(line: 37, column: 41, scope: !134)
!154 = !MDLocation(line: 35, column: 23, scope: !129)
!155 = !MDLocation(line: 35, column: 3, scope: !129)
!156 = !MDLocation(line: 38, column: 1, scope: !26)
!157 = !{!"0x101\00ni\0016777291\000", !25, !12, !15} ; [ DW_TAG_arg_variable ] [ni] [line 75]
!158 = !MDLocation(line: 75, column: 29, scope: !25)
!159 = !{!"0x101\00nj\0033554507\000", !25, !12, !15} ; [ DW_TAG_arg_variable ] [nj] [line 75]
!160 = !MDLocation(line: 75, column: 37, scope: !25)
!161 = !{!"0x101\00A\0050331724\000", !25, !12, !22} ; [ DW_TAG_arg_variable ] [A] [line 76]
!162 = !MDLocation(line: 76, column: 14, scope: !25)
!163 = !{!"0x101\00R\0067108941\000", !25, !12, !22} ; [ DW_TAG_arg_variable ] [R] [line 77]
!164 = !MDLocation(line: 77, column: 14, scope: !25)
!165 = !{!"0x101\00Q\0083886158\000", !25, !12, !22} ; [ DW_TAG_arg_variable ] [Q] [line 78]
!166 = !MDLocation(line: 78, column: 14, scope: !25)
!167 = !{!"0x100\00i\0080\000", !25, !12, !15}    ; [ DW_TAG_auto_variable ] [i] [line 80]
!168 = !MDLocation(line: 80, column: 7, scope: !25)
!169 = !{!"0x100\00j\0080\000", !25, !12, !15}    ; [ DW_TAG_auto_variable ] [j] [line 80]
!170 = !MDLocation(line: 80, column: 10, scope: !25)
!171 = !{!"0x100\00k\0080\000", !25, !12, !15}    ; [ DW_TAG_auto_variable ] [k] [line 80]
!172 = !MDLocation(line: 80, column: 13, scope: !25)
!173 = !{!"0x100\00nrm\0082\000", !25, !12, !6}   ; [ DW_TAG_auto_variable ] [nrm] [line 82]
!174 = !MDLocation(line: 82, column: 13, scope: !25)
!175 = !MDLocation(line: 85, column: 8, scope: !176)
!176 = !{!"0xb\0085\003\0019", !1, !25}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!177 = !MDLocation(line: 85, column: 15, scope: !178)
!178 = !{!"0xb\002", !1, !179}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!179 = !{!"0xb\001", !1, !180}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!180 = !{!"0xb\0085\003\0020", !1, !176}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!181 = !MDLocation(line: 85, column: 19, scope: !180)
!182 = !MDLocation(line: 85, column: 15, scope: !180)
!183 = !MDLocation(line: 85, column: 3, scope: !176)
!184 = !MDLocation(line: 87, column: 7, scope: !185)
!185 = !{!"0xb\0086\005\0021", !1, !180}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!186 = !MDLocation(line: 88, column: 12, scope: !187)
!187 = !{!"0xb\0088\007\0022", !1, !185}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!188 = !MDLocation(line: 88, column: 19, scope: !189)
!189 = !{!"0xb\002", !1, !190}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!190 = !{!"0xb\001", !1, !191}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!191 = !{!"0xb\0088\007\0023", !1, !187}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!192 = !MDLocation(line: 88, column: 23, scope: !191)
!193 = !MDLocation(line: 88, column: 19, scope: !191)
!194 = !MDLocation(line: 88, column: 7, scope: !187)
!195 = !MDLocation(line: 89, column: 21, scope: !191)
!196 = !MDLocation(line: 89, column: 16, scope: !191)
!197 = !MDLocation(line: 89, column: 18, scope: !191)
!198 = !MDLocation(line: 89, column: 31, scope: !191)
!199 = !MDLocation(line: 89, column: 26, scope: !191)
!200 = !MDLocation(line: 89, column: 28, scope: !191)
!201 = !MDLocation(line: 89, column: 9, scope: !191)
!202 = !MDLocation(line: 88, column: 27, scope: !191)
!203 = !MDLocation(line: 88, column: 7, scope: !191)
!204 = !MDLocation(line: 90, column: 22, scope: !185)
!205 = !MDLocation(line: 90, column: 17, scope: !185)
!206 = !MDLocation(line: 90, column: 12, scope: !185)
!207 = !MDLocation(line: 90, column: 7, scope: !185)
!208 = !MDLocation(line: 90, column: 9, scope: !185)
!209 = !MDLocation(line: 91, column: 12, scope: !210)
!210 = !{!"0xb\0091\007\0024", !1, !185}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!211 = !MDLocation(line: 91, column: 19, scope: !212)
!212 = !{!"0xb\002", !1, !213}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!213 = !{!"0xb\001", !1, !214}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!214 = !{!"0xb\0091\007\0025", !1, !210}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!215 = !MDLocation(line: 91, column: 23, scope: !214)
!216 = !MDLocation(line: 91, column: 19, scope: !214)
!217 = !MDLocation(line: 91, column: 7, scope: !210)
!218 = !MDLocation(line: 92, column: 24, scope: !214)
!219 = !MDLocation(line: 92, column: 19, scope: !214)
!220 = !MDLocation(line: 92, column: 21, scope: !214)
!221 = !MDLocation(line: 92, column: 34, scope: !214)
!222 = !MDLocation(line: 92, column: 29, scope: !214)
!223 = !MDLocation(line: 92, column: 31, scope: !214)
!224 = !MDLocation(line: 92, column: 14, scope: !214)
!225 = !MDLocation(line: 92, column: 9, scope: !214)
!226 = !MDLocation(line: 92, column: 11, scope: !214)
!227 = !MDLocation(line: 91, column: 27, scope: !214)
!228 = !MDLocation(line: 91, column: 7, scope: !214)
!229 = !MDLocation(line: 93, column: 16, scope: !230)
!230 = !{!"0xb\0093\007\0026", !1, !185}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!231 = !MDLocation(line: 93, column: 12, scope: !230)
!232 = !MDLocation(line: 93, column: 23, scope: !233)
!233 = !{!"0xb\002", !1, !234}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!234 = !{!"0xb\001", !1, !235}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!235 = !{!"0xb\0093\007\0027", !1, !230}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!236 = !MDLocation(line: 93, column: 27, scope: !235)
!237 = !MDLocation(line: 93, column: 23, scope: !235)
!238 = !MDLocation(line: 93, column: 7, scope: !230)
!239 = !MDLocation(line: 95, column: 9, scope: !240)
!240 = !{!"0xb\0094\002\0028", !1, !235}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!241 = !MDLocation(line: 95, column: 4, scope: !240)
!242 = !MDLocation(line: 95, column: 6, scope: !240)
!243 = !MDLocation(line: 96, column: 9, scope: !244)
!244 = !{!"0xb\0096\004\0029", !1, !240}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!245 = !MDLocation(line: 96, column: 16, scope: !246)
!246 = !{!"0xb\002", !1, !247}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!247 = !{!"0xb\001", !1, !248}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!248 = !{!"0xb\0096\004\0030", !1, !244}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!249 = !MDLocation(line: 96, column: 20, scope: !248)
!250 = !MDLocation(line: 96, column: 16, scope: !248)
!251 = !MDLocation(line: 96, column: 4, scope: !244)
!252 = !MDLocation(line: 97, column: 22, scope: !248)
!253 = !MDLocation(line: 97, column: 17, scope: !248)
!254 = !MDLocation(line: 97, column: 19, scope: !248)
!255 = !MDLocation(line: 97, column: 32, scope: !248)
!256 = !MDLocation(line: 97, column: 27, scope: !248)
!257 = !MDLocation(line: 97, column: 29, scope: !248)
!258 = !MDLocation(line: 97, column: 11, scope: !248)
!259 = !MDLocation(line: 97, column: 6, scope: !248)
!260 = !MDLocation(line: 97, column: 8, scope: !248)
!261 = !MDLocation(line: 96, column: 24, scope: !248)
!262 = !MDLocation(line: 96, column: 4, scope: !248)
!263 = !MDLocation(line: 98, column: 9, scope: !264)
!264 = !{!"0xb\0098\004\0031", !1, !240}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!265 = !MDLocation(line: 98, column: 16, scope: !266)
!266 = !{!"0xb\002", !1, !267}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!267 = !{!"0xb\001", !1, !268}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!268 = !{!"0xb\0098\004\0032", !1, !264}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!269 = !MDLocation(line: 98, column: 20, scope: !268)
!270 = !MDLocation(line: 98, column: 16, scope: !268)
!271 = !MDLocation(line: 98, column: 4, scope: !264)
!272 = !MDLocation(line: 99, column: 21, scope: !268)
!273 = !MDLocation(line: 99, column: 16, scope: !268)
!274 = !MDLocation(line: 99, column: 18, scope: !268)
!275 = !MDLocation(line: 99, column: 31, scope: !268)
!276 = !MDLocation(line: 99, column: 26, scope: !268)
!277 = !MDLocation(line: 99, column: 28, scope: !268)
!278 = !MDLocation(line: 99, column: 41, scope: !268)
!279 = !MDLocation(line: 99, column: 36, scope: !268)
!280 = !MDLocation(line: 99, column: 38, scope: !268)
!281 = !MDLocation(line: 99, column: 11, scope: !268)
!282 = !MDLocation(line: 99, column: 6, scope: !268)
!283 = !MDLocation(line: 99, column: 8, scope: !268)
!284 = !MDLocation(line: 98, column: 24, scope: !268)
!285 = !MDLocation(line: 98, column: 4, scope: !268)
!286 = !MDLocation(line: 100, column: 2, scope: !240)
!287 = !MDLocation(line: 93, column: 31, scope: !235)
!288 = !MDLocation(line: 93, column: 7, scope: !235)
!289 = !MDLocation(line: 101, column: 5, scope: !185)
!290 = !MDLocation(line: 85, column: 23, scope: !180)
!291 = !MDLocation(line: 85, column: 3, scope: !180)
!292 = !MDLocation(line: 104, column: 1, scope: !25)
!293 = !{!"0x101\00ni\0016777260\000", !19, !12, !15} ; [ DW_TAG_arg_variable ] [ni] [line 44]
!294 = !MDLocation(line: 44, column: 22, scope: !19)
!295 = !{!"0x101\00nj\0033554476\000", !19, !12, !15} ; [ DW_TAG_arg_variable ] [nj] [line 44]
!296 = !MDLocation(line: 44, column: 30, scope: !19)
!297 = !{!"0x101\00A\0050331693\000", !19, !12, !22} ; [ DW_TAG_arg_variable ] [A] [line 45]
!298 = !MDLocation(line: 45, column: 14, scope: !19)
!299 = !{!"0x101\00R\0067108910\000", !19, !12, !22} ; [ DW_TAG_arg_variable ] [R] [line 46]
!300 = !MDLocation(line: 46, column: 14, scope: !19)
!301 = !{!"0x101\00Q\0083886127\000", !19, !12, !22} ; [ DW_TAG_arg_variable ] [Q] [line 47]
!302 = !MDLocation(line: 47, column: 14, scope: !19)
!303 = !{!"0x100\00i\0049\000", !19, !12, !15}    ; [ DW_TAG_auto_variable ] [i] [line 49]
!304 = !MDLocation(line: 49, column: 7, scope: !19)
!305 = !{!"0x100\00j\0049\000", !19, !12, !15}    ; [ DW_TAG_auto_variable ] [j] [line 49]
!306 = !MDLocation(line: 49, column: 10, scope: !19)
!307 = !MDLocation(line: 51, column: 8, scope: !308)
!308 = !{!"0xb\0051\003\001", !1, !19}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!309 = !MDLocation(line: 51, column: 15, scope: !310)
!310 = !{!"0xb\002", !1, !311}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!311 = !{!"0xb\001", !1, !312}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!312 = !{!"0xb\0051\003\002", !1, !308}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!313 = !MDLocation(line: 51, column: 19, scope: !312)
!314 = !MDLocation(line: 51, column: 15, scope: !312)
!315 = !MDLocation(line: 51, column: 3, scope: !308)
!316 = !MDLocation(line: 52, column: 10, scope: !317)
!317 = !{!"0xb\0052\005\003", !1, !312}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!318 = !MDLocation(line: 52, column: 17, scope: !319)
!319 = !{!"0xb\002", !1, !320}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!320 = !{!"0xb\001", !1, !321}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!321 = !{!"0xb\0052\005\004", !1, !317}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!322 = !MDLocation(line: 52, column: 21, scope: !321)
!323 = !MDLocation(line: 52, column: 17, scope: !321)
!324 = !MDLocation(line: 52, column: 5, scope: !317)
!325 = !MDLocation(line: 53, column: 11, scope: !326)
!326 = !{!"0xb\0052\0030\005", !1, !321}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!327 = !MDLocation(line: 53, column: 46, scope: !326)
!328 = !MDLocation(line: 53, column: 41, scope: !326)
!329 = !MDLocation(line: 53, column: 43, scope: !326)
!330 = !MDLocation(line: 53, column: 2, scope: !326)
!331 = !MDLocation(line: 54, column: 6, scope: !332)
!332 = !{!"0xb\0054\006\006", !1, !326}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!333 = !MDLocation(line: 54, column: 6, scope: !326)
!334 = !MDLocation(line: 54, column: 28, scope: !335)
!335 = !{!"0xb\001", !1, !332}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!336 = !MDLocation(line: 54, column: 19, scope: !332)
!337 = !MDLocation(line: 55, column: 5, scope: !326)
!338 = !MDLocation(line: 52, column: 25, scope: !321)
!339 = !MDLocation(line: 52, column: 5, scope: !321)
!340 = !MDLocation(line: 55, column: 5, scope: !317)
!341 = !MDLocation(line: 51, column: 23, scope: !312)
!342 = !MDLocation(line: 51, column: 3, scope: !312)
!343 = !MDLocation(line: 56, column: 12, scope: !19)
!344 = !MDLocation(line: 56, column: 3, scope: !19)
!345 = !MDLocation(line: 57, column: 8, scope: !346)
!346 = !{!"0xb\0057\003\007", !1, !19}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!347 = !MDLocation(line: 57, column: 15, scope: !348)
!348 = !{!"0xb\002", !1, !349}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!349 = !{!"0xb\001", !1, !350}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!350 = !{!"0xb\0057\003\008", !1, !346}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!351 = !MDLocation(line: 57, column: 19, scope: !350)
!352 = !MDLocation(line: 57, column: 15, scope: !350)
!353 = !MDLocation(line: 57, column: 3, scope: !346)
!354 = !MDLocation(line: 58, column: 10, scope: !355)
!355 = !{!"0xb\0058\005\009", !1, !350}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!356 = !MDLocation(line: 58, column: 17, scope: !357)
!357 = !{!"0xb\002", !1, !358}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!358 = !{!"0xb\001", !1, !359}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!359 = !{!"0xb\0058\005\0010", !1, !355}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!360 = !MDLocation(line: 58, column: 21, scope: !359)
!361 = !MDLocation(line: 58, column: 17, scope: !359)
!362 = !MDLocation(line: 58, column: 5, scope: !355)
!363 = !MDLocation(line: 59, column: 11, scope: !364)
!364 = !{!"0xb\0058\0030\0011", !1, !359}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!365 = !MDLocation(line: 59, column: 46, scope: !364)
!366 = !MDLocation(line: 59, column: 41, scope: !364)
!367 = !MDLocation(line: 59, column: 43, scope: !364)
!368 = !MDLocation(line: 59, column: 2, scope: !364)
!369 = !MDLocation(line: 60, column: 6, scope: !370)
!370 = !{!"0xb\0060\006\0012", !1, !364}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!371 = !MDLocation(line: 60, column: 6, scope: !364)
!372 = !MDLocation(line: 60, column: 28, scope: !373)
!373 = !{!"0xb\001", !1, !370}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!374 = !MDLocation(line: 60, column: 19, scope: !370)
!375 = !MDLocation(line: 61, column: 5, scope: !364)
!376 = !MDLocation(line: 58, column: 25, scope: !359)
!377 = !MDLocation(line: 58, column: 5, scope: !359)
!378 = !MDLocation(line: 61, column: 5, scope: !355)
!379 = !MDLocation(line: 57, column: 23, scope: !350)
!380 = !MDLocation(line: 57, column: 3, scope: !350)
!381 = !MDLocation(line: 62, column: 12, scope: !19)
!382 = !MDLocation(line: 62, column: 3, scope: !19)
!383 = !MDLocation(line: 63, column: 8, scope: !384)
!384 = !{!"0xb\0063\003\0013", !1, !19}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!385 = !MDLocation(line: 63, column: 15, scope: !386)
!386 = !{!"0xb\002", !1, !387}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!387 = !{!"0xb\001", !1, !388}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!388 = !{!"0xb\0063\003\0014", !1, !384}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!389 = !MDLocation(line: 63, column: 19, scope: !388)
!390 = !MDLocation(line: 63, column: 15, scope: !388)
!391 = !MDLocation(line: 63, column: 3, scope: !384)
!392 = !MDLocation(line: 64, column: 10, scope: !393)
!393 = !{!"0xb\0064\005\0015", !1, !388}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!394 = !MDLocation(line: 64, column: 17, scope: !395)
!395 = !{!"0xb\002", !1, !396}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!396 = !{!"0xb\001", !1, !397}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!397 = !{!"0xb\0064\005\0016", !1, !393}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!398 = !MDLocation(line: 64, column: 21, scope: !397)
!399 = !MDLocation(line: 64, column: 17, scope: !397)
!400 = !MDLocation(line: 64, column: 5, scope: !393)
!401 = !MDLocation(line: 65, column: 11, scope: !402)
!402 = !{!"0xb\0064\0030\0017", !1, !397}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!403 = !MDLocation(line: 65, column: 46, scope: !402)
!404 = !MDLocation(line: 65, column: 41, scope: !402)
!405 = !MDLocation(line: 65, column: 43, scope: !402)
!406 = !MDLocation(line: 65, column: 2, scope: !402)
!407 = !MDLocation(line: 66, column: 6, scope: !408)
!408 = !{!"0xb\0066\006\0018", !1, !402}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!409 = !MDLocation(line: 66, column: 6, scope: !402)
!410 = !MDLocation(line: 66, column: 28, scope: !411)
!411 = !{!"0xb\001", !1, !408}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!412 = !MDLocation(line: 66, column: 19, scope: !408)
!413 = !MDLocation(line: 67, column: 5, scope: !402)
!414 = !MDLocation(line: 64, column: 25, scope: !397)
!415 = !MDLocation(line: 64, column: 5, scope: !397)
!416 = !MDLocation(line: 67, column: 5, scope: !393)
!417 = !MDLocation(line: 63, column: 23, scope: !388)
!418 = !MDLocation(line: 63, column: 3, scope: !388)
!419 = !MDLocation(line: 68, column: 12, scope: !19)
!420 = !MDLocation(line: 68, column: 3, scope: !19)
!421 = !MDLocation(line: 69, column: 1, scope: !19)
