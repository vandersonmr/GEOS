; ModuleID = 'sgefa.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.FULL = type { i32, i32, [1000 x float*] }

; Function Attrs: nounwind uwtable
define i32 @sgefa(%struct.FULL* nocapture readonly %a, i32* nocapture %ipvt) #0 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.FULL* %a, i64 0, metadata !23, metadata !40), !dbg !41
  tail call void @llvm.dbg.value(metadata i32* %ipvt, i64 0, metadata !24, metadata !40), !dbg !42
  %cd = getelementptr inbounds %struct.FULL* %a, i64 0, i32 0, !dbg !43
  %0 = load i32* %cd, align 4, !dbg !43, !tbaa !45
  %rd = getelementptr inbounds %struct.FULL* %a, i64 0, i32 1, !dbg !50
  %1 = load i32* %rd, align 4, !dbg !50, !tbaa !51
  %cmp = icmp eq i32 %0, %1, !dbg !43
  br i1 %cmp, label %if.end, label %return, !dbg !52

if.end:                                           ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !31, metadata !40), !dbg !53
  %sub = add i32 %0, -1, !dbg !54
  tail call void @llvm.dbg.value(metadata i32 %sub, i64 0, metadata !29, metadata !40), !dbg !55
  %arrayidx = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 0, !dbg !56
  %2 = load float** %arrayidx, align 8, !dbg !56, !tbaa !57
  tail call void @llvm.dbg.value(metadata float* %2, i64 0, metadata !33, metadata !40), !dbg !59
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !30, metadata !40), !dbg !60
  %cmp2 = icmp slt i32 %0, 2, !dbg !61
  br i1 %cmp2, label %CLEAN_UP, label %for.body.lr.ph, !dbg !63

for.body.lr.ph:                                   ; preds = %if.end
  %3 = sext i32 %0 to i64, !dbg !64
  %4 = sext i32 %sub to i64, !dbg !64
  %5 = icmp sgt i32 %sub, 1
  %sub.op = add i32 %0, -2, !dbg !64
  %6 = zext i32 %sub.op to i64
  %.op = add nuw nsw i64 %6, 1, !dbg !64
  %7 = select i1 %5, i64 %.op, i64 1, !dbg !64
  %8 = add i32 %0, -1, !dbg !66
  %9 = add i32 %0, -1, !dbg !66
  %10 = add i32 %0, -1, !dbg !66
  %11 = add i32 %0, -1, !dbg !66
  %12 = add i32 %0, -1, !dbg !72
  %13 = add i32 %0, -1
  %14 = add i32 %0, -1, !dbg !66
  %15 = add i32 %0, -1, !dbg !66
  br label %for.body, !dbg !64

for.body:                                         ; preds = %for.inc86.for.body_crit_edge, %for.body.lr.ph
  %16 = phi float* [ %2, %for.body.lr.ph ], [ %.pre, %for.inc86.for.body_crit_edge ]
  %indvars.iv225 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next226.pre-phi, %for.inc86.for.body_crit_edge ]
  %indvars.iv218 = phi i64 [ 1, %for.body.lr.ph ], [ %indvars.iv.next219, %for.inc86.for.body_crit_edge ]
  %ipvt.addr.0201 = phi i32* [ %ipvt, %for.body.lr.ph ], [ %incdec.ptr88, %for.inc86.for.body_crit_edge ]
  %info.0200 = phi i32 [ 0, %for.body.lr.ph ], [ %info.1, %for.inc86.for.body_crit_edge ]
  %arrayidx7 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv225, !dbg !74
  %add.ptr = getelementptr inbounds float* %16, i64 %indvars.iv225, !dbg !74
  tail call void @llvm.dbg.value(metadata float* %add.ptr, i64 0, metadata !33, metadata !40), !dbg !59
  %17 = sub nsw i64 %3, %indvars.iv225, !dbg !75
  %18 = trunc i64 %17 to i32, !dbg !76
  %call = tail call i32 (i32, float*, i32, ...)* bitcast (i32 (...)* @isamax to i32 (i32, float*, i32, ...)*)(i32 %18, float* %add.ptr, i32 1) #3, !dbg !76
  %19 = trunc i64 %indvars.iv225 to i32, !dbg !76
  %add = add nsw i32 %call, %19, !dbg !76
  tail call void @llvm.dbg.value(metadata i32 %add, i64 0, metadata !28, metadata !40), !dbg !77
  store i32 %add, i32* %ipvt.addr.0201, align 4, !dbg !78, !tbaa !79
  %20 = load float** %arrayidx7, align 8, !dbg !80, !tbaa !57
  %idx.ext12 = sext i32 %add to i64, !dbg !80
  %add.ptr13 = getelementptr inbounds float* %20, i64 %idx.ext12, !dbg !80
  tail call void @llvm.dbg.value(metadata float* %add.ptr13, i64 0, metadata !34, metadata !40), !dbg !81
  %21 = load float* %add.ptr13, align 4, !dbg !82, !tbaa !84
  %cmp14 = fcmp oeq float %21, 0.000000e+00, !dbg !82
  br i1 %cmp14, label %for.body.for.inc86_crit_edge, label %if.end17, !dbg !86

for.body.for.inc86_crit_edge:                     ; preds = %for.body
  %indvars.iv.next226.pre = add nuw nsw i64 %indvars.iv225, 1, !dbg !64
  br label %for.inc86, !dbg !86

if.end17:                                         ; preds = %for.body
  %cmp18 = icmp ne i32 %call, 0, !dbg !87
  %22 = load float* %add.ptr, align 4, !dbg !89, !tbaa !84
  br i1 %cmp18, label %if.then20, label %if.end21, !dbg !91

if.then20:                                        ; preds = %if.end17
  tail call void @llvm.dbg.value(metadata float %21, i64 0, metadata !32, metadata !40), !dbg !92
  store float %22, float* %add.ptr13, align 4, !dbg !93, !tbaa !84
  store float %21, float* %add.ptr, align 4, !dbg !94, !tbaa !84
  br label %if.end21, !dbg !95

if.end21:                                         ; preds = %if.end17, %if.then20
  %23 = phi float [ %21, %if.then20 ], [ %22, %if.end17 ]
  %conv23 = fdiv float -1.000000e+00, %23, !dbg !96
  tail call void @llvm.dbg.value(metadata float %conv23, i64 0, metadata !32, metadata !40), !dbg !92
  %24 = add nuw nsw i64 %indvars.iv225, 1, !dbg !97
  %add.ptr25 = getelementptr inbounds float* %16, i64 %24, !dbg !98
  tail call void @llvm.dbg.value(metadata float* %add.ptr25, i64 0, metadata !36, metadata !40), !dbg !99
  %cmp27161 = icmp slt i64 %24, %3, !dbg !100
  br i1 %cmp27161, label %for.body29.lr.ph, label %for.inc86, !dbg !72

for.body29.lr.ph:                                 ; preds = %if.end21
  %25 = and i64 %24, 4294967295, !dbg !72
  %26 = add i64 %indvars.iv225, 1, !dbg !72
  %27 = trunc i64 %26 to i32
  %28 = sub i32 %12, %27, !dbg !72
  %29 = zext i32 %28 to i64
  %30 = add nuw nsw i64 %29, 1, !dbg !72
  %end.idx359 = add nuw nsw i64 %30, %25, !dbg !72
  %n.vec361 = and i64 %30, 8589934584, !dbg !72
  %end.idx.rnd.down362 = add nuw nsw i64 %n.vec361, %25, !dbg !72
  %cmp.zero363 = icmp eq i64 %n.vec361, 0, !dbg !72
  %add.ptr25.sum = add i64 %24, %n.vec361
  %ptr.ind.end367 = getelementptr float* %16, i64 %add.ptr25.sum
  br i1 %cmp.zero363, label %middle.block356, label %vector.ph354

vector.ph354:                                     ; preds = %for.body29.lr.ph
  %broadcast.splatinsert405 = insertelement <4 x float> undef, float %conv23, i32 0
  %broadcast.splat406 = shufflevector <4 x float> %broadcast.splatinsert405, <4 x float> undef, <4 x i32> zeroinitializer
  %31 = add i64 %indvars.iv225, 1
  %32 = trunc i64 %31 to i32
  %33 = sub i32 %13, %32
  %34 = zext i32 %33 to i64
  %35 = add i64 %34, 1
  %36 = lshr i64 %35, 3
  %37 = mul i64 %36, 8
  %38 = add i64 %37, -8
  %39 = lshr i64 %38, 3
  %40 = add i64 %39, 1
  %xtraiter = and i64 %40, 1
  %lcmp.mod = icmp ne i64 %xtraiter, 0
  %lcmp.overflow = icmp eq i64 %40, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %vector.body355.prol.preheader, label %vector.ph354.split

vector.body355.prol.preheader:                    ; preds = %vector.ph354
  br label %vector.body355.prol

vector.body355.prol:                              ; preds = %vector.body355.prol.preheader, %vector.body355.prol
  %index358.prol = phi i64 [ %index.next373.prol, %vector.body355.prol ], [ %25, %vector.body355.prol.preheader ], !dbg !72
  %prol.iter = phi i64 [ %prol.iter.sub, %vector.body355.prol ], [ %xtraiter, %vector.body355.prol.preheader ]
  %normalized.idx374.prol = sub i64 %index358.prol, %25
  %add.ptr25.sum409.prol = add i64 %24, %normalized.idx374.prol
  %next.gep376.prol = getelementptr float* %16, i64 %add.ptr25.sum409.prol
  %41 = bitcast float* %next.gep376.prol to <4 x float>*, !dbg !102
  %wide.load403.prol = load <4 x float>* %41, align 4, !dbg !102, !tbaa !84
  %next.gep376.sum.prol = add i64 %add.ptr25.sum409.prol, 4, !dbg !102
  %42 = getelementptr float* %16, i64 %next.gep376.sum.prol, !dbg !102
  %43 = bitcast float* %42 to <4 x float>*, !dbg !102
  %wide.load404.prol = load <4 x float>* %43, align 4, !dbg !102, !tbaa !84
  %44 = fmul <4 x float> %broadcast.splat406, %wide.load403.prol, !dbg !102
  %45 = fmul <4 x float> %broadcast.splat406, %wide.load404.prol, !dbg !102
  %46 = bitcast float* %next.gep376.prol to <4 x float>*, !dbg !102
  store <4 x float> %44, <4 x float>* %46, align 4, !dbg !102, !tbaa !84
  %47 = bitcast float* %42 to <4 x float>*, !dbg !102
  store <4 x float> %45, <4 x float>* %47, align 4, !dbg !102, !tbaa !84
  %index.next373.prol = add i64 %index358.prol, 8, !dbg !72
  %48 = icmp eq i64 %index.next373.prol, %end.idx.rnd.down362, !dbg !72
  %prol.iter.sub = sub i64 %prol.iter, 1, !dbg !72
  %prol.iter.cmp = icmp ne i64 %prol.iter.sub, 0, !dbg !72
  br i1 %prol.iter.cmp, label %vector.body355.prol, label %vector.ph354.split.loopexit, !llvm.loop !103

vector.ph354.split.loopexit:                      ; preds = %vector.body355.prol
  %index358.unr.ph = phi i64 [ %index.next373.prol, %vector.body355.prol ]
  br label %vector.ph354.split

vector.ph354.split:                               ; preds = %vector.ph354.split.loopexit, %vector.ph354
  %index358.unr = phi i64 [ %25, %vector.ph354 ], [ %index358.unr.ph, %vector.ph354.split.loopexit ]
  %49 = icmp ult i64 %40, 2
  br i1 %49, label %middle.block356.loopexit, label %vector.ph354.split.split

vector.ph354.split.split:                         ; preds = %vector.ph354.split
  br label %vector.body355

vector.body355:                                   ; preds = %vector.body355, %vector.ph354.split.split
  %index358 = phi i64 [ %index358.unr, %vector.ph354.split.split ], [ %index.next373.1, %vector.body355 ], !dbg !72
  %normalized.idx374 = sub i64 %index358, %25
  %add.ptr25.sum409 = add i64 %24, %normalized.idx374
  %next.gep376 = getelementptr float* %16, i64 %add.ptr25.sum409
  %50 = bitcast float* %next.gep376 to <4 x float>*, !dbg !102
  %wide.load403 = load <4 x float>* %50, align 4, !dbg !102, !tbaa !84
  %next.gep376.sum = add i64 %add.ptr25.sum409, 4, !dbg !102
  %51 = getelementptr float* %16, i64 %next.gep376.sum, !dbg !102
  %52 = bitcast float* %51 to <4 x float>*, !dbg !102
  %wide.load404 = load <4 x float>* %52, align 4, !dbg !102, !tbaa !84
  %53 = fmul <4 x float> %broadcast.splat406, %wide.load403, !dbg !102
  %54 = fmul <4 x float> %broadcast.splat406, %wide.load404, !dbg !102
  %55 = bitcast float* %next.gep376 to <4 x float>*, !dbg !102
  store <4 x float> %53, <4 x float>* %55, align 4, !dbg !102, !tbaa !84
  %56 = bitcast float* %51 to <4 x float>*, !dbg !102
  store <4 x float> %54, <4 x float>* %56, align 4, !dbg !102, !tbaa !84
  %index.next373 = add i64 %index358, 8, !dbg !72
  %normalized.idx374.1 = sub i64 %index.next373, %25
  %add.ptr25.sum409.1 = add i64 %24, %normalized.idx374.1
  %next.gep376.1 = getelementptr float* %16, i64 %add.ptr25.sum409.1
  %57 = bitcast float* %next.gep376.1 to <4 x float>*, !dbg !102
  %wide.load403.1 = load <4 x float>* %57, align 4, !dbg !102, !tbaa !84
  %next.gep376.sum.1 = add i64 %add.ptr25.sum409.1, 4, !dbg !102
  %58 = getelementptr float* %16, i64 %next.gep376.sum.1, !dbg !102
  %59 = bitcast float* %58 to <4 x float>*, !dbg !102
  %wide.load404.1 = load <4 x float>* %59, align 4, !dbg !102, !tbaa !84
  %60 = fmul <4 x float> %broadcast.splat406, %wide.load403.1, !dbg !102
  %61 = fmul <4 x float> %broadcast.splat406, %wide.load404.1, !dbg !102
  %62 = bitcast float* %next.gep376.1 to <4 x float>*, !dbg !102
  store <4 x float> %60, <4 x float>* %62, align 4, !dbg !102, !tbaa !84
  %63 = bitcast float* %58 to <4 x float>*, !dbg !102
  store <4 x float> %61, <4 x float>* %63, align 4, !dbg !102, !tbaa !84
  %index.next373.1 = add i64 %index.next373, 8, !dbg !72
  %64 = icmp eq i64 %index.next373.1, %end.idx.rnd.down362, !dbg !72
  br i1 %64, label %middle.block356.loopexit.unr-lcssa, label %vector.body355, !dbg !72, !llvm.loop !105

middle.block356.loopexit.unr-lcssa:               ; preds = %vector.body355
  br label %middle.block356.loopexit

middle.block356.loopexit:                         ; preds = %vector.ph354.split, %middle.block356.loopexit.unr-lcssa
  br label %middle.block356

middle.block356:                                  ; preds = %middle.block356.loopexit, %for.body29.lr.ph
  %resume.val365 = phi float* [ %add.ptr25, %for.body29.lr.ph ], [ %ptr.ind.end367, %middle.block356.loopexit ]
  %resume.val368 = phi i64 [ %25, %for.body29.lr.ph ], [ %end.idx.rnd.down362, %middle.block356.loopexit ]
  %trunc.resume.val369.in = phi i64 [ %24, %for.body29.lr.ph ], [ %end.idx.rnd.down362, %middle.block356.loopexit ]
  %trunc.resume.val369 = trunc i64 %trunc.resume.val369.in to i32, !dbg !72
  %cmp.n372 = icmp eq i64 %end.idx359, %resume.val368
  br i1 %cmp.n372, label %for.cond31.preheader, label %for.body29.preheader

for.body29.preheader:                             ; preds = %middle.block356
  %65 = trunc i64 %trunc.resume.val369.in to i32
  %66 = sub i32 %0, %65
  %xtraiter437 = and i32 %66, 3
  %lcmp.mod438 = icmp ne i32 %xtraiter437, 0
  %lcmp.overflow439 = icmp eq i32 %66, 0
  %lcmp.or440 = or i1 %lcmp.overflow439, %lcmp.mod438
  br i1 %lcmp.or440, label %for.body29.prol.preheader, label %for.body29.preheader.split

for.body29.prol.preheader:                        ; preds = %for.body29.preheader
  br label %for.body29.prol, !dbg !102

for.body29.prol:                                  ; preds = %for.body29.prol.preheader, %for.body29.prol
  %mik.0163.prol = phi float* [ %incdec.ptr.prol, %for.body29.prol ], [ %resume.val365, %for.body29.prol.preheader ]
  %i.0162.prol = phi i32 [ %inc.prol, %for.body29.prol ], [ %trunc.resume.val369, %for.body29.prol.preheader ]
  %prol.iter441 = phi i32 [ %prol.iter441.sub, %for.body29.prol ], [ %xtraiter437, %for.body29.prol.preheader ]
  %67 = load float* %mik.0163.prol, align 4, !dbg !102, !tbaa !84
  %mul.prol = fmul float %conv23, %67, !dbg !102
  store float %mul.prol, float* %mik.0163.prol, align 4, !dbg !102, !tbaa !84
  %inc.prol = add nuw nsw i32 %i.0162.prol, 1, !dbg !108
  tail call void @llvm.dbg.value(metadata i32 %inc.prol, i64 0, metadata !25, metadata !40), !dbg !109
  %incdec.ptr.prol = getelementptr inbounds float* %mik.0163.prol, i64 1, !dbg !110
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr.prol, i64 0, metadata !36, metadata !40), !dbg !99
  %exitcond.prol = icmp eq i32 %i.0162.prol, %sub, !dbg !72
  %prol.iter441.sub = sub i32 %prol.iter441, 1, !dbg !72
  %prol.iter441.cmp = icmp ne i32 %prol.iter441.sub, 0, !dbg !72
  br i1 %prol.iter441.cmp, label %for.body29.prol, label %for.body29.preheader.split.loopexit, !llvm.loop !111

for.body29.preheader.split.loopexit:              ; preds = %for.body29.prol
  %mik.0163.unr.ph = phi float* [ %incdec.ptr.prol, %for.body29.prol ]
  %i.0162.unr.ph = phi i32 [ %inc.prol, %for.body29.prol ]
  br label %for.body29.preheader.split

for.body29.preheader.split:                       ; preds = %for.body29.preheader.split.loopexit, %for.body29.preheader
  %mik.0163.unr = phi float* [ %resume.val365, %for.body29.preheader ], [ %mik.0163.unr.ph, %for.body29.preheader.split.loopexit ]
  %i.0162.unr = phi i32 [ %trunc.resume.val369, %for.body29.preheader ], [ %i.0162.unr.ph, %for.body29.preheader.split.loopexit ]
  %68 = icmp ult i32 %66, 4
  br i1 %68, label %for.cond31.preheader.loopexit, label %for.body29.preheader.split.split

for.body29.preheader.split.split:                 ; preds = %for.body29.preheader.split
  br label %for.body29, !dbg !102

for.cond31.preheader.loopexit.unr-lcssa:          ; preds = %for.body29
  br label %for.cond31.preheader.loopexit

for.cond31.preheader.loopexit:                    ; preds = %for.body29.preheader.split, %for.cond31.preheader.loopexit.unr-lcssa
  br label %for.cond31.preheader

for.cond31.preheader:                             ; preds = %for.cond31.preheader.loopexit, %middle.block356
  br i1 %cmp27161, label %for.body34.lr.ph, label %for.inc86, !dbg !112

for.body34.lr.ph:                                 ; preds = %for.cond31.preheader
  %69 = add i64 %indvars.iv225, 1, !dbg !66
  %70 = trunc i64 %69 to i32
  br i1 %cmp18, label %for.body75.lr.ph.us.us.preheader, label %for.body75.lr.ph.us195.preheader

for.body75.lr.ph.us195.preheader:                 ; preds = %for.body34.lr.ph
  %71 = sub i32 %10, %70, !dbg !66
  %72 = zext i32 %71 to i64
  %73 = add nuw nsw i64 %72, 1, !dbg !66
  %74 = trunc i64 %69 to i32
  %75 = sub i32 %11, %74, !dbg !66
  %76 = zext i32 %75 to i64
  %77 = add i64 %indvars.iv225, %76, !dbg !66
  %scevgep294.sum = add i64 %indvars.iv225, 1
  %scevgep295 = getelementptr float* %16, i64 %scevgep294.sum
  %scevgep297.sum = add i64 %77, 1
  %scevgep298 = getelementptr float* %16, i64 %scevgep297.sum
  %78 = trunc i64 %scevgep294.sum to i32
  %79 = sub i32 %14, %78, !dbg !66
  %80 = zext i32 %79 to i64
  %81 = add i64 %80, 1, !dbg !66
  %82 = lshr i64 %81, 2, !dbg !66
  %83 = mul i64 %82, 4, !dbg !66
  %84 = add i64 %83, -4, !dbg !66
  %85 = lshr i64 %84, 2, !dbg !66
  %86 = add i64 %85, 1, !dbg !66
  br label %for.body75.lr.ph.us195, !dbg !66

for.body75.lr.ph.us.us.preheader:                 ; preds = %for.body34.lr.ph
  %87 = sub i32 %8, %70, !dbg !66
  %88 = zext i32 %87 to i64
  %89 = add nuw nsw i64 %88, 1, !dbg !66
  %90 = trunc i64 %69 to i32
  %91 = sub i32 %9, %90, !dbg !66
  %92 = zext i32 %91 to i64
  %93 = add i64 %indvars.iv225, %92, !dbg !66
  %scevgep237.sum = add i64 %indvars.iv225, 1
  %scevgep238 = getelementptr float* %16, i64 %scevgep237.sum
  %scevgep240.sum = add i64 %93, 1
  %scevgep241 = getelementptr float* %16, i64 %scevgep240.sum
  %94 = trunc i64 %scevgep237.sum to i32
  %95 = sub i32 %15, %94, !dbg !66
  %96 = zext i32 %95 to i64
  %97 = add i64 %96, 1, !dbg !66
  %98 = lshr i64 %97, 2, !dbg !66
  %99 = mul i64 %98, 4, !dbg !66
  %100 = add i64 %99, -4, !dbg !66
  %101 = lshr i64 %100, 2, !dbg !66
  %102 = add i64 %101, 1, !dbg !66
  br label %for.body75.lr.ph.us.us, !dbg !66

for.inc83.us.us.loopexit.unr-lcssa:               ; preds = %for.body75.us.us
  br label %for.inc83.us.us.loopexit

for.inc83.us.us.loopexit:                         ; preds = %for.body75.us.us.preheader.split, %for.inc83.us.us.loopexit.unr-lcssa
  br label %for.inc83.us.us

for.inc83.us.us:                                  ; preds = %for.inc83.us.us.loopexit, %middle.block
  %indvars.iv.next221 = add nuw nsw i64 %indvars.iv220, 1, !dbg !112
  %lftr.wideiv223 = trunc i64 %indvars.iv220 to i32, !dbg !112
  %exitcond224 = icmp eq i32 %lftr.wideiv223, %sub, !dbg !112
  br i1 %exitcond224, label %for.inc86.loopexit, label %for.body75.lr.ph.us.us, !dbg !112

for.body75.lr.ph.us.us:                           ; preds = %for.body75.lr.ph.us.us.preheader, %for.inc83.us.us
  %indvars.iv220 = phi i64 [ %indvars.iv.next221, %for.inc83.us.us ], [ %indvars.iv218, %for.body75.lr.ph.us.us.preheader ]
  %arrayidx37.us.us = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv220, !dbg !66
  %103 = load float** %arrayidx37.us.us, align 8, !dbg !66, !tbaa !57
  %add.ptr39.us.us = getelementptr inbounds float* %103, i64 %indvars.iv225, !dbg !66
  tail call void @llvm.dbg.value(metadata float %104, i64 0, metadata !32, metadata !40), !dbg !92
  %104 = load float* %add.ptr39.us.us, align 4, !dbg !66, !tbaa !84
  %add.ptr47.us.us = getelementptr inbounds float* %103, i64 %idx.ext12, !dbg !113
  %105 = load float* %add.ptr47.us.us, align 4, !dbg !113, !tbaa !84
  store float %105, float* %add.ptr39.us.us, align 4, !dbg !116, !tbaa !84
  store float %104, float* %add.ptr47.us.us, align 4, !dbg !117, !tbaa !84
  %106 = load float* %add.ptr39.us.us, align 4, !dbg !118, !tbaa !84
  tail call void @llvm.dbg.value(metadata float %106, i64 0, metadata !32, metadata !40), !dbg !92
  tail call void @llvm.dbg.value(metadata float* %add.ptr70.us.us, i64 0, metadata !35, metadata !40), !dbg !119
  tail call void @llvm.dbg.value(metadata float* %add.ptr25, i64 0, metadata !36, metadata !40), !dbg !99
  %add.ptr70.us.us = getelementptr inbounds float* %103, i64 %24, !dbg !120
  %107 = trunc i64 %24 to i32, !dbg !122
  %108 = and i64 %24, 4294967295, !dbg !122
  %end.idx = add nuw nsw i64 %89, %108, !dbg !122
  %n.vec = and i64 %89, 8589934588, !dbg !122
  %end.idx.rnd.down = add nuw nsw i64 %n.vec, %108, !dbg !122
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !122
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %for.body75.lr.ph.us.us
  %scevgep231.sum = add i64 %indvars.iv225, 1
  %scevgep232 = getelementptr float* %103, i64 %scevgep231.sum
  %bound0 = icmp ule float* %scevgep232, %scevgep241
  %scevgep234.sum = add i64 %93, 1
  %scevgep235 = getelementptr float* %103, i64 %scevgep234.sum
  %bound1 = icmp ule float* %scevgep238, %scevgep235
  %memcheck.conflict = and i1 %bound0, %bound1
  %add.ptr25.sum427 = add i64 %24, %n.vec
  %ptr.ind.end = getelementptr float* %16, i64 %add.ptr25.sum427
  %add.ptr70.us.us.sum = add i64 %24, %n.vec
  %ptr.ind.end245 = getelementptr float* %103, i64 %add.ptr70.us.us.sum
  %109 = trunc i64 %end.idx.rnd.down to i32
  br i1 %memcheck.conflict, label %middle.block, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %broadcast.splatinsert270 = insertelement <4 x float> undef, float %106, i32 0
  %broadcast.splat271 = shufflevector <4 x float> %broadcast.splatinsert270, <4 x float> undef, <4 x i32> zeroinitializer
  %xtraiter452 = and i64 %102, 1
  %lcmp.mod453 = icmp ne i64 %xtraiter452, 0
  %lcmp.overflow454 = icmp eq i64 %102, 0
  %lcmp.or455 = or i1 %lcmp.overflow454, %lcmp.mod453
  br i1 %lcmp.or455, label %vector.body.prol.preheader, label %vector.ph.split

vector.body.prol.preheader:                       ; preds = %vector.ph
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader, %vector.body.prol
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ %108, %vector.body.prol.preheader ], !dbg !122
  %prol.iter456 = phi i64 [ %prol.iter456.sub, %vector.body.prol ], [ %xtraiter452, %vector.body.prol.preheader ]
  %normalized.idx.prol = sub i64 %index.prol, %108
  %add.ptr25.sum428.prol = add i64 %24, %normalized.idx.prol
  %next.gep.prol = getelementptr float* %16, i64 %add.ptr25.sum428.prol
  %normalized.idx257.prol = sub i64 %index.prol, %108
  %add.ptr70.us.us.sum432.prol = add i64 %24, %normalized.idx257.prol
  %next.gep259.prol = getelementptr float* %103, i64 %add.ptr70.us.us.sum432.prol
  %110 = bitcast float* %next.gep.prol to <4 x float>*, !dbg !123
  %wide.load.prol = load <4 x float>* %110, align 4, !dbg !123, !tbaa !84
  %111 = fmul <4 x float> %broadcast.splat271, %wide.load.prol, !dbg !125
  %112 = bitcast float* %next.gep259.prol to <4 x float>*, !dbg !126
  %wide.load272.prol = load <4 x float>* %112, align 4, !dbg !126, !tbaa !84
  %113 = fadd <4 x float> %wide.load272.prol, %111, !dbg !126
  %114 = bitcast float* %next.gep259.prol to <4 x float>*, !dbg !126
  store <4 x float> %113, <4 x float>* %114, align 4, !dbg !126, !tbaa !84
  %index.next.prol = add i64 %index.prol, 4, !dbg !122
  %115 = icmp eq i64 %index.next.prol, %end.idx.rnd.down, !dbg !122
  %prol.iter456.sub = sub i64 %prol.iter456, 1, !dbg !122
  %prol.iter456.cmp = icmp ne i64 %prol.iter456.sub, 0, !dbg !122
  br i1 %prol.iter456.cmp, label %vector.body.prol, label %vector.ph.split.loopexit, !llvm.loop !127

vector.ph.split.loopexit:                         ; preds = %vector.body.prol
  %index.unr.ph = phi i64 [ %index.next.prol, %vector.body.prol ]
  br label %vector.ph.split

vector.ph.split:                                  ; preds = %vector.ph.split.loopexit, %vector.ph
  %index.unr = phi i64 [ %108, %vector.ph ], [ %index.unr.ph, %vector.ph.split.loopexit ]
  %116 = icmp ult i64 %102, 2
  br i1 %116, label %middle.block.loopexit, label %vector.ph.split.split

vector.ph.split.split:                            ; preds = %vector.ph.split
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph.split.split
  %index = phi i64 [ %index.unr, %vector.ph.split.split ], [ %index.next.1, %vector.body ], !dbg !122
  %normalized.idx = sub i64 %index, %108
  %add.ptr25.sum428 = add i64 %24, %normalized.idx
  %next.gep = getelementptr float* %16, i64 %add.ptr25.sum428
  %normalized.idx257 = sub i64 %index, %108
  %add.ptr70.us.us.sum432 = add i64 %24, %normalized.idx257
  %next.gep259 = getelementptr float* %103, i64 %add.ptr70.us.us.sum432
  %117 = bitcast float* %next.gep to <4 x float>*, !dbg !123
  %wide.load = load <4 x float>* %117, align 4, !dbg !123, !tbaa !84
  %118 = fmul <4 x float> %broadcast.splat271, %wide.load, !dbg !125
  %119 = bitcast float* %next.gep259 to <4 x float>*, !dbg !126
  %wide.load272 = load <4 x float>* %119, align 4, !dbg !126, !tbaa !84
  %120 = fadd <4 x float> %wide.load272, %118, !dbg !126
  %121 = bitcast float* %next.gep259 to <4 x float>*, !dbg !126
  store <4 x float> %120, <4 x float>* %121, align 4, !dbg !126, !tbaa !84
  %index.next = add i64 %index, 4, !dbg !122
  %normalized.idx.1 = sub i64 %index.next, %108
  %add.ptr25.sum428.1 = add i64 %24, %normalized.idx.1
  %next.gep.1 = getelementptr float* %16, i64 %add.ptr25.sum428.1
  %normalized.idx257.1 = sub i64 %index.next, %108
  %add.ptr70.us.us.sum432.1 = add i64 %24, %normalized.idx257.1
  %next.gep259.1 = getelementptr float* %103, i64 %add.ptr70.us.us.sum432.1
  %122 = bitcast float* %next.gep.1 to <4 x float>*, !dbg !123
  %wide.load.1 = load <4 x float>* %122, align 4, !dbg !123, !tbaa !84
  %123 = fmul <4 x float> %broadcast.splat271, %wide.load.1, !dbg !125
  %124 = bitcast float* %next.gep259.1 to <4 x float>*, !dbg !126
  %wide.load272.1 = load <4 x float>* %124, align 4, !dbg !126, !tbaa !84
  %125 = fadd <4 x float> %wide.load272.1, %123, !dbg !126
  %126 = bitcast float* %next.gep259.1 to <4 x float>*, !dbg !126
  store <4 x float> %125, <4 x float>* %126, align 4, !dbg !126, !tbaa !84
  %index.next.1 = add i64 %index.next, 4, !dbg !122
  %127 = icmp eq i64 %index.next.1, %end.idx.rnd.down, !dbg !122
  br i1 %127, label %middle.block.loopexit.unr-lcssa, label %vector.body, !dbg !122, !llvm.loop !128

middle.block.loopexit.unr-lcssa:                  ; preds = %vector.body
  br label %middle.block.loopexit

middle.block.loopexit:                            ; preds = %vector.ph.split, %middle.block.loopexit.unr-lcssa
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %vector.memcheck, %for.body75.lr.ph.us.us
  %resume.val = phi float* [ %add.ptr25, %for.body75.lr.ph.us.us ], [ %add.ptr25, %vector.memcheck ], [ %ptr.ind.end, %middle.block.loopexit ]
  %resume.val243 = phi float* [ %add.ptr70.us.us, %for.body75.lr.ph.us.us ], [ %add.ptr70.us.us, %vector.memcheck ], [ %ptr.ind.end245, %middle.block.loopexit ]
  %resume.val246 = phi i64 [ %108, %for.body75.lr.ph.us.us ], [ %108, %vector.memcheck ], [ %end.idx.rnd.down, %middle.block.loopexit ]
  %trunc.resume.val = phi i32 [ %107, %for.body75.lr.ph.us.us ], [ %107, %vector.memcheck ], [ %109, %middle.block.loopexit ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val246
  br i1 %cmp.n, label %for.inc83.us.us, label %for.body75.us.us.preheader

for.body75.us.us.preheader:                       ; preds = %middle.block
  %128 = sub i32 %0, %trunc.resume.val
  %xtraiter457 = and i32 %128, 3
  %lcmp.mod458 = icmp ne i32 %xtraiter457, 0
  %lcmp.overflow459 = icmp eq i32 %128, 0
  %lcmp.or460 = or i1 %lcmp.overflow459, %lcmp.mod458
  br i1 %lcmp.or460, label %for.body75.us.us.prol.preheader, label %for.body75.us.us.preheader.split

for.body75.us.us.prol.preheader:                  ; preds = %for.body75.us.us.preheader
  br label %for.body75.us.us.prol, !dbg !123

for.body75.us.us.prol:                            ; preds = %for.body75.us.us.prol.preheader, %for.body75.us.us.prol
  %mik.1167.us.us.prol = phi float* [ %incdec.ptr81.us.us.prol, %for.body75.us.us.prol ], [ %resume.val, %for.body75.us.us.prol.preheader ]
  %aij.0166.us.us.prol = phi float* [ %incdec.ptr80.us.us.prol, %for.body75.us.us.prol ], [ %resume.val243, %for.body75.us.us.prol.preheader ]
  %i.1165.us.us.prol = phi i32 [ %inc79.us.us.prol, %for.body75.us.us.prol ], [ %trunc.resume.val, %for.body75.us.us.prol.preheader ]
  %prol.iter461 = phi i32 [ %prol.iter461.sub, %for.body75.us.us.prol ], [ %xtraiter457, %for.body75.us.us.prol.preheader ]
  %129 = load float* %mik.1167.us.us.prol, align 4, !dbg !123, !tbaa !84
  %mul76.us.us.prol = fmul float %106, %129, !dbg !125
  %130 = load float* %aij.0166.us.us.prol, align 4, !dbg !126, !tbaa !84
  %add77.us.us.prol = fadd float %130, %mul76.us.us.prol, !dbg !126
  store float %add77.us.us.prol, float* %aij.0166.us.us.prol, align 4, !dbg !126, !tbaa !84
  %inc79.us.us.prol = add nuw nsw i32 %i.1165.us.us.prol, 1, !dbg !129
  tail call void @llvm.dbg.value(metadata i32 %inc79.us.us.prol, i64 0, metadata !25, metadata !40), !dbg !109
  %incdec.ptr80.us.us.prol = getelementptr inbounds float* %aij.0166.us.us.prol, i64 1, !dbg !130
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr80.us.us.prol, i64 0, metadata !35, metadata !40), !dbg !119
  %incdec.ptr81.us.us.prol = getelementptr inbounds float* %mik.1167.us.us.prol, i64 1, !dbg !131
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr81.us.us.prol, i64 0, metadata !36, metadata !40), !dbg !99
  %exitcond217.prol = icmp eq i32 %i.1165.us.us.prol, %sub, !dbg !122
  %prol.iter461.sub = sub i32 %prol.iter461, 1, !dbg !122
  %prol.iter461.cmp = icmp ne i32 %prol.iter461.sub, 0, !dbg !122
  br i1 %prol.iter461.cmp, label %for.body75.us.us.prol, label %for.body75.us.us.preheader.split.loopexit, !llvm.loop !132

for.body75.us.us.preheader.split.loopexit:        ; preds = %for.body75.us.us.prol
  %mik.1167.us.us.unr.ph = phi float* [ %incdec.ptr81.us.us.prol, %for.body75.us.us.prol ]
  %aij.0166.us.us.unr.ph = phi float* [ %incdec.ptr80.us.us.prol, %for.body75.us.us.prol ]
  %i.1165.us.us.unr.ph = phi i32 [ %inc79.us.us.prol, %for.body75.us.us.prol ]
  br label %for.body75.us.us.preheader.split

for.body75.us.us.preheader.split:                 ; preds = %for.body75.us.us.preheader.split.loopexit, %for.body75.us.us.preheader
  %mik.1167.us.us.unr = phi float* [ %resume.val, %for.body75.us.us.preheader ], [ %mik.1167.us.us.unr.ph, %for.body75.us.us.preheader.split.loopexit ]
  %aij.0166.us.us.unr = phi float* [ %resume.val243, %for.body75.us.us.preheader ], [ %aij.0166.us.us.unr.ph, %for.body75.us.us.preheader.split.loopexit ]
  %i.1165.us.us.unr = phi i32 [ %trunc.resume.val, %for.body75.us.us.preheader ], [ %i.1165.us.us.unr.ph, %for.body75.us.us.preheader.split.loopexit ]
  %131 = icmp ult i32 %128, 4
  br i1 %131, label %for.inc83.us.us.loopexit, label %for.body75.us.us.preheader.split.split

for.body75.us.us.preheader.split.split:           ; preds = %for.body75.us.us.preheader.split
  br label %for.body75.us.us, !dbg !123

for.body75.us.us:                                 ; preds = %for.body75.us.us, %for.body75.us.us.preheader.split.split
  %mik.1167.us.us = phi float* [ %mik.1167.us.us.unr, %for.body75.us.us.preheader.split.split ], [ %incdec.ptr81.us.us.3, %for.body75.us.us ]
  %aij.0166.us.us = phi float* [ %aij.0166.us.us.unr, %for.body75.us.us.preheader.split.split ], [ %incdec.ptr80.us.us.3, %for.body75.us.us ]
  %i.1165.us.us = phi i32 [ %i.1165.us.us.unr, %for.body75.us.us.preheader.split.split ], [ %inc79.us.us.3, %for.body75.us.us ]
  %132 = load float* %mik.1167.us.us, align 4, !dbg !123, !tbaa !84
  %mul76.us.us = fmul float %106, %132, !dbg !125
  %133 = load float* %aij.0166.us.us, align 4, !dbg !126, !tbaa !84
  %add77.us.us = fadd float %133, %mul76.us.us, !dbg !126
  store float %add77.us.us, float* %aij.0166.us.us, align 4, !dbg !126, !tbaa !84
  %inc79.us.us = add nuw nsw i32 %i.1165.us.us, 1, !dbg !129
  tail call void @llvm.dbg.value(metadata i32 %inc79.us.us, i64 0, metadata !25, metadata !40), !dbg !109
  %incdec.ptr80.us.us = getelementptr inbounds float* %aij.0166.us.us, i64 1, !dbg !130
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr80.us.us, i64 0, metadata !35, metadata !40), !dbg !119
  %incdec.ptr81.us.us = getelementptr inbounds float* %mik.1167.us.us, i64 1, !dbg !131
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr81.us.us, i64 0, metadata !36, metadata !40), !dbg !99
  %134 = load float* %incdec.ptr81.us.us, align 4, !dbg !123, !tbaa !84
  %mul76.us.us.1 = fmul float %106, %134, !dbg !125
  %135 = load float* %incdec.ptr80.us.us, align 4, !dbg !126, !tbaa !84
  %add77.us.us.1 = fadd float %135, %mul76.us.us.1, !dbg !126
  store float %add77.us.us.1, float* %incdec.ptr80.us.us, align 4, !dbg !126, !tbaa !84
  %inc79.us.us.1 = add nuw nsw i32 %inc79.us.us, 1, !dbg !129
  tail call void @llvm.dbg.value(metadata i32 %inc79.us.us, i64 0, metadata !25, metadata !40), !dbg !109
  %incdec.ptr80.us.us.1 = getelementptr inbounds float* %incdec.ptr80.us.us, i64 1, !dbg !130
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr80.us.us, i64 0, metadata !35, metadata !40), !dbg !119
  %incdec.ptr81.us.us.1 = getelementptr inbounds float* %incdec.ptr81.us.us, i64 1, !dbg !131
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr81.us.us, i64 0, metadata !36, metadata !40), !dbg !99
  %136 = load float* %incdec.ptr81.us.us.1, align 4, !dbg !123, !tbaa !84
  %mul76.us.us.2 = fmul float %106, %136, !dbg !125
  %137 = load float* %incdec.ptr80.us.us.1, align 4, !dbg !126, !tbaa !84
  %add77.us.us.2 = fadd float %137, %mul76.us.us.2, !dbg !126
  store float %add77.us.us.2, float* %incdec.ptr80.us.us.1, align 4, !dbg !126, !tbaa !84
  %inc79.us.us.2 = add nuw nsw i32 %inc79.us.us.1, 1, !dbg !129
  tail call void @llvm.dbg.value(metadata i32 %inc79.us.us, i64 0, metadata !25, metadata !40), !dbg !109
  %incdec.ptr80.us.us.2 = getelementptr inbounds float* %incdec.ptr80.us.us.1, i64 1, !dbg !130
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr80.us.us, i64 0, metadata !35, metadata !40), !dbg !119
  %incdec.ptr81.us.us.2 = getelementptr inbounds float* %incdec.ptr81.us.us.1, i64 1, !dbg !131
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr81.us.us, i64 0, metadata !36, metadata !40), !dbg !99
  %138 = load float* %incdec.ptr81.us.us.2, align 4, !dbg !123, !tbaa !84
  %mul76.us.us.3 = fmul float %106, %138, !dbg !125
  %139 = load float* %incdec.ptr80.us.us.2, align 4, !dbg !126, !tbaa !84
  %add77.us.us.3 = fadd float %139, %mul76.us.us.3, !dbg !126
  store float %add77.us.us.3, float* %incdec.ptr80.us.us.2, align 4, !dbg !126, !tbaa !84
  %inc79.us.us.3 = add nuw nsw i32 %inc79.us.us.2, 1, !dbg !129
  tail call void @llvm.dbg.value(metadata i32 %inc79.us.us, i64 0, metadata !25, metadata !40), !dbg !109
  %incdec.ptr80.us.us.3 = getelementptr inbounds float* %incdec.ptr80.us.us.2, i64 1, !dbg !130
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr80.us.us, i64 0, metadata !35, metadata !40), !dbg !119
  %incdec.ptr81.us.us.3 = getelementptr inbounds float* %incdec.ptr81.us.us.2, i64 1, !dbg !131
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr81.us.us, i64 0, metadata !36, metadata !40), !dbg !99
  %exitcond217.3 = icmp eq i32 %inc79.us.us.2, %sub, !dbg !122
  br i1 %exitcond217.3, label %for.inc83.us.us.loopexit.unr-lcssa, label %for.body75.us.us, !dbg !122, !llvm.loop !133

for.inc83.us182.loopexit.unr-lcssa:               ; preds = %for.body75.us185
  br label %for.inc83.us182.loopexit

for.inc83.us182.loopexit:                         ; preds = %for.body75.us185.preheader.split, %for.inc83.us182.loopexit.unr-lcssa
  br label %for.inc83.us182

for.inc83.us182:                                  ; preds = %for.inc83.us182.loopexit, %middle.block279
  %indvars.iv.next213 = add nuw nsw i64 %indvars.iv212, 1, !dbg !112
  %lftr.wideiv215 = trunc i64 %indvars.iv212 to i32, !dbg !112
  %exitcond216 = icmp eq i32 %lftr.wideiv215, %sub, !dbg !112
  br i1 %exitcond216, label %for.inc86.loopexit436, label %for.body75.lr.ph.us195, !dbg !112

for.body75.us185:                                 ; preds = %for.body75.us185, %for.body75.us185.preheader.split.split
  %mik.1167.us186 = phi float* [ %mik.1167.us186.unr, %for.body75.us185.preheader.split.split ], [ %incdec.ptr81.us193.3, %for.body75.us185 ]
  %aij.0166.us187 = phi float* [ %aij.0166.us187.unr, %for.body75.us185.preheader.split.split ], [ %incdec.ptr80.us192.3, %for.body75.us185 ]
  %i.1165.us188 = phi i32 [ %i.1165.us188.unr, %for.body75.us185.preheader.split.split ], [ %inc79.us191.3, %for.body75.us185 ]
  %140 = load float* %mik.1167.us186, align 4, !dbg !123, !tbaa !84
  %mul76.us189 = fmul float %149, %140, !dbg !125
  %141 = load float* %aij.0166.us187, align 4, !dbg !126, !tbaa !84
  %add77.us190 = fadd float %141, %mul76.us189, !dbg !126
  store float %add77.us190, float* %aij.0166.us187, align 4, !dbg !126, !tbaa !84
  %inc79.us191 = add nuw nsw i32 %i.1165.us188, 1, !dbg !129
  tail call void @llvm.dbg.value(metadata i32 %inc79.us191, i64 0, metadata !25, metadata !40), !dbg !109
  %incdec.ptr80.us192 = getelementptr inbounds float* %aij.0166.us187, i64 1, !dbg !130
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr80.us192, i64 0, metadata !35, metadata !40), !dbg !119
  %incdec.ptr81.us193 = getelementptr inbounds float* %mik.1167.us186, i64 1, !dbg !131
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr81.us193, i64 0, metadata !36, metadata !40), !dbg !99
  %142 = load float* %incdec.ptr81.us193, align 4, !dbg !123, !tbaa !84
  %mul76.us189.1 = fmul float %149, %142, !dbg !125
  %143 = load float* %incdec.ptr80.us192, align 4, !dbg !126, !tbaa !84
  %add77.us190.1 = fadd float %143, %mul76.us189.1, !dbg !126
  store float %add77.us190.1, float* %incdec.ptr80.us192, align 4, !dbg !126, !tbaa !84
  %inc79.us191.1 = add nuw nsw i32 %inc79.us191, 1, !dbg !129
  tail call void @llvm.dbg.value(metadata i32 %inc79.us191, i64 0, metadata !25, metadata !40), !dbg !109
  %incdec.ptr80.us192.1 = getelementptr inbounds float* %incdec.ptr80.us192, i64 1, !dbg !130
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr80.us192, i64 0, metadata !35, metadata !40), !dbg !119
  %incdec.ptr81.us193.1 = getelementptr inbounds float* %incdec.ptr81.us193, i64 1, !dbg !131
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr81.us193, i64 0, metadata !36, metadata !40), !dbg !99
  %144 = load float* %incdec.ptr81.us193.1, align 4, !dbg !123, !tbaa !84
  %mul76.us189.2 = fmul float %149, %144, !dbg !125
  %145 = load float* %incdec.ptr80.us192.1, align 4, !dbg !126, !tbaa !84
  %add77.us190.2 = fadd float %145, %mul76.us189.2, !dbg !126
  store float %add77.us190.2, float* %incdec.ptr80.us192.1, align 4, !dbg !126, !tbaa !84
  %inc79.us191.2 = add nuw nsw i32 %inc79.us191.1, 1, !dbg !129
  tail call void @llvm.dbg.value(metadata i32 %inc79.us191, i64 0, metadata !25, metadata !40), !dbg !109
  %incdec.ptr80.us192.2 = getelementptr inbounds float* %incdec.ptr80.us192.1, i64 1, !dbg !130
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr80.us192, i64 0, metadata !35, metadata !40), !dbg !119
  %incdec.ptr81.us193.2 = getelementptr inbounds float* %incdec.ptr81.us193.1, i64 1, !dbg !131
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr81.us193, i64 0, metadata !36, metadata !40), !dbg !99
  %146 = load float* %incdec.ptr81.us193.2, align 4, !dbg !123, !tbaa !84
  %mul76.us189.3 = fmul float %149, %146, !dbg !125
  %147 = load float* %incdec.ptr80.us192.2, align 4, !dbg !126, !tbaa !84
  %add77.us190.3 = fadd float %147, %mul76.us189.3, !dbg !126
  store float %add77.us190.3, float* %incdec.ptr80.us192.2, align 4, !dbg !126, !tbaa !84
  %inc79.us191.3 = add nuw nsw i32 %inc79.us191.2, 1, !dbg !129
  tail call void @llvm.dbg.value(metadata i32 %inc79.us191, i64 0, metadata !25, metadata !40), !dbg !109
  %incdec.ptr80.us192.3 = getelementptr inbounds float* %incdec.ptr80.us192.2, i64 1, !dbg !130
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr80.us192, i64 0, metadata !35, metadata !40), !dbg !119
  %incdec.ptr81.us193.3 = getelementptr inbounds float* %incdec.ptr81.us193.2, i64 1, !dbg !131
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr81.us193, i64 0, metadata !36, metadata !40), !dbg !99
  %exitcond209.3 = icmp eq i32 %inc79.us191.2, %sub, !dbg !122
  br i1 %exitcond209.3, label %for.inc83.us182.loopexit.unr-lcssa, label %for.body75.us185, !dbg !122, !llvm.loop !134

for.body75.lr.ph.us195:                           ; preds = %for.body75.lr.ph.us195.preheader, %for.inc83.us182
  %indvars.iv212 = phi i64 [ %indvars.iv.next213, %for.inc83.us182 ], [ %indvars.iv218, %for.body75.lr.ph.us195.preheader ]
  %arrayidx37.us173 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv212, !dbg !66
  %148 = load float** %arrayidx37.us173, align 8, !dbg !66, !tbaa !57
  %add.ptr39.us174 = getelementptr inbounds float* %148, i64 %indvars.iv225, !dbg !66
  %149 = load float* %add.ptr39.us174, align 4, !dbg !66, !tbaa !84
  tail call void @llvm.dbg.value(metadata float %149, i64 0, metadata !32, metadata !40), !dbg !92
  tail call void @llvm.dbg.value(metadata float* %add.ptr70.us181, i64 0, metadata !35, metadata !40), !dbg !119
  tail call void @llvm.dbg.value(metadata float* %add.ptr25, i64 0, metadata !36, metadata !40), !dbg !99
  %add.ptr70.us181 = getelementptr inbounds float* %148, i64 %24, !dbg !120
  %150 = trunc i64 %24 to i32, !dbg !122
  %151 = and i64 %24, 4294967295, !dbg !122
  %end.idx282 = add nuw nsw i64 %73, %151, !dbg !122
  %n.vec284 = and i64 %73, 8589934588, !dbg !122
  %end.idx.rnd.down285 = add nuw nsw i64 %n.vec284, %151, !dbg !122
  %cmp.zero286 = icmp eq i64 %n.vec284, 0, !dbg !122
  br i1 %cmp.zero286, label %middle.block279, label %vector.memcheck304

vector.memcheck304:                               ; preds = %for.body75.lr.ph.us195
  %scevgep288.sum = add i64 %indvars.iv225, 1
  %scevgep289 = getelementptr float* %148, i64 %scevgep288.sum
  %bound0300 = icmp ule float* %scevgep289, %scevgep298
  %scevgep291.sum = add i64 %77, 1
  %scevgep292 = getelementptr float* %148, i64 %scevgep291.sum
  %bound1301 = icmp ule float* %scevgep295, %scevgep292
  %memcheck.conflict303 = and i1 %bound0300, %bound1301
  %add.ptr25.sum418 = add i64 %24, %n.vec284
  %ptr.ind.end307 = getelementptr float* %16, i64 %add.ptr25.sum418
  %add.ptr70.us181.sum = add i64 %24, %n.vec284
  %ptr.ind.end310 = getelementptr float* %148, i64 %add.ptr70.us181.sum
  %152 = trunc i64 %end.idx.rnd.down285 to i32
  br i1 %memcheck.conflict303, label %middle.block279, label %vector.ph277

vector.ph277:                                     ; preds = %vector.memcheck304
  %broadcast.splatinsert347 = insertelement <4 x float> undef, float %149, i32 0
  %broadcast.splat348 = shufflevector <4 x float> %broadcast.splatinsert347, <4 x float> undef, <4 x i32> zeroinitializer
  %xtraiter442 = and i64 %86, 1
  %lcmp.mod443 = icmp ne i64 %xtraiter442, 0
  %lcmp.overflow444 = icmp eq i64 %86, 0
  %lcmp.or445 = or i1 %lcmp.overflow444, %lcmp.mod443
  br i1 %lcmp.or445, label %vector.body278.prol.preheader, label %vector.ph277.split

vector.body278.prol.preheader:                    ; preds = %vector.ph277
  br label %vector.body278.prol

vector.body278.prol:                              ; preds = %vector.body278.prol.preheader, %vector.body278.prol
  %index281.prol = phi i64 [ %index.next316.prol, %vector.body278.prol ], [ %151, %vector.body278.prol.preheader ], !dbg !122
  %prol.iter446 = phi i64 [ %prol.iter446.sub, %vector.body278.prol ], [ %xtraiter442, %vector.body278.prol.preheader ]
  %normalized.idx317.prol = sub i64 %index281.prol, %151
  %add.ptr25.sum419.prol = add i64 %24, %normalized.idx317.prol
  %next.gep319.prol = getelementptr float* %16, i64 %add.ptr25.sum419.prol
  %normalized.idx330.prol = sub i64 %index281.prol, %151
  %add.ptr70.us181.sum423.prol = add i64 %24, %normalized.idx330.prol
  %next.gep332.prol = getelementptr float* %148, i64 %add.ptr70.us181.sum423.prol
  %153 = bitcast float* %next.gep319.prol to <4 x float>*, !dbg !123
  %wide.load346.prol = load <4 x float>* %153, align 4, !dbg !123, !tbaa !84
  %154 = fmul <4 x float> %broadcast.splat348, %wide.load346.prol, !dbg !125
  %155 = bitcast float* %next.gep332.prol to <4 x float>*, !dbg !126
  %wide.load349.prol = load <4 x float>* %155, align 4, !dbg !126, !tbaa !84
  %156 = fadd <4 x float> %wide.load349.prol, %154, !dbg !126
  %157 = bitcast float* %next.gep332.prol to <4 x float>*, !dbg !126
  store <4 x float> %156, <4 x float>* %157, align 4, !dbg !126, !tbaa !84
  %index.next316.prol = add i64 %index281.prol, 4, !dbg !122
  %158 = icmp eq i64 %index.next316.prol, %end.idx.rnd.down285, !dbg !122
  %prol.iter446.sub = sub i64 %prol.iter446, 1, !dbg !122
  %prol.iter446.cmp = icmp ne i64 %prol.iter446.sub, 0, !dbg !122
  br i1 %prol.iter446.cmp, label %vector.body278.prol, label %vector.ph277.split.loopexit, !llvm.loop !135

vector.ph277.split.loopexit:                      ; preds = %vector.body278.prol
  %index281.unr.ph = phi i64 [ %index.next316.prol, %vector.body278.prol ]
  br label %vector.ph277.split

vector.ph277.split:                               ; preds = %vector.ph277.split.loopexit, %vector.ph277
  %index281.unr = phi i64 [ %151, %vector.ph277 ], [ %index281.unr.ph, %vector.ph277.split.loopexit ]
  %159 = icmp ult i64 %86, 2
  br i1 %159, label %middle.block279.loopexit, label %vector.ph277.split.split

vector.ph277.split.split:                         ; preds = %vector.ph277.split
  br label %vector.body278

vector.body278:                                   ; preds = %vector.body278, %vector.ph277.split.split
  %index281 = phi i64 [ %index281.unr, %vector.ph277.split.split ], [ %index.next316.1, %vector.body278 ], !dbg !122
  %normalized.idx317 = sub i64 %index281, %151
  %add.ptr25.sum419 = add i64 %24, %normalized.idx317
  %next.gep319 = getelementptr float* %16, i64 %add.ptr25.sum419
  %normalized.idx330 = sub i64 %index281, %151
  %add.ptr70.us181.sum423 = add i64 %24, %normalized.idx330
  %next.gep332 = getelementptr float* %148, i64 %add.ptr70.us181.sum423
  %160 = bitcast float* %next.gep319 to <4 x float>*, !dbg !123
  %wide.load346 = load <4 x float>* %160, align 4, !dbg !123, !tbaa !84
  %161 = fmul <4 x float> %broadcast.splat348, %wide.load346, !dbg !125
  %162 = bitcast float* %next.gep332 to <4 x float>*, !dbg !126
  %wide.load349 = load <4 x float>* %162, align 4, !dbg !126, !tbaa !84
  %163 = fadd <4 x float> %wide.load349, %161, !dbg !126
  %164 = bitcast float* %next.gep332 to <4 x float>*, !dbg !126
  store <4 x float> %163, <4 x float>* %164, align 4, !dbg !126, !tbaa !84
  %index.next316 = add i64 %index281, 4, !dbg !122
  %normalized.idx317.1 = sub i64 %index.next316, %151
  %add.ptr25.sum419.1 = add i64 %24, %normalized.idx317.1
  %next.gep319.1 = getelementptr float* %16, i64 %add.ptr25.sum419.1
  %normalized.idx330.1 = sub i64 %index.next316, %151
  %add.ptr70.us181.sum423.1 = add i64 %24, %normalized.idx330.1
  %next.gep332.1 = getelementptr float* %148, i64 %add.ptr70.us181.sum423.1
  %165 = bitcast float* %next.gep319.1 to <4 x float>*, !dbg !123
  %wide.load346.1 = load <4 x float>* %165, align 4, !dbg !123, !tbaa !84
  %166 = fmul <4 x float> %broadcast.splat348, %wide.load346.1, !dbg !125
  %167 = bitcast float* %next.gep332.1 to <4 x float>*, !dbg !126
  %wide.load349.1 = load <4 x float>* %167, align 4, !dbg !126, !tbaa !84
  %168 = fadd <4 x float> %wide.load349.1, %166, !dbg !126
  %169 = bitcast float* %next.gep332.1 to <4 x float>*, !dbg !126
  store <4 x float> %168, <4 x float>* %169, align 4, !dbg !126, !tbaa !84
  %index.next316.1 = add i64 %index.next316, 4, !dbg !122
  %170 = icmp eq i64 %index.next316.1, %end.idx.rnd.down285, !dbg !122
  br i1 %170, label %middle.block279.loopexit.unr-lcssa, label %vector.body278, !dbg !122, !llvm.loop !136

middle.block279.loopexit.unr-lcssa:               ; preds = %vector.body278
  br label %middle.block279.loopexit

middle.block279.loopexit:                         ; preds = %vector.ph277.split, %middle.block279.loopexit.unr-lcssa
  br label %middle.block279

middle.block279:                                  ; preds = %middle.block279.loopexit, %vector.memcheck304, %for.body75.lr.ph.us195
  %resume.val305 = phi float* [ %add.ptr25, %for.body75.lr.ph.us195 ], [ %add.ptr25, %vector.memcheck304 ], [ %ptr.ind.end307, %middle.block279.loopexit ]
  %resume.val308 = phi float* [ %add.ptr70.us181, %for.body75.lr.ph.us195 ], [ %add.ptr70.us181, %vector.memcheck304 ], [ %ptr.ind.end310, %middle.block279.loopexit ]
  %resume.val311 = phi i64 [ %151, %for.body75.lr.ph.us195 ], [ %151, %vector.memcheck304 ], [ %end.idx.rnd.down285, %middle.block279.loopexit ]
  %trunc.resume.val312 = phi i32 [ %150, %for.body75.lr.ph.us195 ], [ %150, %vector.memcheck304 ], [ %152, %middle.block279.loopexit ]
  %cmp.n315 = icmp eq i64 %end.idx282, %resume.val311
  br i1 %cmp.n315, label %for.inc83.us182, label %for.body75.us185.preheader

for.body75.us185.preheader:                       ; preds = %middle.block279
  %171 = sub i32 %0, %trunc.resume.val312
  %xtraiter447 = and i32 %171, 3
  %lcmp.mod448 = icmp ne i32 %xtraiter447, 0
  %lcmp.overflow449 = icmp eq i32 %171, 0
  %lcmp.or450 = or i1 %lcmp.overflow449, %lcmp.mod448
  br i1 %lcmp.or450, label %for.body75.us185.prol.preheader, label %for.body75.us185.preheader.split

for.body75.us185.prol.preheader:                  ; preds = %for.body75.us185.preheader
  br label %for.body75.us185.prol, !dbg !123

for.body75.us185.prol:                            ; preds = %for.body75.us185.prol.preheader, %for.body75.us185.prol
  %mik.1167.us186.prol = phi float* [ %incdec.ptr81.us193.prol, %for.body75.us185.prol ], [ %resume.val305, %for.body75.us185.prol.preheader ]
  %aij.0166.us187.prol = phi float* [ %incdec.ptr80.us192.prol, %for.body75.us185.prol ], [ %resume.val308, %for.body75.us185.prol.preheader ]
  %i.1165.us188.prol = phi i32 [ %inc79.us191.prol, %for.body75.us185.prol ], [ %trunc.resume.val312, %for.body75.us185.prol.preheader ]
  %prol.iter451 = phi i32 [ %prol.iter451.sub, %for.body75.us185.prol ], [ %xtraiter447, %for.body75.us185.prol.preheader ]
  %172 = load float* %mik.1167.us186.prol, align 4, !dbg !123, !tbaa !84
  %mul76.us189.prol = fmul float %149, %172, !dbg !125
  %173 = load float* %aij.0166.us187.prol, align 4, !dbg !126, !tbaa !84
  %add77.us190.prol = fadd float %173, %mul76.us189.prol, !dbg !126
  store float %add77.us190.prol, float* %aij.0166.us187.prol, align 4, !dbg !126, !tbaa !84
  %inc79.us191.prol = add nuw nsw i32 %i.1165.us188.prol, 1, !dbg !129
  tail call void @llvm.dbg.value(metadata i32 %inc79.us191.prol, i64 0, metadata !25, metadata !40), !dbg !109
  %incdec.ptr80.us192.prol = getelementptr inbounds float* %aij.0166.us187.prol, i64 1, !dbg !130
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr80.us192.prol, i64 0, metadata !35, metadata !40), !dbg !119
  %incdec.ptr81.us193.prol = getelementptr inbounds float* %mik.1167.us186.prol, i64 1, !dbg !131
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr81.us193.prol, i64 0, metadata !36, metadata !40), !dbg !99
  %exitcond209.prol = icmp eq i32 %i.1165.us188.prol, %sub, !dbg !122
  %prol.iter451.sub = sub i32 %prol.iter451, 1, !dbg !122
  %prol.iter451.cmp = icmp ne i32 %prol.iter451.sub, 0, !dbg !122
  br i1 %prol.iter451.cmp, label %for.body75.us185.prol, label %for.body75.us185.preheader.split.loopexit, !llvm.loop !137

for.body75.us185.preheader.split.loopexit:        ; preds = %for.body75.us185.prol
  %mik.1167.us186.unr.ph = phi float* [ %incdec.ptr81.us193.prol, %for.body75.us185.prol ]
  %aij.0166.us187.unr.ph = phi float* [ %incdec.ptr80.us192.prol, %for.body75.us185.prol ]
  %i.1165.us188.unr.ph = phi i32 [ %inc79.us191.prol, %for.body75.us185.prol ]
  br label %for.body75.us185.preheader.split

for.body75.us185.preheader.split:                 ; preds = %for.body75.us185.preheader.split.loopexit, %for.body75.us185.preheader
  %mik.1167.us186.unr = phi float* [ %resume.val305, %for.body75.us185.preheader ], [ %mik.1167.us186.unr.ph, %for.body75.us185.preheader.split.loopexit ]
  %aij.0166.us187.unr = phi float* [ %resume.val308, %for.body75.us185.preheader ], [ %aij.0166.us187.unr.ph, %for.body75.us185.preheader.split.loopexit ]
  %i.1165.us188.unr = phi i32 [ %trunc.resume.val312, %for.body75.us185.preheader ], [ %i.1165.us188.unr.ph, %for.body75.us185.preheader.split.loopexit ]
  %174 = icmp ult i32 %171, 4
  br i1 %174, label %for.inc83.us182.loopexit, label %for.body75.us185.preheader.split.split

for.body75.us185.preheader.split.split:           ; preds = %for.body75.us185.preheader.split
  br label %for.body75.us185, !dbg !123

for.body29:                                       ; preds = %for.body29, %for.body29.preheader.split.split
  %mik.0163 = phi float* [ %mik.0163.unr, %for.body29.preheader.split.split ], [ %incdec.ptr.3, %for.body29 ]
  %i.0162 = phi i32 [ %i.0162.unr, %for.body29.preheader.split.split ], [ %inc.3, %for.body29 ]
  %175 = load float* %mik.0163, align 4, !dbg !102, !tbaa !84
  %mul = fmul float %conv23, %175, !dbg !102
  store float %mul, float* %mik.0163, align 4, !dbg !102, !tbaa !84
  %inc = add nuw nsw i32 %i.0162, 1, !dbg !108
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !25, metadata !40), !dbg !109
  %incdec.ptr = getelementptr inbounds float* %mik.0163, i64 1, !dbg !110
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr, i64 0, metadata !36, metadata !40), !dbg !99
  %176 = load float* %incdec.ptr, align 4, !dbg !102, !tbaa !84
  %mul.1 = fmul float %conv23, %176, !dbg !102
  store float %mul.1, float* %incdec.ptr, align 4, !dbg !102, !tbaa !84
  %inc.1 = add nuw nsw i32 %inc, 1, !dbg !108
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !25, metadata !40), !dbg !109
  %incdec.ptr.1 = getelementptr inbounds float* %incdec.ptr, i64 1, !dbg !110
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr, i64 0, metadata !36, metadata !40), !dbg !99
  %177 = load float* %incdec.ptr.1, align 4, !dbg !102, !tbaa !84
  %mul.2 = fmul float %conv23, %177, !dbg !102
  store float %mul.2, float* %incdec.ptr.1, align 4, !dbg !102, !tbaa !84
  %inc.2 = add nuw nsw i32 %inc.1, 1, !dbg !108
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !25, metadata !40), !dbg !109
  %incdec.ptr.2 = getelementptr inbounds float* %incdec.ptr.1, i64 1, !dbg !110
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr, i64 0, metadata !36, metadata !40), !dbg !99
  %178 = load float* %incdec.ptr.2, align 4, !dbg !102, !tbaa !84
  %mul.3 = fmul float %conv23, %178, !dbg !102
  store float %mul.3, float* %incdec.ptr.2, align 4, !dbg !102, !tbaa !84
  %inc.3 = add nuw nsw i32 %inc.2, 1, !dbg !108
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !25, metadata !40), !dbg !109
  %incdec.ptr.3 = getelementptr inbounds float* %incdec.ptr.2, i64 1, !dbg !110
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr, i64 0, metadata !36, metadata !40), !dbg !99
  %exitcond.3 = icmp eq i32 %inc.2, %sub, !dbg !72
  br i1 %exitcond.3, label %for.cond31.preheader.loopexit.unr-lcssa, label %for.body29, !dbg !72, !llvm.loop !138

for.inc86.loopexit:                               ; preds = %for.inc83.us.us
  br label %for.inc86

for.inc86.loopexit436:                            ; preds = %for.inc83.us182
  br label %for.inc86

for.inc86:                                        ; preds = %for.inc86.loopexit436, %for.inc86.loopexit, %if.end21, %for.cond31.preheader, %for.body.for.inc86_crit_edge
  %indvars.iv.next226.pre-phi = phi i64 [ %indvars.iv.next226.pre, %for.body.for.inc86_crit_edge ], [ %24, %for.cond31.preheader ], [ %24, %if.end21 ], [ %24, %for.inc86.loopexit ], [ %24, %for.inc86.loopexit436 ], !dbg !64
  %info.1 = phi i32 [ %19, %for.body.for.inc86_crit_edge ], [ %info.0200, %for.cond31.preheader ], [ %info.0200, %if.end21 ], [ %info.0200, %for.inc86.loopexit ], [ %info.0200, %for.inc86.loopexit436 ]
  tail call void @llvm.dbg.value(metadata i32* %incdec.ptr88, i64 0, metadata !24, metadata !40), !dbg !42
  %cmp5 = icmp slt i64 %indvars.iv.next226.pre-phi, %4, !dbg !139
  br i1 %cmp5, label %for.inc86.for.body_crit_edge, label %CLEAN_UP.loopexit, !dbg !64

for.inc86.for.body_crit_edge:                     ; preds = %for.inc86
  %indvars.iv.next219 = add nuw nsw i64 %indvars.iv218, 1, !dbg !64
  %incdec.ptr88 = getelementptr inbounds i32* %ipvt.addr.0201, i64 1, !dbg !140
  %arrayidx7.phi.trans.insert = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv.next226.pre-phi
  %.pre = load float** %arrayidx7.phi.trans.insert, align 8, !dbg !74, !tbaa !57
  br label %for.body, !dbg !64

CLEAN_UP.loopexit:                                ; preds = %for.inc86
  %info.1.lcssa = phi i32 [ %info.1, %for.inc86 ]
  %add.ptr.lcssa = phi float* [ %add.ptr, %for.inc86 ]
  %scevgep = getelementptr i32* %ipvt, i64 %7
  br label %CLEAN_UP

CLEAN_UP:                                         ; preds = %CLEAN_UP.loopexit, %if.end
  %info.2 = phi i32 [ 0, %if.end ], [ %info.1.lcssa, %CLEAN_UP.loopexit ]
  %ipvt.addr.1 = phi i32* [ %ipvt, %if.end ], [ %scevgep, %CLEAN_UP.loopexit ]
  %akk.1 = phi float* [ %2, %if.end ], [ %add.ptr.lcssa, %CLEAN_UP.loopexit ]
  store i32 %sub, i32* %ipvt.addr.1, align 4, !dbg !141, !tbaa !79
  %179 = load float* %akk.1, align 4, !dbg !142, !tbaa !84
  %cmp91 = fcmp oeq float %179, 0.000000e+00, !dbg !142
  tail call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !30, metadata !40), !dbg !60
  %info.3 = select i1 %cmp91, i32 %0, i32 %info.2, !dbg !144
  br label %return, !dbg !144

return:                                           ; preds = %CLEAN_UP, %entry
  %retval.0 = phi i32 [ -1, %entry ], [ %info.3, %CLEAN_UP ]
  ret i32 %retval.0, !dbg !145
}

declare i32 @isamax(...) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!37, !38}
!llvm.ident = !{!39}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !2, !3, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c] [DW_LANG_C99]
!1 = !{!"sgefa.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa"}
!2 = !{}
!3 = !{!4}
!4 = !{!"0x2e\00sgefa\00sgefa\00\0011\000\001\000\000\000\001\0048", !1, !5, !6, null, i32 (%struct.FULL*, i32*)* @sgefa, null, null, !22} ; [ DW_TAG_subprogram ] [line 11] [def] [scope 48] [sgefa]
!5 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!6 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !7, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = !{!8, !9, !21}
!8 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = !{!"0xf\00\000\0064\0064\000\000", null, null, !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from FULL]
!10 = !{!"0x13\00FULL\0031\0064064\0064\000\000\000", !11, null, null, !12, null, null, null} ; [ DW_TAG_structure_type ] [FULL] [line 31, size 64064, align 64, offset 0] [def] [from ]
!11 = !{!"./ge.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa"}
!12 = !{!13, !14, !15}
!13 = !{!"0xd\00cd\0032\0032\0032\000\000", !11, !10, !8} ; [ DW_TAG_member ] [cd] [line 32, size 32, align 32, offset 0] [from int]
!14 = !{!"0xd\00rd\0033\0032\0032\0032\000", !11, !10, !8} ; [ DW_TAG_member ] [rd] [line 33, size 32, align 32, offset 32] [from int]
!15 = !{!"0xd\00pd\0034\0064000\0064\0064\000", !11, !10, !16} ; [ DW_TAG_member ] [pd] [line 34, size 64000, align 64, offset 64] [from ]
!16 = !{!"0x1\00\000\0064000\0064\000\000\000", null, null, !17, !19, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 64000, align 64, offset 0] [from ]
!17 = !{!"0xf\00\000\0064\0064\000\000", null, null, !18} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from float]
!18 = !{!"0x24\00float\000\0032\0032\000\000\004", null, null} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!19 = !{!20}
!20 = !{!"0x21\000\001000"}                       ; [ DW_TAG_subrange_type ] [0, 999]
!21 = !{!"0xf\00\000\0064\0064\000\000", null, null, !8} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!22 = !{!23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36}
!23 = !{!"0x101\00a\0016777228\000", !4, !5, !9}  ; [ DW_TAG_arg_variable ] [a] [line 12]
!24 = !{!"0x101\00ipvt\0033554445\000", !4, !5, !21} ; [ DW_TAG_arg_variable ] [ipvt] [line 13]
!25 = !{!"0x100\00i\0049\000", !4, !5, !8}        ; [ DW_TAG_auto_variable ] [i] [line 49]
!26 = !{!"0x100\00j\0049\000", !4, !5, !8}        ; [ DW_TAG_auto_variable ] [j] [line 49]
!27 = !{!"0x100\00k\0050\000", !4, !5, !8}        ; [ DW_TAG_auto_variable ] [k] [line 50]
!28 = !{!"0x100\00l\0050\000", !4, !5, !8}        ; [ DW_TAG_auto_variable ] [l] [line 50]
!29 = !{!"0x100\00nm1\0050\000", !4, !5, !8}      ; [ DW_TAG_auto_variable ] [nm1] [line 50]
!30 = !{!"0x100\00info\0050\000", !4, !5, !8}     ; [ DW_TAG_auto_variable ] [info] [line 50]
!31 = !{!"0x100\00n\0050\000", !4, !5, !8}        ; [ DW_TAG_auto_variable ] [n] [line 50]
!32 = !{!"0x100\00t\0051\000", !4, !5, !18}       ; [ DW_TAG_auto_variable ] [t] [line 51]
!33 = !{!"0x100\00akk\0051\000", !4, !5, !17}     ; [ DW_TAG_auto_variable ] [akk] [line 51]
!34 = !{!"0x100\00alk\0051\000", !4, !5, !17}     ; [ DW_TAG_auto_variable ] [alk] [line 51]
!35 = !{!"0x100\00aij\0051\000", !4, !5, !17}     ; [ DW_TAG_auto_variable ] [aij] [line 51]
!36 = !{!"0x100\00mik\0051\000", !4, !5, !17}     ; [ DW_TAG_auto_variable ] [mik] [line 51]
!37 = !{i32 2, !"Dwarf Version", i32 4}
!38 = !{i32 2, !"Debug Info Version", i32 2}
!39 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!40 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!41 = !MDLocation(line: 12, column: 14, scope: !4)
!42 = !MDLocation(line: 13, column: 10, scope: !4)
!43 = !MDLocation(line: 54, column: 7, scope: !44)
!44 = !{!"0xb\0054\007\000", !1, !4}              ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!45 = !{!46, !47, i64 0}
!46 = !{!"FULL", !47, i64 0, !47, i64 4, !48, i64 8}
!47 = !{!"int", !48, i64 0}
!48 = !{!"omnipotent char", !49, i64 0}
!49 = !{!"Simple C/C++ TBAA"}
!50 = !MDLocation(line: 54, column: 16, scope: !44)
!51 = !{!46, !47, i64 4}
!52 = !MDLocation(line: 54, column: 7, scope: !4)
!53 = !MDLocation(line: 50, column: 35, scope: !4)
!54 = !MDLocation(line: 56, column: 10, scope: !4)
!55 = !MDLocation(line: 50, column: 24, scope: !4)
!56 = !MDLocation(line: 57, column: 10, scope: !4)
!57 = !{!58, !58, i64 0}
!58 = !{!"any pointer", !48, i64 0}
!59 = !MDLocation(line: 51, column: 14, scope: !4)
!60 = !MDLocation(line: 50, column: 29, scope: !4)
!61 = !MDLocation(line: 59, column: 7, scope: !62)
!62 = !{!"0xb\0059\007\001", !1, !4}              ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!63 = !MDLocation(line: 59, column: 7, scope: !4)
!64 = !MDLocation(line: 62, column: 3, scope: !65)
!65 = !{!"0xb\0062\003\002", !1, !4}              ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!66 = !MDLocation(line: 92, column: 11, scope: !67)
!67 = !{!"0xb\0089\0028\0013", !1, !68}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!68 = !{!"0xb\0089\005\0012", !1, !69}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!69 = !{!"0xb\0089\005\0011", !1, !70}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!70 = !{!"0xb\0062\0034\004", !1, !71}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!71 = !{!"0xb\0062\003\003", !1, !65}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!72 = !MDLocation(line: 85, column: 5, scope: !73)
!73 = !{!"0xb\0085\005\009", !1, !70}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!74 = !MDLocation(line: 65, column: 13, scope: !70)
!75 = !MDLocation(line: 66, column: 21, scope: !70)
!76 = !MDLocation(line: 66, column: 13, scope: !70)
!77 = !MDLocation(line: 50, column: 21, scope: !4)
!78 = !MDLocation(line: 67, column: 5, scope: !70)
!79 = !{!47, !47, i64 0}
!80 = !MDLocation(line: 70, column: 11, scope: !70)
!81 = !MDLocation(line: 51, column: 20, scope: !4)
!82 = !MDLocation(line: 71, column: 9, scope: !83)
!83 = !{!"0xb\0071\009\005", !1, !70}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!84 = !{!85, !85, i64 0}
!85 = !{!"float", !48, i64 0}
!86 = !MDLocation(line: 71, column: 9, scope: !70)
!87 = !MDLocation(line: 77, column: 9, scope: !88)
!88 = !{!"0xb\0077\009\007", !1, !70}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!89 = !MDLocation(line: 79, column: 14, scope: !90)
!90 = !{!"0xb\0077\0018\008", !1, !88}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!91 = !MDLocation(line: 77, column: 9, scope: !70)
!92 = !MDLocation(line: 51, column: 10, scope: !4)
!93 = !MDLocation(line: 79, column: 7, scope: !90)
!94 = !MDLocation(line: 80, column: 7, scope: !90)
!95 = !MDLocation(line: 81, column: 5, scope: !90)
!96 = !MDLocation(line: 84, column: 9, scope: !70)
!97 = !MDLocation(line: 85, column: 12, scope: !73)
!98 = !MDLocation(line: 85, column: 23, scope: !73)
!99 = !MDLocation(line: 51, column: 32, scope: !4)
!100 = !MDLocation(line: 85, column: 30, scope: !101)
!101 = !{!"0xb\0085\005\0010", !1, !73}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!102 = !MDLocation(line: 86, column: 7, scope: !101)
!103 = distinct !{!103, !104}
!104 = !{!"llvm.loop.unroll.disable"}
!105 = distinct !{!105, !106, !107}
!106 = !{!"llvm.loop.vectorize.width", i32 1}
!107 = !{!"llvm.loop.interleave.count", i32 1}
!108 = !MDLocation(line: 85, column: 35, scope: !101)
!109 = !MDLocation(line: 49, column: 17, scope: !4)
!110 = !MDLocation(line: 85, column: 40, scope: !101)
!111 = distinct !{!111, !104}
!112 = !MDLocation(line: 89, column: 5, scope: !69)
!113 = !MDLocation(line: 94, column: 17, scope: !114)
!114 = !{!"0xb\0093\0020\0015", !1, !115}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!115 = !{!"0xb\0093\0011\0014", !1, !67}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!116 = !MDLocation(line: 94, column: 2, scope: !114)
!117 = !MDLocation(line: 95, column: 2, scope: !114)
!118 = !MDLocation(line: 96, column: 6, scope: !114)
!119 = !MDLocation(line: 51, column: 26, scope: !4)
!120 = !MDLocation(line: 98, column: 23, scope: !121)
!121 = !{!"0xb\0098\007\0016", !1, !67}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!122 = !MDLocation(line: 98, column: 7, scope: !121)
!123 = !MDLocation(line: 99, column: 13, scope: !124)
!124 = !{!"0xb\0098\007\0017", !1, !121}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!125 = !MDLocation(line: 99, column: 10, scope: !124)
!126 = !MDLocation(line: 99, column: 2, scope: !124)
!127 = distinct !{!127, !104}
!128 = distinct !{!128, !106, !107}
!129 = !MDLocation(line: 98, column: 53, scope: !124)
!130 = !MDLocation(line: 98, column: 58, scope: !124)
!131 = !MDLocation(line: 98, column: 65, scope: !124)
!132 = distinct !{!132, !104}
!133 = distinct !{!133, !106, !107}
!134 = distinct !{!134, !106, !107}
!135 = distinct !{!135, !104}
!136 = distinct !{!136, !106, !107}
!137 = distinct !{!137, !104}
!138 = distinct !{!138, !106, !107}
!139 = !MDLocation(line: 62, column: 13, scope: !71)
!140 = !MDLocation(line: 62, column: 25, scope: !71)
!141 = !MDLocation(line: 104, column: 3, scope: !4)
!142 = !MDLocation(line: 105, column: 7, scope: !143)
!143 = !{!"0xb\00105\007\0018", !1, !4}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!144 = !MDLocation(line: 105, column: 7, scope: !4)
!145 = !MDLocation(line: 107, column: 1, scope: !4)
