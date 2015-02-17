; ModuleID = 'huffbench.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [33 x i8] c"ABCDEFGHIJKLMNOPQRSTUVWXYZ012345\00", align 1
@stderr = external global %struct._IO_FILE*
@.str1 = private unnamed_addr constant [26 x i8] c"error: bit code overflow\0A\00", align 1
@.str2 = private unnamed_addr constant [33 x i8] c"error: file has only one value!\0A\00", align 1
@.str3 = private unnamed_addr constant [23 x i8] c"error: no compression\0A\00", align 1
@.str4 = private unnamed_addr constant [4 x i8] c"-ga\00", align 1
@stdout = external global %struct._IO_FILE*
@.str5 = private unnamed_addr constant [3 x i8] c"%f\00", align 1
@.str6 = private unnamed_addr constant [35 x i8] c"\0Ahuffbench (Std. C) run time: %f\0A\0A\00", align 1
@seed = internal global i64 1325, align 8

; Function Attrs: nounwind uwtable
define i8* @generate_test_data(i64 %n) #0 {
entry:
  %n.addr = alloca i64, align 8
  %codes = alloca i8*, align 8
  %result = alloca i8*, align 8
  %ptr = alloca i8*, align 8
  %i = alloca i32, align 4
  store i64 %n, i64* %n.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %n.addr, metadata !47, metadata !48), !dbg !49
  call void @llvm.dbg.declare(metadata i8** %codes, metadata !50, metadata !48), !dbg !51
  store i8* getelementptr inbounds ([33 x i8]* @.str, i32 0, i32 0), i8** %codes, align 8, !dbg !51
  call void @llvm.dbg.declare(metadata i8** %result, metadata !52, metadata !48), !dbg !53
  %0 = load i64* %n.addr, align 8, !dbg !54
  %call = call noalias i8* @malloc(i64 %0) #3, !dbg !55
  store i8* %call, i8** %result, align 8, !dbg !53
  call void @llvm.dbg.declare(metadata i8** %ptr, metadata !56, metadata !48), !dbg !57
  %1 = load i8** %result, align 8, !dbg !58
  store i8* %1, i8** %ptr, align 8, !dbg !57
  call void @llvm.dbg.declare(metadata i32* %i, metadata !59, metadata !48), !dbg !60
  store i32 0, i32* %i, align 4, !dbg !61
  br label %for.cond, !dbg !61

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32* %i, align 4, !dbg !63
  %conv = sext i32 %2 to i64, !dbg !63
  %3 = load i64* %n.addr, align 8, !dbg !67
  %cmp = icmp ult i64 %conv, %3, !dbg !68
  br i1 %cmp, label %for.body, label %for.end, !dbg !69

for.body:                                         ; preds = %for.cond
  %call2 = call i64 @random4(), !dbg !70
  %4 = load i8** %codes, align 8, !dbg !72
  %arrayidx = getelementptr inbounds i8* %4, i64 %call2, !dbg !72
  %5 = load i8* %arrayidx, align 1, !dbg !72
  %6 = load i8** %ptr, align 8, !dbg !73
  store i8 %5, i8* %6, align 1, !dbg !74
  %7 = load i8** %ptr, align 8, !dbg !75
  %incdec.ptr = getelementptr inbounds i8* %7, i32 1, !dbg !75
  store i8* %incdec.ptr, i8** %ptr, align 8, !dbg !75
  br label %for.inc, !dbg !76

for.inc:                                          ; preds = %for.body
  %8 = load i32* %i, align 4, !dbg !77
  %inc = add nsw i32 %8, 1, !dbg !77
  store i32 %inc, i32* %i, align 4, !dbg !77
  br label %for.cond, !dbg !78

for.end:                                          ; preds = %for.cond
  %9 = load i8** %result, align 8, !dbg !79
  ret i8* %9, !dbg !80
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind uwtable
define void @compdecomp(i8* %data, i64 %data_len) #0 {
entry:
  %data.addr = alloca i8*, align 8
  %data_len.addr = alloca i64, align 8
  %i = alloca i64, align 8
  %j = alloca i64, align 8
  %n = alloca i64, align 8
  %mask = alloca i64, align 8
  %k = alloca i64, align 8
  %t = alloca i64, align 8
  %c = alloca i8, align 1
  %cptr = alloca i8*, align 8
  %dptr = alloca i8*, align 8
  %comp = alloca i8*, align 8
  %freq = alloca [512 x i64], align 16
  %heap = alloca [256 x i64], align 16
  %link = alloca [512 x i32], align 16
  %code = alloca [256 x i64], align 16
  %clen = alloca [256 x i8], align 16
  %temp = alloca i64, align 8
  %m = alloca i64, align 8
  %x = alloca i64, align 8
  %maxx = alloca i64, align 8
  %maxi = alloca i64, align 8
  %l = alloca i32, align 4
  %comp_len = alloca i64, align 8
  %bout = alloca i8, align 1
  %bit = alloca i32, align 4
  %heap2 = alloca [256 x i64], align 16
  %outc = alloca [256 x i8], align 16
  %optr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !81, metadata !48), !dbg !82
  store i64 %data_len, i64* %data_len.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %data_len.addr, metadata !83, metadata !48), !dbg !84
  call void @llvm.dbg.declare(metadata i64* %i, metadata !85, metadata !48), !dbg !86
  call void @llvm.dbg.declare(metadata i64* %j, metadata !87, metadata !48), !dbg !88
  call void @llvm.dbg.declare(metadata i64* %n, metadata !89, metadata !48), !dbg !90
  call void @llvm.dbg.declare(metadata i64* %mask, metadata !91, metadata !48), !dbg !92
  call void @llvm.dbg.declare(metadata i64* %k, metadata !93, metadata !48), !dbg !95
  call void @llvm.dbg.declare(metadata i64* %t, metadata !96, metadata !48), !dbg !97
  call void @llvm.dbg.declare(metadata i8* %c, metadata !98, metadata !48), !dbg !99
  call void @llvm.dbg.declare(metadata i8** %cptr, metadata !100, metadata !48), !dbg !101
  call void @llvm.dbg.declare(metadata i8** %dptr, metadata !102, metadata !48), !dbg !103
  %0 = load i8** %data.addr, align 8, !dbg !104
  store i8* %0, i8** %dptr, align 8, !dbg !103
  call void @llvm.dbg.declare(metadata i8** %comp, metadata !105, metadata !48), !dbg !106
  %1 = load i64* %data_len.addr, align 8, !dbg !107
  %add = add i64 %1, 1, !dbg !107
  %call = call noalias i8* @malloc(i64 %add) #3, !dbg !108
  store i8* %call, i8** %comp, align 8, !dbg !106
  call void @llvm.dbg.declare(metadata [512 x i64]* %freq, metadata !109, metadata !48), !dbg !113
  call void @llvm.dbg.declare(metadata [256 x i64]* %heap, metadata !114, metadata !48), !dbg !118
  call void @llvm.dbg.declare(metadata [512 x i32]* %link, metadata !119, metadata !48), !dbg !121
  call void @llvm.dbg.declare(metadata [256 x i64]* %code, metadata !122, metadata !48), !dbg !124
  call void @llvm.dbg.declare(metadata [256 x i8]* %clen, metadata !125, metadata !48), !dbg !127
  %2 = load i8** %comp, align 8, !dbg !128
  %3 = load i64* %data_len.addr, align 8, !dbg !129
  %add1 = add i64 %3, 1, !dbg !129
  %mul = mul i64 1, %add1, !dbg !130
  call void @llvm.memset.p0i8.i64(i8* %2, i8 0, i64 %mul, i32 1, i1 false), !dbg !131
  %4 = bitcast [512 x i64]* %freq to i8*, !dbg !132
  call void @llvm.memset.p0i8.i64(i8* %4, i8 0, i64 4096, i32 16, i1 false), !dbg !132
  %5 = bitcast [256 x i64]* %heap to i8*, !dbg !133
  call void @llvm.memset.p0i8.i64(i8* %5, i8 0, i64 2048, i32 16, i1 false), !dbg !133
  %6 = bitcast [512 x i32]* %link to i8*, !dbg !134
  call void @llvm.memset.p0i8.i64(i8* %6, i8 0, i64 2048, i32 16, i1 false), !dbg !134
  %7 = bitcast [256 x i64]* %code to i8*, !dbg !135
  call void @llvm.memset.p0i8.i64(i8* %7, i8 0, i64 2048, i32 16, i1 false), !dbg !135
  %8 = bitcast [256 x i8]* %clen to i8*, !dbg !136
  call void @llvm.memset.p0i8.i64(i8* %8, i8 0, i64 256, i32 16, i1 false), !dbg !136
  store i64 0, i64* %i, align 8, !dbg !137
  br label %for.cond, !dbg !137

for.cond:                                         ; preds = %for.inc, %entry
  %9 = load i64* %i, align 8, !dbg !139
  %10 = load i64* %data_len.addr, align 8, !dbg !143
  %cmp = icmp ult i64 %9, %10, !dbg !144
  br i1 %cmp, label %for.body, label %for.end, !dbg !145

for.body:                                         ; preds = %for.cond
  %11 = load i8** %dptr, align 8, !dbg !146
  %12 = load i8* %11, align 1, !dbg !148
  %conv = zext i8 %12 to i64, !dbg !149
  %arrayidx = getelementptr inbounds [512 x i64]* %freq, i32 0, i64 %conv, !dbg !150
  %13 = load i64* %arrayidx, align 8, !dbg !150
  %inc = add i64 %13, 1, !dbg !150
  store i64 %inc, i64* %arrayidx, align 8, !dbg !150
  %14 = load i8** %dptr, align 8, !dbg !151
  %incdec.ptr = getelementptr inbounds i8* %14, i32 1, !dbg !151
  store i8* %incdec.ptr, i8** %dptr, align 8, !dbg !151
  br label %for.inc, !dbg !152

for.inc:                                          ; preds = %for.body
  %15 = load i64* %i, align 8, !dbg !153
  %inc2 = add i64 %15, 1, !dbg !153
  store i64 %inc2, i64* %i, align 8, !dbg !153
  br label %for.cond, !dbg !154

for.end:                                          ; preds = %for.cond
  store i64 0, i64* %n, align 8, !dbg !155
  store i64 0, i64* %i, align 8, !dbg !156
  br label %for.cond3, !dbg !156

for.cond3:                                        ; preds = %for.inc10, %for.end
  %16 = load i64* %i, align 8, !dbg !158
  %cmp4 = icmp ult i64 %16, 256, !dbg !158
  br i1 %cmp4, label %for.body6, label %for.end12, !dbg !162

for.body6:                                        ; preds = %for.cond3
  %17 = load i64* %i, align 8, !dbg !163
  %arrayidx7 = getelementptr inbounds [512 x i64]* %freq, i32 0, i64 %17, !dbg !166
  %18 = load i64* %arrayidx7, align 8, !dbg !166
  %tobool = icmp ne i64 %18, 0, !dbg !167
  br i1 %tobool, label %if.then, label %if.end, !dbg !167

if.then:                                          ; preds = %for.body6
  %19 = load i64* %i, align 8, !dbg !168
  %20 = load i64* %n, align 8, !dbg !170
  %arrayidx8 = getelementptr inbounds [256 x i64]* %heap, i32 0, i64 %20, !dbg !171
  store i64 %19, i64* %arrayidx8, align 8, !dbg !171
  %21 = load i64* %n, align 8, !dbg !172
  %inc9 = add i64 %21, 1, !dbg !172
  store i64 %inc9, i64* %n, align 8, !dbg !172
  br label %if.end, !dbg !173

if.end:                                           ; preds = %if.then, %for.body6
  br label %for.inc10, !dbg !174

for.inc10:                                        ; preds = %if.end
  %22 = load i64* %i, align 8, !dbg !175
  %inc11 = add i64 %22, 1, !dbg !175
  store i64 %inc11, i64* %i, align 8, !dbg !175
  br label %for.cond3, !dbg !176

for.end12:                                        ; preds = %for.cond3
  %23 = load i64* %n, align 8, !dbg !177
  store i64 %23, i64* %i, align 8, !dbg !179
  br label %for.cond13, !dbg !179

for.cond13:                                       ; preds = %for.inc20, %for.end12
  %24 = load i64* %i, align 8, !dbg !180
  %cmp14 = icmp ugt i64 %24, 0, !dbg !180
  br i1 %cmp14, label %for.body16, label %for.end21, !dbg !184

for.body16:                                       ; preds = %for.cond13
  %arraydecay = getelementptr inbounds [512 x i64]* %freq, i32 0, i32 0, !dbg !185
  %arraydecay17 = getelementptr inbounds [256 x i64]* %heap, i32 0, i32 0, !dbg !186
  %25 = load i64* %n, align 8, !dbg !187
  %conv18 = trunc i64 %25 to i32, !dbg !187
  %26 = load i64* %i, align 8, !dbg !188
  %conv19 = trunc i64 %26 to i32, !dbg !188
  call void @heap_adjust(i64* %arraydecay, i64* %arraydecay17, i32 %conv18, i32 %conv19), !dbg !189
  br label %for.inc20, !dbg !189

for.inc20:                                        ; preds = %for.body16
  %27 = load i64* %i, align 8, !dbg !190
  %dec = add i64 %27, -1, !dbg !190
  store i64 %dec, i64* %i, align 8, !dbg !190
  br label %for.cond13, !dbg !191

for.end21:                                        ; preds = %for.cond13
  call void @llvm.dbg.declare(metadata i64* %temp, metadata !192, metadata !48), !dbg !193
  br label %while.cond, !dbg !194

while.cond:                                       ; preds = %while.body, %for.end21
  %28 = load i64* %n, align 8, !dbg !195
  %cmp22 = icmp ugt i64 %28, 1, !dbg !195
  br i1 %cmp22, label %while.body, label %while.end, !dbg !194

while.body:                                       ; preds = %while.cond
  %29 = load i64* %n, align 8, !dbg !198
  %dec24 = add i64 %29, -1, !dbg !198
  store i64 %dec24, i64* %n, align 8, !dbg !198
  %arrayidx25 = getelementptr inbounds [256 x i64]* %heap, i32 0, i64 0, !dbg !200
  %30 = load i64* %arrayidx25, align 8, !dbg !200
  store i64 %30, i64* %temp, align 8, !dbg !201
  %31 = load i64* %n, align 8, !dbg !202
  %arrayidx26 = getelementptr inbounds [256 x i64]* %heap, i32 0, i64 %31, !dbg !203
  %32 = load i64* %arrayidx26, align 8, !dbg !203
  %arrayidx27 = getelementptr inbounds [256 x i64]* %heap, i32 0, i64 0, !dbg !204
  store i64 %32, i64* %arrayidx27, align 8, !dbg !204
  %arraydecay28 = getelementptr inbounds [512 x i64]* %freq, i32 0, i32 0, !dbg !205
  %arraydecay29 = getelementptr inbounds [256 x i64]* %heap, i32 0, i32 0, !dbg !206
  %33 = load i64* %n, align 8, !dbg !207
  %conv30 = trunc i64 %33 to i32, !dbg !207
  call void @heap_adjust(i64* %arraydecay28, i64* %arraydecay29, i32 %conv30, i32 1), !dbg !208
  %arrayidx31 = getelementptr inbounds [256 x i64]* %heap, i32 0, i64 0, !dbg !209
  %34 = load i64* %arrayidx31, align 8, !dbg !209
  %arrayidx32 = getelementptr inbounds [512 x i64]* %freq, i32 0, i64 %34, !dbg !210
  %35 = load i64* %arrayidx32, align 8, !dbg !210
  %36 = load i64* %temp, align 8, !dbg !211
  %arrayidx33 = getelementptr inbounds [512 x i64]* %freq, i32 0, i64 %36, !dbg !212
  %37 = load i64* %arrayidx33, align 8, !dbg !212
  %add34 = add i64 %35, %37, !dbg !210
  %38 = load i64* %n, align 8, !dbg !213
  %add35 = add i64 256, %38, !dbg !214
  %arrayidx36 = getelementptr inbounds [512 x i64]* %freq, i32 0, i64 %add35, !dbg !215
  store i64 %add34, i64* %arrayidx36, align 8, !dbg !215
  %39 = load i64* %n, align 8, !dbg !216
  %add37 = add i64 256, %39, !dbg !217
  %conv38 = trunc i64 %add37 to i32, !dbg !217
  %40 = load i64* %temp, align 8, !dbg !218
  %arrayidx39 = getelementptr inbounds [512 x i32]* %link, i32 0, i64 %40, !dbg !219
  store i32 %conv38, i32* %arrayidx39, align 4, !dbg !219
  %41 = load i64* %n, align 8, !dbg !220
  %sub = sub i64 -256, %41, !dbg !221
  %conv40 = trunc i64 %sub to i32, !dbg !221
  %arrayidx41 = getelementptr inbounds [256 x i64]* %heap, i32 0, i64 0, !dbg !222
  %42 = load i64* %arrayidx41, align 8, !dbg !222
  %arrayidx42 = getelementptr inbounds [512 x i32]* %link, i32 0, i64 %42, !dbg !223
  store i32 %conv40, i32* %arrayidx42, align 4, !dbg !223
  %43 = load i64* %n, align 8, !dbg !224
  %add43 = add i64 256, %43, !dbg !225
  %arrayidx44 = getelementptr inbounds [256 x i64]* %heap, i32 0, i64 0, !dbg !226
  store i64 %add43, i64* %arrayidx44, align 8, !dbg !226
  %arraydecay45 = getelementptr inbounds [512 x i64]* %freq, i32 0, i32 0, !dbg !227
  %arraydecay46 = getelementptr inbounds [256 x i64]* %heap, i32 0, i32 0, !dbg !228
  %44 = load i64* %n, align 8, !dbg !229
  %conv47 = trunc i64 %44 to i32, !dbg !229
  call void @heap_adjust(i64* %arraydecay45, i64* %arraydecay46, i32 %conv47, i32 1), !dbg !230
  br label %while.cond, !dbg !194

while.end:                                        ; preds = %while.cond
  %45 = load i64* %n, align 8, !dbg !231
  %add48 = add i64 256, %45, !dbg !232
  %arrayidx49 = getelementptr inbounds [512 x i32]* %link, i32 0, i64 %add48, !dbg !233
  store i32 0, i32* %arrayidx49, align 4, !dbg !233
  call void @llvm.dbg.declare(metadata i64* %m, metadata !234, metadata !48), !dbg !235
  call void @llvm.dbg.declare(metadata i64* %x, metadata !236, metadata !48), !dbg !237
  call void @llvm.dbg.declare(metadata i64* %maxx, metadata !238, metadata !48), !dbg !239
  store i64 0, i64* %maxx, align 8, !dbg !239
  call void @llvm.dbg.declare(metadata i64* %maxi, metadata !240, metadata !48), !dbg !241
  store i64 0, i64* %maxi, align 8, !dbg !241
  call void @llvm.dbg.declare(metadata i32* %l, metadata !242, metadata !48), !dbg !243
  store i64 0, i64* %m, align 8, !dbg !244
  br label %for.cond50, !dbg !244

for.cond50:                                       ; preds = %for.inc84, %while.end
  %46 = load i64* %m, align 8, !dbg !246
  %cmp51 = icmp ult i64 %46, 256, !dbg !246
  br i1 %cmp51, label %for.body53, label %for.end86, !dbg !250

for.body53:                                       ; preds = %for.cond50
  %47 = load i64* %m, align 8, !dbg !251
  %arrayidx54 = getelementptr inbounds [512 x i64]* %freq, i32 0, i64 %47, !dbg !254
  %48 = load i64* %arrayidx54, align 8, !dbg !254
  %tobool55 = icmp ne i64 %48, 0, !dbg !255
  br i1 %tobool55, label %if.else, label %if.then56, !dbg !255

if.then56:                                        ; preds = %for.body53
  %49 = load i64* %m, align 8, !dbg !256
  %arrayidx57 = getelementptr inbounds [256 x i64]* %code, i32 0, i64 %49, !dbg !258
  store i64 0, i64* %arrayidx57, align 8, !dbg !258
  %50 = load i64* %m, align 8, !dbg !259
  %arrayidx58 = getelementptr inbounds [256 x i8]* %clen, i32 0, i64 %50, !dbg !260
  store i8 0, i8* %arrayidx58, align 1, !dbg !260
  br label %if.end83, !dbg !261

if.else:                                          ; preds = %for.body53
  store i64 0, i64* %i, align 8, !dbg !262
  store i64 1, i64* %j, align 8, !dbg !264
  store i64 0, i64* %x, align 8, !dbg !265
  %51 = load i64* %m, align 8, !dbg !266
  %arrayidx59 = getelementptr inbounds [512 x i32]* %link, i32 0, i64 %51, !dbg !267
  %52 = load i32* %arrayidx59, align 4, !dbg !267
  store i32 %52, i32* %l, align 4, !dbg !268
  br label %while.cond60, !dbg !269

while.cond60:                                     ; preds = %if.end68, %if.else
  %53 = load i32* %l, align 4, !dbg !270
  %tobool61 = icmp ne i32 %53, 0, !dbg !269
  br i1 %tobool61, label %while.body62, label %while.end71, !dbg !269

while.body62:                                     ; preds = %while.cond60
  %54 = load i32* %l, align 4, !dbg !273
  %cmp63 = icmp slt i32 %54, 0, !dbg !273
  br i1 %cmp63, label %if.then65, label %if.end68, !dbg !276

if.then65:                                        ; preds = %while.body62
  %55 = load i64* %j, align 8, !dbg !277
  %56 = load i64* %x, align 8, !dbg !279
  %add66 = add i64 %56, %55, !dbg !279
  store i64 %add66, i64* %x, align 8, !dbg !279
  %57 = load i32* %l, align 4, !dbg !280
  %sub67 = sub nsw i32 0, %57, !dbg !281
  store i32 %sub67, i32* %l, align 4, !dbg !282
  br label %if.end68, !dbg !283

if.end68:                                         ; preds = %if.then65, %while.body62
  %58 = load i32* %l, align 4, !dbg !284
  %idxprom = sext i32 %58 to i64, !dbg !285
  %arrayidx69 = getelementptr inbounds [512 x i32]* %link, i32 0, i64 %idxprom, !dbg !285
  %59 = load i32* %arrayidx69, align 4, !dbg !285
  store i32 %59, i32* %l, align 4, !dbg !286
  %60 = load i64* %j, align 8, !dbg !287
  %shl = shl i64 %60, 1, !dbg !287
  store i64 %shl, i64* %j, align 8, !dbg !287
  %61 = load i64* %i, align 8, !dbg !288
  %inc70 = add i64 %61, 1, !dbg !288
  store i64 %inc70, i64* %i, align 8, !dbg !288
  br label %while.cond60, !dbg !269

while.end71:                                      ; preds = %while.cond60
  %62 = load i64* %x, align 8, !dbg !289
  %63 = load i64* %m, align 8, !dbg !290
  %arrayidx72 = getelementptr inbounds [256 x i64]* %code, i32 0, i64 %63, !dbg !291
  store i64 %62, i64* %arrayidx72, align 8, !dbg !291
  %64 = load i64* %i, align 8, !dbg !292
  %conv73 = trunc i64 %64 to i8, !dbg !293
  %65 = load i64* %m, align 8, !dbg !294
  %arrayidx74 = getelementptr inbounds [256 x i8]* %clen, i32 0, i64 %65, !dbg !295
  store i8 %conv73, i8* %arrayidx74, align 1, !dbg !295
  %66 = load i64* %x, align 8, !dbg !296
  %67 = load i64* %maxx, align 8, !dbg !298
  %cmp75 = icmp ugt i64 %66, %67, !dbg !296
  br i1 %cmp75, label %if.then77, label %if.end78, !dbg !299

if.then77:                                        ; preds = %while.end71
  %68 = load i64* %x, align 8, !dbg !300
  store i64 %68, i64* %maxx, align 8, !dbg !301
  br label %if.end78, !dbg !301

if.end78:                                         ; preds = %if.then77, %while.end71
  %69 = load i64* %i, align 8, !dbg !302
  %70 = load i64* %maxi, align 8, !dbg !304
  %cmp79 = icmp ugt i64 %69, %70, !dbg !302
  br i1 %cmp79, label %if.then81, label %if.end82, !dbg !305

if.then81:                                        ; preds = %if.end78
  %71 = load i64* %i, align 8, !dbg !306
  store i64 %71, i64* %maxi, align 8, !dbg !307
  br label %if.end82, !dbg !307

if.end82:                                         ; preds = %if.then81, %if.end78
  br label %if.end83

if.end83:                                         ; preds = %if.end82, %if.then56
  br label %for.inc84, !dbg !308

for.inc84:                                        ; preds = %if.end83
  %72 = load i64* %m, align 8, !dbg !309
  %inc85 = add i64 %72, 1, !dbg !309
  store i64 %inc85, i64* %m, align 8, !dbg !309
  br label %for.cond50, !dbg !310

for.end86:                                        ; preds = %for.cond50
  %73 = load i64* %maxi, align 8, !dbg !311
  %cmp87 = icmp ugt i64 %73, 64, !dbg !311
  br i1 %cmp87, label %if.then89, label %if.end91, !dbg !313

if.then89:                                        ; preds = %for.end86
  %74 = load %struct._IO_FILE** @stderr, align 8, !dbg !314
  %call90 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %74, i8* getelementptr inbounds ([26 x i8]* @.str1, i32 0, i32 0)), !dbg !316
  call void @exit(i32 1) #7, !dbg !317
  unreachable, !dbg !317

if.end91:                                         ; preds = %for.end86
  call void @llvm.dbg.declare(metadata i64* %comp_len, metadata !318, metadata !48), !dbg !319
  store i64 0, i64* %comp_len, align 8, !dbg !319
  call void @llvm.dbg.declare(metadata i8* %bout, metadata !320, metadata !48), !dbg !321
  store i8 0, i8* %bout, align 1, !dbg !321
  call void @llvm.dbg.declare(metadata i32* %bit, metadata !322, metadata !48), !dbg !323
  store i32 -1, i32* %bit, align 4, !dbg !323
  %75 = load i8** %data.addr, align 8, !dbg !324
  store i8* %75, i8** %dptr, align 8, !dbg !325
  %76 = load i64* %maxx, align 8, !dbg !326
  %cmp92 = icmp eq i64 %76, 0, !dbg !326
  br i1 %cmp92, label %if.then94, label %if.end96, !dbg !328

if.then94:                                        ; preds = %if.end91
  %77 = load %struct._IO_FILE** @stderr, align 8, !dbg !329
  %call95 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %77, i8* getelementptr inbounds ([33 x i8]* @.str2, i32 0, i32 0)), !dbg !331
  call void @exit(i32 1) #7, !dbg !332
  unreachable, !dbg !332

if.end96:                                         ; preds = %if.end91
  store i64 0, i64* %j, align 8, !dbg !333
  br label %for.cond97, !dbg !333

for.cond97:                                       ; preds = %for.inc141, %if.end96
  %78 = load i64* %j, align 8, !dbg !335
  %79 = load i64* %data_len.addr, align 8, !dbg !339
  %cmp98 = icmp ult i64 %78, %79, !dbg !340
  br i1 %cmp98, label %for.body100, label %for.end143, !dbg !341

for.body100:                                      ; preds = %for.cond97
  %80 = load i8** %dptr, align 8, !dbg !342
  %81 = load i8* %80, align 1, !dbg !344
  %idxprom101 = zext i8 %81 to i64, !dbg !345
  %arrayidx102 = getelementptr inbounds [256 x i8]* %clen, i32 0, i64 %idxprom101, !dbg !345
  %82 = load i8* %arrayidx102, align 1, !dbg !345
  %conv103 = zext i8 %82 to i32, !dbg !345
  %sub104 = sub nsw i32 %conv103, 1, !dbg !345
  %shl105 = shl i32 1, %sub104, !dbg !346
  %conv106 = sext i32 %shl105 to i64, !dbg !346
  store i64 %conv106, i64* %mask, align 8, !dbg !347
  store i64 0, i64* %i, align 8, !dbg !348
  br label %for.cond107, !dbg !348

for.cond107:                                      ; preds = %for.inc137, %for.body100
  %83 = load i64* %i, align 8, !dbg !350
  %84 = load i8** %dptr, align 8, !dbg !354
  %85 = load i8* %84, align 1, !dbg !355
  %idxprom108 = zext i8 %85 to i64, !dbg !356
  %arrayidx109 = getelementptr inbounds [256 x i8]* %clen, i32 0, i64 %idxprom108, !dbg !356
  %86 = load i8* %arrayidx109, align 1, !dbg !356
  %conv110 = zext i8 %86 to i64, !dbg !356
  %cmp111 = icmp ult i64 %83, %conv110, !dbg !357
  br i1 %cmp111, label %for.body113, label %for.end139, !dbg !358

for.body113:                                      ; preds = %for.cond107
  %87 = load i32* %bit, align 4, !dbg !359
  %cmp114 = icmp eq i32 %87, 7, !dbg !359
  br i1 %cmp114, label %if.then116, label %if.else124, !dbg !362

if.then116:                                       ; preds = %for.body113
  %88 = load i8* %bout, align 1, !dbg !363
  %89 = load i64* %comp_len, align 8, !dbg !365
  %90 = load i8** %comp, align 8, !dbg !366
  %arrayidx117 = getelementptr inbounds i8* %90, i64 %89, !dbg !366
  store i8 %88, i8* %arrayidx117, align 1, !dbg !366
  %91 = load i64* %comp_len, align 8, !dbg !367
  %inc118 = add i64 %91, 1, !dbg !367
  store i64 %inc118, i64* %comp_len, align 8, !dbg !367
  %92 = load i64* %comp_len, align 8, !dbg !368
  %93 = load i64* %data_len.addr, align 8, !dbg !370
  %cmp119 = icmp eq i64 %92, %93, !dbg !368
  br i1 %cmp119, label %if.then121, label %if.end123, !dbg !371

if.then121:                                       ; preds = %if.then116
  %94 = load %struct._IO_FILE** @stderr, align 8, !dbg !372
  %call122 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %94, i8* getelementptr inbounds ([23 x i8]* @.str3, i32 0, i32 0)), !dbg !374
  call void @exit(i32 1) #7, !dbg !375
  unreachable, !dbg !375

if.end123:                                        ; preds = %if.then116
  store i32 0, i32* %bit, align 4, !dbg !376
  store i8 0, i8* %bout, align 1, !dbg !377
  br label %if.end129, !dbg !378

if.else124:                                       ; preds = %for.body113
  %95 = load i32* %bit, align 4, !dbg !379
  %inc125 = add nsw i32 %95, 1, !dbg !379
  store i32 %inc125, i32* %bit, align 4, !dbg !379
  %96 = load i8* %bout, align 1, !dbg !381
  %conv126 = sext i8 %96 to i32, !dbg !381
  %shl127 = shl i32 %conv126, 1, !dbg !381
  %conv128 = trunc i32 %shl127 to i8, !dbg !381
  store i8 %conv128, i8* %bout, align 1, !dbg !381
  br label %if.end129

if.end129:                                        ; preds = %if.else124, %if.end123
  %97 = load i8** %dptr, align 8, !dbg !382
  %98 = load i8* %97, align 1, !dbg !384
  %idxprom130 = zext i8 %98 to i64, !dbg !385
  %arrayidx131 = getelementptr inbounds [256 x i64]* %code, i32 0, i64 %idxprom130, !dbg !385
  %99 = load i64* %arrayidx131, align 8, !dbg !385
  %100 = load i64* %mask, align 8, !dbg !386
  %and = and i64 %99, %100, !dbg !385
  %tobool132 = icmp ne i64 %and, 0, !dbg !387
  br i1 %tobool132, label %if.then133, label %if.end136, !dbg !387

if.then133:                                       ; preds = %if.end129
  %101 = load i8* %bout, align 1, !dbg !388
  %conv134 = sext i8 %101 to i32, !dbg !388
  %or = or i32 %conv134, 1, !dbg !388
  %conv135 = trunc i32 %or to i8, !dbg !388
  store i8 %conv135, i8* %bout, align 1, !dbg !388
  br label %if.end136, !dbg !388

if.end136:                                        ; preds = %if.then133, %if.end129
  %102 = load i64* %mask, align 8, !dbg !389
  %shr = lshr i64 %102, 1, !dbg !389
  store i64 %shr, i64* %mask, align 8, !dbg !389
  br label %for.inc137, !dbg !390

for.inc137:                                       ; preds = %if.end136
  %103 = load i64* %i, align 8, !dbg !391
  %inc138 = add i64 %103, 1, !dbg !391
  store i64 %inc138, i64* %i, align 8, !dbg !391
  br label %for.cond107, !dbg !392

for.end139:                                       ; preds = %for.cond107
  %104 = load i8** %dptr, align 8, !dbg !393
  %incdec.ptr140 = getelementptr inbounds i8* %104, i32 1, !dbg !393
  store i8* %incdec.ptr140, i8** %dptr, align 8, !dbg !393
  br label %for.inc141, !dbg !394

for.inc141:                                       ; preds = %for.end139
  %105 = load i64* %j, align 8, !dbg !395
  %inc142 = add i64 %105, 1, !dbg !395
  store i64 %inc142, i64* %j, align 8, !dbg !395
  br label %for.cond97, !dbg !396

for.end143:                                       ; preds = %for.cond97
  %106 = load i32* %bit, align 4, !dbg !397
  %sub144 = sub nsw i32 7, %106, !dbg !398
  %107 = load i8* %bout, align 1, !dbg !399
  %conv145 = sext i8 %107 to i32, !dbg !399
  %shl146 = shl i32 %conv145, %sub144, !dbg !399
  %conv147 = trunc i32 %shl146 to i8, !dbg !399
  store i8 %conv147, i8* %bout, align 1, !dbg !399
  %108 = load i8* %bout, align 1, !dbg !400
  %109 = load i64* %comp_len, align 8, !dbg !401
  %110 = load i8** %comp, align 8, !dbg !402
  %arrayidx148 = getelementptr inbounds i8* %110, i64 %109, !dbg !402
  store i8 %108, i8* %arrayidx148, align 1, !dbg !402
  %111 = load i64* %comp_len, align 8, !dbg !403
  %inc149 = add i64 %111, 1, !dbg !403
  store i64 %inc149, i64* %comp_len, align 8, !dbg !403
  call void @llvm.dbg.declare(metadata [256 x i64]* %heap2, metadata !404, metadata !48), !dbg !405
  call void @llvm.dbg.declare(metadata [256 x i8]* %outc, metadata !406, metadata !48), !dbg !408
  %112 = bitcast [256 x i64]* %heap2 to i8*, !dbg !409
  call void @llvm.memset.p0i8.i64(i8* %112, i8 0, i64 2048, i32 16, i1 false), !dbg !409
  call void @llvm.dbg.declare(metadata i8** %optr, metadata !410, metadata !48), !dbg !411
  %arraydecay150 = getelementptr inbounds [256 x i8]* %outc, i32 0, i32 0, !dbg !412
  store i8* %arraydecay150, i8** %optr, align 8, !dbg !411
  store i64 0, i64* %j, align 8, !dbg !413
  br label %for.cond151, !dbg !413

for.cond151:                                      ; preds = %for.inc188, %for.end143
  %113 = load i64* %j, align 8, !dbg !415
  %cmp152 = icmp ult i64 %113, 256, !dbg !415
  br i1 %cmp152, label %for.body154, label %for.end190, !dbg !419

for.body154:                                      ; preds = %for.cond151
  %114 = load i64* %j, align 8, !dbg !420
  %conv155 = trunc i64 %114 to i8, !dbg !422
  %115 = load i8** %optr, align 8, !dbg !423
  store i8 %conv155, i8* %115, align 1, !dbg !424
  %116 = load i8** %optr, align 8, !dbg !425
  %incdec.ptr156 = getelementptr inbounds i8* %116, i32 1, !dbg !425
  store i8* %incdec.ptr156, i8** %optr, align 8, !dbg !425
  %117 = load i64* %j, align 8, !dbg !426
  %arrayidx157 = getelementptr inbounds [256 x i64]* %code, i32 0, i64 %117, !dbg !428
  %118 = load i64* %arrayidx157, align 8, !dbg !428
  %119 = load i64* %j, align 8, !dbg !429
  %arrayidx158 = getelementptr inbounds [256 x i8]* %clen, i32 0, i64 %119, !dbg !430
  %120 = load i8* %arrayidx158, align 1, !dbg !430
  %conv159 = zext i8 %120 to i64, !dbg !430
  %or160 = or i64 %118, %conv159, !dbg !428
  %tobool161 = icmp ne i64 %or160, 0, !dbg !431
  br i1 %tobool161, label %if.then162, label %if.end187, !dbg !431

if.then162:                                       ; preds = %for.body154
  store i64 0, i64* %k, align 8, !dbg !432
  %121 = load i64* %j, align 8, !dbg !434
  %arrayidx163 = getelementptr inbounds [256 x i8]* %clen, i32 0, i64 %121, !dbg !435
  %122 = load i8* %arrayidx163, align 1, !dbg !435
  %conv164 = zext i8 %122 to i32, !dbg !435
  %sub165 = sub nsw i32 %conv164, 1, !dbg !435
  %shl166 = shl i32 1, %sub165, !dbg !436
  %conv167 = sext i32 %shl166 to i64, !dbg !436
  store i64 %conv167, i64* %mask, align 8, !dbg !437
  store i64 0, i64* %i, align 8, !dbg !438
  br label %for.cond168, !dbg !438

for.cond168:                                      ; preds = %for.inc183, %if.then162
  %123 = load i64* %i, align 8, !dbg !440
  %124 = load i64* %j, align 8, !dbg !444
  %arrayidx169 = getelementptr inbounds [256 x i8]* %clen, i32 0, i64 %124, !dbg !445
  %125 = load i8* %arrayidx169, align 1, !dbg !445
  %conv170 = zext i8 %125 to i64, !dbg !445
  %cmp171 = icmp ult i64 %123, %conv170, !dbg !446
  br i1 %cmp171, label %for.body173, label %for.end185, !dbg !447

for.body173:                                      ; preds = %for.cond168
  %126 = load i64* %k, align 8, !dbg !448
  %mul174 = mul i64 %126, 2, !dbg !448
  %add175 = add i64 %mul174, 1, !dbg !448
  store i64 %add175, i64* %k, align 8, !dbg !450
  %127 = load i64* %j, align 8, !dbg !451
  %arrayidx176 = getelementptr inbounds [256 x i64]* %code, i32 0, i64 %127, !dbg !453
  %128 = load i64* %arrayidx176, align 8, !dbg !453
  %129 = load i64* %mask, align 8, !dbg !454
  %and177 = and i64 %128, %129, !dbg !453
  %tobool178 = icmp ne i64 %and177, 0, !dbg !455
  br i1 %tobool178, label %if.then179, label %if.end181, !dbg !455

if.then179:                                       ; preds = %for.body173
  %130 = load i64* %k, align 8, !dbg !456
  %inc180 = add i64 %130, 1, !dbg !456
  store i64 %inc180, i64* %k, align 8, !dbg !456
  br label %if.end181, !dbg !456

if.end181:                                        ; preds = %if.then179, %for.body173
  %131 = load i64* %mask, align 8, !dbg !457
  %shr182 = lshr i64 %131, 1, !dbg !457
  store i64 %shr182, i64* %mask, align 8, !dbg !457
  br label %for.inc183, !dbg !458

for.inc183:                                       ; preds = %if.end181
  %132 = load i64* %i, align 8, !dbg !459
  %inc184 = add i64 %132, 1, !dbg !459
  store i64 %inc184, i64* %i, align 8, !dbg !459
  br label %for.cond168, !dbg !460

for.end185:                                       ; preds = %for.cond168
  %133 = load i64* %k, align 8, !dbg !461
  %134 = load i64* %j, align 8, !dbg !462
  %arrayidx186 = getelementptr inbounds [256 x i64]* %heap2, i32 0, i64 %134, !dbg !463
  store i64 %133, i64* %arrayidx186, align 8, !dbg !463
  br label %if.end187, !dbg !464

if.end187:                                        ; preds = %for.end185, %for.body154
  br label %for.inc188, !dbg !465

for.inc188:                                       ; preds = %if.end187
  %135 = load i64* %j, align 8, !dbg !466
  %inc189 = add i64 %135, 1, !dbg !466
  store i64 %inc189, i64* %j, align 8, !dbg !466
  br label %for.cond151, !dbg !467

for.end190:                                       ; preds = %for.cond151
  store i64 1, i64* %i, align 8, !dbg !468
  br label %for.cond191, !dbg !468

for.cond191:                                      ; preds = %for.inc214, %for.end190
  %136 = load i64* %i, align 8, !dbg !470
  %cmp192 = icmp ult i64 %136, 256, !dbg !470
  br i1 %cmp192, label %for.body194, label %for.end216, !dbg !474

for.body194:                                      ; preds = %for.cond191
  %137 = load i64* %i, align 8, !dbg !475
  %arrayidx195 = getelementptr inbounds [256 x i64]* %heap2, i32 0, i64 %137, !dbg !477
  %138 = load i64* %arrayidx195, align 8, !dbg !477
  store i64 %138, i64* %t, align 8, !dbg !478
  %139 = load i64* %i, align 8, !dbg !479
  %arrayidx196 = getelementptr inbounds [256 x i8]* %outc, i32 0, i64 %139, !dbg !480
  %140 = load i8* %arrayidx196, align 1, !dbg !480
  store i8 %140, i8* %c, align 1, !dbg !481
  %141 = load i64* %i, align 8, !dbg !482
  store i64 %141, i64* %j, align 8, !dbg !483
  br label %while.cond197, !dbg !484

while.cond197:                                    ; preds = %while.body203, %for.body194
  %142 = load i64* %j, align 8, !dbg !485
  %tobool198 = icmp ne i64 %142, 0, !dbg !488
  br i1 %tobool198, label %land.rhs, label %land.end, !dbg !488

land.rhs:                                         ; preds = %while.cond197
  %143 = load i64* %j, align 8, !dbg !489
  %sub199 = sub i64 %143, 1, !dbg !489
  %arrayidx200 = getelementptr inbounds [256 x i64]* %heap2, i32 0, i64 %sub199, !dbg !491
  %144 = load i64* %arrayidx200, align 8, !dbg !491
  %145 = load i64* %t, align 8, !dbg !492
  %cmp201 = icmp ugt i64 %144, %145, !dbg !491
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond197
  %146 = phi i1 [ false, %while.cond197 ], [ %cmp201, %land.rhs ]
  br i1 %146, label %while.body203, label %while.end211, !dbg !493

while.body203:                                    ; preds = %land.end
  %147 = load i64* %j, align 8, !dbg !495
  %sub204 = sub i64 %147, 1, !dbg !495
  %arrayidx205 = getelementptr inbounds [256 x i64]* %heap2, i32 0, i64 %sub204, !dbg !497
  %148 = load i64* %arrayidx205, align 8, !dbg !497
  %149 = load i64* %j, align 8, !dbg !498
  %arrayidx206 = getelementptr inbounds [256 x i64]* %heap2, i32 0, i64 %149, !dbg !499
  store i64 %148, i64* %arrayidx206, align 8, !dbg !499
  %150 = load i64* %j, align 8, !dbg !500
  %sub207 = sub i64 %150, 1, !dbg !500
  %arrayidx208 = getelementptr inbounds [256 x i8]* %outc, i32 0, i64 %sub207, !dbg !501
  %151 = load i8* %arrayidx208, align 1, !dbg !501
  %152 = load i64* %j, align 8, !dbg !502
  %arrayidx209 = getelementptr inbounds [256 x i8]* %outc, i32 0, i64 %152, !dbg !503
  store i8 %151, i8* %arrayidx209, align 1, !dbg !503
  %153 = load i64* %j, align 8, !dbg !504
  %dec210 = add i64 %153, -1, !dbg !504
  store i64 %dec210, i64* %j, align 8, !dbg !504
  br label %while.cond197, !dbg !484

while.end211:                                     ; preds = %land.end
  %154 = load i64* %t, align 8, !dbg !505
  %155 = load i64* %j, align 8, !dbg !506
  %arrayidx212 = getelementptr inbounds [256 x i64]* %heap2, i32 0, i64 %155, !dbg !507
  store i64 %154, i64* %arrayidx212, align 8, !dbg !507
  %156 = load i8* %c, align 1, !dbg !508
  %157 = load i64* %j, align 8, !dbg !509
  %arrayidx213 = getelementptr inbounds [256 x i8]* %outc, i32 0, i64 %157, !dbg !510
  store i8 %156, i8* %arrayidx213, align 1, !dbg !510
  br label %for.inc214, !dbg !511

for.inc214:                                       ; preds = %while.end211
  %158 = load i64* %i, align 8, !dbg !512
  %inc215 = add i64 %158, 1, !dbg !512
  store i64 %inc215, i64* %i, align 8, !dbg !512
  br label %for.cond191, !dbg !513

for.end216:                                       ; preds = %for.cond191
  store i64 0, i64* %j, align 8, !dbg !514
  br label %for.cond217, !dbg !514

for.cond217:                                      ; preds = %for.inc222, %for.end216
  %159 = load i64* %j, align 8, !dbg !516
  %arrayidx218 = getelementptr inbounds [256 x i64]* %heap2, i32 0, i64 %159, !dbg !520
  %160 = load i64* %arrayidx218, align 8, !dbg !520
  %cmp219 = icmp eq i64 %160, 0, !dbg !520
  br i1 %cmp219, label %for.body221, label %for.end224, !dbg !521

for.body221:                                      ; preds = %for.cond217
  br label %for.inc222, !dbg !522

for.inc222:                                       ; preds = %for.body221
  %161 = load i64* %j, align 8, !dbg !524
  %inc223 = add i64 %161, 1, !dbg !524
  store i64 %inc223, i64* %j, align 8, !dbg !524
  br label %for.cond217, !dbg !526

for.end224:                                       ; preds = %for.cond217
  store i64 0, i64* %k, align 8, !dbg !527
  %162 = load i64* %j, align 8, !dbg !528
  store i64 %162, i64* %i, align 8, !dbg !529
  store i64 128, i64* %mask, align 8, !dbg !530
  store i64 0, i64* %n, align 8, !dbg !531
  %163 = load i8** %comp, align 8, !dbg !532
  store i8* %163, i8** %cptr, align 8, !dbg !533
  %164 = load i8** %data.addr, align 8, !dbg !534
  store i8* %164, i8** %dptr, align 8, !dbg !535
  br label %while.cond225, !dbg !536

while.cond225:                                    ; preds = %if.end258, %for.end224
  %165 = load i64* %n, align 8, !dbg !537
  %166 = load i64* %data_len.addr, align 8, !dbg !538
  %cmp226 = icmp ult i64 %165, %166, !dbg !539
  br i1 %cmp226, label %while.body228, label %while.end259, !dbg !536

while.body228:                                    ; preds = %while.cond225
  %167 = load i64* %k, align 8, !dbg !540
  %mul229 = mul i64 %167, 2, !dbg !540
  %add230 = add i64 %mul229, 1, !dbg !540
  store i64 %add230, i64* %k, align 8, !dbg !542
  %168 = load i8** %cptr, align 8, !dbg !543
  %169 = load i8* %168, align 1, !dbg !545
  %conv231 = zext i8 %169 to i64, !dbg !546
  %170 = load i64* %mask, align 8, !dbg !547
  %and232 = and i64 %conv231, %170, !dbg !546
  %tobool233 = icmp ne i64 %and232, 0, !dbg !548
  br i1 %tobool233, label %if.then234, label %if.end236, !dbg !548

if.then234:                                       ; preds = %while.body228
  %171 = load i64* %k, align 8, !dbg !549
  %inc235 = add i64 %171, 1, !dbg !549
  store i64 %inc235, i64* %k, align 8, !dbg !549
  br label %if.end236, !dbg !549

if.end236:                                        ; preds = %if.then234, %while.body228
  br label %while.cond237, !dbg !550

while.cond237:                                    ; preds = %while.body241, %if.end236
  %172 = load i64* %i, align 8, !dbg !551
  %arrayidx238 = getelementptr inbounds [256 x i64]* %heap2, i32 0, i64 %172, !dbg !554
  %173 = load i64* %arrayidx238, align 8, !dbg !554
  %174 = load i64* %k, align 8, !dbg !555
  %cmp239 = icmp ult i64 %173, %174, !dbg !554
  br i1 %cmp239, label %while.body241, label %while.end243, !dbg !550

while.body241:                                    ; preds = %while.cond237
  %175 = load i64* %i, align 8, !dbg !556
  %inc242 = add i64 %175, 1, !dbg !556
  store i64 %inc242, i64* %i, align 8, !dbg !556
  br label %while.cond237, !dbg !550

while.end243:                                     ; preds = %while.cond237
  %176 = load i64* %k, align 8, !dbg !557
  %177 = load i64* %i, align 8, !dbg !559
  %arrayidx244 = getelementptr inbounds [256 x i64]* %heap2, i32 0, i64 %177, !dbg !560
  %178 = load i64* %arrayidx244, align 8, !dbg !560
  %cmp245 = icmp eq i64 %176, %178, !dbg !557
  br i1 %cmp245, label %if.then247, label %if.end251, !dbg !561

if.then247:                                       ; preds = %while.end243
  %179 = load i64* %i, align 8, !dbg !562
  %arrayidx248 = getelementptr inbounds [256 x i8]* %outc, i32 0, i64 %179, !dbg !564
  %180 = load i8* %arrayidx248, align 1, !dbg !564
  %181 = load i8** %dptr, align 8, !dbg !565
  store i8 %180, i8* %181, align 1, !dbg !566
  %182 = load i8** %dptr, align 8, !dbg !567
  %incdec.ptr249 = getelementptr inbounds i8* %182, i32 1, !dbg !567
  store i8* %incdec.ptr249, i8** %dptr, align 8, !dbg !567
  %183 = load i64* %n, align 8, !dbg !568
  %inc250 = add i64 %183, 1, !dbg !568
  store i64 %inc250, i64* %n, align 8, !dbg !568
  store i64 0, i64* %k, align 8, !dbg !569
  %184 = load i64* %j, align 8, !dbg !570
  store i64 %184, i64* %i, align 8, !dbg !571
  br label %if.end251, !dbg !572

if.end251:                                        ; preds = %if.then247, %while.end243
  %185 = load i64* %mask, align 8, !dbg !573
  %cmp252 = icmp ugt i64 %185, 1, !dbg !573
  br i1 %cmp252, label %if.then254, label %if.else256, !dbg !575

if.then254:                                       ; preds = %if.end251
  %186 = load i64* %mask, align 8, !dbg !576
  %shr255 = lshr i64 %186, 1, !dbg !576
  store i64 %shr255, i64* %mask, align 8, !dbg !576
  br label %if.end258, !dbg !576

if.else256:                                       ; preds = %if.end251
  store i64 128, i64* %mask, align 8, !dbg !577
  %187 = load i8** %cptr, align 8, !dbg !579
  %incdec.ptr257 = getelementptr inbounds i8* %187, i32 1, !dbg !579
  store i8* %incdec.ptr257, i8** %cptr, align 8, !dbg !579
  br label %if.end258

if.end258:                                        ; preds = %if.else256, %if.then254
  br label %while.cond225, !dbg !536

while.end259:                                     ; preds = %while.cond225
  %188 = load i8** %comp, align 8, !dbg !580
  call void @free(i8* %188) #3, !dbg !581
  ret void, !dbg !582
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #3

; Function Attrs: nounwind uwtable
define internal void @heap_adjust(i64* %freq, i64* %heap, i32 %n, i32 %k) #0 {
entry:
  %freq.addr = alloca i64*, align 8
  %heap.addr = alloca i64*, align 8
  %n.addr = alloca i32, align 4
  %k.addr = alloca i32, align 4
  %j = alloca i32, align 4
  %v = alloca i32, align 4
  store i64* %freq, i64** %freq.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %freq.addr, metadata !583, metadata !48), !dbg !584
  store i64* %heap, i64** %heap.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %heap.addr, metadata !585, metadata !48), !dbg !586
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !587, metadata !48), !dbg !588
  store i32 %k, i32* %k.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %k.addr, metadata !589, metadata !48), !dbg !590
  call void @llvm.dbg.declare(metadata i32* %j, metadata !591, metadata !48), !dbg !592
  %0 = load i64** %heap.addr, align 8, !dbg !593
  %incdec.ptr = getelementptr inbounds i64* %0, i32 -1, !dbg !593
  store i64* %incdec.ptr, i64** %heap.addr, align 8, !dbg !593
  call void @llvm.dbg.declare(metadata i32* %v, metadata !594, metadata !48), !dbg !595
  %1 = load i32* %k.addr, align 4, !dbg !596
  %idxprom = sext i32 %1 to i64, !dbg !597
  %2 = load i64** %heap.addr, align 8, !dbg !597
  %arrayidx = getelementptr inbounds i64* %2, i64 %idxprom, !dbg !597
  %3 = load i64* %arrayidx, align 8, !dbg !597
  %conv = trunc i64 %3 to i32, !dbg !597
  store i32 %conv, i32* %v, align 4, !dbg !595
  br label %while.cond, !dbg !598

while.cond:                                       ; preds = %if.end21, %entry
  %4 = load i32* %k.addr, align 4, !dbg !599
  %5 = load i32* %n.addr, align 4, !dbg !602
  %div = sdiv i32 %5, 2, !dbg !602
  %cmp = icmp sle i32 %4, %div, !dbg !603
  br i1 %cmp, label %while.body, label %while.end, !dbg !598

while.body:                                       ; preds = %while.cond
  %6 = load i32* %k.addr, align 4, !dbg !604
  %7 = load i32* %k.addr, align 4, !dbg !606
  %add = add nsw i32 %6, %7, !dbg !604
  store i32 %add, i32* %j, align 4, !dbg !607
  %8 = load i32* %j, align 4, !dbg !608
  %9 = load i32* %n.addr, align 4, !dbg !610
  %cmp2 = icmp slt i32 %8, %9, !dbg !608
  br i1 %cmp2, label %land.lhs.true, label %if.end, !dbg !611

land.lhs.true:                                    ; preds = %while.body
  %10 = load i32* %j, align 4, !dbg !612
  %idxprom4 = sext i32 %10 to i64, !dbg !614
  %11 = load i64** %heap.addr, align 8, !dbg !614
  %arrayidx5 = getelementptr inbounds i64* %11, i64 %idxprom4, !dbg !614
  %12 = load i64* %arrayidx5, align 8, !dbg !614
  %13 = load i64** %freq.addr, align 8, !dbg !615
  %arrayidx6 = getelementptr inbounds i64* %13, i64 %12, !dbg !615
  %14 = load i64* %arrayidx6, align 8, !dbg !615
  %15 = load i32* %j, align 4, !dbg !616
  %add7 = add nsw i32 %15, 1, !dbg !616
  %idxprom8 = sext i32 %add7 to i64, !dbg !617
  %16 = load i64** %heap.addr, align 8, !dbg !617
  %arrayidx9 = getelementptr inbounds i64* %16, i64 %idxprom8, !dbg !617
  %17 = load i64* %arrayidx9, align 8, !dbg !617
  %18 = load i64** %freq.addr, align 8, !dbg !618
  %arrayidx10 = getelementptr inbounds i64* %18, i64 %17, !dbg !618
  %19 = load i64* %arrayidx10, align 8, !dbg !618
  %cmp11 = icmp ugt i64 %14, %19, !dbg !615
  br i1 %cmp11, label %if.then, label %if.end, !dbg !611

if.then:                                          ; preds = %land.lhs.true
  %20 = load i32* %j, align 4, !dbg !619
  %inc = add nsw i32 %20, 1, !dbg !619
  store i32 %inc, i32* %j, align 4, !dbg !619
  br label %if.end, !dbg !619

if.end:                                           ; preds = %if.then, %land.lhs.true, %while.body
  %21 = load i32* %v, align 4, !dbg !620
  %idxprom13 = sext i32 %21 to i64, !dbg !622
  %22 = load i64** %freq.addr, align 8, !dbg !622
  %arrayidx14 = getelementptr inbounds i64* %22, i64 %idxprom13, !dbg !622
  %23 = load i64* %arrayidx14, align 8, !dbg !622
  %24 = load i32* %j, align 4, !dbg !623
  %idxprom15 = sext i32 %24 to i64, !dbg !624
  %25 = load i64** %heap.addr, align 8, !dbg !624
  %arrayidx16 = getelementptr inbounds i64* %25, i64 %idxprom15, !dbg !624
  %26 = load i64* %arrayidx16, align 8, !dbg !624
  %27 = load i64** %freq.addr, align 8, !dbg !625
  %arrayidx17 = getelementptr inbounds i64* %27, i64 %26, !dbg !625
  %28 = load i64* %arrayidx17, align 8, !dbg !625
  %cmp18 = icmp ult i64 %23, %28, !dbg !622
  br i1 %cmp18, label %if.then20, label %if.end21, !dbg !626

if.then20:                                        ; preds = %if.end
  br label %while.end, !dbg !627

if.end21:                                         ; preds = %if.end
  %29 = load i32* %j, align 4, !dbg !628
  %idxprom22 = sext i32 %29 to i64, !dbg !629
  %30 = load i64** %heap.addr, align 8, !dbg !629
  %arrayidx23 = getelementptr inbounds i64* %30, i64 %idxprom22, !dbg !629
  %31 = load i64* %arrayidx23, align 8, !dbg !629
  %32 = load i32* %k.addr, align 4, !dbg !630
  %idxprom24 = sext i32 %32 to i64, !dbg !631
  %33 = load i64** %heap.addr, align 8, !dbg !631
  %arrayidx25 = getelementptr inbounds i64* %33, i64 %idxprom24, !dbg !631
  store i64 %31, i64* %arrayidx25, align 8, !dbg !631
  %34 = load i32* %j, align 4, !dbg !632
  store i32 %34, i32* %k.addr, align 4, !dbg !633
  br label %while.cond, !dbg !598

while.end:                                        ; preds = %if.then20, %while.cond
  %35 = load i32* %v, align 4, !dbg !634
  %conv26 = sext i32 %35 to i64, !dbg !634
  %36 = load i32* %k.addr, align 4, !dbg !635
  %idxprom27 = sext i32 %36 to i64, !dbg !636
  %37 = load i64** %heap.addr, align 8, !dbg !636
  %arrayidx28 = getelementptr inbounds i64* %37, i64 %idxprom27, !dbg !636
  store i64 %conv26, i64* %arrayidx28, align 8, !dbg !636
  ret void, !dbg !637
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #4

; Function Attrs: noreturn nounwind
declare void @exit(i32) #5

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  %ga_testing = alloca i8, align 1
  %test_data = alloca i8*, align 8
  %run_time = alloca double, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !638, metadata !48), !dbg !639
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !640, metadata !48), !dbg !641
  call void @llvm.dbg.declare(metadata i32* %i, metadata !642, metadata !48), !dbg !643
  call void @llvm.dbg.declare(metadata i8* %ga_testing, metadata !644, metadata !48), !dbg !646
  store i8 0, i8* %ga_testing, align 1, !dbg !646
  %0 = load i32* %argc.addr, align 4, !dbg !647
  %cmp = icmp sgt i32 %0, 1, !dbg !647
  br i1 %cmp, label %if.then, label %if.end3, !dbg !649

if.then:                                          ; preds = %entry
  store i32 1, i32* %i, align 4, !dbg !650
  br label %for.cond, !dbg !650

for.cond:                                         ; preds = %for.inc, %if.then
  %1 = load i32* %i, align 4, !dbg !653
  %2 = load i32* %argc.addr, align 4, !dbg !657
  %cmp1 = icmp slt i32 %1, %2, !dbg !658
  br i1 %cmp1, label %for.body, label %for.end, !dbg !659

for.body:                                         ; preds = %for.cond
  %3 = load i8*** %argv.addr, align 8, !dbg !660
  %arrayidx = getelementptr inbounds i8** %3, i64 1, !dbg !660
  %4 = load i8** %arrayidx, align 8, !dbg !660
  %call = call i32 @strcmp(i8* %4, i8* getelementptr inbounds ([4 x i8]* @.str4, i32 0, i32 0)) #8, !dbg !663
  %tobool = icmp ne i32 %call, 0, !dbg !664
  br i1 %tobool, label %if.end, label %if.then2, !dbg !664

if.then2:                                         ; preds = %for.body
  store i8 1, i8* %ga_testing, align 1, !dbg !665
  br label %for.end, !dbg !667

if.end:                                           ; preds = %for.body
  br label %for.inc, !dbg !668

for.inc:                                          ; preds = %if.end
  %5 = load i32* %i, align 4, !dbg !669
  %inc = add nsw i32 %5, 1, !dbg !669
  store i32 %inc, i32* %i, align 4, !dbg !669
  br label %for.cond, !dbg !670

for.end:                                          ; preds = %if.then2, %for.cond
  br label %if.end3, !dbg !671

if.end3:                                          ; preds = %for.end, %entry
  call void @llvm.dbg.declare(metadata i8** %test_data, metadata !672, metadata !48), !dbg !673
  %call4 = call i8* @generate_test_data(i64 10000000), !dbg !674
  store i8* %call4, i8** %test_data, align 8, !dbg !673
  store i32 0, i32* %i, align 4, !dbg !675
  br label %for.cond5, !dbg !675

for.cond5:                                        ; preds = %for.inc8, %if.end3
  %6 = load i32* %i, align 4, !dbg !677
  %cmp6 = icmp slt i32 %6, 30, !dbg !677
  br i1 %cmp6, label %for.body7, label %for.end10, !dbg !681

for.body7:                                        ; preds = %for.cond5
  %7 = load i8** %test_data, align 8, !dbg !682
  call void @compdecomp(i8* %7, i64 10000000), !dbg !683
  br label %for.inc8, !dbg !683

for.inc8:                                         ; preds = %for.body7
  %8 = load i32* %i, align 4, !dbg !684
  %inc9 = add nsw i32 %8, 1, !dbg !684
  store i32 %inc9, i32* %i, align 4, !dbg !684
  br label %for.cond5, !dbg !685

for.end10:                                        ; preds = %for.cond5
  call void @llvm.dbg.declare(metadata double* %run_time, metadata !686, metadata !48), !dbg !688
  store double 0.000000e+00, double* %run_time, align 8, !dbg !688
  %9 = load i8** %test_data, align 8, !dbg !689
  call void @free(i8* %9) #3, !dbg !690
  %10 = load i8* %ga_testing, align 1, !dbg !691
  %tobool11 = trunc i8 %10 to i1, !dbg !691
  br i1 %tobool11, label %if.then12, label %if.else, !dbg !693

if.then12:                                        ; preds = %for.end10
  %11 = load %struct._IO_FILE** @stdout, align 8, !dbg !694
  %12 = load double* %run_time, align 8, !dbg !695
  %call13 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([3 x i8]* @.str5, i32 0, i32 0), double %12), !dbg !696
  br label %if.end15, !dbg !696

if.else:                                          ; preds = %for.end10
  %13 = load %struct._IO_FILE** @stdout, align 8, !dbg !697
  %14 = load double* %run_time, align 8, !dbg !698
  %call14 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([35 x i8]* @.str6, i32 0, i32 0), double %14), !dbg !699
  br label %if.end15

if.end15:                                         ; preds = %if.else, %if.then12
  %15 = load %struct._IO_FILE** @stdout, align 8, !dbg !700
  %call16 = call i32 @fflush(%struct._IO_FILE* %15), !dbg !701
  ret i32 0, !dbg !702
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #6

declare i32 @fflush(%struct._IO_FILE*) #4

; Function Attrs: nounwind uwtable
define internal i64 @random4() #0 {
entry:
  %k = alloca i64, align 8
  %result = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64* %k, metadata !703, metadata !48), !dbg !704
  call void @llvm.dbg.declare(metadata i64* %result, metadata !705, metadata !48), !dbg !706
  %0 = load i64* @seed, align 8, !dbg !707
  %xor = xor i64 %0, 123459876, !dbg !707
  store i64 %xor, i64* @seed, align 8, !dbg !707
  %1 = load i64* @seed, align 8, !dbg !708
  %div = sdiv i64 %1, 127773, !dbg !708
  store i64 %div, i64* %k, align 8, !dbg !709
  %2 = load i64* @seed, align 8, !dbg !710
  %3 = load i64* %k, align 8, !dbg !711
  %mul = mul nsw i64 %3, 127773, !dbg !711
  %sub = sub nsw i64 %2, %mul, !dbg !710
  %mul1 = mul nsw i64 16807, %sub, !dbg !712
  %4 = load i64* %k, align 8, !dbg !713
  %mul2 = mul nsw i64 2836, %4, !dbg !714
  %sub3 = sub nsw i64 %mul1, %mul2, !dbg !712
  store i64 %sub3, i64* @seed, align 8, !dbg !715
  %5 = load i64* @seed, align 8, !dbg !716
  %cmp = icmp slt i64 %5, 0, !dbg !716
  br i1 %cmp, label %if.then, label %if.end, !dbg !718

if.then:                                          ; preds = %entry
  %6 = load i64* @seed, align 8, !dbg !719
  %add = add nsw i64 %6, 2147483647, !dbg !719
  store i64 %add, i64* @seed, align 8, !dbg !719
  br label %if.end, !dbg !719

if.end:                                           ; preds = %if.then, %entry
  %7 = load i64* @seed, align 8, !dbg !720
  %rem = srem i64 %7, 32, !dbg !720
  store i64 %rem, i64* %result, align 8, !dbg !721
  %8 = load i64* @seed, align 8, !dbg !722
  %xor4 = xor i64 %8, 123459876, !dbg !722
  store i64 %xor4, i64* @seed, align 8, !dbg !722
  %9 = load i64* %result, align 8, !dbg !723
  ret i64 %9, !dbg !724
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { noreturn nounwind }
attributes #8 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!44, !45}
!llvm.ident = !{!46}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\000\00\000\00\001", !1, !2, !3, !11, !32, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c] [DW_LANG_C99]
!1 = !{!"huffbench.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4, !5, !7, !9, !6, !10}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from byte]
!5 = !{!"0x16\00byte\0084\000\000\000\000", !1, null, !6} ; [ DW_TAG_typedef ] [byte] [line 84, size 0, align 0, offset 0] [from unsigned char]
!6 = !{!"0x24\00unsigned char\000\008\008\000\000\008", null, null} ; [ DW_TAG_base_type ] [unsigned char] [line 0, size 8, align 8, offset 0, enc DW_ATE_unsigned_char]
!7 = !{!"0x16\00size_t\0062\000\000\000\000", !8, null, !9} ; [ DW_TAG_typedef ] [size_t] [line 62, size 0, align 0, offset 0] [from long unsigned int]
!8 = !{!"/usr/local/bin/../lib/clang/3.6.0/include/stddef.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!9 = !{!"0x24\00long unsigned int\000\0064\0064\000\000\007", null, null} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!10 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!11 = !{!12, !16, !19, !25, !29}
!12 = !{!"0x2e\00generate_test_data\00generate_test_data\00\0088\000\001\000\000\00256\000\0089", !1, !13, !14, null, i8* (i64)* @generate_test_data, null, null, !2} ; [ DW_TAG_subprogram ] [line 88] [def] [scope 89] [generate_test_data]
!13 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!14 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !15, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!15 = !{!4, !7}
!16 = !{!"0x2e\00compdecomp\00compdecomp\00\00136\000\001\000\000\00256\000\00137", !1, !13, !17, null, void (i8*, i64)* @compdecomp, null, null, !2} ; [ DW_TAG_subprogram ] [line 136] [def] [scope 137] [compdecomp]
!17 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !18, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!18 = !{null, !4, !7}
!19 = !{!"0x2e\00main\00main\00\00434\000\001\000\000\00256\000\00435", !1, !13, !20, null, i32 (i32, i8**)* @main, null, null, !2} ; [ DW_TAG_subprogram ] [line 434] [def] [scope 435] [main]
!20 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !21, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!21 = !{!22, !22, !23}
!22 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!23 = !{!"0xf\00\000\0064\0064\000\000", null, null, !24} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!24 = !{!"0xf\00\000\0064\0064\000\000", null, null, !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!25 = !{!"0x2e\00heap_adjust\00heap_adjust\00\00106\001\001\000\000\00256\000\00107", !1, !13, !26, null, void (i64*, i64*, i32, i32)* @heap_adjust, null, null, !2} ; [ DW_TAG_subprogram ] [line 106] [local] [def] [scope 107] [heap_adjust]
!26 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !27, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!27 = !{null, !28, !28, !22, !22}
!28 = !{!"0xf\00\000\0064\0064\000\000", null, null, !7} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from size_t]
!29 = !{!"0x2e\00random4\00random4\00\0047\001\001\000\000\000\000\0048", !1, !13, !30, null, i64 ()* @random4, null, null, !2} ; [ DW_TAG_subprogram ] [line 47] [local] [def] [scope 48] [random4]
!30 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !31, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!31 = !{!7}
!32 = !{!33, !35, !36, !39, !40, !41, !42, !43}
!33 = !{!"0x34\00TEST_SIZE\00TEST_SIZE\00\0079\001\001", null, !13, !34, i32 10000000, null} ; [ DW_TAG_variable ] [TEST_SIZE] [line 79] [local] [def]
!34 = !{!"0x26\00\000\000\000\000\000", null, null, !22} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from int]
!35 = !{!"0x34\00NUM_LOOPS\00NUM_LOOPS\00\0078\001\001", null, !13, !34, i32 30, null} ; [ DW_TAG_variable ] [NUM_LOOPS] [line 78] [local] [def]
!36 = !{!"0x34\00MASK\00MASK\00\0044\001\001", null, !13, !37, i64 123459876, null} ; [ DW_TAG_variable ] [MASK] [line 44] [local] [def]
!37 = !{!"0x26\00\000\000\000\000\000", null, null, !38} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from long int]
!38 = !{!"0x24\00long int\000\0064\0064\000\000\005", null, null} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!39 = !{!"0x34\00IQ\00IQ\00\0042\001\001", null, !13, !37, i64 127773, null} ; [ DW_TAG_variable ] [IQ] [line 42] [local] [def]
!40 = !{!"0x34\00IA\00IA\00\0040\001\001", null, !13, !37, i64 16807, null} ; [ DW_TAG_variable ] [IA] [line 40] [local] [def]
!41 = !{!"0x34\00IR\00IR\00\0043\001\001", null, !13, !37, i64 2836, null} ; [ DW_TAG_variable ] [IR] [line 43] [local] [def]
!42 = !{!"0x34\00IM\00IM\00\0041\001\001", null, !13, !37, i64 2147483647, null} ; [ DW_TAG_variable ] [IM] [line 41] [local] [def]
!43 = !{!"0x34\00seed\00seed\00\0039\001\001", null, !13, !38, i64* @seed, null} ; [ DW_TAG_variable ] [seed] [line 39] [local] [def]
!44 = !{i32 2, !"Dwarf Version", i32 4}
!45 = !{i32 2, !"Debug Info Version", i32 2}
!46 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!47 = !{!"0x101\00n\0016777304\000", !12, !13, !7} ; [ DW_TAG_arg_variable ] [n] [line 88]
!48 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!49 = !MDLocation(line: 88, column: 34, scope: !12)
!50 = !{!"0x100\00codes\0090\000", !12, !13, !24} ; [ DW_TAG_auto_variable ] [codes] [line 90]
!51 = !MDLocation(line: 90, column: 12, scope: !12)
!52 = !{!"0x100\00result\0092\000", !12, !13, !4} ; [ DW_TAG_auto_variable ] [result] [line 92]
!53 = !MDLocation(line: 92, column: 12, scope: !12)
!54 = !MDLocation(line: 92, column: 36, scope: !12)
!55 = !MDLocation(line: 92, column: 29, scope: !12)
!56 = !{!"0x100\00ptr\0093\000", !12, !13, !4}    ; [ DW_TAG_auto_variable ] [ptr] [line 93]
!57 = !MDLocation(line: 93, column: 12, scope: !12)
!58 = !MDLocation(line: 93, column: 18, scope: !12)
!59 = !{!"0x100\00i\0095\000", !12, !13, !22}     ; [ DW_TAG_auto_variable ] [i] [line 95]
!60 = !MDLocation(line: 95, column: 9, scope: !12)
!61 = !MDLocation(line: 96, column: 10, scope: !62)
!62 = !{!"0xb\0096\005\000", !1, !12}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!63 = !MDLocation(line: 96, column: 17, scope: !64)
!64 = !{!"0xb\002", !1, !65}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!65 = !{!"0xb\001", !1, !66}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!66 = !{!"0xb\0096\005\001", !1, !62}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!67 = !MDLocation(line: 96, column: 21, scope: !66)
!68 = !MDLocation(line: 96, column: 17, scope: !66)
!69 = !MDLocation(line: 96, column: 5, scope: !62)
!70 = !MDLocation(line: 98, column: 28, scope: !71)
!71 = !{!"0xb\0097\005\002", !1, !66}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!72 = !MDLocation(line: 98, column: 22, scope: !71)
!73 = !MDLocation(line: 98, column: 10, scope: !71)
!74 = !MDLocation(line: 98, column: 9, scope: !71)
!75 = !MDLocation(line: 99, column: 9, scope: !71)
!76 = !MDLocation(line: 100, column: 5, scope: !71)
!77 = !MDLocation(line: 96, column: 24, scope: !66)
!78 = !MDLocation(line: 96, column: 5, scope: !66)
!79 = !MDLocation(line: 102, column: 12, scope: !12)
!80 = !MDLocation(line: 102, column: 5, scope: !12)
!81 = !{!"0x101\00data\0016777352\000", !16, !13, !4} ; [ DW_TAG_arg_variable ] [data] [line 136]
!82 = !MDLocation(line: 136, column: 24, scope: !16)
!83 = !{!"0x101\00data_len\0033554568\000", !16, !13, !7} ; [ DW_TAG_arg_variable ] [data_len] [line 136]
!84 = !MDLocation(line: 136, column: 37, scope: !16)
!85 = !{!"0x100\00i\00138\000", !16, !13, !7}     ; [ DW_TAG_auto_variable ] [i] [line 138]
!86 = !MDLocation(line: 138, column: 12, scope: !16)
!87 = !{!"0x100\00j\00138\000", !16, !13, !7}     ; [ DW_TAG_auto_variable ] [j] [line 138]
!88 = !MDLocation(line: 138, column: 15, scope: !16)
!89 = !{!"0x100\00n\00138\000", !16, !13, !7}     ; [ DW_TAG_auto_variable ] [n] [line 138]
!90 = !MDLocation(line: 138, column: 18, scope: !16)
!91 = !{!"0x100\00mask\00138\000", !16, !13, !7}  ; [ DW_TAG_auto_variable ] [mask] [line 138]
!92 = !MDLocation(line: 138, column: 21, scope: !16)
!93 = !{!"0x100\00k\00139\000", !16, !13, !94}    ; [ DW_TAG_auto_variable ] [k] [line 139]
!94 = !{!"0x16\00bits32\0083\000\000\000\000", !1, null, !9} ; [ DW_TAG_typedef ] [bits32] [line 83, size 0, align 0, offset 0] [from long unsigned int]
!95 = !MDLocation(line: 139, column: 12, scope: !16)
!96 = !{!"0x100\00t\00139\000", !16, !13, !94}    ; [ DW_TAG_auto_variable ] [t] [line 139]
!97 = !MDLocation(line: 139, column: 15, scope: !16)
!98 = !{!"0x100\00c\00140\000", !16, !13, !5}     ; [ DW_TAG_auto_variable ] [c] [line 140]
!99 = !MDLocation(line: 140, column: 12, scope: !16)
!100 = !{!"0x100\00cptr\00141\000", !16, !13, !4} ; [ DW_TAG_auto_variable ] [cptr] [line 141]
!101 = !MDLocation(line: 141, column: 12, scope: !16)
!102 = !{!"0x100\00dptr\00142\000", !16, !13, !4} ; [ DW_TAG_auto_variable ] [dptr] [line 142]
!103 = !MDLocation(line: 142, column: 12, scope: !16)
!104 = !MDLocation(line: 142, column: 19, scope: !16)
!105 = !{!"0x100\00comp\00149\000", !16, !13, !4} ; [ DW_TAG_auto_variable ] [comp] [line 149]
!106 = !MDLocation(line: 149, column: 12, scope: !16)
!107 = !MDLocation(line: 149, column: 34, scope: !16)
!108 = !MDLocation(line: 149, column: 27, scope: !16)
!109 = !{!"0x100\00freq\00151\000", !16, !13, !110} ; [ DW_TAG_auto_variable ] [freq] [line 151]
!110 = !{!"0x1\00\000\0032768\0064\000\000\000", null, null, !7, !111, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 32768, align 64, offset 0] [from size_t]
!111 = !{!112}
!112 = !{!"0x21\000\00512"}                       ; [ DW_TAG_subrange_type ] [0, 511]
!113 = !MDLocation(line: 151, column: 12, scope: !16)
!114 = !{!"0x100\00heap\00152\000", !16, !13, !115} ; [ DW_TAG_auto_variable ] [heap] [line 152]
!115 = !{!"0x1\00\000\0016384\0064\000\000\000", null, null, !7, !116, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16384, align 64, offset 0] [from size_t]
!116 = !{!117}
!117 = !{!"0x21\000\00256"}                       ; [ DW_TAG_subrange_type ] [0, 255]
!118 = !MDLocation(line: 152, column: 12, scope: !16)
!119 = !{!"0x100\00link\00153\000", !16, !13, !120} ; [ DW_TAG_auto_variable ] [link] [line 153]
!120 = !{!"0x1\00\000\0016384\0032\000\000\000", null, null, !22, !111, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16384, align 32, offset 0] [from int]
!121 = !MDLocation(line: 153, column: 12, scope: !16)
!122 = !{!"0x100\00code\00154\000", !16, !13, !123} ; [ DW_TAG_auto_variable ] [code] [line 154]
!123 = !{!"0x1\00\000\0016384\0064\000\000\000", null, null, !94, !116, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16384, align 64, offset 0] [from bits32]
!124 = !MDLocation(line: 154, column: 12, scope: !16)
!125 = !{!"0x100\00clen\00155\000", !16, !13, !126} ; [ DW_TAG_auto_variable ] [clen] [line 155]
!126 = !{!"0x1\00\000\002048\008\000\000\000", null, null, !5, !116, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 2048, align 8, offset 0] [from byte]
!127 = !MDLocation(line: 155, column: 12, scope: !16)
!128 = !MDLocation(line: 157, column: 12, scope: !16)
!129 = !MDLocation(line: 157, column: 37, scope: !16)
!130 = !MDLocation(line: 157, column: 19, scope: !16)
!131 = !MDLocation(line: 157, column: 5, scope: !16)
!132 = !MDLocation(line: 158, column: 5, scope: !16)
!133 = !MDLocation(line: 159, column: 5, scope: !16)
!134 = !MDLocation(line: 160, column: 5, scope: !16)
!135 = !MDLocation(line: 161, column: 5, scope: !16)
!136 = !MDLocation(line: 162, column: 5, scope: !16)
!137 = !MDLocation(line: 165, column: 10, scope: !138)
!138 = !{!"0xb\00165\005\003", !1, !16}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!139 = !MDLocation(line: 165, column: 17, scope: !140)
!140 = !{!"0xb\002", !1, !141}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!141 = !{!"0xb\001", !1, !142}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!142 = !{!"0xb\00165\005\004", !1, !138}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!143 = !MDLocation(line: 165, column: 21, scope: !142)
!144 = !MDLocation(line: 165, column: 17, scope: !142)
!145 = !MDLocation(line: 165, column: 5, scope: !138)
!146 = !MDLocation(line: 167, column: 26, scope: !147)
!147 = !{!"0xb\00166\005\005", !1, !142}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!148 = !MDLocation(line: 167, column: 25, scope: !147)
!149 = !MDLocation(line: 167, column: 16, scope: !147)
!150 = !MDLocation(line: 167, column: 9, scope: !147)
!151 = !MDLocation(line: 168, column: 9, scope: !147)
!152 = !MDLocation(line: 169, column: 5, scope: !147)
!153 = !MDLocation(line: 165, column: 31, scope: !142)
!154 = !MDLocation(line: 165, column: 5, scope: !142)
!155 = !MDLocation(line: 172, column: 5, scope: !16)
!156 = !MDLocation(line: 174, column: 10, scope: !157)
!157 = !{!"0xb\00174\005\006", !1, !16}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!158 = !MDLocation(line: 174, column: 17, scope: !159)
!159 = !{!"0xb\002", !1, !160}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!160 = !{!"0xb\001", !1, !161}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!161 = !{!"0xb\00174\005\007", !1, !157}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!162 = !MDLocation(line: 174, column: 5, scope: !157)
!163 = !MDLocation(line: 176, column: 18, scope: !164)
!164 = !{!"0xb\00176\0013\009", !1, !165}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!165 = !{!"0xb\00175\005\008", !1, !161}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!166 = !MDLocation(line: 176, column: 13, scope: !164)
!167 = !MDLocation(line: 176, column: 13, scope: !165)
!168 = !MDLocation(line: 178, column: 23, scope: !169)
!169 = !{!"0xb\00177\009\0010", !1, !164}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!170 = !MDLocation(line: 178, column: 18, scope: !169)
!171 = !MDLocation(line: 178, column: 13, scope: !169)
!172 = !MDLocation(line: 179, column: 13, scope: !169)
!173 = !MDLocation(line: 180, column: 9, scope: !169)
!174 = !MDLocation(line: 181, column: 5, scope: !165)
!175 = !MDLocation(line: 174, column: 26, scope: !161)
!176 = !MDLocation(line: 174, column: 5, scope: !161)
!177 = !MDLocation(line: 183, column: 14, scope: !178)
!178 = !{!"0xb\00183\005\0011", !1, !16}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!179 = !MDLocation(line: 183, column: 10, scope: !178)
!180 = !MDLocation(line: 183, column: 17, scope: !181)
!181 = !{!"0xb\002", !1, !182}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!182 = !{!"0xb\001", !1, !183}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!183 = !{!"0xb\00183\005\0012", !1, !178}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!184 = !MDLocation(line: 183, column: 5, scope: !178)
!185 = !MDLocation(line: 184, column: 21, scope: !183)
!186 = !MDLocation(line: 184, column: 26, scope: !183)
!187 = !MDLocation(line: 184, column: 31, scope: !183)
!188 = !MDLocation(line: 184, column: 33, scope: !183)
!189 = !MDLocation(line: 184, column: 9, scope: !183)
!190 = !MDLocation(line: 183, column: 24, scope: !183)
!191 = !MDLocation(line: 183, column: 5, scope: !183)
!192 = !{!"0x100\00temp\00187\000", !16, !13, !7} ; [ DW_TAG_auto_variable ] [temp] [line 187]
!193 = !MDLocation(line: 187, column: 12, scope: !16)
!194 = !MDLocation(line: 191, column: 5, scope: !16)
!195 = !MDLocation(line: 191, column: 12, scope: !196)
!196 = !{!"0xb\002", !1, !197}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!197 = !{!"0xb\001", !1, !16}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!198 = !MDLocation(line: 194, column: 9, scope: !199)
!199 = !{!"0xb\00192\005\0013", !1, !16}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!200 = !MDLocation(line: 195, column: 19, scope: !199)
!201 = !MDLocation(line: 195, column: 9, scope: !199)
!202 = !MDLocation(line: 196, column: 24, scope: !199)
!203 = !MDLocation(line: 196, column: 19, scope: !199)
!204 = !MDLocation(line: 196, column: 9, scope: !199)
!205 = !MDLocation(line: 199, column: 21, scope: !199)
!206 = !MDLocation(line: 199, column: 26, scope: !199)
!207 = !MDLocation(line: 199, column: 31, scope: !199)
!208 = !MDLocation(line: 199, column: 9, scope: !199)
!209 = !MDLocation(line: 203, column: 30, scope: !199)
!210 = !MDLocation(line: 203, column: 25, scope: !199)
!211 = !MDLocation(line: 203, column: 46, scope: !199)
!212 = !MDLocation(line: 203, column: 41, scope: !199)
!213 = !MDLocation(line: 203, column: 20, scope: !199)
!214 = !MDLocation(line: 203, column: 14, scope: !199)
!215 = !MDLocation(line: 203, column: 9, scope: !199)
!216 = !MDLocation(line: 204, column: 32, scope: !199)
!217 = !MDLocation(line: 204, column: 26, scope: !199)
!218 = !MDLocation(line: 204, column: 14, scope: !199)
!219 = !MDLocation(line: 204, column: 9, scope: !199)
!220 = !MDLocation(line: 205, column: 32, scope: !199)
!221 = !MDLocation(line: 205, column: 25, scope: !199)
!222 = !MDLocation(line: 205, column: 14, scope: !199)
!223 = !MDLocation(line: 205, column: 9, scope: !199)
!224 = !MDLocation(line: 206, column: 32, scope: !199)
!225 = !MDLocation(line: 206, column: 26, scope: !199)
!226 = !MDLocation(line: 206, column: 9, scope: !199)
!227 = !MDLocation(line: 209, column: 21, scope: !199)
!228 = !MDLocation(line: 209, column: 26, scope: !199)
!229 = !MDLocation(line: 209, column: 31, scope: !199)
!230 = !MDLocation(line: 209, column: 9, scope: !199)
!231 = !MDLocation(line: 212, column: 16, scope: !16)
!232 = !MDLocation(line: 212, column: 10, scope: !16)
!233 = !MDLocation(line: 212, column: 5, scope: !16)
!234 = !{!"0x100\00m\00215\000", !16, !13, !7}    ; [ DW_TAG_auto_variable ] [m] [line 215]
!235 = !MDLocation(line: 215, column: 12, scope: !16)
!236 = !{!"0x100\00x\00215\000", !16, !13, !7}    ; [ DW_TAG_auto_variable ] [x] [line 215]
!237 = !MDLocation(line: 215, column: 15, scope: !16)
!238 = !{!"0x100\00maxx\00215\000", !16, !13, !7} ; [ DW_TAG_auto_variable ] [maxx] [line 215]
!239 = !MDLocation(line: 215, column: 18, scope: !16)
!240 = !{!"0x100\00maxi\00215\000", !16, !13, !7} ; [ DW_TAG_auto_variable ] [maxi] [line 215]
!241 = !MDLocation(line: 215, column: 28, scope: !16)
!242 = !{!"0x100\00l\00216\000", !16, !13, !22}   ; [ DW_TAG_auto_variable ] [l] [line 216]
!243 = !MDLocation(line: 216, column: 9, scope: !16)
!244 = !MDLocation(line: 218, column: 10, scope: !245)
!245 = !{!"0xb\00218\005\0014", !1, !16}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!246 = !MDLocation(line: 218, column: 17, scope: !247)
!247 = !{!"0xb\002", !1, !248}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!248 = !{!"0xb\001", !1, !249}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!249 = !{!"0xb\00218\005\0015", !1, !245}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!250 = !MDLocation(line: 218, column: 5, scope: !245)
!251 = !MDLocation(line: 220, column: 19, scope: !252)
!252 = !{!"0xb\00220\0013\0017", !1, !253}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!253 = !{!"0xb\00219\005\0016", !1, !249}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!254 = !MDLocation(line: 220, column: 14, scope: !252)
!255 = !MDLocation(line: 220, column: 13, scope: !253)
!256 = !MDLocation(line: 222, column: 18, scope: !257)
!257 = !{!"0xb\00221\009\0018", !1, !252}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!258 = !MDLocation(line: 222, column: 13, scope: !257)
!259 = !MDLocation(line: 223, column: 18, scope: !257)
!260 = !MDLocation(line: 223, column: 13, scope: !257)
!261 = !MDLocation(line: 224, column: 9, scope: !257)
!262 = !MDLocation(line: 227, column: 13, scope: !263)
!263 = !{!"0xb\00226\009\0019", !1, !252}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!264 = !MDLocation(line: 228, column: 13, scope: !263)
!265 = !MDLocation(line: 229, column: 13, scope: !263)
!266 = !MDLocation(line: 230, column: 22, scope: !263)
!267 = !MDLocation(line: 230, column: 17, scope: !263)
!268 = !MDLocation(line: 230, column: 13, scope: !263)
!269 = !MDLocation(line: 232, column: 13, scope: !263)
!270 = !MDLocation(line: 232, column: 20, scope: !271)
!271 = !{!"0xb\002", !1, !272}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!272 = !{!"0xb\001", !1, !263}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!273 = !MDLocation(line: 234, column: 21, scope: !274)
!274 = !{!"0xb\00234\0021\0021", !1, !275}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!275 = !{!"0xb\00233\0013\0020", !1, !263}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!276 = !MDLocation(line: 234, column: 21, scope: !275)
!277 = !MDLocation(line: 236, column: 27, scope: !278)
!278 = !{!"0xb\00235\0017\0022", !1, !274}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!279 = !MDLocation(line: 236, column: 21, scope: !278)
!280 = !MDLocation(line: 237, column: 27, scope: !278)
!281 = !MDLocation(line: 237, column: 26, scope: !278)
!282 = !MDLocation(line: 237, column: 21, scope: !278)
!283 = !MDLocation(line: 238, column: 17, scope: !278)
!284 = !MDLocation(line: 240, column: 27, scope: !275)
!285 = !MDLocation(line: 240, column: 22, scope: !275)
!286 = !MDLocation(line: 240, column: 17, scope: !275)
!287 = !MDLocation(line: 241, column: 17, scope: !275)
!288 = !MDLocation(line: 242, column: 17, scope: !275)
!289 = !MDLocation(line: 245, column: 38, scope: !263)
!290 = !MDLocation(line: 245, column: 18, scope: !263)
!291 = !MDLocation(line: 245, column: 13, scope: !263)
!292 = !MDLocation(line: 246, column: 38, scope: !263)
!293 = !MDLocation(line: 246, column: 23, scope: !263)
!294 = !MDLocation(line: 246, column: 18, scope: !263)
!295 = !MDLocation(line: 246, column: 13, scope: !263)
!296 = !MDLocation(line: 249, column: 17, scope: !297)
!297 = !{!"0xb\00249\0017\0023", !1, !263}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!298 = !MDLocation(line: 249, column: 21, scope: !297)
!299 = !MDLocation(line: 249, column: 17, scope: !263)
!300 = !MDLocation(line: 250, column: 24, scope: !297)
!301 = !MDLocation(line: 250, column: 17, scope: !297)
!302 = !MDLocation(line: 253, column: 17, scope: !303)
!303 = !{!"0xb\00253\0017\0024", !1, !263}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!304 = !MDLocation(line: 253, column: 21, scope: !303)
!305 = !MDLocation(line: 253, column: 17, scope: !263)
!306 = !MDLocation(line: 254, column: 24, scope: !303)
!307 = !MDLocation(line: 254, column: 17, scope: !303)
!308 = !MDLocation(line: 256, column: 5, scope: !253)
!309 = !MDLocation(line: 218, column: 26, scope: !249)
!310 = !MDLocation(line: 218, column: 5, scope: !249)
!311 = !MDLocation(line: 259, column: 9, scope: !312)
!312 = !{!"0xb\00259\009\0025", !1, !16}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!313 = !MDLocation(line: 259, column: 9, scope: !16)
!314 = !MDLocation(line: 261, column: 17, scope: !315)
!315 = !{!"0xb\00260\005\0026", !1, !312}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!316 = !MDLocation(line: 261, column: 9, scope: !315)
!317 = !MDLocation(line: 262, column: 9, scope: !315)
!318 = !{!"0x100\00comp_len\00266\000", !16, !13, !7} ; [ DW_TAG_auto_variable ] [comp_len] [line 266]
!319 = !MDLocation(line: 266, column: 12, scope: !16)
!320 = !{!"0x100\00bout\00267\000", !16, !13, !10} ; [ DW_TAG_auto_variable ] [bout] [line 267]
!321 = !MDLocation(line: 267, column: 12, scope: !16)
!322 = !{!"0x100\00bit\00268\000", !16, !13, !22} ; [ DW_TAG_auto_variable ] [bit] [line 268]
!323 = !MDLocation(line: 268, column: 12, scope: !16)
!324 = !MDLocation(line: 269, column: 12, scope: !16)
!325 = !MDLocation(line: 269, column: 5, scope: !16)
!326 = !MDLocation(line: 272, column: 9, scope: !327)
!327 = !{!"0xb\00272\009\0027", !1, !16}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!328 = !MDLocation(line: 272, column: 9, scope: !16)
!329 = !MDLocation(line: 274, column: 17, scope: !330)
!330 = !{!"0xb\00273\005\0028", !1, !327}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!331 = !MDLocation(line: 274, column: 9, scope: !330)
!332 = !MDLocation(line: 275, column: 9, scope: !330)
!333 = !MDLocation(line: 278, column: 10, scope: !334)
!334 = !{!"0xb\00278\005\0029", !1, !16}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!335 = !MDLocation(line: 278, column: 17, scope: !336)
!336 = !{!"0xb\002", !1, !337}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!337 = !{!"0xb\001", !1, !338}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!338 = !{!"0xb\00278\005\0030", !1, !334}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!339 = !MDLocation(line: 278, column: 21, scope: !338)
!340 = !MDLocation(line: 278, column: 17, scope: !338)
!341 = !MDLocation(line: 278, column: 5, scope: !334)
!342 = !MDLocation(line: 281, column: 29, scope: !343)
!343 = !{!"0xb\00279\005\0031", !1, !338}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!344 = !MDLocation(line: 281, column: 28, scope: !343)
!345 = !MDLocation(line: 281, column: 22, scope: !343)
!346 = !MDLocation(line: 281, column: 16, scope: !343)
!347 = !MDLocation(line: 281, column: 9, scope: !343)
!348 = !MDLocation(line: 284, column: 14, scope: !349)
!349 = !{!"0xb\00284\009\0032", !1, !343}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!350 = !MDLocation(line: 284, column: 21, scope: !351)
!351 = !{!"0xb\002", !1, !352}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!352 = !{!"0xb\001", !1, !353}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!353 = !{!"0xb\00284\009\0033", !1, !349}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!354 = !MDLocation(line: 284, column: 32, scope: !353)
!355 = !MDLocation(line: 284, column: 31, scope: !353)
!356 = !MDLocation(line: 284, column: 25, scope: !353)
!357 = !MDLocation(line: 284, column: 21, scope: !353)
!358 = !MDLocation(line: 284, column: 9, scope: !349)
!359 = !MDLocation(line: 286, column: 17, scope: !360)
!360 = !{!"0xb\00286\0017\0035", !1, !361}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!361 = !{!"0xb\00285\009\0034", !1, !353}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!362 = !MDLocation(line: 286, column: 17, scope: !361)
!363 = !MDLocation(line: 289, column: 34, scope: !364)
!364 = !{!"0xb\00287\0013\0036", !1, !360}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!365 = !MDLocation(line: 289, column: 22, scope: !364)
!366 = !MDLocation(line: 289, column: 17, scope: !364)
!367 = !MDLocation(line: 290, column: 17, scope: !364)
!368 = !MDLocation(line: 293, column: 21, scope: !369)
!369 = !{!"0xb\00293\0021\0037", !1, !364}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!370 = !MDLocation(line: 293, column: 33, scope: !369)
!371 = !MDLocation(line: 293, column: 21, scope: !364)
!372 = !MDLocation(line: 295, column: 29, scope: !373)
!373 = !{!"0xb\00294\0017\0038", !1, !369}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!374 = !MDLocation(line: 295, column: 21, scope: !373)
!375 = !MDLocation(line: 296, column: 21, scope: !373)
!376 = !MDLocation(line: 299, column: 17, scope: !364)
!377 = !MDLocation(line: 300, column: 17, scope: !364)
!378 = !MDLocation(line: 301, column: 13, scope: !364)
!379 = !MDLocation(line: 305, column: 17, scope: !380)
!380 = !{!"0xb\00303\0013\0039", !1, !360}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!381 = !MDLocation(line: 306, column: 17, scope: !380)
!382 = !MDLocation(line: 309, column: 24, scope: !383)
!383 = !{!"0xb\00309\0017\0040", !1, !361}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!384 = !MDLocation(line: 309, column: 23, scope: !383)
!385 = !MDLocation(line: 309, column: 17, scope: !383)
!386 = !MDLocation(line: 309, column: 33, scope: !383)
!387 = !MDLocation(line: 309, column: 17, scope: !361)
!388 = !MDLocation(line: 310, column: 17, scope: !383)
!389 = !MDLocation(line: 312, column: 13, scope: !361)
!390 = !MDLocation(line: 313, column: 9, scope: !361)
!391 = !MDLocation(line: 284, column: 40, scope: !353)
!392 = !MDLocation(line: 284, column: 9, scope: !353)
!393 = !MDLocation(line: 315, column: 9, scope: !343)
!394 = !MDLocation(line: 316, column: 5, scope: !343)
!395 = !MDLocation(line: 278, column: 31, scope: !338)
!396 = !MDLocation(line: 278, column: 5, scope: !338)
!397 = !MDLocation(line: 319, column: 19, scope: !16)
!398 = !MDLocation(line: 319, column: 15, scope: !16)
!399 = !MDLocation(line: 319, column: 5, scope: !16)
!400 = !MDLocation(line: 320, column: 22, scope: !16)
!401 = !MDLocation(line: 320, column: 10, scope: !16)
!402 = !MDLocation(line: 320, column: 5, scope: !16)
!403 = !MDLocation(line: 321, column: 5, scope: !16)
!404 = !{!"0x100\00heap2\00331\000", !16, !13, !123} ; [ DW_TAG_auto_variable ] [heap2] [line 331]
!405 = !MDLocation(line: 331, column: 12, scope: !16)
!406 = !{!"0x100\00outc\00334\000", !16, !13, !407} ; [ DW_TAG_auto_variable ] [outc] [line 334]
!407 = !{!"0x1\00\000\002048\008\000\000\000", null, null, !10, !116, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 2048, align 8, offset 0] [from char]
!408 = !MDLocation(line: 334, column: 10, scope: !16)
!409 = !MDLocation(line: 337, column: 5, scope: !16)
!410 = !{!"0x100\00optr\00340\000", !16, !13, !24} ; [ DW_TAG_auto_variable ] [optr] [line 340]
!411 = !MDLocation(line: 340, column: 12, scope: !16)
!412 = !MDLocation(line: 340, column: 19, scope: !16)
!413 = !MDLocation(line: 342, column: 10, scope: !414)
!414 = !{!"0xb\00342\005\0041", !1, !16}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!415 = !MDLocation(line: 342, column: 17, scope: !416)
!416 = !{!"0xb\002", !1, !417}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!417 = !{!"0xb\001", !1, !418}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!418 = !{!"0xb\00342\005\0042", !1, !414}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!419 = !MDLocation(line: 342, column: 5, scope: !414)
!420 = !MDLocation(line: 344, column: 25, scope: !421)
!421 = !{!"0xb\00343\005\0043", !1, !418}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!422 = !MDLocation(line: 344, column: 19, scope: !421)
!423 = !MDLocation(line: 344, column: 11, scope: !421)
!424 = !MDLocation(line: 344, column: 9, scope: !421)
!425 = !MDLocation(line: 345, column: 9, scope: !421)
!426 = !MDLocation(line: 348, column: 18, scope: !427)
!427 = !{!"0xb\00348\0013\0044", !1, !421}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!428 = !MDLocation(line: 348, column: 13, scope: !427)
!429 = !MDLocation(line: 348, column: 28, scope: !427)
!430 = !MDLocation(line: 348, column: 23, scope: !427)
!431 = !MDLocation(line: 348, column: 13, scope: !421)
!432 = !MDLocation(line: 351, column: 13, scope: !433)
!433 = !{!"0xb\00349\009\0045", !1, !427}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!434 = !MDLocation(line: 352, column: 31, scope: !433)
!435 = !MDLocation(line: 352, column: 26, scope: !433)
!436 = !MDLocation(line: 352, column: 20, scope: !433)
!437 = !MDLocation(line: 352, column: 13, scope: !433)
!438 = !MDLocation(line: 356, column: 18, scope: !439)
!439 = !{!"0xb\00356\0013\0046", !1, !433}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!440 = !MDLocation(line: 356, column: 25, scope: !441)
!441 = !{!"0xb\002", !1, !442}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!442 = !{!"0xb\001", !1, !443}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!443 = !{!"0xb\00356\0013\0047", !1, !439}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!444 = !MDLocation(line: 356, column: 34, scope: !443)
!445 = !MDLocation(line: 356, column: 29, scope: !443)
!446 = !MDLocation(line: 356, column: 25, scope: !443)
!447 = !MDLocation(line: 356, column: 13, scope: !439)
!448 = !MDLocation(line: 358, column: 21, scope: !449)
!449 = !{!"0xb\00357\0013\0048", !1, !443}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!450 = !MDLocation(line: 358, column: 17, scope: !449)
!451 = !MDLocation(line: 360, column: 26, scope: !452)
!452 = !{!"0xb\00360\0021\0049", !1, !449}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!453 = !MDLocation(line: 360, column: 21, scope: !452)
!454 = !MDLocation(line: 360, column: 31, scope: !452)
!455 = !MDLocation(line: 360, column: 21, scope: !449)
!456 = !MDLocation(line: 361, column: 21, scope: !452)
!457 = !MDLocation(line: 363, column: 17, scope: !449)
!458 = !MDLocation(line: 364, column: 13, scope: !449)
!459 = !MDLocation(line: 356, column: 38, scope: !443)
!460 = !MDLocation(line: 356, column: 13, scope: !443)
!461 = !MDLocation(line: 366, column: 24, scope: !433)
!462 = !MDLocation(line: 366, column: 19, scope: !433)
!463 = !MDLocation(line: 366, column: 13, scope: !433)
!464 = !MDLocation(line: 367, column: 9, scope: !433)
!465 = !MDLocation(line: 368, column: 5, scope: !421)
!466 = !MDLocation(line: 342, column: 26, scope: !418)
!467 = !MDLocation(line: 342, column: 5, scope: !418)
!468 = !MDLocation(line: 371, column: 10, scope: !469)
!469 = !{!"0xb\00371\005\0050", !1, !16}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!470 = !MDLocation(line: 371, column: 17, scope: !471)
!471 = !{!"0xb\002", !1, !472}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!472 = !{!"0xb\001", !1, !473}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!473 = !{!"0xb\00371\005\0051", !1, !469}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!474 = !MDLocation(line: 371, column: 5, scope: !469)
!475 = !MDLocation(line: 373, column: 19, scope: !476)
!476 = !{!"0xb\00372\005\0052", !1, !473}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!477 = !MDLocation(line: 373, column: 13, scope: !476)
!478 = !MDLocation(line: 373, column: 9, scope: !476)
!479 = !MDLocation(line: 374, column: 18, scope: !476)
!480 = !MDLocation(line: 374, column: 13, scope: !476)
!481 = !MDLocation(line: 374, column: 9, scope: !476)
!482 = !MDLocation(line: 375, column: 13, scope: !476)
!483 = !MDLocation(line: 375, column: 9, scope: !476)
!484 = !MDLocation(line: 377, column: 9, scope: !476)
!485 = !MDLocation(line: 377, column: 17, scope: !486)
!486 = !{!"0xb\004", !1, !487}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!487 = !{!"0xb\001", !1, !476}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!488 = !MDLocation(line: 377, column: 16, scope: !476)
!489 = !MDLocation(line: 377, column: 30, scope: !490)
!490 = !{!"0xb\002", !1, !476}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!491 = !MDLocation(line: 377, column: 24, scope: !476)
!492 = !MDLocation(line: 377, column: 37, scope: !476)
!493 = !MDLocation(line: 377, column: 9, scope: !494)
!494 = !{!"0xb\003", !1, !476}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!495 = !MDLocation(line: 379, column: 30, scope: !496)
!496 = !{!"0xb\00378\009\0053", !1, !476}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!497 = !MDLocation(line: 379, column: 24, scope: !496)
!498 = !MDLocation(line: 379, column: 19, scope: !496)
!499 = !MDLocation(line: 379, column: 13, scope: !496)
!500 = !MDLocation(line: 380, column: 28, scope: !496)
!501 = !MDLocation(line: 380, column: 23, scope: !496)
!502 = !MDLocation(line: 380, column: 18, scope: !496)
!503 = !MDLocation(line: 380, column: 13, scope: !496)
!504 = !MDLocation(line: 381, column: 13, scope: !496)
!505 = !MDLocation(line: 384, column: 20, scope: !476)
!506 = !MDLocation(line: 384, column: 15, scope: !476)
!507 = !MDLocation(line: 384, column: 9, scope: !476)
!508 = !MDLocation(line: 385, column: 19, scope: !476)
!509 = !MDLocation(line: 385, column: 14, scope: !476)
!510 = !MDLocation(line: 385, column: 9, scope: !476)
!511 = !MDLocation(line: 386, column: 5, scope: !476)
!512 = !MDLocation(line: 371, column: 26, scope: !473)
!513 = !MDLocation(line: 371, column: 5, scope: !473)
!514 = !MDLocation(line: 389, column: 10, scope: !515)
!515 = !{!"0xb\00389\005\0054", !1, !16}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!516 = !MDLocation(line: 389, column: 23, scope: !517)
!517 = !{!"0xb\004", !1, !518}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!518 = !{!"0xb\001", !1, !519}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!519 = !{!"0xb\00389\005\0055", !1, !515}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!520 = !MDLocation(line: 389, column: 17, scope: !519)
!521 = !MDLocation(line: 389, column: 5, scope: !515)
!522 = !MDLocation(line: 389, column: 5, scope: !523)
!523 = !{!"0xb\002", !1, !515}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!524 = !MDLocation(line: 389, column: 32, scope: !525)
!525 = !{!"0xb\003", !1, !519}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!526 = !MDLocation(line: 389, column: 5, scope: !519)
!527 = !MDLocation(line: 392, column: 5, scope: !16)
!528 = !MDLocation(line: 393, column: 12, scope: !16)
!529 = !MDLocation(line: 393, column: 5, scope: !16)
!530 = !MDLocation(line: 394, column: 5, scope: !16)
!531 = !MDLocation(line: 395, column: 5, scope: !16)
!532 = !MDLocation(line: 396, column: 12, scope: !16)
!533 = !MDLocation(line: 396, column: 5, scope: !16)
!534 = !MDLocation(line: 397, column: 12, scope: !16)
!535 = !MDLocation(line: 397, column: 5, scope: !16)
!536 = !MDLocation(line: 399, column: 5, scope: !16)
!537 = !MDLocation(line: 399, column: 12, scope: !196)
!538 = !MDLocation(line: 399, column: 16, scope: !16)
!539 = !MDLocation(line: 399, column: 12, scope: !16)
!540 = !MDLocation(line: 401, column: 13, scope: !541)
!541 = !{!"0xb\00400\005\0056", !1, !16}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!542 = !MDLocation(line: 401, column: 9, scope: !541)
!543 = !MDLocation(line: 403, column: 15, scope: !544)
!544 = !{!"0xb\00403\0013\0057", !1, !541}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!545 = !MDLocation(line: 403, column: 14, scope: !544)
!546 = !MDLocation(line: 403, column: 13, scope: !544)
!547 = !MDLocation(line: 403, column: 23, scope: !544)
!548 = !MDLocation(line: 403, column: 13, scope: !541)
!549 = !MDLocation(line: 404, column: 13, scope: !544)
!550 = !MDLocation(line: 407, column: 9, scope: !541)
!551 = !MDLocation(line: 407, column: 22, scope: !552)
!552 = !{!"0xb\002", !1, !553}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!553 = !{!"0xb\001", !1, !541}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!554 = !MDLocation(line: 407, column: 16, scope: !541)
!555 = !MDLocation(line: 407, column: 27, scope: !541)
!556 = !MDLocation(line: 408, column: 13, scope: !541)
!557 = !MDLocation(line: 411, column: 13, scope: !558)
!558 = !{!"0xb\00411\0013\0058", !1, !541}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!559 = !MDLocation(line: 411, column: 24, scope: !558)
!560 = !MDLocation(line: 411, column: 18, scope: !558)
!561 = !MDLocation(line: 411, column: 13, scope: !541)
!562 = !MDLocation(line: 413, column: 28, scope: !563)
!563 = !{!"0xb\00412\009\0059", !1, !558}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!564 = !MDLocation(line: 413, column: 23, scope: !563)
!565 = !MDLocation(line: 413, column: 15, scope: !563)
!566 = !MDLocation(line: 413, column: 13, scope: !563)
!567 = !MDLocation(line: 414, column: 13, scope: !563)
!568 = !MDLocation(line: 415, column: 13, scope: !563)
!569 = !MDLocation(line: 416, column: 13, scope: !563)
!570 = !MDLocation(line: 417, column: 17, scope: !563)
!571 = !MDLocation(line: 417, column: 13, scope: !563)
!572 = !MDLocation(line: 418, column: 9, scope: !563)
!573 = !MDLocation(line: 421, column: 13, scope: !574)
!574 = !{!"0xb\00421\0013\0060", !1, !541}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!575 = !MDLocation(line: 421, column: 13, scope: !541)
!576 = !MDLocation(line: 422, column: 13, scope: !574)
!577 = !MDLocation(line: 425, column: 13, scope: !578)
!578 = !{!"0xb\00424\009\0061", !1, !574}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!579 = !MDLocation(line: 426, column: 13, scope: !578)
!580 = !MDLocation(line: 431, column: 10, scope: !16)
!581 = !MDLocation(line: 431, column: 5, scope: !16)
!582 = !MDLocation(line: 432, column: 1, scope: !16)
!583 = !{!"0x101\00freq\0016777322\000", !25, !13, !28} ; [ DW_TAG_arg_variable ] [freq] [line 106]
!584 = !MDLocation(line: 106, column: 34, scope: !25)
!585 = !{!"0x101\00heap\0033554538\000", !25, !13, !28} ; [ DW_TAG_arg_variable ] [heap] [line 106]
!586 = !MDLocation(line: 106, column: 49, scope: !25)
!587 = !{!"0x101\00n\0050331754\000", !25, !13, !22} ; [ DW_TAG_arg_variable ] [n] [line 106]
!588 = !MDLocation(line: 106, column: 59, scope: !25)
!589 = !{!"0x101\00k\0067108970\000", !25, !13, !22} ; [ DW_TAG_arg_variable ] [k] [line 106]
!590 = !MDLocation(line: 106, column: 66, scope: !25)
!591 = !{!"0x100\00j\00112\000", !25, !13, !22}   ; [ DW_TAG_auto_variable ] [j] [line 112]
!592 = !MDLocation(line: 112, column: 9, scope: !25)
!593 = !MDLocation(line: 114, column: 5, scope: !25)
!594 = !{!"0x100\00v\00116\000", !25, !13, !22}   ; [ DW_TAG_auto_variable ] [v] [line 116]
!595 = !MDLocation(line: 116, column: 9, scope: !25)
!596 = !MDLocation(line: 116, column: 18, scope: !25)
!597 = !MDLocation(line: 116, column: 13, scope: !25)
!598 = !MDLocation(line: 118, column: 5, scope: !25)
!599 = !MDLocation(line: 118, column: 12, scope: !600)
!600 = !{!"0xb\002", !1, !601}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!601 = !{!"0xb\001", !1, !25}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!602 = !MDLocation(line: 118, column: 18, scope: !25)
!603 = !MDLocation(line: 118, column: 12, scope: !25)
!604 = !MDLocation(line: 120, column: 13, scope: !605)
!605 = !{!"0xb\00119\005\0072", !1, !25}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!606 = !MDLocation(line: 120, column: 17, scope: !605)
!607 = !MDLocation(line: 120, column: 9, scope: !605)
!608 = !MDLocation(line: 122, column: 14, scope: !609)
!609 = !{!"0xb\00122\0013\0073", !1, !605}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!610 = !MDLocation(line: 122, column: 18, scope: !609)
!611 = !MDLocation(line: 122, column: 13, scope: !605)
!612 = !MDLocation(line: 122, column: 35, scope: !613)
!613 = !{!"0xb\001", !1, !609}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!614 = !MDLocation(line: 122, column: 30, scope: !609)
!615 = !MDLocation(line: 122, column: 25, scope: !609)
!616 = !MDLocation(line: 122, column: 51, scope: !609)
!617 = !MDLocation(line: 122, column: 46, scope: !609)
!618 = !MDLocation(line: 122, column: 41, scope: !609)
!619 = !MDLocation(line: 123, column: 13, scope: !609)
!620 = !MDLocation(line: 125, column: 18, scope: !621)
!621 = !{!"0xb\00125\0013\0074", !1, !605}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!622 = !MDLocation(line: 125, column: 13, scope: !621)
!623 = !MDLocation(line: 125, column: 33, scope: !621)
!624 = !MDLocation(line: 125, column: 28, scope: !621)
!625 = !MDLocation(line: 125, column: 23, scope: !621)
!626 = !MDLocation(line: 125, column: 13, scope: !605)
!627 = !MDLocation(line: 126, column: 13, scope: !621)
!628 = !MDLocation(line: 128, column: 24, scope: !605)
!629 = !MDLocation(line: 128, column: 19, scope: !605)
!630 = !MDLocation(line: 128, column: 14, scope: !605)
!631 = !MDLocation(line: 128, column: 9, scope: !605)
!632 = !MDLocation(line: 129, column: 13, scope: !605)
!633 = !MDLocation(line: 129, column: 9, scope: !605)
!634 = !MDLocation(line: 132, column: 15, scope: !25)
!635 = !MDLocation(line: 132, column: 10, scope: !25)
!636 = !MDLocation(line: 132, column: 5, scope: !25)
!637 = !MDLocation(line: 133, column: 1, scope: !25)
!638 = !{!"0x101\00argc\0016777650\000", !19, !13, !22} ; [ DW_TAG_arg_variable ] [argc] [line 434]
!639 = !MDLocation(line: 434, column: 14, scope: !19)
!640 = !{!"0x101\00argv\0033554866\000", !19, !13, !23} ; [ DW_TAG_arg_variable ] [argv] [line 434]
!641 = !MDLocation(line: 434, column: 28, scope: !19)
!642 = !{!"0x100\00i\00436\000", !19, !13, !22}   ; [ DW_TAG_auto_variable ] [i] [line 436]
!643 = !MDLocation(line: 436, column: 9, scope: !19)
!644 = !{!"0x100\00ga_testing\00439\000", !19, !13, !645} ; [ DW_TAG_auto_variable ] [ga_testing] [line 439]
!645 = !{!"0x24\00_Bool\000\008\008\000\000\002", null, null} ; [ DW_TAG_base_type ] [_Bool] [line 0, size 8, align 8, offset 0, enc DW_ATE_boolean]
!646 = !MDLocation(line: 439, column: 10, scope: !19)
!647 = !MDLocation(line: 441, column: 9, scope: !648)
!648 = !{!"0xb\00441\009\0062", !1, !19}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!649 = !MDLocation(line: 441, column: 9, scope: !19)
!650 = !MDLocation(line: 443, column: 14, scope: !651)
!651 = !{!"0xb\00443\009\0064", !1, !652}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!652 = !{!"0xb\00442\005\0063", !1, !648}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!653 = !MDLocation(line: 443, column: 21, scope: !654)
!654 = !{!"0xb\002", !1, !655}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!655 = !{!"0xb\001", !1, !656}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!656 = !{!"0xb\00443\009\0065", !1, !651}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!657 = !MDLocation(line: 443, column: 25, scope: !656)
!658 = !MDLocation(line: 443, column: 21, scope: !656)
!659 = !MDLocation(line: 443, column: 9, scope: !651)
!660 = !MDLocation(line: 445, column: 25, scope: !661)
!661 = !{!"0xb\00445\0017\0067", !1, !662}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!662 = !{!"0xb\00444\009\0066", !1, !656}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!663 = !MDLocation(line: 445, column: 18, scope: !661)
!664 = !MDLocation(line: 445, column: 17, scope: !662)
!665 = !MDLocation(line: 447, column: 17, scope: !666)
!666 = !{!"0xb\00446\0013\0068", !1, !661}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!667 = !MDLocation(line: 448, column: 17, scope: !666)
!668 = !MDLocation(line: 450, column: 9, scope: !662)
!669 = !MDLocation(line: 443, column: 31, scope: !656)
!670 = !MDLocation(line: 443, column: 9, scope: !656)
!671 = !MDLocation(line: 451, column: 5, scope: !652)
!672 = !{!"0x100\00test_data\00454\000", !19, !13, !4} ; [ DW_TAG_auto_variable ] [test_data] [line 454]
!673 = !MDLocation(line: 454, column: 12, scope: !19)
!674 = !MDLocation(line: 454, column: 24, scope: !19)
!675 = !MDLocation(line: 467, column: 10, scope: !676)
!676 = !{!"0xb\00467\005\0069", !1, !19}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!677 = !MDLocation(line: 467, column: 17, scope: !678)
!678 = !{!"0xb\002", !1, !679}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!679 = !{!"0xb\001", !1, !680}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!680 = !{!"0xb\00467\005\0070", !1, !676}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!681 = !MDLocation(line: 467, column: 5, scope: !676)
!682 = !MDLocation(line: 468, column: 20, scope: !680)
!683 = !MDLocation(line: 468, column: 9, scope: !680)
!684 = !MDLocation(line: 467, column: 32, scope: !680)
!685 = !MDLocation(line: 467, column: 5, scope: !680)
!686 = !{!"0x100\00run_time\00472\000", !19, !13, !687} ; [ DW_TAG_auto_variable ] [run_time] [line 472]
!687 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!688 = !MDLocation(line: 472, column: 12, scope: !19)
!689 = !MDLocation(line: 481, column: 10, scope: !19)
!690 = !MDLocation(line: 481, column: 5, scope: !19)
!691 = !MDLocation(line: 484, column: 9, scope: !692)
!692 = !{!"0xb\00484\009\0071", !1, !19}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!693 = !MDLocation(line: 484, column: 9, scope: !19)
!694 = !MDLocation(line: 485, column: 17, scope: !692)
!695 = !MDLocation(line: 485, column: 29, scope: !692)
!696 = !MDLocation(line: 485, column: 9, scope: !692)
!697 = !MDLocation(line: 487, column: 17, scope: !692)
!698 = !MDLocation(line: 487, column: 64, scope: !692)
!699 = !MDLocation(line: 487, column: 9, scope: !692)
!700 = !MDLocation(line: 489, column: 12, scope: !19)
!701 = !MDLocation(line: 489, column: 5, scope: !19)
!702 = !MDLocation(line: 492, column: 5, scope: !19)
!703 = !{!"0x100\00k\0049\000", !29, !13, !38}    ; [ DW_TAG_auto_variable ] [k] [line 49]
!704 = !MDLocation(line: 49, column: 10, scope: !29)
!705 = !{!"0x100\00result\0050\000", !29, !13, !7} ; [ DW_TAG_auto_variable ] [result] [line 50]
!706 = !MDLocation(line: 50, column: 12, scope: !29)
!707 = !MDLocation(line: 52, column: 5, scope: !29)
!708 = !MDLocation(line: 53, column: 9, scope: !29)
!709 = !MDLocation(line: 53, column: 5, scope: !29)
!710 = !MDLocation(line: 54, column: 18, scope: !29)
!711 = !MDLocation(line: 54, column: 25, scope: !29)
!712 = !MDLocation(line: 54, column: 12, scope: !29)
!713 = !MDLocation(line: 54, column: 40, scope: !29)
!714 = !MDLocation(line: 54, column: 35, scope: !29)
!715 = !MDLocation(line: 54, column: 5, scope: !29)
!716 = !MDLocation(line: 56, column: 9, scope: !717)
!717 = !{!"0xb\0056\009\0075", !1, !29}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!718 = !MDLocation(line: 56, column: 9, scope: !29)
!719 = !MDLocation(line: 57, column: 9, scope: !717)
!720 = !MDLocation(line: 59, column: 23, scope: !29)
!721 = !MDLocation(line: 59, column: 5, scope: !29)
!722 = !MDLocation(line: 60, column: 5, scope: !29)
!723 = !MDLocation(line: 62, column: 12, scope: !29)
!724 = !MDLocation(line: 62, column: 5, scope: !29)
