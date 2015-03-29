; ModuleID = 'bubblesort.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.node = type { %struct.node*, %struct.node*, i32 }
%struct.element = type { i32, i32 }
%struct.complex = type { float, float }

@seed = common global i64 0, align 8
@biggest = common global i32 0, align 4
@littlest = common global i32 0, align 4
@sortlist = common global [5001 x i32] zeroinitializer, align 16
@top = common global i32 0, align 4
@.str = private unnamed_addr constant [19 x i8] c"Error3 in Bubble.\0A\00", align 1
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
@z = common global [257 x %struct.complex] zeroinitializer, align 16
@w = common global [257 x %struct.complex] zeroinitializer, align 16
@e = common global [130 x %struct.complex] zeroinitializer, align 16
@zr = common global float 0.000000e+00, align 4
@zi = common global float 0.000000e+00, align 4

; Function Attrs: nounwind uwtable
define void @Initrand() #0 {
entry:
  store i64 74755, i64* @seed, align 8, !dbg !101
  ret void, !dbg !102
}

; Function Attrs: nounwind uwtable
define i32 @Rand() #0 {
entry:
  %0 = load i64* @seed, align 8, !dbg !103
  %mul = mul nsw i64 %0, 1309, !dbg !103
  %add = add nsw i64 %mul, 13849, !dbg !103
  %and = and i64 %add, 65535, !dbg !104
  store i64 %and, i64* @seed, align 8, !dbg !105
  %1 = load i64* @seed, align 8, !dbg !106
  %conv = trunc i64 %1 to i32, !dbg !107
  ret i32 %conv, !dbg !108
}

; Function Attrs: nounwind uwtable
define void @bInitarr() #0 {
entry:
  %i = alloca i32, align 4
  %temp = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !109, metadata !110), !dbg !111
  call void @llvm.dbg.declare(metadata i64* %temp, metadata !112, metadata !110), !dbg !113
  call void @Initrand(), !dbg !114
  store i32 0, i32* @biggest, align 4, !dbg !115
  store i32 0, i32* @littlest, align 4, !dbg !116
  store i32 1, i32* %i, align 4, !dbg !117
  br label %for.cond, !dbg !117

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4, !dbg !119
  %cmp = icmp sle i32 %0, 500, !dbg !119
  br i1 %cmp, label %for.body, label %for.end, !dbg !123

for.body:                                         ; preds = %for.cond
  %call = call i32 @Rand(), !dbg !124
  %conv = sext i32 %call to i64, !dbg !124
  store i64 %conv, i64* %temp, align 8, !dbg !126
  %1 = load i64* %temp, align 8, !dbg !127
  %2 = load i64* %temp, align 8, !dbg !128
  %div = sdiv i64 %2, 100000, !dbg !128
  %mul = mul nsw i64 %div, 100000, !dbg !129
  %sub = sub nsw i64 %1, %mul, !dbg !127
  %sub1 = sub nsw i64 %sub, 50000, !dbg !127
  %conv2 = trunc i64 %sub1 to i32, !dbg !130
  %3 = load i32* %i, align 4, !dbg !131
  %idxprom = sext i32 %3 to i64, !dbg !132
  %arrayidx = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i64 %idxprom, !dbg !132
  store i32 %conv2, i32* %arrayidx, align 4, !dbg !132
  %4 = load i32* %i, align 4, !dbg !133
  %idxprom3 = sext i32 %4 to i64, !dbg !135
  %arrayidx4 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i64 %idxprom3, !dbg !135
  %5 = load i32* %arrayidx4, align 4, !dbg !135
  %6 = load i32* @biggest, align 4, !dbg !136
  %cmp5 = icmp sgt i32 %5, %6, !dbg !135
  br i1 %cmp5, label %if.then, label %if.else, !dbg !137

if.then:                                          ; preds = %for.body
  %7 = load i32* %i, align 4, !dbg !138
  %idxprom7 = sext i32 %7 to i64, !dbg !140
  %arrayidx8 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i64 %idxprom7, !dbg !140
  %8 = load i32* %arrayidx8, align 4, !dbg !140
  store i32 %8, i32* @biggest, align 4, !dbg !141
  br label %if.end16, !dbg !141

if.else:                                          ; preds = %for.body
  %9 = load i32* %i, align 4, !dbg !142
  %idxprom9 = sext i32 %9 to i64, !dbg !144
  %arrayidx10 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i64 %idxprom9, !dbg !144
  %10 = load i32* %arrayidx10, align 4, !dbg !144
  %11 = load i32* @littlest, align 4, !dbg !145
  %cmp11 = icmp slt i32 %10, %11, !dbg !144
  br i1 %cmp11, label %if.then13, label %if.end, !dbg !146

if.then13:                                        ; preds = %if.else
  %12 = load i32* %i, align 4, !dbg !147
  %idxprom14 = sext i32 %12 to i64, !dbg !149
  %arrayidx15 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i64 %idxprom14, !dbg !149
  %13 = load i32* %arrayidx15, align 4, !dbg !149
  store i32 %13, i32* @littlest, align 4, !dbg !150
  br label %if.end, !dbg !150

if.end:                                           ; preds = %if.then13, %if.else
  br label %if.end16

if.end16:                                         ; preds = %if.end, %if.then
  br label %for.inc, !dbg !151

for.inc:                                          ; preds = %if.end16
  %14 = load i32* %i, align 4, !dbg !152
  %inc = add nsw i32 %14, 1, !dbg !152
  store i32 %inc, i32* %i, align 4, !dbg !152
  br label %for.cond, !dbg !153

for.end:                                          ; preds = %for.cond
  ret void, !dbg !154
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @Bubble(i32 %run) #0 {
entry:
  %run.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %run, i32* %run.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %run.addr, metadata !155, metadata !110), !dbg !156
  call void @llvm.dbg.declare(metadata i32* %i, metadata !157, metadata !110), !dbg !158
  call void @llvm.dbg.declare(metadata i32* %j, metadata !159, metadata !110), !dbg !160
  call void @bInitarr(), !dbg !161
  store i32 500, i32* @top, align 4, !dbg !162
  br label %while.cond, !dbg !163

while.cond:                                       ; preds = %while.end, %entry
  %0 = load i32* @top, align 4, !dbg !164
  %cmp = icmp sgt i32 %0, 1, !dbg !164
  br i1 %cmp, label %while.body, label %while.end18, !dbg !163

while.body:                                       ; preds = %while.cond
  store i32 1, i32* %i, align 4, !dbg !167
  br label %while.cond1, !dbg !169

while.cond1:                                      ; preds = %if.end, %while.body
  %1 = load i32* %i, align 4, !dbg !170
  %2 = load i32* @top, align 4, !dbg !173
  %cmp2 = icmp slt i32 %1, %2, !dbg !174
  br i1 %cmp2, label %while.body3, label %while.end, !dbg !169

while.body3:                                      ; preds = %while.cond1
  %3 = load i32* %i, align 4, !dbg !175
  %idxprom = sext i32 %3 to i64, !dbg !178
  %arrayidx = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i64 %idxprom, !dbg !178
  %4 = load i32* %arrayidx, align 4, !dbg !178
  %5 = load i32* %i, align 4, !dbg !179
  %add = add nsw i32 %5, 1, !dbg !179
  %idxprom4 = sext i32 %add to i64, !dbg !180
  %arrayidx5 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i64 %idxprom4, !dbg !180
  %6 = load i32* %arrayidx5, align 4, !dbg !180
  %cmp6 = icmp sgt i32 %4, %6, !dbg !178
  br i1 %cmp6, label %if.then, label %if.end, !dbg !181

if.then:                                          ; preds = %while.body3
  %7 = load i32* %i, align 4, !dbg !182
  %idxprom7 = sext i32 %7 to i64, !dbg !184
  %arrayidx8 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i64 %idxprom7, !dbg !184
  %8 = load i32* %arrayidx8, align 4, !dbg !184
  store i32 %8, i32* %j, align 4, !dbg !185
  %9 = load i32* %i, align 4, !dbg !186
  %add9 = add nsw i32 %9, 1, !dbg !186
  %idxprom10 = sext i32 %add9 to i64, !dbg !187
  %arrayidx11 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i64 %idxprom10, !dbg !187
  %10 = load i32* %arrayidx11, align 4, !dbg !187
  %11 = load i32* %i, align 4, !dbg !188
  %idxprom12 = sext i32 %11 to i64, !dbg !189
  %arrayidx13 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i64 %idxprom12, !dbg !189
  store i32 %10, i32* %arrayidx13, align 4, !dbg !189
  %12 = load i32* %j, align 4, !dbg !190
  %13 = load i32* %i, align 4, !dbg !191
  %add14 = add nsw i32 %13, 1, !dbg !191
  %idxprom15 = sext i32 %add14 to i64, !dbg !192
  %arrayidx16 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i64 %idxprom15, !dbg !192
  store i32 %12, i32* %arrayidx16, align 4, !dbg !192
  br label %if.end, !dbg !193

if.end:                                           ; preds = %if.then, %while.body3
  %14 = load i32* %i, align 4, !dbg !194
  %add17 = add nsw i32 %14, 1, !dbg !194
  store i32 %add17, i32* %i, align 4, !dbg !195
  br label %while.cond1, !dbg !169

while.end:                                        ; preds = %while.cond1
  %15 = load i32* @top, align 4, !dbg !196
  %sub = sub nsw i32 %15, 1, !dbg !196
  store i32 %sub, i32* @top, align 4, !dbg !197
  br label %while.cond, !dbg !163

while.end18:                                      ; preds = %while.cond
  %16 = load i32* getelementptr inbounds ([5001 x i32]* @sortlist, i32 0, i64 1), align 4, !dbg !198
  %17 = load i32* @littlest, align 4, !dbg !200
  %cmp19 = icmp ne i32 %16, %17, !dbg !198
  br i1 %cmp19, label %if.then21, label %lor.lhs.false, !dbg !201

lor.lhs.false:                                    ; preds = %while.end18
  %18 = load i32* getelementptr inbounds ([5001 x i32]* @sortlist, i32 0, i64 500), align 4, !dbg !202
  %19 = load i32* @biggest, align 4, !dbg !204
  %cmp20 = icmp ne i32 %18, %19, !dbg !205
  br i1 %cmp20, label %if.then21, label %if.end22, !dbg !201

if.then21:                                        ; preds = %lor.lhs.false, %while.end18
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0)), !dbg !206
  br label %if.end22, !dbg !206

if.end22:                                         ; preds = %if.then21, %lor.lhs.false
  %20 = load i32* %run.addr, align 4, !dbg !207
  %add23 = add nsw i32 %20, 1, !dbg !207
  %idxprom24 = sext i32 %add23 to i64, !dbg !208
  %arrayidx25 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i64 %idxprom24, !dbg !208
  %21 = load i32* %arrayidx25, align 4, !dbg !208
  %call26 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), i32 %21), !dbg !209
  ret void, !dbg !210
}

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  call void @llvm.dbg.declare(metadata i32* %i, metadata !211, metadata !110), !dbg !212
  store i32 0, i32* %i, align 4, !dbg !213
  br label %for.cond, !dbg !213

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4, !dbg !215
  %cmp = icmp slt i32 %0, 100, !dbg !215
  br i1 %cmp, label %for.body, label %for.end, !dbg !219

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4, !dbg !220
  call void @Bubble(i32 %1), !dbg !222
  br label %for.inc, !dbg !222

for.inc:                                          ; preds = %for.body
  %2 = load i32* %i, align 4, !dbg !223
  %inc = add nsw i32 %2, 1, !dbg !223
  store i32 %inc, i32* %i, align 4, !dbg !223
  br label %for.cond, !dbg !225

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !226
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!98, !99}
!llvm.ident = !{!100}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\000\00\000\00\001", !1, !2, !3, !5, !17, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c] [DW_LANG_C99]
!1 = !{!"bubblesort.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4}
!4 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!5 = !{!6, !10, !12, !13, !16}
!6 = !{!"0x2e\00Initrand\00Initrand\00\0097\000\001\000\000\000\000\0097", !1, !7, !8, null, void ()* @Initrand, null, null, !2} ; [ DW_TAG_subprogram ] [line 97] [def] [Initrand]
!7 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c]
!8 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !9, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!9 = !{null}
!10 = !{!"0x2e\00Rand\00Rand\00\00100\000\001\000\000\000\000\00100", !1, !7, !11, null, i32 ()* @Rand, null, null, !2} ; [ DW_TAG_subprogram ] [line 100] [def] [Rand]
!11 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !3, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!12 = !{!"0x2e\00bInitarr\00bInitarr\00\00105\000\001\000\000\000\000\00105", !1, !7, !8, null, void ()* @bInitarr, null, null, !2} ; [ DW_TAG_subprogram ] [line 105] [def] [bInitarr]
!13 = !{!"0x2e\00Bubble\00Bubble\00\00118\000\001\000\000\00256\000\00118", !1, !7, !14, null, void (i32)* @Bubble, null, null, !2} ; [ DW_TAG_subprogram ] [line 118] [def] [Bubble]
!14 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !15, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!15 = !{null, !4}
!16 = !{!"0x2e\00main\00main\00\00138\000\001\000\000\000\000\00139", !1, !7, !11, null, i32 ()* @main, null, null, !2} ; [ DW_TAG_subprogram ] [line 138] [def] [scope 139] [main]
!17 = !{!18, !20, !21, !22, !24, !28, !30, !37, !41, !49, !50, !51, !55, !56, !57, !59, !60, !61, !62, !66, !67, !71, !74, !75, !76, !80, !81, !82, !83, !91, !92, !96, !97}
!18 = !{!"0x34\00value\00value\00\0073\000\001", null, !7, !19, float* @value, null} ; [ DW_TAG_variable ] [value] [line 73] [def]
!19 = !{!"0x24\00float\000\0032\0032\000\000\004", null, null} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!20 = !{!"0x34\00fixed\00fixed\00\0073\000\001", null, !7, !19, float* @fixed, null} ; [ DW_TAG_variable ] [fixed] [line 73] [def]
!21 = !{!"0x34\00floated\00floated\00\0073\000\001", null, !7, !19, float* @floated, null} ; [ DW_TAG_variable ] [floated] [line 73] [def]
!22 = !{!"0x34\00seed\00seed\00\0075\000\001", null, !7, !23, i64* @seed, null} ; [ DW_TAG_variable ] [seed] [line 75] [def]
!23 = !{!"0x24\00long int\000\0064\0064\000\000\005", null, null} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!24 = !{!"0x34\00permarray\00permarray\00\0077\000\001", null, !7, !25, [11 x i32]* @permarray, null} ; [ DW_TAG_variable ] [permarray] [line 77] [def]
!25 = !{!"0x1\00\000\00352\0032\000\000\000", null, null, !4, !26, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 352, align 32, offset 0] [from int]
!26 = !{!27}
!27 = !{!"0x21\000\0011"}                         ; [ DW_TAG_subrange_type ] [0, 10]
!28 = !{!"0x34\00pctr\00pctr\00\0079\000\001", null, !7, !29, i32* @pctr, null} ; [ DW_TAG_variable ] [pctr] [line 79] [def]
!29 = !{!"0x24\00unsigned int\000\0032\0032\000\000\007", null, null} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!30 = !{!"0x34\00tree\00tree\00\0081\000\001", null, !7, !31, %struct.node** @tree, null} ; [ DW_TAG_variable ] [tree] [line 81] [def]
!31 = !{!"0xf\00\000\0064\0064\000\000", null, null, !32} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from node]
!32 = !{!"0x13\00node\0039\00192\0064\000\000\000", !1, null, null, !33, null, null, null} ; [ DW_TAG_structure_type ] [node] [line 39, size 192, align 64, offset 0] [def] [from ]
!33 = !{!34, !35, !36}
!34 = !{!"0xd\00left\0040\0064\0064\000\000", !1, !32, !31} ; [ DW_TAG_member ] [left] [line 40, size 64, align 64, offset 0] [from ]
!35 = !{!"0xd\00right\0040\0064\0064\0064\000", !1, !32, !31} ; [ DW_TAG_member ] [right] [line 40, size 64, align 64, offset 64] [from ]
!36 = !{!"0xd\00val\0041\0032\0032\00128\000", !1, !32, !4} ; [ DW_TAG_member ] [val] [line 41, size 32, align 32, offset 128] [from int]
!37 = !{!"0x34\00stack\00stack\00\0083\000\001", null, !7, !38, [4 x i32]* @stack, null} ; [ DW_TAG_variable ] [stack] [line 83] [def]
!38 = !{!"0x1\00\000\00128\0032\000\000\000", null, null, !4, !39, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 128, align 32, offset 0] [from int]
!39 = !{!40}
!40 = !{!"0x21\000\004"}                          ; [ DW_TAG_subrange_type ] [0, 3]
!41 = !{!"0x34\00cellspace\00cellspace\00\0084\000\001", null, !7, !42, [19 x %struct.element]* @cellspace, null} ; [ DW_TAG_variable ] [cellspace] [line 84] [def]
!42 = !{!"0x1\00\000\001216\0032\000\000\000", null, null, !43, !47, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1216, align 32, offset 0] [from element]
!43 = !{!"0x13\00element\0047\0064\0032\000\000\000", !1, null, null, !44, null, null, null} ; [ DW_TAG_structure_type ] [element] [line 47, size 64, align 32, offset 0] [def] [from ]
!44 = !{!45, !46}
!45 = !{!"0xd\00discsize\0048\0032\0032\000\000", !1, !43, !4} ; [ DW_TAG_member ] [discsize] [line 48, size 32, align 32, offset 0] [from int]
!46 = !{!"0xd\00next\0049\0032\0032\0032\000", !1, !43, !4} ; [ DW_TAG_member ] [next] [line 49, size 32, align 32, offset 32] [from int]
!47 = !{!48}
!48 = !{!"0x21\000\0019"}                         ; [ DW_TAG_subrange_type ] [0, 18]
!49 = !{!"0x34\00freelist\00freelist\00\0085\000\001", null, !7, !4, i32* @freelist, null} ; [ DW_TAG_variable ] [freelist] [line 85] [def]
!50 = !{!"0x34\00movesdone\00movesdone\00\0085\000\001", null, !7, !4, i32* @movesdone, null} ; [ DW_TAG_variable ] [movesdone] [line 85] [def]
!51 = !{!"0x34\00ima\00ima\00\0087\000\001", null, !7, !52, [41 x [41 x i32]]* @ima, null} ; [ DW_TAG_variable ] [ima] [line 87] [def]
!52 = !{!"0x1\00\000\0053792\0032\000\000\000", null, null, !4, !53, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 53792, align 32, offset 0] [from int]
!53 = !{!54, !54}
!54 = !{!"0x21\000\0041"}                         ; [ DW_TAG_subrange_type ] [0, 40]
!55 = !{!"0x34\00imb\00imb\00\0087\000\001", null, !7, !52, [41 x [41 x i32]]* @imb, null} ; [ DW_TAG_variable ] [imb] [line 87] [def]
!56 = !{!"0x34\00imr\00imr\00\0087\000\001", null, !7, !52, [41 x [41 x i32]]* @imr, null} ; [ DW_TAG_variable ] [imr] [line 87] [def]
!57 = !{!"0x34\00rma\00rma\00\0088\000\001", null, !7, !58, [41 x [41 x float]]* @rma, null} ; [ DW_TAG_variable ] [rma] [line 88] [def]
!58 = !{!"0x1\00\000\0053792\0032\000\000\000", null, null, !19, !53, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 53792, align 32, offset 0] [from float]
!59 = !{!"0x34\00rmb\00rmb\00\0088\000\001", null, !7, !58, [41 x [41 x float]]* @rmb, null} ; [ DW_TAG_variable ] [rmb] [line 88] [def]
!60 = !{!"0x34\00rmr\00rmr\00\0088\000\001", null, !7, !58, [41 x [41 x float]]* @rmr, null} ; [ DW_TAG_variable ] [rmr] [line 88] [def]
!61 = !{!"0x34\00piececount\00piececount\00\0090\000\001", null, !7, !38, [4 x i32]* @piececount, null} ; [ DW_TAG_variable ] [piececount] [line 90] [def]
!62 = !{!"0x34\00class\00class\00\0090\000\001", null, !7, !63, [13 x i32]* @class, null} ; [ DW_TAG_variable ] [class] [line 90] [def]
!63 = !{!"0x1\00\000\00416\0032\000\000\000", null, null, !4, !64, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 416, align 32, offset 0] [from int]
!64 = !{!65}
!65 = !{!"0x21\000\0013"}                         ; [ DW_TAG_subrange_type ] [0, 12]
!66 = !{!"0x34\00piecemax\00piecemax\00\0090\000\001", null, !7, !63, [13 x i32]* @piecemax, null} ; [ DW_TAG_variable ] [piecemax] [line 90] [def]
!67 = !{!"0x34\00puzzl\00puzzl\00\0091\000\001", null, !7, !68, [512 x i32]* @puzzl, null} ; [ DW_TAG_variable ] [puzzl] [line 91] [def]
!68 = !{!"0x1\00\000\0016384\0032\000\000\000", null, null, !4, !69, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16384, align 32, offset 0] [from int]
!69 = !{!70}
!70 = !{!"0x21\000\00512"}                        ; [ DW_TAG_subrange_type ] [0, 511]
!71 = !{!"0x34\00p\00p\00\0091\000\001", null, !7, !72, [13 x [512 x i32]]* @p, null} ; [ DW_TAG_variable ] [p] [line 91] [def]
!72 = !{!"0x1\00\000\00212992\0032\000\000\000", null, null, !4, !73, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 212992, align 32, offset 0] [from int]
!73 = !{!65, !70}
!74 = !{!"0x34\00n\00n\00\0091\000\001", null, !7, !4, i32* @n, null} ; [ DW_TAG_variable ] [n] [line 91] [def]
!75 = !{!"0x34\00kount\00kount\00\0091\000\001", null, !7, !4, i32* @kount, null} ; [ DW_TAG_variable ] [kount] [line 91] [def]
!76 = !{!"0x34\00sortlist\00sortlist\00\0093\000\001", null, !7, !77, [5001 x i32]* @sortlist, null} ; [ DW_TAG_variable ] [sortlist] [line 93] [def]
!77 = !{!"0x1\00\000\00160032\0032\000\000\000", null, null, !4, !78, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 160032, align 32, offset 0] [from int]
!78 = !{!79}
!79 = !{!"0x21\000\005001"}                       ; [ DW_TAG_subrange_type ] [0, 5000]
!80 = !{!"0x34\00biggest\00biggest\00\0093\000\001", null, !7, !4, i32* @biggest, null} ; [ DW_TAG_variable ] [biggest] [line 93] [def]
!81 = !{!"0x34\00littlest\00littlest\00\0093\000\001", null, !7, !4, i32* @littlest, null} ; [ DW_TAG_variable ] [littlest] [line 93] [def]
!82 = !{!"0x34\00top\00top\00\0093\000\001", null, !7, !4, i32* @top, null} ; [ DW_TAG_variable ] [top] [line 93] [def]
!83 = !{!"0x34\00z\00z\00\0095\000\001", null, !7, !84, [257 x %struct.complex]* @z, null} ; [ DW_TAG_variable ] [z] [line 95] [def]
!84 = !{!"0x1\00\000\0016448\0032\000\000\000", null, null, !85, !89, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16448, align 32, offset 0] [from complex]
!85 = !{!"0x13\00complex\0068\0064\0032\000\000\000", !1, null, null, !86, null, null, null} ; [ DW_TAG_structure_type ] [complex] [line 68, size 64, align 32, offset 0] [def] [from ]
!86 = !{!87, !88}
!87 = !{!"0xd\00rp\0068\0032\0032\000\000", !1, !85, !19} ; [ DW_TAG_member ] [rp] [line 68, size 32, align 32, offset 0] [from float]
!88 = !{!"0xd\00ip\0068\0032\0032\0032\000", !1, !85, !19} ; [ DW_TAG_member ] [ip] [line 68, size 32, align 32, offset 32] [from float]
!89 = !{!90}
!90 = !{!"0x21\000\00257"}                        ; [ DW_TAG_subrange_type ] [0, 256]
!91 = !{!"0x34\00w\00w\00\0095\000\001", null, !7, !84, [257 x %struct.complex]* @w, null} ; [ DW_TAG_variable ] [w] [line 95] [def]
!92 = !{!"0x34\00e\00e\00\0095\000\001", null, !7, !93, [130 x %struct.complex]* @e, null} ; [ DW_TAG_variable ] [e] [line 95] [def]
!93 = !{!"0x1\00\000\008320\0032\000\000\000", null, null, !85, !94, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 8320, align 32, offset 0] [from complex]
!94 = !{!95}
!95 = !{!"0x21\000\00130"}                        ; [ DW_TAG_subrange_type ] [0, 129]
!96 = !{!"0x34\00zr\00zr\00\0096\000\001", null, !7, !19, float* @zr, null} ; [ DW_TAG_variable ] [zr] [line 96] [def]
!97 = !{!"0x34\00zi\00zi\00\0096\000\001", null, !7, !19, float* @zi, null} ; [ DW_TAG_variable ] [zi] [line 96] [def]
!98 = !{i32 2, !"Dwarf Version", i32 4}
!99 = !{i32 2, !"Debug Info Version", i32 2}
!100 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!101 = !MDLocation(line: 98, column: 3, scope: !6)
!102 = !MDLocation(line: 99, column: 1, scope: !6)
!103 = !MDLocation(line: 101, column: 11, scope: !10)
!104 = !MDLocation(line: 101, column: 10, scope: !10)
!105 = !MDLocation(line: 101, column: 3, scope: !10)
!106 = !MDLocation(line: 102, column: 16, scope: !10)
!107 = !MDLocation(line: 102, column: 11, scope: !10)
!108 = !MDLocation(line: 102, column: 3, scope: !10)
!109 = !{!"0x100\00i\00106\000", !12, !7, !4}     ; [ DW_TAG_auto_variable ] [i] [line 106]
!110 = !{!"0x102"}                                ; [ DW_TAG_expression ]
!111 = !MDLocation(line: 106, column: 7, scope: !12)
!112 = !{!"0x100\00temp\00107\000", !12, !7, !23} ; [ DW_TAG_auto_variable ] [temp] [line 107]
!113 = !MDLocation(line: 107, column: 8, scope: !12)
!114 = !MDLocation(line: 108, column: 3, scope: !12)
!115 = !MDLocation(line: 109, column: 3, scope: !12)
!116 = !MDLocation(line: 109, column: 16, scope: !12)
!117 = !MDLocation(line: 110, column: 9, scope: !118)
!118 = !{!"0xb\00110\003\000", !1, !12}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c]
!119 = !MDLocation(line: 110, column: 16, scope: !120)
!120 = !{!"0xb\002", !1, !121}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c]
!121 = !{!"0xb\001", !1, !122}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c]
!122 = !{!"0xb\00110\003\001", !1, !118}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c]
!123 = !MDLocation(line: 110, column: 3, scope: !118)
!124 = !MDLocation(line: 111, column: 12, scope: !125)
!125 = !{!"0xb\00110\0040\002", !1, !122}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c]
!126 = !MDLocation(line: 111, column: 5, scope: !125)
!127 = !MDLocation(line: 113, column: 25, scope: !125)
!128 = !MDLocation(line: 113, column: 33, scope: !125)
!129 = !MDLocation(line: 113, column: 32, scope: !125)
!130 = !MDLocation(line: 113, column: 19, scope: !125)
!131 = !MDLocation(line: 113, column: 14, scope: !125)
!132 = !MDLocation(line: 113, column: 5, scope: !125)
!133 = !MDLocation(line: 114, column: 19, scope: !134)
!134 = !{!"0xb\00114\0010\003", !1, !125}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c]
!135 = !MDLocation(line: 114, column: 10, scope: !134)
!136 = !MDLocation(line: 114, column: 24, scope: !134)
!137 = !MDLocation(line: 114, column: 10, scope: !125)
!138 = !MDLocation(line: 114, column: 53, scope: !139)
!139 = !{!"0xb\001", !1, !134}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c]
!140 = !MDLocation(line: 114, column: 44, scope: !134)
!141 = !MDLocation(line: 114, column: 34, scope: !134)
!142 = !MDLocation(line: 115, column: 24, scope: !143)
!143 = !{!"0xb\00115\0015\004", !1, !134}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c]
!144 = !MDLocation(line: 115, column: 15, scope: !143)
!145 = !MDLocation(line: 115, column: 29, scope: !143)
!146 = !MDLocation(line: 115, column: 15, scope: !134)
!147 = !MDLocation(line: 115, column: 60, scope: !148)
!148 = !{!"0xb\001", !1, !143}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c]
!149 = !MDLocation(line: 115, column: 51, scope: !143)
!150 = !MDLocation(line: 115, column: 40, scope: !143)
!151 = !MDLocation(line: 116, column: 3, scope: !125)
!152 = !MDLocation(line: 110, column: 34, scope: !122)
!153 = !MDLocation(line: 110, column: 3, scope: !122)
!154 = !MDLocation(line: 117, column: 1, scope: !12)
!155 = !{!"0x101\00run\0016777334\000", !13, !7, !4} ; [ DW_TAG_arg_variable ] [run] [line 118]
!156 = !MDLocation(line: 118, column: 17, scope: !13)
!157 = !{!"0x100\00i\00119\000", !13, !7, !4}     ; [ DW_TAG_auto_variable ] [i] [line 119]
!158 = !MDLocation(line: 119, column: 7, scope: !13)
!159 = !{!"0x100\00j\00119\000", !13, !7, !4}     ; [ DW_TAG_auto_variable ] [j] [line 119]
!160 = !MDLocation(line: 119, column: 10, scope: !13)
!161 = !MDLocation(line: 120, column: 3, scope: !13)
!162 = !MDLocation(line: 121, column: 3, scope: !13)
!163 = !MDLocation(line: 122, column: 3, scope: !13)
!164 = !MDLocation(line: 122, column: 11, scope: !165)
!165 = !{!"0xb\002", !1, !166}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c]
!166 = !{!"0xb\001", !1, !13}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c]
!167 = !MDLocation(line: 123, column: 5, scope: !168)
!168 = !{!"0xb\00122\0019\005", !1, !13}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c]
!169 = !MDLocation(line: 124, column: 5, scope: !168)
!170 = !MDLocation(line: 124, column: 13, scope: !171)
!171 = !{!"0xb\002", !1, !172}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c]
!172 = !{!"0xb\001", !1, !168}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c]
!173 = !MDLocation(line: 124, column: 15, scope: !168)
!174 = !MDLocation(line: 124, column: 13, scope: !168)
!175 = !MDLocation(line: 125, column: 21, scope: !176)
!176 = !{!"0xb\00125\0012\007", !1, !177}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c]
!177 = !{!"0xb\00124\0021\006", !1, !168}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c]
!178 = !MDLocation(line: 125, column: 12, scope: !176)
!179 = !MDLocation(line: 125, column: 35, scope: !176)
!180 = !MDLocation(line: 125, column: 26, scope: !176)
!181 = !MDLocation(line: 125, column: 12, scope: !177)
!182 = !MDLocation(line: 126, column: 22, scope: !183)
!183 = !{!"0xb\00125\0042\008", !1, !176}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c]
!184 = !MDLocation(line: 126, column: 13, scope: !183)
!185 = !MDLocation(line: 126, column: 9, scope: !183)
!186 = !MDLocation(line: 127, column: 32, scope: !183)
!187 = !MDLocation(line: 127, column: 23, scope: !183)
!188 = !MDLocation(line: 127, column: 18, scope: !183)
!189 = !MDLocation(line: 127, column: 9, scope: !183)
!190 = !MDLocation(line: 128, column: 25, scope: !183)
!191 = !MDLocation(line: 128, column: 18, scope: !183)
!192 = !MDLocation(line: 128, column: 9, scope: !183)
!193 = !MDLocation(line: 129, column: 7, scope: !183)
!194 = !MDLocation(line: 130, column: 9, scope: !177)
!195 = !MDLocation(line: 130, column: 7, scope: !177)
!196 = !MDLocation(line: 132, column: 9, scope: !168)
!197 = !MDLocation(line: 132, column: 5, scope: !168)
!198 = !MDLocation(line: 134, column: 9, scope: !199)
!199 = !{!"0xb\00134\008\009", !1, !13}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c]
!200 = !MDLocation(line: 134, column: 24, scope: !199)
!201 = !MDLocation(line: 134, column: 8, scope: !13)
!202 = !MDLocation(line: 134, column: 38, scope: !203)
!203 = !{!"0xb\001", !1, !199}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c]
!204 = !MDLocation(line: 134, column: 63, scope: !199)
!205 = !MDLocation(line: 134, column: 38, scope: !199)
!206 = !MDLocation(line: 135, column: 5, scope: !199)
!207 = !MDLocation(line: 136, column: 27, scope: !13)
!208 = !MDLocation(line: 136, column: 18, scope: !13)
!209 = !MDLocation(line: 136, column: 3, scope: !13)
!210 = !MDLocation(line: 137, column: 1, scope: !13)
!211 = !{!"0x100\00i\00140\000", !16, !7, !4}     ; [ DW_TAG_auto_variable ] [i] [line 140]
!212 = !MDLocation(line: 140, column: 7, scope: !16)
!213 = !MDLocation(line: 141, column: 8, scope: !214)
!214 = !{!"0xb\00141\003\0010", !1, !16}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c]
!215 = !MDLocation(line: 141, column: 15, scope: !216)
!216 = !{!"0xb\004", !1, !217}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c]
!217 = !{!"0xb\001", !1, !218}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c]
!218 = !{!"0xb\00141\003\0011", !1, !214}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c]
!219 = !MDLocation(line: 141, column: 3, scope: !214)
!220 = !MDLocation(line: 141, column: 36, scope: !221)
!221 = !{!"0xb\002", !1, !218}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c]
!222 = !MDLocation(line: 141, column: 29, scope: !218)
!223 = !MDLocation(line: 141, column: 24, scope: !224)
!224 = !{!"0xb\003", !1, !218}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c]
!225 = !MDLocation(line: 141, column: 3, scope: !218)
!226 = !MDLocation(line: 142, column: 3, scope: !16)
