; ModuleID = 'syr2k.c'
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
  call void @kernel_syr2k(i32 %8, i32 %9, double %10, double %11, [1024 x double]* %arraydecay5, [1024 x double]* %arraydecay6, [1024 x double]* %arraydecay7), !dbg !67
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
  %19 = load [1024 x [1024 x double]]** %C, align 8, !dbg !73
  %arraydecay9 = getelementptr inbounds [1024 x [1024 x double]]* %19, i32 0, i32 0, !dbg !73
  call void @print_array(i32 %18, [1024 x double]* %arraydecay9), !dbg !73
  br label %if.end, !dbg !73

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %20 = load [1024 x [1024 x double]]** %C, align 8, !dbg !75
  %21 = bitcast [1024 x [1024 x double]]* %20 to i8*, !dbg !75
  call void @free(i8* %21) #6, !dbg !75
  %22 = load [1024 x [1024 x double]]** %A, align 8, !dbg !76
  %23 = bitcast [1024 x [1024 x double]]* %22 to i8*, !dbg !76
  call void @free(i8* %23) #6, !dbg !76
  %24 = load [1024 x [1024 x double]]** %B, align 8, !dbg !77
  %25 = bitcast [1024 x [1024 x double]]* %24 to i8*, !dbg !77
  call void @free(i8* %25) #6, !dbg !77
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
  %11 = load [1024 x double]** %A.addr, align 8, !dbg !126
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
  %21 = load i32* %ni.addr, align 4, !dbg !148
  %cmp21 = icmp slt i32 %20, %21, !dbg !149
  br i1 %cmp21, label %for.body23, label %for.end42, !dbg !150

for.body23:                                       ; preds = %for.cond20
  store i32 0, i32* %j, align 4, !dbg !151
  br label %for.cond24, !dbg !151

for.cond24:                                       ; preds = %for.inc37, %for.body23
  %22 = load i32* %j, align 4, !dbg !153
  %23 = load i32* %ni.addr, align 4, !dbg !157
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
  %29 = load [1024 x double]** %C.addr, align 8, !dbg !166
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
define internal void @kernel_syr2k(i32 %ni, i32 %nj, double %alpha, double %beta, [1024 x double]* %C, [1024 x double]* %A, [1024 x double]* %B) #0 {
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
  store i32 0, i32* %i, align 4, !dbg !194
  br label %for.cond, !dbg !194

for.cond:                                         ; preds = %for.inc6, %entry
  %0 = load i32* %i, align 4, !dbg !196
  %1 = load i32* %ni.addr, align 4, !dbg !200
  %cmp = icmp slt i32 %0, %1, !dbg !201
  br i1 %cmp, label %for.body, label %for.end8, !dbg !202

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !203
  br label %for.cond1, !dbg !203

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32* %j, align 4, !dbg !205
  %3 = load i32* %ni.addr, align 4, !dbg !209
  %cmp2 = icmp slt i32 %2, %3, !dbg !210
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !211

for.body3:                                        ; preds = %for.cond1
  %4 = load double* %beta.addr, align 8, !dbg !212
  %5 = load i32* %j, align 4, !dbg !213
  %idxprom = sext i32 %5 to i64, !dbg !214
  %6 = load i32* %i, align 4, !dbg !215
  %idxprom4 = sext i32 %6 to i64, !dbg !214
  %7 = load [1024 x double]** %C.addr, align 8, !dbg !214
  %arrayidx = getelementptr inbounds [1024 x double]* %7, i64 %idxprom4, !dbg !214
  %arrayidx5 = getelementptr inbounds [1024 x double]* %arrayidx, i32 0, i64 %idxprom, !dbg !214
  %8 = load double* %arrayidx5, align 8, !dbg !214
  %mul = fmul double %8, %4, !dbg !214
  store double %mul, double* %arrayidx5, align 8, !dbg !214
  br label %for.inc, !dbg !214

for.inc:                                          ; preds = %for.body3
  %9 = load i32* %j, align 4, !dbg !216
  %inc = add nsw i32 %9, 1, !dbg !216
  store i32 %inc, i32* %j, align 4, !dbg !216
  br label %for.cond1, !dbg !217

for.end:                                          ; preds = %for.cond1
  br label %for.inc6, !dbg !218

for.inc6:                                         ; preds = %for.end
  %10 = load i32* %i, align 4, !dbg !219
  %inc7 = add nsw i32 %10, 1, !dbg !219
  store i32 %inc7, i32* %i, align 4, !dbg !219
  br label %for.cond, !dbg !220

for.end8:                                         ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !221
  br label %for.cond9, !dbg !221

for.cond9:                                        ; preds = %for.inc53, %for.end8
  %11 = load i32* %i, align 4, !dbg !223
  %12 = load i32* %ni.addr, align 4, !dbg !227
  %cmp10 = icmp slt i32 %11, %12, !dbg !228
  br i1 %cmp10, label %for.body11, label %for.end55, !dbg !229

for.body11:                                       ; preds = %for.cond9
  store i32 0, i32* %j, align 4, !dbg !230
  br label %for.cond12, !dbg !230

for.cond12:                                       ; preds = %for.inc50, %for.body11
  %13 = load i32* %j, align 4, !dbg !232
  %14 = load i32* %ni.addr, align 4, !dbg !236
  %cmp13 = icmp slt i32 %13, %14, !dbg !237
  br i1 %cmp13, label %for.body14, label %for.end52, !dbg !238

for.body14:                                       ; preds = %for.cond12
  store i32 0, i32* %k, align 4, !dbg !239
  br label %for.cond15, !dbg !239

for.cond15:                                       ; preds = %for.inc47, %for.body14
  %15 = load i32* %k, align 4, !dbg !241
  %16 = load i32* %nj.addr, align 4, !dbg !245
  %cmp16 = icmp slt i32 %15, %16, !dbg !246
  br i1 %cmp16, label %for.body17, label %for.end49, !dbg !247

for.body17:                                       ; preds = %for.cond15
  %17 = load double* %alpha.addr, align 8, !dbg !248
  %18 = load i32* %k, align 4, !dbg !250
  %idxprom18 = sext i32 %18 to i64, !dbg !251
  %19 = load i32* %i, align 4, !dbg !252
  %idxprom19 = sext i32 %19 to i64, !dbg !251
  %20 = load [1024 x double]** %A.addr, align 8, !dbg !251
  %arrayidx20 = getelementptr inbounds [1024 x double]* %20, i64 %idxprom19, !dbg !251
  %arrayidx21 = getelementptr inbounds [1024 x double]* %arrayidx20, i32 0, i64 %idxprom18, !dbg !251
  %21 = load double* %arrayidx21, align 8, !dbg !251
  %mul22 = fmul double %17, %21, !dbg !248
  %22 = load i32* %k, align 4, !dbg !253
  %idxprom23 = sext i32 %22 to i64, !dbg !254
  %23 = load i32* %j, align 4, !dbg !255
  %idxprom24 = sext i32 %23 to i64, !dbg !254
  %24 = load [1024 x double]** %B.addr, align 8, !dbg !254
  %arrayidx25 = getelementptr inbounds [1024 x double]* %24, i64 %idxprom24, !dbg !254
  %arrayidx26 = getelementptr inbounds [1024 x double]* %arrayidx25, i32 0, i64 %idxprom23, !dbg !254
  %25 = load double* %arrayidx26, align 8, !dbg !254
  %mul27 = fmul double %mul22, %25, !dbg !248
  %26 = load i32* %j, align 4, !dbg !256
  %idxprom28 = sext i32 %26 to i64, !dbg !257
  %27 = load i32* %i, align 4, !dbg !258
  %idxprom29 = sext i32 %27 to i64, !dbg !257
  %28 = load [1024 x double]** %C.addr, align 8, !dbg !257
  %arrayidx30 = getelementptr inbounds [1024 x double]* %28, i64 %idxprom29, !dbg !257
  %arrayidx31 = getelementptr inbounds [1024 x double]* %arrayidx30, i32 0, i64 %idxprom28, !dbg !257
  %29 = load double* %arrayidx31, align 8, !dbg !257
  %add = fadd double %29, %mul27, !dbg !257
  store double %add, double* %arrayidx31, align 8, !dbg !257
  %30 = load double* %alpha.addr, align 8, !dbg !259
  %31 = load i32* %k, align 4, !dbg !260
  %idxprom32 = sext i32 %31 to i64, !dbg !261
  %32 = load i32* %i, align 4, !dbg !262
  %idxprom33 = sext i32 %32 to i64, !dbg !261
  %33 = load [1024 x double]** %B.addr, align 8, !dbg !261
  %arrayidx34 = getelementptr inbounds [1024 x double]* %33, i64 %idxprom33, !dbg !261
  %arrayidx35 = getelementptr inbounds [1024 x double]* %arrayidx34, i32 0, i64 %idxprom32, !dbg !261
  %34 = load double* %arrayidx35, align 8, !dbg !261
  %mul36 = fmul double %30, %34, !dbg !259
  %35 = load i32* %k, align 4, !dbg !263
  %idxprom37 = sext i32 %35 to i64, !dbg !264
  %36 = load i32* %j, align 4, !dbg !265
  %idxprom38 = sext i32 %36 to i64, !dbg !264
  %37 = load [1024 x double]** %A.addr, align 8, !dbg !264
  %arrayidx39 = getelementptr inbounds [1024 x double]* %37, i64 %idxprom38, !dbg !264
  %arrayidx40 = getelementptr inbounds [1024 x double]* %arrayidx39, i32 0, i64 %idxprom37, !dbg !264
  %38 = load double* %arrayidx40, align 8, !dbg !264
  %mul41 = fmul double %mul36, %38, !dbg !259
  %39 = load i32* %j, align 4, !dbg !266
  %idxprom42 = sext i32 %39 to i64, !dbg !267
  %40 = load i32* %i, align 4, !dbg !268
  %idxprom43 = sext i32 %40 to i64, !dbg !267
  %41 = load [1024 x double]** %C.addr, align 8, !dbg !267
  %arrayidx44 = getelementptr inbounds [1024 x double]* %41, i64 %idxprom43, !dbg !267
  %arrayidx45 = getelementptr inbounds [1024 x double]* %arrayidx44, i32 0, i64 %idxprom42, !dbg !267
  %42 = load double* %arrayidx45, align 8, !dbg !267
  %add46 = fadd double %42, %mul41, !dbg !267
  store double %add46, double* %arrayidx45, align 8, !dbg !267
  br label %for.inc47, !dbg !269

for.inc47:                                        ; preds = %for.body17
  %43 = load i32* %k, align 4, !dbg !270
  %inc48 = add nsw i32 %43, 1, !dbg !270
  store i32 %inc48, i32* %k, align 4, !dbg !270
  br label %for.cond15, !dbg !271

for.end49:                                        ; preds = %for.cond15
  br label %for.inc50, !dbg !272

for.inc50:                                        ; preds = %for.end49
  %44 = load i32* %j, align 4, !dbg !273
  %inc51 = add nsw i32 %44, 1, !dbg !273
  store i32 %inc51, i32* %j, align 4, !dbg !273
  br label %for.cond12, !dbg !274

for.end52:                                        ; preds = %for.cond12
  br label %for.inc53, !dbg !275

for.inc53:                                        ; preds = %for.end52
  %45 = load i32* %i, align 4, !dbg !276
  %inc54 = add nsw i32 %45, 1, !dbg !276
  store i32 %inc54, i32* %i, align 4, !dbg !276
  br label %for.cond9, !dbg !277

for.end55:                                        ; preds = %for.cond9
  ret void, !dbg !278
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #3

; Function Attrs: nounwind uwtable
define internal void @print_array(i32 %ni, [1024 x double]* %C) #0 {
entry:
  %ni.addr = alloca i32, align 4
  %C.addr = alloca [1024 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %ni, i32* %ni.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ni.addr, metadata !279, metadata !36), !dbg !280
  store [1024 x double]* %C, [1024 x double]** %C.addr, align 8
  call void @llvm.dbg.declare(metadata [1024 x double]** %C.addr, metadata !281, metadata !36), !dbg !282
  call void @llvm.dbg.declare(metadata i32* %i, metadata !283, metadata !36), !dbg !284
  call void @llvm.dbg.declare(metadata i32* %j, metadata !285, metadata !36), !dbg !286
  store i32 0, i32* %i, align 4, !dbg !287
  br label %for.cond, !dbg !287

for.cond:                                         ; preds = %for.inc8, %entry
  %0 = load i32* %i, align 4, !dbg !289
  %1 = load i32* %ni.addr, align 4, !dbg !293
  %cmp = icmp slt i32 %0, %1, !dbg !294
  br i1 %cmp, label %for.body, label %for.end10, !dbg !295

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !296
  br label %for.cond1, !dbg !296

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32* %j, align 4, !dbg !298
  %3 = load i32* %ni.addr, align 4, !dbg !302
  %cmp2 = icmp slt i32 %2, %3, !dbg !303
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !304

for.body3:                                        ; preds = %for.cond1
  %4 = load %struct._IO_FILE** @stderr, align 8, !dbg !305
  %5 = load i32* %j, align 4, !dbg !307
  %idxprom = sext i32 %5 to i64, !dbg !308
  %6 = load i32* %i, align 4, !dbg !309
  %idxprom4 = sext i32 %6 to i64, !dbg !308
  %7 = load [1024 x double]** %C.addr, align 8, !dbg !308
  %arrayidx = getelementptr inbounds [1024 x double]* %7, i64 %idxprom4, !dbg !308
  %arrayidx5 = getelementptr inbounds [1024 x double]* %arrayidx, i32 0, i64 %idxprom, !dbg !308
  %8 = load double* %arrayidx5, align 8, !dbg !308
  %call = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([8 x i8]* @.str1, i32 0, i32 0), double %8), !dbg !310
  %9 = load i32* %i, align 4, !dbg !311
  %10 = load i32* %ni.addr, align 4, !dbg !313
  %mul = mul nsw i32 %9, %10, !dbg !311
  %11 = load i32* %j, align 4, !dbg !314
  %add = add nsw i32 %mul, %11, !dbg !311
  %rem = srem i32 %add, 20, !dbg !315
  %cmp6 = icmp eq i32 %rem, 0, !dbg !315
  br i1 %cmp6, label %if.then, label %if.end, !dbg !316

if.then:                                          ; preds = %for.body3
  %12 = load %struct._IO_FILE** @stderr, align 8, !dbg !317
  %call7 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)), !dbg !319
  br label %if.end, !dbg !319

if.end:                                           ; preds = %if.then, %for.body3
  br label %for.inc, !dbg !320

for.inc:                                          ; preds = %if.end
  %13 = load i32* %j, align 4, !dbg !321
  %inc = add nsw i32 %13, 1, !dbg !321
  store i32 %inc, i32* %j, align 4, !dbg !321
  br label %for.cond1, !dbg !322

for.end:                                          ; preds = %for.cond1
  br label %for.inc8, !dbg !323

for.inc8:                                         ; preds = %for.end
  %14 = load i32* %i, align 4, !dbg !324
  %inc9 = add nsw i32 %14, 1, !dbg !324
  store i32 %inc9, i32* %i, align 4, !dbg !324
  br label %for.cond, !dbg !325

for.end10:                                        ; preds = %for.cond
  %15 = load %struct._IO_FILE** @stderr, align 8, !dbg !326
  %call11 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)), !dbg !327
  ret void, !dbg !328
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

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\000\00\000\00\001", !1, !2, !3, !10, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c] [DW_LANG_C99]
!1 = !{!"syr2k.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k"}
!2 = !{}
!3 = !{!4, !9, !6}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!5 = !{!"0x1\00\000\0067108864\0064\000\000\000", null, null, !6, !7, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 67108864, align 64, offset 0] [from double]
!6 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!7 = !{!8, !8}
!8 = !{!"0x21\000\001024"}                        ; [ DW_TAG_subrange_type ] [0, 1023]
!9 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = !{!11, !19, !25, !28}
!11 = !{!"0x2e\00main\00main\00\0091\000\001\000\000\00256\000\0092", !1, !12, !13, null, i32 (i32, i8**)* @main, null, null, !2} ; [ DW_TAG_subprogram ] [line 91] [def] [scope 92] [main]
!12 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!13 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !14, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = !{!15, !15, !16}
!15 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!16 = !{!"0xf\00\000\0064\0064\000\000", null, null, !17} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!17 = !{!"0xf\00\000\0064\0064\000\000", null, null, !18} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!18 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!19 = !{!"0x2e\00print_array\00print_array\00\0048\001\001\000\000\00256\000\0050", !1, !12, !20, null, void (i32, [1024 x double]*)* @print_array, null, null, !2} ; [ DW_TAG_subprogram ] [line 48] [local] [def] [scope 50] [print_array]
!20 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !21, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!21 = !{null, !15, !22}
!22 = !{!"0xf\00\000\0064\0064\000\000", null, null, !23} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!23 = !{!"0x1\00\000\0065536\0064\000\000\000", null, null, !6, !24, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 65536, align 64, offset 0] [from double]
!24 = !{!8}
!25 = !{!"0x2e\00kernel_syr2k\00kernel_syr2k\00\0065\001\001\000\000\00256\000\0071", !1, !12, !26, null, void (i32, i32, double, double, [1024 x double]*, [1024 x double]*, [1024 x double]*)* @kernel_syr2k, null, null, !2} ; [ DW_TAG_subprogram ] [line 65] [local] [def] [scope 71] [kernel_syr2k]
!26 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !27, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!27 = !{null, !15, !15, !6, !6, !22, !22, !22}
!28 = !{!"0x2e\00init_array\00init_array\00\0023\001\001\000\000\00256\000\0029", !1, !12, !29, null, void (i32, i32, double*, double*, [1024 x double]*, [1024 x double]*, [1024 x double]*)* @init_array, null, null, !2} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [scope 29] [init_array]
!29 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !30, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!30 = !{null, !15, !15, !31, !31, !22, !22, !22}
!31 = !{!"0xf\00\000\0064\0064\000\000", null, null, !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!32 = !{i32 2, !"Dwarf Version", i32 4}
!33 = !{i32 2, !"Debug Info Version", i32 2}
!34 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!35 = !{!"0x101\00argc\0016777307\000", !11, !12, !15} ; [ DW_TAG_arg_variable ] [argc] [line 91]
!36 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!37 = !MDLocation(line: 91, column: 14, scope: !11)
!38 = !{!"0x101\00argv\0033554523\000", !11, !12, !16} ; [ DW_TAG_arg_variable ] [argv] [line 91]
!39 = !MDLocation(line: 91, column: 27, scope: !11)
!40 = !{!"0x100\00ni\0094\000", !11, !12, !15}    ; [ DW_TAG_auto_variable ] [ni] [line 94]
!41 = !MDLocation(line: 94, column: 7, scope: !11)
!42 = !{!"0x100\00nj\0095\000", !11, !12, !15}    ; [ DW_TAG_auto_variable ] [nj] [line 95]
!43 = !MDLocation(line: 95, column: 7, scope: !11)
!44 = !{!"0x100\00alpha\0098\000", !11, !12, !6}  ; [ DW_TAG_auto_variable ] [alpha] [line 98]
!45 = !MDLocation(line: 98, column: 13, scope: !11)
!46 = !{!"0x100\00beta\0099\000", !11, !12, !6}   ; [ DW_TAG_auto_variable ] [beta] [line 99]
!47 = !MDLocation(line: 99, column: 13, scope: !11)
!48 = !{!"0x100\00C\00100\000", !11, !12, !4}     ; [ DW_TAG_auto_variable ] [C] [line 100]
!49 = !MDLocation(line: 100, column: 3, scope: !11)
!50 = !{!"0x100\00A\00101\000", !11, !12, !4}     ; [ DW_TAG_auto_variable ] [A] [line 101]
!51 = !MDLocation(line: 101, column: 3, scope: !11)
!52 = !{!"0x100\00B\00102\000", !11, !12, !4}     ; [ DW_TAG_auto_variable ] [B] [line 102]
!53 = !MDLocation(line: 102, column: 3, scope: !11)
!54 = !MDLocation(line: 105, column: 15, scope: !11)
!55 = !MDLocation(line: 105, column: 19, scope: !11)
!56 = !MDLocation(line: 106, column: 8, scope: !11)
!57 = !MDLocation(line: 107, column: 8, scope: !11)
!58 = !MDLocation(line: 108, column: 8, scope: !11)
!59 = !MDLocation(line: 105, column: 3, scope: !11)
!60 = !MDLocation(line: 114, column: 17, scope: !11)
!61 = !MDLocation(line: 114, column: 21, scope: !11)
!62 = !MDLocation(line: 115, column: 3, scope: !11)
!63 = !MDLocation(line: 115, column: 10, scope: !11)
!64 = !MDLocation(line: 116, column: 3, scope: !11)
!65 = !MDLocation(line: 117, column: 3, scope: !11)
!66 = !MDLocation(line: 118, column: 3, scope: !11)
!67 = !MDLocation(line: 114, column: 3, scope: !11)
!68 = !MDLocation(line: 126, column: 3, scope: !69)
!69 = !{!"0xb\00126\003\000", !1, !11}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!70 = !MDLocation(line: 126, column: 3, scope: !11)
!71 = !MDLocation(line: 126, column: 3, scope: !72)
!72 = !{!"0xb\001", !1, !69}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!73 = !MDLocation(line: 126, column: 3, scope: !74)
!74 = !{!"0xb\002", !1, !69}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!75 = !MDLocation(line: 129, column: 3, scope: !11)
!76 = !MDLocation(line: 130, column: 3, scope: !11)
!77 = !MDLocation(line: 131, column: 3, scope: !11)
!78 = !MDLocation(line: 133, column: 3, scope: !11)
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
!102 = !{!"0xb\0034\003\0018", !1, !28}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!103 = !MDLocation(line: 34, column: 15, scope: !104)
!104 = !{!"0xb\002", !1, !105}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!105 = !{!"0xb\001", !1, !106}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!106 = !{!"0xb\0034\003\0019", !1, !102}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!107 = !MDLocation(line: 34, column: 19, scope: !106)
!108 = !MDLocation(line: 34, column: 15, scope: !106)
!109 = !MDLocation(line: 34, column: 3, scope: !102)
!110 = !MDLocation(line: 35, column: 10, scope: !111)
!111 = !{!"0xb\0035\005\0020", !1, !106}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!112 = !MDLocation(line: 35, column: 17, scope: !113)
!113 = !{!"0xb\002", !1, !114}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!114 = !{!"0xb\001", !1, !115}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!115 = !{!"0xb\0035\005\0021", !1, !111}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!116 = !MDLocation(line: 35, column: 21, scope: !115)
!117 = !MDLocation(line: 35, column: 17, scope: !115)
!118 = !MDLocation(line: 35, column: 5, scope: !111)
!119 = !MDLocation(line: 36, column: 30, scope: !120)
!120 = !{!"0xb\0035\0030\0022", !1, !115}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
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
!143 = !{!"0xb\0039\003\0023", !1, !28}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!144 = !MDLocation(line: 39, column: 15, scope: !145)
!145 = !{!"0xb\002", !1, !146}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!146 = !{!"0xb\001", !1, !147}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!147 = !{!"0xb\0039\003\0024", !1, !143}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!148 = !MDLocation(line: 39, column: 19, scope: !147)
!149 = !MDLocation(line: 39, column: 15, scope: !147)
!150 = !MDLocation(line: 39, column: 3, scope: !143)
!151 = !MDLocation(line: 40, column: 10, scope: !152)
!152 = !{!"0xb\0040\005\0025", !1, !147}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!153 = !MDLocation(line: 40, column: 17, scope: !154)
!154 = !{!"0xb\002", !1, !155}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!155 = !{!"0xb\001", !1, !156}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!156 = !{!"0xb\0040\005\0026", !1, !152}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
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
!175 = !MDLocation(line: 65, column: 23, scope: !25)
!176 = !{!"0x101\00nj\0033554497\000", !25, !12, !15} ; [ DW_TAG_arg_variable ] [nj] [line 65]
!177 = !MDLocation(line: 65, column: 31, scope: !25)
!178 = !{!"0x101\00alpha\0050331714\000", !25, !12, !6} ; [ DW_TAG_arg_variable ] [alpha] [line 66]
!179 = !MDLocation(line: 66, column: 15, scope: !25)
!180 = !{!"0x101\00beta\0067108931\000", !25, !12, !6} ; [ DW_TAG_arg_variable ] [beta] [line 67]
!181 = !MDLocation(line: 67, column: 15, scope: !25)
!182 = !{!"0x101\00C\0083886148\000", !25, !12, !22} ; [ DW_TAG_arg_variable ] [C] [line 68]
!183 = !MDLocation(line: 68, column: 15, scope: !25)
!184 = !{!"0x101\00A\00100663365\000", !25, !12, !22} ; [ DW_TAG_arg_variable ] [A] [line 69]
!185 = !MDLocation(line: 69, column: 15, scope: !25)
!186 = !{!"0x101\00B\00117440582\000", !25, !12, !22} ; [ DW_TAG_arg_variable ] [B] [line 70]
!187 = !MDLocation(line: 70, column: 15, scope: !25)
!188 = !{!"0x100\00i\0072\000", !25, !12, !15}    ; [ DW_TAG_auto_variable ] [i] [line 72]
!189 = !MDLocation(line: 72, column: 7, scope: !25)
!190 = !{!"0x100\00j\0072\000", !25, !12, !15}    ; [ DW_TAG_auto_variable ] [j] [line 72]
!191 = !MDLocation(line: 72, column: 10, scope: !25)
!192 = !{!"0x100\00k\0072\000", !25, !12, !15}    ; [ DW_TAG_auto_variable ] [k] [line 72]
!193 = !MDLocation(line: 72, column: 13, scope: !25)
!194 = !MDLocation(line: 76, column: 8, scope: !195)
!195 = !{!"0xb\0076\003\007", !1, !25}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!196 = !MDLocation(line: 76, column: 15, scope: !197)
!197 = !{!"0xb\002", !1, !198}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!198 = !{!"0xb\001", !1, !199}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!199 = !{!"0xb\0076\003\008", !1, !195}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!200 = !MDLocation(line: 76, column: 19, scope: !199)
!201 = !MDLocation(line: 76, column: 15, scope: !199)
!202 = !MDLocation(line: 76, column: 3, scope: !195)
!203 = !MDLocation(line: 77, column: 10, scope: !204)
!204 = !{!"0xb\0077\005\009", !1, !199}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!205 = !MDLocation(line: 77, column: 17, scope: !206)
!206 = !{!"0xb\002", !1, !207}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!207 = !{!"0xb\001", !1, !208}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!208 = !{!"0xb\0077\005\0010", !1, !204}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!209 = !MDLocation(line: 77, column: 21, scope: !208)
!210 = !MDLocation(line: 77, column: 17, scope: !208)
!211 = !MDLocation(line: 77, column: 5, scope: !204)
!212 = !MDLocation(line: 78, column: 18, scope: !208)
!213 = !MDLocation(line: 78, column: 12, scope: !208)
!214 = !MDLocation(line: 78, column: 7, scope: !208)
!215 = !MDLocation(line: 78, column: 9, scope: !208)
!216 = !MDLocation(line: 77, column: 25, scope: !208)
!217 = !MDLocation(line: 77, column: 5, scope: !208)
!218 = !MDLocation(line: 78, column: 18, scope: !204)
!219 = !MDLocation(line: 76, column: 23, scope: !199)
!220 = !MDLocation(line: 76, column: 3, scope: !199)
!221 = !MDLocation(line: 79, column: 8, scope: !222)
!222 = !{!"0xb\0079\003\0011", !1, !25}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!223 = !MDLocation(line: 79, column: 15, scope: !224)
!224 = !{!"0xb\002", !1, !225}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!225 = !{!"0xb\001", !1, !226}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!226 = !{!"0xb\0079\003\0012", !1, !222}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!227 = !MDLocation(line: 79, column: 19, scope: !226)
!228 = !MDLocation(line: 79, column: 15, scope: !226)
!229 = !MDLocation(line: 79, column: 3, scope: !222)
!230 = !MDLocation(line: 80, column: 10, scope: !231)
!231 = !{!"0xb\0080\005\0013", !1, !226}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!232 = !MDLocation(line: 80, column: 17, scope: !233)
!233 = !{!"0xb\002", !1, !234}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!234 = !{!"0xb\001", !1, !235}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!235 = !{!"0xb\0080\005\0014", !1, !231}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!236 = !MDLocation(line: 80, column: 21, scope: !235)
!237 = !MDLocation(line: 80, column: 17, scope: !235)
!238 = !MDLocation(line: 80, column: 5, scope: !231)
!239 = !MDLocation(line: 81, column: 12, scope: !240)
!240 = !{!"0xb\0081\007\0015", !1, !235}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!241 = !MDLocation(line: 81, column: 19, scope: !242)
!242 = !{!"0xb\002", !1, !243}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!243 = !{!"0xb\001", !1, !244}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!244 = !{!"0xb\0081\007\0016", !1, !240}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!245 = !MDLocation(line: 81, column: 23, scope: !244)
!246 = !MDLocation(line: 81, column: 19, scope: !244)
!247 = !MDLocation(line: 81, column: 7, scope: !240)
!248 = !MDLocation(line: 83, column: 15, scope: !249)
!249 = !{!"0xb\0082\002\0017", !1, !244}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!250 = !MDLocation(line: 83, column: 28, scope: !249)
!251 = !MDLocation(line: 83, column: 23, scope: !249)
!252 = !MDLocation(line: 83, column: 25, scope: !249)
!253 = !MDLocation(line: 83, column: 38, scope: !249)
!254 = !MDLocation(line: 83, column: 33, scope: !249)
!255 = !MDLocation(line: 83, column: 35, scope: !249)
!256 = !MDLocation(line: 83, column: 9, scope: !249)
!257 = !MDLocation(line: 83, column: 4, scope: !249)
!258 = !MDLocation(line: 83, column: 6, scope: !249)
!259 = !MDLocation(line: 84, column: 15, scope: !249)
!260 = !MDLocation(line: 84, column: 28, scope: !249)
!261 = !MDLocation(line: 84, column: 23, scope: !249)
!262 = !MDLocation(line: 84, column: 25, scope: !249)
!263 = !MDLocation(line: 84, column: 38, scope: !249)
!264 = !MDLocation(line: 84, column: 33, scope: !249)
!265 = !MDLocation(line: 84, column: 35, scope: !249)
!266 = !MDLocation(line: 84, column: 9, scope: !249)
!267 = !MDLocation(line: 84, column: 4, scope: !249)
!268 = !MDLocation(line: 84, column: 6, scope: !249)
!269 = !MDLocation(line: 85, column: 2, scope: !249)
!270 = !MDLocation(line: 81, column: 27, scope: !244)
!271 = !MDLocation(line: 81, column: 7, scope: !244)
!272 = !MDLocation(line: 85, column: 2, scope: !240)
!273 = !MDLocation(line: 80, column: 25, scope: !235)
!274 = !MDLocation(line: 80, column: 5, scope: !235)
!275 = !MDLocation(line: 85, column: 2, scope: !231)
!276 = !MDLocation(line: 79, column: 23, scope: !226)
!277 = !MDLocation(line: 79, column: 3, scope: !226)
!278 = !MDLocation(line: 88, column: 1, scope: !25)
!279 = !{!"0x101\00ni\0016777264\000", !19, !12, !15} ; [ DW_TAG_arg_variable ] [ni] [line 48]
!280 = !MDLocation(line: 48, column: 22, scope: !19)
!281 = !{!"0x101\00C\0033554481\000", !19, !12, !22} ; [ DW_TAG_arg_variable ] [C] [line 49]
!282 = !MDLocation(line: 49, column: 14, scope: !19)
!283 = !{!"0x100\00i\0051\000", !19, !12, !15}    ; [ DW_TAG_auto_variable ] [i] [line 51]
!284 = !MDLocation(line: 51, column: 7, scope: !19)
!285 = !{!"0x100\00j\0051\000", !19, !12, !15}    ; [ DW_TAG_auto_variable ] [j] [line 51]
!286 = !MDLocation(line: 51, column: 10, scope: !19)
!287 = !MDLocation(line: 53, column: 8, scope: !288)
!288 = !{!"0xb\0053\003\001", !1, !19}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!289 = !MDLocation(line: 53, column: 15, scope: !290)
!290 = !{!"0xb\002", !1, !291}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!291 = !{!"0xb\001", !1, !292}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!292 = !{!"0xb\0053\003\002", !1, !288}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!293 = !MDLocation(line: 53, column: 19, scope: !292)
!294 = !MDLocation(line: 53, column: 15, scope: !292)
!295 = !MDLocation(line: 53, column: 3, scope: !288)
!296 = !MDLocation(line: 54, column: 10, scope: !297)
!297 = !{!"0xb\0054\005\003", !1, !292}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!298 = !MDLocation(line: 54, column: 17, scope: !299)
!299 = !{!"0xb\002", !1, !300}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!300 = !{!"0xb\001", !1, !301}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!301 = !{!"0xb\0054\005\004", !1, !297}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!302 = !MDLocation(line: 54, column: 21, scope: !301)
!303 = !MDLocation(line: 54, column: 17, scope: !301)
!304 = !MDLocation(line: 54, column: 5, scope: !297)
!305 = !MDLocation(line: 55, column: 11, scope: !306)
!306 = !{!"0xb\0054\0030\005", !1, !301}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!307 = !MDLocation(line: 55, column: 46, scope: !306)
!308 = !MDLocation(line: 55, column: 41, scope: !306)
!309 = !MDLocation(line: 55, column: 43, scope: !306)
!310 = !MDLocation(line: 55, column: 2, scope: !306)
!311 = !MDLocation(line: 56, column: 7, scope: !312)
!312 = !{!"0xb\0056\006\006", !1, !306}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!313 = !MDLocation(line: 56, column: 11, scope: !312)
!314 = !MDLocation(line: 56, column: 16, scope: !312)
!315 = !MDLocation(line: 56, column: 6, scope: !312)
!316 = !MDLocation(line: 56, column: 6, scope: !306)
!317 = !MDLocation(line: 56, column: 39, scope: !318)
!318 = !{!"0xb\001", !1, !312}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!319 = !MDLocation(line: 56, column: 30, scope: !312)
!320 = !MDLocation(line: 57, column: 5, scope: !306)
!321 = !MDLocation(line: 54, column: 25, scope: !301)
!322 = !MDLocation(line: 54, column: 5, scope: !301)
!323 = !MDLocation(line: 57, column: 5, scope: !297)
!324 = !MDLocation(line: 53, column: 23, scope: !292)
!325 = !MDLocation(line: 53, column: 3, scope: !292)
!326 = !MDLocation(line: 58, column: 12, scope: !19)
!327 = !MDLocation(line: 58, column: 3, scope: !19)
!328 = !MDLocation(line: 59, column: 1, scope: !19)
