; ModuleID = 'puzzle.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@next = internal global i64 1, align 8
@.str = private unnamed_addr constant [21 x i8] c"Found duplicate: %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @rand() #0 {
entry:
  %0 = load i64* @next, align 8, !dbg !34
  %mul = mul i64 %0, 1103515245, !dbg !34
  %add = add i64 %mul, 12345, !dbg !34
  store i64 %add, i64* @next, align 8, !dbg !35
  %1 = load i64* @next, align 8, !dbg !36
  %div = udiv i64 %1, 65536, !dbg !36
  %conv = trunc i64 %div to i32, !dbg !37
  %rem = urem i32 %conv, 32767, !dbg !37
  %add1 = add i32 %rem, 1, !dbg !37
  ret i32 %add1, !dbg !38
}

; Function Attrs: nounwind uwtable
define void @srand(i32 %seed) #0 {
entry:
  %seed.addr = alloca i32, align 4
  store i32 %seed, i32* %seed.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %seed.addr, metadata !39, metadata !40), !dbg !41
  %0 = load i32* %seed.addr, align 4, !dbg !42
  %conv = zext i32 %0 to i64, !dbg !42
  store i64 %conv, i64* @next, align 8, !dbg !43
  ret void, !dbg !44
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i32 @randInt(i32 %min, i32 %max) #0 {
entry:
  %min.addr = alloca i32, align 4
  %max.addr = alloca i32, align 4
  %k = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 %min, i32* %min.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %min.addr, metadata !45, metadata !40), !dbg !46
  store i32 %max, i32* %max.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %max.addr, metadata !47, metadata !40), !dbg !48
  call void @llvm.dbg.declare(metadata i32* %k, metadata !49, metadata !40), !dbg !50
  call void @llvm.dbg.declare(metadata i32* %n, metadata !51, metadata !40), !dbg !52
  %0 = load i32* %max.addr, align 4, !dbg !53
  %1 = load i32* %min.addr, align 4, !dbg !54
  %sub = sub nsw i32 %0, %1, !dbg !53
  %add = add nsw i32 %sub, 1, !dbg !55
  store i32 %add, i32* %n, align 4, !dbg !56
  %2 = load i32* %n, align 4, !dbg !57
  %conv = sitofp i32 %2 to double, !dbg !57
  %call = call i32 @rand() #4, !dbg !58
  %conv1 = sitofp i32 %call to double, !dbg !58
  %div = fdiv double %conv1, 3.276800e+04, !dbg !58
  %mul = fmul double %conv, %div, !dbg !57
  %conv2 = fptosi double %mul to i32, !dbg !59
  store i32 %conv2, i32* %k, align 4, !dbg !60
  %3 = load i32* %k, align 4, !dbg !61
  %4 = load i32* %n, align 4, !dbg !62
  %cmp = icmp eq i32 %3, %4, !dbg !61
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !63

cond.true:                                        ; preds = %entry
  %5 = load i32* %k, align 4, !dbg !64
  %6 = load i32* %min.addr, align 4, !dbg !66
  %add4 = add nsw i32 %5, %6, !dbg !67
  %sub5 = sub nsw i32 %add4, 1, !dbg !67
  br label %cond.end, !dbg !63

cond.false:                                       ; preds = %entry
  %7 = load i32* %k, align 4, !dbg !68
  %8 = load i32* %min.addr, align 4, !dbg !70
  %add6 = add nsw i32 %7, %8, !dbg !71
  br label %cond.end, !dbg !63

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %sub5, %cond.true ], [ %add6, %cond.false ], !dbg !63
  ret i32 %cond, !dbg !72
}

; Function Attrs: nounwind uwtable
define void @shuffle(i32* %items, i32 %len) #0 {
entry:
  %items.addr = alloca i32*, align 8
  %len.addr = alloca i32, align 4
  %j = alloca i64, align 8
  %k = alloca i64, align 8
  %i = alloca i64, align 8
  %aux = alloca i32, align 4
  store i32* %items, i32** %items.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %items.addr, metadata !75, metadata !40), !dbg !76
  store i32 %len, i32* %len.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %len.addr, metadata !77, metadata !40), !dbg !78
  call void @llvm.dbg.declare(metadata i64* %j, metadata !79, metadata !40), !dbg !83
  call void @llvm.dbg.declare(metadata i64* %k, metadata !84, metadata !40), !dbg !85
  call void @llvm.dbg.declare(metadata i64* %i, metadata !86, metadata !40), !dbg !87
  call void @llvm.dbg.declare(metadata i32* %aux, metadata !88, metadata !40), !dbg !89
  %0 = load i32* %len.addr, align 4, !dbg !90
  %sub = sub nsw i32 %0, 1, !dbg !90
  %conv = sext i32 %sub to i64, !dbg !90
  store i64 %conv, i64* %i, align 8, !dbg !92
  br label %for.cond, !dbg !92

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64* %i, align 8, !dbg !93
  %cmp = icmp ugt i64 %1, 0, !dbg !93
  br i1 %cmp, label %for.body, label %for.end, !dbg !97

for.body:                                         ; preds = %for.cond
  %2 = load i64* %i, align 8, !dbg !98
  %add = add i64 %2, 1, !dbg !98
  %conv2 = uitofp i64 %add to double, !dbg !100
  %call = call i32 @rand() #4, !dbg !101
  %conv3 = sitofp i32 %call to double, !dbg !101
  %div = fdiv double %conv3, 3.276800e+04, !dbg !101
  %mul = fmul double %conv2, %div, !dbg !100
  %conv4 = fptosi double %mul to i32, !dbg !102
  %conv5 = sext i32 %conv4 to i64, !dbg !102
  store i64 %conv5, i64* %k, align 8, !dbg !103
  %3 = load i64* %k, align 8, !dbg !104
  %4 = load i64* %i, align 8, !dbg !105
  %add6 = add i64 %4, 1, !dbg !105
  %cmp7 = icmp eq i64 %3, %add6, !dbg !104
  br i1 %cmp7, label %cond.true, label %cond.false, !dbg !106

cond.true:                                        ; preds = %for.body
  %5 = load i64* %k, align 8, !dbg !107
  %sub9 = sub i64 %5, 1, !dbg !107
  br label %cond.end, !dbg !106

cond.false:                                       ; preds = %for.body
  %6 = load i64* %k, align 8, !dbg !109
  br label %cond.end, !dbg !106

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %sub9, %cond.true ], [ %6, %cond.false ], !dbg !106
  store i64 %cond, i64* %j, align 8, !dbg !111
  %7 = load i64* %i, align 8, !dbg !114
  %8 = load i32** %items.addr, align 8, !dbg !115
  %arrayidx = getelementptr inbounds i32* %8, i64 %7, !dbg !115
  %9 = load i32* %arrayidx, align 4, !dbg !115
  store i32 %9, i32* %aux, align 4, !dbg !116
  %10 = load i64* %j, align 8, !dbg !117
  %11 = load i32** %items.addr, align 8, !dbg !118
  %arrayidx10 = getelementptr inbounds i32* %11, i64 %10, !dbg !118
  %12 = load i32* %arrayidx10, align 4, !dbg !118
  %13 = load i64* %i, align 8, !dbg !119
  %14 = load i32** %items.addr, align 8, !dbg !120
  %arrayidx11 = getelementptr inbounds i32* %14, i64 %13, !dbg !120
  store i32 %12, i32* %arrayidx11, align 4, !dbg !120
  %15 = load i32* %aux, align 4, !dbg !121
  %16 = load i64* %j, align 8, !dbg !122
  %17 = load i32** %items.addr, align 8, !dbg !123
  %arrayidx12 = getelementptr inbounds i32* %17, i64 %16, !dbg !123
  store i32 %15, i32* %arrayidx12, align 4, !dbg !123
  br label %for.inc, !dbg !124

for.inc:                                          ; preds = %cond.end
  %18 = load i64* %i, align 8, !dbg !125
  %dec = add i64 %18, -1, !dbg !125
  store i64 %dec, i64* %i, align 8, !dbg !125
  br label %for.cond, !dbg !126

for.end:                                          ; preds = %for.cond
  ret void, !dbg !127
}

; Function Attrs: nounwind uwtable
define i32* @createRandomArray(i32 %size) #0 {
entry:
  %size.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %len = alloca i32, align 4
  %result = alloca i32*, align 8
  store i32 %size, i32* %size.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %size.addr, metadata !128, metadata !40), !dbg !129
  call void @llvm.dbg.declare(metadata i32* %i, metadata !130, metadata !40), !dbg !131
  call void @llvm.dbg.declare(metadata i32* %len, metadata !132, metadata !40), !dbg !133
  call void @llvm.dbg.declare(metadata i32** %result, metadata !134, metadata !40), !dbg !135
  %0 = load i32* %size.addr, align 4, !dbg !136
  %add = add nsw i32 %0, 1, !dbg !136
  store i32 %add, i32* %len, align 4, !dbg !137
  %1 = load i32* %len, align 4, !dbg !138
  %conv = sext i32 %1 to i64, !dbg !138
  %mul = mul i64 %conv, 4, !dbg !138
  %call = call noalias i8* @malloc(i64 %mul) #4, !dbg !139
  %2 = bitcast i8* %call to i32*, !dbg !140
  store i32* %2, i32** %result, align 8, !dbg !141
  store i32 0, i32* %i, align 4, !dbg !142
  br label %for.cond, !dbg !142

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i32* %i, align 4, !dbg !144
  %4 = load i32* %len, align 4, !dbg !148
  %cmp = icmp slt i32 %3, %4, !dbg !149
  br i1 %cmp, label %for.body, label %for.end, !dbg !150

for.body:                                         ; preds = %for.cond
  %5 = load i32* %i, align 4, !dbg !151
  %6 = load i32* %i, align 4, !dbg !152
  %idxprom = sext i32 %6 to i64, !dbg !153
  %7 = load i32** %result, align 8, !dbg !153
  %arrayidx = getelementptr inbounds i32* %7, i64 %idxprom, !dbg !153
  store i32 %5, i32* %arrayidx, align 4, !dbg !153
  br label %for.inc, !dbg !153

for.inc:                                          ; preds = %for.body
  %8 = load i32* %i, align 4, !dbg !154
  %inc = add nsw i32 %8, 1, !dbg !154
  store i32 %inc, i32* %i, align 4, !dbg !154
  br label %for.cond, !dbg !155

for.end:                                          ; preds = %for.cond
  %9 = load i32* %size.addr, align 4, !dbg !156
  %call2 = call i32 @randInt(i32 1, i32 %9), !dbg !157
  %10 = load i32** %result, align 8, !dbg !158
  %arrayidx3 = getelementptr inbounds i32* %10, i64 0, !dbg !158
  store i32 %call2, i32* %arrayidx3, align 4, !dbg !158
  %11 = load i32** %result, align 8, !dbg !159
  %12 = load i32* %len, align 4, !dbg !160
  call void @shuffle(i32* %11, i32 %12), !dbg !161
  %13 = load i32** %result, align 8, !dbg !162
  ret i32* %13, !dbg !163
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind uwtable
define i32 @findDuplicate(i32* %data, i32 %len) #0 {
entry:
  %data.addr = alloca i32*, align 8
  %len.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %result = alloca i32, align 4
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !164, metadata !40), !dbg !165
  store i32 %len, i32* %len.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %len.addr, metadata !166, metadata !40), !dbg !167
  call void @llvm.dbg.declare(metadata i32* %i, metadata !168, metadata !40), !dbg !169
  call void @llvm.dbg.declare(metadata i32* %result, metadata !170, metadata !40), !dbg !171
  store i32 0, i32* %result, align 4, !dbg !171
  store i32 0, i32* %i, align 4, !dbg !172
  br label %for.cond, !dbg !172

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4, !dbg !174
  %1 = load i32* %len.addr, align 4, !dbg !178
  %cmp = icmp slt i32 %0, %1, !dbg !179
  br i1 %cmp, label %for.body, label %for.end, !dbg !180

for.body:                                         ; preds = %for.cond
  %2 = load i32* %result, align 4, !dbg !181
  %3 = load i32* %i, align 4, !dbg !182
  %add = add nsw i32 %3, 1, !dbg !182
  %xor = xor i32 %2, %add, !dbg !181
  %4 = load i32* %i, align 4, !dbg !183
  %idxprom = sext i32 %4 to i64, !dbg !184
  %5 = load i32** %data.addr, align 8, !dbg !184
  %arrayidx = getelementptr inbounds i32* %5, i64 %idxprom, !dbg !184
  %6 = load i32* %arrayidx, align 4, !dbg !184
  %xor1 = xor i32 %xor, %6, !dbg !181
  store i32 %xor1, i32* %result, align 4, !dbg !185
  br label %for.inc, !dbg !185

for.inc:                                          ; preds = %for.body
  %7 = load i32* %i, align 4, !dbg !186
  %inc = add nsw i32 %7, 1, !dbg !186
  store i32 %inc, i32* %i, align 4, !dbg !186
  br label %for.cond, !dbg !187

for.end:                                          ; preds = %for.cond
  %8 = load i32* %len.addr, align 4, !dbg !188
  %9 = load i32* %result, align 4, !dbg !189
  %xor2 = xor i32 %9, %8, !dbg !189
  store i32 %xor2, i32* %result, align 4, !dbg !189
  %10 = load i32* %result, align 4, !dbg !190
  ret i32 %10, !dbg !191
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %duplicate = alloca i32, align 4
  %rndArr = alloca i32*, align 8
  store i32 0, i32* %retval
  call void @llvm.dbg.declare(metadata i32* %i, metadata !192, metadata !40), !dbg !193
  call void @llvm.dbg.declare(metadata i32* %j, metadata !194, metadata !40), !dbg !195
  call void @llvm.dbg.declare(metadata i32* %duplicate, metadata !196, metadata !40), !dbg !197
  call void @llvm.dbg.declare(metadata i32** %rndArr, metadata !198, metadata !40), !dbg !199
  call void @srand(i32 1) #4, !dbg !200
  store i32 0, i32* %i, align 4, !dbg !201
  br label %for.cond, !dbg !201

for.cond:                                         ; preds = %for.inc6, %entry
  %0 = load i32* %i, align 4, !dbg !203
  %cmp = icmp slt i32 %0, 5, !dbg !203
  br i1 %cmp, label %for.body, label %for.end8, !dbg !207

for.body:                                         ; preds = %for.cond
  %call = call i32* @createRandomArray(i32 500000), !dbg !208
  store i32* %call, i32** %rndArr, align 8, !dbg !210
  store i32 0, i32* %j, align 4, !dbg !211
  br label %for.cond1, !dbg !211

for.cond1:                                        ; preds = %for.inc, %for.body
  %1 = load i32* %j, align 4, !dbg !213
  %cmp2 = icmp slt i32 %1, 200, !dbg !213
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !217

for.body3:                                        ; preds = %for.cond1
  %2 = load i32** %rndArr, align 8, !dbg !218
  %call4 = call i32 @findDuplicate(i32* %2, i32 500001), !dbg !219
  store i32 %call4, i32* %duplicate, align 4, !dbg !220
  br label %for.inc, !dbg !220

for.inc:                                          ; preds = %for.body3
  %3 = load i32* %j, align 4, !dbg !221
  %inc = add nsw i32 %3, 1, !dbg !221
  store i32 %inc, i32* %j, align 4, !dbg !221
  br label %for.cond1, !dbg !222

for.end:                                          ; preds = %for.cond1
  %4 = load i32** %rndArr, align 8, !dbg !223
  %5 = bitcast i32* %4 to i8*, !dbg !223
  call void @free(i8* %5) #4, !dbg !224
  %6 = load i32* %duplicate, align 4, !dbg !225
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str, i32 0, i32 0), i32 %6), !dbg !226
  br label %for.inc6, !dbg !227

for.inc6:                                         ; preds = %for.end
  %7 = load i32* %i, align 4, !dbg !228
  %inc7 = add nsw i32 %7, 1, !dbg !228
  store i32 %inc7, i32* %i, align 4, !dbg !228
  br label %for.cond, !dbg !229

for.end8:                                         ; preds = %for.cond
  ret i32 0, !dbg !230
}

; Function Attrs: nounwind
declare void @free(i8*) #2

declare i32 @printf(i8*, ...) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!31, !32}
!llvm.ident = !{!33}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\000\00\000\00\001", !1, !2, !3, !7, !28, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c] [DW_LANG_C99]
!1 = !{!"puzzle.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4, !5, !6}
!4 = !{!"0x24\00unsigned int\000\0032\0032\000\000\007", null, null} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!5 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!6 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!7 = !{!8, !12, !15, !18, !21, !24, !27}
!8 = !{!"0x2e\00rand\00rand\00\0015\000\001\000\000\00256\000\0015", !1, !9, !10, null, i32 ()* @rand, null, null, !2} ; [ DW_TAG_subprogram ] [line 15] [def] [rand]
!9 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!10 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !11, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = !{!5}
!12 = !{!"0x2e\00srand\00srand\00\0020\000\001\000\000\00256\000\0020", !1, !9, !13, null, void (i32)* @srand, null, null, !2} ; [ DW_TAG_subprogram ] [line 20] [def] [srand]
!13 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !14, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = !{null, !4}
!15 = !{!"0x2e\00randInt\00randInt\00\0025\000\001\000\000\00256\000\0025", !1, !9, !16, null, i32 (i32, i32)* @randInt, null, null, !2} ; [ DW_TAG_subprogram ] [line 25] [def] [randInt]
!16 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !17, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!17 = !{!5, !5, !5}
!18 = !{!"0x2e\00shuffle\00shuffle\00\0032\000\001\000\000\00256\000\0032", !1, !9, !19, null, void (i32*, i32)* @shuffle, null, null, !2} ; [ DW_TAG_subprogram ] [line 32] [def] [shuffle]
!19 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !20, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!20 = !{null, !6, !5}
!21 = !{!"0x2e\00createRandomArray\00createRandomArray\00\0046\000\001\000\000\00256\000\0046", !1, !9, !22, null, i32* (i32)* @createRandomArray, null, null, !2} ; [ DW_TAG_subprogram ] [line 46] [def] [createRandomArray]
!22 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !23, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!23 = !{!6, !5}
!24 = !{!"0x2e\00findDuplicate\00findDuplicate\00\0059\000\001\000\000\00256\000\0059", !1, !9, !25, null, i32 (i32*, i32)* @findDuplicate, null, null, !2} ; [ DW_TAG_subprogram ] [line 59] [def] [findDuplicate]
!25 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !26, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!26 = !{!5, !6, !5}
!27 = !{!"0x2e\00main\00main\00\0069\000\001\000\000\000\000\0069", !1, !9, !10, null, i32 ()* @main, null, null, !2} ; [ DW_TAG_subprogram ] [line 69] [def] [main]
!28 = !{!29}
!29 = !{!"0x34\00next\00next\00\0013\001\001", null, !9, !30, i64* @next, null} ; [ DW_TAG_variable ] [next] [line 13] [local] [def]
!30 = !{!"0x24\00long long unsigned int\000\0064\0064\000\000\007", null, null} ; [ DW_TAG_base_type ] [long long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!31 = !{i32 2, !"Dwarf Version", i32 4}
!32 = !{i32 2, !"Debug Info Version", i32 2}
!33 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!34 = !MDLocation(line: 16, column: 12, scope: !8)
!35 = !MDLocation(line: 16, column: 5, scope: !8)
!36 = !MDLocation(line: 17, column: 27, scope: !8)
!37 = !MDLocation(line: 17, column: 12, scope: !8)
!38 = !MDLocation(line: 17, column: 5, scope: !8)
!39 = !{!"0x101\00seed\0016777236\000", !12, !9, !4} ; [ DW_TAG_arg_variable ] [seed] [line 20]
!40 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!41 = !MDLocation(line: 20, column: 26, scope: !12)
!42 = !MDLocation(line: 21, column: 12, scope: !12)
!43 = !MDLocation(line: 21, column: 5, scope: !12)
!44 = !MDLocation(line: 22, column: 1, scope: !12)
!45 = !{!"0x101\00min\0016777241\000", !15, !9, !5} ; [ DW_TAG_arg_variable ] [min] [line 25]
!46 = !MDLocation(line: 25, column: 17, scope: !15)
!47 = !{!"0x101\00max\0033554457\000", !15, !9, !5} ; [ DW_TAG_arg_variable ] [max] [line 25]
!48 = !MDLocation(line: 25, column: 26, scope: !15)
!49 = !{!"0x100\00k\0026\000", !15, !9, !5}       ; [ DW_TAG_auto_variable ] [k] [line 26]
!50 = !MDLocation(line: 26, column: 9, scope: !15)
!51 = !{!"0x100\00n\0026\000", !15, !9, !5}       ; [ DW_TAG_auto_variable ] [n] [line 26]
!52 = !MDLocation(line: 26, column: 12, scope: !15)
!53 = !MDLocation(line: 27, column: 10, scope: !15)
!54 = !MDLocation(line: 27, column: 16, scope: !15)
!55 = !MDLocation(line: 27, column: 9, scope: !15)
!56 = !MDLocation(line: 27, column: 5, scope: !15)
!57 = !MDLocation(line: 28, column: 15, scope: !15)
!58 = !MDLocation(line: 28, column: 20, scope: !15)
!59 = !MDLocation(line: 28, column: 9, scope: !15)
!60 = !MDLocation(line: 28, column: 5, scope: !15)
!61 = !MDLocation(line: 29, column: 13, scope: !15)
!62 = !MDLocation(line: 29, column: 18, scope: !15)
!63 = !MDLocation(line: 29, column: 12, scope: !15)
!64 = !MDLocation(line: 29, column: 23, scope: !65)
!65 = !{!"0xb\001", !1, !15}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!66 = !MDLocation(line: 29, column: 27, scope: !15)
!67 = !MDLocation(line: 29, column: 23, scope: !15)
!68 = !MDLocation(line: 29, column: 37, scope: !69)
!69 = !{!"0xb\002", !1, !15}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!70 = !MDLocation(line: 29, column: 41, scope: !15)
!71 = !MDLocation(line: 29, column: 37, scope: !15)
!72 = !MDLocation(line: 29, column: 5, scope: !73)
!73 = !{!"0xb\004", !1, !74}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!74 = !{!"0xb\003", !1, !15}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!75 = !{!"0x101\00items\0016777248\000", !18, !9, !6} ; [ DW_TAG_arg_variable ] [items] [line 32]
!76 = !MDLocation(line: 32, column: 19, scope: !18)
!77 = !{!"0x101\00len\0033554464\000", !18, !9, !5} ; [ DW_TAG_arg_variable ] [len] [line 32]
!78 = !MDLocation(line: 32, column: 30, scope: !18)
!79 = !{!"0x100\00j\0033\000", !18, !9, !80}      ; [ DW_TAG_auto_variable ] [j] [line 33]
!80 = !{!"0x16\00size_t\0062\000\000\000\000", !81, null, !82} ; [ DW_TAG_typedef ] [size_t] [line 62, size 0, align 0, offset 0] [from long unsigned int]
!81 = !{!"/usr/local/bin/../lib/clang/3.6.0/include/stddef.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!82 = !{!"0x24\00long unsigned int\000\0064\0064\000\000\007", null, null} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!83 = !MDLocation(line: 33, column: 12, scope: !18)
!84 = !{!"0x100\00k\0033\000", !18, !9, !80}      ; [ DW_TAG_auto_variable ] [k] [line 33]
!85 = !MDLocation(line: 33, column: 15, scope: !18)
!86 = !{!"0x100\00i\0033\000", !18, !9, !80}      ; [ DW_TAG_auto_variable ] [i] [line 33]
!87 = !MDLocation(line: 33, column: 18, scope: !18)
!88 = !{!"0x100\00aux\0034\000", !18, !9, !5}     ; [ DW_TAG_auto_variable ] [aux] [line 34]
!89 = !MDLocation(line: 34, column: 9, scope: !18)
!90 = !MDLocation(line: 36, column: 13, scope: !91)
!91 = !{!"0xb\0036\005\000", !1, !18}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!92 = !MDLocation(line: 36, column: 9, scope: !91)
!93 = !MDLocation(line: 36, column: 20, scope: !94)
!94 = !{!"0xb\002", !1, !95}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!95 = !{!"0xb\001", !1, !96}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!96 = !{!"0xb\0036\005\001", !1, !91}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!97 = !MDLocation(line: 36, column: 5, scope: !91)
!98 = !MDLocation(line: 37, column: 20, scope: !99)
!99 = !{!"0xb\0036\0032\002", !1, !96}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!100 = !MDLocation(line: 37, column: 19, scope: !99)
!101 = !MDLocation(line: 37, column: 30, scope: !99)
!102 = !MDLocation(line: 37, column: 13, scope: !99)
!103 = !MDLocation(line: 37, column: 9, scope: !99)
!104 = !MDLocation(line: 38, column: 14, scope: !99)
!105 = !MDLocation(line: 38, column: 20, scope: !99)
!106 = !MDLocation(line: 38, column: 13, scope: !99)
!107 = !MDLocation(line: 38, column: 30, scope: !108)
!108 = !{!"0xb\001", !1, !99}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!109 = !MDLocation(line: 38, column: 38, scope: !110)
!110 = !{!"0xb\002", !1, !99}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!111 = !MDLocation(line: 38, column: 9, scope: !112)
!112 = !{!"0xb\004", !1, !113}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!113 = !{!"0xb\003", !1, !99}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!114 = !MDLocation(line: 40, column: 21, scope: !99)
!115 = !MDLocation(line: 40, column: 15, scope: !99)
!116 = !MDLocation(line: 40, column: 9, scope: !99)
!117 = !MDLocation(line: 41, column: 26, scope: !99)
!118 = !MDLocation(line: 41, column: 20, scope: !99)
!119 = !MDLocation(line: 41, column: 15, scope: !99)
!120 = !MDLocation(line: 41, column: 9, scope: !99)
!121 = !MDLocation(line: 42, column: 20, scope: !99)
!122 = !MDLocation(line: 42, column: 15, scope: !99)
!123 = !MDLocation(line: 42, column: 9, scope: !99)
!124 = !MDLocation(line: 43, column: 5, scope: !99)
!125 = !MDLocation(line: 36, column: 27, scope: !96)
!126 = !MDLocation(line: 36, column: 5, scope: !96)
!127 = !MDLocation(line: 44, column: 1, scope: !18)
!128 = !{!"0x101\00size\0016777262\000", !21, !9, !5} ; [ DW_TAG_arg_variable ] [size] [line 46]
!129 = !MDLocation(line: 46, column: 28, scope: !21)
!130 = !{!"0x100\00i\0047\000", !21, !9, !5}      ; [ DW_TAG_auto_variable ] [i] [line 47]
!131 = !MDLocation(line: 47, column: 9, scope: !21)
!132 = !{!"0x100\00len\0047\000", !21, !9, !5}    ; [ DW_TAG_auto_variable ] [len] [line 47]
!133 = !MDLocation(line: 47, column: 12, scope: !21)
!134 = !{!"0x100\00result\0048\000", !21, !9, !6} ; [ DW_TAG_auto_variable ] [result] [line 48]
!135 = !MDLocation(line: 48, column: 10, scope: !21)
!136 = !MDLocation(line: 50, column: 11, scope: !21)
!137 = !MDLocation(line: 50, column: 5, scope: !21)
!138 = !MDLocation(line: 51, column: 27, scope: !21)
!139 = !MDLocation(line: 51, column: 20, scope: !21)
!140 = !MDLocation(line: 51, column: 14, scope: !21)
!141 = !MDLocation(line: 51, column: 5, scope: !21)
!142 = !MDLocation(line: 52, column: 10, scope: !143)
!143 = !{!"0xb\0052\005\003", !1, !21}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!144 = !MDLocation(line: 52, column: 17, scope: !145)
!145 = !{!"0xb\002", !1, !146}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!146 = !{!"0xb\001", !1, !147}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!147 = !{!"0xb\0052\005\004", !1, !143}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!148 = !MDLocation(line: 52, column: 21, scope: !147)
!149 = !MDLocation(line: 52, column: 17, scope: !147)
!150 = !MDLocation(line: 52, column: 5, scope: !143)
!151 = !MDLocation(line: 53, column: 21, scope: !147)
!152 = !MDLocation(line: 53, column: 16, scope: !147)
!153 = !MDLocation(line: 53, column: 9, scope: !147)
!154 = !MDLocation(line: 52, column: 26, scope: !147)
!155 = !MDLocation(line: 52, column: 5, scope: !147)
!156 = !MDLocation(line: 54, column: 28, scope: !21)
!157 = !MDLocation(line: 54, column: 17, scope: !21)
!158 = !MDLocation(line: 54, column: 5, scope: !21)
!159 = !MDLocation(line: 55, column: 13, scope: !21)
!160 = !MDLocation(line: 55, column: 21, scope: !21)
!161 = !MDLocation(line: 55, column: 5, scope: !21)
!162 = !MDLocation(line: 56, column: 12, scope: !21)
!163 = !MDLocation(line: 56, column: 5, scope: !21)
!164 = !{!"0x101\00data\0016777275\000", !24, !9, !6} ; [ DW_TAG_arg_variable ] [data] [line 59]
!165 = !MDLocation(line: 59, column: 24, scope: !24)
!166 = !{!"0x101\00len\0033554491\000", !24, !9, !5} ; [ DW_TAG_arg_variable ] [len] [line 59]
!167 = !MDLocation(line: 59, column: 34, scope: !24)
!168 = !{!"0x100\00i\0060\000", !24, !9, !5}      ; [ DW_TAG_auto_variable ] [i] [line 60]
!169 = !MDLocation(line: 60, column: 9, scope: !24)
!170 = !{!"0x100\00result\0061\000", !24, !9, !5} ; [ DW_TAG_auto_variable ] [result] [line 61]
!171 = !MDLocation(line: 61, column: 9, scope: !24)
!172 = !MDLocation(line: 63, column: 10, scope: !173)
!173 = !{!"0xb\0063\005\005", !1, !24}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!174 = !MDLocation(line: 63, column: 17, scope: !175)
!175 = !{!"0xb\002", !1, !176}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!176 = !{!"0xb\001", !1, !177}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!177 = !{!"0xb\0063\005\006", !1, !173}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!178 = !MDLocation(line: 63, column: 21, scope: !177)
!179 = !MDLocation(line: 63, column: 17, scope: !177)
!180 = !MDLocation(line: 63, column: 5, scope: !173)
!181 = !MDLocation(line: 64, column: 18, scope: !177)
!182 = !MDLocation(line: 64, column: 28, scope: !177)
!183 = !MDLocation(line: 64, column: 42, scope: !177)
!184 = !MDLocation(line: 64, column: 37, scope: !177)
!185 = !MDLocation(line: 64, column: 9, scope: !177)
!186 = !MDLocation(line: 63, column: 26, scope: !177)
!187 = !MDLocation(line: 63, column: 5, scope: !177)
!188 = !MDLocation(line: 65, column: 15, scope: !24)
!189 = !MDLocation(line: 65, column: 5, scope: !24)
!190 = !MDLocation(line: 66, column: 12, scope: !24)
!191 = !MDLocation(line: 66, column: 5, scope: !24)
!192 = !{!"0x100\00i\0070\000", !27, !9, !5}      ; [ DW_TAG_auto_variable ] [i] [line 70]
!193 = !MDLocation(line: 70, column: 9, scope: !27)
!194 = !{!"0x100\00j\0070\000", !27, !9, !5}      ; [ DW_TAG_auto_variable ] [j] [line 70]
!195 = !MDLocation(line: 70, column: 12, scope: !27)
!196 = !{!"0x100\00duplicate\0070\000", !27, !9, !5} ; [ DW_TAG_auto_variable ] [duplicate] [line 70]
!197 = !MDLocation(line: 70, column: 15, scope: !27)
!198 = !{!"0x100\00rndArr\0071\000", !27, !9, !6} ; [ DW_TAG_auto_variable ] [rndArr] [line 71]
!199 = !MDLocation(line: 71, column: 10, scope: !27)
!200 = !MDLocation(line: 73, column: 5, scope: !27)
!201 = !MDLocation(line: 75, column: 7, scope: !202)
!202 = !{!"0xb\0075\002\007", !1, !27}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!203 = !MDLocation(line: 75, column: 14, scope: !204)
!204 = !{!"0xb\002", !1, !205}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!205 = !{!"0xb\001", !1, !206}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!206 = !{!"0xb\0075\002\008", !1, !202}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!207 = !MDLocation(line: 75, column: 2, scope: !202)
!208 = !MDLocation(line: 76, column: 12, scope: !209)
!209 = !{!"0xb\0075\0032\009", !1, !206}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!210 = !MDLocation(line: 76, column: 3, scope: !209)
!211 = !MDLocation(line: 77, column: 8, scope: !212)
!212 = !{!"0xb\0077\003\0010", !1, !209}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!213 = !MDLocation(line: 77, column: 15, scope: !214)
!214 = !{!"0xb\002", !1, !215}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!215 = !{!"0xb\001", !1, !216}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!216 = !{!"0xb\0077\003\0011", !1, !212}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!217 = !MDLocation(line: 77, column: 3, scope: !212)
!218 = !MDLocation(line: 78, column: 30, scope: !216)
!219 = !MDLocation(line: 78, column: 16, scope: !216)
!220 = !MDLocation(line: 78, column: 4, scope: !216)
!221 = !MDLocation(line: 77, column: 28, scope: !216)
!222 = !MDLocation(line: 77, column: 3, scope: !216)
!223 = !MDLocation(line: 79, column: 8, scope: !209)
!224 = !MDLocation(line: 79, column: 3, scope: !209)
!225 = !MDLocation(line: 80, column: 35, scope: !209)
!226 = !MDLocation(line: 80, column: 3, scope: !209)
!227 = !MDLocation(line: 81, column: 2, scope: !209)
!228 = !MDLocation(line: 75, column: 27, scope: !206)
!229 = !MDLocation(line: 75, column: 2, scope: !206)
!230 = !MDLocation(line: 83, column: 5, scope: !27)
