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
@str = private unnamed_addr constant [18 x i8] c"Error3 in Bubble.\00"

; Function Attrs: nounwind uwtable
define void @Initrand() #0 {
entry:
  store i64 74755, i64* @seed, align 8, !dbg !110, !tbaa !111
  ret void, !dbg !115
}

; Function Attrs: nounwind uwtable
define i32 @Rand() #0 {
entry:
  %0 = load i64* @seed, align 8, !dbg !116, !tbaa !111
  %mul = mul nsw i64 %0, 1309, !dbg !116
  %add = add nsw i64 %mul, 13849, !dbg !116
  %and = and i64 %add, 65535, !dbg !117
  store i64 %and, i64* @seed, align 8, !dbg !118, !tbaa !111
  %conv = trunc i64 %and to i32, !dbg !119
  ret i32 %conv, !dbg !120
}

; Function Attrs: nounwind uwtable
define void @bInitarr() #0 {
entry:
  store i64 74755, i64* @seed, align 8, !dbg !121, !tbaa !111
  store i32 0, i32* @biggest, align 4, !dbg !123, !tbaa !124
  store i32 0, i32* @littlest, align 4, !dbg !126, !tbaa !124
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !14, metadata !127), !dbg !128
  br label %for.body, !dbg !129

for.body:                                         ; preds = %for.inc, %entry
  %0 = phi i32 [ 0, %entry ], [ %2, %for.inc ]
  %1 = phi i32 [ 0, %entry ], [ %3, %for.inc ], !dbg !131
  %indvars.iv = phi i64 [ 1, %entry ], [ %indvars.iv.next, %for.inc ]
  %and.i25 = phi i64 [ 74755, %entry ], [ %and.i, %for.inc ], !dbg !131
  %mul.i = mul nuw nsw i64 %and.i25, 1309, !dbg !131
  %add.i = add nuw nsw i64 %mul.i, 13849, !dbg !131
  %and.i = and i64 %add.i, 65535, !dbg !135
  tail call void @llvm.dbg.value(metadata i64 %and.i, i64 0, metadata !15, metadata !127), !dbg !136
  %div = urem i64 %and.i, 100000, !dbg !137
  %sub1 = add nuw nsw i64 %div, 4294917296, !dbg !138
  %conv2 = trunc i64 %sub1 to i32, !dbg !139
  %arrayidx = getelementptr inbounds [5001 x i32]* @sortlist, i64 0, i64 %indvars.iv, !dbg !140
  store i32 %conv2, i32* %arrayidx, align 4, !dbg !140, !tbaa !124
  %cmp5 = icmp sgt i32 %conv2, %1, !dbg !141
  br i1 %cmp5, label %if.then, label %if.else, !dbg !143

if.then:                                          ; preds = %for.body
  store i32 %conv2, i32* @biggest, align 4, !dbg !144, !tbaa !124
  br label %for.inc, !dbg !144

if.else:                                          ; preds = %for.body
  %cmp11 = icmp slt i32 %conv2, %0, !dbg !145
  br i1 %cmp11, label %if.then13, label %for.inc, !dbg !147

if.then13:                                        ; preds = %if.else
  store i32 %conv2, i32* @littlest, align 4, !dbg !148, !tbaa !124
  br label %for.inc, !dbg !148

for.inc:                                          ; preds = %if.then, %if.then13, %if.else
  %2 = phi i32 [ %0, %if.then ], [ %conv2, %if.then13 ], [ %0, %if.else ]
  %3 = phi i32 [ %conv2, %if.then ], [ %1, %if.then13 ], [ %1, %if.else ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !129
  %exitcond = icmp eq i64 %indvars.iv.next, 501, !dbg !129
  br i1 %exitcond, label %for.end, label %for.body, !dbg !129

for.end:                                          ; preds = %for.inc
  %and.i.lcssa = phi i64 [ %and.i, %for.inc ]
  store i64 %and.i.lcssa, i64* @seed, align 8, !dbg !149, !tbaa !111
  ret void, !dbg !150
}

; Function Attrs: nounwind uwtable
define void @Bubble(i32 %run) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %run, i64 0, metadata !21, metadata !127), !dbg !151
  store i64 74755, i64* @seed, align 8, !dbg !152, !tbaa !111
  store i32 0, i32* @biggest, align 4, !dbg !155, !tbaa !124
  store i32 0, i32* @littlest, align 4, !dbg !156, !tbaa !124
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !157, metadata !127), !dbg !158
  br label %for.body.i, !dbg !159

for.body.i:                                       ; preds = %for.inc.i, %entry
  %0 = phi i32 [ 0, %entry ], [ %2, %for.inc.i ], !dbg !154
  %1 = phi i32 [ 0, %entry ], [ %3, %for.inc.i ], !dbg !160
  %indvars.iv.i = phi i64 [ 1, %entry ], [ %indvars.iv.next.i, %for.inc.i ], !dbg !154
  %and.i25.i = phi i64 [ 74755, %entry ], [ %and.i.i, %for.inc.i ], !dbg !160
  %mul.i.i = mul nuw nsw i64 %and.i25.i, 1309, !dbg !160
  %add.i.i = add nuw nsw i64 %mul.i.i, 13849, !dbg !160
  %and.i.i = and i64 %add.i.i, 65535, !dbg !162
  tail call void @llvm.dbg.value(metadata i64 %and.i.i, i64 0, metadata !163, metadata !127), !dbg !164
  %div.i = urem i64 %and.i.i, 100000, !dbg !165
  %sub1.i = add nuw nsw i64 %div.i, 4294917296, !dbg !166
  %conv2.i = trunc i64 %sub1.i to i32, !dbg !167
  %arrayidx.i = getelementptr inbounds [5001 x i32]* @sortlist, i64 0, i64 %indvars.iv.i, !dbg !168
  store i32 %conv2.i, i32* %arrayidx.i, align 4, !dbg !168, !tbaa !124
  %cmp5.i = icmp sgt i32 %conv2.i, %1, !dbg !169
  br i1 %cmp5.i, label %if.then.i, label %if.else.i, !dbg !170

if.then.i:                                        ; preds = %for.body.i
  store i32 %conv2.i, i32* @biggest, align 4, !dbg !171, !tbaa !124
  br label %for.inc.i, !dbg !171

if.else.i:                                        ; preds = %for.body.i
  %cmp11.i = icmp slt i32 %conv2.i, %0, !dbg !172
  br i1 %cmp11.i, label %if.then13.i, label %for.inc.i, !dbg !173

if.then13.i:                                      ; preds = %if.else.i
  store i32 %conv2.i, i32* @littlest, align 4, !dbg !174, !tbaa !124
  br label %for.inc.i, !dbg !174

for.inc.i:                                        ; preds = %if.then13.i, %if.else.i, %if.then.i
  %2 = phi i32 [ %0, %if.then.i ], [ %conv2.i, %if.then13.i ], [ %0, %if.else.i ], !dbg !154
  %3 = phi i32 [ %conv2.i, %if.then.i ], [ %1, %if.then13.i ], [ %1, %if.else.i ], !dbg !154
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !159
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, 501, !dbg !159
  br i1 %exitcond.i, label %bInitarr.exit, label %for.body.i, !dbg !159

bInitarr.exit:                                    ; preds = %for.inc.i
  %.lcssa39 = phi i32 [ %3, %for.inc.i ]
  %.lcssa = phi i32 [ %2, %for.inc.i ]
  %and.i.i.lcssa = phi i64 [ %and.i.i, %for.inc.i ]
  store i64 %and.i.i.lcssa, i64* @seed, align 8, !dbg !175, !tbaa !111
  store i32 500, i32* @top, align 4, !dbg !176, !tbaa !124
  br label %while.body3.lr.ph, !dbg !178

while.body3.lr.ph:                                ; preds = %while.end, %bInitarr.exit
  %indvar = phi i32 [ %indvar.next, %while.end ], [ 0, %bInitarr.exit ]
  %indvars.iv36 = phi i32 [ 500, %bInitarr.exit ], [ %indvars.iv.next37, %while.end ]
  %4 = mul i32 %indvar, -1, !dbg !179
  %5 = add i32 %4, 499, !dbg !179
  %.pre = load i32* getelementptr inbounds ([5001 x i32]* @sortlist, i64 0, i64 1), align 4, !dbg !179, !tbaa !124
  %xtraiter = and i32 %5, 1
  %lcmp.mod = icmp ne i32 %xtraiter, 0
  %lcmp.overflow = icmp eq i32 %5, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %while.body3.prol.preheader, label %while.body3.lr.ph.split

while.body3.prol.preheader:                       ; preds = %while.body3.lr.ph
  br label %while.body3.prol, !dbg !182

while.body3.prol:                                 ; preds = %while.body3.prol.preheader, %while.cond1.backedge.prol
  %6 = phi i32 [ %8, %while.cond1.backedge.prol ], [ %.pre, %while.body3.prol.preheader ], !dbg !179
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %while.cond1.backedge.prol ], [ 1, %while.body3.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %while.cond1.backedge.prol ], [ %xtraiter, %while.body3.prol.preheader ]
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1, !dbg !182
  %arrayidx5.prol = getelementptr inbounds [5001 x i32]* @sortlist, i64 0, i64 %indvars.iv.next.prol, !dbg !183
  %7 = load i32* %arrayidx5.prol, align 4, !dbg !183, !tbaa !124
  %cmp6.prol = icmp sgt i32 %6, %7, !dbg !179
  br i1 %cmp6.prol, label %if.then.prol, label %while.cond1.backedge.prol, !dbg !184

if.then.prol:                                     ; preds = %while.body3.prol
  %arrayidx.prol = getelementptr inbounds [5001 x i32]* @sortlist, i64 0, i64 %indvars.iv.prol, !dbg !179
  tail call void @llvm.dbg.value(metadata i32 %6, i64 0, metadata !23, metadata !127), !dbg !185
  store i32 %7, i32* %arrayidx.prol, align 4, !dbg !186, !tbaa !124
  store i32 %6, i32* %arrayidx5.prol, align 4, !dbg !188, !tbaa !124
  br label %while.cond1.backedge.prol, !dbg !189

while.cond1.backedge.prol:                        ; preds = %if.then.prol, %while.body3.prol
  %8 = phi i32 [ %6, %if.then.prol ], [ %7, %while.body3.prol ]
  %lftr.wideiv.prol = trunc i64 %indvars.iv.next.prol to i32, !dbg !182
  %exitcond.prol = icmp eq i32 %lftr.wideiv.prol, %indvars.iv36, !dbg !182
  %prol.iter.sub = sub i32 %prol.iter, 1, !dbg !182
  %prol.iter.cmp = icmp ne i32 %prol.iter.sub, 0, !dbg !182
  br i1 %prol.iter.cmp, label %while.body3.prol, label %while.body3.lr.ph.split.loopexit, !llvm.loop !190

while.body3.lr.ph.split.loopexit:                 ; preds = %while.cond1.backedge.prol
  %.unr.ph = phi i32 [ %8, %while.cond1.backedge.prol ]
  %indvars.iv.unr.ph = phi i64 [ %indvars.iv.next.prol, %while.cond1.backedge.prol ]
  br label %while.body3.lr.ph.split

while.body3.lr.ph.split:                          ; preds = %while.body3.lr.ph.split.loopexit, %while.body3.lr.ph
  %.unr = phi i32 [ %.pre, %while.body3.lr.ph ], [ %.unr.ph, %while.body3.lr.ph.split.loopexit ]
  %indvars.iv.unr = phi i64 [ 1, %while.body3.lr.ph ], [ %indvars.iv.unr.ph, %while.body3.lr.ph.split.loopexit ]
  %9 = icmp ult i32 %5, 2
  br i1 %9, label %while.end, label %while.body3.lr.ph.split.split

while.body3.lr.ph.split.split:                    ; preds = %while.body3.lr.ph.split
  br label %while.body3, !dbg !182

while.body3:                                      ; preds = %while.cond1.backedge.1, %while.body3.lr.ph.split.split
  %10 = phi i32 [ %.unr, %while.body3.lr.ph.split.split ], [ %17, %while.cond1.backedge.1 ], !dbg !179
  %indvars.iv = phi i64 [ %indvars.iv.unr, %while.body3.lr.ph.split.split ], [ %indvars.iv.next.1, %while.cond1.backedge.1 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !182
  %arrayidx5 = getelementptr inbounds [5001 x i32]* @sortlist, i64 0, i64 %indvars.iv.next, !dbg !183
  %11 = load i32* %arrayidx5, align 4, !dbg !183, !tbaa !124
  %cmp6 = icmp sgt i32 %10, %11, !dbg !179
  br i1 %cmp6, label %if.then, label %while.cond1.backedge, !dbg !184

if.then:                                          ; preds = %while.body3
  %arrayidx = getelementptr inbounds [5001 x i32]* @sortlist, i64 0, i64 %indvars.iv, !dbg !179
  tail call void @llvm.dbg.value(metadata i32 %10, i64 0, metadata !23, metadata !127), !dbg !185
  store i32 %11, i32* %arrayidx, align 4, !dbg !186, !tbaa !124
  store i32 %10, i32* %arrayidx5, align 4, !dbg !188, !tbaa !124
  br label %while.cond1.backedge, !dbg !189

while.cond1.backedge:                             ; preds = %if.then, %while.body3
  %12 = phi i32 [ %10, %if.then ], [ %11, %while.body3 ]
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !182
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv.next, 1, !dbg !182
  %arrayidx5.1 = getelementptr inbounds [5001 x i32]* @sortlist, i64 0, i64 %indvars.iv.next.1, !dbg !183
  %13 = load i32* %arrayidx5.1, align 4, !dbg !183, !tbaa !124
  %cmp6.1 = icmp sgt i32 %12, %13, !dbg !179
  br i1 %cmp6.1, label %if.then.1, label %while.cond1.backedge.1, !dbg !184

while.end.unr-lcssa:                              ; preds = %while.cond1.backedge.1
  br label %while.end

while.end:                                        ; preds = %while.body3.lr.ph.split, %while.end.unr-lcssa
  %indvars.iv.next37 = add nsw i32 %indvars.iv36, -1, !dbg !178
  %cmp = icmp sgt i32 %indvars.iv.next37, 1, !dbg !192
  %indvar.next = add i32 %indvar, 1, !dbg !178
  br i1 %cmp, label %while.body3.lr.ph, label %while.end18, !dbg !178

while.end18:                                      ; preds = %while.end
  store i32 1, i32* @top, align 4, !dbg !195, !tbaa !124
  %14 = load i32* getelementptr inbounds ([5001 x i32]* @sortlist, i64 0, i64 1), align 4, !dbg !196, !tbaa !124
  %cmp19 = icmp eq i32 %14, %.lcssa, !dbg !196
  %15 = load i32* getelementptr inbounds ([5001 x i32]* @sortlist, i64 0, i64 500), align 16
  %cmp20 = icmp eq i32 %15, %.lcssa39, !dbg !198
  %or.cond = and i1 %cmp19, %cmp20, !dbg !199
  br i1 %or.cond, label %if.end22, label %if.then21, !dbg !199

if.then21:                                        ; preds = %while.end18
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([18 x i8]* @str, i64 0, i64 0)), !dbg !200
  br label %if.end22, !dbg !200

if.end22:                                         ; preds = %while.end18, %if.then21
  %add23 = add nsw i32 %run, 1, !dbg !201
  %idxprom24 = sext i32 %add23 to i64, !dbg !202
  %arrayidx25 = getelementptr inbounds [5001 x i32]* @sortlist, i64 0, i64 %idxprom24, !dbg !202
  %16 = load i32* %arrayidx25, align 4, !dbg !202, !tbaa !124
  %call26 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i64 0, i64 0), i32 %16) #3, !dbg !203
  ret void, !dbg !204

if.then.1:                                        ; preds = %while.cond1.backedge
  %arrayidx.1 = getelementptr inbounds [5001 x i32]* @sortlist, i64 0, i64 %indvars.iv.next, !dbg !179
  tail call void @llvm.dbg.value(metadata i32 %10, i64 0, metadata !23, metadata !127), !dbg !185
  store i32 %13, i32* %arrayidx.1, align 4, !dbg !186, !tbaa !124
  store i32 %12, i32* %arrayidx5.1, align 4, !dbg !188, !tbaa !124
  br label %while.cond1.backedge.1, !dbg !189

while.cond1.backedge.1:                           ; preds = %if.then.1, %while.cond1.backedge
  %17 = phi i32 [ %12, %if.then.1 ], [ %13, %while.cond1.backedge ]
  %lftr.wideiv.1 = trunc i64 %indvars.iv.next.1 to i32, !dbg !182
  %exitcond.1 = icmp eq i32 %lftr.wideiv.1, %indvars.iv36, !dbg !182
  br i1 %exitcond.1, label %while.end.unr-lcssa, label %while.body3, !dbg !182
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !26, metadata !127), !dbg !205
  br label %for.body, !dbg !206

for.body:                                         ; preds = %for.body, %entry
  %i.03 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  tail call void @Bubble(i32 %i.03), !dbg !208
  %inc = add nuw nsw i32 %i.03, 1, !dbg !210
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !26, metadata !127), !dbg !205
  %exitcond = icmp eq i32 %inc, 100, !dbg !206
  br i1 %exitcond, label %for.end, label %for.body, !dbg !206

for.end:                                          ; preds = %for.body
  ret i32 0, !dbg !212
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
!llvm.module.flags = !{!107, !108}
!llvm.ident = !{!109}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !5, !27, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c] [DW_LANG_C99]
!1 = !{!"bubblesort.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4}
!4 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!5 = !{!6, !10, !12, !17, !24}
!6 = !{!"0x2e\00Initrand\00Initrand\00\0097\000\001\000\000\000\001\0097", !1, !7, !8, null, void ()* @Initrand, null, null, !2} ; [ DW_TAG_subprogram ] [line 97] [def] [Initrand]
!7 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c]
!8 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !9, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!9 = !{null}
!10 = !{!"0x2e\00Rand\00Rand\00\00100\000\001\000\000\000\001\00100", !1, !7, !11, null, i32 ()* @Rand, null, null, !2} ; [ DW_TAG_subprogram ] [line 100] [def] [Rand]
!11 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !3, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!12 = !{!"0x2e\00bInitarr\00bInitarr\00\00105\000\001\000\000\000\001\00105", !1, !7, !8, null, void ()* @bInitarr, null, null, !13} ; [ DW_TAG_subprogram ] [line 105] [def] [bInitarr]
!13 = !{!14, !15}
!14 = !{!"0x100\00i\00106\000", !12, !7, !4}      ; [ DW_TAG_auto_variable ] [i] [line 106]
!15 = !{!"0x100\00temp\00107\000", !12, !7, !16}  ; [ DW_TAG_auto_variable ] [temp] [line 107]
!16 = !{!"0x24\00long int\000\0064\0064\000\000\005", null, null} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!17 = !{!"0x2e\00Bubble\00Bubble\00\00118\000\001\000\000\00256\001\00118", !1, !7, !18, null, void (i32)* @Bubble, null, null, !20} ; [ DW_TAG_subprogram ] [line 118] [def] [Bubble]
!18 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !19, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!19 = !{null, !4}
!20 = !{!21, !22, !23}
!21 = !{!"0x101\00run\0016777334\000", !17, !7, !4} ; [ DW_TAG_arg_variable ] [run] [line 118]
!22 = !{!"0x100\00i\00119\000", !17, !7, !4}      ; [ DW_TAG_auto_variable ] [i] [line 119]
!23 = !{!"0x100\00j\00119\000", !17, !7, !4}      ; [ DW_TAG_auto_variable ] [j] [line 119]
!24 = !{!"0x2e\00main\00main\00\00138\000\001\000\000\000\001\00139", !1, !7, !11, null, i32 ()* @main, null, null, !25} ; [ DW_TAG_subprogram ] [line 138] [def] [scope 139] [main]
!25 = !{!26}
!26 = !{!"0x100\00i\00140\000", !24, !7, !4}      ; [ DW_TAG_auto_variable ] [i] [line 140]
!27 = !{!28, !30, !31, !32, !33, !37, !39, !46, !50, !58, !59, !60, !64, !65, !66, !68, !69, !70, !71, !75, !76, !80, !83, !84, !85, !89, !90, !91, !92, !100, !101, !105, !106}
!28 = !{!"0x34\00value\00value\00\0073\000\001", null, !7, !29, float* @value, null} ; [ DW_TAG_variable ] [value] [line 73] [def]
!29 = !{!"0x24\00float\000\0032\0032\000\000\004", null, null} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!30 = !{!"0x34\00fixed\00fixed\00\0073\000\001", null, !7, !29, float* @fixed, null} ; [ DW_TAG_variable ] [fixed] [line 73] [def]
!31 = !{!"0x34\00floated\00floated\00\0073\000\001", null, !7, !29, float* @floated, null} ; [ DW_TAG_variable ] [floated] [line 73] [def]
!32 = !{!"0x34\00seed\00seed\00\0075\000\001", null, !7, !16, i64* @seed, null} ; [ DW_TAG_variable ] [seed] [line 75] [def]
!33 = !{!"0x34\00permarray\00permarray\00\0077\000\001", null, !7, !34, [11 x i32]* @permarray, null} ; [ DW_TAG_variable ] [permarray] [line 77] [def]
!34 = !{!"0x1\00\000\00352\0032\000\000\000", null, null, !4, !35, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 352, align 32, offset 0] [from int]
!35 = !{!36}
!36 = !{!"0x21\000\0011"}                         ; [ DW_TAG_subrange_type ] [0, 10]
!37 = !{!"0x34\00pctr\00pctr\00\0079\000\001", null, !7, !38, i32* @pctr, null} ; [ DW_TAG_variable ] [pctr] [line 79] [def]
!38 = !{!"0x24\00unsigned int\000\0032\0032\000\000\007", null, null} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!39 = !{!"0x34\00tree\00tree\00\0081\000\001", null, !7, !40, %struct.node** @tree, null} ; [ DW_TAG_variable ] [tree] [line 81] [def]
!40 = !{!"0xf\00\000\0064\0064\000\000", null, null, !41} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from node]
!41 = !{!"0x13\00node\0039\00192\0064\000\000\000", !1, null, null, !42, null, null, null} ; [ DW_TAG_structure_type ] [node] [line 39, size 192, align 64, offset 0] [def] [from ]
!42 = !{!43, !44, !45}
!43 = !{!"0xd\00left\0040\0064\0064\000\000", !1, !41, !40} ; [ DW_TAG_member ] [left] [line 40, size 64, align 64, offset 0] [from ]
!44 = !{!"0xd\00right\0040\0064\0064\0064\000", !1, !41, !40} ; [ DW_TAG_member ] [right] [line 40, size 64, align 64, offset 64] [from ]
!45 = !{!"0xd\00val\0041\0032\0032\00128\000", !1, !41, !4} ; [ DW_TAG_member ] [val] [line 41, size 32, align 32, offset 128] [from int]
!46 = !{!"0x34\00stack\00stack\00\0083\000\001", null, !7, !47, [4 x i32]* @stack, null} ; [ DW_TAG_variable ] [stack] [line 83] [def]
!47 = !{!"0x1\00\000\00128\0032\000\000\000", null, null, !4, !48, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 128, align 32, offset 0] [from int]
!48 = !{!49}
!49 = !{!"0x21\000\004"}                          ; [ DW_TAG_subrange_type ] [0, 3]
!50 = !{!"0x34\00cellspace\00cellspace\00\0084\000\001", null, !7, !51, [19 x %struct.element]* @cellspace, null} ; [ DW_TAG_variable ] [cellspace] [line 84] [def]
!51 = !{!"0x1\00\000\001216\0032\000\000\000", null, null, !52, !56, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1216, align 32, offset 0] [from element]
!52 = !{!"0x13\00element\0047\0064\0032\000\000\000", !1, null, null, !53, null, null, null} ; [ DW_TAG_structure_type ] [element] [line 47, size 64, align 32, offset 0] [def] [from ]
!53 = !{!54, !55}
!54 = !{!"0xd\00discsize\0048\0032\0032\000\000", !1, !52, !4} ; [ DW_TAG_member ] [discsize] [line 48, size 32, align 32, offset 0] [from int]
!55 = !{!"0xd\00next\0049\0032\0032\0032\000", !1, !52, !4} ; [ DW_TAG_member ] [next] [line 49, size 32, align 32, offset 32] [from int]
!56 = !{!57}
!57 = !{!"0x21\000\0019"}                         ; [ DW_TAG_subrange_type ] [0, 18]
!58 = !{!"0x34\00freelist\00freelist\00\0085\000\001", null, !7, !4, i32* @freelist, null} ; [ DW_TAG_variable ] [freelist] [line 85] [def]
!59 = !{!"0x34\00movesdone\00movesdone\00\0085\000\001", null, !7, !4, i32* @movesdone, null} ; [ DW_TAG_variable ] [movesdone] [line 85] [def]
!60 = !{!"0x34\00ima\00ima\00\0087\000\001", null, !7, !61, [41 x [41 x i32]]* @ima, null} ; [ DW_TAG_variable ] [ima] [line 87] [def]
!61 = !{!"0x1\00\000\0053792\0032\000\000\000", null, null, !4, !62, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 53792, align 32, offset 0] [from int]
!62 = !{!63, !63}
!63 = !{!"0x21\000\0041"}                         ; [ DW_TAG_subrange_type ] [0, 40]
!64 = !{!"0x34\00imb\00imb\00\0087\000\001", null, !7, !61, [41 x [41 x i32]]* @imb, null} ; [ DW_TAG_variable ] [imb] [line 87] [def]
!65 = !{!"0x34\00imr\00imr\00\0087\000\001", null, !7, !61, [41 x [41 x i32]]* @imr, null} ; [ DW_TAG_variable ] [imr] [line 87] [def]
!66 = !{!"0x34\00rma\00rma\00\0088\000\001", null, !7, !67, [41 x [41 x float]]* @rma, null} ; [ DW_TAG_variable ] [rma] [line 88] [def]
!67 = !{!"0x1\00\000\0053792\0032\000\000\000", null, null, !29, !62, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 53792, align 32, offset 0] [from float]
!68 = !{!"0x34\00rmb\00rmb\00\0088\000\001", null, !7, !67, [41 x [41 x float]]* @rmb, null} ; [ DW_TAG_variable ] [rmb] [line 88] [def]
!69 = !{!"0x34\00rmr\00rmr\00\0088\000\001", null, !7, !67, [41 x [41 x float]]* @rmr, null} ; [ DW_TAG_variable ] [rmr] [line 88] [def]
!70 = !{!"0x34\00piececount\00piececount\00\0090\000\001", null, !7, !47, [4 x i32]* @piececount, null} ; [ DW_TAG_variable ] [piececount] [line 90] [def]
!71 = !{!"0x34\00class\00class\00\0090\000\001", null, !7, !72, [13 x i32]* @class, null} ; [ DW_TAG_variable ] [class] [line 90] [def]
!72 = !{!"0x1\00\000\00416\0032\000\000\000", null, null, !4, !73, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 416, align 32, offset 0] [from int]
!73 = !{!74}
!74 = !{!"0x21\000\0013"}                         ; [ DW_TAG_subrange_type ] [0, 12]
!75 = !{!"0x34\00piecemax\00piecemax\00\0090\000\001", null, !7, !72, [13 x i32]* @piecemax, null} ; [ DW_TAG_variable ] [piecemax] [line 90] [def]
!76 = !{!"0x34\00puzzl\00puzzl\00\0091\000\001", null, !7, !77, [512 x i32]* @puzzl, null} ; [ DW_TAG_variable ] [puzzl] [line 91] [def]
!77 = !{!"0x1\00\000\0016384\0032\000\000\000", null, null, !4, !78, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16384, align 32, offset 0] [from int]
!78 = !{!79}
!79 = !{!"0x21\000\00512"}                        ; [ DW_TAG_subrange_type ] [0, 511]
!80 = !{!"0x34\00p\00p\00\0091\000\001", null, !7, !81, [13 x [512 x i32]]* @p, null} ; [ DW_TAG_variable ] [p] [line 91] [def]
!81 = !{!"0x1\00\000\00212992\0032\000\000\000", null, null, !4, !82, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 212992, align 32, offset 0] [from int]
!82 = !{!74, !79}
!83 = !{!"0x34\00n\00n\00\0091\000\001", null, !7, !4, i32* @n, null} ; [ DW_TAG_variable ] [n] [line 91] [def]
!84 = !{!"0x34\00kount\00kount\00\0091\000\001", null, !7, !4, i32* @kount, null} ; [ DW_TAG_variable ] [kount] [line 91] [def]
!85 = !{!"0x34\00sortlist\00sortlist\00\0093\000\001", null, !7, !86, [5001 x i32]* @sortlist, null} ; [ DW_TAG_variable ] [sortlist] [line 93] [def]
!86 = !{!"0x1\00\000\00160032\0032\000\000\000", null, null, !4, !87, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 160032, align 32, offset 0] [from int]
!87 = !{!88}
!88 = !{!"0x21\000\005001"}                       ; [ DW_TAG_subrange_type ] [0, 5000]
!89 = !{!"0x34\00biggest\00biggest\00\0093\000\001", null, !7, !4, i32* @biggest, null} ; [ DW_TAG_variable ] [biggest] [line 93] [def]
!90 = !{!"0x34\00littlest\00littlest\00\0093\000\001", null, !7, !4, i32* @littlest, null} ; [ DW_TAG_variable ] [littlest] [line 93] [def]
!91 = !{!"0x34\00top\00top\00\0093\000\001", null, !7, !4, i32* @top, null} ; [ DW_TAG_variable ] [top] [line 93] [def]
!92 = !{!"0x34\00z\00z\00\0095\000\001", null, !7, !93, [257 x %struct.complex]* @z, null} ; [ DW_TAG_variable ] [z] [line 95] [def]
!93 = !{!"0x1\00\000\0016448\0032\000\000\000", null, null, !94, !98, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16448, align 32, offset 0] [from complex]
!94 = !{!"0x13\00complex\0068\0064\0032\000\000\000", !1, null, null, !95, null, null, null} ; [ DW_TAG_structure_type ] [complex] [line 68, size 64, align 32, offset 0] [def] [from ]
!95 = !{!96, !97}
!96 = !{!"0xd\00rp\0068\0032\0032\000\000", !1, !94, !29} ; [ DW_TAG_member ] [rp] [line 68, size 32, align 32, offset 0] [from float]
!97 = !{!"0xd\00ip\0068\0032\0032\0032\000", !1, !94, !29} ; [ DW_TAG_member ] [ip] [line 68, size 32, align 32, offset 32] [from float]
!98 = !{!99}
!99 = !{!"0x21\000\00257"}                        ; [ DW_TAG_subrange_type ] [0, 256]
!100 = !{!"0x34\00w\00w\00\0095\000\001", null, !7, !93, [257 x %struct.complex]* @w, null} ; [ DW_TAG_variable ] [w] [line 95] [def]
!101 = !{!"0x34\00e\00e\00\0095\000\001", null, !7, !102, [130 x %struct.complex]* @e, null} ; [ DW_TAG_variable ] [e] [line 95] [def]
!102 = !{!"0x1\00\000\008320\0032\000\000\000", null, null, !94, !103, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 8320, align 32, offset 0] [from complex]
!103 = !{!104}
!104 = !{!"0x21\000\00130"}                       ; [ DW_TAG_subrange_type ] [0, 129]
!105 = !{!"0x34\00zr\00zr\00\0096\000\001", null, !7, !29, float* @zr, null} ; [ DW_TAG_variable ] [zr] [line 96] [def]
!106 = !{!"0x34\00zi\00zi\00\0096\000\001", null, !7, !29, float* @zi, null} ; [ DW_TAG_variable ] [zi] [line 96] [def]
!107 = !{i32 2, !"Dwarf Version", i32 4}
!108 = !{i32 2, !"Debug Info Version", i32 2}
!109 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!110 = !MDLocation(line: 98, column: 3, scope: !6)
!111 = !{!112, !112, i64 0}
!112 = !{!"long", !113, i64 0}
!113 = !{!"omnipotent char", !114, i64 0}
!114 = !{!"Simple C/C++ TBAA"}
!115 = !MDLocation(line: 99, column: 1, scope: !6)
!116 = !MDLocation(line: 101, column: 11, scope: !10)
!117 = !MDLocation(line: 101, column: 10, scope: !10)
!118 = !MDLocation(line: 101, column: 3, scope: !10)
!119 = !MDLocation(line: 102, column: 11, scope: !10)
!120 = !MDLocation(line: 102, column: 3, scope: !10)
!121 = !MDLocation(line: 98, column: 3, scope: !6, inlinedAt: !122)
!122 = !MDLocation(line: 108, column: 3, scope: !12)
!123 = !MDLocation(line: 109, column: 3, scope: !12)
!124 = !{!125, !125, i64 0}
!125 = !{!"int", !113, i64 0}
!126 = !MDLocation(line: 109, column: 16, scope: !12)
!127 = !{!"0x102"}                                ; [ DW_TAG_expression ]
!128 = !MDLocation(line: 106, column: 7, scope: !12)
!129 = !MDLocation(line: 110, column: 3, scope: !130)
!130 = !{!"0xb\00110\003\000", !1, !12}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c]
!131 = !MDLocation(line: 101, column: 11, scope: !10, inlinedAt: !132)
!132 = !MDLocation(line: 111, column: 12, scope: !133)
!133 = !{!"0xb\00110\0040\002", !1, !134}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c]
!134 = !{!"0xb\00110\003\001", !1, !130}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c]
!135 = !MDLocation(line: 101, column: 10, scope: !10, inlinedAt: !132)
!136 = !MDLocation(line: 107, column: 8, scope: !12)
!137 = !MDLocation(line: 113, column: 32, scope: !133)
!138 = !MDLocation(line: 113, column: 25, scope: !133)
!139 = !MDLocation(line: 113, column: 19, scope: !133)
!140 = !MDLocation(line: 113, column: 5, scope: !133)
!141 = !MDLocation(line: 114, column: 10, scope: !142)
!142 = !{!"0xb\00114\0010\003", !1, !133}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c]
!143 = !MDLocation(line: 114, column: 10, scope: !133)
!144 = !MDLocation(line: 114, column: 34, scope: !142)
!145 = !MDLocation(line: 115, column: 15, scope: !146)
!146 = !{!"0xb\00115\0015\004", !1, !142}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c]
!147 = !MDLocation(line: 115, column: 15, scope: !142)
!148 = !MDLocation(line: 115, column: 40, scope: !146)
!149 = !MDLocation(line: 101, column: 3, scope: !10, inlinedAt: !132)
!150 = !MDLocation(line: 117, column: 1, scope: !12)
!151 = !MDLocation(line: 118, column: 17, scope: !17)
!152 = !MDLocation(line: 98, column: 3, scope: !6, inlinedAt: !153)
!153 = !MDLocation(line: 108, column: 3, scope: !12, inlinedAt: !154)
!154 = !MDLocation(line: 120, column: 3, scope: !17)
!155 = !MDLocation(line: 109, column: 3, scope: !12, inlinedAt: !154)
!156 = !MDLocation(line: 109, column: 16, scope: !12, inlinedAt: !154)
!157 = !{!"0x100\00i\00106\000", !12, !7, !4, !154} ; [ DW_TAG_auto_variable ] [i] [line 106]
!158 = !MDLocation(line: 106, column: 7, scope: !12, inlinedAt: !154)
!159 = !MDLocation(line: 110, column: 3, scope: !130, inlinedAt: !154)
!160 = !MDLocation(line: 101, column: 11, scope: !10, inlinedAt: !161)
!161 = !MDLocation(line: 111, column: 12, scope: !133, inlinedAt: !154)
!162 = !MDLocation(line: 101, column: 10, scope: !10, inlinedAt: !161)
!163 = !{!"0x100\00temp\00107\000", !12, !7, !16, !154} ; [ DW_TAG_auto_variable ] [temp] [line 107]
!164 = !MDLocation(line: 107, column: 8, scope: !12, inlinedAt: !154)
!165 = !MDLocation(line: 113, column: 32, scope: !133, inlinedAt: !154)
!166 = !MDLocation(line: 113, column: 25, scope: !133, inlinedAt: !154)
!167 = !MDLocation(line: 113, column: 19, scope: !133, inlinedAt: !154)
!168 = !MDLocation(line: 113, column: 5, scope: !133, inlinedAt: !154)
!169 = !MDLocation(line: 114, column: 10, scope: !142, inlinedAt: !154)
!170 = !MDLocation(line: 114, column: 10, scope: !133, inlinedAt: !154)
!171 = !MDLocation(line: 114, column: 34, scope: !142, inlinedAt: !154)
!172 = !MDLocation(line: 115, column: 15, scope: !146, inlinedAt: !154)
!173 = !MDLocation(line: 115, column: 15, scope: !142, inlinedAt: !154)
!174 = !MDLocation(line: 115, column: 40, scope: !146, inlinedAt: !154)
!175 = !MDLocation(line: 101, column: 3, scope: !10, inlinedAt: !161)
!176 = !MDLocation(line: 132, column: 5, scope: !177)
!177 = !{!"0xb\00122\0019\005", !1, !17}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c]
!178 = !MDLocation(line: 122, column: 3, scope: !17)
!179 = !MDLocation(line: 125, column: 12, scope: !180)
!180 = !{!"0xb\00125\0012\007", !1, !181}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c]
!181 = !{!"0xb\00124\0021\006", !1, !177}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c]
!182 = !MDLocation(line: 124, column: 5, scope: !177)
!183 = !MDLocation(line: 125, column: 26, scope: !180)
!184 = !MDLocation(line: 125, column: 12, scope: !181)
!185 = !MDLocation(line: 119, column: 10, scope: !17)
!186 = !MDLocation(line: 127, column: 9, scope: !187)
!187 = !{!"0xb\00125\0042\008", !1, !180}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c]
!188 = !MDLocation(line: 128, column: 9, scope: !187)
!189 = !MDLocation(line: 129, column: 7, scope: !187)
!190 = distinct !{!190, !191}
!191 = !{!"llvm.loop.unroll.disable"}
!192 = !MDLocation(line: 122, column: 11, scope: !193)
!193 = !{!"0xb\002", !1, !194}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c]
!194 = !{!"0xb\001", !1, !17}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c]
!195 = !MDLocation(line: 124, column: 15, scope: !177)
!196 = !MDLocation(line: 134, column: 9, scope: !197)
!197 = !{!"0xb\00134\008\009", !1, !17}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c]
!198 = !MDLocation(line: 134, column: 38, scope: !197)
!199 = !MDLocation(line: 134, column: 8, scope: !17)
!200 = !MDLocation(line: 135, column: 5, scope: !197)
!201 = !MDLocation(line: 136, column: 27, scope: !17)
!202 = !MDLocation(line: 136, column: 18, scope: !17)
!203 = !MDLocation(line: 136, column: 3, scope: !17)
!204 = !MDLocation(line: 137, column: 1, scope: !17)
!205 = !MDLocation(line: 140, column: 7, scope: !24)
!206 = !MDLocation(line: 141, column: 3, scope: !207)
!207 = !{!"0xb\00141\003\0010", !1, !24}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c]
!208 = !MDLocation(line: 141, column: 29, scope: !209)
!209 = !{!"0xb\00141\003\0011", !1, !207}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c]
!210 = !MDLocation(line: 141, column: 24, scope: !211)
!211 = !{!"0xb\003", !1, !209}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/bubblesort.c]
!212 = !MDLocation(line: 142, column: 3, scope: !24)
