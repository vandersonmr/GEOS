; ModuleID = 'gemm.c'
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
  %nk = alloca i32, align 4
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
  call void @llvm.dbg.declare(metadata i32* %nk, metadata !44, metadata !36), !dbg !45
  store i32 1024, i32* %nk, align 4, !dbg !45
  call void @llvm.dbg.declare(metadata double* %alpha, metadata !46, metadata !36), !dbg !47
  call void @llvm.dbg.declare(metadata double* %beta, metadata !48, metadata !36), !dbg !49
  call void @llvm.dbg.declare(metadata [1024 x [1024 x double]]** %C, metadata !50, metadata !36), !dbg !51
  %call = call i8* @polybench_alloc_data(i32 1048576, i32 8), !dbg !51
  %0 = bitcast i8* %call to [1024 x [1024 x double]]*, !dbg !51
  store [1024 x [1024 x double]]* %0, [1024 x [1024 x double]]** %C, align 8, !dbg !51
  call void @llvm.dbg.declare(metadata [1024 x [1024 x double]]** %A, metadata !52, metadata !36), !dbg !53
  %call1 = call i8* @polybench_alloc_data(i32 1048576, i32 8), !dbg !53
  %1 = bitcast i8* %call1 to [1024 x [1024 x double]]*, !dbg !53
  store [1024 x [1024 x double]]* %1, [1024 x [1024 x double]]** %A, align 8, !dbg !53
  call void @llvm.dbg.declare(metadata [1024 x [1024 x double]]** %B, metadata !54, metadata !36), !dbg !55
  %call2 = call i8* @polybench_alloc_data(i32 1048576, i32 8), !dbg !55
  %2 = bitcast i8* %call2 to [1024 x [1024 x double]]*, !dbg !55
  store [1024 x [1024 x double]]* %2, [1024 x [1024 x double]]** %B, align 8, !dbg !55
  %3 = load i32* %ni, align 4, !dbg !56
  %4 = load i32* %nj, align 4, !dbg !57
  %5 = load i32* %nk, align 4, !dbg !58
  %6 = load [1024 x [1024 x double]]** %C, align 8, !dbg !59
  %arraydecay = getelementptr inbounds [1024 x [1024 x double]]* %6, i32 0, i32 0, !dbg !59
  %7 = load [1024 x [1024 x double]]** %A, align 8, !dbg !60
  %arraydecay3 = getelementptr inbounds [1024 x [1024 x double]]* %7, i32 0, i32 0, !dbg !60
  %8 = load [1024 x [1024 x double]]** %B, align 8, !dbg !61
  %arraydecay4 = getelementptr inbounds [1024 x [1024 x double]]* %8, i32 0, i32 0, !dbg !61
  call void @init_array(i32 %3, i32 %4, i32 %5, double* %alpha, double* %beta, [1024 x double]* %arraydecay, [1024 x double]* %arraydecay3, [1024 x double]* %arraydecay4), !dbg !62
  %9 = load i32* %ni, align 4, !dbg !63
  %10 = load i32* %nj, align 4, !dbg !64
  %11 = load i32* %nk, align 4, !dbg !65
  %12 = load double* %alpha, align 8, !dbg !66
  %13 = load double* %beta, align 8, !dbg !67
  %14 = load [1024 x [1024 x double]]** %C, align 8, !dbg !68
  %arraydecay5 = getelementptr inbounds [1024 x [1024 x double]]* %14, i32 0, i32 0, !dbg !68
  %15 = load [1024 x [1024 x double]]** %A, align 8, !dbg !69
  %arraydecay6 = getelementptr inbounds [1024 x [1024 x double]]* %15, i32 0, i32 0, !dbg !69
  %16 = load [1024 x [1024 x double]]** %B, align 8, !dbg !70
  %arraydecay7 = getelementptr inbounds [1024 x [1024 x double]]* %16, i32 0, i32 0, !dbg !70
  call void @kernel_gemm(i32 %9, i32 %10, i32 %11, double %12, double %13, [1024 x double]* %arraydecay5, [1024 x double]* %arraydecay6, [1024 x double]* %arraydecay7), !dbg !71
  %17 = load i32* %argc.addr, align 4, !dbg !72
  %cmp = icmp sgt i32 %17, 42, !dbg !72
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !74

land.lhs.true:                                    ; preds = %entry
  %18 = load i8*** %argv.addr, align 8, !dbg !75
  %arrayidx = getelementptr inbounds i8** %18, i64 0, !dbg !75
  %19 = load i8** %arrayidx, align 8, !dbg !75
  %call8 = call i32 @strcmp(i8* %19, i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0)) #5, !dbg !75
  %tobool = icmp ne i32 %call8, 0, !dbg !74
  br i1 %tobool, label %if.end, label %if.then, !dbg !74

if.then:                                          ; preds = %land.lhs.true
  %20 = load i32* %ni, align 4, !dbg !77
  %21 = load i32* %nj, align 4, !dbg !77
  %22 = load [1024 x [1024 x double]]** %C, align 8, !dbg !77
  %arraydecay9 = getelementptr inbounds [1024 x [1024 x double]]* %22, i32 0, i32 0, !dbg !77
  call void @print_array(i32 %20, i32 %21, [1024 x double]* %arraydecay9), !dbg !77
  br label %if.end, !dbg !77

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %23 = load [1024 x [1024 x double]]** %C, align 8, !dbg !79
  %24 = bitcast [1024 x [1024 x double]]* %23 to i8*, !dbg !79
  call void @free(i8* %24) #6, !dbg !79
  %25 = load [1024 x [1024 x double]]** %A, align 8, !dbg !80
  %26 = bitcast [1024 x [1024 x double]]* %25 to i8*, !dbg !80
  call void @free(i8* %26) #6, !dbg !80
  %27 = load [1024 x [1024 x double]]** %B, align 8, !dbg !81
  %28 = bitcast [1024 x [1024 x double]]* %27 to i8*, !dbg !81
  call void @free(i8* %28) #6, !dbg !81
  ret i32 0, !dbg !82
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i8* @polybench_alloc_data(i32, i32) #2

; Function Attrs: nounwind uwtable
define internal void @init_array(i32 %ni, i32 %nj, i32 %nk, double* %alpha, double* %beta, [1024 x double]* %C, [1024 x double]* %A, [1024 x double]* %B) #0 {
entry:
  %ni.addr = alloca i32, align 4
  %nj.addr = alloca i32, align 4
  %nk.addr = alloca i32, align 4
  %alpha.addr = alloca double*, align 8
  %beta.addr = alloca double*, align 8
  %C.addr = alloca [1024 x double]*, align 8
  %A.addr = alloca [1024 x double]*, align 8
  %B.addr = alloca [1024 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %ni, i32* %ni.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ni.addr, metadata !83, metadata !36), !dbg !84
  store i32 %nj, i32* %nj.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nj.addr, metadata !85, metadata !36), !dbg !86
  store i32 %nk, i32* %nk.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nk.addr, metadata !87, metadata !36), !dbg !88
  store double* %alpha, double** %alpha.addr, align 8
  call void @llvm.dbg.declare(metadata double** %alpha.addr, metadata !89, metadata !36), !dbg !90
  store double* %beta, double** %beta.addr, align 8
  call void @llvm.dbg.declare(metadata double** %beta.addr, metadata !91, metadata !36), !dbg !92
  store [1024 x double]* %C, [1024 x double]** %C.addr, align 8
  call void @llvm.dbg.declare(metadata [1024 x double]** %C.addr, metadata !93, metadata !36), !dbg !94
  store [1024 x double]* %A, [1024 x double]** %A.addr, align 8
  call void @llvm.dbg.declare(metadata [1024 x double]** %A.addr, metadata !95, metadata !36), !dbg !96
  store [1024 x double]* %B, [1024 x double]** %B.addr, align 8
  call void @llvm.dbg.declare(metadata [1024 x double]** %B.addr, metadata !97, metadata !36), !dbg !98
  call void @llvm.dbg.declare(metadata i32* %i, metadata !99, metadata !36), !dbg !100
  call void @llvm.dbg.declare(metadata i32* %j, metadata !101, metadata !36), !dbg !102
  %0 = load double** %alpha.addr, align 8, !dbg !103
  store double 3.241200e+04, double* %0, align 8, !dbg !104
  %1 = load double** %beta.addr, align 8, !dbg !105
  store double 2.123000e+03, double* %1, align 8, !dbg !106
  store i32 0, i32* %i, align 4, !dbg !107
  br label %for.cond, !dbg !107

for.cond:                                         ; preds = %for.inc8, %entry
  %2 = load i32* %i, align 4, !dbg !109
  %3 = load i32* %ni.addr, align 4, !dbg !113
  %cmp = icmp slt i32 %2, %3, !dbg !114
  br i1 %cmp, label %for.body, label %for.end10, !dbg !115

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !116
  br label %for.cond1, !dbg !116

for.cond1:                                        ; preds = %for.inc, %for.body
  %4 = load i32* %j, align 4, !dbg !118
  %5 = load i32* %nj.addr, align 4, !dbg !122
  %cmp2 = icmp slt i32 %4, %5, !dbg !123
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !124

for.body3:                                        ; preds = %for.cond1
  %6 = load i32* %i, align 4, !dbg !125
  %conv = sitofp i32 %6 to double, !dbg !126
  %7 = load i32* %j, align 4, !dbg !127
  %conv4 = sitofp i32 %7 to double, !dbg !127
  %mul = fmul double %conv, %conv4, !dbg !126
  %8 = load i32* %ni.addr, align 4, !dbg !128
  %conv5 = sitofp i32 %8 to double, !dbg !128
  %div = fdiv double %mul, %conv5, !dbg !129
  %9 = load i32* %j, align 4, !dbg !130
  %idxprom = sext i32 %9 to i64, !dbg !131
  %10 = load i32* %i, align 4, !dbg !132
  %idxprom6 = sext i32 %10 to i64, !dbg !131
  %11 = load [1024 x double]** %C.addr, align 8, !dbg !131
  %arrayidx = getelementptr inbounds [1024 x double]* %11, i64 %idxprom6, !dbg !131
  %arrayidx7 = getelementptr inbounds [1024 x double]* %arrayidx, i32 0, i64 %idxprom, !dbg !131
  store double %div, double* %arrayidx7, align 8, !dbg !131
  br label %for.inc, !dbg !131

for.inc:                                          ; preds = %for.body3
  %12 = load i32* %j, align 4, !dbg !133
  %inc = add nsw i32 %12, 1, !dbg !133
  store i32 %inc, i32* %j, align 4, !dbg !133
  br label %for.cond1, !dbg !134

for.end:                                          ; preds = %for.cond1
  br label %for.inc8, !dbg !135

for.inc8:                                         ; preds = %for.end
  %13 = load i32* %i, align 4, !dbg !136
  %inc9 = add nsw i32 %13, 1, !dbg !136
  store i32 %inc9, i32* %i, align 4, !dbg !136
  br label %for.cond, !dbg !137

for.end10:                                        ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !138
  br label %for.cond11, !dbg !138

for.cond11:                                       ; preds = %for.inc31, %for.end10
  %14 = load i32* %i, align 4, !dbg !140
  %15 = load i32* %ni.addr, align 4, !dbg !144
  %cmp12 = icmp slt i32 %14, %15, !dbg !145
  br i1 %cmp12, label %for.body14, label %for.end33, !dbg !146

for.body14:                                       ; preds = %for.cond11
  store i32 0, i32* %j, align 4, !dbg !147
  br label %for.cond15, !dbg !147

for.cond15:                                       ; preds = %for.inc28, %for.body14
  %16 = load i32* %j, align 4, !dbg !149
  %17 = load i32* %nk.addr, align 4, !dbg !153
  %cmp16 = icmp slt i32 %16, %17, !dbg !154
  br i1 %cmp16, label %for.body18, label %for.end30, !dbg !155

for.body18:                                       ; preds = %for.cond15
  %18 = load i32* %i, align 4, !dbg !156
  %conv19 = sitofp i32 %18 to double, !dbg !157
  %19 = load i32* %j, align 4, !dbg !158
  %conv20 = sitofp i32 %19 to double, !dbg !158
  %mul21 = fmul double %conv19, %conv20, !dbg !157
  %20 = load i32* %ni.addr, align 4, !dbg !159
  %conv22 = sitofp i32 %20 to double, !dbg !159
  %div23 = fdiv double %mul21, %conv22, !dbg !160
  %21 = load i32* %j, align 4, !dbg !161
  %idxprom24 = sext i32 %21 to i64, !dbg !162
  %22 = load i32* %i, align 4, !dbg !163
  %idxprom25 = sext i32 %22 to i64, !dbg !162
  %23 = load [1024 x double]** %A.addr, align 8, !dbg !162
  %arrayidx26 = getelementptr inbounds [1024 x double]* %23, i64 %idxprom25, !dbg !162
  %arrayidx27 = getelementptr inbounds [1024 x double]* %arrayidx26, i32 0, i64 %idxprom24, !dbg !162
  store double %div23, double* %arrayidx27, align 8, !dbg !162
  br label %for.inc28, !dbg !162

for.inc28:                                        ; preds = %for.body18
  %24 = load i32* %j, align 4, !dbg !164
  %inc29 = add nsw i32 %24, 1, !dbg !164
  store i32 %inc29, i32* %j, align 4, !dbg !164
  br label %for.cond15, !dbg !165

for.end30:                                        ; preds = %for.cond15
  br label %for.inc31, !dbg !166

for.inc31:                                        ; preds = %for.end30
  %25 = load i32* %i, align 4, !dbg !167
  %inc32 = add nsw i32 %25, 1, !dbg !167
  store i32 %inc32, i32* %i, align 4, !dbg !167
  br label %for.cond11, !dbg !168

for.end33:                                        ; preds = %for.cond11
  store i32 0, i32* %i, align 4, !dbg !169
  br label %for.cond34, !dbg !169

for.cond34:                                       ; preds = %for.inc54, %for.end33
  %26 = load i32* %i, align 4, !dbg !171
  %27 = load i32* %nk.addr, align 4, !dbg !175
  %cmp35 = icmp slt i32 %26, %27, !dbg !176
  br i1 %cmp35, label %for.body37, label %for.end56, !dbg !177

for.body37:                                       ; preds = %for.cond34
  store i32 0, i32* %j, align 4, !dbg !178
  br label %for.cond38, !dbg !178

for.cond38:                                       ; preds = %for.inc51, %for.body37
  %28 = load i32* %j, align 4, !dbg !180
  %29 = load i32* %nj.addr, align 4, !dbg !184
  %cmp39 = icmp slt i32 %28, %29, !dbg !185
  br i1 %cmp39, label %for.body41, label %for.end53, !dbg !186

for.body41:                                       ; preds = %for.cond38
  %30 = load i32* %i, align 4, !dbg !187
  %conv42 = sitofp i32 %30 to double, !dbg !188
  %31 = load i32* %j, align 4, !dbg !189
  %conv43 = sitofp i32 %31 to double, !dbg !189
  %mul44 = fmul double %conv42, %conv43, !dbg !188
  %32 = load i32* %ni.addr, align 4, !dbg !190
  %conv45 = sitofp i32 %32 to double, !dbg !190
  %div46 = fdiv double %mul44, %conv45, !dbg !191
  %33 = load i32* %j, align 4, !dbg !192
  %idxprom47 = sext i32 %33 to i64, !dbg !193
  %34 = load i32* %i, align 4, !dbg !194
  %idxprom48 = sext i32 %34 to i64, !dbg !193
  %35 = load [1024 x double]** %B.addr, align 8, !dbg !193
  %arrayidx49 = getelementptr inbounds [1024 x double]* %35, i64 %idxprom48, !dbg !193
  %arrayidx50 = getelementptr inbounds [1024 x double]* %arrayidx49, i32 0, i64 %idxprom47, !dbg !193
  store double %div46, double* %arrayidx50, align 8, !dbg !193
  br label %for.inc51, !dbg !193

for.inc51:                                        ; preds = %for.body41
  %36 = load i32* %j, align 4, !dbg !195
  %inc52 = add nsw i32 %36, 1, !dbg !195
  store i32 %inc52, i32* %j, align 4, !dbg !195
  br label %for.cond38, !dbg !196

for.end53:                                        ; preds = %for.cond38
  br label %for.inc54, !dbg !197

for.inc54:                                        ; preds = %for.end53
  %37 = load i32* %i, align 4, !dbg !198
  %inc55 = add nsw i32 %37, 1, !dbg !198
  store i32 %inc55, i32* %i, align 4, !dbg !198
  br label %for.cond34, !dbg !199

for.end56:                                        ; preds = %for.cond34
  ret void, !dbg !200
}

; Function Attrs: nounwind uwtable
define internal void @kernel_gemm(i32 %ni, i32 %nj, i32 %nk, double %alpha, double %beta, [1024 x double]* %C, [1024 x double]* %A, [1024 x double]* %B) #0 {
entry:
  %ni.addr = alloca i32, align 4
  %nj.addr = alloca i32, align 4
  %nk.addr = alloca i32, align 4
  %alpha.addr = alloca double, align 8
  %beta.addr = alloca double, align 8
  %C.addr = alloca [1024 x double]*, align 8
  %A.addr = alloca [1024 x double]*, align 8
  %B.addr = alloca [1024 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %ni, i32* %ni.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ni.addr, metadata !201, metadata !36), !dbg !202
  store i32 %nj, i32* %nj.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nj.addr, metadata !203, metadata !36), !dbg !204
  store i32 %nk, i32* %nk.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nk.addr, metadata !205, metadata !36), !dbg !206
  store double %alpha, double* %alpha.addr, align 8
  call void @llvm.dbg.declare(metadata double* %alpha.addr, metadata !207, metadata !36), !dbg !208
  store double %beta, double* %beta.addr, align 8
  call void @llvm.dbg.declare(metadata double* %beta.addr, metadata !209, metadata !36), !dbg !210
  store [1024 x double]* %C, [1024 x double]** %C.addr, align 8
  call void @llvm.dbg.declare(metadata [1024 x double]** %C.addr, metadata !211, metadata !36), !dbg !212
  store [1024 x double]* %A, [1024 x double]** %A.addr, align 8
  call void @llvm.dbg.declare(metadata [1024 x double]** %A.addr, metadata !213, metadata !36), !dbg !214
  store [1024 x double]* %B, [1024 x double]** %B.addr, align 8
  call void @llvm.dbg.declare(metadata [1024 x double]** %B.addr, metadata !215, metadata !36), !dbg !216
  call void @llvm.dbg.declare(metadata i32* %i, metadata !217, metadata !36), !dbg !218
  call void @llvm.dbg.declare(metadata i32* %j, metadata !219, metadata !36), !dbg !220
  call void @llvm.dbg.declare(metadata i32* %k, metadata !221, metadata !36), !dbg !222
  store i32 0, i32* %i, align 4, !dbg !223
  br label %for.cond, !dbg !223

for.cond:                                         ; preds = %for.inc26, %entry
  %0 = load i32* %i, align 4, !dbg !225
  %1 = load i32* %ni.addr, align 4, !dbg !229
  %cmp = icmp slt i32 %0, %1, !dbg !230
  br i1 %cmp, label %for.body, label %for.end28, !dbg !231

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !232
  br label %for.cond1, !dbg !232

for.cond1:                                        ; preds = %for.inc23, %for.body
  %2 = load i32* %j, align 4, !dbg !234
  %3 = load i32* %nj.addr, align 4, !dbg !238
  %cmp2 = icmp slt i32 %2, %3, !dbg !239
  br i1 %cmp2, label %for.body3, label %for.end25, !dbg !240

for.body3:                                        ; preds = %for.cond1
  %4 = load double* %beta.addr, align 8, !dbg !241
  %5 = load i32* %j, align 4, !dbg !243
  %idxprom = sext i32 %5 to i64, !dbg !244
  %6 = load i32* %i, align 4, !dbg !245
  %idxprom4 = sext i32 %6 to i64, !dbg !244
  %7 = load [1024 x double]** %C.addr, align 8, !dbg !244
  %arrayidx = getelementptr inbounds [1024 x double]* %7, i64 %idxprom4, !dbg !244
  %arrayidx5 = getelementptr inbounds [1024 x double]* %arrayidx, i32 0, i64 %idxprom, !dbg !244
  %8 = load double* %arrayidx5, align 8, !dbg !244
  %mul = fmul double %8, %4, !dbg !244
  store double %mul, double* %arrayidx5, align 8, !dbg !244
  store i32 0, i32* %k, align 4, !dbg !246
  br label %for.cond6, !dbg !246

for.cond6:                                        ; preds = %for.inc, %for.body3
  %9 = load i32* %k, align 4, !dbg !248
  %10 = load i32* %nk.addr, align 4, !dbg !252
  %cmp7 = icmp slt i32 %9, %10, !dbg !253
  br i1 %cmp7, label %for.body8, label %for.end, !dbg !254

for.body8:                                        ; preds = %for.cond6
  %11 = load double* %alpha.addr, align 8, !dbg !255
  %12 = load i32* %k, align 4, !dbg !256
  %idxprom9 = sext i32 %12 to i64, !dbg !257
  %13 = load i32* %i, align 4, !dbg !258
  %idxprom10 = sext i32 %13 to i64, !dbg !257
  %14 = load [1024 x double]** %A.addr, align 8, !dbg !257
  %arrayidx11 = getelementptr inbounds [1024 x double]* %14, i64 %idxprom10, !dbg !257
  %arrayidx12 = getelementptr inbounds [1024 x double]* %arrayidx11, i32 0, i64 %idxprom9, !dbg !257
  %15 = load double* %arrayidx12, align 8, !dbg !257
  %mul13 = fmul double %11, %15, !dbg !255
  %16 = load i32* %j, align 4, !dbg !259
  %idxprom14 = sext i32 %16 to i64, !dbg !260
  %17 = load i32* %k, align 4, !dbg !261
  %idxprom15 = sext i32 %17 to i64, !dbg !260
  %18 = load [1024 x double]** %B.addr, align 8, !dbg !260
  %arrayidx16 = getelementptr inbounds [1024 x double]* %18, i64 %idxprom15, !dbg !260
  %arrayidx17 = getelementptr inbounds [1024 x double]* %arrayidx16, i32 0, i64 %idxprom14, !dbg !260
  %19 = load double* %arrayidx17, align 8, !dbg !260
  %mul18 = fmul double %mul13, %19, !dbg !255
  %20 = load i32* %j, align 4, !dbg !262
  %idxprom19 = sext i32 %20 to i64, !dbg !263
  %21 = load i32* %i, align 4, !dbg !264
  %idxprom20 = sext i32 %21 to i64, !dbg !263
  %22 = load [1024 x double]** %C.addr, align 8, !dbg !263
  %arrayidx21 = getelementptr inbounds [1024 x double]* %22, i64 %idxprom20, !dbg !263
  %arrayidx22 = getelementptr inbounds [1024 x double]* %arrayidx21, i32 0, i64 %idxprom19, !dbg !263
  %23 = load double* %arrayidx22, align 8, !dbg !263
  %add = fadd double %23, %mul18, !dbg !263
  store double %add, double* %arrayidx22, align 8, !dbg !263
  br label %for.inc, !dbg !263

for.inc:                                          ; preds = %for.body8
  %24 = load i32* %k, align 4, !dbg !265
  %inc = add nsw i32 %24, 1, !dbg !265
  store i32 %inc, i32* %k, align 4, !dbg !265
  br label %for.cond6, !dbg !266

for.end:                                          ; preds = %for.cond6
  br label %for.inc23, !dbg !267

for.inc23:                                        ; preds = %for.end
  %25 = load i32* %j, align 4, !dbg !268
  %inc24 = add nsw i32 %25, 1, !dbg !268
  store i32 %inc24, i32* %j, align 4, !dbg !268
  br label %for.cond1, !dbg !269

for.end25:                                        ; preds = %for.cond1
  br label %for.inc26, !dbg !270

for.inc26:                                        ; preds = %for.end25
  %26 = load i32* %i, align 4, !dbg !271
  %inc27 = add nsw i32 %26, 1, !dbg !271
  store i32 %inc27, i32* %i, align 4, !dbg !271
  br label %for.cond, !dbg !272

for.end28:                                        ; preds = %for.cond
  ret void, !dbg !273
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
  call void @llvm.dbg.declare(metadata i32* %ni.addr, metadata !274, metadata !36), !dbg !275
  store i32 %nj, i32* %nj.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nj.addr, metadata !276, metadata !36), !dbg !277
  store [1024 x double]* %C, [1024 x double]** %C.addr, align 8
  call void @llvm.dbg.declare(metadata [1024 x double]** %C.addr, metadata !278, metadata !36), !dbg !279
  call void @llvm.dbg.declare(metadata i32* %i, metadata !280, metadata !36), !dbg !281
  call void @llvm.dbg.declare(metadata i32* %j, metadata !282, metadata !36), !dbg !283
  store i32 0, i32* %i, align 4, !dbg !284
  br label %for.cond, !dbg !284

for.cond:                                         ; preds = %for.inc8, %entry
  %0 = load i32* %i, align 4, !dbg !286
  %1 = load i32* %ni.addr, align 4, !dbg !290
  %cmp = icmp slt i32 %0, %1, !dbg !291
  br i1 %cmp, label %for.body, label %for.end10, !dbg !292

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !293
  br label %for.cond1, !dbg !293

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32* %j, align 4, !dbg !295
  %3 = load i32* %nj.addr, align 4, !dbg !299
  %cmp2 = icmp slt i32 %2, %3, !dbg !300
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !301

for.body3:                                        ; preds = %for.cond1
  %4 = load %struct._IO_FILE** @stderr, align 8, !dbg !302
  %5 = load i32* %j, align 4, !dbg !304
  %idxprom = sext i32 %5 to i64, !dbg !305
  %6 = load i32* %i, align 4, !dbg !306
  %idxprom4 = sext i32 %6 to i64, !dbg !305
  %7 = load [1024 x double]** %C.addr, align 8, !dbg !305
  %arrayidx = getelementptr inbounds [1024 x double]* %7, i64 %idxprom4, !dbg !305
  %arrayidx5 = getelementptr inbounds [1024 x double]* %arrayidx, i32 0, i64 %idxprom, !dbg !305
  %8 = load double* %arrayidx5, align 8, !dbg !305
  %call = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([8 x i8]* @.str1, i32 0, i32 0), double %8), !dbg !307
  %9 = load i32* %i, align 4, !dbg !308
  %10 = load i32* %ni.addr, align 4, !dbg !310
  %mul = mul nsw i32 %9, %10, !dbg !308
  %11 = load i32* %j, align 4, !dbg !311
  %add = add nsw i32 %mul, %11, !dbg !308
  %rem = srem i32 %add, 20, !dbg !312
  %cmp6 = icmp eq i32 %rem, 0, !dbg !312
  br i1 %cmp6, label %if.then, label %if.end, !dbg !313

if.then:                                          ; preds = %for.body3
  %12 = load %struct._IO_FILE** @stderr, align 8, !dbg !314
  %call7 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)), !dbg !316
  br label %if.end, !dbg !316

if.end:                                           ; preds = %if.then, %for.body3
  br label %for.inc, !dbg !317

for.inc:                                          ; preds = %if.end
  %13 = load i32* %j, align 4, !dbg !318
  %inc = add nsw i32 %13, 1, !dbg !318
  store i32 %inc, i32* %j, align 4, !dbg !318
  br label %for.cond1, !dbg !319

for.end:                                          ; preds = %for.cond1
  br label %for.inc8, !dbg !320

for.inc8:                                         ; preds = %for.end
  %14 = load i32* %i, align 4, !dbg !321
  %inc9 = add nsw i32 %14, 1, !dbg !321
  store i32 %inc9, i32* %i, align 4, !dbg !321
  br label %for.cond, !dbg !322

for.end10:                                        ; preds = %for.cond
  %15 = load %struct._IO_FILE** @stderr, align 8, !dbg !323
  %call11 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)), !dbg !324
  ret void, !dbg !325
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

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\000\00\000\00\001", !1, !2, !3, !10, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c] [DW_LANG_C99]
!1 = !{!"gemm.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm"}
!2 = !{}
!3 = !{!4, !9, !6}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!5 = !{!"0x1\00\000\0067108864\0064\000\000\000", null, null, !6, !7, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 67108864, align 64, offset 0] [from double]
!6 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!7 = !{!8, !8}
!8 = !{!"0x21\000\001024"}                        ; [ DW_TAG_subrange_type ] [0, 1023]
!9 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = !{!11, !19, !25, !28}
!11 = !{!"0x2e\00main\00main\00\0089\000\001\000\000\00256\000\0090", !1, !12, !13, null, i32 (i32, i8**)* @main, null, null, !2} ; [ DW_TAG_subprogram ] [line 89] [def] [scope 90] [main]
!12 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!13 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !14, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = !{!15, !15, !16}
!15 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!16 = !{!"0xf\00\000\0064\0064\000\000", null, null, !17} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!17 = !{!"0xf\00\000\0064\0064\000\000", null, null, !18} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!18 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!19 = !{!"0x2e\00print_array\00print_array\00\0049\001\001\000\000\00256\000\0051", !1, !12, !20, null, void (i32, i32, [1024 x double]*)* @print_array, null, null, !2} ; [ DW_TAG_subprogram ] [line 49] [local] [def] [scope 51] [print_array]
!20 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !21, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!21 = !{null, !15, !15, !22}
!22 = !{!"0xf\00\000\0064\0064\000\000", null, null, !23} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!23 = !{!"0x1\00\000\0065536\0064\000\000\000", null, null, !6, !24, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 65536, align 64, offset 0] [from double]
!24 = !{!8}
!25 = !{!"0x2e\00kernel_gemm\00kernel_gemm\00\0066\001\001\000\000\00256\000\0072", !1, !12, !26, null, void (i32, i32, i32, double, double, [1024 x double]*, [1024 x double]*, [1024 x double]*)* @kernel_gemm, null, null, !2} ; [ DW_TAG_subprogram ] [line 66] [local] [def] [scope 72] [kernel_gemm]
!26 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !27, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!27 = !{null, !15, !15, !15, !6, !6, !22, !22, !22}
!28 = !{!"0x2e\00init_array\00init_array\00\0023\001\001\000\000\00256\000\0029", !1, !12, !29, null, void (i32, i32, i32, double*, double*, [1024 x double]*, [1024 x double]*, [1024 x double]*)* @init_array, null, null, !2} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [scope 29] [init_array]
!29 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !30, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!30 = !{null, !15, !15, !15, !31, !31, !22, !22, !22}
!31 = !{!"0xf\00\000\0064\0064\000\000", null, null, !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!32 = !{i32 2, !"Dwarf Version", i32 4}
!33 = !{i32 2, !"Debug Info Version", i32 2}
!34 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!35 = !{!"0x101\00argc\0016777305\000", !11, !12, !15} ; [ DW_TAG_arg_variable ] [argc] [line 89]
!36 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!37 = !MDLocation(line: 89, column: 14, scope: !11)
!38 = !{!"0x101\00argv\0033554521\000", !11, !12, !16} ; [ DW_TAG_arg_variable ] [argv] [line 89]
!39 = !MDLocation(line: 89, column: 27, scope: !11)
!40 = !{!"0x100\00ni\0092\000", !11, !12, !15}    ; [ DW_TAG_auto_variable ] [ni] [line 92]
!41 = !MDLocation(line: 92, column: 7, scope: !11)
!42 = !{!"0x100\00nj\0093\000", !11, !12, !15}    ; [ DW_TAG_auto_variable ] [nj] [line 93]
!43 = !MDLocation(line: 93, column: 7, scope: !11)
!44 = !{!"0x100\00nk\0094\000", !11, !12, !15}    ; [ DW_TAG_auto_variable ] [nk] [line 94]
!45 = !MDLocation(line: 94, column: 7, scope: !11)
!46 = !{!"0x100\00alpha\0097\000", !11, !12, !6}  ; [ DW_TAG_auto_variable ] [alpha] [line 97]
!47 = !MDLocation(line: 97, column: 13, scope: !11)
!48 = !{!"0x100\00beta\0098\000", !11, !12, !6}   ; [ DW_TAG_auto_variable ] [beta] [line 98]
!49 = !MDLocation(line: 98, column: 13, scope: !11)
!50 = !{!"0x100\00C\0099\000", !11, !12, !4}      ; [ DW_TAG_auto_variable ] [C] [line 99]
!51 = !MDLocation(line: 99, column: 3, scope: !11)
!52 = !{!"0x100\00A\00100\000", !11, !12, !4}     ; [ DW_TAG_auto_variable ] [A] [line 100]
!53 = !MDLocation(line: 100, column: 3, scope: !11)
!54 = !{!"0x100\00B\00101\000", !11, !12, !4}     ; [ DW_TAG_auto_variable ] [B] [line 101]
!55 = !MDLocation(line: 101, column: 3, scope: !11)
!56 = !MDLocation(line: 104, column: 15, scope: !11)
!57 = !MDLocation(line: 104, column: 19, scope: !11)
!58 = !MDLocation(line: 104, column: 23, scope: !11)
!59 = !MDLocation(line: 105, column: 8, scope: !11)
!60 = !MDLocation(line: 106, column: 8, scope: !11)
!61 = !MDLocation(line: 107, column: 8, scope: !11)
!62 = !MDLocation(line: 104, column: 3, scope: !11)
!63 = !MDLocation(line: 113, column: 16, scope: !11)
!64 = !MDLocation(line: 113, column: 20, scope: !11)
!65 = !MDLocation(line: 113, column: 24, scope: !11)
!66 = !MDLocation(line: 114, column: 9, scope: !11)
!67 = !MDLocation(line: 114, column: 16, scope: !11)
!68 = !MDLocation(line: 115, column: 9, scope: !11)
!69 = !MDLocation(line: 116, column: 9, scope: !11)
!70 = !MDLocation(line: 117, column: 9, scope: !11)
!71 = !MDLocation(line: 113, column: 3, scope: !11)
!72 = !MDLocation(line: 125, column: 3, scope: !73)
!73 = !{!"0xb\00125\003\000", !1, !11}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!74 = !MDLocation(line: 125, column: 3, scope: !11)
!75 = !MDLocation(line: 125, column: 3, scope: !76)
!76 = !{!"0xb\001", !1, !73}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!77 = !MDLocation(line: 125, column: 3, scope: !78)
!78 = !{!"0xb\002", !1, !73}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!79 = !MDLocation(line: 128, column: 3, scope: !11)
!80 = !MDLocation(line: 129, column: 3, scope: !11)
!81 = !MDLocation(line: 130, column: 3, scope: !11)
!82 = !MDLocation(line: 132, column: 3, scope: !11)
!83 = !{!"0x101\00ni\0016777239\000", !28, !12, !15} ; [ DW_TAG_arg_variable ] [ni] [line 23]
!84 = !MDLocation(line: 23, column: 21, scope: !28)
!85 = !{!"0x101\00nj\0033554455\000", !28, !12, !15} ; [ DW_TAG_arg_variable ] [nj] [line 23]
!86 = !MDLocation(line: 23, column: 29, scope: !28)
!87 = !{!"0x101\00nk\0050331671\000", !28, !12, !15} ; [ DW_TAG_arg_variable ] [nk] [line 23]
!88 = !MDLocation(line: 23, column: 37, scope: !28)
!89 = !{!"0x101\00alpha\0067108888\000", !28, !12, !31} ; [ DW_TAG_arg_variable ] [alpha] [line 24]
!90 = !MDLocation(line: 24, column: 14, scope: !28)
!91 = !{!"0x101\00beta\0083886105\000", !28, !12, !31} ; [ DW_TAG_arg_variable ] [beta] [line 25]
!92 = !MDLocation(line: 25, column: 14, scope: !28)
!93 = !{!"0x101\00C\00100663322\000", !28, !12, !22} ; [ DW_TAG_arg_variable ] [C] [line 26]
!94 = !MDLocation(line: 26, column: 13, scope: !28)
!95 = !{!"0x101\00A\00117440539\000", !28, !12, !22} ; [ DW_TAG_arg_variable ] [A] [line 27]
!96 = !MDLocation(line: 27, column: 13, scope: !28)
!97 = !{!"0x101\00B\00134217756\000", !28, !12, !22} ; [ DW_TAG_arg_variable ] [B] [line 28]
!98 = !MDLocation(line: 28, column: 13, scope: !28)
!99 = !{!"0x100\00i\0030\000", !28, !12, !15}     ; [ DW_TAG_auto_variable ] [i] [line 30]
!100 = !MDLocation(line: 30, column: 7, scope: !28)
!101 = !{!"0x100\00j\0030\000", !28, !12, !15}    ; [ DW_TAG_auto_variable ] [j] [line 30]
!102 = !MDLocation(line: 30, column: 10, scope: !28)
!103 = !MDLocation(line: 32, column: 4, scope: !28)
!104 = !MDLocation(line: 32, column: 3, scope: !28)
!105 = !MDLocation(line: 33, column: 4, scope: !28)
!106 = !MDLocation(line: 33, column: 3, scope: !28)
!107 = !MDLocation(line: 34, column: 8, scope: !108)
!108 = !{!"0xb\0034\003\0014", !1, !28}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!109 = !MDLocation(line: 34, column: 15, scope: !110)
!110 = !{!"0xb\002", !1, !111}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!111 = !{!"0xb\001", !1, !112}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!112 = !{!"0xb\0034\003\0015", !1, !108}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!113 = !MDLocation(line: 34, column: 19, scope: !112)
!114 = !MDLocation(line: 34, column: 15, scope: !112)
!115 = !MDLocation(line: 34, column: 3, scope: !108)
!116 = !MDLocation(line: 35, column: 10, scope: !117)
!117 = !{!"0xb\0035\005\0016", !1, !112}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!118 = !MDLocation(line: 35, column: 17, scope: !119)
!119 = !{!"0xb\002", !1, !120}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!120 = !{!"0xb\001", !1, !121}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!121 = !{!"0xb\0035\005\0017", !1, !117}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!122 = !MDLocation(line: 35, column: 21, scope: !121)
!123 = !MDLocation(line: 35, column: 17, scope: !121)
!124 = !MDLocation(line: 35, column: 5, scope: !117)
!125 = !MDLocation(line: 36, column: 30, scope: !121)
!126 = !MDLocation(line: 36, column: 18, scope: !121)
!127 = !MDLocation(line: 36, column: 32, scope: !121)
!128 = !MDLocation(line: 36, column: 37, scope: !121)
!129 = !MDLocation(line: 36, column: 17, scope: !121)
!130 = !MDLocation(line: 36, column: 12, scope: !121)
!131 = !MDLocation(line: 36, column: 7, scope: !121)
!132 = !MDLocation(line: 36, column: 9, scope: !121)
!133 = !MDLocation(line: 35, column: 25, scope: !121)
!134 = !MDLocation(line: 35, column: 5, scope: !121)
!135 = !MDLocation(line: 36, column: 37, scope: !117)
!136 = !MDLocation(line: 34, column: 23, scope: !112)
!137 = !MDLocation(line: 34, column: 3, scope: !112)
!138 = !MDLocation(line: 37, column: 8, scope: !139)
!139 = !{!"0xb\0037\003\0018", !1, !28}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!140 = !MDLocation(line: 37, column: 15, scope: !141)
!141 = !{!"0xb\002", !1, !142}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!142 = !{!"0xb\001", !1, !143}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!143 = !{!"0xb\0037\003\0019", !1, !139}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!144 = !MDLocation(line: 37, column: 19, scope: !143)
!145 = !MDLocation(line: 37, column: 15, scope: !143)
!146 = !MDLocation(line: 37, column: 3, scope: !139)
!147 = !MDLocation(line: 38, column: 10, scope: !148)
!148 = !{!"0xb\0038\005\0020", !1, !143}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!149 = !MDLocation(line: 38, column: 17, scope: !150)
!150 = !{!"0xb\002", !1, !151}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!151 = !{!"0xb\001", !1, !152}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!152 = !{!"0xb\0038\005\0021", !1, !148}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!153 = !MDLocation(line: 38, column: 21, scope: !152)
!154 = !MDLocation(line: 38, column: 17, scope: !152)
!155 = !MDLocation(line: 38, column: 5, scope: !148)
!156 = !MDLocation(line: 39, column: 30, scope: !152)
!157 = !MDLocation(line: 39, column: 18, scope: !152)
!158 = !MDLocation(line: 39, column: 32, scope: !152)
!159 = !MDLocation(line: 39, column: 37, scope: !152)
!160 = !MDLocation(line: 39, column: 17, scope: !152)
!161 = !MDLocation(line: 39, column: 12, scope: !152)
!162 = !MDLocation(line: 39, column: 7, scope: !152)
!163 = !MDLocation(line: 39, column: 9, scope: !152)
!164 = !MDLocation(line: 38, column: 25, scope: !152)
!165 = !MDLocation(line: 38, column: 5, scope: !152)
!166 = !MDLocation(line: 39, column: 37, scope: !148)
!167 = !MDLocation(line: 37, column: 23, scope: !143)
!168 = !MDLocation(line: 37, column: 3, scope: !143)
!169 = !MDLocation(line: 40, column: 8, scope: !170)
!170 = !{!"0xb\0040\003\0022", !1, !28}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!171 = !MDLocation(line: 40, column: 15, scope: !172)
!172 = !{!"0xb\002", !1, !173}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!173 = !{!"0xb\001", !1, !174}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!174 = !{!"0xb\0040\003\0023", !1, !170}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!175 = !MDLocation(line: 40, column: 19, scope: !174)
!176 = !MDLocation(line: 40, column: 15, scope: !174)
!177 = !MDLocation(line: 40, column: 3, scope: !170)
!178 = !MDLocation(line: 41, column: 10, scope: !179)
!179 = !{!"0xb\0041\005\0024", !1, !174}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!180 = !MDLocation(line: 41, column: 17, scope: !181)
!181 = !{!"0xb\002", !1, !182}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!182 = !{!"0xb\001", !1, !183}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!183 = !{!"0xb\0041\005\0025", !1, !179}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!184 = !MDLocation(line: 41, column: 21, scope: !183)
!185 = !MDLocation(line: 41, column: 17, scope: !183)
!186 = !MDLocation(line: 41, column: 5, scope: !179)
!187 = !MDLocation(line: 42, column: 30, scope: !183)
!188 = !MDLocation(line: 42, column: 18, scope: !183)
!189 = !MDLocation(line: 42, column: 32, scope: !183)
!190 = !MDLocation(line: 42, column: 37, scope: !183)
!191 = !MDLocation(line: 42, column: 17, scope: !183)
!192 = !MDLocation(line: 42, column: 12, scope: !183)
!193 = !MDLocation(line: 42, column: 7, scope: !183)
!194 = !MDLocation(line: 42, column: 9, scope: !183)
!195 = !MDLocation(line: 41, column: 25, scope: !183)
!196 = !MDLocation(line: 41, column: 5, scope: !183)
!197 = !MDLocation(line: 42, column: 37, scope: !179)
!198 = !MDLocation(line: 40, column: 23, scope: !174)
!199 = !MDLocation(line: 40, column: 3, scope: !174)
!200 = !MDLocation(line: 43, column: 1, scope: !28)
!201 = !{!"0x101\00ni\0016777282\000", !25, !12, !15} ; [ DW_TAG_arg_variable ] [ni] [line 66]
!202 = !MDLocation(line: 66, column: 22, scope: !25)
!203 = !{!"0x101\00nj\0033554498\000", !25, !12, !15} ; [ DW_TAG_arg_variable ] [nj] [line 66]
!204 = !MDLocation(line: 66, column: 30, scope: !25)
!205 = !{!"0x101\00nk\0050331714\000", !25, !12, !15} ; [ DW_TAG_arg_variable ] [nk] [line 66]
!206 = !MDLocation(line: 66, column: 38, scope: !25)
!207 = !{!"0x101\00alpha\0067108931\000", !25, !12, !6} ; [ DW_TAG_arg_variable ] [alpha] [line 67]
!208 = !MDLocation(line: 67, column: 14, scope: !25)
!209 = !{!"0x101\00beta\0083886148\000", !25, !12, !6} ; [ DW_TAG_arg_variable ] [beta] [line 68]
!210 = !MDLocation(line: 68, column: 14, scope: !25)
!211 = !{!"0x101\00C\00100663365\000", !25, !12, !22} ; [ DW_TAG_arg_variable ] [C] [line 69]
!212 = !MDLocation(line: 69, column: 14, scope: !25)
!213 = !{!"0x101\00A\00117440582\000", !25, !12, !22} ; [ DW_TAG_arg_variable ] [A] [line 70]
!214 = !MDLocation(line: 70, column: 14, scope: !25)
!215 = !{!"0x101\00B\00134217799\000", !25, !12, !22} ; [ DW_TAG_arg_variable ] [B] [line 71]
!216 = !MDLocation(line: 71, column: 14, scope: !25)
!217 = !{!"0x100\00i\0073\000", !25, !12, !15}    ; [ DW_TAG_auto_variable ] [i] [line 73]
!218 = !MDLocation(line: 73, column: 7, scope: !25)
!219 = !{!"0x100\00j\0073\000", !25, !12, !15}    ; [ DW_TAG_auto_variable ] [j] [line 73]
!220 = !MDLocation(line: 73, column: 10, scope: !25)
!221 = !{!"0x100\00k\0073\000", !25, !12, !15}    ; [ DW_TAG_auto_variable ] [k] [line 73]
!222 = !MDLocation(line: 73, column: 13, scope: !25)
!223 = !MDLocation(line: 77, column: 8, scope: !224)
!224 = !{!"0xb\0077\003\007", !1, !25}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!225 = !MDLocation(line: 77, column: 15, scope: !226)
!226 = !{!"0xb\002", !1, !227}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!227 = !{!"0xb\001", !1, !228}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!228 = !{!"0xb\0077\003\008", !1, !224}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!229 = !MDLocation(line: 77, column: 19, scope: !228)
!230 = !MDLocation(line: 77, column: 15, scope: !228)
!231 = !MDLocation(line: 77, column: 3, scope: !224)
!232 = !MDLocation(line: 78, column: 10, scope: !233)
!233 = !{!"0xb\0078\005\009", !1, !228}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!234 = !MDLocation(line: 78, column: 17, scope: !235)
!235 = !{!"0xb\002", !1, !236}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!236 = !{!"0xb\001", !1, !237}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!237 = !{!"0xb\0078\005\0010", !1, !233}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!238 = !MDLocation(line: 78, column: 21, scope: !237)
!239 = !MDLocation(line: 78, column: 17, scope: !237)
!240 = !MDLocation(line: 78, column: 5, scope: !233)
!241 = !MDLocation(line: 80, column: 13, scope: !242)
!242 = !{!"0xb\0079\007\0011", !1, !237}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!243 = !MDLocation(line: 80, column: 7, scope: !242)
!244 = !MDLocation(line: 80, column: 2, scope: !242)
!245 = !MDLocation(line: 80, column: 4, scope: !242)
!246 = !MDLocation(line: 81, column: 7, scope: !247)
!247 = !{!"0xb\0081\002\0012", !1, !242}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!248 = !MDLocation(line: 81, column: 14, scope: !249)
!249 = !{!"0xb\002", !1, !250}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!250 = !{!"0xb\001", !1, !251}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!251 = !{!"0xb\0081\002\0013", !1, !247}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!252 = !MDLocation(line: 81, column: 18, scope: !251)
!253 = !MDLocation(line: 81, column: 14, scope: !251)
!254 = !MDLocation(line: 81, column: 2, scope: !247)
!255 = !MDLocation(line: 82, column: 15, scope: !251)
!256 = !MDLocation(line: 82, column: 28, scope: !251)
!257 = !MDLocation(line: 82, column: 23, scope: !251)
!258 = !MDLocation(line: 82, column: 25, scope: !251)
!259 = !MDLocation(line: 82, column: 38, scope: !251)
!260 = !MDLocation(line: 82, column: 33, scope: !251)
!261 = !MDLocation(line: 82, column: 35, scope: !251)
!262 = !MDLocation(line: 82, column: 9, scope: !251)
!263 = !MDLocation(line: 82, column: 4, scope: !251)
!264 = !MDLocation(line: 82, column: 6, scope: !251)
!265 = !MDLocation(line: 81, column: 22, scope: !251)
!266 = !MDLocation(line: 81, column: 2, scope: !251)
!267 = !MDLocation(line: 83, column: 7, scope: !242)
!268 = !MDLocation(line: 78, column: 25, scope: !237)
!269 = !MDLocation(line: 78, column: 5, scope: !237)
!270 = !MDLocation(line: 83, column: 7, scope: !233)
!271 = !MDLocation(line: 77, column: 23, scope: !228)
!272 = !MDLocation(line: 77, column: 3, scope: !228)
!273 = !MDLocation(line: 86, column: 1, scope: !25)
!274 = !{!"0x101\00ni\0016777265\000", !19, !12, !15} ; [ DW_TAG_arg_variable ] [ni] [line 49]
!275 = !MDLocation(line: 49, column: 22, scope: !19)
!276 = !{!"0x101\00nj\0033554481\000", !19, !12, !15} ; [ DW_TAG_arg_variable ] [nj] [line 49]
!277 = !MDLocation(line: 49, column: 30, scope: !19)
!278 = !{!"0x101\00C\0050331698\000", !19, !12, !22} ; [ DW_TAG_arg_variable ] [C] [line 50]
!279 = !MDLocation(line: 50, column: 14, scope: !19)
!280 = !{!"0x100\00i\0052\000", !19, !12, !15}    ; [ DW_TAG_auto_variable ] [i] [line 52]
!281 = !MDLocation(line: 52, column: 7, scope: !19)
!282 = !{!"0x100\00j\0052\000", !19, !12, !15}    ; [ DW_TAG_auto_variable ] [j] [line 52]
!283 = !MDLocation(line: 52, column: 10, scope: !19)
!284 = !MDLocation(line: 54, column: 8, scope: !285)
!285 = !{!"0xb\0054\003\001", !1, !19}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!286 = !MDLocation(line: 54, column: 15, scope: !287)
!287 = !{!"0xb\002", !1, !288}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!288 = !{!"0xb\001", !1, !289}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!289 = !{!"0xb\0054\003\002", !1, !285}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!290 = !MDLocation(line: 54, column: 19, scope: !289)
!291 = !MDLocation(line: 54, column: 15, scope: !289)
!292 = !MDLocation(line: 54, column: 3, scope: !285)
!293 = !MDLocation(line: 55, column: 10, scope: !294)
!294 = !{!"0xb\0055\005\003", !1, !289}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!295 = !MDLocation(line: 55, column: 17, scope: !296)
!296 = !{!"0xb\002", !1, !297}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!297 = !{!"0xb\001", !1, !298}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!298 = !{!"0xb\0055\005\004", !1, !294}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!299 = !MDLocation(line: 55, column: 21, scope: !298)
!300 = !MDLocation(line: 55, column: 17, scope: !298)
!301 = !MDLocation(line: 55, column: 5, scope: !294)
!302 = !MDLocation(line: 56, column: 11, scope: !303)
!303 = !{!"0xb\0055\0030\005", !1, !298}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!304 = !MDLocation(line: 56, column: 46, scope: !303)
!305 = !MDLocation(line: 56, column: 41, scope: !303)
!306 = !MDLocation(line: 56, column: 43, scope: !303)
!307 = !MDLocation(line: 56, column: 2, scope: !303)
!308 = !MDLocation(line: 57, column: 7, scope: !309)
!309 = !{!"0xb\0057\006\006", !1, !303}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!310 = !MDLocation(line: 57, column: 11, scope: !309)
!311 = !MDLocation(line: 57, column: 16, scope: !309)
!312 = !MDLocation(line: 57, column: 6, scope: !309)
!313 = !MDLocation(line: 57, column: 6, scope: !303)
!314 = !MDLocation(line: 57, column: 39, scope: !315)
!315 = !{!"0xb\001", !1, !309}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!316 = !MDLocation(line: 57, column: 30, scope: !309)
!317 = !MDLocation(line: 58, column: 5, scope: !303)
!318 = !MDLocation(line: 55, column: 25, scope: !298)
!319 = !MDLocation(line: 55, column: 5, scope: !298)
!320 = !MDLocation(line: 58, column: 5, scope: !294)
!321 = !MDLocation(line: 54, column: 23, scope: !289)
!322 = !MDLocation(line: 54, column: 3, scope: !289)
!323 = !MDLocation(line: 59, column: 12, scope: !19)
!324 = !MDLocation(line: 59, column: 3, scope: !19)
!325 = !MDLocation(line: 60, column: 1, scope: !19)
