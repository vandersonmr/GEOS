; ModuleID = 'perm.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.node = type { %struct.node*, %struct.node*, i32 }
%struct.element = type { i32, i32 }
%struct.complex = type { float, float }

@seed = common global i64 0, align 8
@permarray = common global [11 x i32] zeroinitializer, align 16
@pctr = common global i32 0, align 4
@.str = private unnamed_addr constant [17 x i8] c" Error in Perm.\0A\00", align 1
@.str1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@value = common global float 0.000000e+00, align 4
@fixed = common global float 0.000000e+00, align 4
@floated = common global float 0.000000e+00, align 4
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
  store i64 74755, i64* @seed, align 8, !dbg !106
  ret void, !dbg !107
}

; Function Attrs: nounwind uwtable
define i32 @Rand() #0 {
entry:
  %0 = load i64* @seed, align 8, !dbg !108
  %mul = mul nsw i64 %0, 1309, !dbg !108
  %add = add nsw i64 %mul, 13849, !dbg !108
  %and = and i64 %add, 65535, !dbg !109
  store i64 %and, i64* @seed, align 8, !dbg !110
  %1 = load i64* @seed, align 8, !dbg !111
  %conv = trunc i64 %1 to i32, !dbg !112
  ret i32 %conv, !dbg !113
}

; Function Attrs: nounwind uwtable
define void @Swap(i32* %a, i32* %b) #0 {
entry:
  %a.addr = alloca i32*, align 8
  %b.addr = alloca i32*, align 8
  %t = alloca i32, align 4
  store i32* %a, i32** %a.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %a.addr, metadata !114, metadata !115), !dbg !116
  store i32* %b, i32** %b.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %b.addr, metadata !117, metadata !115), !dbg !118
  call void @llvm.dbg.declare(metadata i32* %t, metadata !119, metadata !115), !dbg !120
  %0 = load i32** %a.addr, align 8, !dbg !121
  %1 = load i32* %0, align 4, !dbg !122
  store i32 %1, i32* %t, align 4, !dbg !123
  %2 = load i32** %b.addr, align 8, !dbg !124
  %3 = load i32* %2, align 4, !dbg !125
  %4 = load i32** %a.addr, align 8, !dbg !126
  store i32 %3, i32* %4, align 4, !dbg !127
  %5 = load i32* %t, align 4, !dbg !128
  %6 = load i32** %b.addr, align 8, !dbg !129
  store i32 %5, i32* %6, align 4, !dbg !130
  ret void, !dbg !131
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @Initialize() #0 {
entry:
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !132, metadata !115), !dbg !133
  store i32 1, i32* %i, align 4, !dbg !134
  br label %for.cond, !dbg !134

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4, !dbg !136
  %cmp = icmp sle i32 %0, 7, !dbg !136
  br i1 %cmp, label %for.body, label %for.end, !dbg !140

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4, !dbg !141
  %sub = sub nsw i32 %1, 1, !dbg !141
  %2 = load i32* %i, align 4, !dbg !143
  %idxprom = sext i32 %2 to i64, !dbg !144
  %arrayidx = getelementptr inbounds [11 x i32]* @permarray, i32 0, i64 %idxprom, !dbg !144
  store i32 %sub, i32* %arrayidx, align 4, !dbg !144
  br label %for.inc, !dbg !145

for.inc:                                          ; preds = %for.body
  %3 = load i32* %i, align 4, !dbg !146
  %inc = add nsw i32 %3, 1, !dbg !146
  store i32 %inc, i32* %i, align 4, !dbg !146
  br label %for.cond, !dbg !147

for.end:                                          ; preds = %for.cond
  ret void, !dbg !148
}

; Function Attrs: nounwind uwtable
define void @Permute(i32 %n) #0 {
entry:
  %n.addr = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !149, metadata !115), !dbg !150
  call void @llvm.dbg.declare(metadata i32* %k, metadata !151, metadata !115), !dbg !152
  %0 = load i32* @pctr, align 4, !dbg !153
  %add = add i32 %0, 1, !dbg !153
  store i32 %add, i32* @pctr, align 4, !dbg !154
  %1 = load i32* %n.addr, align 4, !dbg !155
  %cmp = icmp ne i32 %1, 1, !dbg !155
  br i1 %cmp, label %if.then, label %if.end, !dbg !157

if.then:                                          ; preds = %entry
  %2 = load i32* %n.addr, align 4, !dbg !158
  %sub = sub nsw i32 %2, 1, !dbg !158
  call void @Permute(i32 %sub), !dbg !160
  %3 = load i32* %n.addr, align 4, !dbg !161
  %sub1 = sub nsw i32 %3, 1, !dbg !161
  store i32 %sub1, i32* %k, align 4, !dbg !163
  br label %for.cond, !dbg !163

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32* %k, align 4, !dbg !164
  %cmp2 = icmp sge i32 %4, 1, !dbg !164
  br i1 %cmp2, label %for.body, label %for.end, !dbg !168

for.body:                                         ; preds = %for.cond
  %5 = load i32* %n.addr, align 4, !dbg !169
  %idxprom = sext i32 %5 to i64, !dbg !171
  %arrayidx = getelementptr inbounds [11 x i32]* @permarray, i32 0, i64 %idxprom, !dbg !171
  %6 = load i32* %k, align 4, !dbg !172
  %idxprom3 = sext i32 %6 to i64, !dbg !173
  %arrayidx4 = getelementptr inbounds [11 x i32]* @permarray, i32 0, i64 %idxprom3, !dbg !173
  call void @Swap(i32* %arrayidx, i32* %arrayidx4), !dbg !174
  %7 = load i32* %n.addr, align 4, !dbg !175
  %sub5 = sub nsw i32 %7, 1, !dbg !175
  call void @Permute(i32 %sub5), !dbg !176
  %8 = load i32* %n.addr, align 4, !dbg !177
  %idxprom6 = sext i32 %8 to i64, !dbg !178
  %arrayidx7 = getelementptr inbounds [11 x i32]* @permarray, i32 0, i64 %idxprom6, !dbg !178
  %9 = load i32* %k, align 4, !dbg !179
  %idxprom8 = sext i32 %9 to i64, !dbg !180
  %arrayidx9 = getelementptr inbounds [11 x i32]* @permarray, i32 0, i64 %idxprom8, !dbg !180
  call void @Swap(i32* %arrayidx7, i32* %arrayidx9), !dbg !181
  br label %for.inc, !dbg !182

for.inc:                                          ; preds = %for.body
  %10 = load i32* %k, align 4, !dbg !183
  %dec = add nsw i32 %10, -1, !dbg !183
  store i32 %dec, i32* %k, align 4, !dbg !183
  br label %for.cond, !dbg !184

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !185

if.end:                                           ; preds = %for.end, %entry
  ret void, !dbg !186
}

; Function Attrs: nounwind uwtable
define void @Perm() #0 {
entry:
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !187, metadata !115), !dbg !188
  store i32 0, i32* @pctr, align 4, !dbg !189
  store i32 1, i32* %i, align 4, !dbg !190
  br label %for.cond, !dbg !190

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4, !dbg !192
  %cmp = icmp sle i32 %0, 5, !dbg !192
  br i1 %cmp, label %for.body, label %for.end, !dbg !196

for.body:                                         ; preds = %for.cond
  call void @Initialize(), !dbg !197
  call void @Permute(i32 7), !dbg !199
  br label %for.inc, !dbg !200

for.inc:                                          ; preds = %for.body
  %1 = load i32* %i, align 4, !dbg !201
  %inc = add nsw i32 %1, 1, !dbg !201
  store i32 %inc, i32* %i, align 4, !dbg !201
  br label %for.cond, !dbg !202

for.end:                                          ; preds = %for.cond
  %2 = load i32* @pctr, align 4, !dbg !203
  %cmp1 = icmp ne i32 %2, 43300, !dbg !203
  br i1 %cmp1, label %if.then, label %if.end, !dbg !205

if.then:                                          ; preds = %for.end
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0)), !dbg !206
  br label %if.end, !dbg !206

if.end:                                           ; preds = %if.then, %for.end
  %3 = load i32* @pctr, align 4, !dbg !207
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), i32 %3), !dbg !208
  ret void, !dbg !209
}

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  call void @llvm.dbg.declare(metadata i32* %i, metadata !210, metadata !115), !dbg !211
  store i32 0, i32* %i, align 4, !dbg !212
  br label %for.cond, !dbg !212

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4, !dbg !214
  %cmp = icmp slt i32 %0, 100, !dbg !214
  br i1 %cmp, label %for.body, label %for.end, !dbg !218

for.body:                                         ; preds = %for.cond
  call void @Perm(), !dbg !219
  br label %for.inc, !dbg !219

for.inc:                                          ; preds = %for.body
  %1 = load i32* %i, align 4, !dbg !221
  %inc = add nsw i32 %1, 1, !dbg !221
  store i32 %inc, i32* %i, align 4, !dbg !221
  br label %for.cond, !dbg !223

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !224
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!103, !104}
!llvm.ident = !{!105}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\000\00\000\00\001", !1, !2, !3, !5, !22, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perm.c] [DW_LANG_C99]
!1 = !{!"perm.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4}
!4 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!5 = !{!6, !10, !12, !16, !17, !20, !21}
!6 = !{!"0x2e\00Initrand\00Initrand\00\00115\000\001\000\000\000\000\00115", !1, !7, !8, null, void ()* @Initrand, null, null, !2} ; [ DW_TAG_subprogram ] [line 115] [def] [Initrand]
!7 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perm.c]
!8 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !9, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!9 = !{null}
!10 = !{!"0x2e\00Rand\00Rand\00\00119\000\001\000\000\000\000\00119", !1, !7, !11, null, i32 ()* @Rand, null, null, !2} ; [ DW_TAG_subprogram ] [line 119] [def] [Rand]
!11 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !3, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!12 = !{!"0x2e\00Swap\00Swap\00\00126\000\001\000\000\00256\000\00126", !1, !7, !13, null, void (i32*, i32*)* @Swap, null, null, !2} ; [ DW_TAG_subprogram ] [line 126] [def] [Swap]
!13 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !14, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = !{null, !15, !15}
!15 = !{!"0xf\00\000\0064\0064\000\000", null, null, !4} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!16 = !{!"0x2e\00Initialize\00Initialize\00\00131\000\001\000\000\000\000\00131", !1, !7, !8, null, void ()* @Initialize, null, null, !2} ; [ DW_TAG_subprogram ] [line 131] [def] [Initialize]
!17 = !{!"0x2e\00Permute\00Permute\00\00138\000\001\000\000\00256\000\00138", !1, !7, !18, null, void (i32)* @Permute, null, null, !2} ; [ DW_TAG_subprogram ] [line 138] [def] [Permute]
!18 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !19, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!19 = !{null, !4}
!20 = !{!"0x2e\00Perm\00Perm\00\00151\000\001\000\000\000\000\00151", !1, !7, !8, null, void ()* @Perm, null, null, !2} ; [ DW_TAG_subprogram ] [line 151] [def] [Perm]
!21 = !{!"0x2e\00main\00main\00\00163\000\001\000\000\000\000\00164", !1, !7, !11, null, i32 ()* @main, null, null, !2} ; [ DW_TAG_subprogram ] [line 163] [def] [scope 164] [main]
!22 = !{!23, !25, !26, !27, !29, !33, !35, !42, !46, !54, !55, !56, !60, !61, !62, !64, !65, !66, !67, !71, !72, !76, !79, !80, !81, !85, !86, !87, !88, !96, !97, !101, !102}
!23 = !{!"0x34\00value\00value\00\0081\000\001", null, !7, !24, float* @value, null} ; [ DW_TAG_variable ] [value] [line 81] [def]
!24 = !{!"0x24\00float\000\0032\0032\000\000\004", null, null} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!25 = !{!"0x34\00fixed\00fixed\00\0081\000\001", null, !7, !24, float* @fixed, null} ; [ DW_TAG_variable ] [fixed] [line 81] [def]
!26 = !{!"0x34\00floated\00floated\00\0081\000\001", null, !7, !24, float* @floated, null} ; [ DW_TAG_variable ] [floated] [line 81] [def]
!27 = !{!"0x34\00seed\00seed\00\0084\000\001", null, !7, !28, i64* @seed, null} ; [ DW_TAG_variable ] [seed] [line 84] [def]
!28 = !{!"0x24\00long int\000\0064\0064\000\000\005", null, null} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!29 = !{!"0x34\00permarray\00permarray\00\0087\000\001", null, !7, !30, [11 x i32]* @permarray, null} ; [ DW_TAG_variable ] [permarray] [line 87] [def]
!30 = !{!"0x1\00\000\00352\0032\000\000\000", null, null, !4, !31, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 352, align 32, offset 0] [from int]
!31 = !{!32}
!32 = !{!"0x21\000\0011"}                         ; [ DW_TAG_subrange_type ] [0, 10]
!33 = !{!"0x34\00pctr\00pctr\00\0089\000\001", null, !7, !34, i32* @pctr, null} ; [ DW_TAG_variable ] [pctr] [line 89] [def]
!34 = !{!"0x24\00unsigned int\000\0032\0032\000\000\007", null, null} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!35 = !{!"0x34\00tree\00tree\00\0092\000\001", null, !7, !36, %struct.node** @tree, null} ; [ DW_TAG_variable ] [tree] [line 92] [def]
!36 = !{!"0xf\00\000\0064\0064\000\000", null, null, !37} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from node]
!37 = !{!"0x13\00node\0045\00192\0064\000\000\000", !1, null, null, !38, null, null, null} ; [ DW_TAG_structure_type ] [node] [line 45, size 192, align 64, offset 0] [def] [from ]
!38 = !{!39, !40, !41}
!39 = !{!"0xd\00left\0046\0064\0064\000\000", !1, !37, !36} ; [ DW_TAG_member ] [left] [line 46, size 64, align 64, offset 0] [from ]
!40 = !{!"0xd\00right\0046\0064\0064\0064\000", !1, !37, !36} ; [ DW_TAG_member ] [right] [line 46, size 64, align 64, offset 64] [from ]
!41 = !{!"0xd\00val\0047\0032\0032\00128\000", !1, !37, !4} ; [ DW_TAG_member ] [val] [line 47, size 32, align 32, offset 128] [from int]
!42 = !{!"0x34\00stack\00stack\00\0095\000\001", null, !7, !43, [4 x i32]* @stack, null} ; [ DW_TAG_variable ] [stack] [line 95] [def]
!43 = !{!"0x1\00\000\00128\0032\000\000\000", null, null, !4, !44, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 128, align 32, offset 0] [from int]
!44 = !{!45}
!45 = !{!"0x21\000\004"}                          ; [ DW_TAG_subrange_type ] [0, 3]
!46 = !{!"0x34\00cellspace\00cellspace\00\0096\000\001", null, !7, !47, [19 x %struct.element]* @cellspace, null} ; [ DW_TAG_variable ] [cellspace] [line 96] [def]
!47 = !{!"0x1\00\000\001216\0032\000\000\000", null, null, !48, !52, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1216, align 32, offset 0] [from element]
!48 = !{!"0x13\00element\0054\0064\0032\000\000\000", !1, null, null, !49, null, null, null} ; [ DW_TAG_structure_type ] [element] [line 54, size 64, align 32, offset 0] [def] [from ]
!49 = !{!50, !51}
!50 = !{!"0xd\00discsize\0055\0032\0032\000\000", !1, !48, !4} ; [ DW_TAG_member ] [discsize] [line 55, size 32, align 32, offset 0] [from int]
!51 = !{!"0xd\00next\0056\0032\0032\0032\000", !1, !48, !4} ; [ DW_TAG_member ] [next] [line 56, size 32, align 32, offset 32] [from int]
!52 = !{!53}
!53 = !{!"0x21\000\0019"}                         ; [ DW_TAG_subrange_type ] [0, 18]
!54 = !{!"0x34\00freelist\00freelist\00\0097\000\001", null, !7, !4, i32* @freelist, null} ; [ DW_TAG_variable ] [freelist] [line 97] [def]
!55 = !{!"0x34\00movesdone\00movesdone\00\0097\000\001", null, !7, !4, i32* @movesdone, null} ; [ DW_TAG_variable ] [movesdone] [line 97] [def]
!56 = !{!"0x34\00ima\00ima\00\00101\000\001", null, !7, !57, [41 x [41 x i32]]* @ima, null} ; [ DW_TAG_variable ] [ima] [line 101] [def]
!57 = !{!"0x1\00\000\0053792\0032\000\000\000", null, null, !4, !58, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 53792, align 32, offset 0] [from int]
!58 = !{!59, !59}
!59 = !{!"0x21\000\0041"}                         ; [ DW_TAG_subrange_type ] [0, 40]
!60 = !{!"0x34\00imb\00imb\00\00101\000\001", null, !7, !57, [41 x [41 x i32]]* @imb, null} ; [ DW_TAG_variable ] [imb] [line 101] [def]
!61 = !{!"0x34\00imr\00imr\00\00101\000\001", null, !7, !57, [41 x [41 x i32]]* @imr, null} ; [ DW_TAG_variable ] [imr] [line 101] [def]
!62 = !{!"0x34\00rma\00rma\00\00102\000\001", null, !7, !63, [41 x [41 x float]]* @rma, null} ; [ DW_TAG_variable ] [rma] [line 102] [def]
!63 = !{!"0x1\00\000\0053792\0032\000\000\000", null, null, !24, !58, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 53792, align 32, offset 0] [from float]
!64 = !{!"0x34\00rmb\00rmb\00\00102\000\001", null, !7, !63, [41 x [41 x float]]* @rmb, null} ; [ DW_TAG_variable ] [rmb] [line 102] [def]
!65 = !{!"0x34\00rmr\00rmr\00\00102\000\001", null, !7, !63, [41 x [41 x float]]* @rmr, null} ; [ DW_TAG_variable ] [rmr] [line 102] [def]
!66 = !{!"0x34\00piececount\00piececount\00\00105\000\001", null, !7, !43, [4 x i32]* @piececount, null} ; [ DW_TAG_variable ] [piececount] [line 105] [def]
!67 = !{!"0x34\00class\00class\00\00105\000\001", null, !7, !68, [13 x i32]* @class, null} ; [ DW_TAG_variable ] [class] [line 105] [def]
!68 = !{!"0x1\00\000\00416\0032\000\000\000", null, null, !4, !69, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 416, align 32, offset 0] [from int]
!69 = !{!70}
!70 = !{!"0x21\000\0013"}                         ; [ DW_TAG_subrange_type ] [0, 12]
!71 = !{!"0x34\00piecemax\00piecemax\00\00105\000\001", null, !7, !68, [13 x i32]* @piecemax, null} ; [ DW_TAG_variable ] [piecemax] [line 105] [def]
!72 = !{!"0x34\00puzzl\00puzzl\00\00106\000\001", null, !7, !73, [512 x i32]* @puzzl, null} ; [ DW_TAG_variable ] [puzzl] [line 106] [def]
!73 = !{!"0x1\00\000\0016384\0032\000\000\000", null, null, !4, !74, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16384, align 32, offset 0] [from int]
!74 = !{!75}
!75 = !{!"0x21\000\00512"}                        ; [ DW_TAG_subrange_type ] [0, 511]
!76 = !{!"0x34\00p\00p\00\00106\000\001", null, !7, !77, [13 x [512 x i32]]* @p, null} ; [ DW_TAG_variable ] [p] [line 106] [def]
!77 = !{!"0x1\00\000\00212992\0032\000\000\000", null, null, !4, !78, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 212992, align 32, offset 0] [from int]
!78 = !{!70, !75}
!79 = !{!"0x34\00n\00n\00\00106\000\001", null, !7, !4, i32* @n, null} ; [ DW_TAG_variable ] [n] [line 106] [def]
!80 = !{!"0x34\00kount\00kount\00\00106\000\001", null, !7, !4, i32* @kount, null} ; [ DW_TAG_variable ] [kount] [line 106] [def]
!81 = !{!"0x34\00sortlist\00sortlist\00\00109\000\001", null, !7, !82, [5001 x i32]* @sortlist, null} ; [ DW_TAG_variable ] [sortlist] [line 109] [def]
!82 = !{!"0x1\00\000\00160032\0032\000\000\000", null, null, !4, !83, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 160032, align 32, offset 0] [from int]
!83 = !{!84}
!84 = !{!"0x21\000\005001"}                       ; [ DW_TAG_subrange_type ] [0, 5000]
!85 = !{!"0x34\00biggest\00biggest\00\00109\000\001", null, !7, !4, i32* @biggest, null} ; [ DW_TAG_variable ] [biggest] [line 109] [def]
!86 = !{!"0x34\00littlest\00littlest\00\00109\000\001", null, !7, !4, i32* @littlest, null} ; [ DW_TAG_variable ] [littlest] [line 109] [def]
!87 = !{!"0x34\00top\00top\00\00109\000\001", null, !7, !4, i32* @top, null} ; [ DW_TAG_variable ] [top] [line 109] [def]
!88 = !{!"0x34\00z\00z\00\00112\000\001", null, !7, !89, [257 x %struct.complex]* @z, null} ; [ DW_TAG_variable ] [z] [line 112] [def]
!89 = !{!"0x1\00\000\0016448\0032\000\000\000", null, null, !90, !94, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16448, align 32, offset 0] [from complex]
!90 = !{!"0x13\00complex\0075\0064\0032\000\000\000", !1, null, null, !91, null, null, null} ; [ DW_TAG_structure_type ] [complex] [line 75, size 64, align 32, offset 0] [def] [from ]
!91 = !{!92, !93}
!92 = !{!"0xd\00rp\0075\0032\0032\000\000", !1, !90, !24} ; [ DW_TAG_member ] [rp] [line 75, size 32, align 32, offset 0] [from float]
!93 = !{!"0xd\00ip\0075\0032\0032\0032\000", !1, !90, !24} ; [ DW_TAG_member ] [ip] [line 75, size 32, align 32, offset 32] [from float]
!94 = !{!95}
!95 = !{!"0x21\000\00257"}                        ; [ DW_TAG_subrange_type ] [0, 256]
!96 = !{!"0x34\00w\00w\00\00112\000\001", null, !7, !89, [257 x %struct.complex]* @w, null} ; [ DW_TAG_variable ] [w] [line 112] [def]
!97 = !{!"0x34\00e\00e\00\00112\000\001", null, !7, !98, [130 x %struct.complex]* @e, null} ; [ DW_TAG_variable ] [e] [line 112] [def]
!98 = !{!"0x1\00\000\008320\0032\000\000\000", null, null, !90, !99, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 8320, align 32, offset 0] [from complex]
!99 = !{!100}
!100 = !{!"0x21\000\00130"}                       ; [ DW_TAG_subrange_type ] [0, 129]
!101 = !{!"0x34\00zr\00zr\00\00113\000\001", null, !7, !24, float* @zr, null} ; [ DW_TAG_variable ] [zr] [line 113] [def]
!102 = !{!"0x34\00zi\00zi\00\00113\000\001", null, !7, !24, float* @zi, null} ; [ DW_TAG_variable ] [zi] [line 113] [def]
!103 = !{i32 2, !"Dwarf Version", i32 4}
!104 = !{i32 2, !"Debug Info Version", i32 2}
!105 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!106 = !MDLocation(line: 116, column: 5, scope: !6)
!107 = !MDLocation(line: 117, column: 1, scope: !6)
!108 = !MDLocation(line: 120, column: 13, scope: !10)
!109 = !MDLocation(line: 120, column: 12, scope: !10)
!110 = !MDLocation(line: 120, column: 5, scope: !10)
!111 = !MDLocation(line: 121, column: 18, scope: !10)
!112 = !MDLocation(line: 121, column: 13, scope: !10)
!113 = !MDLocation(line: 121, column: 5, scope: !10)
!114 = !{!"0x101\00a\0016777342\000", !12, !7, !15} ; [ DW_TAG_arg_variable ] [a] [line 126]
!115 = !{!"0x102"}                                ; [ DW_TAG_expression ]
!116 = !MDLocation(line: 126, column: 18, scope: !12)
!117 = !{!"0x101\00b\0033554558\000", !12, !7, !15} ; [ DW_TAG_arg_variable ] [b] [line 126]
!118 = !MDLocation(line: 126, column: 26, scope: !12)
!119 = !{!"0x100\00t\00127\000", !12, !7, !4}     ; [ DW_TAG_auto_variable ] [t] [line 127]
!120 = !MDLocation(line: 127, column: 6, scope: !12)
!121 = !MDLocation(line: 128, column: 7, scope: !12)
!122 = !MDLocation(line: 128, column: 6, scope: !12)
!123 = !MDLocation(line: 128, column: 2, scope: !12)
!124 = !MDLocation(line: 128, column: 17, scope: !12)
!125 = !MDLocation(line: 128, column: 16, scope: !12)
!126 = !MDLocation(line: 128, column: 12, scope: !12)
!127 = !MDLocation(line: 128, column: 11, scope: !12)
!128 = !MDLocation(line: 128, column: 26, scope: !12)
!129 = !MDLocation(line: 128, column: 22, scope: !12)
!130 = !MDLocation(line: 128, column: 21, scope: !12)
!131 = !MDLocation(line: 129, column: 1, scope: !12)
!132 = !{!"0x100\00i\00132\000", !16, !7, !4}     ; [ DW_TAG_auto_variable ] [i] [line 132]
!133 = !MDLocation(line: 132, column: 6, scope: !16)
!134 = !MDLocation(line: 133, column: 8, scope: !135)
!135 = !{!"0xb\00133\002\000", !1, !16}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perm.c]
!136 = !MDLocation(line: 133, column: 15, scope: !137)
!137 = !{!"0xb\002", !1, !138}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perm.c]
!138 = !{!"0xb\001", !1, !139}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perm.c]
!139 = !{!"0xb\00133\002\001", !1, !135}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perm.c]
!140 = !MDLocation(line: 133, column: 2, scope: !135)
!141 = !MDLocation(line: 134, column: 19, scope: !142)
!142 = !{!"0xb\00133\0029\002", !1, !139}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perm.c]
!143 = !MDLocation(line: 134, column: 16, scope: !142)
!144 = !MDLocation(line: 134, column: 6, scope: !142)
!145 = !MDLocation(line: 135, column: 2, scope: !142)
!146 = !MDLocation(line: 133, column: 23, scope: !139)
!147 = !MDLocation(line: 133, column: 2, scope: !139)
!148 = !MDLocation(line: 136, column: 1, scope: !16)
!149 = !{!"0x101\00n\0016777354\000", !17, !7, !4} ; [ DW_TAG_arg_variable ] [n] [line 138]
!150 = !MDLocation(line: 138, column: 19, scope: !17)
!151 = !{!"0x100\00k\00139\000", !17, !7, !4}     ; [ DW_TAG_auto_variable ] [k] [line 139]
!152 = !MDLocation(line: 139, column: 6, scope: !17)
!153 = !MDLocation(line: 140, column: 9, scope: !17)
!154 = !MDLocation(line: 140, column: 2, scope: !17)
!155 = !MDLocation(line: 141, column: 7, scope: !156)
!156 = !{!"0xb\00141\007\003", !1, !17}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perm.c]
!157 = !MDLocation(line: 141, column: 7, scope: !17)
!158 = !MDLocation(line: 142, column: 14, scope: !159)
!159 = !{!"0xb\00141\0015\004", !1, !156}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perm.c]
!160 = !MDLocation(line: 142, column: 6, scope: !159)
!161 = !MDLocation(line: 143, column: 16, scope: !162)
!162 = !{!"0xb\00143\006\005", !1, !159}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perm.c]
!163 = !MDLocation(line: 143, column: 12, scope: !162)
!164 = !MDLocation(line: 143, column: 21, scope: !165)
!165 = !{!"0xb\002", !1, !166}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perm.c]
!166 = !{!"0xb\001", !1, !167}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perm.c]
!167 = !{!"0xb\00143\006\006", !1, !162}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perm.c]
!168 = !MDLocation(line: 143, column: 6, scope: !162)
!169 = !MDLocation(line: 144, column: 20, scope: !170)
!170 = !{!"0xb\00143\0035\007", !1, !167}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perm.c]
!171 = !MDLocation(line: 144, column: 9, scope: !170)
!172 = !MDLocation(line: 144, column: 34, scope: !170)
!173 = !MDLocation(line: 144, column: 23, scope: !170)
!174 = !MDLocation(line: 144, column: 4, scope: !170)
!175 = !MDLocation(line: 145, column: 12, scope: !170)
!176 = !MDLocation(line: 145, column: 4, scope: !170)
!177 = !MDLocation(line: 146, column: 20, scope: !170)
!178 = !MDLocation(line: 146, column: 9, scope: !170)
!179 = !MDLocation(line: 146, column: 34, scope: !170)
!180 = !MDLocation(line: 146, column: 23, scope: !170)
!181 = !MDLocation(line: 146, column: 4, scope: !170)
!182 = !MDLocation(line: 147, column: 3, scope: !170)
!183 = !MDLocation(line: 143, column: 29, scope: !167)
!184 = !MDLocation(line: 143, column: 6, scope: !167)
!185 = !MDLocation(line: 148, column: 5, scope: !159)
!186 = !MDLocation(line: 149, column: 1, scope: !17)
!187 = !{!"0x100\00i\00152\000", !20, !7, !4}     ; [ DW_TAG_auto_variable ] [i] [line 152]
!188 = !MDLocation(line: 152, column: 9, scope: !20)
!189 = !MDLocation(line: 153, column: 5, scope: !20)
!190 = !MDLocation(line: 154, column: 11, scope: !191)
!191 = !{!"0xb\00154\005\008", !1, !20}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perm.c]
!192 = !MDLocation(line: 154, column: 18, scope: !193)
!193 = !{!"0xb\002", !1, !194}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perm.c]
!194 = !{!"0xb\001", !1, !195}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perm.c]
!195 = !{!"0xb\00154\005\009", !1, !191}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perm.c]
!196 = !MDLocation(line: 154, column: 5, scope: !191)
!197 = !MDLocation(line: 155, column: 3, scope: !198)
!198 = !{!"0xb\00154\0032\0010", !1, !195}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perm.c]
!199 = !MDLocation(line: 156, column: 3, scope: !198)
!200 = !MDLocation(line: 157, column: 2, scope: !198)
!201 = !MDLocation(line: 154, column: 26, scope: !195)
!202 = !MDLocation(line: 154, column: 5, scope: !195)
!203 = !MDLocation(line: 158, column: 10, scope: !204)
!204 = !{!"0xb\00158\0010\0011", !1, !20}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perm.c]
!205 = !MDLocation(line: 158, column: 10, scope: !20)
!206 = !MDLocation(line: 159, column: 2, scope: !204)
!207 = !MDLocation(line: 160, column: 17, scope: !20)
!208 = !MDLocation(line: 160, column: 2, scope: !20)
!209 = !MDLocation(line: 161, column: 1, scope: !20)
!210 = !{!"0x100\00i\00165\000", !21, !7, !4}     ; [ DW_TAG_auto_variable ] [i] [line 165]
!211 = !MDLocation(line: 165, column: 6, scope: !21)
!212 = !MDLocation(line: 166, column: 7, scope: !213)
!213 = !{!"0xb\00166\002\0012", !1, !21}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perm.c]
!214 = !MDLocation(line: 166, column: 14, scope: !215)
!215 = !{!"0xb\004", !1, !216}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perm.c]
!216 = !{!"0xb\001", !1, !217}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perm.c]
!217 = !{!"0xb\00166\002\0013", !1, !213}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perm.c]
!218 = !MDLocation(line: 166, column: 2, scope: !213)
!219 = !MDLocation(line: 166, column: 28, scope: !220)
!220 = !{!"0xb\002", !1, !217}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perm.c]
!221 = !MDLocation(line: 166, column: 23, scope: !222)
!222 = !{!"0xb\003", !1, !217}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perm.c]
!223 = !MDLocation(line: 166, column: 2, scope: !217)
!224 = !MDLocation(line: 167, column: 2, scope: !21)
