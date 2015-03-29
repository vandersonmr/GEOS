; ModuleID = 'nestedloop.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !15, metadata !37), !dbg !38
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !16, metadata !37), !dbg !39
  %cmp = icmp eq i32 %argc, 2, !dbg !40
  br i1 %cmp, label %cond.end, label %for.cond2.preheader.lr.ph, !dbg !41

cond.end:                                         ; preds = %entry
  %arrayidx = getelementptr inbounds i8** %argv, i64 1, !dbg !42
  %0 = load i8** %arrayidx, align 8, !dbg !42, !tbaa !44
  tail call void @llvm.dbg.value(metadata i8* %0, i64 0, metadata !48, metadata !37) #3, !dbg !50
  %call.i = tail call i64 @strtol(i8* nocapture %0, i8** null, i32 10) #3, !dbg !51
  %conv.i = trunc i64 %call.i to i32, !dbg !52
  tail call void @llvm.dbg.value(metadata i32 %conv.i, i64 0, metadata !17, metadata !37), !dbg !53
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !24, metadata !37), !dbg !54
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !18, metadata !37), !dbg !55
  %cmp165 = icmp sgt i32 %conv.i, 0, !dbg !56
  br i1 %cmp165, label %for.cond2.preheader.lr.ph, label %for.end32, !dbg !59

for.cond2.preheader.lr.ph:                        ; preds = %entry, %cond.end
  %cond74 = phi i32 [ %conv.i, %cond.end ], [ 46, %entry ]
  %1 = add i32 %cond74, -1, !dbg !59
  %2 = lshr i32 %cond74, 3, !dbg !59
  %3 = mul i32 %2, 8, !dbg !59
  %4 = add i32 %3, -8, !dbg !59
  %5 = lshr i32 %4, 3, !dbg !59
  %6 = add i32 %5, 1, !dbg !59
  br label %for.cond5.preheader.lr.ph, !dbg !59

for.cond5.preheader.lr.ph:                        ; preds = %for.cond2.preheader.lr.ph, %for.inc30
  %x.067 = phi i32 [ 0, %for.cond2.preheader.lr.ph ], [ %.lcssa.lcssa.lcssa.lcssa, %for.inc30 ]
  %a.066 = phi i32 [ 0, %for.cond2.preheader.lr.ph ], [ %inc31, %for.inc30 ]
  br label %for.cond8.preheader.lr.ph, !dbg !60

for.cond8.preheader.lr.ph:                        ; preds = %for.cond5.preheader.lr.ph, %for.inc27
  %x.163 = phi i32 [ %x.067, %for.cond5.preheader.lr.ph ], [ %.lcssa.lcssa.lcssa, %for.inc27 ]
  %b.062 = phi i32 [ 0, %for.cond5.preheader.lr.ph ], [ %inc28, %for.inc27 ]
  br label %for.cond11.preheader.lr.ph, !dbg !62

for.cond11.preheader.lr.ph:                       ; preds = %for.cond8.preheader.lr.ph, %for.inc24
  %x.259 = phi i32 [ %x.163, %for.cond8.preheader.lr.ph ], [ %.lcssa.lcssa, %for.inc24 ]
  %c.058 = phi i32 [ 0, %for.cond8.preheader.lr.ph ], [ %inc25, %for.inc24 ]
  br label %for.cond14.preheader.lr.ph, !dbg !65

for.cond14.preheader.lr.ph:                       ; preds = %for.cond11.preheader.lr.ph, %for.inc21
  %x.355 = phi i32 [ %x.259, %for.cond11.preheader.lr.ph ], [ %.lcssa, %for.inc21 ]
  %d.054 = phi i32 [ 0, %for.cond11.preheader.lr.ph ], [ %inc22, %for.inc21 ]
  %backedge.overflow = icmp eq i32 %cond74, 0
  br i1 %backedge.overflow, label %for.inc18.preheader, label %overflow.checked

overflow.checked:                                 ; preds = %for.cond14.preheader.lr.ph
  %n.vec = and i32 %cond74, -8, !dbg !68
  %cmp.zero = icmp eq i32 %n.vec, 0, !dbg !68
  %7 = insertelement <4 x i32> <i32 undef, i32 0, i32 0, i32 0>, i32 %x.355, i32 0
  br i1 %cmp.zero, label %middle.block, label %vector.ph

vector.ph:                                        ; preds = %overflow.checked
  %broadcast.splatinsert77 = insertelement <4 x i32> undef, i32 %cond74, i32 0
  %broadcast.splat78 = shufflevector <4 x i32> %broadcast.splatinsert77, <4 x i32> undef, <4 x i32> zeroinitializer
  %xtraiter = and i32 %6, 7
  %lcmp.mod = icmp ne i32 %xtraiter, 0
  %lcmp.overflow = icmp eq i32 %6, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %vector.body.prol.preheader, label %vector.ph.split

vector.body.prol.preheader:                       ; preds = %vector.ph
  br label %vector.body.prol, !dbg !72

vector.body.prol:                                 ; preds = %vector.body.prol.preheader, %vector.body.prol
  %index.prol = phi i32 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ], !dbg !68
  %vec.phi.prol = phi <4 x i32> [ %8, %vector.body.prol ], [ %7, %vector.body.prol.preheader ]
  %vec.phi75.prol = phi <4 x i32> [ %9, %vector.body.prol ], [ zeroinitializer, %vector.body.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %vector.body.prol ], [ %xtraiter, %vector.body.prol.preheader ]
  %8 = add <4 x i32> %broadcast.splat78, %vec.phi.prol, !dbg !72
  %9 = add <4 x i32> %broadcast.splat78, %vec.phi75.prol, !dbg !72
  %index.next.prol = add i32 %index.prol, 8, !dbg !68
  %10 = icmp eq i32 %index.next.prol, %n.vec, !dbg !68
  %prol.iter.sub = sub i32 %prol.iter, 1, !dbg !68
  %prol.iter.cmp = icmp ne i32 %prol.iter.sub, 0, !dbg !68
  br i1 %prol.iter.cmp, label %vector.body.prol, label %vector.ph.split.loopexit, !llvm.loop !74

vector.ph.split.loopexit:                         ; preds = %vector.body.prol
  %.lcssa86.unr.ph = phi <4 x i32> [ %9, %vector.body.prol ]
  %.lcssa85.unr.ph = phi <4 x i32> [ %8, %vector.body.prol ]
  %index.unr.ph = phi i32 [ %index.next.prol, %vector.body.prol ]
  %vec.phi.unr.ph = phi <4 x i32> [ %8, %vector.body.prol ]
  %vec.phi75.unr.ph = phi <4 x i32> [ %9, %vector.body.prol ]
  br label %vector.ph.split

vector.ph.split:                                  ; preds = %vector.ph.split.loopexit, %vector.ph
  %.lcssa86.unr = phi <4 x i32> [ zeroinitializer, %vector.ph ], [ %.lcssa86.unr.ph, %vector.ph.split.loopexit ]
  %.lcssa85.unr = phi <4 x i32> [ zeroinitializer, %vector.ph ], [ %.lcssa85.unr.ph, %vector.ph.split.loopexit ]
  %index.unr = phi i32 [ 0, %vector.ph ], [ %index.unr.ph, %vector.ph.split.loopexit ]
  %vec.phi.unr = phi <4 x i32> [ %7, %vector.ph ], [ %vec.phi.unr.ph, %vector.ph.split.loopexit ]
  %vec.phi75.unr = phi <4 x i32> [ zeroinitializer, %vector.ph ], [ %vec.phi75.unr.ph, %vector.ph.split.loopexit ]
  %11 = icmp ult i32 %6, 8
  br i1 %11, label %middle.block.loopexit, label %vector.ph.split.split

vector.ph.split.split:                            ; preds = %vector.ph.split
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph.split.split
  %index = phi i32 [ %index.unr, %vector.ph.split.split ], [ %index.next.7, %vector.body ], !dbg !68
  %vec.phi = phi <4 x i32> [ %vec.phi.unr, %vector.ph.split.split ], [ %26, %vector.body ]
  %vec.phi75 = phi <4 x i32> [ %vec.phi75.unr, %vector.ph.split.split ], [ %27, %vector.body ]
  %12 = add <4 x i32> %broadcast.splat78, %vec.phi, !dbg !72
  %13 = add <4 x i32> %broadcast.splat78, %vec.phi75, !dbg !72
  %index.next = add i32 %index, 8, !dbg !68
  %14 = add <4 x i32> %broadcast.splat78, %12, !dbg !72
  %15 = add <4 x i32> %broadcast.splat78, %13, !dbg !72
  %index.next.1 = add i32 %index.next, 8, !dbg !68
  %16 = add <4 x i32> %broadcast.splat78, %14, !dbg !72
  %17 = add <4 x i32> %broadcast.splat78, %15, !dbg !72
  %index.next.2 = add i32 %index.next.1, 8, !dbg !68
  %18 = add <4 x i32> %broadcast.splat78, %16, !dbg !72
  %19 = add <4 x i32> %broadcast.splat78, %17, !dbg !72
  %index.next.3 = add i32 %index.next.2, 8, !dbg !68
  %20 = add <4 x i32> %broadcast.splat78, %18, !dbg !72
  %21 = add <4 x i32> %broadcast.splat78, %19, !dbg !72
  %index.next.4 = add i32 %index.next.3, 8, !dbg !68
  %22 = add <4 x i32> %broadcast.splat78, %20, !dbg !72
  %23 = add <4 x i32> %broadcast.splat78, %21, !dbg !72
  %index.next.5 = add i32 %index.next.4, 8, !dbg !68
  %24 = add <4 x i32> %broadcast.splat78, %22, !dbg !72
  %25 = add <4 x i32> %broadcast.splat78, %23, !dbg !72
  %index.next.6 = add i32 %index.next.5, 8, !dbg !68
  %26 = add <4 x i32> %broadcast.splat78, %24, !dbg !72
  %27 = add <4 x i32> %broadcast.splat78, %25, !dbg !72
  %index.next.7 = add i32 %index.next.6, 8, !dbg !68
  %28 = icmp eq i32 %index.next.7, %n.vec, !dbg !68
  br i1 %28, label %middle.block.loopexit.unr-lcssa, label %vector.body, !dbg !68, !llvm.loop !76

middle.block.loopexit.unr-lcssa:                  ; preds = %vector.body
  %.lcssa86.ph = phi <4 x i32> [ %27, %vector.body ]
  %.lcssa85.ph = phi <4 x i32> [ %26, %vector.body ]
  br label %middle.block.loopexit

middle.block.loopexit:                            ; preds = %vector.ph.split, %middle.block.loopexit.unr-lcssa
  %.lcssa86 = phi <4 x i32> [ %.lcssa86.unr, %vector.ph.split ], [ %.lcssa86.ph, %middle.block.loopexit.unr-lcssa ]
  %.lcssa85 = phi <4 x i32> [ %.lcssa85.unr, %vector.ph.split ], [ %.lcssa85.ph, %middle.block.loopexit.unr-lcssa ]
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %overflow.checked
  %resume.val = phi i32 [ 0, %overflow.checked ], [ %n.vec, %middle.block.loopexit ]
  %rdx.vec.exit.phi = phi <4 x i32> [ %7, %overflow.checked ], [ %.lcssa85, %middle.block.loopexit ], !dbg !72
  %rdx.vec.exit.phi81 = phi <4 x i32> [ zeroinitializer, %overflow.checked ], [ %.lcssa86, %middle.block.loopexit ], !dbg !72
  %bin.rdx = add <4 x i32> %rdx.vec.exit.phi81, %rdx.vec.exit.phi, !dbg !72
  %rdx.shuf = shufflevector <4 x i32> %bin.rdx, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>, !dbg !72
  %bin.rdx82 = add <4 x i32> %bin.rdx, %rdx.shuf, !dbg !72
  %rdx.shuf83 = shufflevector <4 x i32> %bin.rdx82, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>, !dbg !72
  %bin.rdx84 = add <4 x i32> %bin.rdx82, %rdx.shuf83, !dbg !72
  %29 = extractelement <4 x i32> %bin.rdx84, i32 0, !dbg !72
  %cmp.n = icmp eq i32 %cond74, %resume.val
  br i1 %cmp.n, label %for.inc21, label %for.inc18.preheader

for.inc18.preheader:                              ; preds = %middle.block, %for.cond14.preheader.lr.ph
  %x.451.ph = phi i32 [ %x.355, %for.cond14.preheader.lr.ph ], [ %29, %middle.block ]
  %e.050.ph = phi i32 [ 0, %for.cond14.preheader.lr.ph ], [ %resume.val, %middle.block ]
  %30 = sub i32 %cond74, %e.050.ph
  %xtraiter88 = and i32 %30, 7
  %lcmp.mod89 = icmp ne i32 %xtraiter88, 0
  %lcmp.overflow90 = icmp eq i32 %30, 0
  %lcmp.or91 = or i1 %lcmp.overflow90, %lcmp.mod89
  br i1 %lcmp.or91, label %for.inc18.prol.preheader, label %for.inc18.preheader.split

for.inc18.prol.preheader:                         ; preds = %for.inc18.preheader
  br label %for.inc18.prol, !dbg !72

for.inc18.prol:                                   ; preds = %for.inc18.prol.preheader, %for.inc18.prol
  %x.451.prol = phi i32 [ %31, %for.inc18.prol ], [ %x.451.ph, %for.inc18.prol.preheader ]
  %e.050.prol = phi i32 [ %inc19.prol, %for.inc18.prol ], [ %e.050.ph, %for.inc18.prol.preheader ]
  %prol.iter92 = phi i32 [ %prol.iter92.sub, %for.inc18.prol ], [ %xtraiter88, %for.inc18.prol.preheader ]
  %31 = add i32 %cond74, %x.451.prol, !dbg !72
  %inc19.prol = add nuw nsw i32 %e.050.prol, 1, !dbg !68
  tail call void @llvm.dbg.value(metadata i32 %inc19.prol, i64 0, metadata !22, metadata !37), !dbg !79
  %exitcond.prol = icmp eq i32 %e.050.prol, %1, !dbg !80
  %prol.iter92.sub = sub i32 %prol.iter92, 1, !dbg !80
  %prol.iter92.cmp = icmp ne i32 %prol.iter92.sub, 0, !dbg !80
  br i1 %prol.iter92.cmp, label %for.inc18.prol, label %for.inc18.preheader.split.loopexit, !llvm.loop !81

for.inc18.preheader.split.loopexit:               ; preds = %for.inc18.prol
  %.lcssa87.unr.ph = phi i32 [ %31, %for.inc18.prol ]
  %x.451.unr.ph = phi i32 [ %31, %for.inc18.prol ]
  %e.050.unr.ph = phi i32 [ %inc19.prol, %for.inc18.prol ]
  br label %for.inc18.preheader.split

for.inc18.preheader.split:                        ; preds = %for.inc18.preheader.split.loopexit, %for.inc18.preheader
  %.lcssa87.unr = phi i32 [ 0, %for.inc18.preheader ], [ %.lcssa87.unr.ph, %for.inc18.preheader.split.loopexit ]
  %x.451.unr = phi i32 [ %x.451.ph, %for.inc18.preheader ], [ %x.451.unr.ph, %for.inc18.preheader.split.loopexit ]
  %e.050.unr = phi i32 [ %e.050.ph, %for.inc18.preheader ], [ %e.050.unr.ph, %for.inc18.preheader.split.loopexit ]
  %32 = icmp ult i32 %30, 8
  br i1 %32, label %for.inc21.loopexit, label %for.inc18.preheader.split.split

for.inc18.preheader.split.split:                  ; preds = %for.inc18.preheader.split
  br label %for.inc18, !dbg !72

for.inc18:                                        ; preds = %for.inc18, %for.inc18.preheader.split.split
  %x.451 = phi i32 [ %x.451.unr, %for.inc18.preheader.split.split ], [ %40, %for.inc18 ]
  %e.050 = phi i32 [ %e.050.unr, %for.inc18.preheader.split.split ], [ %inc19.7, %for.inc18 ]
  %33 = add i32 %cond74, %x.451, !dbg !72
  %inc19 = add nuw nsw i32 %e.050, 1, !dbg !68
  tail call void @llvm.dbg.value(metadata i32 %inc19, i64 0, metadata !22, metadata !37), !dbg !79
  %34 = add i32 %cond74, %33, !dbg !72
  %inc19.1 = add nuw nsw i32 %inc19, 1, !dbg !68
  tail call void @llvm.dbg.value(metadata i32 %inc19, i64 0, metadata !22, metadata !37), !dbg !79
  %35 = add i32 %cond74, %34, !dbg !72
  %inc19.2 = add nuw nsw i32 %inc19.1, 1, !dbg !68
  tail call void @llvm.dbg.value(metadata i32 %inc19, i64 0, metadata !22, metadata !37), !dbg !79
  %36 = add i32 %cond74, %35, !dbg !72
  %inc19.3 = add nuw nsw i32 %inc19.2, 1, !dbg !68
  tail call void @llvm.dbg.value(metadata i32 %inc19, i64 0, metadata !22, metadata !37), !dbg !79
  %37 = add i32 %cond74, %36, !dbg !72
  %inc19.4 = add nuw nsw i32 %inc19.3, 1, !dbg !68
  tail call void @llvm.dbg.value(metadata i32 %inc19, i64 0, metadata !22, metadata !37), !dbg !79
  %38 = add i32 %cond74, %37, !dbg !72
  %inc19.5 = add nuw nsw i32 %inc19.4, 1, !dbg !68
  tail call void @llvm.dbg.value(metadata i32 %inc19, i64 0, metadata !22, metadata !37), !dbg !79
  %39 = add i32 %cond74, %38, !dbg !72
  %inc19.6 = add nuw nsw i32 %inc19.5, 1, !dbg !68
  tail call void @llvm.dbg.value(metadata i32 %inc19, i64 0, metadata !22, metadata !37), !dbg !79
  %40 = add i32 %cond74, %39, !dbg !72
  %inc19.7 = add nuw nsw i32 %inc19.6, 1, !dbg !68
  tail call void @llvm.dbg.value(metadata i32 %inc19, i64 0, metadata !22, metadata !37), !dbg !79
  %exitcond.7 = icmp eq i32 %inc19.6, %1, !dbg !80
  br i1 %exitcond.7, label %for.inc21.loopexit.unr-lcssa, label %for.inc18, !dbg !80, !llvm.loop !82

for.inc21.loopexit.unr-lcssa:                     ; preds = %for.inc18
  %.lcssa87.ph = phi i32 [ %40, %for.inc18 ]
  br label %for.inc21.loopexit

for.inc21.loopexit:                               ; preds = %for.inc18.preheader.split, %for.inc21.loopexit.unr-lcssa
  %.lcssa87 = phi i32 [ %.lcssa87.unr, %for.inc18.preheader.split ], [ %.lcssa87.ph, %for.inc21.loopexit.unr-lcssa ]
  br label %for.inc21

for.inc21:                                        ; preds = %for.inc21.loopexit, %middle.block
  %.lcssa = phi i32 [ %29, %middle.block ], [ %.lcssa87, %for.inc21.loopexit ]
  %inc22 = add nuw nsw i32 %d.054, 1, !dbg !83
  tail call void @llvm.dbg.value(metadata i32 %inc22, i64 0, metadata !21, metadata !37), !dbg !84
  %exitcond69 = icmp eq i32 %d.054, %1, !dbg !65
  br i1 %exitcond69, label %for.inc24, label %for.cond14.preheader.lr.ph, !dbg !65

for.inc24:                                        ; preds = %for.inc21
  %.lcssa.lcssa = phi i32 [ %.lcssa, %for.inc21 ]
  %inc25 = add nuw nsw i32 %c.058, 1, !dbg !85
  tail call void @llvm.dbg.value(metadata i32 %inc25, i64 0, metadata !20, metadata !37), !dbg !86
  %exitcond70 = icmp eq i32 %c.058, %1, !dbg !62
  br i1 %exitcond70, label %for.inc27, label %for.cond11.preheader.lr.ph, !dbg !62

for.inc27:                                        ; preds = %for.inc24
  %.lcssa.lcssa.lcssa = phi i32 [ %.lcssa.lcssa, %for.inc24 ]
  %inc28 = add nuw nsw i32 %b.062, 1, !dbg !87
  tail call void @llvm.dbg.value(metadata i32 %inc28, i64 0, metadata !19, metadata !37), !dbg !88
  %exitcond71 = icmp eq i32 %b.062, %1, !dbg !60
  br i1 %exitcond71, label %for.inc30, label %for.cond8.preheader.lr.ph, !dbg !60

for.inc30:                                        ; preds = %for.inc27
  %.lcssa.lcssa.lcssa.lcssa = phi i32 [ %.lcssa.lcssa.lcssa, %for.inc27 ]
  %inc31 = add nuw nsw i32 %a.066, 1, !dbg !89
  tail call void @llvm.dbg.value(metadata i32 %inc31, i64 0, metadata !18, metadata !37), !dbg !55
  %exitcond72 = icmp eq i32 %a.066, %1, !dbg !59
  br i1 %exitcond72, label %for.end32.loopexit, label %for.cond5.preheader.lr.ph, !dbg !59

for.end32.loopexit:                               ; preds = %for.inc30
  %.lcssa.lcssa.lcssa.lcssa.lcssa = phi i32 [ %.lcssa.lcssa.lcssa.lcssa, %for.inc30 ]
  br label %for.end32

for.end32:                                        ; preds = %for.end32.loopexit, %cond.end
  %x.0.lcssa = phi i32 [ 0, %cond.end ], [ %.lcssa.lcssa.lcssa.lcssa.lcssa, %for.end32.loopexit ]
  %call33 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %x.0.lcssa) #3, !dbg !90
  ret i32 0, !dbg !91
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind
declare i64 @strtol(i8* readonly, i8** nocapture, i32) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!34, !35}
!llvm.ident = !{!36}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !9, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c] [DW_LANG_C99]
!1 = !{!"nestedloop.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4, !5, !8}
!4 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!5 = !{!"0xf\00\000\0064\0064\000\000", null, null, !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!6 = !{!"0xf\00\000\0064\0064\000\000", null, null, !7} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!7 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!8 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!9 = !{!10, !25}
!10 = !{!"0x2e\00main\00main\00\0010\000\001\000\000\00256\001\0010", !1, !11, !12, null, i32 (i32, i8**)* @main, null, null, !14} ; [ DW_TAG_subprogram ] [line 10] [def] [main]
!11 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c]
!12 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !13, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!13 = !{!4, !4, !5}
!14 = !{!15, !16, !17, !18, !19, !20, !21, !22, !23, !24}
!15 = !{!"0x101\00argc\0016777226\000", !10, !11, !4} ; [ DW_TAG_arg_variable ] [argc] [line 10]
!16 = !{!"0x101\00argv\0033554442\000", !10, !11, !5} ; [ DW_TAG_arg_variable ] [argv] [line 10]
!17 = !{!"0x100\00n\0016\000", !10, !11, !4}      ; [ DW_TAG_auto_variable ] [n] [line 16]
!18 = !{!"0x100\00a\0017\000", !10, !11, !4}      ; [ DW_TAG_auto_variable ] [a] [line 17]
!19 = !{!"0x100\00b\0017\000", !10, !11, !4}      ; [ DW_TAG_auto_variable ] [b] [line 17]
!20 = !{!"0x100\00c\0017\000", !10, !11, !4}      ; [ DW_TAG_auto_variable ] [c] [line 17]
!21 = !{!"0x100\00d\0017\000", !10, !11, !4}      ; [ DW_TAG_auto_variable ] [d] [line 17]
!22 = !{!"0x100\00e\0017\000", !10, !11, !4}      ; [ DW_TAG_auto_variable ] [e] [line 17]
!23 = !{!"0x100\00f\0017\000", !10, !11, !4}      ; [ DW_TAG_auto_variable ] [f] [line 17]
!24 = !{!"0x100\00x\0017\000", !10, !11, !4}      ; [ DW_TAG_auto_variable ] [x] [line 17]
!25 = !{!"0x2e\00atoi\00atoi\00\00278\000\001\000\000\00256\001\00279", !26, !27, !28, null, null, null, null, !32} ; [ DW_TAG_subprogram ] [line 278] [def] [scope 279] [atoi]
!26 = !{!"/usr/include/stdlib.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!27 = !{!"0x29", !26}                             ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base//usr/include/stdlib.h]
!28 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !29, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!29 = !{!4, !30}
!30 = !{!"0xf\00\000\0064\0064\000\000", null, null, !31} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!31 = !{!"0x26\00\000\000\000\000\000", null, null, !7} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!32 = !{!33}
!33 = !{!"0x101\00__nptr\0016777494\000", !25, !27, !30} ; [ DW_TAG_arg_variable ] [__nptr] [line 278]
!34 = !{i32 2, !"Dwarf Version", i32 4}
!35 = !{i32 2, !"Debug Info Version", i32 2}
!36 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!37 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!38 = !MDLocation(line: 10, column: 10, scope: !10)
!39 = !MDLocation(line: 10, column: 22, scope: !10)
!40 = !MDLocation(line: 16, column: 15, scope: !10)
!41 = !MDLocation(line: 16, column: 14, scope: !10)
!42 = !MDLocation(line: 16, column: 33, scope: !43)
!43 = !{!"0xb\001", !1, !10}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c]
!44 = !{!45, !45, i64 0}
!45 = !{!"any pointer", !46, i64 0}
!46 = !{!"omnipotent char", !47, i64 0}
!47 = !{!"Simple C/C++ TBAA"}
!48 = !{!"0x101\00__nptr\0016777494\000", !25, !27, !30, !49} ; [ DW_TAG_arg_variable ] [__nptr] [line 278]
!49 = !MDLocation(line: 16, column: 28, scope: !10)
!50 = !MDLocation(line: 278, column: 1, scope: !25, inlinedAt: !49)
!51 = !MDLocation(line: 280, column: 16, scope: !25, inlinedAt: !49)
!52 = !MDLocation(line: 280, column: 10, scope: !25, inlinedAt: !49)
!53 = !MDLocation(line: 16, column: 9, scope: !10)
!54 = !MDLocation(line: 17, column: 27, scope: !10)
!55 = !MDLocation(line: 17, column: 9, scope: !10)
!56 = !MDLocation(line: 19, column: 15, scope: !57)
!57 = !{!"0xb\0019\005\001", !1, !58}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c]
!58 = !{!"0xb\0019\005\000", !1, !10}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c]
!59 = !MDLocation(line: 19, column: 5, scope: !58)
!60 = !MDLocation(line: 20, column: 2, scope: !61)
!61 = !{!"0xb\0020\002\002", !1, !57}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c]
!62 = !MDLocation(line: 21, column: 6, scope: !63)
!63 = !{!"0xb\0021\006\004", !1, !64}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c]
!64 = !{!"0xb\0020\002\003", !1, !61}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c]
!65 = !MDLocation(line: 22, column: 3, scope: !66)
!66 = !{!"0xb\0022\003\006", !1, !67}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c]
!67 = !{!"0xb\0021\006\005", !1, !63}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c]
!68 = !MDLocation(line: 23, column: 22, scope: !69)
!69 = !{!"0xb\0023\007\009", !1, !70}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c]
!70 = !{!"0xb\0023\007\008", !1, !71}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c]
!71 = !{!"0xb\0022\003\007", !1, !66}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c]
!72 = !MDLocation(line: 24, column: 4, scope: !73)
!73 = !{!"0xb\0024\004\0010", !1, !69}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c]
!74 = distinct !{!74, !75}
!75 = !{!"llvm.loop.unroll.disable"}
!76 = distinct !{!76, !77, !78}
!77 = !{!"llvm.loop.vectorize.width", i32 1}
!78 = !{!"llvm.loop.interleave.count", i32 1}
!79 = !MDLocation(line: 17, column: 21, scope: !10)
!80 = !MDLocation(line: 23, column: 7, scope: !70)
!81 = distinct !{!81, !75}
!82 = distinct !{!82, !77, !78}
!83 = !MDLocation(line: 22, column: 18, scope: !71)
!84 = !MDLocation(line: 17, column: 18, scope: !10)
!85 = !MDLocation(line: 21, column: 21, scope: !67)
!86 = !MDLocation(line: 17, column: 15, scope: !10)
!87 = !MDLocation(line: 20, column: 17, scope: !64)
!88 = !MDLocation(line: 17, column: 12, scope: !10)
!89 = !MDLocation(line: 19, column: 20, scope: !57)
!90 = !MDLocation(line: 27, column: 5, scope: !10)
!91 = !MDLocation(line: 28, column: 5, scope: !10)
