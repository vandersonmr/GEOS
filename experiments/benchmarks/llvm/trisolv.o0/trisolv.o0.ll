; ModuleID = 'trisolv.c'
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
  %A = alloca [4000 x [4000 x double]]*, align 8
  %x = alloca [4000 x double]*, align 8
  %c = alloca [4000 x double]*, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !33, metadata !34), !dbg !35
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !36, metadata !34), !dbg !37
  call void @llvm.dbg.declare(metadata i32* %n, metadata !38, metadata !34), !dbg !39
  store i32 4000, i32* %n, align 4, !dbg !39
  call void @llvm.dbg.declare(metadata [4000 x [4000 x double]]** %A, metadata !40, metadata !34), !dbg !41
  %call = call i8* @polybench_alloc_data(i32 16000000, i32 8), !dbg !41
  %0 = bitcast i8* %call to [4000 x [4000 x double]]*, !dbg !41
  store [4000 x [4000 x double]]* %0, [4000 x [4000 x double]]** %A, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata [4000 x double]** %x, metadata !42, metadata !34), !dbg !43
  %call1 = call i8* @polybench_alloc_data(i32 4000, i32 8), !dbg !43
  %1 = bitcast i8* %call1 to [4000 x double]*, !dbg !43
  store [4000 x double]* %1, [4000 x double]** %x, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata [4000 x double]** %c, metadata !44, metadata !34), !dbg !45
  %call2 = call i8* @polybench_alloc_data(i32 4000, i32 8), !dbg !45
  %2 = bitcast i8* %call2 to [4000 x double]*, !dbg !45
  store [4000 x double]* %2, [4000 x double]** %c, align 8, !dbg !45
  %3 = load i32* %n, align 4, !dbg !46
  %4 = load [4000 x [4000 x double]]** %A, align 8, !dbg !47
  %arraydecay = getelementptr inbounds [4000 x [4000 x double]]* %4, i32 0, i32 0, !dbg !47
  %5 = load [4000 x double]** %x, align 8, !dbg !48
  %arraydecay3 = getelementptr inbounds [4000 x double]* %5, i32 0, i32 0, !dbg !48
  %6 = load [4000 x double]** %c, align 8, !dbg !49
  %arraydecay4 = getelementptr inbounds [4000 x double]* %6, i32 0, i32 0, !dbg !49
  call void @init_array(i32 %3, [4000 x double]* %arraydecay, double* %arraydecay3, double* %arraydecay4), !dbg !50
  %7 = load i32* %n, align 4, !dbg !51
  %8 = load [4000 x [4000 x double]]** %A, align 8, !dbg !52
  %arraydecay5 = getelementptr inbounds [4000 x [4000 x double]]* %8, i32 0, i32 0, !dbg !52
  %9 = load [4000 x double]** %x, align 8, !dbg !53
  %arraydecay6 = getelementptr inbounds [4000 x double]* %9, i32 0, i32 0, !dbg !53
  %10 = load [4000 x double]** %c, align 8, !dbg !54
  %arraydecay7 = getelementptr inbounds [4000 x double]* %10, i32 0, i32 0, !dbg !54
  call void @kernel_trisolv(i32 %7, [4000 x double]* %arraydecay5, double* %arraydecay6, double* %arraydecay7), !dbg !55
  %11 = load i32* %argc.addr, align 4, !dbg !56
  %cmp = icmp sgt i32 %11, 42, !dbg !56
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !58

land.lhs.true:                                    ; preds = %entry
  %12 = load i8*** %argv.addr, align 8, !dbg !59
  %arrayidx = getelementptr inbounds i8** %12, i64 0, !dbg !59
  %13 = load i8** %arrayidx, align 8, !dbg !59
  %call8 = call i32 @strcmp(i8* %13, i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0)) #5, !dbg !59
  %tobool = icmp ne i32 %call8, 0, !dbg !58
  br i1 %tobool, label %if.end, label %if.then, !dbg !58

if.then:                                          ; preds = %land.lhs.true
  %14 = load i32* %n, align 4, !dbg !61
  %15 = load [4000 x double]** %x, align 8, !dbg !61
  %arraydecay9 = getelementptr inbounds [4000 x double]* %15, i32 0, i32 0, !dbg !61
  call void @print_array(i32 %14, double* %arraydecay9), !dbg !61
  br label %if.end, !dbg !61

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %16 = load [4000 x [4000 x double]]** %A, align 8, !dbg !63
  %17 = bitcast [4000 x [4000 x double]]* %16 to i8*, !dbg !63
  call void @free(i8* %17) #6, !dbg !63
  %18 = load [4000 x double]** %x, align 8, !dbg !64
  %19 = bitcast [4000 x double]* %18 to i8*, !dbg !64
  call void @free(i8* %19) #6, !dbg !64
  %20 = load [4000 x double]** %c, align 8, !dbg !65
  %21 = bitcast [4000 x double]* %20 to i8*, !dbg !65
  call void @free(i8* %21) #6, !dbg !65
  ret i32 0, !dbg !66
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i8* @polybench_alloc_data(i32, i32) #2

; Function Attrs: nounwind uwtable
define internal void @init_array(i32 %n, [4000 x double]* %A, double* %x, double* %c) #0 {
entry:
  %n.addr = alloca i32, align 4
  %A.addr = alloca [4000 x double]*, align 8
  %x.addr = alloca double*, align 8
  %c.addr = alloca double*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !67, metadata !34), !dbg !68
  store [4000 x double]* %A, [4000 x double]** %A.addr, align 8
  call void @llvm.dbg.declare(metadata [4000 x double]** %A.addr, metadata !69, metadata !34), !dbg !70
  store double* %x, double** %x.addr, align 8
  call void @llvm.dbg.declare(metadata double** %x.addr, metadata !71, metadata !34), !dbg !72
  store double* %c, double** %c.addr, align 8
  call void @llvm.dbg.declare(metadata double** %c.addr, metadata !73, metadata !34), !dbg !74
  call void @llvm.dbg.declare(metadata i32* %i, metadata !75, metadata !34), !dbg !76
  call void @llvm.dbg.declare(metadata i32* %j, metadata !77, metadata !34), !dbg !78
  store i32 0, i32* %i, align 4, !dbg !79
  br label %for.cond, !dbg !79

for.cond:                                         ; preds = %for.inc16, %entry
  %0 = load i32* %i, align 4, !dbg !81
  %1 = load i32* %n.addr, align 4, !dbg !85
  %cmp = icmp slt i32 %0, %1, !dbg !86
  br i1 %cmp, label %for.body, label %for.end18, !dbg !87

for.body:                                         ; preds = %for.cond
  %2 = load i32* %i, align 4, !dbg !88
  %conv = sitofp i32 %2 to double, !dbg !90
  %3 = load i32* %n.addr, align 4, !dbg !91
  %conv1 = sitofp i32 %3 to double, !dbg !91
  %div = fdiv double %conv, %conv1, !dbg !92
  %4 = load i32* %i, align 4, !dbg !93
  %idxprom = sext i32 %4 to i64, !dbg !94
  %5 = load double** %x.addr, align 8, !dbg !94
  %arrayidx = getelementptr inbounds double* %5, i64 %idxprom, !dbg !94
  store double %div, double* %arrayidx, align 8, !dbg !94
  %6 = load i32* %i, align 4, !dbg !95
  %idxprom2 = sext i32 %6 to i64, !dbg !96
  %7 = load double** %c.addr, align 8, !dbg !96
  %arrayidx3 = getelementptr inbounds double* %7, i64 %idxprom2, !dbg !96
  store double %div, double* %arrayidx3, align 8, !dbg !96
  store i32 0, i32* %j, align 4, !dbg !97
  br label %for.cond4, !dbg !97

for.cond4:                                        ; preds = %for.inc, %for.body
  %8 = load i32* %j, align 4, !dbg !99
  %9 = load i32* %n.addr, align 4, !dbg !103
  %cmp5 = icmp slt i32 %8, %9, !dbg !104
  br i1 %cmp5, label %for.body7, label %for.end, !dbg !105

for.body7:                                        ; preds = %for.cond4
  %10 = load i32* %i, align 4, !dbg !106
  %conv8 = sitofp i32 %10 to double, !dbg !107
  %11 = load i32* %j, align 4, !dbg !108
  %conv9 = sitofp i32 %11 to double, !dbg !108
  %mul = fmul double %conv8, %conv9, !dbg !107
  %12 = load i32* %n.addr, align 4, !dbg !109
  %conv10 = sitofp i32 %12 to double, !dbg !109
  %div11 = fdiv double %mul, %conv10, !dbg !110
  %13 = load i32* %j, align 4, !dbg !111
  %idxprom12 = sext i32 %13 to i64, !dbg !112
  %14 = load i32* %i, align 4, !dbg !113
  %idxprom13 = sext i32 %14 to i64, !dbg !112
  %15 = load [4000 x double]** %A.addr, align 8, !dbg !112
  %arrayidx14 = getelementptr inbounds [4000 x double]* %15, i64 %idxprom13, !dbg !112
  %arrayidx15 = getelementptr inbounds [4000 x double]* %arrayidx14, i32 0, i64 %idxprom12, !dbg !112
  store double %div11, double* %arrayidx15, align 8, !dbg !112
  br label %for.inc, !dbg !112

for.inc:                                          ; preds = %for.body7
  %16 = load i32* %j, align 4, !dbg !114
  %inc = add nsw i32 %16, 1, !dbg !114
  store i32 %inc, i32* %j, align 4, !dbg !114
  br label %for.cond4, !dbg !115

for.end:                                          ; preds = %for.cond4
  br label %for.inc16, !dbg !116

for.inc16:                                        ; preds = %for.end
  %17 = load i32* %i, align 4, !dbg !117
  %inc17 = add nsw i32 %17, 1, !dbg !117
  store i32 %inc17, i32* %i, align 4, !dbg !117
  br label %for.cond, !dbg !118

for.end18:                                        ; preds = %for.cond
  ret void, !dbg !119
}

; Function Attrs: nounwind uwtable
define internal void @kernel_trisolv(i32 %n, [4000 x double]* %A, double* %x, double* %c) #0 {
entry:
  %n.addr = alloca i32, align 4
  %A.addr = alloca [4000 x double]*, align 8
  %x.addr = alloca double*, align 8
  %c.addr = alloca double*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !120, metadata !34), !dbg !121
  store [4000 x double]* %A, [4000 x double]** %A.addr, align 8
  call void @llvm.dbg.declare(metadata [4000 x double]** %A.addr, metadata !122, metadata !34), !dbg !123
  store double* %x, double** %x.addr, align 8
  call void @llvm.dbg.declare(metadata double** %x.addr, metadata !124, metadata !34), !dbg !125
  store double* %c, double** %c.addr, align 8
  call void @llvm.dbg.declare(metadata double** %c.addr, metadata !126, metadata !34), !dbg !127
  call void @llvm.dbg.declare(metadata i32* %i, metadata !128, metadata !34), !dbg !129
  call void @llvm.dbg.declare(metadata i32* %j, metadata !130, metadata !34), !dbg !131
  store i32 0, i32* %i, align 4, !dbg !132
  br label %for.cond, !dbg !132

for.cond:                                         ; preds = %for.inc25, %entry
  %0 = load i32* %i, align 4, !dbg !134
  %1 = load i32* %n.addr, align 4, !dbg !138
  %cmp = icmp slt i32 %0, %1, !dbg !139
  br i1 %cmp, label %for.body, label %for.end27, !dbg !140

for.body:                                         ; preds = %for.cond
  %2 = load i32* %i, align 4, !dbg !141
  %idxprom = sext i32 %2 to i64, !dbg !143
  %3 = load double** %c.addr, align 8, !dbg !143
  %arrayidx = getelementptr inbounds double* %3, i64 %idxprom, !dbg !143
  %4 = load double* %arrayidx, align 8, !dbg !143
  %5 = load i32* %i, align 4, !dbg !144
  %idxprom1 = sext i32 %5 to i64, !dbg !145
  %6 = load double** %x.addr, align 8, !dbg !145
  %arrayidx2 = getelementptr inbounds double* %6, i64 %idxprom1, !dbg !145
  store double %4, double* %arrayidx2, align 8, !dbg !145
  store i32 0, i32* %j, align 4, !dbg !146
  br label %for.cond3, !dbg !146

for.cond3:                                        ; preds = %for.inc, %for.body
  %7 = load i32* %j, align 4, !dbg !148
  %8 = load i32* %i, align 4, !dbg !152
  %sub = sub nsw i32 %8, 1, !dbg !152
  %cmp4 = icmp sle i32 %7, %sub, !dbg !153
  br i1 %cmp4, label %for.body5, label %for.end, !dbg !154

for.body5:                                        ; preds = %for.cond3
  %9 = load i32* %i, align 4, !dbg !155
  %idxprom6 = sext i32 %9 to i64, !dbg !156
  %10 = load double** %x.addr, align 8, !dbg !156
  %arrayidx7 = getelementptr inbounds double* %10, i64 %idxprom6, !dbg !156
  %11 = load double* %arrayidx7, align 8, !dbg !156
  %12 = load i32* %j, align 4, !dbg !157
  %idxprom8 = sext i32 %12 to i64, !dbg !158
  %13 = load i32* %i, align 4, !dbg !159
  %idxprom9 = sext i32 %13 to i64, !dbg !158
  %14 = load [4000 x double]** %A.addr, align 8, !dbg !158
  %arrayidx10 = getelementptr inbounds [4000 x double]* %14, i64 %idxprom9, !dbg !158
  %arrayidx11 = getelementptr inbounds [4000 x double]* %arrayidx10, i32 0, i64 %idxprom8, !dbg !158
  %15 = load double* %arrayidx11, align 8, !dbg !158
  %16 = load i32* %j, align 4, !dbg !160
  %idxprom12 = sext i32 %16 to i64, !dbg !161
  %17 = load double** %x.addr, align 8, !dbg !161
  %arrayidx13 = getelementptr inbounds double* %17, i64 %idxprom12, !dbg !161
  %18 = load double* %arrayidx13, align 8, !dbg !161
  %mul = fmul double %15, %18, !dbg !158
  %sub14 = fsub double %11, %mul, !dbg !156
  %19 = load i32* %i, align 4, !dbg !162
  %idxprom15 = sext i32 %19 to i64, !dbg !163
  %20 = load double** %x.addr, align 8, !dbg !163
  %arrayidx16 = getelementptr inbounds double* %20, i64 %idxprom15, !dbg !163
  store double %sub14, double* %arrayidx16, align 8, !dbg !163
  br label %for.inc, !dbg !163

for.inc:                                          ; preds = %for.body5
  %21 = load i32* %j, align 4, !dbg !164
  %inc = add nsw i32 %21, 1, !dbg !164
  store i32 %inc, i32* %j, align 4, !dbg !164
  br label %for.cond3, !dbg !165

for.end:                                          ; preds = %for.cond3
  %22 = load i32* %i, align 4, !dbg !166
  %idxprom17 = sext i32 %22 to i64, !dbg !167
  %23 = load double** %x.addr, align 8, !dbg !167
  %arrayidx18 = getelementptr inbounds double* %23, i64 %idxprom17, !dbg !167
  %24 = load double* %arrayidx18, align 8, !dbg !167
  %25 = load i32* %i, align 4, !dbg !168
  %idxprom19 = sext i32 %25 to i64, !dbg !169
  %26 = load i32* %i, align 4, !dbg !170
  %idxprom20 = sext i32 %26 to i64, !dbg !169
  %27 = load [4000 x double]** %A.addr, align 8, !dbg !169
  %arrayidx21 = getelementptr inbounds [4000 x double]* %27, i64 %idxprom20, !dbg !169
  %arrayidx22 = getelementptr inbounds [4000 x double]* %arrayidx21, i32 0, i64 %idxprom19, !dbg !169
  %28 = load double* %arrayidx22, align 8, !dbg !169
  %div = fdiv double %24, %28, !dbg !167
  %29 = load i32* %i, align 4, !dbg !171
  %idxprom23 = sext i32 %29 to i64, !dbg !172
  %30 = load double** %x.addr, align 8, !dbg !172
  %arrayidx24 = getelementptr inbounds double* %30, i64 %idxprom23, !dbg !172
  store double %div, double* %arrayidx24, align 8, !dbg !172
  br label %for.inc25, !dbg !173

for.inc25:                                        ; preds = %for.end
  %31 = load i32* %i, align 4, !dbg !174
  %inc26 = add nsw i32 %31, 1, !dbg !174
  store i32 %inc26, i32* %i, align 4, !dbg !174
  br label %for.cond, !dbg !175

for.end27:                                        ; preds = %for.cond
  ret void, !dbg !176
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #3

; Function Attrs: nounwind uwtable
define internal void @print_array(i32 %n, double* %x) #0 {
entry:
  %n.addr = alloca i32, align 4
  %x.addr = alloca double*, align 8
  %i = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !177, metadata !34), !dbg !178
  store double* %x, double** %x.addr, align 8
  call void @llvm.dbg.declare(metadata double** %x.addr, metadata !179, metadata !34), !dbg !180
  call void @llvm.dbg.declare(metadata i32* %i, metadata !181, metadata !34), !dbg !182
  store i32 0, i32* %i, align 4, !dbg !183
  br label %for.cond, !dbg !183

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4, !dbg !185
  %1 = load i32* %n.addr, align 4, !dbg !189
  %cmp = icmp slt i32 %0, %1, !dbg !190
  br i1 %cmp, label %for.body, label %for.end, !dbg !191

for.body:                                         ; preds = %for.cond
  %2 = load %struct._IO_FILE** @stderr, align 8, !dbg !192
  %3 = load i32* %i, align 4, !dbg !194
  %idxprom = sext i32 %3 to i64, !dbg !195
  %4 = load double** %x.addr, align 8, !dbg !195
  %arrayidx = getelementptr inbounds double* %4, i64 %idxprom, !dbg !195
  %5 = load double* %arrayidx, align 8, !dbg !195
  %call = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([8 x i8]* @.str1, i32 0, i32 0), double %5), !dbg !196
  %6 = load i32* %i, align 4, !dbg !197
  %rem = srem i32 %6, 20, !dbg !197
  %cmp1 = icmp eq i32 %rem, 0, !dbg !197
  br i1 %cmp1, label %if.then, label %if.end, !dbg !199

if.then:                                          ; preds = %for.body
  %7 = load %struct._IO_FILE** @stderr, align 8, !dbg !200
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)), !dbg !202
  br label %if.end, !dbg !202

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc, !dbg !203

for.inc:                                          ; preds = %if.end
  %8 = load i32* %i, align 4, !dbg !204
  %inc = add nsw i32 %8, 1, !dbg !204
  store i32 %inc, i32* %i, align 4, !dbg !204
  br label %for.cond, !dbg !205

for.end:                                          ; preds = %for.cond
  ret void, !dbg !206
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
!llvm.module.flags = !{!30, !31}
!llvm.ident = !{!32}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\000\00\000\00\001", !1, !2, !3, !13, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c] [DW_LANG_C99]
!1 = !{!"trisolv.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv"}
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
!14 = !{!"0x2e\00main\00main\00\0078\000\001\000\000\00256\000\0079", !1, !15, !16, null, i32 (i32, i8**)* @main, null, null, !2} ; [ DW_TAG_subprogram ] [line 78] [def] [scope 79] [main]
!15 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!16 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !17, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!17 = !{!18, !18, !19}
!18 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!19 = !{!"0xf\00\000\0064\0064\000\000", null, null, !20} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!20 = !{!"0xf\00\000\0064\0064\000\000", null, null, !21} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!21 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!22 = !{!"0x2e\00print_array\00print_array\00\0042\001\001\000\000\00256\000\0045", !1, !15, !23, null, void (i32, double*)* @print_array, null, null, !2} ; [ DW_TAG_subprogram ] [line 42] [local] [def] [scope 45] [print_array]
!23 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !24, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!24 = !{null, !18, !25}
!25 = !{!"0xf\00\000\0064\0064\000\000", null, null, !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!26 = !{!"0x2e\00kernel_trisolv\00kernel_trisolv\00\0058\001\001\000\000\00256\000\0062", !1, !15, !27, null, void (i32, [4000 x double]*, double*, double*)* @kernel_trisolv, null, null, !2} ; [ DW_TAG_subprogram ] [line 58] [local] [def] [scope 62] [kernel_trisolv]
!27 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !28, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!28 = !{null, !18, !9, !25, !25}
!29 = !{!"0x2e\00init_array\00init_array\00\0023\001\001\000\000\00256\000\0027", !1, !15, !27, null, void (i32, [4000 x double]*, double*, double*)* @init_array, null, null, !2} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [scope 27] [init_array]
!30 = !{i32 2, !"Dwarf Version", i32 4}
!31 = !{i32 2, !"Debug Info Version", i32 2}
!32 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!33 = !{!"0x101\00argc\0016777294\000", !14, !15, !18} ; [ DW_TAG_arg_variable ] [argc] [line 78]
!34 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!35 = !MDLocation(line: 78, column: 14, scope: !14)
!36 = !{!"0x101\00argv\0033554510\000", !14, !15, !19} ; [ DW_TAG_arg_variable ] [argv] [line 78]
!37 = !MDLocation(line: 78, column: 27, scope: !14)
!38 = !{!"0x100\00n\0081\000", !14, !15, !18}     ; [ DW_TAG_auto_variable ] [n] [line 81]
!39 = !MDLocation(line: 81, column: 7, scope: !14)
!40 = !{!"0x100\00A\0084\000", !14, !15, !4}      ; [ DW_TAG_auto_variable ] [A] [line 84]
!41 = !MDLocation(line: 84, column: 3, scope: !14)
!42 = !{!"0x100\00x\0085\000", !14, !15, !9}      ; [ DW_TAG_auto_variable ] [x] [line 85]
!43 = !MDLocation(line: 85, column: 3, scope: !14)
!44 = !{!"0x100\00c\0086\000", !14, !15, !9}      ; [ DW_TAG_auto_variable ] [c] [line 86]
!45 = !MDLocation(line: 86, column: 3, scope: !14)
!46 = !MDLocation(line: 90, column: 15, scope: !14)
!47 = !MDLocation(line: 90, column: 18, scope: !14)
!48 = !MDLocation(line: 90, column: 38, scope: !14)
!49 = !MDLocation(line: 90, column: 58, scope: !14)
!50 = !MDLocation(line: 90, column: 3, scope: !14)
!51 = !MDLocation(line: 96, column: 19, scope: !14)
!52 = !MDLocation(line: 96, column: 22, scope: !14)
!53 = !MDLocation(line: 96, column: 42, scope: !14)
!54 = !MDLocation(line: 96, column: 62, scope: !14)
!55 = !MDLocation(line: 96, column: 3, scope: !14)
!56 = !MDLocation(line: 104, column: 3, scope: !57)
!57 = !{!"0xb\00104\003\000", !1, !14}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!58 = !MDLocation(line: 104, column: 3, scope: !14)
!59 = !MDLocation(line: 104, column: 3, scope: !60)
!60 = !{!"0xb\001", !1, !57}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!61 = !MDLocation(line: 104, column: 3, scope: !62)
!62 = !{!"0xb\002", !1, !57}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!63 = !MDLocation(line: 107, column: 3, scope: !14)
!64 = !MDLocation(line: 108, column: 3, scope: !14)
!65 = !MDLocation(line: 109, column: 3, scope: !14)
!66 = !MDLocation(line: 111, column: 3, scope: !14)
!67 = !{!"0x101\00n\0016777239\000", !29, !15, !18} ; [ DW_TAG_arg_variable ] [n] [line 23]
!68 = !MDLocation(line: 23, column: 21, scope: !29)
!69 = !{!"0x101\00A\0033554456\000", !29, !15, !9} ; [ DW_TAG_arg_variable ] [A] [line 24]
!70 = !MDLocation(line: 24, column: 13, scope: !29)
!71 = !{!"0x101\00x\0050331673\000", !29, !15, !25} ; [ DW_TAG_arg_variable ] [x] [line 25]
!72 = !MDLocation(line: 25, column: 13, scope: !29)
!73 = !{!"0x101\00c\0067108890\000", !29, !15, !25} ; [ DW_TAG_arg_variable ] [c] [line 26]
!74 = !MDLocation(line: 26, column: 13, scope: !29)
!75 = !{!"0x100\00i\0028\000", !29, !15, !18}     ; [ DW_TAG_auto_variable ] [i] [line 28]
!76 = !MDLocation(line: 28, column: 7, scope: !29)
!77 = !{!"0x100\00j\0028\000", !29, !15, !18}     ; [ DW_TAG_auto_variable ] [j] [line 28]
!78 = !MDLocation(line: 28, column: 10, scope: !29)
!79 = !MDLocation(line: 30, column: 8, scope: !80)
!80 = !{!"0xb\0030\003\0010", !1, !29}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!81 = !MDLocation(line: 30, column: 15, scope: !82)
!82 = !{!"0xb\002", !1, !83}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!83 = !{!"0xb\001", !1, !84}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!84 = !{!"0xb\0030\003\0011", !1, !80}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!85 = !MDLocation(line: 30, column: 19, scope: !84)
!86 = !MDLocation(line: 30, column: 15, scope: !84)
!87 = !MDLocation(line: 30, column: 3, scope: !80)
!88 = !MDLocation(line: 32, column: 34, scope: !89)
!89 = !{!"0xb\0031\005\0012", !1, !84}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!90 = !MDLocation(line: 32, column: 22, scope: !89)
!91 = !MDLocation(line: 32, column: 39, scope: !89)
!92 = !MDLocation(line: 32, column: 21, scope: !89)
!93 = !MDLocation(line: 32, column: 16, scope: !89)
!94 = !MDLocation(line: 32, column: 14, scope: !89)
!95 = !MDLocation(line: 32, column: 9, scope: !89)
!96 = !MDLocation(line: 32, column: 7, scope: !89)
!97 = !MDLocation(line: 33, column: 12, scope: !98)
!98 = !{!"0xb\0033\007\0013", !1, !89}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!99 = !MDLocation(line: 33, column: 19, scope: !100)
!100 = !{!"0xb\002", !1, !101}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!101 = !{!"0xb\001", !1, !102}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!102 = !{!"0xb\0033\007\0014", !1, !98}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!103 = !MDLocation(line: 33, column: 23, scope: !102)
!104 = !MDLocation(line: 33, column: 19, scope: !102)
!105 = !MDLocation(line: 33, column: 7, scope: !98)
!106 = !MDLocation(line: 34, column: 25, scope: !102)
!107 = !MDLocation(line: 34, column: 13, scope: !102)
!108 = !MDLocation(line: 34, column: 27, scope: !102)
!109 = !MDLocation(line: 34, column: 32, scope: !102)
!110 = !MDLocation(line: 34, column: 12, scope: !102)
!111 = !MDLocation(line: 34, column: 7, scope: !102)
!112 = !MDLocation(line: 34, column: 2, scope: !102)
!113 = !MDLocation(line: 34, column: 4, scope: !102)
!114 = !MDLocation(line: 33, column: 26, scope: !102)
!115 = !MDLocation(line: 33, column: 7, scope: !102)
!116 = !MDLocation(line: 35, column: 5, scope: !89)
!117 = !MDLocation(line: 30, column: 22, scope: !84)
!118 = !MDLocation(line: 30, column: 3, scope: !84)
!119 = !MDLocation(line: 36, column: 1, scope: !29)
!120 = !{!"0x101\00n\0016777274\000", !26, !15, !18} ; [ DW_TAG_arg_variable ] [n] [line 58]
!121 = !MDLocation(line: 58, column: 25, scope: !26)
!122 = !{!"0x101\00A\0033554491\000", !26, !15, !9} ; [ DW_TAG_arg_variable ] [A] [line 59]
!123 = !MDLocation(line: 59, column: 17, scope: !26)
!124 = !{!"0x101\00x\0050331708\000", !26, !15, !25} ; [ DW_TAG_arg_variable ] [x] [line 60]
!125 = !MDLocation(line: 60, column: 17, scope: !26)
!126 = !{!"0x101\00c\0067108925\000", !26, !15, !25} ; [ DW_TAG_arg_variable ] [c] [line 61]
!127 = !MDLocation(line: 61, column: 17, scope: !26)
!128 = !{!"0x100\00i\0063\000", !26, !15, !18}    ; [ DW_TAG_auto_variable ] [i] [line 63]
!129 = !MDLocation(line: 63, column: 7, scope: !26)
!130 = !{!"0x100\00j\0063\000", !26, !15, !18}    ; [ DW_TAG_auto_variable ] [j] [line 63]
!131 = !MDLocation(line: 63, column: 10, scope: !26)
!132 = !MDLocation(line: 66, column: 8, scope: !133)
!133 = !{!"0xb\0066\003\005", !1, !26}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!134 = !MDLocation(line: 66, column: 15, scope: !135)
!135 = !{!"0xb\002", !1, !136}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!136 = !{!"0xb\001", !1, !137}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!137 = !{!"0xb\0066\003\006", !1, !133}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!138 = !MDLocation(line: 66, column: 19, scope: !137)
!139 = !MDLocation(line: 66, column: 15, scope: !137)
!140 = !MDLocation(line: 66, column: 3, scope: !133)
!141 = !MDLocation(line: 68, column: 16, scope: !142)
!142 = !{!"0xb\0067\005\007", !1, !137}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!143 = !MDLocation(line: 68, column: 14, scope: !142)
!144 = !MDLocation(line: 68, column: 9, scope: !142)
!145 = !MDLocation(line: 68, column: 7, scope: !142)
!146 = !MDLocation(line: 69, column: 12, scope: !147)
!147 = !{!"0xb\0069\007\008", !1, !142}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!148 = !MDLocation(line: 69, column: 19, scope: !149)
!149 = !{!"0xb\002", !1, !150}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!150 = !{!"0xb\001", !1, !151}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!151 = !{!"0xb\0069\007\009", !1, !147}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!152 = !MDLocation(line: 69, column: 24, scope: !151)
!153 = !MDLocation(line: 69, column: 19, scope: !151)
!154 = !MDLocation(line: 69, column: 7, scope: !147)
!155 = !MDLocation(line: 70, column: 18, scope: !151)
!156 = !MDLocation(line: 70, column: 16, scope: !151)
!157 = !MDLocation(line: 70, column: 28, scope: !151)
!158 = !MDLocation(line: 70, column: 23, scope: !151)
!159 = !MDLocation(line: 70, column: 25, scope: !151)
!160 = !MDLocation(line: 70, column: 35, scope: !151)
!161 = !MDLocation(line: 70, column: 33, scope: !151)
!162 = !MDLocation(line: 70, column: 11, scope: !151)
!163 = !MDLocation(line: 70, column: 9, scope: !151)
!164 = !MDLocation(line: 69, column: 31, scope: !151)
!165 = !MDLocation(line: 69, column: 7, scope: !151)
!166 = !MDLocation(line: 71, column: 16, scope: !142)
!167 = !MDLocation(line: 71, column: 14, scope: !142)
!168 = !MDLocation(line: 71, column: 26, scope: !142)
!169 = !MDLocation(line: 71, column: 21, scope: !142)
!170 = !MDLocation(line: 71, column: 23, scope: !142)
!171 = !MDLocation(line: 71, column: 9, scope: !142)
!172 = !MDLocation(line: 71, column: 7, scope: !142)
!173 = !MDLocation(line: 72, column: 5, scope: !142)
!174 = !MDLocation(line: 66, column: 22, scope: !137)
!175 = !MDLocation(line: 66, column: 3, scope: !137)
!176 = !MDLocation(line: 75, column: 1, scope: !26)
!177 = !{!"0x101\00n\0016777258\000", !22, !15, !18} ; [ DW_TAG_arg_variable ] [n] [line 42]
!178 = !MDLocation(line: 42, column: 22, scope: !22)
!179 = !{!"0x101\00x\0033554475\000", !22, !15, !25} ; [ DW_TAG_arg_variable ] [x] [line 43]
!180 = !MDLocation(line: 43, column: 14, scope: !22)
!181 = !{!"0x100\00i\0046\000", !22, !15, !18}    ; [ DW_TAG_auto_variable ] [i] [line 46]
!182 = !MDLocation(line: 46, column: 7, scope: !22)
!183 = !MDLocation(line: 48, column: 8, scope: !184)
!184 = !{!"0xb\0048\003\001", !1, !22}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!185 = !MDLocation(line: 48, column: 15, scope: !186)
!186 = !{!"0xb\002", !1, !187}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!187 = !{!"0xb\001", !1, !188}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!188 = !{!"0xb\0048\003\002", !1, !184}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!189 = !MDLocation(line: 48, column: 19, scope: !188)
!190 = !MDLocation(line: 48, column: 15, scope: !188)
!191 = !MDLocation(line: 48, column: 3, scope: !184)
!192 = !MDLocation(line: 49, column: 14, scope: !193)
!193 = !{!"0xb\0048\0027\003", !1, !188}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!194 = !MDLocation(line: 49, column: 46, scope: !193)
!195 = !MDLocation(line: 49, column: 44, scope: !193)
!196 = !MDLocation(line: 49, column: 5, scope: !193)
!197 = !MDLocation(line: 50, column: 9, scope: !198)
!198 = !{!"0xb\0050\009\004", !1, !193}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!199 = !MDLocation(line: 50, column: 9, scope: !193)
!200 = !MDLocation(line: 50, column: 31, scope: !201)
!201 = !{!"0xb\001", !1, !198}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!202 = !MDLocation(line: 50, column: 22, scope: !198)
!203 = !MDLocation(line: 51, column: 3, scope: !193)
!204 = !MDLocation(line: 48, column: 22, scope: !188)
!205 = !MDLocation(line: 48, column: 3, scope: !188)
!206 = !MDLocation(line: 52, column: 1, scope: !22)
