; ModuleID = 'symm.c'
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
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %C = alloca [1024 x [1024 x double]]*, align 8
  %A = alloca [1024 x [1024 x double]]*, align 8
  %B = alloca [1024 x [1024 x double]]*, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !35, metadata !36), !dbg !37
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !38, metadata !36), !dbg !39
  call void @llvm.dbg.declare(metadata i32* %ni, metadata !40, metadata !36), !dbg !41
  store i32 1024, i32* %ni, align 4, !dbg !41
  call void @llvm.dbg.declare(metadata i32* %nj, metadata !42, metadata !36), !dbg !43
  store i32 1024, i32* %nj, align 4, !dbg !43
  call void @llvm.dbg.declare(metadata double* %alpha, metadata !44, metadata !36), !dbg !45
  call void @llvm.dbg.declare(metadata double* %beta, metadata !46, metadata !36), !dbg !47
  call void @llvm.dbg.declare(metadata [1024 x [1024 x double]]** %C, metadata !48, metadata !36), !dbg !49
  %call = call i8* @polybench_alloc_data(i32 1048576, i32 8), !dbg !49
  %0 = bitcast i8* %call to [1024 x [1024 x double]]*, !dbg !49
  store [1024 x [1024 x double]]* %0, [1024 x [1024 x double]]** %C, align 8, !dbg !49
  call void @llvm.dbg.declare(metadata [1024 x [1024 x double]]** %A, metadata !50, metadata !36), !dbg !51
  %call1 = call i8* @polybench_alloc_data(i32 1048576, i32 8), !dbg !51
  %1 = bitcast i8* %call1 to [1024 x [1024 x double]]*, !dbg !51
  store [1024 x [1024 x double]]* %1, [1024 x [1024 x double]]** %A, align 8, !dbg !51
  call void @llvm.dbg.declare(metadata [1024 x [1024 x double]]** %B, metadata !52, metadata !36), !dbg !53
  %call2 = call i8* @polybench_alloc_data(i32 1048576, i32 8), !dbg !53
  %2 = bitcast i8* %call2 to [1024 x [1024 x double]]*, !dbg !53
  store [1024 x [1024 x double]]* %2, [1024 x [1024 x double]]** %B, align 8, !dbg !53
  %3 = load i32* %ni, align 4, !dbg !54
  %4 = load i32* %nj, align 4, !dbg !55
  %5 = load [1024 x [1024 x double]]** %C, align 8, !dbg !56
  %arraydecay = getelementptr inbounds [1024 x [1024 x double]]* %5, i32 0, i32 0, !dbg !56
  %6 = load [1024 x [1024 x double]]** %A, align 8, !dbg !57
  %arraydecay3 = getelementptr inbounds [1024 x [1024 x double]]* %6, i32 0, i32 0, !dbg !57
  %7 = load [1024 x [1024 x double]]** %B, align 8, !dbg !58
  %arraydecay4 = getelementptr inbounds [1024 x [1024 x double]]* %7, i32 0, i32 0, !dbg !58
  call void @init_array(i32 %3, i32 %4, double* %alpha, double* %beta, [1024 x double]* %arraydecay, [1024 x double]* %arraydecay3, [1024 x double]* %arraydecay4), !dbg !59
  %8 = load i32* %ni, align 4, !dbg !60
  %9 = load i32* %nj, align 4, !dbg !61
  %10 = load double* %alpha, align 8, !dbg !62
  %11 = load double* %beta, align 8, !dbg !63
  %12 = load [1024 x [1024 x double]]** %C, align 8, !dbg !64
  %arraydecay5 = getelementptr inbounds [1024 x [1024 x double]]* %12, i32 0, i32 0, !dbg !64
  %13 = load [1024 x [1024 x double]]** %A, align 8, !dbg !65
  %arraydecay6 = getelementptr inbounds [1024 x [1024 x double]]* %13, i32 0, i32 0, !dbg !65
  %14 = load [1024 x [1024 x double]]** %B, align 8, !dbg !66
  %arraydecay7 = getelementptr inbounds [1024 x [1024 x double]]* %14, i32 0, i32 0, !dbg !66
  call void @kernel_symm(i32 %8, i32 %9, double %10, double %11, [1024 x double]* %arraydecay5, [1024 x double]* %arraydecay6, [1024 x double]* %arraydecay7), !dbg !67
  %15 = load i32* %argc.addr, align 4, !dbg !68
  %cmp = icmp sgt i32 %15, 42, !dbg !68
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !70

land.lhs.true:                                    ; preds = %entry
  %16 = load i8*** %argv.addr, align 8, !dbg !71
  %arrayidx = getelementptr inbounds i8** %16, i64 0, !dbg !71
  %17 = load i8** %arrayidx, align 8, !dbg !71
  %call8 = call i32 @strcmp(i8* %17, i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0)) #5, !dbg !71
  %tobool = icmp ne i32 %call8, 0, !dbg !70
  br i1 %tobool, label %if.end, label %if.then, !dbg !70

if.then:                                          ; preds = %land.lhs.true
  %18 = load i32* %ni, align 4, !dbg !73
  %19 = load i32* %nj, align 4, !dbg !73
  %20 = load [1024 x [1024 x double]]** %C, align 8, !dbg !73
  %arraydecay9 = getelementptr inbounds [1024 x [1024 x double]]* %20, i32 0, i32 0, !dbg !73
  call void @print_array(i32 %18, i32 %19, [1024 x double]* %arraydecay9), !dbg !73
  br label %if.end, !dbg !73

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %21 = load [1024 x [1024 x double]]** %C, align 8, !dbg !75
  %22 = bitcast [1024 x [1024 x double]]* %21 to i8*, !dbg !75
  call void @free(i8* %22) #6, !dbg !75
  %23 = load [1024 x [1024 x double]]** %A, align 8, !dbg !76
  %24 = bitcast [1024 x [1024 x double]]* %23 to i8*, !dbg !76
  call void @free(i8* %24) #6, !dbg !76
  %25 = load [1024 x [1024 x double]]** %B, align 8, !dbg !77
  %26 = bitcast [1024 x [1024 x double]]* %25 to i8*, !dbg !77
  call void @free(i8* %26) #6, !dbg !77
  ret i32 0, !dbg !78
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i8* @polybench_alloc_data(i32, i32) #2

; Function Attrs: nounwind uwtable
define internal void @init_array(i32 %ni, i32 %nj, double* %alpha, double* %beta, [1024 x double]* %C, [1024 x double]* %A, [1024 x double]* %B) #0 {
entry:
  %ni.addr = alloca i32, align 4
  %nj.addr = alloca i32, align 4
  %alpha.addr = alloca double*, align 8
  %beta.addr = alloca double*, align 8
  %C.addr = alloca [1024 x double]*, align 8
  %A.addr = alloca [1024 x double]*, align 8
  %B.addr = alloca [1024 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %ni, i32* %ni.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ni.addr, metadata !79, metadata !36), !dbg !80
  store i32 %nj, i32* %nj.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nj.addr, metadata !81, metadata !36), !dbg !82
  store double* %alpha, double** %alpha.addr, align 8
  call void @llvm.dbg.declare(metadata double** %alpha.addr, metadata !83, metadata !36), !dbg !84
  store double* %beta, double** %beta.addr, align 8
  call void @llvm.dbg.declare(metadata double** %beta.addr, metadata !85, metadata !36), !dbg !86
  store [1024 x double]* %C, [1024 x double]** %C.addr, align 8
  call void @llvm.dbg.declare(metadata [1024 x double]** %C.addr, metadata !87, metadata !36), !dbg !88
  store [1024 x double]* %A, [1024 x double]** %A.addr, align 8
  call void @llvm.dbg.declare(metadata [1024 x double]** %A.addr, metadata !89, metadata !36), !dbg !90
  store [1024 x double]* %B, [1024 x double]** %B.addr, align 8
  call void @llvm.dbg.declare(metadata [1024 x double]** %B.addr, metadata !91, metadata !36), !dbg !92
  call void @llvm.dbg.declare(metadata i32* %i, metadata !93, metadata !36), !dbg !94
  call void @llvm.dbg.declare(metadata i32* %j, metadata !95, metadata !36), !dbg !96
  %0 = load double** %alpha.addr, align 8, !dbg !97
  store double 3.241200e+04, double* %0, align 8, !dbg !98
  %1 = load double** %beta.addr, align 8, !dbg !99
  store double 2.123000e+03, double* %1, align 8, !dbg !100
  store i32 0, i32* %i, align 4, !dbg !101
  br label %for.cond, !dbg !101

for.cond:                                         ; preds = %for.inc17, %entry
  %2 = load i32* %i, align 4, !dbg !103
  %3 = load i32* %ni.addr, align 4, !dbg !107
  %cmp = icmp slt i32 %2, %3, !dbg !108
  br i1 %cmp, label %for.body, label %for.end19, !dbg !109

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !110
  br label %for.cond1, !dbg !110

for.cond1:                                        ; preds = %for.inc, %for.body
  %4 = load i32* %j, align 4, !dbg !112
  %5 = load i32* %nj.addr, align 4, !dbg !116
  %cmp2 = icmp slt i32 %4, %5, !dbg !117
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !118

for.body3:                                        ; preds = %for.cond1
  %6 = load i32* %i, align 4, !dbg !119
  %conv = sitofp i32 %6 to double, !dbg !121
  %7 = load i32* %j, align 4, !dbg !122
  %conv4 = sitofp i32 %7 to double, !dbg !122
  %mul = fmul double %conv, %conv4, !dbg !121
  %8 = load i32* %ni.addr, align 4, !dbg !123
  %conv5 = sitofp i32 %8 to double, !dbg !123
  %div = fdiv double %mul, %conv5, !dbg !124
  %9 = load i32* %j, align 4, !dbg !125
  %idxprom = sext i32 %9 to i64, !dbg !126
  %10 = load i32* %i, align 4, !dbg !127
  %idxprom6 = sext i32 %10 to i64, !dbg !126
  %11 = load [1024 x double]** %C.addr, align 8, !dbg !126
  %arrayidx = getelementptr inbounds [1024 x double]* %11, i64 %idxprom6, !dbg !126
  %arrayidx7 = getelementptr inbounds [1024 x double]* %arrayidx, i32 0, i64 %idxprom, !dbg !126
  store double %div, double* %arrayidx7, align 8, !dbg !126
  %12 = load i32* %i, align 4, !dbg !128
  %conv8 = sitofp i32 %12 to double, !dbg !129
  %13 = load i32* %j, align 4, !dbg !130
  %conv9 = sitofp i32 %13 to double, !dbg !130
  %mul10 = fmul double %conv8, %conv9, !dbg !129
  %14 = load i32* %ni.addr, align 4, !dbg !131
  %conv11 = sitofp i32 %14 to double, !dbg !131
  %div12 = fdiv double %mul10, %conv11, !dbg !132
  %15 = load i32* %j, align 4, !dbg !133
  %idxprom13 = sext i32 %15 to i64, !dbg !134
  %16 = load i32* %i, align 4, !dbg !135
  %idxprom14 = sext i32 %16 to i64, !dbg !134
  %17 = load [1024 x double]** %B.addr, align 8, !dbg !134
  %arrayidx15 = getelementptr inbounds [1024 x double]* %17, i64 %idxprom14, !dbg !134
  %arrayidx16 = getelementptr inbounds [1024 x double]* %arrayidx15, i32 0, i64 %idxprom13, !dbg !134
  store double %div12, double* %arrayidx16, align 8, !dbg !134
  br label %for.inc, !dbg !136

for.inc:                                          ; preds = %for.body3
  %18 = load i32* %j, align 4, !dbg !137
  %inc = add nsw i32 %18, 1, !dbg !137
  store i32 %inc, i32* %j, align 4, !dbg !137
  br label %for.cond1, !dbg !138

for.end:                                          ; preds = %for.cond1
  br label %for.inc17, !dbg !139

for.inc17:                                        ; preds = %for.end
  %19 = load i32* %i, align 4, !dbg !140
  %inc18 = add nsw i32 %19, 1, !dbg !140
  store i32 %inc18, i32* %i, align 4, !dbg !140
  br label %for.cond, !dbg !141

for.end19:                                        ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !142
  br label %for.cond20, !dbg !142

for.cond20:                                       ; preds = %for.inc40, %for.end19
  %20 = load i32* %i, align 4, !dbg !144
  %21 = load i32* %nj.addr, align 4, !dbg !148
  %cmp21 = icmp slt i32 %20, %21, !dbg !149
  br i1 %cmp21, label %for.body23, label %for.end42, !dbg !150

for.body23:                                       ; preds = %for.cond20
  store i32 0, i32* %j, align 4, !dbg !151
  br label %for.cond24, !dbg !151

for.cond24:                                       ; preds = %for.inc37, %for.body23
  %22 = load i32* %j, align 4, !dbg !153
  %23 = load i32* %nj.addr, align 4, !dbg !157
  %cmp25 = icmp slt i32 %22, %23, !dbg !158
  br i1 %cmp25, label %for.body27, label %for.end39, !dbg !159

for.body27:                                       ; preds = %for.cond24
  %24 = load i32* %i, align 4, !dbg !160
  %conv28 = sitofp i32 %24 to double, !dbg !161
  %25 = load i32* %j, align 4, !dbg !162
  %conv29 = sitofp i32 %25 to double, !dbg !162
  %mul30 = fmul double %conv28, %conv29, !dbg !161
  %26 = load i32* %ni.addr, align 4, !dbg !163
  %conv31 = sitofp i32 %26 to double, !dbg !163
  %div32 = fdiv double %mul30, %conv31, !dbg !164
  %27 = load i32* %j, align 4, !dbg !165
  %idxprom33 = sext i32 %27 to i64, !dbg !166
  %28 = load i32* %i, align 4, !dbg !167
  %idxprom34 = sext i32 %28 to i64, !dbg !166
  %29 = load [1024 x double]** %A.addr, align 8, !dbg !166
  %arrayidx35 = getelementptr inbounds [1024 x double]* %29, i64 %idxprom34, !dbg !166
  %arrayidx36 = getelementptr inbounds [1024 x double]* %arrayidx35, i32 0, i64 %idxprom33, !dbg !166
  store double %div32, double* %arrayidx36, align 8, !dbg !166
  br label %for.inc37, !dbg !166

for.inc37:                                        ; preds = %for.body27
  %30 = load i32* %j, align 4, !dbg !168
  %inc38 = add nsw i32 %30, 1, !dbg !168
  store i32 %inc38, i32* %j, align 4, !dbg !168
  br label %for.cond24, !dbg !169

for.end39:                                        ; preds = %for.cond24
  br label %for.inc40, !dbg !170

for.inc40:                                        ; preds = %for.end39
  %31 = load i32* %i, align 4, !dbg !171
  %inc41 = add nsw i32 %31, 1, !dbg !171
  store i32 %inc41, i32* %i, align 4, !dbg !171
  br label %for.cond20, !dbg !172

for.end42:                                        ; preds = %for.cond20
  ret void, !dbg !173
}

; Function Attrs: nounwind uwtable
define internal void @kernel_symm(i32 %ni, i32 %nj, double %alpha, double %beta, [1024 x double]* %C, [1024 x double]* %A, [1024 x double]* %B) #0 {
entry:
  %ni.addr = alloca i32, align 4
  %nj.addr = alloca i32, align 4
  %alpha.addr = alloca double, align 8
  %beta.addr = alloca double, align 8
  %C.addr = alloca [1024 x double]*, align 8
  %A.addr = alloca [1024 x double]*, align 8
  %B.addr = alloca [1024 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %acc = alloca double, align 8
  store i32 %ni, i32* %ni.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ni.addr, metadata !174, metadata !36), !dbg !175
  store i32 %nj, i32* %nj.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nj.addr, metadata !176, metadata !36), !dbg !177
  store double %alpha, double* %alpha.addr, align 8
  call void @llvm.dbg.declare(metadata double* %alpha.addr, metadata !178, metadata !36), !dbg !179
  store double %beta, double* %beta.addr, align 8
  call void @llvm.dbg.declare(metadata double* %beta.addr, metadata !180, metadata !36), !dbg !181
  store [1024 x double]* %C, [1024 x double]** %C.addr, align 8
  call void @llvm.dbg.declare(metadata [1024 x double]** %C.addr, metadata !182, metadata !36), !dbg !183
  store [1024 x double]* %A, [1024 x double]** %A.addr, align 8
  call void @llvm.dbg.declare(metadata [1024 x double]** %A.addr, metadata !184, metadata !36), !dbg !185
  store [1024 x double]* %B, [1024 x double]** %B.addr, align 8
  call void @llvm.dbg.declare(metadata [1024 x double]** %B.addr, metadata !186, metadata !36), !dbg !187
  call void @llvm.dbg.declare(metadata i32* %i, metadata !188, metadata !36), !dbg !189
  call void @llvm.dbg.declare(metadata i32* %j, metadata !190, metadata !36), !dbg !191
  call void @llvm.dbg.declare(metadata i32* %k, metadata !192, metadata !36), !dbg !193
  call void @llvm.dbg.declare(metadata double* %acc, metadata !194, metadata !36), !dbg !195
  store i32 0, i32* %i, align 4, !dbg !196
  br label %for.cond, !dbg !196

for.cond:                                         ; preds = %for.inc53, %entry
  %0 = load i32* %i, align 4, !dbg !198
  %1 = load i32* %ni.addr, align 4, !dbg !202
  %cmp = icmp slt i32 %0, %1, !dbg !203
  br i1 %cmp, label %for.body, label %for.end55, !dbg !204

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !205
  br label %for.cond1, !dbg !205

for.cond1:                                        ; preds = %for.inc50, %for.body
  %2 = load i32* %j, align 4, !dbg !207
  %3 = load i32* %nj.addr, align 4, !dbg !211
  %cmp2 = icmp slt i32 %2, %3, !dbg !212
  br i1 %cmp2, label %for.body3, label %for.end52, !dbg !213

for.body3:                                        ; preds = %for.cond1
  store double 0.000000e+00, double* %acc, align 8, !dbg !214
  store i32 0, i32* %k, align 4, !dbg !216
  br label %for.cond4, !dbg !216

for.cond4:                                        ; preds = %for.inc, %for.body3
  %4 = load i32* %k, align 4, !dbg !218
  %5 = load i32* %j, align 4, !dbg !222
  %sub = sub nsw i32 %5, 1, !dbg !222
  %cmp5 = icmp slt i32 %4, %sub, !dbg !223
  br i1 %cmp5, label %for.body6, label %for.end, !dbg !224

for.body6:                                        ; preds = %for.cond4
  %6 = load double* %alpha.addr, align 8, !dbg !225
  %7 = load i32* %i, align 4, !dbg !227
  %idxprom = sext i32 %7 to i64, !dbg !228
  %8 = load i32* %k, align 4, !dbg !229
  %idxprom7 = sext i32 %8 to i64, !dbg !228
  %9 = load [1024 x double]** %A.addr, align 8, !dbg !228
  %arrayidx = getelementptr inbounds [1024 x double]* %9, i64 %idxprom7, !dbg !228
  %arrayidx8 = getelementptr inbounds [1024 x double]* %arrayidx, i32 0, i64 %idxprom, !dbg !228
  %10 = load double* %arrayidx8, align 8, !dbg !228
  %mul = fmul double %6, %10, !dbg !225
  %11 = load i32* %j, align 4, !dbg !230
  %idxprom9 = sext i32 %11 to i64, !dbg !231
  %12 = load i32* %i, align 4, !dbg !232
  %idxprom10 = sext i32 %12 to i64, !dbg !231
  %13 = load [1024 x double]** %B.addr, align 8, !dbg !231
  %arrayidx11 = getelementptr inbounds [1024 x double]* %13, i64 %idxprom10, !dbg !231
  %arrayidx12 = getelementptr inbounds [1024 x double]* %arrayidx11, i32 0, i64 %idxprom9, !dbg !231
  %14 = load double* %arrayidx12, align 8, !dbg !231
  %mul13 = fmul double %mul, %14, !dbg !225
  %15 = load i32* %j, align 4, !dbg !233
  %idxprom14 = sext i32 %15 to i64, !dbg !234
  %16 = load i32* %k, align 4, !dbg !235
  %idxprom15 = sext i32 %16 to i64, !dbg !234
  %17 = load [1024 x double]** %C.addr, align 8, !dbg !234
  %arrayidx16 = getelementptr inbounds [1024 x double]* %17, i64 %idxprom15, !dbg !234
  %arrayidx17 = getelementptr inbounds [1024 x double]* %arrayidx16, i32 0, i64 %idxprom14, !dbg !234
  %18 = load double* %arrayidx17, align 8, !dbg !234
  %add = fadd double %18, %mul13, !dbg !234
  store double %add, double* %arrayidx17, align 8, !dbg !234
  %19 = load i32* %j, align 4, !dbg !236
  %idxprom18 = sext i32 %19 to i64, !dbg !237
  %20 = load i32* %k, align 4, !dbg !238
  %idxprom19 = sext i32 %20 to i64, !dbg !237
  %21 = load [1024 x double]** %B.addr, align 8, !dbg !237
  %arrayidx20 = getelementptr inbounds [1024 x double]* %21, i64 %idxprom19, !dbg !237
  %arrayidx21 = getelementptr inbounds [1024 x double]* %arrayidx20, i32 0, i64 %idxprom18, !dbg !237
  %22 = load double* %arrayidx21, align 8, !dbg !237
  %23 = load i32* %i, align 4, !dbg !239
  %idxprom22 = sext i32 %23 to i64, !dbg !240
  %24 = load i32* %k, align 4, !dbg !241
  %idxprom23 = sext i32 %24 to i64, !dbg !240
  %25 = load [1024 x double]** %A.addr, align 8, !dbg !240
  %arrayidx24 = getelementptr inbounds [1024 x double]* %25, i64 %idxprom23, !dbg !240
  %arrayidx25 = getelementptr inbounds [1024 x double]* %arrayidx24, i32 0, i64 %idxprom22, !dbg !240
  %26 = load double* %arrayidx25, align 8, !dbg !240
  %mul26 = fmul double %22, %26, !dbg !237
  %27 = load double* %acc, align 8, !dbg !242
  %add27 = fadd double %27, %mul26, !dbg !242
  store double %add27, double* %acc, align 8, !dbg !242
  br label %for.inc, !dbg !243

for.inc:                                          ; preds = %for.body6
  %28 = load i32* %k, align 4, !dbg !244
  %inc = add nsw i32 %28, 1, !dbg !244
  store i32 %inc, i32* %k, align 4, !dbg !244
  br label %for.cond4, !dbg !245

for.end:                                          ; preds = %for.cond4
  %29 = load double* %beta.addr, align 8, !dbg !246
  %30 = load i32* %j, align 4, !dbg !247
  %idxprom28 = sext i32 %30 to i64, !dbg !248
  %31 = load i32* %i, align 4, !dbg !249
  %idxprom29 = sext i32 %31 to i64, !dbg !248
  %32 = load [1024 x double]** %C.addr, align 8, !dbg !248
  %arrayidx30 = getelementptr inbounds [1024 x double]* %32, i64 %idxprom29, !dbg !248
  %arrayidx31 = getelementptr inbounds [1024 x double]* %arrayidx30, i32 0, i64 %idxprom28, !dbg !248
  %33 = load double* %arrayidx31, align 8, !dbg !248
  %mul32 = fmul double %29, %33, !dbg !246
  %34 = load double* %alpha.addr, align 8, !dbg !250
  %35 = load i32* %i, align 4, !dbg !251
  %idxprom33 = sext i32 %35 to i64, !dbg !252
  %36 = load i32* %i, align 4, !dbg !253
  %idxprom34 = sext i32 %36 to i64, !dbg !252
  %37 = load [1024 x double]** %A.addr, align 8, !dbg !252
  %arrayidx35 = getelementptr inbounds [1024 x double]* %37, i64 %idxprom34, !dbg !252
  %arrayidx36 = getelementptr inbounds [1024 x double]* %arrayidx35, i32 0, i64 %idxprom33, !dbg !252
  %38 = load double* %arrayidx36, align 8, !dbg !252
  %mul37 = fmul double %34, %38, !dbg !250
  %39 = load i32* %j, align 4, !dbg !254
  %idxprom38 = sext i32 %39 to i64, !dbg !255
  %40 = load i32* %i, align 4, !dbg !256
  %idxprom39 = sext i32 %40 to i64, !dbg !255
  %41 = load [1024 x double]** %B.addr, align 8, !dbg !255
  %arrayidx40 = getelementptr inbounds [1024 x double]* %41, i64 %idxprom39, !dbg !255
  %arrayidx41 = getelementptr inbounds [1024 x double]* %arrayidx40, i32 0, i64 %idxprom38, !dbg !255
  %42 = load double* %arrayidx41, align 8, !dbg !255
  %mul42 = fmul double %mul37, %42, !dbg !250
  %add43 = fadd double %mul32, %mul42, !dbg !246
  %43 = load double* %alpha.addr, align 8, !dbg !257
  %44 = load double* %acc, align 8, !dbg !258
  %mul44 = fmul double %43, %44, !dbg !257
  %add45 = fadd double %add43, %mul44, !dbg !246
  %45 = load i32* %j, align 4, !dbg !259
  %idxprom46 = sext i32 %45 to i64, !dbg !260
  %46 = load i32* %i, align 4, !dbg !261
  %idxprom47 = sext i32 %46 to i64, !dbg !260
  %47 = load [1024 x double]** %C.addr, align 8, !dbg !260
  %arrayidx48 = getelementptr inbounds [1024 x double]* %47, i64 %idxprom47, !dbg !260
  %arrayidx49 = getelementptr inbounds [1024 x double]* %arrayidx48, i32 0, i64 %idxprom46, !dbg !260
  store double %add45, double* %arrayidx49, align 8, !dbg !260
  br label %for.inc50, !dbg !262

for.inc50:                                        ; preds = %for.end
  %48 = load i32* %j, align 4, !dbg !263
  %inc51 = add nsw i32 %48, 1, !dbg !263
  store i32 %inc51, i32* %j, align 4, !dbg !263
  br label %for.cond1, !dbg !264

for.end52:                                        ; preds = %for.cond1
  br label %for.inc53, !dbg !265

for.inc53:                                        ; preds = %for.end52
  %49 = load i32* %i, align 4, !dbg !266
  %inc54 = add nsw i32 %49, 1, !dbg !266
  store i32 %inc54, i32* %i, align 4, !dbg !266
  br label %for.cond, !dbg !267

for.end55:                                        ; preds = %for.cond
  ret void, !dbg !268
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #3

; Function Attrs: nounwind uwtable
define internal void @print_array(i32 %ni, i32 %nj, [1024 x double]* %C) #0 {
entry:
  %ni.addr = alloca i32, align 4
  %nj.addr = alloca i32, align 4
  %C.addr = alloca [1024 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %ni, i32* %ni.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ni.addr, metadata !269, metadata !36), !dbg !270
  store i32 %nj, i32* %nj.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nj.addr, metadata !271, metadata !36), !dbg !272
  store [1024 x double]* %C, [1024 x double]** %C.addr, align 8
  call void @llvm.dbg.declare(metadata [1024 x double]** %C.addr, metadata !273, metadata !36), !dbg !274
  call void @llvm.dbg.declare(metadata i32* %i, metadata !275, metadata !36), !dbg !276
  call void @llvm.dbg.declare(metadata i32* %j, metadata !277, metadata !36), !dbg !278
  store i32 0, i32* %i, align 4, !dbg !279
  br label %for.cond, !dbg !279

for.cond:                                         ; preds = %for.inc8, %entry
  %0 = load i32* %i, align 4, !dbg !281
  %1 = load i32* %ni.addr, align 4, !dbg !285
  %cmp = icmp slt i32 %0, %1, !dbg !286
  br i1 %cmp, label %for.body, label %for.end10, !dbg !287

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !288
  br label %for.cond1, !dbg !288

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32* %j, align 4, !dbg !290
  %3 = load i32* %nj.addr, align 4, !dbg !294
  %cmp2 = icmp slt i32 %2, %3, !dbg !295
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !296

for.body3:                                        ; preds = %for.cond1
  %4 = load %struct._IO_FILE** @stderr, align 8, !dbg !297
  %5 = load i32* %j, align 4, !dbg !299
  %idxprom = sext i32 %5 to i64, !dbg !300
  %6 = load i32* %i, align 4, !dbg !301
  %idxprom4 = sext i32 %6 to i64, !dbg !300
  %7 = load [1024 x double]** %C.addr, align 8, !dbg !300
  %arrayidx = getelementptr inbounds [1024 x double]* %7, i64 %idxprom4, !dbg !300
  %arrayidx5 = getelementptr inbounds [1024 x double]* %arrayidx, i32 0, i64 %idxprom, !dbg !300
  %8 = load double* %arrayidx5, align 8, !dbg !300
  %call = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([8 x i8]* @.str1, i32 0, i32 0), double %8), !dbg !302
  %9 = load i32* %i, align 4, !dbg !303
  %10 = load i32* %ni.addr, align 4, !dbg !305
  %mul = mul nsw i32 %9, %10, !dbg !303
  %11 = load i32* %j, align 4, !dbg !306
  %add = add nsw i32 %mul, %11, !dbg !303
  %rem = srem i32 %add, 20, !dbg !307
  %cmp6 = icmp eq i32 %rem, 0, !dbg !307
  br i1 %cmp6, label %if.then, label %if.end, !dbg !308

if.then:                                          ; preds = %for.body3
  %12 = load %struct._IO_FILE** @stderr, align 8, !dbg !309
  %call7 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)), !dbg !311
  br label %if.end, !dbg !311

if.end:                                           ; preds = %if.then, %for.body3
  br label %for.inc, !dbg !312

for.inc:                                          ; preds = %if.end
  %13 = load i32* %j, align 4, !dbg !313
  %inc = add nsw i32 %13, 1, !dbg !313
  store i32 %inc, i32* %j, align 4, !dbg !313
  br label %for.cond1, !dbg !314

for.end:                                          ; preds = %for.cond1
  br label %for.inc8, !dbg !315

for.inc8:                                         ; preds = %for.end
  %14 = load i32* %i, align 4, !dbg !316
  %inc9 = add nsw i32 %14, 1, !dbg !316
  store i32 %inc9, i32* %i, align 4, !dbg !316
  br label %for.cond, !dbg !317

for.end10:                                        ; preds = %for.cond
  %15 = load %struct._IO_FILE** @stderr, align 8, !dbg !318
  %call11 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)), !dbg !319
  ret void, !dbg !320
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

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\000\00\000\00\001", !1, !2, !3, !10, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c] [DW_LANG_C99]
!1 = !{!"symm.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm"}
!2 = !{}
!3 = !{!4, !9, !6}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!5 = !{!"0x1\00\000\0067108864\0064\000\000\000", null, null, !6, !7, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 67108864, align 64, offset 0] [from double]
!6 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!7 = !{!8, !8}
!8 = !{!"0x21\000\001024"}                        ; [ DW_TAG_subrange_type ] [0, 1023]
!9 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = !{!11, !19, !25, !28}
!11 = !{!"0x2e\00main\00main\00\0093\000\001\000\000\00256\000\0094", !1, !12, !13, null, i32 (i32, i8**)* @main, null, null, !2} ; [ DW_TAG_subprogram ] [line 93] [def] [scope 94] [main]
!12 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!13 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !14, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = !{!15, !15, !16}
!15 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!16 = !{!"0xf\00\000\0064\0064\000\000", null, null, !17} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!17 = !{!"0xf\00\000\0064\0064\000\000", null, null, !18} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!18 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!19 = !{!"0x2e\00print_array\00print_array\00\0048\001\001\000\000\00256\000\0050", !1, !12, !20, null, void (i32, i32, [1024 x double]*)* @print_array, null, null, !2} ; [ DW_TAG_subprogram ] [line 48] [local] [def] [scope 50] [print_array]
!20 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !21, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!21 = !{null, !15, !15, !22}
!22 = !{!"0xf\00\000\0064\0064\000\000", null, null, !23} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!23 = !{!"0x1\00\000\0065536\0064\000\000\000", null, null, !6, !24, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 65536, align 64, offset 0] [from double]
!24 = !{!8}
!25 = !{!"0x2e\00kernel_symm\00kernel_symm\00\0065\001\001\000\000\00256\000\0071", !1, !12, !26, null, void (i32, i32, double, double, [1024 x double]*, [1024 x double]*, [1024 x double]*)* @kernel_symm, null, null, !2} ; [ DW_TAG_subprogram ] [line 65] [local] [def] [scope 71] [kernel_symm]
!26 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !27, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!27 = !{null, !15, !15, !6, !6, !22, !22, !22}
!28 = !{!"0x2e\00init_array\00init_array\00\0023\001\001\000\000\00256\000\0029", !1, !12, !29, null, void (i32, i32, double*, double*, [1024 x double]*, [1024 x double]*, [1024 x double]*)* @init_array, null, null, !2} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [scope 29] [init_array]
!29 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !30, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!30 = !{null, !15, !15, !31, !31, !22, !22, !22}
!31 = !{!"0xf\00\000\0064\0064\000\000", null, null, !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!32 = !{i32 2, !"Dwarf Version", i32 4}
!33 = !{i32 2, !"Debug Info Version", i32 2}
!34 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!35 = !{!"0x101\00argc\0016777309\000", !11, !12, !15} ; [ DW_TAG_arg_variable ] [argc] [line 93]
!36 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!37 = !MDLocation(line: 93, column: 14, scope: !11)
!38 = !{!"0x101\00argv\0033554525\000", !11, !12, !16} ; [ DW_TAG_arg_variable ] [argv] [line 93]
!39 = !MDLocation(line: 93, column: 27, scope: !11)
!40 = !{!"0x100\00ni\0096\000", !11, !12, !15}    ; [ DW_TAG_auto_variable ] [ni] [line 96]
!41 = !MDLocation(line: 96, column: 7, scope: !11)
!42 = !{!"0x100\00nj\0097\000", !11, !12, !15}    ; [ DW_TAG_auto_variable ] [nj] [line 97]
!43 = !MDLocation(line: 97, column: 7, scope: !11)
!44 = !{!"0x100\00alpha\00100\000", !11, !12, !6} ; [ DW_TAG_auto_variable ] [alpha] [line 100]
!45 = !MDLocation(line: 100, column: 13, scope: !11)
!46 = !{!"0x100\00beta\00101\000", !11, !12, !6}  ; [ DW_TAG_auto_variable ] [beta] [line 101]
!47 = !MDLocation(line: 101, column: 13, scope: !11)
!48 = !{!"0x100\00C\00102\000", !11, !12, !4}     ; [ DW_TAG_auto_variable ] [C] [line 102]
!49 = !MDLocation(line: 102, column: 3, scope: !11)
!50 = !{!"0x100\00A\00103\000", !11, !12, !4}     ; [ DW_TAG_auto_variable ] [A] [line 103]
!51 = !MDLocation(line: 103, column: 3, scope: !11)
!52 = !{!"0x100\00B\00104\000", !11, !12, !4}     ; [ DW_TAG_auto_variable ] [B] [line 104]
!53 = !MDLocation(line: 104, column: 3, scope: !11)
!54 = !MDLocation(line: 107, column: 15, scope: !11)
!55 = !MDLocation(line: 107, column: 19, scope: !11)
!56 = !MDLocation(line: 108, column: 8, scope: !11)
!57 = !MDLocation(line: 109, column: 8, scope: !11)
!58 = !MDLocation(line: 110, column: 8, scope: !11)
!59 = !MDLocation(line: 107, column: 3, scope: !11)
!60 = !MDLocation(line: 116, column: 16, scope: !11)
!61 = !MDLocation(line: 116, column: 20, scope: !11)
!62 = !MDLocation(line: 117, column: 9, scope: !11)
!63 = !MDLocation(line: 117, column: 16, scope: !11)
!64 = !MDLocation(line: 118, column: 9, scope: !11)
!65 = !MDLocation(line: 119, column: 9, scope: !11)
!66 = !MDLocation(line: 120, column: 9, scope: !11)
!67 = !MDLocation(line: 116, column: 3, scope: !11)
!68 = !MDLocation(line: 128, column: 3, scope: !69)
!69 = !{!"0xb\00128\003\000", !1, !11}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!70 = !MDLocation(line: 128, column: 3, scope: !11)
!71 = !MDLocation(line: 128, column: 3, scope: !72)
!72 = !{!"0xb\001", !1, !69}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!73 = !MDLocation(line: 128, column: 3, scope: !74)
!74 = !{!"0xb\002", !1, !69}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!75 = !MDLocation(line: 131, column: 3, scope: !11)
!76 = !MDLocation(line: 132, column: 3, scope: !11)
!77 = !MDLocation(line: 133, column: 3, scope: !11)
!78 = !MDLocation(line: 135, column: 3, scope: !11)
!79 = !{!"0x101\00ni\0016777239\000", !28, !12, !15} ; [ DW_TAG_arg_variable ] [ni] [line 23]
!80 = !MDLocation(line: 23, column: 21, scope: !28)
!81 = !{!"0x101\00nj\0033554455\000", !28, !12, !15} ; [ DW_TAG_arg_variable ] [nj] [line 23]
!82 = !MDLocation(line: 23, column: 29, scope: !28)
!83 = !{!"0x101\00alpha\0050331672\000", !28, !12, !31} ; [ DW_TAG_arg_variable ] [alpha] [line 24]
!84 = !MDLocation(line: 24, column: 14, scope: !28)
!85 = !{!"0x101\00beta\0067108889\000", !28, !12, !31} ; [ DW_TAG_arg_variable ] [beta] [line 25]
!86 = !MDLocation(line: 25, column: 14, scope: !28)
!87 = !{!"0x101\00C\0083886106\000", !28, !12, !22} ; [ DW_TAG_arg_variable ] [C] [line 26]
!88 = !MDLocation(line: 26, column: 13, scope: !28)
!89 = !{!"0x101\00A\00100663323\000", !28, !12, !22} ; [ DW_TAG_arg_variable ] [A] [line 27]
!90 = !MDLocation(line: 27, column: 13, scope: !28)
!91 = !{!"0x101\00B\00117440540\000", !28, !12, !22} ; [ DW_TAG_arg_variable ] [B] [line 28]
!92 = !MDLocation(line: 28, column: 13, scope: !28)
!93 = !{!"0x100\00i\0030\000", !28, !12, !15}     ; [ DW_TAG_auto_variable ] [i] [line 30]
!94 = !MDLocation(line: 30, column: 7, scope: !28)
!95 = !{!"0x100\00j\0030\000", !28, !12, !15}     ; [ DW_TAG_auto_variable ] [j] [line 30]
!96 = !MDLocation(line: 30, column: 10, scope: !28)
!97 = !MDLocation(line: 32, column: 4, scope: !28)
!98 = !MDLocation(line: 32, column: 3, scope: !28)
!99 = !MDLocation(line: 33, column: 4, scope: !28)
!100 = !MDLocation(line: 33, column: 3, scope: !28)
!101 = !MDLocation(line: 34, column: 8, scope: !102)
!102 = !{!"0xb\0034\003\0015", !1, !28}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!103 = !MDLocation(line: 34, column: 15, scope: !104)
!104 = !{!"0xb\002", !1, !105}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!105 = !{!"0xb\001", !1, !106}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!106 = !{!"0xb\0034\003\0016", !1, !102}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!107 = !MDLocation(line: 34, column: 19, scope: !106)
!108 = !MDLocation(line: 34, column: 15, scope: !106)
!109 = !MDLocation(line: 34, column: 3, scope: !102)
!110 = !MDLocation(line: 35, column: 10, scope: !111)
!111 = !{!"0xb\0035\005\0017", !1, !106}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!112 = !MDLocation(line: 35, column: 17, scope: !113)
!113 = !{!"0xb\002", !1, !114}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!114 = !{!"0xb\001", !1, !115}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!115 = !{!"0xb\0035\005\0018", !1, !111}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!116 = !MDLocation(line: 35, column: 21, scope: !115)
!117 = !MDLocation(line: 35, column: 17, scope: !115)
!118 = !MDLocation(line: 35, column: 5, scope: !111)
!119 = !MDLocation(line: 36, column: 30, scope: !120)
!120 = !{!"0xb\0035\0030\0019", !1, !115}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!121 = !MDLocation(line: 36, column: 18, scope: !120)
!122 = !MDLocation(line: 36, column: 32, scope: !120)
!123 = !MDLocation(line: 36, column: 37, scope: !120)
!124 = !MDLocation(line: 36, column: 17, scope: !120)
!125 = !MDLocation(line: 36, column: 12, scope: !120)
!126 = !MDLocation(line: 36, column: 7, scope: !120)
!127 = !MDLocation(line: 36, column: 9, scope: !120)
!128 = !MDLocation(line: 37, column: 30, scope: !120)
!129 = !MDLocation(line: 37, column: 18, scope: !120)
!130 = !MDLocation(line: 37, column: 32, scope: !120)
!131 = !MDLocation(line: 37, column: 37, scope: !120)
!132 = !MDLocation(line: 37, column: 17, scope: !120)
!133 = !MDLocation(line: 37, column: 12, scope: !120)
!134 = !MDLocation(line: 37, column: 7, scope: !120)
!135 = !MDLocation(line: 37, column: 9, scope: !120)
!136 = !MDLocation(line: 38, column: 5, scope: !120)
!137 = !MDLocation(line: 35, column: 25, scope: !115)
!138 = !MDLocation(line: 35, column: 5, scope: !115)
!139 = !MDLocation(line: 38, column: 5, scope: !111)
!140 = !MDLocation(line: 34, column: 23, scope: !106)
!141 = !MDLocation(line: 34, column: 3, scope: !106)
!142 = !MDLocation(line: 39, column: 8, scope: !143)
!143 = !{!"0xb\0039\003\0020", !1, !28}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!144 = !MDLocation(line: 39, column: 15, scope: !145)
!145 = !{!"0xb\002", !1, !146}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!146 = !{!"0xb\001", !1, !147}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!147 = !{!"0xb\0039\003\0021", !1, !143}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!148 = !MDLocation(line: 39, column: 19, scope: !147)
!149 = !MDLocation(line: 39, column: 15, scope: !147)
!150 = !MDLocation(line: 39, column: 3, scope: !143)
!151 = !MDLocation(line: 40, column: 10, scope: !152)
!152 = !{!"0xb\0040\005\0022", !1, !147}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!153 = !MDLocation(line: 40, column: 17, scope: !154)
!154 = !{!"0xb\002", !1, !155}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!155 = !{!"0xb\001", !1, !156}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!156 = !{!"0xb\0040\005\0023", !1, !152}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!157 = !MDLocation(line: 40, column: 21, scope: !156)
!158 = !MDLocation(line: 40, column: 17, scope: !156)
!159 = !MDLocation(line: 40, column: 5, scope: !152)
!160 = !MDLocation(line: 41, column: 30, scope: !156)
!161 = !MDLocation(line: 41, column: 18, scope: !156)
!162 = !MDLocation(line: 41, column: 32, scope: !156)
!163 = !MDLocation(line: 41, column: 37, scope: !156)
!164 = !MDLocation(line: 41, column: 17, scope: !156)
!165 = !MDLocation(line: 41, column: 12, scope: !156)
!166 = !MDLocation(line: 41, column: 7, scope: !156)
!167 = !MDLocation(line: 41, column: 9, scope: !156)
!168 = !MDLocation(line: 40, column: 25, scope: !156)
!169 = !MDLocation(line: 40, column: 5, scope: !156)
!170 = !MDLocation(line: 41, column: 37, scope: !152)
!171 = !MDLocation(line: 39, column: 23, scope: !147)
!172 = !MDLocation(line: 39, column: 3, scope: !147)
!173 = !MDLocation(line: 42, column: 1, scope: !28)
!174 = !{!"0x101\00ni\0016777281\000", !25, !12, !15} ; [ DW_TAG_arg_variable ] [ni] [line 65]
!175 = !MDLocation(line: 65, column: 22, scope: !25)
!176 = !{!"0x101\00nj\0033554497\000", !25, !12, !15} ; [ DW_TAG_arg_variable ] [nj] [line 65]
!177 = !MDLocation(line: 65, column: 30, scope: !25)
!178 = !{!"0x101\00alpha\0050331714\000", !25, !12, !6} ; [ DW_TAG_arg_variable ] [alpha] [line 66]
!179 = !MDLocation(line: 66, column: 14, scope: !25)
!180 = !{!"0x101\00beta\0067108931\000", !25, !12, !6} ; [ DW_TAG_arg_variable ] [beta] [line 67]
!181 = !MDLocation(line: 67, column: 14, scope: !25)
!182 = !{!"0x101\00C\0083886148\000", !25, !12, !22} ; [ DW_TAG_arg_variable ] [C] [line 68]
!183 = !MDLocation(line: 68, column: 14, scope: !25)
!184 = !{!"0x101\00A\00100663365\000", !25, !12, !22} ; [ DW_TAG_arg_variable ] [A] [line 69]
!185 = !MDLocation(line: 69, column: 14, scope: !25)
!186 = !{!"0x101\00B\00117440582\000", !25, !12, !22} ; [ DW_TAG_arg_variable ] [B] [line 70]
!187 = !MDLocation(line: 70, column: 14, scope: !25)
!188 = !{!"0x100\00i\0072\000", !25, !12, !15}    ; [ DW_TAG_auto_variable ] [i] [line 72]
!189 = !MDLocation(line: 72, column: 7, scope: !25)
!190 = !{!"0x100\00j\0072\000", !25, !12, !15}    ; [ DW_TAG_auto_variable ] [j] [line 72]
!191 = !MDLocation(line: 72, column: 10, scope: !25)
!192 = !{!"0x100\00k\0072\000", !25, !12, !15}    ; [ DW_TAG_auto_variable ] [k] [line 72]
!193 = !MDLocation(line: 72, column: 13, scope: !25)
!194 = !{!"0x100\00acc\0073\000", !25, !12, !6}   ; [ DW_TAG_auto_variable ] [acc] [line 73]
!195 = !MDLocation(line: 73, column: 13, scope: !25)
!196 = !MDLocation(line: 77, column: 8, scope: !197)
!197 = !{!"0xb\0077\003\007", !1, !25}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!198 = !MDLocation(line: 77, column: 15, scope: !199)
!199 = !{!"0xb\002", !1, !200}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!200 = !{!"0xb\001", !1, !201}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!201 = !{!"0xb\0077\003\008", !1, !197}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!202 = !MDLocation(line: 77, column: 19, scope: !201)
!203 = !MDLocation(line: 77, column: 15, scope: !201)
!204 = !MDLocation(line: 77, column: 3, scope: !197)
!205 = !MDLocation(line: 78, column: 10, scope: !206)
!206 = !{!"0xb\0078\005\009", !1, !201}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!207 = !MDLocation(line: 78, column: 17, scope: !208)
!208 = !{!"0xb\002", !1, !209}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!209 = !{!"0xb\001", !1, !210}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!210 = !{!"0xb\0078\005\0010", !1, !206}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!211 = !MDLocation(line: 78, column: 21, scope: !210)
!212 = !MDLocation(line: 78, column: 17, scope: !210)
!213 = !MDLocation(line: 78, column: 5, scope: !206)
!214 = !MDLocation(line: 80, column: 2, scope: !215)
!215 = !{!"0xb\0079\007\0011", !1, !210}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!216 = !MDLocation(line: 81, column: 7, scope: !217)
!217 = !{!"0xb\0081\002\0012", !1, !215}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!218 = !MDLocation(line: 81, column: 14, scope: !219)
!219 = !{!"0xb\002", !1, !220}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!220 = !{!"0xb\001", !1, !221}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!221 = !{!"0xb\0081\002\0013", !1, !217}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!222 = !MDLocation(line: 81, column: 18, scope: !221)
!223 = !MDLocation(line: 81, column: 14, scope: !221)
!224 = !MDLocation(line: 81, column: 2, scope: !217)
!225 = !MDLocation(line: 83, column: 17, scope: !226)
!226 = !{!"0xb\0082\004\0014", !1, !221}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!227 = !MDLocation(line: 83, column: 30, scope: !226)
!228 = !MDLocation(line: 83, column: 25, scope: !226)
!229 = !MDLocation(line: 83, column: 27, scope: !226)
!230 = !MDLocation(line: 83, column: 40, scope: !226)
!231 = !MDLocation(line: 83, column: 35, scope: !226)
!232 = !MDLocation(line: 83, column: 37, scope: !226)
!233 = !MDLocation(line: 83, column: 11, scope: !226)
!234 = !MDLocation(line: 83, column: 6, scope: !226)
!235 = !MDLocation(line: 83, column: 8, scope: !226)
!236 = !MDLocation(line: 84, column: 18, scope: !226)
!237 = !MDLocation(line: 84, column: 13, scope: !226)
!238 = !MDLocation(line: 84, column: 15, scope: !226)
!239 = !MDLocation(line: 84, column: 28, scope: !226)
!240 = !MDLocation(line: 84, column: 23, scope: !226)
!241 = !MDLocation(line: 84, column: 25, scope: !226)
!242 = !MDLocation(line: 84, column: 6, scope: !226)
!243 = !MDLocation(line: 85, column: 4, scope: !226)
!244 = !MDLocation(line: 81, column: 25, scope: !221)
!245 = !MDLocation(line: 81, column: 2, scope: !221)
!246 = !MDLocation(line: 86, column: 12, scope: !215)
!247 = !MDLocation(line: 86, column: 24, scope: !215)
!248 = !MDLocation(line: 86, column: 19, scope: !215)
!249 = !MDLocation(line: 86, column: 21, scope: !215)
!250 = !MDLocation(line: 86, column: 29, scope: !215)
!251 = !MDLocation(line: 86, column: 42, scope: !215)
!252 = !MDLocation(line: 86, column: 37, scope: !215)
!253 = !MDLocation(line: 86, column: 39, scope: !215)
!254 = !MDLocation(line: 86, column: 52, scope: !215)
!255 = !MDLocation(line: 86, column: 47, scope: !215)
!256 = !MDLocation(line: 86, column: 49, scope: !215)
!257 = !MDLocation(line: 86, column: 57, scope: !215)
!258 = !MDLocation(line: 86, column: 65, scope: !215)
!259 = !MDLocation(line: 86, column: 7, scope: !215)
!260 = !MDLocation(line: 86, column: 2, scope: !215)
!261 = !MDLocation(line: 86, column: 4, scope: !215)
!262 = !MDLocation(line: 87, column: 7, scope: !215)
!263 = !MDLocation(line: 78, column: 25, scope: !210)
!264 = !MDLocation(line: 78, column: 5, scope: !210)
!265 = !MDLocation(line: 87, column: 7, scope: !206)
!266 = !MDLocation(line: 77, column: 23, scope: !201)
!267 = !MDLocation(line: 77, column: 3, scope: !201)
!268 = !MDLocation(line: 90, column: 1, scope: !25)
!269 = !{!"0x101\00ni\0016777264\000", !19, !12, !15} ; [ DW_TAG_arg_variable ] [ni] [line 48]
!270 = !MDLocation(line: 48, column: 22, scope: !19)
!271 = !{!"0x101\00nj\0033554480\000", !19, !12, !15} ; [ DW_TAG_arg_variable ] [nj] [line 48]
!272 = !MDLocation(line: 48, column: 30, scope: !19)
!273 = !{!"0x101\00C\0050331697\000", !19, !12, !22} ; [ DW_TAG_arg_variable ] [C] [line 49]
!274 = !MDLocation(line: 49, column: 14, scope: !19)
!275 = !{!"0x100\00i\0051\000", !19, !12, !15}    ; [ DW_TAG_auto_variable ] [i] [line 51]
!276 = !MDLocation(line: 51, column: 7, scope: !19)
!277 = !{!"0x100\00j\0051\000", !19, !12, !15}    ; [ DW_TAG_auto_variable ] [j] [line 51]
!278 = !MDLocation(line: 51, column: 10, scope: !19)
!279 = !MDLocation(line: 53, column: 8, scope: !280)
!280 = !{!"0xb\0053\003\001", !1, !19}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!281 = !MDLocation(line: 53, column: 15, scope: !282)
!282 = !{!"0xb\002", !1, !283}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!283 = !{!"0xb\001", !1, !284}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!284 = !{!"0xb\0053\003\002", !1, !280}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!285 = !MDLocation(line: 53, column: 19, scope: !284)
!286 = !MDLocation(line: 53, column: 15, scope: !284)
!287 = !MDLocation(line: 53, column: 3, scope: !280)
!288 = !MDLocation(line: 54, column: 10, scope: !289)
!289 = !{!"0xb\0054\005\003", !1, !284}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!290 = !MDLocation(line: 54, column: 17, scope: !291)
!291 = !{!"0xb\002", !1, !292}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!292 = !{!"0xb\001", !1, !293}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!293 = !{!"0xb\0054\005\004", !1, !289}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!294 = !MDLocation(line: 54, column: 21, scope: !293)
!295 = !MDLocation(line: 54, column: 17, scope: !293)
!296 = !MDLocation(line: 54, column: 5, scope: !289)
!297 = !MDLocation(line: 55, column: 11, scope: !298)
!298 = !{!"0xb\0054\0030\005", !1, !293}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!299 = !MDLocation(line: 55, column: 46, scope: !298)
!300 = !MDLocation(line: 55, column: 41, scope: !298)
!301 = !MDLocation(line: 55, column: 43, scope: !298)
!302 = !MDLocation(line: 55, column: 2, scope: !298)
!303 = !MDLocation(line: 56, column: 7, scope: !304)
!304 = !{!"0xb\0056\006\006", !1, !298}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!305 = !MDLocation(line: 56, column: 11, scope: !304)
!306 = !MDLocation(line: 56, column: 16, scope: !304)
!307 = !MDLocation(line: 56, column: 6, scope: !304)
!308 = !MDLocation(line: 56, column: 6, scope: !298)
!309 = !MDLocation(line: 56, column: 39, scope: !310)
!310 = !{!"0xb\001", !1, !304}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/symm/symm.c]
!311 = !MDLocation(line: 56, column: 30, scope: !304)
!312 = !MDLocation(line: 57, column: 5, scope: !298)
!313 = !MDLocation(line: 54, column: 25, scope: !293)
!314 = !MDLocation(line: 54, column: 5, scope: !293)
!315 = !MDLocation(line: 57, column: 5, scope: !289)
!316 = !MDLocation(line: 53, column: 23, scope: !284)
!317 = !MDLocation(line: 53, column: 3, scope: !284)
!318 = !MDLocation(line: 58, column: 12, scope: !19)
!319 = !MDLocation(line: 58, column: 3, scope: !19)
!320 = !MDLocation(line: 59, column: 1, scope: !19)
