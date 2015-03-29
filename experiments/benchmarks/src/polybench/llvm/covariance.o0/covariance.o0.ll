; ModuleID = 'covariance.c'
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
  %3 = load i32* %m, align 4, !dbg !52
  %4 = load i32* %n, align 4, !dbg !53
  %5 = load [1000 x [1000 x double]]** %data, align 8, !dbg !54
  %arraydecay = getelementptr inbounds [1000 x [1000 x double]]* %5, i32 0, i32 0, !dbg !54
  call void @init_array(i32 %3, i32 %4, double* %float_n, [1000 x double]* %arraydecay), !dbg !55
  %6 = load i32* %m, align 4, !dbg !56
  %7 = load i32* %n, align 4, !dbg !57
  %8 = load double* %float_n, align 8, !dbg !58
  %9 = load [1000 x [1000 x double]]** %data, align 8, !dbg !59
  %arraydecay3 = getelementptr inbounds [1000 x [1000 x double]]* %9, i32 0, i32 0, !dbg !59
  %10 = load [1000 x [1000 x double]]** %symmat, align 8, !dbg !60
  %arraydecay4 = getelementptr inbounds [1000 x [1000 x double]]* %10, i32 0, i32 0, !dbg !60
  %11 = load [1000 x double]** %mean, align 8, !dbg !61
  %arraydecay5 = getelementptr inbounds [1000 x double]* %11, i32 0, i32 0, !dbg !61
  call void @kernel_covariance(i32 %6, i32 %7, double %8, [1000 x double]* %arraydecay3, [1000 x double]* %arraydecay4, double* %arraydecay5), !dbg !62
  %12 = load i32* %argc.addr, align 4, !dbg !63
  %cmp = icmp sgt i32 %12, 42, !dbg !63
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !65

land.lhs.true:                                    ; preds = %entry
  %13 = load i8*** %argv.addr, align 8, !dbg !66
  %arrayidx = getelementptr inbounds i8** %13, i64 0, !dbg !66
  %14 = load i8** %arrayidx, align 8, !dbg !66
  %call6 = call i32 @strcmp(i8* %14, i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0)) #5, !dbg !66
  %tobool = icmp ne i32 %call6, 0, !dbg !65
  br i1 %tobool, label %if.end, label %if.then, !dbg !65

if.then:                                          ; preds = %land.lhs.true
  %15 = load i32* %m, align 4, !dbg !68
  %16 = load [1000 x [1000 x double]]** %symmat, align 8, !dbg !68
  %arraydecay7 = getelementptr inbounds [1000 x [1000 x double]]* %16, i32 0, i32 0, !dbg !68
  call void @print_array(i32 %15, [1000 x double]* %arraydecay7), !dbg !68
  br label %if.end, !dbg !68

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %17 = load [1000 x [1000 x double]]** %data, align 8, !dbg !70
  %18 = bitcast [1000 x [1000 x double]]* %17 to i8*, !dbg !70
  call void @free(i8* %18) #6, !dbg !70
  %19 = load [1000 x [1000 x double]]** %symmat, align 8, !dbg !71
  %20 = bitcast [1000 x [1000 x double]]* %19 to i8*, !dbg !71
  call void @free(i8* %20) #6, !dbg !71
  %21 = load [1000 x double]** %mean, align 8, !dbg !72
  %22 = bitcast [1000 x double]* %21 to i8*, !dbg !72
  call void @free(i8* %22) #6, !dbg !72
  ret i32 0, !dbg !73
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
  call void @llvm.dbg.declare(metadata i32* %m.addr, metadata !74, metadata !36), !dbg !75
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !76, metadata !36), !dbg !77
  store double* %float_n, double** %float_n.addr, align 8
  call void @llvm.dbg.declare(metadata double** %float_n.addr, metadata !78, metadata !36), !dbg !79
  store [1000 x double]* %data, [1000 x double]** %data.addr, align 8
  call void @llvm.dbg.declare(metadata [1000 x double]** %data.addr, metadata !80, metadata !36), !dbg !81
  call void @llvm.dbg.declare(metadata i32* %i, metadata !82, metadata !36), !dbg !83
  call void @llvm.dbg.declare(metadata i32* %j, metadata !84, metadata !36), !dbg !85
  %0 = load double** %float_n.addr, align 8, !dbg !86
  store double 1.200000e+00, double* %0, align 8, !dbg !87
  store i32 0, i32* %i, align 4, !dbg !88
  br label %for.cond, !dbg !88

for.cond:                                         ; preds = %for.inc7, %entry
  %1 = load i32* %i, align 4, !dbg !90
  %cmp = icmp slt i32 %1, 1000, !dbg !90
  br i1 %cmp, label %for.body, label %for.end9, !dbg !94

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !95
  br label %for.cond1, !dbg !95

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32* %j, align 4, !dbg !97
  %cmp2 = icmp slt i32 %2, 1000, !dbg !97
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !101

for.body3:                                        ; preds = %for.cond1
  %3 = load i32* %i, align 4, !dbg !102
  %conv = sitofp i32 %3 to double, !dbg !103
  %4 = load i32* %j, align 4, !dbg !104
  %conv4 = sitofp i32 %4 to double, !dbg !104
  %mul = fmul double %conv, %conv4, !dbg !103
  %div = fdiv double %mul, 1.000000e+03, !dbg !105
  %5 = load i32* %j, align 4, !dbg !106
  %idxprom = sext i32 %5 to i64, !dbg !107
  %6 = load i32* %i, align 4, !dbg !108
  %idxprom5 = sext i32 %6 to i64, !dbg !107
  %7 = load [1000 x double]** %data.addr, align 8, !dbg !107
  %arrayidx = getelementptr inbounds [1000 x double]* %7, i64 %idxprom5, !dbg !107
  %arrayidx6 = getelementptr inbounds [1000 x double]* %arrayidx, i32 0, i64 %idxprom, !dbg !107
  store double %div, double* %arrayidx6, align 8, !dbg !107
  br label %for.inc, !dbg !107

for.inc:                                          ; preds = %for.body3
  %8 = load i32* %j, align 4, !dbg !109
  %inc = add nsw i32 %8, 1, !dbg !109
  store i32 %inc, i32* %j, align 4, !dbg !109
  br label %for.cond1, !dbg !110

for.end:                                          ; preds = %for.cond1
  br label %for.inc7, !dbg !111

for.inc7:                                         ; preds = %for.end
  %9 = load i32* %i, align 4, !dbg !112
  %inc8 = add nsw i32 %9, 1, !dbg !112
  store i32 %inc8, i32* %i, align 4, !dbg !112
  br label %for.cond, !dbg !113

for.end9:                                         ; preds = %for.cond
  ret void, !dbg !114
}

; Function Attrs: nounwind uwtable
define internal void @kernel_covariance(i32 %m, i32 %n, double %float_n, [1000 x double]* %data, [1000 x double]* %symmat, double* %mean) #0 {
entry:
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %float_n.addr = alloca double, align 8
  %data.addr = alloca [1000 x double]*, align 8
  %symmat.addr = alloca [1000 x double]*, align 8
  %mean.addr = alloca double*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %j1 = alloca i32, align 4
  %j2 = alloca i32, align 4
  store i32 %m, i32* %m.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %m.addr, metadata !115, metadata !36), !dbg !116
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !117, metadata !36), !dbg !118
  store double %float_n, double* %float_n.addr, align 8
  call void @llvm.dbg.declare(metadata double* %float_n.addr, metadata !119, metadata !36), !dbg !120
  store [1000 x double]* %data, [1000 x double]** %data.addr, align 8
  call void @llvm.dbg.declare(metadata [1000 x double]** %data.addr, metadata !121, metadata !36), !dbg !122
  store [1000 x double]* %symmat, [1000 x double]** %symmat.addr, align 8
  call void @llvm.dbg.declare(metadata [1000 x double]** %symmat.addr, metadata !123, metadata !36), !dbg !124
  store double* %mean, double** %mean.addr, align 8
  call void @llvm.dbg.declare(metadata double** %mean.addr, metadata !125, metadata !36), !dbg !126
  call void @llvm.dbg.declare(metadata i32* %i, metadata !127, metadata !36), !dbg !128
  call void @llvm.dbg.declare(metadata i32* %j, metadata !129, metadata !36), !dbg !130
  call void @llvm.dbg.declare(metadata i32* %j1, metadata !131, metadata !36), !dbg !132
  call void @llvm.dbg.declare(metadata i32* %j2, metadata !133, metadata !36), !dbg !134
  store i32 0, i32* %j, align 4, !dbg !135
  br label %for.cond, !dbg !135

for.cond:                                         ; preds = %for.inc12, %entry
  %0 = load i32* %j, align 4, !dbg !137
  %1 = load i32* %m.addr, align 4, !dbg !141
  %cmp = icmp slt i32 %0, %1, !dbg !142
  br i1 %cmp, label %for.body, label %for.end14, !dbg !143

for.body:                                         ; preds = %for.cond
  %2 = load i32* %j, align 4, !dbg !144
  %idxprom = sext i32 %2 to i64, !dbg !146
  %3 = load double** %mean.addr, align 8, !dbg !146
  %arrayidx = getelementptr inbounds double* %3, i64 %idxprom, !dbg !146
  store double 0.000000e+00, double* %arrayidx, align 8, !dbg !146
  store i32 0, i32* %i, align 4, !dbg !147
  br label %for.cond1, !dbg !147

for.cond1:                                        ; preds = %for.inc, %for.body
  %4 = load i32* %i, align 4, !dbg !149
  %5 = load i32* %n.addr, align 4, !dbg !153
  %cmp2 = icmp slt i32 %4, %5, !dbg !154
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !155

for.body3:                                        ; preds = %for.cond1
  %6 = load i32* %j, align 4, !dbg !156
  %idxprom4 = sext i32 %6 to i64, !dbg !157
  %7 = load i32* %i, align 4, !dbg !158
  %idxprom5 = sext i32 %7 to i64, !dbg !157
  %8 = load [1000 x double]** %data.addr, align 8, !dbg !157
  %arrayidx6 = getelementptr inbounds [1000 x double]* %8, i64 %idxprom5, !dbg !157
  %arrayidx7 = getelementptr inbounds [1000 x double]* %arrayidx6, i32 0, i64 %idxprom4, !dbg !157
  %9 = load double* %arrayidx7, align 8, !dbg !157
  %10 = load i32* %j, align 4, !dbg !159
  %idxprom8 = sext i32 %10 to i64, !dbg !160
  %11 = load double** %mean.addr, align 8, !dbg !160
  %arrayidx9 = getelementptr inbounds double* %11, i64 %idxprom8, !dbg !160
  %12 = load double* %arrayidx9, align 8, !dbg !160
  %add = fadd double %12, %9, !dbg !160
  store double %add, double* %arrayidx9, align 8, !dbg !160
  br label %for.inc, !dbg !160

for.inc:                                          ; preds = %for.body3
  %13 = load i32* %i, align 4, !dbg !161
  %inc = add nsw i32 %13, 1, !dbg !161
  store i32 %inc, i32* %i, align 4, !dbg !161
  br label %for.cond1, !dbg !162

for.end:                                          ; preds = %for.cond1
  %14 = load double* %float_n.addr, align 8, !dbg !163
  %15 = load i32* %j, align 4, !dbg !164
  %idxprom10 = sext i32 %15 to i64, !dbg !165
  %16 = load double** %mean.addr, align 8, !dbg !165
  %arrayidx11 = getelementptr inbounds double* %16, i64 %idxprom10, !dbg !165
  %17 = load double* %arrayidx11, align 8, !dbg !165
  %div = fdiv double %17, %14, !dbg !165
  store double %div, double* %arrayidx11, align 8, !dbg !165
  br label %for.inc12, !dbg !166

for.inc12:                                        ; preds = %for.end
  %18 = load i32* %j, align 4, !dbg !167
  %inc13 = add nsw i32 %18, 1, !dbg !167
  store i32 %inc13, i32* %j, align 4, !dbg !167
  br label %for.cond, !dbg !168

for.end14:                                        ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !169
  br label %for.cond15, !dbg !169

for.cond15:                                       ; preds = %for.inc30, %for.end14
  %19 = load i32* %i, align 4, !dbg !171
  %20 = load i32* %n.addr, align 4, !dbg !175
  %cmp16 = icmp slt i32 %19, %20, !dbg !176
  br i1 %cmp16, label %for.body17, label %for.end32, !dbg !177

for.body17:                                       ; preds = %for.cond15
  store i32 0, i32* %j, align 4, !dbg !178
  br label %for.cond18, !dbg !178

for.cond18:                                       ; preds = %for.inc27, %for.body17
  %21 = load i32* %j, align 4, !dbg !180
  %22 = load i32* %m.addr, align 4, !dbg !184
  %cmp19 = icmp slt i32 %21, %22, !dbg !185
  br i1 %cmp19, label %for.body20, label %for.end29, !dbg !186

for.body20:                                       ; preds = %for.cond18
  %23 = load i32* %j, align 4, !dbg !187
  %idxprom21 = sext i32 %23 to i64, !dbg !188
  %24 = load double** %mean.addr, align 8, !dbg !188
  %arrayidx22 = getelementptr inbounds double* %24, i64 %idxprom21, !dbg !188
  %25 = load double* %arrayidx22, align 8, !dbg !188
  %26 = load i32* %j, align 4, !dbg !189
  %idxprom23 = sext i32 %26 to i64, !dbg !190
  %27 = load i32* %i, align 4, !dbg !191
  %idxprom24 = sext i32 %27 to i64, !dbg !190
  %28 = load [1000 x double]** %data.addr, align 8, !dbg !190
  %arrayidx25 = getelementptr inbounds [1000 x double]* %28, i64 %idxprom24, !dbg !190
  %arrayidx26 = getelementptr inbounds [1000 x double]* %arrayidx25, i32 0, i64 %idxprom23, !dbg !190
  %29 = load double* %arrayidx26, align 8, !dbg !190
  %sub = fsub double %29, %25, !dbg !190
  store double %sub, double* %arrayidx26, align 8, !dbg !190
  br label %for.inc27, !dbg !190

for.inc27:                                        ; preds = %for.body20
  %30 = load i32* %j, align 4, !dbg !192
  %inc28 = add nsw i32 %30, 1, !dbg !192
  store i32 %inc28, i32* %j, align 4, !dbg !192
  br label %for.cond18, !dbg !193

for.end29:                                        ; preds = %for.cond18
  br label %for.inc30, !dbg !194

for.inc30:                                        ; preds = %for.end29
  %31 = load i32* %i, align 4, !dbg !195
  %inc31 = add nsw i32 %31, 1, !dbg !195
  store i32 %inc31, i32* %i, align 4, !dbg !195
  br label %for.cond15, !dbg !196

for.end32:                                        ; preds = %for.cond15
  store i32 0, i32* %j1, align 4, !dbg !197
  br label %for.cond33, !dbg !197

for.cond33:                                       ; preds = %for.inc73, %for.end32
  %32 = load i32* %j1, align 4, !dbg !199
  %33 = load i32* %m.addr, align 4, !dbg !203
  %cmp34 = icmp slt i32 %32, %33, !dbg !204
  br i1 %cmp34, label %for.body35, label %for.end75, !dbg !205

for.body35:                                       ; preds = %for.cond33
  %34 = load i32* %j1, align 4, !dbg !206
  store i32 %34, i32* %j2, align 4, !dbg !208
  br label %for.cond36, !dbg !208

for.cond36:                                       ; preds = %for.inc70, %for.body35
  %35 = load i32* %j2, align 4, !dbg !209
  %36 = load i32* %m.addr, align 4, !dbg !213
  %cmp37 = icmp slt i32 %35, %36, !dbg !214
  br i1 %cmp37, label %for.body38, label %for.end72, !dbg !215

for.body38:                                       ; preds = %for.cond36
  %37 = load i32* %j2, align 4, !dbg !216
  %idxprom39 = sext i32 %37 to i64, !dbg !218
  %38 = load i32* %j1, align 4, !dbg !219
  %idxprom40 = sext i32 %38 to i64, !dbg !218
  %39 = load [1000 x double]** %symmat.addr, align 8, !dbg !218
  %arrayidx41 = getelementptr inbounds [1000 x double]* %39, i64 %idxprom40, !dbg !218
  %arrayidx42 = getelementptr inbounds [1000 x double]* %arrayidx41, i32 0, i64 %idxprom39, !dbg !218
  store double 0.000000e+00, double* %arrayidx42, align 8, !dbg !218
  store i32 0, i32* %i, align 4, !dbg !220
  br label %for.cond43, !dbg !220

for.cond43:                                       ; preds = %for.inc59, %for.body38
  %40 = load i32* %i, align 4, !dbg !222
  %41 = load i32* %n.addr, align 4, !dbg !226
  %cmp44 = icmp slt i32 %40, %41, !dbg !227
  br i1 %cmp44, label %for.body45, label %for.end61, !dbg !228

for.body45:                                       ; preds = %for.cond43
  %42 = load i32* %j1, align 4, !dbg !229
  %idxprom46 = sext i32 %42 to i64, !dbg !230
  %43 = load i32* %i, align 4, !dbg !231
  %idxprom47 = sext i32 %43 to i64, !dbg !230
  %44 = load [1000 x double]** %data.addr, align 8, !dbg !230
  %arrayidx48 = getelementptr inbounds [1000 x double]* %44, i64 %idxprom47, !dbg !230
  %arrayidx49 = getelementptr inbounds [1000 x double]* %arrayidx48, i32 0, i64 %idxprom46, !dbg !230
  %45 = load double* %arrayidx49, align 8, !dbg !230
  %46 = load i32* %j2, align 4, !dbg !232
  %idxprom50 = sext i32 %46 to i64, !dbg !233
  %47 = load i32* %i, align 4, !dbg !234
  %idxprom51 = sext i32 %47 to i64, !dbg !233
  %48 = load [1000 x double]** %data.addr, align 8, !dbg !233
  %arrayidx52 = getelementptr inbounds [1000 x double]* %48, i64 %idxprom51, !dbg !233
  %arrayidx53 = getelementptr inbounds [1000 x double]* %arrayidx52, i32 0, i64 %idxprom50, !dbg !233
  %49 = load double* %arrayidx53, align 8, !dbg !233
  %mul = fmul double %45, %49, !dbg !230
  %50 = load i32* %j2, align 4, !dbg !235
  %idxprom54 = sext i32 %50 to i64, !dbg !236
  %51 = load i32* %j1, align 4, !dbg !237
  %idxprom55 = sext i32 %51 to i64, !dbg !236
  %52 = load [1000 x double]** %symmat.addr, align 8, !dbg !236
  %arrayidx56 = getelementptr inbounds [1000 x double]* %52, i64 %idxprom55, !dbg !236
  %arrayidx57 = getelementptr inbounds [1000 x double]* %arrayidx56, i32 0, i64 %idxprom54, !dbg !236
  %53 = load double* %arrayidx57, align 8, !dbg !236
  %add58 = fadd double %53, %mul, !dbg !236
  store double %add58, double* %arrayidx57, align 8, !dbg !236
  br label %for.inc59, !dbg !236

for.inc59:                                        ; preds = %for.body45
  %54 = load i32* %i, align 4, !dbg !238
  %inc60 = add nsw i32 %54, 1, !dbg !238
  store i32 %inc60, i32* %i, align 4, !dbg !238
  br label %for.cond43, !dbg !239

for.end61:                                        ; preds = %for.cond43
  %55 = load i32* %j2, align 4, !dbg !240
  %idxprom62 = sext i32 %55 to i64, !dbg !241
  %56 = load i32* %j1, align 4, !dbg !242
  %idxprom63 = sext i32 %56 to i64, !dbg !241
  %57 = load [1000 x double]** %symmat.addr, align 8, !dbg !241
  %arrayidx64 = getelementptr inbounds [1000 x double]* %57, i64 %idxprom63, !dbg !241
  %arrayidx65 = getelementptr inbounds [1000 x double]* %arrayidx64, i32 0, i64 %idxprom62, !dbg !241
  %58 = load double* %arrayidx65, align 8, !dbg !241
  %59 = load i32* %j1, align 4, !dbg !243
  %idxprom66 = sext i32 %59 to i64, !dbg !244
  %60 = load i32* %j2, align 4, !dbg !245
  %idxprom67 = sext i32 %60 to i64, !dbg !244
  %61 = load [1000 x double]** %symmat.addr, align 8, !dbg !244
  %arrayidx68 = getelementptr inbounds [1000 x double]* %61, i64 %idxprom67, !dbg !244
  %arrayidx69 = getelementptr inbounds [1000 x double]* %arrayidx68, i32 0, i64 %idxprom66, !dbg !244
  store double %58, double* %arrayidx69, align 8, !dbg !244
  br label %for.inc70, !dbg !246

for.inc70:                                        ; preds = %for.end61
  %62 = load i32* %j2, align 4, !dbg !247
  %inc71 = add nsw i32 %62, 1, !dbg !247
  store i32 %inc71, i32* %j2, align 4, !dbg !247
  br label %for.cond36, !dbg !248

for.end72:                                        ; preds = %for.cond36
  br label %for.inc73, !dbg !249

for.inc73:                                        ; preds = %for.end72
  %63 = load i32* %j1, align 4, !dbg !250
  %inc74 = add nsw i32 %63, 1, !dbg !250
  store i32 %inc74, i32* %j1, align 4, !dbg !250
  br label %for.cond33, !dbg !251

for.end75:                                        ; preds = %for.cond33
  ret void, !dbg !252
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
  call void @llvm.dbg.declare(metadata i32* %m.addr, metadata !253, metadata !36), !dbg !254
  store [1000 x double]* %symmat, [1000 x double]** %symmat.addr, align 8
  call void @llvm.dbg.declare(metadata [1000 x double]** %symmat.addr, metadata !255, metadata !36), !dbg !256
  call void @llvm.dbg.declare(metadata i32* %i, metadata !257, metadata !36), !dbg !258
  call void @llvm.dbg.declare(metadata i32* %j, metadata !259, metadata !36), !dbg !260
  store i32 0, i32* %i, align 4, !dbg !261
  br label %for.cond, !dbg !261

for.cond:                                         ; preds = %for.inc8, %entry
  %0 = load i32* %i, align 4, !dbg !263
  %1 = load i32* %m.addr, align 4, !dbg !267
  %cmp = icmp slt i32 %0, %1, !dbg !268
  br i1 %cmp, label %for.body, label %for.end10, !dbg !269

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !270
  br label %for.cond1, !dbg !270

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32* %j, align 4, !dbg !272
  %3 = load i32* %m.addr, align 4, !dbg !276
  %cmp2 = icmp slt i32 %2, %3, !dbg !277
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !278

for.body3:                                        ; preds = %for.cond1
  %4 = load %struct._IO_FILE** @stderr, align 8, !dbg !279
  %5 = load i32* %j, align 4, !dbg !281
  %idxprom = sext i32 %5 to i64, !dbg !282
  %6 = load i32* %i, align 4, !dbg !283
  %idxprom4 = sext i32 %6 to i64, !dbg !282
  %7 = load [1000 x double]** %symmat.addr, align 8, !dbg !282
  %arrayidx = getelementptr inbounds [1000 x double]* %7, i64 %idxprom4, !dbg !282
  %arrayidx5 = getelementptr inbounds [1000 x double]* %arrayidx, i32 0, i64 %idxprom, !dbg !282
  %8 = load double* %arrayidx5, align 8, !dbg !282
  %call = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([8 x i8]* @.str1, i32 0, i32 0), double %8), !dbg !284
  %9 = load i32* %i, align 4, !dbg !285
  %10 = load i32* %m.addr, align 4, !dbg !287
  %mul = mul nsw i32 %9, %10, !dbg !285
  %11 = load i32* %j, align 4, !dbg !288
  %add = add nsw i32 %mul, %11, !dbg !285
  %rem = srem i32 %add, 20, !dbg !289
  %cmp6 = icmp eq i32 %rem, 0, !dbg !289
  br i1 %cmp6, label %if.then, label %if.end, !dbg !290

if.then:                                          ; preds = %for.body3
  %12 = load %struct._IO_FILE** @stderr, align 8, !dbg !291
  %call7 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)), !dbg !293
  br label %if.end, !dbg !293

if.end:                                           ; preds = %if.then, %for.body3
  br label %for.inc, !dbg !294

for.inc:                                          ; preds = %if.end
  %13 = load i32* %j, align 4, !dbg !295
  %inc = add nsw i32 %13, 1, !dbg !295
  store i32 %inc, i32* %j, align 4, !dbg !295
  br label %for.cond1, !dbg !296

for.end:                                          ; preds = %for.cond1
  br label %for.inc8, !dbg !297

for.inc8:                                         ; preds = %for.end
  %14 = load i32* %i, align 4, !dbg !298
  %inc9 = add nsw i32 %14, 1, !dbg !298
  store i32 %inc9, i32* %i, align 4, !dbg !298
  br label %for.cond, !dbg !299

for.end10:                                        ; preds = %for.cond
  %15 = load %struct._IO_FILE** @stderr, align 8, !dbg !300
  %call11 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)), !dbg !301
  ret void, !dbg !302
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

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\000\00\000\00\001", !1, !2, !3, !13, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c] [DW_LANG_C99]
!1 = !{!"covariance.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance"}
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
!14 = !{!"0x2e\00main\00main\00\0095\000\001\000\000\00256\000\0096", !1, !15, !16, null, i32 (i32, i8**)* @main, null, null, !2} ; [ DW_TAG_subprogram ] [line 95] [def] [scope 96] [main]
!15 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!16 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !17, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!17 = !{!18, !18, !19}
!18 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!19 = !{!"0xf\00\000\0064\0064\000\000", null, null, !20} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!20 = !{!"0xf\00\000\0064\0064\000\000", null, null, !21} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!21 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!22 = !{!"0x2e\00print_array\00print_array\00\0040\001\001\000\000\00256\000\0043", !1, !15, !23, null, void (i32, [1000 x double]*)* @print_array, null, null, !2} ; [ DW_TAG_subprogram ] [line 40] [local] [def] [scope 43] [print_array]
!23 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !24, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!24 = !{null, !18, !9}
!25 = !{!"0x2e\00kernel_covariance\00kernel_covariance\00\0058\001\001\000\000\00256\000\0063", !1, !15, !26, null, void (i32, i32, double, [1000 x double]*, [1000 x double]*, double*)* @kernel_covariance, null, null, !2} ; [ DW_TAG_subprogram ] [line 58] [local] [def] [scope 63] [kernel_covariance]
!26 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !27, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!27 = !{null, !18, !18, !6, !9, !9, !28}
!28 = !{!"0xf\00\000\0064\0064\000\000", null, null, !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!29 = !{!"0x2e\00init_array\00init_array\00\0023\001\001\000\000\00256\000\0026", !1, !15, !30, null, void (i32, i32, double*, [1000 x double]*)* @init_array, null, null, !2} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [scope 26] [init_array]
!30 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !31, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!31 = !{null, !18, !18, !28, !9}
!32 = !{i32 2, !"Dwarf Version", i32 4}
!33 = !{i32 2, !"Debug Info Version", i32 2}
!34 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!35 = !{!"0x101\00argc\0016777311\000", !14, !15, !18} ; [ DW_TAG_arg_variable ] [argc] [line 95]
!36 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!37 = !MDLocation(line: 95, column: 14, scope: !14)
!38 = !{!"0x101\00argv\0033554527\000", !14, !15, !19} ; [ DW_TAG_arg_variable ] [argv] [line 95]
!39 = !MDLocation(line: 95, column: 27, scope: !14)
!40 = !{!"0x100\00n\0098\000", !14, !15, !18}     ; [ DW_TAG_auto_variable ] [n] [line 98]
!41 = !MDLocation(line: 98, column: 7, scope: !14)
!42 = !{!"0x100\00m\0099\000", !14, !15, !18}     ; [ DW_TAG_auto_variable ] [m] [line 99]
!43 = !MDLocation(line: 99, column: 7, scope: !14)
!44 = !{!"0x100\00float_n\00102\000", !14, !15, !6} ; [ DW_TAG_auto_variable ] [float_n] [line 102]
!45 = !MDLocation(line: 102, column: 13, scope: !14)
!46 = !{!"0x100\00data\00103\000", !14, !15, !4}  ; [ DW_TAG_auto_variable ] [data] [line 103]
!47 = !MDLocation(line: 103, column: 3, scope: !14)
!48 = !{!"0x100\00symmat\00104\000", !14, !15, !4} ; [ DW_TAG_auto_variable ] [symmat] [line 104]
!49 = !MDLocation(line: 104, column: 3, scope: !14)
!50 = !{!"0x100\00mean\00105\000", !14, !15, !9}  ; [ DW_TAG_auto_variable ] [mean] [line 105]
!51 = !MDLocation(line: 105, column: 3, scope: !14)
!52 = !MDLocation(line: 109, column: 15, scope: !14)
!53 = !MDLocation(line: 109, column: 18, scope: !14)
!54 = !MDLocation(line: 109, column: 31, scope: !14)
!55 = !MDLocation(line: 109, column: 3, scope: !14)
!56 = !MDLocation(line: 115, column: 22, scope: !14)
!57 = !MDLocation(line: 115, column: 25, scope: !14)
!58 = !MDLocation(line: 115, column: 28, scope: !14)
!59 = !MDLocation(line: 116, column: 8, scope: !14)
!60 = !MDLocation(line: 117, column: 8, scope: !14)
!61 = !MDLocation(line: 118, column: 8, scope: !14)
!62 = !MDLocation(line: 115, column: 3, scope: !14)
!63 = !MDLocation(line: 126, column: 3, scope: !64)
!64 = !{!"0xb\00126\003\000", !1, !14}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!65 = !MDLocation(line: 126, column: 3, scope: !14)
!66 = !MDLocation(line: 126, column: 3, scope: !67)
!67 = !{!"0xb\001", !1, !64}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!68 = !MDLocation(line: 126, column: 3, scope: !69)
!69 = !{!"0xb\002", !1, !64}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!70 = !MDLocation(line: 129, column: 3, scope: !14)
!71 = !MDLocation(line: 130, column: 3, scope: !14)
!72 = !MDLocation(line: 131, column: 3, scope: !14)
!73 = !MDLocation(line: 133, column: 3, scope: !14)
!74 = !{!"0x101\00m\0016777239\000", !29, !15, !18} ; [ DW_TAG_arg_variable ] [m] [line 23]
!75 = !MDLocation(line: 23, column: 22, scope: !29)
!76 = !{!"0x101\00n\0033554455\000", !29, !15, !18} ; [ DW_TAG_arg_variable ] [n] [line 23]
!77 = !MDLocation(line: 23, column: 29, scope: !29)
!78 = !{!"0x101\00float_n\0050331672\000", !29, !15, !28} ; [ DW_TAG_arg_variable ] [float_n] [line 24]
!79 = !MDLocation(line: 24, column: 15, scope: !29)
!80 = !{!"0x101\00data\0067108889\000", !29, !15, !9} ; [ DW_TAG_arg_variable ] [data] [line 25]
!81 = !MDLocation(line: 25, column: 14, scope: !29)
!82 = !{!"0x100\00i\0027\000", !29, !15, !18}     ; [ DW_TAG_auto_variable ] [i] [line 27]
!83 = !MDLocation(line: 27, column: 7, scope: !29)
!84 = !{!"0x100\00j\0027\000", !29, !15, !18}     ; [ DW_TAG_auto_variable ] [j] [line 27]
!85 = !MDLocation(line: 27, column: 10, scope: !29)
!86 = !MDLocation(line: 29, column: 4, scope: !29)
!87 = !MDLocation(line: 29, column: 3, scope: !29)
!88 = !MDLocation(line: 31, column: 8, scope: !89)
!89 = !{!"0xb\0031\003\0023", !1, !29}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!90 = !MDLocation(line: 31, column: 15, scope: !91)
!91 = !{!"0xb\002", !1, !92}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!92 = !{!"0xb\001", !1, !93}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!93 = !{!"0xb\0031\003\0024", !1, !89}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!94 = !MDLocation(line: 31, column: 3, scope: !89)
!95 = !MDLocation(line: 32, column: 10, scope: !96)
!96 = !{!"0xb\0032\005\0025", !1, !93}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!97 = !MDLocation(line: 32, column: 17, scope: !98)
!98 = !{!"0xb\002", !1, !99}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!99 = !{!"0xb\001", !1, !100}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!100 = !{!"0xb\0032\005\0026", !1, !96}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!101 = !MDLocation(line: 32, column: 5, scope: !96)
!102 = !MDLocation(line: 33, column: 33, scope: !100)
!103 = !MDLocation(line: 33, column: 21, scope: !100)
!104 = !MDLocation(line: 33, column: 35, scope: !100)
!105 = !MDLocation(line: 33, column: 20, scope: !100)
!106 = !MDLocation(line: 33, column: 15, scope: !100)
!107 = !MDLocation(line: 33, column: 7, scope: !100)
!108 = !MDLocation(line: 33, column: 12, scope: !100)
!109 = !MDLocation(line: 32, column: 24, scope: !100)
!110 = !MDLocation(line: 32, column: 5, scope: !100)
!111 = !MDLocation(line: 33, column: 40, scope: !96)
!112 = !MDLocation(line: 31, column: 22, scope: !93)
!113 = !MDLocation(line: 31, column: 3, scope: !93)
!114 = !MDLocation(line: 34, column: 1, scope: !29)
!115 = !{!"0x101\00m\0016777274\000", !25, !15, !18} ; [ DW_TAG_arg_variable ] [m] [line 58]
!116 = !MDLocation(line: 58, column: 28, scope: !25)
!117 = !{!"0x101\00n\0033554490\000", !25, !15, !18} ; [ DW_TAG_arg_variable ] [n] [line 58]
!118 = !MDLocation(line: 58, column: 35, scope: !25)
!119 = !{!"0x101\00float_n\0050331707\000", !25, !15, !6} ; [ DW_TAG_arg_variable ] [float_n] [line 59]
!120 = !MDLocation(line: 59, column: 20, scope: !25)
!121 = !{!"0x101\00data\0067108924\000", !25, !15, !9} ; [ DW_TAG_arg_variable ] [data] [line 60]
!122 = !MDLocation(line: 60, column: 20, scope: !25)
!123 = !{!"0x101\00symmat\0083886141\000", !25, !15, !9} ; [ DW_TAG_arg_variable ] [symmat] [line 61]
!124 = !MDLocation(line: 61, column: 20, scope: !25)
!125 = !{!"0x101\00mean\00100663358\000", !25, !15, !28} ; [ DW_TAG_arg_variable ] [mean] [line 62]
!126 = !MDLocation(line: 62, column: 20, scope: !25)
!127 = !{!"0x100\00i\0064\000", !25, !15, !18}    ; [ DW_TAG_auto_variable ] [i] [line 64]
!128 = !MDLocation(line: 64, column: 7, scope: !25)
!129 = !{!"0x100\00j\0064\000", !25, !15, !18}    ; [ DW_TAG_auto_variable ] [j] [line 64]
!130 = !MDLocation(line: 64, column: 10, scope: !25)
!131 = !{!"0x100\00j1\0064\000", !25, !15, !18}   ; [ DW_TAG_auto_variable ] [j1] [line 64]
!132 = !MDLocation(line: 64, column: 13, scope: !25)
!133 = !{!"0x100\00j2\0064\000", !25, !15, !18}   ; [ DW_TAG_auto_variable ] [j2] [line 64]
!134 = !MDLocation(line: 64, column: 17, scope: !25)
!135 = !MDLocation(line: 68, column: 8, scope: !136)
!136 = !{!"0xb\0068\003\007", !1, !25}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!137 = !MDLocation(line: 68, column: 15, scope: !138)
!138 = !{!"0xb\002", !1, !139}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!139 = !{!"0xb\001", !1, !140}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!140 = !{!"0xb\0068\003\008", !1, !136}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!141 = !MDLocation(line: 68, column: 19, scope: !140)
!142 = !MDLocation(line: 68, column: 15, scope: !140)
!143 = !MDLocation(line: 68, column: 3, scope: !136)
!144 = !MDLocation(line: 70, column: 12, scope: !145)
!145 = !{!"0xb\0069\005\009", !1, !140}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!146 = !MDLocation(line: 70, column: 7, scope: !145)
!147 = !MDLocation(line: 71, column: 12, scope: !148)
!148 = !{!"0xb\0071\007\0010", !1, !145}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!149 = !MDLocation(line: 71, column: 19, scope: !150)
!150 = !{!"0xb\002", !1, !151}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!151 = !{!"0xb\001", !1, !152}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!152 = !{!"0xb\0071\007\0011", !1, !148}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!153 = !MDLocation(line: 71, column: 23, scope: !152)
!154 = !MDLocation(line: 71, column: 19, scope: !152)
!155 = !MDLocation(line: 71, column: 7, scope: !148)
!156 = !MDLocation(line: 72, column: 28, scope: !152)
!157 = !MDLocation(line: 72, column: 20, scope: !152)
!158 = !MDLocation(line: 72, column: 25, scope: !152)
!159 = !MDLocation(line: 72, column: 14, scope: !152)
!160 = !MDLocation(line: 72, column: 9, scope: !152)
!161 = !MDLocation(line: 71, column: 26, scope: !152)
!162 = !MDLocation(line: 71, column: 7, scope: !152)
!163 = !MDLocation(line: 73, column: 18, scope: !145)
!164 = !MDLocation(line: 73, column: 12, scope: !145)
!165 = !MDLocation(line: 73, column: 7, scope: !145)
!166 = !MDLocation(line: 74, column: 5, scope: !145)
!167 = !MDLocation(line: 68, column: 22, scope: !140)
!168 = !MDLocation(line: 68, column: 3, scope: !140)
!169 = !MDLocation(line: 77, column: 8, scope: !170)
!170 = !{!"0xb\0077\003\0012", !1, !25}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!171 = !MDLocation(line: 77, column: 15, scope: !172)
!172 = !{!"0xb\002", !1, !173}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!173 = !{!"0xb\001", !1, !174}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!174 = !{!"0xb\0077\003\0013", !1, !170}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!175 = !MDLocation(line: 77, column: 19, scope: !174)
!176 = !MDLocation(line: 77, column: 15, scope: !174)
!177 = !MDLocation(line: 77, column: 3, scope: !170)
!178 = !MDLocation(line: 78, column: 10, scope: !179)
!179 = !{!"0xb\0078\005\0014", !1, !174}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!180 = !MDLocation(line: 78, column: 17, scope: !181)
!181 = !{!"0xb\002", !1, !182}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!182 = !{!"0xb\001", !1, !183}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!183 = !{!"0xb\0078\005\0015", !1, !179}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!184 = !MDLocation(line: 78, column: 21, scope: !183)
!185 = !MDLocation(line: 78, column: 17, scope: !183)
!186 = !MDLocation(line: 78, column: 5, scope: !179)
!187 = !MDLocation(line: 79, column: 26, scope: !183)
!188 = !MDLocation(line: 79, column: 21, scope: !183)
!189 = !MDLocation(line: 79, column: 15, scope: !183)
!190 = !MDLocation(line: 79, column: 7, scope: !183)
!191 = !MDLocation(line: 79, column: 12, scope: !183)
!192 = !MDLocation(line: 78, column: 24, scope: !183)
!193 = !MDLocation(line: 78, column: 5, scope: !183)
!194 = !MDLocation(line: 79, column: 27, scope: !179)
!195 = !MDLocation(line: 77, column: 22, scope: !174)
!196 = !MDLocation(line: 77, column: 3, scope: !174)
!197 = !MDLocation(line: 82, column: 8, scope: !198)
!198 = !{!"0xb\0082\003\0016", !1, !25}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!199 = !MDLocation(line: 82, column: 16, scope: !200)
!200 = !{!"0xb\002", !1, !201}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!201 = !{!"0xb\001", !1, !202}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!202 = !{!"0xb\0082\003\0017", !1, !198}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!203 = !MDLocation(line: 82, column: 21, scope: !202)
!204 = !MDLocation(line: 82, column: 16, scope: !202)
!205 = !MDLocation(line: 82, column: 3, scope: !198)
!206 = !MDLocation(line: 83, column: 15, scope: !207)
!207 = !{!"0xb\0083\005\0018", !1, !202}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!208 = !MDLocation(line: 83, column: 10, scope: !207)
!209 = !MDLocation(line: 83, column: 19, scope: !210)
!210 = !{!"0xb\002", !1, !211}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!211 = !{!"0xb\001", !1, !212}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!212 = !{!"0xb\0083\005\0019", !1, !207}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!213 = !MDLocation(line: 83, column: 24, scope: !212)
!214 = !MDLocation(line: 83, column: 19, scope: !212)
!215 = !MDLocation(line: 83, column: 5, scope: !207)
!216 = !MDLocation(line: 85, column: 20, scope: !217)
!217 = !{!"0xb\0084\007\0020", !1, !212}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!218 = !MDLocation(line: 85, column: 9, scope: !217)
!219 = !MDLocation(line: 85, column: 16, scope: !217)
!220 = !MDLocation(line: 86, column: 14, scope: !221)
!221 = !{!"0xb\0086\009\0021", !1, !217}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!222 = !MDLocation(line: 86, column: 21, scope: !223)
!223 = !{!"0xb\002", !1, !224}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!224 = !{!"0xb\001", !1, !225}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!225 = !{!"0xb\0086\009\0022", !1, !221}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!226 = !MDLocation(line: 86, column: 25, scope: !225)
!227 = !MDLocation(line: 86, column: 21, scope: !225)
!228 = !MDLocation(line: 86, column: 9, scope: !221)
!229 = !MDLocation(line: 87, column: 30, scope: !225)
!230 = !MDLocation(line: 87, column: 22, scope: !225)
!231 = !MDLocation(line: 87, column: 27, scope: !225)
!232 = !MDLocation(line: 87, column: 44, scope: !225)
!233 = !MDLocation(line: 87, column: 36, scope: !225)
!234 = !MDLocation(line: 87, column: 41, scope: !225)
!235 = !MDLocation(line: 87, column: 15, scope: !225)
!236 = !MDLocation(line: 87, column: 4, scope: !225)
!237 = !MDLocation(line: 87, column: 11, scope: !225)
!238 = !MDLocation(line: 86, column: 28, scope: !225)
!239 = !MDLocation(line: 86, column: 9, scope: !225)
!240 = !MDLocation(line: 88, column: 37, scope: !217)
!241 = !MDLocation(line: 88, column: 26, scope: !217)
!242 = !MDLocation(line: 88, column: 33, scope: !217)
!243 = !MDLocation(line: 88, column: 20, scope: !217)
!244 = !MDLocation(line: 88, column: 9, scope: !217)
!245 = !MDLocation(line: 88, column: 16, scope: !217)
!246 = !MDLocation(line: 89, column: 7, scope: !217)
!247 = !MDLocation(line: 83, column: 27, scope: !212)
!248 = !MDLocation(line: 83, column: 5, scope: !212)
!249 = !MDLocation(line: 89, column: 7, scope: !207)
!250 = !MDLocation(line: 82, column: 24, scope: !202)
!251 = !MDLocation(line: 82, column: 3, scope: !202)
!252 = !MDLocation(line: 92, column: 1, scope: !25)
!253 = !{!"0x101\00m\0016777256\000", !22, !15, !18} ; [ DW_TAG_arg_variable ] [m] [line 40]
!254 = !MDLocation(line: 40, column: 22, scope: !22)
!255 = !{!"0x101\00symmat\0033554473\000", !22, !15, !9} ; [ DW_TAG_arg_variable ] [symmat] [line 41]
!256 = !MDLocation(line: 41, column: 14, scope: !22)
!257 = !{!"0x100\00i\0044\000", !22, !15, !18}    ; [ DW_TAG_auto_variable ] [i] [line 44]
!258 = !MDLocation(line: 44, column: 7, scope: !22)
!259 = !{!"0x100\00j\0044\000", !22, !15, !18}    ; [ DW_TAG_auto_variable ] [j] [line 44]
!260 = !MDLocation(line: 44, column: 10, scope: !22)
!261 = !MDLocation(line: 46, column: 8, scope: !262)
!262 = !{!"0xb\0046\003\001", !1, !22}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!263 = !MDLocation(line: 46, column: 15, scope: !264)
!264 = !{!"0xb\002", !1, !265}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!265 = !{!"0xb\001", !1, !266}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!266 = !{!"0xb\0046\003\002", !1, !262}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!267 = !MDLocation(line: 46, column: 19, scope: !266)
!268 = !MDLocation(line: 46, column: 15, scope: !266)
!269 = !MDLocation(line: 46, column: 3, scope: !262)
!270 = !MDLocation(line: 47, column: 10, scope: !271)
!271 = !{!"0xb\0047\005\003", !1, !266}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!272 = !MDLocation(line: 47, column: 17, scope: !273)
!273 = !{!"0xb\002", !1, !274}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!274 = !{!"0xb\001", !1, !275}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!275 = !{!"0xb\0047\005\004", !1, !271}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!276 = !MDLocation(line: 47, column: 21, scope: !275)
!277 = !MDLocation(line: 47, column: 17, scope: !275)
!278 = !MDLocation(line: 47, column: 5, scope: !271)
!279 = !MDLocation(line: 48, column: 16, scope: !280)
!280 = !{!"0xb\0047\0029\005", !1, !275}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!281 = !MDLocation(line: 48, column: 56, scope: !280)
!282 = !MDLocation(line: 48, column: 46, scope: !280)
!283 = !MDLocation(line: 48, column: 53, scope: !280)
!284 = !MDLocation(line: 48, column: 7, scope: !280)
!285 = !MDLocation(line: 49, column: 12, scope: !286)
!286 = !{!"0xb\0049\0011\006", !1, !280}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!287 = !MDLocation(line: 49, column: 16, scope: !286)
!288 = !MDLocation(line: 49, column: 20, scope: !286)
!289 = !MDLocation(line: 49, column: 11, scope: !286)
!290 = !MDLocation(line: 49, column: 11, scope: !280)
!291 = !MDLocation(line: 49, column: 43, scope: !292)
!292 = !{!"0xb\001", !1, !286}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!293 = !MDLocation(line: 49, column: 34, scope: !286)
!294 = !MDLocation(line: 50, column: 5, scope: !280)
!295 = !MDLocation(line: 47, column: 24, scope: !275)
!296 = !MDLocation(line: 47, column: 5, scope: !275)
!297 = !MDLocation(line: 50, column: 5, scope: !271)
!298 = !MDLocation(line: 46, column: 22, scope: !266)
!299 = !MDLocation(line: 46, column: 3, scope: !266)
!300 = !MDLocation(line: 51, column: 12, scope: !22)
!301 = !MDLocation(line: 51, column: 3, scope: !22)
!302 = !MDLocation(line: 52, column: 1, scope: !22)
