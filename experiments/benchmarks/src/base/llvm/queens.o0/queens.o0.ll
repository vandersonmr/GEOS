; ModuleID = 'queens.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.node = type { %struct.node*, %struct.node*, i32 }
%struct.element = type { i32, i32 }
%struct.complex = type { float, float }

@seed = common global i64 0, align 8
@.str = private unnamed_addr constant [19 x i8] c" Error in Queens.\0A\00", align 1
@.str1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@value = common global float 0.000000e+00, align 4
@fixed = common global float 0.000000e+00, align 4
@floated = common global float 0.000000e+00, align 4
@permarray = common global [11 x i32] zeroinitializer, align 16
@pctr = common global i32 0, align 4
@tree = common global %struct.node* null, align 8
@stack = common global [4 x i32] zeroinitializer, align 16
@cellspace = common global [19 x %struct.element] zeroinitializer, align 16
@freelist = common global i32 0, align 4
@movesdone = common global i32 0, align 4
@ima = common global [41 x [41 x i32]] zeroinitializer, align 16
@imb = common global [41 x [41 x i32]] zeroinitializer, align 16
@imr = common global [41 x [41 x i32]] zeroinitializer, align 16
@rma = common global [41 x [41 x float]] zeroinitializer, align 16
@rmb = common global [41 x [41 x float]] zeroinitializer, align 16
@rmr = common global [41 x [41 x float]] zeroinitializer, align 16
@piececount = common global [4 x i32] zeroinitializer, align 16
@class = common global [13 x i32] zeroinitializer, align 16
@piecemax = common global [13 x i32] zeroinitializer, align 16
@puzzl = common global [512 x i32] zeroinitializer, align 16
@p = common global [13 x [512 x i32]] zeroinitializer, align 16
@n = common global i32 0, align 4
@kount = common global i32 0, align 4
@sortlist = common global [5001 x i32] zeroinitializer, align 16
@biggest = common global i32 0, align 4
@littlest = common global i32 0, align 4
@top = common global i32 0, align 4
@z = common global [257 x %struct.complex] zeroinitializer, align 16
@w = common global [257 x %struct.complex] zeroinitializer, align 16
@e = common global [130 x %struct.complex] zeroinitializer, align 16
@zr = common global float 0.000000e+00, align 4
@zi = common global float 0.000000e+00, align 4

; Function Attrs: nounwind uwtable
define void @Initrand() #0 {
entry:
  store i64 74755, i64* @seed, align 8, !dbg !105
  ret void, !dbg !106
}

; Function Attrs: nounwind uwtable
define i32 @Rand() #0 {
entry:
  %0 = load i64* @seed, align 8, !dbg !107
  %mul = mul nsw i64 %0, 1309, !dbg !107
  %add = add nsw i64 %mul, 13849, !dbg !107
  %and = and i64 %add, 65535, !dbg !108
  store i64 %and, i64* @seed, align 8, !dbg !109
  %1 = load i64* @seed, align 8, !dbg !110
  %conv = trunc i64 %1 to i32, !dbg !111
  ret i32 %conv, !dbg !112
}

; Function Attrs: nounwind uwtable
define void @Try(i32 %i, i32* %q, i32* %a, i32* %b, i32* %c, i32* %x) #0 {
entry:
  %i.addr = alloca i32, align 4
  %q.addr = alloca i32*, align 8
  %a.addr = alloca i32*, align 8
  %b.addr = alloca i32*, align 8
  %c.addr = alloca i32*, align 8
  %x.addr = alloca i32*, align 8
  %j = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %i.addr, metadata !113, metadata !114), !dbg !115
  store i32* %q, i32** %q.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %q.addr, metadata !116, metadata !114), !dbg !117
  store i32* %a, i32** %a.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %a.addr, metadata !118, metadata !114), !dbg !119
  store i32* %b, i32** %b.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %b.addr, metadata !120, metadata !114), !dbg !121
  store i32* %c, i32** %c.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %c.addr, metadata !122, metadata !114), !dbg !123
  store i32* %x, i32** %x.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %x.addr, metadata !124, metadata !114), !dbg !125
  call void @llvm.dbg.declare(metadata i32* %j, metadata !126, metadata !114), !dbg !127
  store i32 0, i32* %j, align 4, !dbg !128
  %0 = load i32** %q.addr, align 8, !dbg !129
  store i32 0, i32* %0, align 4, !dbg !130
  br label %while.cond, !dbg !131

while.cond:                                       ; preds = %if.end37, %entry
  %1 = load i32** %q.addr, align 8, !dbg !132
  %2 = load i32* %1, align 4, !dbg !135
  %tobool = icmp ne i32 %2, 0, !dbg !136
  br i1 %tobool, label %land.end, label %land.rhs, !dbg !136

land.rhs:                                         ; preds = %while.cond
  %3 = load i32* %j, align 4, !dbg !137
  %cmp = icmp ne i32 %3, 8, !dbg !137
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %4 = phi i1 [ false, %while.cond ], [ %cmp, %land.rhs ]
  br i1 %4, label %while.body, label %while.end, !dbg !139

while.body:                                       ; preds = %land.end
  %5 = load i32* %j, align 4, !dbg !141
  %add = add nsw i32 %5, 1, !dbg !141
  store i32 %add, i32* %j, align 4, !dbg !143
  %6 = load i32** %q.addr, align 8, !dbg !144
  store i32 0, i32* %6, align 4, !dbg !145
  %7 = load i32* %j, align 4, !dbg !146
  %idxprom = sext i32 %7 to i64, !dbg !148
  %8 = load i32** %b.addr, align 8, !dbg !148
  %arrayidx = getelementptr inbounds i32* %8, i64 %idxprom, !dbg !148
  %9 = load i32* %arrayidx, align 4, !dbg !148
  %tobool1 = icmp ne i32 %9, 0, !dbg !149
  br i1 %tobool1, label %land.lhs.true, label %if.end37, !dbg !149

land.lhs.true:                                    ; preds = %while.body
  %10 = load i32* %i.addr, align 4, !dbg !150
  %11 = load i32* %j, align 4, !dbg !152
  %add2 = add nsw i32 %10, %11, !dbg !153
  %idxprom3 = sext i32 %add2 to i64, !dbg !154
  %12 = load i32** %a.addr, align 8, !dbg !154
  %arrayidx4 = getelementptr inbounds i32* %12, i64 %idxprom3, !dbg !154
  %13 = load i32* %arrayidx4, align 4, !dbg !154
  %tobool5 = icmp ne i32 %13, 0, !dbg !149
  br i1 %tobool5, label %land.lhs.true6, label %if.end37, !dbg !149

land.lhs.true6:                                   ; preds = %land.lhs.true
  %14 = load i32* %i.addr, align 4, !dbg !155
  %15 = load i32* %j, align 4, !dbg !157
  %sub = sub nsw i32 %14, %15, !dbg !158
  %add7 = add nsw i32 %sub, 7, !dbg !158
  %idxprom8 = sext i32 %add7 to i64, !dbg !159
  %16 = load i32** %c.addr, align 8, !dbg !159
  %arrayidx9 = getelementptr inbounds i32* %16, i64 %idxprom8, !dbg !159
  %17 = load i32* %arrayidx9, align 4, !dbg !159
  %tobool10 = icmp ne i32 %17, 0, !dbg !149
  br i1 %tobool10, label %if.then, label %if.end37, !dbg !149

if.then:                                          ; preds = %land.lhs.true6
  %18 = load i32* %j, align 4, !dbg !160
  %19 = load i32* %i.addr, align 4, !dbg !162
  %idxprom11 = sext i32 %19 to i64, !dbg !163
  %20 = load i32** %x.addr, align 8, !dbg !163
  %arrayidx12 = getelementptr inbounds i32* %20, i64 %idxprom11, !dbg !163
  store i32 %18, i32* %arrayidx12, align 4, !dbg !163
  %21 = load i32* %j, align 4, !dbg !164
  %idxprom13 = sext i32 %21 to i64, !dbg !165
  %22 = load i32** %b.addr, align 8, !dbg !165
  %arrayidx14 = getelementptr inbounds i32* %22, i64 %idxprom13, !dbg !165
  store i32 0, i32* %arrayidx14, align 4, !dbg !165
  %23 = load i32* %i.addr, align 4, !dbg !166
  %24 = load i32* %j, align 4, !dbg !167
  %add15 = add nsw i32 %23, %24, !dbg !166
  %idxprom16 = sext i32 %add15 to i64, !dbg !168
  %25 = load i32** %a.addr, align 8, !dbg !168
  %arrayidx17 = getelementptr inbounds i32* %25, i64 %idxprom16, !dbg !168
  store i32 0, i32* %arrayidx17, align 4, !dbg !168
  %26 = load i32* %i.addr, align 4, !dbg !169
  %27 = load i32* %j, align 4, !dbg !170
  %sub18 = sub nsw i32 %26, %27, !dbg !169
  %add19 = add nsw i32 %sub18, 7, !dbg !169
  %idxprom20 = sext i32 %add19 to i64, !dbg !171
  %28 = load i32** %c.addr, align 8, !dbg !171
  %arrayidx21 = getelementptr inbounds i32* %28, i64 %idxprom20, !dbg !171
  store i32 0, i32* %arrayidx21, align 4, !dbg !171
  %29 = load i32* %i.addr, align 4, !dbg !172
  %cmp22 = icmp slt i32 %29, 8, !dbg !172
  br i1 %cmp22, label %if.then23, label %if.else, !dbg !174

if.then23:                                        ; preds = %if.then
  %30 = load i32* %i.addr, align 4, !dbg !175
  %add24 = add nsw i32 %30, 1, !dbg !175
  %31 = load i32** %q.addr, align 8, !dbg !177
  %32 = load i32** %a.addr, align 8, !dbg !178
  %33 = load i32** %b.addr, align 8, !dbg !179
  %34 = load i32** %c.addr, align 8, !dbg !180
  %35 = load i32** %x.addr, align 8, !dbg !181
  call void @Try(i32 %add24, i32* %31, i32* %32, i32* %33, i32* %34, i32* %35), !dbg !182
  %36 = load i32** %q.addr, align 8, !dbg !183
  %37 = load i32* %36, align 4, !dbg !185
  %tobool25 = icmp ne i32 %37, 0, !dbg !186
  br i1 %tobool25, label %if.end, label %if.then26, !dbg !186

if.then26:                                        ; preds = %if.then23
  %38 = load i32* %j, align 4, !dbg !187
  %idxprom27 = sext i32 %38 to i64, !dbg !189
  %39 = load i32** %b.addr, align 8, !dbg !189
  %arrayidx28 = getelementptr inbounds i32* %39, i64 %idxprom27, !dbg !189
  store i32 1, i32* %arrayidx28, align 4, !dbg !189
  %40 = load i32* %i.addr, align 4, !dbg !190
  %41 = load i32* %j, align 4, !dbg !191
  %add29 = add nsw i32 %40, %41, !dbg !190
  %idxprom30 = sext i32 %add29 to i64, !dbg !192
  %42 = load i32** %a.addr, align 8, !dbg !192
  %arrayidx31 = getelementptr inbounds i32* %42, i64 %idxprom30, !dbg !192
  store i32 1, i32* %arrayidx31, align 4, !dbg !192
  %43 = load i32* %i.addr, align 4, !dbg !193
  %44 = load i32* %j, align 4, !dbg !194
  %sub32 = sub nsw i32 %43, %44, !dbg !193
  %add33 = add nsw i32 %sub32, 7, !dbg !193
  %idxprom34 = sext i32 %add33 to i64, !dbg !195
  %45 = load i32** %c.addr, align 8, !dbg !195
  %arrayidx35 = getelementptr inbounds i32* %45, i64 %idxprom34, !dbg !195
  store i32 1, i32* %arrayidx35, align 4, !dbg !195
  br label %if.end, !dbg !196

if.end:                                           ; preds = %if.then26, %if.then23
  br label %if.end36, !dbg !197

if.else:                                          ; preds = %if.then
  %46 = load i32** %q.addr, align 8, !dbg !198
  store i32 1, i32* %46, align 4, !dbg !199
  br label %if.end36

if.end36:                                         ; preds = %if.else, %if.end
  br label %if.end37, !dbg !200

if.end37:                                         ; preds = %if.end36, %land.lhs.true6, %land.lhs.true, %while.body
  br label %while.cond, !dbg !131

while.end:                                        ; preds = %land.end
  ret void, !dbg !201
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @Doit() #0 {
entry:
  %i = alloca i32, align 4
  %q = alloca i32, align 4
  %a = alloca [9 x i32], align 16
  %b = alloca [17 x i32], align 16
  %c = alloca [15 x i32], align 16
  %x = alloca [9 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !202, metadata !114), !dbg !203
  call void @llvm.dbg.declare(metadata i32* %q, metadata !204, metadata !114), !dbg !205
  call void @llvm.dbg.declare(metadata [9 x i32]* %a, metadata !206, metadata !114), !dbg !210
  call void @llvm.dbg.declare(metadata [17 x i32]* %b, metadata !211, metadata !114), !dbg !215
  call void @llvm.dbg.declare(metadata [15 x i32]* %c, metadata !216, metadata !114), !dbg !220
  call void @llvm.dbg.declare(metadata [9 x i32]* %x, metadata !221, metadata !114), !dbg !222
  store i32 -7, i32* %i, align 4, !dbg !223
  br label %while.cond, !dbg !224

while.cond:                                       ; preds = %if.end12, %entry
  %0 = load i32* %i, align 4, !dbg !225
  %cmp = icmp sle i32 %0, 16, !dbg !225
  br i1 %cmp, label %while.body, label %while.end, !dbg !224

while.body:                                       ; preds = %while.cond
  %1 = load i32* %i, align 4, !dbg !228
  %cmp1 = icmp sge i32 %1, 1, !dbg !228
  br i1 %cmp1, label %land.lhs.true, label %if.end, !dbg !231

land.lhs.true:                                    ; preds = %while.body
  %2 = load i32* %i, align 4, !dbg !232
  %cmp2 = icmp sle i32 %2, 8, !dbg !232
  br i1 %cmp2, label %if.then, label %if.end, !dbg !231

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32* %i, align 4, !dbg !234
  %idxprom = sext i32 %3 to i64, !dbg !236
  %arrayidx = getelementptr inbounds [9 x i32]* %a, i32 0, i64 %idxprom, !dbg !236
  store i32 1, i32* %arrayidx, align 4, !dbg !236
  br label %if.end, !dbg !236

if.end:                                           ; preds = %if.then, %land.lhs.true, %while.body
  %4 = load i32* %i, align 4, !dbg !237
  %cmp3 = icmp sge i32 %4, 2, !dbg !237
  br i1 %cmp3, label %if.then4, label %if.end7, !dbg !239

if.then4:                                         ; preds = %if.end
  %5 = load i32* %i, align 4, !dbg !240
  %idxprom5 = sext i32 %5 to i64, !dbg !242
  %arrayidx6 = getelementptr inbounds [17 x i32]* %b, i32 0, i64 %idxprom5, !dbg !242
  store i32 1, i32* %arrayidx6, align 4, !dbg !242
  br label %if.end7, !dbg !242

if.end7:                                          ; preds = %if.then4, %if.end
  %6 = load i32* %i, align 4, !dbg !243
  %cmp8 = icmp sle i32 %6, 7, !dbg !243
  br i1 %cmp8, label %if.then9, label %if.end12, !dbg !245

if.then9:                                         ; preds = %if.end7
  %7 = load i32* %i, align 4, !dbg !246
  %add = add nsw i32 %7, 7, !dbg !246
  %idxprom10 = sext i32 %add to i64, !dbg !248
  %arrayidx11 = getelementptr inbounds [15 x i32]* %c, i32 0, i64 %idxprom10, !dbg !248
  store i32 1, i32* %arrayidx11, align 4, !dbg !248
  br label %if.end12, !dbg !248

if.end12:                                         ; preds = %if.then9, %if.end7
  %8 = load i32* %i, align 4, !dbg !249
  %add13 = add nsw i32 %8, 1, !dbg !249
  store i32 %add13, i32* %i, align 4, !dbg !250
  br label %while.cond, !dbg !224

while.end:                                        ; preds = %while.cond
  %arraydecay = getelementptr inbounds [17 x i32]* %b, i32 0, i32 0, !dbg !251
  %arraydecay14 = getelementptr inbounds [9 x i32]* %a, i32 0, i32 0, !dbg !252
  %arraydecay15 = getelementptr inbounds [15 x i32]* %c, i32 0, i32 0, !dbg !253
  %arraydecay16 = getelementptr inbounds [9 x i32]* %x, i32 0, i32 0, !dbg !254
  call void @Try(i32 1, i32* %q, i32* %arraydecay, i32* %arraydecay14, i32* %arraydecay15, i32* %arraydecay16), !dbg !255
  %9 = load i32* %q, align 4, !dbg !256
  %tobool = icmp ne i32 %9, 0, !dbg !258
  br i1 %tobool, label %if.end18, label %if.then17, !dbg !258

if.then17:                                        ; preds = %while.end
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0)), !dbg !259
  br label %if.end18, !dbg !259

if.end18:                                         ; preds = %if.then17, %while.end
  ret void, !dbg !261
}

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @Queens(i32 %run) #0 {
entry:
  %run.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %run, i32* %run.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %run.addr, metadata !262, metadata !114), !dbg !263
  call void @llvm.dbg.declare(metadata i32* %i, metadata !264, metadata !114), !dbg !265
  store i32 1, i32* %i, align 4, !dbg !266
  br label %for.cond, !dbg !266

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4, !dbg !268
  %cmp = icmp sle i32 %0, 50, !dbg !268
  br i1 %cmp, label %for.body, label %for.end, !dbg !272

for.body:                                         ; preds = %for.cond
  call void @Doit(), !dbg !273
  br label %for.inc, !dbg !273

for.inc:                                          ; preds = %for.body
  %1 = load i32* %i, align 4, !dbg !275
  %inc = add nsw i32 %1, 1, !dbg !275
  store i32 %inc, i32* %i, align 4, !dbg !275
  br label %for.cond, !dbg !277

for.end:                                          ; preds = %for.cond
  %2 = load i32* %run.addr, align 4, !dbg !278
  %add = add nsw i32 %2, 1, !dbg !278
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), i32 %add), !dbg !279
  ret void, !dbg !280
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  call void @llvm.dbg.declare(metadata i32* %i, metadata !281, metadata !114), !dbg !282
  store i32 0, i32* %i, align 4, !dbg !283
  br label %for.cond, !dbg !283

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4, !dbg !285
  %cmp = icmp slt i32 %0, 100, !dbg !285
  br i1 %cmp, label %for.body, label %for.end, !dbg !289

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4, !dbg !290
  call void @Queens(i32 %1), !dbg !292
  br label %for.inc, !dbg !292

for.inc:                                          ; preds = %for.body
  %2 = load i32* %i, align 4, !dbg !293
  %inc = add nsw i32 %2, 1, !dbg !293
  store i32 %inc, i32* %i, align 4, !dbg !293
  br label %for.cond, !dbg !295

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !296
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!102, !103}
!llvm.ident = !{!104}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\000\00\000\00\001", !1, !2, !3, !5, !21, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c] [DW_LANG_C99]
!1 = !{!"queens.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4}
!4 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!5 = !{!6, !10, !12, !16, !17, !20}
!6 = !{!"0x2e\00Initrand\00Initrand\00\00115\000\001\000\000\000\000\00115", !1, !7, !8, null, void ()* @Initrand, null, null, !2} ; [ DW_TAG_subprogram ] [line 115] [def] [Initrand]
!7 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c]
!8 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !9, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!9 = !{null}
!10 = !{!"0x2e\00Rand\00Rand\00\00119\000\001\000\000\000\000\00119", !1, !7, !11, null, i32 ()* @Rand, null, null, !2} ; [ DW_TAG_subprogram ] [line 119] [def] [Rand]
!11 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !3, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!12 = !{!"0x2e\00Try\00Try\00\00137\000\001\000\000\00256\000\00137", !1, !7, !13, null, void (i32, i32*, i32*, i32*, i32*, i32*)* @Try, null, null, !2} ; [ DW_TAG_subprogram ] [line 137] [def] [Try]
!13 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !14, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = !{null, !4, !15, !15, !15, !15, !15}
!15 = !{!"0xf\00\000\0064\0064\000\000", null, null, !4} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!16 = !{!"0x2e\00Doit\00Doit\00\00162\000\001\000\000\000\000\00162", !1, !7, !8, null, void ()* @Doit, null, null, !2} ; [ DW_TAG_subprogram ] [line 162] [def] [Doit]
!17 = !{!"0x2e\00Queens\00Queens\00\00177\000\001\000\000\00256\000\00177", !1, !7, !18, null, void (i32)* @Queens, null, null, !2} ; [ DW_TAG_subprogram ] [line 177] [def] [Queens]
!18 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !19, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!19 = !{null, !4}
!20 = !{!"0x2e\00main\00main\00\00183\000\001\000\000\000\000\00184", !1, !7, !11, null, i32 ()* @main, null, null, !2} ; [ DW_TAG_subprogram ] [line 183] [def] [scope 184] [main]
!21 = !{!22, !24, !25, !26, !28, !32, !34, !41, !45, !53, !54, !55, !59, !60, !61, !63, !64, !65, !66, !70, !71, !75, !78, !79, !80, !84, !85, !86, !87, !95, !96, !100, !101}
!22 = !{!"0x34\00value\00value\00\0081\000\001", null, !7, !23, float* @value, null} ; [ DW_TAG_variable ] [value] [line 81] [def]
!23 = !{!"0x24\00float\000\0032\0032\000\000\004", null, null} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!24 = !{!"0x34\00fixed\00fixed\00\0081\000\001", null, !7, !23, float* @fixed, null} ; [ DW_TAG_variable ] [fixed] [line 81] [def]
!25 = !{!"0x34\00floated\00floated\00\0081\000\001", null, !7, !23, float* @floated, null} ; [ DW_TAG_variable ] [floated] [line 81] [def]
!26 = !{!"0x34\00seed\00seed\00\0084\000\001", null, !7, !27, i64* @seed, null} ; [ DW_TAG_variable ] [seed] [line 84] [def]
!27 = !{!"0x24\00long int\000\0064\0064\000\000\005", null, null} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!28 = !{!"0x34\00permarray\00permarray\00\0087\000\001", null, !7, !29, [11 x i32]* @permarray, null} ; [ DW_TAG_variable ] [permarray] [line 87] [def]
!29 = !{!"0x1\00\000\00352\0032\000\000\000", null, null, !4, !30, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 352, align 32, offset 0] [from int]
!30 = !{!31}
!31 = !{!"0x21\000\0011"}                         ; [ DW_TAG_subrange_type ] [0, 10]
!32 = !{!"0x34\00pctr\00pctr\00\0089\000\001", null, !7, !33, i32* @pctr, null} ; [ DW_TAG_variable ] [pctr] [line 89] [def]
!33 = !{!"0x24\00unsigned int\000\0032\0032\000\000\007", null, null} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!34 = !{!"0x34\00tree\00tree\00\0092\000\001", null, !7, !35, %struct.node** @tree, null} ; [ DW_TAG_variable ] [tree] [line 92] [def]
!35 = !{!"0xf\00\000\0064\0064\000\000", null, null, !36} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from node]
!36 = !{!"0x13\00node\0045\00192\0064\000\000\000", !1, null, null, !37, null, null, null} ; [ DW_TAG_structure_type ] [node] [line 45, size 192, align 64, offset 0] [def] [from ]
!37 = !{!38, !39, !40}
!38 = !{!"0xd\00left\0046\0064\0064\000\000", !1, !36, !35} ; [ DW_TAG_member ] [left] [line 46, size 64, align 64, offset 0] [from ]
!39 = !{!"0xd\00right\0046\0064\0064\0064\000", !1, !36, !35} ; [ DW_TAG_member ] [right] [line 46, size 64, align 64, offset 64] [from ]
!40 = !{!"0xd\00val\0047\0032\0032\00128\000", !1, !36, !4} ; [ DW_TAG_member ] [val] [line 47, size 32, align 32, offset 128] [from int]
!41 = !{!"0x34\00stack\00stack\00\0095\000\001", null, !7, !42, [4 x i32]* @stack, null} ; [ DW_TAG_variable ] [stack] [line 95] [def]
!42 = !{!"0x1\00\000\00128\0032\000\000\000", null, null, !4, !43, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 128, align 32, offset 0] [from int]
!43 = !{!44}
!44 = !{!"0x21\000\004"}                          ; [ DW_TAG_subrange_type ] [0, 3]
!45 = !{!"0x34\00cellspace\00cellspace\00\0096\000\001", null, !7, !46, [19 x %struct.element]* @cellspace, null} ; [ DW_TAG_variable ] [cellspace] [line 96] [def]
!46 = !{!"0x1\00\000\001216\0032\000\000\000", null, null, !47, !51, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1216, align 32, offset 0] [from element]
!47 = !{!"0x13\00element\0054\0064\0032\000\000\000", !1, null, null, !48, null, null, null} ; [ DW_TAG_structure_type ] [element] [line 54, size 64, align 32, offset 0] [def] [from ]
!48 = !{!49, !50}
!49 = !{!"0xd\00discsize\0055\0032\0032\000\000", !1, !47, !4} ; [ DW_TAG_member ] [discsize] [line 55, size 32, align 32, offset 0] [from int]
!50 = !{!"0xd\00next\0056\0032\0032\0032\000", !1, !47, !4} ; [ DW_TAG_member ] [next] [line 56, size 32, align 32, offset 32] [from int]
!51 = !{!52}
!52 = !{!"0x21\000\0019"}                         ; [ DW_TAG_subrange_type ] [0, 18]
!53 = !{!"0x34\00freelist\00freelist\00\0097\000\001", null, !7, !4, i32* @freelist, null} ; [ DW_TAG_variable ] [freelist] [line 97] [def]
!54 = !{!"0x34\00movesdone\00movesdone\00\0097\000\001", null, !7, !4, i32* @movesdone, null} ; [ DW_TAG_variable ] [movesdone] [line 97] [def]
!55 = !{!"0x34\00ima\00ima\00\00101\000\001", null, !7, !56, [41 x [41 x i32]]* @ima, null} ; [ DW_TAG_variable ] [ima] [line 101] [def]
!56 = !{!"0x1\00\000\0053792\0032\000\000\000", null, null, !4, !57, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 53792, align 32, offset 0] [from int]
!57 = !{!58, !58}
!58 = !{!"0x21\000\0041"}                         ; [ DW_TAG_subrange_type ] [0, 40]
!59 = !{!"0x34\00imb\00imb\00\00101\000\001", null, !7, !56, [41 x [41 x i32]]* @imb, null} ; [ DW_TAG_variable ] [imb] [line 101] [def]
!60 = !{!"0x34\00imr\00imr\00\00101\000\001", null, !7, !56, [41 x [41 x i32]]* @imr, null} ; [ DW_TAG_variable ] [imr] [line 101] [def]
!61 = !{!"0x34\00rma\00rma\00\00102\000\001", null, !7, !62, [41 x [41 x float]]* @rma, null} ; [ DW_TAG_variable ] [rma] [line 102] [def]
!62 = !{!"0x1\00\000\0053792\0032\000\000\000", null, null, !23, !57, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 53792, align 32, offset 0] [from float]
!63 = !{!"0x34\00rmb\00rmb\00\00102\000\001", null, !7, !62, [41 x [41 x float]]* @rmb, null} ; [ DW_TAG_variable ] [rmb] [line 102] [def]
!64 = !{!"0x34\00rmr\00rmr\00\00102\000\001", null, !7, !62, [41 x [41 x float]]* @rmr, null} ; [ DW_TAG_variable ] [rmr] [line 102] [def]
!65 = !{!"0x34\00piececount\00piececount\00\00105\000\001", null, !7, !42, [4 x i32]* @piececount, null} ; [ DW_TAG_variable ] [piececount] [line 105] [def]
!66 = !{!"0x34\00class\00class\00\00105\000\001", null, !7, !67, [13 x i32]* @class, null} ; [ DW_TAG_variable ] [class] [line 105] [def]
!67 = !{!"0x1\00\000\00416\0032\000\000\000", null, null, !4, !68, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 416, align 32, offset 0] [from int]
!68 = !{!69}
!69 = !{!"0x21\000\0013"}                         ; [ DW_TAG_subrange_type ] [0, 12]
!70 = !{!"0x34\00piecemax\00piecemax\00\00105\000\001", null, !7, !67, [13 x i32]* @piecemax, null} ; [ DW_TAG_variable ] [piecemax] [line 105] [def]
!71 = !{!"0x34\00puzzl\00puzzl\00\00106\000\001", null, !7, !72, [512 x i32]* @puzzl, null} ; [ DW_TAG_variable ] [puzzl] [line 106] [def]
!72 = !{!"0x1\00\000\0016384\0032\000\000\000", null, null, !4, !73, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16384, align 32, offset 0] [from int]
!73 = !{!74}
!74 = !{!"0x21\000\00512"}                        ; [ DW_TAG_subrange_type ] [0, 511]
!75 = !{!"0x34\00p\00p\00\00106\000\001", null, !7, !76, [13 x [512 x i32]]* @p, null} ; [ DW_TAG_variable ] [p] [line 106] [def]
!76 = !{!"0x1\00\000\00212992\0032\000\000\000", null, null, !4, !77, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 212992, align 32, offset 0] [from int]
!77 = !{!69, !74}
!78 = !{!"0x34\00n\00n\00\00106\000\001", null, !7, !4, i32* @n, null} ; [ DW_TAG_variable ] [n] [line 106] [def]
!79 = !{!"0x34\00kount\00kount\00\00106\000\001", null, !7, !4, i32* @kount, null} ; [ DW_TAG_variable ] [kount] [line 106] [def]
!80 = !{!"0x34\00sortlist\00sortlist\00\00109\000\001", null, !7, !81, [5001 x i32]* @sortlist, null} ; [ DW_TAG_variable ] [sortlist] [line 109] [def]
!81 = !{!"0x1\00\000\00160032\0032\000\000\000", null, null, !4, !82, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 160032, align 32, offset 0] [from int]
!82 = !{!83}
!83 = !{!"0x21\000\005001"}                       ; [ DW_TAG_subrange_type ] [0, 5000]
!84 = !{!"0x34\00biggest\00biggest\00\00109\000\001", null, !7, !4, i32* @biggest, null} ; [ DW_TAG_variable ] [biggest] [line 109] [def]
!85 = !{!"0x34\00littlest\00littlest\00\00109\000\001", null, !7, !4, i32* @littlest, null} ; [ DW_TAG_variable ] [littlest] [line 109] [def]
!86 = !{!"0x34\00top\00top\00\00109\000\001", null, !7, !4, i32* @top, null} ; [ DW_TAG_variable ] [top] [line 109] [def]
!87 = !{!"0x34\00z\00z\00\00112\000\001", null, !7, !88, [257 x %struct.complex]* @z, null} ; [ DW_TAG_variable ] [z] [line 112] [def]
!88 = !{!"0x1\00\000\0016448\0032\000\000\000", null, null, !89, !93, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16448, align 32, offset 0] [from complex]
!89 = !{!"0x13\00complex\0075\0064\0032\000\000\000", !1, null, null, !90, null, null, null} ; [ DW_TAG_structure_type ] [complex] [line 75, size 64, align 32, offset 0] [def] [from ]
!90 = !{!91, !92}
!91 = !{!"0xd\00rp\0075\0032\0032\000\000", !1, !89, !23} ; [ DW_TAG_member ] [rp] [line 75, size 32, align 32, offset 0] [from float]
!92 = !{!"0xd\00ip\0075\0032\0032\0032\000", !1, !89, !23} ; [ DW_TAG_member ] [ip] [line 75, size 32, align 32, offset 32] [from float]
!93 = !{!94}
!94 = !{!"0x21\000\00257"}                        ; [ DW_TAG_subrange_type ] [0, 256]
!95 = !{!"0x34\00w\00w\00\00112\000\001", null, !7, !88, [257 x %struct.complex]* @w, null} ; [ DW_TAG_variable ] [w] [line 112] [def]
!96 = !{!"0x34\00e\00e\00\00112\000\001", null, !7, !97, [130 x %struct.complex]* @e, null} ; [ DW_TAG_variable ] [e] [line 112] [def]
!97 = !{!"0x1\00\000\008320\0032\000\000\000", null, null, !89, !98, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 8320, align 32, offset 0] [from complex]
!98 = !{!99}
!99 = !{!"0x21\000\00130"}                        ; [ DW_TAG_subrange_type ] [0, 129]
!100 = !{!"0x34\00zr\00zr\00\00113\000\001", null, !7, !23, float* @zr, null} ; [ DW_TAG_variable ] [zr] [line 113] [def]
!101 = !{!"0x34\00zi\00zi\00\00113\000\001", null, !7, !23, float* @zi, null} ; [ DW_TAG_variable ] [zi] [line 113] [def]
!102 = !{i32 2, !"Dwarf Version", i32 4}
!103 = !{i32 2, !"Debug Info Version", i32 2}
!104 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!105 = !MDLocation(line: 116, column: 5, scope: !6)
!106 = !MDLocation(line: 117, column: 1, scope: !6)
!107 = !MDLocation(line: 120, column: 13, scope: !10)
!108 = !MDLocation(line: 120, column: 12, scope: !10)
!109 = !MDLocation(line: 120, column: 5, scope: !10)
!110 = !MDLocation(line: 121, column: 18, scope: !10)
!111 = !MDLocation(line: 121, column: 13, scope: !10)
!112 = !MDLocation(line: 121, column: 5, scope: !10)
!113 = !{!"0x101\00i\0016777353\000", !12, !7, !4} ; [ DW_TAG_arg_variable ] [i] [line 137]
!114 = !{!"0x102"}                                ; [ DW_TAG_expression ]
!115 = !MDLocation(line: 137, column: 14, scope: !12)
!116 = !{!"0x101\00q\0033554569\000", !12, !7, !15} ; [ DW_TAG_arg_variable ] [q] [line 137]
!117 = !MDLocation(line: 137, column: 22, scope: !12)
!118 = !{!"0x101\00a\0050331785\000", !12, !7, !15} ; [ DW_TAG_arg_variable ] [a] [line 137]
!119 = !MDLocation(line: 137, column: 29, scope: !12)
!120 = !{!"0x101\00b\0067109001\000", !12, !7, !15} ; [ DW_TAG_arg_variable ] [b] [line 137]
!121 = !MDLocation(line: 137, column: 38, scope: !12)
!122 = !{!"0x101\00c\0083886217\000", !12, !7, !15} ; [ DW_TAG_arg_variable ] [c] [line 137]
!123 = !MDLocation(line: 137, column: 47, scope: !12)
!124 = !{!"0x101\00x\00100663433\000", !12, !7, !15} ; [ DW_TAG_arg_variable ] [x] [line 137]
!125 = !MDLocation(line: 137, column: 56, scope: !12)
!126 = !{!"0x100\00j\00138\000", !12, !7, !4}     ; [ DW_TAG_auto_variable ] [j] [line 138]
!127 = !MDLocation(line: 138, column: 10, scope: !12)
!128 = !MDLocation(line: 139, column: 2, scope: !12)
!129 = !MDLocation(line: 140, column: 3, scope: !12)
!130 = !MDLocation(line: 140, column: 2, scope: !12)
!131 = !MDLocation(line: 141, column: 2, scope: !12)
!132 = !MDLocation(line: 141, column: 14, scope: !133)
!133 = !{!"0xb\004", !1, !134}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c]
!134 = !{!"0xb\001", !1, !12}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c]
!135 = !MDLocation(line: 141, column: 13, scope: !12)
!136 = !MDLocation(line: 141, column: 10, scope: !12)
!137 = !MDLocation(line: 141, column: 21, scope: !138)
!138 = !{!"0xb\003", !1, !12}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c]
!139 = !MDLocation(line: 141, column: 2, scope: !140)
!140 = !{!"0xb\002", !1, !12}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c]
!141 = !MDLocation(line: 142, column: 7, scope: !142)
!142 = !{!"0xb\00141\0031\000", !1, !12}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c]
!143 = !MDLocation(line: 142, column: 3, scope: !142)
!144 = !MDLocation(line: 143, column: 4, scope: !142)
!145 = !MDLocation(line: 143, column: 3, scope: !142)
!146 = !MDLocation(line: 144, column: 10, scope: !147)
!147 = !{!"0xb\00144\008\001", !1, !142}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c]
!148 = !MDLocation(line: 144, column: 8, scope: !147)
!149 = !MDLocation(line: 144, column: 8, scope: !142)
!150 = !MDLocation(line: 144, column: 18, scope: !151)
!151 = !{!"0xb\001", !1, !147}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c]
!152 = !MDLocation(line: 144, column: 20, scope: !147)
!153 = !MDLocation(line: 144, column: 18, scope: !147)
!154 = !MDLocation(line: 144, column: 16, scope: !147)
!155 = !MDLocation(line: 144, column: 28, scope: !156)
!156 = !{!"0xb\002", !1, !147}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c]
!157 = !MDLocation(line: 144, column: 30, scope: !147)
!158 = !MDLocation(line: 144, column: 28, scope: !147)
!159 = !MDLocation(line: 144, column: 26, scope: !147)
!160 = !MDLocation(line: 145, column: 11, scope: !161)
!161 = !{!"0xb\00144\0037\002", !1, !147}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c]
!162 = !MDLocation(line: 145, column: 6, scope: !161)
!163 = !MDLocation(line: 145, column: 4, scope: !161)
!164 = !MDLocation(line: 146, column: 9, scope: !161)
!165 = !MDLocation(line: 146, column: 7, scope: !161)
!166 = !MDLocation(line: 147, column: 9, scope: !161)
!167 = !MDLocation(line: 147, column: 11, scope: !161)
!168 = !MDLocation(line: 147, column: 7, scope: !161)
!169 = !MDLocation(line: 148, column: 9, scope: !161)
!170 = !MDLocation(line: 148, column: 11, scope: !161)
!171 = !MDLocation(line: 148, column: 7, scope: !161)
!172 = !MDLocation(line: 149, column: 12, scope: !173)
!173 = !{!"0xb\00149\0012\003", !1, !161}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c]
!174 = !MDLocation(line: 149, column: 12, scope: !161)
!175 = !MDLocation(line: 150, column: 12, scope: !176)
!176 = !{!"0xb\00149\0020\004", !1, !173}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c]
!177 = !MDLocation(line: 150, column: 16, scope: !176)
!178 = !MDLocation(line: 150, column: 18, scope: !176)
!179 = !MDLocation(line: 150, column: 20, scope: !176)
!180 = !MDLocation(line: 150, column: 22, scope: !176)
!181 = !MDLocation(line: 150, column: 24, scope: !176)
!182 = !MDLocation(line: 150, column: 8, scope: !176)
!183 = !MDLocation(line: 151, column: 13, scope: !184)
!184 = !{!"0xb\00151\0010\005", !1, !176}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c]
!185 = !MDLocation(line: 151, column: 12, scope: !184)
!186 = !MDLocation(line: 151, column: 10, scope: !176)
!187 = !MDLocation(line: 152, column: 8, scope: !188)
!188 = !{!"0xb\00151\0017\006", !1, !184}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c]
!189 = !MDLocation(line: 152, column: 6, scope: !188)
!190 = !MDLocation(line: 153, column: 11, scope: !188)
!191 = !MDLocation(line: 153, column: 13, scope: !188)
!192 = !MDLocation(line: 153, column: 9, scope: !188)
!193 = !MDLocation(line: 154, column: 11, scope: !188)
!194 = !MDLocation(line: 154, column: 13, scope: !188)
!195 = !MDLocation(line: 154, column: 9, scope: !188)
!196 = !MDLocation(line: 155, column: 5, scope: !188)
!197 = !MDLocation(line: 156, column: 4, scope: !176)
!198 = !MDLocation(line: 157, column: 13, scope: !173)
!199 = !MDLocation(line: 157, column: 12, scope: !173)
!200 = !MDLocation(line: 158, column: 6, scope: !161)
!201 = !MDLocation(line: 160, column: 1, scope: !12)
!202 = !{!"0x100\00i\00163\000", !16, !7, !4}     ; [ DW_TAG_auto_variable ] [i] [line 163]
!203 = !MDLocation(line: 163, column: 6, scope: !16)
!204 = !{!"0x100\00q\00163\000", !16, !7, !4}     ; [ DW_TAG_auto_variable ] [q] [line 163]
!205 = !MDLocation(line: 163, column: 8, scope: !16)
!206 = !{!"0x100\00a\00164\000", !16, !7, !207}   ; [ DW_TAG_auto_variable ] [a] [line 164]
!207 = !{!"0x1\00\000\00288\0032\000\000\000", null, null, !4, !208, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 288, align 32, offset 0] [from int]
!208 = !{!209}
!209 = !{!"0x21\000\009"}                         ; [ DW_TAG_subrange_type ] [0, 8]
!210 = !MDLocation(line: 164, column: 6, scope: !16)
!211 = !{!"0x100\00b\00164\000", !16, !7, !212}   ; [ DW_TAG_auto_variable ] [b] [line 164]
!212 = !{!"0x1\00\000\00544\0032\000\000\000", null, null, !4, !213, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 544, align 32, offset 0] [from int]
!213 = !{!214}
!214 = !{!"0x21\000\0017"}                        ; [ DW_TAG_subrange_type ] [0, 16]
!215 = !MDLocation(line: 164, column: 12, scope: !16)
!216 = !{!"0x100\00c\00164\000", !16, !7, !217}   ; [ DW_TAG_auto_variable ] [c] [line 164]
!217 = !{!"0x1\00\000\00480\0032\000\000\000", null, null, !4, !218, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 480, align 32, offset 0] [from int]
!218 = !{!219}
!219 = !{!"0x21\000\0015"}                        ; [ DW_TAG_subrange_type ] [0, 14]
!220 = !MDLocation(line: 164, column: 19, scope: !16)
!221 = !{!"0x100\00x\00164\000", !16, !7, !207}   ; [ DW_TAG_auto_variable ] [x] [line 164]
!222 = !MDLocation(line: 164, column: 26, scope: !16)
!223 = !MDLocation(line: 165, column: 2, scope: !16)
!224 = !MDLocation(line: 166, column: 2, scope: !16)
!225 = !MDLocation(line: 166, column: 10, scope: !226)
!226 = !{!"0xb\002", !1, !227}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c]
!227 = !{!"0xb\001", !1, !16}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c]
!228 = !MDLocation(line: 167, column: 9, scope: !229)
!229 = !{!"0xb\00167\008\008", !1, !230}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c]
!230 = !{!"0xb\00166\0020\007", !1, !16}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c]
!231 = !MDLocation(line: 167, column: 8, scope: !230)
!232 = !MDLocation(line: 167, column: 21, scope: !233)
!233 = !{!"0xb\001", !1, !229}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c]
!234 = !MDLocation(line: 167, column: 33, scope: !235)
!235 = !{!"0xb\002", !1, !229}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c]
!236 = !MDLocation(line: 167, column: 31, scope: !229)
!237 = !MDLocation(line: 168, column: 11, scope: !238)
!238 = !{!"0xb\00168\0011\009", !1, !230}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c]
!239 = !MDLocation(line: 168, column: 11, scope: !230)
!240 = !MDLocation(line: 168, column: 22, scope: !241)
!241 = !{!"0xb\001", !1, !238}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c]
!242 = !MDLocation(line: 168, column: 20, scope: !238)
!243 = !MDLocation(line: 169, column: 11, scope: !244)
!244 = !{!"0xb\00169\0011\0010", !1, !230}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c]
!245 = !MDLocation(line: 169, column: 11, scope: !230)
!246 = !MDLocation(line: 169, column: 22, scope: !247)
!247 = !{!"0xb\001", !1, !244}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c]
!248 = !MDLocation(line: 169, column: 20, scope: !244)
!249 = !MDLocation(line: 170, column: 10, scope: !230)
!250 = !MDLocation(line: 170, column: 6, scope: !230)
!251 = !MDLocation(line: 173, column: 13, scope: !16)
!252 = !MDLocation(line: 173, column: 16, scope: !16)
!253 = !MDLocation(line: 173, column: 19, scope: !16)
!254 = !MDLocation(line: 173, column: 22, scope: !16)
!255 = !MDLocation(line: 173, column: 2, scope: !16)
!256 = !MDLocation(line: 174, column: 8, scope: !257)
!257 = !{!"0xb\00174\007\0011", !1, !16}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c]
!258 = !MDLocation(line: 174, column: 7, scope: !16)
!259 = !MDLocation(line: 174, column: 12, scope: !260)
!260 = !{!"0xb\001", !1, !257}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c]
!261 = !MDLocation(line: 175, column: 1, scope: !16)
!262 = !{!"0x101\00run\0016777393\000", !17, !7, !4} ; [ DW_TAG_arg_variable ] [run] [line 177]
!263 = !MDLocation(line: 177, column: 18, scope: !17)
!264 = !{!"0x100\00i\00178\000", !17, !7, !4}     ; [ DW_TAG_auto_variable ] [i] [line 178]
!265 = !MDLocation(line: 178, column: 9, scope: !17)
!266 = !MDLocation(line: 179, column: 11, scope: !267)
!267 = !{!"0xb\00179\005\0012", !1, !17}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c]
!268 = !MDLocation(line: 179, column: 18, scope: !269)
!269 = !{!"0xb\004", !1, !270}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c]
!270 = !{!"0xb\001", !1, !271}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c]
!271 = !{!"0xb\00179\005\0013", !1, !267}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c]
!272 = !MDLocation(line: 179, column: 5, scope: !267)
!273 = !MDLocation(line: 179, column: 33, scope: !274)
!274 = !{!"0xb\002", !1, !271}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c]
!275 = !MDLocation(line: 179, column: 27, scope: !276)
!276 = !{!"0xb\003", !1, !271}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c]
!277 = !MDLocation(line: 179, column: 5, scope: !271)
!278 = !MDLocation(line: 180, column: 18, scope: !17)
!279 = !MDLocation(line: 180, column: 3, scope: !17)
!280 = !MDLocation(line: 181, column: 1, scope: !17)
!281 = !{!"0x100\00i\00185\000", !20, !7, !4}     ; [ DW_TAG_auto_variable ] [i] [line 185]
!282 = !MDLocation(line: 185, column: 6, scope: !20)
!283 = !MDLocation(line: 186, column: 7, scope: !284)
!284 = !{!"0xb\00186\002\0014", !1, !20}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c]
!285 = !MDLocation(line: 186, column: 14, scope: !286)
!286 = !{!"0xb\004", !1, !287}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c]
!287 = !{!"0xb\001", !1, !288}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c]
!288 = !{!"0xb\00186\002\0015", !1, !284}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c]
!289 = !MDLocation(line: 186, column: 2, scope: !284)
!290 = !MDLocation(line: 186, column: 35, scope: !291)
!291 = !{!"0xb\002", !1, !288}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c]
!292 = !MDLocation(line: 186, column: 28, scope: !288)
!293 = !MDLocation(line: 186, column: 23, scope: !294)
!294 = !{!"0xb\003", !1, !288}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c]
!295 = !MDLocation(line: 186, column: 2, scope: !288)
!296 = !MDLocation(line: 187, column: 2, scope: !20)
