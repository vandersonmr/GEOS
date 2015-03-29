; ModuleID = 'floyd-warshall.c'
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
  %path = alloca [1024 x [1024 x double]]*, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !30, metadata !31), !dbg !32
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !33, metadata !31), !dbg !34
  call void @llvm.dbg.declare(metadata i32* %n, metadata !35, metadata !31), !dbg !36
  store i32 1024, i32* %n, align 4, !dbg !36
  call void @llvm.dbg.declare(metadata [1024 x [1024 x double]]** %path, metadata !37, metadata !31), !dbg !38
  %call = call i8* @polybench_alloc_data(i32 1048576, i32 8), !dbg !38
  %0 = bitcast i8* %call to [1024 x [1024 x double]]*, !dbg !38
  store [1024 x [1024 x double]]* %0, [1024 x [1024 x double]]** %path, align 8, !dbg !38
  %1 = load i32* %n, align 4, !dbg !39
  %2 = load [1024 x [1024 x double]]** %path, align 8, !dbg !40
  %arraydecay = getelementptr inbounds [1024 x [1024 x double]]* %2, i32 0, i32 0, !dbg !40
  call void @init_array(i32 %1, [1024 x double]* %arraydecay), !dbg !41
  %3 = load i32* %n, align 4, !dbg !42
  %4 = load [1024 x [1024 x double]]** %path, align 8, !dbg !43
  %arraydecay1 = getelementptr inbounds [1024 x [1024 x double]]* %4, i32 0, i32 0, !dbg !43
  call void @kernel_floyd_warshall(i32 %3, [1024 x double]* %arraydecay1), !dbg !44
  %5 = load i32* %argc.addr, align 4, !dbg !45
  %cmp = icmp sgt i32 %5, 42, !dbg !45
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !47

land.lhs.true:                                    ; preds = %entry
  %6 = load i8*** %argv.addr, align 8, !dbg !48
  %arrayidx = getelementptr inbounds i8** %6, i64 0, !dbg !48
  %7 = load i8** %arrayidx, align 8, !dbg !48
  %call2 = call i32 @strcmp(i8* %7, i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0)) #5, !dbg !48
  %tobool = icmp ne i32 %call2, 0, !dbg !47
  br i1 %tobool, label %if.end, label %if.then, !dbg !47

if.then:                                          ; preds = %land.lhs.true
  %8 = load i32* %n, align 4, !dbg !50
  %9 = load [1024 x [1024 x double]]** %path, align 8, !dbg !50
  %arraydecay3 = getelementptr inbounds [1024 x [1024 x double]]* %9, i32 0, i32 0, !dbg !50
  call void @print_array(i32 %8, [1024 x double]* %arraydecay3), !dbg !50
  br label %if.end, !dbg !50

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %10 = load [1024 x [1024 x double]]** %path, align 8, !dbg !52
  %11 = bitcast [1024 x [1024 x double]]* %10 to i8*, !dbg !52
  call void @free(i8* %11) #6, !dbg !52
  ret i32 0, !dbg !53
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i8* @polybench_alloc_data(i32, i32) #2

; Function Attrs: nounwind uwtable
define internal void @init_array(i32 %n, [1024 x double]* %path) #0 {
entry:
  %n.addr = alloca i32, align 4
  %path.addr = alloca [1024 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !54, metadata !31), !dbg !55
  store [1024 x double]* %path, [1024 x double]** %path.addr, align 8
  call void @llvm.dbg.declare(metadata [1024 x double]** %path.addr, metadata !56, metadata !31), !dbg !57
  call void @llvm.dbg.declare(metadata i32* %i, metadata !58, metadata !31), !dbg !59
  call void @llvm.dbg.declare(metadata i32* %j, metadata !60, metadata !31), !dbg !61
  store i32 0, i32* %i, align 4, !dbg !62
  br label %for.cond, !dbg !62

for.cond:                                         ; preds = %for.inc9, %entry
  %0 = load i32* %i, align 4, !dbg !64
  %1 = load i32* %n.addr, align 4, !dbg !68
  %cmp = icmp slt i32 %0, %1, !dbg !69
  br i1 %cmp, label %for.body, label %for.end11, !dbg !70

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !71
  br label %for.cond1, !dbg !71

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32* %j, align 4, !dbg !73
  %3 = load i32* %n.addr, align 4, !dbg !77
  %cmp2 = icmp slt i32 %2, %3, !dbg !78
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !79

for.body3:                                        ; preds = %for.cond1
  %4 = load i32* %i, align 4, !dbg !80
  %add = add nsw i32 %4, 1, !dbg !80
  %conv = sitofp i32 %add to double, !dbg !81
  %5 = load i32* %j, align 4, !dbg !82
  %add4 = add nsw i32 %5, 1, !dbg !82
  %conv5 = sitofp i32 %add4 to double, !dbg !83
  %mul = fmul double %conv, %conv5, !dbg !81
  %6 = load i32* %n.addr, align 4, !dbg !84
  %conv6 = sitofp i32 %6 to double, !dbg !84
  %div = fdiv double %mul, %conv6, !dbg !85
  %7 = load i32* %j, align 4, !dbg !86
  %idxprom = sext i32 %7 to i64, !dbg !87
  %8 = load i32* %i, align 4, !dbg !88
  %idxprom7 = sext i32 %8 to i64, !dbg !87
  %9 = load [1024 x double]** %path.addr, align 8, !dbg !87
  %arrayidx = getelementptr inbounds [1024 x double]* %9, i64 %idxprom7, !dbg !87
  %arrayidx8 = getelementptr inbounds [1024 x double]* %arrayidx, i32 0, i64 %idxprom, !dbg !87
  store double %div, double* %arrayidx8, align 8, !dbg !87
  br label %for.inc, !dbg !87

for.inc:                                          ; preds = %for.body3
  %10 = load i32* %j, align 4, !dbg !89
  %inc = add nsw i32 %10, 1, !dbg !89
  store i32 %inc, i32* %j, align 4, !dbg !89
  br label %for.cond1, !dbg !90

for.end:                                          ; preds = %for.cond1
  br label %for.inc9, !dbg !91

for.inc9:                                         ; preds = %for.end
  %11 = load i32* %i, align 4, !dbg !92
  %inc10 = add nsw i32 %11, 1, !dbg !92
  store i32 %inc10, i32* %i, align 4, !dbg !92
  br label %for.cond, !dbg !93

for.end11:                                        ; preds = %for.cond
  ret void, !dbg !94
}

; Function Attrs: nounwind uwtable
define internal void @kernel_floyd_warshall(i32 %n, [1024 x double]* %path) #0 {
entry:
  %n.addr = alloca i32, align 4
  %path.addr = alloca [1024 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !95, metadata !31), !dbg !96
  store [1024 x double]* %path, [1024 x double]** %path.addr, align 8
  call void @llvm.dbg.declare(metadata [1024 x double]** %path.addr, metadata !97, metadata !31), !dbg !98
  call void @llvm.dbg.declare(metadata i32* %i, metadata !99, metadata !31), !dbg !100
  call void @llvm.dbg.declare(metadata i32* %j, metadata !101, metadata !31), !dbg !102
  call void @llvm.dbg.declare(metadata i32* %k, metadata !103, metadata !31), !dbg !104
  store i32 0, i32* %k, align 4, !dbg !105
  br label %for.cond, !dbg !105

for.cond:                                         ; preds = %for.inc38, %entry
  %0 = load i32* %k, align 4, !dbg !107
  %1 = load i32* %n.addr, align 4, !dbg !111
  %cmp = icmp slt i32 %0, %1, !dbg !112
  br i1 %cmp, label %for.body, label %for.end40, !dbg !113

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !114
  br label %for.cond1, !dbg !114

for.cond1:                                        ; preds = %for.inc35, %for.body
  %2 = load i32* %i, align 4, !dbg !117
  %3 = load i32* %n.addr, align 4, !dbg !121
  %cmp2 = icmp slt i32 %2, %3, !dbg !122
  br i1 %cmp2, label %for.body3, label %for.end37, !dbg !123

for.body3:                                        ; preds = %for.cond1
  store i32 0, i32* %j, align 4, !dbg !124
  br label %for.cond4, !dbg !124

for.cond4:                                        ; preds = %for.inc, %for.body3
  %4 = load i32* %j, align 4, !dbg !126
  %5 = load i32* %n.addr, align 4, !dbg !130
  %cmp5 = icmp slt i32 %4, %5, !dbg !131
  br i1 %cmp5, label %for.body6, label %for.end, !dbg !132

for.body6:                                        ; preds = %for.cond4
  %6 = load i32* %j, align 4, !dbg !133
  %idxprom = sext i32 %6 to i64, !dbg !134
  %7 = load i32* %i, align 4, !dbg !135
  %idxprom7 = sext i32 %7 to i64, !dbg !134
  %8 = load [1024 x double]** %path.addr, align 8, !dbg !134
  %arrayidx = getelementptr inbounds [1024 x double]* %8, i64 %idxprom7, !dbg !134
  %arrayidx8 = getelementptr inbounds [1024 x double]* %arrayidx, i32 0, i64 %idxprom, !dbg !134
  %9 = load double* %arrayidx8, align 8, !dbg !134
  %10 = load i32* %k, align 4, !dbg !136
  %idxprom9 = sext i32 %10 to i64, !dbg !137
  %11 = load i32* %i, align 4, !dbg !138
  %idxprom10 = sext i32 %11 to i64, !dbg !137
  %12 = load [1024 x double]** %path.addr, align 8, !dbg !137
  %arrayidx11 = getelementptr inbounds [1024 x double]* %12, i64 %idxprom10, !dbg !137
  %arrayidx12 = getelementptr inbounds [1024 x double]* %arrayidx11, i32 0, i64 %idxprom9, !dbg !137
  %13 = load double* %arrayidx12, align 8, !dbg !137
  %14 = load i32* %j, align 4, !dbg !139
  %idxprom13 = sext i32 %14 to i64, !dbg !140
  %15 = load i32* %k, align 4, !dbg !141
  %idxprom14 = sext i32 %15 to i64, !dbg !140
  %16 = load [1024 x double]** %path.addr, align 8, !dbg !140
  %arrayidx15 = getelementptr inbounds [1024 x double]* %16, i64 %idxprom14, !dbg !140
  %arrayidx16 = getelementptr inbounds [1024 x double]* %arrayidx15, i32 0, i64 %idxprom13, !dbg !140
  %17 = load double* %arrayidx16, align 8, !dbg !140
  %add = fadd double %13, %17, !dbg !137
  %cmp17 = fcmp olt double %9, %add, !dbg !134
  br i1 %cmp17, label %cond.true, label %cond.false, !dbg !134

cond.true:                                        ; preds = %for.body6
  %18 = load i32* %j, align 4, !dbg !142
  %idxprom18 = sext i32 %18 to i64, !dbg !143
  %19 = load i32* %i, align 4, !dbg !144
  %idxprom19 = sext i32 %19 to i64, !dbg !143
  %20 = load [1024 x double]** %path.addr, align 8, !dbg !143
  %arrayidx20 = getelementptr inbounds [1024 x double]* %20, i64 %idxprom19, !dbg !143
  %arrayidx21 = getelementptr inbounds [1024 x double]* %arrayidx20, i32 0, i64 %idxprom18, !dbg !143
  %21 = load double* %arrayidx21, align 8, !dbg !143
  br label %cond.end, !dbg !134

cond.false:                                       ; preds = %for.body6
  %22 = load i32* %k, align 4, !dbg !145
  %idxprom22 = sext i32 %22 to i64, !dbg !146
  %23 = load i32* %i, align 4, !dbg !147
  %idxprom23 = sext i32 %23 to i64, !dbg !146
  %24 = load [1024 x double]** %path.addr, align 8, !dbg !146
  %arrayidx24 = getelementptr inbounds [1024 x double]* %24, i64 %idxprom23, !dbg !146
  %arrayidx25 = getelementptr inbounds [1024 x double]* %arrayidx24, i32 0, i64 %idxprom22, !dbg !146
  %25 = load double* %arrayidx25, align 8, !dbg !146
  %26 = load i32* %j, align 4, !dbg !148
  %idxprom26 = sext i32 %26 to i64, !dbg !149
  %27 = load i32* %k, align 4, !dbg !150
  %idxprom27 = sext i32 %27 to i64, !dbg !149
  %28 = load [1024 x double]** %path.addr, align 8, !dbg !149
  %arrayidx28 = getelementptr inbounds [1024 x double]* %28, i64 %idxprom27, !dbg !149
  %arrayidx29 = getelementptr inbounds [1024 x double]* %arrayidx28, i32 0, i64 %idxprom26, !dbg !149
  %29 = load double* %arrayidx29, align 8, !dbg !149
  %add30 = fadd double %25, %29, !dbg !146
  br label %cond.end, !dbg !134

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi double [ %21, %cond.true ], [ %add30, %cond.false ], !dbg !134
  %30 = load i32* %j, align 4, !dbg !151
  %idxprom31 = sext i32 %30 to i64, !dbg !152
  %31 = load i32* %i, align 4, !dbg !153
  %idxprom32 = sext i32 %31 to i64, !dbg !152
  %32 = load [1024 x double]** %path.addr, align 8, !dbg !152
  %arrayidx33 = getelementptr inbounds [1024 x double]* %32, i64 %idxprom32, !dbg !152
  %arrayidx34 = getelementptr inbounds [1024 x double]* %arrayidx33, i32 0, i64 %idxprom31, !dbg !152
  store double %cond, double* %arrayidx34, align 8, !dbg !152
  br label %for.inc, !dbg !152

for.inc:                                          ; preds = %cond.end
  %33 = load i32* %j, align 4, !dbg !154
  %inc = add nsw i32 %33, 1, !dbg !154
  store i32 %inc, i32* %j, align 4, !dbg !154
  br label %for.cond4, !dbg !155

for.end:                                          ; preds = %for.cond4
  br label %for.inc35, !dbg !156

for.inc35:                                        ; preds = %for.end
  %34 = load i32* %i, align 4, !dbg !157
  %inc36 = add nsw i32 %34, 1, !dbg !157
  store i32 %inc36, i32* %i, align 4, !dbg !157
  br label %for.cond1, !dbg !158

for.end37:                                        ; preds = %for.cond1
  br label %for.inc38, !dbg !159

for.inc38:                                        ; preds = %for.end37
  %35 = load i32* %k, align 4, !dbg !160
  %inc39 = add nsw i32 %35, 1, !dbg !160
  store i32 %inc39, i32* %k, align 4, !dbg !160
  br label %for.cond, !dbg !161

for.end40:                                        ; preds = %for.cond
  ret void, !dbg !162
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #3

; Function Attrs: nounwind uwtable
define internal void @print_array(i32 %n, [1024 x double]* %path) #0 {
entry:
  %n.addr = alloca i32, align 4
  %path.addr = alloca [1024 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !163, metadata !31), !dbg !164
  store [1024 x double]* %path, [1024 x double]** %path.addr, align 8
  call void @llvm.dbg.declare(metadata [1024 x double]** %path.addr, metadata !165, metadata !31), !dbg !166
  call void @llvm.dbg.declare(metadata i32* %i, metadata !167, metadata !31), !dbg !168
  call void @llvm.dbg.declare(metadata i32* %j, metadata !169, metadata !31), !dbg !170
  store i32 0, i32* %i, align 4, !dbg !171
  br label %for.cond, !dbg !171

for.cond:                                         ; preds = %for.inc8, %entry
  %0 = load i32* %i, align 4, !dbg !173
  %1 = load i32* %n.addr, align 4, !dbg !177
  %cmp = icmp slt i32 %0, %1, !dbg !178
  br i1 %cmp, label %for.body, label %for.end10, !dbg !179

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !180
  br label %for.cond1, !dbg !180

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32* %j, align 4, !dbg !182
  %3 = load i32* %n.addr, align 4, !dbg !186
  %cmp2 = icmp slt i32 %2, %3, !dbg !187
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !188

for.body3:                                        ; preds = %for.cond1
  %4 = load %struct._IO_FILE** @stderr, align 8, !dbg !189
  %5 = load i32* %j, align 4, !dbg !191
  %idxprom = sext i32 %5 to i64, !dbg !192
  %6 = load i32* %i, align 4, !dbg !193
  %idxprom4 = sext i32 %6 to i64, !dbg !192
  %7 = load [1024 x double]** %path.addr, align 8, !dbg !192
  %arrayidx = getelementptr inbounds [1024 x double]* %7, i64 %idxprom4, !dbg !192
  %arrayidx5 = getelementptr inbounds [1024 x double]* %arrayidx, i32 0, i64 %idxprom, !dbg !192
  %8 = load double* %arrayidx5, align 8, !dbg !192
  %call = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([8 x i8]* @.str1, i32 0, i32 0), double %8), !dbg !194
  %9 = load i32* %i, align 4, !dbg !195
  %10 = load i32* %n.addr, align 4, !dbg !197
  %mul = mul nsw i32 %9, %10, !dbg !195
  %11 = load i32* %j, align 4, !dbg !198
  %add = add nsw i32 %mul, %11, !dbg !195
  %rem = srem i32 %add, 20, !dbg !199
  %cmp6 = icmp eq i32 %rem, 0, !dbg !199
  br i1 %cmp6, label %if.then, label %if.end, !dbg !200

if.then:                                          ; preds = %for.body3
  %12 = load %struct._IO_FILE** @stderr, align 8, !dbg !201
  %call7 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)), !dbg !203
  br label %if.end, !dbg !203

if.end:                                           ; preds = %if.then, %for.body3
  br label %for.inc, !dbg !204

for.inc:                                          ; preds = %if.end
  %13 = load i32* %j, align 4, !dbg !205
  %inc = add nsw i32 %13, 1, !dbg !205
  store i32 %inc, i32* %j, align 4, !dbg !205
  br label %for.cond1, !dbg !206

for.end:                                          ; preds = %for.cond1
  br label %for.inc8, !dbg !207

for.inc8:                                         ; preds = %for.end
  %14 = load i32* %i, align 4, !dbg !208
  %inc9 = add nsw i32 %14, 1, !dbg !208
  store i32 %inc9, i32* %i, align 4, !dbg !208
  br label %for.cond, !dbg !209

for.end10:                                        ; preds = %for.cond
  %15 = load %struct._IO_FILE** @stderr, align 8, !dbg !210
  %call11 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)), !dbg !211
  ret void, !dbg !212
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
!llvm.module.flags = !{!27, !28}
!llvm.ident = !{!29}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\000\00\000\00\001", !1, !2, !3, !10, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c] [DW_LANG_C99]
!1 = !{!"floyd-warshall.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall"}
!2 = !{}
!3 = !{!4, !9, !6}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!5 = !{!"0x1\00\000\0067108864\0064\000\000\000", null, null, !6, !7, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 67108864, align 64, offset 0] [from double]
!6 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!7 = !{!8, !8}
!8 = !{!"0x21\000\001024"}                        ; [ DW_TAG_subrange_type ] [0, 1023]
!9 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = !{!11, !19, !25, !26}
!11 = !{!"0x2e\00main\00main\00\0073\000\001\000\000\00256\000\0074", !1, !12, !13, null, i32 (i32, i8**)* @main, null, null, !2} ; [ DW_TAG_subprogram ] [line 73] [def] [scope 74] [main]
!12 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c]
!13 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !14, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = !{!15, !15, !16}
!15 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!16 = !{!"0xf\00\000\0064\0064\000\000", null, null, !17} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!17 = !{!"0xf\00\000\0064\0064\000\000", null, null, !18} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!18 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!19 = !{!"0x2e\00print_array\00print_array\00\0037\001\001\000\000\00256\000\0040", !1, !12, !20, null, void (i32, [1024 x double]*)* @print_array, null, null, !2} ; [ DW_TAG_subprogram ] [line 37] [local] [def] [scope 40] [print_array]
!20 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !21, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!21 = !{null, !15, !22}
!22 = !{!"0xf\00\000\0064\0064\000\000", null, null, !23} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!23 = !{!"0x1\00\000\0065536\0064\000\000\000", null, null, !6, !24, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 65536, align 64, offset 0] [from double]
!24 = !{!8}
!25 = !{!"0x2e\00kernel_floyd_warshall\00kernel_floyd_warshall\00\0055\001\001\000\000\00256\000\0057", !1, !12, !20, null, void (i32, [1024 x double]*)* @kernel_floyd_warshall, null, null, !2} ; [ DW_TAG_subprogram ] [line 55] [local] [def] [scope 57] [kernel_floyd_warshall]
!26 = !{!"0x2e\00init_array\00init_array\00\0023\001\001\000\000\00256\000\0025", !1, !12, !20, null, void (i32, [1024 x double]*)* @init_array, null, null, !2} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [scope 25] [init_array]
!27 = !{i32 2, !"Dwarf Version", i32 4}
!28 = !{i32 2, !"Debug Info Version", i32 2}
!29 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!30 = !{!"0x101\00argc\0016777289\000", !11, !12, !15} ; [ DW_TAG_arg_variable ] [argc] [line 73]
!31 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!32 = !MDLocation(line: 73, column: 14, scope: !11)
!33 = !{!"0x101\00argv\0033554505\000", !11, !12, !16} ; [ DW_TAG_arg_variable ] [argv] [line 73]
!34 = !MDLocation(line: 73, column: 27, scope: !11)
!35 = !{!"0x100\00n\0076\000", !11, !12, !15}     ; [ DW_TAG_auto_variable ] [n] [line 76]
!36 = !MDLocation(line: 76, column: 7, scope: !11)
!37 = !{!"0x100\00path\0079\000", !11, !12, !4}   ; [ DW_TAG_auto_variable ] [path] [line 79]
!38 = !MDLocation(line: 79, column: 3, scope: !11)
!39 = !MDLocation(line: 83, column: 15, scope: !11)
!40 = !MDLocation(line: 83, column: 18, scope: !11)
!41 = !MDLocation(line: 83, column: 3, scope: !11)
!42 = !MDLocation(line: 89, column: 26, scope: !11)
!43 = !MDLocation(line: 89, column: 29, scope: !11)
!44 = !MDLocation(line: 89, column: 3, scope: !11)
!45 = !MDLocation(line: 97, column: 3, scope: !46)
!46 = !{!"0xb\0097\003\000", !1, !11}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c]
!47 = !MDLocation(line: 97, column: 3, scope: !11)
!48 = !MDLocation(line: 97, column: 3, scope: !49)
!49 = !{!"0xb\001", !1, !46}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c]
!50 = !MDLocation(line: 97, column: 3, scope: !51)
!51 = !{!"0xb\002", !1, !46}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c]
!52 = !MDLocation(line: 100, column: 3, scope: !11)
!53 = !MDLocation(line: 102, column: 3, scope: !11)
!54 = !{!"0x101\00n\0016777239\000", !26, !12, !15} ; [ DW_TAG_arg_variable ] [n] [line 23]
!55 = !MDLocation(line: 23, column: 22, scope: !26)
!56 = !{!"0x101\00path\0033554456\000", !26, !12, !22} ; [ DW_TAG_arg_variable ] [path] [line 24]
!57 = !MDLocation(line: 24, column: 14, scope: !26)
!58 = !{!"0x100\00i\0026\000", !26, !12, !15}     ; [ DW_TAG_auto_variable ] [i] [line 26]
!59 = !MDLocation(line: 26, column: 7, scope: !26)
!60 = !{!"0x100\00j\0026\000", !26, !12, !15}     ; [ DW_TAG_auto_variable ] [j] [line 26]
!61 = !MDLocation(line: 26, column: 10, scope: !26)
!62 = !MDLocation(line: 28, column: 8, scope: !63)
!63 = !{!"0xb\0028\003\0014", !1, !26}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c]
!64 = !MDLocation(line: 28, column: 15, scope: !65)
!65 = !{!"0xb\002", !1, !66}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c]
!66 = !{!"0xb\001", !1, !67}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c]
!67 = !{!"0xb\0028\003\0015", !1, !63}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c]
!68 = !MDLocation(line: 28, column: 19, scope: !67)
!69 = !MDLocation(line: 28, column: 15, scope: !67)
!70 = !MDLocation(line: 28, column: 3, scope: !63)
!71 = !MDLocation(line: 29, column: 10, scope: !72)
!72 = !{!"0xb\0029\005\0016", !1, !67}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c]
!73 = !MDLocation(line: 29, column: 17, scope: !74)
!74 = !{!"0xb\002", !1, !75}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c]
!75 = !{!"0xb\001", !1, !76}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c]
!76 = !{!"0xb\0029\005\0017", !1, !72}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c]
!77 = !MDLocation(line: 29, column: 21, scope: !76)
!78 = !MDLocation(line: 29, column: 17, scope: !76)
!79 = !MDLocation(line: 29, column: 5, scope: !72)
!80 = !MDLocation(line: 30, column: 34, scope: !76)
!81 = !MDLocation(line: 30, column: 21, scope: !76)
!82 = !MDLocation(line: 30, column: 40, scope: !76)
!83 = !MDLocation(line: 30, column: 39, scope: !76)
!84 = !MDLocation(line: 30, column: 48, scope: !76)
!85 = !MDLocation(line: 30, column: 20, scope: !76)
!86 = !MDLocation(line: 30, column: 15, scope: !76)
!87 = !MDLocation(line: 30, column: 7, scope: !76)
!88 = !MDLocation(line: 30, column: 12, scope: !76)
!89 = !MDLocation(line: 29, column: 24, scope: !76)
!90 = !MDLocation(line: 29, column: 5, scope: !76)
!91 = !MDLocation(line: 30, column: 48, scope: !72)
!92 = !MDLocation(line: 28, column: 22, scope: !67)
!93 = !MDLocation(line: 28, column: 3, scope: !67)
!94 = !MDLocation(line: 31, column: 1, scope: !26)
!95 = !{!"0x101\00n\0016777271\000", !25, !12, !15} ; [ DW_TAG_arg_variable ] [n] [line 55]
!96 = !MDLocation(line: 55, column: 32, scope: !25)
!97 = !{!"0x101\00path\0033554488\000", !25, !12, !22} ; [ DW_TAG_arg_variable ] [path] [line 56]
!98 = !MDLocation(line: 56, column: 17, scope: !25)
!99 = !{!"0x100\00i\0058\000", !25, !12, !15}     ; [ DW_TAG_auto_variable ] [i] [line 58]
!100 = !MDLocation(line: 58, column: 7, scope: !25)
!101 = !{!"0x100\00j\0058\000", !25, !12, !15}    ; [ DW_TAG_auto_variable ] [j] [line 58]
!102 = !MDLocation(line: 58, column: 10, scope: !25)
!103 = !{!"0x100\00k\0058\000", !25, !12, !15}    ; [ DW_TAG_auto_variable ] [k] [line 58]
!104 = !MDLocation(line: 58, column: 13, scope: !25)
!105 = !MDLocation(line: 61, column: 8, scope: !106)
!106 = !{!"0xb\0061\003\007", !1, !25}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c]
!107 = !MDLocation(line: 61, column: 15, scope: !108)
!108 = !{!"0xb\002", !1, !109}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c]
!109 = !{!"0xb\001", !1, !110}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c]
!110 = !{!"0xb\0061\003\008", !1, !106}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c]
!111 = !MDLocation(line: 61, column: 19, scope: !110)
!112 = !MDLocation(line: 61, column: 15, scope: !110)
!113 = !MDLocation(line: 61, column: 3, scope: !106)
!114 = !MDLocation(line: 63, column: 11, scope: !115)
!115 = !{!"0xb\0063\007\0010", !1, !116}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c]
!116 = !{!"0xb\0062\005\009", !1, !110}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c]
!117 = !MDLocation(line: 63, column: 18, scope: !118)
!118 = !{!"0xb\002", !1, !119}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c]
!119 = !{!"0xb\001", !1, !120}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c]
!120 = !{!"0xb\0063\007\0011", !1, !115}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c]
!121 = !MDLocation(line: 63, column: 22, scope: !120)
!122 = !MDLocation(line: 63, column: 18, scope: !120)
!123 = !MDLocation(line: 63, column: 7, scope: !115)
!124 = !MDLocation(line: 64, column: 7, scope: !125)
!125 = !{!"0xb\0064\002\0012", !1, !120}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c]
!126 = !MDLocation(line: 64, column: 14, scope: !127)
!127 = !{!"0xb\002", !1, !128}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c]
!128 = !{!"0xb\001", !1, !129}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c]
!129 = !{!"0xb\0064\002\0013", !1, !125}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c]
!130 = !MDLocation(line: 64, column: 18, scope: !129)
!131 = !MDLocation(line: 64, column: 14, scope: !129)
!132 = !MDLocation(line: 64, column: 2, scope: !125)
!133 = !MDLocation(line: 65, column: 25, scope: !129)
!134 = !MDLocation(line: 65, column: 17, scope: !129)
!135 = !MDLocation(line: 65, column: 22, scope: !129)
!136 = !MDLocation(line: 65, column: 38, scope: !129)
!137 = !MDLocation(line: 65, column: 30, scope: !129)
!138 = !MDLocation(line: 65, column: 35, scope: !129)
!139 = !MDLocation(line: 65, column: 51, scope: !129)
!140 = !MDLocation(line: 65, column: 43, scope: !129)
!141 = !MDLocation(line: 65, column: 48, scope: !129)
!142 = !MDLocation(line: 66, column: 14, scope: !129)
!143 = !MDLocation(line: 66, column: 6, scope: !129)
!144 = !MDLocation(line: 66, column: 11, scope: !129)
!145 = !MDLocation(line: 66, column: 27, scope: !129)
!146 = !MDLocation(line: 66, column: 19, scope: !129)
!147 = !MDLocation(line: 66, column: 24, scope: !129)
!148 = !MDLocation(line: 66, column: 40, scope: !129)
!149 = !MDLocation(line: 66, column: 32, scope: !129)
!150 = !MDLocation(line: 66, column: 37, scope: !129)
!151 = !MDLocation(line: 65, column: 12, scope: !127)
!152 = !MDLocation(line: 65, column: 4, scope: !129)
!153 = !MDLocation(line: 65, column: 9, scope: !129)
!154 = !MDLocation(line: 64, column: 21, scope: !129)
!155 = !MDLocation(line: 64, column: 2, scope: !129)
!156 = !MDLocation(line: 66, column: 41, scope: !125)
!157 = !MDLocation(line: 63, column: 25, scope: !120)
!158 = !MDLocation(line: 63, column: 7, scope: !120)
!159 = !MDLocation(line: 67, column: 5, scope: !116)
!160 = !MDLocation(line: 61, column: 22, scope: !110)
!161 = !MDLocation(line: 61, column: 3, scope: !110)
!162 = !MDLocation(line: 70, column: 1, scope: !25)
!163 = !{!"0x101\00n\0016777253\000", !19, !12, !15} ; [ DW_TAG_arg_variable ] [n] [line 37]
!164 = !MDLocation(line: 37, column: 22, scope: !19)
!165 = !{!"0x101\00path\0033554470\000", !19, !12, !22} ; [ DW_TAG_arg_variable ] [path] [line 38]
!166 = !MDLocation(line: 38, column: 14, scope: !19)
!167 = !{!"0x100\00i\0041\000", !19, !12, !15}    ; [ DW_TAG_auto_variable ] [i] [line 41]
!168 = !MDLocation(line: 41, column: 7, scope: !19)
!169 = !{!"0x100\00j\0041\000", !19, !12, !15}    ; [ DW_TAG_auto_variable ] [j] [line 41]
!170 = !MDLocation(line: 41, column: 10, scope: !19)
!171 = !MDLocation(line: 43, column: 8, scope: !172)
!172 = !{!"0xb\0043\003\001", !1, !19}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c]
!173 = !MDLocation(line: 43, column: 15, scope: !174)
!174 = !{!"0xb\002", !1, !175}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c]
!175 = !{!"0xb\001", !1, !176}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c]
!176 = !{!"0xb\0043\003\002", !1, !172}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c]
!177 = !MDLocation(line: 43, column: 19, scope: !176)
!178 = !MDLocation(line: 43, column: 15, scope: !176)
!179 = !MDLocation(line: 43, column: 3, scope: !172)
!180 = !MDLocation(line: 44, column: 10, scope: !181)
!181 = !{!"0xb\0044\005\003", !1, !176}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c]
!182 = !MDLocation(line: 44, column: 17, scope: !183)
!183 = !{!"0xb\002", !1, !184}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c]
!184 = !{!"0xb\001", !1, !185}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c]
!185 = !{!"0xb\0044\005\004", !1, !181}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c]
!186 = !MDLocation(line: 44, column: 21, scope: !185)
!187 = !MDLocation(line: 44, column: 17, scope: !185)
!188 = !MDLocation(line: 44, column: 5, scope: !181)
!189 = !MDLocation(line: 45, column: 16, scope: !190)
!190 = !{!"0xb\0044\0029\005", !1, !185}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c]
!191 = !MDLocation(line: 45, column: 54, scope: !190)
!192 = !MDLocation(line: 45, column: 46, scope: !190)
!193 = !MDLocation(line: 45, column: 51, scope: !190)
!194 = !MDLocation(line: 45, column: 7, scope: !190)
!195 = !MDLocation(line: 46, column: 12, scope: !196)
!196 = !{!"0xb\0046\0011\006", !1, !190}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c]
!197 = !MDLocation(line: 46, column: 16, scope: !196)
!198 = !MDLocation(line: 46, column: 20, scope: !196)
!199 = !MDLocation(line: 46, column: 11, scope: !196)
!200 = !MDLocation(line: 46, column: 11, scope: !190)
!201 = !MDLocation(line: 46, column: 43, scope: !202)
!202 = !{!"0xb\001", !1, !196}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/floyd-warshall/floyd-warshall.c]
!203 = !MDLocation(line: 46, column: 34, scope: !196)
!204 = !MDLocation(line: 47, column: 5, scope: !190)
!205 = !MDLocation(line: 44, column: 24, scope: !185)
!206 = !MDLocation(line: 44, column: 5, scope: !185)
!207 = !MDLocation(line: 47, column: 5, scope: !181)
!208 = !MDLocation(line: 43, column: 22, scope: !176)
!209 = !MDLocation(line: 43, column: 3, scope: !176)
!210 = !MDLocation(line: 48, column: 12, scope: !19)
!211 = !MDLocation(line: 48, column: 3, scope: !19)
!212 = !MDLocation(line: 49, column: 1, scope: !19)
