; ModuleID = 'jacobi-1d-imper.c'
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
  %tsteps = alloca i32, align 4
  %A = alloca [10000 x double]*, align 8
  %B = alloca [10000 x double]*, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !32, metadata !33), !dbg !34
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !35, metadata !33), !dbg !36
  call void @llvm.dbg.declare(metadata i32* %n, metadata !37, metadata !33), !dbg !38
  store i32 10000, i32* %n, align 4, !dbg !38
  call void @llvm.dbg.declare(metadata i32* %tsteps, metadata !39, metadata !33), !dbg !40
  store i32 100, i32* %tsteps, align 4, !dbg !40
  call void @llvm.dbg.declare(metadata [10000 x double]** %A, metadata !41, metadata !33), !dbg !42
  %call = call i8* @polybench_alloc_data(i32 10000, i32 8), !dbg !42
  %0 = bitcast i8* %call to [10000 x double]*, !dbg !42
  store [10000 x double]* %0, [10000 x double]** %A, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata [10000 x double]** %B, metadata !43, metadata !33), !dbg !44
  %call1 = call i8* @polybench_alloc_data(i32 10000, i32 8), !dbg !44
  %1 = bitcast i8* %call1 to [10000 x double]*, !dbg !44
  store [10000 x double]* %1, [10000 x double]** %B, align 8, !dbg !44
  %2 = load i32* %n, align 4, !dbg !45
  %3 = load [10000 x double]** %A, align 8, !dbg !46
  %arraydecay = getelementptr inbounds [10000 x double]* %3, i32 0, i32 0, !dbg !46
  %4 = load [10000 x double]** %B, align 8, !dbg !47
  %arraydecay2 = getelementptr inbounds [10000 x double]* %4, i32 0, i32 0, !dbg !47
  call void @init_array(i32 %2, double* %arraydecay, double* %arraydecay2), !dbg !48
  %5 = load i32* %tsteps, align 4, !dbg !49
  %6 = load i32* %n, align 4, !dbg !50
  %7 = load [10000 x double]** %A, align 8, !dbg !51
  %arraydecay3 = getelementptr inbounds [10000 x double]* %7, i32 0, i32 0, !dbg !51
  %8 = load [10000 x double]** %B, align 8, !dbg !52
  %arraydecay4 = getelementptr inbounds [10000 x double]* %8, i32 0, i32 0, !dbg !52
  call void @kernel_jacobi_1d_imper(i32 %5, i32 %6, double* %arraydecay3, double* %arraydecay4), !dbg !53
  %9 = load i32* %argc.addr, align 4, !dbg !54
  %cmp = icmp sgt i32 %9, 42, !dbg !54
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !56

land.lhs.true:                                    ; preds = %entry
  %10 = load i8*** %argv.addr, align 8, !dbg !57
  %arrayidx = getelementptr inbounds i8** %10, i64 0, !dbg !57
  %11 = load i8** %arrayidx, align 8, !dbg !57
  %call5 = call i32 @strcmp(i8* %11, i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0)) #5, !dbg !57
  %tobool = icmp ne i32 %call5, 0, !dbg !56
  br i1 %tobool, label %if.end, label %if.then, !dbg !56

if.then:                                          ; preds = %land.lhs.true
  %12 = load i32* %n, align 4, !dbg !59
  %13 = load [10000 x double]** %A, align 8, !dbg !59
  %arraydecay6 = getelementptr inbounds [10000 x double]* %13, i32 0, i32 0, !dbg !59
  call void @print_array(i32 %12, double* %arraydecay6), !dbg !59
  br label %if.end, !dbg !59

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %14 = load [10000 x double]** %A, align 8, !dbg !61
  %15 = bitcast [10000 x double]* %14 to i8*, !dbg !61
  call void @free(i8* %15) #6, !dbg !61
  %16 = load [10000 x double]** %B, align 8, !dbg !62
  %17 = bitcast [10000 x double]* %16 to i8*, !dbg !62
  call void @free(i8* %17) #6, !dbg !62
  ret i32 0, !dbg !63
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i8* @polybench_alloc_data(i32, i32) #2

; Function Attrs: nounwind uwtable
define internal void @init_array(i32 %n, double* %A, double* %B) #0 {
entry:
  %n.addr = alloca i32, align 4
  %A.addr = alloca double*, align 8
  %B.addr = alloca double*, align 8
  %i = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !64, metadata !33), !dbg !65
  store double* %A, double** %A.addr, align 8
  call void @llvm.dbg.declare(metadata double** %A.addr, metadata !66, metadata !33), !dbg !67
  store double* %B, double** %B.addr, align 8
  call void @llvm.dbg.declare(metadata double** %B.addr, metadata !68, metadata !33), !dbg !69
  call void @llvm.dbg.declare(metadata i32* %i, metadata !70, metadata !33), !dbg !71
  store i32 0, i32* %i, align 4, !dbg !72
  br label %for.cond, !dbg !72

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4, !dbg !74
  %1 = load i32* %n.addr, align 4, !dbg !78
  %cmp = icmp slt i32 %0, %1, !dbg !79
  br i1 %cmp, label %for.body, label %for.end, !dbg !80

for.body:                                         ; preds = %for.cond
  %2 = load i32* %i, align 4, !dbg !81
  %conv = sitofp i32 %2 to double, !dbg !83
  %add = fadd double %conv, 2.000000e+00, !dbg !83
  %3 = load i32* %n.addr, align 4, !dbg !84
  %conv1 = sitofp i32 %3 to double, !dbg !84
  %div = fdiv double %add, %conv1, !dbg !85
  %4 = load i32* %i, align 4, !dbg !86
  %idxprom = sext i32 %4 to i64, !dbg !87
  %5 = load double** %A.addr, align 8, !dbg !87
  %arrayidx = getelementptr inbounds double* %5, i64 %idxprom, !dbg !87
  store double %div, double* %arrayidx, align 8, !dbg !87
  %6 = load i32* %i, align 4, !dbg !88
  %conv2 = sitofp i32 %6 to double, !dbg !89
  %add3 = fadd double %conv2, 3.000000e+00, !dbg !89
  %7 = load i32* %n.addr, align 4, !dbg !90
  %conv4 = sitofp i32 %7 to double, !dbg !90
  %div5 = fdiv double %add3, %conv4, !dbg !91
  %8 = load i32* %i, align 4, !dbg !92
  %idxprom6 = sext i32 %8 to i64, !dbg !93
  %9 = load double** %B.addr, align 8, !dbg !93
  %arrayidx7 = getelementptr inbounds double* %9, i64 %idxprom6, !dbg !93
  store double %div5, double* %arrayidx7, align 8, !dbg !93
  br label %for.inc, !dbg !94

for.inc:                                          ; preds = %for.body
  %10 = load i32* %i, align 4, !dbg !95
  %inc = add nsw i32 %10, 1, !dbg !95
  store i32 %inc, i32* %i, align 4, !dbg !95
  br label %for.cond, !dbg !96

for.end:                                          ; preds = %for.cond
  ret void, !dbg !97
}

; Function Attrs: nounwind uwtable
define internal void @kernel_jacobi_1d_imper(i32 %tsteps, i32 %n, double* %A, double* %B) #0 {
entry:
  %tsteps.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %A.addr = alloca double*, align 8
  %B.addr = alloca double*, align 8
  %t = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %tsteps, i32* %tsteps.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %tsteps.addr, metadata !98, metadata !33), !dbg !99
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !100, metadata !33), !dbg !101
  store double* %A, double** %A.addr, align 8
  call void @llvm.dbg.declare(metadata double** %A.addr, metadata !102, metadata !33), !dbg !103
  store double* %B, double** %B.addr, align 8
  call void @llvm.dbg.declare(metadata double** %B.addr, metadata !104, metadata !33), !dbg !105
  call void @llvm.dbg.declare(metadata i32* %t, metadata !106, metadata !33), !dbg !107
  call void @llvm.dbg.declare(metadata i32* %i, metadata !108, metadata !33), !dbg !109
  call void @llvm.dbg.declare(metadata i32* %j, metadata !110, metadata !33), !dbg !111
  store i32 0, i32* %t, align 4, !dbg !112
  br label %for.cond, !dbg !112

for.cond:                                         ; preds = %for.inc24, %entry
  %0 = load i32* %t, align 4, !dbg !114
  %1 = load i32* %tsteps.addr, align 4, !dbg !118
  %cmp = icmp slt i32 %0, %1, !dbg !119
  br i1 %cmp, label %for.body, label %for.end26, !dbg !120

for.body:                                         ; preds = %for.cond
  store i32 1, i32* %i, align 4, !dbg !121
  br label %for.cond1, !dbg !121

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32* %i, align 4, !dbg !124
  %3 = load i32* %n.addr, align 4, !dbg !128
  %sub = sub nsw i32 %3, 1, !dbg !128
  %cmp2 = icmp slt i32 %2, %sub, !dbg !129
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !130

for.body3:                                        ; preds = %for.cond1
  %4 = load i32* %i, align 4, !dbg !131
  %sub4 = sub nsw i32 %4, 1, !dbg !131
  %idxprom = sext i32 %sub4 to i64, !dbg !132
  %5 = load double** %A.addr, align 8, !dbg !132
  %arrayidx = getelementptr inbounds double* %5, i64 %idxprom, !dbg !132
  %6 = load double* %arrayidx, align 8, !dbg !132
  %7 = load i32* %i, align 4, !dbg !133
  %idxprom5 = sext i32 %7 to i64, !dbg !134
  %8 = load double** %A.addr, align 8, !dbg !134
  %arrayidx6 = getelementptr inbounds double* %8, i64 %idxprom5, !dbg !134
  %9 = load double* %arrayidx6, align 8, !dbg !134
  %add = fadd double %6, %9, !dbg !132
  %10 = load i32* %i, align 4, !dbg !135
  %add7 = add nsw i32 %10, 1, !dbg !135
  %idxprom8 = sext i32 %add7 to i64, !dbg !136
  %11 = load double** %A.addr, align 8, !dbg !136
  %arrayidx9 = getelementptr inbounds double* %11, i64 %idxprom8, !dbg !136
  %12 = load double* %arrayidx9, align 8, !dbg !136
  %add10 = fadd double %add, %12, !dbg !132
  %mul = fmul double 3.333300e-01, %add10, !dbg !137
  %13 = load i32* %i, align 4, !dbg !138
  %idxprom11 = sext i32 %13 to i64, !dbg !139
  %14 = load double** %B.addr, align 8, !dbg !139
  %arrayidx12 = getelementptr inbounds double* %14, i64 %idxprom11, !dbg !139
  store double %mul, double* %arrayidx12, align 8, !dbg !139
  br label %for.inc, !dbg !139

for.inc:                                          ; preds = %for.body3
  %15 = load i32* %i, align 4, !dbg !140
  %inc = add nsw i32 %15, 1, !dbg !140
  store i32 %inc, i32* %i, align 4, !dbg !140
  br label %for.cond1, !dbg !141

for.end:                                          ; preds = %for.cond1
  store i32 1, i32* %j, align 4, !dbg !142
  br label %for.cond13, !dbg !142

for.cond13:                                       ; preds = %for.inc21, %for.end
  %16 = load i32* %j, align 4, !dbg !144
  %17 = load i32* %n.addr, align 4, !dbg !148
  %sub14 = sub nsw i32 %17, 1, !dbg !148
  %cmp15 = icmp slt i32 %16, %sub14, !dbg !149
  br i1 %cmp15, label %for.body16, label %for.end23, !dbg !150

for.body16:                                       ; preds = %for.cond13
  %18 = load i32* %j, align 4, !dbg !151
  %idxprom17 = sext i32 %18 to i64, !dbg !152
  %19 = load double** %B.addr, align 8, !dbg !152
  %arrayidx18 = getelementptr inbounds double* %19, i64 %idxprom17, !dbg !152
  %20 = load double* %arrayidx18, align 8, !dbg !152
  %21 = load i32* %j, align 4, !dbg !153
  %idxprom19 = sext i32 %21 to i64, !dbg !154
  %22 = load double** %A.addr, align 8, !dbg !154
  %arrayidx20 = getelementptr inbounds double* %22, i64 %idxprom19, !dbg !154
  store double %20, double* %arrayidx20, align 8, !dbg !154
  br label %for.inc21, !dbg !154

for.inc21:                                        ; preds = %for.body16
  %23 = load i32* %j, align 4, !dbg !155
  %inc22 = add nsw i32 %23, 1, !dbg !155
  store i32 %inc22, i32* %j, align 4, !dbg !155
  br label %for.cond13, !dbg !156

for.end23:                                        ; preds = %for.cond13
  br label %for.inc24, !dbg !157

for.inc24:                                        ; preds = %for.end23
  %24 = load i32* %t, align 4, !dbg !158
  %inc25 = add nsw i32 %24, 1, !dbg !158
  store i32 %inc25, i32* %t, align 4, !dbg !158
  br label %for.cond, !dbg !159

for.end26:                                        ; preds = %for.cond
  ret void, !dbg !160
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #3

; Function Attrs: nounwind uwtable
define internal void @print_array(i32 %n, double* %A) #0 {
entry:
  %n.addr = alloca i32, align 4
  %A.addr = alloca double*, align 8
  %i = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !161, metadata !33), !dbg !162
  store double* %A, double** %A.addr, align 8
  call void @llvm.dbg.declare(metadata double** %A.addr, metadata !163, metadata !33), !dbg !164
  call void @llvm.dbg.declare(metadata i32* %i, metadata !165, metadata !33), !dbg !166
  store i32 0, i32* %i, align 4, !dbg !167
  br label %for.cond, !dbg !167

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4, !dbg !169
  %1 = load i32* %n.addr, align 4, !dbg !173
  %cmp = icmp slt i32 %0, %1, !dbg !174
  br i1 %cmp, label %for.body, label %for.end, !dbg !175

for.body:                                         ; preds = %for.cond
  %2 = load %struct._IO_FILE** @stderr, align 8, !dbg !176
  %3 = load i32* %i, align 4, !dbg !178
  %idxprom = sext i32 %3 to i64, !dbg !179
  %4 = load double** %A.addr, align 8, !dbg !179
  %arrayidx = getelementptr inbounds double* %4, i64 %idxprom, !dbg !179
  %5 = load double* %arrayidx, align 8, !dbg !179
  %call = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([8 x i8]* @.str1, i32 0, i32 0), double %5), !dbg !180
  %6 = load i32* %i, align 4, !dbg !181
  %rem = srem i32 %6, 20, !dbg !181
  %cmp1 = icmp eq i32 %rem, 0, !dbg !181
  br i1 %cmp1, label %if.then, label %if.end, !dbg !183

if.then:                                          ; preds = %for.body
  %7 = load %struct._IO_FILE** @stderr, align 8, !dbg !184
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)), !dbg !186
  br label %if.end, !dbg !186

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc, !dbg !187

for.inc:                                          ; preds = %if.end
  %8 = load i32* %i, align 4, !dbg !188
  %inc = add nsw i32 %8, 1, !dbg !188
  store i32 %inc, i32* %i, align 4, !dbg !188
  br label %for.cond, !dbg !189

for.end:                                          ; preds = %for.cond
  %9 = load %struct._IO_FILE** @stderr, align 8, !dbg !190
  %call3 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)), !dbg !191
  ret void, !dbg !192
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
!llvm.module.flags = !{!29, !30}
!llvm.ident = !{!31}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\000\00\000\00\001", !1, !2, !3, !10, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-1d-imper/jacobi-1d-imper.c] [DW_LANG_C99]
!1 = !{!"jacobi-1d-imper.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-1d-imper"}
!2 = !{}
!3 = !{!4, !9, !6}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!5 = !{!"0x1\00\000\00640000\0064\000\000\000", null, null, !6, !7, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 640000, align 64, offset 0] [from double]
!6 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!7 = !{!8}
!8 = !{!"0x21\000\0010000"}                       ; [ DW_TAG_subrange_type ] [0, 9999]
!9 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = !{!11, !19, !23, !26}
!11 = !{!"0x2e\00main\00main\00\0078\000\001\000\000\00256\000\0079", !1, !12, !13, null, i32 (i32, i8**)* @main, null, null, !2} ; [ DW_TAG_subprogram ] [line 78] [def] [scope 79] [main]
!12 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-1d-imper/jacobi-1d-imper.c]
!13 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !14, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = !{!15, !15, !16}
!15 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!16 = !{!"0xf\00\000\0064\0064\000\000", null, null, !17} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!17 = !{!"0xf\00\000\0064\0064\000\000", null, null, !18} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!18 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!19 = !{!"0x2e\00print_array\00print_array\00\0040\001\001\000\000\00256\000\0043", !1, !12, !20, null, void (i32, double*)* @print_array, null, null, !2} ; [ DW_TAG_subprogram ] [line 40] [local] [def] [scope 43] [print_array]
!20 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !21, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!21 = !{null, !15, !22}
!22 = !{!"0xf\00\000\0064\0064\000\000", null, null, !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!23 = !{!"0x2e\00kernel_jacobi_1d_imper\00kernel_jacobi_1d_imper\00\0058\001\001\000\000\00256\000\0062", !1, !12, !24, null, void (i32, i32, double*, double*)* @kernel_jacobi_1d_imper, null, null, !2} ; [ DW_TAG_subprogram ] [line 58] [local] [def] [scope 62] [kernel_jacobi_1d_imper]
!24 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !25, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!25 = !{null, !15, !15, !22, !22}
!26 = !{!"0x2e\00init_array\00init_array\00\0023\001\001\000\000\00256\000\0026", !1, !12, !27, null, void (i32, double*, double*)* @init_array, null, null, !2} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [scope 26] [init_array]
!27 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !28, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!28 = !{null, !15, !22, !22}
!29 = !{i32 2, !"Dwarf Version", i32 4}
!30 = !{i32 2, !"Debug Info Version", i32 2}
!31 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!32 = !{!"0x101\00argc\0016777294\000", !11, !12, !15} ; [ DW_TAG_arg_variable ] [argc] [line 78]
!33 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!34 = !MDLocation(line: 78, column: 14, scope: !11)
!35 = !{!"0x101\00argv\0033554510\000", !11, !12, !16} ; [ DW_TAG_arg_variable ] [argv] [line 78]
!36 = !MDLocation(line: 78, column: 27, scope: !11)
!37 = !{!"0x100\00n\0081\000", !11, !12, !15}     ; [ DW_TAG_auto_variable ] [n] [line 81]
!38 = !MDLocation(line: 81, column: 7, scope: !11)
!39 = !{!"0x100\00tsteps\0082\000", !11, !12, !15} ; [ DW_TAG_auto_variable ] [tsteps] [line 82]
!40 = !MDLocation(line: 82, column: 7, scope: !11)
!41 = !{!"0x100\00A\0085\000", !11, !12, !4}      ; [ DW_TAG_auto_variable ] [A] [line 85]
!42 = !MDLocation(line: 85, column: 3, scope: !11)
!43 = !{!"0x100\00B\0086\000", !11, !12, !4}      ; [ DW_TAG_auto_variable ] [B] [line 86]
!44 = !MDLocation(line: 86, column: 3, scope: !11)
!45 = !MDLocation(line: 90, column: 15, scope: !11)
!46 = !MDLocation(line: 90, column: 18, scope: !11)
!47 = !MDLocation(line: 90, column: 38, scope: !11)
!48 = !MDLocation(line: 90, column: 3, scope: !11)
!49 = !MDLocation(line: 96, column: 27, scope: !11)
!50 = !MDLocation(line: 96, column: 35, scope: !11)
!51 = !MDLocation(line: 96, column: 38, scope: !11)
!52 = !MDLocation(line: 96, column: 58, scope: !11)
!53 = !MDLocation(line: 96, column: 3, scope: !11)
!54 = !MDLocation(line: 104, column: 3, scope: !55)
!55 = !{!"0xb\00104\003\000", !1, !11}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-1d-imper/jacobi-1d-imper.c]
!56 = !MDLocation(line: 104, column: 3, scope: !11)
!57 = !MDLocation(line: 104, column: 3, scope: !58)
!58 = !{!"0xb\001", !1, !55}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-1d-imper/jacobi-1d-imper.c]
!59 = !MDLocation(line: 104, column: 3, scope: !60)
!60 = !{!"0xb\002", !1, !55}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-1d-imper/jacobi-1d-imper.c]
!61 = !MDLocation(line: 107, column: 3, scope: !11)
!62 = !MDLocation(line: 108, column: 3, scope: !11)
!63 = !MDLocation(line: 110, column: 3, scope: !11)
!64 = !{!"0x101\00n\0016777239\000", !26, !12, !15} ; [ DW_TAG_arg_variable ] [n] [line 23]
!65 = !MDLocation(line: 23, column: 22, scope: !26)
!66 = !{!"0x101\00A\0033554456\000", !26, !12, !22} ; [ DW_TAG_arg_variable ] [A] [line 24]
!67 = !MDLocation(line: 24, column: 14, scope: !26)
!68 = !{!"0x101\00B\0050331673\000", !26, !12, !22} ; [ DW_TAG_arg_variable ] [B] [line 25]
!69 = !MDLocation(line: 25, column: 14, scope: !26)
!70 = !{!"0x100\00i\0027\000", !26, !12, !15}     ; [ DW_TAG_auto_variable ] [i] [line 27]
!71 = !MDLocation(line: 27, column: 7, scope: !26)
!72 = !MDLocation(line: 29, column: 8, scope: !73)
!73 = !{!"0xb\0029\003\0012", !1, !26}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-1d-imper/jacobi-1d-imper.c]
!74 = !MDLocation(line: 29, column: 15, scope: !75)
!75 = !{!"0xb\002", !1, !76}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-1d-imper/jacobi-1d-imper.c]
!76 = !{!"0xb\001", !1, !77}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-1d-imper/jacobi-1d-imper.c]
!77 = !{!"0xb\0029\003\0013", !1, !73}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-1d-imper/jacobi-1d-imper.c]
!78 = !MDLocation(line: 29, column: 19, scope: !77)
!79 = !MDLocation(line: 29, column: 15, scope: !77)
!80 = !MDLocation(line: 29, column: 3, scope: !73)
!81 = !MDLocation(line: 31, column: 22, scope: !82)
!82 = !{!"0xb\0030\007\0014", !1, !77}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-1d-imper/jacobi-1d-imper.c]
!83 = !MDLocation(line: 31, column: 10, scope: !82)
!84 = !MDLocation(line: 31, column: 30, scope: !82)
!85 = !MDLocation(line: 31, column: 9, scope: !82)
!86 = !MDLocation(line: 31, column: 4, scope: !82)
!87 = !MDLocation(line: 31, column: 2, scope: !82)
!88 = !MDLocation(line: 32, column: 22, scope: !82)
!89 = !MDLocation(line: 32, column: 10, scope: !82)
!90 = !MDLocation(line: 32, column: 30, scope: !82)
!91 = !MDLocation(line: 32, column: 9, scope: !82)
!92 = !MDLocation(line: 32, column: 4, scope: !82)
!93 = !MDLocation(line: 32, column: 2, scope: !82)
!94 = !MDLocation(line: 33, column: 7, scope: !82)
!95 = !MDLocation(line: 29, column: 22, scope: !77)
!96 = !MDLocation(line: 29, column: 3, scope: !77)
!97 = !MDLocation(line: 34, column: 1, scope: !26)
!98 = !{!"0x101\00tsteps\0016777274\000", !23, !12, !15} ; [ DW_TAG_arg_variable ] [tsteps] [line 58]
!99 = !MDLocation(line: 58, column: 33, scope: !23)
!100 = !{!"0x101\00n\0033554491\000", !23, !12, !15} ; [ DW_TAG_arg_variable ] [n] [line 59]
!101 = !MDLocation(line: 59, column: 12, scope: !23)
!102 = !{!"0x101\00A\0050331708\000", !23, !12, !22} ; [ DW_TAG_arg_variable ] [A] [line 60]
!103 = !MDLocation(line: 60, column: 18, scope: !23)
!104 = !{!"0x101\00B\0067108925\000", !23, !12, !22} ; [ DW_TAG_arg_variable ] [B] [line 61]
!105 = !MDLocation(line: 61, column: 18, scope: !23)
!106 = !{!"0x100\00t\0063\000", !23, !12, !15}    ; [ DW_TAG_auto_variable ] [t] [line 63]
!107 = !MDLocation(line: 63, column: 7, scope: !23)
!108 = !{!"0x100\00i\0063\000", !23, !12, !15}    ; [ DW_TAG_auto_variable ] [i] [line 63]
!109 = !MDLocation(line: 63, column: 10, scope: !23)
!110 = !{!"0x100\00j\0063\000", !23, !12, !15}    ; [ DW_TAG_auto_variable ] [j] [line 63]
!111 = !MDLocation(line: 63, column: 13, scope: !23)
!112 = !MDLocation(line: 66, column: 8, scope: !113)
!113 = !{!"0xb\0066\003\005", !1, !23}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-1d-imper/jacobi-1d-imper.c]
!114 = !MDLocation(line: 66, column: 15, scope: !115)
!115 = !{!"0xb\002", !1, !116}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-1d-imper/jacobi-1d-imper.c]
!116 = !{!"0xb\001", !1, !117}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-1d-imper/jacobi-1d-imper.c]
!117 = !{!"0xb\0066\003\006", !1, !113}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-1d-imper/jacobi-1d-imper.c]
!118 = !MDLocation(line: 66, column: 19, scope: !117)
!119 = !MDLocation(line: 66, column: 15, scope: !117)
!120 = !MDLocation(line: 66, column: 3, scope: !113)
!121 = !MDLocation(line: 68, column: 12, scope: !122)
!122 = !{!"0xb\0068\007\008", !1, !123}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-1d-imper/jacobi-1d-imper.c]
!123 = !{!"0xb\0067\005\007", !1, !117}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-1d-imper/jacobi-1d-imper.c]
!124 = !MDLocation(line: 68, column: 19, scope: !125)
!125 = !{!"0xb\002", !1, !126}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-1d-imper/jacobi-1d-imper.c]
!126 = !{!"0xb\001", !1, !127}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-1d-imper/jacobi-1d-imper.c]
!127 = !{!"0xb\0068\007\009", !1, !122}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-1d-imper/jacobi-1d-imper.c]
!128 = !MDLocation(line: 68, column: 23, scope: !127)
!129 = !MDLocation(line: 68, column: 19, scope: !127)
!130 = !MDLocation(line: 68, column: 7, scope: !122)
!131 = !MDLocation(line: 69, column: 22, scope: !127)
!132 = !MDLocation(line: 69, column: 20, scope: !127)
!133 = !MDLocation(line: 69, column: 31, scope: !127)
!134 = !MDLocation(line: 69, column: 29, scope: !127)
!135 = !MDLocation(line: 69, column: 38, scope: !127)
!136 = !MDLocation(line: 69, column: 36, scope: !127)
!137 = !MDLocation(line: 69, column: 9, scope: !127)
!138 = !MDLocation(line: 69, column: 4, scope: !127)
!139 = !MDLocation(line: 69, column: 2, scope: !127)
!140 = !MDLocation(line: 68, column: 30, scope: !127)
!141 = !MDLocation(line: 68, column: 7, scope: !127)
!142 = !MDLocation(line: 70, column: 12, scope: !143)
!143 = !{!"0xb\0070\007\0010", !1, !123}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-1d-imper/jacobi-1d-imper.c]
!144 = !MDLocation(line: 70, column: 19, scope: !145)
!145 = !{!"0xb\002", !1, !146}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-1d-imper/jacobi-1d-imper.c]
!146 = !{!"0xb\001", !1, !147}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-1d-imper/jacobi-1d-imper.c]
!147 = !{!"0xb\0070\007\0011", !1, !143}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-1d-imper/jacobi-1d-imper.c]
!148 = !MDLocation(line: 70, column: 23, scope: !147)
!149 = !MDLocation(line: 70, column: 19, scope: !147)
!150 = !MDLocation(line: 70, column: 7, scope: !143)
!151 = !MDLocation(line: 71, column: 11, scope: !147)
!152 = !MDLocation(line: 71, column: 9, scope: !147)
!153 = !MDLocation(line: 71, column: 4, scope: !147)
!154 = !MDLocation(line: 71, column: 2, scope: !147)
!155 = !MDLocation(line: 70, column: 30, scope: !147)
!156 = !MDLocation(line: 70, column: 7, scope: !147)
!157 = !MDLocation(line: 72, column: 5, scope: !123)
!158 = !MDLocation(line: 66, column: 27, scope: !117)
!159 = !MDLocation(line: 66, column: 3, scope: !117)
!160 = !MDLocation(line: 75, column: 1, scope: !23)
!161 = !{!"0x101\00n\0016777256\000", !19, !12, !15} ; [ DW_TAG_arg_variable ] [n] [line 40]
!162 = !MDLocation(line: 40, column: 22, scope: !19)
!163 = !{!"0x101\00A\0033554473\000", !19, !12, !22} ; [ DW_TAG_arg_variable ] [A] [line 41]
!164 = !MDLocation(line: 41, column: 14, scope: !19)
!165 = !{!"0x100\00i\0044\000", !19, !12, !15}    ; [ DW_TAG_auto_variable ] [i] [line 44]
!166 = !MDLocation(line: 44, column: 7, scope: !19)
!167 = !MDLocation(line: 46, column: 8, scope: !168)
!168 = !{!"0xb\0046\003\001", !1, !19}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-1d-imper/jacobi-1d-imper.c]
!169 = !MDLocation(line: 46, column: 15, scope: !170)
!170 = !{!"0xb\002", !1, !171}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-1d-imper/jacobi-1d-imper.c]
!171 = !{!"0xb\001", !1, !172}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-1d-imper/jacobi-1d-imper.c]
!172 = !{!"0xb\0046\003\002", !1, !168}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-1d-imper/jacobi-1d-imper.c]
!173 = !MDLocation(line: 46, column: 19, scope: !172)
!174 = !MDLocation(line: 46, column: 15, scope: !172)
!175 = !MDLocation(line: 46, column: 3, scope: !168)
!176 = !MDLocation(line: 48, column: 15, scope: !177)
!177 = !{!"0xb\0047\005\003", !1, !172}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-1d-imper/jacobi-1d-imper.c]
!178 = !MDLocation(line: 48, column: 47, scope: !177)
!179 = !MDLocation(line: 48, column: 45, scope: !177)
!180 = !MDLocation(line: 48, column: 7, scope: !177)
!181 = !MDLocation(line: 49, column: 11, scope: !182)
!182 = !{!"0xb\0049\0011\004", !1, !177}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-1d-imper/jacobi-1d-imper.c]
!183 = !MDLocation(line: 49, column: 11, scope: !177)
!184 = !MDLocation(line: 49, column: 32, scope: !185)
!185 = !{!"0xb\001", !1, !182}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/jacobi-1d-imper/jacobi-1d-imper.c]
!186 = !MDLocation(line: 49, column: 24, scope: !182)
!187 = !MDLocation(line: 50, column: 5, scope: !177)
!188 = !MDLocation(line: 46, column: 22, scope: !172)
!189 = !MDLocation(line: 46, column: 3, scope: !172)
!190 = !MDLocation(line: 51, column: 11, scope: !19)
!191 = !MDLocation(line: 51, column: 3, scope: !19)
!192 = !MDLocation(line: 52, column: 1, scope: !19)
