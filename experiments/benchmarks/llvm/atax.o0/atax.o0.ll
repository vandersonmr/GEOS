; ModuleID = 'atax.c'
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
  %nx = alloca i32, align 4
  %ny = alloca i32, align 4
  %A = alloca [4000 x [4000 x double]]*, align 8
  %x = alloca [4000 x double]*, align 8
  %y = alloca [4000 x double]*, align 8
  %tmp = alloca [4000 x double]*, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !35, metadata !36), !dbg !37
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !38, metadata !36), !dbg !39
  call void @llvm.dbg.declare(metadata i32* %nx, metadata !40, metadata !36), !dbg !41
  store i32 4000, i32* %nx, align 4, !dbg !41
  call void @llvm.dbg.declare(metadata i32* %ny, metadata !42, metadata !36), !dbg !43
  store i32 4000, i32* %ny, align 4, !dbg !43
  call void @llvm.dbg.declare(metadata [4000 x [4000 x double]]** %A, metadata !44, metadata !36), !dbg !45
  %call = call i8* @polybench_alloc_data(i32 16000000, i32 8), !dbg !45
  %0 = bitcast i8* %call to [4000 x [4000 x double]]*, !dbg !45
  store [4000 x [4000 x double]]* %0, [4000 x [4000 x double]]** %A, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata [4000 x double]** %x, metadata !46, metadata !36), !dbg !47
  %call1 = call i8* @polybench_alloc_data(i32 4000, i32 8), !dbg !47
  %1 = bitcast i8* %call1 to [4000 x double]*, !dbg !47
  store [4000 x double]* %1, [4000 x double]** %x, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata [4000 x double]** %y, metadata !48, metadata !36), !dbg !49
  %call2 = call i8* @polybench_alloc_data(i32 4000, i32 8), !dbg !49
  %2 = bitcast i8* %call2 to [4000 x double]*, !dbg !49
  store [4000 x double]* %2, [4000 x double]** %y, align 8, !dbg !49
  call void @llvm.dbg.declare(metadata [4000 x double]** %tmp, metadata !50, metadata !36), !dbg !51
  %call3 = call i8* @polybench_alloc_data(i32 4000, i32 8), !dbg !51
  %3 = bitcast i8* %call3 to [4000 x double]*, !dbg !51
  store [4000 x double]* %3, [4000 x double]** %tmp, align 8, !dbg !51
  %4 = load i32* %nx, align 4, !dbg !52
  %5 = load i32* %ny, align 4, !dbg !53
  %6 = load [4000 x [4000 x double]]** %A, align 8, !dbg !54
  %arraydecay = getelementptr inbounds [4000 x [4000 x double]]* %6, i32 0, i32 0, !dbg !54
  %7 = load [4000 x double]** %x, align 8, !dbg !55
  %arraydecay4 = getelementptr inbounds [4000 x double]* %7, i32 0, i32 0, !dbg !55
  call void @init_array(i32 %4, i32 %5, [4000 x double]* %arraydecay, double* %arraydecay4), !dbg !56
  %8 = load i32* %nx, align 4, !dbg !57
  %9 = load i32* %ny, align 4, !dbg !58
  %10 = load [4000 x [4000 x double]]** %A, align 8, !dbg !59
  %arraydecay5 = getelementptr inbounds [4000 x [4000 x double]]* %10, i32 0, i32 0, !dbg !59
  %11 = load [4000 x double]** %x, align 8, !dbg !60
  %arraydecay6 = getelementptr inbounds [4000 x double]* %11, i32 0, i32 0, !dbg !60
  %12 = load [4000 x double]** %y, align 8, !dbg !61
  %arraydecay7 = getelementptr inbounds [4000 x double]* %12, i32 0, i32 0, !dbg !61
  %13 = load [4000 x double]** %tmp, align 8, !dbg !62
  %arraydecay8 = getelementptr inbounds [4000 x double]* %13, i32 0, i32 0, !dbg !62
  call void @kernel_atax(i32 %8, i32 %9, [4000 x double]* %arraydecay5, double* %arraydecay6, double* %arraydecay7, double* %arraydecay8), !dbg !63
  %14 = load i32* %argc.addr, align 4, !dbg !64
  %cmp = icmp sgt i32 %14, 42, !dbg !64
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !66

land.lhs.true:                                    ; preds = %entry
  %15 = load i8*** %argv.addr, align 8, !dbg !67
  %arrayidx = getelementptr inbounds i8** %15, i64 0, !dbg !67
  %16 = load i8** %arrayidx, align 8, !dbg !67
  %call9 = call i32 @strcmp(i8* %16, i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0)) #5, !dbg !67
  %tobool = icmp ne i32 %call9, 0, !dbg !66
  br i1 %tobool, label %if.end, label %if.then, !dbg !66

if.then:                                          ; preds = %land.lhs.true
  %17 = load i32* %nx, align 4, !dbg !69
  %18 = load [4000 x double]** %y, align 8, !dbg !69
  %arraydecay10 = getelementptr inbounds [4000 x double]* %18, i32 0, i32 0, !dbg !69
  call void @print_array(i32 %17, double* %arraydecay10), !dbg !69
  br label %if.end, !dbg !69

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %19 = load [4000 x [4000 x double]]** %A, align 8, !dbg !71
  %20 = bitcast [4000 x [4000 x double]]* %19 to i8*, !dbg !71
  call void @free(i8* %20) #6, !dbg !71
  %21 = load [4000 x double]** %x, align 8, !dbg !72
  %22 = bitcast [4000 x double]* %21 to i8*, !dbg !72
  call void @free(i8* %22) #6, !dbg !72
  %23 = load [4000 x double]** %y, align 8, !dbg !73
  %24 = bitcast [4000 x double]* %23 to i8*, !dbg !73
  call void @free(i8* %24) #6, !dbg !73
  %25 = load [4000 x double]** %tmp, align 8, !dbg !74
  %26 = bitcast [4000 x double]* %25 to i8*, !dbg !74
  call void @free(i8* %26) #6, !dbg !74
  ret i32 0, !dbg !75
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i8* @polybench_alloc_data(i32, i32) #2

; Function Attrs: nounwind uwtable
define internal void @init_array(i32 %nx, i32 %ny, [4000 x double]* %A, double* %x) #0 {
entry:
  %nx.addr = alloca i32, align 4
  %ny.addr = alloca i32, align 4
  %A.addr = alloca [4000 x double]*, align 8
  %x.addr = alloca double*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %nx, i32* %nx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nx.addr, metadata !76, metadata !36), !dbg !77
  store i32 %ny, i32* %ny.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ny.addr, metadata !78, metadata !36), !dbg !79
  store [4000 x double]* %A, [4000 x double]** %A.addr, align 8
  call void @llvm.dbg.declare(metadata [4000 x double]** %A.addr, metadata !80, metadata !36), !dbg !81
  store double* %x, double** %x.addr, align 8
  call void @llvm.dbg.declare(metadata double** %x.addr, metadata !82, metadata !36), !dbg !83
  call void @llvm.dbg.declare(metadata i32* %i, metadata !84, metadata !36), !dbg !85
  call void @llvm.dbg.declare(metadata i32* %j, metadata !86, metadata !36), !dbg !87
  store i32 0, i32* %i, align 4, !dbg !88
  br label %for.cond, !dbg !88

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4, !dbg !90
  %1 = load i32* %ny.addr, align 4, !dbg !94
  %cmp = icmp slt i32 %0, %1, !dbg !95
  br i1 %cmp, label %for.body, label %for.end, !dbg !96

for.body:                                         ; preds = %for.cond
  %2 = load i32* %i, align 4, !dbg !97
  %conv = sitofp i32 %2 to double, !dbg !97
  %mul = fmul double %conv, 0x400921FB54442D18, !dbg !97
  %3 = load i32* %i, align 4, !dbg !98
  %idxprom = sext i32 %3 to i64, !dbg !99
  %4 = load double** %x.addr, align 8, !dbg !99
  %arrayidx = getelementptr inbounds double* %4, i64 %idxprom, !dbg !99
  store double %mul, double* %arrayidx, align 8, !dbg !99
  br label %for.inc, !dbg !99

for.inc:                                          ; preds = %for.body
  %5 = load i32* %i, align 4, !dbg !100
  %inc = add nsw i32 %5, 1, !dbg !100
  store i32 %inc, i32* %i, align 4, !dbg !100
  br label %for.cond, !dbg !101

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !102
  br label %for.cond1, !dbg !102

for.cond1:                                        ; preds = %for.inc20, %for.end
  %6 = load i32* %i, align 4, !dbg !104
  %7 = load i32* %nx.addr, align 4, !dbg !108
  %cmp2 = icmp slt i32 %6, %7, !dbg !109
  br i1 %cmp2, label %for.body4, label %for.end22, !dbg !110

for.body4:                                        ; preds = %for.cond1
  store i32 0, i32* %j, align 4, !dbg !111
  br label %for.cond5, !dbg !111

for.cond5:                                        ; preds = %for.inc17, %for.body4
  %8 = load i32* %j, align 4, !dbg !113
  %9 = load i32* %ny.addr, align 4, !dbg !117
  %cmp6 = icmp slt i32 %8, %9, !dbg !118
  br i1 %cmp6, label %for.body8, label %for.end19, !dbg !119

for.body8:                                        ; preds = %for.cond5
  %10 = load i32* %i, align 4, !dbg !120
  %conv9 = sitofp i32 %10 to double, !dbg !121
  %11 = load i32* %j, align 4, !dbg !122
  %add = add nsw i32 %11, 1, !dbg !122
  %conv10 = sitofp i32 %add to double, !dbg !123
  %mul11 = fmul double %conv9, %conv10, !dbg !121
  %12 = load i32* %nx.addr, align 4, !dbg !124
  %conv12 = sitofp i32 %12 to double, !dbg !124
  %div = fdiv double %mul11, %conv12, !dbg !125
  %13 = load i32* %j, align 4, !dbg !126
  %idxprom13 = sext i32 %13 to i64, !dbg !127
  %14 = load i32* %i, align 4, !dbg !128
  %idxprom14 = sext i32 %14 to i64, !dbg !127
  %15 = load [4000 x double]** %A.addr, align 8, !dbg !127
  %arrayidx15 = getelementptr inbounds [4000 x double]* %15, i64 %idxprom14, !dbg !127
  %arrayidx16 = getelementptr inbounds [4000 x double]* %arrayidx15, i32 0, i64 %idxprom13, !dbg !127
  store double %div, double* %arrayidx16, align 8, !dbg !127
  br label %for.inc17, !dbg !127

for.inc17:                                        ; preds = %for.body8
  %16 = load i32* %j, align 4, !dbg !129
  %inc18 = add nsw i32 %16, 1, !dbg !129
  store i32 %inc18, i32* %j, align 4, !dbg !129
  br label %for.cond5, !dbg !130

for.end19:                                        ; preds = %for.cond5
  br label %for.inc20, !dbg !131

for.inc20:                                        ; preds = %for.end19
  %17 = load i32* %i, align 4, !dbg !132
  %inc21 = add nsw i32 %17, 1, !dbg !132
  store i32 %inc21, i32* %i, align 4, !dbg !132
  br label %for.cond1, !dbg !133

for.end22:                                        ; preds = %for.cond1
  ret void, !dbg !134
}

; Function Attrs: nounwind uwtable
define internal void @kernel_atax(i32 %nx, i32 %ny, [4000 x double]* %A, double* %x, double* %y, double* %tmp) #0 {
entry:
  %nx.addr = alloca i32, align 4
  %ny.addr = alloca i32, align 4
  %A.addr = alloca [4000 x double]*, align 8
  %x.addr = alloca double*, align 8
  %y.addr = alloca double*, align 8
  %tmp.addr = alloca double*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %nx, i32* %nx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nx.addr, metadata !135, metadata !36), !dbg !136
  store i32 %ny, i32* %ny.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ny.addr, metadata !137, metadata !36), !dbg !138
  store [4000 x double]* %A, [4000 x double]** %A.addr, align 8
  call void @llvm.dbg.declare(metadata [4000 x double]** %A.addr, metadata !139, metadata !36), !dbg !140
  store double* %x, double** %x.addr, align 8
  call void @llvm.dbg.declare(metadata double** %x.addr, metadata !141, metadata !36), !dbg !142
  store double* %y, double** %y.addr, align 8
  call void @llvm.dbg.declare(metadata double** %y.addr, metadata !143, metadata !36), !dbg !144
  store double* %tmp, double** %tmp.addr, align 8
  call void @llvm.dbg.declare(metadata double** %tmp.addr, metadata !145, metadata !36), !dbg !146
  call void @llvm.dbg.declare(metadata i32* %i, metadata !147, metadata !36), !dbg !148
  call void @llvm.dbg.declare(metadata i32* %j, metadata !149, metadata !36), !dbg !150
  store i32 0, i32* %i, align 4, !dbg !151
  br label %for.cond, !dbg !151

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4, !dbg !153
  %1 = load i32* %nx.addr, align 4, !dbg !157
  %cmp = icmp slt i32 %0, %1, !dbg !158
  br i1 %cmp, label %for.body, label %for.end, !dbg !159

for.body:                                         ; preds = %for.cond
  %2 = load i32* %i, align 4, !dbg !160
  %idxprom = sext i32 %2 to i64, !dbg !161
  %3 = load double** %y.addr, align 8, !dbg !161
  %arrayidx = getelementptr inbounds double* %3, i64 %idxprom, !dbg !161
  store double 0.000000e+00, double* %arrayidx, align 8, !dbg !161
  br label %for.inc, !dbg !161

for.inc:                                          ; preds = %for.body
  %4 = load i32* %i, align 4, !dbg !162
  %inc = add nsw i32 %4, 1, !dbg !162
  store i32 %inc, i32* %i, align 4, !dbg !162
  br label %for.cond, !dbg !163

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !164
  br label %for.cond3, !dbg !164

for.cond3:                                        ; preds = %for.inc42, %for.end
  %5 = load i32* %i, align 4, !dbg !166
  %6 = load i32* %ny.addr, align 4, !dbg !170
  %cmp4 = icmp slt i32 %5, %6, !dbg !171
  br i1 %cmp4, label %for.body5, label %for.end44, !dbg !172

for.body5:                                        ; preds = %for.cond3
  %7 = load i32* %i, align 4, !dbg !173
  %idxprom6 = sext i32 %7 to i64, !dbg !175
  %8 = load double** %tmp.addr, align 8, !dbg !175
  %arrayidx7 = getelementptr inbounds double* %8, i64 %idxprom6, !dbg !175
  store double 0.000000e+00, double* %arrayidx7, align 8, !dbg !175
  store i32 0, i32* %j, align 4, !dbg !176
  br label %for.cond8, !dbg !176

for.cond8:                                        ; preds = %for.inc21, %for.body5
  %9 = load i32* %j, align 4, !dbg !178
  %10 = load i32* %ny.addr, align 4, !dbg !182
  %cmp9 = icmp slt i32 %9, %10, !dbg !183
  br i1 %cmp9, label %for.body10, label %for.end23, !dbg !184

for.body10:                                       ; preds = %for.cond8
  %11 = load i32* %i, align 4, !dbg !185
  %idxprom11 = sext i32 %11 to i64, !dbg !186
  %12 = load double** %tmp.addr, align 8, !dbg !186
  %arrayidx12 = getelementptr inbounds double* %12, i64 %idxprom11, !dbg !186
  %13 = load double* %arrayidx12, align 8, !dbg !186
  %14 = load i32* %j, align 4, !dbg !187
  %idxprom13 = sext i32 %14 to i64, !dbg !188
  %15 = load i32* %i, align 4, !dbg !189
  %idxprom14 = sext i32 %15 to i64, !dbg !188
  %16 = load [4000 x double]** %A.addr, align 8, !dbg !188
  %arrayidx15 = getelementptr inbounds [4000 x double]* %16, i64 %idxprom14, !dbg !188
  %arrayidx16 = getelementptr inbounds [4000 x double]* %arrayidx15, i32 0, i64 %idxprom13, !dbg !188
  %17 = load double* %arrayidx16, align 8, !dbg !188
  %18 = load i32* %j, align 4, !dbg !190
  %idxprom17 = sext i32 %18 to i64, !dbg !191
  %19 = load double** %x.addr, align 8, !dbg !191
  %arrayidx18 = getelementptr inbounds double* %19, i64 %idxprom17, !dbg !191
  %20 = load double* %arrayidx18, align 8, !dbg !191
  %mul = fmul double %17, %20, !dbg !188
  %add = fadd double %13, %mul, !dbg !186
  %21 = load i32* %i, align 4, !dbg !192
  %idxprom19 = sext i32 %21 to i64, !dbg !193
  %22 = load double** %tmp.addr, align 8, !dbg !193
  %arrayidx20 = getelementptr inbounds double* %22, i64 %idxprom19, !dbg !193
  store double %add, double* %arrayidx20, align 8, !dbg !193
  br label %for.inc21, !dbg !193

for.inc21:                                        ; preds = %for.body10
  %23 = load i32* %j, align 4, !dbg !194
  %inc22 = add nsw i32 %23, 1, !dbg !194
  store i32 %inc22, i32* %j, align 4, !dbg !194
  br label %for.cond8, !dbg !195

for.end23:                                        ; preds = %for.cond8
  store i32 0, i32* %j, align 4, !dbg !196
  br label %for.cond24, !dbg !196

for.cond24:                                       ; preds = %for.inc39, %for.end23
  %24 = load i32* %j, align 4, !dbg !198
  %25 = load i32* %ny.addr, align 4, !dbg !202
  %cmp25 = icmp slt i32 %24, %25, !dbg !203
  br i1 %cmp25, label %for.body26, label %for.end41, !dbg !204

for.body26:                                       ; preds = %for.cond24
  %26 = load i32* %j, align 4, !dbg !205
  %idxprom27 = sext i32 %26 to i64, !dbg !206
  %27 = load double** %y.addr, align 8, !dbg !206
  %arrayidx28 = getelementptr inbounds double* %27, i64 %idxprom27, !dbg !206
  %28 = load double* %arrayidx28, align 8, !dbg !206
  %29 = load i32* %j, align 4, !dbg !207
  %idxprom29 = sext i32 %29 to i64, !dbg !208
  %30 = load i32* %i, align 4, !dbg !209
  %idxprom30 = sext i32 %30 to i64, !dbg !208
  %31 = load [4000 x double]** %A.addr, align 8, !dbg !208
  %arrayidx31 = getelementptr inbounds [4000 x double]* %31, i64 %idxprom30, !dbg !208
  %arrayidx32 = getelementptr inbounds [4000 x double]* %arrayidx31, i32 0, i64 %idxprom29, !dbg !208
  %32 = load double* %arrayidx32, align 8, !dbg !208
  %33 = load i32* %i, align 4, !dbg !210
  %idxprom33 = sext i32 %33 to i64, !dbg !211
  %34 = load double** %tmp.addr, align 8, !dbg !211
  %arrayidx34 = getelementptr inbounds double* %34, i64 %idxprom33, !dbg !211
  %35 = load double* %arrayidx34, align 8, !dbg !211
  %mul35 = fmul double %32, %35, !dbg !208
  %add36 = fadd double %28, %mul35, !dbg !206
  %36 = load i32* %j, align 4, !dbg !212
  %idxprom37 = sext i32 %36 to i64, !dbg !213
  %37 = load double** %y.addr, align 8, !dbg !213
  %arrayidx38 = getelementptr inbounds double* %37, i64 %idxprom37, !dbg !213
  store double %add36, double* %arrayidx38, align 8, !dbg !213
  br label %for.inc39, !dbg !213

for.inc39:                                        ; preds = %for.body26
  %38 = load i32* %j, align 4, !dbg !214
  %inc40 = add nsw i32 %38, 1, !dbg !214
  store i32 %inc40, i32* %j, align 4, !dbg !214
  br label %for.cond24, !dbg !215

for.end41:                                        ; preds = %for.cond24
  br label %for.inc42, !dbg !216

for.inc42:                                        ; preds = %for.end41
  %39 = load i32* %i, align 4, !dbg !217
  %inc43 = add nsw i32 %39, 1, !dbg !217
  store i32 %inc43, i32* %i, align 4, !dbg !217
  br label %for.cond3, !dbg !218

for.end44:                                        ; preds = %for.cond3
  ret void, !dbg !219
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #3

; Function Attrs: nounwind uwtable
define internal void @print_array(i32 %nx, double* %y) #0 {
entry:
  %nx.addr = alloca i32, align 4
  %y.addr = alloca double*, align 8
  %i = alloca i32, align 4
  store i32 %nx, i32* %nx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nx.addr, metadata !220, metadata !36), !dbg !221
  store double* %y, double** %y.addr, align 8
  call void @llvm.dbg.declare(metadata double** %y.addr, metadata !222, metadata !36), !dbg !223
  call void @llvm.dbg.declare(metadata i32* %i, metadata !224, metadata !36), !dbg !225
  store i32 0, i32* %i, align 4, !dbg !226
  br label %for.cond, !dbg !226

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4, !dbg !228
  %1 = load i32* %nx.addr, align 4, !dbg !232
  %cmp = icmp slt i32 %0, %1, !dbg !233
  br i1 %cmp, label %for.body, label %for.end, !dbg !234

for.body:                                         ; preds = %for.cond
  %2 = load %struct._IO_FILE** @stderr, align 8, !dbg !235
  %3 = load i32* %i, align 4, !dbg !237
  %idxprom = sext i32 %3 to i64, !dbg !238
  %4 = load double** %y.addr, align 8, !dbg !238
  %arrayidx = getelementptr inbounds double* %4, i64 %idxprom, !dbg !238
  %5 = load double* %arrayidx, align 8, !dbg !238
  %call = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([8 x i8]* @.str1, i32 0, i32 0), double %5), !dbg !239
  %6 = load i32* %i, align 4, !dbg !240
  %rem = srem i32 %6, 20, !dbg !240
  %cmp1 = icmp eq i32 %rem, 0, !dbg !240
  br i1 %cmp1, label %if.then, label %if.end, !dbg !242

if.then:                                          ; preds = %for.body
  %7 = load %struct._IO_FILE** @stderr, align 8, !dbg !243
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)), !dbg !245
  br label %if.end, !dbg !245

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc, !dbg !246

for.inc:                                          ; preds = %if.end
  %8 = load i32* %i, align 4, !dbg !247
  %inc = add nsw i32 %8, 1, !dbg !247
  store i32 %inc, i32* %i, align 4, !dbg !247
  br label %for.cond, !dbg !248

for.end:                                          ; preds = %for.cond
  %9 = load %struct._IO_FILE** @stderr, align 8, !dbg !249
  %call3 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)), !dbg !250
  ret void, !dbg !251
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

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\000\00\000\00\001", !1, !2, !3, !13, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c] [DW_LANG_C99]
!1 = !{!"atax.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax"}
!2 = !{}
!3 = !{!4, !9, !12, !6}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!5 = !{!"0x1\00\000\001024000000\0064\000\000\000", null, null, !6, !7, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1024000000, align 64, offset 0] [from double]
!6 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!7 = !{!8, !8}
!8 = !{!"0x21\000\004000"}                        ; [ DW_TAG_subrange_type ] [0, 3999]
!9 = !{!"0xf\00\000\0064\0064\000\000", null, null, !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = !{!"0x1\00\000\00256000\0064\000\000\000", null, null, !6, !11, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 256000, align 64, offset 0] [from double]
!11 = !{!8}
!12 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!13 = !{!14, !22, !26, !29}
!14 = !{!"0x2e\00main\00main\00\0081\000\001\000\000\00256\000\0082", !1, !15, !16, null, i32 (i32, i8**)* @main, null, null, !2} ; [ DW_TAG_subprogram ] [line 81] [def] [scope 82] [main]
!15 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!16 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !17, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!17 = !{!18, !18, !19}
!18 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!19 = !{!"0xf\00\000\0064\0064\000\000", null, null, !20} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!20 = !{!"0xf\00\000\0064\0064\000\000", null, null, !21} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!21 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!22 = !{!"0x2e\00print_array\00print_array\00\0040\001\001\000\000\00256\000\0043", !1, !15, !23, null, void (i32, double*)* @print_array, null, null, !2} ; [ DW_TAG_subprogram ] [line 40] [local] [def] [scope 43] [print_array]
!23 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !24, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!24 = !{null, !18, !25}
!25 = !{!"0xf\00\000\0064\0064\000\000", null, null, !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!26 = !{!"0x2e\00kernel_atax\00kernel_atax\00\0057\001\001\000\000\00256\000\0062", !1, !15, !27, null, void (i32, i32, [4000 x double]*, double*, double*, double*)* @kernel_atax, null, null, !2} ; [ DW_TAG_subprogram ] [line 57] [local] [def] [scope 62] [kernel_atax]
!27 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !28, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!28 = !{null, !18, !18, !9, !25, !25, !25}
!29 = !{!"0x2e\00init_array\00init_array\00\0023\001\001\000\000\00256\000\0026", !1, !15, !30, null, void (i32, i32, [4000 x double]*, double*)* @init_array, null, null, !2} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [scope 26] [init_array]
!30 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !31, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!31 = !{null, !18, !18, !9, !25}
!32 = !{i32 2, !"Dwarf Version", i32 4}
!33 = !{i32 2, !"Debug Info Version", i32 2}
!34 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!35 = !{!"0x101\00argc\0016777297\000", !14, !15, !18} ; [ DW_TAG_arg_variable ] [argc] [line 81]
!36 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!37 = !MDLocation(line: 81, column: 14, scope: !14)
!38 = !{!"0x101\00argv\0033554513\000", !14, !15, !19} ; [ DW_TAG_arg_variable ] [argv] [line 81]
!39 = !MDLocation(line: 81, column: 27, scope: !14)
!40 = !{!"0x100\00nx\0084\000", !14, !15, !18}    ; [ DW_TAG_auto_variable ] [nx] [line 84]
!41 = !MDLocation(line: 84, column: 7, scope: !14)
!42 = !{!"0x100\00ny\0085\000", !14, !15, !18}    ; [ DW_TAG_auto_variable ] [ny] [line 85]
!43 = !MDLocation(line: 85, column: 7, scope: !14)
!44 = !{!"0x100\00A\0088\000", !14, !15, !4}      ; [ DW_TAG_auto_variable ] [A] [line 88]
!45 = !MDLocation(line: 88, column: 3, scope: !14)
!46 = !{!"0x100\00x\0089\000", !14, !15, !9}      ; [ DW_TAG_auto_variable ] [x] [line 89]
!47 = !MDLocation(line: 89, column: 3, scope: !14)
!48 = !{!"0x100\00y\0090\000", !14, !15, !9}      ; [ DW_TAG_auto_variable ] [y] [line 90]
!49 = !MDLocation(line: 90, column: 3, scope: !14)
!50 = !{!"0x100\00tmp\0091\000", !14, !15, !9}    ; [ DW_TAG_auto_variable ] [tmp] [line 91]
!51 = !MDLocation(line: 91, column: 3, scope: !14)
!52 = !MDLocation(line: 94, column: 15, scope: !14)
!53 = !MDLocation(line: 94, column: 19, scope: !14)
!54 = !MDLocation(line: 94, column: 23, scope: !14)
!55 = !MDLocation(line: 94, column: 43, scope: !14)
!56 = !MDLocation(line: 94, column: 3, scope: !14)
!57 = !MDLocation(line: 100, column: 16, scope: !14)
!58 = !MDLocation(line: 100, column: 20, scope: !14)
!59 = !MDLocation(line: 101, column: 9, scope: !14)
!60 = !MDLocation(line: 102, column: 9, scope: !14)
!61 = !MDLocation(line: 103, column: 9, scope: !14)
!62 = !MDLocation(line: 104, column: 9, scope: !14)
!63 = !MDLocation(line: 100, column: 3, scope: !14)
!64 = !MDLocation(line: 112, column: 3, scope: !65)
!65 = !{!"0xb\00112\003\000", !1, !14}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!66 = !MDLocation(line: 112, column: 3, scope: !14)
!67 = !MDLocation(line: 112, column: 3, scope: !68)
!68 = !{!"0xb\001", !1, !65}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!69 = !MDLocation(line: 112, column: 3, scope: !70)
!70 = !{!"0xb\002", !1, !65}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!71 = !MDLocation(line: 115, column: 3, scope: !14)
!72 = !MDLocation(line: 116, column: 3, scope: !14)
!73 = !MDLocation(line: 117, column: 3, scope: !14)
!74 = !MDLocation(line: 118, column: 3, scope: !14)
!75 = !MDLocation(line: 120, column: 3, scope: !14)
!76 = !{!"0x101\00nx\0016777239\000", !29, !15, !18} ; [ DW_TAG_arg_variable ] [nx] [line 23]
!77 = !MDLocation(line: 23, column: 22, scope: !29)
!78 = !{!"0x101\00ny\0033554455\000", !29, !15, !18} ; [ DW_TAG_arg_variable ] [ny] [line 23]
!79 = !MDLocation(line: 23, column: 30, scope: !29)
!80 = !{!"0x101\00A\0050331672\000", !29, !15, !9} ; [ DW_TAG_arg_variable ] [A] [line 24]
!81 = !MDLocation(line: 24, column: 14, scope: !29)
!82 = !{!"0x101\00x\0067108889\000", !29, !15, !25} ; [ DW_TAG_arg_variable ] [x] [line 25]
!83 = !MDLocation(line: 25, column: 14, scope: !29)
!84 = !{!"0x100\00i\0027\000", !29, !15, !18}     ; [ DW_TAG_auto_variable ] [i] [line 27]
!85 = !MDLocation(line: 27, column: 7, scope: !29)
!86 = !{!"0x100\00j\0027\000", !29, !15, !18}     ; [ DW_TAG_auto_variable ] [j] [line 27]
!87 = !MDLocation(line: 27, column: 10, scope: !29)
!88 = !MDLocation(line: 29, column: 8, scope: !89)
!89 = !{!"0xb\0029\003\0014", !1, !29}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!90 = !MDLocation(line: 29, column: 15, scope: !91)
!91 = !{!"0xb\002", !1, !92}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!92 = !{!"0xb\001", !1, !93}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!93 = !{!"0xb\0029\003\0015", !1, !89}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!94 = !MDLocation(line: 29, column: 19, scope: !93)
!95 = !MDLocation(line: 29, column: 15, scope: !93)
!96 = !MDLocation(line: 29, column: 3, scope: !89)
!97 = !MDLocation(line: 30, column: 14, scope: !93)
!98 = !MDLocation(line: 30, column: 9, scope: !93)
!99 = !MDLocation(line: 30, column: 7, scope: !93)
!100 = !MDLocation(line: 29, column: 23, scope: !93)
!101 = !MDLocation(line: 29, column: 3, scope: !93)
!102 = !MDLocation(line: 31, column: 8, scope: !103)
!103 = !{!"0xb\0031\003\0016", !1, !29}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!104 = !MDLocation(line: 31, column: 15, scope: !105)
!105 = !{!"0xb\002", !1, !106}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!106 = !{!"0xb\001", !1, !107}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!107 = !{!"0xb\0031\003\0017", !1, !103}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!108 = !MDLocation(line: 31, column: 19, scope: !107)
!109 = !MDLocation(line: 31, column: 15, scope: !107)
!110 = !MDLocation(line: 31, column: 3, scope: !103)
!111 = !MDLocation(line: 32, column: 10, scope: !112)
!112 = !{!"0xb\0032\005\0018", !1, !107}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!113 = !MDLocation(line: 32, column: 17, scope: !114)
!114 = !{!"0xb\002", !1, !115}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!115 = !{!"0xb\001", !1, !116}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!116 = !{!"0xb\0032\005\0019", !1, !112}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!117 = !MDLocation(line: 32, column: 21, scope: !116)
!118 = !MDLocation(line: 32, column: 17, scope: !116)
!119 = !MDLocation(line: 32, column: 5, scope: !112)
!120 = !MDLocation(line: 33, column: 30, scope: !116)
!121 = !MDLocation(line: 33, column: 18, scope: !116)
!122 = !MDLocation(line: 33, column: 33, scope: !116)
!123 = !MDLocation(line: 33, column: 32, scope: !116)
!124 = !MDLocation(line: 33, column: 41, scope: !116)
!125 = !MDLocation(line: 33, column: 17, scope: !116)
!126 = !MDLocation(line: 33, column: 12, scope: !116)
!127 = !MDLocation(line: 33, column: 7, scope: !116)
!128 = !MDLocation(line: 33, column: 9, scope: !116)
!129 = !MDLocation(line: 32, column: 25, scope: !116)
!130 = !MDLocation(line: 32, column: 5, scope: !116)
!131 = !MDLocation(line: 33, column: 41, scope: !112)
!132 = !MDLocation(line: 31, column: 23, scope: !107)
!133 = !MDLocation(line: 31, column: 3, scope: !107)
!134 = !MDLocation(line: 34, column: 1, scope: !29)
!135 = !{!"0x101\00nx\0016777273\000", !26, !15, !18} ; [ DW_TAG_arg_variable ] [nx] [line 57]
!136 = !MDLocation(line: 57, column: 22, scope: !26)
!137 = !{!"0x101\00ny\0033554489\000", !26, !15, !18} ; [ DW_TAG_arg_variable ] [ny] [line 57]
!138 = !MDLocation(line: 57, column: 30, scope: !26)
!139 = !{!"0x101\00A\0050331706\000", !26, !15, !9} ; [ DW_TAG_arg_variable ] [A] [line 58]
!140 = !MDLocation(line: 58, column: 14, scope: !26)
!141 = !{!"0x101\00x\0067108923\000", !26, !15, !25} ; [ DW_TAG_arg_variable ] [x] [line 59]
!142 = !MDLocation(line: 59, column: 14, scope: !26)
!143 = !{!"0x101\00y\0083886140\000", !26, !15, !25} ; [ DW_TAG_arg_variable ] [y] [line 60]
!144 = !MDLocation(line: 60, column: 14, scope: !26)
!145 = !{!"0x101\00tmp\00100663357\000", !26, !15, !25} ; [ DW_TAG_arg_variable ] [tmp] [line 61]
!146 = !MDLocation(line: 61, column: 14, scope: !26)
!147 = !{!"0x100\00i\0063\000", !26, !15, !18}    ; [ DW_TAG_auto_variable ] [i] [line 63]
!148 = !MDLocation(line: 63, column: 7, scope: !26)
!149 = !{!"0x100\00j\0063\000", !26, !15, !18}    ; [ DW_TAG_auto_variable ] [j] [line 63]
!150 = !MDLocation(line: 63, column: 10, scope: !26)
!151 = !MDLocation(line: 66, column: 8, scope: !152)
!152 = !{!"0xb\0066\003\005", !1, !26}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!153 = !MDLocation(line: 66, column: 14, scope: !154)
!154 = !{!"0xb\002", !1, !155}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!155 = !{!"0xb\001", !1, !156}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!156 = !{!"0xb\0066\003\006", !1, !152}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!157 = !MDLocation(line: 66, column: 18, scope: !156)
!158 = !MDLocation(line: 66, column: 14, scope: !156)
!159 = !MDLocation(line: 66, column: 3, scope: !152)
!160 = !MDLocation(line: 67, column: 7, scope: !156)
!161 = !MDLocation(line: 67, column: 5, scope: !156)
!162 = !MDLocation(line: 66, column: 22, scope: !156)
!163 = !MDLocation(line: 66, column: 3, scope: !156)
!164 = !MDLocation(line: 68, column: 8, scope: !165)
!165 = !{!"0xb\0068\003\007", !1, !26}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!166 = !MDLocation(line: 68, column: 15, scope: !167)
!167 = !{!"0xb\002", !1, !168}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!168 = !{!"0xb\001", !1, !169}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!169 = !{!"0xb\0068\003\008", !1, !165}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!170 = !MDLocation(line: 68, column: 19, scope: !169)
!171 = !MDLocation(line: 68, column: 15, scope: !169)
!172 = !MDLocation(line: 68, column: 3, scope: !165)
!173 = !MDLocation(line: 70, column: 11, scope: !174)
!174 = !{!"0xb\0069\005\009", !1, !169}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!175 = !MDLocation(line: 70, column: 7, scope: !174)
!176 = !MDLocation(line: 71, column: 12, scope: !177)
!177 = !{!"0xb\0071\007\0010", !1, !174}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!178 = !MDLocation(line: 71, column: 19, scope: !179)
!179 = !{!"0xb\002", !1, !180}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!180 = !{!"0xb\001", !1, !181}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!181 = !{!"0xb\0071\007\0011", !1, !177}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!182 = !MDLocation(line: 71, column: 23, scope: !181)
!183 = !MDLocation(line: 71, column: 19, scope: !181)
!184 = !MDLocation(line: 71, column: 7, scope: !177)
!185 = !MDLocation(line: 72, column: 15, scope: !181)
!186 = !MDLocation(line: 72, column: 11, scope: !181)
!187 = !MDLocation(line: 72, column: 25, scope: !181)
!188 = !MDLocation(line: 72, column: 20, scope: !181)
!189 = !MDLocation(line: 72, column: 22, scope: !181)
!190 = !MDLocation(line: 72, column: 32, scope: !181)
!191 = !MDLocation(line: 72, column: 30, scope: !181)
!192 = !MDLocation(line: 72, column: 6, scope: !181)
!193 = !MDLocation(line: 72, column: 2, scope: !181)
!194 = !MDLocation(line: 71, column: 27, scope: !181)
!195 = !MDLocation(line: 71, column: 7, scope: !181)
!196 = !MDLocation(line: 73, column: 12, scope: !197)
!197 = !{!"0xb\0073\007\0012", !1, !174}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!198 = !MDLocation(line: 73, column: 19, scope: !199)
!199 = !{!"0xb\002", !1, !200}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!200 = !{!"0xb\001", !1, !201}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!201 = !{!"0xb\0073\007\0013", !1, !197}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!202 = !MDLocation(line: 73, column: 23, scope: !201)
!203 = !MDLocation(line: 73, column: 19, scope: !201)
!204 = !MDLocation(line: 73, column: 7, scope: !197)
!205 = !MDLocation(line: 74, column: 11, scope: !201)
!206 = !MDLocation(line: 74, column: 9, scope: !201)
!207 = !MDLocation(line: 74, column: 21, scope: !201)
!208 = !MDLocation(line: 74, column: 16, scope: !201)
!209 = !MDLocation(line: 74, column: 18, scope: !201)
!210 = !MDLocation(line: 74, column: 30, scope: !201)
!211 = !MDLocation(line: 74, column: 26, scope: !201)
!212 = !MDLocation(line: 74, column: 4, scope: !201)
!213 = !MDLocation(line: 74, column: 2, scope: !201)
!214 = !MDLocation(line: 73, column: 27, scope: !201)
!215 = !MDLocation(line: 73, column: 7, scope: !201)
!216 = !MDLocation(line: 75, column: 5, scope: !174)
!217 = !MDLocation(line: 68, column: 23, scope: !169)
!218 = !MDLocation(line: 68, column: 3, scope: !169)
!219 = !MDLocation(line: 78, column: 1, scope: !26)
!220 = !{!"0x101\00nx\0016777256\000", !22, !15, !18} ; [ DW_TAG_arg_variable ] [nx] [line 40]
!221 = !MDLocation(line: 40, column: 22, scope: !22)
!222 = !{!"0x101\00y\0033554473\000", !22, !15, !25} ; [ DW_TAG_arg_variable ] [y] [line 41]
!223 = !MDLocation(line: 41, column: 14, scope: !22)
!224 = !{!"0x100\00i\0044\000", !22, !15, !18}    ; [ DW_TAG_auto_variable ] [i] [line 44]
!225 = !MDLocation(line: 44, column: 7, scope: !22)
!226 = !MDLocation(line: 46, column: 8, scope: !227)
!227 = !{!"0xb\0046\003\001", !1, !22}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!228 = !MDLocation(line: 46, column: 15, scope: !229)
!229 = !{!"0xb\002", !1, !230}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!230 = !{!"0xb\001", !1, !231}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!231 = !{!"0xb\0046\003\002", !1, !227}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!232 = !MDLocation(line: 46, column: 19, scope: !231)
!233 = !MDLocation(line: 46, column: 15, scope: !231)
!234 = !MDLocation(line: 46, column: 3, scope: !227)
!235 = !MDLocation(line: 47, column: 14, scope: !236)
!236 = !{!"0xb\0046\0028\003", !1, !231}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!237 = !MDLocation(line: 47, column: 46, scope: !236)
!238 = !MDLocation(line: 47, column: 44, scope: !236)
!239 = !MDLocation(line: 47, column: 5, scope: !236)
!240 = !MDLocation(line: 48, column: 9, scope: !241)
!241 = !{!"0xb\0048\009\004", !1, !236}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!242 = !MDLocation(line: 48, column: 9, scope: !236)
!243 = !MDLocation(line: 48, column: 31, scope: !244)
!244 = !{!"0xb\001", !1, !241}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!245 = !MDLocation(line: 48, column: 22, scope: !241)
!246 = !MDLocation(line: 49, column: 3, scope: !236)
!247 = !MDLocation(line: 46, column: 23, scope: !231)
!248 = !MDLocation(line: 46, column: 3, scope: !231)
!249 = !MDLocation(line: 50, column: 12, scope: !22)
!250 = !MDLocation(line: 50, column: 3, scope: !22)
!251 = !MDLocation(line: 51, column: 1, scope: !22)
