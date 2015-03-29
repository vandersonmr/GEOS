; ModuleID = 'doitgen.c'
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
  %nr = alloca i32, align 4
  %nq = alloca i32, align 4
  %np = alloca i32, align 4
  %A = alloca [128 x [128 x [128 x double]]]*, align 8
  %sum = alloca [128 x [128 x [128 x double]]]*, align 8
  %C4 = alloca [128 x [128 x double]]*, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !37, metadata !38), !dbg !39
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !40, metadata !38), !dbg !41
  call void @llvm.dbg.declare(metadata i32* %nr, metadata !42, metadata !38), !dbg !43
  store i32 128, i32* %nr, align 4, !dbg !43
  call void @llvm.dbg.declare(metadata i32* %nq, metadata !44, metadata !38), !dbg !45
  store i32 128, i32* %nq, align 4, !dbg !45
  call void @llvm.dbg.declare(metadata i32* %np, metadata !46, metadata !38), !dbg !47
  store i32 128, i32* %np, align 4, !dbg !47
  call void @llvm.dbg.declare(metadata [128 x [128 x [128 x double]]]** %A, metadata !48, metadata !38), !dbg !49
  %call = call i8* @polybench_alloc_data(i32 2097152, i32 8), !dbg !49
  %0 = bitcast i8* %call to [128 x [128 x [128 x double]]]*, !dbg !49
  store [128 x [128 x [128 x double]]]* %0, [128 x [128 x [128 x double]]]** %A, align 8, !dbg !49
  call void @llvm.dbg.declare(metadata [128 x [128 x [128 x double]]]** %sum, metadata !50, metadata !38), !dbg !51
  %call1 = call i8* @polybench_alloc_data(i32 2097152, i32 8), !dbg !51
  %1 = bitcast i8* %call1 to [128 x [128 x [128 x double]]]*, !dbg !51
  store [128 x [128 x [128 x double]]]* %1, [128 x [128 x [128 x double]]]** %sum, align 8, !dbg !51
  call void @llvm.dbg.declare(metadata [128 x [128 x double]]** %C4, metadata !52, metadata !38), !dbg !53
  %call2 = call i8* @polybench_alloc_data(i32 16384, i32 8), !dbg !53
  %2 = bitcast i8* %call2 to [128 x [128 x double]]*, !dbg !53
  store [128 x [128 x double]]* %2, [128 x [128 x double]]** %C4, align 8, !dbg !53
  %3 = load i32* %nr, align 4, !dbg !54
  %4 = load i32* %nq, align 4, !dbg !55
  %5 = load i32* %np, align 4, !dbg !56
  %6 = load [128 x [128 x [128 x double]]]** %A, align 8, !dbg !57
  %arraydecay = getelementptr inbounds [128 x [128 x [128 x double]]]* %6, i32 0, i32 0, !dbg !57
  %7 = load [128 x [128 x double]]** %C4, align 8, !dbg !58
  %arraydecay3 = getelementptr inbounds [128 x [128 x double]]* %7, i32 0, i32 0, !dbg !58
  call void @init_array(i32 %3, i32 %4, i32 %5, [128 x [128 x double]]* %arraydecay, [128 x double]* %arraydecay3), !dbg !59
  %8 = load i32* %nr, align 4, !dbg !60
  %9 = load i32* %nq, align 4, !dbg !61
  %10 = load i32* %np, align 4, !dbg !62
  %11 = load [128 x [128 x [128 x double]]]** %A, align 8, !dbg !63
  %arraydecay4 = getelementptr inbounds [128 x [128 x [128 x double]]]* %11, i32 0, i32 0, !dbg !63
  %12 = load [128 x [128 x double]]** %C4, align 8, !dbg !64
  %arraydecay5 = getelementptr inbounds [128 x [128 x double]]* %12, i32 0, i32 0, !dbg !64
  %13 = load [128 x [128 x [128 x double]]]** %sum, align 8, !dbg !65
  %arraydecay6 = getelementptr inbounds [128 x [128 x [128 x double]]]* %13, i32 0, i32 0, !dbg !65
  call void @kernel_doitgen(i32 %8, i32 %9, i32 %10, [128 x [128 x double]]* %arraydecay4, [128 x double]* %arraydecay5, [128 x [128 x double]]* %arraydecay6), !dbg !66
  %14 = load i32* %argc.addr, align 4, !dbg !67
  %cmp = icmp sgt i32 %14, 42, !dbg !67
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !69

land.lhs.true:                                    ; preds = %entry
  %15 = load i8*** %argv.addr, align 8, !dbg !70
  %arrayidx = getelementptr inbounds i8** %15, i64 0, !dbg !70
  %16 = load i8** %arrayidx, align 8, !dbg !70
  %call7 = call i32 @strcmp(i8* %16, i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0)) #5, !dbg !70
  %tobool = icmp ne i32 %call7, 0, !dbg !69
  br i1 %tobool, label %if.end, label %if.then, !dbg !69

if.then:                                          ; preds = %land.lhs.true
  %17 = load i32* %nr, align 4, !dbg !72
  %18 = load i32* %nq, align 4, !dbg !72
  %19 = load i32* %np, align 4, !dbg !72
  %20 = load [128 x [128 x [128 x double]]]** %A, align 8, !dbg !72
  %arraydecay8 = getelementptr inbounds [128 x [128 x [128 x double]]]* %20, i32 0, i32 0, !dbg !72
  call void @print_array(i32 %17, i32 %18, i32 %19, [128 x [128 x double]]* %arraydecay8), !dbg !72
  br label %if.end, !dbg !72

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %21 = load [128 x [128 x [128 x double]]]** %A, align 8, !dbg !74
  %22 = bitcast [128 x [128 x [128 x double]]]* %21 to i8*, !dbg !74
  call void @free(i8* %22) #6, !dbg !74
  %23 = load [128 x [128 x [128 x double]]]** %sum, align 8, !dbg !75
  %24 = bitcast [128 x [128 x [128 x double]]]* %23 to i8*, !dbg !75
  call void @free(i8* %24) #6, !dbg !75
  %25 = load [128 x [128 x double]]** %C4, align 8, !dbg !76
  %26 = bitcast [128 x [128 x double]]* %25 to i8*, !dbg !76
  call void @free(i8* %26) #6, !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i8* @polybench_alloc_data(i32, i32) #2

; Function Attrs: nounwind uwtable
define internal void @init_array(i32 %nr, i32 %nq, i32 %np, [128 x [128 x double]]* %A, [128 x double]* %C4) #0 {
entry:
  %nr.addr = alloca i32, align 4
  %nq.addr = alloca i32, align 4
  %np.addr = alloca i32, align 4
  %A.addr = alloca [128 x [128 x double]]*, align 8
  %C4.addr = alloca [128 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %nr, i32* %nr.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nr.addr, metadata !78, metadata !38), !dbg !79
  store i32 %nq, i32* %nq.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nq.addr, metadata !80, metadata !38), !dbg !81
  store i32 %np, i32* %np.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %np.addr, metadata !82, metadata !38), !dbg !83
  store [128 x [128 x double]]* %A, [128 x [128 x double]]** %A.addr, align 8
  call void @llvm.dbg.declare(metadata [128 x [128 x double]]** %A.addr, metadata !84, metadata !38), !dbg !85
  store [128 x double]* %C4, [128 x double]** %C4.addr, align 8
  call void @llvm.dbg.declare(metadata [128 x double]** %C4.addr, metadata !86, metadata !38), !dbg !87
  call void @llvm.dbg.declare(metadata i32* %i, metadata !88, metadata !38), !dbg !89
  call void @llvm.dbg.declare(metadata i32* %j, metadata !90, metadata !38), !dbg !91
  call void @llvm.dbg.declare(metadata i32* %k, metadata !92, metadata !38), !dbg !93
  store i32 0, i32* %i, align 4, !dbg !94
  br label %for.cond, !dbg !94

for.cond:                                         ; preds = %for.inc17, %entry
  %0 = load i32* %i, align 4, !dbg !96
  %1 = load i32* %nr.addr, align 4, !dbg !100
  %cmp = icmp slt i32 %0, %1, !dbg !101
  br i1 %cmp, label %for.body, label %for.end19, !dbg !102

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !103
  br label %for.cond1, !dbg !103

for.cond1:                                        ; preds = %for.inc14, %for.body
  %2 = load i32* %j, align 4, !dbg !105
  %3 = load i32* %nq.addr, align 4, !dbg !109
  %cmp2 = icmp slt i32 %2, %3, !dbg !110
  br i1 %cmp2, label %for.body3, label %for.end16, !dbg !111

for.body3:                                        ; preds = %for.cond1
  store i32 0, i32* %k, align 4, !dbg !112
  br label %for.cond4, !dbg !112

for.cond4:                                        ; preds = %for.inc, %for.body3
  %4 = load i32* %k, align 4, !dbg !114
  %5 = load i32* %np.addr, align 4, !dbg !118
  %cmp5 = icmp slt i32 %4, %5, !dbg !119
  br i1 %cmp5, label %for.body6, label %for.end, !dbg !120

for.body6:                                        ; preds = %for.cond4
  %6 = load i32* %i, align 4, !dbg !121
  %conv = sitofp i32 %6 to double, !dbg !122
  %7 = load i32* %j, align 4, !dbg !123
  %conv7 = sitofp i32 %7 to double, !dbg !123
  %mul = fmul double %conv, %conv7, !dbg !122
  %8 = load i32* %k, align 4, !dbg !124
  %conv8 = sitofp i32 %8 to double, !dbg !124
  %add = fadd double %mul, %conv8, !dbg !122
  %9 = load i32* %np.addr, align 4, !dbg !125
  %conv9 = sitofp i32 %9 to double, !dbg !125
  %div = fdiv double %add, %conv9, !dbg !126
  %10 = load i32* %k, align 4, !dbg !127
  %idxprom = sext i32 %10 to i64, !dbg !128
  %11 = load i32* %j, align 4, !dbg !129
  %idxprom10 = sext i32 %11 to i64, !dbg !128
  %12 = load i32* %i, align 4, !dbg !130
  %idxprom11 = sext i32 %12 to i64, !dbg !128
  %13 = load [128 x [128 x double]]** %A.addr, align 8, !dbg !128
  %arrayidx = getelementptr inbounds [128 x [128 x double]]* %13, i64 %idxprom11, !dbg !128
  %arrayidx12 = getelementptr inbounds [128 x [128 x double]]* %arrayidx, i32 0, i64 %idxprom10, !dbg !128
  %arrayidx13 = getelementptr inbounds [128 x double]* %arrayidx12, i32 0, i64 %idxprom, !dbg !128
  store double %div, double* %arrayidx13, align 8, !dbg !128
  br label %for.inc, !dbg !128

for.inc:                                          ; preds = %for.body6
  %14 = load i32* %k, align 4, !dbg !131
  %inc = add nsw i32 %14, 1, !dbg !131
  store i32 %inc, i32* %k, align 4, !dbg !131
  br label %for.cond4, !dbg !132

for.end:                                          ; preds = %for.cond4
  br label %for.inc14, !dbg !133

for.inc14:                                        ; preds = %for.end
  %15 = load i32* %j, align 4, !dbg !134
  %inc15 = add nsw i32 %15, 1, !dbg !134
  store i32 %inc15, i32* %j, align 4, !dbg !134
  br label %for.cond1, !dbg !135

for.end16:                                        ; preds = %for.cond1
  br label %for.inc17, !dbg !136

for.inc17:                                        ; preds = %for.end16
  %16 = load i32* %i, align 4, !dbg !137
  %inc18 = add nsw i32 %16, 1, !dbg !137
  store i32 %inc18, i32* %i, align 4, !dbg !137
  br label %for.cond, !dbg !138

for.end19:                                        ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !139
  br label %for.cond20, !dbg !139

for.cond20:                                       ; preds = %for.inc40, %for.end19
  %17 = load i32* %i, align 4, !dbg !141
  %18 = load i32* %np.addr, align 4, !dbg !145
  %cmp21 = icmp slt i32 %17, %18, !dbg !146
  br i1 %cmp21, label %for.body23, label %for.end42, !dbg !147

for.body23:                                       ; preds = %for.cond20
  store i32 0, i32* %j, align 4, !dbg !148
  br label %for.cond24, !dbg !148

for.cond24:                                       ; preds = %for.inc37, %for.body23
  %19 = load i32* %j, align 4, !dbg !150
  %20 = load i32* %np.addr, align 4, !dbg !154
  %cmp25 = icmp slt i32 %19, %20, !dbg !155
  br i1 %cmp25, label %for.body27, label %for.end39, !dbg !156

for.body27:                                       ; preds = %for.cond24
  %21 = load i32* %i, align 4, !dbg !157
  %conv28 = sitofp i32 %21 to double, !dbg !158
  %22 = load i32* %j, align 4, !dbg !159
  %conv29 = sitofp i32 %22 to double, !dbg !159
  %mul30 = fmul double %conv28, %conv29, !dbg !158
  %23 = load i32* %np.addr, align 4, !dbg !160
  %conv31 = sitofp i32 %23 to double, !dbg !160
  %div32 = fdiv double %mul30, %conv31, !dbg !161
  %24 = load i32* %j, align 4, !dbg !162
  %idxprom33 = sext i32 %24 to i64, !dbg !163
  %25 = load i32* %i, align 4, !dbg !164
  %idxprom34 = sext i32 %25 to i64, !dbg !163
  %26 = load [128 x double]** %C4.addr, align 8, !dbg !163
  %arrayidx35 = getelementptr inbounds [128 x double]* %26, i64 %idxprom34, !dbg !163
  %arrayidx36 = getelementptr inbounds [128 x double]* %arrayidx35, i32 0, i64 %idxprom33, !dbg !163
  store double %div32, double* %arrayidx36, align 8, !dbg !163
  br label %for.inc37, !dbg !163

for.inc37:                                        ; preds = %for.body27
  %27 = load i32* %j, align 4, !dbg !165
  %inc38 = add nsw i32 %27, 1, !dbg !165
  store i32 %inc38, i32* %j, align 4, !dbg !165
  br label %for.cond24, !dbg !166

for.end39:                                        ; preds = %for.cond24
  br label %for.inc40, !dbg !167

for.inc40:                                        ; preds = %for.end39
  %28 = load i32* %i, align 4, !dbg !168
  %inc41 = add nsw i32 %28, 1, !dbg !168
  store i32 %inc41, i32* %i, align 4, !dbg !168
  br label %for.cond20, !dbg !169

for.end42:                                        ; preds = %for.cond20
  ret void, !dbg !170
}

; Function Attrs: nounwind uwtable
define internal void @kernel_doitgen(i32 %nr, i32 %nq, i32 %np, [128 x [128 x double]]* %A, [128 x double]* %C4, [128 x [128 x double]]* %sum) #0 {
entry:
  %nr.addr = alloca i32, align 4
  %nq.addr = alloca i32, align 4
  %np.addr = alloca i32, align 4
  %A.addr = alloca [128 x [128 x double]]*, align 8
  %C4.addr = alloca [128 x double]*, align 8
  %sum.addr = alloca [128 x [128 x double]]*, align 8
  %r = alloca i32, align 4
  %q = alloca i32, align 4
  %p = alloca i32, align 4
  %s = alloca i32, align 4
  store i32 %nr, i32* %nr.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nr.addr, metadata !171, metadata !38), !dbg !172
  store i32 %nq, i32* %nq.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nq.addr, metadata !173, metadata !38), !dbg !174
  store i32 %np, i32* %np.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %np.addr, metadata !175, metadata !38), !dbg !176
  store [128 x [128 x double]]* %A, [128 x [128 x double]]** %A.addr, align 8
  call void @llvm.dbg.declare(metadata [128 x [128 x double]]** %A.addr, metadata !177, metadata !38), !dbg !178
  store [128 x double]* %C4, [128 x double]** %C4.addr, align 8
  call void @llvm.dbg.declare(metadata [128 x double]** %C4.addr, metadata !179, metadata !38), !dbg !180
  store [128 x [128 x double]]* %sum, [128 x [128 x double]]** %sum.addr, align 8
  call void @llvm.dbg.declare(metadata [128 x [128 x double]]** %sum.addr, metadata !181, metadata !38), !dbg !182
  call void @llvm.dbg.declare(metadata i32* %r, metadata !183, metadata !38), !dbg !184
  call void @llvm.dbg.declare(metadata i32* %q, metadata !185, metadata !38), !dbg !186
  call void @llvm.dbg.declare(metadata i32* %p, metadata !187, metadata !38), !dbg !188
  call void @llvm.dbg.declare(metadata i32* %s, metadata !189, metadata !38), !dbg !190
  store i32 0, i32* %r, align 4, !dbg !191
  br label %for.cond, !dbg !191

for.cond:                                         ; preds = %for.inc60, %entry
  %0 = load i32* %r, align 4, !dbg !193
  %1 = load i32* %nr.addr, align 4, !dbg !197
  %cmp = icmp slt i32 %0, %1, !dbg !198
  br i1 %cmp, label %for.body, label %for.end62, !dbg !199

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %q, align 4, !dbg !200
  br label %for.cond1, !dbg !200

for.cond1:                                        ; preds = %for.inc57, %for.body
  %2 = load i32* %q, align 4, !dbg !202
  %3 = load i32* %nq.addr, align 4, !dbg !206
  %cmp2 = icmp slt i32 %2, %3, !dbg !207
  br i1 %cmp2, label %for.body3, label %for.end59, !dbg !208

for.body3:                                        ; preds = %for.cond1
  store i32 0, i32* %p, align 4, !dbg !209
  br label %for.cond4, !dbg !209

for.cond4:                                        ; preds = %for.inc36, %for.body3
  %4 = load i32* %p, align 4, !dbg !212
  %5 = load i32* %np.addr, align 4, !dbg !216
  %cmp5 = icmp slt i32 %4, %5, !dbg !217
  br i1 %cmp5, label %for.body6, label %for.end38, !dbg !218

for.body6:                                        ; preds = %for.cond4
  %6 = load i32* %p, align 4, !dbg !219
  %idxprom = sext i32 %6 to i64, !dbg !221
  %7 = load i32* %q, align 4, !dbg !222
  %idxprom7 = sext i32 %7 to i64, !dbg !221
  %8 = load i32* %r, align 4, !dbg !223
  %idxprom8 = sext i32 %8 to i64, !dbg !221
  %9 = load [128 x [128 x double]]** %sum.addr, align 8, !dbg !221
  %arrayidx = getelementptr inbounds [128 x [128 x double]]* %9, i64 %idxprom8, !dbg !221
  %arrayidx9 = getelementptr inbounds [128 x [128 x double]]* %arrayidx, i32 0, i64 %idxprom7, !dbg !221
  %arrayidx10 = getelementptr inbounds [128 x double]* %arrayidx9, i32 0, i64 %idxprom, !dbg !221
  store double 0.000000e+00, double* %arrayidx10, align 8, !dbg !221
  store i32 0, i32* %s, align 4, !dbg !224
  br label %for.cond11, !dbg !224

for.cond11:                                       ; preds = %for.inc, %for.body6
  %10 = load i32* %s, align 4, !dbg !226
  %11 = load i32* %np.addr, align 4, !dbg !230
  %cmp12 = icmp slt i32 %10, %11, !dbg !231
  br i1 %cmp12, label %for.body13, label %for.end, !dbg !232

for.body13:                                       ; preds = %for.cond11
  %12 = load i32* %p, align 4, !dbg !233
  %idxprom14 = sext i32 %12 to i64, !dbg !234
  %13 = load i32* %q, align 4, !dbg !235
  %idxprom15 = sext i32 %13 to i64, !dbg !234
  %14 = load i32* %r, align 4, !dbg !236
  %idxprom16 = sext i32 %14 to i64, !dbg !234
  %15 = load [128 x [128 x double]]** %sum.addr, align 8, !dbg !234
  %arrayidx17 = getelementptr inbounds [128 x [128 x double]]* %15, i64 %idxprom16, !dbg !234
  %arrayidx18 = getelementptr inbounds [128 x [128 x double]]* %arrayidx17, i32 0, i64 %idxprom15, !dbg !234
  %arrayidx19 = getelementptr inbounds [128 x double]* %arrayidx18, i32 0, i64 %idxprom14, !dbg !234
  %16 = load double* %arrayidx19, align 8, !dbg !234
  %17 = load i32* %s, align 4, !dbg !237
  %idxprom20 = sext i32 %17 to i64, !dbg !238
  %18 = load i32* %q, align 4, !dbg !239
  %idxprom21 = sext i32 %18 to i64, !dbg !238
  %19 = load i32* %r, align 4, !dbg !240
  %idxprom22 = sext i32 %19 to i64, !dbg !238
  %20 = load [128 x [128 x double]]** %A.addr, align 8, !dbg !238
  %arrayidx23 = getelementptr inbounds [128 x [128 x double]]* %20, i64 %idxprom22, !dbg !238
  %arrayidx24 = getelementptr inbounds [128 x [128 x double]]* %arrayidx23, i32 0, i64 %idxprom21, !dbg !238
  %arrayidx25 = getelementptr inbounds [128 x double]* %arrayidx24, i32 0, i64 %idxprom20, !dbg !238
  %21 = load double* %arrayidx25, align 8, !dbg !238
  %22 = load i32* %p, align 4, !dbg !241
  %idxprom26 = sext i32 %22 to i64, !dbg !242
  %23 = load i32* %s, align 4, !dbg !243
  %idxprom27 = sext i32 %23 to i64, !dbg !242
  %24 = load [128 x double]** %C4.addr, align 8, !dbg !242
  %arrayidx28 = getelementptr inbounds [128 x double]* %24, i64 %idxprom27, !dbg !242
  %arrayidx29 = getelementptr inbounds [128 x double]* %arrayidx28, i32 0, i64 %idxprom26, !dbg !242
  %25 = load double* %arrayidx29, align 8, !dbg !242
  %mul = fmul double %21, %25, !dbg !238
  %add = fadd double %16, %mul, !dbg !234
  %26 = load i32* %p, align 4, !dbg !244
  %idxprom30 = sext i32 %26 to i64, !dbg !245
  %27 = load i32* %q, align 4, !dbg !246
  %idxprom31 = sext i32 %27 to i64, !dbg !245
  %28 = load i32* %r, align 4, !dbg !247
  %idxprom32 = sext i32 %28 to i64, !dbg !245
  %29 = load [128 x [128 x double]]** %sum.addr, align 8, !dbg !245
  %arrayidx33 = getelementptr inbounds [128 x [128 x double]]* %29, i64 %idxprom32, !dbg !245
  %arrayidx34 = getelementptr inbounds [128 x [128 x double]]* %arrayidx33, i32 0, i64 %idxprom31, !dbg !245
  %arrayidx35 = getelementptr inbounds [128 x double]* %arrayidx34, i32 0, i64 %idxprom30, !dbg !245
  store double %add, double* %arrayidx35, align 8, !dbg !245
  br label %for.inc, !dbg !245

for.inc:                                          ; preds = %for.body13
  %30 = load i32* %s, align 4, !dbg !248
  %inc = add nsw i32 %30, 1, !dbg !248
  store i32 %inc, i32* %s, align 4, !dbg !248
  br label %for.cond11, !dbg !249

for.end:                                          ; preds = %for.cond11
  br label %for.inc36, !dbg !250

for.inc36:                                        ; preds = %for.end
  %31 = load i32* %p, align 4, !dbg !251
  %inc37 = add nsw i32 %31, 1, !dbg !251
  store i32 %inc37, i32* %p, align 4, !dbg !251
  br label %for.cond4, !dbg !252

for.end38:                                        ; preds = %for.cond4
  store i32 0, i32* %p, align 4, !dbg !253
  br label %for.cond39, !dbg !253

for.cond39:                                       ; preds = %for.inc54, %for.end38
  %32 = load i32* %p, align 4, !dbg !255
  %33 = load i32* %np.addr, align 4, !dbg !259
  %cmp40 = icmp slt i32 %32, %33, !dbg !260
  br i1 %cmp40, label %for.body41, label %for.end56, !dbg !261

for.body41:                                       ; preds = %for.cond39
  %34 = load i32* %p, align 4, !dbg !262
  %idxprom42 = sext i32 %34 to i64, !dbg !263
  %35 = load i32* %q, align 4, !dbg !264
  %idxprom43 = sext i32 %35 to i64, !dbg !263
  %36 = load i32* %r, align 4, !dbg !265
  %idxprom44 = sext i32 %36 to i64, !dbg !263
  %37 = load [128 x [128 x double]]** %sum.addr, align 8, !dbg !263
  %arrayidx45 = getelementptr inbounds [128 x [128 x double]]* %37, i64 %idxprom44, !dbg !263
  %arrayidx46 = getelementptr inbounds [128 x [128 x double]]* %arrayidx45, i32 0, i64 %idxprom43, !dbg !263
  %arrayidx47 = getelementptr inbounds [128 x double]* %arrayidx46, i32 0, i64 %idxprom42, !dbg !263
  %38 = load double* %arrayidx47, align 8, !dbg !263
  %39 = load i32* %p, align 4, !dbg !266
  %idxprom48 = sext i32 %39 to i64, !dbg !267
  %40 = load i32* %q, align 4, !dbg !268
  %idxprom49 = sext i32 %40 to i64, !dbg !267
  %41 = load i32* %r, align 4, !dbg !269
  %idxprom50 = sext i32 %41 to i64, !dbg !267
  %42 = load [128 x [128 x double]]** %A.addr, align 8, !dbg !267
  %arrayidx51 = getelementptr inbounds [128 x [128 x double]]* %42, i64 %idxprom50, !dbg !267
  %arrayidx52 = getelementptr inbounds [128 x [128 x double]]* %arrayidx51, i32 0, i64 %idxprom49, !dbg !267
  %arrayidx53 = getelementptr inbounds [128 x double]* %arrayidx52, i32 0, i64 %idxprom48, !dbg !267
  store double %38, double* %arrayidx53, align 8, !dbg !267
  br label %for.inc54, !dbg !267

for.inc54:                                        ; preds = %for.body41
  %43 = load i32* %p, align 4, !dbg !270
  %inc55 = add nsw i32 %43, 1, !dbg !270
  store i32 %inc55, i32* %p, align 4, !dbg !270
  br label %for.cond39, !dbg !271

for.end56:                                        ; preds = %for.cond39
  br label %for.inc57, !dbg !272

for.inc57:                                        ; preds = %for.end56
  %44 = load i32* %q, align 4, !dbg !273
  %inc58 = add nsw i32 %44, 1, !dbg !273
  store i32 %inc58, i32* %q, align 4, !dbg !273
  br label %for.cond1, !dbg !274

for.end59:                                        ; preds = %for.cond1
  br label %for.inc60, !dbg !275

for.inc60:                                        ; preds = %for.end59
  %45 = load i32* %r, align 4, !dbg !276
  %inc61 = add nsw i32 %45, 1, !dbg !276
  store i32 %inc61, i32* %r, align 4, !dbg !276
  br label %for.cond, !dbg !277

for.end62:                                        ; preds = %for.cond
  ret void, !dbg !278
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #3

; Function Attrs: nounwind uwtable
define internal void @print_array(i32 %nr, i32 %nq, i32 %np, [128 x [128 x double]]* %A) #0 {
entry:
  %nr.addr = alloca i32, align 4
  %nq.addr = alloca i32, align 4
  %np.addr = alloca i32, align 4
  %A.addr = alloca [128 x [128 x double]]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %nr, i32* %nr.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nr.addr, metadata !279, metadata !38), !dbg !280
  store i32 %nq, i32* %nq.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nq.addr, metadata !281, metadata !38), !dbg !282
  store i32 %np, i32* %np.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %np.addr, metadata !283, metadata !38), !dbg !284
  store [128 x [128 x double]]* %A, [128 x [128 x double]]** %A.addr, align 8
  call void @llvm.dbg.declare(metadata [128 x [128 x double]]** %A.addr, metadata !285, metadata !38), !dbg !286
  call void @llvm.dbg.declare(metadata i32* %i, metadata !287, metadata !38), !dbg !288
  call void @llvm.dbg.declare(metadata i32* %j, metadata !289, metadata !38), !dbg !290
  call void @llvm.dbg.declare(metadata i32* %k, metadata !291, metadata !38), !dbg !292
  store i32 0, i32* %i, align 4, !dbg !293
  br label %for.cond, !dbg !293

for.cond:                                         ; preds = %for.inc16, %entry
  %0 = load i32* %i, align 4, !dbg !295
  %1 = load i32* %nr.addr, align 4, !dbg !299
  %cmp = icmp slt i32 %0, %1, !dbg !300
  br i1 %cmp, label %for.body, label %for.end18, !dbg !301

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !302
  br label %for.cond1, !dbg !302

for.cond1:                                        ; preds = %for.inc13, %for.body
  %2 = load i32* %j, align 4, !dbg !304
  %3 = load i32* %nq.addr, align 4, !dbg !308
  %cmp2 = icmp slt i32 %2, %3, !dbg !309
  br i1 %cmp2, label %for.body3, label %for.end15, !dbg !310

for.body3:                                        ; preds = %for.cond1
  store i32 0, i32* %k, align 4, !dbg !311
  br label %for.cond4, !dbg !311

for.cond4:                                        ; preds = %for.inc, %for.body3
  %4 = load i32* %k, align 4, !dbg !313
  %5 = load i32* %np.addr, align 4, !dbg !317
  %cmp5 = icmp slt i32 %4, %5, !dbg !318
  br i1 %cmp5, label %for.body6, label %for.end, !dbg !319

for.body6:                                        ; preds = %for.cond4
  %6 = load %struct._IO_FILE** @stderr, align 8, !dbg !320
  %7 = load i32* %k, align 4, !dbg !322
  %idxprom = sext i32 %7 to i64, !dbg !323
  %8 = load i32* %j, align 4, !dbg !324
  %idxprom7 = sext i32 %8 to i64, !dbg !323
  %9 = load i32* %i, align 4, !dbg !325
  %idxprom8 = sext i32 %9 to i64, !dbg !323
  %10 = load [128 x [128 x double]]** %A.addr, align 8, !dbg !323
  %arrayidx = getelementptr inbounds [128 x [128 x double]]* %10, i64 %idxprom8, !dbg !323
  %arrayidx9 = getelementptr inbounds [128 x [128 x double]]* %arrayidx, i32 0, i64 %idxprom7, !dbg !323
  %arrayidx10 = getelementptr inbounds [128 x double]* %arrayidx9, i32 0, i64 %idxprom, !dbg !323
  %11 = load double* %arrayidx10, align 8, !dbg !323
  %call = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([8 x i8]* @.str1, i32 0, i32 0), double %11), !dbg !326
  %12 = load i32* %i, align 4, !dbg !327
  %rem = srem i32 %12, 20, !dbg !327
  %cmp11 = icmp eq i32 %rem, 0, !dbg !327
  br i1 %cmp11, label %if.then, label %if.end, !dbg !329

if.then:                                          ; preds = %for.body6
  %13 = load %struct._IO_FILE** @stderr, align 8, !dbg !330
  %call12 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)), !dbg !332
  br label %if.end, !dbg !332

if.end:                                           ; preds = %if.then, %for.body6
  br label %for.inc, !dbg !333

for.inc:                                          ; preds = %if.end
  %14 = load i32* %k, align 4, !dbg !334
  %inc = add nsw i32 %14, 1, !dbg !334
  store i32 %inc, i32* %k, align 4, !dbg !334
  br label %for.cond4, !dbg !335

for.end:                                          ; preds = %for.cond4
  br label %for.inc13, !dbg !336

for.inc13:                                        ; preds = %for.end
  %15 = load i32* %j, align 4, !dbg !337
  %inc14 = add nsw i32 %15, 1, !dbg !337
  store i32 %inc14, i32* %j, align 4, !dbg !337
  br label %for.cond1, !dbg !338

for.end15:                                        ; preds = %for.cond1
  br label %for.inc16, !dbg !339

for.inc16:                                        ; preds = %for.end15
  %16 = load i32* %i, align 4, !dbg !340
  %inc17 = add nsw i32 %16, 1, !dbg !340
  store i32 %inc17, i32* %i, align 4, !dbg !340
  br label %for.cond, !dbg !341

for.end18:                                        ; preds = %for.cond
  %17 = load %struct._IO_FILE** @stderr, align 8, !dbg !342
  %call19 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)), !dbg !343
  ret void, !dbg !344
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
!llvm.module.flags = !{!34, !35}
!llvm.ident = !{!36}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\000\00\000\00\001", !1, !2, !3, !13, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c] [DW_LANG_C99]
!1 = !{!"doitgen.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen"}
!2 = !{}
!3 = !{!4, !9, !12, !6}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!5 = !{!"0x1\00\000\00134217728\0064\000\000\000", null, null, !6, !7, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 134217728, align 64, offset 0] [from double]
!6 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!7 = !{!8, !8, !8}
!8 = !{!"0x21\000\00128"}                         ; [ DW_TAG_subrange_type ] [0, 127]
!9 = !{!"0xf\00\000\0064\0064\000\000", null, null, !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = !{!"0x1\00\000\001048576\0064\000\000\000", null, null, !6, !11, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1048576, align 64, offset 0] [from double]
!11 = !{!8, !8}
!12 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!13 = !{!14, !22, !25, !31}
!14 = !{!"0x2e\00main\00main\00\0083\000\001\000\000\00256\000\0084", !1, !15, !16, null, i32 (i32, i8**)* @main, null, null, !2} ; [ DW_TAG_subprogram ] [line 83] [def] [scope 84] [main]
!15 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!16 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !17, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!17 = !{!18, !18, !19}
!18 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!19 = !{!"0xf\00\000\0064\0064\000\000", null, null, !20} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!20 = !{!"0xf\00\000\0064\0064\000\000", null, null, !21} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!21 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!22 = !{!"0x2e\00print_array\00print_array\00\0042\001\001\000\000\00256\000\0044", !1, !15, !23, null, void (i32, i32, i32, [128 x [128 x double]]*)* @print_array, null, null, !2} ; [ DW_TAG_subprogram ] [line 42] [local] [def] [scope 44] [print_array]
!23 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !24, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!24 = !{null, !18, !18, !18, !9}
!25 = !{!"0x2e\00kernel_doitgen\00kernel_doitgen\00\0060\001\001\000\000\00256\000\0064", !1, !15, !26, null, void (i32, i32, i32, [128 x [128 x double]]*, [128 x double]*, [128 x [128 x double]]*)* @kernel_doitgen, null, null, !2} ; [ DW_TAG_subprogram ] [line 60] [local] [def] [scope 64] [kernel_doitgen]
!26 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !27, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!27 = !{null, !18, !18, !18, !9, !28, !9}
!28 = !{!"0xf\00\000\0064\0064\000\000", null, null, !29} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!29 = !{!"0x1\00\000\008192\0064\000\000\000", null, null, !6, !30, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 8192, align 64, offset 0] [from double]
!30 = !{!8}
!31 = !{!"0x2e\00init_array\00init_array\00\0023\001\001\000\000\00256\000\0026", !1, !15, !32, null, void (i32, i32, i32, [128 x [128 x double]]*, [128 x double]*)* @init_array, null, null, !2} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [scope 26] [init_array]
!32 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !33, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!33 = !{null, !18, !18, !18, !9, !28}
!34 = !{i32 2, !"Dwarf Version", i32 4}
!35 = !{i32 2, !"Debug Info Version", i32 2}
!36 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!37 = !{!"0x101\00argc\0016777299\000", !14, !15, !18} ; [ DW_TAG_arg_variable ] [argc] [line 83]
!38 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!39 = !MDLocation(line: 83, column: 14, scope: !14)
!40 = !{!"0x101\00argv\0033554515\000", !14, !15, !19} ; [ DW_TAG_arg_variable ] [argv] [line 83]
!41 = !MDLocation(line: 83, column: 27, scope: !14)
!42 = !{!"0x100\00nr\0086\000", !14, !15, !18}    ; [ DW_TAG_auto_variable ] [nr] [line 86]
!43 = !MDLocation(line: 86, column: 7, scope: !14)
!44 = !{!"0x100\00nq\0087\000", !14, !15, !18}    ; [ DW_TAG_auto_variable ] [nq] [line 87]
!45 = !MDLocation(line: 87, column: 7, scope: !14)
!46 = !{!"0x100\00np\0088\000", !14, !15, !18}    ; [ DW_TAG_auto_variable ] [np] [line 88]
!47 = !MDLocation(line: 88, column: 7, scope: !14)
!48 = !{!"0x100\00A\0091\000", !14, !15, !4}      ; [ DW_TAG_auto_variable ] [A] [line 91]
!49 = !MDLocation(line: 91, column: 3, scope: !14)
!50 = !{!"0x100\00sum\0092\000", !14, !15, !4}    ; [ DW_TAG_auto_variable ] [sum] [line 92]
!51 = !MDLocation(line: 92, column: 3, scope: !14)
!52 = !{!"0x100\00C4\0093\000", !14, !15, !9}     ; [ DW_TAG_auto_variable ] [C4] [line 93]
!53 = !MDLocation(line: 93, column: 3, scope: !14)
!54 = !MDLocation(line: 96, column: 15, scope: !14)
!55 = !MDLocation(line: 96, column: 19, scope: !14)
!56 = !MDLocation(line: 96, column: 23, scope: !14)
!57 = !MDLocation(line: 97, column: 8, scope: !14)
!58 = !MDLocation(line: 98, column: 8, scope: !14)
!59 = !MDLocation(line: 96, column: 3, scope: !14)
!60 = !MDLocation(line: 104, column: 19, scope: !14)
!61 = !MDLocation(line: 104, column: 23, scope: !14)
!62 = !MDLocation(line: 104, column: 27, scope: !14)
!63 = !MDLocation(line: 105, column: 5, scope: !14)
!64 = !MDLocation(line: 106, column: 5, scope: !14)
!65 = !MDLocation(line: 107, column: 5, scope: !14)
!66 = !MDLocation(line: 104, column: 3, scope: !14)
!67 = !MDLocation(line: 115, column: 3, scope: !68)
!68 = !{!"0xb\00115\003\000", !1, !14}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!69 = !MDLocation(line: 115, column: 3, scope: !14)
!70 = !MDLocation(line: 115, column: 3, scope: !71)
!71 = !{!"0xb\001", !1, !68}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!72 = !MDLocation(line: 115, column: 3, scope: !73)
!73 = !{!"0xb\002", !1, !68}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!74 = !MDLocation(line: 118, column: 3, scope: !14)
!75 = !MDLocation(line: 119, column: 3, scope: !14)
!76 = !MDLocation(line: 120, column: 3, scope: !14)
!77 = !MDLocation(line: 122, column: 3, scope: !14)
!78 = !{!"0x101\00nr\0016777239\000", !31, !15, !18} ; [ DW_TAG_arg_variable ] [nr] [line 23]
!79 = !MDLocation(line: 23, column: 21, scope: !31)
!80 = !{!"0x101\00nq\0033554455\000", !31, !15, !18} ; [ DW_TAG_arg_variable ] [nq] [line 23]
!81 = !MDLocation(line: 23, column: 29, scope: !31)
!82 = !{!"0x101\00np\0050331671\000", !31, !15, !18} ; [ DW_TAG_arg_variable ] [np] [line 23]
!83 = !MDLocation(line: 23, column: 37, scope: !31)
!84 = !{!"0x101\00A\0067108888\000", !31, !15, !9} ; [ DW_TAG_arg_variable ] [A] [line 24]
!85 = !MDLocation(line: 24, column: 13, scope: !31)
!86 = !{!"0x101\00C4\0083886105\000", !31, !15, !28} ; [ DW_TAG_arg_variable ] [C4] [line 25]
!87 = !MDLocation(line: 25, column: 13, scope: !31)
!88 = !{!"0x100\00i\0027\000", !31, !15, !18}     ; [ DW_TAG_auto_variable ] [i] [line 27]
!89 = !MDLocation(line: 27, column: 7, scope: !31)
!90 = !{!"0x100\00j\0027\000", !31, !15, !18}     ; [ DW_TAG_auto_variable ] [j] [line 27]
!91 = !MDLocation(line: 27, column: 10, scope: !31)
!92 = !{!"0x100\00k\0027\000", !31, !15, !18}     ; [ DW_TAG_auto_variable ] [k] [line 27]
!93 = !MDLocation(line: 27, column: 13, scope: !31)
!94 = !MDLocation(line: 29, column: 8, scope: !95)
!95 = !{!"0xb\0029\003\0021", !1, !31}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!96 = !MDLocation(line: 29, column: 15, scope: !97)
!97 = !{!"0xb\002", !1, !98}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!98 = !{!"0xb\001", !1, !99}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!99 = !{!"0xb\0029\003\0022", !1, !95}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!100 = !MDLocation(line: 29, column: 19, scope: !99)
!101 = !MDLocation(line: 29, column: 15, scope: !99)
!102 = !MDLocation(line: 29, column: 3, scope: !95)
!103 = !MDLocation(line: 30, column: 10, scope: !104)
!104 = !{!"0xb\0030\005\0023", !1, !99}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!105 = !MDLocation(line: 30, column: 17, scope: !106)
!106 = !{!"0xb\002", !1, !107}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!107 = !{!"0xb\001", !1, !108}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!108 = !{!"0xb\0030\005\0024", !1, !104}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!109 = !MDLocation(line: 30, column: 21, scope: !108)
!110 = !MDLocation(line: 30, column: 17, scope: !108)
!111 = !MDLocation(line: 30, column: 5, scope: !104)
!112 = !MDLocation(line: 31, column: 12, scope: !113)
!113 = !{!"0xb\0031\007\0025", !1, !108}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!114 = !MDLocation(line: 31, column: 19, scope: !115)
!115 = !{!"0xb\002", !1, !116}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!116 = !{!"0xb\001", !1, !117}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!117 = !{!"0xb\0031\007\0026", !1, !113}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!118 = !MDLocation(line: 31, column: 23, scope: !117)
!119 = !MDLocation(line: 31, column: 19, scope: !117)
!120 = !MDLocation(line: 31, column: 7, scope: !113)
!121 = !MDLocation(line: 32, column: 28, scope: !117)
!122 = !MDLocation(line: 32, column: 16, scope: !117)
!123 = !MDLocation(line: 32, column: 30, scope: !117)
!124 = !MDLocation(line: 32, column: 34, scope: !117)
!125 = !MDLocation(line: 32, column: 39, scope: !117)
!126 = !MDLocation(line: 32, column: 15, scope: !117)
!127 = !MDLocation(line: 32, column: 10, scope: !117)
!128 = !MDLocation(line: 32, column: 2, scope: !117)
!129 = !MDLocation(line: 32, column: 7, scope: !117)
!130 = !MDLocation(line: 32, column: 4, scope: !117)
!131 = !MDLocation(line: 31, column: 27, scope: !117)
!132 = !MDLocation(line: 31, column: 7, scope: !117)
!133 = !MDLocation(line: 32, column: 39, scope: !113)
!134 = !MDLocation(line: 30, column: 25, scope: !108)
!135 = !MDLocation(line: 30, column: 5, scope: !108)
!136 = !MDLocation(line: 32, column: 39, scope: !104)
!137 = !MDLocation(line: 29, column: 23, scope: !99)
!138 = !MDLocation(line: 29, column: 3, scope: !99)
!139 = !MDLocation(line: 33, column: 8, scope: !140)
!140 = !{!"0xb\0033\003\0027", !1, !31}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!141 = !MDLocation(line: 33, column: 15, scope: !142)
!142 = !{!"0xb\002", !1, !143}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!143 = !{!"0xb\001", !1, !144}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!144 = !{!"0xb\0033\003\0028", !1, !140}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!145 = !MDLocation(line: 33, column: 19, scope: !144)
!146 = !MDLocation(line: 33, column: 15, scope: !144)
!147 = !MDLocation(line: 33, column: 3, scope: !140)
!148 = !MDLocation(line: 34, column: 10, scope: !149)
!149 = !{!"0xb\0034\005\0029", !1, !144}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!150 = !MDLocation(line: 34, column: 17, scope: !151)
!151 = !{!"0xb\002", !1, !152}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!152 = !{!"0xb\001", !1, !153}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!153 = !{!"0xb\0034\005\0030", !1, !149}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!154 = !MDLocation(line: 34, column: 21, scope: !153)
!155 = !MDLocation(line: 34, column: 17, scope: !153)
!156 = !MDLocation(line: 34, column: 5, scope: !149)
!157 = !MDLocation(line: 35, column: 31, scope: !153)
!158 = !MDLocation(line: 35, column: 19, scope: !153)
!159 = !MDLocation(line: 35, column: 33, scope: !153)
!160 = !MDLocation(line: 35, column: 38, scope: !153)
!161 = !MDLocation(line: 35, column: 18, scope: !153)
!162 = !MDLocation(line: 35, column: 13, scope: !153)
!163 = !MDLocation(line: 35, column: 7, scope: !153)
!164 = !MDLocation(line: 35, column: 10, scope: !153)
!165 = !MDLocation(line: 34, column: 25, scope: !153)
!166 = !MDLocation(line: 34, column: 5, scope: !153)
!167 = !MDLocation(line: 35, column: 38, scope: !149)
!168 = !MDLocation(line: 33, column: 23, scope: !144)
!169 = !MDLocation(line: 33, column: 3, scope: !144)
!170 = !MDLocation(line: 36, column: 1, scope: !31)
!171 = !{!"0x101\00nr\0016777276\000", !25, !15, !18} ; [ DW_TAG_arg_variable ] [nr] [line 60]
!172 = !MDLocation(line: 60, column: 25, scope: !25)
!173 = !{!"0x101\00nq\0033554492\000", !25, !15, !18} ; [ DW_TAG_arg_variable ] [nq] [line 60]
!174 = !MDLocation(line: 60, column: 33, scope: !25)
!175 = !{!"0x101\00np\0050331708\000", !25, !15, !18} ; [ DW_TAG_arg_variable ] [np] [line 60]
!176 = !MDLocation(line: 60, column: 41, scope: !25)
!177 = !{!"0x101\00A\0067108925\000", !25, !15, !9} ; [ DW_TAG_arg_variable ] [A] [line 61]
!178 = !MDLocation(line: 61, column: 17, scope: !25)
!179 = !{!"0x101\00C4\0083886142\000", !25, !15, !28} ; [ DW_TAG_arg_variable ] [C4] [line 62]
!180 = !MDLocation(line: 62, column: 17, scope: !25)
!181 = !{!"0x101\00sum\00100663359\000", !25, !15, !9} ; [ DW_TAG_arg_variable ] [sum] [line 63]
!182 = !MDLocation(line: 63, column: 17, scope: !25)
!183 = !{!"0x100\00r\0065\000", !25, !15, !18}    ; [ DW_TAG_auto_variable ] [r] [line 65]
!184 = !MDLocation(line: 65, column: 7, scope: !25)
!185 = !{!"0x100\00q\0065\000", !25, !15, !18}    ; [ DW_TAG_auto_variable ] [q] [line 65]
!186 = !MDLocation(line: 65, column: 10, scope: !25)
!187 = !{!"0x100\00p\0065\000", !25, !15, !18}    ; [ DW_TAG_auto_variable ] [p] [line 65]
!188 = !MDLocation(line: 65, column: 13, scope: !25)
!189 = !{!"0x100\00s\0065\000", !25, !15, !18}    ; [ DW_TAG_auto_variable ] [s] [line 65]
!190 = !MDLocation(line: 65, column: 16, scope: !25)
!191 = !MDLocation(line: 68, column: 8, scope: !192)
!192 = !{!"0xb\0068\003\009", !1, !25}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!193 = !MDLocation(line: 68, column: 15, scope: !194)
!194 = !{!"0xb\002", !1, !195}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!195 = !{!"0xb\001", !1, !196}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!196 = !{!"0xb\0068\003\0010", !1, !192}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!197 = !MDLocation(line: 68, column: 19, scope: !196)
!198 = !MDLocation(line: 68, column: 15, scope: !196)
!199 = !MDLocation(line: 68, column: 3, scope: !192)
!200 = !MDLocation(line: 69, column: 10, scope: !201)
!201 = !{!"0xb\0069\005\0011", !1, !196}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!202 = !MDLocation(line: 69, column: 17, scope: !203)
!203 = !{!"0xb\002", !1, !204}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!204 = !{!"0xb\001", !1, !205}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!205 = !{!"0xb\0069\005\0012", !1, !201}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!206 = !MDLocation(line: 69, column: 21, scope: !205)
!207 = !MDLocation(line: 69, column: 17, scope: !205)
!208 = !MDLocation(line: 69, column: 5, scope: !201)
!209 = !MDLocation(line: 70, column: 12, scope: !210)
!210 = !{!"0xb\0070\007\0014", !1, !211}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!211 = !{!"0xb\0069\0031\0013", !1, !205}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!212 = !MDLocation(line: 70, column: 19, scope: !213)
!213 = !{!"0xb\002", !1, !214}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!214 = !{!"0xb\001", !1, !215}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!215 = !{!"0xb\0070\007\0015", !1, !210}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!216 = !MDLocation(line: 70, column: 23, scope: !215)
!217 = !MDLocation(line: 70, column: 19, scope: !215)
!218 = !MDLocation(line: 70, column: 7, scope: !210)
!219 = !MDLocation(line: 71, column: 12, scope: !220)
!220 = !{!"0xb\0070\0033\0016", !1, !215}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!221 = !MDLocation(line: 71, column: 2, scope: !220)
!222 = !MDLocation(line: 71, column: 9, scope: !220)
!223 = !MDLocation(line: 71, column: 6, scope: !220)
!224 = !MDLocation(line: 72, column: 7, scope: !225)
!225 = !{!"0xb\0072\002\0017", !1, !220}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!226 = !MDLocation(line: 72, column: 14, scope: !227)
!227 = !{!"0xb\002", !1, !228}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!228 = !{!"0xb\001", !1, !229}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!229 = !{!"0xb\0072\002\0018", !1, !225}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!230 = !MDLocation(line: 72, column: 18, scope: !229)
!231 = !MDLocation(line: 72, column: 14, scope: !229)
!232 = !MDLocation(line: 72, column: 2, scope: !225)
!233 = !MDLocation(line: 73, column: 29, scope: !229)
!234 = !MDLocation(line: 73, column: 19, scope: !229)
!235 = !MDLocation(line: 73, column: 26, scope: !229)
!236 = !MDLocation(line: 73, column: 23, scope: !229)
!237 = !MDLocation(line: 73, column: 42, scope: !229)
!238 = !MDLocation(line: 73, column: 34, scope: !229)
!239 = !MDLocation(line: 73, column: 39, scope: !229)
!240 = !MDLocation(line: 73, column: 36, scope: !229)
!241 = !MDLocation(line: 73, column: 53, scope: !229)
!242 = !MDLocation(line: 73, column: 47, scope: !229)
!243 = !MDLocation(line: 73, column: 50, scope: !229)
!244 = !MDLocation(line: 73, column: 14, scope: !229)
!245 = !MDLocation(line: 73, column: 4, scope: !229)
!246 = !MDLocation(line: 73, column: 11, scope: !229)
!247 = !MDLocation(line: 73, column: 8, scope: !229)
!248 = !MDLocation(line: 72, column: 22, scope: !229)
!249 = !MDLocation(line: 72, column: 2, scope: !229)
!250 = !MDLocation(line: 74, column: 7, scope: !220)
!251 = !MDLocation(line: 70, column: 27, scope: !215)
!252 = !MDLocation(line: 70, column: 7, scope: !215)
!253 = !MDLocation(line: 75, column: 12, scope: !254)
!254 = !{!"0xb\0075\007\0019", !1, !211}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!255 = !MDLocation(line: 75, column: 19, scope: !256)
!256 = !{!"0xb\002", !1, !257}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!257 = !{!"0xb\001", !1, !258}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!258 = !{!"0xb\0075\007\0020", !1, !254}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!259 = !MDLocation(line: 75, column: 23, scope: !258)
!260 = !MDLocation(line: 75, column: 19, scope: !258)
!261 = !MDLocation(line: 75, column: 7, scope: !254)
!262 = !MDLocation(line: 76, column: 25, scope: !258)
!263 = !MDLocation(line: 76, column: 15, scope: !258)
!264 = !MDLocation(line: 76, column: 22, scope: !258)
!265 = !MDLocation(line: 76, column: 19, scope: !258)
!266 = !MDLocation(line: 76, column: 10, scope: !258)
!267 = !MDLocation(line: 76, column: 2, scope: !258)
!268 = !MDLocation(line: 76, column: 7, scope: !258)
!269 = !MDLocation(line: 76, column: 4, scope: !258)
!270 = !MDLocation(line: 75, column: 27, scope: !258)
!271 = !MDLocation(line: 75, column: 7, scope: !258)
!272 = !MDLocation(line: 77, column: 5, scope: !211)
!273 = !MDLocation(line: 69, column: 25, scope: !205)
!274 = !MDLocation(line: 69, column: 5, scope: !205)
!275 = !MDLocation(line: 77, column: 5, scope: !201)
!276 = !MDLocation(line: 68, column: 23, scope: !196)
!277 = !MDLocation(line: 68, column: 3, scope: !196)
!278 = !MDLocation(line: 80, column: 1, scope: !25)
!279 = !{!"0x101\00nr\0016777258\000", !22, !15, !18} ; [ DW_TAG_arg_variable ] [nr] [line 42]
!280 = !MDLocation(line: 42, column: 22, scope: !22)
!281 = !{!"0x101\00nq\0033554474\000", !22, !15, !18} ; [ DW_TAG_arg_variable ] [nq] [line 42]
!282 = !MDLocation(line: 42, column: 30, scope: !22)
!283 = !{!"0x101\00np\0050331690\000", !22, !15, !18} ; [ DW_TAG_arg_variable ] [np] [line 42]
!284 = !MDLocation(line: 42, column: 38, scope: !22)
!285 = !{!"0x101\00A\0067108907\000", !22, !15, !9} ; [ DW_TAG_arg_variable ] [A] [line 43]
!286 = !MDLocation(line: 43, column: 14, scope: !22)
!287 = !{!"0x100\00i\0045\000", !22, !15, !18}    ; [ DW_TAG_auto_variable ] [i] [line 45]
!288 = !MDLocation(line: 45, column: 7, scope: !22)
!289 = !{!"0x100\00j\0045\000", !22, !15, !18}    ; [ DW_TAG_auto_variable ] [j] [line 45]
!290 = !MDLocation(line: 45, column: 10, scope: !22)
!291 = !{!"0x100\00k\0045\000", !22, !15, !18}    ; [ DW_TAG_auto_variable ] [k] [line 45]
!292 = !MDLocation(line: 45, column: 13, scope: !22)
!293 = !MDLocation(line: 47, column: 8, scope: !294)
!294 = !{!"0xb\0047\003\001", !1, !22}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!295 = !MDLocation(line: 47, column: 15, scope: !296)
!296 = !{!"0xb\002", !1, !297}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!297 = !{!"0xb\001", !1, !298}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!298 = !{!"0xb\0047\003\002", !1, !294}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!299 = !MDLocation(line: 47, column: 19, scope: !298)
!300 = !MDLocation(line: 47, column: 15, scope: !298)
!301 = !MDLocation(line: 47, column: 3, scope: !294)
!302 = !MDLocation(line: 48, column: 10, scope: !303)
!303 = !{!"0xb\0048\005\003", !1, !298}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!304 = !MDLocation(line: 48, column: 17, scope: !305)
!305 = !{!"0xb\002", !1, !306}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!306 = !{!"0xb\001", !1, !307}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!307 = !{!"0xb\0048\005\004", !1, !303}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!308 = !MDLocation(line: 48, column: 21, scope: !307)
!309 = !MDLocation(line: 48, column: 17, scope: !307)
!310 = !MDLocation(line: 48, column: 5, scope: !303)
!311 = !MDLocation(line: 49, column: 12, scope: !312)
!312 = !{!"0xb\0049\007\005", !1, !307}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!313 = !MDLocation(line: 49, column: 19, scope: !314)
!314 = !{!"0xb\002", !1, !315}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!315 = !{!"0xb\001", !1, !316}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!316 = !{!"0xb\0049\007\006", !1, !312}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!317 = !MDLocation(line: 49, column: 23, scope: !316)
!318 = !MDLocation(line: 49, column: 19, scope: !316)
!319 = !MDLocation(line: 49, column: 7, scope: !312)
!320 = !MDLocation(line: 50, column: 11, scope: !321)
!321 = !{!"0xb\0049\0032\007", !1, !316}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!322 = !MDLocation(line: 50, column: 49, scope: !321)
!323 = !MDLocation(line: 50, column: 41, scope: !321)
!324 = !MDLocation(line: 50, column: 46, scope: !321)
!325 = !MDLocation(line: 50, column: 43, scope: !321)
!326 = !MDLocation(line: 50, column: 2, scope: !321)
!327 = !MDLocation(line: 51, column: 6, scope: !328)
!328 = !{!"0xb\0051\006\008", !1, !321}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!329 = !MDLocation(line: 51, column: 6, scope: !321)
!330 = !MDLocation(line: 51, column: 28, scope: !331)
!331 = !{!"0xb\001", !1, !328}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!332 = !MDLocation(line: 51, column: 19, scope: !328)
!333 = !MDLocation(line: 52, column: 7, scope: !321)
!334 = !MDLocation(line: 49, column: 27, scope: !316)
!335 = !MDLocation(line: 49, column: 7, scope: !316)
!336 = !MDLocation(line: 52, column: 7, scope: !312)
!337 = !MDLocation(line: 48, column: 25, scope: !307)
!338 = !MDLocation(line: 48, column: 5, scope: !307)
!339 = !MDLocation(line: 52, column: 7, scope: !303)
!340 = !MDLocation(line: 47, column: 23, scope: !298)
!341 = !MDLocation(line: 47, column: 3, scope: !298)
!342 = !MDLocation(line: 53, column: 12, scope: !22)
!343 = !MDLocation(line: 53, column: 3, scope: !22)
!344 = !MDLocation(line: 54, column: 1, scope: !22)
