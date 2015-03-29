; ModuleID = 'bicg.c'
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
  %s = alloca [4000 x double]*, align 8
  %q = alloca [4000 x double]*, align 8
  %p = alloca [4000 x double]*, align 8
  %r = alloca [4000 x double]*, align 8
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
  call void @llvm.dbg.declare(metadata [4000 x double]** %s, metadata !46, metadata !36), !dbg !47
  %call1 = call i8* @polybench_alloc_data(i32 4000, i32 8), !dbg !47
  %1 = bitcast i8* %call1 to [4000 x double]*, !dbg !47
  store [4000 x double]* %1, [4000 x double]** %s, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata [4000 x double]** %q, metadata !48, metadata !36), !dbg !49
  %call2 = call i8* @polybench_alloc_data(i32 4000, i32 8), !dbg !49
  %2 = bitcast i8* %call2 to [4000 x double]*, !dbg !49
  store [4000 x double]* %2, [4000 x double]** %q, align 8, !dbg !49
  call void @llvm.dbg.declare(metadata [4000 x double]** %p, metadata !50, metadata !36), !dbg !51
  %call3 = call i8* @polybench_alloc_data(i32 4000, i32 8), !dbg !51
  %3 = bitcast i8* %call3 to [4000 x double]*, !dbg !51
  store [4000 x double]* %3, [4000 x double]** %p, align 8, !dbg !51
  call void @llvm.dbg.declare(metadata [4000 x double]** %r, metadata !52, metadata !36), !dbg !53
  %call4 = call i8* @polybench_alloc_data(i32 4000, i32 8), !dbg !53
  %4 = bitcast i8* %call4 to [4000 x double]*, !dbg !53
  store [4000 x double]* %4, [4000 x double]** %r, align 8, !dbg !53
  %5 = load i32* %nx, align 4, !dbg !54
  %6 = load i32* %ny, align 4, !dbg !55
  %7 = load [4000 x [4000 x double]]** %A, align 8, !dbg !56
  %arraydecay = getelementptr inbounds [4000 x [4000 x double]]* %7, i32 0, i32 0, !dbg !56
  %8 = load [4000 x double]** %r, align 8, !dbg !57
  %arraydecay5 = getelementptr inbounds [4000 x double]* %8, i32 0, i32 0, !dbg !57
  %9 = load [4000 x double]** %p, align 8, !dbg !58
  %arraydecay6 = getelementptr inbounds [4000 x double]* %9, i32 0, i32 0, !dbg !58
  call void @init_array(i32 %5, i32 %6, [4000 x double]* %arraydecay, double* %arraydecay5, double* %arraydecay6), !dbg !59
  %10 = load i32* %nx, align 4, !dbg !60
  %11 = load i32* %ny, align 4, !dbg !61
  %12 = load [4000 x [4000 x double]]** %A, align 8, !dbg !62
  %arraydecay7 = getelementptr inbounds [4000 x [4000 x double]]* %12, i32 0, i32 0, !dbg !62
  %13 = load [4000 x double]** %s, align 8, !dbg !63
  %arraydecay8 = getelementptr inbounds [4000 x double]* %13, i32 0, i32 0, !dbg !63
  %14 = load [4000 x double]** %q, align 8, !dbg !64
  %arraydecay9 = getelementptr inbounds [4000 x double]* %14, i32 0, i32 0, !dbg !64
  %15 = load [4000 x double]** %p, align 8, !dbg !65
  %arraydecay10 = getelementptr inbounds [4000 x double]* %15, i32 0, i32 0, !dbg !65
  %16 = load [4000 x double]** %r, align 8, !dbg !66
  %arraydecay11 = getelementptr inbounds [4000 x double]* %16, i32 0, i32 0, !dbg !66
  call void @kernel_bicg(i32 %10, i32 %11, [4000 x double]* %arraydecay7, double* %arraydecay8, double* %arraydecay9, double* %arraydecay10, double* %arraydecay11), !dbg !67
  %17 = load i32* %argc.addr, align 4, !dbg !68
  %cmp = icmp sgt i32 %17, 42, !dbg !68
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !70

land.lhs.true:                                    ; preds = %entry
  %18 = load i8*** %argv.addr, align 8, !dbg !71
  %arrayidx = getelementptr inbounds i8** %18, i64 0, !dbg !71
  %19 = load i8** %arrayidx, align 8, !dbg !71
  %call12 = call i32 @strcmp(i8* %19, i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0)) #5, !dbg !71
  %tobool = icmp ne i32 %call12, 0, !dbg !70
  br i1 %tobool, label %if.end, label %if.then, !dbg !70

if.then:                                          ; preds = %land.lhs.true
  %20 = load i32* %nx, align 4, !dbg !73
  %21 = load i32* %ny, align 4, !dbg !73
  %22 = load [4000 x double]** %s, align 8, !dbg !73
  %arraydecay13 = getelementptr inbounds [4000 x double]* %22, i32 0, i32 0, !dbg !73
  %23 = load [4000 x double]** %q, align 8, !dbg !73
  %arraydecay14 = getelementptr inbounds [4000 x double]* %23, i32 0, i32 0, !dbg !73
  call void @print_array(i32 %20, i32 %21, double* %arraydecay13, double* %arraydecay14), !dbg !73
  br label %if.end, !dbg !73

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %24 = load [4000 x [4000 x double]]** %A, align 8, !dbg !75
  %25 = bitcast [4000 x [4000 x double]]* %24 to i8*, !dbg !75
  call void @free(i8* %25) #6, !dbg !75
  %26 = load [4000 x double]** %s, align 8, !dbg !76
  %27 = bitcast [4000 x double]* %26 to i8*, !dbg !76
  call void @free(i8* %27) #6, !dbg !76
  %28 = load [4000 x double]** %q, align 8, !dbg !77
  %29 = bitcast [4000 x double]* %28 to i8*, !dbg !77
  call void @free(i8* %29) #6, !dbg !77
  %30 = load [4000 x double]** %p, align 8, !dbg !78
  %31 = bitcast [4000 x double]* %30 to i8*, !dbg !78
  call void @free(i8* %31) #6, !dbg !78
  %32 = load [4000 x double]** %r, align 8, !dbg !79
  %33 = bitcast [4000 x double]* %32 to i8*, !dbg !79
  call void @free(i8* %33) #6, !dbg !79
  ret i32 0, !dbg !80
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i8* @polybench_alloc_data(i32, i32) #2

; Function Attrs: nounwind uwtable
define internal void @init_array(i32 %nx, i32 %ny, [4000 x double]* %A, double* %r, double* %p) #0 {
entry:
  %nx.addr = alloca i32, align 4
  %ny.addr = alloca i32, align 4
  %A.addr = alloca [4000 x double]*, align 8
  %r.addr = alloca double*, align 8
  %p.addr = alloca double*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %nx, i32* %nx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nx.addr, metadata !81, metadata !36), !dbg !82
  store i32 %ny, i32* %ny.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ny.addr, metadata !83, metadata !36), !dbg !84
  store [4000 x double]* %A, [4000 x double]** %A.addr, align 8
  call void @llvm.dbg.declare(metadata [4000 x double]** %A.addr, metadata !85, metadata !36), !dbg !86
  store double* %r, double** %r.addr, align 8
  call void @llvm.dbg.declare(metadata double** %r.addr, metadata !87, metadata !36), !dbg !88
  store double* %p, double** %p.addr, align 8
  call void @llvm.dbg.declare(metadata double** %p.addr, metadata !89, metadata !36), !dbg !90
  call void @llvm.dbg.declare(metadata i32* %i, metadata !91, metadata !36), !dbg !92
  call void @llvm.dbg.declare(metadata i32* %j, metadata !93, metadata !36), !dbg !94
  store i32 0, i32* %i, align 4, !dbg !95
  br label %for.cond, !dbg !95

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4, !dbg !97
  %1 = load i32* %ny.addr, align 4, !dbg !101
  %cmp = icmp slt i32 %0, %1, !dbg !102
  br i1 %cmp, label %for.body, label %for.end, !dbg !103

for.body:                                         ; preds = %for.cond
  %2 = load i32* %i, align 4, !dbg !104
  %conv = sitofp i32 %2 to double, !dbg !104
  %mul = fmul double %conv, 0x400921FB54442D18, !dbg !104
  %3 = load i32* %i, align 4, !dbg !105
  %idxprom = sext i32 %3 to i64, !dbg !106
  %4 = load double** %p.addr, align 8, !dbg !106
  %arrayidx = getelementptr inbounds double* %4, i64 %idxprom, !dbg !106
  store double %mul, double* %arrayidx, align 8, !dbg !106
  br label %for.inc, !dbg !106

for.inc:                                          ; preds = %for.body
  %5 = load i32* %i, align 4, !dbg !107
  %inc = add nsw i32 %5, 1, !dbg !107
  store i32 %inc, i32* %i, align 4, !dbg !107
  br label %for.cond, !dbg !108

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !109
  br label %for.cond1, !dbg !109

for.cond1:                                        ; preds = %for.inc24, %for.end
  %6 = load i32* %i, align 4, !dbg !111
  %7 = load i32* %nx.addr, align 4, !dbg !115
  %cmp2 = icmp slt i32 %6, %7, !dbg !116
  br i1 %cmp2, label %for.body4, label %for.end26, !dbg !117

for.body4:                                        ; preds = %for.cond1
  %8 = load i32* %i, align 4, !dbg !118
  %conv5 = sitofp i32 %8 to double, !dbg !118
  %mul6 = fmul double %conv5, 0x400921FB54442D18, !dbg !118
  %9 = load i32* %i, align 4, !dbg !120
  %idxprom7 = sext i32 %9 to i64, !dbg !121
  %10 = load double** %r.addr, align 8, !dbg !121
  %arrayidx8 = getelementptr inbounds double* %10, i64 %idxprom7, !dbg !121
  store double %mul6, double* %arrayidx8, align 8, !dbg !121
  store i32 0, i32* %j, align 4, !dbg !122
  br label %for.cond9, !dbg !122

for.cond9:                                        ; preds = %for.inc21, %for.body4
  %11 = load i32* %j, align 4, !dbg !124
  %12 = load i32* %ny.addr, align 4, !dbg !128
  %cmp10 = icmp slt i32 %11, %12, !dbg !129
  br i1 %cmp10, label %for.body12, label %for.end23, !dbg !130

for.body12:                                       ; preds = %for.cond9
  %13 = load i32* %i, align 4, !dbg !131
  %conv13 = sitofp i32 %13 to double, !dbg !132
  %14 = load i32* %j, align 4, !dbg !133
  %add = add nsw i32 %14, 1, !dbg !133
  %conv14 = sitofp i32 %add to double, !dbg !134
  %mul15 = fmul double %conv13, %conv14, !dbg !132
  %15 = load i32* %nx.addr, align 4, !dbg !135
  %conv16 = sitofp i32 %15 to double, !dbg !135
  %div = fdiv double %mul15, %conv16, !dbg !136
  %16 = load i32* %j, align 4, !dbg !137
  %idxprom17 = sext i32 %16 to i64, !dbg !138
  %17 = load i32* %i, align 4, !dbg !139
  %idxprom18 = sext i32 %17 to i64, !dbg !138
  %18 = load [4000 x double]** %A.addr, align 8, !dbg !138
  %arrayidx19 = getelementptr inbounds [4000 x double]* %18, i64 %idxprom18, !dbg !138
  %arrayidx20 = getelementptr inbounds [4000 x double]* %arrayidx19, i32 0, i64 %idxprom17, !dbg !138
  store double %div, double* %arrayidx20, align 8, !dbg !138
  br label %for.inc21, !dbg !138

for.inc21:                                        ; preds = %for.body12
  %19 = load i32* %j, align 4, !dbg !140
  %inc22 = add nsw i32 %19, 1, !dbg !140
  store i32 %inc22, i32* %j, align 4, !dbg !140
  br label %for.cond9, !dbg !141

for.end23:                                        ; preds = %for.cond9
  br label %for.inc24, !dbg !142

for.inc24:                                        ; preds = %for.end23
  %20 = load i32* %i, align 4, !dbg !143
  %inc25 = add nsw i32 %20, 1, !dbg !143
  store i32 %inc25, i32* %i, align 4, !dbg !143
  br label %for.cond1, !dbg !144

for.end26:                                        ; preds = %for.cond1
  ret void, !dbg !145
}

; Function Attrs: nounwind uwtable
define internal void @kernel_bicg(i32 %nx, i32 %ny, [4000 x double]* %A, double* %s, double* %q, double* %p, double* %r) #0 {
entry:
  %nx.addr = alloca i32, align 4
  %ny.addr = alloca i32, align 4
  %A.addr = alloca [4000 x double]*, align 8
  %s.addr = alloca double*, align 8
  %q.addr = alloca double*, align 8
  %p.addr = alloca double*, align 8
  %r.addr = alloca double*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %nx, i32* %nx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nx.addr, metadata !146, metadata !36), !dbg !147
  store i32 %ny, i32* %ny.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ny.addr, metadata !148, metadata !36), !dbg !149
  store [4000 x double]* %A, [4000 x double]** %A.addr, align 8
  call void @llvm.dbg.declare(metadata [4000 x double]** %A.addr, metadata !150, metadata !36), !dbg !151
  store double* %s, double** %s.addr, align 8
  call void @llvm.dbg.declare(metadata double** %s.addr, metadata !152, metadata !36), !dbg !153
  store double* %q, double** %q.addr, align 8
  call void @llvm.dbg.declare(metadata double** %q.addr, metadata !154, metadata !36), !dbg !155
  store double* %p, double** %p.addr, align 8
  call void @llvm.dbg.declare(metadata double** %p.addr, metadata !156, metadata !36), !dbg !157
  store double* %r, double** %r.addr, align 8
  call void @llvm.dbg.declare(metadata double** %r.addr, metadata !158, metadata !36), !dbg !159
  call void @llvm.dbg.declare(metadata i32* %i, metadata !160, metadata !36), !dbg !161
  call void @llvm.dbg.declare(metadata i32* %j, metadata !162, metadata !36), !dbg !163
  store i32 0, i32* %i, align 4, !dbg !164
  br label %for.cond, !dbg !164

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4, !dbg !166
  %1 = load i32* %ny.addr, align 4, !dbg !170
  %cmp = icmp slt i32 %0, %1, !dbg !171
  br i1 %cmp, label %for.body, label %for.end, !dbg !172

for.body:                                         ; preds = %for.cond
  %2 = load i32* %i, align 4, !dbg !173
  %idxprom = sext i32 %2 to i64, !dbg !174
  %3 = load double** %s.addr, align 8, !dbg !174
  %arrayidx = getelementptr inbounds double* %3, i64 %idxprom, !dbg !174
  store double 0.000000e+00, double* %arrayidx, align 8, !dbg !174
  br label %for.inc, !dbg !174

for.inc:                                          ; preds = %for.body
  %4 = load i32* %i, align 4, !dbg !175
  %inc = add nsw i32 %4, 1, !dbg !175
  store i32 %inc, i32* %i, align 4, !dbg !175
  br label %for.cond, !dbg !176

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !177
  br label %for.cond1, !dbg !177

for.cond1:                                        ; preds = %for.inc34, %for.end
  %5 = load i32* %i, align 4, !dbg !179
  %6 = load i32* %nx.addr, align 4, !dbg !183
  %cmp2 = icmp slt i32 %5, %6, !dbg !184
  br i1 %cmp2, label %for.body3, label %for.end36, !dbg !185

for.body3:                                        ; preds = %for.cond1
  %7 = load i32* %i, align 4, !dbg !186
  %idxprom4 = sext i32 %7 to i64, !dbg !188
  %8 = load double** %q.addr, align 8, !dbg !188
  %arrayidx5 = getelementptr inbounds double* %8, i64 %idxprom4, !dbg !188
  store double 0.000000e+00, double* %arrayidx5, align 8, !dbg !188
  store i32 0, i32* %j, align 4, !dbg !189
  br label %for.cond6, !dbg !189

for.cond6:                                        ; preds = %for.inc31, %for.body3
  %9 = load i32* %j, align 4, !dbg !191
  %10 = load i32* %ny.addr, align 4, !dbg !195
  %cmp7 = icmp slt i32 %9, %10, !dbg !196
  br i1 %cmp7, label %for.body8, label %for.end33, !dbg !197

for.body8:                                        ; preds = %for.cond6
  %11 = load i32* %j, align 4, !dbg !198
  %idxprom9 = sext i32 %11 to i64, !dbg !200
  %12 = load double** %s.addr, align 8, !dbg !200
  %arrayidx10 = getelementptr inbounds double* %12, i64 %idxprom9, !dbg !200
  %13 = load double* %arrayidx10, align 8, !dbg !200
  %14 = load i32* %i, align 4, !dbg !201
  %idxprom11 = sext i32 %14 to i64, !dbg !202
  %15 = load double** %r.addr, align 8, !dbg !202
  %arrayidx12 = getelementptr inbounds double* %15, i64 %idxprom11, !dbg !202
  %16 = load double* %arrayidx12, align 8, !dbg !202
  %17 = load i32* %j, align 4, !dbg !203
  %idxprom13 = sext i32 %17 to i64, !dbg !204
  %18 = load i32* %i, align 4, !dbg !205
  %idxprom14 = sext i32 %18 to i64, !dbg !204
  %19 = load [4000 x double]** %A.addr, align 8, !dbg !204
  %arrayidx15 = getelementptr inbounds [4000 x double]* %19, i64 %idxprom14, !dbg !204
  %arrayidx16 = getelementptr inbounds [4000 x double]* %arrayidx15, i32 0, i64 %idxprom13, !dbg !204
  %20 = load double* %arrayidx16, align 8, !dbg !204
  %mul = fmul double %16, %20, !dbg !202
  %add = fadd double %13, %mul, !dbg !200
  %21 = load i32* %j, align 4, !dbg !206
  %idxprom17 = sext i32 %21 to i64, !dbg !207
  %22 = load double** %s.addr, align 8, !dbg !207
  %arrayidx18 = getelementptr inbounds double* %22, i64 %idxprom17, !dbg !207
  store double %add, double* %arrayidx18, align 8, !dbg !207
  %23 = load i32* %i, align 4, !dbg !208
  %idxprom19 = sext i32 %23 to i64, !dbg !209
  %24 = load double** %q.addr, align 8, !dbg !209
  %arrayidx20 = getelementptr inbounds double* %24, i64 %idxprom19, !dbg !209
  %25 = load double* %arrayidx20, align 8, !dbg !209
  %26 = load i32* %j, align 4, !dbg !210
  %idxprom21 = sext i32 %26 to i64, !dbg !211
  %27 = load i32* %i, align 4, !dbg !212
  %idxprom22 = sext i32 %27 to i64, !dbg !211
  %28 = load [4000 x double]** %A.addr, align 8, !dbg !211
  %arrayidx23 = getelementptr inbounds [4000 x double]* %28, i64 %idxprom22, !dbg !211
  %arrayidx24 = getelementptr inbounds [4000 x double]* %arrayidx23, i32 0, i64 %idxprom21, !dbg !211
  %29 = load double* %arrayidx24, align 8, !dbg !211
  %30 = load i32* %j, align 4, !dbg !213
  %idxprom25 = sext i32 %30 to i64, !dbg !214
  %31 = load double** %p.addr, align 8, !dbg !214
  %arrayidx26 = getelementptr inbounds double* %31, i64 %idxprom25, !dbg !214
  %32 = load double* %arrayidx26, align 8, !dbg !214
  %mul27 = fmul double %29, %32, !dbg !211
  %add28 = fadd double %25, %mul27, !dbg !209
  %33 = load i32* %i, align 4, !dbg !215
  %idxprom29 = sext i32 %33 to i64, !dbg !216
  %34 = load double** %q.addr, align 8, !dbg !216
  %arrayidx30 = getelementptr inbounds double* %34, i64 %idxprom29, !dbg !216
  store double %add28, double* %arrayidx30, align 8, !dbg !216
  br label %for.inc31, !dbg !217

for.inc31:                                        ; preds = %for.body8
  %35 = load i32* %j, align 4, !dbg !218
  %inc32 = add nsw i32 %35, 1, !dbg !218
  store i32 %inc32, i32* %j, align 4, !dbg !218
  br label %for.cond6, !dbg !219

for.end33:                                        ; preds = %for.cond6
  br label %for.inc34, !dbg !220

for.inc34:                                        ; preds = %for.end33
  %36 = load i32* %i, align 4, !dbg !221
  %inc35 = add nsw i32 %36, 1, !dbg !221
  store i32 %inc35, i32* %i, align 4, !dbg !221
  br label %for.cond1, !dbg !222

for.end36:                                        ; preds = %for.cond1
  ret void, !dbg !223
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #3

; Function Attrs: nounwind uwtable
define internal void @print_array(i32 %nx, i32 %ny, double* %s, double* %q) #0 {
entry:
  %nx.addr = alloca i32, align 4
  %ny.addr = alloca i32, align 4
  %s.addr = alloca double*, align 8
  %q.addr = alloca double*, align 8
  %i = alloca i32, align 4
  store i32 %nx, i32* %nx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nx.addr, metadata !224, metadata !36), !dbg !225
  store i32 %ny, i32* %ny.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ny.addr, metadata !226, metadata !36), !dbg !227
  store double* %s, double** %s.addr, align 8
  call void @llvm.dbg.declare(metadata double** %s.addr, metadata !228, metadata !36), !dbg !229
  store double* %q, double** %q.addr, align 8
  call void @llvm.dbg.declare(metadata double** %q.addr, metadata !230, metadata !36), !dbg !231
  call void @llvm.dbg.declare(metadata i32* %i, metadata !232, metadata !36), !dbg !233
  store i32 0, i32* %i, align 4, !dbg !234
  br label %for.cond, !dbg !234

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4, !dbg !236
  %1 = load i32* %ny.addr, align 4, !dbg !240
  %cmp = icmp slt i32 %0, %1, !dbg !241
  br i1 %cmp, label %for.body, label %for.end, !dbg !242

for.body:                                         ; preds = %for.cond
  %2 = load %struct._IO_FILE** @stderr, align 8, !dbg !243
  %3 = load i32* %i, align 4, !dbg !245
  %idxprom = sext i32 %3 to i64, !dbg !246
  %4 = load double** %s.addr, align 8, !dbg !246
  %arrayidx = getelementptr inbounds double* %4, i64 %idxprom, !dbg !246
  %5 = load double* %arrayidx, align 8, !dbg !246
  %call = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([8 x i8]* @.str1, i32 0, i32 0), double %5), !dbg !247
  %6 = load i32* %i, align 4, !dbg !248
  %rem = srem i32 %6, 20, !dbg !248
  %cmp1 = icmp eq i32 %rem, 0, !dbg !248
  br i1 %cmp1, label %if.then, label %if.end, !dbg !250

if.then:                                          ; preds = %for.body
  %7 = load %struct._IO_FILE** @stderr, align 8, !dbg !251
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)), !dbg !253
  br label %if.end, !dbg !253

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc, !dbg !254

for.inc:                                          ; preds = %if.end
  %8 = load i32* %i, align 4, !dbg !255
  %inc = add nsw i32 %8, 1, !dbg !255
  store i32 %inc, i32* %i, align 4, !dbg !255
  br label %for.cond, !dbg !256

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !257
  br label %for.cond3, !dbg !257

for.cond3:                                        ; preds = %for.inc14, %for.end
  %9 = load i32* %i, align 4, !dbg !259
  %10 = load i32* %nx.addr, align 4, !dbg !263
  %cmp4 = icmp slt i32 %9, %10, !dbg !264
  br i1 %cmp4, label %for.body5, label %for.end16, !dbg !265

for.body5:                                        ; preds = %for.cond3
  %11 = load %struct._IO_FILE** @stderr, align 8, !dbg !266
  %12 = load i32* %i, align 4, !dbg !268
  %idxprom6 = sext i32 %12 to i64, !dbg !269
  %13 = load double** %q.addr, align 8, !dbg !269
  %arrayidx7 = getelementptr inbounds double* %13, i64 %idxprom6, !dbg !269
  %14 = load double* %arrayidx7, align 8, !dbg !269
  %call8 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8]* @.str1, i32 0, i32 0), double %14), !dbg !270
  %15 = load i32* %i, align 4, !dbg !271
  %rem9 = srem i32 %15, 20, !dbg !271
  %cmp10 = icmp eq i32 %rem9, 0, !dbg !271
  br i1 %cmp10, label %if.then11, label %if.end13, !dbg !273

if.then11:                                        ; preds = %for.body5
  %16 = load %struct._IO_FILE** @stderr, align 8, !dbg !274
  %call12 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)), !dbg !276
  br label %if.end13, !dbg !276

if.end13:                                         ; preds = %if.then11, %for.body5
  br label %for.inc14, !dbg !277

for.inc14:                                        ; preds = %if.end13
  %17 = load i32* %i, align 4, !dbg !278
  %inc15 = add nsw i32 %17, 1, !dbg !278
  store i32 %inc15, i32* %i, align 4, !dbg !278
  br label %for.cond3, !dbg !279

for.end16:                                        ; preds = %for.cond3
  %18 = load %struct._IO_FILE** @stderr, align 8, !dbg !280
  %call17 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)), !dbg !281
  ret void, !dbg !282
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

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\000\00\000\00\001", !1, !2, !3, !13, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c] [DW_LANG_C99]
!1 = !{!"bicg.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg"}
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
!14 = !{!"0x2e\00main\00main\00\0091\000\001\000\000\00256\000\0092", !1, !15, !16, null, i32 (i32, i8**)* @main, null, null, !2} ; [ DW_TAG_subprogram ] [line 91] [def] [scope 92] [main]
!15 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!16 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !17, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!17 = !{!18, !18, !19}
!18 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!19 = !{!"0xf\00\000\0064\0064\000\000", null, null, !20} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!20 = !{!"0xf\00\000\0064\0064\000\000", null, null, !21} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!21 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!22 = !{!"0x2e\00print_array\00print_array\00\0043\001\001\000\000\00256\000\0047", !1, !15, !23, null, void (i32, i32, double*, double*)* @print_array, null, null, !2} ; [ DW_TAG_subprogram ] [line 43] [local] [def] [scope 47] [print_array]
!23 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !24, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!24 = !{null, !18, !18, !25, !25}
!25 = !{!"0xf\00\000\0064\0064\000\000", null, null, !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!26 = !{!"0x2e\00kernel_bicg\00kernel_bicg\00\0065\001\001\000\000\00256\000\0071", !1, !15, !27, null, void (i32, i32, [4000 x double]*, double*, double*, double*, double*)* @kernel_bicg, null, null, !2} ; [ DW_TAG_subprogram ] [line 65] [local] [def] [scope 71] [kernel_bicg]
!27 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !28, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!28 = !{null, !18, !18, !9, !25, !25, !25, !25}
!29 = !{!"0x2e\00init_array\00init_array\00\0023\001\001\000\000\00256\000\0027", !1, !15, !30, null, void (i32, i32, [4000 x double]*, double*, double*)* @init_array, null, null, !2} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [scope 27] [init_array]
!30 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !31, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!31 = !{null, !18, !18, !9, !25, !25}
!32 = !{i32 2, !"Dwarf Version", i32 4}
!33 = !{i32 2, !"Debug Info Version", i32 2}
!34 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!35 = !{!"0x101\00argc\0016777307\000", !14, !15, !18} ; [ DW_TAG_arg_variable ] [argc] [line 91]
!36 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!37 = !MDLocation(line: 91, column: 14, scope: !14)
!38 = !{!"0x101\00argv\0033554523\000", !14, !15, !19} ; [ DW_TAG_arg_variable ] [argv] [line 91]
!39 = !MDLocation(line: 91, column: 27, scope: !14)
!40 = !{!"0x100\00nx\0094\000", !14, !15, !18}    ; [ DW_TAG_auto_variable ] [nx] [line 94]
!41 = !MDLocation(line: 94, column: 7, scope: !14)
!42 = !{!"0x100\00ny\0095\000", !14, !15, !18}    ; [ DW_TAG_auto_variable ] [ny] [line 95]
!43 = !MDLocation(line: 95, column: 7, scope: !14)
!44 = !{!"0x100\00A\0098\000", !14, !15, !4}      ; [ DW_TAG_auto_variable ] [A] [line 98]
!45 = !MDLocation(line: 98, column: 3, scope: !14)
!46 = !{!"0x100\00s\0099\000", !14, !15, !9}      ; [ DW_TAG_auto_variable ] [s] [line 99]
!47 = !MDLocation(line: 99, column: 3, scope: !14)
!48 = !{!"0x100\00q\00100\000", !14, !15, !9}     ; [ DW_TAG_auto_variable ] [q] [line 100]
!49 = !MDLocation(line: 100, column: 3, scope: !14)
!50 = !{!"0x100\00p\00101\000", !14, !15, !9}     ; [ DW_TAG_auto_variable ] [p] [line 101]
!51 = !MDLocation(line: 101, column: 3, scope: !14)
!52 = !{!"0x100\00r\00102\000", !14, !15, !9}     ; [ DW_TAG_auto_variable ] [r] [line 102]
!53 = !MDLocation(line: 102, column: 3, scope: !14)
!54 = !MDLocation(line: 105, column: 15, scope: !14)
!55 = !MDLocation(line: 105, column: 19, scope: !14)
!56 = !MDLocation(line: 106, column: 8, scope: !14)
!57 = !MDLocation(line: 107, column: 8, scope: !14)
!58 = !MDLocation(line: 108, column: 8, scope: !14)
!59 = !MDLocation(line: 105, column: 3, scope: !14)
!60 = !MDLocation(line: 114, column: 16, scope: !14)
!61 = !MDLocation(line: 114, column: 20, scope: !14)
!62 = !MDLocation(line: 115, column: 9, scope: !14)
!63 = !MDLocation(line: 116, column: 9, scope: !14)
!64 = !MDLocation(line: 117, column: 9, scope: !14)
!65 = !MDLocation(line: 118, column: 9, scope: !14)
!66 = !MDLocation(line: 119, column: 9, scope: !14)
!67 = !MDLocation(line: 114, column: 3, scope: !14)
!68 = !MDLocation(line: 127, column: 3, scope: !69)
!69 = !{!"0xb\00127\003\000", !1, !14}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!70 = !MDLocation(line: 127, column: 3, scope: !14)
!71 = !MDLocation(line: 127, column: 3, scope: !72)
!72 = !{!"0xb\001", !1, !69}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!73 = !MDLocation(line: 127, column: 3, scope: !74)
!74 = !{!"0xb\002", !1, !69}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!75 = !MDLocation(line: 130, column: 3, scope: !14)
!76 = !MDLocation(line: 131, column: 3, scope: !14)
!77 = !MDLocation(line: 132, column: 3, scope: !14)
!78 = !MDLocation(line: 133, column: 3, scope: !14)
!79 = !MDLocation(line: 134, column: 3, scope: !14)
!80 = !MDLocation(line: 136, column: 3, scope: !14)
!81 = !{!"0x101\00nx\0016777239\000", !29, !15, !18} ; [ DW_TAG_arg_variable ] [nx] [line 23]
!82 = !MDLocation(line: 23, column: 22, scope: !29)
!83 = !{!"0x101\00ny\0033554455\000", !29, !15, !18} ; [ DW_TAG_arg_variable ] [ny] [line 23]
!84 = !MDLocation(line: 23, column: 30, scope: !29)
!85 = !{!"0x101\00A\0050331672\000", !29, !15, !9} ; [ DW_TAG_arg_variable ] [A] [line 24]
!86 = !MDLocation(line: 24, column: 14, scope: !29)
!87 = !{!"0x101\00r\0067108889\000", !29, !15, !25} ; [ DW_TAG_arg_variable ] [r] [line 25]
!88 = !MDLocation(line: 25, column: 14, scope: !29)
!89 = !{!"0x101\00p\0083886106\000", !29, !15, !25} ; [ DW_TAG_arg_variable ] [p] [line 26]
!90 = !MDLocation(line: 26, column: 14, scope: !29)
!91 = !{!"0x100\00i\0028\000", !29, !15, !18}     ; [ DW_TAG_auto_variable ] [i] [line 28]
!92 = !MDLocation(line: 28, column: 7, scope: !29)
!93 = !{!"0x100\00j\0028\000", !29, !15, !18}     ; [ DW_TAG_auto_variable ] [j] [line 28]
!94 = !MDLocation(line: 28, column: 10, scope: !29)
!95 = !MDLocation(line: 30, column: 8, scope: !96)
!96 = !{!"0xb\0030\003\0017", !1, !29}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!97 = !MDLocation(line: 30, column: 15, scope: !98)
!98 = !{!"0xb\002", !1, !99}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!99 = !{!"0xb\001", !1, !100}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!100 = !{!"0xb\0030\003\0018", !1, !96}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!101 = !MDLocation(line: 30, column: 19, scope: !100)
!102 = !MDLocation(line: 30, column: 15, scope: !100)
!103 = !MDLocation(line: 30, column: 3, scope: !96)
!104 = !MDLocation(line: 31, column: 12, scope: !100)
!105 = !MDLocation(line: 31, column: 7, scope: !100)
!106 = !MDLocation(line: 31, column: 5, scope: !100)
!107 = !MDLocation(line: 30, column: 23, scope: !100)
!108 = !MDLocation(line: 30, column: 3, scope: !100)
!109 = !MDLocation(line: 32, column: 8, scope: !110)
!110 = !{!"0xb\0032\003\0019", !1, !29}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!111 = !MDLocation(line: 32, column: 15, scope: !112)
!112 = !{!"0xb\002", !1, !113}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!113 = !{!"0xb\001", !1, !114}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!114 = !{!"0xb\0032\003\0020", !1, !110}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!115 = !MDLocation(line: 32, column: 19, scope: !114)
!116 = !MDLocation(line: 32, column: 15, scope: !114)
!117 = !MDLocation(line: 32, column: 3, scope: !110)
!118 = !MDLocation(line: 33, column: 12, scope: !119)
!119 = !{!"0xb\0032\0028\0021", !1, !114}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!120 = !MDLocation(line: 33, column: 7, scope: !119)
!121 = !MDLocation(line: 33, column: 5, scope: !119)
!122 = !MDLocation(line: 34, column: 10, scope: !123)
!123 = !{!"0xb\0034\005\0022", !1, !119}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!124 = !MDLocation(line: 34, column: 17, scope: !125)
!125 = !{!"0xb\002", !1, !126}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!126 = !{!"0xb\001", !1, !127}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!127 = !{!"0xb\0034\005\0023", !1, !123}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!128 = !MDLocation(line: 34, column: 21, scope: !127)
!129 = !MDLocation(line: 34, column: 17, scope: !127)
!130 = !MDLocation(line: 34, column: 5, scope: !123)
!131 = !MDLocation(line: 35, column: 30, scope: !127)
!132 = !MDLocation(line: 35, column: 18, scope: !127)
!133 = !MDLocation(line: 35, column: 33, scope: !127)
!134 = !MDLocation(line: 35, column: 32, scope: !127)
!135 = !MDLocation(line: 35, column: 39, scope: !127)
!136 = !MDLocation(line: 35, column: 17, scope: !127)
!137 = !MDLocation(line: 35, column: 12, scope: !127)
!138 = !MDLocation(line: 35, column: 7, scope: !127)
!139 = !MDLocation(line: 35, column: 9, scope: !127)
!140 = !MDLocation(line: 34, column: 25, scope: !127)
!141 = !MDLocation(line: 34, column: 5, scope: !127)
!142 = !MDLocation(line: 36, column: 3, scope: !119)
!143 = !MDLocation(line: 32, column: 23, scope: !114)
!144 = !MDLocation(line: 32, column: 3, scope: !114)
!145 = !MDLocation(line: 37, column: 1, scope: !29)
!146 = !{!"0x101\00nx\0016777281\000", !26, !15, !18} ; [ DW_TAG_arg_variable ] [nx] [line 65]
!147 = !MDLocation(line: 65, column: 22, scope: !26)
!148 = !{!"0x101\00ny\0033554497\000", !26, !15, !18} ; [ DW_TAG_arg_variable ] [ny] [line 65]
!149 = !MDLocation(line: 65, column: 30, scope: !26)
!150 = !{!"0x101\00A\0050331714\000", !26, !15, !9} ; [ DW_TAG_arg_variable ] [A] [line 66]
!151 = !MDLocation(line: 66, column: 14, scope: !26)
!152 = !{!"0x101\00s\0067108931\000", !26, !15, !25} ; [ DW_TAG_arg_variable ] [s] [line 67]
!153 = !MDLocation(line: 67, column: 14, scope: !26)
!154 = !{!"0x101\00q\0083886148\000", !26, !15, !25} ; [ DW_TAG_arg_variable ] [q] [line 68]
!155 = !MDLocation(line: 68, column: 14, scope: !26)
!156 = !{!"0x101\00p\00100663365\000", !26, !15, !25} ; [ DW_TAG_arg_variable ] [p] [line 69]
!157 = !MDLocation(line: 69, column: 14, scope: !26)
!158 = !{!"0x101\00r\00117440582\000", !26, !15, !25} ; [ DW_TAG_arg_variable ] [r] [line 70]
!159 = !MDLocation(line: 70, column: 14, scope: !26)
!160 = !{!"0x100\00i\0072\000", !26, !15, !18}    ; [ DW_TAG_auto_variable ] [i] [line 72]
!161 = !MDLocation(line: 72, column: 7, scope: !26)
!162 = !{!"0x100\00j\0072\000", !26, !15, !18}    ; [ DW_TAG_auto_variable ] [j] [line 72]
!163 = !MDLocation(line: 72, column: 10, scope: !26)
!164 = !MDLocation(line: 75, column: 8, scope: !165)
!165 = !{!"0xb\0075\003\009", !1, !26}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!166 = !MDLocation(line: 75, column: 15, scope: !167)
!167 = !{!"0xb\002", !1, !168}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!168 = !{!"0xb\001", !1, !169}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!169 = !{!"0xb\0075\003\0010", !1, !165}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!170 = !MDLocation(line: 75, column: 19, scope: !169)
!171 = !MDLocation(line: 75, column: 15, scope: !169)
!172 = !MDLocation(line: 75, column: 3, scope: !165)
!173 = !MDLocation(line: 76, column: 7, scope: !169)
!174 = !MDLocation(line: 76, column: 5, scope: !169)
!175 = !MDLocation(line: 75, column: 23, scope: !169)
!176 = !MDLocation(line: 75, column: 3, scope: !169)
!177 = !MDLocation(line: 77, column: 8, scope: !178)
!178 = !{!"0xb\0077\003\0011", !1, !26}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!179 = !MDLocation(line: 77, column: 15, scope: !180)
!180 = !{!"0xb\002", !1, !181}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!181 = !{!"0xb\001", !1, !182}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!182 = !{!"0xb\0077\003\0012", !1, !178}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!183 = !MDLocation(line: 77, column: 19, scope: !182)
!184 = !MDLocation(line: 77, column: 15, scope: !182)
!185 = !MDLocation(line: 77, column: 3, scope: !178)
!186 = !MDLocation(line: 79, column: 9, scope: !187)
!187 = !{!"0xb\0078\005\0013", !1, !182}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!188 = !MDLocation(line: 79, column: 7, scope: !187)
!189 = !MDLocation(line: 80, column: 12, scope: !190)
!190 = !{!"0xb\0080\007\0014", !1, !187}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!191 = !MDLocation(line: 80, column: 19, scope: !192)
!192 = !{!"0xb\002", !1, !193}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!193 = !{!"0xb\001", !1, !194}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!194 = !{!"0xb\0080\007\0015", !1, !190}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!195 = !MDLocation(line: 80, column: 23, scope: !194)
!196 = !MDLocation(line: 80, column: 19, scope: !194)
!197 = !MDLocation(line: 80, column: 7, scope: !190)
!198 = !MDLocation(line: 82, column: 13, scope: !199)
!199 = !{!"0xb\0081\002\0016", !1, !194}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!200 = !MDLocation(line: 82, column: 11, scope: !199)
!201 = !MDLocation(line: 82, column: 20, scope: !199)
!202 = !MDLocation(line: 82, column: 18, scope: !199)
!203 = !MDLocation(line: 82, column: 30, scope: !199)
!204 = !MDLocation(line: 82, column: 25, scope: !199)
!205 = !MDLocation(line: 82, column: 27, scope: !199)
!206 = !MDLocation(line: 82, column: 6, scope: !199)
!207 = !MDLocation(line: 82, column: 4, scope: !199)
!208 = !MDLocation(line: 83, column: 13, scope: !199)
!209 = !MDLocation(line: 83, column: 11, scope: !199)
!210 = !MDLocation(line: 83, column: 23, scope: !199)
!211 = !MDLocation(line: 83, column: 18, scope: !199)
!212 = !MDLocation(line: 83, column: 20, scope: !199)
!213 = !MDLocation(line: 83, column: 30, scope: !199)
!214 = !MDLocation(line: 83, column: 28, scope: !199)
!215 = !MDLocation(line: 83, column: 6, scope: !199)
!216 = !MDLocation(line: 83, column: 4, scope: !199)
!217 = !MDLocation(line: 84, column: 2, scope: !199)
!218 = !MDLocation(line: 80, column: 27, scope: !194)
!219 = !MDLocation(line: 80, column: 7, scope: !194)
!220 = !MDLocation(line: 85, column: 5, scope: !187)
!221 = !MDLocation(line: 77, column: 23, scope: !182)
!222 = !MDLocation(line: 77, column: 3, scope: !182)
!223 = !MDLocation(line: 88, column: 1, scope: !26)
!224 = !{!"0x101\00nx\0016777259\000", !22, !15, !18} ; [ DW_TAG_arg_variable ] [nx] [line 43]
!225 = !MDLocation(line: 43, column: 22, scope: !22)
!226 = !{!"0x101\00ny\0033554475\000", !22, !15, !18} ; [ DW_TAG_arg_variable ] [ny] [line 43]
!227 = !MDLocation(line: 43, column: 30, scope: !22)
!228 = !{!"0x101\00s\0050331692\000", !22, !15, !25} ; [ DW_TAG_arg_variable ] [s] [line 44]
!229 = !MDLocation(line: 44, column: 14, scope: !22)
!230 = !{!"0x101\00q\0067108909\000", !22, !15, !25} ; [ DW_TAG_arg_variable ] [q] [line 45]
!231 = !MDLocation(line: 45, column: 14, scope: !22)
!232 = !{!"0x100\00i\0048\000", !22, !15, !18}    ; [ DW_TAG_auto_variable ] [i] [line 48]
!233 = !MDLocation(line: 48, column: 7, scope: !22)
!234 = !MDLocation(line: 50, column: 8, scope: !235)
!235 = !{!"0xb\0050\003\001", !1, !22}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!236 = !MDLocation(line: 50, column: 15, scope: !237)
!237 = !{!"0xb\002", !1, !238}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!238 = !{!"0xb\001", !1, !239}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!239 = !{!"0xb\0050\003\002", !1, !235}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!240 = !MDLocation(line: 50, column: 19, scope: !239)
!241 = !MDLocation(line: 50, column: 15, scope: !239)
!242 = !MDLocation(line: 50, column: 3, scope: !235)
!243 = !MDLocation(line: 51, column: 14, scope: !244)
!244 = !{!"0xb\0050\0028\003", !1, !239}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!245 = !MDLocation(line: 51, column: 46, scope: !244)
!246 = !MDLocation(line: 51, column: 44, scope: !244)
!247 = !MDLocation(line: 51, column: 5, scope: !244)
!248 = !MDLocation(line: 52, column: 9, scope: !249)
!249 = !{!"0xb\0052\009\004", !1, !244}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!250 = !MDLocation(line: 52, column: 9, scope: !244)
!251 = !MDLocation(line: 52, column: 31, scope: !252)
!252 = !{!"0xb\001", !1, !249}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!253 = !MDLocation(line: 52, column: 22, scope: !249)
!254 = !MDLocation(line: 53, column: 3, scope: !244)
!255 = !MDLocation(line: 50, column: 23, scope: !239)
!256 = !MDLocation(line: 50, column: 3, scope: !239)
!257 = !MDLocation(line: 54, column: 8, scope: !258)
!258 = !{!"0xb\0054\003\005", !1, !22}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!259 = !MDLocation(line: 54, column: 15, scope: !260)
!260 = !{!"0xb\002", !1, !261}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!261 = !{!"0xb\001", !1, !262}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!262 = !{!"0xb\0054\003\006", !1, !258}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!263 = !MDLocation(line: 54, column: 19, scope: !262)
!264 = !MDLocation(line: 54, column: 15, scope: !262)
!265 = !MDLocation(line: 54, column: 3, scope: !258)
!266 = !MDLocation(line: 55, column: 14, scope: !267)
!267 = !{!"0xb\0054\0028\007", !1, !262}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!268 = !MDLocation(line: 55, column: 46, scope: !267)
!269 = !MDLocation(line: 55, column: 44, scope: !267)
!270 = !MDLocation(line: 55, column: 5, scope: !267)
!271 = !MDLocation(line: 56, column: 9, scope: !272)
!272 = !{!"0xb\0056\009\008", !1, !267}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!273 = !MDLocation(line: 56, column: 9, scope: !267)
!274 = !MDLocation(line: 56, column: 31, scope: !275)
!275 = !{!"0xb\001", !1, !272}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/bicg/bicg.c]
!276 = !MDLocation(line: 56, column: 22, scope: !272)
!277 = !MDLocation(line: 57, column: 3, scope: !267)
!278 = !MDLocation(line: 54, column: 23, scope: !262)
!279 = !MDLocation(line: 54, column: 3, scope: !262)
!280 = !MDLocation(line: 58, column: 12, scope: !22)
!281 = !MDLocation(line: 58, column: 3, scope: !22)
!282 = !MDLocation(line: 59, column: 1, scope: !22)
