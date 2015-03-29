; ModuleID = 'gemver.c'
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
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %A = alloca [4000 x [4000 x double]]*, align 8
  %u1 = alloca [4000 x double]*, align 8
  %v1 = alloca [4000 x double]*, align 8
  %u2 = alloca [4000 x double]*, align 8
  %v2 = alloca [4000 x double]*, align 8
  %w = alloca [4000 x double]*, align 8
  %x = alloca [4000 x double]*, align 8
  %y = alloca [4000 x double]*, align 8
  %z = alloca [4000 x double]*, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !35, metadata !36), !dbg !37
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !38, metadata !36), !dbg !39
  call void @llvm.dbg.declare(metadata i32* %n, metadata !40, metadata !36), !dbg !41
  store i32 4000, i32* %n, align 4, !dbg !41
  call void @llvm.dbg.declare(metadata double* %alpha, metadata !42, metadata !36), !dbg !43
  call void @llvm.dbg.declare(metadata double* %beta, metadata !44, metadata !36), !dbg !45
  call void @llvm.dbg.declare(metadata [4000 x [4000 x double]]** %A, metadata !46, metadata !36), !dbg !47
  %call = call i8* @polybench_alloc_data(i32 16000000, i32 8), !dbg !47
  %0 = bitcast i8* %call to [4000 x [4000 x double]]*, !dbg !47
  store [4000 x [4000 x double]]* %0, [4000 x [4000 x double]]** %A, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata [4000 x double]** %u1, metadata !48, metadata !36), !dbg !49
  %call1 = call i8* @polybench_alloc_data(i32 4000, i32 8), !dbg !49
  %1 = bitcast i8* %call1 to [4000 x double]*, !dbg !49
  store [4000 x double]* %1, [4000 x double]** %u1, align 8, !dbg !49
  call void @llvm.dbg.declare(metadata [4000 x double]** %v1, metadata !50, metadata !36), !dbg !51
  %call2 = call i8* @polybench_alloc_data(i32 4000, i32 8), !dbg !51
  %2 = bitcast i8* %call2 to [4000 x double]*, !dbg !51
  store [4000 x double]* %2, [4000 x double]** %v1, align 8, !dbg !51
  call void @llvm.dbg.declare(metadata [4000 x double]** %u2, metadata !52, metadata !36), !dbg !53
  %call3 = call i8* @polybench_alloc_data(i32 4000, i32 8), !dbg !53
  %3 = bitcast i8* %call3 to [4000 x double]*, !dbg !53
  store [4000 x double]* %3, [4000 x double]** %u2, align 8, !dbg !53
  call void @llvm.dbg.declare(metadata [4000 x double]** %v2, metadata !54, metadata !36), !dbg !55
  %call4 = call i8* @polybench_alloc_data(i32 4000, i32 8), !dbg !55
  %4 = bitcast i8* %call4 to [4000 x double]*, !dbg !55
  store [4000 x double]* %4, [4000 x double]** %v2, align 8, !dbg !55
  call void @llvm.dbg.declare(metadata [4000 x double]** %w, metadata !56, metadata !36), !dbg !57
  %call5 = call i8* @polybench_alloc_data(i32 4000, i32 8), !dbg !57
  %5 = bitcast i8* %call5 to [4000 x double]*, !dbg !57
  store [4000 x double]* %5, [4000 x double]** %w, align 8, !dbg !57
  call void @llvm.dbg.declare(metadata [4000 x double]** %x, metadata !58, metadata !36), !dbg !59
  %call6 = call i8* @polybench_alloc_data(i32 4000, i32 8), !dbg !59
  %6 = bitcast i8* %call6 to [4000 x double]*, !dbg !59
  store [4000 x double]* %6, [4000 x double]** %x, align 8, !dbg !59
  call void @llvm.dbg.declare(metadata [4000 x double]** %y, metadata !60, metadata !36), !dbg !61
  %call7 = call i8* @polybench_alloc_data(i32 4000, i32 8), !dbg !61
  %7 = bitcast i8* %call7 to [4000 x double]*, !dbg !61
  store [4000 x double]* %7, [4000 x double]** %y, align 8, !dbg !61
  call void @llvm.dbg.declare(metadata [4000 x double]** %z, metadata !62, metadata !36), !dbg !63
  %call8 = call i8* @polybench_alloc_data(i32 4000, i32 8), !dbg !63
  %8 = bitcast i8* %call8 to [4000 x double]*, !dbg !63
  store [4000 x double]* %8, [4000 x double]** %z, align 8, !dbg !63
  %9 = load i32* %n, align 4, !dbg !64
  %10 = load [4000 x [4000 x double]]** %A, align 8, !dbg !65
  %arraydecay = getelementptr inbounds [4000 x [4000 x double]]* %10, i32 0, i32 0, !dbg !65
  %11 = load [4000 x double]** %u1, align 8, !dbg !66
  %arraydecay9 = getelementptr inbounds [4000 x double]* %11, i32 0, i32 0, !dbg !66
  %12 = load [4000 x double]** %v1, align 8, !dbg !67
  %arraydecay10 = getelementptr inbounds [4000 x double]* %12, i32 0, i32 0, !dbg !67
  %13 = load [4000 x double]** %u2, align 8, !dbg !68
  %arraydecay11 = getelementptr inbounds [4000 x double]* %13, i32 0, i32 0, !dbg !68
  %14 = load [4000 x double]** %v2, align 8, !dbg !69
  %arraydecay12 = getelementptr inbounds [4000 x double]* %14, i32 0, i32 0, !dbg !69
  %15 = load [4000 x double]** %w, align 8, !dbg !70
  %arraydecay13 = getelementptr inbounds [4000 x double]* %15, i32 0, i32 0, !dbg !70
  %16 = load [4000 x double]** %x, align 8, !dbg !71
  %arraydecay14 = getelementptr inbounds [4000 x double]* %16, i32 0, i32 0, !dbg !71
  %17 = load [4000 x double]** %y, align 8, !dbg !72
  %arraydecay15 = getelementptr inbounds [4000 x double]* %17, i32 0, i32 0, !dbg !72
  %18 = load [4000 x double]** %z, align 8, !dbg !73
  %arraydecay16 = getelementptr inbounds [4000 x double]* %18, i32 0, i32 0, !dbg !73
  call void @init_array(i32 %9, double* %alpha, double* %beta, [4000 x double]* %arraydecay, double* %arraydecay9, double* %arraydecay10, double* %arraydecay11, double* %arraydecay12, double* %arraydecay13, double* %arraydecay14, double* %arraydecay15, double* %arraydecay16), !dbg !74
  %19 = load i32* %n, align 4, !dbg !75
  %20 = load double* %alpha, align 8, !dbg !76
  %21 = load double* %beta, align 8, !dbg !77
  %22 = load [4000 x [4000 x double]]** %A, align 8, !dbg !78
  %arraydecay17 = getelementptr inbounds [4000 x [4000 x double]]* %22, i32 0, i32 0, !dbg !78
  %23 = load [4000 x double]** %u1, align 8, !dbg !79
  %arraydecay18 = getelementptr inbounds [4000 x double]* %23, i32 0, i32 0, !dbg !79
  %24 = load [4000 x double]** %v1, align 8, !dbg !80
  %arraydecay19 = getelementptr inbounds [4000 x double]* %24, i32 0, i32 0, !dbg !80
  %25 = load [4000 x double]** %u2, align 8, !dbg !81
  %arraydecay20 = getelementptr inbounds [4000 x double]* %25, i32 0, i32 0, !dbg !81
  %26 = load [4000 x double]** %v2, align 8, !dbg !82
  %arraydecay21 = getelementptr inbounds [4000 x double]* %26, i32 0, i32 0, !dbg !82
  %27 = load [4000 x double]** %w, align 8, !dbg !83
  %arraydecay22 = getelementptr inbounds [4000 x double]* %27, i32 0, i32 0, !dbg !83
  %28 = load [4000 x double]** %x, align 8, !dbg !84
  %arraydecay23 = getelementptr inbounds [4000 x double]* %28, i32 0, i32 0, !dbg !84
  %29 = load [4000 x double]** %y, align 8, !dbg !85
  %arraydecay24 = getelementptr inbounds [4000 x double]* %29, i32 0, i32 0, !dbg !85
  %30 = load [4000 x double]** %z, align 8, !dbg !86
  %arraydecay25 = getelementptr inbounds [4000 x double]* %30, i32 0, i32 0, !dbg !86
  call void @kernel_gemver(i32 %19, double %20, double %21, [4000 x double]* %arraydecay17, double* %arraydecay18, double* %arraydecay19, double* %arraydecay20, double* %arraydecay21, double* %arraydecay22, double* %arraydecay23, double* %arraydecay24, double* %arraydecay25), !dbg !87
  %31 = load i32* %argc.addr, align 4, !dbg !88
  %cmp = icmp sgt i32 %31, 42, !dbg !88
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !90

land.lhs.true:                                    ; preds = %entry
  %32 = load i8*** %argv.addr, align 8, !dbg !91
  %arrayidx = getelementptr inbounds i8** %32, i64 0, !dbg !91
  %33 = load i8** %arrayidx, align 8, !dbg !91
  %call26 = call i32 @strcmp(i8* %33, i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0)) #5, !dbg !91
  %tobool = icmp ne i32 %call26, 0, !dbg !90
  br i1 %tobool, label %if.end, label %if.then, !dbg !90

if.then:                                          ; preds = %land.lhs.true
  %34 = load i32* %n, align 4, !dbg !93
  %35 = load [4000 x double]** %w, align 8, !dbg !93
  %arraydecay27 = getelementptr inbounds [4000 x double]* %35, i32 0, i32 0, !dbg !93
  call void @print_array(i32 %34, double* %arraydecay27), !dbg !93
  br label %if.end, !dbg !93

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %36 = load [4000 x [4000 x double]]** %A, align 8, !dbg !95
  %37 = bitcast [4000 x [4000 x double]]* %36 to i8*, !dbg !95
  call void @free(i8* %37) #6, !dbg !95
  %38 = load [4000 x double]** %u1, align 8, !dbg !96
  %39 = bitcast [4000 x double]* %38 to i8*, !dbg !96
  call void @free(i8* %39) #6, !dbg !96
  %40 = load [4000 x double]** %v1, align 8, !dbg !97
  %41 = bitcast [4000 x double]* %40 to i8*, !dbg !97
  call void @free(i8* %41) #6, !dbg !97
  %42 = load [4000 x double]** %u2, align 8, !dbg !98
  %43 = bitcast [4000 x double]* %42 to i8*, !dbg !98
  call void @free(i8* %43) #6, !dbg !98
  %44 = load [4000 x double]** %v2, align 8, !dbg !99
  %45 = bitcast [4000 x double]* %44 to i8*, !dbg !99
  call void @free(i8* %45) #6, !dbg !99
  %46 = load [4000 x double]** %w, align 8, !dbg !100
  %47 = bitcast [4000 x double]* %46 to i8*, !dbg !100
  call void @free(i8* %47) #6, !dbg !100
  %48 = load [4000 x double]** %x, align 8, !dbg !101
  %49 = bitcast [4000 x double]* %48 to i8*, !dbg !101
  call void @free(i8* %49) #6, !dbg !101
  %50 = load [4000 x double]** %y, align 8, !dbg !102
  %51 = bitcast [4000 x double]* %50 to i8*, !dbg !102
  call void @free(i8* %51) #6, !dbg !102
  %52 = load [4000 x double]** %z, align 8, !dbg !103
  %53 = bitcast [4000 x double]* %52 to i8*, !dbg !103
  call void @free(i8* %53) #6, !dbg !103
  ret i32 0, !dbg !104
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i8* @polybench_alloc_data(i32, i32) #2

; Function Attrs: nounwind uwtable
define internal void @init_array(i32 %n, double* %alpha, double* %beta, [4000 x double]* %A, double* %u1, double* %v1, double* %u2, double* %v2, double* %w, double* %x, double* %y, double* %z) #0 {
entry:
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca double*, align 8
  %beta.addr = alloca double*, align 8
  %A.addr = alloca [4000 x double]*, align 8
  %u1.addr = alloca double*, align 8
  %v1.addr = alloca double*, align 8
  %u2.addr = alloca double*, align 8
  %v2.addr = alloca double*, align 8
  %w.addr = alloca double*, align 8
  %x.addr = alloca double*, align 8
  %y.addr = alloca double*, align 8
  %z.addr = alloca double*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !105, metadata !36), !dbg !106
  store double* %alpha, double** %alpha.addr, align 8
  call void @llvm.dbg.declare(metadata double** %alpha.addr, metadata !107, metadata !36), !dbg !108
  store double* %beta, double** %beta.addr, align 8
  call void @llvm.dbg.declare(metadata double** %beta.addr, metadata !109, metadata !36), !dbg !110
  store [4000 x double]* %A, [4000 x double]** %A.addr, align 8
  call void @llvm.dbg.declare(metadata [4000 x double]** %A.addr, metadata !111, metadata !36), !dbg !112
  store double* %u1, double** %u1.addr, align 8
  call void @llvm.dbg.declare(metadata double** %u1.addr, metadata !113, metadata !36), !dbg !114
  store double* %v1, double** %v1.addr, align 8
  call void @llvm.dbg.declare(metadata double** %v1.addr, metadata !115, metadata !36), !dbg !116
  store double* %u2, double** %u2.addr, align 8
  call void @llvm.dbg.declare(metadata double** %u2.addr, metadata !117, metadata !36), !dbg !118
  store double* %v2, double** %v2.addr, align 8
  call void @llvm.dbg.declare(metadata double** %v2.addr, metadata !119, metadata !36), !dbg !120
  store double* %w, double** %w.addr, align 8
  call void @llvm.dbg.declare(metadata double** %w.addr, metadata !121, metadata !36), !dbg !122
  store double* %x, double** %x.addr, align 8
  call void @llvm.dbg.declare(metadata double** %x.addr, metadata !123, metadata !36), !dbg !124
  store double* %y, double** %y.addr, align 8
  call void @llvm.dbg.declare(metadata double** %y.addr, metadata !125, metadata !36), !dbg !126
  store double* %z, double** %z.addr, align 8
  call void @llvm.dbg.declare(metadata double** %z.addr, metadata !127, metadata !36), !dbg !128
  call void @llvm.dbg.declare(metadata i32* %i, metadata !129, metadata !36), !dbg !130
  call void @llvm.dbg.declare(metadata i32* %j, metadata !131, metadata !36), !dbg !132
  %0 = load double** %alpha.addr, align 8, !dbg !133
  store double 4.353200e+04, double* %0, align 8, !dbg !134
  %1 = load double** %beta.addr, align 8, !dbg !135
  store double 1.231300e+04, double* %1, align 8, !dbg !136
  store i32 0, i32* %i, align 4, !dbg !137
  br label %for.cond, !dbg !137

for.cond:                                         ; preds = %for.inc45, %entry
  %2 = load i32* %i, align 4, !dbg !139
  %3 = load i32* %n.addr, align 4, !dbg !143
  %cmp = icmp slt i32 %2, %3, !dbg !144
  br i1 %cmp, label %for.body, label %for.end47, !dbg !145

for.body:                                         ; preds = %for.cond
  %4 = load i32* %i, align 4, !dbg !146
  %conv = sitofp i32 %4 to double, !dbg !146
  %5 = load i32* %i, align 4, !dbg !148
  %idxprom = sext i32 %5 to i64, !dbg !149
  %6 = load double** %u1.addr, align 8, !dbg !149
  %arrayidx = getelementptr inbounds double* %6, i64 %idxprom, !dbg !149
  store double %conv, double* %arrayidx, align 8, !dbg !149
  %7 = load i32* %i, align 4, !dbg !150
  %add = add nsw i32 %7, 1, !dbg !150
  %8 = load i32* %n.addr, align 4, !dbg !151
  %div = sdiv i32 %add, %8, !dbg !152
  %conv1 = sitofp i32 %div to double, !dbg !152
  %div2 = fdiv double %conv1, 2.000000e+00, !dbg !152
  %9 = load i32* %i, align 4, !dbg !153
  %idxprom3 = sext i32 %9 to i64, !dbg !154
  %10 = load double** %u2.addr, align 8, !dbg !154
  %arrayidx4 = getelementptr inbounds double* %10, i64 %idxprom3, !dbg !154
  store double %div2, double* %arrayidx4, align 8, !dbg !154
  %11 = load i32* %i, align 4, !dbg !155
  %add5 = add nsw i32 %11, 1, !dbg !155
  %12 = load i32* %n.addr, align 4, !dbg !156
  %div6 = sdiv i32 %add5, %12, !dbg !157
  %conv7 = sitofp i32 %div6 to double, !dbg !157
  %div8 = fdiv double %conv7, 4.000000e+00, !dbg !157
  %13 = load i32* %i, align 4, !dbg !158
  %idxprom9 = sext i32 %13 to i64, !dbg !159
  %14 = load double** %v1.addr, align 8, !dbg !159
  %arrayidx10 = getelementptr inbounds double* %14, i64 %idxprom9, !dbg !159
  store double %div8, double* %arrayidx10, align 8, !dbg !159
  %15 = load i32* %i, align 4, !dbg !160
  %add11 = add nsw i32 %15, 1, !dbg !160
  %16 = load i32* %n.addr, align 4, !dbg !161
  %div12 = sdiv i32 %add11, %16, !dbg !162
  %conv13 = sitofp i32 %div12 to double, !dbg !162
  %div14 = fdiv double %conv13, 6.000000e+00, !dbg !162
  %17 = load i32* %i, align 4, !dbg !163
  %idxprom15 = sext i32 %17 to i64, !dbg !164
  %18 = load double** %v2.addr, align 8, !dbg !164
  %arrayidx16 = getelementptr inbounds double* %18, i64 %idxprom15, !dbg !164
  store double %div14, double* %arrayidx16, align 8, !dbg !164
  %19 = load i32* %i, align 4, !dbg !165
  %add17 = add nsw i32 %19, 1, !dbg !165
  %20 = load i32* %n.addr, align 4, !dbg !166
  %div18 = sdiv i32 %add17, %20, !dbg !167
  %conv19 = sitofp i32 %div18 to double, !dbg !167
  %div20 = fdiv double %conv19, 8.000000e+00, !dbg !167
  %21 = load i32* %i, align 4, !dbg !168
  %idxprom21 = sext i32 %21 to i64, !dbg !169
  %22 = load double** %y.addr, align 8, !dbg !169
  %arrayidx22 = getelementptr inbounds double* %22, i64 %idxprom21, !dbg !169
  store double %div20, double* %arrayidx22, align 8, !dbg !169
  %23 = load i32* %i, align 4, !dbg !170
  %add23 = add nsw i32 %23, 1, !dbg !170
  %24 = load i32* %n.addr, align 4, !dbg !171
  %div24 = sdiv i32 %add23, %24, !dbg !172
  %conv25 = sitofp i32 %div24 to double, !dbg !172
  %div26 = fdiv double %conv25, 9.000000e+00, !dbg !172
  %25 = load i32* %i, align 4, !dbg !173
  %idxprom27 = sext i32 %25 to i64, !dbg !174
  %26 = load double** %z.addr, align 8, !dbg !174
  %arrayidx28 = getelementptr inbounds double* %26, i64 %idxprom27, !dbg !174
  store double %div26, double* %arrayidx28, align 8, !dbg !174
  %27 = load i32* %i, align 4, !dbg !175
  %idxprom29 = sext i32 %27 to i64, !dbg !176
  %28 = load double** %x.addr, align 8, !dbg !176
  %arrayidx30 = getelementptr inbounds double* %28, i64 %idxprom29, !dbg !176
  store double 0.000000e+00, double* %arrayidx30, align 8, !dbg !176
  %29 = load i32* %i, align 4, !dbg !177
  %idxprom31 = sext i32 %29 to i64, !dbg !178
  %30 = load double** %w.addr, align 8, !dbg !178
  %arrayidx32 = getelementptr inbounds double* %30, i64 %idxprom31, !dbg !178
  store double 0.000000e+00, double* %arrayidx32, align 8, !dbg !178
  store i32 0, i32* %j, align 4, !dbg !179
  br label %for.cond33, !dbg !179

for.cond33:                                       ; preds = %for.inc, %for.body
  %31 = load i32* %j, align 4, !dbg !181
  %32 = load i32* %n.addr, align 4, !dbg !185
  %cmp34 = icmp slt i32 %31, %32, !dbg !186
  br i1 %cmp34, label %for.body36, label %for.end, !dbg !187

for.body36:                                       ; preds = %for.cond33
  %33 = load i32* %i, align 4, !dbg !188
  %conv37 = sitofp i32 %33 to double, !dbg !189
  %34 = load i32* %j, align 4, !dbg !190
  %conv38 = sitofp i32 %34 to double, !dbg !190
  %mul = fmul double %conv37, %conv38, !dbg !189
  %35 = load i32* %n.addr, align 4, !dbg !191
  %conv39 = sitofp i32 %35 to double, !dbg !191
  %div40 = fdiv double %mul, %conv39, !dbg !192
  %36 = load i32* %j, align 4, !dbg !193
  %idxprom41 = sext i32 %36 to i64, !dbg !194
  %37 = load i32* %i, align 4, !dbg !195
  %idxprom42 = sext i32 %37 to i64, !dbg !194
  %38 = load [4000 x double]** %A.addr, align 8, !dbg !194
  %arrayidx43 = getelementptr inbounds [4000 x double]* %38, i64 %idxprom42, !dbg !194
  %arrayidx44 = getelementptr inbounds [4000 x double]* %arrayidx43, i32 0, i64 %idxprom41, !dbg !194
  store double %div40, double* %arrayidx44, align 8, !dbg !194
  br label %for.inc, !dbg !194

for.inc:                                          ; preds = %for.body36
  %39 = load i32* %j, align 4, !dbg !196
  %inc = add nsw i32 %39, 1, !dbg !196
  store i32 %inc, i32* %j, align 4, !dbg !196
  br label %for.cond33, !dbg !197

for.end:                                          ; preds = %for.cond33
  br label %for.inc45, !dbg !198

for.inc45:                                        ; preds = %for.end
  %40 = load i32* %i, align 4, !dbg !199
  %inc46 = add nsw i32 %40, 1, !dbg !199
  store i32 %inc46, i32* %i, align 4, !dbg !199
  br label %for.cond, !dbg !200

for.end47:                                        ; preds = %for.cond
  ret void, !dbg !201
}

; Function Attrs: nounwind uwtable
define internal void @kernel_gemver(i32 %n, double %alpha, double %beta, [4000 x double]* %A, double* %u1, double* %v1, double* %u2, double* %v2, double* %w, double* %x, double* %y, double* %z) #0 {
entry:
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca double, align 8
  %beta.addr = alloca double, align 8
  %A.addr = alloca [4000 x double]*, align 8
  %u1.addr = alloca double*, align 8
  %v1.addr = alloca double*, align 8
  %u2.addr = alloca double*, align 8
  %v2.addr = alloca double*, align 8
  %w.addr = alloca double*, align 8
  %x.addr = alloca double*, align 8
  %y.addr = alloca double*, align 8
  %z.addr = alloca double*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !202, metadata !36), !dbg !203
  store double %alpha, double* %alpha.addr, align 8
  call void @llvm.dbg.declare(metadata double* %alpha.addr, metadata !204, metadata !36), !dbg !205
  store double %beta, double* %beta.addr, align 8
  call void @llvm.dbg.declare(metadata double* %beta.addr, metadata !206, metadata !36), !dbg !207
  store [4000 x double]* %A, [4000 x double]** %A.addr, align 8
  call void @llvm.dbg.declare(metadata [4000 x double]** %A.addr, metadata !208, metadata !36), !dbg !209
  store double* %u1, double** %u1.addr, align 8
  call void @llvm.dbg.declare(metadata double** %u1.addr, metadata !210, metadata !36), !dbg !211
  store double* %v1, double** %v1.addr, align 8
  call void @llvm.dbg.declare(metadata double** %v1.addr, metadata !212, metadata !36), !dbg !213
  store double* %u2, double** %u2.addr, align 8
  call void @llvm.dbg.declare(metadata double** %u2.addr, metadata !214, metadata !36), !dbg !215
  store double* %v2, double** %v2.addr, align 8
  call void @llvm.dbg.declare(metadata double** %v2.addr, metadata !216, metadata !36), !dbg !217
  store double* %w, double** %w.addr, align 8
  call void @llvm.dbg.declare(metadata double** %w.addr, metadata !218, metadata !36), !dbg !219
  store double* %x, double** %x.addr, align 8
  call void @llvm.dbg.declare(metadata double** %x.addr, metadata !220, metadata !36), !dbg !221
  store double* %y, double** %y.addr, align 8
  call void @llvm.dbg.declare(metadata double** %y.addr, metadata !222, metadata !36), !dbg !223
  store double* %z, double** %z.addr, align 8
  call void @llvm.dbg.declare(metadata double** %z.addr, metadata !224, metadata !36), !dbg !225
  call void @llvm.dbg.declare(metadata i32* %i, metadata !226, metadata !36), !dbg !227
  call void @llvm.dbg.declare(metadata i32* %j, metadata !228, metadata !36), !dbg !229
  store i32 0, i32* %i, align 4, !dbg !230
  br label %for.cond, !dbg !230

for.cond:                                         ; preds = %for.inc20, %entry
  %0 = load i32* %i, align 4, !dbg !232
  %1 = load i32* %n.addr, align 4, !dbg !236
  %cmp = icmp slt i32 %0, %1, !dbg !237
  br i1 %cmp, label %for.body, label %for.end22, !dbg !238

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !239
  br label %for.cond1, !dbg !239

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32* %j, align 4, !dbg !241
  %3 = load i32* %n.addr, align 4, !dbg !245
  %cmp2 = icmp slt i32 %2, %3, !dbg !246
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !247

for.body3:                                        ; preds = %for.cond1
  %4 = load i32* %j, align 4, !dbg !248
  %idxprom = sext i32 %4 to i64, !dbg !249
  %5 = load i32* %i, align 4, !dbg !250
  %idxprom4 = sext i32 %5 to i64, !dbg !249
  %6 = load [4000 x double]** %A.addr, align 8, !dbg !249
  %arrayidx = getelementptr inbounds [4000 x double]* %6, i64 %idxprom4, !dbg !249
  %arrayidx5 = getelementptr inbounds [4000 x double]* %arrayidx, i32 0, i64 %idxprom, !dbg !249
  %7 = load double* %arrayidx5, align 8, !dbg !249
  %8 = load i32* %i, align 4, !dbg !251
  %idxprom6 = sext i32 %8 to i64, !dbg !252
  %9 = load double** %u1.addr, align 8, !dbg !252
  %arrayidx7 = getelementptr inbounds double* %9, i64 %idxprom6, !dbg !252
  %10 = load double* %arrayidx7, align 8, !dbg !252
  %11 = load i32* %j, align 4, !dbg !253
  %idxprom8 = sext i32 %11 to i64, !dbg !254
  %12 = load double** %v1.addr, align 8, !dbg !254
  %arrayidx9 = getelementptr inbounds double* %12, i64 %idxprom8, !dbg !254
  %13 = load double* %arrayidx9, align 8, !dbg !254
  %mul = fmul double %10, %13, !dbg !252
  %add = fadd double %7, %mul, !dbg !249
  %14 = load i32* %i, align 4, !dbg !255
  %idxprom10 = sext i32 %14 to i64, !dbg !256
  %15 = load double** %u2.addr, align 8, !dbg !256
  %arrayidx11 = getelementptr inbounds double* %15, i64 %idxprom10, !dbg !256
  %16 = load double* %arrayidx11, align 8, !dbg !256
  %17 = load i32* %j, align 4, !dbg !257
  %idxprom12 = sext i32 %17 to i64, !dbg !258
  %18 = load double** %v2.addr, align 8, !dbg !258
  %arrayidx13 = getelementptr inbounds double* %18, i64 %idxprom12, !dbg !258
  %19 = load double* %arrayidx13, align 8, !dbg !258
  %mul14 = fmul double %16, %19, !dbg !256
  %add15 = fadd double %add, %mul14, !dbg !249
  %20 = load i32* %j, align 4, !dbg !259
  %idxprom16 = sext i32 %20 to i64, !dbg !260
  %21 = load i32* %i, align 4, !dbg !261
  %idxprom17 = sext i32 %21 to i64, !dbg !260
  %22 = load [4000 x double]** %A.addr, align 8, !dbg !260
  %arrayidx18 = getelementptr inbounds [4000 x double]* %22, i64 %idxprom17, !dbg !260
  %arrayidx19 = getelementptr inbounds [4000 x double]* %arrayidx18, i32 0, i64 %idxprom16, !dbg !260
  store double %add15, double* %arrayidx19, align 8, !dbg !260
  br label %for.inc, !dbg !260

for.inc:                                          ; preds = %for.body3
  %23 = load i32* %j, align 4, !dbg !262
  %inc = add nsw i32 %23, 1, !dbg !262
  store i32 %inc, i32* %j, align 4, !dbg !262
  br label %for.cond1, !dbg !263

for.end:                                          ; preds = %for.cond1
  br label %for.inc20, !dbg !264

for.inc20:                                        ; preds = %for.end
  %24 = load i32* %i, align 4, !dbg !265
  %inc21 = add nsw i32 %24, 1, !dbg !265
  store i32 %inc21, i32* %i, align 4, !dbg !265
  br label %for.cond, !dbg !266

for.end22:                                        ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !267
  br label %for.cond23, !dbg !267

for.cond23:                                       ; preds = %for.inc45, %for.end22
  %25 = load i32* %i, align 4, !dbg !269
  %26 = load i32* %n.addr, align 4, !dbg !273
  %cmp24 = icmp slt i32 %25, %26, !dbg !274
  br i1 %cmp24, label %for.body25, label %for.end47, !dbg !275

for.body25:                                       ; preds = %for.cond23
  store i32 0, i32* %j, align 4, !dbg !276
  br label %for.cond26, !dbg !276

for.cond26:                                       ; preds = %for.inc42, %for.body25
  %27 = load i32* %j, align 4, !dbg !278
  %28 = load i32* %n.addr, align 4, !dbg !282
  %cmp27 = icmp slt i32 %27, %28, !dbg !283
  br i1 %cmp27, label %for.body28, label %for.end44, !dbg !284

for.body28:                                       ; preds = %for.cond26
  %29 = load i32* %i, align 4, !dbg !285
  %idxprom29 = sext i32 %29 to i64, !dbg !286
  %30 = load double** %x.addr, align 8, !dbg !286
  %arrayidx30 = getelementptr inbounds double* %30, i64 %idxprom29, !dbg !286
  %31 = load double* %arrayidx30, align 8, !dbg !286
  %32 = load double* %beta.addr, align 8, !dbg !287
  %33 = load i32* %i, align 4, !dbg !288
  %idxprom31 = sext i32 %33 to i64, !dbg !289
  %34 = load i32* %j, align 4, !dbg !290
  %idxprom32 = sext i32 %34 to i64, !dbg !289
  %35 = load [4000 x double]** %A.addr, align 8, !dbg !289
  %arrayidx33 = getelementptr inbounds [4000 x double]* %35, i64 %idxprom32, !dbg !289
  %arrayidx34 = getelementptr inbounds [4000 x double]* %arrayidx33, i32 0, i64 %idxprom31, !dbg !289
  %36 = load double* %arrayidx34, align 8, !dbg !289
  %mul35 = fmul double %32, %36, !dbg !287
  %37 = load i32* %j, align 4, !dbg !291
  %idxprom36 = sext i32 %37 to i64, !dbg !292
  %38 = load double** %y.addr, align 8, !dbg !292
  %arrayidx37 = getelementptr inbounds double* %38, i64 %idxprom36, !dbg !292
  %39 = load double* %arrayidx37, align 8, !dbg !292
  %mul38 = fmul double %mul35, %39, !dbg !287
  %add39 = fadd double %31, %mul38, !dbg !286
  %40 = load i32* %i, align 4, !dbg !293
  %idxprom40 = sext i32 %40 to i64, !dbg !294
  %41 = load double** %x.addr, align 8, !dbg !294
  %arrayidx41 = getelementptr inbounds double* %41, i64 %idxprom40, !dbg !294
  store double %add39, double* %arrayidx41, align 8, !dbg !294
  br label %for.inc42, !dbg !294

for.inc42:                                        ; preds = %for.body28
  %42 = load i32* %j, align 4, !dbg !295
  %inc43 = add nsw i32 %42, 1, !dbg !295
  store i32 %inc43, i32* %j, align 4, !dbg !295
  br label %for.cond26, !dbg !296

for.end44:                                        ; preds = %for.cond26
  br label %for.inc45, !dbg !297

for.inc45:                                        ; preds = %for.end44
  %43 = load i32* %i, align 4, !dbg !298
  %inc46 = add nsw i32 %43, 1, !dbg !298
  store i32 %inc46, i32* %i, align 4, !dbg !298
  br label %for.cond23, !dbg !299

for.end47:                                        ; preds = %for.cond23
  store i32 0, i32* %i, align 4, !dbg !300
  br label %for.cond48, !dbg !300

for.cond48:                                       ; preds = %for.inc58, %for.end47
  %44 = load i32* %i, align 4, !dbg !302
  %45 = load i32* %n.addr, align 4, !dbg !306
  %cmp49 = icmp slt i32 %44, %45, !dbg !307
  br i1 %cmp49, label %for.body50, label %for.end60, !dbg !308

for.body50:                                       ; preds = %for.cond48
  %46 = load i32* %i, align 4, !dbg !309
  %idxprom51 = sext i32 %46 to i64, !dbg !310
  %47 = load double** %x.addr, align 8, !dbg !310
  %arrayidx52 = getelementptr inbounds double* %47, i64 %idxprom51, !dbg !310
  %48 = load double* %arrayidx52, align 8, !dbg !310
  %49 = load i32* %i, align 4, !dbg !311
  %idxprom53 = sext i32 %49 to i64, !dbg !312
  %50 = load double** %z.addr, align 8, !dbg !312
  %arrayidx54 = getelementptr inbounds double* %50, i64 %idxprom53, !dbg !312
  %51 = load double* %arrayidx54, align 8, !dbg !312
  %add55 = fadd double %48, %51, !dbg !310
  %52 = load i32* %i, align 4, !dbg !313
  %idxprom56 = sext i32 %52 to i64, !dbg !314
  %53 = load double** %x.addr, align 8, !dbg !314
  %arrayidx57 = getelementptr inbounds double* %53, i64 %idxprom56, !dbg !314
  store double %add55, double* %arrayidx57, align 8, !dbg !314
  br label %for.inc58, !dbg !314

for.inc58:                                        ; preds = %for.body50
  %54 = load i32* %i, align 4, !dbg !315
  %inc59 = add nsw i32 %54, 1, !dbg !315
  store i32 %inc59, i32* %i, align 4, !dbg !315
  br label %for.cond48, !dbg !316

for.end60:                                        ; preds = %for.cond48
  store i32 0, i32* %i, align 4, !dbg !317
  br label %for.cond61, !dbg !317

for.cond61:                                       ; preds = %for.inc83, %for.end60
  %55 = load i32* %i, align 4, !dbg !319
  %56 = load i32* %n.addr, align 4, !dbg !323
  %cmp62 = icmp slt i32 %55, %56, !dbg !324
  br i1 %cmp62, label %for.body63, label %for.end85, !dbg !325

for.body63:                                       ; preds = %for.cond61
  store i32 0, i32* %j, align 4, !dbg !326
  br label %for.cond64, !dbg !326

for.cond64:                                       ; preds = %for.inc80, %for.body63
  %57 = load i32* %j, align 4, !dbg !328
  %58 = load i32* %n.addr, align 4, !dbg !332
  %cmp65 = icmp slt i32 %57, %58, !dbg !333
  br i1 %cmp65, label %for.body66, label %for.end82, !dbg !334

for.body66:                                       ; preds = %for.cond64
  %59 = load i32* %i, align 4, !dbg !335
  %idxprom67 = sext i32 %59 to i64, !dbg !336
  %60 = load double** %w.addr, align 8, !dbg !336
  %arrayidx68 = getelementptr inbounds double* %60, i64 %idxprom67, !dbg !336
  %61 = load double* %arrayidx68, align 8, !dbg !336
  %62 = load double* %alpha.addr, align 8, !dbg !337
  %63 = load i32* %j, align 4, !dbg !338
  %idxprom69 = sext i32 %63 to i64, !dbg !339
  %64 = load i32* %i, align 4, !dbg !340
  %idxprom70 = sext i32 %64 to i64, !dbg !339
  %65 = load [4000 x double]** %A.addr, align 8, !dbg !339
  %arrayidx71 = getelementptr inbounds [4000 x double]* %65, i64 %idxprom70, !dbg !339
  %arrayidx72 = getelementptr inbounds [4000 x double]* %arrayidx71, i32 0, i64 %idxprom69, !dbg !339
  %66 = load double* %arrayidx72, align 8, !dbg !339
  %mul73 = fmul double %62, %66, !dbg !337
  %67 = load i32* %j, align 4, !dbg !341
  %idxprom74 = sext i32 %67 to i64, !dbg !342
  %68 = load double** %x.addr, align 8, !dbg !342
  %arrayidx75 = getelementptr inbounds double* %68, i64 %idxprom74, !dbg !342
  %69 = load double* %arrayidx75, align 8, !dbg !342
  %mul76 = fmul double %mul73, %69, !dbg !337
  %add77 = fadd double %61, %mul76, !dbg !336
  %70 = load i32* %i, align 4, !dbg !343
  %idxprom78 = sext i32 %70 to i64, !dbg !344
  %71 = load double** %w.addr, align 8, !dbg !344
  %arrayidx79 = getelementptr inbounds double* %71, i64 %idxprom78, !dbg !344
  store double %add77, double* %arrayidx79, align 8, !dbg !344
  br label %for.inc80, !dbg !344

for.inc80:                                        ; preds = %for.body66
  %72 = load i32* %j, align 4, !dbg !345
  %inc81 = add nsw i32 %72, 1, !dbg !345
  store i32 %inc81, i32* %j, align 4, !dbg !345
  br label %for.cond64, !dbg !346

for.end82:                                        ; preds = %for.cond64
  br label %for.inc83, !dbg !347

for.inc83:                                        ; preds = %for.end82
  %73 = load i32* %i, align 4, !dbg !348
  %inc84 = add nsw i32 %73, 1, !dbg !348
  store i32 %inc84, i32* %i, align 4, !dbg !348
  br label %for.cond61, !dbg !349

for.end85:                                        ; preds = %for.cond61
  ret void, !dbg !350
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #3

; Function Attrs: nounwind uwtable
define internal void @print_array(i32 %n, double* %w) #0 {
entry:
  %n.addr = alloca i32, align 4
  %w.addr = alloca double*, align 8
  %i = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !351, metadata !36), !dbg !352
  store double* %w, double** %w.addr, align 8
  call void @llvm.dbg.declare(metadata double** %w.addr, metadata !353, metadata !36), !dbg !354
  call void @llvm.dbg.declare(metadata i32* %i, metadata !355, metadata !36), !dbg !356
  store i32 0, i32* %i, align 4, !dbg !357
  br label %for.cond, !dbg !357

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4, !dbg !359
  %1 = load i32* %n.addr, align 4, !dbg !363
  %cmp = icmp slt i32 %0, %1, !dbg !364
  br i1 %cmp, label %for.body, label %for.end, !dbg !365

for.body:                                         ; preds = %for.cond
  %2 = load %struct._IO_FILE** @stderr, align 8, !dbg !366
  %3 = load i32* %i, align 4, !dbg !368
  %idxprom = sext i32 %3 to i64, !dbg !369
  %4 = load double** %w.addr, align 8, !dbg !369
  %arrayidx = getelementptr inbounds double* %4, i64 %idxprom, !dbg !369
  %5 = load double* %arrayidx, align 8, !dbg !369
  %call = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([8 x i8]* @.str1, i32 0, i32 0), double %5), !dbg !370
  %6 = load i32* %i, align 4, !dbg !371
  %rem = srem i32 %6, 20, !dbg !371
  %cmp1 = icmp eq i32 %rem, 0, !dbg !371
  br i1 %cmp1, label %if.then, label %if.end, !dbg !373

if.then:                                          ; preds = %for.body
  %7 = load %struct._IO_FILE** @stderr, align 8, !dbg !374
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)), !dbg !376
  br label %if.end, !dbg !376

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc, !dbg !377

for.inc:                                          ; preds = %if.end
  %8 = load i32* %i, align 4, !dbg !378
  %inc = add nsw i32 %8, 1, !dbg !378
  store i32 %inc, i32* %i, align 4, !dbg !378
  br label %for.cond, !dbg !379

for.end:                                          ; preds = %for.cond
  ret void, !dbg !380
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

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\000\00\000\00\001", !1, !2, !3, !13, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c] [DW_LANG_C99]
!1 = !{!"gemver.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver"}
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
!14 = !{!"0x2e\00main\00main\00\00111\000\001\000\000\00256\000\00112", !1, !15, !16, null, i32 (i32, i8**)* @main, null, null, !2} ; [ DW_TAG_subprogram ] [line 111] [def] [scope 112] [main]
!15 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!16 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !17, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!17 = !{!18, !18, !19}
!18 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!19 = !{!"0xf\00\000\0064\0064\000\000", null, null, !20} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!20 = !{!"0xf\00\000\0064\0064\000\000", null, null, !21} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!21 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!22 = !{!"0x2e\00print_array\00print_array\00\0060\001\001\000\000\00256\000\0062", !1, !15, !23, null, void (i32, double*)* @print_array, null, null, !2} ; [ DW_TAG_subprogram ] [line 60] [local] [def] [scope 62] [print_array]
!23 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !24, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!24 = !{null, !18, !25}
!25 = !{!"0xf\00\000\0064\0064\000\000", null, null, !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!26 = !{!"0x2e\00kernel_gemver\00kernel_gemver\00\0075\001\001\000\000\00256\000\0087", !1, !15, !27, null, void (i32, double, double, [4000 x double]*, double*, double*, double*, double*, double*, double*, double*, double*)* @kernel_gemver, null, null, !2} ; [ DW_TAG_subprogram ] [line 75] [local] [def] [scope 87] [kernel_gemver]
!27 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !28, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!28 = !{null, !18, !6, !6, !9, !25, !25, !25, !25, !25, !25, !25, !25}
!29 = !{!"0x2e\00init_array\00init_array\00\0023\001\001\000\000\00256\000\0035", !1, !15, !30, null, void (i32, double*, double*, [4000 x double]*, double*, double*, double*, double*, double*, double*, double*, double*)* @init_array, null, null, !2} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [scope 35] [init_array]
!30 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !31, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!31 = !{null, !18, !25, !25, !9, !25, !25, !25, !25, !25, !25, !25, !25}
!32 = !{i32 2, !"Dwarf Version", i32 4}
!33 = !{i32 2, !"Debug Info Version", i32 2}
!34 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!35 = !{!"0x101\00argc\0016777327\000", !14, !15, !18} ; [ DW_TAG_arg_variable ] [argc] [line 111]
!36 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!37 = !MDLocation(line: 111, column: 14, scope: !14)
!38 = !{!"0x101\00argv\0033554543\000", !14, !15, !19} ; [ DW_TAG_arg_variable ] [argv] [line 111]
!39 = !MDLocation(line: 111, column: 27, scope: !14)
!40 = !{!"0x100\00n\00114\000", !14, !15, !18}    ; [ DW_TAG_auto_variable ] [n] [line 114]
!41 = !MDLocation(line: 114, column: 7, scope: !14)
!42 = !{!"0x100\00alpha\00117\000", !14, !15, !6} ; [ DW_TAG_auto_variable ] [alpha] [line 117]
!43 = !MDLocation(line: 117, column: 13, scope: !14)
!44 = !{!"0x100\00beta\00118\000", !14, !15, !6}  ; [ DW_TAG_auto_variable ] [beta] [line 118]
!45 = !MDLocation(line: 118, column: 13, scope: !14)
!46 = !{!"0x100\00A\00119\000", !14, !15, !4}     ; [ DW_TAG_auto_variable ] [A] [line 119]
!47 = !MDLocation(line: 119, column: 3, scope: !14)
!48 = !{!"0x100\00u1\00120\000", !14, !15, !9}    ; [ DW_TAG_auto_variable ] [u1] [line 120]
!49 = !MDLocation(line: 120, column: 3, scope: !14)
!50 = !{!"0x100\00v1\00121\000", !14, !15, !9}    ; [ DW_TAG_auto_variable ] [v1] [line 121]
!51 = !MDLocation(line: 121, column: 3, scope: !14)
!52 = !{!"0x100\00u2\00122\000", !14, !15, !9}    ; [ DW_TAG_auto_variable ] [u2] [line 122]
!53 = !MDLocation(line: 122, column: 3, scope: !14)
!54 = !{!"0x100\00v2\00123\000", !14, !15, !9}    ; [ DW_TAG_auto_variable ] [v2] [line 123]
!55 = !MDLocation(line: 123, column: 3, scope: !14)
!56 = !{!"0x100\00w\00124\000", !14, !15, !9}     ; [ DW_TAG_auto_variable ] [w] [line 124]
!57 = !MDLocation(line: 124, column: 3, scope: !14)
!58 = !{!"0x100\00x\00125\000", !14, !15, !9}     ; [ DW_TAG_auto_variable ] [x] [line 125]
!59 = !MDLocation(line: 125, column: 3, scope: !14)
!60 = !{!"0x100\00y\00126\000", !14, !15, !9}     ; [ DW_TAG_auto_variable ] [y] [line 126]
!61 = !MDLocation(line: 126, column: 3, scope: !14)
!62 = !{!"0x100\00z\00127\000", !14, !15, !9}     ; [ DW_TAG_auto_variable ] [z] [line 127]
!63 = !MDLocation(line: 127, column: 3, scope: !14)
!64 = !MDLocation(line: 131, column: 15, scope: !14)
!65 = !MDLocation(line: 132, column: 8, scope: !14)
!66 = !MDLocation(line: 133, column: 8, scope: !14)
!67 = !MDLocation(line: 134, column: 8, scope: !14)
!68 = !MDLocation(line: 135, column: 8, scope: !14)
!69 = !MDLocation(line: 136, column: 8, scope: !14)
!70 = !MDLocation(line: 137, column: 8, scope: !14)
!71 = !MDLocation(line: 138, column: 8, scope: !14)
!72 = !MDLocation(line: 139, column: 8, scope: !14)
!73 = !MDLocation(line: 140, column: 8, scope: !14)
!74 = !MDLocation(line: 131, column: 3, scope: !14)
!75 = !MDLocation(line: 146, column: 18, scope: !14)
!76 = !MDLocation(line: 146, column: 21, scope: !14)
!77 = !MDLocation(line: 146, column: 28, scope: !14)
!78 = !MDLocation(line: 147, column: 4, scope: !14)
!79 = !MDLocation(line: 148, column: 4, scope: !14)
!80 = !MDLocation(line: 149, column: 4, scope: !14)
!81 = !MDLocation(line: 150, column: 4, scope: !14)
!82 = !MDLocation(line: 151, column: 4, scope: !14)
!83 = !MDLocation(line: 152, column: 4, scope: !14)
!84 = !MDLocation(line: 153, column: 4, scope: !14)
!85 = !MDLocation(line: 154, column: 4, scope: !14)
!86 = !MDLocation(line: 155, column: 4, scope: !14)
!87 = !MDLocation(line: 146, column: 3, scope: !14)
!88 = !MDLocation(line: 163, column: 3, scope: !89)
!89 = !{!"0xb\00163\003\000", !1, !14}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!90 = !MDLocation(line: 163, column: 3, scope: !14)
!91 = !MDLocation(line: 163, column: 3, scope: !92)
!92 = !{!"0xb\001", !1, !89}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!93 = !MDLocation(line: 163, column: 3, scope: !94)
!94 = !{!"0xb\002", !1, !89}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!95 = !MDLocation(line: 166, column: 3, scope: !14)
!96 = !MDLocation(line: 167, column: 3, scope: !14)
!97 = !MDLocation(line: 168, column: 3, scope: !14)
!98 = !MDLocation(line: 169, column: 3, scope: !14)
!99 = !MDLocation(line: 170, column: 3, scope: !14)
!100 = !MDLocation(line: 171, column: 3, scope: !14)
!101 = !MDLocation(line: 172, column: 3, scope: !14)
!102 = !MDLocation(line: 173, column: 3, scope: !14)
!103 = !MDLocation(line: 174, column: 3, scope: !14)
!104 = !MDLocation(line: 176, column: 3, scope: !14)
!105 = !{!"0x101\00n\0016777239\000", !29, !15, !18} ; [ DW_TAG_arg_variable ] [n] [line 23]
!106 = !MDLocation(line: 23, column: 22, scope: !29)
!107 = !{!"0x101\00alpha\0033554456\000", !29, !15, !25} ; [ DW_TAG_arg_variable ] [alpha] [line 24]
!108 = !MDLocation(line: 24, column: 15, scope: !29)
!109 = !{!"0x101\00beta\0050331673\000", !29, !15, !25} ; [ DW_TAG_arg_variable ] [beta] [line 25]
!110 = !MDLocation(line: 25, column: 15, scope: !29)
!111 = !{!"0x101\00A\0067108890\000", !29, !15, !9} ; [ DW_TAG_arg_variable ] [A] [line 26]
!112 = !MDLocation(line: 26, column: 14, scope: !29)
!113 = !{!"0x101\00u1\0083886107\000", !29, !15, !25} ; [ DW_TAG_arg_variable ] [u1] [line 27]
!114 = !MDLocation(line: 27, column: 14, scope: !29)
!115 = !{!"0x101\00v1\00100663324\000", !29, !15, !25} ; [ DW_TAG_arg_variable ] [v1] [line 28]
!116 = !MDLocation(line: 28, column: 14, scope: !29)
!117 = !{!"0x101\00u2\00117440541\000", !29, !15, !25} ; [ DW_TAG_arg_variable ] [u2] [line 29]
!118 = !MDLocation(line: 29, column: 14, scope: !29)
!119 = !{!"0x101\00v2\00134217758\000", !29, !15, !25} ; [ DW_TAG_arg_variable ] [v2] [line 30]
!120 = !MDLocation(line: 30, column: 14, scope: !29)
!121 = !{!"0x101\00w\00150994975\000", !29, !15, !25} ; [ DW_TAG_arg_variable ] [w] [line 31]
!122 = !MDLocation(line: 31, column: 14, scope: !29)
!123 = !{!"0x101\00x\00167772192\000", !29, !15, !25} ; [ DW_TAG_arg_variable ] [x] [line 32]
!124 = !MDLocation(line: 32, column: 14, scope: !29)
!125 = !{!"0x101\00y\00184549409\000", !29, !15, !25} ; [ DW_TAG_arg_variable ] [y] [line 33]
!126 = !MDLocation(line: 33, column: 14, scope: !29)
!127 = !{!"0x101\00z\00201326626\000", !29, !15, !25} ; [ DW_TAG_arg_variable ] [z] [line 34]
!128 = !MDLocation(line: 34, column: 14, scope: !29)
!129 = !{!"0x100\00i\0036\000", !29, !15, !18}    ; [ DW_TAG_auto_variable ] [i] [line 36]
!130 = !MDLocation(line: 36, column: 7, scope: !29)
!131 = !{!"0x100\00j\0036\000", !29, !15, !18}    ; [ DW_TAG_auto_variable ] [j] [line 36]
!132 = !MDLocation(line: 36, column: 10, scope: !29)
!133 = !MDLocation(line: 38, column: 4, scope: !29)
!134 = !MDLocation(line: 38, column: 3, scope: !29)
!135 = !MDLocation(line: 39, column: 4, scope: !29)
!136 = !MDLocation(line: 39, column: 3, scope: !29)
!137 = !MDLocation(line: 41, column: 8, scope: !138)
!138 = !{!"0xb\0041\003\0019", !1, !29}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!139 = !MDLocation(line: 41, column: 15, scope: !140)
!140 = !{!"0xb\002", !1, !141}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!141 = !{!"0xb\001", !1, !142}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!142 = !{!"0xb\0041\003\0020", !1, !138}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!143 = !MDLocation(line: 41, column: 19, scope: !142)
!144 = !MDLocation(line: 41, column: 15, scope: !142)
!145 = !MDLocation(line: 41, column: 3, scope: !138)
!146 = !MDLocation(line: 43, column: 15, scope: !147)
!147 = !{!"0xb\0042\005\0021", !1, !142}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!148 = !MDLocation(line: 43, column: 10, scope: !147)
!149 = !MDLocation(line: 43, column: 7, scope: !147)
!150 = !MDLocation(line: 44, column: 16, scope: !147)
!151 = !MDLocation(line: 44, column: 21, scope: !147)
!152 = !MDLocation(line: 44, column: 15, scope: !147)
!153 = !MDLocation(line: 44, column: 10, scope: !147)
!154 = !MDLocation(line: 44, column: 7, scope: !147)
!155 = !MDLocation(line: 45, column: 16, scope: !147)
!156 = !MDLocation(line: 45, column: 21, scope: !147)
!157 = !MDLocation(line: 45, column: 15, scope: !147)
!158 = !MDLocation(line: 45, column: 10, scope: !147)
!159 = !MDLocation(line: 45, column: 7, scope: !147)
!160 = !MDLocation(line: 46, column: 16, scope: !147)
!161 = !MDLocation(line: 46, column: 21, scope: !147)
!162 = !MDLocation(line: 46, column: 15, scope: !147)
!163 = !MDLocation(line: 46, column: 10, scope: !147)
!164 = !MDLocation(line: 46, column: 7, scope: !147)
!165 = !MDLocation(line: 47, column: 15, scope: !147)
!166 = !MDLocation(line: 47, column: 20, scope: !147)
!167 = !MDLocation(line: 47, column: 14, scope: !147)
!168 = !MDLocation(line: 47, column: 9, scope: !147)
!169 = !MDLocation(line: 47, column: 7, scope: !147)
!170 = !MDLocation(line: 48, column: 15, scope: !147)
!171 = !MDLocation(line: 48, column: 20, scope: !147)
!172 = !MDLocation(line: 48, column: 14, scope: !147)
!173 = !MDLocation(line: 48, column: 9, scope: !147)
!174 = !MDLocation(line: 48, column: 7, scope: !147)
!175 = !MDLocation(line: 49, column: 9, scope: !147)
!176 = !MDLocation(line: 49, column: 7, scope: !147)
!177 = !MDLocation(line: 50, column: 9, scope: !147)
!178 = !MDLocation(line: 50, column: 7, scope: !147)
!179 = !MDLocation(line: 51, column: 12, scope: !180)
!180 = !{!"0xb\0051\007\0022", !1, !147}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!181 = !MDLocation(line: 51, column: 19, scope: !182)
!182 = !{!"0xb\002", !1, !183}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!183 = !{!"0xb\001", !1, !184}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!184 = !{!"0xb\0051\007\0023", !1, !180}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!185 = !MDLocation(line: 51, column: 23, scope: !184)
!186 = !MDLocation(line: 51, column: 19, scope: !184)
!187 = !MDLocation(line: 51, column: 7, scope: !180)
!188 = !MDLocation(line: 52, column: 25, scope: !184)
!189 = !MDLocation(line: 52, column: 13, scope: !184)
!190 = !MDLocation(line: 52, column: 27, scope: !184)
!191 = !MDLocation(line: 52, column: 32, scope: !184)
!192 = !MDLocation(line: 52, column: 12, scope: !184)
!193 = !MDLocation(line: 52, column: 7, scope: !184)
!194 = !MDLocation(line: 52, column: 2, scope: !184)
!195 = !MDLocation(line: 52, column: 4, scope: !184)
!196 = !MDLocation(line: 51, column: 26, scope: !184)
!197 = !MDLocation(line: 51, column: 7, scope: !184)
!198 = !MDLocation(line: 53, column: 5, scope: !147)
!199 = !MDLocation(line: 41, column: 22, scope: !142)
!200 = !MDLocation(line: 41, column: 3, scope: !142)
!201 = !MDLocation(line: 54, column: 1, scope: !29)
!202 = !{!"0x101\00n\0016777291\000", !26, !15, !18} ; [ DW_TAG_arg_variable ] [n] [line 75]
!203 = !MDLocation(line: 75, column: 24, scope: !26)
!204 = !{!"0x101\00alpha\0033554508\000", !26, !15, !6} ; [ DW_TAG_arg_variable ] [alpha] [line 76]
!205 = !MDLocation(line: 76, column: 16, scope: !26)
!206 = !{!"0x101\00beta\0050331725\000", !26, !15, !6} ; [ DW_TAG_arg_variable ] [beta] [line 77]
!207 = !MDLocation(line: 77, column: 16, scope: !26)
!208 = !{!"0x101\00A\0067108942\000", !26, !15, !9} ; [ DW_TAG_arg_variable ] [A] [line 78]
!209 = !MDLocation(line: 78, column: 16, scope: !26)
!210 = !{!"0x101\00u1\0083886159\000", !26, !15, !25} ; [ DW_TAG_arg_variable ] [u1] [line 79]
!211 = !MDLocation(line: 79, column: 16, scope: !26)
!212 = !{!"0x101\00v1\00100663376\000", !26, !15, !25} ; [ DW_TAG_arg_variable ] [v1] [line 80]
!213 = !MDLocation(line: 80, column: 16, scope: !26)
!214 = !{!"0x101\00u2\00117440593\000", !26, !15, !25} ; [ DW_TAG_arg_variable ] [u2] [line 81]
!215 = !MDLocation(line: 81, column: 16, scope: !26)
!216 = !{!"0x101\00v2\00134217810\000", !26, !15, !25} ; [ DW_TAG_arg_variable ] [v2] [line 82]
!217 = !MDLocation(line: 82, column: 16, scope: !26)
!218 = !{!"0x101\00w\00150995027\000", !26, !15, !25} ; [ DW_TAG_arg_variable ] [w] [line 83]
!219 = !MDLocation(line: 83, column: 16, scope: !26)
!220 = !{!"0x101\00x\00167772244\000", !26, !15, !25} ; [ DW_TAG_arg_variable ] [x] [line 84]
!221 = !MDLocation(line: 84, column: 16, scope: !26)
!222 = !{!"0x101\00y\00184549461\000", !26, !15, !25} ; [ DW_TAG_arg_variable ] [y] [line 85]
!223 = !MDLocation(line: 85, column: 16, scope: !26)
!224 = !{!"0x101\00z\00201326678\000", !26, !15, !25} ; [ DW_TAG_arg_variable ] [z] [line 86]
!225 = !MDLocation(line: 86, column: 16, scope: !26)
!226 = !{!"0x100\00i\0088\000", !26, !15, !18}    ; [ DW_TAG_auto_variable ] [i] [line 88]
!227 = !MDLocation(line: 88, column: 7, scope: !26)
!228 = !{!"0x100\00j\0088\000", !26, !15, !18}    ; [ DW_TAG_auto_variable ] [j] [line 88]
!229 = !MDLocation(line: 88, column: 10, scope: !26)
!230 = !MDLocation(line: 92, column: 8, scope: !231)
!231 = !{!"0xb\0092\003\005", !1, !26}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!232 = !MDLocation(line: 92, column: 15, scope: !233)
!233 = !{!"0xb\002", !1, !234}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!234 = !{!"0xb\001", !1, !235}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!235 = !{!"0xb\0092\003\006", !1, !231}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!236 = !MDLocation(line: 92, column: 19, scope: !235)
!237 = !MDLocation(line: 92, column: 15, scope: !235)
!238 = !MDLocation(line: 92, column: 3, scope: !231)
!239 = !MDLocation(line: 93, column: 10, scope: !240)
!240 = !{!"0xb\0093\005\007", !1, !235}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!241 = !MDLocation(line: 93, column: 17, scope: !242)
!242 = !{!"0xb\002", !1, !243}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!243 = !{!"0xb\001", !1, !244}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!244 = !{!"0xb\0093\005\008", !1, !240}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!245 = !MDLocation(line: 93, column: 21, scope: !244)
!246 = !MDLocation(line: 93, column: 17, scope: !244)
!247 = !MDLocation(line: 93, column: 5, scope: !240)
!248 = !MDLocation(line: 94, column: 22, scope: !244)
!249 = !MDLocation(line: 94, column: 17, scope: !244)
!250 = !MDLocation(line: 94, column: 19, scope: !244)
!251 = !MDLocation(line: 94, column: 30, scope: !244)
!252 = !MDLocation(line: 94, column: 27, scope: !244)
!253 = !MDLocation(line: 94, column: 38, scope: !244)
!254 = !MDLocation(line: 94, column: 35, scope: !244)
!255 = !MDLocation(line: 94, column: 46, scope: !244)
!256 = !MDLocation(line: 94, column: 43, scope: !244)
!257 = !MDLocation(line: 94, column: 54, scope: !244)
!258 = !MDLocation(line: 94, column: 51, scope: !244)
!259 = !MDLocation(line: 94, column: 12, scope: !244)
!260 = !MDLocation(line: 94, column: 7, scope: !244)
!261 = !MDLocation(line: 94, column: 9, scope: !244)
!262 = !MDLocation(line: 93, column: 24, scope: !244)
!263 = !MDLocation(line: 93, column: 5, scope: !244)
!264 = !MDLocation(line: 94, column: 55, scope: !240)
!265 = !MDLocation(line: 92, column: 22, scope: !235)
!266 = !MDLocation(line: 92, column: 3, scope: !235)
!267 = !MDLocation(line: 96, column: 8, scope: !268)
!268 = !{!"0xb\0096\003\009", !1, !26}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!269 = !MDLocation(line: 96, column: 15, scope: !270)
!270 = !{!"0xb\002", !1, !271}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!271 = !{!"0xb\001", !1, !272}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!272 = !{!"0xb\0096\003\0010", !1, !268}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!273 = !MDLocation(line: 96, column: 19, scope: !272)
!274 = !MDLocation(line: 96, column: 15, scope: !272)
!275 = !MDLocation(line: 96, column: 3, scope: !268)
!276 = !MDLocation(line: 97, column: 10, scope: !277)
!277 = !{!"0xb\0097\005\0011", !1, !272}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!278 = !MDLocation(line: 97, column: 17, scope: !279)
!279 = !{!"0xb\002", !1, !280}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!280 = !{!"0xb\001", !1, !281}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!281 = !{!"0xb\0097\005\0012", !1, !277}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!282 = !MDLocation(line: 97, column: 21, scope: !281)
!283 = !MDLocation(line: 97, column: 17, scope: !281)
!284 = !MDLocation(line: 97, column: 5, scope: !277)
!285 = !MDLocation(line: 98, column: 16, scope: !281)
!286 = !MDLocation(line: 98, column: 14, scope: !281)
!287 = !MDLocation(line: 98, column: 21, scope: !281)
!288 = !MDLocation(line: 98, column: 33, scope: !281)
!289 = !MDLocation(line: 98, column: 28, scope: !281)
!290 = !MDLocation(line: 98, column: 30, scope: !281)
!291 = !MDLocation(line: 98, column: 40, scope: !281)
!292 = !MDLocation(line: 98, column: 38, scope: !281)
!293 = !MDLocation(line: 98, column: 9, scope: !281)
!294 = !MDLocation(line: 98, column: 7, scope: !281)
!295 = !MDLocation(line: 97, column: 24, scope: !281)
!296 = !MDLocation(line: 97, column: 5, scope: !281)
!297 = !MDLocation(line: 98, column: 41, scope: !277)
!298 = !MDLocation(line: 96, column: 22, scope: !272)
!299 = !MDLocation(line: 96, column: 3, scope: !272)
!300 = !MDLocation(line: 100, column: 8, scope: !301)
!301 = !{!"0xb\00100\003\0013", !1, !26}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!302 = !MDLocation(line: 100, column: 15, scope: !303)
!303 = !{!"0xb\002", !1, !304}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!304 = !{!"0xb\001", !1, !305}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!305 = !{!"0xb\00100\003\0014", !1, !301}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!306 = !MDLocation(line: 100, column: 19, scope: !305)
!307 = !MDLocation(line: 100, column: 15, scope: !305)
!308 = !MDLocation(line: 100, column: 3, scope: !301)
!309 = !MDLocation(line: 101, column: 14, scope: !305)
!310 = !MDLocation(line: 101, column: 12, scope: !305)
!311 = !MDLocation(line: 101, column: 21, scope: !305)
!312 = !MDLocation(line: 101, column: 19, scope: !305)
!313 = !MDLocation(line: 101, column: 7, scope: !305)
!314 = !MDLocation(line: 101, column: 5, scope: !305)
!315 = !MDLocation(line: 100, column: 22, scope: !305)
!316 = !MDLocation(line: 100, column: 3, scope: !305)
!317 = !MDLocation(line: 103, column: 8, scope: !318)
!318 = !{!"0xb\00103\003\0015", !1, !26}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!319 = !MDLocation(line: 103, column: 15, scope: !320)
!320 = !{!"0xb\002", !1, !321}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!321 = !{!"0xb\001", !1, !322}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!322 = !{!"0xb\00103\003\0016", !1, !318}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!323 = !MDLocation(line: 103, column: 19, scope: !322)
!324 = !MDLocation(line: 103, column: 15, scope: !322)
!325 = !MDLocation(line: 103, column: 3, scope: !318)
!326 = !MDLocation(line: 104, column: 10, scope: !327)
!327 = !{!"0xb\00104\005\0017", !1, !322}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!328 = !MDLocation(line: 104, column: 17, scope: !329)
!329 = !{!"0xb\002", !1, !330}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!330 = !{!"0xb\001", !1, !331}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!331 = !{!"0xb\00104\005\0018", !1, !327}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!332 = !MDLocation(line: 104, column: 21, scope: !331)
!333 = !MDLocation(line: 104, column: 17, scope: !331)
!334 = !MDLocation(line: 104, column: 5, scope: !327)
!335 = !MDLocation(line: 105, column: 16, scope: !331)
!336 = !MDLocation(line: 105, column: 14, scope: !331)
!337 = !MDLocation(line: 105, column: 22, scope: !331)
!338 = !MDLocation(line: 105, column: 35, scope: !331)
!339 = !MDLocation(line: 105, column: 30, scope: !331)
!340 = !MDLocation(line: 105, column: 32, scope: !331)
!341 = !MDLocation(line: 105, column: 42, scope: !331)
!342 = !MDLocation(line: 105, column: 40, scope: !331)
!343 = !MDLocation(line: 105, column: 9, scope: !331)
!344 = !MDLocation(line: 105, column: 7, scope: !331)
!345 = !MDLocation(line: 104, column: 24, scope: !331)
!346 = !MDLocation(line: 104, column: 5, scope: !331)
!347 = !MDLocation(line: 105, column: 43, scope: !327)
!348 = !MDLocation(line: 103, column: 22, scope: !322)
!349 = !MDLocation(line: 103, column: 3, scope: !322)
!350 = !MDLocation(line: 108, column: 1, scope: !26)
!351 = !{!"0x101\00n\0016777276\000", !22, !15, !18} ; [ DW_TAG_arg_variable ] [n] [line 60]
!352 = !MDLocation(line: 60, column: 22, scope: !22)
!353 = !{!"0x101\00w\0033554493\000", !22, !15, !25} ; [ DW_TAG_arg_variable ] [w] [line 61]
!354 = !MDLocation(line: 61, column: 14, scope: !22)
!355 = !{!"0x100\00i\0063\000", !22, !15, !18}    ; [ DW_TAG_auto_variable ] [i] [line 63]
!356 = !MDLocation(line: 63, column: 7, scope: !22)
!357 = !MDLocation(line: 65, column: 8, scope: !358)
!358 = !{!"0xb\0065\003\001", !1, !22}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!359 = !MDLocation(line: 65, column: 15, scope: !360)
!360 = !{!"0xb\002", !1, !361}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!361 = !{!"0xb\001", !1, !362}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!362 = !{!"0xb\0065\003\002", !1, !358}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!363 = !MDLocation(line: 65, column: 19, scope: !362)
!364 = !MDLocation(line: 65, column: 15, scope: !362)
!365 = !MDLocation(line: 65, column: 3, scope: !358)
!366 = !MDLocation(line: 66, column: 14, scope: !367)
!367 = !{!"0xb\0065\0027\003", !1, !362}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!368 = !MDLocation(line: 66, column: 46, scope: !367)
!369 = !MDLocation(line: 66, column: 44, scope: !367)
!370 = !MDLocation(line: 66, column: 5, scope: !367)
!371 = !MDLocation(line: 67, column: 9, scope: !372)
!372 = !{!"0xb\0067\009\004", !1, !367}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!373 = !MDLocation(line: 67, column: 9, scope: !367)
!374 = !MDLocation(line: 67, column: 31, scope: !375)
!375 = !{!"0xb\001", !1, !372}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!376 = !MDLocation(line: 67, column: 22, scope: !372)
!377 = !MDLocation(line: 68, column: 3, scope: !367)
!378 = !MDLocation(line: 65, column: 22, scope: !362)
!379 = !MDLocation(line: 65, column: 3, scope: !362)
!380 = !MDLocation(line: 69, column: 1, scope: !22)
