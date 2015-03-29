; ModuleID = 'reg_detect.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*
@.str1 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %niter = alloca i32, align 4
  %maxgrid = alloca i32, align 4
  %length = alloca i32, align 4
  %sum_tang = alloca [6 x [6 x i32]]*, align 8
  %mean = alloca [6 x [6 x i32]]*, align 8
  %path = alloca [6 x [6 x i32]]*, align 8
  %diff = alloca [6 x [6 x [64 x i32]]]*, align 8
  %sum_diff = alloca [6 x [6 x [64 x i32]]]*, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !40, metadata !41), !dbg !42
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !43, metadata !41), !dbg !44
  call void @llvm.dbg.declare(metadata i32* %niter, metadata !45, metadata !41), !dbg !46
  store i32 10000, i32* %niter, align 4, !dbg !46
  call void @llvm.dbg.declare(metadata i32* %maxgrid, metadata !47, metadata !41), !dbg !48
  store i32 6, i32* %maxgrid, align 4, !dbg !48
  call void @llvm.dbg.declare(metadata i32* %length, metadata !49, metadata !41), !dbg !50
  store i32 64, i32* %length, align 4, !dbg !50
  call void @llvm.dbg.declare(metadata [6 x [6 x i32]]** %sum_tang, metadata !51, metadata !41), !dbg !52
  %call = call i8* @polybench_alloc_data(i32 36, i32 4), !dbg !52
  %0 = bitcast i8* %call to [6 x [6 x i32]]*, !dbg !52
  store [6 x [6 x i32]]* %0, [6 x [6 x i32]]** %sum_tang, align 8, !dbg !52
  call void @llvm.dbg.declare(metadata [6 x [6 x i32]]** %mean, metadata !53, metadata !41), !dbg !54
  %call1 = call i8* @polybench_alloc_data(i32 36, i32 4), !dbg !54
  %1 = bitcast i8* %call1 to [6 x [6 x i32]]*, !dbg !54
  store [6 x [6 x i32]]* %1, [6 x [6 x i32]]** %mean, align 8, !dbg !54
  call void @llvm.dbg.declare(metadata [6 x [6 x i32]]** %path, metadata !55, metadata !41), !dbg !56
  %call2 = call i8* @polybench_alloc_data(i32 36, i32 4), !dbg !56
  %2 = bitcast i8* %call2 to [6 x [6 x i32]]*, !dbg !56
  store [6 x [6 x i32]]* %2, [6 x [6 x i32]]** %path, align 8, !dbg !56
  call void @llvm.dbg.declare(metadata [6 x [6 x [64 x i32]]]** %diff, metadata !57, metadata !41), !dbg !58
  %call3 = call i8* @polybench_alloc_data(i32 2304, i32 4), !dbg !58
  %3 = bitcast i8* %call3 to [6 x [6 x [64 x i32]]]*, !dbg !58
  store [6 x [6 x [64 x i32]]]* %3, [6 x [6 x [64 x i32]]]** %diff, align 8, !dbg !58
  call void @llvm.dbg.declare(metadata [6 x [6 x [64 x i32]]]** %sum_diff, metadata !59, metadata !41), !dbg !60
  %call4 = call i8* @polybench_alloc_data(i32 2304, i32 4), !dbg !60
  %4 = bitcast i8* %call4 to [6 x [6 x [64 x i32]]]*, !dbg !60
  store [6 x [6 x [64 x i32]]]* %4, [6 x [6 x [64 x i32]]]** %sum_diff, align 8, !dbg !60
  %5 = load i32* %maxgrid, align 4, !dbg !61
  %6 = load [6 x [6 x i32]]** %sum_tang, align 8, !dbg !62
  %arraydecay = getelementptr inbounds [6 x [6 x i32]]* %6, i32 0, i32 0, !dbg !62
  %7 = load [6 x [6 x i32]]** %mean, align 8, !dbg !63
  %arraydecay5 = getelementptr inbounds [6 x [6 x i32]]* %7, i32 0, i32 0, !dbg !63
  %8 = load [6 x [6 x i32]]** %path, align 8, !dbg !64
  %arraydecay6 = getelementptr inbounds [6 x [6 x i32]]* %8, i32 0, i32 0, !dbg !64
  call void @init_array(i32 %5, [6 x i32]* %arraydecay, [6 x i32]* %arraydecay5, [6 x i32]* %arraydecay6), !dbg !65
  %9 = load i32* %niter, align 4, !dbg !66
  %10 = load i32* %maxgrid, align 4, !dbg !67
  %11 = load i32* %length, align 4, !dbg !68
  %12 = load [6 x [6 x i32]]** %sum_tang, align 8, !dbg !69
  %arraydecay7 = getelementptr inbounds [6 x [6 x i32]]* %12, i32 0, i32 0, !dbg !69
  %13 = load [6 x [6 x i32]]** %mean, align 8, !dbg !70
  %arraydecay8 = getelementptr inbounds [6 x [6 x i32]]* %13, i32 0, i32 0, !dbg !70
  %14 = load [6 x [6 x i32]]** %path, align 8, !dbg !71
  %arraydecay9 = getelementptr inbounds [6 x [6 x i32]]* %14, i32 0, i32 0, !dbg !71
  %15 = load [6 x [6 x [64 x i32]]]** %diff, align 8, !dbg !72
  %arraydecay10 = getelementptr inbounds [6 x [6 x [64 x i32]]]* %15, i32 0, i32 0, !dbg !72
  %16 = load [6 x [6 x [64 x i32]]]** %sum_diff, align 8, !dbg !73
  %arraydecay11 = getelementptr inbounds [6 x [6 x [64 x i32]]]* %16, i32 0, i32 0, !dbg !73
  call void @kernel_reg_detect(i32 %9, i32 %10, i32 %11, [6 x i32]* %arraydecay7, [6 x i32]* %arraydecay8, [6 x i32]* %arraydecay9, [6 x [64 x i32]]* %arraydecay10, [6 x [64 x i32]]* %arraydecay11), !dbg !74
  %17 = load i32* %argc.addr, align 4, !dbg !75
  %cmp = icmp sgt i32 %17, 42, !dbg !75
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !77

land.lhs.true:                                    ; preds = %entry
  %18 = load i8*** %argv.addr, align 8, !dbg !78
  %arrayidx = getelementptr inbounds i8** %18, i64 0, !dbg !78
  %19 = load i8** %arrayidx, align 8, !dbg !78
  %call12 = call i32 @strcmp(i8* %19, i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0)) #5, !dbg !78
  %tobool = icmp ne i32 %call12, 0, !dbg !77
  br i1 %tobool, label %if.end, label %if.then, !dbg !77

if.then:                                          ; preds = %land.lhs.true
  %20 = load i32* %maxgrid, align 4, !dbg !80
  %21 = load [6 x [6 x i32]]** %path, align 8, !dbg !80
  %arraydecay13 = getelementptr inbounds [6 x [6 x i32]]* %21, i32 0, i32 0, !dbg !80
  call void @print_array(i32 %20, [6 x i32]* %arraydecay13), !dbg !80
  br label %if.end, !dbg !80

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %22 = load [6 x [6 x i32]]** %sum_tang, align 8, !dbg !82
  %23 = bitcast [6 x [6 x i32]]* %22 to i8*, !dbg !82
  call void @free(i8* %23) #6, !dbg !82
  %24 = load [6 x [6 x i32]]** %mean, align 8, !dbg !83
  %25 = bitcast [6 x [6 x i32]]* %24 to i8*, !dbg !83
  call void @free(i8* %25) #6, !dbg !83
  %26 = load [6 x [6 x i32]]** %path, align 8, !dbg !84
  %27 = bitcast [6 x [6 x i32]]* %26 to i8*, !dbg !84
  call void @free(i8* %27) #6, !dbg !84
  %28 = load [6 x [6 x [64 x i32]]]** %diff, align 8, !dbg !85
  %29 = bitcast [6 x [6 x [64 x i32]]]* %28 to i8*, !dbg !85
  call void @free(i8* %29) #6, !dbg !85
  %30 = load [6 x [6 x [64 x i32]]]** %sum_diff, align 8, !dbg !86
  %31 = bitcast [6 x [6 x [64 x i32]]]* %30 to i8*, !dbg !86
  call void @free(i8* %31) #6, !dbg !86
  ret i32 0, !dbg !87
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i8* @polybench_alloc_data(i32, i32) #2

; Function Attrs: nounwind uwtable
define internal void @init_array(i32 %maxgrid, [6 x i32]* %sum_tang, [6 x i32]* %mean, [6 x i32]* %path) #0 {
entry:
  %maxgrid.addr = alloca i32, align 4
  %sum_tang.addr = alloca [6 x i32]*, align 8
  %mean.addr = alloca [6 x i32]*, align 8
  %path.addr = alloca [6 x i32]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %maxgrid, i32* %maxgrid.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %maxgrid.addr, metadata !88, metadata !41), !dbg !89
  store [6 x i32]* %sum_tang, [6 x i32]** %sum_tang.addr, align 8
  call void @llvm.dbg.declare(metadata [6 x i32]** %sum_tang.addr, metadata !90, metadata !41), !dbg !91
  store [6 x i32]* %mean, [6 x i32]** %mean.addr, align 8
  call void @llvm.dbg.declare(metadata [6 x i32]** %mean.addr, metadata !92, metadata !41), !dbg !93
  store [6 x i32]* %path, [6 x i32]** %path.addr, align 8
  call void @llvm.dbg.declare(metadata [6 x i32]** %path.addr, metadata !94, metadata !41), !dbg !95
  call void @llvm.dbg.declare(metadata i32* %i, metadata !96, metadata !41), !dbg !97
  call void @llvm.dbg.declare(metadata i32* %j, metadata !98, metadata !41), !dbg !99
  store i32 0, i32* %i, align 4, !dbg !100
  br label %for.cond, !dbg !100

for.cond:                                         ; preds = %for.inc18, %entry
  %0 = load i32* %i, align 4, !dbg !102
  %1 = load i32* %maxgrid.addr, align 4, !dbg !106
  %cmp = icmp slt i32 %0, %1, !dbg !107
  br i1 %cmp, label %for.body, label %for.end20, !dbg !108

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !109
  br label %for.cond1, !dbg !109

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32* %j, align 4, !dbg !111
  %3 = load i32* %maxgrid.addr, align 4, !dbg !115
  %cmp2 = icmp slt i32 %2, %3, !dbg !116
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !117

for.body3:                                        ; preds = %for.cond1
  %4 = load i32* %i, align 4, !dbg !118
  %add = add nsw i32 %4, 1, !dbg !118
  %5 = load i32* %j, align 4, !dbg !120
  %add4 = add nsw i32 %5, 1, !dbg !120
  %mul = mul nsw i32 %add, %add4, !dbg !121
  %6 = load i32* %j, align 4, !dbg !122
  %idxprom = sext i32 %6 to i64, !dbg !123
  %7 = load i32* %i, align 4, !dbg !124
  %idxprom5 = sext i32 %7 to i64, !dbg !123
  %8 = load [6 x i32]** %sum_tang.addr, align 8, !dbg !123
  %arrayidx = getelementptr inbounds [6 x i32]* %8, i64 %idxprom5, !dbg !123
  %arrayidx6 = getelementptr inbounds [6 x i32]* %arrayidx, i32 0, i64 %idxprom, !dbg !123
  store i32 %mul, i32* %arrayidx6, align 4, !dbg !123
  %9 = load i32* %i, align 4, !dbg !125
  %10 = load i32* %j, align 4, !dbg !126
  %sub = sub nsw i32 %9, %10, !dbg !127
  %11 = load i32* %maxgrid.addr, align 4, !dbg !128
  %div = sdiv i32 %sub, %11, !dbg !129
  %12 = load i32* %j, align 4, !dbg !130
  %idxprom7 = sext i32 %12 to i64, !dbg !131
  %13 = load i32* %i, align 4, !dbg !132
  %idxprom8 = sext i32 %13 to i64, !dbg !131
  %14 = load [6 x i32]** %mean.addr, align 8, !dbg !131
  %arrayidx9 = getelementptr inbounds [6 x i32]* %14, i64 %idxprom8, !dbg !131
  %arrayidx10 = getelementptr inbounds [6 x i32]* %arrayidx9, i32 0, i64 %idxprom7, !dbg !131
  store i32 %div, i32* %arrayidx10, align 4, !dbg !131
  %15 = load i32* %i, align 4, !dbg !133
  %16 = load i32* %j, align 4, !dbg !134
  %sub11 = sub nsw i32 %16, 1, !dbg !134
  %mul12 = mul nsw i32 %15, %sub11, !dbg !135
  %17 = load i32* %maxgrid.addr, align 4, !dbg !136
  %div13 = sdiv i32 %mul12, %17, !dbg !137
  %18 = load i32* %j, align 4, !dbg !138
  %idxprom14 = sext i32 %18 to i64, !dbg !139
  %19 = load i32* %i, align 4, !dbg !140
  %idxprom15 = sext i32 %19 to i64, !dbg !139
  %20 = load [6 x i32]** %path.addr, align 8, !dbg !139
  %arrayidx16 = getelementptr inbounds [6 x i32]* %20, i64 %idxprom15, !dbg !139
  %arrayidx17 = getelementptr inbounds [6 x i32]* %arrayidx16, i32 0, i64 %idxprom14, !dbg !139
  store i32 %div13, i32* %arrayidx17, align 4, !dbg !139
  br label %for.inc, !dbg !141

for.inc:                                          ; preds = %for.body3
  %21 = load i32* %j, align 4, !dbg !142
  %inc = add nsw i32 %21, 1, !dbg !142
  store i32 %inc, i32* %j, align 4, !dbg !142
  br label %for.cond1, !dbg !143

for.end:                                          ; preds = %for.cond1
  br label %for.inc18, !dbg !144

for.inc18:                                        ; preds = %for.end
  %22 = load i32* %i, align 4, !dbg !145
  %inc19 = add nsw i32 %22, 1, !dbg !145
  store i32 %inc19, i32* %i, align 4, !dbg !145
  br label %for.cond, !dbg !146

for.end20:                                        ; preds = %for.cond
  ret void, !dbg !147
}

; Function Attrs: nounwind uwtable
define internal void @kernel_reg_detect(i32 %niter, i32 %maxgrid, i32 %length, [6 x i32]* %sum_tang, [6 x i32]* %mean, [6 x i32]* %path, [6 x [64 x i32]]* %diff, [6 x [64 x i32]]* %sum_diff) #0 {
entry:
  %niter.addr = alloca i32, align 4
  %maxgrid.addr = alloca i32, align 4
  %length.addr = alloca i32, align 4
  %sum_tang.addr = alloca [6 x i32]*, align 8
  %mean.addr = alloca [6 x i32]*, align 8
  %path.addr = alloca [6 x i32]*, align 8
  %diff.addr = alloca [6 x [64 x i32]]*, align 8
  %sum_diff.addr = alloca [6 x [64 x i32]]*, align 8
  %t = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %cnt = alloca i32, align 4
  store i32 %niter, i32* %niter.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %niter.addr, metadata !148, metadata !41), !dbg !149
  store i32 %maxgrid, i32* %maxgrid.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %maxgrid.addr, metadata !150, metadata !41), !dbg !151
  store i32 %length, i32* %length.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %length.addr, metadata !152, metadata !41), !dbg !153
  store [6 x i32]* %sum_tang, [6 x i32]** %sum_tang.addr, align 8
  call void @llvm.dbg.declare(metadata [6 x i32]** %sum_tang.addr, metadata !154, metadata !41), !dbg !155
  store [6 x i32]* %mean, [6 x i32]** %mean.addr, align 8
  call void @llvm.dbg.declare(metadata [6 x i32]** %mean.addr, metadata !156, metadata !41), !dbg !157
  store [6 x i32]* %path, [6 x i32]** %path.addr, align 8
  call void @llvm.dbg.declare(metadata [6 x i32]** %path.addr, metadata !158, metadata !41), !dbg !159
  store [6 x [64 x i32]]* %diff, [6 x [64 x i32]]** %diff.addr, align 8
  call void @llvm.dbg.declare(metadata [6 x [64 x i32]]** %diff.addr, metadata !160, metadata !41), !dbg !161
  store [6 x [64 x i32]]* %sum_diff, [6 x [64 x i32]]** %sum_diff.addr, align 8
  call void @llvm.dbg.declare(metadata [6 x [64 x i32]]** %sum_diff.addr, metadata !162, metadata !41), !dbg !163
  call void @llvm.dbg.declare(metadata i32* %t, metadata !164, metadata !41), !dbg !165
  call void @llvm.dbg.declare(metadata i32* %i, metadata !166, metadata !41), !dbg !167
  call void @llvm.dbg.declare(metadata i32* %j, metadata !168, metadata !41), !dbg !169
  call void @llvm.dbg.declare(metadata i32* %cnt, metadata !170, metadata !41), !dbg !171
  store i32 0, i32* %t, align 4, !dbg !172
  br label %for.cond, !dbg !172

for.cond:                                         ; preds = %for.inc129, %entry
  %0 = load i32* %t, align 4, !dbg !174
  %1 = load i32* %niter.addr, align 4, !dbg !178
  %cmp = icmp slt i32 %0, %1, !dbg !179
  br i1 %cmp, label %for.body, label %for.end131, !dbg !180

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !181
  br label %for.cond1, !dbg !181

for.cond1:                                        ; preds = %for.inc23, %for.body
  %2 = load i32* %j, align 4, !dbg !184
  %3 = load i32* %maxgrid.addr, align 4, !dbg !188
  %sub = sub nsw i32 %3, 1, !dbg !188
  %cmp2 = icmp sle i32 %2, %sub, !dbg !189
  br i1 %cmp2, label %for.body3, label %for.end25, !dbg !190

for.body3:                                        ; preds = %for.cond1
  %4 = load i32* %j, align 4, !dbg !191
  store i32 %4, i32* %i, align 4, !dbg !193
  br label %for.cond4, !dbg !193

for.cond4:                                        ; preds = %for.inc20, %for.body3
  %5 = load i32* %i, align 4, !dbg !194
  %6 = load i32* %maxgrid.addr, align 4, !dbg !198
  %sub5 = sub nsw i32 %6, 1, !dbg !198
  %cmp6 = icmp sle i32 %5, %sub5, !dbg !199
  br i1 %cmp6, label %for.body7, label %for.end22, !dbg !200

for.body7:                                        ; preds = %for.cond4
  store i32 0, i32* %cnt, align 4, !dbg !201
  br label %for.cond8, !dbg !201

for.cond8:                                        ; preds = %for.inc, %for.body7
  %7 = load i32* %cnt, align 4, !dbg !203
  %8 = load i32* %length.addr, align 4, !dbg !207
  %sub9 = sub nsw i32 %8, 1, !dbg !207
  %cmp10 = icmp sle i32 %7, %sub9, !dbg !208
  br i1 %cmp10, label %for.body11, label %for.end, !dbg !209

for.body11:                                       ; preds = %for.cond8
  %9 = load i32* %i, align 4, !dbg !210
  %idxprom = sext i32 %9 to i64, !dbg !211
  %10 = load i32* %j, align 4, !dbg !212
  %idxprom12 = sext i32 %10 to i64, !dbg !211
  %11 = load [6 x i32]** %sum_tang.addr, align 8, !dbg !211
  %arrayidx = getelementptr inbounds [6 x i32]* %11, i64 %idxprom12, !dbg !211
  %arrayidx13 = getelementptr inbounds [6 x i32]* %arrayidx, i32 0, i64 %idxprom, !dbg !211
  %12 = load i32* %arrayidx13, align 4, !dbg !211
  %13 = load i32* %cnt, align 4, !dbg !213
  %idxprom14 = sext i32 %13 to i64, !dbg !214
  %14 = load i32* %i, align 4, !dbg !215
  %idxprom15 = sext i32 %14 to i64, !dbg !214
  %15 = load i32* %j, align 4, !dbg !216
  %idxprom16 = sext i32 %15 to i64, !dbg !214
  %16 = load [6 x [64 x i32]]** %diff.addr, align 8, !dbg !214
  %arrayidx17 = getelementptr inbounds [6 x [64 x i32]]* %16, i64 %idxprom16, !dbg !214
  %arrayidx18 = getelementptr inbounds [6 x [64 x i32]]* %arrayidx17, i32 0, i64 %idxprom15, !dbg !214
  %arrayidx19 = getelementptr inbounds [64 x i32]* %arrayidx18, i32 0, i64 %idxprom14, !dbg !214
  store i32 %12, i32* %arrayidx19, align 4, !dbg !214
  br label %for.inc, !dbg !214

for.inc:                                          ; preds = %for.body11
  %17 = load i32* %cnt, align 4, !dbg !217
  %inc = add nsw i32 %17, 1, !dbg !217
  store i32 %inc, i32* %cnt, align 4, !dbg !217
  br label %for.cond8, !dbg !218

for.end:                                          ; preds = %for.cond8
  br label %for.inc20, !dbg !219

for.inc20:                                        ; preds = %for.end
  %18 = load i32* %i, align 4, !dbg !220
  %inc21 = add nsw i32 %18, 1, !dbg !220
  store i32 %inc21, i32* %i, align 4, !dbg !220
  br label %for.cond4, !dbg !221

for.end22:                                        ; preds = %for.cond4
  br label %for.inc23, !dbg !222

for.inc23:                                        ; preds = %for.end22
  %19 = load i32* %j, align 4, !dbg !223
  %inc24 = add nsw i32 %19, 1, !dbg !223
  store i32 %inc24, i32* %j, align 4, !dbg !223
  br label %for.cond1, !dbg !224

for.end25:                                        ; preds = %for.cond1
  store i32 0, i32* %j, align 4, !dbg !225
  br label %for.cond26, !dbg !225

for.cond26:                                       ; preds = %for.inc84, %for.end25
  %20 = load i32* %j, align 4, !dbg !227
  %21 = load i32* %maxgrid.addr, align 4, !dbg !231
  %sub27 = sub nsw i32 %21, 1, !dbg !231
  %cmp28 = icmp sle i32 %20, %sub27, !dbg !232
  br i1 %cmp28, label %for.body29, label %for.end86, !dbg !233

for.body29:                                       ; preds = %for.cond26
  %22 = load i32* %j, align 4, !dbg !234
  store i32 %22, i32* %i, align 4, !dbg !237
  br label %for.cond30, !dbg !237

for.cond30:                                       ; preds = %for.inc81, %for.body29
  %23 = load i32* %i, align 4, !dbg !238
  %24 = load i32* %maxgrid.addr, align 4, !dbg !242
  %sub31 = sub nsw i32 %24, 1, !dbg !242
  %cmp32 = icmp sle i32 %23, %sub31, !dbg !243
  br i1 %cmp32, label %for.body33, label %for.end83, !dbg !244

for.body33:                                       ; preds = %for.cond30
  %25 = load i32* %i, align 4, !dbg !245
  %idxprom34 = sext i32 %25 to i64, !dbg !247
  %26 = load i32* %j, align 4, !dbg !248
  %idxprom35 = sext i32 %26 to i64, !dbg !247
  %27 = load [6 x [64 x i32]]** %diff.addr, align 8, !dbg !247
  %arrayidx36 = getelementptr inbounds [6 x [64 x i32]]* %27, i64 %idxprom35, !dbg !247
  %arrayidx37 = getelementptr inbounds [6 x [64 x i32]]* %arrayidx36, i32 0, i64 %idxprom34, !dbg !247
  %arrayidx38 = getelementptr inbounds [64 x i32]* %arrayidx37, i32 0, i64 0, !dbg !247
  %28 = load i32* %arrayidx38, align 4, !dbg !247
  %29 = load i32* %i, align 4, !dbg !249
  %idxprom39 = sext i32 %29 to i64, !dbg !250
  %30 = load i32* %j, align 4, !dbg !251
  %idxprom40 = sext i32 %30 to i64, !dbg !250
  %31 = load [6 x [64 x i32]]** %sum_diff.addr, align 8, !dbg !250
  %arrayidx41 = getelementptr inbounds [6 x [64 x i32]]* %31, i64 %idxprom40, !dbg !250
  %arrayidx42 = getelementptr inbounds [6 x [64 x i32]]* %arrayidx41, i32 0, i64 %idxprom39, !dbg !250
  %arrayidx43 = getelementptr inbounds [64 x i32]* %arrayidx42, i32 0, i64 0, !dbg !250
  store i32 %28, i32* %arrayidx43, align 4, !dbg !250
  store i32 1, i32* %cnt, align 4, !dbg !252
  br label %for.cond44, !dbg !252

for.cond44:                                       ; preds = %for.inc67, %for.body33
  %32 = load i32* %cnt, align 4, !dbg !254
  %33 = load i32* %length.addr, align 4, !dbg !258
  %sub45 = sub nsw i32 %33, 1, !dbg !258
  %cmp46 = icmp sle i32 %32, %sub45, !dbg !259
  br i1 %cmp46, label %for.body47, label %for.end69, !dbg !260

for.body47:                                       ; preds = %for.cond44
  %34 = load i32* %cnt, align 4, !dbg !261
  %sub48 = sub nsw i32 %34, 1, !dbg !261
  %idxprom49 = sext i32 %sub48 to i64, !dbg !262
  %35 = load i32* %i, align 4, !dbg !263
  %idxprom50 = sext i32 %35 to i64, !dbg !262
  %36 = load i32* %j, align 4, !dbg !264
  %idxprom51 = sext i32 %36 to i64, !dbg !262
  %37 = load [6 x [64 x i32]]** %sum_diff.addr, align 8, !dbg !262
  %arrayidx52 = getelementptr inbounds [6 x [64 x i32]]* %37, i64 %idxprom51, !dbg !262
  %arrayidx53 = getelementptr inbounds [6 x [64 x i32]]* %arrayidx52, i32 0, i64 %idxprom50, !dbg !262
  %arrayidx54 = getelementptr inbounds [64 x i32]* %arrayidx53, i32 0, i64 %idxprom49, !dbg !262
  %38 = load i32* %arrayidx54, align 4, !dbg !262
  %39 = load i32* %cnt, align 4, !dbg !265
  %idxprom55 = sext i32 %39 to i64, !dbg !266
  %40 = load i32* %i, align 4, !dbg !267
  %idxprom56 = sext i32 %40 to i64, !dbg !266
  %41 = load i32* %j, align 4, !dbg !268
  %idxprom57 = sext i32 %41 to i64, !dbg !266
  %42 = load [6 x [64 x i32]]** %diff.addr, align 8, !dbg !266
  %arrayidx58 = getelementptr inbounds [6 x [64 x i32]]* %42, i64 %idxprom57, !dbg !266
  %arrayidx59 = getelementptr inbounds [6 x [64 x i32]]* %arrayidx58, i32 0, i64 %idxprom56, !dbg !266
  %arrayidx60 = getelementptr inbounds [64 x i32]* %arrayidx59, i32 0, i64 %idxprom55, !dbg !266
  %43 = load i32* %arrayidx60, align 4, !dbg !266
  %add = add nsw i32 %38, %43, !dbg !262
  %44 = load i32* %cnt, align 4, !dbg !269
  %idxprom61 = sext i32 %44 to i64, !dbg !270
  %45 = load i32* %i, align 4, !dbg !271
  %idxprom62 = sext i32 %45 to i64, !dbg !270
  %46 = load i32* %j, align 4, !dbg !272
  %idxprom63 = sext i32 %46 to i64, !dbg !270
  %47 = load [6 x [64 x i32]]** %sum_diff.addr, align 8, !dbg !270
  %arrayidx64 = getelementptr inbounds [6 x [64 x i32]]* %47, i64 %idxprom63, !dbg !270
  %arrayidx65 = getelementptr inbounds [6 x [64 x i32]]* %arrayidx64, i32 0, i64 %idxprom62, !dbg !270
  %arrayidx66 = getelementptr inbounds [64 x i32]* %arrayidx65, i32 0, i64 %idxprom61, !dbg !270
  store i32 %add, i32* %arrayidx66, align 4, !dbg !270
  br label %for.inc67, !dbg !270

for.inc67:                                        ; preds = %for.body47
  %48 = load i32* %cnt, align 4, !dbg !273
  %inc68 = add nsw i32 %48, 1, !dbg !273
  store i32 %inc68, i32* %cnt, align 4, !dbg !273
  br label %for.cond44, !dbg !274

for.end69:                                        ; preds = %for.cond44
  %49 = load i32* %length.addr, align 4, !dbg !275
  %sub70 = sub nsw i32 %49, 1, !dbg !275
  %idxprom71 = sext i32 %sub70 to i64, !dbg !276
  %50 = load i32* %i, align 4, !dbg !277
  %idxprom72 = sext i32 %50 to i64, !dbg !276
  %51 = load i32* %j, align 4, !dbg !278
  %idxprom73 = sext i32 %51 to i64, !dbg !276
  %52 = load [6 x [64 x i32]]** %sum_diff.addr, align 8, !dbg !276
  %arrayidx74 = getelementptr inbounds [6 x [64 x i32]]* %52, i64 %idxprom73, !dbg !276
  %arrayidx75 = getelementptr inbounds [6 x [64 x i32]]* %arrayidx74, i32 0, i64 %idxprom72, !dbg !276
  %arrayidx76 = getelementptr inbounds [64 x i32]* %arrayidx75, i32 0, i64 %idxprom71, !dbg !276
  %53 = load i32* %arrayidx76, align 4, !dbg !276
  %54 = load i32* %i, align 4, !dbg !279
  %idxprom77 = sext i32 %54 to i64, !dbg !280
  %55 = load i32* %j, align 4, !dbg !281
  %idxprom78 = sext i32 %55 to i64, !dbg !280
  %56 = load [6 x i32]** %mean.addr, align 8, !dbg !280
  %arrayidx79 = getelementptr inbounds [6 x i32]* %56, i64 %idxprom78, !dbg !280
  %arrayidx80 = getelementptr inbounds [6 x i32]* %arrayidx79, i32 0, i64 %idxprom77, !dbg !280
  store i32 %53, i32* %arrayidx80, align 4, !dbg !280
  br label %for.inc81, !dbg !282

for.inc81:                                        ; preds = %for.end69
  %57 = load i32* %i, align 4, !dbg !283
  %inc82 = add nsw i32 %57, 1, !dbg !283
  store i32 %inc82, i32* %i, align 4, !dbg !283
  br label %for.cond30, !dbg !284

for.end83:                                        ; preds = %for.cond30
  br label %for.inc84, !dbg !285

for.inc84:                                        ; preds = %for.end83
  %58 = load i32* %j, align 4, !dbg !286
  %inc85 = add nsw i32 %58, 1, !dbg !286
  store i32 %inc85, i32* %j, align 4, !dbg !286
  br label %for.cond26, !dbg !287

for.end86:                                        ; preds = %for.cond26
  store i32 0, i32* %i, align 4, !dbg !288
  br label %for.cond87, !dbg !288

for.cond87:                                       ; preds = %for.inc97, %for.end86
  %59 = load i32* %i, align 4, !dbg !290
  %60 = load i32* %maxgrid.addr, align 4, !dbg !294
  %sub88 = sub nsw i32 %60, 1, !dbg !294
  %cmp89 = icmp sle i32 %59, %sub88, !dbg !295
  br i1 %cmp89, label %for.body90, label %for.end99, !dbg !296

for.body90:                                       ; preds = %for.cond87
  %61 = load i32* %i, align 4, !dbg !297
  %idxprom91 = sext i32 %61 to i64, !dbg !298
  %62 = load [6 x i32]** %mean.addr, align 8, !dbg !298
  %arrayidx92 = getelementptr inbounds [6 x i32]* %62, i64 0, !dbg !298
  %arrayidx93 = getelementptr inbounds [6 x i32]* %arrayidx92, i32 0, i64 %idxprom91, !dbg !298
  %63 = load i32* %arrayidx93, align 4, !dbg !298
  %64 = load i32* %i, align 4, !dbg !299
  %idxprom94 = sext i32 %64 to i64, !dbg !300
  %65 = load [6 x i32]** %path.addr, align 8, !dbg !300
  %arrayidx95 = getelementptr inbounds [6 x i32]* %65, i64 0, !dbg !300
  %arrayidx96 = getelementptr inbounds [6 x i32]* %arrayidx95, i32 0, i64 %idxprom94, !dbg !300
  store i32 %63, i32* %arrayidx96, align 4, !dbg !300
  br label %for.inc97, !dbg !300

for.inc97:                                        ; preds = %for.body90
  %66 = load i32* %i, align 4, !dbg !301
  %inc98 = add nsw i32 %66, 1, !dbg !301
  store i32 %inc98, i32* %i, align 4, !dbg !301
  br label %for.cond87, !dbg !302

for.end99:                                        ; preds = %for.cond87
  store i32 1, i32* %j, align 4, !dbg !303
  br label %for.cond100, !dbg !303

for.cond100:                                      ; preds = %for.inc126, %for.end99
  %67 = load i32* %j, align 4, !dbg !305
  %68 = load i32* %maxgrid.addr, align 4, !dbg !309
  %sub101 = sub nsw i32 %68, 1, !dbg !309
  %cmp102 = icmp sle i32 %67, %sub101, !dbg !310
  br i1 %cmp102, label %for.body103, label %for.end128, !dbg !311

for.body103:                                      ; preds = %for.cond100
  %69 = load i32* %j, align 4, !dbg !312
  store i32 %69, i32* %i, align 4, !dbg !314
  br label %for.cond104, !dbg !314

for.cond104:                                      ; preds = %for.inc123, %for.body103
  %70 = load i32* %i, align 4, !dbg !315
  %71 = load i32* %maxgrid.addr, align 4, !dbg !319
  %sub105 = sub nsw i32 %71, 1, !dbg !319
  %cmp106 = icmp sle i32 %70, %sub105, !dbg !320
  br i1 %cmp106, label %for.body107, label %for.end125, !dbg !321

for.body107:                                      ; preds = %for.cond104
  %72 = load i32* %i, align 4, !dbg !322
  %sub108 = sub nsw i32 %72, 1, !dbg !322
  %idxprom109 = sext i32 %sub108 to i64, !dbg !323
  %73 = load i32* %j, align 4, !dbg !324
  %sub110 = sub nsw i32 %73, 1, !dbg !324
  %idxprom111 = sext i32 %sub110 to i64, !dbg !323
  %74 = load [6 x i32]** %path.addr, align 8, !dbg !323
  %arrayidx112 = getelementptr inbounds [6 x i32]* %74, i64 %idxprom111, !dbg !323
  %arrayidx113 = getelementptr inbounds [6 x i32]* %arrayidx112, i32 0, i64 %idxprom109, !dbg !323
  %75 = load i32* %arrayidx113, align 4, !dbg !323
  %76 = load i32* %i, align 4, !dbg !325
  %idxprom114 = sext i32 %76 to i64, !dbg !326
  %77 = load i32* %j, align 4, !dbg !327
  %idxprom115 = sext i32 %77 to i64, !dbg !326
  %78 = load [6 x i32]** %mean.addr, align 8, !dbg !326
  %arrayidx116 = getelementptr inbounds [6 x i32]* %78, i64 %idxprom115, !dbg !326
  %arrayidx117 = getelementptr inbounds [6 x i32]* %arrayidx116, i32 0, i64 %idxprom114, !dbg !326
  %79 = load i32* %arrayidx117, align 4, !dbg !326
  %add118 = add nsw i32 %75, %79, !dbg !323
  %80 = load i32* %i, align 4, !dbg !328
  %idxprom119 = sext i32 %80 to i64, !dbg !329
  %81 = load i32* %j, align 4, !dbg !330
  %idxprom120 = sext i32 %81 to i64, !dbg !329
  %82 = load [6 x i32]** %path.addr, align 8, !dbg !329
  %arrayidx121 = getelementptr inbounds [6 x i32]* %82, i64 %idxprom120, !dbg !329
  %arrayidx122 = getelementptr inbounds [6 x i32]* %arrayidx121, i32 0, i64 %idxprom119, !dbg !329
  store i32 %add118, i32* %arrayidx122, align 4, !dbg !329
  br label %for.inc123, !dbg !329

for.inc123:                                       ; preds = %for.body107
  %83 = load i32* %i, align 4, !dbg !331
  %inc124 = add nsw i32 %83, 1, !dbg !331
  store i32 %inc124, i32* %i, align 4, !dbg !331
  br label %for.cond104, !dbg !332

for.end125:                                       ; preds = %for.cond104
  br label %for.inc126, !dbg !333

for.inc126:                                       ; preds = %for.end125
  %84 = load i32* %j, align 4, !dbg !334
  %inc127 = add nsw i32 %84, 1, !dbg !334
  store i32 %inc127, i32* %j, align 4, !dbg !334
  br label %for.cond100, !dbg !335

for.end128:                                       ; preds = %for.cond100
  br label %for.inc129, !dbg !336

for.inc129:                                       ; preds = %for.end128
  %85 = load i32* %t, align 4, !dbg !337
  %inc130 = add nsw i32 %85, 1, !dbg !337
  store i32 %inc130, i32* %t, align 4, !dbg !337
  br label %for.cond, !dbg !338

for.end131:                                       ; preds = %for.cond
  ret void, !dbg !339
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #3

; Function Attrs: nounwind uwtable
define internal void @print_array(i32 %maxgrid, [6 x i32]* %path) #0 {
entry:
  %maxgrid.addr = alloca i32, align 4
  %path.addr = alloca [6 x i32]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %maxgrid, i32* %maxgrid.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %maxgrid.addr, metadata !340, metadata !41), !dbg !341
  store [6 x i32]* %path, [6 x i32]** %path.addr, align 8
  call void @llvm.dbg.declare(metadata [6 x i32]** %path.addr, metadata !342, metadata !41), !dbg !343
  call void @llvm.dbg.declare(metadata i32* %i, metadata !344, metadata !41), !dbg !345
  call void @llvm.dbg.declare(metadata i32* %j, metadata !346, metadata !41), !dbg !347
  store i32 0, i32* %i, align 4, !dbg !348
  br label %for.cond, !dbg !348

for.cond:                                         ; preds = %for.inc8, %entry
  %0 = load i32* %i, align 4, !dbg !350
  %1 = load i32* %maxgrid.addr, align 4, !dbg !354
  %cmp = icmp slt i32 %0, %1, !dbg !355
  br i1 %cmp, label %for.body, label %for.end10, !dbg !356

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !357
  br label %for.cond1, !dbg !357

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32* %j, align 4, !dbg !359
  %3 = load i32* %maxgrid.addr, align 4, !dbg !363
  %cmp2 = icmp slt i32 %2, %3, !dbg !364
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !365

for.body3:                                        ; preds = %for.cond1
  %4 = load %struct._IO_FILE** @stderr, align 8, !dbg !366
  %5 = load i32* %j, align 4, !dbg !368
  %idxprom = sext i32 %5 to i64, !dbg !369
  %6 = load i32* %i, align 4, !dbg !370
  %idxprom4 = sext i32 %6 to i64, !dbg !369
  %7 = load [6 x i32]** %path.addr, align 8, !dbg !369
  %arrayidx = getelementptr inbounds [6 x i32]* %7, i64 %idxprom4, !dbg !369
  %arrayidx5 = getelementptr inbounds [6 x i32]* %arrayidx, i32 0, i64 %idxprom, !dbg !369
  %8 = load i32* %arrayidx5, align 4, !dbg !369
  %call = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), i32 %8), !dbg !371
  %9 = load i32* %i, align 4, !dbg !372
  %10 = load i32* %maxgrid.addr, align 4, !dbg !374
  %mul = mul nsw i32 %9, %10, !dbg !372
  %11 = load i32* %j, align 4, !dbg !375
  %add = add nsw i32 %mul, %11, !dbg !372
  %rem = srem i32 %add, 20, !dbg !376
  %cmp6 = icmp eq i32 %rem, 0, !dbg !376
  br i1 %cmp6, label %if.then, label %if.end, !dbg !377

if.then:                                          ; preds = %for.body3
  %12 = load %struct._IO_FILE** @stderr, align 8, !dbg !378
  %call7 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)), !dbg !380
  br label %if.end, !dbg !380

if.end:                                           ; preds = %if.then, %for.body3
  br label %for.inc, !dbg !381

for.inc:                                          ; preds = %if.end
  %13 = load i32* %j, align 4, !dbg !382
  %inc = add nsw i32 %13, 1, !dbg !382
  store i32 %inc, i32* %j, align 4, !dbg !382
  br label %for.cond1, !dbg !383

for.end:                                          ; preds = %for.cond1
  br label %for.inc8, !dbg !384

for.inc8:                                         ; preds = %for.end
  %14 = load i32* %i, align 4, !dbg !385
  %inc9 = add nsw i32 %14, 1, !dbg !385
  store i32 %inc9, i32* %i, align 4, !dbg !385
  br label %for.cond, !dbg !386

for.end10:                                        ; preds = %for.cond
  %15 = load %struct._IO_FILE** @stderr, align 8, !dbg !387
  %call11 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)), !dbg !388
  ret void, !dbg !389
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
!llvm.module.flags = !{!37, !38}
!llvm.ident = !{!39}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\000\00\000\00\001", !1, !2, !3, !14, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c] [DW_LANG_C99]
!1 = !{!"reg_detect.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect"}
!2 = !{}
!3 = !{!4, !9, !13, !6}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!5 = !{!"0x1\00\000\001152\0032\000\000\000", null, null, !6, !7, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1152, align 32, offset 0] [from int]
!6 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!7 = !{!8, !8}
!8 = !{!"0x21\000\006"}                           ; [ DW_TAG_subrange_type ] [0, 5]
!9 = !{!"0xf\00\000\0064\0064\000\000", null, null, !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = !{!"0x1\00\000\0073728\0032\000\000\000", null, null, !6, !11, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 73728, align 32, offset 0] [from int]
!11 = !{!8, !8, !12}
!12 = !{!"0x21\000\0064"}                         ; [ DW_TAG_subrange_type ] [0, 63]
!13 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!14 = !{!15, !22, !28, !34}
!15 = !{!"0x2e\00main\00main\00\00100\000\001\000\000\00256\000\00101", !1, !16, !17, null, i32 (i32, i8**)* @main, null, null, !2} ; [ DW_TAG_subprogram ] [line 100] [def] [scope 101] [main]
!16 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!17 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !18, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!18 = !{!6, !6, !19}
!19 = !{!"0xf\00\000\0064\0064\000\000", null, null, !20} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!20 = !{!"0xf\00\000\0064\0064\000\000", null, null, !21} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!21 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!22 = !{!"0x2e\00print_array\00print_array\00\0042\001\001\000\000\00256\000\0044", !1, !16, !23, null, void (i32, [6 x i32]*)* @print_array, null, null, !2} ; [ DW_TAG_subprogram ] [line 42] [local] [def] [scope 44] [print_array]
!23 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !24, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!24 = !{null, !6, !25}
!25 = !{!"0xf\00\000\0064\0064\000\000", null, null, !26} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!26 = !{!"0x1\00\000\00192\0032\000\000\000", null, null, !6, !27, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 192, align 32, offset 0] [from int]
!27 = !{!8}
!28 = !{!"0x2e\00kernel_reg_detect\00kernel_reg_detect\00\0060\001\001\000\000\00256\000\0066", !1, !16, !29, null, void (i32, i32, i32, [6 x i32]*, [6 x i32]*, [6 x i32]*, [6 x [64 x i32]]*, [6 x [64 x i32]]*)* @kernel_reg_detect, null, null, !2} ; [ DW_TAG_subprogram ] [line 60] [local] [def] [scope 66] [kernel_reg_detect]
!29 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !30, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!30 = !{null, !6, !6, !6, !25, !25, !25, !31, !31}
!31 = !{!"0xf\00\000\0064\0064\000\000", null, null, !32} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!32 = !{!"0x1\00\000\0012288\0032\000\000\000", null, null, !6, !33, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 12288, align 32, offset 0] [from int]
!33 = !{!8, !12}
!34 = !{!"0x2e\00init_array\00init_array\00\0023\001\001\000\000\00256\000\0027", !1, !16, !35, null, void (i32, [6 x i32]*, [6 x i32]*, [6 x i32]*)* @init_array, null, null, !2} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [scope 27] [init_array]
!35 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !36, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!36 = !{null, !6, !25, !25, !25}
!37 = !{i32 2, !"Dwarf Version", i32 4}
!38 = !{i32 2, !"Debug Info Version", i32 2}
!39 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!40 = !{!"0x101\00argc\0016777316\000", !15, !16, !6} ; [ DW_TAG_arg_variable ] [argc] [line 100]
!41 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!42 = !MDLocation(line: 100, column: 14, scope: !15)
!43 = !{!"0x101\00argv\0033554532\000", !15, !16, !19} ; [ DW_TAG_arg_variable ] [argv] [line 100]
!44 = !MDLocation(line: 100, column: 27, scope: !15)
!45 = !{!"0x100\00niter\00103\000", !15, !16, !6} ; [ DW_TAG_auto_variable ] [niter] [line 103]
!46 = !MDLocation(line: 103, column: 7, scope: !15)
!47 = !{!"0x100\00maxgrid\00104\000", !15, !16, !6} ; [ DW_TAG_auto_variable ] [maxgrid] [line 104]
!48 = !MDLocation(line: 104, column: 7, scope: !15)
!49 = !{!"0x100\00length\00105\000", !15, !16, !6} ; [ DW_TAG_auto_variable ] [length] [line 105]
!50 = !MDLocation(line: 105, column: 7, scope: !15)
!51 = !{!"0x100\00sum_tang\00108\000", !15, !16, !4} ; [ DW_TAG_auto_variable ] [sum_tang] [line 108]
!52 = !MDLocation(line: 108, column: 3, scope: !15)
!53 = !{!"0x100\00mean\00109\000", !15, !16, !4}  ; [ DW_TAG_auto_variable ] [mean] [line 109]
!54 = !MDLocation(line: 109, column: 3, scope: !15)
!55 = !{!"0x100\00path\00110\000", !15, !16, !4}  ; [ DW_TAG_auto_variable ] [path] [line 110]
!56 = !MDLocation(line: 110, column: 3, scope: !15)
!57 = !{!"0x100\00diff\00111\000", !15, !16, !9}  ; [ DW_TAG_auto_variable ] [diff] [line 111]
!58 = !MDLocation(line: 111, column: 3, scope: !15)
!59 = !{!"0x100\00sum_diff\00112\000", !15, !16, !9} ; [ DW_TAG_auto_variable ] [sum_diff] [line 112]
!60 = !MDLocation(line: 112, column: 3, scope: !15)
!61 = !MDLocation(line: 115, column: 15, scope: !15)
!62 = !MDLocation(line: 116, column: 8, scope: !15)
!63 = !MDLocation(line: 117, column: 8, scope: !15)
!64 = !MDLocation(line: 118, column: 8, scope: !15)
!65 = !MDLocation(line: 115, column: 3, scope: !15)
!66 = !MDLocation(line: 124, column: 22, scope: !15)
!67 = !MDLocation(line: 124, column: 29, scope: !15)
!68 = !MDLocation(line: 124, column: 38, scope: !15)
!69 = !MDLocation(line: 125, column: 8, scope: !15)
!70 = !MDLocation(line: 126, column: 8, scope: !15)
!71 = !MDLocation(line: 127, column: 8, scope: !15)
!72 = !MDLocation(line: 128, column: 8, scope: !15)
!73 = !MDLocation(line: 129, column: 8, scope: !15)
!74 = !MDLocation(line: 124, column: 3, scope: !15)
!75 = !MDLocation(line: 137, column: 3, scope: !76)
!76 = !{!"0xb\00137\003\000", !1, !15}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!77 = !MDLocation(line: 137, column: 3, scope: !15)
!78 = !MDLocation(line: 137, column: 3, scope: !79)
!79 = !{!"0xb\001", !1, !76}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!80 = !MDLocation(line: 137, column: 3, scope: !81)
!81 = !{!"0xb\002", !1, !76}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!82 = !MDLocation(line: 140, column: 3, scope: !15)
!83 = !MDLocation(line: 141, column: 3, scope: !15)
!84 = !MDLocation(line: 142, column: 3, scope: !15)
!85 = !MDLocation(line: 143, column: 3, scope: !15)
!86 = !MDLocation(line: 144, column: 3, scope: !15)
!87 = !MDLocation(line: 146, column: 3, scope: !15)
!88 = !{!"0x101\00maxgrid\0016777239\000", !34, !16, !6} ; [ DW_TAG_arg_variable ] [maxgrid] [line 23]
!89 = !MDLocation(line: 23, column: 21, scope: !34)
!90 = !{!"0x101\00sum_tang\0033554456\000", !34, !16, !25} ; [ DW_TAG_arg_variable ] [sum_tang] [line 24]
!91 = !MDLocation(line: 24, column: 13, scope: !34)
!92 = !{!"0x101\00mean\0050331673\000", !34, !16, !25} ; [ DW_TAG_arg_variable ] [mean] [line 25]
!93 = !MDLocation(line: 25, column: 13, scope: !34)
!94 = !{!"0x101\00path\0067108890\000", !34, !16, !25} ; [ DW_TAG_arg_variable ] [path] [line 26]
!95 = !MDLocation(line: 26, column: 13, scope: !34)
!96 = !{!"0x100\00i\0028\000", !34, !16, !6}      ; [ DW_TAG_auto_variable ] [i] [line 28]
!97 = !MDLocation(line: 28, column: 7, scope: !34)
!98 = !{!"0x100\00j\0028\000", !34, !16, !6}      ; [ DW_TAG_auto_variable ] [j] [line 28]
!99 = !MDLocation(line: 28, column: 10, scope: !34)
!100 = !MDLocation(line: 30, column: 8, scope: !101)
!101 = !{!"0xb\0030\003\0030", !1, !34}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!102 = !MDLocation(line: 30, column: 15, scope: !103)
!103 = !{!"0xb\002", !1, !104}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!104 = !{!"0xb\001", !1, !105}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!105 = !{!"0xb\0030\003\0031", !1, !101}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!106 = !MDLocation(line: 30, column: 19, scope: !105)
!107 = !MDLocation(line: 30, column: 15, scope: !105)
!108 = !MDLocation(line: 30, column: 3, scope: !101)
!109 = !MDLocation(line: 31, column: 10, scope: !110)
!110 = !{!"0xb\0031\005\0032", !1, !105}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!111 = !MDLocation(line: 31, column: 17, scope: !112)
!112 = !{!"0xb\002", !1, !113}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!113 = !{!"0xb\001", !1, !114}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!114 = !{!"0xb\0031\005\0033", !1, !110}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!115 = !MDLocation(line: 31, column: 21, scope: !114)
!116 = !MDLocation(line: 31, column: 17, scope: !114)
!117 = !MDLocation(line: 31, column: 5, scope: !110)
!118 = !MDLocation(line: 32, column: 37, scope: !119)
!119 = !{!"0xb\0031\0035\0034", !1, !114}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!120 = !MDLocation(line: 32, column: 43, scope: !119)
!121 = !MDLocation(line: 32, column: 36, scope: !119)
!122 = !MDLocation(line: 32, column: 19, scope: !119)
!123 = !MDLocation(line: 32, column: 7, scope: !119)
!124 = !MDLocation(line: 32, column: 16, scope: !119)
!125 = !MDLocation(line: 33, column: 33, scope: !119)
!126 = !MDLocation(line: 33, column: 35, scope: !119)
!127 = !MDLocation(line: 33, column: 21, scope: !119)
!128 = !MDLocation(line: 33, column: 40, scope: !119)
!129 = !MDLocation(line: 33, column: 20, scope: !119)
!130 = !MDLocation(line: 33, column: 15, scope: !119)
!131 = !MDLocation(line: 33, column: 7, scope: !119)
!132 = !MDLocation(line: 33, column: 12, scope: !119)
!133 = !MDLocation(line: 34, column: 33, scope: !119)
!134 = !MDLocation(line: 34, column: 36, scope: !119)
!135 = !MDLocation(line: 34, column: 21, scope: !119)
!136 = !MDLocation(line: 34, column: 44, scope: !119)
!137 = !MDLocation(line: 34, column: 20, scope: !119)
!138 = !MDLocation(line: 34, column: 15, scope: !119)
!139 = !MDLocation(line: 34, column: 7, scope: !119)
!140 = !MDLocation(line: 34, column: 12, scope: !119)
!141 = !MDLocation(line: 35, column: 5, scope: !119)
!142 = !MDLocation(line: 31, column: 30, scope: !114)
!143 = !MDLocation(line: 31, column: 5, scope: !114)
!144 = !MDLocation(line: 35, column: 5, scope: !110)
!145 = !MDLocation(line: 30, column: 28, scope: !105)
!146 = !MDLocation(line: 30, column: 3, scope: !105)
!147 = !MDLocation(line: 36, column: 1, scope: !34)
!148 = !{!"0x101\00niter\0016777276\000", !28, !16, !6} ; [ DW_TAG_arg_variable ] [niter] [line 60]
!149 = !MDLocation(line: 60, column: 28, scope: !28)
!150 = !{!"0x101\00maxgrid\0033554492\000", !28, !16, !6} ; [ DW_TAG_arg_variable ] [maxgrid] [line 60]
!151 = !MDLocation(line: 60, column: 39, scope: !28)
!152 = !{!"0x101\00length\0050331708\000", !28, !16, !6} ; [ DW_TAG_arg_variable ] [length] [line 60]
!153 = !MDLocation(line: 60, column: 52, scope: !28)
!154 = !{!"0x101\00sum_tang\0067108925\000", !28, !16, !25} ; [ DW_TAG_arg_variable ] [sum_tang] [line 61]
!155 = !MDLocation(line: 61, column: 20, scope: !28)
!156 = !{!"0x101\00mean\0083886142\000", !28, !16, !25} ; [ DW_TAG_arg_variable ] [mean] [line 62]
!157 = !MDLocation(line: 62, column: 20, scope: !28)
!158 = !{!"0x101\00path\00100663359\000", !28, !16, !25} ; [ DW_TAG_arg_variable ] [path] [line 63]
!159 = !MDLocation(line: 63, column: 20, scope: !28)
!160 = !{!"0x101\00diff\00117440576\000", !28, !16, !31} ; [ DW_TAG_arg_variable ] [diff] [line 64]
!161 = !MDLocation(line: 64, column: 20, scope: !28)
!162 = !{!"0x101\00sum_diff\00134217793\000", !28, !16, !31} ; [ DW_TAG_arg_variable ] [sum_diff] [line 65]
!163 = !MDLocation(line: 65, column: 20, scope: !28)
!164 = !{!"0x100\00t\0067\000", !28, !16, !6}     ; [ DW_TAG_auto_variable ] [t] [line 67]
!165 = !MDLocation(line: 67, column: 7, scope: !28)
!166 = !{!"0x100\00i\0067\000", !28, !16, !6}     ; [ DW_TAG_auto_variable ] [i] [line 67]
!167 = !MDLocation(line: 67, column: 10, scope: !28)
!168 = !{!"0x100\00j\0067\000", !28, !16, !6}     ; [ DW_TAG_auto_variable ] [j] [line 67]
!169 = !MDLocation(line: 67, column: 13, scope: !28)
!170 = !{!"0x100\00cnt\0067\000", !28, !16, !6}   ; [ DW_TAG_auto_variable ] [cnt] [line 67]
!171 = !MDLocation(line: 67, column: 16, scope: !28)
!172 = !MDLocation(line: 70, column: 8, scope: !173)
!173 = !{!"0xb\0070\003\007", !1, !28}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!174 = !MDLocation(line: 70, column: 15, scope: !175)
!175 = !{!"0xb\002", !1, !176}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!176 = !{!"0xb\001", !1, !177}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!177 = !{!"0xb\0070\003\008", !1, !173}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!178 = !MDLocation(line: 70, column: 19, scope: !177)
!179 = !MDLocation(line: 70, column: 15, scope: !177)
!180 = !MDLocation(line: 70, column: 3, scope: !173)
!181 = !MDLocation(line: 72, column: 12, scope: !182)
!182 = !{!"0xb\0072\007\0010", !1, !183}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!183 = !{!"0xb\0071\005\009", !1, !177}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!184 = !MDLocation(line: 72, column: 19, scope: !185)
!185 = !{!"0xb\002", !1, !186}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!186 = !{!"0xb\001", !1, !187}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!187 = !{!"0xb\0072\007\0011", !1, !182}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!188 = !MDLocation(line: 72, column: 24, scope: !187)
!189 = !MDLocation(line: 72, column: 19, scope: !187)
!190 = !MDLocation(line: 72, column: 7, scope: !182)
!191 = !MDLocation(line: 73, column: 11, scope: !192)
!192 = !{!"0xb\0073\002\0012", !1, !187}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!193 = !MDLocation(line: 73, column: 7, scope: !192)
!194 = !MDLocation(line: 73, column: 14, scope: !195)
!195 = !{!"0xb\002", !1, !196}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!196 = !{!"0xb\001", !1, !197}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!197 = !{!"0xb\0073\002\0013", !1, !192}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!198 = !MDLocation(line: 73, column: 19, scope: !197)
!199 = !MDLocation(line: 73, column: 14, scope: !197)
!200 = !MDLocation(line: 73, column: 2, scope: !192)
!201 = !MDLocation(line: 74, column: 9, scope: !202)
!202 = !{!"0xb\0074\004\0014", !1, !197}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!203 = !MDLocation(line: 74, column: 18, scope: !204)
!204 = !{!"0xb\002", !1, !205}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!205 = !{!"0xb\001", !1, !206}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!206 = !{!"0xb\0074\004\0015", !1, !202}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!207 = !MDLocation(line: 74, column: 25, scope: !206)
!208 = !MDLocation(line: 74, column: 18, scope: !206)
!209 = !MDLocation(line: 74, column: 4, scope: !202)
!210 = !MDLocation(line: 75, column: 36, scope: !206)
!211 = !MDLocation(line: 75, column: 24, scope: !206)
!212 = !MDLocation(line: 75, column: 33, scope: !206)
!213 = !MDLocation(line: 75, column: 17, scope: !206)
!214 = !MDLocation(line: 75, column: 6, scope: !206)
!215 = !MDLocation(line: 75, column: 14, scope: !206)
!216 = !MDLocation(line: 75, column: 11, scope: !206)
!217 = !MDLocation(line: 74, column: 37, scope: !206)
!218 = !MDLocation(line: 74, column: 4, scope: !206)
!219 = !MDLocation(line: 75, column: 37, scope: !202)
!220 = !MDLocation(line: 73, column: 32, scope: !197)
!221 = !MDLocation(line: 73, column: 2, scope: !197)
!222 = !MDLocation(line: 75, column: 37, scope: !192)
!223 = !MDLocation(line: 72, column: 37, scope: !187)
!224 = !MDLocation(line: 72, column: 7, scope: !187)
!225 = !MDLocation(line: 77, column: 12, scope: !226)
!226 = !{!"0xb\0077\007\0016", !1, !183}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!227 = !MDLocation(line: 77, column: 19, scope: !228)
!228 = !{!"0xb\002", !1, !229}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!229 = !{!"0xb\001", !1, !230}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!230 = !{!"0xb\0077\007\0017", !1, !226}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!231 = !MDLocation(line: 77, column: 24, scope: !230)
!232 = !MDLocation(line: 77, column: 19, scope: !230)
!233 = !MDLocation(line: 77, column: 7, scope: !226)
!234 = !MDLocation(line: 79, column: 13, scope: !235)
!235 = !{!"0xb\0079\004\0019", !1, !236}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!236 = !{!"0xb\0078\009\0018", !1, !230}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!237 = !MDLocation(line: 79, column: 9, scope: !235)
!238 = !MDLocation(line: 79, column: 16, scope: !239)
!239 = !{!"0xb\002", !1, !240}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!240 = !{!"0xb\001", !1, !241}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!241 = !{!"0xb\0079\004\0020", !1, !235}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!242 = !MDLocation(line: 79, column: 21, scope: !241)
!243 = !MDLocation(line: 79, column: 16, scope: !241)
!244 = !MDLocation(line: 79, column: 4, scope: !235)
!245 = !MDLocation(line: 81, column: 36, scope: !246)
!246 = !{!"0xb\0080\0013\0021", !1, !241}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!247 = !MDLocation(line: 81, column: 28, scope: !246)
!248 = !MDLocation(line: 81, column: 33, scope: !246)
!249 = !MDLocation(line: 81, column: 20, scope: !246)
!250 = !MDLocation(line: 81, column: 8, scope: !246)
!251 = !MDLocation(line: 81, column: 17, scope: !246)
!252 = !MDLocation(line: 82, column: 13, scope: !253)
!253 = !{!"0xb\0082\008\0022", !1, !246}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!254 = !MDLocation(line: 82, column: 22, scope: !255)
!255 = !{!"0xb\002", !1, !256}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!256 = !{!"0xb\001", !1, !257}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!257 = !{!"0xb\0082\008\0023", !1, !253}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!258 = !MDLocation(line: 82, column: 29, scope: !257)
!259 = !MDLocation(line: 82, column: 22, scope: !257)
!260 = !MDLocation(line: 82, column: 8, scope: !253)
!261 = !MDLocation(line: 83, column: 40, scope: !257)
!262 = !MDLocation(line: 83, column: 25, scope: !257)
!263 = !MDLocation(line: 83, column: 37, scope: !257)
!264 = !MDLocation(line: 83, column: 34, scope: !257)
!265 = !MDLocation(line: 83, column: 62, scope: !257)
!266 = !MDLocation(line: 83, column: 51, scope: !257)
!267 = !MDLocation(line: 83, column: 59, scope: !257)
!268 = !MDLocation(line: 83, column: 56, scope: !257)
!269 = !MDLocation(line: 83, column: 18, scope: !257)
!270 = !MDLocation(line: 83, column: 3, scope: !257)
!271 = !MDLocation(line: 83, column: 15, scope: !257)
!272 = !MDLocation(line: 83, column: 12, scope: !257)
!273 = !MDLocation(line: 82, column: 41, scope: !257)
!274 = !MDLocation(line: 82, column: 8, scope: !257)
!275 = !MDLocation(line: 84, column: 36, scope: !246)
!276 = !MDLocation(line: 84, column: 21, scope: !246)
!277 = !MDLocation(line: 84, column: 33, scope: !246)
!278 = !MDLocation(line: 84, column: 30, scope: !246)
!279 = !MDLocation(line: 84, column: 16, scope: !246)
!280 = !MDLocation(line: 84, column: 8, scope: !246)
!281 = !MDLocation(line: 84, column: 13, scope: !246)
!282 = !MDLocation(line: 85, column: 13, scope: !246)
!283 = !MDLocation(line: 79, column: 34, scope: !241)
!284 = !MDLocation(line: 79, column: 4, scope: !241)
!285 = !MDLocation(line: 86, column: 9, scope: !236)
!286 = !MDLocation(line: 77, column: 37, scope: !230)
!287 = !MDLocation(line: 77, column: 7, scope: !230)
!288 = !MDLocation(line: 88, column: 12, scope: !289)
!289 = !{!"0xb\0088\007\0024", !1, !183}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!290 = !MDLocation(line: 88, column: 19, scope: !291)
!291 = !{!"0xb\002", !1, !292}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!292 = !{!"0xb\001", !1, !293}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!293 = !{!"0xb\0088\007\0025", !1, !289}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!294 = !MDLocation(line: 88, column: 24, scope: !293)
!295 = !MDLocation(line: 88, column: 19, scope: !293)
!296 = !MDLocation(line: 88, column: 7, scope: !289)
!297 = !MDLocation(line: 89, column: 23, scope: !293)
!298 = !MDLocation(line: 89, column: 15, scope: !293)
!299 = !MDLocation(line: 89, column: 10, scope: !293)
!300 = !MDLocation(line: 89, column: 2, scope: !293)
!301 = !MDLocation(line: 88, column: 37, scope: !293)
!302 = !MDLocation(line: 88, column: 7, scope: !293)
!303 = !MDLocation(line: 91, column: 12, scope: !304)
!304 = !{!"0xb\0091\007\0026", !1, !183}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!305 = !MDLocation(line: 91, column: 19, scope: !306)
!306 = !{!"0xb\002", !1, !307}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!307 = !{!"0xb\001", !1, !308}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!308 = !{!"0xb\0091\007\0027", !1, !304}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!309 = !MDLocation(line: 91, column: 24, scope: !308)
!310 = !MDLocation(line: 91, column: 19, scope: !308)
!311 = !MDLocation(line: 91, column: 7, scope: !304)
!312 = !MDLocation(line: 92, column: 11, scope: !313)
!313 = !{!"0xb\0092\002\0028", !1, !308}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!314 = !MDLocation(line: 92, column: 7, scope: !313)
!315 = !MDLocation(line: 92, column: 14, scope: !316)
!316 = !{!"0xb\002", !1, !317}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!317 = !{!"0xb\001", !1, !318}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!318 = !{!"0xb\0092\002\0029", !1, !313}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!319 = !MDLocation(line: 92, column: 19, scope: !318)
!320 = !MDLocation(line: 92, column: 14, scope: !318)
!321 = !MDLocation(line: 92, column: 2, scope: !313)
!322 = !MDLocation(line: 93, column: 29, scope: !318)
!323 = !MDLocation(line: 93, column: 17, scope: !318)
!324 = !MDLocation(line: 93, column: 22, scope: !318)
!325 = !MDLocation(line: 93, column: 46, scope: !318)
!326 = !MDLocation(line: 93, column: 38, scope: !318)
!327 = !MDLocation(line: 93, column: 43, scope: !318)
!328 = !MDLocation(line: 93, column: 12, scope: !318)
!329 = !MDLocation(line: 93, column: 4, scope: !318)
!330 = !MDLocation(line: 93, column: 9, scope: !318)
!331 = !MDLocation(line: 92, column: 32, scope: !318)
!332 = !MDLocation(line: 92, column: 2, scope: !318)
!333 = !MDLocation(line: 93, column: 47, scope: !313)
!334 = !MDLocation(line: 91, column: 37, scope: !308)
!335 = !MDLocation(line: 91, column: 7, scope: !308)
!336 = !MDLocation(line: 94, column: 5, scope: !183)
!337 = !MDLocation(line: 70, column: 26, scope: !177)
!338 = !MDLocation(line: 70, column: 3, scope: !177)
!339 = !MDLocation(line: 97, column: 1, scope: !28)
!340 = !{!"0x101\00maxgrid\0016777258\000", !22, !16, !6} ; [ DW_TAG_arg_variable ] [maxgrid] [line 42]
!341 = !MDLocation(line: 42, column: 22, scope: !22)
!342 = !{!"0x101\00path\0033554475\000", !22, !16, !25} ; [ DW_TAG_arg_variable ] [path] [line 43]
!343 = !MDLocation(line: 43, column: 14, scope: !22)
!344 = !{!"0x100\00i\0045\000", !22, !16, !6}     ; [ DW_TAG_auto_variable ] [i] [line 45]
!345 = !MDLocation(line: 45, column: 7, scope: !22)
!346 = !{!"0x100\00j\0045\000", !22, !16, !6}     ; [ DW_TAG_auto_variable ] [j] [line 45]
!347 = !MDLocation(line: 45, column: 10, scope: !22)
!348 = !MDLocation(line: 47, column: 8, scope: !349)
!349 = !{!"0xb\0047\003\001", !1, !22}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!350 = !MDLocation(line: 47, column: 15, scope: !351)
!351 = !{!"0xb\002", !1, !352}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!352 = !{!"0xb\001", !1, !353}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!353 = !{!"0xb\0047\003\002", !1, !349}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!354 = !MDLocation(line: 47, column: 19, scope: !353)
!355 = !MDLocation(line: 47, column: 15, scope: !353)
!356 = !MDLocation(line: 47, column: 3, scope: !349)
!357 = !MDLocation(line: 48, column: 10, scope: !358)
!358 = !{!"0xb\0048\005\003", !1, !353}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!359 = !MDLocation(line: 48, column: 17, scope: !360)
!360 = !{!"0xb\002", !1, !361}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!361 = !{!"0xb\001", !1, !362}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!362 = !{!"0xb\0048\005\004", !1, !358}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!363 = !MDLocation(line: 48, column: 21, scope: !362)
!364 = !MDLocation(line: 48, column: 17, scope: !362)
!365 = !MDLocation(line: 48, column: 5, scope: !358)
!366 = !MDLocation(line: 49, column: 16, scope: !367)
!367 = !{!"0xb\0048\0035\005", !1, !362}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!368 = !MDLocation(line: 49, column: 54, scope: !367)
!369 = !MDLocation(line: 49, column: 46, scope: !367)
!370 = !MDLocation(line: 49, column: 51, scope: !367)
!371 = !MDLocation(line: 49, column: 7, scope: !367)
!372 = !MDLocation(line: 50, column: 12, scope: !373)
!373 = !{!"0xb\0050\0011\006", !1, !367}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!374 = !MDLocation(line: 50, column: 16, scope: !373)
!375 = !MDLocation(line: 50, column: 26, scope: !373)
!376 = !MDLocation(line: 50, column: 11, scope: !373)
!377 = !MDLocation(line: 50, column: 11, scope: !367)
!378 = !MDLocation(line: 50, column: 49, scope: !379)
!379 = !{!"0xb\001", !1, !373}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/medley/reg_detect/reg_detect.c]
!380 = !MDLocation(line: 50, column: 40, scope: !373)
!381 = !MDLocation(line: 51, column: 5, scope: !367)
!382 = !MDLocation(line: 48, column: 30, scope: !362)
!383 = !MDLocation(line: 48, column: 5, scope: !362)
!384 = !MDLocation(line: 51, column: 5, scope: !358)
!385 = !MDLocation(line: 47, column: 28, scope: !353)
!386 = !MDLocation(line: 47, column: 3, scope: !353)
!387 = !MDLocation(line: 52, column: 12, scope: !22)
!388 = !MDLocation(line: 52, column: 3, scope: !22)
!389 = !MDLocation(line: 53, column: 1, scope: !22)
