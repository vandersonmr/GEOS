; ModuleID = 'quicksort.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.node = type { %struct.node*, %struct.node*, i32 }
%struct.element = type { i32, i32 }
%struct.complex = type { float, float }

@seed = common global i64 0, align 8
@biggest = common global i32 0, align 4
@littlest = common global i32 0, align 4
@sortlist = common global [5001 x i32] zeroinitializer, align 16
@.str = private unnamed_addr constant [18 x i8] c" Error in Quick.\0A\00", align 1
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
@top = common global i32 0, align 4
@z = common global [257 x %struct.complex] zeroinitializer, align 16
@w = common global [257 x %struct.complex] zeroinitializer, align 16
@e = common global [130 x %struct.complex] zeroinitializer, align 16
@zr = common global float 0.000000e+00, align 4
@zi = common global float 0.000000e+00, align 4
@str = private unnamed_addr constant [17 x i8] c" Error in Quick.\00"

; Function Attrs: nounwind uwtable
define void @Initrand() #0 {
entry:
  store i64 74755, i64* @seed, align 8, !dbg !120, !tbaa !121
  ret void, !dbg !125
}

; Function Attrs: nounwind uwtable
define i32 @Rand() #0 {
entry:
  %0 = load i64* @seed, align 8, !dbg !126, !tbaa !121
  %mul = mul nsw i64 %0, 1309, !dbg !126
  %add = add nsw i64 %mul, 13849, !dbg !126
  %and = and i64 %add, 65535, !dbg !127
  store i64 %and, i64* @seed, align 8, !dbg !128, !tbaa !121
  %conv = trunc i64 %and to i32, !dbg !129
  ret i32 %conv, !dbg !130
}

; Function Attrs: nounwind uwtable
define void @Initarr() #0 {
entry:
  tail call void @Initrand(), !dbg !131
  store i32 0, i32* @biggest, align 4, !dbg !132, !tbaa !133
  store i32 0, i32* @littlest, align 4, !dbg !135, !tbaa !133
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !14, metadata !136), !dbg !137
  br label %for.body, !dbg !138

for.body:                                         ; preds = %for.inc, %entry
  %indvars.iv = phi i64 [ 1, %entry ], [ %indvars.iv.next, %for.inc ]
  %call = tail call i32 @Rand(), !dbg !140
  %conv = sext i32 %call to i64, !dbg !140
  tail call void @llvm.dbg.value(metadata i64 %conv, i64 0, metadata !15, metadata !136), !dbg !143
  %div = srem i64 %conv, 100000, !dbg !144
  %sub1 = add i64 %div, 4294917296, !dbg !145
  %conv2 = trunc i64 %sub1 to i32, !dbg !146
  %arrayidx = getelementptr inbounds [5001 x i32]* @sortlist, i64 0, i64 %indvars.iv, !dbg !147
  store i32 %conv2, i32* %arrayidx, align 4, !dbg !147, !tbaa !133
  %0 = load i32* @biggest, align 4, !dbg !148, !tbaa !133
  %cmp5 = icmp sgt i32 %conv2, %0, !dbg !150
  br i1 %cmp5, label %if.then, label %if.else, !dbg !151

if.then:                                          ; preds = %for.body
  store i32 %conv2, i32* @biggest, align 4, !dbg !152, !tbaa !133
  br label %for.inc, !dbg !152

if.else:                                          ; preds = %for.body
  %1 = load i32* @littlest, align 4, !dbg !153, !tbaa !133
  %cmp11 = icmp slt i32 %conv2, %1, !dbg !155
  br i1 %cmp11, label %if.then13, label %for.inc, !dbg !156

if.then13:                                        ; preds = %if.else
  store i32 %conv2, i32* @littlest, align 4, !dbg !157, !tbaa !133
  br label %for.inc, !dbg !157

for.inc:                                          ; preds = %if.then, %if.then13, %if.else
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !138
  %exitcond = icmp eq i64 %indvars.iv.next, 5001, !dbg !138
  br i1 %exitcond, label %for.end, label %for.body, !dbg !138

for.end:                                          ; preds = %for.inc
  ret void, !dbg !158
}

; Function Attrs: nounwind uwtable
define void @Quicksort(i32* %a, i32 %l, i32 %r) #0 {
entry:
  br label %tailrecurse

tailrecurse:                                      ; preds = %if.end24, %entry
  %l.tr = phi i32 [ %l, %entry ], [ %i.1, %if.end24 ]
  tail call void @llvm.dbg.value(metadata i32* %a, i64 0, metadata !22, metadata !136), !dbg !159
  tail call void @llvm.dbg.value(metadata i32 %l.tr, i64 0, metadata !23, metadata !136), !dbg !160
  tail call void @llvm.dbg.value(metadata i32 %r, i64 0, metadata !24, metadata !136), !dbg !161
  tail call void @llvm.dbg.value(metadata i32 %l.tr, i64 0, metadata !25, metadata !136), !dbg !162
  tail call void @llvm.dbg.value(metadata i32 %r, i64 0, metadata !26, metadata !136), !dbg !163
  %add = add nsw i32 %l.tr, %r, !dbg !164
  %div = sdiv i32 %add, 2, !dbg !165
  %idxprom = sext i32 %div to i64, !dbg !166
  %arrayidx = getelementptr inbounds i32* %a, i64 %idxprom, !dbg !166
  %0 = load i32* %arrayidx, align 4, !dbg !166, !tbaa !133
  tail call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !27, metadata !136), !dbg !167
  br label %while.cond.outer, !dbg !168

while.cond.outer:                                 ; preds = %do.cond, %tailrecurse
  %j.0.ph = phi i32 [ %j.2, %do.cond ], [ %r, %tailrecurse ]
  %i.0.ph = phi i32 [ %i.1, %do.cond ], [ %l.tr, %tailrecurse ]
  %1 = sext i32 %i.0.ph to i64
  br label %while.cond

while.cond:                                       ; preds = %while.cond, %while.cond.outer
  %indvars.iv = phi i64 [ %indvars.iv.next, %while.cond ], [ %1, %while.cond.outer ]
  %arrayidx2 = getelementptr inbounds i32* %a, i64 %indvars.iv, !dbg !169
  %2 = load i32* %arrayidx2, align 4, !dbg !169, !tbaa !133
  %cmp = icmp slt i32 %2, %0, !dbg !169
  %indvars.iv.next = add nsw i64 %indvars.iv, 1, !dbg !171
  br i1 %cmp, label %while.cond, label %while.cond4.preheader, !dbg !171

while.cond4.preheader:                            ; preds = %while.cond
  %3 = sext i32 %j.0.ph to i64
  br label %while.cond4, !dbg !172

while.cond4:                                      ; preds = %while.cond4, %while.cond4.preheader
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %while.cond4 ], [ %3, %while.cond4.preheader ]
  %arrayidx6 = getelementptr inbounds i32* %a, i64 %indvars.iv59, !dbg !172
  %4 = load i32* %arrayidx6, align 4, !dbg !172, !tbaa !133
  %cmp7 = icmp slt i32 %0, %4, !dbg !173
  %indvars.iv.next60 = add nsw i64 %indvars.iv59, -1, !dbg !174
  br i1 %cmp7, label %while.cond4, label %while.end9, !dbg !174

while.end9:                                       ; preds = %while.cond4
  %5 = trunc i64 %indvars.iv to i32, !dbg !172
  %6 = trunc i64 %indvars.iv59 to i32, !dbg !175
  %cmp10 = icmp sgt i32 %5, %6, !dbg !175
  br i1 %cmp10, label %do.cond, label %if.then, !dbg !177

if.then:                                          ; preds = %while.end9
  %7 = load i32* %arrayidx2, align 4, !dbg !178, !tbaa !133
  tail call void @llvm.dbg.value(metadata i32 %7, i64 0, metadata !28, metadata !136), !dbg !180
  store i32 %4, i32* %arrayidx2, align 4, !dbg !181, !tbaa !133
  store i32 %7, i32* %arrayidx6, align 4, !dbg !182, !tbaa !133
  %add19 = add nsw i32 %5, 1, !dbg !183
  tail call void @llvm.dbg.value(metadata i32 %add19, i64 0, metadata !25, metadata !136), !dbg !162
  %sub20 = add nsw i32 %6, -1, !dbg !184
  tail call void @llvm.dbg.value(metadata i32 %sub20, i64 0, metadata !26, metadata !136), !dbg !163
  br label %do.cond, !dbg !185

do.cond:                                          ; preds = %while.end9, %if.then
  %j.2 = phi i32 [ %sub20, %if.then ], [ %6, %while.end9 ]
  %i.1 = phi i32 [ %add19, %if.then ], [ %5, %while.end9 ]
  %cmp21 = icmp sgt i32 %i.1, %j.2, !dbg !186
  br i1 %cmp21, label %do.end, label %while.cond.outer, !dbg !187

do.end:                                           ; preds = %do.cond
  %cmp22 = icmp sgt i32 %j.2, %l.tr, !dbg !188
  br i1 %cmp22, label %if.then23, label %if.end24, !dbg !190

if.then23:                                        ; preds = %do.end
  tail call void @Quicksort(i32* %a, i32 %l.tr, i32 %j.2), !dbg !191
  br label %if.end24, !dbg !191

if.end24:                                         ; preds = %if.then23, %do.end
  %cmp25 = icmp slt i32 %i.1, %r, !dbg !192
  br i1 %cmp25, label %tailrecurse, label %if.end27, !dbg !194

if.end27:                                         ; preds = %if.end24
  ret void, !dbg !195
}

; Function Attrs: nounwind uwtable
define void @Quick(i32 %run) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %run, i64 0, metadata !33, metadata !136), !dbg !196
  tail call void @Initarr(), !dbg !197
  tail call void @Quicksort(i32* getelementptr inbounds ([5001 x i32]* @sortlist, i64 0, i64 0), i32 1, i32 5000), !dbg !198
  %0 = load i32* getelementptr inbounds ([5001 x i32]* @sortlist, i64 0, i64 1), align 4, !dbg !199, !tbaa !133
  %1 = load i32* @littlest, align 4, !dbg !201, !tbaa !133
  %cmp = icmp eq i32 %0, %1, !dbg !199
  br i1 %cmp, label %lor.lhs.false, label %if.then, !dbg !202

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32* getelementptr inbounds ([5001 x i32]* @sortlist, i64 0, i64 5000), align 16, !dbg !203, !tbaa !133
  %3 = load i32* @biggest, align 4, !dbg !205, !tbaa !133
  %cmp1 = icmp eq i32 %2, %3, !dbg !206
  br i1 %cmp1, label %if.end, label %if.then, !dbg !202

if.then:                                          ; preds = %lor.lhs.false, %entry
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([17 x i8]* @str, i64 0, i64 0)), !dbg !207
  br label %if.end, !dbg !207

if.end:                                           ; preds = %lor.lhs.false, %if.then
  %add = add nsw i32 %run, 1, !dbg !210
  %idxprom = sext i32 %add to i64, !dbg !211
  %arrayidx = getelementptr inbounds [5001 x i32]* @sortlist, i64 0, i64 %idxprom, !dbg !211
  %4 = load i32* %arrayidx, align 4, !dbg !211, !tbaa !133
  %call2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i64 0, i64 0), i32 %4) #3, !dbg !212
  ret void, !dbg !213
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !36, metadata !136), !dbg !214
  br label %for.body, !dbg !215

for.body:                                         ; preds = %for.body, %entry
  %i.03 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  tail call void @Quick(i32 %i.03), !dbg !217
  %inc = add nuw nsw i32 %i.03, 1, !dbg !219
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !36, metadata !136), !dbg !214
  %exitcond = icmp eq i32 %inc, 100, !dbg !215
  br i1 %exitcond, label %for.end, label %for.body, !dbg !215

for.end:                                          ; preds = %for.body
  ret i32 0, !dbg !221
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #2

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!117, !118}
!llvm.ident = !{!119}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !5, !37, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/quicksort.c] [DW_LANG_C99]
!1 = !{!"quicksort.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4}
!4 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!5 = !{!6, !10, !12, !17, !29, !34}
!6 = !{!"0x2e\00Initrand\00Initrand\00\00115\000\001\000\000\000\001\00115", !1, !7, !8, null, void ()* @Initrand, null, null, !2} ; [ DW_TAG_subprogram ] [line 115] [def] [Initrand]
!7 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/quicksort.c]
!8 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !9, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!9 = !{null}
!10 = !{!"0x2e\00Rand\00Rand\00\00119\000\001\000\000\000\001\00119", !1, !7, !11, null, i32 ()* @Rand, null, null, !2} ; [ DW_TAG_subprogram ] [line 119] [def] [Rand]
!11 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !3, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!12 = !{!"0x2e\00Initarr\00Initarr\00\00126\000\001\000\000\000\001\00126", !1, !7, !8, null, void ()* @Initarr, null, null, !13} ; [ DW_TAG_subprogram ] [line 126] [def] [Initarr]
!13 = !{!14, !15}
!14 = !{!"0x100\00i\00127\000", !12, !7, !4}      ; [ DW_TAG_auto_variable ] [i] [line 127]
!15 = !{!"0x100\00temp\00128\000", !12, !7, !16}  ; [ DW_TAG_auto_variable ] [temp] [line 128]
!16 = !{!"0x24\00long int\000\0064\0064\000\000\005", null, null} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!17 = !{!"0x2e\00Quicksort\00Quicksort\00\00140\000\001\000\000\00256\001\00140", !1, !7, !18, null, void (i32*, i32, i32)* @Quicksort, null, null, !21} ; [ DW_TAG_subprogram ] [line 140] [def] [Quicksort]
!18 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !19, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!19 = !{null, !20, !4, !4}
!20 = !{!"0xf\00\000\0064\0064\000\000", null, null, !4} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!21 = !{!22, !23, !24, !25, !26, !27, !28}
!22 = !{!"0x101\00a\0016777356\000", !17, !7, !20} ; [ DW_TAG_arg_variable ] [a] [line 140]
!23 = !{!"0x101\00l\0033554572\000", !17, !7, !4} ; [ DW_TAG_arg_variable ] [l] [line 140]
!24 = !{!"0x101\00r\0050331788\000", !17, !7, !4} ; [ DW_TAG_arg_variable ] [r] [line 140]
!25 = !{!"0x100\00i\00142\000", !17, !7, !4}      ; [ DW_TAG_auto_variable ] [i] [line 142]
!26 = !{!"0x100\00j\00142\000", !17, !7, !4}      ; [ DW_TAG_auto_variable ] [j] [line 142]
!27 = !{!"0x100\00x\00142\000", !17, !7, !4}      ; [ DW_TAG_auto_variable ] [x] [line 142]
!28 = !{!"0x100\00w\00142\000", !17, !7, !4}      ; [ DW_TAG_auto_variable ] [w] [line 142]
!29 = !{!"0x2e\00Quick\00Quick\00\00161\000\001\000\000\00256\001\00161", !1, !7, !30, null, void (i32)* @Quick, null, null, !32} ; [ DW_TAG_subprogram ] [line 161] [def] [Quick]
!30 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !31, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!31 = !{null, !4}
!32 = !{!33}
!33 = !{!"0x101\00run\0016777377\000", !29, !7, !4} ; [ DW_TAG_arg_variable ] [run] [line 161]
!34 = !{!"0x2e\00main\00main\00\00168\000\001\000\000\000\001\00169", !1, !7, !11, null, i32 ()* @main, null, null, !35} ; [ DW_TAG_subprogram ] [line 168] [def] [scope 169] [main]
!35 = !{!36}
!36 = !{!"0x100\00i\00170\000", !34, !7, !4}      ; [ DW_TAG_auto_variable ] [i] [line 170]
!37 = !{!38, !40, !41, !42, !43, !47, !49, !56, !60, !68, !69, !70, !74, !75, !76, !78, !79, !80, !81, !85, !86, !90, !93, !94, !95, !99, !100, !101, !102, !110, !111, !115, !116}
!38 = !{!"0x34\00value\00value\00\0081\000\001", null, !7, !39, float* @value, null} ; [ DW_TAG_variable ] [value] [line 81] [def]
!39 = !{!"0x24\00float\000\0032\0032\000\000\004", null, null} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!40 = !{!"0x34\00fixed\00fixed\00\0081\000\001", null, !7, !39, float* @fixed, null} ; [ DW_TAG_variable ] [fixed] [line 81] [def]
!41 = !{!"0x34\00floated\00floated\00\0081\000\001", null, !7, !39, float* @floated, null} ; [ DW_TAG_variable ] [floated] [line 81] [def]
!42 = !{!"0x34\00seed\00seed\00\0084\000\001", null, !7, !16, i64* @seed, null} ; [ DW_TAG_variable ] [seed] [line 84] [def]
!43 = !{!"0x34\00permarray\00permarray\00\0087\000\001", null, !7, !44, [11 x i32]* @permarray, null} ; [ DW_TAG_variable ] [permarray] [line 87] [def]
!44 = !{!"0x1\00\000\00352\0032\000\000\000", null, null, !4, !45, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 352, align 32, offset 0] [from int]
!45 = !{!46}
!46 = !{!"0x21\000\0011"}                         ; [ DW_TAG_subrange_type ] [0, 10]
!47 = !{!"0x34\00pctr\00pctr\00\0089\000\001", null, !7, !48, i32* @pctr, null} ; [ DW_TAG_variable ] [pctr] [line 89] [def]
!48 = !{!"0x24\00unsigned int\000\0032\0032\000\000\007", null, null} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!49 = !{!"0x34\00tree\00tree\00\0092\000\001", null, !7, !50, %struct.node** @tree, null} ; [ DW_TAG_variable ] [tree] [line 92] [def]
!50 = !{!"0xf\00\000\0064\0064\000\000", null, null, !51} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from node]
!51 = !{!"0x13\00node\0045\00192\0064\000\000\000", !1, null, null, !52, null, null, null} ; [ DW_TAG_structure_type ] [node] [line 45, size 192, align 64, offset 0] [def] [from ]
!52 = !{!53, !54, !55}
!53 = !{!"0xd\00left\0046\0064\0064\000\000", !1, !51, !50} ; [ DW_TAG_member ] [left] [line 46, size 64, align 64, offset 0] [from ]
!54 = !{!"0xd\00right\0046\0064\0064\0064\000", !1, !51, !50} ; [ DW_TAG_member ] [right] [line 46, size 64, align 64, offset 64] [from ]
!55 = !{!"0xd\00val\0047\0032\0032\00128\000", !1, !51, !4} ; [ DW_TAG_member ] [val] [line 47, size 32, align 32, offset 128] [from int]
!56 = !{!"0x34\00stack\00stack\00\0095\000\001", null, !7, !57, [4 x i32]* @stack, null} ; [ DW_TAG_variable ] [stack] [line 95] [def]
!57 = !{!"0x1\00\000\00128\0032\000\000\000", null, null, !4, !58, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 128, align 32, offset 0] [from int]
!58 = !{!59}
!59 = !{!"0x21\000\004"}                          ; [ DW_TAG_subrange_type ] [0, 3]
!60 = !{!"0x34\00cellspace\00cellspace\00\0096\000\001", null, !7, !61, [19 x %struct.element]* @cellspace, null} ; [ DW_TAG_variable ] [cellspace] [line 96] [def]
!61 = !{!"0x1\00\000\001216\0032\000\000\000", null, null, !62, !66, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1216, align 32, offset 0] [from element]
!62 = !{!"0x13\00element\0054\0064\0032\000\000\000", !1, null, null, !63, null, null, null} ; [ DW_TAG_structure_type ] [element] [line 54, size 64, align 32, offset 0] [def] [from ]
!63 = !{!64, !65}
!64 = !{!"0xd\00discsize\0055\0032\0032\000\000", !1, !62, !4} ; [ DW_TAG_member ] [discsize] [line 55, size 32, align 32, offset 0] [from int]
!65 = !{!"0xd\00next\0056\0032\0032\0032\000", !1, !62, !4} ; [ DW_TAG_member ] [next] [line 56, size 32, align 32, offset 32] [from int]
!66 = !{!67}
!67 = !{!"0x21\000\0019"}                         ; [ DW_TAG_subrange_type ] [0, 18]
!68 = !{!"0x34\00freelist\00freelist\00\0097\000\001", null, !7, !4, i32* @freelist, null} ; [ DW_TAG_variable ] [freelist] [line 97] [def]
!69 = !{!"0x34\00movesdone\00movesdone\00\0097\000\001", null, !7, !4, i32* @movesdone, null} ; [ DW_TAG_variable ] [movesdone] [line 97] [def]
!70 = !{!"0x34\00ima\00ima\00\00101\000\001", null, !7, !71, [41 x [41 x i32]]* @ima, null} ; [ DW_TAG_variable ] [ima] [line 101] [def]
!71 = !{!"0x1\00\000\0053792\0032\000\000\000", null, null, !4, !72, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 53792, align 32, offset 0] [from int]
!72 = !{!73, !73}
!73 = !{!"0x21\000\0041"}                         ; [ DW_TAG_subrange_type ] [0, 40]
!74 = !{!"0x34\00imb\00imb\00\00101\000\001", null, !7, !71, [41 x [41 x i32]]* @imb, null} ; [ DW_TAG_variable ] [imb] [line 101] [def]
!75 = !{!"0x34\00imr\00imr\00\00101\000\001", null, !7, !71, [41 x [41 x i32]]* @imr, null} ; [ DW_TAG_variable ] [imr] [line 101] [def]
!76 = !{!"0x34\00rma\00rma\00\00102\000\001", null, !7, !77, [41 x [41 x float]]* @rma, null} ; [ DW_TAG_variable ] [rma] [line 102] [def]
!77 = !{!"0x1\00\000\0053792\0032\000\000\000", null, null, !39, !72, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 53792, align 32, offset 0] [from float]
!78 = !{!"0x34\00rmb\00rmb\00\00102\000\001", null, !7, !77, [41 x [41 x float]]* @rmb, null} ; [ DW_TAG_variable ] [rmb] [line 102] [def]
!79 = !{!"0x34\00rmr\00rmr\00\00102\000\001", null, !7, !77, [41 x [41 x float]]* @rmr, null} ; [ DW_TAG_variable ] [rmr] [line 102] [def]
!80 = !{!"0x34\00piececount\00piececount\00\00105\000\001", null, !7, !57, [4 x i32]* @piececount, null} ; [ DW_TAG_variable ] [piececount] [line 105] [def]
!81 = !{!"0x34\00class\00class\00\00105\000\001", null, !7, !82, [13 x i32]* @class, null} ; [ DW_TAG_variable ] [class] [line 105] [def]
!82 = !{!"0x1\00\000\00416\0032\000\000\000", null, null, !4, !83, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 416, align 32, offset 0] [from int]
!83 = !{!84}
!84 = !{!"0x21\000\0013"}                         ; [ DW_TAG_subrange_type ] [0, 12]
!85 = !{!"0x34\00piecemax\00piecemax\00\00105\000\001", null, !7, !82, [13 x i32]* @piecemax, null} ; [ DW_TAG_variable ] [piecemax] [line 105] [def]
!86 = !{!"0x34\00puzzl\00puzzl\00\00106\000\001", null, !7, !87, [512 x i32]* @puzzl, null} ; [ DW_TAG_variable ] [puzzl] [line 106] [def]
!87 = !{!"0x1\00\000\0016384\0032\000\000\000", null, null, !4, !88, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16384, align 32, offset 0] [from int]
!88 = !{!89}
!89 = !{!"0x21\000\00512"}                        ; [ DW_TAG_subrange_type ] [0, 511]
!90 = !{!"0x34\00p\00p\00\00106\000\001", null, !7, !91, [13 x [512 x i32]]* @p, null} ; [ DW_TAG_variable ] [p] [line 106] [def]
!91 = !{!"0x1\00\000\00212992\0032\000\000\000", null, null, !4, !92, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 212992, align 32, offset 0] [from int]
!92 = !{!84, !89}
!93 = !{!"0x34\00n\00n\00\00106\000\001", null, !7, !4, i32* @n, null} ; [ DW_TAG_variable ] [n] [line 106] [def]
!94 = !{!"0x34\00kount\00kount\00\00106\000\001", null, !7, !4, i32* @kount, null} ; [ DW_TAG_variable ] [kount] [line 106] [def]
!95 = !{!"0x34\00sortlist\00sortlist\00\00109\000\001", null, !7, !96, [5001 x i32]* @sortlist, null} ; [ DW_TAG_variable ] [sortlist] [line 109] [def]
!96 = !{!"0x1\00\000\00160032\0032\000\000\000", null, null, !4, !97, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 160032, align 32, offset 0] [from int]
!97 = !{!98}
!98 = !{!"0x21\000\005001"}                       ; [ DW_TAG_subrange_type ] [0, 5000]
!99 = !{!"0x34\00biggest\00biggest\00\00109\000\001", null, !7, !4, i32* @biggest, null} ; [ DW_TAG_variable ] [biggest] [line 109] [def]
!100 = !{!"0x34\00littlest\00littlest\00\00109\000\001", null, !7, !4, i32* @littlest, null} ; [ DW_TAG_variable ] [littlest] [line 109] [def]
!101 = !{!"0x34\00top\00top\00\00109\000\001", null, !7, !4, i32* @top, null} ; [ DW_TAG_variable ] [top] [line 109] [def]
!102 = !{!"0x34\00z\00z\00\00112\000\001", null, !7, !103, [257 x %struct.complex]* @z, null} ; [ DW_TAG_variable ] [z] [line 112] [def]
!103 = !{!"0x1\00\000\0016448\0032\000\000\000", null, null, !104, !108, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16448, align 32, offset 0] [from complex]
!104 = !{!"0x13\00complex\0075\0064\0032\000\000\000", !1, null, null, !105, null, null, null} ; [ DW_TAG_structure_type ] [complex] [line 75, size 64, align 32, offset 0] [def] [from ]
!105 = !{!106, !107}
!106 = !{!"0xd\00rp\0075\0032\0032\000\000", !1, !104, !39} ; [ DW_TAG_member ] [rp] [line 75, size 32, align 32, offset 0] [from float]
!107 = !{!"0xd\00ip\0075\0032\0032\0032\000", !1, !104, !39} ; [ DW_TAG_member ] [ip] [line 75, size 32, align 32, offset 32] [from float]
!108 = !{!109}
!109 = !{!"0x21\000\00257"}                       ; [ DW_TAG_subrange_type ] [0, 256]
!110 = !{!"0x34\00w\00w\00\00112\000\001", null, !7, !103, [257 x %struct.complex]* @w, null} ; [ DW_TAG_variable ] [w] [line 112] [def]
!111 = !{!"0x34\00e\00e\00\00112\000\001", null, !7, !112, [130 x %struct.complex]* @e, null} ; [ DW_TAG_variable ] [e] [line 112] [def]
!112 = !{!"0x1\00\000\008320\0032\000\000\000", null, null, !104, !113, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 8320, align 32, offset 0] [from complex]
!113 = !{!114}
!114 = !{!"0x21\000\00130"}                       ; [ DW_TAG_subrange_type ] [0, 129]
!115 = !{!"0x34\00zr\00zr\00\00113\000\001", null, !7, !39, float* @zr, null} ; [ DW_TAG_variable ] [zr] [line 113] [def]
!116 = !{!"0x34\00zi\00zi\00\00113\000\001", null, !7, !39, float* @zi, null} ; [ DW_TAG_variable ] [zi] [line 113] [def]
!117 = !{i32 2, !"Dwarf Version", i32 4}
!118 = !{i32 2, !"Debug Info Version", i32 2}
!119 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!120 = !MDLocation(line: 116, column: 5, scope: !6)
!121 = !{!122, !122, i64 0}
!122 = !{!"long", !123, i64 0}
!123 = !{!"omnipotent char", !124, i64 0}
!124 = !{!"Simple C/C++ TBAA"}
!125 = !MDLocation(line: 117, column: 1, scope: !6)
!126 = !MDLocation(line: 120, column: 13, scope: !10)
!127 = !MDLocation(line: 120, column: 12, scope: !10)
!128 = !MDLocation(line: 120, column: 5, scope: !10)
!129 = !MDLocation(line: 121, column: 13, scope: !10)
!130 = !MDLocation(line: 121, column: 5, scope: !10)
!131 = !MDLocation(line: 129, column: 2, scope: !12)
!132 = !MDLocation(line: 130, column: 2, scope: !12)
!133 = !{!134, !134, i64 0}
!134 = !{!"int", !123, i64 0}
!135 = !MDLocation(line: 130, column: 15, scope: !12)
!136 = !{!"0x102"}                                ; [ DW_TAG_expression ]
!137 = !MDLocation(line: 127, column: 6, scope: !12)
!138 = !MDLocation(line: 131, column: 2, scope: !139)
!139 = !{!"0xb\00131\002\000", !1, !12}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/quicksort.c]
!140 = !MDLocation(line: 132, column: 13, scope: !141)
!141 = !{!"0xb\00131\0040\002", !1, !142}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/quicksort.c]
!142 = !{!"0xb\00131\002\001", !1, !139}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/quicksort.c]
!143 = !MDLocation(line: 128, column: 7, scope: !12)
!144 = !MDLocation(line: 134, column: 33, scope: !141)
!145 = !MDLocation(line: 134, column: 26, scope: !141)
!146 = !MDLocation(line: 134, column: 20, scope: !141)
!147 = !MDLocation(line: 134, column: 6, scope: !141)
!148 = !MDLocation(line: 135, column: 25, scope: !149)
!149 = !{!"0xb\00135\0011\003", !1, !141}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/quicksort.c]
!150 = !MDLocation(line: 135, column: 11, scope: !149)
!151 = !MDLocation(line: 135, column: 11, scope: !141)
!152 = !MDLocation(line: 135, column: 35, scope: !149)
!153 = !MDLocation(line: 136, column: 30, scope: !154)
!154 = !{!"0xb\00136\0016\004", !1, !149}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/quicksort.c]
!155 = !MDLocation(line: 136, column: 16, scope: !154)
!156 = !MDLocation(line: 136, column: 16, scope: !149)
!157 = !MDLocation(line: 136, column: 41, scope: !154)
!158 = !MDLocation(line: 138, column: 1, scope: !12)
!159 = !MDLocation(line: 140, column: 21, scope: !17)
!160 = !MDLocation(line: 140, column: 30, scope: !17)
!161 = !MDLocation(line: 140, column: 37, scope: !17)
!162 = !MDLocation(line: 142, column: 6, scope: !17)
!163 = !MDLocation(line: 142, column: 8, scope: !17)
!164 = !MDLocation(line: 145, column: 7, scope: !17)
!165 = !MDLocation(line: 145, column: 6, scope: !17)
!166 = !MDLocation(line: 145, column: 4, scope: !17)
!167 = !MDLocation(line: 142, column: 10, scope: !17)
!168 = !MDLocation(line: 146, column: 2, scope: !17)
!169 = !MDLocation(line: 147, column: 14, scope: !170)
!170 = !{!"0xb\00146\005\005", !1, !17}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/quicksort.c]
!171 = !MDLocation(line: 147, column: 6, scope: !170)
!172 = !MDLocation(line: 148, column: 16, scope: !170)
!173 = !MDLocation(line: 148, column: 14, scope: !170)
!174 = !MDLocation(line: 148, column: 6, scope: !170)
!175 = !MDLocation(line: 149, column: 11, scope: !176)
!176 = !{!"0xb\00149\0011\006", !1, !170}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/quicksort.c]
!177 = !MDLocation(line: 149, column: 11, scope: !170)
!178 = !MDLocation(line: 150, column: 8, scope: !179)
!179 = !{!"0xb\00149\0018\007", !1, !176}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/quicksort.c]
!180 = !MDLocation(line: 142, column: 12, scope: !17)
!181 = !MDLocation(line: 151, column: 4, scope: !179)
!182 = !MDLocation(line: 152, column: 4, scope: !179)
!183 = !MDLocation(line: 153, column: 8, scope: !179)
!184 = !MDLocation(line: 153, column: 19, scope: !179)
!185 = !MDLocation(line: 154, column: 3, scope: !179)
!186 = !MDLocation(line: 155, column: 12, scope: !17)
!187 = !MDLocation(line: 155, column: 2, scope: !170)
!188 = !MDLocation(line: 156, column: 7, scope: !189)
!189 = !{!"0xb\00156\007\008", !1, !17}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/quicksort.c]
!190 = !MDLocation(line: 156, column: 7, scope: !17)
!191 = !MDLocation(line: 156, column: 14, scope: !189)
!192 = !MDLocation(line: 157, column: 7, scope: !193)
!193 = !{!"0xb\00157\007\009", !1, !17}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/quicksort.c]
!194 = !MDLocation(line: 157, column: 7, scope: !17)
!195 = !MDLocation(line: 158, column: 1, scope: !17)
!196 = !MDLocation(line: 161, column: 17, scope: !29)
!197 = !MDLocation(line: 162, column: 5, scope: !29)
!198 = !MDLocation(line: 163, column: 5, scope: !29)
!199 = !MDLocation(line: 164, column: 11, scope: !200)
!200 = !{!"0xb\00164\0010\0010", !1, !29}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/quicksort.c]
!201 = !MDLocation(line: 164, column: 26, scope: !200)
!202 = !MDLocation(line: 164, column: 10, scope: !29)
!203 = !MDLocation(line: 164, column: 40, scope: !204)
!204 = !{!"0xb\002", !1, !200}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/quicksort.c]
!205 = !MDLocation(line: 164, column: 66, scope: !200)
!206 = !MDLocation(line: 164, column: 40, scope: !200)
!207 = !MDLocation(line: 164, column: 77, scope: !208)
!208 = !{!"0xb\003", !1, !209}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/quicksort.c]
!209 = !{!"0xb\001", !1, !200}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/quicksort.c]
!210 = !MDLocation(line: 165, column: 28, scope: !29)
!211 = !MDLocation(line: 165, column: 19, scope: !29)
!212 = !MDLocation(line: 165, column: 4, scope: !29)
!213 = !MDLocation(line: 166, column: 1, scope: !29)
!214 = !MDLocation(line: 170, column: 6, scope: !34)
!215 = !MDLocation(line: 171, column: 2, scope: !216)
!216 = !{!"0xb\00171\002\0011", !1, !34}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/quicksort.c]
!217 = !MDLocation(line: 171, column: 28, scope: !218)
!218 = !{!"0xb\00171\002\0012", !1, !216}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/quicksort.c]
!219 = !MDLocation(line: 171, column: 23, scope: !220)
!220 = !{!"0xb\003", !1, !218}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/quicksort.c]
!221 = !MDLocation(line: 172, column: 2, scope: !34)
