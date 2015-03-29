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
  %cmp1133 = icmp sgt i32 %conv.i, 0, !dbg !56
  br i1 %cmp1133, label %for.cond2.preheader.lr.ph, label %for.end32, !dbg !59

for.cond2.preheader.lr.ph:                        ; preds = %entry, %cond.end
  %cond143 = phi i32 [ %conv.i, %cond.end ], [ 46, %entry ]
  %1 = add i32 %cond143, -1, !dbg !59
  %2 = lshr i32 %cond143, 3, !dbg !59
  %3 = mul i32 %2, 8, !dbg !59
  %4 = add i32 %3, -8, !dbg !59
  %5 = lshr i32 %4, 3, !dbg !59
  %6 = add i32 %5, 1, !dbg !59
  br label %for.cond5.preheader.lr.ph, !dbg !59

for.cond5.preheader.lr.ph:                        ; preds = %for.cond2.preheader.lr.ph, %for.inc30
  %x.0135 = phi i32 [ 0, %for.cond2.preheader.lr.ph ], [ %.lcssa.lcssa.lcssa.lcssa, %for.inc30 ]
  %a.0134 = phi i32 [ 0, %for.cond2.preheader.lr.ph ], [ %inc31, %for.inc30 ]
  br label %for.cond8.preheader.lr.ph, !dbg !60

for.cond8.preheader.lr.ph:                        ; preds = %for.cond5.preheader.lr.ph, %for.inc27
  %x.1131 = phi i32 [ %x.0135, %for.cond5.preheader.lr.ph ], [ %.lcssa.lcssa.lcssa, %for.inc27 ]
  %b.0130 = phi i32 [ 0, %for.cond5.preheader.lr.ph ], [ %inc28, %for.inc27 ]
  br label %for.cond11.preheader.lr.ph.split.us, !dbg !62

for.cond11.preheader.lr.ph.split.us:              ; preds = %for.inc24, %for.cond8.preheader.lr.ph
  %x.2127 = phi i32 [ %x.1131, %for.cond8.preheader.lr.ph ], [ %.lcssa.lcssa, %for.inc24 ]
  %c.0126 = phi i32 [ 0, %for.cond8.preheader.lr.ph ], [ %inc25, %for.inc24 ]
  br label %for.cond14.preheader.lr.ph.split.us.us, !dbg !65

for.inc21.us.loopexit.unr-lcssa:                  ; preds = %for.inc18.us.us
  %.lcssa156.ph = phi i32 [ %14, %for.inc18.us.us ]
  br label %for.inc21.us.loopexit

for.inc21.us.loopexit:                            ; preds = %for.inc18.us.us.preheader.split, %for.inc21.us.loopexit.unr-lcssa
  %.lcssa156 = phi i32 [ %.lcssa156.unr, %for.inc18.us.us.preheader.split ], [ %.lcssa156.ph, %for.inc21.us.loopexit.unr-lcssa ]
  br label %for.inc21.us

for.inc21.us:                                     ; preds = %for.inc21.us.loopexit, %middle.block
  %.lcssa = phi i32 [ %40, %middle.block ], [ %.lcssa156, %for.inc21.us.loopexit ]
  %inc22.us = add nuw nsw i32 %d.054.us, 1, !dbg !68
  tail call void @llvm.dbg.value(metadata i32 %inc22.us, i64 0, metadata !21, metadata !37), !dbg !70
  %exitcond137 = icmp eq i32 %d.054.us, %1, !dbg !65
  br i1 %exitcond137, label %for.inc24, label %for.cond14.preheader.lr.ph.split.us.us, !dbg !65

for.inc18.us.us:                                  ; preds = %for.inc18.us.us, %for.inc18.us.us.preheader.split.split
  %x.451.us.us = phi i32 [ %x.451.us.us.unr, %for.inc18.us.us.preheader.split.split ], [ %14, %for.inc18.us.us ]
  %e.050.us.us = phi i32 [ %e.050.us.us.unr, %for.inc18.us.us.preheader.split.split ], [ %inc19.us.us.7, %for.inc18.us.us ]
  %7 = add i32 %cond143, %x.451.us.us, !dbg !71
  %inc19.us.us = add nuw nsw i32 %e.050.us.us, 1, !dbg !75
  tail call void @llvm.dbg.value(metadata i32 %inc19.us.us, i64 0, metadata !22, metadata !37), !dbg !76
  %8 = add i32 %cond143, %7, !dbg !71
  %inc19.us.us.1 = add nuw nsw i32 %inc19.us.us, 1, !dbg !75
  tail call void @llvm.dbg.value(metadata i32 %inc19.us.us, i64 0, metadata !22, metadata !37), !dbg !76
  %9 = add i32 %cond143, %8, !dbg !71
  %inc19.us.us.2 = add nuw nsw i32 %inc19.us.us.1, 1, !dbg !75
  tail call void @llvm.dbg.value(metadata i32 %inc19.us.us, i64 0, metadata !22, metadata !37), !dbg !76
  %10 = add i32 %cond143, %9, !dbg !71
  %inc19.us.us.3 = add nuw nsw i32 %inc19.us.us.2, 1, !dbg !75
  tail call void @llvm.dbg.value(metadata i32 %inc19.us.us, i64 0, metadata !22, metadata !37), !dbg !76
  %11 = add i32 %cond143, %10, !dbg !71
  %inc19.us.us.4 = add nuw nsw i32 %inc19.us.us.3, 1, !dbg !75
  tail call void @llvm.dbg.value(metadata i32 %inc19.us.us, i64 0, metadata !22, metadata !37), !dbg !76
  %12 = add i32 %cond143, %11, !dbg !71
  %inc19.us.us.5 = add nuw nsw i32 %inc19.us.us.4, 1, !dbg !75
  tail call void @llvm.dbg.value(metadata i32 %inc19.us.us, i64 0, metadata !22, metadata !37), !dbg !76
  %13 = add i32 %cond143, %12, !dbg !71
  %inc19.us.us.6 = add nuw nsw i32 %inc19.us.us.5, 1, !dbg !75
  tail call void @llvm.dbg.value(metadata i32 %inc19.us.us, i64 0, metadata !22, metadata !37), !dbg !76
  %14 = add i32 %cond143, %13, !dbg !71
  %inc19.us.us.7 = add nuw nsw i32 %inc19.us.us.6, 1, !dbg !75
  tail call void @llvm.dbg.value(metadata i32 %inc19.us.us, i64 0, metadata !22, metadata !37), !dbg !76
  %exitcond.7 = icmp eq i32 %inc19.us.us.6, %1, !dbg !77
  br i1 %exitcond.7, label %for.inc21.us.loopexit.unr-lcssa, label %for.inc18.us.us, !dbg !77, !llvm.loop !78

for.cond14.preheader.lr.ph.split.us.us:           ; preds = %for.inc21.us, %for.cond11.preheader.lr.ph.split.us
  %x.355.us = phi i32 [ %x.2127, %for.cond11.preheader.lr.ph.split.us ], [ %.lcssa, %for.inc21.us ]
  %d.054.us = phi i32 [ 0, %for.cond11.preheader.lr.ph.split.us ], [ %inc22.us, %for.inc21.us ]
  %backedge.overflow = icmp eq i32 %cond143, 0
  br i1 %backedge.overflow, label %for.inc18.us.us.preheader, label %overflow.checked

for.inc18.us.us.preheader:                        ; preds = %middle.block, %for.cond14.preheader.lr.ph.split.us.us
  %x.451.us.us.ph = phi i32 [ %x.355.us, %for.cond14.preheader.lr.ph.split.us.us ], [ %40, %middle.block ]
  %e.050.us.us.ph = phi i32 [ 0, %for.cond14.preheader.lr.ph.split.us.us ], [ %resume.val, %middle.block ]
  %15 = sub i32 %cond143, %e.050.us.us.ph
  %xtraiter157 = and i32 %15, 7
  %lcmp.mod158 = icmp ne i32 %xtraiter157, 0
  %lcmp.overflow159 = icmp eq i32 %15, 0
  %lcmp.or160 = or i1 %lcmp.overflow159, %lcmp.mod158
  br i1 %lcmp.or160, label %for.inc18.us.us.prol.preheader, label %for.inc18.us.us.preheader.split

for.inc18.us.us.prol.preheader:                   ; preds = %for.inc18.us.us.preheader
  br label %for.inc18.us.us.prol, !dbg !71

for.inc18.us.us.prol:                             ; preds = %for.inc18.us.us.prol.preheader, %for.inc18.us.us.prol
  %x.451.us.us.prol = phi i32 [ %16, %for.inc18.us.us.prol ], [ %x.451.us.us.ph, %for.inc18.us.us.prol.preheader ]
  %e.050.us.us.prol = phi i32 [ %inc19.us.us.prol, %for.inc18.us.us.prol ], [ %e.050.us.us.ph, %for.inc18.us.us.prol.preheader ]
  %prol.iter161 = phi i32 [ %prol.iter161.sub, %for.inc18.us.us.prol ], [ %xtraiter157, %for.inc18.us.us.prol.preheader ]
  %16 = add i32 %cond143, %x.451.us.us.prol, !dbg !71
  %inc19.us.us.prol = add nuw nsw i32 %e.050.us.us.prol, 1, !dbg !75
  tail call void @llvm.dbg.value(metadata i32 %inc19.us.us.prol, i64 0, metadata !22, metadata !37), !dbg !76
  %exitcond.prol = icmp eq i32 %e.050.us.us.prol, %1, !dbg !77
  %prol.iter161.sub = sub i32 %prol.iter161, 1, !dbg !77
  %prol.iter161.cmp = icmp ne i32 %prol.iter161.sub, 0, !dbg !77
  br i1 %prol.iter161.cmp, label %for.inc18.us.us.prol, label %for.inc18.us.us.preheader.split.loopexit, !llvm.loop !81

for.inc18.us.us.preheader.split.loopexit:         ; preds = %for.inc18.us.us.prol
  %.lcssa156.unr.ph = phi i32 [ %16, %for.inc18.us.us.prol ]
  %x.451.us.us.unr.ph = phi i32 [ %16, %for.inc18.us.us.prol ]
  %e.050.us.us.unr.ph = phi i32 [ %inc19.us.us.prol, %for.inc18.us.us.prol ]
  br label %for.inc18.us.us.preheader.split

for.inc18.us.us.preheader.split:                  ; preds = %for.inc18.us.us.preheader.split.loopexit, %for.inc18.us.us.preheader
  %.lcssa156.unr = phi i32 [ 0, %for.inc18.us.us.preheader ], [ %.lcssa156.unr.ph, %for.inc18.us.us.preheader.split.loopexit ]
  %x.451.us.us.unr = phi i32 [ %x.451.us.us.ph, %for.inc18.us.us.preheader ], [ %x.451.us.us.unr.ph, %for.inc18.us.us.preheader.split.loopexit ]
  %e.050.us.us.unr = phi i32 [ %e.050.us.us.ph, %for.inc18.us.us.preheader ], [ %e.050.us.us.unr.ph, %for.inc18.us.us.preheader.split.loopexit ]
  %17 = icmp ult i32 %15, 8
  br i1 %17, label %for.inc21.us.loopexit, label %for.inc18.us.us.preheader.split.split

for.inc18.us.us.preheader.split.split:            ; preds = %for.inc18.us.us.preheader.split
  br label %for.inc18.us.us, !dbg !71

overflow.checked:                                 ; preds = %for.cond14.preheader.lr.ph.split.us.us
  %n.vec = and i32 %cond143, -8, !dbg !75
  %cmp.zero = icmp eq i32 %n.vec, 0, !dbg !75
  %18 = insertelement <4 x i32> <i32 undef, i32 0, i32 0, i32 0>, i32 %x.355.us, i32 0
  br i1 %cmp.zero, label %middle.block, label %vector.ph

vector.ph:                                        ; preds = %overflow.checked
  %broadcast.splatinsert146 = insertelement <4 x i32> undef, i32 %cond143, i32 0
  %broadcast.splat147 = shufflevector <4 x i32> %broadcast.splatinsert146, <4 x i32> undef, <4 x i32> zeroinitializer
  %xtraiter = and i32 %6, 7
  %lcmp.mod = icmp ne i32 %xtraiter, 0
  %lcmp.overflow = icmp eq i32 %6, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %vector.body.prol.preheader, label %vector.ph.split

vector.body.prol.preheader:                       ; preds = %vector.ph
  br label %vector.body.prol, !dbg !71

vector.body.prol:                                 ; preds = %vector.body.prol.preheader, %vector.body.prol
  %index.prol = phi i32 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ], !dbg !75
  %vec.phi.prol = phi <4 x i32> [ %19, %vector.body.prol ], [ %18, %vector.body.prol.preheader ]
  %vec.phi144.prol = phi <4 x i32> [ %20, %vector.body.prol ], [ zeroinitializer, %vector.body.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %vector.body.prol ], [ %xtraiter, %vector.body.prol.preheader ]
  %19 = add <4 x i32> %broadcast.splat147, %vec.phi.prol, !dbg !71
  %20 = add <4 x i32> %broadcast.splat147, %vec.phi144.prol, !dbg !71
  %index.next.prol = add i32 %index.prol, 8, !dbg !75
  %21 = icmp eq i32 %index.next.prol, %n.vec, !dbg !75
  %prol.iter.sub = sub i32 %prol.iter, 1, !dbg !75
  %prol.iter.cmp = icmp ne i32 %prol.iter.sub, 0, !dbg !75
  br i1 %prol.iter.cmp, label %vector.body.prol, label %vector.ph.split.loopexit, !llvm.loop !83

vector.ph.split.loopexit:                         ; preds = %vector.body.prol
  %.lcssa155.unr.ph = phi <4 x i32> [ %20, %vector.body.prol ]
  %.lcssa154.unr.ph = phi <4 x i32> [ %19, %vector.body.prol ]
  %index.unr.ph = phi i32 [ %index.next.prol, %vector.body.prol ]
  %vec.phi.unr.ph = phi <4 x i32> [ %19, %vector.body.prol ]
  %vec.phi144.unr.ph = phi <4 x i32> [ %20, %vector.body.prol ]
  br label %vector.ph.split

vector.ph.split:                                  ; preds = %vector.ph.split.loopexit, %vector.ph
  %.lcssa155.unr = phi <4 x i32> [ zeroinitializer, %vector.ph ], [ %.lcssa155.unr.ph, %vector.ph.split.loopexit ]
  %.lcssa154.unr = phi <4 x i32> [ zeroinitializer, %vector.ph ], [ %.lcssa154.unr.ph, %vector.ph.split.loopexit ]
  %index.unr = phi i32 [ 0, %vector.ph ], [ %index.unr.ph, %vector.ph.split.loopexit ]
  %vec.phi.unr = phi <4 x i32> [ %18, %vector.ph ], [ %vec.phi.unr.ph, %vector.ph.split.loopexit ]
  %vec.phi144.unr = phi <4 x i32> [ zeroinitializer, %vector.ph ], [ %vec.phi144.unr.ph, %vector.ph.split.loopexit ]
  %22 = icmp ult i32 %6, 8
  br i1 %22, label %middle.block.loopexit, label %vector.ph.split.split

vector.ph.split.split:                            ; preds = %vector.ph.split
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph.split.split
  %index = phi i32 [ %index.unr, %vector.ph.split.split ], [ %index.next.7, %vector.body ], !dbg !75
  %vec.phi = phi <4 x i32> [ %vec.phi.unr, %vector.ph.split.split ], [ %37, %vector.body ]
  %vec.phi144 = phi <4 x i32> [ %vec.phi144.unr, %vector.ph.split.split ], [ %38, %vector.body ]
  %23 = add <4 x i32> %broadcast.splat147, %vec.phi, !dbg !71
  %24 = add <4 x i32> %broadcast.splat147, %vec.phi144, !dbg !71
  %index.next = add i32 %index, 8, !dbg !75
  %25 = add <4 x i32> %broadcast.splat147, %23, !dbg !71
  %26 = add <4 x i32> %broadcast.splat147, %24, !dbg !71
  %index.next.1 = add i32 %index.next, 8, !dbg !75
  %27 = add <4 x i32> %broadcast.splat147, %25, !dbg !71
  %28 = add <4 x i32> %broadcast.splat147, %26, !dbg !71
  %index.next.2 = add i32 %index.next.1, 8, !dbg !75
  %29 = add <4 x i32> %broadcast.splat147, %27, !dbg !71
  %30 = add <4 x i32> %broadcast.splat147, %28, !dbg !71
  %index.next.3 = add i32 %index.next.2, 8, !dbg !75
  %31 = add <4 x i32> %broadcast.splat147, %29, !dbg !71
  %32 = add <4 x i32> %broadcast.splat147, %30, !dbg !71
  %index.next.4 = add i32 %index.next.3, 8, !dbg !75
  %33 = add <4 x i32> %broadcast.splat147, %31, !dbg !71
  %34 = add <4 x i32> %broadcast.splat147, %32, !dbg !71
  %index.next.5 = add i32 %index.next.4, 8, !dbg !75
  %35 = add <4 x i32> %broadcast.splat147, %33, !dbg !71
  %36 = add <4 x i32> %broadcast.splat147, %34, !dbg !71
  %index.next.6 = add i32 %index.next.5, 8, !dbg !75
  %37 = add <4 x i32> %broadcast.splat147, %35, !dbg !71
  %38 = add <4 x i32> %broadcast.splat147, %36, !dbg !71
  %index.next.7 = add i32 %index.next.6, 8, !dbg !75
  %39 = icmp eq i32 %index.next.7, %n.vec, !dbg !75
  br i1 %39, label %middle.block.loopexit.unr-lcssa, label %vector.body, !dbg !75, !llvm.loop !84

middle.block.loopexit.unr-lcssa:                  ; preds = %vector.body
  %.lcssa155.ph = phi <4 x i32> [ %38, %vector.body ]
  %.lcssa154.ph = phi <4 x i32> [ %37, %vector.body ]
  br label %middle.block.loopexit

middle.block.loopexit:                            ; preds = %vector.ph.split, %middle.block.loopexit.unr-lcssa
  %.lcssa155 = phi <4 x i32> [ %.lcssa155.unr, %vector.ph.split ], [ %.lcssa155.ph, %middle.block.loopexit.unr-lcssa ]
  %.lcssa154 = phi <4 x i32> [ %.lcssa154.unr, %vector.ph.split ], [ %.lcssa154.ph, %middle.block.loopexit.unr-lcssa ]
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %overflow.checked
  %resume.val = phi i32 [ 0, %overflow.checked ], [ %n.vec, %middle.block.loopexit ]
  %rdx.vec.exit.phi = phi <4 x i32> [ %18, %overflow.checked ], [ %.lcssa154, %middle.block.loopexit ], !dbg !71
  %rdx.vec.exit.phi150 = phi <4 x i32> [ zeroinitializer, %overflow.checked ], [ %.lcssa155, %middle.block.loopexit ], !dbg !71
  %bin.rdx = add <4 x i32> %rdx.vec.exit.phi150, %rdx.vec.exit.phi, !dbg !71
  %rdx.shuf = shufflevector <4 x i32> %bin.rdx, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>, !dbg !71
  %bin.rdx151 = add <4 x i32> %bin.rdx, %rdx.shuf, !dbg !71
  %rdx.shuf152 = shufflevector <4 x i32> %bin.rdx151, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>, !dbg !71
  %bin.rdx153 = add <4 x i32> %bin.rdx151, %rdx.shuf152, !dbg !71
  %40 = extractelement <4 x i32> %bin.rdx153, i32 0, !dbg !71
  %cmp.n = icmp eq i32 %cond143, %resume.val
  br i1 %cmp.n, label %for.inc21.us, label %for.inc18.us.us.preheader

for.inc24:                                        ; preds = %for.inc21.us
  %.lcssa.lcssa = phi i32 [ %.lcssa, %for.inc21.us ]
  %inc25 = add nuw nsw i32 %c.0126, 1, !dbg !85
  tail call void @llvm.dbg.value(metadata i32 %inc25, i64 0, metadata !20, metadata !37), !dbg !86
  %exitcond139 = icmp eq i32 %c.0126, %1, !dbg !62
  br i1 %exitcond139, label %for.inc27, label %for.cond11.preheader.lr.ph.split.us, !dbg !62

for.inc27:                                        ; preds = %for.inc24
  %.lcssa.lcssa.lcssa = phi i32 [ %.lcssa.lcssa, %for.inc24 ]
  %inc28 = add nuw nsw i32 %b.0130, 1, !dbg !87
  tail call void @llvm.dbg.value(metadata i32 %inc28, i64 0, metadata !19, metadata !37), !dbg !88
  %exitcond140 = icmp eq i32 %b.0130, %1, !dbg !60
  br i1 %exitcond140, label %for.inc30, label %for.cond8.preheader.lr.ph, !dbg !60

for.inc30:                                        ; preds = %for.inc27
  %.lcssa.lcssa.lcssa.lcssa = phi i32 [ %.lcssa.lcssa.lcssa, %for.inc27 ]
  %inc31 = add nuw nsw i32 %a.0134, 1, !dbg !89
  tail call void @llvm.dbg.value(metadata i32 %inc31, i64 0, metadata !18, metadata !37), !dbg !55
  %exitcond141 = icmp eq i32 %a.0134, %1, !dbg !59
  br i1 %exitcond141, label %for.end32.loopexit, label %for.cond5.preheader.lr.ph, !dbg !59

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
!68 = !MDLocation(line: 22, column: 18, scope: !69)
!69 = !{!"0xb\0022\003\007", !1, !66}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c]
!70 = !MDLocation(line: 17, column: 18, scope: !10)
!71 = !MDLocation(line: 24, column: 4, scope: !72)
!72 = !{!"0xb\0024\004\0010", !1, !73}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c]
!73 = !{!"0xb\0023\007\009", !1, !74}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c]
!74 = !{!"0xb\0023\007\008", !1, !69}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c]
!75 = !MDLocation(line: 23, column: 22, scope: !73)
!76 = !MDLocation(line: 17, column: 21, scope: !10)
!77 = !MDLocation(line: 23, column: 7, scope: !74)
!78 = distinct !{!78, !79, !80}
!79 = !{!"llvm.loop.vectorize.width", i32 1}
!80 = !{!"llvm.loop.interleave.count", i32 1}
!81 = distinct !{!81, !82}
!82 = !{!"llvm.loop.unroll.disable"}
!83 = distinct !{!83, !82}
!84 = distinct !{!84, !79, !80}
!85 = !MDLocation(line: 21, column: 21, scope: !67)
!86 = !MDLocation(line: 17, column: 15, scope: !10)
!87 = !MDLocation(line: 20, column: 17, scope: !64)
!88 = !MDLocation(line: 17, column: 12, scope: !10)
!89 = !MDLocation(line: 19, column: 20, scope: !57)
!90 = !MDLocation(line: 27, column: 5, scope: !10)
!91 = !MDLocation(line: 28, column: 5, scope: !10)
