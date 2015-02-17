; ModuleID = '2mm.c'
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !35, metadata !36), !dbg !37
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !38, metadata !36), !dbg !39
  call void @llvm.dbg.declare(metadata i32* %ni, metadata !40, metadata !36), !dbg !41
  store i32 1024, i32* %ni, align 4, !dbg !41
  call void @llvm.dbg.declare(metadata i32* %nj, metadata !42, metadata !36), !dbg !43
  store i32 1024, i32* %nj, align 4, !dbg !43
  call void @llvm.dbg.declare(metadata i32* %nk, metadata !44, metadata !36), !dbg !45
  store i32 1024, i32* %nk, align 4, !dbg !45
  call void @llvm.dbg.declare(metadata i32* %nl, metadata !46, metadata !36), !dbg !47
  store i32 1024, i32* %nl, align 4, !dbg !47
  call void @llvm.dbg.declare(metadata double* %alpha, metadata !48, metadata !36), !dbg !49
  call void @llvm.dbg.declare(metadata double* %beta, metadata !50, metadata !36), !dbg !51
  call void @llvm.dbg.declare(metadata [1024 x [1024 x double]]** %tmp, metadata !52, metadata !36), !dbg !53
  %call = call i8* @polybench_alloc_data(i32 1048576, i32 8), !dbg !53
  %0 = bitcast i8* %call to [1024 x [1024 x double]]*, !dbg !53
  store [1024 x [1024 x double]]* %0, [1024 x [1024 x double]]** %tmp, align 8, !dbg !53
  call void @llvm.dbg.declare(metadata [1024 x [1024 x double]]** %A, metadata !54, metadata !36), !dbg !55
  %call2 = call i8* @polybench_alloc_data(i32 1048576, i32 8), !dbg !55
  %1 = bitcast i8* %call2 to [1024 x [1024 x double]]*, !dbg !55
  store [1024 x [1024 x double]]* %1, [1024 x [1024 x double]]** %A, align 8, !dbg !55
  call void @llvm.dbg.declare(metadata [1024 x [1024 x double]]** %B, metadata !56, metadata !36), !dbg !57
  %call4 = call i8* @polybench_alloc_data(i32 1048576, i32 8), !dbg !57
  %2 = bitcast i8* %call4 to [1024 x [1024 x double]]*, !dbg !57
  store [1024 x [1024 x double]]* %2, [1024 x [1024 x double]]** %B, align 8, !dbg !57
  call void @llvm.dbg.declare(metadata [1024 x [1024 x double]]** %C, metadata !58, metadata !36), !dbg !59
  %call6 = call i8* @polybench_alloc_data(i32 1048576, i32 8), !dbg !59
  %3 = bitcast i8* %call6 to [1024 x [1024 x double]]*, !dbg !59
  store [1024 x [1024 x double]]* %3, [1024 x [1024 x double]]** %C, align 8, !dbg !59
  call void @llvm.dbg.declare(metadata [1024 x [1024 x double]]** %D, metadata !60, metadata !36), !dbg !61
  %call8 = call i8* @polybench_alloc_data(i32 1048576, i32 8), !dbg !61
  %4 = bitcast i8* %call8 to [1024 x [1024 x double]]*, !dbg !61
  store [1024 x [1024 x double]]* %4, [1024 x [1024 x double]]** %D, align 8, !dbg !61
  %5 = load i32* %ni, align 4, !dbg !62
  %6 = load i32* %nj, align 4, !dbg !63
  %7 = load i32* %nk, align 4, !dbg !64
  %8 = load i32* %nl, align 4, !dbg !65
  %9 = load [1024 x [1024 x double]]** %A, align 8, !dbg !66
  %arraydecay = getelementptr inbounds [1024 x [1024 x double]]* %9, i32 0, i32 0, !dbg !66
  %10 = load [1024 x [1024 x double]]** %B, align 8, !dbg !67
  %arraydecay9 = getelementptr inbounds [1024 x [1024 x double]]* %10, i32 0, i32 0, !dbg !67
  %11 = load [1024 x [1024 x double]]** %C, align 8, !dbg !68
  %arraydecay10 = getelementptr inbounds [1024 x [1024 x double]]* %11, i32 0, i32 0, !dbg !68
  %12 = load [1024 x [1024 x double]]** %D, align 8, !dbg !69
  %arraydecay11 = getelementptr inbounds [1024 x [1024 x double]]* %12, i32 0, i32 0, !dbg !69
  call void @init_array(i32 %5, i32 %6, i32 %7, i32 %8, double* %alpha, double* %beta, [1024 x double]* %arraydecay, [1024 x double]* %arraydecay9, [1024 x double]* %arraydecay10, [1024 x double]* %arraydecay11), !dbg !70
  %13 = load i32* %ni, align 4, !dbg !71
  %14 = load i32* %nj, align 4, !dbg !72
  %15 = load i32* %nk, align 4, !dbg !73
  %16 = load i32* %nl, align 4, !dbg !74
  %17 = load double* %alpha, align 8, !dbg !75
  %18 = load double* %beta, align 8, !dbg !76
  %19 = load [1024 x [1024 x double]]** %tmp, align 8, !dbg !77
  %arraydecay12 = getelementptr inbounds [1024 x [1024 x double]]* %19, i32 0, i32 0, !dbg !77
  %20 = load [1024 x [1024 x double]]** %A, align 8, !dbg !78
  %arraydecay13 = getelementptr inbounds [1024 x [1024 x double]]* %20, i32 0, i32 0, !dbg !78
  %21 = load [1024 x [1024 x double]]** %B, align 8, !dbg !79
  %arraydecay14 = getelementptr inbounds [1024 x [1024 x double]]* %21, i32 0, i32 0, !dbg !79
  %22 = load [1024 x [1024 x double]]** %C, align 8, !dbg !80
  %arraydecay15 = getelementptr inbounds [1024 x [1024 x double]]* %22, i32 0, i32 0, !dbg !80
  %23 = load [1024 x [1024 x double]]** %D, align 8, !dbg !81
  %arraydecay16 = getelementptr inbounds [1024 x [1024 x double]]* %23, i32 0, i32 0, !dbg !81
  call void @kernel_2mm(i32 %13, i32 %14, i32 %15, i32 %16, double %17, double %18, [1024 x double]* %arraydecay12, [1024 x double]* %arraydecay13, [1024 x double]* %arraydecay14, [1024 x double]* %arraydecay15, [1024 x double]* %arraydecay16), !dbg !82
  %24 = load i32* %argc.addr, align 4, !dbg !83
  %cmp = icmp sgt i32 %24, 42, !dbg !83
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !85

land.lhs.true:                                    ; preds = %entry
  %25 = load i8*** %argv.addr, align 8, !dbg !86
  %arrayidx = getelementptr inbounds i8** %25, i64 0, !dbg !86
  %26 = load i8** %arrayidx, align 8, !dbg !86
  %call17 = call i32 @strcmp(i8* %26, i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0)) #5, !dbg !86
  %tobool = icmp ne i32 %call17, 0, !dbg !85
  br i1 %tobool, label %if.end, label %if.then, !dbg !85

if.then:                                          ; preds = %land.lhs.true
  %27 = load i32* %ni, align 4, !dbg !88
  %28 = load i32* %nl, align 4, !dbg !88
  %29 = load [1024 x [1024 x double]]** %D, align 8, !dbg !88
  %arraydecay18 = getelementptr inbounds [1024 x [1024 x double]]* %29, i32 0, i32 0, !dbg !88
  call void @print_array(i32 %27, i32 %28, [1024 x double]* %arraydecay18), !dbg !88
  br label %if.end, !dbg !88

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %30 = load [1024 x [1024 x double]]** %tmp, align 8, !dbg !90
  %31 = bitcast [1024 x [1024 x double]]* %30 to i8*, !dbg !90
  call void @free(i8* %31) #6, !dbg !90
  %32 = load [1024 x [1024 x double]]** %A, align 8, !dbg !91
  %33 = bitcast [1024 x [1024 x double]]* %32 to i8*, !dbg !91
  call void @free(i8* %33) #6, !dbg !91
  %34 = load [1024 x [1024 x double]]** %B, align 8, !dbg !92
  %35 = bitcast [1024 x [1024 x double]]* %34 to i8*, !dbg !92
  call void @free(i8* %35) #6, !dbg !92
  %36 = load [1024 x [1024 x double]]** %C, align 8, !dbg !93
  %37 = bitcast [1024 x [1024 x double]]* %36 to i8*, !dbg !93
  call void @free(i8* %37) #6, !dbg !93
  %38 = load [1024 x [1024 x double]]** %D, align 8, !dbg !94
  %39 = bitcast [1024 x [1024 x double]]* %38 to i8*, !dbg !94
  call void @free(i8* %39) #6, !dbg !94
  ret i32 0, !dbg !95
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i8* @polybench_alloc_data(i32, i32) #2

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
  call void @llvm.dbg.declare(metadata i32* %ni.addr, metadata !96, metadata !36), !dbg !97
  store i32 %nj, i32* %nj.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nj.addr, metadata !98, metadata !36), !dbg !99
  store i32 %nk, i32* %nk.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nk.addr, metadata !100, metadata !36), !dbg !101
  store i32 %nl, i32* %nl.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nl.addr, metadata !102, metadata !36), !dbg !103
  store double* %alpha, double** %alpha.addr, align 8
  call void @llvm.dbg.declare(metadata double** %alpha.addr, metadata !104, metadata !36), !dbg !105
  store double* %beta, double** %beta.addr, align 8
  call void @llvm.dbg.declare(metadata double** %beta.addr, metadata !106, metadata !36), !dbg !107
  store [1024 x double]* %A, [1024 x double]** %A.addr, align 8
  call void @llvm.dbg.declare(metadata [1024 x double]** %A.addr, metadata !108, metadata !36), !dbg !109
  store [1024 x double]* %B, [1024 x double]** %B.addr, align 8
  call void @llvm.dbg.declare(metadata [1024 x double]** %B.addr, metadata !110, metadata !36), !dbg !111
  store [1024 x double]* %C, [1024 x double]** %C.addr, align 8
  call void @llvm.dbg.declare(metadata [1024 x double]** %C.addr, metadata !112, metadata !36), !dbg !113
  store [1024 x double]* %D, [1024 x double]** %D.addr, align 8
  call void @llvm.dbg.declare(metadata [1024 x double]** %D.addr, metadata !114, metadata !36), !dbg !115
  call void @llvm.dbg.declare(metadata i32* %i, metadata !116, metadata !36), !dbg !117
  call void @llvm.dbg.declare(metadata i32* %j, metadata !118, metadata !36), !dbg !119
  %0 = load double** %alpha.addr, align 8, !dbg !120
  store double 3.241200e+04, double* %0, align 8, !dbg !121
  %1 = load double** %beta.addr, align 8, !dbg !122
  store double 2.123000e+03, double* %1, align 8, !dbg !123
  store i32 0, i32* %i, align 4, !dbg !124
  br label %for.cond, !dbg !124

for.cond:                                         ; preds = %for.inc8, %entry
  %2 = load i32* %i, align 4, !dbg !126
  %3 = load i32* %ni.addr, align 4, !dbg !130
  %cmp = icmp slt i32 %2, %3, !dbg !131
  br i1 %cmp, label %for.body, label %for.end10, !dbg !132

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !133
  br label %for.cond1, !dbg !133

for.cond1:                                        ; preds = %for.inc, %for.body
  %4 = load i32* %j, align 4, !dbg !135
  %5 = load i32* %nk.addr, align 4, !dbg !139
  %cmp2 = icmp slt i32 %4, %5, !dbg !140
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !141

for.body3:                                        ; preds = %for.cond1
  %6 = load i32* %i, align 4, !dbg !142
  %conv = sitofp i32 %6 to double, !dbg !143
  %7 = load i32* %j, align 4, !dbg !144
  %conv4 = sitofp i32 %7 to double, !dbg !144
  %mul = fmul double %conv, %conv4, !dbg !143
  %8 = load i32* %ni.addr, align 4, !dbg !145
  %conv5 = sitofp i32 %8 to double, !dbg !145
  %div = fdiv double %mul, %conv5, !dbg !146
  %9 = load i32* %j, align 4, !dbg !147
  %idxprom = sext i32 %9 to i64, !dbg !148
  %10 = load i32* %i, align 4, !dbg !149
  %idxprom6 = sext i32 %10 to i64, !dbg !148
  %11 = load [1024 x double]** %A.addr, align 8, !dbg !148
  %arrayidx = getelementptr inbounds [1024 x double]* %11, i64 %idxprom6, !dbg !148
  %arrayidx7 = getelementptr inbounds [1024 x double]* %arrayidx, i32 0, i64 %idxprom, !dbg !148
  store double %div, double* %arrayidx7, align 8, !dbg !148
  br label %for.inc, !dbg !148

for.inc:                                          ; preds = %for.body3
  %12 = load i32* %j, align 4, !dbg !150
  %inc = add nsw i32 %12, 1, !dbg !150
  store i32 %inc, i32* %j, align 4, !dbg !150
  br label %for.cond1, !dbg !151

for.end:                                          ; preds = %for.cond1
  br label %for.inc8, !dbg !152

for.inc8:                                         ; preds = %for.end
  %13 = load i32* %i, align 4, !dbg !153
  %inc9 = add nsw i32 %13, 1, !dbg !153
  store i32 %inc9, i32* %i, align 4, !dbg !153
  br label %for.cond, !dbg !154

for.end10:                                        ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !155
  br label %for.cond11, !dbg !155

for.cond11:                                       ; preds = %for.inc31, %for.end10
  %14 = load i32* %i, align 4, !dbg !157
  %15 = load i32* %nk.addr, align 4, !dbg !161
  %cmp12 = icmp slt i32 %14, %15, !dbg !162
  br i1 %cmp12, label %for.body14, label %for.end33, !dbg !163

for.body14:                                       ; preds = %for.cond11
  store i32 0, i32* %j, align 4, !dbg !164
  br label %for.cond15, !dbg !164

for.cond15:                                       ; preds = %for.inc28, %for.body14
  %16 = load i32* %j, align 4, !dbg !166
  %17 = load i32* %nj.addr, align 4, !dbg !170
  %cmp16 = icmp slt i32 %16, %17, !dbg !171
  br i1 %cmp16, label %for.body18, label %for.end30, !dbg !172

for.body18:                                       ; preds = %for.cond15
  %18 = load i32* %i, align 4, !dbg !173
  %conv19 = sitofp i32 %18 to double, !dbg !174
  %19 = load i32* %j, align 4, !dbg !175
  %add = add nsw i32 %19, 1, !dbg !175
  %conv20 = sitofp i32 %add to double, !dbg !176
  %mul21 = fmul double %conv19, %conv20, !dbg !174
  %20 = load i32* %nj.addr, align 4, !dbg !177
  %conv22 = sitofp i32 %20 to double, !dbg !177
  %div23 = fdiv double %mul21, %conv22, !dbg !178
  %21 = load i32* %j, align 4, !dbg !179
  %idxprom24 = sext i32 %21 to i64, !dbg !180
  %22 = load i32* %i, align 4, !dbg !181
  %idxprom25 = sext i32 %22 to i64, !dbg !180
  %23 = load [1024 x double]** %B.addr, align 8, !dbg !180
  %arrayidx26 = getelementptr inbounds [1024 x double]* %23, i64 %idxprom25, !dbg !180
  %arrayidx27 = getelementptr inbounds [1024 x double]* %arrayidx26, i32 0, i64 %idxprom24, !dbg !180
  store double %div23, double* %arrayidx27, align 8, !dbg !180
  br label %for.inc28, !dbg !180

for.inc28:                                        ; preds = %for.body18
  %24 = load i32* %j, align 4, !dbg !182
  %inc29 = add nsw i32 %24, 1, !dbg !182
  store i32 %inc29, i32* %j, align 4, !dbg !182
  br label %for.cond15, !dbg !183

for.end30:                                        ; preds = %for.cond15
  br label %for.inc31, !dbg !184

for.inc31:                                        ; preds = %for.end30
  %25 = load i32* %i, align 4, !dbg !185
  %inc32 = add nsw i32 %25, 1, !dbg !185
  store i32 %inc32, i32* %i, align 4, !dbg !185
  br label %for.cond11, !dbg !186

for.end33:                                        ; preds = %for.cond11
  store i32 0, i32* %i, align 4, !dbg !187
  br label %for.cond34, !dbg !187

for.cond34:                                       ; preds = %for.inc55, %for.end33
  %26 = load i32* %i, align 4, !dbg !189
  %27 = load i32* %nl.addr, align 4, !dbg !193
  %cmp35 = icmp slt i32 %26, %27, !dbg !194
  br i1 %cmp35, label %for.body37, label %for.end57, !dbg !195

for.body37:                                       ; preds = %for.cond34
  store i32 0, i32* %j, align 4, !dbg !196
  br label %for.cond38, !dbg !196

for.cond38:                                       ; preds = %for.inc52, %for.body37
  %28 = load i32* %j, align 4, !dbg !198
  %29 = load i32* %nj.addr, align 4, !dbg !202
  %cmp39 = icmp slt i32 %28, %29, !dbg !203
  br i1 %cmp39, label %for.body41, label %for.end54, !dbg !204

for.body41:                                       ; preds = %for.cond38
  %30 = load i32* %i, align 4, !dbg !205
  %conv42 = sitofp i32 %30 to double, !dbg !206
  %31 = load i32* %j, align 4, !dbg !207
  %add43 = add nsw i32 %31, 3, !dbg !207
  %conv44 = sitofp i32 %add43 to double, !dbg !208
  %mul45 = fmul double %conv42, %conv44, !dbg !206
  %32 = load i32* %nl.addr, align 4, !dbg !209
  %conv46 = sitofp i32 %32 to double, !dbg !209
  %div47 = fdiv double %mul45, %conv46, !dbg !210
  %33 = load i32* %j, align 4, !dbg !211
  %idxprom48 = sext i32 %33 to i64, !dbg !212
  %34 = load i32* %i, align 4, !dbg !213
  %idxprom49 = sext i32 %34 to i64, !dbg !212
  %35 = load [1024 x double]** %C.addr, align 8, !dbg !212
  %arrayidx50 = getelementptr inbounds [1024 x double]* %35, i64 %idxprom49, !dbg !212
  %arrayidx51 = getelementptr inbounds [1024 x double]* %arrayidx50, i32 0, i64 %idxprom48, !dbg !212
  store double %div47, double* %arrayidx51, align 8, !dbg !212
  br label %for.inc52, !dbg !212

for.inc52:                                        ; preds = %for.body41
  %36 = load i32* %j, align 4, !dbg !214
  %inc53 = add nsw i32 %36, 1, !dbg !214
  store i32 %inc53, i32* %j, align 4, !dbg !214
  br label %for.cond38, !dbg !215

for.end54:                                        ; preds = %for.cond38
  br label %for.inc55, !dbg !216

for.inc55:                                        ; preds = %for.end54
  %37 = load i32* %i, align 4, !dbg !217
  %inc56 = add nsw i32 %37, 1, !dbg !217
  store i32 %inc56, i32* %i, align 4, !dbg !217
  br label %for.cond34, !dbg !218

for.end57:                                        ; preds = %for.cond34
  store i32 0, i32* %i, align 4, !dbg !219
  br label %for.cond58, !dbg !219

for.cond58:                                       ; preds = %for.inc79, %for.end57
  %38 = load i32* %i, align 4, !dbg !221
  %39 = load i32* %ni.addr, align 4, !dbg !225
  %cmp59 = icmp slt i32 %38, %39, !dbg !226
  br i1 %cmp59, label %for.body61, label %for.end81, !dbg !227

for.body61:                                       ; preds = %for.cond58
  store i32 0, i32* %j, align 4, !dbg !228
  br label %for.cond62, !dbg !228

for.cond62:                                       ; preds = %for.inc76, %for.body61
  %40 = load i32* %j, align 4, !dbg !230
  %41 = load i32* %nl.addr, align 4, !dbg !234
  %cmp63 = icmp slt i32 %40, %41, !dbg !235
  br i1 %cmp63, label %for.body65, label %for.end78, !dbg !236

for.body65:                                       ; preds = %for.cond62
  %42 = load i32* %i, align 4, !dbg !237
  %conv66 = sitofp i32 %42 to double, !dbg !238
  %43 = load i32* %j, align 4, !dbg !239
  %add67 = add nsw i32 %43, 2, !dbg !239
  %conv68 = sitofp i32 %add67 to double, !dbg !240
  %mul69 = fmul double %conv66, %conv68, !dbg !238
  %44 = load i32* %nk.addr, align 4, !dbg !241
  %conv70 = sitofp i32 %44 to double, !dbg !241
  %div71 = fdiv double %mul69, %conv70, !dbg !242
  %45 = load i32* %j, align 4, !dbg !243
  %idxprom72 = sext i32 %45 to i64, !dbg !244
  %46 = load i32* %i, align 4, !dbg !245
  %idxprom73 = sext i32 %46 to i64, !dbg !244
  %47 = load [1024 x double]** %D.addr, align 8, !dbg !244
  %arrayidx74 = getelementptr inbounds [1024 x double]* %47, i64 %idxprom73, !dbg !244
  %arrayidx75 = getelementptr inbounds [1024 x double]* %arrayidx74, i32 0, i64 %idxprom72, !dbg !244
  store double %div71, double* %arrayidx75, align 8, !dbg !244
  br label %for.inc76, !dbg !244

for.inc76:                                        ; preds = %for.body65
  %48 = load i32* %j, align 4, !dbg !246
  %inc77 = add nsw i32 %48, 1, !dbg !246
  store i32 %inc77, i32* %j, align 4, !dbg !246
  br label %for.cond62, !dbg !247

for.end78:                                        ; preds = %for.cond62
  br label %for.inc79, !dbg !248

for.inc79:                                        ; preds = %for.end78
  %49 = load i32* %i, align 4, !dbg !249
  %inc80 = add nsw i32 %49, 1, !dbg !249
  store i32 %inc80, i32* %i, align 4, !dbg !249
  br label %for.cond58, !dbg !250

for.end81:                                        ; preds = %for.cond58
  ret void, !dbg !251
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
  call void @llvm.dbg.declare(metadata i32* %ni.addr, metadata !252, metadata !36), !dbg !253
  store i32 %nj, i32* %nj.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nj.addr, metadata !254, metadata !36), !dbg !255
  store i32 %nk, i32* %nk.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nk.addr, metadata !256, metadata !36), !dbg !257
  store i32 %nl, i32* %nl.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nl.addr, metadata !258, metadata !36), !dbg !259
  store double %alpha, double* %alpha.addr, align 8
  call void @llvm.dbg.declare(metadata double* %alpha.addr, metadata !260, metadata !36), !dbg !261
  store double %beta, double* %beta.addr, align 8
  call void @llvm.dbg.declare(metadata double* %beta.addr, metadata !262, metadata !36), !dbg !263
  store [1024 x double]* %tmp, [1024 x double]** %tmp.addr, align 8
  call void @llvm.dbg.declare(metadata [1024 x double]** %tmp.addr, metadata !264, metadata !36), !dbg !265
  store [1024 x double]* %A, [1024 x double]** %A.addr, align 8
  call void @llvm.dbg.declare(metadata [1024 x double]** %A.addr, metadata !266, metadata !36), !dbg !267
  store [1024 x double]* %B, [1024 x double]** %B.addr, align 8
  call void @llvm.dbg.declare(metadata [1024 x double]** %B.addr, metadata !268, metadata !36), !dbg !269
  store [1024 x double]* %C, [1024 x double]** %C.addr, align 8
  call void @llvm.dbg.declare(metadata [1024 x double]** %C.addr, metadata !270, metadata !36), !dbg !271
  store [1024 x double]* %D, [1024 x double]** %D.addr, align 8
  call void @llvm.dbg.declare(metadata [1024 x double]** %D.addr, metadata !272, metadata !36), !dbg !273
  call void @llvm.dbg.declare(metadata i32* %i, metadata !274, metadata !36), !dbg !275
  call void @llvm.dbg.declare(metadata i32* %j, metadata !276, metadata !36), !dbg !277
  call void @llvm.dbg.declare(metadata i32* %k, metadata !278, metadata !36), !dbg !279
  store i32 0, i32* %i, align 4, !dbg !280
  br label %for.cond, !dbg !280

for.cond:                                         ; preds = %for.inc28, %entry
  %0 = load i32* %i, align 4, !dbg !282
  %1 = load i32* %ni.addr, align 4, !dbg !286
  %cmp = icmp slt i32 %0, %1, !dbg !287
  br i1 %cmp, label %for.body, label %for.end30, !dbg !288

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !289
  br label %for.cond4, !dbg !289

for.cond4:                                        ; preds = %for.inc25, %for.body
  %2 = load i32* %j, align 4, !dbg !291
  %3 = load i32* %nj.addr, align 4, !dbg !295
  %cmp5 = icmp slt i32 %2, %3, !dbg !296
  br i1 %cmp5, label %for.body6, label %for.end27, !dbg !297

for.body6:                                        ; preds = %for.cond4
  %4 = load i32* %j, align 4, !dbg !298
  %idxprom = sext i32 %4 to i64, !dbg !300
  %5 = load i32* %i, align 4, !dbg !301
  %idxprom7 = sext i32 %5 to i64, !dbg !300
  %6 = load [1024 x double]** %tmp.addr, align 8, !dbg !300
  %arrayidx = getelementptr inbounds [1024 x double]* %6, i64 %idxprom7, !dbg !300
  %arrayidx8 = getelementptr inbounds [1024 x double]* %arrayidx, i32 0, i64 %idxprom, !dbg !300
  store double 0.000000e+00, double* %arrayidx8, align 8, !dbg !300
  store i32 0, i32* %k, align 4, !dbg !302
  br label %for.cond9, !dbg !302

for.cond9:                                        ; preds = %for.inc, %for.body6
  %7 = load i32* %k, align 4, !dbg !304
  %8 = load i32* %nk.addr, align 4, !dbg !308
  %cmp10 = icmp slt i32 %7, %8, !dbg !309
  br i1 %cmp10, label %for.body11, label %for.end, !dbg !310

for.body11:                                       ; preds = %for.cond9
  %9 = load double* %alpha.addr, align 8, !dbg !311
  %10 = load i32* %k, align 4, !dbg !312
  %idxprom12 = sext i32 %10 to i64, !dbg !313
  %11 = load i32* %i, align 4, !dbg !314
  %idxprom13 = sext i32 %11 to i64, !dbg !313
  %12 = load [1024 x double]** %A.addr, align 8, !dbg !313
  %arrayidx14 = getelementptr inbounds [1024 x double]* %12, i64 %idxprom13, !dbg !313
  %arrayidx15 = getelementptr inbounds [1024 x double]* %arrayidx14, i32 0, i64 %idxprom12, !dbg !313
  %13 = load double* %arrayidx15, align 8, !dbg !313
  %mul = fmul double %9, %13, !dbg !311
  %14 = load i32* %j, align 4, !dbg !315
  %idxprom16 = sext i32 %14 to i64, !dbg !316
  %15 = load i32* %k, align 4, !dbg !317
  %idxprom17 = sext i32 %15 to i64, !dbg !316
  %16 = load [1024 x double]** %B.addr, align 8, !dbg !316
  %arrayidx18 = getelementptr inbounds [1024 x double]* %16, i64 %idxprom17, !dbg !316
  %arrayidx19 = getelementptr inbounds [1024 x double]* %arrayidx18, i32 0, i64 %idxprom16, !dbg !316
  %17 = load double* %arrayidx19, align 8, !dbg !316
  %mul20 = fmul double %mul, %17, !dbg !311
  %18 = load i32* %j, align 4, !dbg !318
  %idxprom21 = sext i32 %18 to i64, !dbg !319
  %19 = load i32* %i, align 4, !dbg !320
  %idxprom22 = sext i32 %19 to i64, !dbg !319
  %20 = load [1024 x double]** %tmp.addr, align 8, !dbg !319
  %arrayidx23 = getelementptr inbounds [1024 x double]* %20, i64 %idxprom22, !dbg !319
  %arrayidx24 = getelementptr inbounds [1024 x double]* %arrayidx23, i32 0, i64 %idxprom21, !dbg !319
  %21 = load double* %arrayidx24, align 8, !dbg !319
  %add = fadd double %21, %mul20, !dbg !319
  store double %add, double* %arrayidx24, align 8, !dbg !319
  br label %for.inc, !dbg !319

for.inc:                                          ; preds = %for.body11
  %22 = load i32* %k, align 4, !dbg !321
  %inc = add nsw i32 %22, 1, !dbg !321
  store i32 %inc, i32* %k, align 4, !dbg !321
  br label %for.cond9, !dbg !322

for.end:                                          ; preds = %for.cond9
  br label %for.inc25, !dbg !323

for.inc25:                                        ; preds = %for.end
  %23 = load i32* %j, align 4, !dbg !324
  %inc26 = add nsw i32 %23, 1, !dbg !324
  store i32 %inc26, i32* %j, align 4, !dbg !324
  br label %for.cond4, !dbg !325

for.end27:                                        ; preds = %for.cond4
  br label %for.inc28, !dbg !326

for.inc28:                                        ; preds = %for.end27
  %24 = load i32* %i, align 4, !dbg !327
  %inc29 = add nsw i32 %24, 1, !dbg !327
  store i32 %inc29, i32* %i, align 4, !dbg !327
  br label %for.cond, !dbg !328

for.end30:                                        ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !329
  br label %for.cond31, !dbg !329

for.cond31:                                       ; preds = %for.inc65, %for.end30
  %25 = load i32* %i, align 4, !dbg !331
  %26 = load i32* %ni.addr, align 4, !dbg !335
  %cmp32 = icmp slt i32 %25, %26, !dbg !336
  br i1 %cmp32, label %for.body33, label %for.end67, !dbg !337

for.body33:                                       ; preds = %for.cond31
  store i32 0, i32* %j, align 4, !dbg !338
  br label %for.cond34, !dbg !338

for.cond34:                                       ; preds = %for.inc62, %for.body33
  %27 = load i32* %j, align 4, !dbg !340
  %28 = load i32* %nl.addr, align 4, !dbg !344
  %cmp35 = icmp slt i32 %27, %28, !dbg !345
  br i1 %cmp35, label %for.body36, label %for.end64, !dbg !346

for.body36:                                       ; preds = %for.cond34
  %29 = load double* %beta.addr, align 8, !dbg !347
  %30 = load i32* %j, align 4, !dbg !349
  %idxprom37 = sext i32 %30 to i64, !dbg !350
  %31 = load i32* %i, align 4, !dbg !351
  %idxprom38 = sext i32 %31 to i64, !dbg !350
  %32 = load [1024 x double]** %D.addr, align 8, !dbg !350
  %arrayidx39 = getelementptr inbounds [1024 x double]* %32, i64 %idxprom38, !dbg !350
  %arrayidx40 = getelementptr inbounds [1024 x double]* %arrayidx39, i32 0, i64 %idxprom37, !dbg !350
  %33 = load double* %arrayidx40, align 8, !dbg !350
  %mul41 = fmul double %33, %29, !dbg !350
  store double %mul41, double* %arrayidx40, align 8, !dbg !350
  store i32 0, i32* %k, align 4, !dbg !352
  br label %for.cond42, !dbg !352

for.cond42:                                       ; preds = %for.inc59, %for.body36
  %34 = load i32* %k, align 4, !dbg !354
  %35 = load i32* %nj.addr, align 4, !dbg !358
  %cmp43 = icmp slt i32 %34, %35, !dbg !359
  br i1 %cmp43, label %for.body44, label %for.end61, !dbg !360

for.body44:                                       ; preds = %for.cond42
  %36 = load i32* %k, align 4, !dbg !361
  %idxprom45 = sext i32 %36 to i64, !dbg !362
  %37 = load i32* %i, align 4, !dbg !363
  %idxprom46 = sext i32 %37 to i64, !dbg !362
  %38 = load [1024 x double]** %tmp.addr, align 8, !dbg !362
  %arrayidx47 = getelementptr inbounds [1024 x double]* %38, i64 %idxprom46, !dbg !362
  %arrayidx48 = getelementptr inbounds [1024 x double]* %arrayidx47, i32 0, i64 %idxprom45, !dbg !362
  %39 = load double* %arrayidx48, align 8, !dbg !362
  %40 = load i32* %j, align 4, !dbg !364
  %idxprom49 = sext i32 %40 to i64, !dbg !365
  %41 = load i32* %k, align 4, !dbg !366
  %idxprom50 = sext i32 %41 to i64, !dbg !365
  %42 = load [1024 x double]** %C.addr, align 8, !dbg !365
  %arrayidx51 = getelementptr inbounds [1024 x double]* %42, i64 %idxprom50, !dbg !365
  %arrayidx52 = getelementptr inbounds [1024 x double]* %arrayidx51, i32 0, i64 %idxprom49, !dbg !365
  %43 = load double* %arrayidx52, align 8, !dbg !365
  %mul53 = fmul double %39, %43, !dbg !362
  %44 = load i32* %j, align 4, !dbg !367
  %idxprom54 = sext i32 %44 to i64, !dbg !368
  %45 = load i32* %i, align 4, !dbg !369
  %idxprom55 = sext i32 %45 to i64, !dbg !368
  %46 = load [1024 x double]** %D.addr, align 8, !dbg !368
  %arrayidx56 = getelementptr inbounds [1024 x double]* %46, i64 %idxprom55, !dbg !368
  %arrayidx57 = getelementptr inbounds [1024 x double]* %arrayidx56, i32 0, i64 %idxprom54, !dbg !368
  %47 = load double* %arrayidx57, align 8, !dbg !368
  %add58 = fadd double %47, %mul53, !dbg !368
  store double %add58, double* %arrayidx57, align 8, !dbg !368
  br label %for.inc59, !dbg !368

for.inc59:                                        ; preds = %for.body44
  %48 = load i32* %k, align 4, !dbg !370
  %inc60 = add nsw i32 %48, 1, !dbg !370
  store i32 %inc60, i32* %k, align 4, !dbg !370
  br label %for.cond42, !dbg !371

for.end61:                                        ; preds = %for.cond42
  br label %for.inc62, !dbg !372

for.inc62:                                        ; preds = %for.end61
  %49 = load i32* %j, align 4, !dbg !373
  %inc63 = add nsw i32 %49, 1, !dbg !373
  store i32 %inc63, i32* %j, align 4, !dbg !373
  br label %for.cond34, !dbg !374

for.end64:                                        ; preds = %for.cond34
  br label %for.inc65, !dbg !375

for.inc65:                                        ; preds = %for.end64
  %50 = load i32* %i, align 4, !dbg !376
  %inc66 = add nsw i32 %50, 1, !dbg !376
  store i32 %inc66, i32* %i, align 4, !dbg !376
  br label %for.cond31, !dbg !377

for.end67:                                        ; preds = %for.cond31
  ret void, !dbg !378
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #3

; Function Attrs: nounwind uwtable
define internal void @print_array(i32 %ni, i32 %nl, [1024 x double]* %D) #0 {
entry:
  %ni.addr = alloca i32, align 4
  %nl.addr = alloca i32, align 4
  %D.addr = alloca [1024 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %ni, i32* %ni.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ni.addr, metadata !379, metadata !36), !dbg !380
  store i32 %nl, i32* %nl.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nl.addr, metadata !381, metadata !36), !dbg !382
  store [1024 x double]* %D, [1024 x double]** %D.addr, align 8
  call void @llvm.dbg.declare(metadata [1024 x double]** %D.addr, metadata !383, metadata !36), !dbg !384
  call void @llvm.dbg.declare(metadata i32* %i, metadata !385, metadata !36), !dbg !386
  call void @llvm.dbg.declare(metadata i32* %j, metadata !387, metadata !36), !dbg !388
  store i32 0, i32* %i, align 4, !dbg !389
  br label %for.cond, !dbg !389

for.cond:                                         ; preds = %for.inc8, %entry
  %0 = load i32* %i, align 4, !dbg !391
  %1 = load i32* %ni.addr, align 4, !dbg !395
  %cmp = icmp slt i32 %0, %1, !dbg !396
  br i1 %cmp, label %for.body, label %for.end10, !dbg !397

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !398
  br label %for.cond1, !dbg !398

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32* %j, align 4, !dbg !400
  %3 = load i32* %nl.addr, align 4, !dbg !404
  %cmp2 = icmp slt i32 %2, %3, !dbg !405
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !406

for.body3:                                        ; preds = %for.cond1
  %4 = load %struct._IO_FILE** @stderr, align 8, !dbg !407
  %5 = load i32* %j, align 4, !dbg !409
  %idxprom = sext i32 %5 to i64, !dbg !410
  %6 = load i32* %i, align 4, !dbg !411
  %idxprom4 = sext i32 %6 to i64, !dbg !410
  %7 = load [1024 x double]** %D.addr, align 8, !dbg !410
  %arrayidx = getelementptr inbounds [1024 x double]* %7, i64 %idxprom4, !dbg !410
  %arrayidx5 = getelementptr inbounds [1024 x double]* %arrayidx, i32 0, i64 %idxprom, !dbg !410
  %8 = load double* %arrayidx5, align 8, !dbg !410
  %call = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([8 x i8]* @.str1, i32 0, i32 0), double %8), !dbg !412
  %9 = load i32* %i, align 4, !dbg !413
  %10 = load i32* %ni.addr, align 4, !dbg !415
  %mul = mul nsw i32 %9, %10, !dbg !413
  %11 = load i32* %j, align 4, !dbg !416
  %add = add nsw i32 %mul, %11, !dbg !413
  %rem = srem i32 %add, 20, !dbg !417
  %cmp6 = icmp eq i32 %rem, 0, !dbg !417
  br i1 %cmp6, label %if.then, label %if.end, !dbg !418

if.then:                                          ; preds = %for.body3
  %12 = load %struct._IO_FILE** @stderr, align 8, !dbg !419
  %call7 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)), !dbg !421
  br label %if.end, !dbg !421

if.end:                                           ; preds = %if.then, %for.body3
  br label %for.inc, !dbg !422

for.inc:                                          ; preds = %if.end
  %13 = load i32* %j, align 4, !dbg !423
  %inc = add nsw i32 %13, 1, !dbg !423
  store i32 %inc, i32* %j, align 4, !dbg !423
  br label %for.cond1, !dbg !424

for.end:                                          ; preds = %for.cond1
  br label %for.inc8, !dbg !425

for.inc8:                                         ; preds = %for.end
  %14 = load i32* %i, align 4, !dbg !426
  %inc9 = add nsw i32 %14, 1, !dbg !426
  store i32 %inc9, i32* %i, align 4, !dbg !426
  br label %for.cond, !dbg !427

for.end10:                                        ; preds = %for.cond
  %15 = load %struct._IO_FILE** @stderr, align 8, !dbg !428
  %call11 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)), !dbg !429
  ret void, !dbg !430
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

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\000\00\000\00\001", !1, !2, !3, !10, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c] [DW_LANG_C99]
!1 = !{!"2mm.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm"}
!2 = !{}
!3 = !{!4, !9, !6}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!5 = !{!"0x1\00\000\0067108864\0064\000\000\000", null, null, !6, !7, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 67108864, align 64, offset 0] [from double]
!6 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!7 = !{!8, !8}
!8 = !{!"0x21\000\001024"}                        ; [ DW_TAG_subrange_type ] [0, 1023]
!9 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = !{!11, !19, !25, !28}
!11 = !{!"0x2e\00main\00main\00\00102\000\001\000\000\00256\000\00103", !1, !12, !13, null, i32 (i32, i8**)* @main, null, null, !2} ; [ DW_TAG_subprogram ] [line 102] [def] [scope 103] [main]
!12 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!13 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !14, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = !{!15, !15, !16}
!15 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!16 = !{!"0xf\00\000\0064\0064\000\000", null, null, !17} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!17 = !{!"0xf\00\000\0064\0064\000\000", null, null, !18} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!18 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!19 = !{!"0x2e\00print_array\00print_array\00\0053\001\001\000\000\00256\000\0055", !1, !12, !20, null, void (i32, i32, [1024 x double]*)* @print_array, null, null, !2} ; [ DW_TAG_subprogram ] [line 53] [local] [def] [scope 55] [print_array]
!20 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !21, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!21 = !{null, !15, !15, !22}
!22 = !{!"0xf\00\000\0064\0064\000\000", null, null, !23} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!23 = !{!"0x1\00\000\0065536\0064\000\000\000", null, null, !6, !24, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 65536, align 64, offset 0] [from double]
!24 = !{!8}
!25 = !{!"0x2e\00kernel_2mm\00kernel_2mm\00\0070\001\001\000\000\00256\000\0078", !1, !12, !26, null, void (i32, i32, i32, i32, double, double, [1024 x double]*, [1024 x double]*, [1024 x double]*, [1024 x double]*, [1024 x double]*)* @kernel_2mm, null, null, !2} ; [ DW_TAG_subprogram ] [line 70] [local] [def] [scope 78] [kernel_2mm]
!26 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !27, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!27 = !{null, !15, !15, !15, !15, !6, !6, !22, !22, !22, !22, !22}
!28 = !{!"0x2e\00init_array\00init_array\00\0023\001\001\000\000\00256\000\0030", !1, !12, !29, null, void (i32, i32, i32, i32, double*, double*, [1024 x double]*, [1024 x double]*, [1024 x double]*, [1024 x double]*)* @init_array, null, null, !2} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [scope 30] [init_array]
!29 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !30, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!30 = !{null, !15, !15, !15, !15, !31, !31, !22, !22, !22, !22}
!31 = !{!"0xf\00\000\0064\0064\000\000", null, null, !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!32 = !{i32 2, !"Dwarf Version", i32 4}
!33 = !{i32 2, !"Debug Info Version", i32 2}
!34 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!35 = !{!"0x101\00argc\0016777318\000", !11, !12, !15} ; [ DW_TAG_arg_variable ] [argc] [line 102]
!36 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!37 = !MDLocation(line: 102, column: 14, scope: !11)
!38 = !{!"0x101\00argv\0033554534\000", !11, !12, !16} ; [ DW_TAG_arg_variable ] [argv] [line 102]
!39 = !MDLocation(line: 102, column: 27, scope: !11)
!40 = !{!"0x100\00ni\00105\000", !11, !12, !15}   ; [ DW_TAG_auto_variable ] [ni] [line 105]
!41 = !MDLocation(line: 105, column: 7, scope: !11)
!42 = !{!"0x100\00nj\00106\000", !11, !12, !15}   ; [ DW_TAG_auto_variable ] [nj] [line 106]
!43 = !MDLocation(line: 106, column: 7, scope: !11)
!44 = !{!"0x100\00nk\00107\000", !11, !12, !15}   ; [ DW_TAG_auto_variable ] [nk] [line 107]
!45 = !MDLocation(line: 107, column: 7, scope: !11)
!46 = !{!"0x100\00nl\00108\000", !11, !12, !15}   ; [ DW_TAG_auto_variable ] [nl] [line 108]
!47 = !MDLocation(line: 108, column: 7, scope: !11)
!48 = !{!"0x100\00alpha\00111\000", !11, !12, !6} ; [ DW_TAG_auto_variable ] [alpha] [line 111]
!49 = !MDLocation(line: 111, column: 13, scope: !11)
!50 = !{!"0x100\00beta\00112\000", !11, !12, !6}  ; [ DW_TAG_auto_variable ] [beta] [line 112]
!51 = !MDLocation(line: 112, column: 13, scope: !11)
!52 = !{!"0x100\00tmp\00113\000", !11, !12, !4}   ; [ DW_TAG_auto_variable ] [tmp] [line 113]
!53 = !MDLocation(line: 113, column: 3, scope: !11)
!54 = !{!"0x100\00A\00114\000", !11, !12, !4}     ; [ DW_TAG_auto_variable ] [A] [line 114]
!55 = !MDLocation(line: 114, column: 3, scope: !11)
!56 = !{!"0x100\00B\00115\000", !11, !12, !4}     ; [ DW_TAG_auto_variable ] [B] [line 115]
!57 = !MDLocation(line: 115, column: 3, scope: !11)
!58 = !{!"0x100\00C\00116\000", !11, !12, !4}     ; [ DW_TAG_auto_variable ] [C] [line 116]
!59 = !MDLocation(line: 116, column: 3, scope: !11)
!60 = !{!"0x100\00D\00117\000", !11, !12, !4}     ; [ DW_TAG_auto_variable ] [D] [line 117]
!61 = !MDLocation(line: 117, column: 3, scope: !11)
!62 = !MDLocation(line: 120, column: 15, scope: !11)
!63 = !MDLocation(line: 120, column: 19, scope: !11)
!64 = !MDLocation(line: 120, column: 23, scope: !11)
!65 = !MDLocation(line: 120, column: 27, scope: !11)
!66 = !MDLocation(line: 121, column: 8, scope: !11)
!67 = !MDLocation(line: 122, column: 8, scope: !11)
!68 = !MDLocation(line: 123, column: 8, scope: !11)
!69 = !MDLocation(line: 124, column: 8, scope: !11)
!70 = !MDLocation(line: 120, column: 3, scope: !11)
!71 = !MDLocation(line: 130, column: 15, scope: !11)
!72 = !MDLocation(line: 130, column: 19, scope: !11)
!73 = !MDLocation(line: 130, column: 23, scope: !11)
!74 = !MDLocation(line: 130, column: 27, scope: !11)
!75 = !MDLocation(line: 131, column: 8, scope: !11)
!76 = !MDLocation(line: 131, column: 15, scope: !11)
!77 = !MDLocation(line: 132, column: 8, scope: !11)
!78 = !MDLocation(line: 133, column: 8, scope: !11)
!79 = !MDLocation(line: 134, column: 8, scope: !11)
!80 = !MDLocation(line: 135, column: 8, scope: !11)
!81 = !MDLocation(line: 136, column: 8, scope: !11)
!82 = !MDLocation(line: 130, column: 3, scope: !11)
!83 = !MDLocation(line: 144, column: 3, scope: !84)
!84 = !{!"0xb\00144\003\000", !1, !11}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!85 = !MDLocation(line: 144, column: 3, scope: !11)
!86 = !MDLocation(line: 144, column: 3, scope: !87)
!87 = !{!"0xb\001", !1, !84}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!88 = !MDLocation(line: 144, column: 3, scope: !89)
!89 = !{!"0xb\002", !1, !84}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!90 = !MDLocation(line: 147, column: 3, scope: !11)
!91 = !MDLocation(line: 148, column: 3, scope: !11)
!92 = !MDLocation(line: 149, column: 3, scope: !11)
!93 = !MDLocation(line: 150, column: 3, scope: !11)
!94 = !MDLocation(line: 151, column: 3, scope: !11)
!95 = !MDLocation(line: 153, column: 3, scope: !11)
!96 = !{!"0x101\00ni\0016777239\000", !28, !12, !15} ; [ DW_TAG_arg_variable ] [ni] [line 23]
!97 = !MDLocation(line: 23, column: 21, scope: !28)
!98 = !{!"0x101\00nj\0033554455\000", !28, !12, !15} ; [ DW_TAG_arg_variable ] [nj] [line 23]
!99 = !MDLocation(line: 23, column: 29, scope: !28)
!100 = !{!"0x101\00nk\0050331671\000", !28, !12, !15} ; [ DW_TAG_arg_variable ] [nk] [line 23]
!101 = !MDLocation(line: 23, column: 37, scope: !28)
!102 = !{!"0x101\00nl\0067108887\000", !28, !12, !15} ; [ DW_TAG_arg_variable ] [nl] [line 23]
!103 = !MDLocation(line: 23, column: 45, scope: !28)
!104 = !{!"0x101\00alpha\0083886104\000", !28, !12, !31} ; [ DW_TAG_arg_variable ] [alpha] [line 24]
!105 = !MDLocation(line: 24, column: 14, scope: !28)
!106 = !{!"0x101\00beta\00100663321\000", !28, !12, !31} ; [ DW_TAG_arg_variable ] [beta] [line 25]
!107 = !MDLocation(line: 25, column: 14, scope: !28)
!108 = !{!"0x101\00A\00117440538\000", !28, !12, !22} ; [ DW_TAG_arg_variable ] [A] [line 26]
!109 = !MDLocation(line: 26, column: 13, scope: !28)
!110 = !{!"0x101\00B\00134217755\000", !28, !12, !22} ; [ DW_TAG_arg_variable ] [B] [line 27]
!111 = !MDLocation(line: 27, column: 13, scope: !28)
!112 = !{!"0x101\00C\00150994972\000", !28, !12, !22} ; [ DW_TAG_arg_variable ] [C] [line 28]
!113 = !MDLocation(line: 28, column: 13, scope: !28)
!114 = !{!"0x101\00D\00167772189\000", !28, !12, !22} ; [ DW_TAG_arg_variable ] [D] [line 29]
!115 = !MDLocation(line: 29, column: 13, scope: !28)
!116 = !{!"0x100\00i\0031\000", !28, !12, !15}    ; [ DW_TAG_auto_variable ] [i] [line 31]
!117 = !MDLocation(line: 31, column: 7, scope: !28)
!118 = !{!"0x100\00j\0031\000", !28, !12, !15}    ; [ DW_TAG_auto_variable ] [j] [line 31]
!119 = !MDLocation(line: 31, column: 10, scope: !28)
!120 = !MDLocation(line: 33, column: 4, scope: !28)
!121 = !MDLocation(line: 33, column: 3, scope: !28)
!122 = !MDLocation(line: 34, column: 4, scope: !28)
!123 = !MDLocation(line: 34, column: 3, scope: !28)
!124 = !MDLocation(line: 35, column: 8, scope: !125)
!125 = !{!"0xb\0035\003\0021", !1, !28}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!126 = !MDLocation(line: 35, column: 15, scope: !127)
!127 = !{!"0xb\002", !1, !128}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!128 = !{!"0xb\001", !1, !129}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!129 = !{!"0xb\0035\003\0022", !1, !125}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!130 = !MDLocation(line: 35, column: 19, scope: !129)
!131 = !MDLocation(line: 35, column: 15, scope: !129)
!132 = !MDLocation(line: 35, column: 3, scope: !125)
!133 = !MDLocation(line: 36, column: 10, scope: !134)
!134 = !{!"0xb\0036\005\0023", !1, !129}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!135 = !MDLocation(line: 36, column: 17, scope: !136)
!136 = !{!"0xb\002", !1, !137}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!137 = !{!"0xb\001", !1, !138}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!138 = !{!"0xb\0036\005\0024", !1, !134}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!139 = !MDLocation(line: 36, column: 21, scope: !138)
!140 = !MDLocation(line: 36, column: 17, scope: !138)
!141 = !MDLocation(line: 36, column: 5, scope: !134)
!142 = !MDLocation(line: 37, column: 30, scope: !138)
!143 = !MDLocation(line: 37, column: 18, scope: !138)
!144 = !MDLocation(line: 37, column: 32, scope: !138)
!145 = !MDLocation(line: 37, column: 37, scope: !138)
!146 = !MDLocation(line: 37, column: 17, scope: !138)
!147 = !MDLocation(line: 37, column: 12, scope: !138)
!148 = !MDLocation(line: 37, column: 7, scope: !138)
!149 = !MDLocation(line: 37, column: 9, scope: !138)
!150 = !MDLocation(line: 36, column: 25, scope: !138)
!151 = !MDLocation(line: 36, column: 5, scope: !138)
!152 = !MDLocation(line: 37, column: 37, scope: !134)
!153 = !MDLocation(line: 35, column: 23, scope: !129)
!154 = !MDLocation(line: 35, column: 3, scope: !129)
!155 = !MDLocation(line: 38, column: 8, scope: !156)
!156 = !{!"0xb\0038\003\0025", !1, !28}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!157 = !MDLocation(line: 38, column: 15, scope: !158)
!158 = !{!"0xb\002", !1, !159}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!159 = !{!"0xb\001", !1, !160}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!160 = !{!"0xb\0038\003\0026", !1, !156}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!161 = !MDLocation(line: 38, column: 19, scope: !160)
!162 = !MDLocation(line: 38, column: 15, scope: !160)
!163 = !MDLocation(line: 38, column: 3, scope: !156)
!164 = !MDLocation(line: 39, column: 10, scope: !165)
!165 = !{!"0xb\0039\005\0027", !1, !160}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!166 = !MDLocation(line: 39, column: 17, scope: !167)
!167 = !{!"0xb\002", !1, !168}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!168 = !{!"0xb\001", !1, !169}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!169 = !{!"0xb\0039\005\0028", !1, !165}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!170 = !MDLocation(line: 39, column: 21, scope: !169)
!171 = !MDLocation(line: 39, column: 17, scope: !169)
!172 = !MDLocation(line: 39, column: 5, scope: !165)
!173 = !MDLocation(line: 40, column: 30, scope: !169)
!174 = !MDLocation(line: 40, column: 18, scope: !169)
!175 = !MDLocation(line: 40, column: 33, scope: !169)
!176 = !MDLocation(line: 40, column: 32, scope: !169)
!177 = !MDLocation(line: 40, column: 41, scope: !169)
!178 = !MDLocation(line: 40, column: 17, scope: !169)
!179 = !MDLocation(line: 40, column: 12, scope: !169)
!180 = !MDLocation(line: 40, column: 7, scope: !169)
!181 = !MDLocation(line: 40, column: 9, scope: !169)
!182 = !MDLocation(line: 39, column: 25, scope: !169)
!183 = !MDLocation(line: 39, column: 5, scope: !169)
!184 = !MDLocation(line: 40, column: 41, scope: !165)
!185 = !MDLocation(line: 38, column: 23, scope: !160)
!186 = !MDLocation(line: 38, column: 3, scope: !160)
!187 = !MDLocation(line: 41, column: 8, scope: !188)
!188 = !{!"0xb\0041\003\0029", !1, !28}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!189 = !MDLocation(line: 41, column: 15, scope: !190)
!190 = !{!"0xb\002", !1, !191}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!191 = !{!"0xb\001", !1, !192}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!192 = !{!"0xb\0041\003\0030", !1, !188}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!193 = !MDLocation(line: 41, column: 19, scope: !192)
!194 = !MDLocation(line: 41, column: 15, scope: !192)
!195 = !MDLocation(line: 41, column: 3, scope: !188)
!196 = !MDLocation(line: 42, column: 10, scope: !197)
!197 = !{!"0xb\0042\005\0031", !1, !192}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!198 = !MDLocation(line: 42, column: 17, scope: !199)
!199 = !{!"0xb\002", !1, !200}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!200 = !{!"0xb\001", !1, !201}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!201 = !{!"0xb\0042\005\0032", !1, !197}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!202 = !MDLocation(line: 42, column: 21, scope: !201)
!203 = !MDLocation(line: 42, column: 17, scope: !201)
!204 = !MDLocation(line: 42, column: 5, scope: !197)
!205 = !MDLocation(line: 43, column: 30, scope: !201)
!206 = !MDLocation(line: 43, column: 18, scope: !201)
!207 = !MDLocation(line: 43, column: 33, scope: !201)
!208 = !MDLocation(line: 43, column: 32, scope: !201)
!209 = !MDLocation(line: 43, column: 41, scope: !201)
!210 = !MDLocation(line: 43, column: 17, scope: !201)
!211 = !MDLocation(line: 43, column: 12, scope: !201)
!212 = !MDLocation(line: 43, column: 7, scope: !201)
!213 = !MDLocation(line: 43, column: 9, scope: !201)
!214 = !MDLocation(line: 42, column: 25, scope: !201)
!215 = !MDLocation(line: 42, column: 5, scope: !201)
!216 = !MDLocation(line: 43, column: 41, scope: !197)
!217 = !MDLocation(line: 41, column: 23, scope: !192)
!218 = !MDLocation(line: 41, column: 3, scope: !192)
!219 = !MDLocation(line: 44, column: 8, scope: !220)
!220 = !{!"0xb\0044\003\0033", !1, !28}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!221 = !MDLocation(line: 44, column: 15, scope: !222)
!222 = !{!"0xb\002", !1, !223}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!223 = !{!"0xb\001", !1, !224}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!224 = !{!"0xb\0044\003\0034", !1, !220}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!225 = !MDLocation(line: 44, column: 19, scope: !224)
!226 = !MDLocation(line: 44, column: 15, scope: !224)
!227 = !MDLocation(line: 44, column: 3, scope: !220)
!228 = !MDLocation(line: 45, column: 10, scope: !229)
!229 = !{!"0xb\0045\005\0035", !1, !224}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!230 = !MDLocation(line: 45, column: 17, scope: !231)
!231 = !{!"0xb\002", !1, !232}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!232 = !{!"0xb\001", !1, !233}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!233 = !{!"0xb\0045\005\0036", !1, !229}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!234 = !MDLocation(line: 45, column: 21, scope: !233)
!235 = !MDLocation(line: 45, column: 17, scope: !233)
!236 = !MDLocation(line: 45, column: 5, scope: !229)
!237 = !MDLocation(line: 46, column: 30, scope: !233)
!238 = !MDLocation(line: 46, column: 18, scope: !233)
!239 = !MDLocation(line: 46, column: 33, scope: !233)
!240 = !MDLocation(line: 46, column: 32, scope: !233)
!241 = !MDLocation(line: 46, column: 41, scope: !233)
!242 = !MDLocation(line: 46, column: 17, scope: !233)
!243 = !MDLocation(line: 46, column: 12, scope: !233)
!244 = !MDLocation(line: 46, column: 7, scope: !233)
!245 = !MDLocation(line: 46, column: 9, scope: !233)
!246 = !MDLocation(line: 45, column: 25, scope: !233)
!247 = !MDLocation(line: 45, column: 5, scope: !233)
!248 = !MDLocation(line: 46, column: 41, scope: !229)
!249 = !MDLocation(line: 44, column: 23, scope: !224)
!250 = !MDLocation(line: 44, column: 3, scope: !224)
!251 = !MDLocation(line: 47, column: 1, scope: !28)
!252 = !{!"0x101\00ni\0016777286\000", !25, !12, !15} ; [ DW_TAG_arg_variable ] [ni] [line 70]
!253 = !MDLocation(line: 70, column: 21, scope: !25)
!254 = !{!"0x101\00nj\0033554502\000", !25, !12, !15} ; [ DW_TAG_arg_variable ] [nj] [line 70]
!255 = !MDLocation(line: 70, column: 29, scope: !25)
!256 = !{!"0x101\00nk\0050331718\000", !25, !12, !15} ; [ DW_TAG_arg_variable ] [nk] [line 70]
!257 = !MDLocation(line: 70, column: 37, scope: !25)
!258 = !{!"0x101\00nl\0067108934\000", !25, !12, !15} ; [ DW_TAG_arg_variable ] [nl] [line 70]
!259 = !MDLocation(line: 70, column: 45, scope: !25)
!260 = !{!"0x101\00alpha\0083886151\000", !25, !12, !6} ; [ DW_TAG_arg_variable ] [alpha] [line 71]
!261 = !MDLocation(line: 71, column: 13, scope: !25)
!262 = !{!"0x101\00beta\00100663368\000", !25, !12, !6} ; [ DW_TAG_arg_variable ] [beta] [line 72]
!263 = !MDLocation(line: 72, column: 13, scope: !25)
!264 = !{!"0x101\00tmp\00117440585\000", !25, !12, !22} ; [ DW_TAG_arg_variable ] [tmp] [line 73]
!265 = !MDLocation(line: 73, column: 13, scope: !25)
!266 = !{!"0x101\00A\00134217802\000", !25, !12, !22} ; [ DW_TAG_arg_variable ] [A] [line 74]
!267 = !MDLocation(line: 74, column: 13, scope: !25)
!268 = !{!"0x101\00B\00150995019\000", !25, !12, !22} ; [ DW_TAG_arg_variable ] [B] [line 75]
!269 = !MDLocation(line: 75, column: 13, scope: !25)
!270 = !{!"0x101\00C\00167772236\000", !25, !12, !22} ; [ DW_TAG_arg_variable ] [C] [line 76]
!271 = !MDLocation(line: 76, column: 13, scope: !25)
!272 = !{!"0x101\00D\00184549453\000", !25, !12, !22} ; [ DW_TAG_arg_variable ] [D] [line 77]
!273 = !MDLocation(line: 77, column: 13, scope: !25)
!274 = !{!"0x100\00i\0079\000", !25, !12, !15}    ; [ DW_TAG_auto_variable ] [i] [line 79]
!275 = !MDLocation(line: 79, column: 7, scope: !25)
!276 = !{!"0x100\00j\0079\000", !25, !12, !15}    ; [ DW_TAG_auto_variable ] [j] [line 79]
!277 = !MDLocation(line: 79, column: 10, scope: !25)
!278 = !{!"0x100\00k\0079\000", !25, !12, !15}    ; [ DW_TAG_auto_variable ] [k] [line 79]
!279 = !MDLocation(line: 79, column: 13, scope: !25)
!280 = !MDLocation(line: 83, column: 8, scope: !281)
!281 = !{!"0xb\0083\003\007", !1, !25}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!282 = !MDLocation(line: 83, column: 15, scope: !283)
!283 = !{!"0xb\002", !1, !284}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!284 = !{!"0xb\001", !1, !285}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!285 = !{!"0xb\0083\003\008", !1, !281}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!286 = !MDLocation(line: 83, column: 19, scope: !285)
!287 = !MDLocation(line: 83, column: 15, scope: !285)
!288 = !MDLocation(line: 83, column: 3, scope: !281)
!289 = !MDLocation(line: 84, column: 10, scope: !290)
!290 = !{!"0xb\0084\005\009", !1, !285}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!291 = !MDLocation(line: 84, column: 17, scope: !292)
!292 = !{!"0xb\002", !1, !293}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!293 = !{!"0xb\001", !1, !294}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!294 = !{!"0xb\0084\005\0010", !1, !290}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!295 = !MDLocation(line: 84, column: 21, scope: !294)
!296 = !MDLocation(line: 84, column: 17, scope: !294)
!297 = !MDLocation(line: 84, column: 5, scope: !290)
!298 = !MDLocation(line: 86, column: 9, scope: !299)
!299 = !{!"0xb\0085\007\0011", !1, !294}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!300 = !MDLocation(line: 86, column: 2, scope: !299)
!301 = !MDLocation(line: 86, column: 6, scope: !299)
!302 = !MDLocation(line: 87, column: 7, scope: !303)
!303 = !{!"0xb\0087\002\0012", !1, !299}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!304 = !MDLocation(line: 87, column: 14, scope: !305)
!305 = !{!"0xb\002", !1, !306}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!306 = !{!"0xb\001", !1, !307}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!307 = !{!"0xb\0087\002\0013", !1, !303}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!308 = !MDLocation(line: 87, column: 18, scope: !307)
!309 = !MDLocation(line: 87, column: 14, scope: !307)
!310 = !MDLocation(line: 87, column: 2, scope: !303)
!311 = !MDLocation(line: 88, column: 17, scope: !307)
!312 = !MDLocation(line: 88, column: 30, scope: !307)
!313 = !MDLocation(line: 88, column: 25, scope: !307)
!314 = !MDLocation(line: 88, column: 27, scope: !307)
!315 = !MDLocation(line: 88, column: 40, scope: !307)
!316 = !MDLocation(line: 88, column: 35, scope: !307)
!317 = !MDLocation(line: 88, column: 37, scope: !307)
!318 = !MDLocation(line: 88, column: 11, scope: !307)
!319 = !MDLocation(line: 88, column: 4, scope: !307)
!320 = !MDLocation(line: 88, column: 8, scope: !307)
!321 = !MDLocation(line: 87, column: 22, scope: !307)
!322 = !MDLocation(line: 87, column: 2, scope: !307)
!323 = !MDLocation(line: 89, column: 7, scope: !299)
!324 = !MDLocation(line: 84, column: 25, scope: !294)
!325 = !MDLocation(line: 84, column: 5, scope: !294)
!326 = !MDLocation(line: 89, column: 7, scope: !290)
!327 = !MDLocation(line: 83, column: 23, scope: !285)
!328 = !MDLocation(line: 83, column: 3, scope: !285)
!329 = !MDLocation(line: 90, column: 8, scope: !330)
!330 = !{!"0xb\0090\003\0014", !1, !25}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!331 = !MDLocation(line: 90, column: 15, scope: !332)
!332 = !{!"0xb\002", !1, !333}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!333 = !{!"0xb\001", !1, !334}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!334 = !{!"0xb\0090\003\0015", !1, !330}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!335 = !MDLocation(line: 90, column: 19, scope: !334)
!336 = !MDLocation(line: 90, column: 15, scope: !334)
!337 = !MDLocation(line: 90, column: 3, scope: !330)
!338 = !MDLocation(line: 91, column: 10, scope: !339)
!339 = !{!"0xb\0091\005\0016", !1, !334}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!340 = !MDLocation(line: 91, column: 17, scope: !341)
!341 = !{!"0xb\002", !1, !342}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!342 = !{!"0xb\001", !1, !343}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!343 = !{!"0xb\0091\005\0017", !1, !339}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!344 = !MDLocation(line: 91, column: 21, scope: !343)
!345 = !MDLocation(line: 91, column: 17, scope: !343)
!346 = !MDLocation(line: 91, column: 5, scope: !339)
!347 = !MDLocation(line: 93, column: 13, scope: !348)
!348 = !{!"0xb\0092\007\0018", !1, !343}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!349 = !MDLocation(line: 93, column: 7, scope: !348)
!350 = !MDLocation(line: 93, column: 2, scope: !348)
!351 = !MDLocation(line: 93, column: 4, scope: !348)
!352 = !MDLocation(line: 94, column: 7, scope: !353)
!353 = !{!"0xb\0094\002\0019", !1, !348}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!354 = !MDLocation(line: 94, column: 14, scope: !355)
!355 = !{!"0xb\002", !1, !356}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!356 = !{!"0xb\001", !1, !357}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!357 = !{!"0xb\0094\002\0020", !1, !353}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!358 = !MDLocation(line: 94, column: 18, scope: !357)
!359 = !MDLocation(line: 94, column: 14, scope: !357)
!360 = !MDLocation(line: 94, column: 2, scope: !353)
!361 = !MDLocation(line: 95, column: 22, scope: !357)
!362 = !MDLocation(line: 95, column: 15, scope: !357)
!363 = !MDLocation(line: 95, column: 19, scope: !357)
!364 = !MDLocation(line: 95, column: 32, scope: !357)
!365 = !MDLocation(line: 95, column: 27, scope: !357)
!366 = !MDLocation(line: 95, column: 29, scope: !357)
!367 = !MDLocation(line: 95, column: 9, scope: !357)
!368 = !MDLocation(line: 95, column: 4, scope: !357)
!369 = !MDLocation(line: 95, column: 6, scope: !357)
!370 = !MDLocation(line: 94, column: 22, scope: !357)
!371 = !MDLocation(line: 94, column: 2, scope: !357)
!372 = !MDLocation(line: 96, column: 7, scope: !348)
!373 = !MDLocation(line: 91, column: 25, scope: !343)
!374 = !MDLocation(line: 91, column: 5, scope: !343)
!375 = !MDLocation(line: 96, column: 7, scope: !339)
!376 = !MDLocation(line: 90, column: 23, scope: !334)
!377 = !MDLocation(line: 90, column: 3, scope: !334)
!378 = !MDLocation(line: 99, column: 1, scope: !25)
!379 = !{!"0x101\00ni\0016777269\000", !19, !12, !15} ; [ DW_TAG_arg_variable ] [ni] [line 53]
!380 = !MDLocation(line: 53, column: 22, scope: !19)
!381 = !{!"0x101\00nl\0033554485\000", !19, !12, !15} ; [ DW_TAG_arg_variable ] [nl] [line 53]
!382 = !MDLocation(line: 53, column: 30, scope: !19)
!383 = !{!"0x101\00D\0050331702\000", !19, !12, !22} ; [ DW_TAG_arg_variable ] [D] [line 54]
!384 = !MDLocation(line: 54, column: 14, scope: !19)
!385 = !{!"0x100\00i\0056\000", !19, !12, !15}    ; [ DW_TAG_auto_variable ] [i] [line 56]
!386 = !MDLocation(line: 56, column: 7, scope: !19)
!387 = !{!"0x100\00j\0056\000", !19, !12, !15}    ; [ DW_TAG_auto_variable ] [j] [line 56]
!388 = !MDLocation(line: 56, column: 10, scope: !19)
!389 = !MDLocation(line: 58, column: 8, scope: !390)
!390 = !{!"0xb\0058\003\001", !1, !19}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!391 = !MDLocation(line: 58, column: 15, scope: !392)
!392 = !{!"0xb\002", !1, !393}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!393 = !{!"0xb\001", !1, !394}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!394 = !{!"0xb\0058\003\002", !1, !390}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!395 = !MDLocation(line: 58, column: 19, scope: !394)
!396 = !MDLocation(line: 58, column: 15, scope: !394)
!397 = !MDLocation(line: 58, column: 3, scope: !390)
!398 = !MDLocation(line: 59, column: 10, scope: !399)
!399 = !{!"0xb\0059\005\003", !1, !394}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!400 = !MDLocation(line: 59, column: 17, scope: !401)
!401 = !{!"0xb\002", !1, !402}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!402 = !{!"0xb\001", !1, !403}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!403 = !{!"0xb\0059\005\004", !1, !399}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!404 = !MDLocation(line: 59, column: 21, scope: !403)
!405 = !MDLocation(line: 59, column: 17, scope: !403)
!406 = !MDLocation(line: 59, column: 5, scope: !399)
!407 = !MDLocation(line: 60, column: 11, scope: !408)
!408 = !{!"0xb\0059\0030\005", !1, !403}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!409 = !MDLocation(line: 60, column: 46, scope: !408)
!410 = !MDLocation(line: 60, column: 41, scope: !408)
!411 = !MDLocation(line: 60, column: 43, scope: !408)
!412 = !MDLocation(line: 60, column: 2, scope: !408)
!413 = !MDLocation(line: 61, column: 7, scope: !414)
!414 = !{!"0xb\0061\006\006", !1, !408}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!415 = !MDLocation(line: 61, column: 11, scope: !414)
!416 = !MDLocation(line: 61, column: 16, scope: !414)
!417 = !MDLocation(line: 61, column: 6, scope: !414)
!418 = !MDLocation(line: 61, column: 6, scope: !408)
!419 = !MDLocation(line: 61, column: 39, scope: !420)
!420 = !{!"0xb\001", !1, !414}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!421 = !MDLocation(line: 61, column: 30, scope: !414)
!422 = !MDLocation(line: 62, column: 5, scope: !408)
!423 = !MDLocation(line: 59, column: 25, scope: !403)
!424 = !MDLocation(line: 59, column: 5, scope: !403)
!425 = !MDLocation(line: 62, column: 5, scope: !399)
!426 = !MDLocation(line: 58, column: 23, scope: !394)
!427 = !MDLocation(line: 58, column: 3, scope: !394)
!428 = !MDLocation(line: 63, column: 12, scope: !19)
!429 = !MDLocation(line: 63, column: 3, scope: !19)
!430 = !MDLocation(line: 64, column: 1, scope: !19)
