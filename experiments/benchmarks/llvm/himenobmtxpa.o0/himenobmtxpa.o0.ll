; ModuleID = 'himenobmtxpa.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Mat = type { float*, i32, i32, i32, i32 }
%struct.timeval = type { i64, i64 }
%struct.timezone = type { i32, i32 }

@omega = global float 0x3FE99999A0000000, align 4
@.str = private unnamed_addr constant [34 x i8] c"mimax = %d mjmax = %d mkmax = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [30 x i8] c"imax = %d jmax = %d kmax =%d\0A\00", align 1
@p = common global %struct.Mat zeroinitializer, align 8
@bnd = common global %struct.Mat zeroinitializer, align 8
@wrk1 = common global %struct.Mat zeroinitializer, align 8
@wrk2 = common global %struct.Mat zeroinitializer, align 8
@a = common global %struct.Mat zeroinitializer, align 8
@b = common global %struct.Mat zeroinitializer, align 8
@c = common global %struct.Mat zeroinitializer, align 8
@.str2 = private unnamed_addr constant [29 x i8] c" Loop executed for %d times\0A\00", align 1
@.str3 = private unnamed_addr constant [13 x i8] c" Gosa : %e \0A\00", align 1
@.str4 = private unnamed_addr constant [3 x i8] c"XS\00", align 1
@.str5 = private unnamed_addr constant [3 x i8] c"xs\00", align 1
@.str6 = private unnamed_addr constant [2 x i8] c"S\00", align 1
@.str7 = private unnamed_addr constant [2 x i8] c"s\00", align 1
@.str8 = private unnamed_addr constant [2 x i8] c"M\00", align 1
@.str9 = private unnamed_addr constant [2 x i8] c"m\00", align 1
@.str10 = private unnamed_addr constant [2 x i8] c"L\00", align 1
@.str11 = private unnamed_addr constant [2 x i8] c"l\00", align 1
@.str12 = private unnamed_addr constant [3 x i8] c"XL\00", align 1
@.str13 = private unnamed_addr constant [3 x i8] c"xl\00", align 1
@.str14 = private unnamed_addr constant [28 x i8] c"Invalid input character !!\0A\00", align 1
@second.base_sec = internal global i32 0, align 4
@second.base_usec = internal global i32 0, align 4

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %nn = alloca i32, align 4
  %imax = alloca i32, align 4
  %jmax = alloca i32, align 4
  %kmax = alloca i32, align 4
  %mimax = alloca i32, align 4
  %mjmax = alloca i32, align 4
  %mkmax = alloca i32, align 4
  %msize = alloca [3 x i32], align 4
  %gosa = alloca float, align 4
  %cpu0 = alloca double, align 8
  %cpu1 = alloca double, align 8
  %cpu = alloca double, align 8
  %flop = alloca double, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !66, metadata !67), !dbg !68
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !69, metadata !67), !dbg !70
  call void @llvm.dbg.declare(metadata i32* %i, metadata !71, metadata !67), !dbg !72
  call void @llvm.dbg.declare(metadata i32* %j, metadata !73, metadata !67), !dbg !74
  call void @llvm.dbg.declare(metadata i32* %k, metadata !75, metadata !67), !dbg !76
  call void @llvm.dbg.declare(metadata i32* %nn, metadata !77, metadata !67), !dbg !78
  call void @llvm.dbg.declare(metadata i32* %imax, metadata !79, metadata !67), !dbg !80
  call void @llvm.dbg.declare(metadata i32* %jmax, metadata !81, metadata !67), !dbg !82
  call void @llvm.dbg.declare(metadata i32* %kmax, metadata !83, metadata !67), !dbg !84
  call void @llvm.dbg.declare(metadata i32* %mimax, metadata !85, metadata !67), !dbg !86
  call void @llvm.dbg.declare(metadata i32* %mjmax, metadata !87, metadata !67), !dbg !88
  call void @llvm.dbg.declare(metadata i32* %mkmax, metadata !89, metadata !67), !dbg !90
  call void @llvm.dbg.declare(metadata [3 x i32]* %msize, metadata !91, metadata !67), !dbg !95
  call void @llvm.dbg.declare(metadata float* %gosa, metadata !96, metadata !67), !dbg !97
  call void @llvm.dbg.declare(metadata double* %cpu0, metadata !98, metadata !67), !dbg !99
  call void @llvm.dbg.declare(metadata double* %cpu1, metadata !100, metadata !67), !dbg !101
  call void @llvm.dbg.declare(metadata double* %cpu, metadata !102, metadata !67), !dbg !103
  call void @llvm.dbg.declare(metadata double* %flop, metadata !104, metadata !67), !dbg !105
  %arrayidx = getelementptr inbounds [3 x i32]* %msize, i32 0, i64 0, !dbg !106
  store i32 64, i32* %arrayidx, align 4, !dbg !106
  %arrayidx1 = getelementptr inbounds [3 x i32]* %msize, i32 0, i64 1, !dbg !107
  store i32 64, i32* %arrayidx1, align 4, !dbg !107
  %arrayidx2 = getelementptr inbounds [3 x i32]* %msize, i32 0, i64 2, !dbg !108
  store i32 128, i32* %arrayidx2, align 4, !dbg !108
  %arrayidx3 = getelementptr inbounds [3 x i32]* %msize, i32 0, i64 0, !dbg !109
  %0 = load i32* %arrayidx3, align 4, !dbg !109
  store i32 %0, i32* %mimax, align 4, !dbg !110
  %arrayidx4 = getelementptr inbounds [3 x i32]* %msize, i32 0, i64 1, !dbg !111
  %1 = load i32* %arrayidx4, align 4, !dbg !111
  store i32 %1, i32* %mjmax, align 4, !dbg !112
  %arrayidx5 = getelementptr inbounds [3 x i32]* %msize, i32 0, i64 2, !dbg !113
  %2 = load i32* %arrayidx5, align 4, !dbg !113
  store i32 %2, i32* %mkmax, align 4, !dbg !114
  %3 = load i32* %mimax, align 4, !dbg !115
  %sub = sub nsw i32 %3, 1, !dbg !115
  store i32 %sub, i32* %imax, align 4, !dbg !116
  %4 = load i32* %mjmax, align 4, !dbg !117
  %sub6 = sub nsw i32 %4, 1, !dbg !117
  store i32 %sub6, i32* %jmax, align 4, !dbg !118
  %5 = load i32* %mkmax, align 4, !dbg !119
  %sub7 = sub nsw i32 %5, 1, !dbg !119
  store i32 %sub7, i32* %kmax, align 4, !dbg !120
  %6 = load i32* %mimax, align 4, !dbg !121
  %7 = load i32* %mjmax, align 4, !dbg !122
  %8 = load i32* %mkmax, align 4, !dbg !123
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([34 x i8]* @.str, i32 0, i32 0), i32 %6, i32 %7, i32 %8), !dbg !124
  %9 = load i32* %imax, align 4, !dbg !125
  %10 = load i32* %jmax, align 4, !dbg !126
  %11 = load i32* %kmax, align 4, !dbg !127
  %call8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str1, i32 0, i32 0), i32 %9, i32 %10, i32 %11), !dbg !128
  %12 = load i32* %mimax, align 4, !dbg !129
  %13 = load i32* %mjmax, align 4, !dbg !130
  %14 = load i32* %mkmax, align 4, !dbg !131
  %call9 = call i32 @newMat(%struct.Mat* @p, i32 1, i32 %12, i32 %13, i32 %14), !dbg !132
  %15 = load i32* %mimax, align 4, !dbg !133
  %16 = load i32* %mjmax, align 4, !dbg !134
  %17 = load i32* %mkmax, align 4, !dbg !135
  %call10 = call i32 @newMat(%struct.Mat* @bnd, i32 1, i32 %15, i32 %16, i32 %17), !dbg !136
  %18 = load i32* %mimax, align 4, !dbg !137
  %19 = load i32* %mjmax, align 4, !dbg !138
  %20 = load i32* %mkmax, align 4, !dbg !139
  %call11 = call i32 @newMat(%struct.Mat* @wrk1, i32 1, i32 %18, i32 %19, i32 %20), !dbg !140
  %21 = load i32* %mimax, align 4, !dbg !141
  %22 = load i32* %mjmax, align 4, !dbg !142
  %23 = load i32* %mkmax, align 4, !dbg !143
  %call12 = call i32 @newMat(%struct.Mat* @wrk2, i32 1, i32 %21, i32 %22, i32 %23), !dbg !144
  %24 = load i32* %mimax, align 4, !dbg !145
  %25 = load i32* %mjmax, align 4, !dbg !146
  %26 = load i32* %mkmax, align 4, !dbg !147
  %call13 = call i32 @newMat(%struct.Mat* @a, i32 4, i32 %24, i32 %25, i32 %26), !dbg !148
  %27 = load i32* %mimax, align 4, !dbg !149
  %28 = load i32* %mjmax, align 4, !dbg !150
  %29 = load i32* %mkmax, align 4, !dbg !151
  %call14 = call i32 @newMat(%struct.Mat* @b, i32 3, i32 %27, i32 %28, i32 %29), !dbg !152
  %30 = load i32* %mimax, align 4, !dbg !153
  %31 = load i32* %mjmax, align 4, !dbg !154
  %32 = load i32* %mkmax, align 4, !dbg !155
  %call15 = call i32 @newMat(%struct.Mat* @c, i32 3, i32 %30, i32 %31, i32 %32), !dbg !156
  call void @mat_set_init(%struct.Mat* @p), !dbg !157
  call void @mat_set(%struct.Mat* @bnd, i32 0, float 1.000000e+00), !dbg !158
  call void @mat_set(%struct.Mat* @wrk1, i32 0, float 0.000000e+00), !dbg !159
  call void @mat_set(%struct.Mat* @wrk2, i32 0, float 0.000000e+00), !dbg !160
  call void @mat_set(%struct.Mat* @a, i32 0, float 1.000000e+00), !dbg !161
  call void @mat_set(%struct.Mat* @a, i32 1, float 1.000000e+00), !dbg !162
  call void @mat_set(%struct.Mat* @a, i32 2, float 1.000000e+00), !dbg !163
  call void @mat_set(%struct.Mat* @a, i32 3, float 0x3FC5555560000000), !dbg !164
  call void @mat_set(%struct.Mat* @b, i32 0, float 0.000000e+00), !dbg !165
  call void @mat_set(%struct.Mat* @b, i32 1, float 0.000000e+00), !dbg !166
  call void @mat_set(%struct.Mat* @b, i32 2, float 0.000000e+00), !dbg !167
  call void @mat_set(%struct.Mat* @c, i32 0, float 1.000000e+00), !dbg !168
  call void @mat_set(%struct.Mat* @c, i32 1, float 1.000000e+00), !dbg !169
  call void @mat_set(%struct.Mat* @c, i32 2, float 1.000000e+00), !dbg !170
  store i32 64, i32* %nn, align 4, !dbg !171
  %33 = load i32* %nn, align 4, !dbg !172
  %call16 = call float @jacobi(i32 %33, %struct.Mat* @a, %struct.Mat* @b, %struct.Mat* @c, %struct.Mat* @p, %struct.Mat* @bnd, %struct.Mat* @wrk1, %struct.Mat* @wrk2), !dbg !173
  store float %call16, float* %gosa, align 4, !dbg !174
  %34 = load i32* %nn, align 4, !dbg !175
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str2, i32 0, i32 0), i32 %34), !dbg !176
  %35 = load float* %gosa, align 4, !dbg !177
  %conv = fpext float %35 to double, !dbg !177
  %call18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str3, i32 0, i32 0), double %conv), !dbg !178
  call void @clearMat(%struct.Mat* @p), !dbg !179
  call void @clearMat(%struct.Mat* @bnd), !dbg !180
  call void @clearMat(%struct.Mat* @wrk1), !dbg !181
  call void @clearMat(%struct.Mat* @wrk2), !dbg !182
  call void @clearMat(%struct.Mat* @a), !dbg !183
  call void @clearMat(%struct.Mat* @b), !dbg !184
  call void @clearMat(%struct.Mat* @c), !dbg !185
  ret i32 0, !dbg !186
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define i32 @newMat(%struct.Mat* %Mat, i32 %mnums, i32 %mrows, i32 %mcols, i32 %mdeps) #0 {
entry:
  %Mat.addr = alloca %struct.Mat*, align 8
  %mnums.addr = alloca i32, align 4
  %mrows.addr = alloca i32, align 4
  %mcols.addr = alloca i32, align 4
  %mdeps.addr = alloca i32, align 4
  store %struct.Mat* %Mat, %struct.Mat** %Mat.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.Mat** %Mat.addr, metadata !187, metadata !67), !dbg !188
  store i32 %mnums, i32* %mnums.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %mnums.addr, metadata !189, metadata !67), !dbg !190
  store i32 %mrows, i32* %mrows.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %mrows.addr, metadata !191, metadata !67), !dbg !192
  store i32 %mcols, i32* %mcols.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %mcols.addr, metadata !193, metadata !67), !dbg !194
  store i32 %mdeps, i32* %mdeps.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %mdeps.addr, metadata !195, metadata !67), !dbg !196
  %0 = load i32* %mnums.addr, align 4, !dbg !197
  %1 = load %struct.Mat** %Mat.addr, align 8, !dbg !198
  %mnums1 = getelementptr inbounds %struct.Mat* %1, i32 0, i32 1, !dbg !198
  store i32 %0, i32* %mnums1, align 4, !dbg !198
  %2 = load i32* %mrows.addr, align 4, !dbg !199
  %3 = load %struct.Mat** %Mat.addr, align 8, !dbg !200
  %mrows2 = getelementptr inbounds %struct.Mat* %3, i32 0, i32 2, !dbg !200
  store i32 %2, i32* %mrows2, align 4, !dbg !200
  %4 = load i32* %mcols.addr, align 4, !dbg !201
  %5 = load %struct.Mat** %Mat.addr, align 8, !dbg !202
  %mcols3 = getelementptr inbounds %struct.Mat* %5, i32 0, i32 3, !dbg !202
  store i32 %4, i32* %mcols3, align 4, !dbg !202
  %6 = load i32* %mdeps.addr, align 4, !dbg !203
  %7 = load %struct.Mat** %Mat.addr, align 8, !dbg !204
  %mdeps4 = getelementptr inbounds %struct.Mat* %7, i32 0, i32 4, !dbg !204
  store i32 %6, i32* %mdeps4, align 4, !dbg !204
  %8 = load %struct.Mat** %Mat.addr, align 8, !dbg !205
  %m = getelementptr inbounds %struct.Mat* %8, i32 0, i32 0, !dbg !205
  store float* null, float** %m, align 8, !dbg !205
  %9 = load i32* %mnums.addr, align 4, !dbg !206
  %10 = load i32* %mrows.addr, align 4, !dbg !207
  %mul = mul nsw i32 %9, %10, !dbg !206
  %11 = load i32* %mcols.addr, align 4, !dbg !208
  %mul5 = mul nsw i32 %mul, %11, !dbg !206
  %12 = load i32* %mdeps.addr, align 4, !dbg !209
  %mul6 = mul nsw i32 %mul5, %12, !dbg !206
  %conv = sext i32 %mul6 to i64, !dbg !206
  %mul7 = mul i64 %conv, 4, !dbg !206
  %call = call noalias i8* @malloc(i64 %mul7) #5, !dbg !210
  %13 = bitcast i8* %call to float*, !dbg !211
  %14 = load %struct.Mat** %Mat.addr, align 8, !dbg !212
  %m8 = getelementptr inbounds %struct.Mat* %14, i32 0, i32 0, !dbg !212
  store float* %13, float** %m8, align 8, !dbg !212
  %15 = load %struct.Mat** %Mat.addr, align 8, !dbg !213
  %m9 = getelementptr inbounds %struct.Mat* %15, i32 0, i32 0, !dbg !213
  %16 = load float** %m9, align 8, !dbg !213
  %cmp = icmp ne float* %16, null, !dbg !213
  %cond = select i1 %cmp, i32 1, i32 0, !dbg !214
  ret i32 %cond, !dbg !215
}

; Function Attrs: nounwind uwtable
define void @mat_set_init(%struct.Mat* %Mat) #0 {
entry:
  %Mat.addr = alloca %struct.Mat*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  %tt = alloca float, align 4
  store %struct.Mat* %Mat, %struct.Mat** %Mat.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.Mat** %Mat.addr, metadata !216, metadata !67), !dbg !217
  call void @llvm.dbg.declare(metadata i32* %i, metadata !218, metadata !67), !dbg !219
  call void @llvm.dbg.declare(metadata i32* %j, metadata !220, metadata !67), !dbg !221
  call void @llvm.dbg.declare(metadata i32* %k, metadata !222, metadata !67), !dbg !223
  call void @llvm.dbg.declare(metadata i32* %l, metadata !224, metadata !67), !dbg !225
  call void @llvm.dbg.declare(metadata float* %tt, metadata !226, metadata !67), !dbg !227
  store i32 0, i32* %i, align 4, !dbg !228
  br label %for.cond, !dbg !228

for.cond:                                         ; preds = %for.inc29, %entry
  %0 = load i32* %i, align 4, !dbg !230
  %1 = load %struct.Mat** %Mat.addr, align 8, !dbg !234
  %mrows = getelementptr inbounds %struct.Mat* %1, i32 0, i32 2, !dbg !234
  %2 = load i32* %mrows, align 4, !dbg !234
  %cmp = icmp slt i32 %0, %2, !dbg !235
  br i1 %cmp, label %for.body, label %for.end31, !dbg !236

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !237
  br label %for.cond1, !dbg !237

for.cond1:                                        ; preds = %for.inc26, %for.body
  %3 = load i32* %j, align 4, !dbg !239
  %4 = load %struct.Mat** %Mat.addr, align 8, !dbg !243
  %mcols = getelementptr inbounds %struct.Mat* %4, i32 0, i32 3, !dbg !243
  %5 = load i32* %mcols, align 4, !dbg !243
  %cmp2 = icmp slt i32 %3, %5, !dbg !244
  br i1 %cmp2, label %for.body3, label %for.end28, !dbg !245

for.body3:                                        ; preds = %for.cond1
  store i32 0, i32* %k, align 4, !dbg !246
  br label %for.cond4, !dbg !246

for.cond4:                                        ; preds = %for.inc, %for.body3
  %6 = load i32* %k, align 4, !dbg !248
  %7 = load %struct.Mat** %Mat.addr, align 8, !dbg !252
  %mdeps = getelementptr inbounds %struct.Mat* %7, i32 0, i32 4, !dbg !252
  %8 = load i32* %mdeps, align 4, !dbg !252
  %cmp5 = icmp slt i32 %6, %8, !dbg !253
  br i1 %cmp5, label %for.body6, label %for.end, !dbg !254

for.body6:                                        ; preds = %for.cond4
  %9 = load i32* %i, align 4, !dbg !255
  %10 = load i32* %i, align 4, !dbg !256
  %mul = mul nsw i32 %9, %10, !dbg !255
  %conv = sitofp i32 %mul to float, !dbg !257
  %11 = load %struct.Mat** %Mat.addr, align 8, !dbg !258
  %mrows7 = getelementptr inbounds %struct.Mat* %11, i32 0, i32 2, !dbg !258
  %12 = load i32* %mrows7, align 4, !dbg !258
  %sub = sub nsw i32 %12, 1, !dbg !258
  %13 = load %struct.Mat** %Mat.addr, align 8, !dbg !259
  %mrows8 = getelementptr inbounds %struct.Mat* %13, i32 0, i32 2, !dbg !259
  %14 = load i32* %mrows8, align 4, !dbg !259
  %sub9 = sub nsw i32 %14, 1, !dbg !259
  %mul10 = mul nsw i32 %sub, %sub9, !dbg !260
  %conv11 = sitofp i32 %mul10 to float, !dbg !261
  %div = fdiv float %conv, %conv11, !dbg !257
  %15 = load %struct.Mat** %Mat.addr, align 8, !dbg !262
  %mrows12 = getelementptr inbounds %struct.Mat* %15, i32 0, i32 2, !dbg !262
  %16 = load i32* %mrows12, align 4, !dbg !262
  %mul13 = mul nsw i32 0, %16, !dbg !262
  %17 = load %struct.Mat** %Mat.addr, align 8, !dbg !262
  %mcols14 = getelementptr inbounds %struct.Mat* %17, i32 0, i32 3, !dbg !262
  %18 = load i32* %mcols14, align 4, !dbg !262
  %mul15 = mul nsw i32 %mul13, %18, !dbg !262
  %19 = load %struct.Mat** %Mat.addr, align 8, !dbg !262
  %mdeps16 = getelementptr inbounds %struct.Mat* %19, i32 0, i32 4, !dbg !262
  %20 = load i32* %mdeps16, align 4, !dbg !262
  %mul17 = mul nsw i32 %mul15, %20, !dbg !262
  %21 = load i32* %i, align 4, !dbg !262
  %22 = load %struct.Mat** %Mat.addr, align 8, !dbg !262
  %mcols18 = getelementptr inbounds %struct.Mat* %22, i32 0, i32 3, !dbg !262
  %23 = load i32* %mcols18, align 4, !dbg !262
  %mul19 = mul nsw i32 %21, %23, !dbg !262
  %24 = load %struct.Mat** %Mat.addr, align 8, !dbg !262
  %mdeps20 = getelementptr inbounds %struct.Mat* %24, i32 0, i32 4, !dbg !262
  %25 = load i32* %mdeps20, align 4, !dbg !262
  %mul21 = mul nsw i32 %mul19, %25, !dbg !262
  %add = add nsw i32 %mul17, %mul21, !dbg !262
  %26 = load i32* %j, align 4, !dbg !262
  %27 = load %struct.Mat** %Mat.addr, align 8, !dbg !262
  %mdeps22 = getelementptr inbounds %struct.Mat* %27, i32 0, i32 4, !dbg !262
  %28 = load i32* %mdeps22, align 4, !dbg !262
  %mul23 = mul nsw i32 %26, %28, !dbg !262
  %add24 = add nsw i32 %add, %mul23, !dbg !262
  %29 = load i32* %k, align 4, !dbg !262
  %add25 = add nsw i32 %add24, %29, !dbg !262
  %idxprom = sext i32 %add25 to i64, !dbg !262
  %30 = load %struct.Mat** %Mat.addr, align 8, !dbg !262
  %m = getelementptr inbounds %struct.Mat* %30, i32 0, i32 0, !dbg !262
  %31 = load float** %m, align 8, !dbg !262
  %arrayidx = getelementptr inbounds float* %31, i64 %idxprom, !dbg !262
  store float %div, float* %arrayidx, align 4, !dbg !262
  br label %for.inc, !dbg !262

for.inc:                                          ; preds = %for.body6
  %32 = load i32* %k, align 4, !dbg !263
  %inc = add nsw i32 %32, 1, !dbg !263
  store i32 %inc, i32* %k, align 4, !dbg !263
  br label %for.cond4, !dbg !264

for.end:                                          ; preds = %for.cond4
  br label %for.inc26, !dbg !265

for.inc26:                                        ; preds = %for.end
  %33 = load i32* %j, align 4, !dbg !266
  %inc27 = add nsw i32 %33, 1, !dbg !266
  store i32 %inc27, i32* %j, align 4, !dbg !266
  br label %for.cond1, !dbg !267

for.end28:                                        ; preds = %for.cond1
  br label %for.inc29, !dbg !268

for.inc29:                                        ; preds = %for.end28
  %34 = load i32* %i, align 4, !dbg !269
  %inc30 = add nsw i32 %34, 1, !dbg !269
  store i32 %inc30, i32* %i, align 4, !dbg !269
  br label %for.cond, !dbg !270

for.end31:                                        ; preds = %for.cond
  ret void, !dbg !271
}

; Function Attrs: nounwind uwtable
define void @mat_set(%struct.Mat* %Mat, i32 %l, float %val) #0 {
entry:
  %Mat.addr = alloca %struct.Mat*, align 8
  %l.addr = alloca i32, align 4
  %val.addr = alloca float, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store %struct.Mat* %Mat, %struct.Mat** %Mat.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.Mat** %Mat.addr, metadata !272, metadata !67), !dbg !273
  store i32 %l, i32* %l.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %l.addr, metadata !274, metadata !67), !dbg !275
  store float %val, float* %val.addr, align 4
  call void @llvm.dbg.declare(metadata float* %val.addr, metadata !276, metadata !67), !dbg !277
  call void @llvm.dbg.declare(metadata i32* %i, metadata !278, metadata !67), !dbg !279
  call void @llvm.dbg.declare(metadata i32* %j, metadata !280, metadata !67), !dbg !281
  call void @llvm.dbg.declare(metadata i32* %k, metadata !282, metadata !67), !dbg !283
  store i32 0, i32* %i, align 4, !dbg !284
  br label %for.cond, !dbg !284

for.cond:                                         ; preds = %for.inc23, %entry
  %0 = load i32* %i, align 4, !dbg !286
  %1 = load %struct.Mat** %Mat.addr, align 8, !dbg !290
  %mrows = getelementptr inbounds %struct.Mat* %1, i32 0, i32 2, !dbg !290
  %2 = load i32* %mrows, align 4, !dbg !290
  %cmp = icmp slt i32 %0, %2, !dbg !291
  br i1 %cmp, label %for.body, label %for.end25, !dbg !292

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !293
  br label %for.cond1, !dbg !293

for.cond1:                                        ; preds = %for.inc20, %for.body
  %3 = load i32* %j, align 4, !dbg !295
  %4 = load %struct.Mat** %Mat.addr, align 8, !dbg !299
  %mcols = getelementptr inbounds %struct.Mat* %4, i32 0, i32 3, !dbg !299
  %5 = load i32* %mcols, align 4, !dbg !299
  %cmp2 = icmp slt i32 %3, %5, !dbg !300
  br i1 %cmp2, label %for.body3, label %for.end22, !dbg !301

for.body3:                                        ; preds = %for.cond1
  store i32 0, i32* %k, align 4, !dbg !302
  br label %for.cond4, !dbg !302

for.cond4:                                        ; preds = %for.inc, %for.body3
  %6 = load i32* %k, align 4, !dbg !304
  %7 = load %struct.Mat** %Mat.addr, align 8, !dbg !308
  %mdeps = getelementptr inbounds %struct.Mat* %7, i32 0, i32 4, !dbg !308
  %8 = load i32* %mdeps, align 4, !dbg !308
  %cmp5 = icmp slt i32 %6, %8, !dbg !309
  br i1 %cmp5, label %for.body6, label %for.end, !dbg !310

for.body6:                                        ; preds = %for.cond4
  %9 = load float* %val.addr, align 4, !dbg !311
  %10 = load i32* %l.addr, align 4, !dbg !312
  %11 = load %struct.Mat** %Mat.addr, align 8, !dbg !312
  %mrows7 = getelementptr inbounds %struct.Mat* %11, i32 0, i32 2, !dbg !312
  %12 = load i32* %mrows7, align 4, !dbg !312
  %mul = mul nsw i32 %10, %12, !dbg !312
  %13 = load %struct.Mat** %Mat.addr, align 8, !dbg !312
  %mcols8 = getelementptr inbounds %struct.Mat* %13, i32 0, i32 3, !dbg !312
  %14 = load i32* %mcols8, align 4, !dbg !312
  %mul9 = mul nsw i32 %mul, %14, !dbg !312
  %15 = load %struct.Mat** %Mat.addr, align 8, !dbg !312
  %mdeps10 = getelementptr inbounds %struct.Mat* %15, i32 0, i32 4, !dbg !312
  %16 = load i32* %mdeps10, align 4, !dbg !312
  %mul11 = mul nsw i32 %mul9, %16, !dbg !312
  %17 = load i32* %i, align 4, !dbg !312
  %18 = load %struct.Mat** %Mat.addr, align 8, !dbg !312
  %mcols12 = getelementptr inbounds %struct.Mat* %18, i32 0, i32 3, !dbg !312
  %19 = load i32* %mcols12, align 4, !dbg !312
  %mul13 = mul nsw i32 %17, %19, !dbg !312
  %20 = load %struct.Mat** %Mat.addr, align 8, !dbg !312
  %mdeps14 = getelementptr inbounds %struct.Mat* %20, i32 0, i32 4, !dbg !312
  %21 = load i32* %mdeps14, align 4, !dbg !312
  %mul15 = mul nsw i32 %mul13, %21, !dbg !312
  %add = add nsw i32 %mul11, %mul15, !dbg !312
  %22 = load i32* %j, align 4, !dbg !312
  %23 = load %struct.Mat** %Mat.addr, align 8, !dbg !312
  %mdeps16 = getelementptr inbounds %struct.Mat* %23, i32 0, i32 4, !dbg !312
  %24 = load i32* %mdeps16, align 4, !dbg !312
  %mul17 = mul nsw i32 %22, %24, !dbg !312
  %add18 = add nsw i32 %add, %mul17, !dbg !312
  %25 = load i32* %k, align 4, !dbg !312
  %add19 = add nsw i32 %add18, %25, !dbg !312
  %idxprom = sext i32 %add19 to i64, !dbg !312
  %26 = load %struct.Mat** %Mat.addr, align 8, !dbg !312
  %m = getelementptr inbounds %struct.Mat* %26, i32 0, i32 0, !dbg !312
  %27 = load float** %m, align 8, !dbg !312
  %arrayidx = getelementptr inbounds float* %27, i64 %idxprom, !dbg !312
  store float %9, float* %arrayidx, align 4, !dbg !312
  br label %for.inc, !dbg !312

for.inc:                                          ; preds = %for.body6
  %28 = load i32* %k, align 4, !dbg !313
  %inc = add nsw i32 %28, 1, !dbg !313
  store i32 %inc, i32* %k, align 4, !dbg !313
  br label %for.cond4, !dbg !314

for.end:                                          ; preds = %for.cond4
  br label %for.inc20, !dbg !315

for.inc20:                                        ; preds = %for.end
  %29 = load i32* %j, align 4, !dbg !316
  %inc21 = add nsw i32 %29, 1, !dbg !316
  store i32 %inc21, i32* %j, align 4, !dbg !316
  br label %for.cond1, !dbg !317

for.end22:                                        ; preds = %for.cond1
  br label %for.inc23, !dbg !318

for.inc23:                                        ; preds = %for.end22
  %30 = load i32* %i, align 4, !dbg !319
  %inc24 = add nsw i32 %30, 1, !dbg !319
  store i32 %inc24, i32* %i, align 4, !dbg !319
  br label %for.cond, !dbg !320

for.end25:                                        ; preds = %for.cond
  ret void, !dbg !321
}

; Function Attrs: nounwind uwtable
define float @jacobi(i32 %nn, %struct.Mat* %a, %struct.Mat* %b, %struct.Mat* %c, %struct.Mat* %p, %struct.Mat* %bnd, %struct.Mat* %wrk1, %struct.Mat* %wrk2) #0 {
entry:
  %nn.addr = alloca i32, align 4
  %a.addr = alloca %struct.Mat*, align 8
  %b.addr = alloca %struct.Mat*, align 8
  %c.addr = alloca %struct.Mat*, align 8
  %p.addr = alloca %struct.Mat*, align 8
  %bnd.addr = alloca %struct.Mat*, align 8
  %wrk1.addr = alloca %struct.Mat*, align 8
  %wrk2.addr = alloca %struct.Mat*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %n = alloca i32, align 4
  %imax = alloca i32, align 4
  %jmax = alloca i32, align 4
  %kmax = alloca i32, align 4
  %gosa = alloca float, align 4
  %s0 = alloca float, align 4
  %ss = alloca float, align 4
  store i32 %nn, i32* %nn.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nn.addr, metadata !322, metadata !67), !dbg !323
  store %struct.Mat* %a, %struct.Mat** %a.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.Mat** %a.addr, metadata !324, metadata !67), !dbg !325
  store %struct.Mat* %b, %struct.Mat** %b.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.Mat** %b.addr, metadata !326, metadata !67), !dbg !327
  store %struct.Mat* %c, %struct.Mat** %c.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.Mat** %c.addr, metadata !328, metadata !67), !dbg !329
  store %struct.Mat* %p, %struct.Mat** %p.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.Mat** %p.addr, metadata !330, metadata !67), !dbg !331
  store %struct.Mat* %bnd, %struct.Mat** %bnd.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.Mat** %bnd.addr, metadata !332, metadata !67), !dbg !333
  store %struct.Mat* %wrk1, %struct.Mat** %wrk1.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.Mat** %wrk1.addr, metadata !334, metadata !67), !dbg !335
  store %struct.Mat* %wrk2, %struct.Mat** %wrk2.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.Mat** %wrk2.addr, metadata !336, metadata !67), !dbg !337
  call void @llvm.dbg.declare(metadata i32* %i, metadata !338, metadata !67), !dbg !339
  call void @llvm.dbg.declare(metadata i32* %j, metadata !340, metadata !67), !dbg !341
  call void @llvm.dbg.declare(metadata i32* %k, metadata !342, metadata !67), !dbg !343
  call void @llvm.dbg.declare(metadata i32* %n, metadata !344, metadata !67), !dbg !345
  call void @llvm.dbg.declare(metadata i32* %imax, metadata !346, metadata !67), !dbg !347
  call void @llvm.dbg.declare(metadata i32* %jmax, metadata !348, metadata !67), !dbg !349
  call void @llvm.dbg.declare(metadata i32* %kmax, metadata !350, metadata !67), !dbg !351
  call void @llvm.dbg.declare(metadata float* %gosa, metadata !352, metadata !67), !dbg !353
  call void @llvm.dbg.declare(metadata float* %s0, metadata !354, metadata !67), !dbg !355
  call void @llvm.dbg.declare(metadata float* %ss, metadata !356, metadata !67), !dbg !357
  %0 = load %struct.Mat** %p.addr, align 8, !dbg !358
  %mrows = getelementptr inbounds %struct.Mat* %0, i32 0, i32 2, !dbg !358
  %1 = load i32* %mrows, align 4, !dbg !358
  %sub = sub nsw i32 %1, 1, !dbg !358
  store i32 %sub, i32* %imax, align 4, !dbg !359
  %2 = load %struct.Mat** %p.addr, align 8, !dbg !360
  %mcols = getelementptr inbounds %struct.Mat* %2, i32 0, i32 3, !dbg !360
  %3 = load i32* %mcols, align 4, !dbg !360
  %sub1 = sub nsw i32 %3, 1, !dbg !360
  store i32 %sub1, i32* %jmax, align 4, !dbg !361
  %4 = load %struct.Mat** %p.addr, align 8, !dbg !362
  %mdeps = getelementptr inbounds %struct.Mat* %4, i32 0, i32 4, !dbg !362
  %5 = load i32* %mdeps, align 4, !dbg !362
  %sub2 = sub nsw i32 %5, 1, !dbg !362
  store i32 %sub2, i32* %kmax, align 4, !dbg !363
  store i32 0, i32* %n, align 4, !dbg !364
  br label %for.cond, !dbg !364

for.cond:                                         ; preds = %for.inc725, %entry
  %6 = load i32* %n, align 4, !dbg !366
  %7 = load i32* %nn.addr, align 4, !dbg !370
  %cmp = icmp slt i32 %6, %7, !dbg !371
  br i1 %cmp, label %for.body, label %for.end727, !dbg !372

for.body:                                         ; preds = %for.cond
  store float 0.000000e+00, float* %gosa, align 4, !dbg !373
  store i32 1, i32* %i, align 4, !dbg !375
  br label %for.cond3, !dbg !375

for.cond3:                                        ; preds = %for.inc668, %for.body
  %8 = load i32* %i, align 4, !dbg !377
  %9 = load i32* %imax, align 4, !dbg !381
  %cmp4 = icmp slt i32 %8, %9, !dbg !382
  br i1 %cmp4, label %for.body5, label %for.end670, !dbg !383

for.body5:                                        ; preds = %for.cond3
  store i32 1, i32* %j, align 4, !dbg !384
  br label %for.cond6, !dbg !384

for.cond6:                                        ; preds = %for.inc665, %for.body5
  %10 = load i32* %j, align 4, !dbg !386
  %11 = load i32* %jmax, align 4, !dbg !390
  %cmp7 = icmp slt i32 %10, %11, !dbg !391
  br i1 %cmp7, label %for.body8, label %for.end667, !dbg !392

for.body8:                                        ; preds = %for.cond6
  store i32 1, i32* %k, align 4, !dbg !393
  br label %for.cond9, !dbg !393

for.cond9:                                        ; preds = %for.inc, %for.body8
  %12 = load i32* %k, align 4, !dbg !395
  %13 = load i32* %kmax, align 4, !dbg !399
  %cmp10 = icmp slt i32 %12, %13, !dbg !400
  br i1 %cmp10, label %for.body11, label %for.end, !dbg !401

for.body11:                                       ; preds = %for.cond9
  %14 = load %struct.Mat** %a.addr, align 8, !dbg !402
  %mrows12 = getelementptr inbounds %struct.Mat* %14, i32 0, i32 2, !dbg !402
  %15 = load i32* %mrows12, align 4, !dbg !402
  %mul = mul nsw i32 0, %15, !dbg !402
  %16 = load %struct.Mat** %a.addr, align 8, !dbg !402
  %mcols13 = getelementptr inbounds %struct.Mat* %16, i32 0, i32 3, !dbg !402
  %17 = load i32* %mcols13, align 4, !dbg !402
  %mul14 = mul nsw i32 %mul, %17, !dbg !402
  %18 = load %struct.Mat** %a.addr, align 8, !dbg !402
  %mdeps15 = getelementptr inbounds %struct.Mat* %18, i32 0, i32 4, !dbg !402
  %19 = load i32* %mdeps15, align 4, !dbg !402
  %mul16 = mul nsw i32 %mul14, %19, !dbg !402
  %20 = load i32* %i, align 4, !dbg !402
  %21 = load %struct.Mat** %a.addr, align 8, !dbg !402
  %mcols17 = getelementptr inbounds %struct.Mat* %21, i32 0, i32 3, !dbg !402
  %22 = load i32* %mcols17, align 4, !dbg !402
  %mul18 = mul nsw i32 %20, %22, !dbg !402
  %23 = load %struct.Mat** %a.addr, align 8, !dbg !402
  %mdeps19 = getelementptr inbounds %struct.Mat* %23, i32 0, i32 4, !dbg !402
  %24 = load i32* %mdeps19, align 4, !dbg !402
  %mul20 = mul nsw i32 %mul18, %24, !dbg !402
  %add = add nsw i32 %mul16, %mul20, !dbg !402
  %25 = load i32* %j, align 4, !dbg !402
  %26 = load %struct.Mat** %a.addr, align 8, !dbg !402
  %mdeps21 = getelementptr inbounds %struct.Mat* %26, i32 0, i32 4, !dbg !402
  %27 = load i32* %mdeps21, align 4, !dbg !402
  %mul22 = mul nsw i32 %25, %27, !dbg !402
  %add23 = add nsw i32 %add, %mul22, !dbg !402
  %28 = load i32* %k, align 4, !dbg !402
  %add24 = add nsw i32 %add23, %28, !dbg !402
  %idxprom = sext i32 %add24 to i64, !dbg !402
  %29 = load %struct.Mat** %a.addr, align 8, !dbg !402
  %m = getelementptr inbounds %struct.Mat* %29, i32 0, i32 0, !dbg !402
  %30 = load float** %m, align 8, !dbg !402
  %arrayidx = getelementptr inbounds float* %30, i64 %idxprom, !dbg !402
  %31 = load float* %arrayidx, align 4, !dbg !402
  %32 = load %struct.Mat** %p.addr, align 8, !dbg !404
  %mrows25 = getelementptr inbounds %struct.Mat* %32, i32 0, i32 2, !dbg !404
  %33 = load i32* %mrows25, align 4, !dbg !404
  %mul26 = mul nsw i32 0, %33, !dbg !404
  %34 = load %struct.Mat** %p.addr, align 8, !dbg !404
  %mcols27 = getelementptr inbounds %struct.Mat* %34, i32 0, i32 3, !dbg !404
  %35 = load i32* %mcols27, align 4, !dbg !404
  %mul28 = mul nsw i32 %mul26, %35, !dbg !404
  %36 = load %struct.Mat** %p.addr, align 8, !dbg !404
  %mdeps29 = getelementptr inbounds %struct.Mat* %36, i32 0, i32 4, !dbg !404
  %37 = load i32* %mdeps29, align 4, !dbg !404
  %mul30 = mul nsw i32 %mul28, %37, !dbg !404
  %38 = load i32* %i, align 4, !dbg !404
  %add31 = add nsw i32 %38, 1, !dbg !404
  %39 = load %struct.Mat** %p.addr, align 8, !dbg !404
  %mcols32 = getelementptr inbounds %struct.Mat* %39, i32 0, i32 3, !dbg !404
  %40 = load i32* %mcols32, align 4, !dbg !404
  %mul33 = mul nsw i32 %add31, %40, !dbg !404
  %41 = load %struct.Mat** %p.addr, align 8, !dbg !404
  %mdeps34 = getelementptr inbounds %struct.Mat* %41, i32 0, i32 4, !dbg !404
  %42 = load i32* %mdeps34, align 4, !dbg !404
  %mul35 = mul nsw i32 %mul33, %42, !dbg !404
  %add36 = add nsw i32 %mul30, %mul35, !dbg !404
  %43 = load i32* %j, align 4, !dbg !404
  %44 = load %struct.Mat** %p.addr, align 8, !dbg !404
  %mdeps37 = getelementptr inbounds %struct.Mat* %44, i32 0, i32 4, !dbg !404
  %45 = load i32* %mdeps37, align 4, !dbg !404
  %mul38 = mul nsw i32 %43, %45, !dbg !404
  %add39 = add nsw i32 %add36, %mul38, !dbg !404
  %46 = load i32* %k, align 4, !dbg !404
  %add40 = add nsw i32 %add39, %46, !dbg !404
  %idxprom41 = sext i32 %add40 to i64, !dbg !404
  %47 = load %struct.Mat** %p.addr, align 8, !dbg !404
  %m42 = getelementptr inbounds %struct.Mat* %47, i32 0, i32 0, !dbg !404
  %48 = load float** %m42, align 8, !dbg !404
  %arrayidx43 = getelementptr inbounds float* %48, i64 %idxprom41, !dbg !404
  %49 = load float* %arrayidx43, align 4, !dbg !404
  %mul44 = fmul float %31, %49, !dbg !402
  %50 = load %struct.Mat** %a.addr, align 8, !dbg !405
  %mrows45 = getelementptr inbounds %struct.Mat* %50, i32 0, i32 2, !dbg !405
  %51 = load i32* %mrows45, align 4, !dbg !405
  %mul46 = mul nsw i32 1, %51, !dbg !405
  %52 = load %struct.Mat** %a.addr, align 8, !dbg !405
  %mcols47 = getelementptr inbounds %struct.Mat* %52, i32 0, i32 3, !dbg !405
  %53 = load i32* %mcols47, align 4, !dbg !405
  %mul48 = mul nsw i32 %mul46, %53, !dbg !405
  %54 = load %struct.Mat** %a.addr, align 8, !dbg !405
  %mdeps49 = getelementptr inbounds %struct.Mat* %54, i32 0, i32 4, !dbg !405
  %55 = load i32* %mdeps49, align 4, !dbg !405
  %mul50 = mul nsw i32 %mul48, %55, !dbg !405
  %56 = load i32* %i, align 4, !dbg !405
  %57 = load %struct.Mat** %a.addr, align 8, !dbg !405
  %mcols51 = getelementptr inbounds %struct.Mat* %57, i32 0, i32 3, !dbg !405
  %58 = load i32* %mcols51, align 4, !dbg !405
  %mul52 = mul nsw i32 %56, %58, !dbg !405
  %59 = load %struct.Mat** %a.addr, align 8, !dbg !405
  %mdeps53 = getelementptr inbounds %struct.Mat* %59, i32 0, i32 4, !dbg !405
  %60 = load i32* %mdeps53, align 4, !dbg !405
  %mul54 = mul nsw i32 %mul52, %60, !dbg !405
  %add55 = add nsw i32 %mul50, %mul54, !dbg !405
  %61 = load i32* %j, align 4, !dbg !405
  %62 = load %struct.Mat** %a.addr, align 8, !dbg !405
  %mdeps56 = getelementptr inbounds %struct.Mat* %62, i32 0, i32 4, !dbg !405
  %63 = load i32* %mdeps56, align 4, !dbg !405
  %mul57 = mul nsw i32 %61, %63, !dbg !405
  %add58 = add nsw i32 %add55, %mul57, !dbg !405
  %64 = load i32* %k, align 4, !dbg !405
  %add59 = add nsw i32 %add58, %64, !dbg !405
  %idxprom60 = sext i32 %add59 to i64, !dbg !405
  %65 = load %struct.Mat** %a.addr, align 8, !dbg !405
  %m61 = getelementptr inbounds %struct.Mat* %65, i32 0, i32 0, !dbg !405
  %66 = load float** %m61, align 8, !dbg !405
  %arrayidx62 = getelementptr inbounds float* %66, i64 %idxprom60, !dbg !405
  %67 = load float* %arrayidx62, align 4, !dbg !405
  %68 = load %struct.Mat** %p.addr, align 8, !dbg !406
  %mrows63 = getelementptr inbounds %struct.Mat* %68, i32 0, i32 2, !dbg !406
  %69 = load i32* %mrows63, align 4, !dbg !406
  %mul64 = mul nsw i32 0, %69, !dbg !406
  %70 = load %struct.Mat** %p.addr, align 8, !dbg !406
  %mcols65 = getelementptr inbounds %struct.Mat* %70, i32 0, i32 3, !dbg !406
  %71 = load i32* %mcols65, align 4, !dbg !406
  %mul66 = mul nsw i32 %mul64, %71, !dbg !406
  %72 = load %struct.Mat** %p.addr, align 8, !dbg !406
  %mdeps67 = getelementptr inbounds %struct.Mat* %72, i32 0, i32 4, !dbg !406
  %73 = load i32* %mdeps67, align 4, !dbg !406
  %mul68 = mul nsw i32 %mul66, %73, !dbg !406
  %74 = load i32* %i, align 4, !dbg !406
  %75 = load %struct.Mat** %p.addr, align 8, !dbg !406
  %mcols69 = getelementptr inbounds %struct.Mat* %75, i32 0, i32 3, !dbg !406
  %76 = load i32* %mcols69, align 4, !dbg !406
  %mul70 = mul nsw i32 %74, %76, !dbg !406
  %77 = load %struct.Mat** %p.addr, align 8, !dbg !406
  %mdeps71 = getelementptr inbounds %struct.Mat* %77, i32 0, i32 4, !dbg !406
  %78 = load i32* %mdeps71, align 4, !dbg !406
  %mul72 = mul nsw i32 %mul70, %78, !dbg !406
  %add73 = add nsw i32 %mul68, %mul72, !dbg !406
  %79 = load i32* %j, align 4, !dbg !406
  %add74 = add nsw i32 %79, 1, !dbg !406
  %80 = load %struct.Mat** %p.addr, align 8, !dbg !406
  %mdeps75 = getelementptr inbounds %struct.Mat* %80, i32 0, i32 4, !dbg !406
  %81 = load i32* %mdeps75, align 4, !dbg !406
  %mul76 = mul nsw i32 %add74, %81, !dbg !406
  %add77 = add nsw i32 %add73, %mul76, !dbg !406
  %82 = load i32* %k, align 4, !dbg !406
  %add78 = add nsw i32 %add77, %82, !dbg !406
  %idxprom79 = sext i32 %add78 to i64, !dbg !406
  %83 = load %struct.Mat** %p.addr, align 8, !dbg !406
  %m80 = getelementptr inbounds %struct.Mat* %83, i32 0, i32 0, !dbg !406
  %84 = load float** %m80, align 8, !dbg !406
  %arrayidx81 = getelementptr inbounds float* %84, i64 %idxprom79, !dbg !406
  %85 = load float* %arrayidx81, align 4, !dbg !406
  %mul82 = fmul float %67, %85, !dbg !405
  %add83 = fadd float %mul44, %mul82, !dbg !402
  %86 = load %struct.Mat** %a.addr, align 8, !dbg !407
  %mrows84 = getelementptr inbounds %struct.Mat* %86, i32 0, i32 2, !dbg !407
  %87 = load i32* %mrows84, align 4, !dbg !407
  %mul85 = mul nsw i32 2, %87, !dbg !407
  %88 = load %struct.Mat** %a.addr, align 8, !dbg !407
  %mcols86 = getelementptr inbounds %struct.Mat* %88, i32 0, i32 3, !dbg !407
  %89 = load i32* %mcols86, align 4, !dbg !407
  %mul87 = mul nsw i32 %mul85, %89, !dbg !407
  %90 = load %struct.Mat** %a.addr, align 8, !dbg !407
  %mdeps88 = getelementptr inbounds %struct.Mat* %90, i32 0, i32 4, !dbg !407
  %91 = load i32* %mdeps88, align 4, !dbg !407
  %mul89 = mul nsw i32 %mul87, %91, !dbg !407
  %92 = load i32* %i, align 4, !dbg !407
  %93 = load %struct.Mat** %a.addr, align 8, !dbg !407
  %mcols90 = getelementptr inbounds %struct.Mat* %93, i32 0, i32 3, !dbg !407
  %94 = load i32* %mcols90, align 4, !dbg !407
  %mul91 = mul nsw i32 %92, %94, !dbg !407
  %95 = load %struct.Mat** %a.addr, align 8, !dbg !407
  %mdeps92 = getelementptr inbounds %struct.Mat* %95, i32 0, i32 4, !dbg !407
  %96 = load i32* %mdeps92, align 4, !dbg !407
  %mul93 = mul nsw i32 %mul91, %96, !dbg !407
  %add94 = add nsw i32 %mul89, %mul93, !dbg !407
  %97 = load i32* %j, align 4, !dbg !407
  %98 = load %struct.Mat** %a.addr, align 8, !dbg !407
  %mdeps95 = getelementptr inbounds %struct.Mat* %98, i32 0, i32 4, !dbg !407
  %99 = load i32* %mdeps95, align 4, !dbg !407
  %mul96 = mul nsw i32 %97, %99, !dbg !407
  %add97 = add nsw i32 %add94, %mul96, !dbg !407
  %100 = load i32* %k, align 4, !dbg !407
  %add98 = add nsw i32 %add97, %100, !dbg !407
  %idxprom99 = sext i32 %add98 to i64, !dbg !407
  %101 = load %struct.Mat** %a.addr, align 8, !dbg !407
  %m100 = getelementptr inbounds %struct.Mat* %101, i32 0, i32 0, !dbg !407
  %102 = load float** %m100, align 8, !dbg !407
  %arrayidx101 = getelementptr inbounds float* %102, i64 %idxprom99, !dbg !407
  %103 = load float* %arrayidx101, align 4, !dbg !407
  %104 = load %struct.Mat** %p.addr, align 8, !dbg !408
  %mrows102 = getelementptr inbounds %struct.Mat* %104, i32 0, i32 2, !dbg !408
  %105 = load i32* %mrows102, align 4, !dbg !408
  %mul103 = mul nsw i32 0, %105, !dbg !408
  %106 = load %struct.Mat** %p.addr, align 8, !dbg !408
  %mcols104 = getelementptr inbounds %struct.Mat* %106, i32 0, i32 3, !dbg !408
  %107 = load i32* %mcols104, align 4, !dbg !408
  %mul105 = mul nsw i32 %mul103, %107, !dbg !408
  %108 = load %struct.Mat** %p.addr, align 8, !dbg !408
  %mdeps106 = getelementptr inbounds %struct.Mat* %108, i32 0, i32 4, !dbg !408
  %109 = load i32* %mdeps106, align 4, !dbg !408
  %mul107 = mul nsw i32 %mul105, %109, !dbg !408
  %110 = load i32* %i, align 4, !dbg !408
  %111 = load %struct.Mat** %p.addr, align 8, !dbg !408
  %mcols108 = getelementptr inbounds %struct.Mat* %111, i32 0, i32 3, !dbg !408
  %112 = load i32* %mcols108, align 4, !dbg !408
  %mul109 = mul nsw i32 %110, %112, !dbg !408
  %113 = load %struct.Mat** %p.addr, align 8, !dbg !408
  %mdeps110 = getelementptr inbounds %struct.Mat* %113, i32 0, i32 4, !dbg !408
  %114 = load i32* %mdeps110, align 4, !dbg !408
  %mul111 = mul nsw i32 %mul109, %114, !dbg !408
  %add112 = add nsw i32 %mul107, %mul111, !dbg !408
  %115 = load i32* %j, align 4, !dbg !408
  %116 = load %struct.Mat** %p.addr, align 8, !dbg !408
  %mdeps113 = getelementptr inbounds %struct.Mat* %116, i32 0, i32 4, !dbg !408
  %117 = load i32* %mdeps113, align 4, !dbg !408
  %mul114 = mul nsw i32 %115, %117, !dbg !408
  %add115 = add nsw i32 %add112, %mul114, !dbg !408
  %118 = load i32* %k, align 4, !dbg !408
  %add116 = add nsw i32 %118, 1, !dbg !408
  %add117 = add nsw i32 %add115, %add116, !dbg !408
  %idxprom118 = sext i32 %add117 to i64, !dbg !408
  %119 = load %struct.Mat** %p.addr, align 8, !dbg !408
  %m119 = getelementptr inbounds %struct.Mat* %119, i32 0, i32 0, !dbg !408
  %120 = load float** %m119, align 8, !dbg !408
  %arrayidx120 = getelementptr inbounds float* %120, i64 %idxprom118, !dbg !408
  %121 = load float* %arrayidx120, align 4, !dbg !408
  %mul121 = fmul float %103, %121, !dbg !407
  %add122 = fadd float %add83, %mul121, !dbg !402
  %122 = load %struct.Mat** %b.addr, align 8, !dbg !409
  %mrows123 = getelementptr inbounds %struct.Mat* %122, i32 0, i32 2, !dbg !409
  %123 = load i32* %mrows123, align 4, !dbg !409
  %mul124 = mul nsw i32 0, %123, !dbg !409
  %124 = load %struct.Mat** %b.addr, align 8, !dbg !409
  %mcols125 = getelementptr inbounds %struct.Mat* %124, i32 0, i32 3, !dbg !409
  %125 = load i32* %mcols125, align 4, !dbg !409
  %mul126 = mul nsw i32 %mul124, %125, !dbg !409
  %126 = load %struct.Mat** %b.addr, align 8, !dbg !409
  %mdeps127 = getelementptr inbounds %struct.Mat* %126, i32 0, i32 4, !dbg !409
  %127 = load i32* %mdeps127, align 4, !dbg !409
  %mul128 = mul nsw i32 %mul126, %127, !dbg !409
  %128 = load i32* %i, align 4, !dbg !409
  %129 = load %struct.Mat** %b.addr, align 8, !dbg !409
  %mcols129 = getelementptr inbounds %struct.Mat* %129, i32 0, i32 3, !dbg !409
  %130 = load i32* %mcols129, align 4, !dbg !409
  %mul130 = mul nsw i32 %128, %130, !dbg !409
  %131 = load %struct.Mat** %b.addr, align 8, !dbg !409
  %mdeps131 = getelementptr inbounds %struct.Mat* %131, i32 0, i32 4, !dbg !409
  %132 = load i32* %mdeps131, align 4, !dbg !409
  %mul132 = mul nsw i32 %mul130, %132, !dbg !409
  %add133 = add nsw i32 %mul128, %mul132, !dbg !409
  %133 = load i32* %j, align 4, !dbg !409
  %134 = load %struct.Mat** %b.addr, align 8, !dbg !409
  %mdeps134 = getelementptr inbounds %struct.Mat* %134, i32 0, i32 4, !dbg !409
  %135 = load i32* %mdeps134, align 4, !dbg !409
  %mul135 = mul nsw i32 %133, %135, !dbg !409
  %add136 = add nsw i32 %add133, %mul135, !dbg !409
  %136 = load i32* %k, align 4, !dbg !409
  %add137 = add nsw i32 %add136, %136, !dbg !409
  %idxprom138 = sext i32 %add137 to i64, !dbg !409
  %137 = load %struct.Mat** %b.addr, align 8, !dbg !409
  %m139 = getelementptr inbounds %struct.Mat* %137, i32 0, i32 0, !dbg !409
  %138 = load float** %m139, align 8, !dbg !409
  %arrayidx140 = getelementptr inbounds float* %138, i64 %idxprom138, !dbg !409
  %139 = load float* %arrayidx140, align 4, !dbg !409
  %140 = load %struct.Mat** %p.addr, align 8, !dbg !410
  %mrows141 = getelementptr inbounds %struct.Mat* %140, i32 0, i32 2, !dbg !410
  %141 = load i32* %mrows141, align 4, !dbg !410
  %mul142 = mul nsw i32 0, %141, !dbg !410
  %142 = load %struct.Mat** %p.addr, align 8, !dbg !410
  %mcols143 = getelementptr inbounds %struct.Mat* %142, i32 0, i32 3, !dbg !410
  %143 = load i32* %mcols143, align 4, !dbg !410
  %mul144 = mul nsw i32 %mul142, %143, !dbg !410
  %144 = load %struct.Mat** %p.addr, align 8, !dbg !410
  %mdeps145 = getelementptr inbounds %struct.Mat* %144, i32 0, i32 4, !dbg !410
  %145 = load i32* %mdeps145, align 4, !dbg !410
  %mul146 = mul nsw i32 %mul144, %145, !dbg !410
  %146 = load i32* %i, align 4, !dbg !410
  %add147 = add nsw i32 %146, 1, !dbg !410
  %147 = load %struct.Mat** %p.addr, align 8, !dbg !410
  %mcols148 = getelementptr inbounds %struct.Mat* %147, i32 0, i32 3, !dbg !410
  %148 = load i32* %mcols148, align 4, !dbg !410
  %mul149 = mul nsw i32 %add147, %148, !dbg !410
  %149 = load %struct.Mat** %p.addr, align 8, !dbg !410
  %mdeps150 = getelementptr inbounds %struct.Mat* %149, i32 0, i32 4, !dbg !410
  %150 = load i32* %mdeps150, align 4, !dbg !410
  %mul151 = mul nsw i32 %mul149, %150, !dbg !410
  %add152 = add nsw i32 %mul146, %mul151, !dbg !410
  %151 = load i32* %j, align 4, !dbg !410
  %add153 = add nsw i32 %151, 1, !dbg !410
  %152 = load %struct.Mat** %p.addr, align 8, !dbg !410
  %mdeps154 = getelementptr inbounds %struct.Mat* %152, i32 0, i32 4, !dbg !410
  %153 = load i32* %mdeps154, align 4, !dbg !410
  %mul155 = mul nsw i32 %add153, %153, !dbg !410
  %add156 = add nsw i32 %add152, %mul155, !dbg !410
  %154 = load i32* %k, align 4, !dbg !410
  %add157 = add nsw i32 %add156, %154, !dbg !410
  %idxprom158 = sext i32 %add157 to i64, !dbg !410
  %155 = load %struct.Mat** %p.addr, align 8, !dbg !410
  %m159 = getelementptr inbounds %struct.Mat* %155, i32 0, i32 0, !dbg !410
  %156 = load float** %m159, align 8, !dbg !410
  %arrayidx160 = getelementptr inbounds float* %156, i64 %idxprom158, !dbg !410
  %157 = load float* %arrayidx160, align 4, !dbg !410
  %158 = load %struct.Mat** %p.addr, align 8, !dbg !411
  %mrows161 = getelementptr inbounds %struct.Mat* %158, i32 0, i32 2, !dbg !411
  %159 = load i32* %mrows161, align 4, !dbg !411
  %mul162 = mul nsw i32 0, %159, !dbg !411
  %160 = load %struct.Mat** %p.addr, align 8, !dbg !411
  %mcols163 = getelementptr inbounds %struct.Mat* %160, i32 0, i32 3, !dbg !411
  %161 = load i32* %mcols163, align 4, !dbg !411
  %mul164 = mul nsw i32 %mul162, %161, !dbg !411
  %162 = load %struct.Mat** %p.addr, align 8, !dbg !411
  %mdeps165 = getelementptr inbounds %struct.Mat* %162, i32 0, i32 4, !dbg !411
  %163 = load i32* %mdeps165, align 4, !dbg !411
  %mul166 = mul nsw i32 %mul164, %163, !dbg !411
  %164 = load i32* %i, align 4, !dbg !411
  %add167 = add nsw i32 %164, 1, !dbg !411
  %165 = load %struct.Mat** %p.addr, align 8, !dbg !411
  %mcols168 = getelementptr inbounds %struct.Mat* %165, i32 0, i32 3, !dbg !411
  %166 = load i32* %mcols168, align 4, !dbg !411
  %mul169 = mul nsw i32 %add167, %166, !dbg !411
  %167 = load %struct.Mat** %p.addr, align 8, !dbg !411
  %mdeps170 = getelementptr inbounds %struct.Mat* %167, i32 0, i32 4, !dbg !411
  %168 = load i32* %mdeps170, align 4, !dbg !411
  %mul171 = mul nsw i32 %mul169, %168, !dbg !411
  %add172 = add nsw i32 %mul166, %mul171, !dbg !411
  %169 = load i32* %j, align 4, !dbg !411
  %sub173 = sub nsw i32 %169, 1, !dbg !411
  %170 = load %struct.Mat** %p.addr, align 8, !dbg !411
  %mdeps174 = getelementptr inbounds %struct.Mat* %170, i32 0, i32 4, !dbg !411
  %171 = load i32* %mdeps174, align 4, !dbg !411
  %mul175 = mul nsw i32 %sub173, %171, !dbg !411
  %add176 = add nsw i32 %add172, %mul175, !dbg !411
  %172 = load i32* %k, align 4, !dbg !411
  %add177 = add nsw i32 %add176, %172, !dbg !411
  %idxprom178 = sext i32 %add177 to i64, !dbg !411
  %173 = load %struct.Mat** %p.addr, align 8, !dbg !411
  %m179 = getelementptr inbounds %struct.Mat* %173, i32 0, i32 0, !dbg !411
  %174 = load float** %m179, align 8, !dbg !411
  %arrayidx180 = getelementptr inbounds float* %174, i64 %idxprom178, !dbg !411
  %175 = load float* %arrayidx180, align 4, !dbg !411
  %sub181 = fsub float %157, %175, !dbg !410
  %176 = load %struct.Mat** %p.addr, align 8, !dbg !412
  %mrows182 = getelementptr inbounds %struct.Mat* %176, i32 0, i32 2, !dbg !412
  %177 = load i32* %mrows182, align 4, !dbg !412
  %mul183 = mul nsw i32 0, %177, !dbg !412
  %178 = load %struct.Mat** %p.addr, align 8, !dbg !412
  %mcols184 = getelementptr inbounds %struct.Mat* %178, i32 0, i32 3, !dbg !412
  %179 = load i32* %mcols184, align 4, !dbg !412
  %mul185 = mul nsw i32 %mul183, %179, !dbg !412
  %180 = load %struct.Mat** %p.addr, align 8, !dbg !412
  %mdeps186 = getelementptr inbounds %struct.Mat* %180, i32 0, i32 4, !dbg !412
  %181 = load i32* %mdeps186, align 4, !dbg !412
  %mul187 = mul nsw i32 %mul185, %181, !dbg !412
  %182 = load i32* %i, align 4, !dbg !412
  %sub188 = sub nsw i32 %182, 1, !dbg !412
  %183 = load %struct.Mat** %p.addr, align 8, !dbg !412
  %mcols189 = getelementptr inbounds %struct.Mat* %183, i32 0, i32 3, !dbg !412
  %184 = load i32* %mcols189, align 4, !dbg !412
  %mul190 = mul nsw i32 %sub188, %184, !dbg !412
  %185 = load %struct.Mat** %p.addr, align 8, !dbg !412
  %mdeps191 = getelementptr inbounds %struct.Mat* %185, i32 0, i32 4, !dbg !412
  %186 = load i32* %mdeps191, align 4, !dbg !412
  %mul192 = mul nsw i32 %mul190, %186, !dbg !412
  %add193 = add nsw i32 %mul187, %mul192, !dbg !412
  %187 = load i32* %j, align 4, !dbg !412
  %add194 = add nsw i32 %187, 1, !dbg !412
  %188 = load %struct.Mat** %p.addr, align 8, !dbg !412
  %mdeps195 = getelementptr inbounds %struct.Mat* %188, i32 0, i32 4, !dbg !412
  %189 = load i32* %mdeps195, align 4, !dbg !412
  %mul196 = mul nsw i32 %add194, %189, !dbg !412
  %add197 = add nsw i32 %add193, %mul196, !dbg !412
  %190 = load i32* %k, align 4, !dbg !412
  %add198 = add nsw i32 %add197, %190, !dbg !412
  %idxprom199 = sext i32 %add198 to i64, !dbg !412
  %191 = load %struct.Mat** %p.addr, align 8, !dbg !412
  %m200 = getelementptr inbounds %struct.Mat* %191, i32 0, i32 0, !dbg !412
  %192 = load float** %m200, align 8, !dbg !412
  %arrayidx201 = getelementptr inbounds float* %192, i64 %idxprom199, !dbg !412
  %193 = load float* %arrayidx201, align 4, !dbg !412
  %sub202 = fsub float %sub181, %193, !dbg !410
  %194 = load %struct.Mat** %p.addr, align 8, !dbg !413
  %mrows203 = getelementptr inbounds %struct.Mat* %194, i32 0, i32 2, !dbg !413
  %195 = load i32* %mrows203, align 4, !dbg !413
  %mul204 = mul nsw i32 0, %195, !dbg !413
  %196 = load %struct.Mat** %p.addr, align 8, !dbg !413
  %mcols205 = getelementptr inbounds %struct.Mat* %196, i32 0, i32 3, !dbg !413
  %197 = load i32* %mcols205, align 4, !dbg !413
  %mul206 = mul nsw i32 %mul204, %197, !dbg !413
  %198 = load %struct.Mat** %p.addr, align 8, !dbg !413
  %mdeps207 = getelementptr inbounds %struct.Mat* %198, i32 0, i32 4, !dbg !413
  %199 = load i32* %mdeps207, align 4, !dbg !413
  %mul208 = mul nsw i32 %mul206, %199, !dbg !413
  %200 = load i32* %i, align 4, !dbg !413
  %sub209 = sub nsw i32 %200, 1, !dbg !413
  %201 = load %struct.Mat** %p.addr, align 8, !dbg !413
  %mcols210 = getelementptr inbounds %struct.Mat* %201, i32 0, i32 3, !dbg !413
  %202 = load i32* %mcols210, align 4, !dbg !413
  %mul211 = mul nsw i32 %sub209, %202, !dbg !413
  %203 = load %struct.Mat** %p.addr, align 8, !dbg !413
  %mdeps212 = getelementptr inbounds %struct.Mat* %203, i32 0, i32 4, !dbg !413
  %204 = load i32* %mdeps212, align 4, !dbg !413
  %mul213 = mul nsw i32 %mul211, %204, !dbg !413
  %add214 = add nsw i32 %mul208, %mul213, !dbg !413
  %205 = load i32* %j, align 4, !dbg !413
  %sub215 = sub nsw i32 %205, 1, !dbg !413
  %206 = load %struct.Mat** %p.addr, align 8, !dbg !413
  %mdeps216 = getelementptr inbounds %struct.Mat* %206, i32 0, i32 4, !dbg !413
  %207 = load i32* %mdeps216, align 4, !dbg !413
  %mul217 = mul nsw i32 %sub215, %207, !dbg !413
  %add218 = add nsw i32 %add214, %mul217, !dbg !413
  %208 = load i32* %k, align 4, !dbg !413
  %add219 = add nsw i32 %add218, %208, !dbg !413
  %idxprom220 = sext i32 %add219 to i64, !dbg !413
  %209 = load %struct.Mat** %p.addr, align 8, !dbg !413
  %m221 = getelementptr inbounds %struct.Mat* %209, i32 0, i32 0, !dbg !413
  %210 = load float** %m221, align 8, !dbg !413
  %arrayidx222 = getelementptr inbounds float* %210, i64 %idxprom220, !dbg !413
  %211 = load float* %arrayidx222, align 4, !dbg !413
  %add223 = fadd float %sub202, %211, !dbg !410
  %mul224 = fmul float %139, %add223, !dbg !409
  %add225 = fadd float %add122, %mul224, !dbg !402
  %212 = load %struct.Mat** %b.addr, align 8, !dbg !414
  %mrows226 = getelementptr inbounds %struct.Mat* %212, i32 0, i32 2, !dbg !414
  %213 = load i32* %mrows226, align 4, !dbg !414
  %mul227 = mul nsw i32 1, %213, !dbg !414
  %214 = load %struct.Mat** %b.addr, align 8, !dbg !414
  %mcols228 = getelementptr inbounds %struct.Mat* %214, i32 0, i32 3, !dbg !414
  %215 = load i32* %mcols228, align 4, !dbg !414
  %mul229 = mul nsw i32 %mul227, %215, !dbg !414
  %216 = load %struct.Mat** %b.addr, align 8, !dbg !414
  %mdeps230 = getelementptr inbounds %struct.Mat* %216, i32 0, i32 4, !dbg !414
  %217 = load i32* %mdeps230, align 4, !dbg !414
  %mul231 = mul nsw i32 %mul229, %217, !dbg !414
  %218 = load i32* %i, align 4, !dbg !414
  %219 = load %struct.Mat** %b.addr, align 8, !dbg !414
  %mcols232 = getelementptr inbounds %struct.Mat* %219, i32 0, i32 3, !dbg !414
  %220 = load i32* %mcols232, align 4, !dbg !414
  %mul233 = mul nsw i32 %218, %220, !dbg !414
  %221 = load %struct.Mat** %b.addr, align 8, !dbg !414
  %mdeps234 = getelementptr inbounds %struct.Mat* %221, i32 0, i32 4, !dbg !414
  %222 = load i32* %mdeps234, align 4, !dbg !414
  %mul235 = mul nsw i32 %mul233, %222, !dbg !414
  %add236 = add nsw i32 %mul231, %mul235, !dbg !414
  %223 = load i32* %j, align 4, !dbg !414
  %224 = load %struct.Mat** %b.addr, align 8, !dbg !414
  %mdeps237 = getelementptr inbounds %struct.Mat* %224, i32 0, i32 4, !dbg !414
  %225 = load i32* %mdeps237, align 4, !dbg !414
  %mul238 = mul nsw i32 %223, %225, !dbg !414
  %add239 = add nsw i32 %add236, %mul238, !dbg !414
  %226 = load i32* %k, align 4, !dbg !414
  %add240 = add nsw i32 %add239, %226, !dbg !414
  %idxprom241 = sext i32 %add240 to i64, !dbg !414
  %227 = load %struct.Mat** %b.addr, align 8, !dbg !414
  %m242 = getelementptr inbounds %struct.Mat* %227, i32 0, i32 0, !dbg !414
  %228 = load float** %m242, align 8, !dbg !414
  %arrayidx243 = getelementptr inbounds float* %228, i64 %idxprom241, !dbg !414
  %229 = load float* %arrayidx243, align 4, !dbg !414
  %230 = load %struct.Mat** %p.addr, align 8, !dbg !415
  %mrows244 = getelementptr inbounds %struct.Mat* %230, i32 0, i32 2, !dbg !415
  %231 = load i32* %mrows244, align 4, !dbg !415
  %mul245 = mul nsw i32 0, %231, !dbg !415
  %232 = load %struct.Mat** %p.addr, align 8, !dbg !415
  %mcols246 = getelementptr inbounds %struct.Mat* %232, i32 0, i32 3, !dbg !415
  %233 = load i32* %mcols246, align 4, !dbg !415
  %mul247 = mul nsw i32 %mul245, %233, !dbg !415
  %234 = load %struct.Mat** %p.addr, align 8, !dbg !415
  %mdeps248 = getelementptr inbounds %struct.Mat* %234, i32 0, i32 4, !dbg !415
  %235 = load i32* %mdeps248, align 4, !dbg !415
  %mul249 = mul nsw i32 %mul247, %235, !dbg !415
  %236 = load i32* %i, align 4, !dbg !415
  %237 = load %struct.Mat** %p.addr, align 8, !dbg !415
  %mcols250 = getelementptr inbounds %struct.Mat* %237, i32 0, i32 3, !dbg !415
  %238 = load i32* %mcols250, align 4, !dbg !415
  %mul251 = mul nsw i32 %236, %238, !dbg !415
  %239 = load %struct.Mat** %p.addr, align 8, !dbg !415
  %mdeps252 = getelementptr inbounds %struct.Mat* %239, i32 0, i32 4, !dbg !415
  %240 = load i32* %mdeps252, align 4, !dbg !415
  %mul253 = mul nsw i32 %mul251, %240, !dbg !415
  %add254 = add nsw i32 %mul249, %mul253, !dbg !415
  %241 = load i32* %j, align 4, !dbg !415
  %add255 = add nsw i32 %241, 1, !dbg !415
  %242 = load %struct.Mat** %p.addr, align 8, !dbg !415
  %mdeps256 = getelementptr inbounds %struct.Mat* %242, i32 0, i32 4, !dbg !415
  %243 = load i32* %mdeps256, align 4, !dbg !415
  %mul257 = mul nsw i32 %add255, %243, !dbg !415
  %add258 = add nsw i32 %add254, %mul257, !dbg !415
  %244 = load i32* %k, align 4, !dbg !415
  %add259 = add nsw i32 %244, 1, !dbg !415
  %add260 = add nsw i32 %add258, %add259, !dbg !415
  %idxprom261 = sext i32 %add260 to i64, !dbg !415
  %245 = load %struct.Mat** %p.addr, align 8, !dbg !415
  %m262 = getelementptr inbounds %struct.Mat* %245, i32 0, i32 0, !dbg !415
  %246 = load float** %m262, align 8, !dbg !415
  %arrayidx263 = getelementptr inbounds float* %246, i64 %idxprom261, !dbg !415
  %247 = load float* %arrayidx263, align 4, !dbg !415
  %248 = load %struct.Mat** %p.addr, align 8, !dbg !416
  %mrows264 = getelementptr inbounds %struct.Mat* %248, i32 0, i32 2, !dbg !416
  %249 = load i32* %mrows264, align 4, !dbg !416
  %mul265 = mul nsw i32 0, %249, !dbg !416
  %250 = load %struct.Mat** %p.addr, align 8, !dbg !416
  %mcols266 = getelementptr inbounds %struct.Mat* %250, i32 0, i32 3, !dbg !416
  %251 = load i32* %mcols266, align 4, !dbg !416
  %mul267 = mul nsw i32 %mul265, %251, !dbg !416
  %252 = load %struct.Mat** %p.addr, align 8, !dbg !416
  %mdeps268 = getelementptr inbounds %struct.Mat* %252, i32 0, i32 4, !dbg !416
  %253 = load i32* %mdeps268, align 4, !dbg !416
  %mul269 = mul nsw i32 %mul267, %253, !dbg !416
  %254 = load i32* %i, align 4, !dbg !416
  %255 = load %struct.Mat** %p.addr, align 8, !dbg !416
  %mcols270 = getelementptr inbounds %struct.Mat* %255, i32 0, i32 3, !dbg !416
  %256 = load i32* %mcols270, align 4, !dbg !416
  %mul271 = mul nsw i32 %254, %256, !dbg !416
  %257 = load %struct.Mat** %p.addr, align 8, !dbg !416
  %mdeps272 = getelementptr inbounds %struct.Mat* %257, i32 0, i32 4, !dbg !416
  %258 = load i32* %mdeps272, align 4, !dbg !416
  %mul273 = mul nsw i32 %mul271, %258, !dbg !416
  %add274 = add nsw i32 %mul269, %mul273, !dbg !416
  %259 = load i32* %j, align 4, !dbg !416
  %sub275 = sub nsw i32 %259, 1, !dbg !416
  %260 = load %struct.Mat** %p.addr, align 8, !dbg !416
  %mdeps276 = getelementptr inbounds %struct.Mat* %260, i32 0, i32 4, !dbg !416
  %261 = load i32* %mdeps276, align 4, !dbg !416
  %mul277 = mul nsw i32 %sub275, %261, !dbg !416
  %add278 = add nsw i32 %add274, %mul277, !dbg !416
  %262 = load i32* %k, align 4, !dbg !416
  %add279 = add nsw i32 %262, 1, !dbg !416
  %add280 = add nsw i32 %add278, %add279, !dbg !416
  %idxprom281 = sext i32 %add280 to i64, !dbg !416
  %263 = load %struct.Mat** %p.addr, align 8, !dbg !416
  %m282 = getelementptr inbounds %struct.Mat* %263, i32 0, i32 0, !dbg !416
  %264 = load float** %m282, align 8, !dbg !416
  %arrayidx283 = getelementptr inbounds float* %264, i64 %idxprom281, !dbg !416
  %265 = load float* %arrayidx283, align 4, !dbg !416
  %sub284 = fsub float %247, %265, !dbg !415
  %266 = load %struct.Mat** %p.addr, align 8, !dbg !417
  %mrows285 = getelementptr inbounds %struct.Mat* %266, i32 0, i32 2, !dbg !417
  %267 = load i32* %mrows285, align 4, !dbg !417
  %mul286 = mul nsw i32 0, %267, !dbg !417
  %268 = load %struct.Mat** %p.addr, align 8, !dbg !417
  %mcols287 = getelementptr inbounds %struct.Mat* %268, i32 0, i32 3, !dbg !417
  %269 = load i32* %mcols287, align 4, !dbg !417
  %mul288 = mul nsw i32 %mul286, %269, !dbg !417
  %270 = load %struct.Mat** %p.addr, align 8, !dbg !417
  %mdeps289 = getelementptr inbounds %struct.Mat* %270, i32 0, i32 4, !dbg !417
  %271 = load i32* %mdeps289, align 4, !dbg !417
  %mul290 = mul nsw i32 %mul288, %271, !dbg !417
  %272 = load i32* %i, align 4, !dbg !417
  %273 = load %struct.Mat** %p.addr, align 8, !dbg !417
  %mcols291 = getelementptr inbounds %struct.Mat* %273, i32 0, i32 3, !dbg !417
  %274 = load i32* %mcols291, align 4, !dbg !417
  %mul292 = mul nsw i32 %272, %274, !dbg !417
  %275 = load %struct.Mat** %p.addr, align 8, !dbg !417
  %mdeps293 = getelementptr inbounds %struct.Mat* %275, i32 0, i32 4, !dbg !417
  %276 = load i32* %mdeps293, align 4, !dbg !417
  %mul294 = mul nsw i32 %mul292, %276, !dbg !417
  %add295 = add nsw i32 %mul290, %mul294, !dbg !417
  %277 = load i32* %j, align 4, !dbg !417
  %add296 = add nsw i32 %277, 1, !dbg !417
  %278 = load %struct.Mat** %p.addr, align 8, !dbg !417
  %mdeps297 = getelementptr inbounds %struct.Mat* %278, i32 0, i32 4, !dbg !417
  %279 = load i32* %mdeps297, align 4, !dbg !417
  %mul298 = mul nsw i32 %add296, %279, !dbg !417
  %add299 = add nsw i32 %add295, %mul298, !dbg !417
  %280 = load i32* %k, align 4, !dbg !417
  %sub300 = sub nsw i32 %280, 1, !dbg !417
  %add301 = add nsw i32 %add299, %sub300, !dbg !417
  %idxprom302 = sext i32 %add301 to i64, !dbg !417
  %281 = load %struct.Mat** %p.addr, align 8, !dbg !417
  %m303 = getelementptr inbounds %struct.Mat* %281, i32 0, i32 0, !dbg !417
  %282 = load float** %m303, align 8, !dbg !417
  %arrayidx304 = getelementptr inbounds float* %282, i64 %idxprom302, !dbg !417
  %283 = load float* %arrayidx304, align 4, !dbg !417
  %sub305 = fsub float %sub284, %283, !dbg !415
  %284 = load %struct.Mat** %p.addr, align 8, !dbg !418
  %mrows306 = getelementptr inbounds %struct.Mat* %284, i32 0, i32 2, !dbg !418
  %285 = load i32* %mrows306, align 4, !dbg !418
  %mul307 = mul nsw i32 0, %285, !dbg !418
  %286 = load %struct.Mat** %p.addr, align 8, !dbg !418
  %mcols308 = getelementptr inbounds %struct.Mat* %286, i32 0, i32 3, !dbg !418
  %287 = load i32* %mcols308, align 4, !dbg !418
  %mul309 = mul nsw i32 %mul307, %287, !dbg !418
  %288 = load %struct.Mat** %p.addr, align 8, !dbg !418
  %mdeps310 = getelementptr inbounds %struct.Mat* %288, i32 0, i32 4, !dbg !418
  %289 = load i32* %mdeps310, align 4, !dbg !418
  %mul311 = mul nsw i32 %mul309, %289, !dbg !418
  %290 = load i32* %i, align 4, !dbg !418
  %291 = load %struct.Mat** %p.addr, align 8, !dbg !418
  %mcols312 = getelementptr inbounds %struct.Mat* %291, i32 0, i32 3, !dbg !418
  %292 = load i32* %mcols312, align 4, !dbg !418
  %mul313 = mul nsw i32 %290, %292, !dbg !418
  %293 = load %struct.Mat** %p.addr, align 8, !dbg !418
  %mdeps314 = getelementptr inbounds %struct.Mat* %293, i32 0, i32 4, !dbg !418
  %294 = load i32* %mdeps314, align 4, !dbg !418
  %mul315 = mul nsw i32 %mul313, %294, !dbg !418
  %add316 = add nsw i32 %mul311, %mul315, !dbg !418
  %295 = load i32* %j, align 4, !dbg !418
  %sub317 = sub nsw i32 %295, 1, !dbg !418
  %296 = load %struct.Mat** %p.addr, align 8, !dbg !418
  %mdeps318 = getelementptr inbounds %struct.Mat* %296, i32 0, i32 4, !dbg !418
  %297 = load i32* %mdeps318, align 4, !dbg !418
  %mul319 = mul nsw i32 %sub317, %297, !dbg !418
  %add320 = add nsw i32 %add316, %mul319, !dbg !418
  %298 = load i32* %k, align 4, !dbg !418
  %sub321 = sub nsw i32 %298, 1, !dbg !418
  %add322 = add nsw i32 %add320, %sub321, !dbg !418
  %idxprom323 = sext i32 %add322 to i64, !dbg !418
  %299 = load %struct.Mat** %p.addr, align 8, !dbg !418
  %m324 = getelementptr inbounds %struct.Mat* %299, i32 0, i32 0, !dbg !418
  %300 = load float** %m324, align 8, !dbg !418
  %arrayidx325 = getelementptr inbounds float* %300, i64 %idxprom323, !dbg !418
  %301 = load float* %arrayidx325, align 4, !dbg !418
  %add326 = fadd float %sub305, %301, !dbg !415
  %mul327 = fmul float %229, %add326, !dbg !414
  %add328 = fadd float %add225, %mul327, !dbg !402
  %302 = load %struct.Mat** %b.addr, align 8, !dbg !419
  %mrows329 = getelementptr inbounds %struct.Mat* %302, i32 0, i32 2, !dbg !419
  %303 = load i32* %mrows329, align 4, !dbg !419
  %mul330 = mul nsw i32 2, %303, !dbg !419
  %304 = load %struct.Mat** %b.addr, align 8, !dbg !419
  %mcols331 = getelementptr inbounds %struct.Mat* %304, i32 0, i32 3, !dbg !419
  %305 = load i32* %mcols331, align 4, !dbg !419
  %mul332 = mul nsw i32 %mul330, %305, !dbg !419
  %306 = load %struct.Mat** %b.addr, align 8, !dbg !419
  %mdeps333 = getelementptr inbounds %struct.Mat* %306, i32 0, i32 4, !dbg !419
  %307 = load i32* %mdeps333, align 4, !dbg !419
  %mul334 = mul nsw i32 %mul332, %307, !dbg !419
  %308 = load i32* %i, align 4, !dbg !419
  %309 = load %struct.Mat** %b.addr, align 8, !dbg !419
  %mcols335 = getelementptr inbounds %struct.Mat* %309, i32 0, i32 3, !dbg !419
  %310 = load i32* %mcols335, align 4, !dbg !419
  %mul336 = mul nsw i32 %308, %310, !dbg !419
  %311 = load %struct.Mat** %b.addr, align 8, !dbg !419
  %mdeps337 = getelementptr inbounds %struct.Mat* %311, i32 0, i32 4, !dbg !419
  %312 = load i32* %mdeps337, align 4, !dbg !419
  %mul338 = mul nsw i32 %mul336, %312, !dbg !419
  %add339 = add nsw i32 %mul334, %mul338, !dbg !419
  %313 = load i32* %j, align 4, !dbg !419
  %314 = load %struct.Mat** %b.addr, align 8, !dbg !419
  %mdeps340 = getelementptr inbounds %struct.Mat* %314, i32 0, i32 4, !dbg !419
  %315 = load i32* %mdeps340, align 4, !dbg !419
  %mul341 = mul nsw i32 %313, %315, !dbg !419
  %add342 = add nsw i32 %add339, %mul341, !dbg !419
  %316 = load i32* %k, align 4, !dbg !419
  %add343 = add nsw i32 %add342, %316, !dbg !419
  %idxprom344 = sext i32 %add343 to i64, !dbg !419
  %317 = load %struct.Mat** %b.addr, align 8, !dbg !419
  %m345 = getelementptr inbounds %struct.Mat* %317, i32 0, i32 0, !dbg !419
  %318 = load float** %m345, align 8, !dbg !419
  %arrayidx346 = getelementptr inbounds float* %318, i64 %idxprom344, !dbg !419
  %319 = load float* %arrayidx346, align 4, !dbg !419
  %320 = load %struct.Mat** %p.addr, align 8, !dbg !420
  %mrows347 = getelementptr inbounds %struct.Mat* %320, i32 0, i32 2, !dbg !420
  %321 = load i32* %mrows347, align 4, !dbg !420
  %mul348 = mul nsw i32 0, %321, !dbg !420
  %322 = load %struct.Mat** %p.addr, align 8, !dbg !420
  %mcols349 = getelementptr inbounds %struct.Mat* %322, i32 0, i32 3, !dbg !420
  %323 = load i32* %mcols349, align 4, !dbg !420
  %mul350 = mul nsw i32 %mul348, %323, !dbg !420
  %324 = load %struct.Mat** %p.addr, align 8, !dbg !420
  %mdeps351 = getelementptr inbounds %struct.Mat* %324, i32 0, i32 4, !dbg !420
  %325 = load i32* %mdeps351, align 4, !dbg !420
  %mul352 = mul nsw i32 %mul350, %325, !dbg !420
  %326 = load i32* %i, align 4, !dbg !420
  %add353 = add nsw i32 %326, 1, !dbg !420
  %327 = load %struct.Mat** %p.addr, align 8, !dbg !420
  %mcols354 = getelementptr inbounds %struct.Mat* %327, i32 0, i32 3, !dbg !420
  %328 = load i32* %mcols354, align 4, !dbg !420
  %mul355 = mul nsw i32 %add353, %328, !dbg !420
  %329 = load %struct.Mat** %p.addr, align 8, !dbg !420
  %mdeps356 = getelementptr inbounds %struct.Mat* %329, i32 0, i32 4, !dbg !420
  %330 = load i32* %mdeps356, align 4, !dbg !420
  %mul357 = mul nsw i32 %mul355, %330, !dbg !420
  %add358 = add nsw i32 %mul352, %mul357, !dbg !420
  %331 = load i32* %j, align 4, !dbg !420
  %332 = load %struct.Mat** %p.addr, align 8, !dbg !420
  %mdeps359 = getelementptr inbounds %struct.Mat* %332, i32 0, i32 4, !dbg !420
  %333 = load i32* %mdeps359, align 4, !dbg !420
  %mul360 = mul nsw i32 %331, %333, !dbg !420
  %add361 = add nsw i32 %add358, %mul360, !dbg !420
  %334 = load i32* %k, align 4, !dbg !420
  %add362 = add nsw i32 %334, 1, !dbg !420
  %add363 = add nsw i32 %add361, %add362, !dbg !420
  %idxprom364 = sext i32 %add363 to i64, !dbg !420
  %335 = load %struct.Mat** %p.addr, align 8, !dbg !420
  %m365 = getelementptr inbounds %struct.Mat* %335, i32 0, i32 0, !dbg !420
  %336 = load float** %m365, align 8, !dbg !420
  %arrayidx366 = getelementptr inbounds float* %336, i64 %idxprom364, !dbg !420
  %337 = load float* %arrayidx366, align 4, !dbg !420
  %338 = load %struct.Mat** %p.addr, align 8, !dbg !421
  %mrows367 = getelementptr inbounds %struct.Mat* %338, i32 0, i32 2, !dbg !421
  %339 = load i32* %mrows367, align 4, !dbg !421
  %mul368 = mul nsw i32 0, %339, !dbg !421
  %340 = load %struct.Mat** %p.addr, align 8, !dbg !421
  %mcols369 = getelementptr inbounds %struct.Mat* %340, i32 0, i32 3, !dbg !421
  %341 = load i32* %mcols369, align 4, !dbg !421
  %mul370 = mul nsw i32 %mul368, %341, !dbg !421
  %342 = load %struct.Mat** %p.addr, align 8, !dbg !421
  %mdeps371 = getelementptr inbounds %struct.Mat* %342, i32 0, i32 4, !dbg !421
  %343 = load i32* %mdeps371, align 4, !dbg !421
  %mul372 = mul nsw i32 %mul370, %343, !dbg !421
  %344 = load i32* %i, align 4, !dbg !421
  %sub373 = sub nsw i32 %344, 1, !dbg !421
  %345 = load %struct.Mat** %p.addr, align 8, !dbg !421
  %mcols374 = getelementptr inbounds %struct.Mat* %345, i32 0, i32 3, !dbg !421
  %346 = load i32* %mcols374, align 4, !dbg !421
  %mul375 = mul nsw i32 %sub373, %346, !dbg !421
  %347 = load %struct.Mat** %p.addr, align 8, !dbg !421
  %mdeps376 = getelementptr inbounds %struct.Mat* %347, i32 0, i32 4, !dbg !421
  %348 = load i32* %mdeps376, align 4, !dbg !421
  %mul377 = mul nsw i32 %mul375, %348, !dbg !421
  %add378 = add nsw i32 %mul372, %mul377, !dbg !421
  %349 = load i32* %j, align 4, !dbg !421
  %350 = load %struct.Mat** %p.addr, align 8, !dbg !421
  %mdeps379 = getelementptr inbounds %struct.Mat* %350, i32 0, i32 4, !dbg !421
  %351 = load i32* %mdeps379, align 4, !dbg !421
  %mul380 = mul nsw i32 %349, %351, !dbg !421
  %add381 = add nsw i32 %add378, %mul380, !dbg !421
  %352 = load i32* %k, align 4, !dbg !421
  %add382 = add nsw i32 %352, 1, !dbg !421
  %add383 = add nsw i32 %add381, %add382, !dbg !421
  %idxprom384 = sext i32 %add383 to i64, !dbg !421
  %353 = load %struct.Mat** %p.addr, align 8, !dbg !421
  %m385 = getelementptr inbounds %struct.Mat* %353, i32 0, i32 0, !dbg !421
  %354 = load float** %m385, align 8, !dbg !421
  %arrayidx386 = getelementptr inbounds float* %354, i64 %idxprom384, !dbg !421
  %355 = load float* %arrayidx386, align 4, !dbg !421
  %sub387 = fsub float %337, %355, !dbg !420
  %356 = load %struct.Mat** %p.addr, align 8, !dbg !422
  %mrows388 = getelementptr inbounds %struct.Mat* %356, i32 0, i32 2, !dbg !422
  %357 = load i32* %mrows388, align 4, !dbg !422
  %mul389 = mul nsw i32 0, %357, !dbg !422
  %358 = load %struct.Mat** %p.addr, align 8, !dbg !422
  %mcols390 = getelementptr inbounds %struct.Mat* %358, i32 0, i32 3, !dbg !422
  %359 = load i32* %mcols390, align 4, !dbg !422
  %mul391 = mul nsw i32 %mul389, %359, !dbg !422
  %360 = load %struct.Mat** %p.addr, align 8, !dbg !422
  %mdeps392 = getelementptr inbounds %struct.Mat* %360, i32 0, i32 4, !dbg !422
  %361 = load i32* %mdeps392, align 4, !dbg !422
  %mul393 = mul nsw i32 %mul391, %361, !dbg !422
  %362 = load i32* %i, align 4, !dbg !422
  %add394 = add nsw i32 %362, 1, !dbg !422
  %363 = load %struct.Mat** %p.addr, align 8, !dbg !422
  %mcols395 = getelementptr inbounds %struct.Mat* %363, i32 0, i32 3, !dbg !422
  %364 = load i32* %mcols395, align 4, !dbg !422
  %mul396 = mul nsw i32 %add394, %364, !dbg !422
  %365 = load %struct.Mat** %p.addr, align 8, !dbg !422
  %mdeps397 = getelementptr inbounds %struct.Mat* %365, i32 0, i32 4, !dbg !422
  %366 = load i32* %mdeps397, align 4, !dbg !422
  %mul398 = mul nsw i32 %mul396, %366, !dbg !422
  %add399 = add nsw i32 %mul393, %mul398, !dbg !422
  %367 = load i32* %j, align 4, !dbg !422
  %368 = load %struct.Mat** %p.addr, align 8, !dbg !422
  %mdeps400 = getelementptr inbounds %struct.Mat* %368, i32 0, i32 4, !dbg !422
  %369 = load i32* %mdeps400, align 4, !dbg !422
  %mul401 = mul nsw i32 %367, %369, !dbg !422
  %add402 = add nsw i32 %add399, %mul401, !dbg !422
  %370 = load i32* %k, align 4, !dbg !422
  %sub403 = sub nsw i32 %370, 1, !dbg !422
  %add404 = add nsw i32 %add402, %sub403, !dbg !422
  %idxprom405 = sext i32 %add404 to i64, !dbg !422
  %371 = load %struct.Mat** %p.addr, align 8, !dbg !422
  %m406 = getelementptr inbounds %struct.Mat* %371, i32 0, i32 0, !dbg !422
  %372 = load float** %m406, align 8, !dbg !422
  %arrayidx407 = getelementptr inbounds float* %372, i64 %idxprom405, !dbg !422
  %373 = load float* %arrayidx407, align 4, !dbg !422
  %sub408 = fsub float %sub387, %373, !dbg !420
  %374 = load %struct.Mat** %p.addr, align 8, !dbg !423
  %mrows409 = getelementptr inbounds %struct.Mat* %374, i32 0, i32 2, !dbg !423
  %375 = load i32* %mrows409, align 4, !dbg !423
  %mul410 = mul nsw i32 0, %375, !dbg !423
  %376 = load %struct.Mat** %p.addr, align 8, !dbg !423
  %mcols411 = getelementptr inbounds %struct.Mat* %376, i32 0, i32 3, !dbg !423
  %377 = load i32* %mcols411, align 4, !dbg !423
  %mul412 = mul nsw i32 %mul410, %377, !dbg !423
  %378 = load %struct.Mat** %p.addr, align 8, !dbg !423
  %mdeps413 = getelementptr inbounds %struct.Mat* %378, i32 0, i32 4, !dbg !423
  %379 = load i32* %mdeps413, align 4, !dbg !423
  %mul414 = mul nsw i32 %mul412, %379, !dbg !423
  %380 = load i32* %i, align 4, !dbg !423
  %sub415 = sub nsw i32 %380, 1, !dbg !423
  %381 = load %struct.Mat** %p.addr, align 8, !dbg !423
  %mcols416 = getelementptr inbounds %struct.Mat* %381, i32 0, i32 3, !dbg !423
  %382 = load i32* %mcols416, align 4, !dbg !423
  %mul417 = mul nsw i32 %sub415, %382, !dbg !423
  %383 = load %struct.Mat** %p.addr, align 8, !dbg !423
  %mdeps418 = getelementptr inbounds %struct.Mat* %383, i32 0, i32 4, !dbg !423
  %384 = load i32* %mdeps418, align 4, !dbg !423
  %mul419 = mul nsw i32 %mul417, %384, !dbg !423
  %add420 = add nsw i32 %mul414, %mul419, !dbg !423
  %385 = load i32* %j, align 4, !dbg !423
  %386 = load %struct.Mat** %p.addr, align 8, !dbg !423
  %mdeps421 = getelementptr inbounds %struct.Mat* %386, i32 0, i32 4, !dbg !423
  %387 = load i32* %mdeps421, align 4, !dbg !423
  %mul422 = mul nsw i32 %385, %387, !dbg !423
  %add423 = add nsw i32 %add420, %mul422, !dbg !423
  %388 = load i32* %k, align 4, !dbg !423
  %sub424 = sub nsw i32 %388, 1, !dbg !423
  %add425 = add nsw i32 %add423, %sub424, !dbg !423
  %idxprom426 = sext i32 %add425 to i64, !dbg !423
  %389 = load %struct.Mat** %p.addr, align 8, !dbg !423
  %m427 = getelementptr inbounds %struct.Mat* %389, i32 0, i32 0, !dbg !423
  %390 = load float** %m427, align 8, !dbg !423
  %arrayidx428 = getelementptr inbounds float* %390, i64 %idxprom426, !dbg !423
  %391 = load float* %arrayidx428, align 4, !dbg !423
  %add429 = fadd float %sub408, %391, !dbg !420
  %mul430 = fmul float %319, %add429, !dbg !419
  %add431 = fadd float %add328, %mul430, !dbg !402
  %392 = load %struct.Mat** %c.addr, align 8, !dbg !424
  %mrows432 = getelementptr inbounds %struct.Mat* %392, i32 0, i32 2, !dbg !424
  %393 = load i32* %mrows432, align 4, !dbg !424
  %mul433 = mul nsw i32 0, %393, !dbg !424
  %394 = load %struct.Mat** %c.addr, align 8, !dbg !424
  %mcols434 = getelementptr inbounds %struct.Mat* %394, i32 0, i32 3, !dbg !424
  %395 = load i32* %mcols434, align 4, !dbg !424
  %mul435 = mul nsw i32 %mul433, %395, !dbg !424
  %396 = load %struct.Mat** %c.addr, align 8, !dbg !424
  %mdeps436 = getelementptr inbounds %struct.Mat* %396, i32 0, i32 4, !dbg !424
  %397 = load i32* %mdeps436, align 4, !dbg !424
  %mul437 = mul nsw i32 %mul435, %397, !dbg !424
  %398 = load i32* %i, align 4, !dbg !424
  %399 = load %struct.Mat** %c.addr, align 8, !dbg !424
  %mcols438 = getelementptr inbounds %struct.Mat* %399, i32 0, i32 3, !dbg !424
  %400 = load i32* %mcols438, align 4, !dbg !424
  %mul439 = mul nsw i32 %398, %400, !dbg !424
  %401 = load %struct.Mat** %c.addr, align 8, !dbg !424
  %mdeps440 = getelementptr inbounds %struct.Mat* %401, i32 0, i32 4, !dbg !424
  %402 = load i32* %mdeps440, align 4, !dbg !424
  %mul441 = mul nsw i32 %mul439, %402, !dbg !424
  %add442 = add nsw i32 %mul437, %mul441, !dbg !424
  %403 = load i32* %j, align 4, !dbg !424
  %404 = load %struct.Mat** %c.addr, align 8, !dbg !424
  %mdeps443 = getelementptr inbounds %struct.Mat* %404, i32 0, i32 4, !dbg !424
  %405 = load i32* %mdeps443, align 4, !dbg !424
  %mul444 = mul nsw i32 %403, %405, !dbg !424
  %add445 = add nsw i32 %add442, %mul444, !dbg !424
  %406 = load i32* %k, align 4, !dbg !424
  %add446 = add nsw i32 %add445, %406, !dbg !424
  %idxprom447 = sext i32 %add446 to i64, !dbg !424
  %407 = load %struct.Mat** %c.addr, align 8, !dbg !424
  %m448 = getelementptr inbounds %struct.Mat* %407, i32 0, i32 0, !dbg !424
  %408 = load float** %m448, align 8, !dbg !424
  %arrayidx449 = getelementptr inbounds float* %408, i64 %idxprom447, !dbg !424
  %409 = load float* %arrayidx449, align 4, !dbg !424
  %410 = load %struct.Mat** %p.addr, align 8, !dbg !425
  %mrows450 = getelementptr inbounds %struct.Mat* %410, i32 0, i32 2, !dbg !425
  %411 = load i32* %mrows450, align 4, !dbg !425
  %mul451 = mul nsw i32 0, %411, !dbg !425
  %412 = load %struct.Mat** %p.addr, align 8, !dbg !425
  %mcols452 = getelementptr inbounds %struct.Mat* %412, i32 0, i32 3, !dbg !425
  %413 = load i32* %mcols452, align 4, !dbg !425
  %mul453 = mul nsw i32 %mul451, %413, !dbg !425
  %414 = load %struct.Mat** %p.addr, align 8, !dbg !425
  %mdeps454 = getelementptr inbounds %struct.Mat* %414, i32 0, i32 4, !dbg !425
  %415 = load i32* %mdeps454, align 4, !dbg !425
  %mul455 = mul nsw i32 %mul453, %415, !dbg !425
  %416 = load i32* %i, align 4, !dbg !425
  %sub456 = sub nsw i32 %416, 1, !dbg !425
  %417 = load %struct.Mat** %p.addr, align 8, !dbg !425
  %mcols457 = getelementptr inbounds %struct.Mat* %417, i32 0, i32 3, !dbg !425
  %418 = load i32* %mcols457, align 4, !dbg !425
  %mul458 = mul nsw i32 %sub456, %418, !dbg !425
  %419 = load %struct.Mat** %p.addr, align 8, !dbg !425
  %mdeps459 = getelementptr inbounds %struct.Mat* %419, i32 0, i32 4, !dbg !425
  %420 = load i32* %mdeps459, align 4, !dbg !425
  %mul460 = mul nsw i32 %mul458, %420, !dbg !425
  %add461 = add nsw i32 %mul455, %mul460, !dbg !425
  %421 = load i32* %j, align 4, !dbg !425
  %422 = load %struct.Mat** %p.addr, align 8, !dbg !425
  %mdeps462 = getelementptr inbounds %struct.Mat* %422, i32 0, i32 4, !dbg !425
  %423 = load i32* %mdeps462, align 4, !dbg !425
  %mul463 = mul nsw i32 %421, %423, !dbg !425
  %add464 = add nsw i32 %add461, %mul463, !dbg !425
  %424 = load i32* %k, align 4, !dbg !425
  %add465 = add nsw i32 %add464, %424, !dbg !425
  %idxprom466 = sext i32 %add465 to i64, !dbg !425
  %425 = load %struct.Mat** %p.addr, align 8, !dbg !425
  %m467 = getelementptr inbounds %struct.Mat* %425, i32 0, i32 0, !dbg !425
  %426 = load float** %m467, align 8, !dbg !425
  %arrayidx468 = getelementptr inbounds float* %426, i64 %idxprom466, !dbg !425
  %427 = load float* %arrayidx468, align 4, !dbg !425
  %mul469 = fmul float %409, %427, !dbg !424
  %add470 = fadd float %add431, %mul469, !dbg !402
  %428 = load %struct.Mat** %c.addr, align 8, !dbg !426
  %mrows471 = getelementptr inbounds %struct.Mat* %428, i32 0, i32 2, !dbg !426
  %429 = load i32* %mrows471, align 4, !dbg !426
  %mul472 = mul nsw i32 1, %429, !dbg !426
  %430 = load %struct.Mat** %c.addr, align 8, !dbg !426
  %mcols473 = getelementptr inbounds %struct.Mat* %430, i32 0, i32 3, !dbg !426
  %431 = load i32* %mcols473, align 4, !dbg !426
  %mul474 = mul nsw i32 %mul472, %431, !dbg !426
  %432 = load %struct.Mat** %c.addr, align 8, !dbg !426
  %mdeps475 = getelementptr inbounds %struct.Mat* %432, i32 0, i32 4, !dbg !426
  %433 = load i32* %mdeps475, align 4, !dbg !426
  %mul476 = mul nsw i32 %mul474, %433, !dbg !426
  %434 = load i32* %i, align 4, !dbg !426
  %435 = load %struct.Mat** %c.addr, align 8, !dbg !426
  %mcols477 = getelementptr inbounds %struct.Mat* %435, i32 0, i32 3, !dbg !426
  %436 = load i32* %mcols477, align 4, !dbg !426
  %mul478 = mul nsw i32 %434, %436, !dbg !426
  %437 = load %struct.Mat** %c.addr, align 8, !dbg !426
  %mdeps479 = getelementptr inbounds %struct.Mat* %437, i32 0, i32 4, !dbg !426
  %438 = load i32* %mdeps479, align 4, !dbg !426
  %mul480 = mul nsw i32 %mul478, %438, !dbg !426
  %add481 = add nsw i32 %mul476, %mul480, !dbg !426
  %439 = load i32* %j, align 4, !dbg !426
  %440 = load %struct.Mat** %c.addr, align 8, !dbg !426
  %mdeps482 = getelementptr inbounds %struct.Mat* %440, i32 0, i32 4, !dbg !426
  %441 = load i32* %mdeps482, align 4, !dbg !426
  %mul483 = mul nsw i32 %439, %441, !dbg !426
  %add484 = add nsw i32 %add481, %mul483, !dbg !426
  %442 = load i32* %k, align 4, !dbg !426
  %add485 = add nsw i32 %add484, %442, !dbg !426
  %idxprom486 = sext i32 %add485 to i64, !dbg !426
  %443 = load %struct.Mat** %c.addr, align 8, !dbg !426
  %m487 = getelementptr inbounds %struct.Mat* %443, i32 0, i32 0, !dbg !426
  %444 = load float** %m487, align 8, !dbg !426
  %arrayidx488 = getelementptr inbounds float* %444, i64 %idxprom486, !dbg !426
  %445 = load float* %arrayidx488, align 4, !dbg !426
  %446 = load %struct.Mat** %p.addr, align 8, !dbg !427
  %mrows489 = getelementptr inbounds %struct.Mat* %446, i32 0, i32 2, !dbg !427
  %447 = load i32* %mrows489, align 4, !dbg !427
  %mul490 = mul nsw i32 0, %447, !dbg !427
  %448 = load %struct.Mat** %p.addr, align 8, !dbg !427
  %mcols491 = getelementptr inbounds %struct.Mat* %448, i32 0, i32 3, !dbg !427
  %449 = load i32* %mcols491, align 4, !dbg !427
  %mul492 = mul nsw i32 %mul490, %449, !dbg !427
  %450 = load %struct.Mat** %p.addr, align 8, !dbg !427
  %mdeps493 = getelementptr inbounds %struct.Mat* %450, i32 0, i32 4, !dbg !427
  %451 = load i32* %mdeps493, align 4, !dbg !427
  %mul494 = mul nsw i32 %mul492, %451, !dbg !427
  %452 = load i32* %i, align 4, !dbg !427
  %453 = load %struct.Mat** %p.addr, align 8, !dbg !427
  %mcols495 = getelementptr inbounds %struct.Mat* %453, i32 0, i32 3, !dbg !427
  %454 = load i32* %mcols495, align 4, !dbg !427
  %mul496 = mul nsw i32 %452, %454, !dbg !427
  %455 = load %struct.Mat** %p.addr, align 8, !dbg !427
  %mdeps497 = getelementptr inbounds %struct.Mat* %455, i32 0, i32 4, !dbg !427
  %456 = load i32* %mdeps497, align 4, !dbg !427
  %mul498 = mul nsw i32 %mul496, %456, !dbg !427
  %add499 = add nsw i32 %mul494, %mul498, !dbg !427
  %457 = load i32* %j, align 4, !dbg !427
  %sub500 = sub nsw i32 %457, 1, !dbg !427
  %458 = load %struct.Mat** %p.addr, align 8, !dbg !427
  %mdeps501 = getelementptr inbounds %struct.Mat* %458, i32 0, i32 4, !dbg !427
  %459 = load i32* %mdeps501, align 4, !dbg !427
  %mul502 = mul nsw i32 %sub500, %459, !dbg !427
  %add503 = add nsw i32 %add499, %mul502, !dbg !427
  %460 = load i32* %k, align 4, !dbg !427
  %add504 = add nsw i32 %add503, %460, !dbg !427
  %idxprom505 = sext i32 %add504 to i64, !dbg !427
  %461 = load %struct.Mat** %p.addr, align 8, !dbg !427
  %m506 = getelementptr inbounds %struct.Mat* %461, i32 0, i32 0, !dbg !427
  %462 = load float** %m506, align 8, !dbg !427
  %arrayidx507 = getelementptr inbounds float* %462, i64 %idxprom505, !dbg !427
  %463 = load float* %arrayidx507, align 4, !dbg !427
  %mul508 = fmul float %445, %463, !dbg !426
  %add509 = fadd float %add470, %mul508, !dbg !402
  %464 = load %struct.Mat** %c.addr, align 8, !dbg !428
  %mrows510 = getelementptr inbounds %struct.Mat* %464, i32 0, i32 2, !dbg !428
  %465 = load i32* %mrows510, align 4, !dbg !428
  %mul511 = mul nsw i32 2, %465, !dbg !428
  %466 = load %struct.Mat** %c.addr, align 8, !dbg !428
  %mcols512 = getelementptr inbounds %struct.Mat* %466, i32 0, i32 3, !dbg !428
  %467 = load i32* %mcols512, align 4, !dbg !428
  %mul513 = mul nsw i32 %mul511, %467, !dbg !428
  %468 = load %struct.Mat** %c.addr, align 8, !dbg !428
  %mdeps514 = getelementptr inbounds %struct.Mat* %468, i32 0, i32 4, !dbg !428
  %469 = load i32* %mdeps514, align 4, !dbg !428
  %mul515 = mul nsw i32 %mul513, %469, !dbg !428
  %470 = load i32* %i, align 4, !dbg !428
  %471 = load %struct.Mat** %c.addr, align 8, !dbg !428
  %mcols516 = getelementptr inbounds %struct.Mat* %471, i32 0, i32 3, !dbg !428
  %472 = load i32* %mcols516, align 4, !dbg !428
  %mul517 = mul nsw i32 %470, %472, !dbg !428
  %473 = load %struct.Mat** %c.addr, align 8, !dbg !428
  %mdeps518 = getelementptr inbounds %struct.Mat* %473, i32 0, i32 4, !dbg !428
  %474 = load i32* %mdeps518, align 4, !dbg !428
  %mul519 = mul nsw i32 %mul517, %474, !dbg !428
  %add520 = add nsw i32 %mul515, %mul519, !dbg !428
  %475 = load i32* %j, align 4, !dbg !428
  %476 = load %struct.Mat** %c.addr, align 8, !dbg !428
  %mdeps521 = getelementptr inbounds %struct.Mat* %476, i32 0, i32 4, !dbg !428
  %477 = load i32* %mdeps521, align 4, !dbg !428
  %mul522 = mul nsw i32 %475, %477, !dbg !428
  %add523 = add nsw i32 %add520, %mul522, !dbg !428
  %478 = load i32* %k, align 4, !dbg !428
  %add524 = add nsw i32 %add523, %478, !dbg !428
  %idxprom525 = sext i32 %add524 to i64, !dbg !428
  %479 = load %struct.Mat** %c.addr, align 8, !dbg !428
  %m526 = getelementptr inbounds %struct.Mat* %479, i32 0, i32 0, !dbg !428
  %480 = load float** %m526, align 8, !dbg !428
  %arrayidx527 = getelementptr inbounds float* %480, i64 %idxprom525, !dbg !428
  %481 = load float* %arrayidx527, align 4, !dbg !428
  %482 = load %struct.Mat** %p.addr, align 8, !dbg !429
  %mrows528 = getelementptr inbounds %struct.Mat* %482, i32 0, i32 2, !dbg !429
  %483 = load i32* %mrows528, align 4, !dbg !429
  %mul529 = mul nsw i32 0, %483, !dbg !429
  %484 = load %struct.Mat** %p.addr, align 8, !dbg !429
  %mcols530 = getelementptr inbounds %struct.Mat* %484, i32 0, i32 3, !dbg !429
  %485 = load i32* %mcols530, align 4, !dbg !429
  %mul531 = mul nsw i32 %mul529, %485, !dbg !429
  %486 = load %struct.Mat** %p.addr, align 8, !dbg !429
  %mdeps532 = getelementptr inbounds %struct.Mat* %486, i32 0, i32 4, !dbg !429
  %487 = load i32* %mdeps532, align 4, !dbg !429
  %mul533 = mul nsw i32 %mul531, %487, !dbg !429
  %488 = load i32* %i, align 4, !dbg !429
  %489 = load %struct.Mat** %p.addr, align 8, !dbg !429
  %mcols534 = getelementptr inbounds %struct.Mat* %489, i32 0, i32 3, !dbg !429
  %490 = load i32* %mcols534, align 4, !dbg !429
  %mul535 = mul nsw i32 %488, %490, !dbg !429
  %491 = load %struct.Mat** %p.addr, align 8, !dbg !429
  %mdeps536 = getelementptr inbounds %struct.Mat* %491, i32 0, i32 4, !dbg !429
  %492 = load i32* %mdeps536, align 4, !dbg !429
  %mul537 = mul nsw i32 %mul535, %492, !dbg !429
  %add538 = add nsw i32 %mul533, %mul537, !dbg !429
  %493 = load i32* %j, align 4, !dbg !429
  %494 = load %struct.Mat** %p.addr, align 8, !dbg !429
  %mdeps539 = getelementptr inbounds %struct.Mat* %494, i32 0, i32 4, !dbg !429
  %495 = load i32* %mdeps539, align 4, !dbg !429
  %mul540 = mul nsw i32 %493, %495, !dbg !429
  %add541 = add nsw i32 %add538, %mul540, !dbg !429
  %496 = load i32* %k, align 4, !dbg !429
  %sub542 = sub nsw i32 %496, 1, !dbg !429
  %add543 = add nsw i32 %add541, %sub542, !dbg !429
  %idxprom544 = sext i32 %add543 to i64, !dbg !429
  %497 = load %struct.Mat** %p.addr, align 8, !dbg !429
  %m545 = getelementptr inbounds %struct.Mat* %497, i32 0, i32 0, !dbg !429
  %498 = load float** %m545, align 8, !dbg !429
  %arrayidx546 = getelementptr inbounds float* %498, i64 %idxprom544, !dbg !429
  %499 = load float* %arrayidx546, align 4, !dbg !429
  %mul547 = fmul float %481, %499, !dbg !428
  %add548 = fadd float %add509, %mul547, !dbg !402
  %500 = load %struct.Mat** %wrk1.addr, align 8, !dbg !430
  %mrows549 = getelementptr inbounds %struct.Mat* %500, i32 0, i32 2, !dbg !430
  %501 = load i32* %mrows549, align 4, !dbg !430
  %mul550 = mul nsw i32 0, %501, !dbg !430
  %502 = load %struct.Mat** %wrk1.addr, align 8, !dbg !430
  %mcols551 = getelementptr inbounds %struct.Mat* %502, i32 0, i32 3, !dbg !430
  %503 = load i32* %mcols551, align 4, !dbg !430
  %mul552 = mul nsw i32 %mul550, %503, !dbg !430
  %504 = load %struct.Mat** %wrk1.addr, align 8, !dbg !430
  %mdeps553 = getelementptr inbounds %struct.Mat* %504, i32 0, i32 4, !dbg !430
  %505 = load i32* %mdeps553, align 4, !dbg !430
  %mul554 = mul nsw i32 %mul552, %505, !dbg !430
  %506 = load i32* %i, align 4, !dbg !430
  %507 = load %struct.Mat** %wrk1.addr, align 8, !dbg !430
  %mcols555 = getelementptr inbounds %struct.Mat* %507, i32 0, i32 3, !dbg !430
  %508 = load i32* %mcols555, align 4, !dbg !430
  %mul556 = mul nsw i32 %506, %508, !dbg !430
  %509 = load %struct.Mat** %wrk1.addr, align 8, !dbg !430
  %mdeps557 = getelementptr inbounds %struct.Mat* %509, i32 0, i32 4, !dbg !430
  %510 = load i32* %mdeps557, align 4, !dbg !430
  %mul558 = mul nsw i32 %mul556, %510, !dbg !430
  %add559 = add nsw i32 %mul554, %mul558, !dbg !430
  %511 = load i32* %j, align 4, !dbg !430
  %512 = load %struct.Mat** %wrk1.addr, align 8, !dbg !430
  %mdeps560 = getelementptr inbounds %struct.Mat* %512, i32 0, i32 4, !dbg !430
  %513 = load i32* %mdeps560, align 4, !dbg !430
  %mul561 = mul nsw i32 %511, %513, !dbg !430
  %add562 = add nsw i32 %add559, %mul561, !dbg !430
  %514 = load i32* %k, align 4, !dbg !430
  %add563 = add nsw i32 %add562, %514, !dbg !430
  %idxprom564 = sext i32 %add563 to i64, !dbg !430
  %515 = load %struct.Mat** %wrk1.addr, align 8, !dbg !430
  %m565 = getelementptr inbounds %struct.Mat* %515, i32 0, i32 0, !dbg !430
  %516 = load float** %m565, align 8, !dbg !430
  %arrayidx566 = getelementptr inbounds float* %516, i64 %idxprom564, !dbg !430
  %517 = load float* %arrayidx566, align 4, !dbg !430
  %add567 = fadd float %add548, %517, !dbg !402
  store float %add567, float* %s0, align 4, !dbg !431
  %518 = load float* %s0, align 4, !dbg !432
  %519 = load %struct.Mat** %a.addr, align 8, !dbg !433
  %mrows568 = getelementptr inbounds %struct.Mat* %519, i32 0, i32 2, !dbg !433
  %520 = load i32* %mrows568, align 4, !dbg !433
  %mul569 = mul nsw i32 3, %520, !dbg !433
  %521 = load %struct.Mat** %a.addr, align 8, !dbg !433
  %mcols570 = getelementptr inbounds %struct.Mat* %521, i32 0, i32 3, !dbg !433
  %522 = load i32* %mcols570, align 4, !dbg !433
  %mul571 = mul nsw i32 %mul569, %522, !dbg !433
  %523 = load %struct.Mat** %a.addr, align 8, !dbg !433
  %mdeps572 = getelementptr inbounds %struct.Mat* %523, i32 0, i32 4, !dbg !433
  %524 = load i32* %mdeps572, align 4, !dbg !433
  %mul573 = mul nsw i32 %mul571, %524, !dbg !433
  %525 = load i32* %i, align 4, !dbg !433
  %526 = load %struct.Mat** %a.addr, align 8, !dbg !433
  %mcols574 = getelementptr inbounds %struct.Mat* %526, i32 0, i32 3, !dbg !433
  %527 = load i32* %mcols574, align 4, !dbg !433
  %mul575 = mul nsw i32 %525, %527, !dbg !433
  %528 = load %struct.Mat** %a.addr, align 8, !dbg !433
  %mdeps576 = getelementptr inbounds %struct.Mat* %528, i32 0, i32 4, !dbg !433
  %529 = load i32* %mdeps576, align 4, !dbg !433
  %mul577 = mul nsw i32 %mul575, %529, !dbg !433
  %add578 = add nsw i32 %mul573, %mul577, !dbg !433
  %530 = load i32* %j, align 4, !dbg !433
  %531 = load %struct.Mat** %a.addr, align 8, !dbg !433
  %mdeps579 = getelementptr inbounds %struct.Mat* %531, i32 0, i32 4, !dbg !433
  %532 = load i32* %mdeps579, align 4, !dbg !433
  %mul580 = mul nsw i32 %530, %532, !dbg !433
  %add581 = add nsw i32 %add578, %mul580, !dbg !433
  %533 = load i32* %k, align 4, !dbg !433
  %add582 = add nsw i32 %add581, %533, !dbg !433
  %idxprom583 = sext i32 %add582 to i64, !dbg !433
  %534 = load %struct.Mat** %a.addr, align 8, !dbg !433
  %m584 = getelementptr inbounds %struct.Mat* %534, i32 0, i32 0, !dbg !433
  %535 = load float** %m584, align 8, !dbg !433
  %arrayidx585 = getelementptr inbounds float* %535, i64 %idxprom583, !dbg !433
  %536 = load float* %arrayidx585, align 4, !dbg !433
  %mul586 = fmul float %518, %536, !dbg !432
  %537 = load %struct.Mat** %p.addr, align 8, !dbg !434
  %mrows587 = getelementptr inbounds %struct.Mat* %537, i32 0, i32 2, !dbg !434
  %538 = load i32* %mrows587, align 4, !dbg !434
  %mul588 = mul nsw i32 0, %538, !dbg !434
  %539 = load %struct.Mat** %p.addr, align 8, !dbg !434
  %mcols589 = getelementptr inbounds %struct.Mat* %539, i32 0, i32 3, !dbg !434
  %540 = load i32* %mcols589, align 4, !dbg !434
  %mul590 = mul nsw i32 %mul588, %540, !dbg !434
  %541 = load %struct.Mat** %p.addr, align 8, !dbg !434
  %mdeps591 = getelementptr inbounds %struct.Mat* %541, i32 0, i32 4, !dbg !434
  %542 = load i32* %mdeps591, align 4, !dbg !434
  %mul592 = mul nsw i32 %mul590, %542, !dbg !434
  %543 = load i32* %i, align 4, !dbg !434
  %544 = load %struct.Mat** %p.addr, align 8, !dbg !434
  %mcols593 = getelementptr inbounds %struct.Mat* %544, i32 0, i32 3, !dbg !434
  %545 = load i32* %mcols593, align 4, !dbg !434
  %mul594 = mul nsw i32 %543, %545, !dbg !434
  %546 = load %struct.Mat** %p.addr, align 8, !dbg !434
  %mdeps595 = getelementptr inbounds %struct.Mat* %546, i32 0, i32 4, !dbg !434
  %547 = load i32* %mdeps595, align 4, !dbg !434
  %mul596 = mul nsw i32 %mul594, %547, !dbg !434
  %add597 = add nsw i32 %mul592, %mul596, !dbg !434
  %548 = load i32* %j, align 4, !dbg !434
  %549 = load %struct.Mat** %p.addr, align 8, !dbg !434
  %mdeps598 = getelementptr inbounds %struct.Mat* %549, i32 0, i32 4, !dbg !434
  %550 = load i32* %mdeps598, align 4, !dbg !434
  %mul599 = mul nsw i32 %548, %550, !dbg !434
  %add600 = add nsw i32 %add597, %mul599, !dbg !434
  %551 = load i32* %k, align 4, !dbg !434
  %add601 = add nsw i32 %add600, %551, !dbg !434
  %idxprom602 = sext i32 %add601 to i64, !dbg !434
  %552 = load %struct.Mat** %p.addr, align 8, !dbg !434
  %m603 = getelementptr inbounds %struct.Mat* %552, i32 0, i32 0, !dbg !434
  %553 = load float** %m603, align 8, !dbg !434
  %arrayidx604 = getelementptr inbounds float* %553, i64 %idxprom602, !dbg !434
  %554 = load float* %arrayidx604, align 4, !dbg !434
  %sub605 = fsub float %mul586, %554, !dbg !432
  %555 = load %struct.Mat** %bnd.addr, align 8, !dbg !435
  %mrows606 = getelementptr inbounds %struct.Mat* %555, i32 0, i32 2, !dbg !435
  %556 = load i32* %mrows606, align 4, !dbg !435
  %mul607 = mul nsw i32 0, %556, !dbg !435
  %557 = load %struct.Mat** %bnd.addr, align 8, !dbg !435
  %mcols608 = getelementptr inbounds %struct.Mat* %557, i32 0, i32 3, !dbg !435
  %558 = load i32* %mcols608, align 4, !dbg !435
  %mul609 = mul nsw i32 %mul607, %558, !dbg !435
  %559 = load %struct.Mat** %bnd.addr, align 8, !dbg !435
  %mdeps610 = getelementptr inbounds %struct.Mat* %559, i32 0, i32 4, !dbg !435
  %560 = load i32* %mdeps610, align 4, !dbg !435
  %mul611 = mul nsw i32 %mul609, %560, !dbg !435
  %561 = load i32* %i, align 4, !dbg !435
  %562 = load %struct.Mat** %bnd.addr, align 8, !dbg !435
  %mcols612 = getelementptr inbounds %struct.Mat* %562, i32 0, i32 3, !dbg !435
  %563 = load i32* %mcols612, align 4, !dbg !435
  %mul613 = mul nsw i32 %561, %563, !dbg !435
  %564 = load %struct.Mat** %bnd.addr, align 8, !dbg !435
  %mdeps614 = getelementptr inbounds %struct.Mat* %564, i32 0, i32 4, !dbg !435
  %565 = load i32* %mdeps614, align 4, !dbg !435
  %mul615 = mul nsw i32 %mul613, %565, !dbg !435
  %add616 = add nsw i32 %mul611, %mul615, !dbg !435
  %566 = load i32* %j, align 4, !dbg !435
  %567 = load %struct.Mat** %bnd.addr, align 8, !dbg !435
  %mdeps617 = getelementptr inbounds %struct.Mat* %567, i32 0, i32 4, !dbg !435
  %568 = load i32* %mdeps617, align 4, !dbg !435
  %mul618 = mul nsw i32 %566, %568, !dbg !435
  %add619 = add nsw i32 %add616, %mul618, !dbg !435
  %569 = load i32* %k, align 4, !dbg !435
  %add620 = add nsw i32 %add619, %569, !dbg !435
  %idxprom621 = sext i32 %add620 to i64, !dbg !435
  %570 = load %struct.Mat** %bnd.addr, align 8, !dbg !435
  %m622 = getelementptr inbounds %struct.Mat* %570, i32 0, i32 0, !dbg !435
  %571 = load float** %m622, align 8, !dbg !435
  %arrayidx623 = getelementptr inbounds float* %571, i64 %idxprom621, !dbg !435
  %572 = load float* %arrayidx623, align 4, !dbg !435
  %mul624 = fmul float %sub605, %572, !dbg !436
  store float %mul624, float* %ss, align 4, !dbg !437
  %573 = load float* %ss, align 4, !dbg !438
  %574 = load float* %ss, align 4, !dbg !439
  %mul625 = fmul float %573, %574, !dbg !438
  %575 = load float* %gosa, align 4, !dbg !440
  %add626 = fadd float %575, %mul625, !dbg !440
  store float %add626, float* %gosa, align 4, !dbg !440
  %576 = load %struct.Mat** %p.addr, align 8, !dbg !441
  %mrows627 = getelementptr inbounds %struct.Mat* %576, i32 0, i32 2, !dbg !441
  %577 = load i32* %mrows627, align 4, !dbg !441
  %mul628 = mul nsw i32 0, %577, !dbg !441
  %578 = load %struct.Mat** %p.addr, align 8, !dbg !441
  %mcols629 = getelementptr inbounds %struct.Mat* %578, i32 0, i32 3, !dbg !441
  %579 = load i32* %mcols629, align 4, !dbg !441
  %mul630 = mul nsw i32 %mul628, %579, !dbg !441
  %580 = load %struct.Mat** %p.addr, align 8, !dbg !441
  %mdeps631 = getelementptr inbounds %struct.Mat* %580, i32 0, i32 4, !dbg !441
  %581 = load i32* %mdeps631, align 4, !dbg !441
  %mul632 = mul nsw i32 %mul630, %581, !dbg !441
  %582 = load i32* %i, align 4, !dbg !441
  %583 = load %struct.Mat** %p.addr, align 8, !dbg !441
  %mcols633 = getelementptr inbounds %struct.Mat* %583, i32 0, i32 3, !dbg !441
  %584 = load i32* %mcols633, align 4, !dbg !441
  %mul634 = mul nsw i32 %582, %584, !dbg !441
  %585 = load %struct.Mat** %p.addr, align 8, !dbg !441
  %mdeps635 = getelementptr inbounds %struct.Mat* %585, i32 0, i32 4, !dbg !441
  %586 = load i32* %mdeps635, align 4, !dbg !441
  %mul636 = mul nsw i32 %mul634, %586, !dbg !441
  %add637 = add nsw i32 %mul632, %mul636, !dbg !441
  %587 = load i32* %j, align 4, !dbg !441
  %588 = load %struct.Mat** %p.addr, align 8, !dbg !441
  %mdeps638 = getelementptr inbounds %struct.Mat* %588, i32 0, i32 4, !dbg !441
  %589 = load i32* %mdeps638, align 4, !dbg !441
  %mul639 = mul nsw i32 %587, %589, !dbg !441
  %add640 = add nsw i32 %add637, %mul639, !dbg !441
  %590 = load i32* %k, align 4, !dbg !441
  %add641 = add nsw i32 %add640, %590, !dbg !441
  %idxprom642 = sext i32 %add641 to i64, !dbg !441
  %591 = load %struct.Mat** %p.addr, align 8, !dbg !441
  %m643 = getelementptr inbounds %struct.Mat* %591, i32 0, i32 0, !dbg !441
  %592 = load float** %m643, align 8, !dbg !441
  %arrayidx644 = getelementptr inbounds float* %592, i64 %idxprom642, !dbg !441
  %593 = load float* %arrayidx644, align 4, !dbg !441
  %594 = load float* @omega, align 4, !dbg !442
  %595 = load float* %ss, align 4, !dbg !443
  %mul645 = fmul float %594, %595, !dbg !442
  %add646 = fadd float %593, %mul645, !dbg !441
  %596 = load %struct.Mat** %wrk2.addr, align 8, !dbg !444
  %mrows647 = getelementptr inbounds %struct.Mat* %596, i32 0, i32 2, !dbg !444
  %597 = load i32* %mrows647, align 4, !dbg !444
  %mul648 = mul nsw i32 0, %597, !dbg !444
  %598 = load %struct.Mat** %wrk2.addr, align 8, !dbg !444
  %mcols649 = getelementptr inbounds %struct.Mat* %598, i32 0, i32 3, !dbg !444
  %599 = load i32* %mcols649, align 4, !dbg !444
  %mul650 = mul nsw i32 %mul648, %599, !dbg !444
  %600 = load %struct.Mat** %wrk2.addr, align 8, !dbg !444
  %mdeps651 = getelementptr inbounds %struct.Mat* %600, i32 0, i32 4, !dbg !444
  %601 = load i32* %mdeps651, align 4, !dbg !444
  %mul652 = mul nsw i32 %mul650, %601, !dbg !444
  %602 = load i32* %i, align 4, !dbg !444
  %603 = load %struct.Mat** %wrk2.addr, align 8, !dbg !444
  %mcols653 = getelementptr inbounds %struct.Mat* %603, i32 0, i32 3, !dbg !444
  %604 = load i32* %mcols653, align 4, !dbg !444
  %mul654 = mul nsw i32 %602, %604, !dbg !444
  %605 = load %struct.Mat** %wrk2.addr, align 8, !dbg !444
  %mdeps655 = getelementptr inbounds %struct.Mat* %605, i32 0, i32 4, !dbg !444
  %606 = load i32* %mdeps655, align 4, !dbg !444
  %mul656 = mul nsw i32 %mul654, %606, !dbg !444
  %add657 = add nsw i32 %mul652, %mul656, !dbg !444
  %607 = load i32* %j, align 4, !dbg !444
  %608 = load %struct.Mat** %wrk2.addr, align 8, !dbg !444
  %mdeps658 = getelementptr inbounds %struct.Mat* %608, i32 0, i32 4, !dbg !444
  %609 = load i32* %mdeps658, align 4, !dbg !444
  %mul659 = mul nsw i32 %607, %609, !dbg !444
  %add660 = add nsw i32 %add657, %mul659, !dbg !444
  %610 = load i32* %k, align 4, !dbg !444
  %add661 = add nsw i32 %add660, %610, !dbg !444
  %idxprom662 = sext i32 %add661 to i64, !dbg !444
  %611 = load %struct.Mat** %wrk2.addr, align 8, !dbg !444
  %m663 = getelementptr inbounds %struct.Mat* %611, i32 0, i32 0, !dbg !444
  %612 = load float** %m663, align 8, !dbg !444
  %arrayidx664 = getelementptr inbounds float* %612, i64 %idxprom662, !dbg !444
  store float %add646, float* %arrayidx664, align 4, !dbg !444
  br label %for.inc, !dbg !445

for.inc:                                          ; preds = %for.body11
  %613 = load i32* %k, align 4, !dbg !446
  %inc = add nsw i32 %613, 1, !dbg !446
  store i32 %inc, i32* %k, align 4, !dbg !446
  br label %for.cond9, !dbg !447

for.end:                                          ; preds = %for.cond9
  br label %for.inc665, !dbg !448

for.inc665:                                       ; preds = %for.end
  %614 = load i32* %j, align 4, !dbg !449
  %inc666 = add nsw i32 %614, 1, !dbg !449
  store i32 %inc666, i32* %j, align 4, !dbg !449
  br label %for.cond6, !dbg !450

for.end667:                                       ; preds = %for.cond6
  br label %for.inc668, !dbg !451

for.inc668:                                       ; preds = %for.end667
  %615 = load i32* %i, align 4, !dbg !452
  %inc669 = add nsw i32 %615, 1, !dbg !452
  store i32 %inc669, i32* %i, align 4, !dbg !452
  br label %for.cond3, !dbg !453

for.end670:                                       ; preds = %for.cond3
  store i32 1, i32* %i, align 4, !dbg !454
  br label %for.cond671, !dbg !454

for.cond671:                                      ; preds = %for.inc722, %for.end670
  %616 = load i32* %i, align 4, !dbg !456
  %617 = load i32* %imax, align 4, !dbg !460
  %cmp672 = icmp slt i32 %616, %617, !dbg !461
  br i1 %cmp672, label %for.body673, label %for.end724, !dbg !462

for.body673:                                      ; preds = %for.cond671
  store i32 1, i32* %j, align 4, !dbg !463
  br label %for.cond674, !dbg !463

for.cond674:                                      ; preds = %for.inc719, %for.body673
  %618 = load i32* %j, align 4, !dbg !465
  %619 = load i32* %jmax, align 4, !dbg !469
  %cmp675 = icmp slt i32 %618, %619, !dbg !470
  br i1 %cmp675, label %for.body676, label %for.end721, !dbg !471

for.body676:                                      ; preds = %for.cond674
  store i32 1, i32* %k, align 4, !dbg !472
  br label %for.cond677, !dbg !472

for.cond677:                                      ; preds = %for.inc716, %for.body676
  %620 = load i32* %k, align 4, !dbg !474
  %621 = load i32* %kmax, align 4, !dbg !478
  %cmp678 = icmp slt i32 %620, %621, !dbg !479
  br i1 %cmp678, label %for.body679, label %for.end718, !dbg !480

for.body679:                                      ; preds = %for.cond677
  %622 = load %struct.Mat** %wrk2.addr, align 8, !dbg !481
  %mrows680 = getelementptr inbounds %struct.Mat* %622, i32 0, i32 2, !dbg !481
  %623 = load i32* %mrows680, align 4, !dbg !481
  %mul681 = mul nsw i32 0, %623, !dbg !481
  %624 = load %struct.Mat** %wrk2.addr, align 8, !dbg !481
  %mcols682 = getelementptr inbounds %struct.Mat* %624, i32 0, i32 3, !dbg !481
  %625 = load i32* %mcols682, align 4, !dbg !481
  %mul683 = mul nsw i32 %mul681, %625, !dbg !481
  %626 = load %struct.Mat** %wrk2.addr, align 8, !dbg !481
  %mdeps684 = getelementptr inbounds %struct.Mat* %626, i32 0, i32 4, !dbg !481
  %627 = load i32* %mdeps684, align 4, !dbg !481
  %mul685 = mul nsw i32 %mul683, %627, !dbg !481
  %628 = load i32* %i, align 4, !dbg !481
  %629 = load %struct.Mat** %wrk2.addr, align 8, !dbg !481
  %mcols686 = getelementptr inbounds %struct.Mat* %629, i32 0, i32 3, !dbg !481
  %630 = load i32* %mcols686, align 4, !dbg !481
  %mul687 = mul nsw i32 %628, %630, !dbg !481
  %631 = load %struct.Mat** %wrk2.addr, align 8, !dbg !481
  %mdeps688 = getelementptr inbounds %struct.Mat* %631, i32 0, i32 4, !dbg !481
  %632 = load i32* %mdeps688, align 4, !dbg !481
  %mul689 = mul nsw i32 %mul687, %632, !dbg !481
  %add690 = add nsw i32 %mul685, %mul689, !dbg !481
  %633 = load i32* %j, align 4, !dbg !481
  %634 = load %struct.Mat** %wrk2.addr, align 8, !dbg !481
  %mdeps691 = getelementptr inbounds %struct.Mat* %634, i32 0, i32 4, !dbg !481
  %635 = load i32* %mdeps691, align 4, !dbg !481
  %mul692 = mul nsw i32 %633, %635, !dbg !481
  %add693 = add nsw i32 %add690, %mul692, !dbg !481
  %636 = load i32* %k, align 4, !dbg !481
  %add694 = add nsw i32 %add693, %636, !dbg !481
  %idxprom695 = sext i32 %add694 to i64, !dbg !481
  %637 = load %struct.Mat** %wrk2.addr, align 8, !dbg !481
  %m696 = getelementptr inbounds %struct.Mat* %637, i32 0, i32 0, !dbg !481
  %638 = load float** %m696, align 8, !dbg !481
  %arrayidx697 = getelementptr inbounds float* %638, i64 %idxprom695, !dbg !481
  %639 = load float* %arrayidx697, align 4, !dbg !481
  %640 = load %struct.Mat** %p.addr, align 8, !dbg !482
  %mrows698 = getelementptr inbounds %struct.Mat* %640, i32 0, i32 2, !dbg !482
  %641 = load i32* %mrows698, align 4, !dbg !482
  %mul699 = mul nsw i32 0, %641, !dbg !482
  %642 = load %struct.Mat** %p.addr, align 8, !dbg !482
  %mcols700 = getelementptr inbounds %struct.Mat* %642, i32 0, i32 3, !dbg !482
  %643 = load i32* %mcols700, align 4, !dbg !482
  %mul701 = mul nsw i32 %mul699, %643, !dbg !482
  %644 = load %struct.Mat** %p.addr, align 8, !dbg !482
  %mdeps702 = getelementptr inbounds %struct.Mat* %644, i32 0, i32 4, !dbg !482
  %645 = load i32* %mdeps702, align 4, !dbg !482
  %mul703 = mul nsw i32 %mul701, %645, !dbg !482
  %646 = load i32* %i, align 4, !dbg !482
  %647 = load %struct.Mat** %p.addr, align 8, !dbg !482
  %mcols704 = getelementptr inbounds %struct.Mat* %647, i32 0, i32 3, !dbg !482
  %648 = load i32* %mcols704, align 4, !dbg !482
  %mul705 = mul nsw i32 %646, %648, !dbg !482
  %649 = load %struct.Mat** %p.addr, align 8, !dbg !482
  %mdeps706 = getelementptr inbounds %struct.Mat* %649, i32 0, i32 4, !dbg !482
  %650 = load i32* %mdeps706, align 4, !dbg !482
  %mul707 = mul nsw i32 %mul705, %650, !dbg !482
  %add708 = add nsw i32 %mul703, %mul707, !dbg !482
  %651 = load i32* %j, align 4, !dbg !482
  %652 = load %struct.Mat** %p.addr, align 8, !dbg !482
  %mdeps709 = getelementptr inbounds %struct.Mat* %652, i32 0, i32 4, !dbg !482
  %653 = load i32* %mdeps709, align 4, !dbg !482
  %mul710 = mul nsw i32 %651, %653, !dbg !482
  %add711 = add nsw i32 %add708, %mul710, !dbg !482
  %654 = load i32* %k, align 4, !dbg !482
  %add712 = add nsw i32 %add711, %654, !dbg !482
  %idxprom713 = sext i32 %add712 to i64, !dbg !482
  %655 = load %struct.Mat** %p.addr, align 8, !dbg !482
  %m714 = getelementptr inbounds %struct.Mat* %655, i32 0, i32 0, !dbg !482
  %656 = load float** %m714, align 8, !dbg !482
  %arrayidx715 = getelementptr inbounds float* %656, i64 %idxprom713, !dbg !482
  store float %639, float* %arrayidx715, align 4, !dbg !482
  br label %for.inc716, !dbg !482

for.inc716:                                       ; preds = %for.body679
  %657 = load i32* %k, align 4, !dbg !483
  %inc717 = add nsw i32 %657, 1, !dbg !483
  store i32 %inc717, i32* %k, align 4, !dbg !483
  br label %for.cond677, !dbg !484

for.end718:                                       ; preds = %for.cond677
  br label %for.inc719, !dbg !485

for.inc719:                                       ; preds = %for.end718
  %658 = load i32* %j, align 4, !dbg !486
  %inc720 = add nsw i32 %658, 1, !dbg !486
  store i32 %inc720, i32* %j, align 4, !dbg !486
  br label %for.cond674, !dbg !487

for.end721:                                       ; preds = %for.cond674
  br label %for.inc722, !dbg !488

for.inc722:                                       ; preds = %for.end721
  %659 = load i32* %i, align 4, !dbg !489
  %inc723 = add nsw i32 %659, 1, !dbg !489
  store i32 %inc723, i32* %i, align 4, !dbg !489
  br label %for.cond671, !dbg !490

for.end724:                                       ; preds = %for.cond671
  br label %for.inc725, !dbg !491

for.inc725:                                       ; preds = %for.end724
  %660 = load i32* %n, align 4, !dbg !492
  %inc726 = add nsw i32 %660, 1, !dbg !492
  store i32 %inc726, i32* %n, align 4, !dbg !492
  br label %for.cond, !dbg !493

for.end727:                                       ; preds = %for.cond
  %661 = load float* %gosa, align 4, !dbg !494
  ret float %661, !dbg !495
}

; Function Attrs: nounwind uwtable
define void @clearMat(%struct.Mat* %Mat) #0 {
entry:
  %Mat.addr = alloca %struct.Mat*, align 8
  store %struct.Mat* %Mat, %struct.Mat** %Mat.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.Mat** %Mat.addr, metadata !496, metadata !67), !dbg !497
  %0 = load %struct.Mat** %Mat.addr, align 8, !dbg !498
  %m = getelementptr inbounds %struct.Mat* %0, i32 0, i32 0, !dbg !498
  %1 = load float** %m, align 8, !dbg !498
  %tobool = icmp ne float* %1, null, !dbg !500
  br i1 %tobool, label %if.then, label %if.end, !dbg !500

if.then:                                          ; preds = %entry
  %2 = load %struct.Mat** %Mat.addr, align 8, !dbg !501
  %m1 = getelementptr inbounds %struct.Mat* %2, i32 0, i32 0, !dbg !501
  %3 = load float** %m1, align 8, !dbg !501
  %4 = bitcast float* %3 to i8*, !dbg !501
  call void @free(i8* %4) #5, !dbg !502
  br label %if.end, !dbg !502

if.end:                                           ; preds = %if.then, %entry
  %5 = load %struct.Mat** %Mat.addr, align 8, !dbg !503
  %m2 = getelementptr inbounds %struct.Mat* %5, i32 0, i32 0, !dbg !503
  store float* null, float** %m2, align 8, !dbg !503
  %6 = load %struct.Mat** %Mat.addr, align 8, !dbg !504
  %mnums = getelementptr inbounds %struct.Mat* %6, i32 0, i32 1, !dbg !504
  store i32 0, i32* %mnums, align 4, !dbg !504
  %7 = load %struct.Mat** %Mat.addr, align 8, !dbg !505
  %mcols = getelementptr inbounds %struct.Mat* %7, i32 0, i32 3, !dbg !505
  store i32 0, i32* %mcols, align 4, !dbg !505
  %8 = load %struct.Mat** %Mat.addr, align 8, !dbg !506
  %mrows = getelementptr inbounds %struct.Mat* %8, i32 0, i32 2, !dbg !506
  store i32 0, i32* %mrows, align 4, !dbg !506
  %9 = load %struct.Mat** %Mat.addr, align 8, !dbg !507
  %mdeps = getelementptr inbounds %struct.Mat* %9, i32 0, i32 4, !dbg !507
  store i32 0, i32* %mdeps, align 4, !dbg !507
  ret void, !dbg !508
}

; Function Attrs: nounwind uwtable
define double @fflop(i32 %mx, i32 %my, i32 %mz) #0 {
entry:
  %mx.addr = alloca i32, align 4
  %my.addr = alloca i32, align 4
  %mz.addr = alloca i32, align 4
  store i32 %mx, i32* %mx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %mx.addr, metadata !509, metadata !67), !dbg !510
  store i32 %my, i32* %my.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %my.addr, metadata !511, metadata !67), !dbg !512
  store i32 %mz, i32* %mz.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %mz.addr, metadata !513, metadata !67), !dbg !514
  %0 = load i32* %mz.addr, align 4, !dbg !515
  %sub = sub nsw i32 %0, 2, !dbg !515
  %conv = sitofp i32 %sub to double, !dbg !516
  %1 = load i32* %my.addr, align 4, !dbg !517
  %sub1 = sub nsw i32 %1, 2, !dbg !517
  %conv2 = sitofp i32 %sub1 to double, !dbg !518
  %mul = fmul double %conv, %conv2, !dbg !516
  %2 = load i32* %mx.addr, align 4, !dbg !519
  %sub3 = sub nsw i32 %2, 2, !dbg !519
  %conv4 = sitofp i32 %sub3 to double, !dbg !520
  %mul5 = fmul double %mul, %conv4, !dbg !516
  %mul6 = fmul double %mul5, 3.400000e+01, !dbg !516
  ret double %mul6, !dbg !521
}

; Function Attrs: nounwind uwtable
define double @mflops(i32 %nn, double %cpu, double %flop) #0 {
entry:
  %nn.addr = alloca i32, align 4
  %cpu.addr = alloca double, align 8
  %flop.addr = alloca double, align 8
  store i32 %nn, i32* %nn.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nn.addr, metadata !522, metadata !67), !dbg !523
  store double %cpu, double* %cpu.addr, align 8
  call void @llvm.dbg.declare(metadata double* %cpu.addr, metadata !524, metadata !67), !dbg !525
  store double %flop, double* %flop.addr, align 8
  call void @llvm.dbg.declare(metadata double* %flop.addr, metadata !526, metadata !67), !dbg !527
  %0 = load double* %flop.addr, align 8, !dbg !528
  %1 = load double* %cpu.addr, align 8, !dbg !529
  %div = fdiv double %0, %1, !dbg !528
  %mul = fmul double %div, 1.000000e-06, !dbg !528
  %2 = load i32* %nn.addr, align 4, !dbg !530
  %conv = sitofp i32 %2 to double, !dbg !531
  %mul1 = fmul double %mul, %conv, !dbg !528
  ret double %mul1, !dbg !532
}

; Function Attrs: nounwind uwtable
define void @set_param(i32* %is, i8* %size) #0 {
entry:
  %is.addr = alloca i32*, align 8
  %size.addr = alloca i8*, align 8
  store i32* %is, i32** %is.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %is.addr, metadata !533, metadata !67), !dbg !534
  store i8* %size, i8** %size.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %size.addr, metadata !535, metadata !67), !dbg !536
  %0 = load i8** %size.addr, align 8, !dbg !537
  %call = call i32 @strcmp(i8* %0, i8* getelementptr inbounds ([3 x i8]* @.str4, i32 0, i32 0)), !dbg !539
  %tobool = icmp ne i32 %call, 0, !dbg !540
  br i1 %tobool, label %lor.lhs.false, label %if.then, !dbg !540

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8** %size.addr, align 8, !dbg !541
  %call1 = call i32 @strcmp(i8* %1, i8* getelementptr inbounds ([3 x i8]* @.str5, i32 0, i32 0)), !dbg !543
  %tobool2 = icmp ne i32 %call1, 0, !dbg !540
  br i1 %tobool2, label %if.end, label %if.then, !dbg !540

if.then:                                          ; preds = %lor.lhs.false, %entry
  %2 = load i32** %is.addr, align 8, !dbg !544
  %arrayidx = getelementptr inbounds i32* %2, i64 0, !dbg !544
  store i32 32, i32* %arrayidx, align 4, !dbg !544
  %3 = load i32** %is.addr, align 8, !dbg !546
  %arrayidx3 = getelementptr inbounds i32* %3, i64 1, !dbg !546
  store i32 32, i32* %arrayidx3, align 4, !dbg !546
  %4 = load i32** %is.addr, align 8, !dbg !547
  %arrayidx4 = getelementptr inbounds i32* %4, i64 2, !dbg !547
  store i32 64, i32* %arrayidx4, align 4, !dbg !547
  br label %return, !dbg !548

if.end:                                           ; preds = %lor.lhs.false
  %5 = load i8** %size.addr, align 8, !dbg !549
  %call5 = call i32 @strcmp(i8* %5, i8* getelementptr inbounds ([2 x i8]* @.str6, i32 0, i32 0)), !dbg !551
  %tobool6 = icmp ne i32 %call5, 0, !dbg !552
  br i1 %tobool6, label %lor.lhs.false7, label %if.then10, !dbg !552

lor.lhs.false7:                                   ; preds = %if.end
  %6 = load i8** %size.addr, align 8, !dbg !553
  %call8 = call i32 @strcmp(i8* %6, i8* getelementptr inbounds ([2 x i8]* @.str7, i32 0, i32 0)), !dbg !555
  %tobool9 = icmp ne i32 %call8, 0, !dbg !552
  br i1 %tobool9, label %if.end14, label %if.then10, !dbg !552

if.then10:                                        ; preds = %lor.lhs.false7, %if.end
  %7 = load i32** %is.addr, align 8, !dbg !556
  %arrayidx11 = getelementptr inbounds i32* %7, i64 0, !dbg !556
  store i32 64, i32* %arrayidx11, align 4, !dbg !556
  %8 = load i32** %is.addr, align 8, !dbg !558
  %arrayidx12 = getelementptr inbounds i32* %8, i64 1, !dbg !558
  store i32 64, i32* %arrayidx12, align 4, !dbg !558
  %9 = load i32** %is.addr, align 8, !dbg !559
  %arrayidx13 = getelementptr inbounds i32* %9, i64 2, !dbg !559
  store i32 128, i32* %arrayidx13, align 4, !dbg !559
  br label %return, !dbg !560

if.end14:                                         ; preds = %lor.lhs.false7
  %10 = load i8** %size.addr, align 8, !dbg !561
  %call15 = call i32 @strcmp(i8* %10, i8* getelementptr inbounds ([2 x i8]* @.str8, i32 0, i32 0)), !dbg !563
  %tobool16 = icmp ne i32 %call15, 0, !dbg !564
  br i1 %tobool16, label %lor.lhs.false17, label %if.then20, !dbg !564

lor.lhs.false17:                                  ; preds = %if.end14
  %11 = load i8** %size.addr, align 8, !dbg !565
  %call18 = call i32 @strcmp(i8* %11, i8* getelementptr inbounds ([2 x i8]* @.str9, i32 0, i32 0)), !dbg !567
  %tobool19 = icmp ne i32 %call18, 0, !dbg !564
  br i1 %tobool19, label %if.end24, label %if.then20, !dbg !564

if.then20:                                        ; preds = %lor.lhs.false17, %if.end14
  %12 = load i32** %is.addr, align 8, !dbg !568
  %arrayidx21 = getelementptr inbounds i32* %12, i64 0, !dbg !568
  store i32 128, i32* %arrayidx21, align 4, !dbg !568
  %13 = load i32** %is.addr, align 8, !dbg !570
  %arrayidx22 = getelementptr inbounds i32* %13, i64 1, !dbg !570
  store i32 128, i32* %arrayidx22, align 4, !dbg !570
  %14 = load i32** %is.addr, align 8, !dbg !571
  %arrayidx23 = getelementptr inbounds i32* %14, i64 2, !dbg !571
  store i32 256, i32* %arrayidx23, align 4, !dbg !571
  br label %return, !dbg !572

if.end24:                                         ; preds = %lor.lhs.false17
  %15 = load i8** %size.addr, align 8, !dbg !573
  %call25 = call i32 @strcmp(i8* %15, i8* getelementptr inbounds ([2 x i8]* @.str10, i32 0, i32 0)), !dbg !575
  %tobool26 = icmp ne i32 %call25, 0, !dbg !576
  br i1 %tobool26, label %lor.lhs.false27, label %if.then30, !dbg !576

lor.lhs.false27:                                  ; preds = %if.end24
  %16 = load i8** %size.addr, align 8, !dbg !577
  %call28 = call i32 @strcmp(i8* %16, i8* getelementptr inbounds ([2 x i8]* @.str11, i32 0, i32 0)), !dbg !579
  %tobool29 = icmp ne i32 %call28, 0, !dbg !576
  br i1 %tobool29, label %if.end34, label %if.then30, !dbg !576

if.then30:                                        ; preds = %lor.lhs.false27, %if.end24
  %17 = load i32** %is.addr, align 8, !dbg !580
  %arrayidx31 = getelementptr inbounds i32* %17, i64 0, !dbg !580
  store i32 256, i32* %arrayidx31, align 4, !dbg !580
  %18 = load i32** %is.addr, align 8, !dbg !582
  %arrayidx32 = getelementptr inbounds i32* %18, i64 1, !dbg !582
  store i32 256, i32* %arrayidx32, align 4, !dbg !582
  %19 = load i32** %is.addr, align 8, !dbg !583
  %arrayidx33 = getelementptr inbounds i32* %19, i64 2, !dbg !583
  store i32 512, i32* %arrayidx33, align 4, !dbg !583
  br label %return, !dbg !584

if.end34:                                         ; preds = %lor.lhs.false27
  %20 = load i8** %size.addr, align 8, !dbg !585
  %call35 = call i32 @strcmp(i8* %20, i8* getelementptr inbounds ([3 x i8]* @.str12, i32 0, i32 0)), !dbg !587
  %tobool36 = icmp ne i32 %call35, 0, !dbg !588
  br i1 %tobool36, label %lor.lhs.false37, label %if.then40, !dbg !588

lor.lhs.false37:                                  ; preds = %if.end34
  %21 = load i8** %size.addr, align 8, !dbg !589
  %call38 = call i32 @strcmp(i8* %21, i8* getelementptr inbounds ([3 x i8]* @.str13, i32 0, i32 0)), !dbg !591
  %tobool39 = icmp ne i32 %call38, 0, !dbg !588
  br i1 %tobool39, label %if.else, label %if.then40, !dbg !588

if.then40:                                        ; preds = %lor.lhs.false37, %if.end34
  %22 = load i32** %is.addr, align 8, !dbg !592
  %arrayidx41 = getelementptr inbounds i32* %22, i64 0, !dbg !592
  store i32 512, i32* %arrayidx41, align 4, !dbg !592
  %23 = load i32** %is.addr, align 8, !dbg !594
  %arrayidx42 = getelementptr inbounds i32* %23, i64 1, !dbg !594
  store i32 512, i32* %arrayidx42, align 4, !dbg !594
  %24 = load i32** %is.addr, align 8, !dbg !595
  %arrayidx43 = getelementptr inbounds i32* %24, i64 2, !dbg !595
  store i32 1024, i32* %arrayidx43, align 4, !dbg !595
  br label %return, !dbg !596

if.else:                                          ; preds = %lor.lhs.false37
  %call44 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str14, i32 0, i32 0)), !dbg !597
  call void @exit(i32 6) #6, !dbg !599
  unreachable, !dbg !599

return:                                           ; preds = %if.then40, %if.then30, %if.then20, %if.then10, %if.then
  ret void, !dbg !600
}

declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #4

; Function Attrs: nounwind
declare void @free(i8*) #4

; Function Attrs: nounwind uwtable
define double @second() #0 {
entry:
  %tm = alloca %struct.timeval, align 8
  %t = alloca double, align 8
  call void @llvm.dbg.declare(metadata %struct.timeval* %tm, metadata !601, metadata !67), !dbg !611
  call void @llvm.dbg.declare(metadata double* %t, metadata !612, metadata !67), !dbg !613
  %call = call i32 @gettimeofday(%struct.timeval* %tm, %struct.timezone* null) #5, !dbg !614
  %0 = load i32* @second.base_sec, align 4, !dbg !615
  %cmp = icmp eq i32 %0, 0, !dbg !615
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !617

land.lhs.true:                                    ; preds = %entry
  %1 = load i32* @second.base_usec, align 4, !dbg !618
  %cmp1 = icmp eq i32 %1, 0, !dbg !618
  br i1 %cmp1, label %if.then, label %if.else, !dbg !617

if.then:                                          ; preds = %land.lhs.true
  %tv_sec = getelementptr inbounds %struct.timeval* %tm, i32 0, i32 0, !dbg !620
  %2 = load i64* %tv_sec, align 8, !dbg !620
  %conv = trunc i64 %2 to i32, !dbg !620
  store i32 %conv, i32* @second.base_sec, align 4, !dbg !622
  %tv_usec = getelementptr inbounds %struct.timeval* %tm, i32 0, i32 1, !dbg !623
  %3 = load i64* %tv_usec, align 8, !dbg !623
  %conv2 = trunc i64 %3 to i32, !dbg !623
  store i32 %conv2, i32* @second.base_usec, align 4, !dbg !624
  store double 0.000000e+00, double* %t, align 8, !dbg !625
  br label %if.end, !dbg !626

if.else:                                          ; preds = %land.lhs.true, %entry
  %tv_sec3 = getelementptr inbounds %struct.timeval* %tm, i32 0, i32 0, !dbg !627
  %4 = load i64* %tv_sec3, align 8, !dbg !627
  %5 = load i32* @second.base_sec, align 4, !dbg !629
  %conv4 = sext i32 %5 to i64, !dbg !629
  %sub = sub nsw i64 %4, %conv4, !dbg !627
  %conv5 = sitofp i64 %sub to double, !dbg !630
  %tv_usec6 = getelementptr inbounds %struct.timeval* %tm, i32 0, i32 1, !dbg !631
  %6 = load i64* %tv_usec6, align 8, !dbg !631
  %7 = load i32* @second.base_usec, align 4, !dbg !632
  %conv7 = sext i32 %7 to i64, !dbg !632
  %sub8 = sub nsw i64 %6, %conv7, !dbg !631
  %conv9 = sitofp i64 %sub8 to double, !dbg !633
  %div = fdiv double %conv9, 1.000000e+06, !dbg !634
  %add = fadd double %conv5, %div, !dbg !630
  store double %add, double* %t, align 8, !dbg !635
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %8 = load double* %t, align 8, !dbg !636
  ret double %8, !dbg !637
}

; Function Attrs: nounwind
declare i32 @gettimeofday(%struct.timeval*, %struct.timezone*) #4

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!63, !64}
!llvm.ident = !{!65}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\000\00\000\00\001", !1, !2, !3, !8, !52, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c] [DW_LANG_C99]
!1 = !{!"himenobmtxpa.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4, !5, !7, !6}
!4 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!5 = !{!"0xf\00\000\0064\0064\000\000", null, null, !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from float]
!6 = !{!"0x24\00float\000\0032\0032\000\000\004", null, null} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!7 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!8 = !{!9, !17, !20, !23, !27, !39, !42, !45, !46, !49}
!9 = !{!"0x2e\00main\00main\00\0071\000\001\000\000\00256\000\0072", !1, !10, !11, null, i32 (i32, i8**)* @main, null, null, !2} ; [ DW_TAG_subprogram ] [line 71] [def] [scope 72] [main]
!10 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!11 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !12, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!12 = !{!13, !13, !14}
!13 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!14 = !{!"0xf\00\000\0064\0064\000\000", null, null, !15} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!15 = !{!"0xf\00\000\0064\0064\000\000", null, null, !16} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!16 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!17 = !{!"0x2e\00fflop\00fflop\00\00144\000\001\000\000\00256\000\00145", !1, !10, !18, null, double (i32, i32, i32)* @fflop, null, null, !2} ; [ DW_TAG_subprogram ] [line 144] [def] [scope 145] [fflop]
!18 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !19, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!19 = !{!4, !13, !13, !13}
!20 = !{!"0x2e\00mflops\00mflops\00\00150\000\001\000\000\00256\000\00151", !1, !10, !21, null, double (i32, double, double)* @mflops, null, null, !2} ; [ DW_TAG_subprogram ] [line 150] [def] [scope 151] [mflops]
!21 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !22, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!22 = !{!4, !13, !4, !4}
!23 = !{!"0x2e\00set_param\00set_param\00\00156\000\001\000\000\00256\000\00157", !1, !10, !24, null, void (i32*, i8*)* @set_param, null, null, !2} ; [ DW_TAG_subprogram ] [line 156] [def] [scope 157] [set_param]
!24 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !25, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!25 = !{null, !26, !15}
!26 = !{!"0xf\00\000\0064\0064\000\000", null, null, !13} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!27 = !{!"0x2e\00newMat\00newMat\00\00194\000\001\000\000\00256\000\00195", !1, !10, !28, null, i32 (%struct.Mat*, i32, i32, i32, i32)* @newMat, null, null, !2} ; [ DW_TAG_subprogram ] [line 194] [def] [scope 195] [newMat]
!28 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !29, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!29 = !{!13, !30, !13, !13, !13, !13}
!30 = !{!"0xf\00\000\0064\0064\000\000", null, null, !31} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from Matrix]
!31 = !{!"0x16\00Matrix\0054\000\000\000\000", !1, null, !32} ; [ DW_TAG_typedef ] [Matrix] [line 54, size 0, align 0, offset 0] [from Mat]
!32 = !{!"0x13\00Mat\0045\00192\0064\000\000\000", !1, null, null, !33, null, null, null} ; [ DW_TAG_structure_type ] [Mat] [line 45, size 192, align 64, offset 0] [def] [from ]
!33 = !{!34, !35, !36, !37, !38}
!34 = !{!"0xd\00m\0046\0064\0064\000\000", !1, !32, !5} ; [ DW_TAG_member ] [m] [line 46, size 64, align 64, offset 0] [from ]
!35 = !{!"0xd\00mnums\0047\0032\0032\0064\000", !1, !32, !13} ; [ DW_TAG_member ] [mnums] [line 47, size 32, align 32, offset 64] [from int]
!36 = !{!"0xd\00mrows\0048\0032\0032\0096\000", !1, !32, !13} ; [ DW_TAG_member ] [mrows] [line 48, size 32, align 32, offset 96] [from int]
!37 = !{!"0xd\00mcols\0049\0032\0032\00128\000", !1, !32, !13} ; [ DW_TAG_member ] [mcols] [line 49, size 32, align 32, offset 128] [from int]
!38 = !{!"0xd\00mdeps\0050\0032\0032\00160\000", !1, !32, !13} ; [ DW_TAG_member ] [mdeps] [line 50, size 32, align 32, offset 160] [from int]
!39 = !{!"0x2e\00clearMat\00clearMat\00\00208\000\001\000\000\00256\000\00209", !1, !10, !40, null, void (%struct.Mat*)* @clearMat, null, null, !2} ; [ DW_TAG_subprogram ] [line 208] [def] [scope 209] [clearMat]
!40 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !41, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!41 = !{null, !30}
!42 = !{!"0x2e\00mat_set\00mat_set\00\00220\000\001\000\000\00256\000\00221", !1, !10, !43, null, void (%struct.Mat*, i32, float)* @mat_set, null, null, !2} ; [ DW_TAG_subprogram ] [line 220] [def] [scope 221] [mat_set]
!43 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !44, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!44 = !{null, !30, !13, !6}
!45 = !{!"0x2e\00mat_set_init\00mat_set_init\00\00231\000\001\000\000\00256\000\00232", !1, !10, !40, null, void (%struct.Mat*)* @mat_set_init, null, null, !2} ; [ DW_TAG_subprogram ] [line 231] [def] [scope 232] [mat_set_init]
!46 = !{!"0x2e\00jacobi\00jacobi\00\00244\000\001\000\000\00256\000\00246", !1, !10, !47, null, float (i32, %struct.Mat*, %struct.Mat*, %struct.Mat*, %struct.Mat*, %struct.Mat*, %struct.Mat*, %struct.Mat*)* @jacobi, null, null, !2} ; [ DW_TAG_subprogram ] [line 244] [def] [scope 246] [jacobi]
!47 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !48, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!48 = !{!6, !13, !30, !30, !30, !30, !30, !30, !30}
!49 = !{!"0x2e\00second\00second\00\00294\000\001\000\000\000\000\00295", !1, !10, !50, null, double ()* @second, null, null, !2} ; [ DW_TAG_subprogram ] [line 294] [def] [scope 295] [second]
!50 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !51, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!51 = !{!4}
!52 = !{!53, !54, !55, !56, !57, !58, !59, !60, !61, !62}
!53 = !{!"0x34\00omega\00omega\00\0067\000\001", null, !10, !6, float* @omega, null} ; [ DW_TAG_variable ] [omega] [line 67] [def]
!54 = !{!"0x34\00base_sec\00base_sec\00\00300\001\001", !49, !10, !13, i32* @second.base_sec, null} ; [ DW_TAG_variable ] [base_sec] [line 300] [local] [def]
!55 = !{!"0x34\00base_usec\00base_usec\00\00300\001\001", !49, !10, !13, i32* @second.base_usec, null} ; [ DW_TAG_variable ] [base_usec] [line 300] [local] [def]
!56 = !{!"0x34\00a\00a\00\0068\000\001", null, !10, !31, %struct.Mat* @a, null} ; [ DW_TAG_variable ] [a] [line 68] [def]
!57 = !{!"0x34\00b\00b\00\0068\000\001", null, !10, !31, %struct.Mat* @b, null} ; [ DW_TAG_variable ] [b] [line 68] [def]
!58 = !{!"0x34\00c\00c\00\0068\000\001", null, !10, !31, %struct.Mat* @c, null} ; [ DW_TAG_variable ] [c] [line 68] [def]
!59 = !{!"0x34\00p\00p\00\0068\000\001", null, !10, !31, %struct.Mat* @p, null} ; [ DW_TAG_variable ] [p] [line 68] [def]
!60 = !{!"0x34\00bnd\00bnd\00\0068\000\001", null, !10, !31, %struct.Mat* @bnd, null} ; [ DW_TAG_variable ] [bnd] [line 68] [def]
!61 = !{!"0x34\00wrk1\00wrk1\00\0068\000\001", null, !10, !31, %struct.Mat* @wrk1, null} ; [ DW_TAG_variable ] [wrk1] [line 68] [def]
!62 = !{!"0x34\00wrk2\00wrk2\00\0068\000\001", null, !10, !31, %struct.Mat* @wrk2, null} ; [ DW_TAG_variable ] [wrk2] [line 68] [def]
!63 = !{i32 2, !"Dwarf Version", i32 4}
!64 = !{i32 2, !"Debug Info Version", i32 2}
!65 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!66 = !{!"0x101\00argc\0016777287\000", !9, !10, !13} ; [ DW_TAG_arg_variable ] [argc] [line 71]
!67 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!68 = !MDLocation(line: 71, column: 10, scope: !9)
!69 = !{!"0x101\00argv\0033554503\000", !9, !10, !14} ; [ DW_TAG_arg_variable ] [argv] [line 71]
!70 = !MDLocation(line: 71, column: 22, scope: !9)
!71 = !{!"0x100\00i\0073\000", !9, !10, !13}      ; [ DW_TAG_auto_variable ] [i] [line 73]
!72 = !MDLocation(line: 73, column: 10, scope: !9)
!73 = !{!"0x100\00j\0073\000", !9, !10, !13}      ; [ DW_TAG_auto_variable ] [j] [line 73]
!74 = !MDLocation(line: 73, column: 12, scope: !9)
!75 = !{!"0x100\00k\0073\000", !9, !10, !13}      ; [ DW_TAG_auto_variable ] [k] [line 73]
!76 = !MDLocation(line: 73, column: 14, scope: !9)
!77 = !{!"0x100\00nn\0073\000", !9, !10, !13}     ; [ DW_TAG_auto_variable ] [nn] [line 73]
!78 = !MDLocation(line: 73, column: 16, scope: !9)
!79 = !{!"0x100\00imax\0074\000", !9, !10, !13}   ; [ DW_TAG_auto_variable ] [imax] [line 74]
!80 = !MDLocation(line: 74, column: 10, scope: !9)
!81 = !{!"0x100\00jmax\0074\000", !9, !10, !13}   ; [ DW_TAG_auto_variable ] [jmax] [line 74]
!82 = !MDLocation(line: 74, column: 15, scope: !9)
!83 = !{!"0x100\00kmax\0074\000", !9, !10, !13}   ; [ DW_TAG_auto_variable ] [kmax] [line 74]
!84 = !MDLocation(line: 74, column: 20, scope: !9)
!85 = !{!"0x100\00mimax\0074\000", !9, !10, !13}  ; [ DW_TAG_auto_variable ] [mimax] [line 74]
!86 = !MDLocation(line: 74, column: 25, scope: !9)
!87 = !{!"0x100\00mjmax\0074\000", !9, !10, !13}  ; [ DW_TAG_auto_variable ] [mjmax] [line 74]
!88 = !MDLocation(line: 74, column: 31, scope: !9)
!89 = !{!"0x100\00mkmax\0074\000", !9, !10, !13}  ; [ DW_TAG_auto_variable ] [mkmax] [line 74]
!90 = !MDLocation(line: 74, column: 37, scope: !9)
!91 = !{!"0x100\00msize\0074\000", !9, !10, !92}  ; [ DW_TAG_auto_variable ] [msize] [line 74]
!92 = !{!"0x1\00\000\0096\0032\000\000\000", null, null, !13, !93, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 96, align 32, offset 0] [from int]
!93 = !{!94}
!94 = !{!"0x21\000\003"}                          ; [ DW_TAG_subrange_type ] [0, 2]
!95 = !MDLocation(line: 74, column: 43, scope: !9)
!96 = !{!"0x100\00gosa\0075\000", !9, !10, !6}    ; [ DW_TAG_auto_variable ] [gosa] [line 75]
!97 = !MDLocation(line: 75, column: 10, scope: !9)
!98 = !{!"0x100\00cpu0\0076\000", !9, !10, !4}    ; [ DW_TAG_auto_variable ] [cpu0] [line 76]
!99 = !MDLocation(line: 76, column: 11, scope: !9)
!100 = !{!"0x100\00cpu1\0076\000", !9, !10, !4}   ; [ DW_TAG_auto_variable ] [cpu1] [line 76]
!101 = !MDLocation(line: 76, column: 16, scope: !9)
!102 = !{!"0x100\00cpu\0076\000", !9, !10, !4}    ; [ DW_TAG_auto_variable ] [cpu] [line 76]
!103 = !MDLocation(line: 76, column: 21, scope: !9)
!104 = !{!"0x100\00flop\0076\000", !9, !10, !4}   ; [ DW_TAG_auto_variable ] [flop] [line 76]
!105 = !MDLocation(line: 76, column: 25, scope: !9)
!106 = !MDLocation(line: 79, column: 3, scope: !9)
!107 = !MDLocation(line: 80, column: 3, scope: !9)
!108 = !MDLocation(line: 81, column: 3, scope: !9)
!109 = !MDLocation(line: 83, column: 10, scope: !9)
!110 = !MDLocation(line: 83, column: 3, scope: !9)
!111 = !MDLocation(line: 84, column: 10, scope: !9)
!112 = !MDLocation(line: 84, column: 3, scope: !9)
!113 = !MDLocation(line: 85, column: 10, scope: !9)
!114 = !MDLocation(line: 85, column: 3, scope: !9)
!115 = !MDLocation(line: 86, column: 9, scope: !9)
!116 = !MDLocation(line: 86, column: 3, scope: !9)
!117 = !MDLocation(line: 87, column: 9, scope: !9)
!118 = !MDLocation(line: 87, column: 3, scope: !9)
!119 = !MDLocation(line: 88, column: 9, scope: !9)
!120 = !MDLocation(line: 88, column: 3, scope: !9)
!121 = !MDLocation(line: 90, column: 47, scope: !9)
!122 = !MDLocation(line: 90, column: 53, scope: !9)
!123 = !MDLocation(line: 90, column: 59, scope: !9)
!124 = !MDLocation(line: 90, column: 3, scope: !9)
!125 = !MDLocation(line: 91, column: 43, scope: !9)
!126 = !MDLocation(line: 91, column: 48, scope: !9)
!127 = !MDLocation(line: 91, column: 53, scope: !9)
!128 = !MDLocation(line: 91, column: 3, scope: !9)
!129 = !MDLocation(line: 96, column: 15, scope: !9)
!130 = !MDLocation(line: 96, column: 21, scope: !9)
!131 = !MDLocation(line: 96, column: 27, scope: !9)
!132 = !MDLocation(line: 96, column: 3, scope: !9)
!133 = !MDLocation(line: 97, column: 17, scope: !9)
!134 = !MDLocation(line: 97, column: 23, scope: !9)
!135 = !MDLocation(line: 97, column: 29, scope: !9)
!136 = !MDLocation(line: 97, column: 3, scope: !9)
!137 = !MDLocation(line: 98, column: 18, scope: !9)
!138 = !MDLocation(line: 98, column: 24, scope: !9)
!139 = !MDLocation(line: 98, column: 30, scope: !9)
!140 = !MDLocation(line: 98, column: 3, scope: !9)
!141 = !MDLocation(line: 99, column: 18, scope: !9)
!142 = !MDLocation(line: 99, column: 24, scope: !9)
!143 = !MDLocation(line: 99, column: 30, scope: !9)
!144 = !MDLocation(line: 99, column: 3, scope: !9)
!145 = !MDLocation(line: 100, column: 15, scope: !9)
!146 = !MDLocation(line: 100, column: 21, scope: !9)
!147 = !MDLocation(line: 100, column: 27, scope: !9)
!148 = !MDLocation(line: 100, column: 3, scope: !9)
!149 = !MDLocation(line: 101, column: 15, scope: !9)
!150 = !MDLocation(line: 101, column: 21, scope: !9)
!151 = !MDLocation(line: 101, column: 27, scope: !9)
!152 = !MDLocation(line: 101, column: 3, scope: !9)
!153 = !MDLocation(line: 102, column: 15, scope: !9)
!154 = !MDLocation(line: 102, column: 21, scope: !9)
!155 = !MDLocation(line: 102, column: 27, scope: !9)
!156 = !MDLocation(line: 102, column: 3, scope: !9)
!157 = !MDLocation(line: 104, column: 3, scope: !9)
!158 = !MDLocation(line: 105, column: 3, scope: !9)
!159 = !MDLocation(line: 106, column: 3, scope: !9)
!160 = !MDLocation(line: 107, column: 3, scope: !9)
!161 = !MDLocation(line: 108, column: 3, scope: !9)
!162 = !MDLocation(line: 109, column: 3, scope: !9)
!163 = !MDLocation(line: 110, column: 3, scope: !9)
!164 = !MDLocation(line: 111, column: 3, scope: !9)
!165 = !MDLocation(line: 112, column: 3, scope: !9)
!166 = !MDLocation(line: 113, column: 3, scope: !9)
!167 = !MDLocation(line: 114, column: 3, scope: !9)
!168 = !MDLocation(line: 115, column: 3, scope: !9)
!169 = !MDLocation(line: 116, column: 3, scope: !9)
!170 = !MDLocation(line: 117, column: 3, scope: !9)
!171 = !MDLocation(line: 122, column: 3, scope: !9)
!172 = !MDLocation(line: 124, column: 17, scope: !9)
!173 = !MDLocation(line: 124, column: 10, scope: !9)
!174 = !MDLocation(line: 124, column: 3, scope: !9)
!175 = !MDLocation(line: 126, column: 42, scope: !9)
!176 = !MDLocation(line: 126, column: 3, scope: !9)
!177 = !MDLocation(line: 127, column: 26, scope: !9)
!178 = !MDLocation(line: 127, column: 3, scope: !9)
!179 = !MDLocation(line: 132, column: 3, scope: !9)
!180 = !MDLocation(line: 133, column: 3, scope: !9)
!181 = !MDLocation(line: 134, column: 3, scope: !9)
!182 = !MDLocation(line: 135, column: 3, scope: !9)
!183 = !MDLocation(line: 136, column: 3, scope: !9)
!184 = !MDLocation(line: 137, column: 3, scope: !9)
!185 = !MDLocation(line: 138, column: 3, scope: !9)
!186 = !MDLocation(line: 140, column: 3, scope: !9)
!187 = !{!"0x101\00Mat\0016777410\000", !27, !10, !30} ; [ DW_TAG_arg_variable ] [Mat] [line 194]
!188 = !MDLocation(line: 194, column: 16, scope: !27)
!189 = !{!"0x101\00mnums\0033554626\000", !27, !10, !13} ; [ DW_TAG_arg_variable ] [mnums] [line 194]
!190 = !MDLocation(line: 194, column: 25, scope: !27)
!191 = !{!"0x101\00mrows\0050331842\000", !27, !10, !13} ; [ DW_TAG_arg_variable ] [mrows] [line 194]
!192 = !MDLocation(line: 194, column: 35, scope: !27)
!193 = !{!"0x101\00mcols\0067109058\000", !27, !10, !13} ; [ DW_TAG_arg_variable ] [mcols] [line 194]
!194 = !MDLocation(line: 194, column: 46, scope: !27)
!195 = !{!"0x101\00mdeps\0083886274\000", !27, !10, !13} ; [ DW_TAG_arg_variable ] [mdeps] [line 194]
!196 = !MDLocation(line: 194, column: 57, scope: !27)
!197 = !MDLocation(line: 196, column: 15, scope: !27)
!198 = !MDLocation(line: 196, column: 3, scope: !27)
!199 = !MDLocation(line: 197, column: 15, scope: !27)
!200 = !MDLocation(line: 197, column: 3, scope: !27)
!201 = !MDLocation(line: 198, column: 15, scope: !27)
!202 = !MDLocation(line: 198, column: 3, scope: !27)
!203 = !MDLocation(line: 199, column: 15, scope: !27)
!204 = !MDLocation(line: 199, column: 3, scope: !27)
!205 = !MDLocation(line: 200, column: 3, scope: !27)
!206 = !MDLocation(line: 202, column: 12, scope: !27)
!207 = !MDLocation(line: 202, column: 20, scope: !27)
!208 = !MDLocation(line: 202, column: 28, scope: !27)
!209 = !MDLocation(line: 202, column: 36, scope: !27)
!210 = !MDLocation(line: 202, column: 5, scope: !27)
!211 = !MDLocation(line: 201, column: 11, scope: !27)
!212 = !MDLocation(line: 201, column: 3, scope: !27)
!213 = !MDLocation(line: 204, column: 10, scope: !27)
!214 = !MDLocation(line: 204, column: 9, scope: !27)
!215 = !MDLocation(line: 204, column: 3, scope: !27)
!216 = !{!"0x101\00Mat\0016777447\000", !45, !10, !30} ; [ DW_TAG_arg_variable ] [Mat] [line 231]
!217 = !MDLocation(line: 231, column: 22, scope: !45)
!218 = !{!"0x100\00i\00233\000", !45, !10, !13}   ; [ DW_TAG_auto_variable ] [i] [line 233]
!219 = !MDLocation(line: 233, column: 8, scope: !45)
!220 = !{!"0x100\00j\00233\000", !45, !10, !13}   ; [ DW_TAG_auto_variable ] [j] [line 233]
!221 = !MDLocation(line: 233, column: 10, scope: !45)
!222 = !{!"0x100\00k\00233\000", !45, !10, !13}   ; [ DW_TAG_auto_variable ] [k] [line 233]
!223 = !MDLocation(line: 233, column: 12, scope: !45)
!224 = !{!"0x100\00l\00233\000", !45, !10, !13}   ; [ DW_TAG_auto_variable ] [l] [line 233]
!225 = !MDLocation(line: 233, column: 14, scope: !45)
!226 = !{!"0x100\00tt\00234\000", !45, !10, !6}   ; [ DW_TAG_auto_variable ] [tt] [line 234]
!227 = !MDLocation(line: 234, column: 9, scope: !45)
!228 = !MDLocation(line: 236, column: 7, scope: !229)
!229 = !{!"0xb\00236\003\0018", !1, !45}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!230 = !MDLocation(line: 236, column: 12, scope: !231)
!231 = !{!"0xb\002", !1, !232}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!232 = !{!"0xb\001", !1, !233}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!233 = !{!"0xb\00236\003\0019", !1, !229}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!234 = !MDLocation(line: 236, column: 14, scope: !233)
!235 = !MDLocation(line: 236, column: 12, scope: !233)
!236 = !MDLocation(line: 236, column: 3, scope: !229)
!237 = !MDLocation(line: 237, column: 9, scope: !238)
!238 = !{!"0xb\00237\005\0020", !1, !233}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!239 = !MDLocation(line: 237, column: 14, scope: !240)
!240 = !{!"0xb\002", !1, !241}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!241 = !{!"0xb\001", !1, !242}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!242 = !{!"0xb\00237\005\0021", !1, !238}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!243 = !MDLocation(line: 237, column: 16, scope: !242)
!244 = !MDLocation(line: 237, column: 14, scope: !242)
!245 = !MDLocation(line: 237, column: 5, scope: !238)
!246 = !MDLocation(line: 238, column: 11, scope: !247)
!247 = !{!"0xb\00238\007\0022", !1, !242}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!248 = !MDLocation(line: 238, column: 16, scope: !249)
!249 = !{!"0xb\002", !1, !250}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!250 = !{!"0xb\001", !1, !251}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!251 = !{!"0xb\00238\007\0023", !1, !247}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!252 = !MDLocation(line: 238, column: 18, scope: !251)
!253 = !MDLocation(line: 238, column: 16, scope: !251)
!254 = !MDLocation(line: 238, column: 7, scope: !247)
!255 = !MDLocation(line: 239, column: 34, scope: !251)
!256 = !MDLocation(line: 239, column: 36, scope: !251)
!257 = !MDLocation(line: 239, column: 26, scope: !251)
!258 = !MDLocation(line: 240, column: 21, scope: !251)
!259 = !MDLocation(line: 240, column: 38, scope: !251)
!260 = !MDLocation(line: 240, column: 20, scope: !251)
!261 = !MDLocation(line: 240, column: 12, scope: !251)
!262 = !MDLocation(line: 239, column: 9, scope: !251)
!263 = !MDLocation(line: 238, column: 30, scope: !251)
!264 = !MDLocation(line: 238, column: 7, scope: !251)
!265 = !MDLocation(line: 240, column: 53, scope: !247)
!266 = !MDLocation(line: 237, column: 28, scope: !242)
!267 = !MDLocation(line: 237, column: 5, scope: !242)
!268 = !MDLocation(line: 240, column: 53, scope: !238)
!269 = !MDLocation(line: 236, column: 26, scope: !233)
!270 = !MDLocation(line: 236, column: 3, scope: !233)
!271 = !MDLocation(line: 241, column: 1, scope: !45)
!272 = !{!"0x101\00Mat\0016777436\000", !42, !10, !30} ; [ DW_TAG_arg_variable ] [Mat] [line 220]
!273 = !MDLocation(line: 220, column: 17, scope: !42)
!274 = !{!"0x101\00l\0033554652\000", !42, !10, !13} ; [ DW_TAG_arg_variable ] [l] [line 220]
!275 = !MDLocation(line: 220, column: 26, scope: !42)
!276 = !{!"0x101\00val\0050331868\000", !42, !10, !6} ; [ DW_TAG_arg_variable ] [val] [line 220]
!277 = !MDLocation(line: 220, column: 35, scope: !42)
!278 = !{!"0x100\00i\00222\000", !42, !10, !13}   ; [ DW_TAG_auto_variable ] [i] [line 222]
!279 = !MDLocation(line: 222, column: 7, scope: !42)
!280 = !{!"0x100\00j\00222\000", !42, !10, !13}   ; [ DW_TAG_auto_variable ] [j] [line 222]
!281 = !MDLocation(line: 222, column: 9, scope: !42)
!282 = !{!"0x100\00k\00222\000", !42, !10, !13}   ; [ DW_TAG_auto_variable ] [k] [line 222]
!283 = !MDLocation(line: 222, column: 11, scope: !42)
!284 = !MDLocation(line: 224, column: 9, scope: !285)
!285 = !{!"0xb\00224\005\0012", !1, !42}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!286 = !MDLocation(line: 224, column: 14, scope: !287)
!287 = !{!"0xb\002", !1, !288}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!288 = !{!"0xb\001", !1, !289}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!289 = !{!"0xb\00224\005\0013", !1, !285}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!290 = !MDLocation(line: 224, column: 16, scope: !289)
!291 = !MDLocation(line: 224, column: 14, scope: !289)
!292 = !MDLocation(line: 224, column: 5, scope: !285)
!293 = !MDLocation(line: 225, column: 11, scope: !294)
!294 = !{!"0xb\00225\007\0014", !1, !289}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!295 = !MDLocation(line: 225, column: 16, scope: !296)
!296 = !{!"0xb\002", !1, !297}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!297 = !{!"0xb\001", !1, !298}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!298 = !{!"0xb\00225\007\0015", !1, !294}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!299 = !MDLocation(line: 225, column: 18, scope: !298)
!300 = !MDLocation(line: 225, column: 16, scope: !298)
!301 = !MDLocation(line: 225, column: 7, scope: !294)
!302 = !MDLocation(line: 226, column: 13, scope: !303)
!303 = !{!"0xb\00226\009\0016", !1, !298}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!304 = !MDLocation(line: 226, column: 18, scope: !305)
!305 = !{!"0xb\002", !1, !306}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!306 = !{!"0xb\001", !1, !307}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!307 = !{!"0xb\00226\009\0017", !1, !303}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!308 = !MDLocation(line: 226, column: 20, scope: !307)
!309 = !MDLocation(line: 226, column: 18, scope: !307)
!310 = !MDLocation(line: 226, column: 9, scope: !303)
!311 = !MDLocation(line: 227, column: 28, scope: !307)
!312 = !MDLocation(line: 227, column: 11, scope: !307)
!313 = !MDLocation(line: 226, column: 32, scope: !307)
!314 = !MDLocation(line: 226, column: 9, scope: !307)
!315 = !MDLocation(line: 227, column: 28, scope: !303)
!316 = !MDLocation(line: 225, column: 30, scope: !298)
!317 = !MDLocation(line: 225, column: 7, scope: !298)
!318 = !MDLocation(line: 227, column: 28, scope: !294)
!319 = !MDLocation(line: 224, column: 28, scope: !289)
!320 = !MDLocation(line: 224, column: 5, scope: !289)
!321 = !MDLocation(line: 228, column: 1, scope: !42)
!322 = !{!"0x101\00nn\0016777460\000", !46, !10, !13} ; [ DW_TAG_arg_variable ] [nn] [line 244]
!323 = !MDLocation(line: 244, column: 12, scope: !46)
!324 = !{!"0x101\00a\0033554676\000", !46, !10, !30} ; [ DW_TAG_arg_variable ] [a] [line 244]
!325 = !MDLocation(line: 244, column: 24, scope: !46)
!326 = !{!"0x101\00b\0050331892\000", !46, !10, !30} ; [ DW_TAG_arg_variable ] [b] [line 244]
!327 = !MDLocation(line: 244, column: 34, scope: !46)
!328 = !{!"0x101\00c\0067109108\000", !46, !10, !30} ; [ DW_TAG_arg_variable ] [c] [line 244]
!329 = !MDLocation(line: 244, column: 44, scope: !46)
!330 = !{!"0x101\00p\0083886325\000", !46, !10, !30} ; [ DW_TAG_arg_variable ] [p] [line 245]
!331 = !MDLocation(line: 245, column: 16, scope: !46)
!332 = !{!"0x101\00bnd\00100663541\000", !46, !10, !30} ; [ DW_TAG_arg_variable ] [bnd] [line 245]
!333 = !MDLocation(line: 245, column: 26, scope: !46)
!334 = !{!"0x101\00wrk1\00117440757\000", !46, !10, !30} ; [ DW_TAG_arg_variable ] [wrk1] [line 245]
!335 = !MDLocation(line: 245, column: 38, scope: !46)
!336 = !{!"0x101\00wrk2\00134217973\000", !46, !10, !30} ; [ DW_TAG_arg_variable ] [wrk2] [line 245]
!337 = !MDLocation(line: 245, column: 51, scope: !46)
!338 = !{!"0x100\00i\00247\000", !46, !10, !13}   ; [ DW_TAG_auto_variable ] [i] [line 247]
!339 = !MDLocation(line: 247, column: 10, scope: !46)
!340 = !{!"0x100\00j\00247\000", !46, !10, !13}   ; [ DW_TAG_auto_variable ] [j] [line 247]
!341 = !MDLocation(line: 247, column: 12, scope: !46)
!342 = !{!"0x100\00k\00247\000", !46, !10, !13}   ; [ DW_TAG_auto_variable ] [k] [line 247]
!343 = !MDLocation(line: 247, column: 14, scope: !46)
!344 = !{!"0x100\00n\00247\000", !46, !10, !13}   ; [ DW_TAG_auto_variable ] [n] [line 247]
!345 = !MDLocation(line: 247, column: 16, scope: !46)
!346 = !{!"0x100\00imax\00247\000", !46, !10, !13} ; [ DW_TAG_auto_variable ] [imax] [line 247]
!347 = !MDLocation(line: 247, column: 18, scope: !46)
!348 = !{!"0x100\00jmax\00247\000", !46, !10, !13} ; [ DW_TAG_auto_variable ] [jmax] [line 247]
!349 = !MDLocation(line: 247, column: 23, scope: !46)
!350 = !{!"0x100\00kmax\00247\000", !46, !10, !13} ; [ DW_TAG_auto_variable ] [kmax] [line 247]
!351 = !MDLocation(line: 247, column: 28, scope: !46)
!352 = !{!"0x100\00gosa\00248\000", !46, !10, !6} ; [ DW_TAG_auto_variable ] [gosa] [line 248]
!353 = !MDLocation(line: 248, column: 10, scope: !46)
!354 = !{!"0x100\00s0\00248\000", !46, !10, !6}   ; [ DW_TAG_auto_variable ] [s0] [line 248]
!355 = !MDLocation(line: 248, column: 15, scope: !46)
!356 = !{!"0x100\00ss\00248\000", !46, !10, !6}   ; [ DW_TAG_auto_variable ] [ss] [line 248]
!357 = !MDLocation(line: 248, column: 18, scope: !46)
!358 = !MDLocation(line: 250, column: 9, scope: !46)
!359 = !MDLocation(line: 250, column: 3, scope: !46)
!360 = !MDLocation(line: 251, column: 9, scope: !46)
!361 = !MDLocation(line: 251, column: 3, scope: !46)
!362 = !MDLocation(line: 252, column: 9, scope: !46)
!363 = !MDLocation(line: 252, column: 3, scope: !46)
!364 = !MDLocation(line: 254, column: 7, scope: !365)
!365 = !{!"0xb\00254\003\0024", !1, !46}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!366 = !MDLocation(line: 254, column: 13, scope: !367)
!367 = !{!"0xb\002", !1, !368}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!368 = !{!"0xb\001", !1, !369}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!369 = !{!"0xb\00254\003\0025", !1, !365}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!370 = !MDLocation(line: 254, column: 15, scope: !369)
!371 = !MDLocation(line: 254, column: 13, scope: !369)
!372 = !MDLocation(line: 254, column: 3, scope: !365)
!373 = !MDLocation(line: 255, column: 5, scope: !374)
!374 = !{!"0xb\00254\0024\0026", !1, !369}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!375 = !MDLocation(line: 257, column: 9, scope: !376)
!376 = !{!"0xb\00257\005\0027", !1, !374}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!377 = !MDLocation(line: 257, column: 15, scope: !378)
!378 = !{!"0xb\002", !1, !379}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!379 = !{!"0xb\001", !1, !380}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!380 = !{!"0xb\00257\005\0028", !1, !376}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!381 = !MDLocation(line: 257, column: 17, scope: !380)
!382 = !MDLocation(line: 257, column: 15, scope: !380)
!383 = !MDLocation(line: 257, column: 5, scope: !376)
!384 = !MDLocation(line: 258, column: 11, scope: !385)
!385 = !{!"0xb\00258\007\0029", !1, !380}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!386 = !MDLocation(line: 258, column: 17, scope: !387)
!387 = !{!"0xb\002", !1, !388}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!388 = !{!"0xb\001", !1, !389}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!389 = !{!"0xb\00258\007\0030", !1, !385}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!390 = !MDLocation(line: 258, column: 19, scope: !389)
!391 = !MDLocation(line: 258, column: 17, scope: !389)
!392 = !MDLocation(line: 258, column: 7, scope: !385)
!393 = !MDLocation(line: 259, column: 13, scope: !394)
!394 = !{!"0xb\00259\009\0031", !1, !389}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!395 = !MDLocation(line: 259, column: 19, scope: !396)
!396 = !{!"0xb\002", !1, !397}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!397 = !{!"0xb\001", !1, !398}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!398 = !{!"0xb\00259\009\0032", !1, !394}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!399 = !MDLocation(line: 259, column: 21, scope: !398)
!400 = !MDLocation(line: 259, column: 19, scope: !398)
!401 = !MDLocation(line: 259, column: 9, scope: !394)
!402 = !MDLocation(line: 260, column: 15, scope: !403)
!403 = !{!"0xb\00259\0032\0033", !1, !398}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!404 = !MDLocation(line: 260, column: 29, scope: !403)
!405 = !MDLocation(line: 261, column: 15, scope: !403)
!406 = !MDLocation(line: 261, column: 29, scope: !403)
!407 = !MDLocation(line: 262, column: 15, scope: !403)
!408 = !MDLocation(line: 262, column: 29, scope: !403)
!409 = !MDLocation(line: 263, column: 15, scope: !403)
!410 = !MDLocation(line: 264, column: 17, scope: !403)
!411 = !MDLocation(line: 264, column: 37, scope: !403)
!412 = !MDLocation(line: 265, column: 17, scope: !403)
!413 = !MDLocation(line: 265, column: 37, scope: !403)
!414 = !MDLocation(line: 266, column: 15, scope: !403)
!415 = !MDLocation(line: 267, column: 17, scope: !403)
!416 = !MDLocation(line: 267, column: 37, scope: !403)
!417 = !MDLocation(line: 268, column: 17, scope: !403)
!418 = !MDLocation(line: 268, column: 37, scope: !403)
!419 = !MDLocation(line: 269, column: 15, scope: !403)
!420 = !MDLocation(line: 270, column: 17, scope: !403)
!421 = !MDLocation(line: 270, column: 37, scope: !403)
!422 = !MDLocation(line: 271, column: 17, scope: !403)
!423 = !MDLocation(line: 271, column: 37, scope: !403)
!424 = !MDLocation(line: 272, column: 15, scope: !403)
!425 = !MDLocation(line: 272, column: 31, scope: !403)
!426 = !MDLocation(line: 273, column: 15, scope: !403)
!427 = !MDLocation(line: 273, column: 31, scope: !403)
!428 = !MDLocation(line: 274, column: 15, scope: !403)
!429 = !MDLocation(line: 274, column: 31, scope: !403)
!430 = !MDLocation(line: 275, column: 15, scope: !403)
!431 = !MDLocation(line: 260, column: 11, scope: !403)
!432 = !MDLocation(line: 277, column: 16, scope: !403)
!433 = !MDLocation(line: 277, column: 19, scope: !403)
!434 = !MDLocation(line: 277, column: 35, scope: !403)
!435 = !MDLocation(line: 277, column: 50, scope: !403)
!436 = !MDLocation(line: 277, column: 15, scope: !403)
!437 = !MDLocation(line: 277, column: 11, scope: !403)
!438 = !MDLocation(line: 279, column: 18, scope: !403)
!439 = !MDLocation(line: 279, column: 21, scope: !403)
!440 = !MDLocation(line: 279, column: 11, scope: !403)
!441 = !MDLocation(line: 280, column: 29, scope: !403)
!442 = !MDLocation(line: 280, column: 45, scope: !403)
!443 = !MDLocation(line: 280, column: 51, scope: !403)
!444 = !MDLocation(line: 280, column: 11, scope: !403)
!445 = !MDLocation(line: 281, column: 9, scope: !403)
!446 = !MDLocation(line: 259, column: 28, scope: !398)
!447 = !MDLocation(line: 259, column: 9, scope: !398)
!448 = !MDLocation(line: 281, column: 9, scope: !394)
!449 = !MDLocation(line: 258, column: 26, scope: !389)
!450 = !MDLocation(line: 258, column: 7, scope: !389)
!451 = !MDLocation(line: 281, column: 9, scope: !385)
!452 = !MDLocation(line: 257, column: 23, scope: !380)
!453 = !MDLocation(line: 257, column: 5, scope: !380)
!454 = !MDLocation(line: 283, column: 9, scope: !455)
!455 = !{!"0xb\00283\005\0034", !1, !374}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!456 = !MDLocation(line: 283, column: 15, scope: !457)
!457 = !{!"0xb\002", !1, !458}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!458 = !{!"0xb\001", !1, !459}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!459 = !{!"0xb\00283\005\0035", !1, !455}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!460 = !MDLocation(line: 283, column: 17, scope: !459)
!461 = !MDLocation(line: 283, column: 15, scope: !459)
!462 = !MDLocation(line: 283, column: 5, scope: !455)
!463 = !MDLocation(line: 284, column: 11, scope: !464)
!464 = !{!"0xb\00284\007\0036", !1, !459}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!465 = !MDLocation(line: 284, column: 17, scope: !466)
!466 = !{!"0xb\002", !1, !467}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!467 = !{!"0xb\001", !1, !468}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!468 = !{!"0xb\00284\007\0037", !1, !464}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!469 = !MDLocation(line: 284, column: 19, scope: !468)
!470 = !MDLocation(line: 284, column: 17, scope: !468)
!471 = !MDLocation(line: 284, column: 7, scope: !464)
!472 = !MDLocation(line: 285, column: 13, scope: !473)
!473 = !{!"0xb\00285\009\0038", !1, !468}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!474 = !MDLocation(line: 285, column: 19, scope: !475)
!475 = !{!"0xb\002", !1, !476}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!476 = !{!"0xb\001", !1, !477}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!477 = !{!"0xb\00285\009\0039", !1, !473}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!478 = !MDLocation(line: 285, column: 21, scope: !477)
!479 = !MDLocation(line: 285, column: 19, scope: !477)
!480 = !MDLocation(line: 285, column: 9, scope: !473)
!481 = !MDLocation(line: 286, column: 26, scope: !477)
!482 = !MDLocation(line: 286, column: 11, scope: !477)
!483 = !MDLocation(line: 285, column: 28, scope: !477)
!484 = !MDLocation(line: 285, column: 9, scope: !477)
!485 = !MDLocation(line: 286, column: 26, scope: !473)
!486 = !MDLocation(line: 284, column: 26, scope: !468)
!487 = !MDLocation(line: 284, column: 7, scope: !468)
!488 = !MDLocation(line: 286, column: 26, scope: !464)
!489 = !MDLocation(line: 283, column: 24, scope: !459)
!490 = !MDLocation(line: 283, column: 5, scope: !459)
!491 = !MDLocation(line: 288, column: 3, scope: !374)
!492 = !MDLocation(line: 254, column: 20, scope: !369)
!493 = !MDLocation(line: 254, column: 3, scope: !369)
!494 = !MDLocation(line: 290, column: 10, scope: !46)
!495 = !MDLocation(line: 290, column: 3, scope: !46)
!496 = !{!"0x101\00Mat\0016777424\000", !39, !10, !30} ; [ DW_TAG_arg_variable ] [Mat] [line 208]
!497 = !MDLocation(line: 208, column: 18, scope: !39)
!498 = !MDLocation(line: 210, column: 6, scope: !499)
!499 = !{!"0xb\00210\006\0011", !1, !39}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!500 = !MDLocation(line: 210, column: 6, scope: !39)
!501 = !MDLocation(line: 211, column: 10, scope: !499)
!502 = !MDLocation(line: 211, column: 5, scope: !499)
!503 = !MDLocation(line: 212, column: 3, scope: !39)
!504 = !MDLocation(line: 213, column: 3, scope: !39)
!505 = !MDLocation(line: 214, column: 3, scope: !39)
!506 = !MDLocation(line: 215, column: 3, scope: !39)
!507 = !MDLocation(line: 216, column: 3, scope: !39)
!508 = !MDLocation(line: 217, column: 1, scope: !39)
!509 = !{!"0x101\00mx\0016777360\000", !17, !10, !13} ; [ DW_TAG_arg_variable ] [mx] [line 144]
!510 = !MDLocation(line: 144, column: 11, scope: !17)
!511 = !{!"0x101\00my\0033554576\000", !17, !10, !13} ; [ DW_TAG_arg_variable ] [my] [line 144]
!512 = !MDLocation(line: 144, column: 18, scope: !17)
!513 = !{!"0x101\00mz\0050331792\000", !17, !10, !13} ; [ DW_TAG_arg_variable ] [mz] [line 144]
!514 = !MDLocation(line: 144, column: 26, scope: !17)
!515 = !MDLocation(line: 146, column: 19, scope: !17)
!516 = !MDLocation(line: 146, column: 10, scope: !17)
!517 = !MDLocation(line: 146, column: 34, scope: !17)
!518 = !MDLocation(line: 146, column: 25, scope: !17)
!519 = !MDLocation(line: 146, column: 49, scope: !17)
!520 = !MDLocation(line: 146, column: 40, scope: !17)
!521 = !MDLocation(line: 146, column: 3, scope: !17)
!522 = !{!"0x101\00nn\0016777366\000", !20, !10, !13} ; [ DW_TAG_arg_variable ] [nn] [line 150]
!523 = !MDLocation(line: 150, column: 12, scope: !20)
!524 = !{!"0x101\00cpu\0033554582\000", !20, !10, !4} ; [ DW_TAG_arg_variable ] [cpu] [line 150]
!525 = !MDLocation(line: 150, column: 22, scope: !20)
!526 = !{!"0x101\00flop\0050331798\000", !20, !10, !4} ; [ DW_TAG_arg_variable ] [flop] [line 150]
!527 = !MDLocation(line: 150, column: 33, scope: !20)
!528 = !MDLocation(line: 152, column: 10, scope: !20)
!529 = !MDLocation(line: 152, column: 15, scope: !20)
!530 = !MDLocation(line: 152, column: 33, scope: !20)
!531 = !MDLocation(line: 152, column: 25, scope: !20)
!532 = !MDLocation(line: 152, column: 3, scope: !20)
!533 = !{!"0x101\00is\0016777372\000", !23, !10, !26} ; [ DW_TAG_arg_variable ] [is] [line 156]
!534 = !MDLocation(line: 156, column: 15, scope: !23)
!535 = !{!"0x101\00size\0033554588\000", !23, !10, !15} ; [ DW_TAG_arg_variable ] [size] [line 156]
!536 = !MDLocation(line: 156, column: 26, scope: !23)
!537 = !MDLocation(line: 158, column: 14, scope: !538)
!538 = !{!"0xb\00158\006\000", !1, !23}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!539 = !MDLocation(line: 158, column: 7, scope: !538)
!540 = !MDLocation(line: 158, column: 6, scope: !23)
!541 = !MDLocation(line: 158, column: 36, scope: !542)
!542 = !{!"0xb\001", !1, !538}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!543 = !MDLocation(line: 158, column: 29, scope: !538)
!544 = !MDLocation(line: 159, column: 5, scope: !545)
!545 = !{!"0xb\00158\0047\001", !1, !538}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!546 = !MDLocation(line: 160, column: 5, scope: !545)
!547 = !MDLocation(line: 161, column: 5, scope: !545)
!548 = !MDLocation(line: 162, column: 5, scope: !545)
!549 = !MDLocation(line: 164, column: 14, scope: !550)
!550 = !{!"0xb\00164\006\002", !1, !23}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!551 = !MDLocation(line: 164, column: 7, scope: !550)
!552 = !MDLocation(line: 164, column: 6, scope: !23)
!553 = !MDLocation(line: 164, column: 35, scope: !554)
!554 = !{!"0xb\001", !1, !550}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!555 = !MDLocation(line: 164, column: 28, scope: !550)
!556 = !MDLocation(line: 165, column: 5, scope: !557)
!557 = !{!"0xb\00164\0045\003", !1, !550}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!558 = !MDLocation(line: 166, column: 5, scope: !557)
!559 = !MDLocation(line: 167, column: 5, scope: !557)
!560 = !MDLocation(line: 168, column: 5, scope: !557)
!561 = !MDLocation(line: 170, column: 14, scope: !562)
!562 = !{!"0xb\00170\006\004", !1, !23}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!563 = !MDLocation(line: 170, column: 7, scope: !562)
!564 = !MDLocation(line: 170, column: 6, scope: !23)
!565 = !MDLocation(line: 170, column: 35, scope: !566)
!566 = !{!"0xb\001", !1, !562}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!567 = !MDLocation(line: 170, column: 28, scope: !562)
!568 = !MDLocation(line: 171, column: 5, scope: !569)
!569 = !{!"0xb\00170\0045\005", !1, !562}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!570 = !MDLocation(line: 172, column: 5, scope: !569)
!571 = !MDLocation(line: 173, column: 5, scope: !569)
!572 = !MDLocation(line: 174, column: 5, scope: !569)
!573 = !MDLocation(line: 176, column: 14, scope: !574)
!574 = !{!"0xb\00176\006\006", !1, !23}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!575 = !MDLocation(line: 176, column: 7, scope: !574)
!576 = !MDLocation(line: 176, column: 6, scope: !23)
!577 = !MDLocation(line: 176, column: 35, scope: !578)
!578 = !{!"0xb\001", !1, !574}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!579 = !MDLocation(line: 176, column: 28, scope: !574)
!580 = !MDLocation(line: 177, column: 5, scope: !581)
!581 = !{!"0xb\00176\0045\007", !1, !574}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!582 = !MDLocation(line: 178, column: 5, scope: !581)
!583 = !MDLocation(line: 179, column: 5, scope: !581)
!584 = !MDLocation(line: 180, column: 5, scope: !581)
!585 = !MDLocation(line: 182, column: 14, scope: !586)
!586 = !{!"0xb\00182\006\008", !1, !23}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!587 = !MDLocation(line: 182, column: 7, scope: !586)
!588 = !MDLocation(line: 182, column: 6, scope: !23)
!589 = !MDLocation(line: 182, column: 36, scope: !590)
!590 = !{!"0xb\001", !1, !586}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!591 = !MDLocation(line: 182, column: 29, scope: !586)
!592 = !MDLocation(line: 183, column: 5, scope: !593)
!593 = !{!"0xb\00182\0047\009", !1, !586}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!594 = !MDLocation(line: 184, column: 5, scope: !593)
!595 = !MDLocation(line: 185, column: 5, scope: !593)
!596 = !MDLocation(line: 186, column: 5, scope: !593)
!597 = !MDLocation(line: 188, column: 5, scope: !598)
!598 = !{!"0xb\00187\0010\0010", !1, !586}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!599 = !MDLocation(line: 189, column: 5, scope: !598)
!600 = !MDLocation(line: 191, column: 1, scope: !23)
!601 = !{!"0x100\00tm\00297\000", !49, !10, !602} ; [ DW_TAG_auto_variable ] [tm] [line 297]
!602 = !{!"0x13\00timeval\0030\00128\0064\000\000\000", !603, null, null, !604, null, null, null} ; [ DW_TAG_structure_type ] [timeval] [line 30, size 128, align 64, offset 0] [def] [from ]
!603 = !{!"/usr/include/x86_64-linux-gnu/bits/time.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!604 = !{!605, !609}
!605 = !{!"0xd\00tv_sec\0032\0064\0064\000\000", !603, !602, !606} ; [ DW_TAG_member ] [tv_sec] [line 32, size 64, align 64, offset 0] [from __time_t]
!606 = !{!"0x16\00__time_t\00139\000\000\000\000", !607, null, !608} ; [ DW_TAG_typedef ] [__time_t] [line 139, size 0, align 0, offset 0] [from long int]
!607 = !{!"/usr/include/x86_64-linux-gnu/bits/types.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!608 = !{!"0x24\00long int\000\0064\0064\000\000\005", null, null} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!609 = !{!"0xd\00tv_usec\0033\0064\0064\0064\000", !603, !602, !610} ; [ DW_TAG_member ] [tv_usec] [line 33, size 64, align 64, offset 64] [from __suseconds_t]
!610 = !{!"0x16\00__suseconds_t\00141\000\000\000\000", !607, null, !608} ; [ DW_TAG_typedef ] [__suseconds_t] [line 141, size 0, align 0, offset 0] [from long int]
!611 = !MDLocation(line: 297, column: 18, scope: !49)
!612 = !{!"0x100\00t\00298\000", !49, !10, !4}    ; [ DW_TAG_auto_variable ] [t] [line 298]
!613 = !MDLocation(line: 298, column: 10, scope: !49)
!614 = !MDLocation(line: 302, column: 3, scope: !49)
!615 = !MDLocation(line: 304, column: 6, scope: !616)
!616 = !{!"0xb\00304\006\0040", !1, !49}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!617 = !MDLocation(line: 304, column: 6, scope: !49)
!618 = !MDLocation(line: 304, column: 23, scope: !619)
!619 = !{!"0xb\001", !1, !616}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!620 = !MDLocation(line: 306, column: 18, scope: !621)
!621 = !{!"0xb\00305\005\0041", !1, !616}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!622 = !MDLocation(line: 306, column: 7, scope: !621)
!623 = !MDLocation(line: 307, column: 19, scope: !621)
!624 = !MDLocation(line: 307, column: 7, scope: !621)
!625 = !MDLocation(line: 308, column: 7, scope: !621)
!626 = !MDLocation(line: 309, column: 3, scope: !621)
!627 = !MDLocation(line: 310, column: 19, scope: !628)
!628 = !{!"0xb\00309\0010\0042", !1, !616}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!629 = !MDLocation(line: 310, column: 29, scope: !628)
!630 = !MDLocation(line: 310, column: 9, scope: !628)
!631 = !MDLocation(line: 311, column: 18, scope: !628)
!632 = !MDLocation(line: 311, column: 29, scope: !628)
!633 = !MDLocation(line: 311, column: 8, scope: !628)
!634 = !MDLocation(line: 311, column: 7, scope: !628)
!635 = !MDLocation(line: 310, column: 5, scope: !628)
!636 = !MDLocation(line: 314, column: 10, scope: !49)
!637 = !MDLocation(line: 314, column: 3, scope: !49)
