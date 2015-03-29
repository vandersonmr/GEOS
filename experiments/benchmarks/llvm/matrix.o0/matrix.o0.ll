; ModuleID = 'matrix.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [13 x i8] c"%d %d %d %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32** @mkmatrix(i32 %rows, i32 %cols) #0 {
entry:
  %rows.addr = alloca i32, align 4
  %cols.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %count = alloca i32, align 4
  %m = alloca i32**, align 8
  store i32 %rows, i32* %rows.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %rows.addr, metadata !30, metadata !31), !dbg !32
  store i32 %cols, i32* %cols.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %cols.addr, metadata !33, metadata !31), !dbg !34
  call void @llvm.dbg.declare(metadata i32* %i, metadata !35, metadata !31), !dbg !36
  call void @llvm.dbg.declare(metadata i32* %j, metadata !37, metadata !31), !dbg !38
  call void @llvm.dbg.declare(metadata i32* %count, metadata !39, metadata !31), !dbg !40
  store i32 1, i32* %count, align 4, !dbg !40
  call void @llvm.dbg.declare(metadata i32*** %m, metadata !41, metadata !31), !dbg !42
  %0 = load i32* %rows.addr, align 4, !dbg !43
  %conv = sext i32 %0 to i64, !dbg !43
  %mul = mul i64 %conv, 8, !dbg !43
  %call = call noalias i8* @malloc(i64 %mul) #5, !dbg !44
  %1 = bitcast i8* %call to i32**, !dbg !45
  store i32** %1, i32*** %m, align 8, !dbg !42
  store i32 0, i32* %i, align 4, !dbg !46
  br label %for.cond, !dbg !46

for.cond:                                         ; preds = %for.inc14, %entry
  %2 = load i32* %i, align 4, !dbg !48
  %3 = load i32* %rows.addr, align 4, !dbg !52
  %cmp = icmp slt i32 %2, %3, !dbg !53
  br i1 %cmp, label %for.body, label %for.end16, !dbg !54

for.body:                                         ; preds = %for.cond
  %4 = load i32* %cols.addr, align 4, !dbg !55
  %conv2 = sext i32 %4 to i64, !dbg !55
  %mul3 = mul i64 %conv2, 4, !dbg !55
  %call4 = call noalias i8* @malloc(i64 %mul3) #5, !dbg !57
  %5 = bitcast i8* %call4 to i32*, !dbg !58
  %6 = load i32* %i, align 4, !dbg !59
  %idxprom = sext i32 %6 to i64, !dbg !60
  %7 = load i32*** %m, align 8, !dbg !60
  %arrayidx = getelementptr inbounds i32** %7, i64 %idxprom, !dbg !60
  store i32* %5, i32** %arrayidx, align 8, !dbg !60
  store i32 0, i32* %j, align 4, !dbg !61
  br label %for.cond5, !dbg !61

for.cond5:                                        ; preds = %for.inc, %for.body
  %8 = load i32* %j, align 4, !dbg !63
  %9 = load i32* %cols.addr, align 4, !dbg !67
  %cmp6 = icmp slt i32 %8, %9, !dbg !68
  br i1 %cmp6, label %for.body8, label %for.end, !dbg !69

for.body8:                                        ; preds = %for.cond5
  %10 = load i32* %count, align 4, !dbg !70
  %inc = add nsw i32 %10, 1, !dbg !70
  store i32 %inc, i32* %count, align 4, !dbg !70
  %11 = load i32* %j, align 4, !dbg !72
  %idxprom9 = sext i32 %11 to i64, !dbg !73
  %12 = load i32* %i, align 4, !dbg !74
  %idxprom10 = sext i32 %12 to i64, !dbg !73
  %13 = load i32*** %m, align 8, !dbg !73
  %arrayidx11 = getelementptr inbounds i32** %13, i64 %idxprom10, !dbg !73
  %14 = load i32** %arrayidx11, align 8, !dbg !73
  %arrayidx12 = getelementptr inbounds i32* %14, i64 %idxprom9, !dbg !73
  store i32 %10, i32* %arrayidx12, align 4, !dbg !73
  br label %for.inc, !dbg !75

for.inc:                                          ; preds = %for.body8
  %15 = load i32* %j, align 4, !dbg !76
  %inc13 = add nsw i32 %15, 1, !dbg !76
  store i32 %inc13, i32* %j, align 4, !dbg !76
  br label %for.cond5, !dbg !77

for.end:                                          ; preds = %for.cond5
  br label %for.inc14, !dbg !78

for.inc14:                                        ; preds = %for.end
  %16 = load i32* %i, align 4, !dbg !79
  %inc15 = add nsw i32 %16, 1, !dbg !79
  store i32 %inc15, i32* %i, align 4, !dbg !79
  br label %for.cond, !dbg !80

for.end16:                                        ; preds = %for.cond
  %17 = load i32*** %m, align 8, !dbg !81
  ret i32** %17, !dbg !82
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind uwtable
define void @zeromatrix(i32 %rows, i32 %cols, i32** %m) #0 {
entry:
  %rows.addr = alloca i32, align 4
  %cols.addr = alloca i32, align 4
  %m.addr = alloca i32**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %rows, i32* %rows.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %rows.addr, metadata !83, metadata !31), !dbg !84
  store i32 %cols, i32* %cols.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %cols.addr, metadata !85, metadata !31), !dbg !86
  store i32** %m, i32*** %m.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %m.addr, metadata !87, metadata !31), !dbg !88
  call void @llvm.dbg.declare(metadata i32* %i, metadata !89, metadata !31), !dbg !90
  call void @llvm.dbg.declare(metadata i32* %j, metadata !91, metadata !31), !dbg !92
  store i32 0, i32* %i, align 4, !dbg !93
  br label %for.cond, !dbg !93

for.cond:                                         ; preds = %for.inc6, %entry
  %0 = load i32* %i, align 4, !dbg !95
  %1 = load i32* %rows.addr, align 4, !dbg !99
  %cmp = icmp slt i32 %0, %1, !dbg !100
  br i1 %cmp, label %for.body, label %for.end8, !dbg !101

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !102
  br label %for.cond1, !dbg !102

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32* %j, align 4, !dbg !104
  %3 = load i32* %cols.addr, align 4, !dbg !108
  %cmp2 = icmp slt i32 %2, %3, !dbg !109
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !110

for.body3:                                        ; preds = %for.cond1
  %4 = load i32* %j, align 4, !dbg !111
  %idxprom = sext i32 %4 to i64, !dbg !112
  %5 = load i32* %i, align 4, !dbg !113
  %idxprom4 = sext i32 %5 to i64, !dbg !112
  %6 = load i32*** %m.addr, align 8, !dbg !112
  %arrayidx = getelementptr inbounds i32** %6, i64 %idxprom4, !dbg !112
  %7 = load i32** %arrayidx, align 8, !dbg !112
  %arrayidx5 = getelementptr inbounds i32* %7, i64 %idxprom, !dbg !112
  store i32 0, i32* %arrayidx5, align 4, !dbg !112
  br label %for.inc, !dbg !112

for.inc:                                          ; preds = %for.body3
  %8 = load i32* %j, align 4, !dbg !114
  %inc = add nsw i32 %8, 1, !dbg !114
  store i32 %inc, i32* %j, align 4, !dbg !114
  br label %for.cond1, !dbg !115

for.end:                                          ; preds = %for.cond1
  br label %for.inc6, !dbg !116

for.inc6:                                         ; preds = %for.end
  %9 = load i32* %i, align 4, !dbg !117
  %inc7 = add nsw i32 %9, 1, !dbg !117
  store i32 %inc7, i32* %i, align 4, !dbg !117
  br label %for.cond, !dbg !118

for.end8:                                         ; preds = %for.cond
  ret void, !dbg !119
}

; Function Attrs: nounwind uwtable
define void @freematrix(i32 %rows, i32** %m) #0 {
entry:
  %rows.addr = alloca i32, align 4
  %m.addr = alloca i32**, align 8
  store i32 %rows, i32* %rows.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %rows.addr, metadata !120, metadata !31), !dbg !121
  store i32** %m, i32*** %m.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %m.addr, metadata !122, metadata !31), !dbg !123
  br label %while.cond, !dbg !124

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i32* %rows.addr, align 4, !dbg !125
  %dec = add nsw i32 %0, -1, !dbg !125
  store i32 %dec, i32* %rows.addr, align 4, !dbg !125
  %cmp = icmp sgt i32 %dec, -1, !dbg !125
  br i1 %cmp, label %while.body, label %while.end, !dbg !124

while.body:                                       ; preds = %while.cond
  %1 = load i32* %rows.addr, align 4, !dbg !128
  %idxprom = sext i32 %1 to i64, !dbg !131
  %2 = load i32*** %m.addr, align 8, !dbg !131
  %arrayidx = getelementptr inbounds i32** %2, i64 %idxprom, !dbg !131
  %3 = load i32** %arrayidx, align 8, !dbg !131
  %4 = bitcast i32* %3 to i8*, !dbg !131
  call void @free(i8* %4) #5, !dbg !132
  br label %while.cond, !dbg !124

while.end:                                        ; preds = %while.cond
  %5 = load i32*** %m.addr, align 8, !dbg !133
  %6 = bitcast i32** %5 to i8*, !dbg !133
  call void @free(i8* %6) #5, !dbg !134
  ret void, !dbg !135
}

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: nounwind uwtable
define i32** @mmult(i32 %rows, i32 %cols, i32** %m1, i32** %m2, i32** %m3) #0 {
entry:
  %rows.addr = alloca i32, align 4
  %cols.addr = alloca i32, align 4
  %m1.addr = alloca i32**, align 8
  %m2.addr = alloca i32**, align 8
  %m3.addr = alloca i32**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %val = alloca i32, align 4
  store i32 %rows, i32* %rows.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %rows.addr, metadata !136, metadata !31), !dbg !137
  store i32 %cols, i32* %cols.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %cols.addr, metadata !138, metadata !31), !dbg !139
  store i32** %m1, i32*** %m1.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %m1.addr, metadata !140, metadata !31), !dbg !141
  store i32** %m2, i32*** %m2.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %m2.addr, metadata !142, metadata !31), !dbg !143
  store i32** %m3, i32*** %m3.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %m3.addr, metadata !144, metadata !31), !dbg !145
  call void @llvm.dbg.declare(metadata i32* %i, metadata !146, metadata !31), !dbg !147
  call void @llvm.dbg.declare(metadata i32* %j, metadata !148, metadata !31), !dbg !149
  call void @llvm.dbg.declare(metadata i32* %k, metadata !150, metadata !31), !dbg !151
  call void @llvm.dbg.declare(metadata i32* %val, metadata !152, metadata !31), !dbg !153
  store i32 0, i32* %i, align 4, !dbg !154
  br label %for.cond, !dbg !154

for.cond:                                         ; preds = %for.inc20, %entry
  %0 = load i32* %i, align 4, !dbg !156
  %1 = load i32* %rows.addr, align 4, !dbg !160
  %cmp = icmp slt i32 %0, %1, !dbg !161
  br i1 %cmp, label %for.body, label %for.end22, !dbg !162

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !163
  br label %for.cond1, !dbg !163

for.cond1:                                        ; preds = %for.inc17, %for.body
  %2 = load i32* %j, align 4, !dbg !166
  %3 = load i32* %cols.addr, align 4, !dbg !170
  %cmp2 = icmp slt i32 %2, %3, !dbg !171
  br i1 %cmp2, label %for.body3, label %for.end19, !dbg !172

for.body3:                                        ; preds = %for.cond1
  store i32 0, i32* %val, align 4, !dbg !173
  store i32 0, i32* %k, align 4, !dbg !175
  br label %for.cond4, !dbg !175

for.cond4:                                        ; preds = %for.inc, %for.body3
  %4 = load i32* %k, align 4, !dbg !177
  %5 = load i32* %cols.addr, align 4, !dbg !181
  %cmp5 = icmp slt i32 %4, %5, !dbg !182
  br i1 %cmp5, label %for.body6, label %for.end, !dbg !183

for.body6:                                        ; preds = %for.cond4
  %6 = load i32* %k, align 4, !dbg !184
  %idxprom = sext i32 %6 to i64, !dbg !186
  %7 = load i32* %i, align 4, !dbg !187
  %idxprom7 = sext i32 %7 to i64, !dbg !186
  %8 = load i32*** %m1.addr, align 8, !dbg !186
  %arrayidx = getelementptr inbounds i32** %8, i64 %idxprom7, !dbg !186
  %9 = load i32** %arrayidx, align 8, !dbg !186
  %arrayidx8 = getelementptr inbounds i32* %9, i64 %idxprom, !dbg !186
  %10 = load i32* %arrayidx8, align 4, !dbg !186
  %11 = load i32* %j, align 4, !dbg !188
  %idxprom9 = sext i32 %11 to i64, !dbg !189
  %12 = load i32* %k, align 4, !dbg !190
  %idxprom10 = sext i32 %12 to i64, !dbg !189
  %13 = load i32*** %m2.addr, align 8, !dbg !189
  %arrayidx11 = getelementptr inbounds i32** %13, i64 %idxprom10, !dbg !189
  %14 = load i32** %arrayidx11, align 8, !dbg !189
  %arrayidx12 = getelementptr inbounds i32* %14, i64 %idxprom9, !dbg !189
  %15 = load i32* %arrayidx12, align 4, !dbg !189
  %mul = mul nsw i32 %10, %15, !dbg !186
  %16 = load i32* %val, align 4, !dbg !191
  %add = add nsw i32 %16, %mul, !dbg !191
  store i32 %add, i32* %val, align 4, !dbg !191
  br label %for.inc, !dbg !192

for.inc:                                          ; preds = %for.body6
  %17 = load i32* %k, align 4, !dbg !193
  %inc = add nsw i32 %17, 1, !dbg !193
  store i32 %inc, i32* %k, align 4, !dbg !193
  br label %for.cond4, !dbg !194

for.end:                                          ; preds = %for.cond4
  %18 = load i32* %val, align 4, !dbg !195
  %19 = load i32* %j, align 4, !dbg !196
  %idxprom13 = sext i32 %19 to i64, !dbg !197
  %20 = load i32* %i, align 4, !dbg !198
  %idxprom14 = sext i32 %20 to i64, !dbg !197
  %21 = load i32*** %m3.addr, align 8, !dbg !197
  %arrayidx15 = getelementptr inbounds i32** %21, i64 %idxprom14, !dbg !197
  %22 = load i32** %arrayidx15, align 8, !dbg !197
  %arrayidx16 = getelementptr inbounds i32* %22, i64 %idxprom13, !dbg !197
  store i32 %18, i32* %arrayidx16, align 4, !dbg !197
  br label %for.inc17, !dbg !199

for.inc17:                                        ; preds = %for.end
  %23 = load i32* %j, align 4, !dbg !200
  %inc18 = add nsw i32 %23, 1, !dbg !200
  store i32 %inc18, i32* %j, align 4, !dbg !200
  br label %for.cond1, !dbg !201

for.end19:                                        ; preds = %for.cond1
  br label %for.inc20, !dbg !202

for.inc20:                                        ; preds = %for.end19
  %24 = load i32* %i, align 4, !dbg !203
  %inc21 = add nsw i32 %24, 1, !dbg !203
  store i32 %inc21, i32* %i, align 4, !dbg !203
  br label %for.cond, !dbg !204

for.end22:                                        ; preds = %for.cond
  %25 = load i32*** %m3.addr, align 8, !dbg !205
  ret i32** %25, !dbg !206
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  %n = alloca i32, align 4
  %m1 = alloca i32**, align 8
  %m2 = alloca i32**, align 8
  %mm = alloca i32**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !207, metadata !31), !dbg !208
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !209, metadata !31), !dbg !210
  call void @llvm.dbg.declare(metadata i32* %i, metadata !211, metadata !31), !dbg !212
  call void @llvm.dbg.declare(metadata i32* %n, metadata !213, metadata !31), !dbg !214
  %0 = load i32* %argc.addr, align 4, !dbg !215
  %cmp = icmp eq i32 %0, 2, !dbg !215
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !216

cond.true:                                        ; preds = %entry
  %1 = load i8*** %argv.addr, align 8, !dbg !217
  %arrayidx = getelementptr inbounds i8** %1, i64 1, !dbg !217
  %2 = load i8** %arrayidx, align 8, !dbg !217
  %call = call i32 @atoi(i8* %2) #6, !dbg !219
  br label %cond.end, !dbg !216

cond.false:                                       ; preds = %entry
  br label %cond.end, !dbg !220

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call, %cond.true ], [ 3000000, %cond.false ], !dbg !216
  store i32 %cond, i32* %n, align 4, !dbg !222
  call void @llvm.dbg.declare(metadata i32*** %m1, metadata !225, metadata !31), !dbg !226
  %call1 = call i32** @mkmatrix(i32 10, i32 10), !dbg !227
  store i32** %call1, i32*** %m1, align 8, !dbg !226
  call void @llvm.dbg.declare(metadata i32*** %m2, metadata !228, metadata !31), !dbg !229
  %call2 = call i32** @mkmatrix(i32 10, i32 10), !dbg !230
  store i32** %call2, i32*** %m2, align 8, !dbg !229
  call void @llvm.dbg.declare(metadata i32*** %mm, metadata !231, metadata !31), !dbg !232
  %call3 = call i32** @mkmatrix(i32 10, i32 10), !dbg !233
  store i32** %call3, i32*** %mm, align 8, !dbg !232
  store i32 0, i32* %i, align 4, !dbg !234
  br label %for.cond, !dbg !234

for.cond:                                         ; preds = %for.inc, %cond.end
  %3 = load i32* %i, align 4, !dbg !236
  %4 = load i32* %n, align 4, !dbg !240
  %cmp4 = icmp slt i32 %3, %4, !dbg !241
  br i1 %cmp4, label %for.body, label %for.end, !dbg !242

for.body:                                         ; preds = %for.cond
  %5 = load i32*** %m1, align 8, !dbg !243
  %6 = load i32*** %m2, align 8, !dbg !245
  %7 = load i32*** %mm, align 8, !dbg !246
  %call5 = call i32** @mmult(i32 10, i32 10, i32** %5, i32** %6, i32** %7), !dbg !247
  store i32** %call5, i32*** %mm, align 8, !dbg !248
  br label %for.inc, !dbg !249

for.inc:                                          ; preds = %for.body
  %8 = load i32* %i, align 4, !dbg !250
  %inc = add nsw i32 %8, 1, !dbg !250
  store i32 %inc, i32* %i, align 4, !dbg !250
  br label %for.cond, !dbg !251

for.end:                                          ; preds = %for.cond
  %9 = load i32*** %mm, align 8, !dbg !252
  %arrayidx6 = getelementptr inbounds i32** %9, i64 0, !dbg !252
  %10 = load i32** %arrayidx6, align 8, !dbg !252
  %arrayidx7 = getelementptr inbounds i32* %10, i64 0, !dbg !252
  %11 = load i32* %arrayidx7, align 4, !dbg !252
  %12 = load i32*** %mm, align 8, !dbg !253
  %arrayidx8 = getelementptr inbounds i32** %12, i64 2, !dbg !253
  %13 = load i32** %arrayidx8, align 8, !dbg !253
  %arrayidx9 = getelementptr inbounds i32* %13, i64 3, !dbg !253
  %14 = load i32* %arrayidx9, align 4, !dbg !253
  %15 = load i32*** %mm, align 8, !dbg !254
  %arrayidx10 = getelementptr inbounds i32** %15, i64 3, !dbg !254
  %16 = load i32** %arrayidx10, align 8, !dbg !254
  %arrayidx11 = getelementptr inbounds i32* %16, i64 2, !dbg !254
  %17 = load i32* %arrayidx11, align 4, !dbg !254
  %18 = load i32*** %mm, align 8, !dbg !255
  %arrayidx12 = getelementptr inbounds i32** %18, i64 4, !dbg !255
  %19 = load i32** %arrayidx12, align 8, !dbg !255
  %arrayidx13 = getelementptr inbounds i32* %19, i64 4, !dbg !255
  %20 = load i32* %arrayidx13, align 4, !dbg !255
  %call14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str, i32 0, i32 0), i32 %11, i32 %14, i32 %17, i32 %20), !dbg !256
  %21 = load i32*** %m1, align 8, !dbg !257
  call void @freematrix(i32 10, i32** %21), !dbg !258
  %22 = load i32*** %m2, align 8, !dbg !259
  call void @freematrix(i32 10, i32** %22), !dbg !260
  %23 = load i32*** %mm, align 8, !dbg !261
  call void @freematrix(i32 10, i32** %23), !dbg !262
  ret i32 0, !dbg !263
}

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #3

declare i32 @printf(i8*, ...) #4

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!27, !28}
!llvm.ident = !{!29}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\000\00\000\00\001", !1, !2, !3, !7, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c] [DW_LANG_C99]
!1 = !{!"matrix.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4, !5}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!5 = !{!"0xf\00\000\0064\0064\000\000", null, null, !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!6 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!7 = !{!8, !12, !15, !18, !21}
!8 = !{!"0x2e\00mkmatrix\00mkmatrix\00\0012\000\001\000\000\00256\000\0012", !1, !9, !10, null, i32** (i32, i32)* @mkmatrix, null, null, !2} ; [ DW_TAG_subprogram ] [line 12] [def] [mkmatrix]
!9 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!10 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !11, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = !{!4, !6, !6}
!12 = !{!"0x2e\00zeromatrix\00zeromatrix\00\0024\000\001\000\000\00256\000\0024", !1, !9, !13, null, void (i32, i32, i32**)* @zeromatrix, null, null, !2} ; [ DW_TAG_subprogram ] [line 24] [def] [zeromatrix]
!13 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !14, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = !{null, !6, !6, !4}
!15 = !{!"0x2e\00freematrix\00freematrix\00\0031\000\001\000\000\00256\000\0031", !1, !9, !16, null, void (i32, i32**)* @freematrix, null, null, !2} ; [ DW_TAG_subprogram ] [line 31] [def] [freematrix]
!16 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !17, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!17 = !{null, !6, !4}
!18 = !{!"0x2e\00mmult\00mmult\00\0036\000\001\000\000\00256\000\0036", !1, !9, !19, null, i32** (i32, i32, i32**, i32**, i32**)* @mmult, null, null, !2} ; [ DW_TAG_subprogram ] [line 36] [def] [mmult]
!19 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !20, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!20 = !{!4, !6, !6, !4, !4, !4}
!21 = !{!"0x2e\00main\00main\00\0050\000\001\000\000\00256\000\0050", !1, !9, !22, null, i32 (i32, i8**)* @main, null, null, !2} ; [ DW_TAG_subprogram ] [line 50] [def] [main]
!22 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !23, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!23 = !{!6, !6, !24}
!24 = !{!"0xf\00\000\0064\0064\000\000", null, null, !25} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!25 = !{!"0xf\00\000\0064\0064\000\000", null, null, !26} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!26 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!27 = !{i32 2, !"Dwarf Version", i32 4}
!28 = !{i32 2, !"Debug Info Version", i32 2}
!29 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!30 = !{!"0x101\00rows\0016777228\000", !8, !9, !6} ; [ DW_TAG_arg_variable ] [rows] [line 12]
!31 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!32 = !MDLocation(line: 12, column: 20, scope: !8)
!33 = !{!"0x101\00cols\0033554444\000", !8, !9, !6} ; [ DW_TAG_arg_variable ] [cols] [line 12]
!34 = !MDLocation(line: 12, column: 30, scope: !8)
!35 = !{!"0x100\00i\0013\000", !8, !9, !6}        ; [ DW_TAG_auto_variable ] [i] [line 13]
!36 = !MDLocation(line: 13, column: 9, scope: !8)
!37 = !{!"0x100\00j\0013\000", !8, !9, !6}        ; [ DW_TAG_auto_variable ] [j] [line 13]
!38 = !MDLocation(line: 13, column: 12, scope: !8)
!39 = !{!"0x100\00count\0013\000", !8, !9, !6}    ; [ DW_TAG_auto_variable ] [count] [line 13]
!40 = !MDLocation(line: 13, column: 15, scope: !8)
!41 = !{!"0x100\00m\0014\000", !8, !9, !4}        ; [ DW_TAG_auto_variable ] [m] [line 14]
!42 = !MDLocation(line: 14, column: 11, scope: !8)
!43 = !MDLocation(line: 14, column: 31, scope: !8)
!44 = !MDLocation(line: 14, column: 24, scope: !8)
!45 = !MDLocation(line: 14, column: 15, scope: !8)
!46 = !MDLocation(line: 15, column: 10, scope: !47)
!47 = !{!"0xb\0015\005\000", !1, !8}              ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!48 = !MDLocation(line: 15, column: 15, scope: !49)
!49 = !{!"0xb\002", !1, !50}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!50 = !{!"0xb\001", !1, !51}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!51 = !{!"0xb\0015\005\001", !1, !47}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!52 = !MDLocation(line: 15, column: 17, scope: !51)
!53 = !MDLocation(line: 15, column: 15, scope: !51)
!54 = !MDLocation(line: 15, column: 5, scope: !47)
!55 = !MDLocation(line: 16, column: 24, scope: !56)
!56 = !{!"0xb\0015\0028\002", !1, !51}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!57 = !MDLocation(line: 16, column: 17, scope: !56)
!58 = !MDLocation(line: 16, column: 9, scope: !56)
!59 = !MDLocation(line: 16, column: 4, scope: !56)
!60 = !MDLocation(line: 16, column: 2, scope: !56)
!61 = !MDLocation(line: 17, column: 7, scope: !62)
!62 = !{!"0xb\0017\002\003", !1, !56}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!63 = !MDLocation(line: 17, column: 12, scope: !64)
!64 = !{!"0xb\002", !1, !65}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!65 = !{!"0xb\001", !1, !66}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!66 = !{!"0xb\0017\002\004", !1, !62}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!67 = !MDLocation(line: 17, column: 14, scope: !66)
!68 = !MDLocation(line: 17, column: 12, scope: !66)
!69 = !MDLocation(line: 17, column: 2, scope: !62)
!70 = !MDLocation(line: 18, column: 16, scope: !71)
!71 = !{!"0xb\0017\0025\005", !1, !66}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!72 = !MDLocation(line: 18, column: 11, scope: !71)
!73 = !MDLocation(line: 18, column: 6, scope: !71)
!74 = !MDLocation(line: 18, column: 8, scope: !71)
!75 = !MDLocation(line: 19, column: 2, scope: !71)
!76 = !MDLocation(line: 17, column: 20, scope: !66)
!77 = !MDLocation(line: 17, column: 2, scope: !66)
!78 = !MDLocation(line: 20, column: 5, scope: !56)
!79 = !MDLocation(line: 15, column: 23, scope: !51)
!80 = !MDLocation(line: 15, column: 5, scope: !51)
!81 = !MDLocation(line: 21, column: 12, scope: !8)
!82 = !MDLocation(line: 21, column: 5, scope: !8)
!83 = !{!"0x101\00rows\0016777240\000", !12, !9, !6} ; [ DW_TAG_arg_variable ] [rows] [line 24]
!84 = !MDLocation(line: 24, column: 21, scope: !12)
!85 = !{!"0x101\00cols\0033554456\000", !12, !9, !6} ; [ DW_TAG_arg_variable ] [cols] [line 24]
!86 = !MDLocation(line: 24, column: 31, scope: !12)
!87 = !{!"0x101\00m\0050331672\000", !12, !9, !4} ; [ DW_TAG_arg_variable ] [m] [line 24]
!88 = !MDLocation(line: 24, column: 43, scope: !12)
!89 = !{!"0x100\00i\0025\000", !12, !9, !6}       ; [ DW_TAG_auto_variable ] [i] [line 25]
!90 = !MDLocation(line: 25, column: 9, scope: !12)
!91 = !{!"0x100\00j\0025\000", !12, !9, !6}       ; [ DW_TAG_auto_variable ] [j] [line 25]
!92 = !MDLocation(line: 25, column: 12, scope: !12)
!93 = !MDLocation(line: 26, column: 10, scope: !94)
!94 = !{!"0xb\0026\005\006", !1, !12}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!95 = !MDLocation(line: 26, column: 15, scope: !96)
!96 = !{!"0xb\002", !1, !97}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!97 = !{!"0xb\001", !1, !98}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!98 = !{!"0xb\0026\005\007", !1, !94}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!99 = !MDLocation(line: 26, column: 17, scope: !98)
!100 = !MDLocation(line: 26, column: 15, scope: !98)
!101 = !MDLocation(line: 26, column: 5, scope: !94)
!102 = !MDLocation(line: 27, column: 7, scope: !103)
!103 = !{!"0xb\0027\002\008", !1, !98}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!104 = !MDLocation(line: 27, column: 12, scope: !105)
!105 = !{!"0xb\002", !1, !106}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!106 = !{!"0xb\001", !1, !107}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!107 = !{!"0xb\0027\002\009", !1, !103}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!108 = !MDLocation(line: 27, column: 14, scope: !107)
!109 = !MDLocation(line: 27, column: 12, scope: !107)
!110 = !MDLocation(line: 27, column: 2, scope: !103)
!111 = !MDLocation(line: 28, column: 11, scope: !107)
!112 = !MDLocation(line: 28, column: 6, scope: !107)
!113 = !MDLocation(line: 28, column: 8, scope: !107)
!114 = !MDLocation(line: 27, column: 20, scope: !107)
!115 = !MDLocation(line: 27, column: 2, scope: !107)
!116 = !MDLocation(line: 28, column: 16, scope: !103)
!117 = !MDLocation(line: 26, column: 23, scope: !98)
!118 = !MDLocation(line: 26, column: 5, scope: !98)
!119 = !MDLocation(line: 29, column: 1, scope: !12)
!120 = !{!"0x101\00rows\0016777247\000", !15, !9, !6} ; [ DW_TAG_arg_variable ] [rows] [line 31]
!121 = !MDLocation(line: 31, column: 21, scope: !15)
!122 = !{!"0x101\00m\0033554463\000", !15, !9, !4} ; [ DW_TAG_arg_variable ] [m] [line 31]
!123 = !MDLocation(line: 31, column: 33, scope: !15)
!124 = !MDLocation(line: 32, column: 5, scope: !15)
!125 = !MDLocation(line: 32, column: 12, scope: !126)
!126 = !{!"0xb\003", !1, !127}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!127 = !{!"0xb\001", !1, !15}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!128 = !MDLocation(line: 32, column: 34, scope: !129)
!129 = !{!"0xb\002", !1, !130}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!130 = !{!"0xb\0032\0025\0010", !1, !15}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!131 = !MDLocation(line: 32, column: 32, scope: !130)
!132 = !MDLocation(line: 32, column: 27, scope: !130)
!133 = !MDLocation(line: 33, column: 10, scope: !15)
!134 = !MDLocation(line: 33, column: 5, scope: !15)
!135 = !MDLocation(line: 34, column: 1, scope: !15)
!136 = !{!"0x101\00rows\0016777252\000", !18, !9, !6} ; [ DW_TAG_arg_variable ] [rows] [line 36]
!137 = !MDLocation(line: 36, column: 17, scope: !18)
!138 = !{!"0x101\00cols\0033554468\000", !18, !9, !6} ; [ DW_TAG_arg_variable ] [cols] [line 36]
!139 = !MDLocation(line: 36, column: 27, scope: !18)
!140 = !{!"0x101\00m1\0050331684\000", !18, !9, !4} ; [ DW_TAG_arg_variable ] [m1] [line 36]
!141 = !MDLocation(line: 36, column: 39, scope: !18)
!142 = !{!"0x101\00m2\0067108900\000", !18, !9, !4} ; [ DW_TAG_arg_variable ] [m2] [line 36]
!143 = !MDLocation(line: 36, column: 49, scope: !18)
!144 = !{!"0x101\00m3\0083886116\000", !18, !9, !4} ; [ DW_TAG_arg_variable ] [m3] [line 36]
!145 = !MDLocation(line: 36, column: 59, scope: !18)
!146 = !{!"0x100\00i\0037\000", !18, !9, !6}      ; [ DW_TAG_auto_variable ] [i] [line 37]
!147 = !MDLocation(line: 37, column: 9, scope: !18)
!148 = !{!"0x100\00j\0037\000", !18, !9, !6}      ; [ DW_TAG_auto_variable ] [j] [line 37]
!149 = !MDLocation(line: 37, column: 12, scope: !18)
!150 = !{!"0x100\00k\0037\000", !18, !9, !6}      ; [ DW_TAG_auto_variable ] [k] [line 37]
!151 = !MDLocation(line: 37, column: 15, scope: !18)
!152 = !{!"0x100\00val\0037\000", !18, !9, !6}    ; [ DW_TAG_auto_variable ] [val] [line 37]
!153 = !MDLocation(line: 37, column: 18, scope: !18)
!154 = !MDLocation(line: 38, column: 10, scope: !155)
!155 = !{!"0xb\0038\005\0011", !1, !18}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!156 = !MDLocation(line: 38, column: 15, scope: !157)
!157 = !{!"0xb\002", !1, !158}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!158 = !{!"0xb\001", !1, !159}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!159 = !{!"0xb\0038\005\0012", !1, !155}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!160 = !MDLocation(line: 38, column: 17, scope: !159)
!161 = !MDLocation(line: 38, column: 15, scope: !159)
!162 = !MDLocation(line: 38, column: 5, scope: !155)
!163 = !MDLocation(line: 39, column: 7, scope: !164)
!164 = !{!"0xb\0039\002\0014", !1, !165}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!165 = !{!"0xb\0038\0028\0013", !1, !159}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!166 = !MDLocation(line: 39, column: 12, scope: !167)
!167 = !{!"0xb\002", !1, !168}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!168 = !{!"0xb\001", !1, !169}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!169 = !{!"0xb\0039\002\0015", !1, !164}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!170 = !MDLocation(line: 39, column: 14, scope: !169)
!171 = !MDLocation(line: 39, column: 12, scope: !169)
!172 = !MDLocation(line: 39, column: 2, scope: !164)
!173 = !MDLocation(line: 40, column: 6, scope: !174)
!174 = !{!"0xb\0039\0025\0016", !1, !169}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!175 = !MDLocation(line: 41, column: 11, scope: !176)
!176 = !{!"0xb\0041\006\0017", !1, !174}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!177 = !MDLocation(line: 41, column: 16, scope: !178)
!178 = !{!"0xb\002", !1, !179}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!179 = !{!"0xb\001", !1, !180}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!180 = !{!"0xb\0041\006\0018", !1, !176}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!181 = !MDLocation(line: 41, column: 18, scope: !180)
!182 = !MDLocation(line: 41, column: 16, scope: !180)
!183 = !MDLocation(line: 41, column: 6, scope: !176)
!184 = !MDLocation(line: 42, column: 16, scope: !185)
!185 = !{!"0xb\0041\0029\0019", !1, !180}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!186 = !MDLocation(line: 42, column: 10, scope: !185)
!187 = !MDLocation(line: 42, column: 13, scope: !185)
!188 = !MDLocation(line: 42, column: 27, scope: !185)
!189 = !MDLocation(line: 42, column: 21, scope: !185)
!190 = !MDLocation(line: 42, column: 24, scope: !185)
!191 = !MDLocation(line: 42, column: 3, scope: !185)
!192 = !MDLocation(line: 43, column: 6, scope: !185)
!193 = !MDLocation(line: 41, column: 24, scope: !180)
!194 = !MDLocation(line: 41, column: 6, scope: !180)
!195 = !MDLocation(line: 44, column: 17, scope: !174)
!196 = !MDLocation(line: 44, column: 12, scope: !174)
!197 = !MDLocation(line: 44, column: 6, scope: !174)
!198 = !MDLocation(line: 44, column: 9, scope: !174)
!199 = !MDLocation(line: 45, column: 2, scope: !174)
!200 = !MDLocation(line: 39, column: 20, scope: !169)
!201 = !MDLocation(line: 39, column: 2, scope: !169)
!202 = !MDLocation(line: 46, column: 5, scope: !165)
!203 = !MDLocation(line: 38, column: 23, scope: !159)
!204 = !MDLocation(line: 38, column: 5, scope: !159)
!205 = !MDLocation(line: 47, column: 12, scope: !18)
!206 = !MDLocation(line: 47, column: 5, scope: !18)
!207 = !{!"0x101\00argc\0016777266\000", !21, !9, !6} ; [ DW_TAG_arg_variable ] [argc] [line 50]
!208 = !MDLocation(line: 50, column: 14, scope: !21)
!209 = !{!"0x101\00argv\0033554482\000", !21, !9, !24} ; [ DW_TAG_arg_variable ] [argv] [line 50]
!210 = !MDLocation(line: 50, column: 26, scope: !21)
!211 = !{!"0x100\00i\0056\000", !21, !9, !6}      ; [ DW_TAG_auto_variable ] [i] [line 56]
!212 = !MDLocation(line: 56, column: 9, scope: !21)
!213 = !{!"0x100\00n\0056\000", !21, !9, !6}      ; [ DW_TAG_auto_variable ] [n] [line 56]
!214 = !MDLocation(line: 56, column: 12, scope: !21)
!215 = !MDLocation(line: 56, column: 18, scope: !21)
!216 = !MDLocation(line: 56, column: 17, scope: !21)
!217 = !MDLocation(line: 56, column: 36, scope: !218)
!218 = !{!"0xb\001", !1, !21}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!219 = !MDLocation(line: 56, column: 31, scope: !21)
!220 = !MDLocation(line: 56, column: 17, scope: !221)
!221 = !{!"0xb\002", !1, !21}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!222 = !MDLocation(line: 56, column: 12, scope: !223)
!223 = !{!"0xb\004", !1, !224}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!224 = !{!"0xb\003", !1, !21}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!225 = !{!"0x100\00m1\0058\000", !21, !9, !4}     ; [ DW_TAG_auto_variable ] [m1] [line 58]
!226 = !MDLocation(line: 58, column: 11, scope: !21)
!227 = !MDLocation(line: 58, column: 16, scope: !21)
!228 = !{!"0x100\00m2\0059\000", !21, !9, !4}     ; [ DW_TAG_auto_variable ] [m2] [line 59]
!229 = !MDLocation(line: 59, column: 11, scope: !21)
!230 = !MDLocation(line: 59, column: 16, scope: !21)
!231 = !{!"0x100\00mm\0060\000", !21, !9, !4}     ; [ DW_TAG_auto_variable ] [mm] [line 60]
!232 = !MDLocation(line: 60, column: 11, scope: !21)
!233 = !MDLocation(line: 60, column: 16, scope: !21)
!234 = !MDLocation(line: 62, column: 10, scope: !235)
!235 = !{!"0xb\0062\005\0020", !1, !21}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!236 = !MDLocation(line: 62, column: 15, scope: !237)
!237 = !{!"0xb\002", !1, !238}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!238 = !{!"0xb\001", !1, !239}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!239 = !{!"0xb\0062\005\0021", !1, !235}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!240 = !MDLocation(line: 62, column: 17, scope: !239)
!241 = !MDLocation(line: 62, column: 15, scope: !239)
!242 = !MDLocation(line: 62, column: 5, scope: !235)
!243 = !MDLocation(line: 63, column: 25, scope: !244)
!244 = !{!"0xb\0062\0025\0022", !1, !239}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!245 = !MDLocation(line: 63, column: 29, scope: !244)
!246 = !MDLocation(line: 63, column: 33, scope: !244)
!247 = !MDLocation(line: 63, column: 7, scope: !244)
!248 = !MDLocation(line: 63, column: 2, scope: !244)
!249 = !MDLocation(line: 64, column: 5, scope: !244)
!250 = !MDLocation(line: 62, column: 20, scope: !239)
!251 = !MDLocation(line: 62, column: 5, scope: !239)
!252 = !MDLocation(line: 65, column: 29, scope: !21)
!253 = !MDLocation(line: 65, column: 39, scope: !21)
!254 = !MDLocation(line: 65, column: 49, scope: !21)
!255 = !MDLocation(line: 65, column: 59, scope: !21)
!256 = !MDLocation(line: 65, column: 5, scope: !21)
!257 = !MDLocation(line: 67, column: 22, scope: !21)
!258 = !MDLocation(line: 67, column: 5, scope: !21)
!259 = !MDLocation(line: 68, column: 22, scope: !21)
!260 = !MDLocation(line: 68, column: 5, scope: !21)
!261 = !MDLocation(line: 69, column: 22, scope: !21)
!262 = !MDLocation(line: 69, column: 5, scope: !21)
!263 = !MDLocation(line: 70, column: 5, scope: !21)
