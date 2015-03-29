; ModuleID = 'bubblesort.o3.ll'
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
@.str1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @Initrand() #0 {
entry:
  store i64 74755, i64* @seed, align 8, !tbaa !3
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @Rand() #0 {
entry:
  %0 = load i64* @seed, align 8, !tbaa !3
  %mul = mul nsw i64 %0, 1309
  %add = add nsw i64 %mul, 13849
  %and = and i64 %add, 65535
  store i64 %and, i64* @seed, align 8, !tbaa !3
  %conv = trunc i64 %and to i32
  ret i32 %conv
}

; Function Attrs: nounwind uwtable
define void @bInitarr() #0 {
entry:
  store i64 74755, i64* @seed, align 8, !tbaa !3
  store i32 0, i32* @biggest, align 4, !tbaa !7
  store i32 0, i32* @littlest, align 4, !tbaa !7
  br label %for.body

for.body:                                         ; preds = %for.inc, %entry
  %0 = phi i32 [ 0, %entry ], [ %2, %for.inc ]
  %1 = phi i32 [ 0, %entry ], [ %3, %for.inc ]
  %indvars.iv = phi i64 [ 1, %entry ], [ %indvars.iv.next, %for.inc ]
  %and.i25 = phi i64 [ 74755, %entry ], [ %and.i, %for.inc ]
  %mul.i = mul nuw nsw i64 %and.i25, 1309
  %add.i = add nuw nsw i64 %mul.i, 13849
  %and.i = and i64 %add.i, 65535
  %div = urem i64 %and.i, 100000
  %sub1 = add nuw nsw i64 %div, 4294917296
  %conv2 = trunc i64 %sub1 to i32
  %arrayidx = getelementptr inbounds [5001 x i32]* @sortlist, i64 0, i64 %indvars.iv
  store i32 %conv2, i32* %arrayidx, align 4, !tbaa !7
  %cmp5 = icmp sgt i32 %conv2, %1
  br i1 %cmp5, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  store i32 %conv2, i32* @biggest, align 4, !tbaa !7
  br label %for.inc

if.else:                                          ; preds = %for.body
  %cmp11 = icmp slt i32 %conv2, %0
  br i1 %cmp11, label %if.then13, label %for.inc

if.then13:                                        ; preds = %if.else
  store i32 %conv2, i32* @littlest, align 4, !tbaa !7
  br label %for.inc

for.inc:                                          ; preds = %if.then13, %if.else, %if.then
  %2 = phi i32 [ %0, %if.then ], [ %conv2, %if.then13 ], [ %0, %if.else ]
  %3 = phi i32 [ %conv2, %if.then ], [ %1, %if.then13 ], [ %1, %if.else ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 501
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.inc
  %and.i.lcssa = phi i64 [ %and.i, %for.inc ]
  store i64 %and.i.lcssa, i64* @seed, align 8, !tbaa !3
  ret void
}

; Function Attrs: nounwind uwtable
define void @Bubble(i32 %run) #0 {
entry:
  store i64 74755, i64* @seed, align 8, !tbaa !3
  store i32 0, i32* @biggest, align 4, !tbaa !7
  store i32 0, i32* @littlest, align 4, !tbaa !7
  br label %for.body.i

for.body.i:                                       ; preds = %for.inc.i, %entry
  %0 = phi i32 [ 0, %entry ], [ %2, %for.inc.i ]
  %1 = phi i32 [ 0, %entry ], [ %3, %for.inc.i ]
  %indvars.iv.i = phi i64 [ 1, %entry ], [ %indvars.iv.next.i, %for.inc.i ]
  %and.i25.i = phi i64 [ 74755, %entry ], [ %and.i.i, %for.inc.i ]
  %mul.i.i = mul nuw nsw i64 %and.i25.i, 1309
  %add.i.i = add nuw nsw i64 %mul.i.i, 13849
  %and.i.i = and i64 %add.i.i, 65535
  %div.i = urem i64 %and.i.i, 100000
  %sub1.i = add nuw nsw i64 %div.i, 4294917296
  %conv2.i = trunc i64 %sub1.i to i32
  %arrayidx.i = getelementptr inbounds [5001 x i32]* @sortlist, i64 0, i64 %indvars.iv.i
  store i32 %conv2.i, i32* %arrayidx.i, align 4, !tbaa !7
  %cmp5.i = icmp sgt i32 %conv2.i, %1
  br i1 %cmp5.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %for.body.i
  store i32 %conv2.i, i32* @biggest, align 4, !tbaa !7
  br label %for.inc.i

if.else.i:                                        ; preds = %for.body.i
  %cmp11.i = icmp slt i32 %conv2.i, %0
  br i1 %cmp11.i, label %if.then13.i, label %for.inc.i

if.then13.i:                                      ; preds = %if.else.i
  store i32 %conv2.i, i32* @littlest, align 4, !tbaa !7
  br label %for.inc.i

for.inc.i:                                        ; preds = %if.then13.i, %if.else.i, %if.then.i
  %2 = phi i32 [ %0, %if.then.i ], [ %conv2.i, %if.then13.i ], [ %0, %if.else.i ]
  %3 = phi i32 [ %conv2.i, %if.then.i ], [ %1, %if.then13.i ], [ %1, %if.else.i ]
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, 501
  br i1 %exitcond.i, label %bInitarr.exit, label %for.body.i

bInitarr.exit:                                    ; preds = %for.inc.i
  %.lcssa39 = phi i32 [ %3, %for.inc.i ]
  %.lcssa = phi i32 [ %2, %for.inc.i ]
  %and.i.i.lcssa = phi i64 [ %and.i.i, %for.inc.i ]
  store i64 %and.i.i.lcssa, i64* @seed, align 8, !tbaa !3
  store i32 500, i32* @top, align 4, !tbaa !7
  br label %while.body3.lr.ph

while.body3.lr.ph:                                ; preds = %while.end, %bInitarr.exit
  %indvar = phi i32 [ %indvar.next, %while.end ], [ 0, %bInitarr.exit ]
  %indvars.iv36 = phi i32 [ 500, %bInitarr.exit ], [ %indvars.iv.next37, %while.end ]
  %4 = mul i32 %indvar, -1
  %5 = add i32 %4, 499
  %.pre = load i32* getelementptr inbounds ([5001 x i32]* @sortlist, i64 0, i64 1), align 4, !tbaa !7
  %xtraiter = and i32 %5, 1
  %lcmp.mod = icmp ne i32 %xtraiter, 0
  %lcmp.overflow = icmp eq i32 %5, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %while.body3.prol.preheader, label %while.body3.lr.ph.split

while.body3.prol.preheader:                       ; preds = %while.body3.lr.ph
  br label %while.body3.prol

while.body3.prol:                                 ; preds = %while.cond1.backedge.prol, %while.body3.prol.preheader
  %6 = phi i32 [ %8, %while.cond1.backedge.prol ], [ %.pre, %while.body3.prol.preheader ]
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %while.cond1.backedge.prol ], [ 1, %while.body3.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %while.cond1.backedge.prol ], [ %xtraiter, %while.body3.prol.preheader ]
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %arrayidx5.prol = getelementptr inbounds [5001 x i32]* @sortlist, i64 0, i64 %indvars.iv.next.prol
  %7 = load i32* %arrayidx5.prol, align 4, !tbaa !7
  %cmp6.prol = icmp sgt i32 %6, %7
  br i1 %cmp6.prol, label %if.then.prol, label %while.cond1.backedge.prol

if.then.prol:                                     ; preds = %while.body3.prol
  %arrayidx.prol = getelementptr inbounds [5001 x i32]* @sortlist, i64 0, i64 %indvars.iv.prol
  store i32 %7, i32* %arrayidx.prol, align 4, !tbaa !7
  store i32 %6, i32* %arrayidx5.prol, align 4, !tbaa !7
  br label %while.cond1.backedge.prol

while.cond1.backedge.prol:                        ; preds = %if.then.prol, %while.body3.prol
  %8 = phi i32 [ %6, %if.then.prol ], [ %7, %while.body3.prol ]
  %lftr.wideiv.prol = trunc i64 %indvars.iv.next.prol to i32
  %exitcond.prol = icmp eq i32 %lftr.wideiv.prol, %indvars.iv36
  %prol.iter.sub = sub i32 %prol.iter, 1
  %prol.iter.cmp = icmp ne i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %while.body3.prol, label %while.body3.lr.ph.split.loopexit, !llvm.loop !9

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
  br label %while.body3

while.body3:                                      ; preds = %while.cond1.backedge.1, %while.body3.lr.ph.split.split
  %10 = phi i32 [ %.unr, %while.body3.lr.ph.split.split ], [ %17, %while.cond1.backedge.1 ]
  %indvars.iv = phi i64 [ %indvars.iv.unr, %while.body3.lr.ph.split.split ], [ %indvars.iv.next.1, %while.cond1.backedge.1 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx5 = getelementptr inbounds [5001 x i32]* @sortlist, i64 0, i64 %indvars.iv.next
  %11 = load i32* %arrayidx5, align 4, !tbaa !7
  %cmp6 = icmp sgt i32 %10, %11
  br i1 %cmp6, label %if.then, label %while.cond1.backedge

if.then:                                          ; preds = %while.body3
  %arrayidx = getelementptr inbounds [5001 x i32]* @sortlist, i64 0, i64 %indvars.iv
  store i32 %11, i32* %arrayidx, align 4, !tbaa !7
  store i32 %10, i32* %arrayidx5, align 4, !tbaa !7
  br label %while.cond1.backedge

while.cond1.backedge:                             ; preds = %if.then, %while.body3
  %12 = phi i32 [ %10, %if.then ], [ %11, %while.body3 ]
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv.next, 1
  %arrayidx5.1 = getelementptr inbounds [5001 x i32]* @sortlist, i64 0, i64 %indvars.iv.next.1
  %13 = load i32* %arrayidx5.1, align 4, !tbaa !7
  %cmp6.1 = icmp sgt i32 %12, %13
  br i1 %cmp6.1, label %if.then.1, label %while.cond1.backedge.1

while.end.unr-lcssa:                              ; preds = %while.cond1.backedge.1
  br label %while.end

while.end:                                        ; preds = %while.end.unr-lcssa, %while.body3.lr.ph.split
  %indvars.iv.next37 = add nsw i32 %indvars.iv36, -1
  %cmp = icmp sgt i32 %indvars.iv.next37, 1
  %indvar.next = add i32 %indvar, 1
  br i1 %cmp, label %while.body3.lr.ph, label %while.end18

while.end18:                                      ; preds = %while.end
  store i32 1, i32* @top, align 4, !tbaa !7
  %14 = load i32* getelementptr inbounds ([5001 x i32]* @sortlist, i64 0, i64 1), align 4, !tbaa !7
  %cmp19 = icmp eq i32 %14, %.lcssa
  %15 = load i32* getelementptr inbounds ([5001 x i32]* @sortlist, i64 0, i64 500), align 16
  %cmp20 = icmp eq i32 %15, %.lcssa39
  %or.cond = and i1 %cmp19, %cmp20
  br i1 %or.cond, label %if.end22, label %if.then21

if.then21:                                        ; preds = %while.end18
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([18 x i8]* @str, i64 0, i64 0))
  br label %if.end22

if.end22:                                         ; preds = %if.then21, %while.end18
  %add23 = add nsw i32 %run, 1
  %idxprom24 = sext i32 %add23 to i64
  %arrayidx25 = getelementptr inbounds [5001 x i32]* @sortlist, i64 0, i64 %idxprom24
  %16 = load i32* %arrayidx25, align 4, !tbaa !7
  %call26 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i64 0, i64 0), i32 %16) #2
  ret void

if.then.1:                                        ; preds = %while.cond1.backedge
  %arrayidx.1 = getelementptr inbounds [5001 x i32]* @sortlist, i64 0, i64 %indvars.iv.next
  store i32 %13, i32* %arrayidx.1, align 4, !tbaa !7
  store i32 %12, i32* %arrayidx5.1, align 4, !tbaa !7
  br label %while.cond1.backedge.1

while.cond1.backedge.1:                           ; preds = %if.then.1, %while.cond1.backedge
  %17 = phi i32 [ %12, %if.then.1 ], [ %13, %while.cond1.backedge ]
  %lftr.wideiv.1 = trunc i64 %indvars.iv.next.1 to i32
  %exitcond.1 = icmp eq i32 %lftr.wideiv.1, %indvars.iv36
  br i1 %exitcond.1, label %while.end.unr-lcssa, label %while.body3
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %i.03 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  tail call void @Bubble(i32 %i.03)
  %inc = add nuw nsw i32 %i.03, 1
  %exitcond = icmp eq i32 %inc, 100
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}
!llvm.module.flags = !{!1, !2}

!0 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang 64b6333290f9b7df5a25d4fba34611de3078a792) (llvm/ 0e9a38ba60be659d570af893e05c75b9f6cfe35d)"}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 2}
!3 = !{!4, !4, i64 0}
!4 = !{!"long", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !5, i64 0}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.unroll.disable"}
