; ModuleID = 'syrk.c'
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
  %2 = load i32* %ni, align 4, !dbg !52
  %3 = load i32* %nj, align 4, !dbg !53
  %4 = load [1024 x [1024 x double]]** %C, align 8, !dbg !54
  %arraydecay = getelementptr inbounds [1024 x [1024 x double]]* %4, i32 0, i32 0, !dbg !54
  %5 = load [1024 x [1024 x double]]** %A, align 8, !dbg !55
  %arraydecay2 = getelementptr inbounds [1024 x [1024 x double]]* %5, i32 0, i32 0, !dbg !55
  call void @init_array(i32 %2, i32 %3, double* %alpha, double* %beta, [1024 x double]* %arraydecay, [1024 x double]* %arraydecay2), !dbg !56
  %6 = load i32* %ni, align 4, !dbg !57
  %7 = load i32* %nj, align 4, !dbg !58
  %8 = load double* %alpha, align 8, !dbg !59
  %9 = load double* %beta, align 8, !dbg !60
  %10 = load [1024 x [1024 x double]]** %C, align 8, !dbg !61
  %arraydecay3 = getelementptr inbounds [1024 x [1024 x double]]* %10, i32 0, i32 0, !dbg !61
  %11 = load [1024 x [1024 x double]]** %A, align 8, !dbg !62
  %arraydecay4 = getelementptr inbounds [1024 x [1024 x double]]* %11, i32 0, i32 0, !dbg !62
  call void @kernel_syrk(i32 %6, i32 %7, double %8, double %9, [1024 x double]* %arraydecay3, [1024 x double]* %arraydecay4), !dbg !63
  %12 = load i32* %argc.addr, align 4, !dbg !64
  %cmp = icmp sgt i32 %12, 42, !dbg !64
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !66

land.lhs.true:                                    ; preds = %entry
  %13 = load i8*** %argv.addr, align 8, !dbg !67
  %arrayidx = getelementptr inbounds i8** %13, i64 0, !dbg !67
  %14 = load i8** %arrayidx, align 8, !dbg !67
  %call5 = call i32 @strcmp(i8* %14, i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0)) #5, !dbg !67
  %tobool = icmp ne i32 %call5, 0, !dbg !66
  br i1 %tobool, label %if.end, label %if.then, !dbg !66

if.then:                                          ; preds = %land.lhs.true
  %15 = load i32* %ni, align 4, !dbg !69
  %16 = load [1024 x [1024 x double]]** %C, align 8, !dbg !69
  %arraydecay6 = getelementptr inbounds [1024 x [1024 x double]]* %16, i32 0, i32 0, !dbg !69
  call void @print_array(i32 %15, [1024 x double]* %arraydecay6), !dbg !69
  br label %if.end, !dbg !69

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %17 = load [1024 x [1024 x double]]** %C, align 8, !dbg !71
  %18 = bitcast [1024 x [1024 x double]]* %17 to i8*, !dbg !71
  call void @free(i8* %18) #6, !dbg !71
  %19 = load [1024 x [1024 x double]]** %A, align 8, !dbg !72
  %20 = bitcast [1024 x [1024 x double]]* %19 to i8*, !dbg !72
  call void @free(i8* %20) #6, !dbg !72
  ret i32 0, !dbg !73
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i8* @polybench_alloc_data(i32, i32) #2

; Function Attrs: nounwind uwtable
define internal void @init_array(i32 %ni, i32 %nj, double* %alpha, double* %beta, [1024 x double]* %C, [1024 x double]* %A) #0 {
entry:
  %ni.addr = alloca i32, align 4
  %nj.addr = alloca i32, align 4
  %alpha.addr = alloca double*, align 8
  %beta.addr = alloca double*, align 8
  %C.addr = alloca [1024 x double]*, align 8
  %A.addr = alloca [1024 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %ni, i32* %ni.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ni.addr, metadata !74, metadata !36), !dbg !75
  store i32 %nj, i32* %nj.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nj.addr, metadata !76, metadata !36), !dbg !77
  store double* %alpha, double** %alpha.addr, align 8
  call void @llvm.dbg.declare(metadata double** %alpha.addr, metadata !78, metadata !36), !dbg !79
  store double* %beta, double** %beta.addr, align 8
  call void @llvm.dbg.declare(metadata double** %beta.addr, metadata !80, metadata !36), !dbg !81
  store [1024 x double]* %C, [1024 x double]** %C.addr, align 8
  call void @llvm.dbg.declare(metadata [1024 x double]** %C.addr, metadata !82, metadata !36), !dbg !83
  store [1024 x double]* %A, [1024 x double]** %A.addr, align 8
  call void @llvm.dbg.declare(metadata [1024 x double]** %A.addr, metadata !84, metadata !36), !dbg !85
  call void @llvm.dbg.declare(metadata i32* %i, metadata !86, metadata !36), !dbg !87
  call void @llvm.dbg.declare(metadata i32* %j, metadata !88, metadata !36), !dbg !89
  %0 = load double** %alpha.addr, align 8, !dbg !90
  store double 3.241200e+04, double* %0, align 8, !dbg !91
  %1 = load double** %beta.addr, align 8, !dbg !92
  store double 2.123000e+03, double* %1, align 8, !dbg !93
  store i32 0, i32* %i, align 4, !dbg !94
  br label %for.cond, !dbg !94

for.cond:                                         ; preds = %for.inc8, %entry
  %2 = load i32* %i, align 4, !dbg !96
  %3 = load i32* %ni.addr, align 4, !dbg !100
  %cmp = icmp slt i32 %2, %3, !dbg !101
  br i1 %cmp, label %for.body, label %for.end10, !dbg !102

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !103
  br label %for.cond1, !dbg !103

for.cond1:                                        ; preds = %for.inc, %for.body
  %4 = load i32* %j, align 4, !dbg !105
  %5 = load i32* %nj.addr, align 4, !dbg !109
  %cmp2 = icmp slt i32 %4, %5, !dbg !110
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !111

for.body3:                                        ; preds = %for.cond1
  %6 = load i32* %i, align 4, !dbg !112
  %conv = sitofp i32 %6 to double, !dbg !113
  %7 = load i32* %j, align 4, !dbg !114
  %conv4 = sitofp i32 %7 to double, !dbg !114
  %mul = fmul double %conv, %conv4, !dbg !113
  %8 = load i32* %ni.addr, align 4, !dbg !115
  %conv5 = sitofp i32 %8 to double, !dbg !115
  %div = fdiv double %mul, %conv5, !dbg !116
  %9 = load i32* %j, align 4, !dbg !117
  %idxprom = sext i32 %9 to i64, !dbg !118
  %10 = load i32* %i, align 4, !dbg !119
  %idxprom6 = sext i32 %10 to i64, !dbg !118
  %11 = load [1024 x double]** %A.addr, align 8, !dbg !118
  %arrayidx = getelementptr inbounds [1024 x double]* %11, i64 %idxprom6, !dbg !118
  %arrayidx7 = getelementptr inbounds [1024 x double]* %arrayidx, i32 0, i64 %idxprom, !dbg !118
  store double %div, double* %arrayidx7, align 8, !dbg !118
  br label %for.inc, !dbg !118

for.inc:                                          ; preds = %for.body3
  %12 = load i32* %j, align 4, !dbg !120
  %inc = add nsw i32 %12, 1, !dbg !120
  store i32 %inc, i32* %j, align 4, !dbg !120
  br label %for.cond1, !dbg !121

for.end:                                          ; preds = %for.cond1
  br label %for.inc8, !dbg !122

for.inc8:                                         ; preds = %for.end
  %13 = load i32* %i, align 4, !dbg !123
  %inc9 = add nsw i32 %13, 1, !dbg !123
  store i32 %inc9, i32* %i, align 4, !dbg !123
  br label %for.cond, !dbg !124

for.end10:                                        ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !125
  br label %for.cond11, !dbg !125

for.cond11:                                       ; preds = %for.inc31, %for.end10
  %14 = load i32* %i, align 4, !dbg !127
  %15 = load i32* %ni.addr, align 4, !dbg !131
  %cmp12 = icmp slt i32 %14, %15, !dbg !132
  br i1 %cmp12, label %for.body14, label %for.end33, !dbg !133

for.body14:                                       ; preds = %for.cond11
  store i32 0, i32* %j, align 4, !dbg !134
  br label %for.cond15, !dbg !134

for.cond15:                                       ; preds = %for.inc28, %for.body14
  %16 = load i32* %j, align 4, !dbg !136
  %17 = load i32* %ni.addr, align 4, !dbg !140
  %cmp16 = icmp slt i32 %16, %17, !dbg !141
  br i1 %cmp16, label %for.body18, label %for.end30, !dbg !142

for.body18:                                       ; preds = %for.cond15
  %18 = load i32* %i, align 4, !dbg !143
  %conv19 = sitofp i32 %18 to double, !dbg !144
  %19 = load i32* %j, align 4, !dbg !145
  %conv20 = sitofp i32 %19 to double, !dbg !145
  %mul21 = fmul double %conv19, %conv20, !dbg !144
  %20 = load i32* %ni.addr, align 4, !dbg !146
  %conv22 = sitofp i32 %20 to double, !dbg !146
  %div23 = fdiv double %mul21, %conv22, !dbg !147
  %21 = load i32* %j, align 4, !dbg !148
  %idxprom24 = sext i32 %21 to i64, !dbg !149
  %22 = load i32* %i, align 4, !dbg !150
  %idxprom25 = sext i32 %22 to i64, !dbg !149
  %23 = load [1024 x double]** %C.addr, align 8, !dbg !149
  %arrayidx26 = getelementptr inbounds [1024 x double]* %23, i64 %idxprom25, !dbg !149
  %arrayidx27 = getelementptr inbounds [1024 x double]* %arrayidx26, i32 0, i64 %idxprom24, !dbg !149
  store double %div23, double* %arrayidx27, align 8, !dbg !149
  br label %for.inc28, !dbg !149

for.inc28:                                        ; preds = %for.body18
  %24 = load i32* %j, align 4, !dbg !151
  %inc29 = add nsw i32 %24, 1, !dbg !151
  store i32 %inc29, i32* %j, align 4, !dbg !151
  br label %for.cond15, !dbg !152

for.end30:                                        ; preds = %for.cond15
  br label %for.inc31, !dbg !153

for.inc31:                                        ; preds = %for.end30
  %25 = load i32* %i, align 4, !dbg !154
  %inc32 = add nsw i32 %25, 1, !dbg !154
  store i32 %inc32, i32* %i, align 4, !dbg !154
  br label %for.cond11, !dbg !155

for.end33:                                        ; preds = %for.cond11
  ret void, !dbg !156
}

; Function Attrs: nounwind uwtable
define internal void @kernel_syrk(i32 %ni, i32 %nj, double %alpha, double %beta, [1024 x double]* %C, [1024 x double]* %A) #0 {
entry:
  %ni.addr = alloca i32, align 4
  %nj.addr = alloca i32, align 4
  %alpha.addr = alloca double, align 8
  %beta.addr = alloca double, align 8
  %C.addr = alloca [1024 x double]*, align 8
  %A.addr = alloca [1024 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %ni, i32* %ni.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ni.addr, metadata !157, metadata !36), !dbg !158
  store i32 %nj, i32* %nj.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nj.addr, metadata !159, metadata !36), !dbg !160
  store double %alpha, double* %alpha.addr, align 8
  call void @llvm.dbg.declare(metadata double* %alpha.addr, metadata !161, metadata !36), !dbg !162
  store double %beta, double* %beta.addr, align 8
  call void @llvm.dbg.declare(metadata double* %beta.addr, metadata !163, metadata !36), !dbg !164
  store [1024 x double]* %C, [1024 x double]** %C.addr, align 8
  call void @llvm.dbg.declare(metadata [1024 x double]** %C.addr, metadata !165, metadata !36), !dbg !166
  store [1024 x double]* %A, [1024 x double]** %A.addr, align 8
  call void @llvm.dbg.declare(metadata [1024 x double]** %A.addr, metadata !167, metadata !36), !dbg !168
  call void @llvm.dbg.declare(metadata i32* %i, metadata !169, metadata !36), !dbg !170
  call void @llvm.dbg.declare(metadata i32* %j, metadata !171, metadata !36), !dbg !172
  call void @llvm.dbg.declare(metadata i32* %k, metadata !173, metadata !36), !dbg !174
  store i32 0, i32* %i, align 4, !dbg !175
  br label %for.cond, !dbg !175

for.cond:                                         ; preds = %for.inc6, %entry
  %0 = load i32* %i, align 4, !dbg !177
  %1 = load i32* %ni.addr, align 4, !dbg !181
  %cmp = icmp slt i32 %0, %1, !dbg !182
  br i1 %cmp, label %for.body, label %for.end8, !dbg !183

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !184
  br label %for.cond1, !dbg !184

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32* %j, align 4, !dbg !186
  %3 = load i32* %ni.addr, align 4, !dbg !190
  %cmp2 = icmp slt i32 %2, %3, !dbg !191
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !192

for.body3:                                        ; preds = %for.cond1
  %4 = load double* %beta.addr, align 8, !dbg !193
  %5 = load i32* %j, align 4, !dbg !194
  %idxprom = sext i32 %5 to i64, !dbg !195
  %6 = load i32* %i, align 4, !dbg !196
  %idxprom4 = sext i32 %6 to i64, !dbg !195
  %7 = load [1024 x double]** %C.addr, align 8, !dbg !195
  %arrayidx = getelementptr inbounds [1024 x double]* %7, i64 %idxprom4, !dbg !195
  %arrayidx5 = getelementptr inbounds [1024 x double]* %arrayidx, i32 0, i64 %idxprom, !dbg !195
  %8 = load double* %arrayidx5, align 8, !dbg !195
  %mul = fmul double %8, %4, !dbg !195
  store double %mul, double* %arrayidx5, align 8, !dbg !195
  br label %for.inc, !dbg !195

for.inc:                                          ; preds = %for.body3
  %9 = load i32* %j, align 4, !dbg !197
  %inc = add nsw i32 %9, 1, !dbg !197
  store i32 %inc, i32* %j, align 4, !dbg !197
  br label %for.cond1, !dbg !198

for.end:                                          ; preds = %for.cond1
  br label %for.inc6, !dbg !199

for.inc6:                                         ; preds = %for.end
  %10 = load i32* %i, align 4, !dbg !200
  %inc7 = add nsw i32 %10, 1, !dbg !200
  store i32 %inc7, i32* %i, align 4, !dbg !200
  br label %for.cond, !dbg !201

for.end8:                                         ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !202
  br label %for.cond9, !dbg !202

for.cond9:                                        ; preds = %for.inc38, %for.end8
  %11 = load i32* %i, align 4, !dbg !204
  %12 = load i32* %ni.addr, align 4, !dbg !208
  %cmp10 = icmp slt i32 %11, %12, !dbg !209
  br i1 %cmp10, label %for.body11, label %for.end40, !dbg !210

for.body11:                                       ; preds = %for.cond9
  store i32 0, i32* %j, align 4, !dbg !211
  br label %for.cond12, !dbg !211

for.cond12:                                       ; preds = %for.inc35, %for.body11
  %13 = load i32* %j, align 4, !dbg !213
  %14 = load i32* %ni.addr, align 4, !dbg !217
  %cmp13 = icmp slt i32 %13, %14, !dbg !218
  br i1 %cmp13, label %for.body14, label %for.end37, !dbg !219

for.body14:                                       ; preds = %for.cond12
  store i32 0, i32* %k, align 4, !dbg !220
  br label %for.cond15, !dbg !220

for.cond15:                                       ; preds = %for.inc32, %for.body14
  %15 = load i32* %k, align 4, !dbg !222
  %16 = load i32* %nj.addr, align 4, !dbg !226
  %cmp16 = icmp slt i32 %15, %16, !dbg !227
  br i1 %cmp16, label %for.body17, label %for.end34, !dbg !228

for.body17:                                       ; preds = %for.cond15
  %17 = load double* %alpha.addr, align 8, !dbg !229
  %18 = load i32* %k, align 4, !dbg !230
  %idxprom18 = sext i32 %18 to i64, !dbg !231
  %19 = load i32* %i, align 4, !dbg !232
  %idxprom19 = sext i32 %19 to i64, !dbg !231
  %20 = load [1024 x double]** %A.addr, align 8, !dbg !231
  %arrayidx20 = getelementptr inbounds [1024 x double]* %20, i64 %idxprom19, !dbg !231
  %arrayidx21 = getelementptr inbounds [1024 x double]* %arrayidx20, i32 0, i64 %idxprom18, !dbg !231
  %21 = load double* %arrayidx21, align 8, !dbg !231
  %mul22 = fmul double %17, %21, !dbg !229
  %22 = load i32* %k, align 4, !dbg !233
  %idxprom23 = sext i32 %22 to i64, !dbg !234
  %23 = load i32* %j, align 4, !dbg !235
  %idxprom24 = sext i32 %23 to i64, !dbg !234
  %24 = load [1024 x double]** %A.addr, align 8, !dbg !234
  %arrayidx25 = getelementptr inbounds [1024 x double]* %24, i64 %idxprom24, !dbg !234
  %arrayidx26 = getelementptr inbounds [1024 x double]* %arrayidx25, i32 0, i64 %idxprom23, !dbg !234
  %25 = load double* %arrayidx26, align 8, !dbg !234
  %mul27 = fmul double %mul22, %25, !dbg !229
  %26 = load i32* %j, align 4, !dbg !236
  %idxprom28 = sext i32 %26 to i64, !dbg !237
  %27 = load i32* %i, align 4, !dbg !238
  %idxprom29 = sext i32 %27 to i64, !dbg !237
  %28 = load [1024 x double]** %C.addr, align 8, !dbg !237
  %arrayidx30 = getelementptr inbounds [1024 x double]* %28, i64 %idxprom29, !dbg !237
  %arrayidx31 = getelementptr inbounds [1024 x double]* %arrayidx30, i32 0, i64 %idxprom28, !dbg !237
  %29 = load double* %arrayidx31, align 8, !dbg !237
  %add = fadd double %29, %mul27, !dbg !237
  store double %add, double* %arrayidx31, align 8, !dbg !237
  br label %for.inc32, !dbg !237

for.inc32:                                        ; preds = %for.body17
  %30 = load i32* %k, align 4, !dbg !239
  %inc33 = add nsw i32 %30, 1, !dbg !239
  store i32 %inc33, i32* %k, align 4, !dbg !239
  br label %for.cond15, !dbg !240

for.end34:                                        ; preds = %for.cond15
  br label %for.inc35, !dbg !241

for.inc35:                                        ; preds = %for.end34
  %31 = load i32* %j, align 4, !dbg !242
  %inc36 = add nsw i32 %31, 1, !dbg !242
  store i32 %inc36, i32* %j, align 4, !dbg !242
  br label %for.cond12, !dbg !243

for.end37:                                        ; preds = %for.cond12
  br label %for.inc38, !dbg !244

for.inc38:                                        ; preds = %for.end37
  %32 = load i32* %i, align 4, !dbg !245
  %inc39 = add nsw i32 %32, 1, !dbg !245
  store i32 %inc39, i32* %i, align 4, !dbg !245
  br label %for.cond9, !dbg !246

for.end40:                                        ; preds = %for.cond9
  ret void, !dbg !247
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
  call void @llvm.dbg.declare(metadata i32* %ni.addr, metadata !248, metadata !36), !dbg !249
  store [1024 x double]* %C, [1024 x double]** %C.addr, align 8
  call void @llvm.dbg.declare(metadata [1024 x double]** %C.addr, metadata !250, metadata !36), !dbg !251
  call void @llvm.dbg.declare(metadata i32* %i, metadata !252, metadata !36), !dbg !253
  call void @llvm.dbg.declare(metadata i32* %j, metadata !254, metadata !36), !dbg !255
  store i32 0, i32* %i, align 4, !dbg !256
  br label %for.cond, !dbg !256

for.cond:                                         ; preds = %for.inc8, %entry
  %0 = load i32* %i, align 4, !dbg !258
  %1 = load i32* %ni.addr, align 4, !dbg !262
  %cmp = icmp slt i32 %0, %1, !dbg !263
  br i1 %cmp, label %for.body, label %for.end10, !dbg !264

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !265
  br label %for.cond1, !dbg !265

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32* %j, align 4, !dbg !267
  %3 = load i32* %ni.addr, align 4, !dbg !271
  %cmp2 = icmp slt i32 %2, %3, !dbg !272
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !273

for.body3:                                        ; preds = %for.cond1
  %4 = load %struct._IO_FILE** @stderr, align 8, !dbg !274
  %5 = load i32* %j, align 4, !dbg !276
  %idxprom = sext i32 %5 to i64, !dbg !277
  %6 = load i32* %i, align 4, !dbg !278
  %idxprom4 = sext i32 %6 to i64, !dbg !277
  %7 = load [1024 x double]** %C.addr, align 8, !dbg !277
  %arrayidx = getelementptr inbounds [1024 x double]* %7, i64 %idxprom4, !dbg !277
  %arrayidx5 = getelementptr inbounds [1024 x double]* %arrayidx, i32 0, i64 %idxprom, !dbg !277
  %8 = load double* %arrayidx5, align 8, !dbg !277
  %call = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([8 x i8]* @.str1, i32 0, i32 0), double %8), !dbg !279
  %9 = load i32* %i, align 4, !dbg !280
  %10 = load i32* %ni.addr, align 4, !dbg !282
  %mul = mul nsw i32 %9, %10, !dbg !280
  %11 = load i32* %j, align 4, !dbg !283
  %add = add nsw i32 %mul, %11, !dbg !280
  %rem = srem i32 %add, 20, !dbg !284
  %cmp6 = icmp eq i32 %rem, 0, !dbg !284
  br i1 %cmp6, label %if.then, label %if.end, !dbg !285

if.then:                                          ; preds = %for.body3
  %12 = load %struct._IO_FILE** @stderr, align 8, !dbg !286
  %call7 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)), !dbg !288
  br label %if.end, !dbg !288

if.end:                                           ; preds = %if.then, %for.body3
  br label %for.inc, !dbg !289

for.inc:                                          ; preds = %if.end
  %13 = load i32* %j, align 4, !dbg !290
  %inc = add nsw i32 %13, 1, !dbg !290
  store i32 %inc, i32* %j, align 4, !dbg !290
  br label %for.cond1, !dbg !291

for.end:                                          ; preds = %for.cond1
  br label %for.inc8, !dbg !292

for.inc8:                                         ; preds = %for.end
  %14 = load i32* %i, align 4, !dbg !293
  %inc9 = add nsw i32 %14, 1, !dbg !293
  store i32 %inc9, i32* %i, align 4, !dbg !293
  br label %for.cond, !dbg !294

for.end10:                                        ; preds = %for.cond
  %15 = load %struct._IO_FILE** @stderr, align 8, !dbg !295
  %call11 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)), !dbg !296
  ret void, !dbg !297
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

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\000\00\000\00\001", !1, !2, !3, !10, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c] [DW_LANG_C99]
!1 = !{!"syrk.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk"}
!2 = !{}
!3 = !{!4, !9, !6}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!5 = !{!"0x1\00\000\0067108864\0064\000\000\000", null, null, !6, !7, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 67108864, align 64, offset 0] [from double]
!6 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!7 = !{!8, !8}
!8 = !{!"0x21\000\001024"}                        ; [ DW_TAG_subrange_type ] [0, 1023]
!9 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = !{!11, !19, !25, !28}
!11 = !{!"0x2e\00main\00main\00\0084\000\001\000\000\00256\000\0085", !1, !12, !13, null, i32 (i32, i8**)* @main, null, null, !2} ; [ DW_TAG_subprogram ] [line 84] [def] [scope 85] [main]
!12 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!13 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !14, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = !{!15, !15, !16}
!15 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!16 = !{!"0xf\00\000\0064\0064\000\000", null, null, !17} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!17 = !{!"0xf\00\000\0064\0064\000\000", null, null, !18} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!18 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!19 = !{!"0x2e\00print_array\00print_array\00\0045\001\001\000\000\00256\000\0047", !1, !12, !20, null, void (i32, [1024 x double]*)* @print_array, null, null, !2} ; [ DW_TAG_subprogram ] [line 45] [local] [def] [scope 47] [print_array]
!20 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !21, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!21 = !{null, !15, !22}
!22 = !{!"0xf\00\000\0064\0064\000\000", null, null, !23} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!23 = !{!"0x1\00\000\0065536\0064\000\000\000", null, null, !6, !24, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 65536, align 64, offset 0] [from double]
!24 = !{!8}
!25 = !{!"0x2e\00kernel_syrk\00kernel_syrk\00\0062\001\001\000\000\00256\000\0067", !1, !12, !26, null, void (i32, i32, double, double, [1024 x double]*, [1024 x double]*)* @kernel_syrk, null, null, !2} ; [ DW_TAG_subprogram ] [line 62] [local] [def] [scope 67] [kernel_syrk]
!26 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !27, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!27 = !{null, !15, !15, !6, !6, !22, !22}
!28 = !{!"0x2e\00init_array\00init_array\00\0023\001\001\000\000\00256\000\0028", !1, !12, !29, null, void (i32, i32, double*, double*, [1024 x double]*, [1024 x double]*)* @init_array, null, null, !2} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [scope 28] [init_array]
!29 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !30, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!30 = !{null, !15, !15, !31, !31, !22, !22}
!31 = !{!"0xf\00\000\0064\0064\000\000", null, null, !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!32 = !{i32 2, !"Dwarf Version", i32 4}
!33 = !{i32 2, !"Debug Info Version", i32 2}
!34 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!35 = !{!"0x101\00argc\0016777300\000", !11, !12, !15} ; [ DW_TAG_arg_variable ] [argc] [line 84]
!36 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!37 = !MDLocation(line: 84, column: 14, scope: !11)
!38 = !{!"0x101\00argv\0033554516\000", !11, !12, !16} ; [ DW_TAG_arg_variable ] [argv] [line 84]
!39 = !MDLocation(line: 84, column: 27, scope: !11)
!40 = !{!"0x100\00ni\0087\000", !11, !12, !15}    ; [ DW_TAG_auto_variable ] [ni] [line 87]
!41 = !MDLocation(line: 87, column: 7, scope: !11)
!42 = !{!"0x100\00nj\0088\000", !11, !12, !15}    ; [ DW_TAG_auto_variable ] [nj] [line 88]
!43 = !MDLocation(line: 88, column: 7, scope: !11)
!44 = !{!"0x100\00alpha\0091\000", !11, !12, !6}  ; [ DW_TAG_auto_variable ] [alpha] [line 91]
!45 = !MDLocation(line: 91, column: 13, scope: !11)
!46 = !{!"0x100\00beta\0092\000", !11, !12, !6}   ; [ DW_TAG_auto_variable ] [beta] [line 92]
!47 = !MDLocation(line: 92, column: 13, scope: !11)
!48 = !{!"0x100\00C\0093\000", !11, !12, !4}      ; [ DW_TAG_auto_variable ] [C] [line 93]
!49 = !MDLocation(line: 93, column: 3, scope: !11)
!50 = !{!"0x100\00A\0094\000", !11, !12, !4}      ; [ DW_TAG_auto_variable ] [A] [line 94]
!51 = !MDLocation(line: 94, column: 3, scope: !11)
!52 = !MDLocation(line: 97, column: 15, scope: !11)
!53 = !MDLocation(line: 97, column: 19, scope: !11)
!54 = !MDLocation(line: 97, column: 38, scope: !11)
!55 = !MDLocation(line: 97, column: 58, scope: !11)
!56 = !MDLocation(line: 97, column: 3, scope: !11)
!57 = !MDLocation(line: 103, column: 16, scope: !11)
!58 = !MDLocation(line: 103, column: 20, scope: !11)
!59 = !MDLocation(line: 103, column: 24, scope: !11)
!60 = !MDLocation(line: 103, column: 31, scope: !11)
!61 = !MDLocation(line: 103, column: 37, scope: !11)
!62 = !MDLocation(line: 103, column: 57, scope: !11)
!63 = !MDLocation(line: 103, column: 3, scope: !11)
!64 = !MDLocation(line: 111, column: 3, scope: !65)
!65 = !{!"0xb\00111\003\000", !1, !11}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!66 = !MDLocation(line: 111, column: 3, scope: !11)
!67 = !MDLocation(line: 111, column: 3, scope: !68)
!68 = !{!"0xb\001", !1, !65}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!69 = !MDLocation(line: 111, column: 3, scope: !70)
!70 = !{!"0xb\002", !1, !65}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!71 = !MDLocation(line: 114, column: 3, scope: !11)
!72 = !MDLocation(line: 115, column: 3, scope: !11)
!73 = !MDLocation(line: 117, column: 3, scope: !11)
!74 = !{!"0x101\00ni\0016777239\000", !28, !12, !15} ; [ DW_TAG_arg_variable ] [ni] [line 23]
!75 = !MDLocation(line: 23, column: 21, scope: !28)
!76 = !{!"0x101\00nj\0033554455\000", !28, !12, !15} ; [ DW_TAG_arg_variable ] [nj] [line 23]
!77 = !MDLocation(line: 23, column: 29, scope: !28)
!78 = !{!"0x101\00alpha\0050331672\000", !28, !12, !31} ; [ DW_TAG_arg_variable ] [alpha] [line 24]
!79 = !MDLocation(line: 24, column: 14, scope: !28)
!80 = !{!"0x101\00beta\0067108889\000", !28, !12, !31} ; [ DW_TAG_arg_variable ] [beta] [line 25]
!81 = !MDLocation(line: 25, column: 14, scope: !28)
!82 = !{!"0x101\00C\0083886106\000", !28, !12, !22} ; [ DW_TAG_arg_variable ] [C] [line 26]
!83 = !MDLocation(line: 26, column: 13, scope: !28)
!84 = !{!"0x101\00A\00100663323\000", !28, !12, !22} ; [ DW_TAG_arg_variable ] [A] [line 27]
!85 = !MDLocation(line: 27, column: 13, scope: !28)
!86 = !{!"0x100\00i\0029\000", !28, !12, !15}     ; [ DW_TAG_auto_variable ] [i] [line 29]
!87 = !MDLocation(line: 29, column: 7, scope: !28)
!88 = !{!"0x100\00j\0029\000", !28, !12, !15}     ; [ DW_TAG_auto_variable ] [j] [line 29]
!89 = !MDLocation(line: 29, column: 10, scope: !28)
!90 = !MDLocation(line: 31, column: 4, scope: !28)
!91 = !MDLocation(line: 31, column: 3, scope: !28)
!92 = !MDLocation(line: 32, column: 4, scope: !28)
!93 = !MDLocation(line: 32, column: 3, scope: !28)
!94 = !MDLocation(line: 33, column: 8, scope: !95)
!95 = !{!"0xb\0033\003\0017", !1, !28}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!96 = !MDLocation(line: 33, column: 15, scope: !97)
!97 = !{!"0xb\002", !1, !98}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!98 = !{!"0xb\001", !1, !99}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!99 = !{!"0xb\0033\003\0018", !1, !95}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!100 = !MDLocation(line: 33, column: 19, scope: !99)
!101 = !MDLocation(line: 33, column: 15, scope: !99)
!102 = !MDLocation(line: 33, column: 3, scope: !95)
!103 = !MDLocation(line: 34, column: 10, scope: !104)
!104 = !{!"0xb\0034\005\0019", !1, !99}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!105 = !MDLocation(line: 34, column: 17, scope: !106)
!106 = !{!"0xb\002", !1, !107}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!107 = !{!"0xb\001", !1, !108}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!108 = !{!"0xb\0034\005\0020", !1, !104}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!109 = !MDLocation(line: 34, column: 21, scope: !108)
!110 = !MDLocation(line: 34, column: 17, scope: !108)
!111 = !MDLocation(line: 34, column: 5, scope: !104)
!112 = !MDLocation(line: 35, column: 30, scope: !108)
!113 = !MDLocation(line: 35, column: 18, scope: !108)
!114 = !MDLocation(line: 35, column: 32, scope: !108)
!115 = !MDLocation(line: 35, column: 37, scope: !108)
!116 = !MDLocation(line: 35, column: 17, scope: !108)
!117 = !MDLocation(line: 35, column: 12, scope: !108)
!118 = !MDLocation(line: 35, column: 7, scope: !108)
!119 = !MDLocation(line: 35, column: 9, scope: !108)
!120 = !MDLocation(line: 34, column: 25, scope: !108)
!121 = !MDLocation(line: 34, column: 5, scope: !108)
!122 = !MDLocation(line: 35, column: 37, scope: !104)
!123 = !MDLocation(line: 33, column: 23, scope: !99)
!124 = !MDLocation(line: 33, column: 3, scope: !99)
!125 = !MDLocation(line: 36, column: 8, scope: !126)
!126 = !{!"0xb\0036\003\0021", !1, !28}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!127 = !MDLocation(line: 36, column: 15, scope: !128)
!128 = !{!"0xb\002", !1, !129}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!129 = !{!"0xb\001", !1, !130}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!130 = !{!"0xb\0036\003\0022", !1, !126}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!131 = !MDLocation(line: 36, column: 19, scope: !130)
!132 = !MDLocation(line: 36, column: 15, scope: !130)
!133 = !MDLocation(line: 36, column: 3, scope: !126)
!134 = !MDLocation(line: 37, column: 10, scope: !135)
!135 = !{!"0xb\0037\005\0023", !1, !130}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!136 = !MDLocation(line: 37, column: 17, scope: !137)
!137 = !{!"0xb\002", !1, !138}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!138 = !{!"0xb\001", !1, !139}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!139 = !{!"0xb\0037\005\0024", !1, !135}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!140 = !MDLocation(line: 37, column: 21, scope: !139)
!141 = !MDLocation(line: 37, column: 17, scope: !139)
!142 = !MDLocation(line: 37, column: 5, scope: !135)
!143 = !MDLocation(line: 38, column: 30, scope: !139)
!144 = !MDLocation(line: 38, column: 18, scope: !139)
!145 = !MDLocation(line: 38, column: 32, scope: !139)
!146 = !MDLocation(line: 38, column: 37, scope: !139)
!147 = !MDLocation(line: 38, column: 17, scope: !139)
!148 = !MDLocation(line: 38, column: 12, scope: !139)
!149 = !MDLocation(line: 38, column: 7, scope: !139)
!150 = !MDLocation(line: 38, column: 9, scope: !139)
!151 = !MDLocation(line: 37, column: 25, scope: !139)
!152 = !MDLocation(line: 37, column: 5, scope: !139)
!153 = !MDLocation(line: 38, column: 37, scope: !135)
!154 = !MDLocation(line: 36, column: 23, scope: !130)
!155 = !MDLocation(line: 36, column: 3, scope: !130)
!156 = !MDLocation(line: 39, column: 1, scope: !28)
!157 = !{!"0x101\00ni\0016777278\000", !25, !12, !15} ; [ DW_TAG_arg_variable ] [ni] [line 62]
!158 = !MDLocation(line: 62, column: 22, scope: !25)
!159 = !{!"0x101\00nj\0033554494\000", !25, !12, !15} ; [ DW_TAG_arg_variable ] [nj] [line 62]
!160 = !MDLocation(line: 62, column: 30, scope: !25)
!161 = !{!"0x101\00alpha\0050331711\000", !25, !12, !6} ; [ DW_TAG_arg_variable ] [alpha] [line 63]
!162 = !MDLocation(line: 63, column: 14, scope: !25)
!163 = !{!"0x101\00beta\0067108928\000", !25, !12, !6} ; [ DW_TAG_arg_variable ] [beta] [line 64]
!164 = !MDLocation(line: 64, column: 14, scope: !25)
!165 = !{!"0x101\00C\0083886145\000", !25, !12, !22} ; [ DW_TAG_arg_variable ] [C] [line 65]
!166 = !MDLocation(line: 65, column: 14, scope: !25)
!167 = !{!"0x101\00A\00100663362\000", !25, !12, !22} ; [ DW_TAG_arg_variable ] [A] [line 66]
!168 = !MDLocation(line: 66, column: 14, scope: !25)
!169 = !{!"0x100\00i\0068\000", !25, !12, !15}    ; [ DW_TAG_auto_variable ] [i] [line 68]
!170 = !MDLocation(line: 68, column: 7, scope: !25)
!171 = !{!"0x100\00j\0068\000", !25, !12, !15}    ; [ DW_TAG_auto_variable ] [j] [line 68]
!172 = !MDLocation(line: 68, column: 10, scope: !25)
!173 = !{!"0x100\00k\0068\000", !25, !12, !15}    ; [ DW_TAG_auto_variable ] [k] [line 68]
!174 = !MDLocation(line: 68, column: 13, scope: !25)
!175 = !MDLocation(line: 72, column: 8, scope: !176)
!176 = !{!"0xb\0072\003\007", !1, !25}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!177 = !MDLocation(line: 72, column: 15, scope: !178)
!178 = !{!"0xb\002", !1, !179}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!179 = !{!"0xb\001", !1, !180}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!180 = !{!"0xb\0072\003\008", !1, !176}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!181 = !MDLocation(line: 72, column: 19, scope: !180)
!182 = !MDLocation(line: 72, column: 15, scope: !180)
!183 = !MDLocation(line: 72, column: 3, scope: !176)
!184 = !MDLocation(line: 73, column: 10, scope: !185)
!185 = !{!"0xb\0073\005\009", !1, !180}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!186 = !MDLocation(line: 73, column: 17, scope: !187)
!187 = !{!"0xb\002", !1, !188}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!188 = !{!"0xb\001", !1, !189}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!189 = !{!"0xb\0073\005\0010", !1, !185}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!190 = !MDLocation(line: 73, column: 21, scope: !189)
!191 = !MDLocation(line: 73, column: 17, scope: !189)
!192 = !MDLocation(line: 73, column: 5, scope: !185)
!193 = !MDLocation(line: 74, column: 18, scope: !189)
!194 = !MDLocation(line: 74, column: 12, scope: !189)
!195 = !MDLocation(line: 74, column: 7, scope: !189)
!196 = !MDLocation(line: 74, column: 9, scope: !189)
!197 = !MDLocation(line: 73, column: 25, scope: !189)
!198 = !MDLocation(line: 73, column: 5, scope: !189)
!199 = !MDLocation(line: 74, column: 18, scope: !185)
!200 = !MDLocation(line: 72, column: 23, scope: !180)
!201 = !MDLocation(line: 72, column: 3, scope: !180)
!202 = !MDLocation(line: 75, column: 8, scope: !203)
!203 = !{!"0xb\0075\003\0011", !1, !25}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!204 = !MDLocation(line: 75, column: 15, scope: !205)
!205 = !{!"0xb\002", !1, !206}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!206 = !{!"0xb\001", !1, !207}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!207 = !{!"0xb\0075\003\0012", !1, !203}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!208 = !MDLocation(line: 75, column: 19, scope: !207)
!209 = !MDLocation(line: 75, column: 15, scope: !207)
!210 = !MDLocation(line: 75, column: 3, scope: !203)
!211 = !MDLocation(line: 76, column: 10, scope: !212)
!212 = !{!"0xb\0076\005\0013", !1, !207}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!213 = !MDLocation(line: 76, column: 17, scope: !214)
!214 = !{!"0xb\002", !1, !215}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!215 = !{!"0xb\001", !1, !216}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!216 = !{!"0xb\0076\005\0014", !1, !212}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!217 = !MDLocation(line: 76, column: 21, scope: !216)
!218 = !MDLocation(line: 76, column: 17, scope: !216)
!219 = !MDLocation(line: 76, column: 5, scope: !212)
!220 = !MDLocation(line: 77, column: 12, scope: !221)
!221 = !{!"0xb\0077\007\0015", !1, !216}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!222 = !MDLocation(line: 77, column: 19, scope: !223)
!223 = !{!"0xb\002", !1, !224}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!224 = !{!"0xb\001", !1, !225}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!225 = !{!"0xb\0077\007\0016", !1, !221}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!226 = !MDLocation(line: 77, column: 23, scope: !225)
!227 = !MDLocation(line: 77, column: 19, scope: !225)
!228 = !MDLocation(line: 77, column: 7, scope: !221)
!229 = !MDLocation(line: 78, column: 15, scope: !225)
!230 = !MDLocation(line: 78, column: 28, scope: !225)
!231 = !MDLocation(line: 78, column: 23, scope: !225)
!232 = !MDLocation(line: 78, column: 25, scope: !225)
!233 = !MDLocation(line: 78, column: 38, scope: !225)
!234 = !MDLocation(line: 78, column: 33, scope: !225)
!235 = !MDLocation(line: 78, column: 35, scope: !225)
!236 = !MDLocation(line: 78, column: 9, scope: !225)
!237 = !MDLocation(line: 78, column: 4, scope: !225)
!238 = !MDLocation(line: 78, column: 6, scope: !225)
!239 = !MDLocation(line: 77, column: 27, scope: !225)
!240 = !MDLocation(line: 77, column: 7, scope: !225)
!241 = !MDLocation(line: 78, column: 39, scope: !221)
!242 = !MDLocation(line: 76, column: 25, scope: !216)
!243 = !MDLocation(line: 76, column: 5, scope: !216)
!244 = !MDLocation(line: 78, column: 39, scope: !212)
!245 = !MDLocation(line: 75, column: 23, scope: !207)
!246 = !MDLocation(line: 75, column: 3, scope: !207)
!247 = !MDLocation(line: 81, column: 1, scope: !25)
!248 = !{!"0x101\00ni\0016777261\000", !19, !12, !15} ; [ DW_TAG_arg_variable ] [ni] [line 45]
!249 = !MDLocation(line: 45, column: 22, scope: !19)
!250 = !{!"0x101\00C\0033554478\000", !19, !12, !22} ; [ DW_TAG_arg_variable ] [C] [line 46]
!251 = !MDLocation(line: 46, column: 14, scope: !19)
!252 = !{!"0x100\00i\0048\000", !19, !12, !15}    ; [ DW_TAG_auto_variable ] [i] [line 48]
!253 = !MDLocation(line: 48, column: 7, scope: !19)
!254 = !{!"0x100\00j\0048\000", !19, !12, !15}    ; [ DW_TAG_auto_variable ] [j] [line 48]
!255 = !MDLocation(line: 48, column: 10, scope: !19)
!256 = !MDLocation(line: 50, column: 8, scope: !257)
!257 = !{!"0xb\0050\003\001", !1, !19}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!258 = !MDLocation(line: 50, column: 15, scope: !259)
!259 = !{!"0xb\002", !1, !260}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!260 = !{!"0xb\001", !1, !261}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!261 = !{!"0xb\0050\003\002", !1, !257}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!262 = !MDLocation(line: 50, column: 19, scope: !261)
!263 = !MDLocation(line: 50, column: 15, scope: !261)
!264 = !MDLocation(line: 50, column: 3, scope: !257)
!265 = !MDLocation(line: 51, column: 10, scope: !266)
!266 = !{!"0xb\0051\005\003", !1, !261}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!267 = !MDLocation(line: 51, column: 17, scope: !268)
!268 = !{!"0xb\002", !1, !269}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!269 = !{!"0xb\001", !1, !270}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!270 = !{!"0xb\0051\005\004", !1, !266}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!271 = !MDLocation(line: 51, column: 21, scope: !270)
!272 = !MDLocation(line: 51, column: 17, scope: !270)
!273 = !MDLocation(line: 51, column: 5, scope: !266)
!274 = !MDLocation(line: 52, column: 11, scope: !275)
!275 = !{!"0xb\0051\0030\005", !1, !270}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!276 = !MDLocation(line: 52, column: 46, scope: !275)
!277 = !MDLocation(line: 52, column: 41, scope: !275)
!278 = !MDLocation(line: 52, column: 43, scope: !275)
!279 = !MDLocation(line: 52, column: 2, scope: !275)
!280 = !MDLocation(line: 53, column: 7, scope: !281)
!281 = !{!"0xb\0053\006\006", !1, !275}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!282 = !MDLocation(line: 53, column: 11, scope: !281)
!283 = !MDLocation(line: 53, column: 16, scope: !281)
!284 = !MDLocation(line: 53, column: 6, scope: !281)
!285 = !MDLocation(line: 53, column: 6, scope: !275)
!286 = !MDLocation(line: 53, column: 39, scope: !287)
!287 = !{!"0xb\001", !1, !281}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!288 = !MDLocation(line: 53, column: 30, scope: !281)
!289 = !MDLocation(line: 54, column: 5, scope: !275)
!290 = !MDLocation(line: 51, column: 25, scope: !270)
!291 = !MDLocation(line: 51, column: 5, scope: !270)
!292 = !MDLocation(line: 54, column: 5, scope: !266)
!293 = !MDLocation(line: 50, column: 23, scope: !261)
!294 = !MDLocation(line: 50, column: 3, scope: !261)
!295 = !MDLocation(line: 55, column: 12, scope: !19)
!296 = !MDLocation(line: 55, column: 3, scope: !19)
!297 = !MDLocation(line: 56, column: 1, scope: !19)
