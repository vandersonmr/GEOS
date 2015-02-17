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
  %10 = add i32 %0, -1, !dbg !72
  %11 = add i32 %0, -1
  %12 = add i32 %0, -1, !dbg !66
  br label %for.body, !dbg !64

for.body:                                         ; preds = %for.inc86.for.body_crit_edge, %for.body.lr.ph
  %13 = phi float* [ %2, %for.body.lr.ph ], [ %.pre, %for.inc86.for.body_crit_edge ]
  %indvars.iv182 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next183.pre-phi, %for.inc86.for.body_crit_edge ]
  %indvars.iv = phi i64 [ 1, %for.body.lr.ph ], [ %indvars.iv.next, %for.inc86.for.body_crit_edge ]
  %ipvt.addr.0174 = phi i32* [ %ipvt, %for.body.lr.ph ], [ %incdec.ptr88, %for.inc86.for.body_crit_edge ]
  %info.0173 = phi i32 [ 0, %for.body.lr.ph ], [ %info.1, %for.inc86.for.body_crit_edge ]
  %arrayidx7 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv182, !dbg !74
  %add.ptr = getelementptr inbounds float* %13, i64 %indvars.iv182, !dbg !74
  tail call void @llvm.dbg.value(metadata float* %add.ptr, i64 0, metadata !33, metadata !40), !dbg !59
  %14 = sub nsw i64 %3, %indvars.iv182, !dbg !75
  %15 = trunc i64 %14 to i32, !dbg !76
  %call = tail call i32 (i32, float*, i32, ...)* bitcast (i32 (...)* @isamax to i32 (i32, float*, i32, ...)*)(i32 %15, float* %add.ptr, i32 1) #3, !dbg !76
  %16 = trunc i64 %indvars.iv182 to i32, !dbg !76
  %add = add nsw i32 %call, %16, !dbg !76
  tail call void @llvm.dbg.value(metadata i32 %add, i64 0, metadata !28, metadata !40), !dbg !77
  store i32 %add, i32* %ipvt.addr.0174, align 4, !dbg !78, !tbaa !79
  %17 = load float** %arrayidx7, align 8, !dbg !80, !tbaa !57
  %idx.ext12 = sext i32 %add to i64, !dbg !80
  %add.ptr13 = getelementptr inbounds float* %17, i64 %idx.ext12, !dbg !80
  tail call void @llvm.dbg.value(metadata float* %add.ptr13, i64 0, metadata !34, metadata !40), !dbg !81
  %18 = load float* %add.ptr13, align 4, !dbg !82, !tbaa !84
  %cmp14 = fcmp oeq float %18, 0.000000e+00, !dbg !82
  br i1 %cmp14, label %for.body.for.inc86_crit_edge, label %if.end17, !dbg !86

for.body.for.inc86_crit_edge:                     ; preds = %for.body
  %indvars.iv.next183.pre = add nuw nsw i64 %indvars.iv182, 1, !dbg !64
  br label %for.inc86, !dbg !86

if.end17:                                         ; preds = %for.body
  %cmp18 = icmp ne i32 %call, 0, !dbg !87
  %19 = load float* %add.ptr, align 4, !dbg !89, !tbaa !84
  br i1 %cmp18, label %if.then20, label %if.end21, !dbg !91

if.then20:                                        ; preds = %if.end17
  tail call void @llvm.dbg.value(metadata float %18, i64 0, metadata !32, metadata !40), !dbg !92
  store float %19, float* %add.ptr13, align 4, !dbg !93, !tbaa !84
  store float %18, float* %add.ptr, align 4, !dbg !94, !tbaa !84
  br label %if.end21, !dbg !95

if.end21:                                         ; preds = %if.end17, %if.then20
  %20 = phi float [ %18, %if.then20 ], [ %19, %if.end17 ]
  %conv23 = fdiv float -1.000000e+00, %20, !dbg !96
  tail call void @llvm.dbg.value(metadata float %conv23, i64 0, metadata !32, metadata !40), !dbg !92
  %21 = add nuw nsw i64 %indvars.iv182, 1, !dbg !97
  %add.ptr25 = getelementptr inbounds float* %13, i64 %21, !dbg !98
  tail call void @llvm.dbg.value(metadata float* %add.ptr25, i64 0, metadata !36, metadata !40), !dbg !99
  %cmp27161 = icmp slt i64 %21, %3, !dbg !100
  br i1 %cmp27161, label %for.body29.lr.ph, label %for.inc86, !dbg !72

for.body29.lr.ph:                                 ; preds = %if.end21
  %22 = and i64 %21, 4294967295, !dbg !72
  %23 = add i64 %indvars.iv182, 1, !dbg !72
  %24 = trunc i64 %23 to i32
  %25 = sub i32 %10, %24, !dbg !72
  %26 = zext i32 %25 to i64
  %27 = add nuw nsw i64 %26, 1, !dbg !72
  %end.idx238 = add nuw nsw i64 %27, %22, !dbg !72
  %n.vec240 = and i64 %27, 8589934584, !dbg !72
  %end.idx.rnd.down241 = add nuw nsw i64 %n.vec240, %22, !dbg !72
  %cmp.zero242 = icmp eq i64 %n.vec240, 0, !dbg !72
  %add.ptr25.sum = add i64 %21, %n.vec240
  %ptr.ind.end246 = getelementptr float* %13, i64 %add.ptr25.sum
  br i1 %cmp.zero242, label %middle.block235, label %vector.ph233

vector.ph233:                                     ; preds = %for.body29.lr.ph
  %broadcast.splatinsert284 = insertelement <4 x float> undef, float %conv23, i32 0
  %broadcast.splat285 = shufflevector <4 x float> %broadcast.splatinsert284, <4 x float> undef, <4 x i32> zeroinitializer
  %28 = add i64 %indvars.iv182, 1
  %29 = trunc i64 %28 to i32
  %30 = sub i32 %11, %29
  %31 = zext i32 %30 to i64
  %32 = add i64 %31, 1
  %33 = lshr i64 %32, 3
  %34 = mul i64 %33, 8
  %35 = add i64 %34, -8
  %36 = lshr i64 %35, 3
  %37 = add i64 %36, 1
  %xtraiter = and i64 %37, 1
  %lcmp.mod = icmp ne i64 %xtraiter, 0
  %lcmp.overflow = icmp eq i64 %37, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %vector.body234.prol.preheader, label %vector.ph233.split

vector.body234.prol.preheader:                    ; preds = %vector.ph233
  br label %vector.body234.prol

vector.body234.prol:                              ; preds = %vector.body234.prol.preheader, %vector.body234.prol
  %index237.prol = phi i64 [ %index.next252.prol, %vector.body234.prol ], [ %22, %vector.body234.prol.preheader ], !dbg !72
  %prol.iter = phi i64 [ %prol.iter.sub, %vector.body234.prol ], [ %xtraiter, %vector.body234.prol.preheader ]
  %normalized.idx253.prol = sub i64 %index237.prol, %22
  %add.ptr25.sum288.prol = add i64 %21, %normalized.idx253.prol
  %next.gep255.prol = getelementptr float* %13, i64 %add.ptr25.sum288.prol
  %38 = bitcast float* %next.gep255.prol to <4 x float>*, !dbg !102
  %wide.load282.prol = load <4 x float>* %38, align 4, !dbg !102, !tbaa !84
  %next.gep255.sum.prol = add i64 %add.ptr25.sum288.prol, 4, !dbg !102
  %39 = getelementptr float* %13, i64 %next.gep255.sum.prol, !dbg !102
  %40 = bitcast float* %39 to <4 x float>*, !dbg !102
  %wide.load283.prol = load <4 x float>* %40, align 4, !dbg !102, !tbaa !84
  %41 = fmul <4 x float> %broadcast.splat285, %wide.load282.prol, !dbg !102
  %42 = fmul <4 x float> %broadcast.splat285, %wide.load283.prol, !dbg !102
  %43 = bitcast float* %next.gep255.prol to <4 x float>*, !dbg !102
  store <4 x float> %41, <4 x float>* %43, align 4, !dbg !102, !tbaa !84
  %44 = bitcast float* %39 to <4 x float>*, !dbg !102
  store <4 x float> %42, <4 x float>* %44, align 4, !dbg !102, !tbaa !84
  %index.next252.prol = add i64 %index237.prol, 8, !dbg !72
  %45 = icmp eq i64 %index.next252.prol, %end.idx.rnd.down241, !dbg !72
  %prol.iter.sub = sub i64 %prol.iter, 1, !dbg !72
  %prol.iter.cmp = icmp ne i64 %prol.iter.sub, 0, !dbg !72
  br i1 %prol.iter.cmp, label %vector.body234.prol, label %vector.ph233.split.loopexit, !llvm.loop !103

vector.ph233.split.loopexit:                      ; preds = %vector.body234.prol
  %index237.unr.ph = phi i64 [ %index.next252.prol, %vector.body234.prol ]
  br label %vector.ph233.split

vector.ph233.split:                               ; preds = %vector.ph233.split.loopexit, %vector.ph233
  %index237.unr = phi i64 [ %22, %vector.ph233 ], [ %index237.unr.ph, %vector.ph233.split.loopexit ]
  %46 = icmp ult i64 %37, 2
  br i1 %46, label %middle.block235.loopexit, label %vector.ph233.split.split

vector.ph233.split.split:                         ; preds = %vector.ph233.split
  br label %vector.body234

vector.body234:                                   ; preds = %vector.body234, %vector.ph233.split.split
  %index237 = phi i64 [ %index237.unr, %vector.ph233.split.split ], [ %index.next252.1, %vector.body234 ], !dbg !72
  %normalized.idx253 = sub i64 %index237, %22
  %add.ptr25.sum288 = add i64 %21, %normalized.idx253
  %next.gep255 = getelementptr float* %13, i64 %add.ptr25.sum288
  %47 = bitcast float* %next.gep255 to <4 x float>*, !dbg !102
  %wide.load282 = load <4 x float>* %47, align 4, !dbg !102, !tbaa !84
  %next.gep255.sum = add i64 %add.ptr25.sum288, 4, !dbg !102
  %48 = getelementptr float* %13, i64 %next.gep255.sum, !dbg !102
  %49 = bitcast float* %48 to <4 x float>*, !dbg !102
  %wide.load283 = load <4 x float>* %49, align 4, !dbg !102, !tbaa !84
  %50 = fmul <4 x float> %broadcast.splat285, %wide.load282, !dbg !102
  %51 = fmul <4 x float> %broadcast.splat285, %wide.load283, !dbg !102
  %52 = bitcast float* %next.gep255 to <4 x float>*, !dbg !102
  store <4 x float> %50, <4 x float>* %52, align 4, !dbg !102, !tbaa !84
  %53 = bitcast float* %48 to <4 x float>*, !dbg !102
  store <4 x float> %51, <4 x float>* %53, align 4, !dbg !102, !tbaa !84
  %index.next252 = add i64 %index237, 8, !dbg !72
  %normalized.idx253.1 = sub i64 %index.next252, %22
  %add.ptr25.sum288.1 = add i64 %21, %normalized.idx253.1
  %next.gep255.1 = getelementptr float* %13, i64 %add.ptr25.sum288.1
  %54 = bitcast float* %next.gep255.1 to <4 x float>*, !dbg !102
  %wide.load282.1 = load <4 x float>* %54, align 4, !dbg !102, !tbaa !84
  %next.gep255.sum.1 = add i64 %add.ptr25.sum288.1, 4, !dbg !102
  %55 = getelementptr float* %13, i64 %next.gep255.sum.1, !dbg !102
  %56 = bitcast float* %55 to <4 x float>*, !dbg !102
  %wide.load283.1 = load <4 x float>* %56, align 4, !dbg !102, !tbaa !84
  %57 = fmul <4 x float> %broadcast.splat285, %wide.load282.1, !dbg !102
  %58 = fmul <4 x float> %broadcast.splat285, %wide.load283.1, !dbg !102
  %59 = bitcast float* %next.gep255.1 to <4 x float>*, !dbg !102
  store <4 x float> %57, <4 x float>* %59, align 4, !dbg !102, !tbaa !84
  %60 = bitcast float* %55 to <4 x float>*, !dbg !102
  store <4 x float> %58, <4 x float>* %60, align 4, !dbg !102, !tbaa !84
  %index.next252.1 = add i64 %index.next252, 8, !dbg !72
  %61 = icmp eq i64 %index.next252.1, %end.idx.rnd.down241, !dbg !72
  br i1 %61, label %middle.block235.loopexit.unr-lcssa, label %vector.body234, !dbg !72, !llvm.loop !105

middle.block235.loopexit.unr-lcssa:               ; preds = %vector.body234
  br label %middle.block235.loopexit

middle.block235.loopexit:                         ; preds = %vector.ph233.split, %middle.block235.loopexit.unr-lcssa
  br label %middle.block235

middle.block235:                                  ; preds = %middle.block235.loopexit, %for.body29.lr.ph
  %resume.val244 = phi float* [ %add.ptr25, %for.body29.lr.ph ], [ %ptr.ind.end246, %middle.block235.loopexit ]
  %resume.val247 = phi i64 [ %22, %for.body29.lr.ph ], [ %end.idx.rnd.down241, %middle.block235.loopexit ]
  %trunc.resume.val248.in = phi i64 [ %21, %for.body29.lr.ph ], [ %end.idx.rnd.down241, %middle.block235.loopexit ]
  %trunc.resume.val248 = trunc i64 %trunc.resume.val248.in to i32, !dbg !72
  %cmp.n251 = icmp eq i64 %end.idx238, %resume.val247
  br i1 %cmp.n251, label %for.cond31.preheader, label %for.body29.preheader

for.body29.preheader:                             ; preds = %middle.block235
  %62 = trunc i64 %trunc.resume.val248.in to i32
  %63 = sub i32 %0, %62
  %xtraiter306 = and i32 %63, 3
  %lcmp.mod307 = icmp ne i32 %xtraiter306, 0
  %lcmp.overflow308 = icmp eq i32 %63, 0
  %lcmp.or309 = or i1 %lcmp.overflow308, %lcmp.mod307
  br i1 %lcmp.or309, label %for.body29.prol.preheader, label %for.body29.preheader.split

for.body29.prol.preheader:                        ; preds = %for.body29.preheader
  br label %for.body29.prol, !dbg !102

for.body29.prol:                                  ; preds = %for.body29.prol.preheader, %for.body29.prol
  %mik.0163.prol = phi float* [ %incdec.ptr.prol, %for.body29.prol ], [ %resume.val244, %for.body29.prol.preheader ]
  %i.0162.prol = phi i32 [ %inc.prol, %for.body29.prol ], [ %trunc.resume.val248, %for.body29.prol.preheader ]
  %prol.iter310 = phi i32 [ %prol.iter310.sub, %for.body29.prol ], [ %xtraiter306, %for.body29.prol.preheader ]
  %64 = load float* %mik.0163.prol, align 4, !dbg !102, !tbaa !84
  %mul.prol = fmul float %conv23, %64, !dbg !102
  store float %mul.prol, float* %mik.0163.prol, align 4, !dbg !102, !tbaa !84
  %inc.prol = add nuw nsw i32 %i.0162.prol, 1, !dbg !108
  tail call void @llvm.dbg.value(metadata i32 %inc.prol, i64 0, metadata !25, metadata !40), !dbg !109
  %incdec.ptr.prol = getelementptr inbounds float* %mik.0163.prol, i64 1, !dbg !110
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr.prol, i64 0, metadata !36, metadata !40), !dbg !99
  %exitcond.prol = icmp eq i32 %i.0162.prol, %sub, !dbg !72
  %prol.iter310.sub = sub i32 %prol.iter310, 1, !dbg !72
  %prol.iter310.cmp = icmp ne i32 %prol.iter310.sub, 0, !dbg !72
  br i1 %prol.iter310.cmp, label %for.body29.prol, label %for.body29.preheader.split.loopexit, !llvm.loop !111

for.body29.preheader.split.loopexit:              ; preds = %for.body29.prol
  %mik.0163.unr.ph = phi float* [ %incdec.ptr.prol, %for.body29.prol ]
  %i.0162.unr.ph = phi i32 [ %inc.prol, %for.body29.prol ]
  br label %for.body29.preheader.split

for.body29.preheader.split:                       ; preds = %for.body29.preheader.split.loopexit, %for.body29.preheader
  %mik.0163.unr = phi float* [ %resume.val244, %for.body29.preheader ], [ %mik.0163.unr.ph, %for.body29.preheader.split.loopexit ]
  %i.0162.unr = phi i32 [ %trunc.resume.val248, %for.body29.preheader ], [ %i.0162.unr.ph, %for.body29.preheader.split.loopexit ]
  %65 = icmp ult i32 %63, 4
  br i1 %65, label %for.cond31.preheader.loopexit, label %for.body29.preheader.split.split

for.body29.preheader.split.split:                 ; preds = %for.body29.preheader.split
  br label %for.body29, !dbg !102

for.cond31.preheader.loopexit.unr-lcssa:          ; preds = %for.body29
  br label %for.cond31.preheader.loopexit

for.cond31.preheader.loopexit:                    ; preds = %for.body29.preheader.split, %for.cond31.preheader.loopexit.unr-lcssa
  br label %for.cond31.preheader

for.cond31.preheader:                             ; preds = %for.cond31.preheader.loopexit, %middle.block235
  br i1 %cmp27161, label %for.body34.preheader, label %for.inc86, !dbg !112

for.body34.preheader:                             ; preds = %for.cond31.preheader
  %66 = add i64 %indvars.iv182, 1, !dbg !66
  %67 = trunc i64 %66 to i32
  %68 = sub i32 %8, %67, !dbg !66
  %69 = zext i32 %68 to i64
  %70 = add nuw nsw i64 %69, 1, !dbg !66
  %71 = trunc i64 %66 to i32
  %72 = sub i32 %9, %71, !dbg !66
  %73 = zext i32 %72 to i64
  %74 = add i64 %indvars.iv182, %73, !dbg !66
  %scevgep193.sum = add i64 %indvars.iv182, 1
  %scevgep194 = getelementptr float* %13, i64 %scevgep193.sum
  %scevgep196.sum = add i64 %74, 1
  %scevgep197 = getelementptr float* %13, i64 %scevgep196.sum
  %75 = trunc i64 %scevgep193.sum to i32
  %76 = sub i32 %12, %75, !dbg !66
  %77 = zext i32 %76 to i64
  %78 = add i64 %77, 1, !dbg !66
  %79 = lshr i64 %78, 2, !dbg !66
  %80 = mul i64 %79, 4, !dbg !66
  %81 = add i64 %80, -4, !dbg !66
  %82 = lshr i64 %81, 2, !dbg !66
  %83 = add i64 %82, 1, !dbg !66
  br label %for.body34, !dbg !66

for.body29:                                       ; preds = %for.body29, %for.body29.preheader.split.split
  %mik.0163 = phi float* [ %mik.0163.unr, %for.body29.preheader.split.split ], [ %incdec.ptr.3, %for.body29 ]
  %i.0162 = phi i32 [ %i.0162.unr, %for.body29.preheader.split.split ], [ %inc.3, %for.body29 ]
  %84 = load float* %mik.0163, align 4, !dbg !102, !tbaa !84
  %mul = fmul float %conv23, %84, !dbg !102
  store float %mul, float* %mik.0163, align 4, !dbg !102, !tbaa !84
  %inc = add nuw nsw i32 %i.0162, 1, !dbg !108
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !25, metadata !40), !dbg !109
  %incdec.ptr = getelementptr inbounds float* %mik.0163, i64 1, !dbg !110
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr, i64 0, metadata !36, metadata !40), !dbg !99
  %85 = load float* %incdec.ptr, align 4, !dbg !102, !tbaa !84
  %mul.1 = fmul float %conv23, %85, !dbg !102
  store float %mul.1, float* %incdec.ptr, align 4, !dbg !102, !tbaa !84
  %inc.1 = add nuw nsw i32 %inc, 1, !dbg !108
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !25, metadata !40), !dbg !109
  %incdec.ptr.1 = getelementptr inbounds float* %incdec.ptr, i64 1, !dbg !110
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr, i64 0, metadata !36, metadata !40), !dbg !99
  %86 = load float* %incdec.ptr.1, align 4, !dbg !102, !tbaa !84
  %mul.2 = fmul float %conv23, %86, !dbg !102
  store float %mul.2, float* %incdec.ptr.1, align 4, !dbg !102, !tbaa !84
  %inc.2 = add nuw nsw i32 %inc.1, 1, !dbg !108
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !25, metadata !40), !dbg !109
  %incdec.ptr.2 = getelementptr inbounds float* %incdec.ptr.1, i64 1, !dbg !110
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr, i64 0, metadata !36, metadata !40), !dbg !99
  %87 = load float* %incdec.ptr.2, align 4, !dbg !102, !tbaa !84
  %mul.3 = fmul float %conv23, %87, !dbg !102
  store float %mul.3, float* %incdec.ptr.2, align 4, !dbg !102, !tbaa !84
  %inc.3 = add nuw nsw i32 %inc.2, 1, !dbg !108
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !25, metadata !40), !dbg !109
  %incdec.ptr.3 = getelementptr inbounds float* %incdec.ptr.2, i64 1, !dbg !110
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr, i64 0, metadata !36, metadata !40), !dbg !99
  %exitcond.3 = icmp eq i32 %inc.2, %sub, !dbg !72
  br i1 %exitcond.3, label %for.cond31.preheader.loopexit.unr-lcssa, label %for.body29, !dbg !72, !llvm.loop !113

for.body34:                                       ; preds = %for.body34.preheader, %for.inc83
  %indvars.iv178 = phi i64 [ %indvars.iv.next179, %for.inc83 ], [ %indvars.iv, %for.body34.preheader ]
  %arrayidx37 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv178, !dbg !66
  %88 = load float** %arrayidx37, align 8, !dbg !66, !tbaa !57
  %add.ptr39 = getelementptr inbounds float* %88, i64 %indvars.iv182, !dbg !66
  %89 = load float* %add.ptr39, align 4, !dbg !66, !tbaa !84
  tail call void @llvm.dbg.value(metadata float %89, i64 0, metadata !32, metadata !40), !dbg !92
  br i1 %cmp18, label %if.then42, label %for.body75.lr.ph, !dbg !114

if.then42:                                        ; preds = %for.body34
  %add.ptr47 = getelementptr inbounds float* %88, i64 %idx.ext12, !dbg !115
  %90 = load float* %add.ptr47, align 4, !dbg !115, !tbaa !84
  store float %90, float* %add.ptr39, align 4, !dbg !118, !tbaa !84
  store float %89, float* %add.ptr47, align 4, !dbg !119, !tbaa !84
  %91 = load float* %add.ptr39, align 4, !dbg !120, !tbaa !84
  tail call void @llvm.dbg.value(metadata float %91, i64 0, metadata !32, metadata !40), !dbg !92
  br label %for.body75.lr.ph, !dbg !121

for.body75.lr.ph:                                 ; preds = %for.body34, %if.then42
  %t.0 = phi float [ %91, %if.then42 ], [ %89, %for.body34 ]
  tail call void @llvm.dbg.value(metadata float* %add.ptr70, i64 0, metadata !35, metadata !40), !dbg !122
  tail call void @llvm.dbg.value(metadata float* %add.ptr25, i64 0, metadata !36, metadata !40), !dbg !99
  %add.ptr70 = getelementptr inbounds float* %88, i64 %21, !dbg !123
  %92 = trunc i64 %21 to i32, !dbg !125
  %93 = and i64 %21, 4294967295, !dbg !125
  %end.idx = add nuw nsw i64 %70, %93, !dbg !125
  %n.vec = and i64 %70, 8589934588, !dbg !125
  %end.idx.rnd.down = add nuw nsw i64 %n.vec, %93, !dbg !125
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !125
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %for.body75.lr.ph
  %scevgep187.sum = add i64 %indvars.iv182, 1
  %scevgep188 = getelementptr float* %88, i64 %scevgep187.sum
  %bound0 = icmp ule float* %scevgep188, %scevgep197
  %scevgep190.sum = add i64 %74, 1
  %scevgep191 = getelementptr float* %88, i64 %scevgep190.sum
  %bound1 = icmp ule float* %scevgep194, %scevgep191
  %memcheck.conflict = and i1 %bound0, %bound1
  %add.ptr25.sum297 = add i64 %21, %n.vec
  %ptr.ind.end = getelementptr float* %13, i64 %add.ptr25.sum297
  %add.ptr70.sum = add i64 %21, %n.vec
  %ptr.ind.end201 = getelementptr float* %88, i64 %add.ptr70.sum
  %94 = trunc i64 %end.idx.rnd.down to i32
  br i1 %memcheck.conflict, label %middle.block, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %broadcast.splatinsert226 = insertelement <4 x float> undef, float %t.0, i32 0
  %broadcast.splat227 = shufflevector <4 x float> %broadcast.splatinsert226, <4 x float> undef, <4 x i32> zeroinitializer
  %xtraiter311 = and i64 %83, 1
  %lcmp.mod312 = icmp ne i64 %xtraiter311, 0
  %lcmp.overflow313 = icmp eq i64 %83, 0
  %lcmp.or314 = or i1 %lcmp.overflow313, %lcmp.mod312
  br i1 %lcmp.or314, label %vector.body.prol.preheader, label %vector.ph.split

vector.body.prol.preheader:                       ; preds = %vector.ph
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader, %vector.body.prol
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ %93, %vector.body.prol.preheader ], !dbg !125
  %prol.iter315 = phi i64 [ %prol.iter315.sub, %vector.body.prol ], [ %xtraiter311, %vector.body.prol.preheader ]
  %normalized.idx.prol = sub i64 %index.prol, %93
  %add.ptr25.sum298.prol = add i64 %21, %normalized.idx.prol
  %next.gep.prol = getelementptr float* %13, i64 %add.ptr25.sum298.prol
  %normalized.idx213.prol = sub i64 %index.prol, %93
  %add.ptr70.sum302.prol = add i64 %21, %normalized.idx213.prol
  %next.gep215.prol = getelementptr float* %88, i64 %add.ptr70.sum302.prol
  %95 = bitcast float* %next.gep.prol to <4 x float>*, !dbg !126
  %wide.load.prol = load <4 x float>* %95, align 4, !dbg !126, !tbaa !84
  %96 = fmul <4 x float> %broadcast.splat227, %wide.load.prol, !dbg !128
  %97 = bitcast float* %next.gep215.prol to <4 x float>*, !dbg !129
  %wide.load228.prol = load <4 x float>* %97, align 4, !dbg !129, !tbaa !84
  %98 = fadd <4 x float> %wide.load228.prol, %96, !dbg !129
  %99 = bitcast float* %next.gep215.prol to <4 x float>*, !dbg !129
  store <4 x float> %98, <4 x float>* %99, align 4, !dbg !129, !tbaa !84
  %index.next.prol = add i64 %index.prol, 4, !dbg !125
  %100 = icmp eq i64 %index.next.prol, %end.idx.rnd.down, !dbg !125
  %prol.iter315.sub = sub i64 %prol.iter315, 1, !dbg !125
  %prol.iter315.cmp = icmp ne i64 %prol.iter315.sub, 0, !dbg !125
  br i1 %prol.iter315.cmp, label %vector.body.prol, label %vector.ph.split.loopexit, !llvm.loop !130

vector.ph.split.loopexit:                         ; preds = %vector.body.prol
  %index.unr.ph = phi i64 [ %index.next.prol, %vector.body.prol ]
  br label %vector.ph.split

vector.ph.split:                                  ; preds = %vector.ph.split.loopexit, %vector.ph
  %index.unr = phi i64 [ %93, %vector.ph ], [ %index.unr.ph, %vector.ph.split.loopexit ]
  %101 = icmp ult i64 %83, 2
  br i1 %101, label %middle.block.loopexit, label %vector.ph.split.split

vector.ph.split.split:                            ; preds = %vector.ph.split
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph.split.split
  %index = phi i64 [ %index.unr, %vector.ph.split.split ], [ %index.next.1, %vector.body ], !dbg !125
  %normalized.idx = sub i64 %index, %93
  %add.ptr25.sum298 = add i64 %21, %normalized.idx
  %next.gep = getelementptr float* %13, i64 %add.ptr25.sum298
  %normalized.idx213 = sub i64 %index, %93
  %add.ptr70.sum302 = add i64 %21, %normalized.idx213
  %next.gep215 = getelementptr float* %88, i64 %add.ptr70.sum302
  %102 = bitcast float* %next.gep to <4 x float>*, !dbg !126
  %wide.load = load <4 x float>* %102, align 4, !dbg !126, !tbaa !84
  %103 = fmul <4 x float> %broadcast.splat227, %wide.load, !dbg !128
  %104 = bitcast float* %next.gep215 to <4 x float>*, !dbg !129
  %wide.load228 = load <4 x float>* %104, align 4, !dbg !129, !tbaa !84
  %105 = fadd <4 x float> %wide.load228, %103, !dbg !129
  %106 = bitcast float* %next.gep215 to <4 x float>*, !dbg !129
  store <4 x float> %105, <4 x float>* %106, align 4, !dbg !129, !tbaa !84
  %index.next = add i64 %index, 4, !dbg !125
  %normalized.idx.1 = sub i64 %index.next, %93
  %add.ptr25.sum298.1 = add i64 %21, %normalized.idx.1
  %next.gep.1 = getelementptr float* %13, i64 %add.ptr25.sum298.1
  %normalized.idx213.1 = sub i64 %index.next, %93
  %add.ptr70.sum302.1 = add i64 %21, %normalized.idx213.1
  %next.gep215.1 = getelementptr float* %88, i64 %add.ptr70.sum302.1
  %107 = bitcast float* %next.gep.1 to <4 x float>*, !dbg !126
  %wide.load.1 = load <4 x float>* %107, align 4, !dbg !126, !tbaa !84
  %108 = fmul <4 x float> %broadcast.splat227, %wide.load.1, !dbg !128
  %109 = bitcast float* %next.gep215.1 to <4 x float>*, !dbg !129
  %wide.load228.1 = load <4 x float>* %109, align 4, !dbg !129, !tbaa !84
  %110 = fadd <4 x float> %wide.load228.1, %108, !dbg !129
  %111 = bitcast float* %next.gep215.1 to <4 x float>*, !dbg !129
  store <4 x float> %110, <4 x float>* %111, align 4, !dbg !129, !tbaa !84
  %index.next.1 = add i64 %index.next, 4, !dbg !125
  %112 = icmp eq i64 %index.next.1, %end.idx.rnd.down, !dbg !125
  br i1 %112, label %middle.block.loopexit.unr-lcssa, label %vector.body, !dbg !125, !llvm.loop !131

middle.block.loopexit.unr-lcssa:                  ; preds = %vector.body
  br label %middle.block.loopexit

middle.block.loopexit:                            ; preds = %vector.ph.split, %middle.block.loopexit.unr-lcssa
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %vector.memcheck, %for.body75.lr.ph
  %resume.val = phi float* [ %add.ptr25, %for.body75.lr.ph ], [ %add.ptr25, %vector.memcheck ], [ %ptr.ind.end, %middle.block.loopexit ]
  %resume.val199 = phi float* [ %add.ptr70, %for.body75.lr.ph ], [ %add.ptr70, %vector.memcheck ], [ %ptr.ind.end201, %middle.block.loopexit ]
  %resume.val202 = phi i64 [ %93, %for.body75.lr.ph ], [ %93, %vector.memcheck ], [ %end.idx.rnd.down, %middle.block.loopexit ]
  %trunc.resume.val = phi i32 [ %92, %for.body75.lr.ph ], [ %92, %vector.memcheck ], [ %94, %middle.block.loopexit ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val202
  br i1 %cmp.n, label %for.inc83, label %for.body75.preheader

for.body75.preheader:                             ; preds = %middle.block
  %113 = sub i32 %0, %trunc.resume.val
  %xtraiter316 = and i32 %113, 3
  %lcmp.mod317 = icmp ne i32 %xtraiter316, 0
  %lcmp.overflow318 = icmp eq i32 %113, 0
  %lcmp.or319 = or i1 %lcmp.overflow318, %lcmp.mod317
  br i1 %lcmp.or319, label %for.body75.prol.preheader, label %for.body75.preheader.split

for.body75.prol.preheader:                        ; preds = %for.body75.preheader
  br label %for.body75.prol, !dbg !126

for.body75.prol:                                  ; preds = %for.body75.prol.preheader, %for.body75.prol
  %mik.1167.prol = phi float* [ %incdec.ptr81.prol, %for.body75.prol ], [ %resume.val, %for.body75.prol.preheader ]
  %aij.0166.prol = phi float* [ %incdec.ptr80.prol, %for.body75.prol ], [ %resume.val199, %for.body75.prol.preheader ]
  %i.1165.prol = phi i32 [ %inc79.prol, %for.body75.prol ], [ %trunc.resume.val, %for.body75.prol.preheader ]
  %prol.iter320 = phi i32 [ %prol.iter320.sub, %for.body75.prol ], [ %xtraiter316, %for.body75.prol.preheader ]
  %114 = load float* %mik.1167.prol, align 4, !dbg !126, !tbaa !84
  %mul76.prol = fmul float %t.0, %114, !dbg !128
  %115 = load float* %aij.0166.prol, align 4, !dbg !129, !tbaa !84
  %add77.prol = fadd float %115, %mul76.prol, !dbg !129
  store float %add77.prol, float* %aij.0166.prol, align 4, !dbg !129, !tbaa !84
  %inc79.prol = add nuw nsw i32 %i.1165.prol, 1, !dbg !132
  tail call void @llvm.dbg.value(metadata i32 %inc79.prol, i64 0, metadata !25, metadata !40), !dbg !109
  %incdec.ptr80.prol = getelementptr inbounds float* %aij.0166.prol, i64 1, !dbg !133
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr80.prol, i64 0, metadata !35, metadata !40), !dbg !122
  %incdec.ptr81.prol = getelementptr inbounds float* %mik.1167.prol, i64 1, !dbg !134
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr81.prol, i64 0, metadata !36, metadata !40), !dbg !99
  %exitcond177.prol = icmp eq i32 %i.1165.prol, %sub, !dbg !125
  %prol.iter320.sub = sub i32 %prol.iter320, 1, !dbg !125
  %prol.iter320.cmp = icmp ne i32 %prol.iter320.sub, 0, !dbg !125
  br i1 %prol.iter320.cmp, label %for.body75.prol, label %for.body75.preheader.split.loopexit, !llvm.loop !135

for.body75.preheader.split.loopexit:              ; preds = %for.body75.prol
  %mik.1167.unr.ph = phi float* [ %incdec.ptr81.prol, %for.body75.prol ]
  %aij.0166.unr.ph = phi float* [ %incdec.ptr80.prol, %for.body75.prol ]
  %i.1165.unr.ph = phi i32 [ %inc79.prol, %for.body75.prol ]
  br label %for.body75.preheader.split

for.body75.preheader.split:                       ; preds = %for.body75.preheader.split.loopexit, %for.body75.preheader
  %mik.1167.unr = phi float* [ %resume.val, %for.body75.preheader ], [ %mik.1167.unr.ph, %for.body75.preheader.split.loopexit ]
  %aij.0166.unr = phi float* [ %resume.val199, %for.body75.preheader ], [ %aij.0166.unr.ph, %for.body75.preheader.split.loopexit ]
  %i.1165.unr = phi i32 [ %trunc.resume.val, %for.body75.preheader ], [ %i.1165.unr.ph, %for.body75.preheader.split.loopexit ]
  %116 = icmp ult i32 %113, 4
  br i1 %116, label %for.inc83.loopexit, label %for.body75.preheader.split.split

for.body75.preheader.split.split:                 ; preds = %for.body75.preheader.split
  br label %for.body75, !dbg !126

for.body75:                                       ; preds = %for.body75, %for.body75.preheader.split.split
  %mik.1167 = phi float* [ %mik.1167.unr, %for.body75.preheader.split.split ], [ %incdec.ptr81.3, %for.body75 ]
  %aij.0166 = phi float* [ %aij.0166.unr, %for.body75.preheader.split.split ], [ %incdec.ptr80.3, %for.body75 ]
  %i.1165 = phi i32 [ %i.1165.unr, %for.body75.preheader.split.split ], [ %inc79.3, %for.body75 ]
  %117 = load float* %mik.1167, align 4, !dbg !126, !tbaa !84
  %mul76 = fmul float %t.0, %117, !dbg !128
  %118 = load float* %aij.0166, align 4, !dbg !129, !tbaa !84
  %add77 = fadd float %118, %mul76, !dbg !129
  store float %add77, float* %aij.0166, align 4, !dbg !129, !tbaa !84
  %inc79 = add nuw nsw i32 %i.1165, 1, !dbg !132
  tail call void @llvm.dbg.value(metadata i32 %inc79, i64 0, metadata !25, metadata !40), !dbg !109
  %incdec.ptr80 = getelementptr inbounds float* %aij.0166, i64 1, !dbg !133
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr80, i64 0, metadata !35, metadata !40), !dbg !122
  %incdec.ptr81 = getelementptr inbounds float* %mik.1167, i64 1, !dbg !134
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr81, i64 0, metadata !36, metadata !40), !dbg !99
  %119 = load float* %incdec.ptr81, align 4, !dbg !126, !tbaa !84
  %mul76.1 = fmul float %t.0, %119, !dbg !128
  %120 = load float* %incdec.ptr80, align 4, !dbg !129, !tbaa !84
  %add77.1 = fadd float %120, %mul76.1, !dbg !129
  store float %add77.1, float* %incdec.ptr80, align 4, !dbg !129, !tbaa !84
  %inc79.1 = add nuw nsw i32 %inc79, 1, !dbg !132
  tail call void @llvm.dbg.value(metadata i32 %inc79, i64 0, metadata !25, metadata !40), !dbg !109
  %incdec.ptr80.1 = getelementptr inbounds float* %incdec.ptr80, i64 1, !dbg !133
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr80, i64 0, metadata !35, metadata !40), !dbg !122
  %incdec.ptr81.1 = getelementptr inbounds float* %incdec.ptr81, i64 1, !dbg !134
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr81, i64 0, metadata !36, metadata !40), !dbg !99
  %121 = load float* %incdec.ptr81.1, align 4, !dbg !126, !tbaa !84
  %mul76.2 = fmul float %t.0, %121, !dbg !128
  %122 = load float* %incdec.ptr80.1, align 4, !dbg !129, !tbaa !84
  %add77.2 = fadd float %122, %mul76.2, !dbg !129
  store float %add77.2, float* %incdec.ptr80.1, align 4, !dbg !129, !tbaa !84
  %inc79.2 = add nuw nsw i32 %inc79.1, 1, !dbg !132
  tail call void @llvm.dbg.value(metadata i32 %inc79, i64 0, metadata !25, metadata !40), !dbg !109
  %incdec.ptr80.2 = getelementptr inbounds float* %incdec.ptr80.1, i64 1, !dbg !133
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr80, i64 0, metadata !35, metadata !40), !dbg !122
  %incdec.ptr81.2 = getelementptr inbounds float* %incdec.ptr81.1, i64 1, !dbg !134
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr81, i64 0, metadata !36, metadata !40), !dbg !99
  %123 = load float* %incdec.ptr81.2, align 4, !dbg !126, !tbaa !84
  %mul76.3 = fmul float %t.0, %123, !dbg !128
  %124 = load float* %incdec.ptr80.2, align 4, !dbg !129, !tbaa !84
  %add77.3 = fadd float %124, %mul76.3, !dbg !129
  store float %add77.3, float* %incdec.ptr80.2, align 4, !dbg !129, !tbaa !84
  %inc79.3 = add nuw nsw i32 %inc79.2, 1, !dbg !132
  tail call void @llvm.dbg.value(metadata i32 %inc79, i64 0, metadata !25, metadata !40), !dbg !109
  %incdec.ptr80.3 = getelementptr inbounds float* %incdec.ptr80.2, i64 1, !dbg !133
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr80, i64 0, metadata !35, metadata !40), !dbg !122
  %incdec.ptr81.3 = getelementptr inbounds float* %incdec.ptr81.2, i64 1, !dbg !134
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr81, i64 0, metadata !36, metadata !40), !dbg !99
  %exitcond177.3 = icmp eq i32 %inc79.2, %sub, !dbg !125
  br i1 %exitcond177.3, label %for.inc83.loopexit.unr-lcssa, label %for.body75, !dbg !125, !llvm.loop !136

for.inc83.loopexit.unr-lcssa:                     ; preds = %for.body75
  br label %for.inc83.loopexit

for.inc83.loopexit:                               ; preds = %for.body75.preheader.split, %for.inc83.loopexit.unr-lcssa
  br label %for.inc83

for.inc83:                                        ; preds = %for.inc83.loopexit, %middle.block
  %indvars.iv.next179 = add nuw nsw i64 %indvars.iv178, 1, !dbg !112
  %lftr.wideiv = trunc i64 %indvars.iv178 to i32, !dbg !112
  %exitcond181 = icmp eq i32 %lftr.wideiv, %sub, !dbg !112
  br i1 %exitcond181, label %for.inc86.loopexit, label %for.body34, !dbg !112

for.inc86.loopexit:                               ; preds = %for.inc83
  br label %for.inc86

for.inc86:                                        ; preds = %for.inc86.loopexit, %if.end21, %for.cond31.preheader, %for.body.for.inc86_crit_edge
  %indvars.iv.next183.pre-phi = phi i64 [ %indvars.iv.next183.pre, %for.body.for.inc86_crit_edge ], [ %21, %for.cond31.preheader ], [ %21, %if.end21 ], [ %21, %for.inc86.loopexit ], !dbg !64
  %info.1 = phi i32 [ %16, %for.body.for.inc86_crit_edge ], [ %info.0173, %for.cond31.preheader ], [ %info.0173, %if.end21 ], [ %info.0173, %for.inc86.loopexit ]
  tail call void @llvm.dbg.value(metadata i32* %incdec.ptr88, i64 0, metadata !24, metadata !40), !dbg !42
  %cmp5 = icmp slt i64 %indvars.iv.next183.pre-phi, %4, !dbg !137
  br i1 %cmp5, label %for.inc86.for.body_crit_edge, label %CLEAN_UP.loopexit, !dbg !64

for.inc86.for.body_crit_edge:                     ; preds = %for.inc86
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !64
  %incdec.ptr88 = getelementptr inbounds i32* %ipvt.addr.0174, i64 1, !dbg !138
  %arrayidx7.phi.trans.insert = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv.next183.pre-phi
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
  store i32 %sub, i32* %ipvt.addr.1, align 4, !dbg !139, !tbaa !79
  %125 = load float* %akk.1, align 4, !dbg !140, !tbaa !84
  %cmp91 = fcmp oeq float %125, 0.000000e+00, !dbg !140
  tail call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !30, metadata !40), !dbg !60
  %info.3 = select i1 %cmp91, i32 %0, i32 %info.2, !dbg !142
  br label %return, !dbg !142

return:                                           ; preds = %CLEAN_UP, %entry
  %retval.0 = phi i32 [ -1, %entry ], [ %info.3, %CLEAN_UP ]
  ret i32 %retval.0, !dbg !143
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
!113 = distinct !{!113, !106, !107}
!114 = !MDLocation(line: 93, column: 11, scope: !67)
!115 = !MDLocation(line: 94, column: 17, scope: !116)
!116 = !{!"0xb\0093\0020\0015", !1, !117}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!117 = !{!"0xb\0093\0011\0014", !1, !67}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!118 = !MDLocation(line: 94, column: 2, scope: !116)
!119 = !MDLocation(line: 95, column: 2, scope: !116)
!120 = !MDLocation(line: 96, column: 6, scope: !116)
!121 = !MDLocation(line: 97, column: 7, scope: !116)
!122 = !MDLocation(line: 51, column: 26, scope: !4)
!123 = !MDLocation(line: 98, column: 23, scope: !124)
!124 = !{!"0xb\0098\007\0016", !1, !67}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!125 = !MDLocation(line: 98, column: 7, scope: !124)
!126 = !MDLocation(line: 99, column: 13, scope: !127)
!127 = !{!"0xb\0098\007\0017", !1, !124}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!128 = !MDLocation(line: 99, column: 10, scope: !127)
!129 = !MDLocation(line: 99, column: 2, scope: !127)
!130 = distinct !{!130, !104}
!131 = distinct !{!131, !106, !107}
!132 = !MDLocation(line: 98, column: 53, scope: !127)
!133 = !MDLocation(line: 98, column: 58, scope: !127)
!134 = !MDLocation(line: 98, column: 65, scope: !127)
!135 = distinct !{!135, !104}
!136 = distinct !{!136, !106, !107}
!137 = !MDLocation(line: 62, column: 13, scope: !71)
!138 = !MDLocation(line: 62, column: 25, scope: !71)
!139 = !MDLocation(line: 104, column: 3, scope: !4)
!140 = !MDLocation(line: 105, column: 7, scope: !141)
!141 = !{!"0xb\00105\007\0018", !1, !4}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!142 = !MDLocation(line: 105, column: 7, scope: !4)
!143 = !MDLocation(line: 107, column: 1, scope: !4)
