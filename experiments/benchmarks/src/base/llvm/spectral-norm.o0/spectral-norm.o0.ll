; ModuleID = 'spectral-norm.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"%0.9f\0A\00", align 1

; Function Attrs: nounwind uwtable
define double @eval_A(i32 %i, i32 %j) #0 {
entry:
  %i.addr = alloca i32, align 4
  %j.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %i.addr, metadata !27, metadata !28), !dbg !29
  store i32 %j, i32* %j.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %j.addr, metadata !30, metadata !28), !dbg !31
  %0 = load i32* %i.addr, align 4, !dbg !32
  %1 = load i32* %j.addr, align 4, !dbg !33
  %add = add nsw i32 %0, %1, !dbg !32
  %2 = load i32* %i.addr, align 4, !dbg !34
  %3 = load i32* %j.addr, align 4, !dbg !35
  %add1 = add nsw i32 %2, %3, !dbg !34
  %add2 = add nsw i32 %add1, 1, !dbg !34
  %mul = mul nsw i32 %add, %add2, !dbg !36
  %div = sdiv i32 %mul, 2, !dbg !36
  %4 = load i32* %i.addr, align 4, !dbg !37
  %add3 = add nsw i32 %div, %4, !dbg !36
  %add4 = add nsw i32 %add3, 1, !dbg !36
  %conv = sitofp i32 %add4 to double, !dbg !38
  %div5 = fdiv double 1.000000e+00, %conv, !dbg !39
  ret double %div5, !dbg !40
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @eval_A_times_u(i32 %N, double* %u, double* %Au) #0 {
entry:
  %N.addr = alloca i32, align 4
  %u.addr = alloca double*, align 8
  %Au.addr = alloca double*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %N, i32* %N.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %N.addr, metadata !41, metadata !28), !dbg !42
  store double* %u, double** %u.addr, align 8
  call void @llvm.dbg.declare(metadata double** %u.addr, metadata !43, metadata !28), !dbg !44
  store double* %Au, double** %Au.addr, align 8
  call void @llvm.dbg.declare(metadata double** %Au.addr, metadata !45, metadata !28), !dbg !46
  call void @llvm.dbg.declare(metadata i32* %i, metadata !47, metadata !28), !dbg !48
  call void @llvm.dbg.declare(metadata i32* %j, metadata !49, metadata !28), !dbg !50
  store i32 0, i32* %i, align 4, !dbg !51
  br label %for.cond, !dbg !51

for.cond:                                         ; preds = %for.inc8, %entry
  %0 = load i32* %i, align 4, !dbg !53
  %1 = load i32* %N.addr, align 4, !dbg !57
  %cmp = icmp slt i32 %0, %1, !dbg !58
  br i1 %cmp, label %for.body, label %for.end10, !dbg !59

for.body:                                         ; preds = %for.cond
  %2 = load i32* %i, align 4, !dbg !60
  %idxprom = sext i32 %2 to i64, !dbg !62
  %3 = load double** %Au.addr, align 8, !dbg !62
  %arrayidx = getelementptr inbounds double* %3, i64 %idxprom, !dbg !62
  store double 0.000000e+00, double* %arrayidx, align 8, !dbg !62
  store i32 0, i32* %j, align 4, !dbg !63
  br label %for.cond1, !dbg !63

for.cond1:                                        ; preds = %for.inc, %for.body
  %4 = load i32* %j, align 4, !dbg !65
  %5 = load i32* %N.addr, align 4, !dbg !69
  %cmp2 = icmp slt i32 %4, %5, !dbg !70
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !71

for.body3:                                        ; preds = %for.cond1
  %6 = load i32* %i, align 4, !dbg !72
  %7 = load i32* %j, align 4, !dbg !74
  %call = call double @eval_A(i32 %6, i32 %7), !dbg !75
  %8 = load i32* %j, align 4, !dbg !76
  %idxprom4 = sext i32 %8 to i64, !dbg !77
  %9 = load double** %u.addr, align 8, !dbg !77
  %arrayidx5 = getelementptr inbounds double* %9, i64 %idxprom4, !dbg !77
  %10 = load double* %arrayidx5, align 8, !dbg !77
  %mul = fmul double %call, %10, !dbg !75
  %11 = load i32* %i, align 4, !dbg !78
  %idxprom6 = sext i32 %11 to i64, !dbg !79
  %12 = load double** %Au.addr, align 8, !dbg !79
  %arrayidx7 = getelementptr inbounds double* %12, i64 %idxprom6, !dbg !79
  %13 = load double* %arrayidx7, align 8, !dbg !79
  %add = fadd double %13, %mul, !dbg !79
  store double %add, double* %arrayidx7, align 8, !dbg !79
  br label %for.inc, !dbg !79

for.inc:                                          ; preds = %for.body3
  %14 = load i32* %j, align 4, !dbg !80
  %inc = add nsw i32 %14, 1, !dbg !80
  store i32 %inc, i32* %j, align 4, !dbg !80
  br label %for.cond1, !dbg !82

for.end:                                          ; preds = %for.cond1
  br label %for.inc8, !dbg !83

for.inc8:                                         ; preds = %for.end
  %15 = load i32* %i, align 4, !dbg !84
  %inc9 = add nsw i32 %15, 1, !dbg !84
  store i32 %inc9, i32* %i, align 4, !dbg !84
  br label %for.cond, !dbg !85

for.end10:                                        ; preds = %for.cond
  ret void, !dbg !86
}

; Function Attrs: nounwind uwtable
define void @eval_At_times_u(i32 %N, double* %u, double* %Au) #0 {
entry:
  %N.addr = alloca i32, align 4
  %u.addr = alloca double*, align 8
  %Au.addr = alloca double*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %N, i32* %N.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %N.addr, metadata !87, metadata !28), !dbg !88
  store double* %u, double** %u.addr, align 8
  call void @llvm.dbg.declare(metadata double** %u.addr, metadata !89, metadata !28), !dbg !90
  store double* %Au, double** %Au.addr, align 8
  call void @llvm.dbg.declare(metadata double** %Au.addr, metadata !91, metadata !28), !dbg !92
  call void @llvm.dbg.declare(metadata i32* %i, metadata !93, metadata !28), !dbg !94
  call void @llvm.dbg.declare(metadata i32* %j, metadata !95, metadata !28), !dbg !96
  store i32 0, i32* %i, align 4, !dbg !97
  br label %for.cond, !dbg !97

for.cond:                                         ; preds = %for.inc8, %entry
  %0 = load i32* %i, align 4, !dbg !99
  %1 = load i32* %N.addr, align 4, !dbg !103
  %cmp = icmp slt i32 %0, %1, !dbg !104
  br i1 %cmp, label %for.body, label %for.end10, !dbg !105

for.body:                                         ; preds = %for.cond
  %2 = load i32* %i, align 4, !dbg !106
  %idxprom = sext i32 %2 to i64, !dbg !108
  %3 = load double** %Au.addr, align 8, !dbg !108
  %arrayidx = getelementptr inbounds double* %3, i64 %idxprom, !dbg !108
  store double 0.000000e+00, double* %arrayidx, align 8, !dbg !108
  store i32 0, i32* %j, align 4, !dbg !109
  br label %for.cond1, !dbg !109

for.cond1:                                        ; preds = %for.inc, %for.body
  %4 = load i32* %j, align 4, !dbg !111
  %5 = load i32* %N.addr, align 4, !dbg !115
  %cmp2 = icmp slt i32 %4, %5, !dbg !116
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !117

for.body3:                                        ; preds = %for.cond1
  %6 = load i32* %j, align 4, !dbg !118
  %7 = load i32* %i, align 4, !dbg !120
  %call = call double @eval_A(i32 %6, i32 %7), !dbg !121
  %8 = load i32* %j, align 4, !dbg !122
  %idxprom4 = sext i32 %8 to i64, !dbg !123
  %9 = load double** %u.addr, align 8, !dbg !123
  %arrayidx5 = getelementptr inbounds double* %9, i64 %idxprom4, !dbg !123
  %10 = load double* %arrayidx5, align 8, !dbg !123
  %mul = fmul double %call, %10, !dbg !121
  %11 = load i32* %i, align 4, !dbg !124
  %idxprom6 = sext i32 %11 to i64, !dbg !125
  %12 = load double** %Au.addr, align 8, !dbg !125
  %arrayidx7 = getelementptr inbounds double* %12, i64 %idxprom6, !dbg !125
  %13 = load double* %arrayidx7, align 8, !dbg !125
  %add = fadd double %13, %mul, !dbg !125
  store double %add, double* %arrayidx7, align 8, !dbg !125
  br label %for.inc, !dbg !125

for.inc:                                          ; preds = %for.body3
  %14 = load i32* %j, align 4, !dbg !126
  %inc = add nsw i32 %14, 1, !dbg !126
  store i32 %inc, i32* %j, align 4, !dbg !126
  br label %for.cond1, !dbg !128

for.end:                                          ; preds = %for.cond1
  br label %for.inc8, !dbg !129

for.inc8:                                         ; preds = %for.end
  %15 = load i32* %i, align 4, !dbg !130
  %inc9 = add nsw i32 %15, 1, !dbg !130
  store i32 %inc9, i32* %i, align 4, !dbg !130
  br label %for.cond, !dbg !131

for.end10:                                        ; preds = %for.cond
  ret void, !dbg !132
}

; Function Attrs: nounwind uwtable
define void @eval_AtA_times_u(i32 %N, double* %u, double* %AtAu) #0 {
entry:
  %N.addr = alloca i32, align 4
  %u.addr = alloca double*, align 8
  %AtAu.addr = alloca double*, align 8
  %saved_stack = alloca i8*
  store i32 %N, i32* %N.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %N.addr, metadata !133, metadata !28), !dbg !134
  store double* %u, double** %u.addr, align 8
  call void @llvm.dbg.declare(metadata double** %u.addr, metadata !135, metadata !28), !dbg !136
  store double* %AtAu, double** %AtAu.addr, align 8
  call void @llvm.dbg.declare(metadata double** %AtAu.addr, metadata !137, metadata !28), !dbg !138
  %0 = load i32* %N.addr, align 4, !dbg !139
  %1 = zext i32 %0 to i64, !dbg !140
  %2 = call i8* @llvm.stacksave(), !dbg !140
  store i8* %2, i8** %saved_stack, !dbg !140
  %vla = alloca double, i64 %1, align 16, !dbg !140
  call void @llvm.dbg.declare(metadata double* %vla, metadata !141, metadata !28), !dbg !145
  %3 = load i32* %N.addr, align 4, !dbg !146
  %4 = load double** %u.addr, align 8, !dbg !147
  call void @eval_A_times_u(i32 %3, double* %4, double* %vla), !dbg !148
  %5 = load i32* %N.addr, align 4, !dbg !149
  %6 = load double** %AtAu.addr, align 8, !dbg !150
  call void @eval_At_times_u(i32 %5, double* %vla, double* %6), !dbg !151
  %7 = load i8** %saved_stack, !dbg !152
  call void @llvm.stackrestore(i8* %7), !dbg !152
  ret void, !dbg !152
}

; Function Attrs: nounwind
declare i8* @llvm.stacksave() #2

; Function Attrs: nounwind
declare void @llvm.stackrestore(i8*) #2

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  %N = alloca i32, align 4
  %saved_stack = alloca i8*
  %vBv = alloca double, align 8
  %vv = alloca double, align 8
  %cleanup.dest.slot = alloca i32
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !153, metadata !28), !dbg !154
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !155, metadata !28), !dbg !156
  call void @llvm.dbg.declare(metadata i32* %i, metadata !157, metadata !28), !dbg !158
  call void @llvm.dbg.declare(metadata i32* %N, metadata !159, metadata !28), !dbg !160
  %0 = load i32* %argc.addr, align 4, !dbg !161
  %cmp = icmp eq i32 %0, 2, !dbg !161
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !162

cond.true:                                        ; preds = %entry
  %1 = load i8*** %argv.addr, align 8, !dbg !163
  %arrayidx = getelementptr inbounds i8** %1, i64 1, !dbg !163
  %2 = load i8** %arrayidx, align 8, !dbg !163
  %call = call i32 @atoi(i8* %2) #6, !dbg !165
  br label %cond.end, !dbg !162

cond.false:                                       ; preds = %entry
  br label %cond.end, !dbg !166

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call, %cond.true ], [ 2000, %cond.false ], !dbg !162
  store i32 %cond, i32* %N, align 4, !dbg !168
  %3 = load i32* %N, align 4, !dbg !171
  %4 = zext i32 %3 to i64, !dbg !172
  %5 = call i8* @llvm.stacksave(), !dbg !172
  store i8* %5, i8** %saved_stack, !dbg !172
  %vla = alloca double, i64 %4, align 16, !dbg !172
  call void @llvm.dbg.declare(metadata double* %vla, metadata !173, metadata !28), !dbg !174
  %6 = load i32* %N, align 4, !dbg !175
  %7 = zext i32 %6 to i64, !dbg !172
  %vla1 = alloca double, i64 %7, align 16, !dbg !172
  call void @llvm.dbg.declare(metadata double* %vla1, metadata !176, metadata !28), !dbg !177
  call void @llvm.dbg.declare(metadata double* %vBv, metadata !178, metadata !28), !dbg !179
  call void @llvm.dbg.declare(metadata double* %vv, metadata !180, metadata !28), !dbg !181
  store i32 0, i32* %i, align 4, !dbg !182
  br label %for.cond, !dbg !182

for.cond:                                         ; preds = %for.inc, %cond.end
  %8 = load i32* %i, align 4, !dbg !184
  %9 = load i32* %N, align 4, !dbg !188
  %cmp2 = icmp slt i32 %8, %9, !dbg !189
  br i1 %cmp2, label %for.body, label %for.end, !dbg !190

for.body:                                         ; preds = %for.cond
  %10 = load i32* %i, align 4, !dbg !191
  %idxprom = sext i32 %10 to i64, !dbg !193
  %arrayidx3 = getelementptr inbounds double* %vla, i64 %idxprom, !dbg !193
  store double 1.000000e+00, double* %arrayidx3, align 8, !dbg !193
  br label %for.inc, !dbg !193

for.inc:                                          ; preds = %for.body
  %11 = load i32* %i, align 4, !dbg !194
  %inc = add nsw i32 %11, 1, !dbg !194
  store i32 %inc, i32* %i, align 4, !dbg !194
  br label %for.cond, !dbg !196

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !197
  br label %for.cond4, !dbg !197

for.cond4:                                        ; preds = %for.inc7, %for.end
  %12 = load i32* %i, align 4, !dbg !199
  %cmp5 = icmp slt i32 %12, 10, !dbg !199
  br i1 %cmp5, label %for.body6, label %for.end9, !dbg !203

for.body6:                                        ; preds = %for.cond4
  %13 = load i32* %N, align 4, !dbg !204
  call void @eval_AtA_times_u(i32 %13, double* %vla, double* %vla1), !dbg !206
  %14 = load i32* %N, align 4, !dbg !207
  call void @eval_AtA_times_u(i32 %14, double* %vla1, double* %vla), !dbg !208
  br label %for.inc7, !dbg !209

for.inc7:                                         ; preds = %for.body6
  %15 = load i32* %i, align 4, !dbg !210
  %inc8 = add nsw i32 %15, 1, !dbg !210
  store i32 %inc8, i32* %i, align 4, !dbg !210
  br label %for.cond4, !dbg !211

for.end9:                                         ; preds = %for.cond4
  store double 0.000000e+00, double* %vv, align 8, !dbg !212
  store double 0.000000e+00, double* %vBv, align 8, !dbg !213
  store i32 0, i32* %i, align 4, !dbg !214
  br label %for.cond10, !dbg !214

for.cond10:                                       ; preds = %for.inc23, %for.end9
  %16 = load i32* %i, align 4, !dbg !216
  %17 = load i32* %N, align 4, !dbg !220
  %cmp11 = icmp slt i32 %16, %17, !dbg !221
  br i1 %cmp11, label %for.body12, label %for.end25, !dbg !222

for.body12:                                       ; preds = %for.cond10
  %18 = load i32* %i, align 4, !dbg !223
  %idxprom13 = sext i32 %18 to i64, !dbg !226
  %arrayidx14 = getelementptr inbounds double* %vla, i64 %idxprom13, !dbg !226
  %19 = load double* %arrayidx14, align 8, !dbg !226
  %20 = load i32* %i, align 4, !dbg !227
  %idxprom15 = sext i32 %20 to i64, !dbg !228
  %arrayidx16 = getelementptr inbounds double* %vla1, i64 %idxprom15, !dbg !228
  %21 = load double* %arrayidx16, align 8, !dbg !228
  %mul = fmul double %19, %21, !dbg !226
  %22 = load double* %vBv, align 8, !dbg !229
  %add = fadd double %22, %mul, !dbg !229
  store double %add, double* %vBv, align 8, !dbg !229
  %23 = load i32* %i, align 4, !dbg !230
  %idxprom17 = sext i32 %23 to i64, !dbg !231
  %arrayidx18 = getelementptr inbounds double* %vla1, i64 %idxprom17, !dbg !231
  %24 = load double* %arrayidx18, align 8, !dbg !231
  %25 = load i32* %i, align 4, !dbg !232
  %idxprom19 = sext i32 %25 to i64, !dbg !233
  %arrayidx20 = getelementptr inbounds double* %vla1, i64 %idxprom19, !dbg !233
  %26 = load double* %arrayidx20, align 8, !dbg !233
  %mul21 = fmul double %24, %26, !dbg !231
  %27 = load double* %vv, align 8, !dbg !234
  %add22 = fadd double %27, %mul21, !dbg !234
  store double %add22, double* %vv, align 8, !dbg !234
  br label %for.inc23, !dbg !235

for.inc23:                                        ; preds = %for.body12
  %28 = load i32* %i, align 4, !dbg !236
  %inc24 = add nsw i32 %28, 1, !dbg !236
  store i32 %inc24, i32* %i, align 4, !dbg !236
  br label %for.cond10, !dbg !238

for.end25:                                        ; preds = %for.cond10
  %29 = load double* %vBv, align 8, !dbg !239
  %30 = load double* %vv, align 8, !dbg !240
  %div = fdiv double %29, %30, !dbg !239
  %call26 = call double @sqrt(double %div) #2, !dbg !241
  %call27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str, i32 0, i32 0), double %call26), !dbg !242
  store i32 0, i32* %retval, !dbg !243
  store i32 1, i32* %cleanup.dest.slot
  %31 = load i8** %saved_stack, !dbg !243
  call void @llvm.stackrestore(i8* %31), !dbg !243
  %32 = load i32* %retval, !dbg !244
  ret i32 %32, !dbg !244
}

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #3

declare i32 @printf(i8*, ...) #4

; Function Attrs: nounwind
declare double @sqrt(double) #5

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind }
attributes #3 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!24, !25}
!llvm.ident = !{!26}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\000\00\000\00\001", !1, !2, !2, !3, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c] [DW_LANG_C99]
!1 = !{!"spectral-norm.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4, !10, !16, !17, !18}
!4 = !{!"0x2e\00eval_A\00eval_A\00\0013\000\001\000\000\00256\000\0013", !1, !5, !6, null, double (i32, i32)* @eval_A, null, null, !2} ; [ DW_TAG_subprogram ] [line 13] [def] [eval_A]
!5 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!6 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !7, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = !{!8, !9, !9}
!8 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!9 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!10 = !{!"0x2e\00eval_A_times_u\00eval_A_times_u\00\0015\000\001\000\000\00256\000\0016", !1, !5, !11, null, void (i32, double*, double*)* @eval_A_times_u, null, null, !2} ; [ DW_TAG_subprogram ] [line 15] [def] [scope 16] [eval_A_times_u]
!11 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !12, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!12 = !{null, !9, !13, !15}
!13 = !{!"0xf\00\000\0064\0064\000\000", null, null, !14} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!14 = !{!"0x26\00\000\000\000\000\000", null, null, !8} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from double]
!15 = !{!"0xf\00\000\0064\0064\000\000", null, null, !8} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!16 = !{!"0x2e\00eval_At_times_u\00eval_At_times_u\00\0025\000\001\000\000\00256\000\0026", !1, !5, !11, null, void (i32, double*, double*)* @eval_At_times_u, null, null, !2} ; [ DW_TAG_subprogram ] [line 25] [def] [scope 26] [eval_At_times_u]
!17 = !{!"0x2e\00eval_AtA_times_u\00eval_AtA_times_u\00\0035\000\001\000\000\00256\000\0036", !1, !5, !11, null, void (i32, double*, double*)* @eval_AtA_times_u, null, null, !2} ; [ DW_TAG_subprogram ] [line 35] [def] [scope 36] [eval_AtA_times_u]
!18 = !{!"0x2e\00main\00main\00\0038\000\001\000\000\00256\000\0039", !1, !5, !19, null, i32 (i32, i8**)* @main, null, null, !2} ; [ DW_TAG_subprogram ] [line 38] [def] [scope 39] [main]
!19 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !20, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!20 = !{!9, !9, !21}
!21 = !{!"0xf\00\000\0064\0064\000\000", null, null, !22} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!22 = !{!"0xf\00\000\0064\0064\000\000", null, null, !23} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!23 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!24 = !{i32 2, !"Dwarf Version", i32 4}
!25 = !{i32 2, !"Debug Info Version", i32 2}
!26 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!27 = !{!"0x101\00i\0016777229\000", !4, !5, !9}  ; [ DW_TAG_arg_variable ] [i] [line 13]
!28 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!29 = !MDLocation(line: 13, column: 19, scope: !4)
!30 = !{!"0x101\00j\0033554445\000", !4, !5, !9}  ; [ DW_TAG_arg_variable ] [j] [line 13]
!31 = !MDLocation(line: 13, column: 26, scope: !4)
!32 = !MDLocation(line: 13, column: 44, scope: !4)
!33 = !MDLocation(line: 13, column: 46, scope: !4)
!34 = !MDLocation(line: 13, column: 50, scope: !4)
!35 = !MDLocation(line: 13, column: 52, scope: !4)
!36 = !MDLocation(line: 13, column: 43, scope: !4)
!37 = !MDLocation(line: 13, column: 59, scope: !4)
!38 = !MDLocation(line: 13, column: 42, scope: !4)
!39 = !MDLocation(line: 13, column: 38, scope: !4)
!40 = !MDLocation(line: 13, column: 31, scope: !4)
!41 = !{!"0x101\00N\0016777231\000", !10, !5, !9} ; [ DW_TAG_arg_variable ] [N] [line 15]
!42 = !MDLocation(line: 15, column: 25, scope: !10)
!43 = !{!"0x101\00u\0033554447\000", !10, !5, !13} ; [ DW_TAG_arg_variable ] [u] [line 15]
!44 = !MDLocation(line: 15, column: 41, scope: !10)
!45 = !{!"0x101\00Au\0050331663\000", !10, !5, !15} ; [ DW_TAG_arg_variable ] [Au] [line 15]
!46 = !MDLocation(line: 15, column: 53, scope: !10)
!47 = !{!"0x100\00i\0017\000", !10, !5, !9}       ; [ DW_TAG_auto_variable ] [i] [line 17]
!48 = !MDLocation(line: 17, column: 7, scope: !10)
!49 = !{!"0x100\00j\0017\000", !10, !5, !9}       ; [ DW_TAG_auto_variable ] [j] [line 17]
!50 = !MDLocation(line: 17, column: 9, scope: !10)
!51 = !MDLocation(line: 18, column: 7, scope: !52)
!52 = !{!"0xb\0018\003\000", !1, !10}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!53 = !MDLocation(line: 18, column: 11, scope: !54)
!54 = !{!"0xb\002", !1, !55}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!55 = !{!"0xb\001", !1, !56}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!56 = !{!"0xb\0018\003\001", !1, !52}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!57 = !MDLocation(line: 18, column: 13, scope: !56)
!58 = !MDLocation(line: 18, column: 11, scope: !56)
!59 = !MDLocation(line: 18, column: 3, scope: !52)
!60 = !MDLocation(line: 20, column: 10, scope: !61)
!61 = !{!"0xb\0019\005\002", !1, !56}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!62 = !MDLocation(line: 20, column: 7, scope: !61)
!63 = !MDLocation(line: 21, column: 11, scope: !64)
!64 = !{!"0xb\0021\007\003", !1, !61}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!65 = !MDLocation(line: 21, column: 15, scope: !66)
!66 = !{!"0xb\004", !1, !67}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!67 = !{!"0xb\001", !1, !68}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!68 = !{!"0xb\0021\007\004", !1, !64}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!69 = !MDLocation(line: 21, column: 17, scope: !68)
!70 = !MDLocation(line: 21, column: 15, scope: !68)
!71 = !MDLocation(line: 21, column: 7, scope: !64)
!72 = !MDLocation(line: 21, column: 38, scope: !73)
!73 = !{!"0xb\002", !1, !68}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!74 = !MDLocation(line: 21, column: 40, scope: !68)
!75 = !MDLocation(line: 21, column: 31, scope: !68)
!76 = !MDLocation(line: 21, column: 45, scope: !68)
!77 = !MDLocation(line: 21, column: 43, scope: !68)
!78 = !MDLocation(line: 21, column: 27, scope: !68)
!79 = !MDLocation(line: 21, column: 24, scope: !68)
!80 = !MDLocation(line: 21, column: 19, scope: !81)
!81 = !{!"0xb\003", !1, !68}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!82 = !MDLocation(line: 21, column: 7, scope: !68)
!83 = !MDLocation(line: 22, column: 5, scope: !61)
!84 = !MDLocation(line: 18, column: 15, scope: !56)
!85 = !MDLocation(line: 18, column: 3, scope: !56)
!86 = !MDLocation(line: 23, column: 1, scope: !10)
!87 = !{!"0x101\00N\0016777241\000", !16, !5, !9} ; [ DW_TAG_arg_variable ] [N] [line 25]
!88 = !MDLocation(line: 25, column: 26, scope: !16)
!89 = !{!"0x101\00u\0033554457\000", !16, !5, !13} ; [ DW_TAG_arg_variable ] [u] [line 25]
!90 = !MDLocation(line: 25, column: 42, scope: !16)
!91 = !{!"0x101\00Au\0050331673\000", !16, !5, !15} ; [ DW_TAG_arg_variable ] [Au] [line 25]
!92 = !MDLocation(line: 25, column: 54, scope: !16)
!93 = !{!"0x100\00i\0027\000", !16, !5, !9}       ; [ DW_TAG_auto_variable ] [i] [line 27]
!94 = !MDLocation(line: 27, column: 7, scope: !16)
!95 = !{!"0x100\00j\0027\000", !16, !5, !9}       ; [ DW_TAG_auto_variable ] [j] [line 27]
!96 = !MDLocation(line: 27, column: 9, scope: !16)
!97 = !MDLocation(line: 28, column: 7, scope: !98)
!98 = !{!"0xb\0028\003\005", !1, !16}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!99 = !MDLocation(line: 28, column: 11, scope: !100)
!100 = !{!"0xb\002", !1, !101}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!101 = !{!"0xb\001", !1, !102}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!102 = !{!"0xb\0028\003\006", !1, !98}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!103 = !MDLocation(line: 28, column: 13, scope: !102)
!104 = !MDLocation(line: 28, column: 11, scope: !102)
!105 = !MDLocation(line: 28, column: 3, scope: !98)
!106 = !MDLocation(line: 30, column: 10, scope: !107)
!107 = !{!"0xb\0029\005\007", !1, !102}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!108 = !MDLocation(line: 30, column: 7, scope: !107)
!109 = !MDLocation(line: 31, column: 11, scope: !110)
!110 = !{!"0xb\0031\007\008", !1, !107}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!111 = !MDLocation(line: 31, column: 15, scope: !112)
!112 = !{!"0xb\004", !1, !113}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!113 = !{!"0xb\001", !1, !114}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!114 = !{!"0xb\0031\007\009", !1, !110}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!115 = !MDLocation(line: 31, column: 17, scope: !114)
!116 = !MDLocation(line: 31, column: 15, scope: !114)
!117 = !MDLocation(line: 31, column: 7, scope: !110)
!118 = !MDLocation(line: 31, column: 38, scope: !119)
!119 = !{!"0xb\002", !1, !114}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!120 = !MDLocation(line: 31, column: 40, scope: !114)
!121 = !MDLocation(line: 31, column: 31, scope: !114)
!122 = !MDLocation(line: 31, column: 45, scope: !114)
!123 = !MDLocation(line: 31, column: 43, scope: !114)
!124 = !MDLocation(line: 31, column: 27, scope: !114)
!125 = !MDLocation(line: 31, column: 24, scope: !114)
!126 = !MDLocation(line: 31, column: 19, scope: !127)
!127 = !{!"0xb\003", !1, !114}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!128 = !MDLocation(line: 31, column: 7, scope: !114)
!129 = !MDLocation(line: 32, column: 5, scope: !107)
!130 = !MDLocation(line: 28, column: 15, scope: !102)
!131 = !MDLocation(line: 28, column: 3, scope: !102)
!132 = !MDLocation(line: 33, column: 1, scope: !16)
!133 = !{!"0x101\00N\0016777251\000", !17, !5, !9} ; [ DW_TAG_arg_variable ] [N] [line 35]
!134 = !MDLocation(line: 35, column: 27, scope: !17)
!135 = !{!"0x101\00u\0033554467\000", !17, !5, !13} ; [ DW_TAG_arg_variable ] [u] [line 35]
!136 = !MDLocation(line: 35, column: 43, scope: !17)
!137 = !{!"0x101\00AtAu\0050331683\000", !17, !5, !15} ; [ DW_TAG_arg_variable ] [AtAu] [line 35]
!138 = !MDLocation(line: 35, column: 55, scope: !17)
!139 = !MDLocation(line: 36, column: 12, scope: !17)
!140 = !MDLocation(line: 36, column: 3, scope: !17)
!141 = !{!"0x100\00v\0036\008192", !17, !5, !142} ; [ DW_TAG_auto_variable ] [v] [line 36]
!142 = !{!"0x1\00\000\000\0064\000\000\000", null, null, !8, !143, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 0, align 64, offset 0] [from double]
!143 = !{!144}
!144 = !{!"0x21\000\00-1"}                        ; [ DW_TAG_subrange_type ] [unbounded]
!145 = !MDLocation(line: 36, column: 10, scope: !17)
!146 = !MDLocation(line: 36, column: 31, scope: !17)
!147 = !MDLocation(line: 36, column: 33, scope: !17)
!148 = !MDLocation(line: 36, column: 16, scope: !17)
!149 = !MDLocation(line: 36, column: 55, scope: !17)
!150 = !MDLocation(line: 36, column: 59, scope: !17)
!151 = !MDLocation(line: 36, column: 39, scope: !17)
!152 = !MDLocation(line: 36, column: 66, scope: !17)
!153 = !{!"0x101\00argc\0016777254\000", !18, !5, !9} ; [ DW_TAG_arg_variable ] [argc] [line 38]
!154 = !MDLocation(line: 38, column: 14, scope: !18)
!155 = !{!"0x101\00argv\0033554470\000", !18, !5, !21} ; [ DW_TAG_arg_variable ] [argv] [line 38]
!156 = !MDLocation(line: 38, column: 26, scope: !18)
!157 = !{!"0x100\00i\0040\000", !18, !5, !9}      ; [ DW_TAG_auto_variable ] [i] [line 40]
!158 = !MDLocation(line: 40, column: 7, scope: !18)
!159 = !{!"0x100\00N\0041\000", !18, !5, !9}      ; [ DW_TAG_auto_variable ] [N] [line 41]
!160 = !MDLocation(line: 41, column: 7, scope: !18)
!161 = !MDLocation(line: 41, column: 13, scope: !18)
!162 = !MDLocation(line: 41, column: 12, scope: !18)
!163 = !MDLocation(line: 41, column: 31, scope: !164)
!164 = !{!"0xb\001", !1, !18}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!165 = !MDLocation(line: 41, column: 26, scope: !18)
!166 = !MDLocation(line: 41, column: 12, scope: !167)
!167 = !{!"0xb\002", !1, !18}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!168 = !MDLocation(line: 41, column: 7, scope: !169)
!169 = !{!"0xb\004", !1, !170}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!170 = !{!"0xb\003", !1, !18}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!171 = !MDLocation(line: 42, column: 12, scope: !18)
!172 = !MDLocation(line: 42, column: 3, scope: !18)
!173 = !{!"0x100\00u\0042\008192", !18, !5, !142} ; [ DW_TAG_auto_variable ] [u] [line 42]
!174 = !MDLocation(line: 42, column: 10, scope: !18)
!175 = !MDLocation(line: 42, column: 17, scope: !18)
!176 = !{!"0x100\00v\0042\008192", !18, !5, !142} ; [ DW_TAG_auto_variable ] [v] [line 42]
!177 = !MDLocation(line: 42, column: 15, scope: !18)
!178 = !{!"0x100\00vBv\0042\000", !18, !5, !8}    ; [ DW_TAG_auto_variable ] [vBv] [line 42]
!179 = !MDLocation(line: 42, column: 20, scope: !18)
!180 = !{!"0x100\00vv\0042\000", !18, !5, !8}     ; [ DW_TAG_auto_variable ] [vv] [line 42]
!181 = !MDLocation(line: 42, column: 24, scope: !18)
!182 = !MDLocation(line: 43, column: 7, scope: !183)
!183 = !{!"0xb\0043\003\0010", !1, !18}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!184 = !MDLocation(line: 43, column: 11, scope: !185)
!185 = !{!"0xb\004", !1, !186}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!186 = !{!"0xb\001", !1, !187}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!187 = !{!"0xb\0043\003\0011", !1, !183}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!188 = !MDLocation(line: 43, column: 13, scope: !187)
!189 = !MDLocation(line: 43, column: 11, scope: !187)
!190 = !MDLocation(line: 43, column: 3, scope: !183)
!191 = !MDLocation(line: 43, column: 22, scope: !192)
!192 = !{!"0xb\002", !1, !187}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!193 = !MDLocation(line: 43, column: 20, scope: !187)
!194 = !MDLocation(line: 43, column: 15, scope: !195)
!195 = !{!"0xb\003", !1, !187}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!196 = !MDLocation(line: 43, column: 3, scope: !187)
!197 = !MDLocation(line: 44, column: 7, scope: !198)
!198 = !{!"0xb\0044\003\0012", !1, !18}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!199 = !MDLocation(line: 44, column: 11, scope: !200)
!200 = !{!"0xb\002", !1, !201}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!201 = !{!"0xb\001", !1, !202}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!202 = !{!"0xb\0044\003\0013", !1, !198}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!203 = !MDLocation(line: 44, column: 3, scope: !198)
!204 = !MDLocation(line: 46, column: 24, scope: !205)
!205 = !{!"0xb\0045\005\0014", !1, !202}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!206 = !MDLocation(line: 46, column: 7, scope: !205)
!207 = !MDLocation(line: 47, column: 24, scope: !205)
!208 = !MDLocation(line: 47, column: 7, scope: !205)
!209 = !MDLocation(line: 48, column: 5, scope: !205)
!210 = !MDLocation(line: 44, column: 16, scope: !202)
!211 = !MDLocation(line: 44, column: 3, scope: !202)
!212 = !MDLocation(line: 49, column: 7, scope: !18)
!213 = !MDLocation(line: 49, column: 3, scope: !18)
!214 = !MDLocation(line: 50, column: 7, scope: !215)
!215 = !{!"0xb\0050\003\0015", !1, !18}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!216 = !MDLocation(line: 50, column: 11, scope: !217)
!217 = !{!"0xb\004", !1, !218}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!218 = !{!"0xb\001", !1, !219}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!219 = !{!"0xb\0050\003\0016", !1, !215}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!220 = !MDLocation(line: 50, column: 13, scope: !219)
!221 = !MDLocation(line: 50, column: 11, scope: !219)
!222 = !MDLocation(line: 50, column: 3, scope: !215)
!223 = !MDLocation(line: 50, column: 29, scope: !224)
!224 = !{!"0xb\002", !1, !225}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!225 = !{!"0xb\0050\0020\0017", !1, !219}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!226 = !MDLocation(line: 50, column: 27, scope: !225)
!227 = !MDLocation(line: 50, column: 34, scope: !225)
!228 = !MDLocation(line: 50, column: 32, scope: !225)
!229 = !MDLocation(line: 50, column: 22, scope: !225)
!230 = !MDLocation(line: 50, column: 44, scope: !225)
!231 = !MDLocation(line: 50, column: 42, scope: !225)
!232 = !MDLocation(line: 50, column: 49, scope: !225)
!233 = !MDLocation(line: 50, column: 47, scope: !225)
!234 = !MDLocation(line: 50, column: 38, scope: !225)
!235 = !MDLocation(line: 50, column: 53, scope: !225)
!236 = !MDLocation(line: 50, column: 15, scope: !237)
!237 = !{!"0xb\003", !1, !219}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!238 = !MDLocation(line: 50, column: 3, scope: !219)
!239 = !MDLocation(line: 51, column: 25, scope: !18)
!240 = !MDLocation(line: 51, column: 29, scope: !18)
!241 = !MDLocation(line: 51, column: 20, scope: !18)
!242 = !MDLocation(line: 51, column: 3, scope: !18)
!243 = !MDLocation(line: 52, column: 3, scope: !18)
!244 = !MDLocation(line: 53, column: 1, scope: !18)
