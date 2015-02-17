; ModuleID = 'blas.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind readonly uwtable
define i32 @isamax(i32 %n, float* nocapture readonly %sx, i32 %incx) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %n, i64 0, metadata !14, metadata !131), !dbg !132
  tail call void @llvm.dbg.value(metadata float* %sx, i64 0, metadata !15, metadata !131), !dbg !133
  tail call void @llvm.dbg.value(metadata i32 %incx, i64 0, metadata !16, metadata !131), !dbg !134
  tail call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !17, metadata !131), !dbg !135
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !19, metadata !131), !dbg !136
  %cmp = icmp slt i32 %n, 2, !dbg !137
  br i1 %cmp, label %return, label %if.end, !dbg !139

if.end:                                           ; preds = %entry
  %cmp1 = icmp eq i32 %incx, 1, !dbg !140
  br i1 %cmp1, label %if.end36, label %if.then2, !dbg !142

if.then2:                                         ; preds = %if.end
  %cmp3 = icmp slt i32 %incx, 0, !dbg !143
  br i1 %cmp3, label %if.then4, label %if.end6, !dbg !146

if.then4:                                         ; preds = %if.then2
  %add = sub i32 1, %n, !dbg !147
  %mul = mul nsw i32 %add, %incx, !dbg !148
  %add5 = add nsw i32 %mul, 1, !dbg !148
  %idx.ext = sext i32 %add5 to i64, !dbg !149
  %add.ptr = getelementptr inbounds float* %sx, i64 %idx.ext, !dbg !149
  tail call void @llvm.dbg.value(metadata float* %add.ptr, i64 0, metadata !15, metadata !131), !dbg !133
  br label %if.end6, !dbg !150

if.end6:                                          ; preds = %if.then4, %if.then2
  %sx.addr.0 = phi float* [ %add.ptr, %if.then4 ], [ %sx, %if.then2 ]
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !19, metadata !131), !dbg !136
  %0 = load float* %sx.addr.0, align 4, !dbg !151, !tbaa !152
  %cmp7 = fcmp ogt float %0, 0.000000e+00, !dbg !151
  br i1 %cmp7, label %for.body.lr.ph, label %cond.false, !dbg !151

cond.false:                                       ; preds = %if.end6
  %sub9 = fsub float -0.000000e+00, %0, !dbg !156
  br label %for.body.lr.ph, !dbg !156

for.body.lr.ph:                                   ; preds = %cond.false, %if.end6
  %cond = phi float [ %sub9, %cond.false ], [ %0, %if.end6 ], !dbg !151
  tail call void @llvm.dbg.value(metadata float %cond, i64 0, metadata !17, metadata !131), !dbg !135
  %idx.ext10 = sext i32 %incx to i64, !dbg !158
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !18, metadata !131), !dbg !159
  %1 = add i32 %n, -1, !dbg !160
  br label %for.body, !dbg !160

for.body:                                         ; preds = %for.inc, %for.body.lr.ph
  %sx.addr.0.pn = phi float* [ %sx.addr.0, %for.body.lr.ph ], [ %sx.addr.1116, %for.inc ]
  %istmp.0115 = phi i32 [ 0, %for.body.lr.ph ], [ %istmp.1, %for.inc ]
  %i.0114 = phi i32 [ 1, %for.body.lr.ph ], [ %inc, %for.inc ]
  %smax.0113 = phi float [ %cond, %for.body.lr.ph ], [ %smax.1, %for.inc ]
  %sx.addr.1116 = getelementptr inbounds float* %sx.addr.0.pn, i64 %idx.ext10, !dbg !158
  %2 = load float* %sx.addr.1116, align 4, !dbg !162, !tbaa !152
  %cmp15 = fcmp ogt float %2, 0.000000e+00, !dbg !162
  br i1 %cmp15, label %cond.end20, label %cond.false18, !dbg !162

cond.false18:                                     ; preds = %for.body
  %sub19 = fsub float -0.000000e+00, %2, !dbg !165
  br label %cond.end20, !dbg !165

cond.end20:                                       ; preds = %for.body, %cond.false18
  %cond21 = phi float [ %sub19, %cond.false18 ], [ %2, %for.body ], !dbg !162
  %cmp22.not = fcmp ule float %cond21, %smax.0113, !dbg !167
  %brmerge = or i1 %cmp22.not, %cmp15, !dbg !167
  %smax.0113.mux = select i1 %cmp22.not, float %smax.0113, float %2, !dbg !167
  %istmp.0115.mux = select i1 %cmp22.not, i32 %istmp.0115, i32 %i.0114, !dbg !167
  br i1 %brmerge, label %for.inc, label %cond.false29, !dbg !167

cond.false29:                                     ; preds = %cond.end20
  %sub30 = fsub float -0.000000e+00, %2, !dbg !168
  br label %for.inc, !dbg !168

for.inc:                                          ; preds = %cond.end20, %cond.false29
  %smax.1 = phi float [ %smax.0113.mux, %cond.end20 ], [ %sub30, %cond.false29 ]
  %istmp.1 = phi i32 [ %istmp.0115.mux, %cond.end20 ], [ %i.0114, %cond.false29 ]
  %inc = add nuw nsw i32 %i.0114, 1, !dbg !171
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !18, metadata !131), !dbg !159
  %exitcond118 = icmp eq i32 %i.0114, %1, !dbg !160
  br i1 %exitcond118, label %return.loopexit121, label %for.body, !dbg !160

if.end36:                                         ; preds = %if.end
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !19, metadata !131), !dbg !136
  %3 = load float* %sx, align 4, !dbg !172, !tbaa !152
  %cmp38 = fcmp ogt float %3, 0.000000e+00, !dbg !172
  br i1 %cmp38, label %for.body48.lr.ph, label %cond.false41, !dbg !172

cond.false41:                                     ; preds = %if.end36
  %sub42 = fsub float -0.000000e+00, %3, !dbg !173
  br label %for.body48.lr.ph, !dbg !173

for.body48.lr.ph:                                 ; preds = %cond.false41, %if.end36
  %smax.2.ph = phi float [ %sub42, %cond.false41 ], [ %3, %if.end36 ]
  %4 = add i32 %n, -1, !dbg !175
  %xtraiter = and i32 %4, 1
  %lcmp.mod = icmp ne i32 %xtraiter, 0
  %lcmp.overflow = icmp eq i32 %4, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %for.body48.prol, label %for.body48.lr.ph.split

for.body48.prol:                                  ; preds = %for.inc69.prol, %for.body48.lr.ph
  %sx.pn.prol = phi float* [ %sx, %for.body48.lr.ph ], [ %sx.addr.2110.prol, %for.inc69.prol ]
  %istmp.2109.prol = phi i32 [ 0, %for.body48.lr.ph ], [ %istmp.3.prol, %for.inc69.prol ]
  %i.1108.prol = phi i32 [ 1, %for.body48.lr.ph ], [ %inc70.prol, %for.inc69.prol ]
  %smax.2107.prol = phi float [ %smax.2.ph, %for.body48.lr.ph ], [ %smax.3.prol, %for.inc69.prol ]
  %prol.iter = phi i32 [ %xtraiter, %for.body48.lr.ph ], [ %prol.iter.sub, %for.inc69.prol ]
  %sx.addr.2110.prol = getelementptr inbounds float* %sx.pn.prol, i64 1, !dbg !177
  %5 = load float* %sx.addr.2110.prol, align 4, !dbg !178, !tbaa !152
  %cmp50.prol = fcmp ogt float %5, 0.000000e+00, !dbg !178
  br i1 %cmp50.prol, label %cond.end55.prol, label %cond.false53.prol, !dbg !178

cond.false53.prol:                                ; preds = %for.body48.prol
  %sub54.prol = fsub float -0.000000e+00, %5, !dbg !181
  br label %cond.end55.prol, !dbg !181

cond.end55.prol:                                  ; preds = %cond.false53.prol, %for.body48.prol
  %cond56.prol = phi float [ %sub54.prol, %cond.false53.prol ], [ %5, %for.body48.prol ], !dbg !178
  %cmp57.not.prol = fcmp ule float %cond56.prol, %smax.2107.prol, !dbg !183
  %brmerge119.prol = or i1 %cmp57.not.prol, %cmp50.prol, !dbg !183
  %smax.2107.mux.prol = select i1 %cmp57.not.prol, float %smax.2107.prol, float %5, !dbg !183
  %istmp.2109.mux.prol = select i1 %cmp57.not.prol, i32 %istmp.2109.prol, i32 %i.1108.prol, !dbg !183
  br i1 %brmerge119.prol, label %for.inc69.prol, label %cond.false64.prol, !dbg !183

cond.false64.prol:                                ; preds = %cond.end55.prol
  %sub65.prol = fsub float -0.000000e+00, %5, !dbg !184
  br label %for.inc69.prol, !dbg !184

for.inc69.prol:                                   ; preds = %cond.false64.prol, %cond.end55.prol
  %smax.3.prol = phi float [ %smax.2107.mux.prol, %cond.end55.prol ], [ %sub65.prol, %cond.false64.prol ]
  %istmp.3.prol = phi i32 [ %istmp.2109.mux.prol, %cond.end55.prol ], [ %i.1108.prol, %cond.false64.prol ]
  %inc70.prol = add nuw nsw i32 %i.1108.prol, 1, !dbg !187
  tail call void @llvm.dbg.value(metadata i32 %inc70.prol, i64 0, metadata !18, metadata !131), !dbg !159
  %exitcond.prol = icmp eq i32 %i.1108.prol, %4, !dbg !175
  %prol.iter.sub = sub i32 %prol.iter, 1, !dbg !175
  %prol.iter.cmp = icmp ne i32 %prol.iter.sub, 0, !dbg !175
  br i1 %prol.iter.cmp, label %for.body48.prol, label %for.body48.lr.ph.split, !llvm.loop !188

for.body48.lr.ph.split:                           ; preds = %for.inc69.prol, %for.body48.lr.ph
  %istmp.3.lcssa.unr = phi i32 [ 0, %for.body48.lr.ph ], [ %istmp.3.prol, %for.inc69.prol ]
  %sx.pn.unr = phi float* [ %sx, %for.body48.lr.ph ], [ %sx.addr.2110.prol, %for.inc69.prol ]
  %istmp.2109.unr = phi i32 [ 0, %for.body48.lr.ph ], [ %istmp.3.prol, %for.inc69.prol ]
  %i.1108.unr = phi i32 [ 1, %for.body48.lr.ph ], [ %inc70.prol, %for.inc69.prol ]
  %smax.2107.unr = phi float [ %smax.2.ph, %for.body48.lr.ph ], [ %smax.3.prol, %for.inc69.prol ]
  %6 = icmp ult i32 %4, 2
  br i1 %6, label %return.loopexit, label %for.body48.lr.ph.split.split

for.body48.lr.ph.split.split:                     ; preds = %for.body48.lr.ph.split
  br label %for.body48, !dbg !175

for.body48:                                       ; preds = %for.inc69.1, %for.body48.lr.ph.split.split
  %sx.pn = phi float* [ %sx.pn.unr, %for.body48.lr.ph.split.split ], [ %sx.addr.2110.1, %for.inc69.1 ]
  %istmp.2109 = phi i32 [ %istmp.2109.unr, %for.body48.lr.ph.split.split ], [ %istmp.3.1, %for.inc69.1 ]
  %i.1108 = phi i32 [ %i.1108.unr, %for.body48.lr.ph.split.split ], [ %inc70.1, %for.inc69.1 ]
  %smax.2107 = phi float [ %smax.2107.unr, %for.body48.lr.ph.split.split ], [ %smax.3.1, %for.inc69.1 ]
  %sx.addr.2110 = getelementptr inbounds float* %sx.pn, i64 1, !dbg !177
  %7 = load float* %sx.addr.2110, align 4, !dbg !178, !tbaa !152
  %cmp50 = fcmp ogt float %7, 0.000000e+00, !dbg !178
  br i1 %cmp50, label %cond.end55, label %cond.false53, !dbg !178

cond.false53:                                     ; preds = %for.body48
  %sub54 = fsub float -0.000000e+00, %7, !dbg !181
  br label %cond.end55, !dbg !181

cond.end55:                                       ; preds = %for.body48, %cond.false53
  %cond56 = phi float [ %sub54, %cond.false53 ], [ %7, %for.body48 ], !dbg !178
  %cmp57.not = fcmp ule float %cond56, %smax.2107, !dbg !183
  %brmerge119 = or i1 %cmp57.not, %cmp50, !dbg !183
  %smax.2107.mux = select i1 %cmp57.not, float %smax.2107, float %7, !dbg !183
  %istmp.2109.mux = select i1 %cmp57.not, i32 %istmp.2109, i32 %i.1108, !dbg !183
  br i1 %brmerge119, label %for.inc69, label %cond.false64, !dbg !183

cond.false64:                                     ; preds = %cond.end55
  %sub65 = fsub float -0.000000e+00, %7, !dbg !184
  br label %for.inc69, !dbg !184

for.inc69:                                        ; preds = %cond.end55, %cond.false64
  %smax.3 = phi float [ %smax.2107.mux, %cond.end55 ], [ %sub65, %cond.false64 ]
  %istmp.3 = phi i32 [ %istmp.2109.mux, %cond.end55 ], [ %i.1108, %cond.false64 ]
  %inc70 = add nuw nsw i32 %i.1108, 1, !dbg !187
  tail call void @llvm.dbg.value(metadata i32 %inc70, i64 0, metadata !18, metadata !131), !dbg !159
  %sx.addr.2110.1 = getelementptr inbounds float* %sx.addr.2110, i64 1, !dbg !177
  %8 = load float* %sx.addr.2110.1, align 4, !dbg !178, !tbaa !152
  %cmp50.1 = fcmp ogt float %8, 0.000000e+00, !dbg !178
  br i1 %cmp50.1, label %cond.end55.1, label %cond.false53.1, !dbg !178

return.loopexit.unr-lcssa:                        ; preds = %for.inc69.1
  %istmp.3.lcssa.ph = phi i32 [ %istmp.3.1, %for.inc69.1 ]
  br label %return.loopexit

return.loopexit:                                  ; preds = %for.body48.lr.ph.split, %return.loopexit.unr-lcssa
  %istmp.3.lcssa = phi i32 [ %istmp.3.lcssa.unr, %for.body48.lr.ph.split ], [ %istmp.3.lcssa.ph, %return.loopexit.unr-lcssa ]
  br label %return

return.loopexit121:                               ; preds = %for.inc
  %istmp.1.lcssa = phi i32 [ %istmp.1, %for.inc ]
  br label %return

return:                                           ; preds = %return.loopexit121, %return.loopexit, %entry
  %retval.0 = phi i32 [ 0, %entry ], [ %istmp.3.lcssa, %return.loopexit ], [ %istmp.1.lcssa, %return.loopexit121 ]
  ret i32 %retval.0, !dbg !190

cond.false53.1:                                   ; preds = %for.inc69
  %sub54.1 = fsub float -0.000000e+00, %8, !dbg !181
  br label %cond.end55.1, !dbg !181

cond.end55.1:                                     ; preds = %cond.false53.1, %for.inc69
  %cond56.1 = phi float [ %sub54.1, %cond.false53.1 ], [ %8, %for.inc69 ], !dbg !178
  %cmp57.not.1 = fcmp ule float %cond56.1, %smax.3, !dbg !183
  %brmerge119.1 = or i1 %cmp57.not.1, %cmp50.1, !dbg !183
  %smax.2107.mux.1 = select i1 %cmp57.not.1, float %smax.3, float %8, !dbg !183
  %istmp.2109.mux.1 = select i1 %cmp57.not.1, i32 %istmp.3, i32 %inc70, !dbg !183
  br i1 %brmerge119.1, label %for.inc69.1, label %cond.false64.1, !dbg !183

cond.false64.1:                                   ; preds = %cond.end55.1
  %sub65.1 = fsub float -0.000000e+00, %8, !dbg !184
  br label %for.inc69.1, !dbg !184

for.inc69.1:                                      ; preds = %cond.false64.1, %cond.end55.1
  %smax.3.1 = phi float [ %smax.2107.mux.1, %cond.end55.1 ], [ %sub65.1, %cond.false64.1 ]
  %istmp.3.1 = phi i32 [ %istmp.2109.mux.1, %cond.end55.1 ], [ %inc70, %cond.false64.1 ]
  %inc70.1 = add nuw nsw i32 %inc70, 1, !dbg !187
  tail call void @llvm.dbg.value(metadata i32 %inc70, i64 0, metadata !18, metadata !131), !dbg !159
  %exitcond.1 = icmp eq i32 %inc70, %4, !dbg !175
  br i1 %exitcond.1, label %return.loopexit.unr-lcssa, label %for.body48, !dbg !175
}

; Function Attrs: nounwind uwtable
define void @saxpy(i32 %n, double, float* nocapture readonly %sx, i32 %incx, float* nocapture %sy, i32 %incy) #1 {
entry:
  %sa = fptrunc double %0 to float
  tail call void @llvm.dbg.value(metadata i32 %n, i64 0, metadata !24, metadata !131), !dbg !191
  tail call void @llvm.dbg.value(metadata float %sa, i64 0, metadata !25, metadata !131), !dbg !192
  tail call void @llvm.dbg.value(metadata float* %sx, i64 0, metadata !26, metadata !131), !dbg !193
  tail call void @llvm.dbg.value(metadata i32 %incx, i64 0, metadata !27, metadata !131), !dbg !194
  tail call void @llvm.dbg.value(metadata float* %sy, i64 0, metadata !28, metadata !131), !dbg !195
  tail call void @llvm.dbg.value(metadata i32 %incy, i64 0, metadata !29, metadata !131), !dbg !196
  %cmp = icmp slt i32 %n, 1, !dbg !197
  %cmp1 = fcmp oeq float %sa, 0.000000e+00, !dbg !199
  %or.cond = or i1 %cmp, %cmp1, !dbg !201
  br i1 %or.cond, label %for.end60, label %if.end, !dbg !201

if.end:                                           ; preds = %entry
  %cmp3 = icmp eq i32 %incx, %incy, !dbg !202
  br i1 %cmp3, label %if.then5, label %if.end28, !dbg !204

if.then5:                                         ; preds = %if.end
  %cmp6 = icmp eq i32 %incx, 1, !dbg !205
  br i1 %cmp6, label %for.cond.preheader, label %if.end12, !dbg !208

for.cond.preheader:                               ; preds = %if.then5
  %cmp998 = icmp sgt i32 %n, 0, !dbg !209
  br i1 %cmp998, label %for.body.lr.ph, label %for.end60, !dbg !213

for.body.lr.ph:                                   ; preds = %for.cond.preheader
  %1 = add i32 %n, -1, !dbg !213
  %2 = zext i32 %1 to i64
  %3 = add nuw nsw i64 %2, 1, !dbg !213
  %end.idx = add nuw nsw i64 %2, 1, !dbg !214
  %n.vec = and i64 %3, 8589934588, !dbg !214
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !214
  %4 = add i32 %n, -1
  %5 = zext i32 %4 to i64
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %for.body.lr.ph
  %scevgep117 = getelementptr float* %sx, i64 %5
  %bound0 = icmp uge float* %scevgep117, %sy
  %scevgep = getelementptr float* %sy, i64 %5
  %bound1 = icmp uge float* %scevgep, %sx
  %memcheck.conflict = and i1 %bound0, %bound1
  %6 = trunc i64 %n.vec to i32
  %ptr.ind.end = getelementptr float* %sx, i64 %n.vec
  %ptr.ind.end123 = getelementptr float* %sy, i64 %n.vec
  br i1 %memcheck.conflict, label %middle.block, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %broadcast.splatinsert146 = insertelement <4 x float> undef, float %sa, i32 0
  %broadcast.splat147 = shufflevector <4 x float> %broadcast.splatinsert146, <4 x float> undef, <4 x i32> zeroinitializer
  %7 = add i32 %n, -1
  %8 = zext i32 %7 to i64
  %9 = add i64 %8, 1
  %10 = lshr i64 %9, 2
  %11 = mul i64 %10, 4
  %12 = add i64 %11, -4
  %13 = lshr i64 %12, 2
  %14 = add i64 %13, 1
  %xtraiter163 = and i64 %14, 1
  %lcmp.mod164 = icmp ne i64 %xtraiter163, 0
  %lcmp.overflow165 = icmp eq i64 %14, 0
  %lcmp.or166 = or i1 %lcmp.overflow165, %lcmp.mod164
  br i1 %lcmp.or166, label %vector.body.prol, label %vector.ph.split

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.ph
  %index.prol = phi i64 [ 0, %vector.ph ], [ %index.next.prol, %vector.body.prol ], !dbg !214
  %prol.iter167 = phi i64 [ %xtraiter163, %vector.ph ], [ %prol.iter167.sub, %vector.body.prol ]
  %next.gep.prol = getelementptr float* %sx, i64 %index.prol
  %next.gep135.prol = getelementptr float* %sy, i64 %index.prol
  %15 = bitcast float* %next.gep.prol to <4 x float>*, !dbg !215
  %wide.load.prol = load <4 x float>* %15, align 4, !dbg !215, !tbaa !152
  %16 = fmul <4 x float> %broadcast.splat147, %wide.load.prol, !dbg !216
  %17 = bitcast float* %next.gep135.prol to <4 x float>*, !dbg !217
  %wide.load148.prol = load <4 x float>* %17, align 4, !dbg !217, !tbaa !152
  %18 = fadd <4 x float> %wide.load148.prol, %16, !dbg !217
  %19 = bitcast float* %next.gep135.prol to <4 x float>*, !dbg !217
  store <4 x float> %18, <4 x float>* %19, align 4, !dbg !217, !tbaa !152
  %index.next.prol = add i64 %index.prol, 4, !dbg !214
  %20 = icmp eq i64 %index.next.prol, %n.vec, !dbg !214
  %prol.iter167.sub = sub i64 %prol.iter167, 1, !dbg !214
  %prol.iter167.cmp = icmp ne i64 %prol.iter167.sub, 0, !dbg !214
  br i1 %prol.iter167.cmp, label %vector.body.prol, label %vector.ph.split, !llvm.loop !218

vector.ph.split:                                  ; preds = %vector.body.prol, %vector.ph
  %index.unr = phi i64 [ 0, %vector.ph ], [ %index.next.prol, %vector.body.prol ]
  %21 = icmp ult i64 %14, 2
  br i1 %21, label %middle.block.loopexit, label %vector.ph.split.split

vector.ph.split.split:                            ; preds = %vector.ph.split
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph.split.split
  %index = phi i64 [ %index.unr, %vector.ph.split.split ], [ %index.next.1, %vector.body ], !dbg !214
  %next.gep = getelementptr float* %sx, i64 %index
  %next.gep135 = getelementptr float* %sy, i64 %index
  %22 = bitcast float* %next.gep to <4 x float>*, !dbg !215
  %wide.load = load <4 x float>* %22, align 4, !dbg !215, !tbaa !152
  %23 = fmul <4 x float> %broadcast.splat147, %wide.load, !dbg !216
  %24 = bitcast float* %next.gep135 to <4 x float>*, !dbg !217
  %wide.load148 = load <4 x float>* %24, align 4, !dbg !217, !tbaa !152
  %25 = fadd <4 x float> %wide.load148, %23, !dbg !217
  %26 = bitcast float* %next.gep135 to <4 x float>*, !dbg !217
  store <4 x float> %25, <4 x float>* %26, align 4, !dbg !217, !tbaa !152
  %index.next = add i64 %index, 4, !dbg !214
  %next.gep.1 = getelementptr float* %sx, i64 %index.next
  %next.gep135.1 = getelementptr float* %sy, i64 %index.next
  %27 = bitcast float* %next.gep.1 to <4 x float>*, !dbg !215
  %wide.load.1 = load <4 x float>* %27, align 4, !dbg !215, !tbaa !152
  %28 = fmul <4 x float> %broadcast.splat147, %wide.load.1, !dbg !216
  %29 = bitcast float* %next.gep135.1 to <4 x float>*, !dbg !217
  %wide.load148.1 = load <4 x float>* %29, align 4, !dbg !217, !tbaa !152
  %30 = fadd <4 x float> %wide.load148.1, %28, !dbg !217
  %31 = bitcast float* %next.gep135.1 to <4 x float>*, !dbg !217
  store <4 x float> %30, <4 x float>* %31, align 4, !dbg !217, !tbaa !152
  %index.next.1 = add i64 %index.next, 4, !dbg !214
  %32 = icmp eq i64 %index.next.1, %n.vec, !dbg !214
  br i1 %32, label %middle.block.loopexit.unr-lcssa, label %vector.body, !dbg !214, !llvm.loop !219

middle.block.loopexit.unr-lcssa:                  ; preds = %vector.body
  br label %middle.block.loopexit

middle.block.loopexit:                            ; preds = %vector.ph.split, %middle.block.loopexit.unr-lcssa
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %vector.memcheck, %for.body.lr.ph
  %resume.val = phi i64 [ 0, %for.body.lr.ph ], [ 0, %vector.memcheck ], [ %n.vec, %middle.block.loopexit ]
  %trunc.resume.val = phi i32 [ 0, %for.body.lr.ph ], [ 0, %vector.memcheck ], [ %6, %middle.block.loopexit ]
  %resume.val119 = phi float* [ %sx, %for.body.lr.ph ], [ %sx, %vector.memcheck ], [ %ptr.ind.end, %middle.block.loopexit ]
  %resume.val121 = phi float* [ %sy, %for.body.lr.ph ], [ %sy, %vector.memcheck ], [ %ptr.ind.end123, %middle.block.loopexit ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %for.end60, label %for.body.preheader

for.body.preheader:                               ; preds = %middle.block
  %33 = sub i32 %n, %trunc.resume.val
  %xtraiter = and i32 %33, 3
  %lcmp.mod = icmp ne i32 %xtraiter, 0
  %lcmp.overflow = icmp eq i32 %33, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %for.body.prol, label %for.body.preheader.split

for.body.prol:                                    ; preds = %for.body.prol, %for.body.preheader
  %i.0101.prol = phi i32 [ %inc.prol, %for.body.prol ], [ %trunc.resume.val, %for.body.preheader ]
  %sx.addr.0100.prol = phi float* [ %incdec.ptr11.prol, %for.body.prol ], [ %resume.val119, %for.body.preheader ]
  %sy.addr.099.prol = phi float* [ %incdec.ptr.prol, %for.body.prol ], [ %resume.val121, %for.body.preheader ]
  %prol.iter = phi i32 [ %xtraiter, %for.body.preheader ], [ %prol.iter.sub, %for.body.prol ]
  %34 = load float* %sx.addr.0100.prol, align 4, !dbg !215, !tbaa !152
  %mul.prol = fmul float %sa, %34, !dbg !216
  %35 = load float* %sy.addr.099.prol, align 4, !dbg !217, !tbaa !152
  %add.prol = fadd float %35, %mul.prol, !dbg !217
  store float %add.prol, float* %sy.addr.099.prol, align 4, !dbg !217, !tbaa !152
  %inc.prol = add nuw nsw i32 %i.0101.prol, 1, !dbg !214
  tail call void @llvm.dbg.value(metadata i32 %inc.prol, i64 0, metadata !30, metadata !131), !dbg !222
  %incdec.ptr.prol = getelementptr inbounds float* %sy.addr.099.prol, i64 1, !dbg !223
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr.prol, i64 0, metadata !28, metadata !131), !dbg !195
  %incdec.ptr11.prol = getelementptr inbounds float* %sx.addr.0100.prol, i64 1, !dbg !224
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr11.prol, i64 0, metadata !26, metadata !131), !dbg !193
  %exitcond.prol = icmp eq i32 %i.0101.prol, %1, !dbg !213
  %prol.iter.sub = sub i32 %prol.iter, 1, !dbg !213
  %prol.iter.cmp = icmp ne i32 %prol.iter.sub, 0, !dbg !213
  br i1 %prol.iter.cmp, label %for.body.prol, label %for.body.preheader.split, !llvm.loop !225

for.body.preheader.split:                         ; preds = %for.body.prol, %for.body.preheader
  %i.0101.unr = phi i32 [ %trunc.resume.val, %for.body.preheader ], [ %inc.prol, %for.body.prol ]
  %sx.addr.0100.unr = phi float* [ %resume.val119, %for.body.preheader ], [ %incdec.ptr11.prol, %for.body.prol ]
  %sy.addr.099.unr = phi float* [ %resume.val121, %for.body.preheader ], [ %incdec.ptr.prol, %for.body.prol ]
  %36 = icmp ult i32 %33, 4
  br i1 %36, label %for.end60.loopexit, label %for.body.preheader.split.split

for.body.preheader.split.split:                   ; preds = %for.body.preheader.split
  br label %for.body, !dbg !215

for.body:                                         ; preds = %for.body, %for.body.preheader.split.split
  %i.0101 = phi i32 [ %i.0101.unr, %for.body.preheader.split.split ], [ %inc.3, %for.body ]
  %sx.addr.0100 = phi float* [ %sx.addr.0100.unr, %for.body.preheader.split.split ], [ %incdec.ptr11.3, %for.body ]
  %sy.addr.099 = phi float* [ %sy.addr.099.unr, %for.body.preheader.split.split ], [ %incdec.ptr.3, %for.body ]
  %37 = load float* %sx.addr.0100, align 4, !dbg !215, !tbaa !152
  %mul = fmul float %sa, %37, !dbg !216
  %38 = load float* %sy.addr.099, align 4, !dbg !217, !tbaa !152
  %add = fadd float %38, %mul, !dbg !217
  store float %add, float* %sy.addr.099, align 4, !dbg !217, !tbaa !152
  %inc = add nuw nsw i32 %i.0101, 1, !dbg !214
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !30, metadata !131), !dbg !222
  %incdec.ptr = getelementptr inbounds float* %sy.addr.099, i64 1, !dbg !223
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr, i64 0, metadata !28, metadata !131), !dbg !195
  %incdec.ptr11 = getelementptr inbounds float* %sx.addr.0100, i64 1, !dbg !224
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr11, i64 0, metadata !26, metadata !131), !dbg !193
  %39 = load float* %incdec.ptr11, align 4, !dbg !215, !tbaa !152
  %mul.1 = fmul float %sa, %39, !dbg !216
  %40 = load float* %incdec.ptr, align 4, !dbg !217, !tbaa !152
  %add.1 = fadd float %40, %mul.1, !dbg !217
  store float %add.1, float* %incdec.ptr, align 4, !dbg !217, !tbaa !152
  %inc.1 = add nuw nsw i32 %inc, 1, !dbg !214
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !30, metadata !131), !dbg !222
  %incdec.ptr.1 = getelementptr inbounds float* %incdec.ptr, i64 1, !dbg !223
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr, i64 0, metadata !28, metadata !131), !dbg !195
  %incdec.ptr11.1 = getelementptr inbounds float* %incdec.ptr11, i64 1, !dbg !224
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr11, i64 0, metadata !26, metadata !131), !dbg !193
  %41 = load float* %incdec.ptr11.1, align 4, !dbg !215, !tbaa !152
  %mul.2 = fmul float %sa, %41, !dbg !216
  %42 = load float* %incdec.ptr.1, align 4, !dbg !217, !tbaa !152
  %add.2 = fadd float %42, %mul.2, !dbg !217
  store float %add.2, float* %incdec.ptr.1, align 4, !dbg !217, !tbaa !152
  %inc.2 = add nuw nsw i32 %inc.1, 1, !dbg !214
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !30, metadata !131), !dbg !222
  %incdec.ptr.2 = getelementptr inbounds float* %incdec.ptr.1, i64 1, !dbg !223
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr, i64 0, metadata !28, metadata !131), !dbg !195
  %incdec.ptr11.2 = getelementptr inbounds float* %incdec.ptr11.1, i64 1, !dbg !224
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr11, i64 0, metadata !26, metadata !131), !dbg !193
  %43 = load float* %incdec.ptr11.2, align 4, !dbg !215, !tbaa !152
  %mul.3 = fmul float %sa, %43, !dbg !216
  %44 = load float* %incdec.ptr.2, align 4, !dbg !217, !tbaa !152
  %add.3 = fadd float %44, %mul.3, !dbg !217
  store float %add.3, float* %incdec.ptr.2, align 4, !dbg !217, !tbaa !152
  %inc.3 = add nuw nsw i32 %inc.2, 1, !dbg !214
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !30, metadata !131), !dbg !222
  %incdec.ptr.3 = getelementptr inbounds float* %incdec.ptr.2, i64 1, !dbg !223
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr, i64 0, metadata !28, metadata !131), !dbg !195
  %incdec.ptr11.3 = getelementptr inbounds float* %incdec.ptr11.2, i64 1, !dbg !224
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr11, i64 0, metadata !26, metadata !131), !dbg !193
  %exitcond.3 = icmp eq i32 %inc.2, %1, !dbg !213
  br i1 %exitcond.3, label %for.end60.loopexit.unr-lcssa, label %for.body, !dbg !213, !llvm.loop !226

if.end12:                                         ; preds = %if.then5
  %cmp13 = icmp sgt i32 %incx, 0, !dbg !227
  br i1 %cmp13, label %for.cond16.preheader, label %if.end28, !dbg !229

for.cond16.preheader:                             ; preds = %if.end12
  %cmp17102 = icmp sgt i32 %n, 0, !dbg !230
  br i1 %cmp17102, label %for.body19.lr.ph, label %for.end60, !dbg !234

for.body19.lr.ph:                                 ; preds = %for.cond16.preheader
  %idx.ext = sext i32 %incx to i64, !dbg !235
  %45 = add i32 %n, -1, !dbg !234
  %xtraiter168 = and i32 %n, 1
  %lcmp.mod169 = icmp ne i32 %xtraiter168, 0
  %lcmp.overflow170 = icmp eq i32 %n, 0
  %lcmp.or171 = or i1 %lcmp.overflow170, %lcmp.mod169
  br i1 %lcmp.or171, label %for.body19.prol, label %for.body19.lr.ph.split

for.body19.prol:                                  ; preds = %for.body19.prol, %for.body19.lr.ph
  %i.1105.prol = phi i32 [ 0, %for.body19.lr.ph ], [ %inc23.prol, %for.body19.prol ]
  %sx.addr.1104.prol = phi float* [ %sx, %for.body19.lr.ph ], [ %add.ptr.prol, %for.body19.prol ]
  %sy.addr.1103.prol = phi float* [ %sy, %for.body19.lr.ph ], [ %add.ptr25.prol, %for.body19.prol ]
  %prol.iter172 = phi i32 [ %xtraiter168, %for.body19.lr.ph ], [ %prol.iter172.sub, %for.body19.prol ]
  %46 = load float* %sx.addr.1104.prol, align 4, !dbg !236, !tbaa !152
  %mul20.prol = fmul float %sa, %46, !dbg !237
  %47 = load float* %sy.addr.1103.prol, align 4, !dbg !238, !tbaa !152
  %add21.prol = fadd float %47, %mul20.prol, !dbg !238
  store float %add21.prol, float* %sy.addr.1103.prol, align 4, !dbg !238, !tbaa !152
  %inc23.prol = add nuw nsw i32 %i.1105.prol, 1, !dbg !239
  tail call void @llvm.dbg.value(metadata i32 %inc23.prol, i64 0, metadata !30, metadata !131), !dbg !222
  %add.ptr.prol = getelementptr inbounds float* %sx.addr.1104.prol, i64 %idx.ext, !dbg !235
  tail call void @llvm.dbg.value(metadata float* %add.ptr.prol, i64 0, metadata !26, metadata !131), !dbg !193
  %add.ptr25.prol = getelementptr inbounds float* %sy.addr.1103.prol, i64 %idx.ext, !dbg !240
  tail call void @llvm.dbg.value(metadata float* %add.ptr25.prol, i64 0, metadata !28, metadata !131), !dbg !195
  %exitcond110.prol = icmp eq i32 %i.1105.prol, %45, !dbg !234
  %prol.iter172.sub = sub i32 %prol.iter172, 1, !dbg !234
  %prol.iter172.cmp = icmp ne i32 %prol.iter172.sub, 0, !dbg !234
  br i1 %prol.iter172.cmp, label %for.body19.prol, label %for.body19.lr.ph.split, !llvm.loop !241

for.body19.lr.ph.split:                           ; preds = %for.body19.prol, %for.body19.lr.ph
  %i.1105.unr = phi i32 [ 0, %for.body19.lr.ph ], [ %inc23.prol, %for.body19.prol ]
  %sx.addr.1104.unr = phi float* [ %sx, %for.body19.lr.ph ], [ %add.ptr.prol, %for.body19.prol ]
  %sy.addr.1103.unr = phi float* [ %sy, %for.body19.lr.ph ], [ %add.ptr25.prol, %for.body19.prol ]
  %48 = icmp ult i32 %n, 2
  br i1 %48, label %for.end60.loopexit161, label %for.body19.lr.ph.split.split

for.body19.lr.ph.split.split:                     ; preds = %for.body19.lr.ph.split
  br label %for.body19, !dbg !234

for.body19:                                       ; preds = %for.body19, %for.body19.lr.ph.split.split
  %i.1105 = phi i32 [ %i.1105.unr, %for.body19.lr.ph.split.split ], [ %inc23.1, %for.body19 ]
  %sx.addr.1104 = phi float* [ %sx.addr.1104.unr, %for.body19.lr.ph.split.split ], [ %add.ptr.1, %for.body19 ]
  %sy.addr.1103 = phi float* [ %sy.addr.1103.unr, %for.body19.lr.ph.split.split ], [ %add.ptr25.1, %for.body19 ]
  %49 = load float* %sx.addr.1104, align 4, !dbg !236, !tbaa !152
  %mul20 = fmul float %sa, %49, !dbg !237
  %50 = load float* %sy.addr.1103, align 4, !dbg !238, !tbaa !152
  %add21 = fadd float %50, %mul20, !dbg !238
  store float %add21, float* %sy.addr.1103, align 4, !dbg !238, !tbaa !152
  %inc23 = add nuw nsw i32 %i.1105, 1, !dbg !239
  tail call void @llvm.dbg.value(metadata i32 %inc23, i64 0, metadata !30, metadata !131), !dbg !222
  %add.ptr = getelementptr inbounds float* %sx.addr.1104, i64 %idx.ext, !dbg !235
  tail call void @llvm.dbg.value(metadata float* %add.ptr, i64 0, metadata !26, metadata !131), !dbg !193
  %add.ptr25 = getelementptr inbounds float* %sy.addr.1103, i64 %idx.ext, !dbg !240
  tail call void @llvm.dbg.value(metadata float* %add.ptr25, i64 0, metadata !28, metadata !131), !dbg !195
  %51 = load float* %add.ptr, align 4, !dbg !236, !tbaa !152
  %mul20.1 = fmul float %sa, %51, !dbg !237
  %52 = load float* %add.ptr25, align 4, !dbg !238, !tbaa !152
  %add21.1 = fadd float %52, %mul20.1, !dbg !238
  store float %add21.1, float* %add.ptr25, align 4, !dbg !238, !tbaa !152
  %inc23.1 = add nuw nsw i32 %inc23, 1, !dbg !239
  tail call void @llvm.dbg.value(metadata i32 %inc23, i64 0, metadata !30, metadata !131), !dbg !222
  %add.ptr.1 = getelementptr inbounds float* %add.ptr, i64 %idx.ext, !dbg !235
  tail call void @llvm.dbg.value(metadata float* %add.ptr, i64 0, metadata !26, metadata !131), !dbg !193
  %add.ptr25.1 = getelementptr inbounds float* %add.ptr25, i64 %idx.ext, !dbg !240
  tail call void @llvm.dbg.value(metadata float* %add.ptr25, i64 0, metadata !28, metadata !131), !dbg !195
  %exitcond110.1 = icmp eq i32 %inc23, %45, !dbg !234
  br i1 %exitcond110.1, label %for.end60.loopexit161.unr-lcssa, label %for.body19, !dbg !234

if.end28:                                         ; preds = %if.end12, %if.end
  %cmp29 = icmp slt i32 %incx, 0, !dbg !242
  br i1 %cmp29, label %if.then31, label %if.end37, !dbg !244

if.then31:                                        ; preds = %if.end28
  %add32 = sub i32 1, %n, !dbg !245
  %mul33 = mul nsw i32 %add32, %incx, !dbg !246
  %add34 = add nsw i32 %mul33, 1, !dbg !246
  %idx.ext35 = sext i32 %add34 to i64, !dbg !247
  %add.ptr36 = getelementptr inbounds float* %sx, i64 %idx.ext35, !dbg !247
  tail call void @llvm.dbg.value(metadata float* %add.ptr36, i64 0, metadata !26, metadata !131), !dbg !193
  br label %if.end37, !dbg !247

if.end37:                                         ; preds = %if.then31, %if.end28
  %sx.addr.2 = phi float* [ %add.ptr36, %if.then31 ], [ %sx, %if.end28 ]
  %cmp38 = icmp slt i32 %incy, 0, !dbg !248
  br i1 %cmp38, label %if.then40, label %for.cond48.preheader, !dbg !250

if.then40:                                        ; preds = %if.end37
  %add42 = sub i32 1, %n, !dbg !251
  %mul43 = mul nsw i32 %add42, %incy, !dbg !252
  %add44 = add nsw i32 %mul43, 1, !dbg !252
  %idx.ext45 = sext i32 %add44 to i64, !dbg !253
  %add.ptr46 = getelementptr inbounds float* %sy, i64 %idx.ext45, !dbg !253
  tail call void @llvm.dbg.value(metadata float* %add.ptr46, i64 0, metadata !28, metadata !131), !dbg !195
  br label %for.cond48.preheader, !dbg !253

for.cond48.preheader:                             ; preds = %if.then40, %if.end37
  %sy.addr.3.ph = phi float* [ %sy, %if.end37 ], [ %add.ptr46, %if.then40 ]
  %cmp49106 = icmp sgt i32 %n, 0, !dbg !254
  br i1 %cmp49106, label %for.body51.lr.ph, label %for.end60, !dbg !257

for.body51.lr.ph:                                 ; preds = %for.cond48.preheader
  %idx.ext56 = sext i32 %incx to i64, !dbg !258
  %idx.ext58 = sext i32 %incy to i64, !dbg !259
  %53 = add i32 %n, -1, !dbg !257
  %xtraiter173 = and i32 %n, 1
  %lcmp.mod174 = icmp ne i32 %xtraiter173, 0
  %lcmp.overflow175 = icmp eq i32 %n, 0
  %lcmp.or176 = or i1 %lcmp.overflow175, %lcmp.mod174
  br i1 %lcmp.or176, label %for.body51.prol, label %for.body51.lr.ph.split

for.body51.prol:                                  ; preds = %for.body51.prol, %for.body51.lr.ph
  %i.2109.prol = phi i32 [ 0, %for.body51.lr.ph ], [ %inc55.prol, %for.body51.prol ]
  %sx.addr.3108.prol = phi float* [ %sx.addr.2, %for.body51.lr.ph ], [ %add.ptr57.prol, %for.body51.prol ]
  %sy.addr.3107.prol = phi float* [ %sy.addr.3.ph, %for.body51.lr.ph ], [ %add.ptr59.prol, %for.body51.prol ]
  %prol.iter177 = phi i32 [ %xtraiter173, %for.body51.lr.ph ], [ %prol.iter177.sub, %for.body51.prol ]
  %54 = load float* %sx.addr.3108.prol, align 4, !dbg !260, !tbaa !152
  %mul52.prol = fmul float %sa, %54, !dbg !261
  %55 = load float* %sy.addr.3107.prol, align 4, !dbg !262, !tbaa !152
  %add53.prol = fadd float %55, %mul52.prol, !dbg !262
  store float %add53.prol, float* %sy.addr.3107.prol, align 4, !dbg !262, !tbaa !152
  %inc55.prol = add nuw nsw i32 %i.2109.prol, 1, !dbg !263
  tail call void @llvm.dbg.value(metadata i32 %inc55.prol, i64 0, metadata !30, metadata !131), !dbg !222
  %add.ptr57.prol = getelementptr inbounds float* %sx.addr.3108.prol, i64 %idx.ext56, !dbg !258
  tail call void @llvm.dbg.value(metadata float* %add.ptr57.prol, i64 0, metadata !26, metadata !131), !dbg !193
  %add.ptr59.prol = getelementptr inbounds float* %sy.addr.3107.prol, i64 %idx.ext58, !dbg !259
  tail call void @llvm.dbg.value(metadata float* %add.ptr59.prol, i64 0, metadata !28, metadata !131), !dbg !195
  %exitcond111.prol = icmp eq i32 %i.2109.prol, %53, !dbg !257
  %prol.iter177.sub = sub i32 %prol.iter177, 1, !dbg !257
  %prol.iter177.cmp = icmp ne i32 %prol.iter177.sub, 0, !dbg !257
  br i1 %prol.iter177.cmp, label %for.body51.prol, label %for.body51.lr.ph.split, !llvm.loop !264

for.body51.lr.ph.split:                           ; preds = %for.body51.prol, %for.body51.lr.ph
  %i.2109.unr = phi i32 [ 0, %for.body51.lr.ph ], [ %inc55.prol, %for.body51.prol ]
  %sx.addr.3108.unr = phi float* [ %sx.addr.2, %for.body51.lr.ph ], [ %add.ptr57.prol, %for.body51.prol ]
  %sy.addr.3107.unr = phi float* [ %sy.addr.3.ph, %for.body51.lr.ph ], [ %add.ptr59.prol, %for.body51.prol ]
  %56 = icmp ult i32 %n, 2
  br i1 %56, label %for.end60.loopexit162, label %for.body51.lr.ph.split.split

for.body51.lr.ph.split.split:                     ; preds = %for.body51.lr.ph.split
  br label %for.body51, !dbg !257

for.body51:                                       ; preds = %for.body51, %for.body51.lr.ph.split.split
  %i.2109 = phi i32 [ %i.2109.unr, %for.body51.lr.ph.split.split ], [ %inc55.1, %for.body51 ]
  %sx.addr.3108 = phi float* [ %sx.addr.3108.unr, %for.body51.lr.ph.split.split ], [ %add.ptr57.1, %for.body51 ]
  %sy.addr.3107 = phi float* [ %sy.addr.3107.unr, %for.body51.lr.ph.split.split ], [ %add.ptr59.1, %for.body51 ]
  %57 = load float* %sx.addr.3108, align 4, !dbg !260, !tbaa !152
  %mul52 = fmul float %sa, %57, !dbg !261
  %58 = load float* %sy.addr.3107, align 4, !dbg !262, !tbaa !152
  %add53 = fadd float %58, %mul52, !dbg !262
  store float %add53, float* %sy.addr.3107, align 4, !dbg !262, !tbaa !152
  %inc55 = add nuw nsw i32 %i.2109, 1, !dbg !263
  tail call void @llvm.dbg.value(metadata i32 %inc55, i64 0, metadata !30, metadata !131), !dbg !222
  %add.ptr57 = getelementptr inbounds float* %sx.addr.3108, i64 %idx.ext56, !dbg !258
  tail call void @llvm.dbg.value(metadata float* %add.ptr57, i64 0, metadata !26, metadata !131), !dbg !193
  %add.ptr59 = getelementptr inbounds float* %sy.addr.3107, i64 %idx.ext58, !dbg !259
  tail call void @llvm.dbg.value(metadata float* %add.ptr59, i64 0, metadata !28, metadata !131), !dbg !195
  %59 = load float* %add.ptr57, align 4, !dbg !260, !tbaa !152
  %mul52.1 = fmul float %sa, %59, !dbg !261
  %60 = load float* %add.ptr59, align 4, !dbg !262, !tbaa !152
  %add53.1 = fadd float %60, %mul52.1, !dbg !262
  store float %add53.1, float* %add.ptr59, align 4, !dbg !262, !tbaa !152
  %inc55.1 = add nuw nsw i32 %inc55, 1, !dbg !263
  tail call void @llvm.dbg.value(metadata i32 %inc55, i64 0, metadata !30, metadata !131), !dbg !222
  %add.ptr57.1 = getelementptr inbounds float* %add.ptr57, i64 %idx.ext56, !dbg !258
  tail call void @llvm.dbg.value(metadata float* %add.ptr57, i64 0, metadata !26, metadata !131), !dbg !193
  %add.ptr59.1 = getelementptr inbounds float* %add.ptr59, i64 %idx.ext58, !dbg !259
  tail call void @llvm.dbg.value(metadata float* %add.ptr59, i64 0, metadata !28, metadata !131), !dbg !195
  %exitcond111.1 = icmp eq i32 %inc55, %53, !dbg !257
  br i1 %exitcond111.1, label %for.end60.loopexit162.unr-lcssa, label %for.body51, !dbg !257

for.end60.loopexit.unr-lcssa:                     ; preds = %for.body
  br label %for.end60.loopexit

for.end60.loopexit:                               ; preds = %for.body.preheader.split, %for.end60.loopexit.unr-lcssa
  br label %for.end60

for.end60.loopexit161.unr-lcssa:                  ; preds = %for.body19
  br label %for.end60.loopexit161

for.end60.loopexit161:                            ; preds = %for.body19.lr.ph.split, %for.end60.loopexit161.unr-lcssa
  br label %for.end60

for.end60.loopexit162.unr-lcssa:                  ; preds = %for.body51
  br label %for.end60.loopexit162

for.end60.loopexit162:                            ; preds = %for.body51.lr.ph.split, %for.end60.loopexit162.unr-lcssa
  br label %for.end60

for.end60:                                        ; preds = %for.end60.loopexit162, %for.end60.loopexit161, %for.end60.loopexit, %middle.block, %for.cond48.preheader, %for.cond16.preheader, %for.cond.preheader, %entry
  ret void, !dbg !265
}

; Function Attrs: nounwind uwtable
define void @saxpyx(i32 %n, double, float* nocapture %sx, i32 %incx, float* nocapture readonly %sy, i32 %incy) #1 {
entry:
  %sa = fptrunc double %0 to float
  tail call void @llvm.dbg.value(metadata i32 %n, i64 0, metadata !33, metadata !131), !dbg !266
  tail call void @llvm.dbg.value(metadata float %sa, i64 0, metadata !34, metadata !131), !dbg !267
  tail call void @llvm.dbg.value(metadata float* %sx, i64 0, metadata !35, metadata !131), !dbg !268
  tail call void @llvm.dbg.value(metadata i32 %incx, i64 0, metadata !36, metadata !131), !dbg !269
  tail call void @llvm.dbg.value(metadata float* %sy, i64 0, metadata !37, metadata !131), !dbg !270
  tail call void @llvm.dbg.value(metadata i32 %incy, i64 0, metadata !38, metadata !131), !dbg !271
  %cmp = icmp slt i32 %n, 1, !dbg !272
  %cmp1 = fcmp oeq float %sa, 0.000000e+00, !dbg !274
  %or.cond = or i1 %cmp, %cmp1, !dbg !276
  br i1 %or.cond, label %for.end60, label %if.end, !dbg !276

if.end:                                           ; preds = %entry
  %cmp3 = icmp eq i32 %incx, %incy, !dbg !277
  br i1 %cmp3, label %if.then5, label %if.end28, !dbg !279

if.then5:                                         ; preds = %if.end
  %cmp6 = icmp eq i32 %incx, 1, !dbg !280
  br i1 %cmp6, label %for.cond.preheader, label %if.end12, !dbg !283

for.cond.preheader:                               ; preds = %if.then5
  %cmp9101 = icmp sgt i32 %n, 0, !dbg !284
  br i1 %cmp9101, label %for.body.lr.ph, label %for.end60, !dbg !288

for.body.lr.ph:                                   ; preds = %for.cond.preheader
  %1 = add i32 %n, -1, !dbg !288
  %2 = zext i32 %1 to i64
  %3 = add nuw nsw i64 %2, 1, !dbg !288
  %end.idx = add nuw nsw i64 %2, 1, !dbg !289
  %n.vec = and i64 %3, 8589934588, !dbg !289
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !289
  %4 = add i32 %n, -1
  %5 = zext i32 %4 to i64
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %for.body.lr.ph
  %scevgep120 = getelementptr float* %sy, i64 %5
  %bound0 = icmp uge float* %scevgep120, %sx
  %scevgep = getelementptr float* %sx, i64 %5
  %bound1 = icmp uge float* %scevgep, %sy
  %memcheck.conflict = and i1 %bound0, %bound1
  %6 = trunc i64 %n.vec to i32
  %ptr.ind.end = getelementptr float* %sx, i64 %n.vec
  %ptr.ind.end126 = getelementptr float* %sy, i64 %n.vec
  br i1 %memcheck.conflict, label %middle.block, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %broadcast.splatinsert150 = insertelement <4 x float> undef, float %sa, i32 0
  %broadcast.splat151 = shufflevector <4 x float> %broadcast.splatinsert150, <4 x float> undef, <4 x i32> zeroinitializer
  %7 = add i32 %n, -1
  %8 = zext i32 %7 to i64
  %9 = add i64 %8, 1
  %10 = lshr i64 %9, 2
  %11 = mul i64 %10, 4
  %12 = add i64 %11, -4
  %13 = lshr i64 %12, 2
  %14 = add i64 %13, 1
  %xtraiter166 = and i64 %14, 1
  %lcmp.mod167 = icmp ne i64 %xtraiter166, 0
  %lcmp.overflow168 = icmp eq i64 %14, 0
  %lcmp.or169 = or i1 %lcmp.overflow168, %lcmp.mod167
  br i1 %lcmp.or169, label %vector.body.prol, label %vector.ph.split

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.ph
  %index.prol = phi i64 [ 0, %vector.ph ], [ %index.next.prol, %vector.body.prol ], !dbg !289
  %prol.iter170 = phi i64 [ %xtraiter166, %vector.ph ], [ %prol.iter170.sub, %vector.body.prol ]
  %next.gep.prol = getelementptr float* %sx, i64 %index.prol
  %next.gep138.prol = getelementptr float* %sy, i64 %index.prol
  %15 = bitcast float* %next.gep138.prol to <4 x float>*, !dbg !290
  %wide.load.prol = load <4 x float>* %15, align 4, !dbg !290, !tbaa !152
  %16 = bitcast float* %next.gep.prol to <4 x float>*, !dbg !291
  %wide.load149.prol = load <4 x float>* %16, align 4, !dbg !291, !tbaa !152
  %17 = fmul <4 x float> %broadcast.splat151, %wide.load149.prol, !dbg !292
  %18 = fadd <4 x float> %wide.load.prol, %17, !dbg !290
  %19 = bitcast float* %next.gep.prol to <4 x float>*, !dbg !293
  store <4 x float> %18, <4 x float>* %19, align 4, !dbg !293, !tbaa !152
  %index.next.prol = add i64 %index.prol, 4, !dbg !289
  %20 = icmp eq i64 %index.next.prol, %n.vec, !dbg !289
  %prol.iter170.sub = sub i64 %prol.iter170, 1, !dbg !289
  %prol.iter170.cmp = icmp ne i64 %prol.iter170.sub, 0, !dbg !289
  br i1 %prol.iter170.cmp, label %vector.body.prol, label %vector.ph.split, !llvm.loop !294

vector.ph.split:                                  ; preds = %vector.body.prol, %vector.ph
  %index.unr = phi i64 [ 0, %vector.ph ], [ %index.next.prol, %vector.body.prol ]
  %21 = icmp ult i64 %14, 2
  br i1 %21, label %middle.block.loopexit, label %vector.ph.split.split

vector.ph.split.split:                            ; preds = %vector.ph.split
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph.split.split
  %index = phi i64 [ %index.unr, %vector.ph.split.split ], [ %index.next.1, %vector.body ], !dbg !289
  %next.gep = getelementptr float* %sx, i64 %index
  %next.gep138 = getelementptr float* %sy, i64 %index
  %22 = bitcast float* %next.gep138 to <4 x float>*, !dbg !290
  %wide.load = load <4 x float>* %22, align 4, !dbg !290, !tbaa !152
  %23 = bitcast float* %next.gep to <4 x float>*, !dbg !291
  %wide.load149 = load <4 x float>* %23, align 4, !dbg !291, !tbaa !152
  %24 = fmul <4 x float> %broadcast.splat151, %wide.load149, !dbg !292
  %25 = fadd <4 x float> %wide.load, %24, !dbg !290
  %26 = bitcast float* %next.gep to <4 x float>*, !dbg !293
  store <4 x float> %25, <4 x float>* %26, align 4, !dbg !293, !tbaa !152
  %index.next = add i64 %index, 4, !dbg !289
  %next.gep.1 = getelementptr float* %sx, i64 %index.next
  %next.gep138.1 = getelementptr float* %sy, i64 %index.next
  %27 = bitcast float* %next.gep138.1 to <4 x float>*, !dbg !290
  %wide.load.1 = load <4 x float>* %27, align 4, !dbg !290, !tbaa !152
  %28 = bitcast float* %next.gep.1 to <4 x float>*, !dbg !291
  %wide.load149.1 = load <4 x float>* %28, align 4, !dbg !291, !tbaa !152
  %29 = fmul <4 x float> %broadcast.splat151, %wide.load149.1, !dbg !292
  %30 = fadd <4 x float> %wide.load.1, %29, !dbg !290
  %31 = bitcast float* %next.gep.1 to <4 x float>*, !dbg !293
  store <4 x float> %30, <4 x float>* %31, align 4, !dbg !293, !tbaa !152
  %index.next.1 = add i64 %index.next, 4, !dbg !289
  %32 = icmp eq i64 %index.next.1, %n.vec, !dbg !289
  br i1 %32, label %middle.block.loopexit.unr-lcssa, label %vector.body, !dbg !289, !llvm.loop !295

middle.block.loopexit.unr-lcssa:                  ; preds = %vector.body
  br label %middle.block.loopexit

middle.block.loopexit:                            ; preds = %vector.ph.split, %middle.block.loopexit.unr-lcssa
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %vector.memcheck, %for.body.lr.ph
  %resume.val = phi i64 [ 0, %for.body.lr.ph ], [ 0, %vector.memcheck ], [ %n.vec, %middle.block.loopexit ]
  %trunc.resume.val = phi i32 [ 0, %for.body.lr.ph ], [ 0, %vector.memcheck ], [ %6, %middle.block.loopexit ]
  %resume.val122 = phi float* [ %sx, %for.body.lr.ph ], [ %sx, %vector.memcheck ], [ %ptr.ind.end, %middle.block.loopexit ]
  %resume.val124 = phi float* [ %sy, %for.body.lr.ph ], [ %sy, %vector.memcheck ], [ %ptr.ind.end126, %middle.block.loopexit ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %for.end60, label %for.body.preheader

for.body.preheader:                               ; preds = %middle.block
  %33 = sub i32 %n, %trunc.resume.val
  %xtraiter = and i32 %33, 3
  %lcmp.mod = icmp ne i32 %xtraiter, 0
  %lcmp.overflow = icmp eq i32 %33, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %for.body.prol, label %for.body.preheader.split

for.body.prol:                                    ; preds = %for.body.prol, %for.body.preheader
  %i.0104.prol = phi i32 [ %inc.prol, %for.body.prol ], [ %trunc.resume.val, %for.body.preheader ]
  %sx.addr.0103.prol = phi float* [ %incdec.ptr.prol, %for.body.prol ], [ %resume.val122, %for.body.preheader ]
  %sy.addr.0102.prol = phi float* [ %incdec.ptr11.prol, %for.body.prol ], [ %resume.val124, %for.body.preheader ]
  %prol.iter = phi i32 [ %xtraiter, %for.body.preheader ], [ %prol.iter.sub, %for.body.prol ]
  %34 = load float* %sy.addr.0102.prol, align 4, !dbg !290, !tbaa !152
  %35 = load float* %sx.addr.0103.prol, align 4, !dbg !291, !tbaa !152
  %mul.prol = fmul float %sa, %35, !dbg !292
  %add.prol = fadd float %34, %mul.prol, !dbg !290
  store float %add.prol, float* %sx.addr.0103.prol, align 4, !dbg !293, !tbaa !152
  %inc.prol = add nuw nsw i32 %i.0104.prol, 1, !dbg !289
  tail call void @llvm.dbg.value(metadata i32 %inc.prol, i64 0, metadata !39, metadata !131), !dbg !296
  %incdec.ptr.prol = getelementptr inbounds float* %sx.addr.0103.prol, i64 1, !dbg !297
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr.prol, i64 0, metadata !35, metadata !131), !dbg !268
  %incdec.ptr11.prol = getelementptr inbounds float* %sy.addr.0102.prol, i64 1, !dbg !298
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr11.prol, i64 0, metadata !37, metadata !131), !dbg !270
  %exitcond.prol = icmp eq i32 %i.0104.prol, %1, !dbg !288
  %prol.iter.sub = sub i32 %prol.iter, 1, !dbg !288
  %prol.iter.cmp = icmp ne i32 %prol.iter.sub, 0, !dbg !288
  br i1 %prol.iter.cmp, label %for.body.prol, label %for.body.preheader.split, !llvm.loop !299

for.body.preheader.split:                         ; preds = %for.body.prol, %for.body.preheader
  %i.0104.unr = phi i32 [ %trunc.resume.val, %for.body.preheader ], [ %inc.prol, %for.body.prol ]
  %sx.addr.0103.unr = phi float* [ %resume.val122, %for.body.preheader ], [ %incdec.ptr.prol, %for.body.prol ]
  %sy.addr.0102.unr = phi float* [ %resume.val124, %for.body.preheader ], [ %incdec.ptr11.prol, %for.body.prol ]
  %36 = icmp ult i32 %33, 4
  br i1 %36, label %for.end60.loopexit, label %for.body.preheader.split.split

for.body.preheader.split.split:                   ; preds = %for.body.preheader.split
  br label %for.body, !dbg !290

for.body:                                         ; preds = %for.body, %for.body.preheader.split.split
  %i.0104 = phi i32 [ %i.0104.unr, %for.body.preheader.split.split ], [ %inc.3, %for.body ]
  %sx.addr.0103 = phi float* [ %sx.addr.0103.unr, %for.body.preheader.split.split ], [ %incdec.ptr.3, %for.body ]
  %sy.addr.0102 = phi float* [ %sy.addr.0102.unr, %for.body.preheader.split.split ], [ %incdec.ptr11.3, %for.body ]
  %37 = load float* %sy.addr.0102, align 4, !dbg !290, !tbaa !152
  %38 = load float* %sx.addr.0103, align 4, !dbg !291, !tbaa !152
  %mul = fmul float %sa, %38, !dbg !292
  %add = fadd float %37, %mul, !dbg !290
  store float %add, float* %sx.addr.0103, align 4, !dbg !293, !tbaa !152
  %inc = add nuw nsw i32 %i.0104, 1, !dbg !289
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !39, metadata !131), !dbg !296
  %incdec.ptr = getelementptr inbounds float* %sx.addr.0103, i64 1, !dbg !297
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr, i64 0, metadata !35, metadata !131), !dbg !268
  %incdec.ptr11 = getelementptr inbounds float* %sy.addr.0102, i64 1, !dbg !298
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr11, i64 0, metadata !37, metadata !131), !dbg !270
  %39 = load float* %incdec.ptr11, align 4, !dbg !290, !tbaa !152
  %40 = load float* %incdec.ptr, align 4, !dbg !291, !tbaa !152
  %mul.1 = fmul float %sa, %40, !dbg !292
  %add.1 = fadd float %39, %mul.1, !dbg !290
  store float %add.1, float* %incdec.ptr, align 4, !dbg !293, !tbaa !152
  %inc.1 = add nuw nsw i32 %inc, 1, !dbg !289
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !39, metadata !131), !dbg !296
  %incdec.ptr.1 = getelementptr inbounds float* %incdec.ptr, i64 1, !dbg !297
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr, i64 0, metadata !35, metadata !131), !dbg !268
  %incdec.ptr11.1 = getelementptr inbounds float* %incdec.ptr11, i64 1, !dbg !298
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr11, i64 0, metadata !37, metadata !131), !dbg !270
  %41 = load float* %incdec.ptr11.1, align 4, !dbg !290, !tbaa !152
  %42 = load float* %incdec.ptr.1, align 4, !dbg !291, !tbaa !152
  %mul.2 = fmul float %sa, %42, !dbg !292
  %add.2 = fadd float %41, %mul.2, !dbg !290
  store float %add.2, float* %incdec.ptr.1, align 4, !dbg !293, !tbaa !152
  %inc.2 = add nuw nsw i32 %inc.1, 1, !dbg !289
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !39, metadata !131), !dbg !296
  %incdec.ptr.2 = getelementptr inbounds float* %incdec.ptr.1, i64 1, !dbg !297
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr, i64 0, metadata !35, metadata !131), !dbg !268
  %incdec.ptr11.2 = getelementptr inbounds float* %incdec.ptr11.1, i64 1, !dbg !298
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr11, i64 0, metadata !37, metadata !131), !dbg !270
  %43 = load float* %incdec.ptr11.2, align 4, !dbg !290, !tbaa !152
  %44 = load float* %incdec.ptr.2, align 4, !dbg !291, !tbaa !152
  %mul.3 = fmul float %sa, %44, !dbg !292
  %add.3 = fadd float %43, %mul.3, !dbg !290
  store float %add.3, float* %incdec.ptr.2, align 4, !dbg !293, !tbaa !152
  %inc.3 = add nuw nsw i32 %inc.2, 1, !dbg !289
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !39, metadata !131), !dbg !296
  %incdec.ptr.3 = getelementptr inbounds float* %incdec.ptr.2, i64 1, !dbg !297
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr, i64 0, metadata !35, metadata !131), !dbg !268
  %incdec.ptr11.3 = getelementptr inbounds float* %incdec.ptr11.2, i64 1, !dbg !298
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr11, i64 0, metadata !37, metadata !131), !dbg !270
  %exitcond.3 = icmp eq i32 %inc.2, %1, !dbg !288
  br i1 %exitcond.3, label %for.end60.loopexit.unr-lcssa, label %for.body, !dbg !288, !llvm.loop !300

if.end12:                                         ; preds = %if.then5
  %cmp13 = icmp sgt i32 %incx, 0, !dbg !301
  br i1 %cmp13, label %for.cond16.preheader, label %if.end28, !dbg !303

for.cond16.preheader:                             ; preds = %if.end12
  %cmp17105 = icmp sgt i32 %n, 0, !dbg !304
  br i1 %cmp17105, label %for.body19.lr.ph, label %for.end60, !dbg !308

for.body19.lr.ph:                                 ; preds = %for.cond16.preheader
  %idx.ext = sext i32 %incx to i64, !dbg !309
  %45 = add i32 %n, -1, !dbg !308
  %xtraiter171 = and i32 %n, 1
  %lcmp.mod172 = icmp ne i32 %xtraiter171, 0
  %lcmp.overflow173 = icmp eq i32 %n, 0
  %lcmp.or174 = or i1 %lcmp.overflow173, %lcmp.mod172
  br i1 %lcmp.or174, label %for.body19.prol, label %for.body19.lr.ph.split

for.body19.prol:                                  ; preds = %for.body19.prol, %for.body19.lr.ph
  %i.1108.prol = phi i32 [ 0, %for.body19.lr.ph ], [ %inc23.prol, %for.body19.prol ]
  %sx.addr.1107.prol = phi float* [ %sx, %for.body19.lr.ph ], [ %add.ptr.prol, %for.body19.prol ]
  %sy.addr.1106.prol = phi float* [ %sy, %for.body19.lr.ph ], [ %add.ptr25.prol, %for.body19.prol ]
  %prol.iter175 = phi i32 [ %xtraiter171, %for.body19.lr.ph ], [ %prol.iter175.sub, %for.body19.prol ]
  %46 = load float* %sy.addr.1106.prol, align 4, !dbg !310, !tbaa !152
  %47 = load float* %sx.addr.1107.prol, align 4, !dbg !311, !tbaa !152
  %mul20.prol = fmul float %sa, %47, !dbg !312
  %add21.prol = fadd float %46, %mul20.prol, !dbg !310
  store float %add21.prol, float* %sx.addr.1107.prol, align 4, !dbg !313, !tbaa !152
  %inc23.prol = add nuw nsw i32 %i.1108.prol, 1, !dbg !314
  tail call void @llvm.dbg.value(metadata i32 %inc23.prol, i64 0, metadata !39, metadata !131), !dbg !296
  %add.ptr.prol = getelementptr inbounds float* %sx.addr.1107.prol, i64 %idx.ext, !dbg !309
  tail call void @llvm.dbg.value(metadata float* %add.ptr.prol, i64 0, metadata !35, metadata !131), !dbg !268
  %add.ptr25.prol = getelementptr inbounds float* %sy.addr.1106.prol, i64 %idx.ext, !dbg !315
  tail call void @llvm.dbg.value(metadata float* %add.ptr25.prol, i64 0, metadata !37, metadata !131), !dbg !270
  %exitcond113.prol = icmp eq i32 %i.1108.prol, %45, !dbg !308
  %prol.iter175.sub = sub i32 %prol.iter175, 1, !dbg !308
  %prol.iter175.cmp = icmp ne i32 %prol.iter175.sub, 0, !dbg !308
  br i1 %prol.iter175.cmp, label %for.body19.prol, label %for.body19.lr.ph.split, !llvm.loop !316

for.body19.lr.ph.split:                           ; preds = %for.body19.prol, %for.body19.lr.ph
  %i.1108.unr = phi i32 [ 0, %for.body19.lr.ph ], [ %inc23.prol, %for.body19.prol ]
  %sx.addr.1107.unr = phi float* [ %sx, %for.body19.lr.ph ], [ %add.ptr.prol, %for.body19.prol ]
  %sy.addr.1106.unr = phi float* [ %sy, %for.body19.lr.ph ], [ %add.ptr25.prol, %for.body19.prol ]
  %48 = icmp ult i32 %n, 2
  br i1 %48, label %for.end60.loopexit164, label %for.body19.lr.ph.split.split

for.body19.lr.ph.split.split:                     ; preds = %for.body19.lr.ph.split
  br label %for.body19, !dbg !308

for.body19:                                       ; preds = %for.body19, %for.body19.lr.ph.split.split
  %i.1108 = phi i32 [ %i.1108.unr, %for.body19.lr.ph.split.split ], [ %inc23.1, %for.body19 ]
  %sx.addr.1107 = phi float* [ %sx.addr.1107.unr, %for.body19.lr.ph.split.split ], [ %add.ptr.1, %for.body19 ]
  %sy.addr.1106 = phi float* [ %sy.addr.1106.unr, %for.body19.lr.ph.split.split ], [ %add.ptr25.1, %for.body19 ]
  %49 = load float* %sy.addr.1106, align 4, !dbg !310, !tbaa !152
  %50 = load float* %sx.addr.1107, align 4, !dbg !311, !tbaa !152
  %mul20 = fmul float %sa, %50, !dbg !312
  %add21 = fadd float %49, %mul20, !dbg !310
  store float %add21, float* %sx.addr.1107, align 4, !dbg !313, !tbaa !152
  %inc23 = add nuw nsw i32 %i.1108, 1, !dbg !314
  tail call void @llvm.dbg.value(metadata i32 %inc23, i64 0, metadata !39, metadata !131), !dbg !296
  %add.ptr = getelementptr inbounds float* %sx.addr.1107, i64 %idx.ext, !dbg !309
  tail call void @llvm.dbg.value(metadata float* %add.ptr, i64 0, metadata !35, metadata !131), !dbg !268
  %add.ptr25 = getelementptr inbounds float* %sy.addr.1106, i64 %idx.ext, !dbg !315
  tail call void @llvm.dbg.value(metadata float* %add.ptr25, i64 0, metadata !37, metadata !131), !dbg !270
  %51 = load float* %add.ptr25, align 4, !dbg !310, !tbaa !152
  %52 = load float* %add.ptr, align 4, !dbg !311, !tbaa !152
  %mul20.1 = fmul float %sa, %52, !dbg !312
  %add21.1 = fadd float %51, %mul20.1, !dbg !310
  store float %add21.1, float* %add.ptr, align 4, !dbg !313, !tbaa !152
  %inc23.1 = add nuw nsw i32 %inc23, 1, !dbg !314
  tail call void @llvm.dbg.value(metadata i32 %inc23, i64 0, metadata !39, metadata !131), !dbg !296
  %add.ptr.1 = getelementptr inbounds float* %add.ptr, i64 %idx.ext, !dbg !309
  tail call void @llvm.dbg.value(metadata float* %add.ptr, i64 0, metadata !35, metadata !131), !dbg !268
  %add.ptr25.1 = getelementptr inbounds float* %add.ptr25, i64 %idx.ext, !dbg !315
  tail call void @llvm.dbg.value(metadata float* %add.ptr25, i64 0, metadata !37, metadata !131), !dbg !270
  %exitcond113.1 = icmp eq i32 %inc23, %45, !dbg !308
  br i1 %exitcond113.1, label %for.end60.loopexit164.unr-lcssa, label %for.body19, !dbg !308

if.end28:                                         ; preds = %if.end12, %if.end
  %cmp29 = icmp slt i32 %incx, 0, !dbg !317
  br i1 %cmp29, label %if.then31, label %if.end37, !dbg !319

if.then31:                                        ; preds = %if.end28
  %add32 = sub i32 1, %n, !dbg !320
  %mul33 = mul nsw i32 %add32, %incx, !dbg !321
  %add34 = add nsw i32 %mul33, 1, !dbg !321
  %idx.ext35 = sext i32 %add34 to i64, !dbg !322
  %add.ptr36 = getelementptr inbounds float* %sx, i64 %idx.ext35, !dbg !322
  tail call void @llvm.dbg.value(metadata float* %add.ptr36, i64 0, metadata !35, metadata !131), !dbg !268
  br label %if.end37, !dbg !322

if.end37:                                         ; preds = %if.then31, %if.end28
  %sx.addr.2 = phi float* [ %add.ptr36, %if.then31 ], [ %sx, %if.end28 ]
  %cmp38 = icmp slt i32 %incy, 0, !dbg !323
  br i1 %cmp38, label %if.then40, label %for.cond48.preheader, !dbg !325

if.then40:                                        ; preds = %if.end37
  %add42 = sub i32 1, %n, !dbg !326
  %mul43 = mul nsw i32 %add42, %incy, !dbg !327
  %add44 = add nsw i32 %mul43, 1, !dbg !327
  %idx.ext45 = sext i32 %add44 to i64, !dbg !328
  %add.ptr46 = getelementptr inbounds float* %sy, i64 %idx.ext45, !dbg !328
  tail call void @llvm.dbg.value(metadata float* %add.ptr46, i64 0, metadata !37, metadata !131), !dbg !270
  br label %for.cond48.preheader, !dbg !328

for.cond48.preheader:                             ; preds = %if.then40, %if.end37
  %sy.addr.3.ph = phi float* [ %sy, %if.end37 ], [ %add.ptr46, %if.then40 ]
  %cmp49109 = icmp sgt i32 %n, 0, !dbg !329
  br i1 %cmp49109, label %for.body51.lr.ph, label %for.end60, !dbg !332

for.body51.lr.ph:                                 ; preds = %for.cond48.preheader
  %idx.ext56 = sext i32 %incx to i64, !dbg !333
  %idx.ext58 = sext i32 %incy to i64, !dbg !334
  %53 = add i32 %n, -1, !dbg !332
  %xtraiter176 = and i32 %n, 1
  %lcmp.mod177 = icmp ne i32 %xtraiter176, 0
  %lcmp.overflow178 = icmp eq i32 %n, 0
  %lcmp.or179 = or i1 %lcmp.overflow178, %lcmp.mod177
  br i1 %lcmp.or179, label %for.body51.prol, label %for.body51.lr.ph.split

for.body51.prol:                                  ; preds = %for.body51.prol, %for.body51.lr.ph
  %i.2112.prol = phi i32 [ 0, %for.body51.lr.ph ], [ %inc55.prol, %for.body51.prol ]
  %sx.addr.3111.prol = phi float* [ %sx.addr.2, %for.body51.lr.ph ], [ %add.ptr57.prol, %for.body51.prol ]
  %sy.addr.3110.prol = phi float* [ %sy.addr.3.ph, %for.body51.lr.ph ], [ %add.ptr59.prol, %for.body51.prol ]
  %prol.iter180 = phi i32 [ %xtraiter176, %for.body51.lr.ph ], [ %prol.iter180.sub, %for.body51.prol ]
  %54 = load float* %sy.addr.3110.prol, align 4, !dbg !335, !tbaa !152
  %55 = load float* %sx.addr.3111.prol, align 4, !dbg !336, !tbaa !152
  %mul52.prol = fmul float %sa, %55, !dbg !337
  %add53.prol = fadd float %54, %mul52.prol, !dbg !335
  store float %add53.prol, float* %sx.addr.3111.prol, align 4, !dbg !338, !tbaa !152
  %inc55.prol = add nuw nsw i32 %i.2112.prol, 1, !dbg !339
  tail call void @llvm.dbg.value(metadata i32 %inc55.prol, i64 0, metadata !39, metadata !131), !dbg !296
  %add.ptr57.prol = getelementptr inbounds float* %sx.addr.3111.prol, i64 %idx.ext56, !dbg !333
  tail call void @llvm.dbg.value(metadata float* %add.ptr57.prol, i64 0, metadata !35, metadata !131), !dbg !268
  %add.ptr59.prol = getelementptr inbounds float* %sy.addr.3110.prol, i64 %idx.ext58, !dbg !334
  tail call void @llvm.dbg.value(metadata float* %add.ptr59.prol, i64 0, metadata !37, metadata !131), !dbg !270
  %exitcond114.prol = icmp eq i32 %i.2112.prol, %53, !dbg !332
  %prol.iter180.sub = sub i32 %prol.iter180, 1, !dbg !332
  %prol.iter180.cmp = icmp ne i32 %prol.iter180.sub, 0, !dbg !332
  br i1 %prol.iter180.cmp, label %for.body51.prol, label %for.body51.lr.ph.split, !llvm.loop !340

for.body51.lr.ph.split:                           ; preds = %for.body51.prol, %for.body51.lr.ph
  %i.2112.unr = phi i32 [ 0, %for.body51.lr.ph ], [ %inc55.prol, %for.body51.prol ]
  %sx.addr.3111.unr = phi float* [ %sx.addr.2, %for.body51.lr.ph ], [ %add.ptr57.prol, %for.body51.prol ]
  %sy.addr.3110.unr = phi float* [ %sy.addr.3.ph, %for.body51.lr.ph ], [ %add.ptr59.prol, %for.body51.prol ]
  %56 = icmp ult i32 %n, 2
  br i1 %56, label %for.end60.loopexit165, label %for.body51.lr.ph.split.split

for.body51.lr.ph.split.split:                     ; preds = %for.body51.lr.ph.split
  br label %for.body51, !dbg !332

for.body51:                                       ; preds = %for.body51, %for.body51.lr.ph.split.split
  %i.2112 = phi i32 [ %i.2112.unr, %for.body51.lr.ph.split.split ], [ %inc55.1, %for.body51 ]
  %sx.addr.3111 = phi float* [ %sx.addr.3111.unr, %for.body51.lr.ph.split.split ], [ %add.ptr57.1, %for.body51 ]
  %sy.addr.3110 = phi float* [ %sy.addr.3110.unr, %for.body51.lr.ph.split.split ], [ %add.ptr59.1, %for.body51 ]
  %57 = load float* %sy.addr.3110, align 4, !dbg !335, !tbaa !152
  %58 = load float* %sx.addr.3111, align 4, !dbg !336, !tbaa !152
  %mul52 = fmul float %sa, %58, !dbg !337
  %add53 = fadd float %57, %mul52, !dbg !335
  store float %add53, float* %sx.addr.3111, align 4, !dbg !338, !tbaa !152
  %inc55 = add nuw nsw i32 %i.2112, 1, !dbg !339
  tail call void @llvm.dbg.value(metadata i32 %inc55, i64 0, metadata !39, metadata !131), !dbg !296
  %add.ptr57 = getelementptr inbounds float* %sx.addr.3111, i64 %idx.ext56, !dbg !333
  tail call void @llvm.dbg.value(metadata float* %add.ptr57, i64 0, metadata !35, metadata !131), !dbg !268
  %add.ptr59 = getelementptr inbounds float* %sy.addr.3110, i64 %idx.ext58, !dbg !334
  tail call void @llvm.dbg.value(metadata float* %add.ptr59, i64 0, metadata !37, metadata !131), !dbg !270
  %59 = load float* %add.ptr59, align 4, !dbg !335, !tbaa !152
  %60 = load float* %add.ptr57, align 4, !dbg !336, !tbaa !152
  %mul52.1 = fmul float %sa, %60, !dbg !337
  %add53.1 = fadd float %59, %mul52.1, !dbg !335
  store float %add53.1, float* %add.ptr57, align 4, !dbg !338, !tbaa !152
  %inc55.1 = add nuw nsw i32 %inc55, 1, !dbg !339
  tail call void @llvm.dbg.value(metadata i32 %inc55, i64 0, metadata !39, metadata !131), !dbg !296
  %add.ptr57.1 = getelementptr inbounds float* %add.ptr57, i64 %idx.ext56, !dbg !333
  tail call void @llvm.dbg.value(metadata float* %add.ptr57, i64 0, metadata !35, metadata !131), !dbg !268
  %add.ptr59.1 = getelementptr inbounds float* %add.ptr59, i64 %idx.ext58, !dbg !334
  tail call void @llvm.dbg.value(metadata float* %add.ptr59, i64 0, metadata !37, metadata !131), !dbg !270
  %exitcond114.1 = icmp eq i32 %inc55, %53, !dbg !332
  br i1 %exitcond114.1, label %for.end60.loopexit165.unr-lcssa, label %for.body51, !dbg !332

for.end60.loopexit.unr-lcssa:                     ; preds = %for.body
  br label %for.end60.loopexit

for.end60.loopexit:                               ; preds = %for.body.preheader.split, %for.end60.loopexit.unr-lcssa
  br label %for.end60

for.end60.loopexit164.unr-lcssa:                  ; preds = %for.body19
  br label %for.end60.loopexit164

for.end60.loopexit164:                            ; preds = %for.body19.lr.ph.split, %for.end60.loopexit164.unr-lcssa
  br label %for.end60

for.end60.loopexit165.unr-lcssa:                  ; preds = %for.body51
  br label %for.end60.loopexit165

for.end60.loopexit165:                            ; preds = %for.body51.lr.ph.split, %for.end60.loopexit165.unr-lcssa
  br label %for.end60

for.end60:                                        ; preds = %for.end60.loopexit165, %for.end60.loopexit164, %for.end60.loopexit, %middle.block, %for.cond48.preheader, %for.cond16.preheader, %for.cond.preheader, %entry
  ret void, !dbg !341
}

; Function Attrs: nounwind uwtable
define void @scopy(i32 %n, float* nocapture %sx, i32 %incx, float* nocapture %sy, i32 %incy) #1 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %n, i64 0, metadata !44, metadata !131), !dbg !342
  tail call void @llvm.dbg.value(metadata float* %sx, i64 0, metadata !45, metadata !131), !dbg !343
  tail call void @llvm.dbg.value(metadata i32 %incx, i64 0, metadata !46, metadata !131), !dbg !344
  tail call void @llvm.dbg.value(metadata float* %sy, i64 0, metadata !47, metadata !131), !dbg !345
  tail call void @llvm.dbg.value(metadata i32 %incy, i64 0, metadata !48, metadata !131), !dbg !346
  %cmp = icmp slt i32 %n, 1, !dbg !347
  br i1 %cmp, label %return, label %if.end, !dbg !349

if.end:                                           ; preds = %entry
  %cmp1 = icmp eq i32 %incx, %incy, !dbg !350
  br i1 %cmp1, label %if.then2, label %if.end19, !dbg !352

if.then2:                                         ; preds = %if.end
  %cmp3 = icmp eq i32 %incx, 1, !dbg !353
  br i1 %cmp3, label %for.body.lr.ph, label %if.end7, !dbg !356

for.body.lr.ph:                                   ; preds = %if.then2
  %0 = add i32 %n, -1, !dbg !357
  %1 = zext i32 %0 to i64
  %2 = add nuw nsw i64 %1, 1, !dbg !357
  %end.idx = add nuw nsw i64 %1, 1, !dbg !360
  %n.vec = and i64 %2, 8589934584, !dbg !360
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !360
  %3 = add i32 %n, -1
  %4 = zext i32 %3 to i64
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %for.body.lr.ph
  %scevgep97 = getelementptr float* %sx, i64 %4
  %bound0 = icmp uge float* %scevgep97, %sy
  %scevgep = getelementptr float* %sy, i64 %4
  %bound1 = icmp uge float* %scevgep, %sx
  %memcheck.conflict = and i1 %bound0, %bound1
  %5 = trunc i64 %n.vec to i32
  %ptr.ind.end = getelementptr float* %sx, i64 %n.vec
  %ptr.ind.end103 = getelementptr float* %sy, i64 %n.vec
  br i1 %memcheck.conflict, label %middle.block, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %6 = add i32 %n, -1
  %7 = zext i32 %6 to i64
  %8 = add i64 %7, 1
  %9 = lshr i64 %8, 3
  %10 = mul i64 %9, 8
  %11 = add i64 %10, -8
  %12 = lshr i64 %11, 3
  %13 = add i64 %12, 1
  %xtraiter180 = and i64 %13, 1
  %lcmp.mod181 = icmp ne i64 %xtraiter180, 0
  %lcmp.overflow182 = icmp eq i64 %13, 0
  %lcmp.or183 = or i1 %lcmp.overflow182, %lcmp.mod181
  br i1 %lcmp.or183, label %vector.body.prol, label %vector.body.preheader.split

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.preheader ], !dbg !360
  %prol.iter184 = phi i64 [ %xtraiter180, %vector.body.preheader ], [ %prol.iter184.sub, %vector.body.prol ]
  %next.gep.prol = getelementptr float* %sx, i64 %index.prol
  %next.gep128.prol = getelementptr float* %sy, i64 %index.prol
  %14 = bitcast float* %next.gep.prol to <4 x float>*, !dbg !362
  %wide.load.prol = load <4 x float>* %14, align 4, !dbg !362, !tbaa !152
  %next.gep.sum172.prol = or i64 %index.prol, 4, !dbg !362
  %15 = getelementptr float* %sx, i64 %next.gep.sum172.prol, !dbg !362
  %16 = bitcast float* %15 to <4 x float>*, !dbg !362
  %wide.load151.prol = load <4 x float>* %16, align 4, !dbg !362, !tbaa !152
  %17 = bitcast float* %next.gep128.prol to <4 x float>*, !dbg !363
  store <4 x float> %wide.load.prol, <4 x float>* %17, align 4, !dbg !363, !tbaa !152
  %next.gep128.sum177.prol = or i64 %index.prol, 4, !dbg !363
  %18 = getelementptr float* %sy, i64 %next.gep128.sum177.prol, !dbg !363
  %19 = bitcast float* %18 to <4 x float>*, !dbg !363
  store <4 x float> %wide.load151.prol, <4 x float>* %19, align 4, !dbg !363, !tbaa !152
  %index.next.prol = add i64 %index.prol, 8, !dbg !360
  %20 = icmp eq i64 %index.next.prol, %n.vec, !dbg !360
  %prol.iter184.sub = sub i64 %prol.iter184, 1, !dbg !360
  %prol.iter184.cmp = icmp ne i64 %prol.iter184.sub, 0, !dbg !360
  br i1 %prol.iter184.cmp, label %vector.body.prol, label %vector.body.preheader.split, !llvm.loop !364

vector.body.preheader.split:                      ; preds = %vector.body.prol, %vector.body.preheader
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol ]
  %21 = icmp ult i64 %13, 2
  br i1 %21, label %middle.block.loopexit, label %vector.body.preheader.split.split

vector.body.preheader.split.split:                ; preds = %vector.body.preheader.split
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.split.split
  %index = phi i64 [ %index.unr, %vector.body.preheader.split.split ], [ %index.next.1, %vector.body ], !dbg !360
  %next.gep = getelementptr float* %sx, i64 %index
  %next.gep128 = getelementptr float* %sy, i64 %index
  %22 = bitcast float* %next.gep to <4 x float>*, !dbg !362
  %wide.load = load <4 x float>* %22, align 4, !dbg !362, !tbaa !152
  %next.gep.sum172 = or i64 %index, 4, !dbg !362
  %23 = getelementptr float* %sx, i64 %next.gep.sum172, !dbg !362
  %24 = bitcast float* %23 to <4 x float>*, !dbg !362
  %wide.load151 = load <4 x float>* %24, align 4, !dbg !362, !tbaa !152
  %25 = bitcast float* %next.gep128 to <4 x float>*, !dbg !363
  store <4 x float> %wide.load, <4 x float>* %25, align 4, !dbg !363, !tbaa !152
  %next.gep128.sum177 = or i64 %index, 4, !dbg !363
  %26 = getelementptr float* %sy, i64 %next.gep128.sum177, !dbg !363
  %27 = bitcast float* %26 to <4 x float>*, !dbg !363
  store <4 x float> %wide.load151, <4 x float>* %27, align 4, !dbg !363, !tbaa !152
  %index.next = add i64 %index, 8, !dbg !360
  %next.gep.1 = getelementptr float* %sx, i64 %index.next
  %next.gep128.1 = getelementptr float* %sy, i64 %index.next
  %28 = bitcast float* %next.gep.1 to <4 x float>*, !dbg !362
  %wide.load.1 = load <4 x float>* %28, align 4, !dbg !362, !tbaa !152
  %next.gep.sum172.1 = or i64 %index.next, 4, !dbg !362
  %29 = getelementptr float* %sx, i64 %next.gep.sum172.1, !dbg !362
  %30 = bitcast float* %29 to <4 x float>*, !dbg !362
  %wide.load151.1 = load <4 x float>* %30, align 4, !dbg !362, !tbaa !152
  %31 = bitcast float* %next.gep128.1 to <4 x float>*, !dbg !363
  store <4 x float> %wide.load.1, <4 x float>* %31, align 4, !dbg !363, !tbaa !152
  %next.gep128.sum177.1 = or i64 %index.next, 4, !dbg !363
  %32 = getelementptr float* %sy, i64 %next.gep128.sum177.1, !dbg !363
  %33 = bitcast float* %32 to <4 x float>*, !dbg !363
  store <4 x float> %wide.load151.1, <4 x float>* %33, align 4, !dbg !363, !tbaa !152
  %index.next.1 = add i64 %index.next, 8, !dbg !360
  %34 = icmp eq i64 %index.next.1, %n.vec, !dbg !360
  br i1 %34, label %middle.block.loopexit.unr-lcssa, label %vector.body, !dbg !360, !llvm.loop !365

middle.block.loopexit.unr-lcssa:                  ; preds = %vector.body
  br label %middle.block.loopexit

middle.block.loopexit:                            ; preds = %vector.body.preheader.split, %middle.block.loopexit.unr-lcssa
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %vector.memcheck, %for.body.lr.ph
  %resume.val = phi i64 [ 0, %for.body.lr.ph ], [ 0, %vector.memcheck ], [ %n.vec, %middle.block.loopexit ]
  %trunc.resume.val = phi i32 [ 0, %for.body.lr.ph ], [ 0, %vector.memcheck ], [ %5, %middle.block.loopexit ]
  %resume.val99 = phi float* [ %sx, %for.body.lr.ph ], [ %sx, %vector.memcheck ], [ %ptr.ind.end, %middle.block.loopexit ]
  %resume.val101 = phi float* [ %sy, %for.body.lr.ph ], [ %sy, %vector.memcheck ], [ %ptr.ind.end103, %middle.block.loopexit ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %return, label %for.body.preheader

for.body.preheader:                               ; preds = %middle.block
  %35 = sub i32 %n, %trunc.resume.val
  %xtraiter = and i32 %35, 7
  %lcmp.mod = icmp ne i32 %xtraiter, 0
  %lcmp.overflow = icmp eq i32 %35, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %for.body.prol, label %for.body.preheader.split

for.body.prol:                                    ; preds = %for.body.prol, %for.body.preheader
  %i.080.prol = phi i32 [ %inc.prol, %for.body.prol ], [ %trunc.resume.val, %for.body.preheader ]
  %sx.addr.079.prol = phi float* [ %incdec.ptr.prol, %for.body.prol ], [ %resume.val99, %for.body.preheader ]
  %sy.addr.078.prol = phi float* [ %incdec.ptr6.prol, %for.body.prol ], [ %resume.val101, %for.body.preheader ]
  %prol.iter = phi i32 [ %xtraiter, %for.body.preheader ], [ %prol.iter.sub, %for.body.prol ]
  %incdec.ptr.prol = getelementptr inbounds float* %sx.addr.079.prol, i64 1, !dbg !366
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr.prol, i64 0, metadata !45, metadata !131), !dbg !343
  %36 = load float* %sx.addr.079.prol, align 4, !dbg !362, !tbaa !152
  %incdec.ptr6.prol = getelementptr inbounds float* %sy.addr.078.prol, i64 1, !dbg !367
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr6.prol, i64 0, metadata !47, metadata !131), !dbg !345
  store float %36, float* %sy.addr.078.prol, align 4, !dbg !363, !tbaa !152
  %inc.prol = add nuw nsw i32 %i.080.prol, 1, !dbg !360
  tail call void @llvm.dbg.value(metadata i32 %inc.prol, i64 0, metadata !49, metadata !131), !dbg !368
  %exitcond.prol = icmp eq i32 %i.080.prol, %0, !dbg !357
  %prol.iter.sub = sub i32 %prol.iter, 1, !dbg !357
  %prol.iter.cmp = icmp ne i32 %prol.iter.sub, 0, !dbg !357
  br i1 %prol.iter.cmp, label %for.body.prol, label %for.body.preheader.split, !llvm.loop !369

for.body.preheader.split:                         ; preds = %for.body.prol, %for.body.preheader
  %i.080.unr = phi i32 [ %trunc.resume.val, %for.body.preheader ], [ %inc.prol, %for.body.prol ]
  %sx.addr.079.unr = phi float* [ %resume.val99, %for.body.preheader ], [ %incdec.ptr.prol, %for.body.prol ]
  %sy.addr.078.unr = phi float* [ %resume.val101, %for.body.preheader ], [ %incdec.ptr6.prol, %for.body.prol ]
  %37 = icmp ult i32 %35, 8
  br i1 %37, label %return.loopexit, label %for.body.preheader.split.split

for.body.preheader.split.split:                   ; preds = %for.body.preheader.split
  br label %for.body, !dbg !366

for.body:                                         ; preds = %for.body, %for.body.preheader.split.split
  %i.080 = phi i32 [ %i.080.unr, %for.body.preheader.split.split ], [ %inc.7, %for.body ]
  %sx.addr.079 = phi float* [ %sx.addr.079.unr, %for.body.preheader.split.split ], [ %incdec.ptr.7, %for.body ]
  %sy.addr.078 = phi float* [ %sy.addr.078.unr, %for.body.preheader.split.split ], [ %incdec.ptr6.7, %for.body ]
  %incdec.ptr = getelementptr inbounds float* %sx.addr.079, i64 1, !dbg !366
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr, i64 0, metadata !45, metadata !131), !dbg !343
  %38 = load float* %sx.addr.079, align 4, !dbg !362, !tbaa !152
  %incdec.ptr6 = getelementptr inbounds float* %sy.addr.078, i64 1, !dbg !367
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr6, i64 0, metadata !47, metadata !131), !dbg !345
  store float %38, float* %sy.addr.078, align 4, !dbg !363, !tbaa !152
  %inc = add nuw nsw i32 %i.080, 1, !dbg !360
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !49, metadata !131), !dbg !368
  %incdec.ptr.1 = getelementptr inbounds float* %incdec.ptr, i64 1, !dbg !366
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr, i64 0, metadata !45, metadata !131), !dbg !343
  %39 = load float* %incdec.ptr, align 4, !dbg !362, !tbaa !152
  %incdec.ptr6.1 = getelementptr inbounds float* %incdec.ptr6, i64 1, !dbg !367
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr6, i64 0, metadata !47, metadata !131), !dbg !345
  store float %39, float* %incdec.ptr6, align 4, !dbg !363, !tbaa !152
  %inc.1 = add nuw nsw i32 %inc, 1, !dbg !360
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !49, metadata !131), !dbg !368
  %incdec.ptr.2 = getelementptr inbounds float* %incdec.ptr.1, i64 1, !dbg !366
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr, i64 0, metadata !45, metadata !131), !dbg !343
  %40 = load float* %incdec.ptr.1, align 4, !dbg !362, !tbaa !152
  %incdec.ptr6.2 = getelementptr inbounds float* %incdec.ptr6.1, i64 1, !dbg !367
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr6, i64 0, metadata !47, metadata !131), !dbg !345
  store float %40, float* %incdec.ptr6.1, align 4, !dbg !363, !tbaa !152
  %inc.2 = add nuw nsw i32 %inc.1, 1, !dbg !360
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !49, metadata !131), !dbg !368
  %incdec.ptr.3 = getelementptr inbounds float* %incdec.ptr.2, i64 1, !dbg !366
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr, i64 0, metadata !45, metadata !131), !dbg !343
  %41 = load float* %incdec.ptr.2, align 4, !dbg !362, !tbaa !152
  %incdec.ptr6.3 = getelementptr inbounds float* %incdec.ptr6.2, i64 1, !dbg !367
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr6, i64 0, metadata !47, metadata !131), !dbg !345
  store float %41, float* %incdec.ptr6.2, align 4, !dbg !363, !tbaa !152
  %inc.3 = add nuw nsw i32 %inc.2, 1, !dbg !360
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !49, metadata !131), !dbg !368
  %incdec.ptr.4 = getelementptr inbounds float* %incdec.ptr.3, i64 1, !dbg !366
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr, i64 0, metadata !45, metadata !131), !dbg !343
  %42 = load float* %incdec.ptr.3, align 4, !dbg !362, !tbaa !152
  %incdec.ptr6.4 = getelementptr inbounds float* %incdec.ptr6.3, i64 1, !dbg !367
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr6, i64 0, metadata !47, metadata !131), !dbg !345
  store float %42, float* %incdec.ptr6.3, align 4, !dbg !363, !tbaa !152
  %inc.4 = add nuw nsw i32 %inc.3, 1, !dbg !360
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !49, metadata !131), !dbg !368
  %incdec.ptr.5 = getelementptr inbounds float* %incdec.ptr.4, i64 1, !dbg !366
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr, i64 0, metadata !45, metadata !131), !dbg !343
  %43 = load float* %incdec.ptr.4, align 4, !dbg !362, !tbaa !152
  %incdec.ptr6.5 = getelementptr inbounds float* %incdec.ptr6.4, i64 1, !dbg !367
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr6, i64 0, metadata !47, metadata !131), !dbg !345
  store float %43, float* %incdec.ptr6.4, align 4, !dbg !363, !tbaa !152
  %inc.5 = add nuw nsw i32 %inc.4, 1, !dbg !360
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !49, metadata !131), !dbg !368
  %incdec.ptr.6 = getelementptr inbounds float* %incdec.ptr.5, i64 1, !dbg !366
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr, i64 0, metadata !45, metadata !131), !dbg !343
  %44 = load float* %incdec.ptr.5, align 4, !dbg !362, !tbaa !152
  %incdec.ptr6.6 = getelementptr inbounds float* %incdec.ptr6.5, i64 1, !dbg !367
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr6, i64 0, metadata !47, metadata !131), !dbg !345
  store float %44, float* %incdec.ptr6.5, align 4, !dbg !363, !tbaa !152
  %inc.6 = add nuw nsw i32 %inc.5, 1, !dbg !360
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !49, metadata !131), !dbg !368
  %incdec.ptr.7 = getelementptr inbounds float* %incdec.ptr.6, i64 1, !dbg !366
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr, i64 0, metadata !45, metadata !131), !dbg !343
  %45 = load float* %incdec.ptr.6, align 4, !dbg !362, !tbaa !152
  %incdec.ptr6.7 = getelementptr inbounds float* %incdec.ptr6.6, i64 1, !dbg !367
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr6, i64 0, metadata !47, metadata !131), !dbg !345
  store float %45, float* %incdec.ptr6.6, align 4, !dbg !363, !tbaa !152
  %inc.7 = add nuw nsw i32 %inc.6, 1, !dbg !360
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !49, metadata !131), !dbg !368
  %exitcond.7 = icmp eq i32 %inc.6, %0, !dbg !357
  br i1 %exitcond.7, label %return.loopexit.unr-lcssa, label %for.body, !dbg !357, !llvm.loop !370

if.end7:                                          ; preds = %if.then2
  %cmp8 = icmp sgt i32 %incx, 0, !dbg !371
  br i1 %cmp8, label %for.body12.lr.ph, label %if.end19, !dbg !373

for.body12.lr.ph:                                 ; preds = %if.end7
  %idx.ext = sext i32 %incx to i64, !dbg !374
  %46 = add i32 %n, -1, !dbg !378
  %xtraiter185 = and i32 %n, 3
  %lcmp.mod186 = icmp ne i32 %xtraiter185, 0
  %lcmp.overflow187 = icmp eq i32 %n, 0
  %lcmp.or188 = or i1 %lcmp.overflow187, %lcmp.mod186
  br i1 %lcmp.or188, label %for.body12.prol, label %for.body12.lr.ph.split

for.body12.prol:                                  ; preds = %for.body12.prol, %for.body12.lr.ph
  %i.184.prol = phi i32 [ 0, %for.body12.lr.ph ], [ %inc14.prol, %for.body12.prol ]
  %sx.addr.183.prol = phi float* [ %sx, %for.body12.lr.ph ], [ %add.ptr.prol, %for.body12.prol ]
  %sy.addr.182.prol = phi float* [ %sy, %for.body12.lr.ph ], [ %add.ptr16.prol, %for.body12.prol ]
  %prol.iter189 = phi i32 [ %xtraiter185, %for.body12.lr.ph ], [ %prol.iter189.sub, %for.body12.prol ]
  %47 = load float* %sx.addr.183.prol, align 4, !dbg !379, !tbaa !152
  store float %47, float* %sy.addr.182.prol, align 4, !dbg !380, !tbaa !152
  %inc14.prol = add nuw nsw i32 %i.184.prol, 1, !dbg !381
  tail call void @llvm.dbg.value(metadata i32 %inc14.prol, i64 0, metadata !49, metadata !131), !dbg !368
  %add.ptr.prol = getelementptr inbounds float* %sx.addr.183.prol, i64 %idx.ext, !dbg !374
  tail call void @llvm.dbg.value(metadata float* %add.ptr.prol, i64 0, metadata !45, metadata !131), !dbg !343
  %add.ptr16.prol = getelementptr inbounds float* %sy.addr.182.prol, i64 %idx.ext, !dbg !382
  tail call void @llvm.dbg.value(metadata float* %add.ptr16.prol, i64 0, metadata !47, metadata !131), !dbg !345
  %exitcond90.prol = icmp eq i32 %i.184.prol, %46, !dbg !378
  %prol.iter189.sub = sub i32 %prol.iter189, 1, !dbg !378
  %prol.iter189.cmp = icmp ne i32 %prol.iter189.sub, 0, !dbg !378
  br i1 %prol.iter189.cmp, label %for.body12.prol, label %for.body12.lr.ph.split, !llvm.loop !383

for.body12.lr.ph.split:                           ; preds = %for.body12.prol, %for.body12.lr.ph
  %i.184.unr = phi i32 [ 0, %for.body12.lr.ph ], [ %inc14.prol, %for.body12.prol ]
  %sx.addr.183.unr = phi float* [ %sx, %for.body12.lr.ph ], [ %add.ptr.prol, %for.body12.prol ]
  %sy.addr.182.unr = phi float* [ %sy, %for.body12.lr.ph ], [ %add.ptr16.prol, %for.body12.prol ]
  %48 = icmp ult i32 %n, 4
  br i1 %48, label %return.loopexit178, label %for.body12.lr.ph.split.split

for.body12.lr.ph.split.split:                     ; preds = %for.body12.lr.ph.split
  br label %for.body12, !dbg !378

for.body12:                                       ; preds = %for.body12, %for.body12.lr.ph.split.split
  %i.184 = phi i32 [ %i.184.unr, %for.body12.lr.ph.split.split ], [ %inc14.3, %for.body12 ]
  %sx.addr.183 = phi float* [ %sx.addr.183.unr, %for.body12.lr.ph.split.split ], [ %add.ptr.3, %for.body12 ]
  %sy.addr.182 = phi float* [ %sy.addr.182.unr, %for.body12.lr.ph.split.split ], [ %add.ptr16.3, %for.body12 ]
  %49 = load float* %sx.addr.183, align 4, !dbg !379, !tbaa !152
  store float %49, float* %sy.addr.182, align 4, !dbg !380, !tbaa !152
  %inc14 = add nuw nsw i32 %i.184, 1, !dbg !381
  tail call void @llvm.dbg.value(metadata i32 %inc14, i64 0, metadata !49, metadata !131), !dbg !368
  %add.ptr = getelementptr inbounds float* %sx.addr.183, i64 %idx.ext, !dbg !374
  tail call void @llvm.dbg.value(metadata float* %add.ptr, i64 0, metadata !45, metadata !131), !dbg !343
  %add.ptr16 = getelementptr inbounds float* %sy.addr.182, i64 %idx.ext, !dbg !382
  tail call void @llvm.dbg.value(metadata float* %add.ptr16, i64 0, metadata !47, metadata !131), !dbg !345
  %50 = load float* %add.ptr, align 4, !dbg !379, !tbaa !152
  store float %50, float* %add.ptr16, align 4, !dbg !380, !tbaa !152
  %inc14.1 = add nuw nsw i32 %inc14, 1, !dbg !381
  tail call void @llvm.dbg.value(metadata i32 %inc14, i64 0, metadata !49, metadata !131), !dbg !368
  %add.ptr.1 = getelementptr inbounds float* %add.ptr, i64 %idx.ext, !dbg !374
  tail call void @llvm.dbg.value(metadata float* %add.ptr, i64 0, metadata !45, metadata !131), !dbg !343
  %add.ptr16.1 = getelementptr inbounds float* %add.ptr16, i64 %idx.ext, !dbg !382
  tail call void @llvm.dbg.value(metadata float* %add.ptr16, i64 0, metadata !47, metadata !131), !dbg !345
  %51 = load float* %add.ptr.1, align 4, !dbg !379, !tbaa !152
  store float %51, float* %add.ptr16.1, align 4, !dbg !380, !tbaa !152
  %inc14.2 = add nuw nsw i32 %inc14.1, 1, !dbg !381
  tail call void @llvm.dbg.value(metadata i32 %inc14, i64 0, metadata !49, metadata !131), !dbg !368
  %add.ptr.2 = getelementptr inbounds float* %add.ptr.1, i64 %idx.ext, !dbg !374
  tail call void @llvm.dbg.value(metadata float* %add.ptr, i64 0, metadata !45, metadata !131), !dbg !343
  %add.ptr16.2 = getelementptr inbounds float* %add.ptr16.1, i64 %idx.ext, !dbg !382
  tail call void @llvm.dbg.value(metadata float* %add.ptr16, i64 0, metadata !47, metadata !131), !dbg !345
  %52 = load float* %add.ptr.2, align 4, !dbg !379, !tbaa !152
  store float %52, float* %add.ptr16.2, align 4, !dbg !380, !tbaa !152
  %inc14.3 = add nuw nsw i32 %inc14.2, 1, !dbg !381
  tail call void @llvm.dbg.value(metadata i32 %inc14, i64 0, metadata !49, metadata !131), !dbg !368
  %add.ptr.3 = getelementptr inbounds float* %add.ptr.2, i64 %idx.ext, !dbg !374
  tail call void @llvm.dbg.value(metadata float* %add.ptr, i64 0, metadata !45, metadata !131), !dbg !343
  %add.ptr16.3 = getelementptr inbounds float* %add.ptr16.2, i64 %idx.ext, !dbg !382
  tail call void @llvm.dbg.value(metadata float* %add.ptr16, i64 0, metadata !47, metadata !131), !dbg !345
  %exitcond90.3 = icmp eq i32 %inc14.2, %46, !dbg !378
  br i1 %exitcond90.3, label %return.loopexit178.unr-lcssa, label %for.body12, !dbg !378

if.end19:                                         ; preds = %if.end7, %if.end
  %cmp20 = icmp slt i32 %incx, 0, !dbg !384
  br i1 %cmp20, label %if.then21, label %if.end25, !dbg !386

if.then21:                                        ; preds = %if.end19
  %add = sub i32 1, %n, !dbg !387
  %mul = mul nsw i32 %add, %incx, !dbg !388
  %add22 = add nsw i32 %mul, 1, !dbg !388
  %idx.ext23 = sext i32 %add22 to i64, !dbg !389
  %add.ptr24 = getelementptr inbounds float* %sx, i64 %idx.ext23, !dbg !389
  tail call void @llvm.dbg.value(metadata float* %add.ptr24, i64 0, metadata !45, metadata !131), !dbg !343
  br label %if.end25, !dbg !389

if.end25:                                         ; preds = %if.then21, %if.end19
  %sx.addr.2 = phi float* [ %add.ptr24, %if.then21 ], [ %sx, %if.end19 ]
  %cmp26 = icmp slt i32 %incy, 0, !dbg !390
  br i1 %cmp26, label %if.then27, label %for.body37.lr.ph, !dbg !392

if.then27:                                        ; preds = %if.end25
  %add29 = sub i32 1, %n, !dbg !393
  %mul30 = mul nsw i32 %add29, %incy, !dbg !394
  %add31 = add nsw i32 %mul30, 1, !dbg !394
  %idx.ext32 = sext i32 %add31 to i64, !dbg !395
  %add.ptr33 = getelementptr inbounds float* %sy, i64 %idx.ext32, !dbg !395
  tail call void @llvm.dbg.value(metadata float* %add.ptr33, i64 0, metadata !47, metadata !131), !dbg !345
  br label %for.body37.lr.ph, !dbg !395

for.body37.lr.ph:                                 ; preds = %if.end25, %if.then27
  %sy.addr.3.ph = phi float* [ %sy, %if.end25 ], [ %add.ptr33, %if.then27 ]
  %idx.ext40 = sext i32 %incx to i64, !dbg !396
  %idx.ext42 = sext i32 %incy to i64, !dbg !399
  %53 = add i32 %n, -1, !dbg !400
  %xtraiter190 = and i32 %n, 3
  %lcmp.mod191 = icmp ne i32 %xtraiter190, 0
  %lcmp.overflow192 = icmp eq i32 %n, 0
  %lcmp.or193 = or i1 %lcmp.overflow192, %lcmp.mod191
  br i1 %lcmp.or193, label %for.body37.prol, label %for.body37.lr.ph.split

for.body37.prol:                                  ; preds = %for.body37.prol, %for.body37.lr.ph
  %i.288.prol = phi i32 [ 0, %for.body37.lr.ph ], [ %inc39.prol, %for.body37.prol ]
  %sx.addr.387.prol = phi float* [ %sx.addr.2, %for.body37.lr.ph ], [ %add.ptr41.prol, %for.body37.prol ]
  %sy.addr.386.prol = phi float* [ %sy.addr.3.ph, %for.body37.lr.ph ], [ %add.ptr43.prol, %for.body37.prol ]
  %prol.iter194 = phi i32 [ %xtraiter190, %for.body37.lr.ph ], [ %prol.iter194.sub, %for.body37.prol ]
  %54 = load float* %sy.addr.386.prol, align 4, !dbg !401, !tbaa !152
  store float %54, float* %sx.addr.387.prol, align 4, !dbg !402, !tbaa !152
  %inc39.prol = add nuw nsw i32 %i.288.prol, 1, !dbg !403
  tail call void @llvm.dbg.value(metadata i32 %inc39.prol, i64 0, metadata !49, metadata !131), !dbg !368
  %add.ptr41.prol = getelementptr inbounds float* %sx.addr.387.prol, i64 %idx.ext40, !dbg !396
  tail call void @llvm.dbg.value(metadata float* %add.ptr41.prol, i64 0, metadata !45, metadata !131), !dbg !343
  %add.ptr43.prol = getelementptr inbounds float* %sy.addr.386.prol, i64 %idx.ext42, !dbg !399
  tail call void @llvm.dbg.value(metadata float* %add.ptr43.prol, i64 0, metadata !47, metadata !131), !dbg !345
  %exitcond91.prol = icmp eq i32 %i.288.prol, %53, !dbg !400
  %prol.iter194.sub = sub i32 %prol.iter194, 1, !dbg !400
  %prol.iter194.cmp = icmp ne i32 %prol.iter194.sub, 0, !dbg !400
  br i1 %prol.iter194.cmp, label %for.body37.prol, label %for.body37.lr.ph.split, !llvm.loop !404

for.body37.lr.ph.split:                           ; preds = %for.body37.prol, %for.body37.lr.ph
  %i.288.unr = phi i32 [ 0, %for.body37.lr.ph ], [ %inc39.prol, %for.body37.prol ]
  %sx.addr.387.unr = phi float* [ %sx.addr.2, %for.body37.lr.ph ], [ %add.ptr41.prol, %for.body37.prol ]
  %sy.addr.386.unr = phi float* [ %sy.addr.3.ph, %for.body37.lr.ph ], [ %add.ptr43.prol, %for.body37.prol ]
  %55 = icmp ult i32 %n, 4
  br i1 %55, label %return.loopexit179, label %for.body37.lr.ph.split.split

for.body37.lr.ph.split.split:                     ; preds = %for.body37.lr.ph.split
  br label %for.body37, !dbg !400

for.body37:                                       ; preds = %for.body37, %for.body37.lr.ph.split.split
  %i.288 = phi i32 [ %i.288.unr, %for.body37.lr.ph.split.split ], [ %inc39.3, %for.body37 ]
  %sx.addr.387 = phi float* [ %sx.addr.387.unr, %for.body37.lr.ph.split.split ], [ %add.ptr41.3, %for.body37 ]
  %sy.addr.386 = phi float* [ %sy.addr.386.unr, %for.body37.lr.ph.split.split ], [ %add.ptr43.3, %for.body37 ]
  %56 = load float* %sy.addr.386, align 4, !dbg !401, !tbaa !152
  store float %56, float* %sx.addr.387, align 4, !dbg !402, !tbaa !152
  %inc39 = add nuw nsw i32 %i.288, 1, !dbg !403
  tail call void @llvm.dbg.value(metadata i32 %inc39, i64 0, metadata !49, metadata !131), !dbg !368
  %add.ptr41 = getelementptr inbounds float* %sx.addr.387, i64 %idx.ext40, !dbg !396
  tail call void @llvm.dbg.value(metadata float* %add.ptr41, i64 0, metadata !45, metadata !131), !dbg !343
  %add.ptr43 = getelementptr inbounds float* %sy.addr.386, i64 %idx.ext42, !dbg !399
  tail call void @llvm.dbg.value(metadata float* %add.ptr43, i64 0, metadata !47, metadata !131), !dbg !345
  %57 = load float* %add.ptr43, align 4, !dbg !401, !tbaa !152
  store float %57, float* %add.ptr41, align 4, !dbg !402, !tbaa !152
  %inc39.1 = add nuw nsw i32 %inc39, 1, !dbg !403
  tail call void @llvm.dbg.value(metadata i32 %inc39, i64 0, metadata !49, metadata !131), !dbg !368
  %add.ptr41.1 = getelementptr inbounds float* %add.ptr41, i64 %idx.ext40, !dbg !396
  tail call void @llvm.dbg.value(metadata float* %add.ptr41, i64 0, metadata !45, metadata !131), !dbg !343
  %add.ptr43.1 = getelementptr inbounds float* %add.ptr43, i64 %idx.ext42, !dbg !399
  tail call void @llvm.dbg.value(metadata float* %add.ptr43, i64 0, metadata !47, metadata !131), !dbg !345
  %58 = load float* %add.ptr43.1, align 4, !dbg !401, !tbaa !152
  store float %58, float* %add.ptr41.1, align 4, !dbg !402, !tbaa !152
  %inc39.2 = add nuw nsw i32 %inc39.1, 1, !dbg !403
  tail call void @llvm.dbg.value(metadata i32 %inc39, i64 0, metadata !49, metadata !131), !dbg !368
  %add.ptr41.2 = getelementptr inbounds float* %add.ptr41.1, i64 %idx.ext40, !dbg !396
  tail call void @llvm.dbg.value(metadata float* %add.ptr41, i64 0, metadata !45, metadata !131), !dbg !343
  %add.ptr43.2 = getelementptr inbounds float* %add.ptr43.1, i64 %idx.ext42, !dbg !399
  tail call void @llvm.dbg.value(metadata float* %add.ptr43, i64 0, metadata !47, metadata !131), !dbg !345
  %59 = load float* %add.ptr43.2, align 4, !dbg !401, !tbaa !152
  store float %59, float* %add.ptr41.2, align 4, !dbg !402, !tbaa !152
  %inc39.3 = add nuw nsw i32 %inc39.2, 1, !dbg !403
  tail call void @llvm.dbg.value(metadata i32 %inc39, i64 0, metadata !49, metadata !131), !dbg !368
  %add.ptr41.3 = getelementptr inbounds float* %add.ptr41.2, i64 %idx.ext40, !dbg !396
  tail call void @llvm.dbg.value(metadata float* %add.ptr41, i64 0, metadata !45, metadata !131), !dbg !343
  %add.ptr43.3 = getelementptr inbounds float* %add.ptr43.2, i64 %idx.ext42, !dbg !399
  tail call void @llvm.dbg.value(metadata float* %add.ptr43, i64 0, metadata !47, metadata !131), !dbg !345
  %exitcond91.3 = icmp eq i32 %inc39.2, %53, !dbg !400
  br i1 %exitcond91.3, label %return.loopexit179.unr-lcssa, label %for.body37, !dbg !400

return.loopexit.unr-lcssa:                        ; preds = %for.body
  br label %return.loopexit

return.loopexit:                                  ; preds = %for.body.preheader.split, %return.loopexit.unr-lcssa
  br label %return

return.loopexit178.unr-lcssa:                     ; preds = %for.body12
  br label %return.loopexit178

return.loopexit178:                               ; preds = %for.body12.lr.ph.split, %return.loopexit178.unr-lcssa
  br label %return

return.loopexit179.unr-lcssa:                     ; preds = %for.body37
  br label %return.loopexit179

return.loopexit179:                               ; preds = %for.body37.lr.ph.split, %return.loopexit179.unr-lcssa
  br label %return

return:                                           ; preds = %return.loopexit179, %return.loopexit178, %return.loopexit, %middle.block, %entry
  ret void, !dbg !405
}

; Function Attrs: nounwind readonly uwtable
define double @sdot(i32 %n, float* nocapture readonly %sx, i32 %incx, float* nocapture readonly %sy, i32 %incy) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %n, i64 0, metadata !54, metadata !131), !dbg !406
  tail call void @llvm.dbg.value(metadata float* %sx, i64 0, metadata !55, metadata !131), !dbg !407
  tail call void @llvm.dbg.value(metadata i32 %incx, i64 0, metadata !56, metadata !131), !dbg !408
  tail call void @llvm.dbg.value(metadata float* %sy, i64 0, metadata !57, metadata !131), !dbg !409
  tail call void @llvm.dbg.value(metadata i32 %incy, i64 0, metadata !58, metadata !131), !dbg !410
  tail call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !60, metadata !131), !dbg !411
  %cmp = icmp slt i32 %n, 1, !dbg !412
  br i1 %cmp, label %return, label %if.end, !dbg !414

if.end:                                           ; preds = %entry
  %cmp1 = icmp eq i32 %incx, %incy, !dbg !415
  br i1 %cmp1, label %if.then3, label %if.end28, !dbg !417

if.then3:                                         ; preds = %if.end
  %cmp4 = icmp eq i32 %incx, 1, !dbg !418
  br i1 %cmp4, label %for.body.lr.ph, label %if.end11, !dbg !421

for.body.lr.ph:                                   ; preds = %if.then3
  %0 = add i32 %n, -1, !dbg !422
  %xtraiter = and i32 %n, 3
  %lcmp.mod = icmp ne i32 %xtraiter, 0
  %lcmp.overflow = icmp eq i32 %n, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %for.body.prol, label %for.body.lr.ph.split

for.body.prol:                                    ; preds = %for.body.prol, %for.body.lr.ph
  %stemp.0104.prol = phi float [ 0.000000e+00, %for.body.lr.ph ], [ %add.prol, %for.body.prol ]
  %i.0103.prol = phi i32 [ 0, %for.body.lr.ph ], [ %inc.prol, %for.body.prol ]
  %sy.addr.0102.prol = phi float* [ %sy, %for.body.lr.ph ], [ %incdec.ptr9.prol, %for.body.prol ]
  %sx.addr.0101.prol = phi float* [ %sx, %for.body.lr.ph ], [ %incdec.ptr.prol, %for.body.prol ]
  %prol.iter = phi i32 [ %xtraiter, %for.body.lr.ph ], [ %prol.iter.sub, %for.body.prol ]
  %1 = load float* %sx.addr.0101.prol, align 4, !dbg !425, !tbaa !152
  %2 = load float* %sy.addr.0102.prol, align 4, !dbg !427, !tbaa !152
  %mul.prol = fmul float %1, %2, !dbg !428
  %add.prol = fadd float %stemp.0104.prol, %mul.prol, !dbg !429
  tail call void @llvm.dbg.value(metadata float %add.prol, i64 0, metadata !60, metadata !131), !dbg !411
  %inc.prol = add nuw nsw i32 %i.0103.prol, 1, !dbg !430
  tail call void @llvm.dbg.value(metadata i32 %inc.prol, i64 0, metadata !59, metadata !131), !dbg !431
  %incdec.ptr.prol = getelementptr inbounds float* %sx.addr.0101.prol, i64 1, !dbg !432
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr.prol, i64 0, metadata !55, metadata !131), !dbg !407
  %incdec.ptr9.prol = getelementptr inbounds float* %sy.addr.0102.prol, i64 1, !dbg !433
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr9.prol, i64 0, metadata !57, metadata !131), !dbg !409
  %exitcond.prol = icmp eq i32 %i.0103.prol, %0, !dbg !422
  %prol.iter.sub = sub i32 %prol.iter, 1, !dbg !422
  %prol.iter.cmp = icmp ne i32 %prol.iter.sub, 0, !dbg !422
  br i1 %prol.iter.cmp, label %for.body.prol, label %for.body.lr.ph.split, !llvm.loop !434

for.body.lr.ph.split:                             ; preds = %for.body.prol, %for.body.lr.ph
  %add.lcssa.unr = phi float [ 0.000000e+00, %for.body.lr.ph ], [ %add.prol, %for.body.prol ]
  %stemp.0104.unr = phi float [ 0.000000e+00, %for.body.lr.ph ], [ %add.prol, %for.body.prol ]
  %i.0103.unr = phi i32 [ 0, %for.body.lr.ph ], [ %inc.prol, %for.body.prol ]
  %sy.addr.0102.unr = phi float* [ %sy, %for.body.lr.ph ], [ %incdec.ptr9.prol, %for.body.prol ]
  %sx.addr.0101.unr = phi float* [ %sx, %for.body.lr.ph ], [ %incdec.ptr.prol, %for.body.prol ]
  %3 = icmp ult i32 %n, 4
  br i1 %3, label %for.end, label %for.body.lr.ph.split.split

for.body.lr.ph.split.split:                       ; preds = %for.body.lr.ph.split
  br label %for.body, !dbg !422

for.body:                                         ; preds = %for.body, %for.body.lr.ph.split.split
  %stemp.0104 = phi float [ %stemp.0104.unr, %for.body.lr.ph.split.split ], [ %add.3, %for.body ]
  %i.0103 = phi i32 [ %i.0103.unr, %for.body.lr.ph.split.split ], [ %inc.3, %for.body ]
  %sy.addr.0102 = phi float* [ %sy.addr.0102.unr, %for.body.lr.ph.split.split ], [ %incdec.ptr9.3, %for.body ]
  %sx.addr.0101 = phi float* [ %sx.addr.0101.unr, %for.body.lr.ph.split.split ], [ %incdec.ptr.3, %for.body ]
  %4 = load float* %sx.addr.0101, align 4, !dbg !425, !tbaa !152
  %5 = load float* %sy.addr.0102, align 4, !dbg !427, !tbaa !152
  %mul = fmul float %4, %5, !dbg !428
  %add = fadd float %stemp.0104, %mul, !dbg !429
  tail call void @llvm.dbg.value(metadata float %add, i64 0, metadata !60, metadata !131), !dbg !411
  %inc = add nuw nsw i32 %i.0103, 1, !dbg !430
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !59, metadata !131), !dbg !431
  %incdec.ptr = getelementptr inbounds float* %sx.addr.0101, i64 1, !dbg !432
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr, i64 0, metadata !55, metadata !131), !dbg !407
  %incdec.ptr9 = getelementptr inbounds float* %sy.addr.0102, i64 1, !dbg !433
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr9, i64 0, metadata !57, metadata !131), !dbg !409
  %6 = load float* %incdec.ptr, align 4, !dbg !425, !tbaa !152
  %7 = load float* %incdec.ptr9, align 4, !dbg !427, !tbaa !152
  %mul.1 = fmul float %6, %7, !dbg !428
  %add.1 = fadd float %add, %mul.1, !dbg !429
  tail call void @llvm.dbg.value(metadata float %add, i64 0, metadata !60, metadata !131), !dbg !411
  %inc.1 = add nuw nsw i32 %inc, 1, !dbg !430
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !59, metadata !131), !dbg !431
  %incdec.ptr.1 = getelementptr inbounds float* %incdec.ptr, i64 1, !dbg !432
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr, i64 0, metadata !55, metadata !131), !dbg !407
  %incdec.ptr9.1 = getelementptr inbounds float* %incdec.ptr9, i64 1, !dbg !433
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr9, i64 0, metadata !57, metadata !131), !dbg !409
  %8 = load float* %incdec.ptr.1, align 4, !dbg !425, !tbaa !152
  %9 = load float* %incdec.ptr9.1, align 4, !dbg !427, !tbaa !152
  %mul.2 = fmul float %8, %9, !dbg !428
  %add.2 = fadd float %add.1, %mul.2, !dbg !429
  tail call void @llvm.dbg.value(metadata float %add, i64 0, metadata !60, metadata !131), !dbg !411
  %inc.2 = add nuw nsw i32 %inc.1, 1, !dbg !430
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !59, metadata !131), !dbg !431
  %incdec.ptr.2 = getelementptr inbounds float* %incdec.ptr.1, i64 1, !dbg !432
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr, i64 0, metadata !55, metadata !131), !dbg !407
  %incdec.ptr9.2 = getelementptr inbounds float* %incdec.ptr9.1, i64 1, !dbg !433
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr9, i64 0, metadata !57, metadata !131), !dbg !409
  %10 = load float* %incdec.ptr.2, align 4, !dbg !425, !tbaa !152
  %11 = load float* %incdec.ptr9.2, align 4, !dbg !427, !tbaa !152
  %mul.3 = fmul float %10, %11, !dbg !428
  %add.3 = fadd float %add.2, %mul.3, !dbg !429
  tail call void @llvm.dbg.value(metadata float %add, i64 0, metadata !60, metadata !131), !dbg !411
  %inc.3 = add nuw nsw i32 %inc.2, 1, !dbg !430
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !59, metadata !131), !dbg !431
  %incdec.ptr.3 = getelementptr inbounds float* %incdec.ptr.2, i64 1, !dbg !432
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr, i64 0, metadata !55, metadata !131), !dbg !407
  %incdec.ptr9.3 = getelementptr inbounds float* %incdec.ptr9.2, i64 1, !dbg !433
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr9, i64 0, metadata !57, metadata !131), !dbg !409
  %exitcond.3 = icmp eq i32 %inc.2, %0, !dbg !422
  br i1 %exitcond.3, label %for.end.unr-lcssa, label %for.body, !dbg !422

for.end.unr-lcssa:                                ; preds = %for.body
  %add.lcssa.ph = phi float [ %add.3, %for.body ]
  br label %for.end

for.end:                                          ; preds = %for.body.lr.ph.split, %for.end.unr-lcssa
  %add.lcssa = phi float [ %add.lcssa.unr, %for.body.lr.ph.split ], [ %add.lcssa.ph, %for.end.unr-lcssa ]
  %phitmp118 = fpext float %add.lcssa to double, !dbg !422
  br label %return, !dbg !435

if.end11:                                         ; preds = %if.then3
  %cmp12 = icmp sgt i32 %incx, 0, !dbg !436
  br i1 %cmp12, label %for.body18.lr.ph, label %if.end28, !dbg !438

for.body18.lr.ph:                                 ; preds = %if.end11
  %idx.ext = sext i32 %incx to i64, !dbg !439
  %12 = add i32 %n, -1, !dbg !443
  %xtraiter121 = and i32 %n, 1
  %lcmp.mod122 = icmp ne i32 %xtraiter121, 0
  %lcmp.overflow123 = icmp eq i32 %n, 0
  %lcmp.or124 = or i1 %lcmp.overflow123, %lcmp.mod122
  br i1 %lcmp.or124, label %for.body18.prol, label %for.body18.lr.ph.split

for.body18.prol:                                  ; preds = %for.body18.prol, %for.body18.lr.ph
  %stemp.1109.prol = phi float [ 0.000000e+00, %for.body18.lr.ph ], [ %add20.prol, %for.body18.prol ]
  %i.1108.prol = phi i32 [ 0, %for.body18.lr.ph ], [ %inc22.prol, %for.body18.prol ]
  %sy.addr.1107.prol = phi float* [ %sy, %for.body18.lr.ph ], [ %add.ptr24.prol, %for.body18.prol ]
  %sx.addr.1106.prol = phi float* [ %sx, %for.body18.lr.ph ], [ %add.ptr.prol, %for.body18.prol ]
  %prol.iter125 = phi i32 [ %xtraiter121, %for.body18.lr.ph ], [ %prol.iter125.sub, %for.body18.prol ]
  %13 = load float* %sx.addr.1106.prol, align 4, !dbg !444, !tbaa !152
  %14 = load float* %sy.addr.1107.prol, align 4, !dbg !445, !tbaa !152
  %mul19.prol = fmul float %13, %14, !dbg !446
  %add20.prol = fadd float %stemp.1109.prol, %mul19.prol, !dbg !447
  tail call void @llvm.dbg.value(metadata float %add20.prol, i64 0, metadata !60, metadata !131), !dbg !411
  %inc22.prol = add nuw nsw i32 %i.1108.prol, 1, !dbg !448
  tail call void @llvm.dbg.value(metadata i32 %inc22.prol, i64 0, metadata !59, metadata !131), !dbg !431
  %add.ptr.prol = getelementptr inbounds float* %sx.addr.1106.prol, i64 %idx.ext, !dbg !439
  tail call void @llvm.dbg.value(metadata float* %add.ptr.prol, i64 0, metadata !55, metadata !131), !dbg !407
  %add.ptr24.prol = getelementptr inbounds float* %sy.addr.1107.prol, i64 %idx.ext, !dbg !449
  tail call void @llvm.dbg.value(metadata float* %add.ptr24.prol, i64 0, metadata !57, metadata !131), !dbg !409
  %exitcond119.prol = icmp eq i32 %i.1108.prol, %12, !dbg !443
  %prol.iter125.sub = sub i32 %prol.iter125, 1, !dbg !443
  %prol.iter125.cmp = icmp ne i32 %prol.iter125.sub, 0, !dbg !443
  br i1 %prol.iter125.cmp, label %for.body18.prol, label %for.body18.lr.ph.split, !llvm.loop !450

for.body18.lr.ph.split:                           ; preds = %for.body18.prol, %for.body18.lr.ph
  %add20.lcssa.unr = phi float [ 0.000000e+00, %for.body18.lr.ph ], [ %add20.prol, %for.body18.prol ]
  %stemp.1109.unr = phi float [ 0.000000e+00, %for.body18.lr.ph ], [ %add20.prol, %for.body18.prol ]
  %i.1108.unr = phi i32 [ 0, %for.body18.lr.ph ], [ %inc22.prol, %for.body18.prol ]
  %sy.addr.1107.unr = phi float* [ %sy, %for.body18.lr.ph ], [ %add.ptr24.prol, %for.body18.prol ]
  %sx.addr.1106.unr = phi float* [ %sx, %for.body18.lr.ph ], [ %add.ptr.prol, %for.body18.prol ]
  %15 = icmp ult i32 %n, 2
  br i1 %15, label %for.end25, label %for.body18.lr.ph.split.split

for.body18.lr.ph.split.split:                     ; preds = %for.body18.lr.ph.split
  br label %for.body18, !dbg !443

for.body18:                                       ; preds = %for.body18, %for.body18.lr.ph.split.split
  %stemp.1109 = phi float [ %stemp.1109.unr, %for.body18.lr.ph.split.split ], [ %add20.1, %for.body18 ]
  %i.1108 = phi i32 [ %i.1108.unr, %for.body18.lr.ph.split.split ], [ %inc22.1, %for.body18 ]
  %sy.addr.1107 = phi float* [ %sy.addr.1107.unr, %for.body18.lr.ph.split.split ], [ %add.ptr24.1, %for.body18 ]
  %sx.addr.1106 = phi float* [ %sx.addr.1106.unr, %for.body18.lr.ph.split.split ], [ %add.ptr.1, %for.body18 ]
  %16 = load float* %sx.addr.1106, align 4, !dbg !444, !tbaa !152
  %17 = load float* %sy.addr.1107, align 4, !dbg !445, !tbaa !152
  %mul19 = fmul float %16, %17, !dbg !446
  %add20 = fadd float %stemp.1109, %mul19, !dbg !447
  tail call void @llvm.dbg.value(metadata float %add20, i64 0, metadata !60, metadata !131), !dbg !411
  %inc22 = add nuw nsw i32 %i.1108, 1, !dbg !448
  tail call void @llvm.dbg.value(metadata i32 %inc22, i64 0, metadata !59, metadata !131), !dbg !431
  %add.ptr = getelementptr inbounds float* %sx.addr.1106, i64 %idx.ext, !dbg !439
  tail call void @llvm.dbg.value(metadata float* %add.ptr, i64 0, metadata !55, metadata !131), !dbg !407
  %add.ptr24 = getelementptr inbounds float* %sy.addr.1107, i64 %idx.ext, !dbg !449
  tail call void @llvm.dbg.value(metadata float* %add.ptr24, i64 0, metadata !57, metadata !131), !dbg !409
  %18 = load float* %add.ptr, align 4, !dbg !444, !tbaa !152
  %19 = load float* %add.ptr24, align 4, !dbg !445, !tbaa !152
  %mul19.1 = fmul float %18, %19, !dbg !446
  %add20.1 = fadd float %add20, %mul19.1, !dbg !447
  tail call void @llvm.dbg.value(metadata float %add20, i64 0, metadata !60, metadata !131), !dbg !411
  %inc22.1 = add nuw nsw i32 %inc22, 1, !dbg !448
  tail call void @llvm.dbg.value(metadata i32 %inc22, i64 0, metadata !59, metadata !131), !dbg !431
  %add.ptr.1 = getelementptr inbounds float* %add.ptr, i64 %idx.ext, !dbg !439
  tail call void @llvm.dbg.value(metadata float* %add.ptr, i64 0, metadata !55, metadata !131), !dbg !407
  %add.ptr24.1 = getelementptr inbounds float* %add.ptr24, i64 %idx.ext, !dbg !449
  tail call void @llvm.dbg.value(metadata float* %add.ptr24, i64 0, metadata !57, metadata !131), !dbg !409
  %exitcond119.1 = icmp eq i32 %inc22, %12, !dbg !443
  br i1 %exitcond119.1, label %for.end25.unr-lcssa, label %for.body18, !dbg !443

for.end25.unr-lcssa:                              ; preds = %for.body18
  %add20.lcssa.ph = phi float [ %add20.1, %for.body18 ]
  br label %for.end25

for.end25:                                        ; preds = %for.body18.lr.ph.split, %for.end25.unr-lcssa
  %add20.lcssa = phi float [ %add20.lcssa.unr, %for.body18.lr.ph.split ], [ %add20.lcssa.ph, %for.end25.unr-lcssa ]
  %phitmp117 = fpext float %add20.lcssa to double, !dbg !443
  br label %return, !dbg !451

if.end28:                                         ; preds = %if.end11, %if.end
  %cmp29 = icmp slt i32 %incx, 0, !dbg !452
  br i1 %cmp29, label %if.then31, label %if.end37, !dbg !454

if.then31:                                        ; preds = %if.end28
  %add32 = sub i32 1, %n, !dbg !455
  %mul33 = mul nsw i32 %add32, %incx, !dbg !456
  %add34 = add nsw i32 %mul33, 1, !dbg !456
  %idx.ext35 = sext i32 %add34 to i64, !dbg !457
  %add.ptr36 = getelementptr inbounds float* %sx, i64 %idx.ext35, !dbg !457
  tail call void @llvm.dbg.value(metadata float* %add.ptr36, i64 0, metadata !55, metadata !131), !dbg !407
  br label %if.end37, !dbg !457

if.end37:                                         ; preds = %if.then31, %if.end28
  %sx.addr.2 = phi float* [ %add.ptr36, %if.then31 ], [ %sx, %if.end28 ]
  %cmp38 = icmp slt i32 %incy, 0, !dbg !458
  br i1 %cmp38, label %if.then40, label %for.body51.lr.ph, !dbg !460

if.then40:                                        ; preds = %if.end37
  %add42 = sub i32 1, %n, !dbg !461
  %mul43 = mul nsw i32 %add42, %incy, !dbg !462
  %add44 = add nsw i32 %mul43, 1, !dbg !462
  %idx.ext45 = sext i32 %add44 to i64, !dbg !463
  %add.ptr46 = getelementptr inbounds float* %sy, i64 %idx.ext45, !dbg !463
  tail call void @llvm.dbg.value(metadata float* %add.ptr46, i64 0, metadata !57, metadata !131), !dbg !409
  br label %for.body51.lr.ph, !dbg !463

for.body51.lr.ph:                                 ; preds = %if.end37, %if.then40
  %sy.addr.3.ph = phi float* [ %sy, %if.end37 ], [ %add.ptr46, %if.then40 ]
  %idx.ext56 = sext i32 %incx to i64, !dbg !464
  %idx.ext58 = sext i32 %incy to i64, !dbg !467
  %20 = add i32 %n, -1, !dbg !468
  %xtraiter126 = and i32 %n, 1
  %lcmp.mod127 = icmp ne i32 %xtraiter126, 0
  %lcmp.overflow128 = icmp eq i32 %n, 0
  %lcmp.or129 = or i1 %lcmp.overflow128, %lcmp.mod127
  br i1 %lcmp.or129, label %for.body51.prol, label %for.body51.lr.ph.split

for.body51.prol:                                  ; preds = %for.body51.prol, %for.body51.lr.ph
  %stemp.2115.prol = phi float [ 0.000000e+00, %for.body51.lr.ph ], [ %add53.prol, %for.body51.prol ]
  %i.2114.prol = phi i32 [ 0, %for.body51.lr.ph ], [ %inc55.prol, %for.body51.prol ]
  %sy.addr.3113.prol = phi float* [ %sy.addr.3.ph, %for.body51.lr.ph ], [ %add.ptr59.prol, %for.body51.prol ]
  %sx.addr.3112.prol = phi float* [ %sx.addr.2, %for.body51.lr.ph ], [ %add.ptr57.prol, %for.body51.prol ]
  %prol.iter130 = phi i32 [ %xtraiter126, %for.body51.lr.ph ], [ %prol.iter130.sub, %for.body51.prol ]
  %21 = load float* %sx.addr.3112.prol, align 4, !dbg !469, !tbaa !152
  %22 = load float* %sy.addr.3113.prol, align 4, !dbg !470, !tbaa !152
  %mul52.prol = fmul float %21, %22, !dbg !471
  %add53.prol = fadd float %stemp.2115.prol, %mul52.prol, !dbg !472
  tail call void @llvm.dbg.value(metadata float %add53.prol, i64 0, metadata !60, metadata !131), !dbg !411
  %inc55.prol = add nuw nsw i32 %i.2114.prol, 1, !dbg !473
  tail call void @llvm.dbg.value(metadata i32 %inc55.prol, i64 0, metadata !59, metadata !131), !dbg !431
  %add.ptr57.prol = getelementptr inbounds float* %sx.addr.3112.prol, i64 %idx.ext56, !dbg !464
  tail call void @llvm.dbg.value(metadata float* %add.ptr57.prol, i64 0, metadata !55, metadata !131), !dbg !407
  %add.ptr59.prol = getelementptr inbounds float* %sy.addr.3113.prol, i64 %idx.ext58, !dbg !467
  tail call void @llvm.dbg.value(metadata float* %add.ptr59.prol, i64 0, metadata !57, metadata !131), !dbg !409
  %exitcond120.prol = icmp eq i32 %i.2114.prol, %20, !dbg !468
  %prol.iter130.sub = sub i32 %prol.iter130, 1, !dbg !468
  %prol.iter130.cmp = icmp ne i32 %prol.iter130.sub, 0, !dbg !468
  br i1 %prol.iter130.cmp, label %for.body51.prol, label %for.body51.lr.ph.split, !llvm.loop !474

for.body51.lr.ph.split:                           ; preds = %for.body51.prol, %for.body51.lr.ph
  %add53.lcssa.unr = phi float [ 0.000000e+00, %for.body51.lr.ph ], [ %add53.prol, %for.body51.prol ]
  %stemp.2115.unr = phi float [ 0.000000e+00, %for.body51.lr.ph ], [ %add53.prol, %for.body51.prol ]
  %i.2114.unr = phi i32 [ 0, %for.body51.lr.ph ], [ %inc55.prol, %for.body51.prol ]
  %sy.addr.3113.unr = phi float* [ %sy.addr.3.ph, %for.body51.lr.ph ], [ %add.ptr59.prol, %for.body51.prol ]
  %sx.addr.3112.unr = phi float* [ %sx.addr.2, %for.body51.lr.ph ], [ %add.ptr57.prol, %for.body51.prol ]
  %23 = icmp ult i32 %n, 2
  br i1 %23, label %for.end60, label %for.body51.lr.ph.split.split

for.body51.lr.ph.split.split:                     ; preds = %for.body51.lr.ph.split
  br label %for.body51, !dbg !468

for.body51:                                       ; preds = %for.body51, %for.body51.lr.ph.split.split
  %stemp.2115 = phi float [ %stemp.2115.unr, %for.body51.lr.ph.split.split ], [ %add53.1, %for.body51 ]
  %i.2114 = phi i32 [ %i.2114.unr, %for.body51.lr.ph.split.split ], [ %inc55.1, %for.body51 ]
  %sy.addr.3113 = phi float* [ %sy.addr.3113.unr, %for.body51.lr.ph.split.split ], [ %add.ptr59.1, %for.body51 ]
  %sx.addr.3112 = phi float* [ %sx.addr.3112.unr, %for.body51.lr.ph.split.split ], [ %add.ptr57.1, %for.body51 ]
  %24 = load float* %sx.addr.3112, align 4, !dbg !469, !tbaa !152
  %25 = load float* %sy.addr.3113, align 4, !dbg !470, !tbaa !152
  %mul52 = fmul float %24, %25, !dbg !471
  %add53 = fadd float %stemp.2115, %mul52, !dbg !472
  tail call void @llvm.dbg.value(metadata float %add53, i64 0, metadata !60, metadata !131), !dbg !411
  %inc55 = add nuw nsw i32 %i.2114, 1, !dbg !473
  tail call void @llvm.dbg.value(metadata i32 %inc55, i64 0, metadata !59, metadata !131), !dbg !431
  %add.ptr57 = getelementptr inbounds float* %sx.addr.3112, i64 %idx.ext56, !dbg !464
  tail call void @llvm.dbg.value(metadata float* %add.ptr57, i64 0, metadata !55, metadata !131), !dbg !407
  %add.ptr59 = getelementptr inbounds float* %sy.addr.3113, i64 %idx.ext58, !dbg !467
  tail call void @llvm.dbg.value(metadata float* %add.ptr59, i64 0, metadata !57, metadata !131), !dbg !409
  %26 = load float* %add.ptr57, align 4, !dbg !469, !tbaa !152
  %27 = load float* %add.ptr59, align 4, !dbg !470, !tbaa !152
  %mul52.1 = fmul float %26, %27, !dbg !471
  %add53.1 = fadd float %add53, %mul52.1, !dbg !472
  tail call void @llvm.dbg.value(metadata float %add53, i64 0, metadata !60, metadata !131), !dbg !411
  %inc55.1 = add nuw nsw i32 %inc55, 1, !dbg !473
  tail call void @llvm.dbg.value(metadata i32 %inc55, i64 0, metadata !59, metadata !131), !dbg !431
  %add.ptr57.1 = getelementptr inbounds float* %add.ptr57, i64 %idx.ext56, !dbg !464
  tail call void @llvm.dbg.value(metadata float* %add.ptr57, i64 0, metadata !55, metadata !131), !dbg !407
  %add.ptr59.1 = getelementptr inbounds float* %add.ptr59, i64 %idx.ext58, !dbg !467
  tail call void @llvm.dbg.value(metadata float* %add.ptr59, i64 0, metadata !57, metadata !131), !dbg !409
  %exitcond120.1 = icmp eq i32 %inc55, %20, !dbg !468
  br i1 %exitcond120.1, label %for.end60.unr-lcssa, label %for.body51, !dbg !468

for.end60.unr-lcssa:                              ; preds = %for.body51
  %add53.lcssa.ph = phi float [ %add53.1, %for.body51 ]
  br label %for.end60

for.end60:                                        ; preds = %for.body51.lr.ph.split, %for.end60.unr-lcssa
  %add53.lcssa = phi float [ %add53.lcssa.unr, %for.body51.lr.ph.split ], [ %add53.lcssa.ph, %for.end60.unr-lcssa ]
  %phitmp = fpext float %add53.lcssa to double, !dbg !468
  br label %return, !dbg !475

return:                                           ; preds = %entry, %for.end60, %for.end25, %for.end
  %retval.0 = phi double [ %phitmp118, %for.end ], [ %phitmp117, %for.end25 ], [ %phitmp, %for.end60 ], [ 0.000000e+00, %entry ]
  ret double %retval.0, !dbg !476
}

; Function Attrs: nounwind uwtable
define double @snrm2(i32 %n, float* nocapture readonly %sx, i32 %incx) #1 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %n, i64 0, metadata !65, metadata !131), !dbg !477
  tail call void @llvm.dbg.value(metadata float* %sx, i64 0, metadata !66, metadata !131), !dbg !478
  tail call void @llvm.dbg.value(metadata i32 %incx, i64 0, metadata !67, metadata !131), !dbg !479
  tail call void @llvm.dbg.value(metadata i32 3, i64 0, metadata !69, metadata !131), !dbg !480
  tail call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !70, metadata !131), !dbg !481
  %cmp = icmp slt i32 %n, 1, !dbg !482
  %cmp1 = icmp slt i32 %incx, 1, !dbg !484
  %or.cond = or i1 %cmp, %cmp1, !dbg !486
  br i1 %or.cond, label %return, label %if.end, !dbg !486

if.end:                                           ; preds = %entry
  tail call void @llvm.dbg.value(metadata float 1.000000e+00, i64 0, metadata !487, metadata !131), !dbg !489
  tail call void @llvm.dbg.value(metadata float 5.000000e-01, i64 0, metadata !487, metadata !131), !dbg !489
  tail call void @llvm.dbg.value(metadata float 1.500000e+00, i64 0, metadata !490, metadata !131), !dbg !491
  tail call void @llvm.dbg.value(metadata float 5.000000e-01, i64 0, metadata !487, metadata !131), !dbg !489
  tail call void @llvm.dbg.value(metadata float 1.500000e+00, i64 0, metadata !490, metadata !131), !dbg !491
  tail call void @llvm.dbg.value(metadata float 5.000000e-01, i64 0, metadata !487, metadata !131), !dbg !489
  tail call void @llvm.dbg.value(metadata float 1.500000e+00, i64 0, metadata !490, metadata !131), !dbg !491
  tail call void @llvm.dbg.value(metadata float 5.000000e-01, i64 0, metadata !487, metadata !131), !dbg !489
  tail call void @llvm.dbg.value(metadata float 1.500000e+00, i64 0, metadata !490, metadata !131), !dbg !491
  tail call void @llvm.dbg.value(metadata float 5.000000e-01, i64 0, metadata !487, metadata !131), !dbg !489
  tail call void @llvm.dbg.value(metadata float 1.500000e+00, i64 0, metadata !490, metadata !131), !dbg !491
  tail call void @llvm.dbg.value(metadata float 5.000000e-01, i64 0, metadata !487, metadata !131), !dbg !489
  tail call void @llvm.dbg.value(metadata float 1.500000e+00, i64 0, metadata !490, metadata !131), !dbg !491
  tail call void @llvm.dbg.value(metadata float 5.000000e-01, i64 0, metadata !487, metadata !131), !dbg !489
  tail call void @llvm.dbg.value(metadata float 1.500000e+00, i64 0, metadata !490, metadata !131), !dbg !491
  tail call void @llvm.dbg.value(metadata float 5.000000e-01, i64 0, metadata !487, metadata !131), !dbg !489
  tail call void @llvm.dbg.value(metadata float 1.500000e+00, i64 0, metadata !490, metadata !131), !dbg !491
  tail call void @llvm.dbg.value(metadata float 5.000000e-01, i64 0, metadata !487, metadata !131), !dbg !489
  tail call void @llvm.dbg.value(metadata float 1.500000e+00, i64 0, metadata !490, metadata !131), !dbg !491
  tail call void @llvm.dbg.value(metadata float 5.000000e-01, i64 0, metadata !487, metadata !131), !dbg !489
  tail call void @llvm.dbg.value(metadata float 1.500000e+00, i64 0, metadata !490, metadata !131), !dbg !491
  tail call void @llvm.dbg.value(metadata float 5.000000e-01, i64 0, metadata !487, metadata !131), !dbg !489
  tail call void @llvm.dbg.value(metadata float 1.500000e+00, i64 0, metadata !490, metadata !131), !dbg !491
  tail call void @llvm.dbg.value(metadata float 5.000000e-01, i64 0, metadata !487, metadata !131), !dbg !489
  tail call void @llvm.dbg.value(metadata float 1.500000e+00, i64 0, metadata !490, metadata !131), !dbg !491
  tail call void @llvm.dbg.value(metadata float 5.000000e-01, i64 0, metadata !487, metadata !131), !dbg !489
  tail call void @llvm.dbg.value(metadata float 1.500000e+00, i64 0, metadata !490, metadata !131), !dbg !491
  tail call void @llvm.dbg.value(metadata float 5.000000e-01, i64 0, metadata !487, metadata !131), !dbg !489
  tail call void @llvm.dbg.value(metadata float 1.500000e+00, i64 0, metadata !490, metadata !131), !dbg !491
  tail call void @llvm.dbg.value(metadata float 5.000000e-01, i64 0, metadata !487, metadata !131), !dbg !489
  tail call void @llvm.dbg.value(metadata float 1.500000e+00, i64 0, metadata !490, metadata !131), !dbg !491
  tail call void @llvm.dbg.value(metadata float 5.000000e-01, i64 0, metadata !487, metadata !131), !dbg !489
  tail call void @llvm.dbg.value(metadata float 1.500000e+00, i64 0, metadata !490, metadata !131), !dbg !491
  tail call void @llvm.dbg.value(metadata float 5.000000e-01, i64 0, metadata !487, metadata !131), !dbg !489
  tail call void @llvm.dbg.value(metadata float 1.500000e+00, i64 0, metadata !490, metadata !131), !dbg !491
  tail call void @llvm.dbg.value(metadata float 5.000000e-01, i64 0, metadata !487, metadata !131), !dbg !489
  tail call void @llvm.dbg.value(metadata float 1.500000e+00, i64 0, metadata !490, metadata !131), !dbg !491
  tail call void @llvm.dbg.value(metadata float 5.000000e-01, i64 0, metadata !487, metadata !131), !dbg !489
  tail call void @llvm.dbg.value(metadata float 1.500000e+00, i64 0, metadata !490, metadata !131), !dbg !491
  tail call void @llvm.dbg.value(metadata float 5.000000e-01, i64 0, metadata !487, metadata !131), !dbg !489
  tail call void @llvm.dbg.value(metadata float 1.500000e+00, i64 0, metadata !490, metadata !131), !dbg !491
  tail call void @llvm.dbg.value(metadata float 5.000000e-01, i64 0, metadata !487, metadata !131), !dbg !489
  tail call void @llvm.dbg.value(metadata float 1.500000e+00, i64 0, metadata !490, metadata !131), !dbg !491
  tail call void @llvm.dbg.value(metadata float 5.000000e-01, i64 0, metadata !487, metadata !131), !dbg !489
  tail call void @llvm.dbg.value(metadata float 1.500000e+00, i64 0, metadata !490, metadata !131), !dbg !491
  tail call void @llvm.dbg.value(metadata float 5.000000e-01, i64 0, metadata !487, metadata !131), !dbg !489
  tail call void @llvm.dbg.value(metadata float 1.500000e+00, i64 0, metadata !490, metadata !131), !dbg !491
  tail call void @llvm.dbg.value(metadata float 5.000000e-01, i64 0, metadata !487, metadata !131), !dbg !489
  tail call void @llvm.dbg.value(metadata float 1.500000e+00, i64 0, metadata !490, metadata !131), !dbg !491
  tail call void @llvm.dbg.value(metadata double 0x3BFB084B92366CC2, i64 0, metadata !71, metadata !131), !dbg !492
  tail call void @llvm.dbg.value(metadata double 1.000000e+19, i64 0, metadata !72, metadata !131), !dbg !493
  %conv = sitofp i32 %n to double, !dbg !494
  %div4 = fdiv double 1.000000e+19, %conv, !dbg !495
  tail call void @llvm.dbg.value(metadata double %div4, i64 0, metadata !73, metadata !131), !dbg !496
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !68, metadata !131), !dbg !497
  %cmp5325 = icmp sgt i32 %n, 0, !dbg !498
  br i1 %cmp5325, label %land.rhs.lr.ph, label %return, !dbg !498

land.rhs.lr.ph:                                   ; preds = %if.end
  %idx.ext = sext i32 %incx to i64, !dbg !499
  br label %land.rhs, !dbg !498

land.rhs:                                         ; preds = %land.rhs.lr.ph, %while.body
  %sx.addr.0327 = phi float* [ %sx, %land.rhs.lr.ph ], [ %add.ptr, %while.body ]
  %i.0326 = phi i32 [ 0, %land.rhs.lr.ph ], [ %inc, %while.body ]
  %0 = load float* %sx.addr.0327, align 4, !dbg !501, !tbaa !152
  %cmp8 = fcmp oeq float %0, 0.000000e+00, !dbg !501
  br i1 %cmp8, label %while.body, label %START.preheader, !dbg !502

START.preheader:                                  ; preds = %land.rhs
  %.lcssa457 = phi float [ %0, %land.rhs ]
  %i.0326.lcssa = phi i32 [ %i.0326, %land.rhs ]
  %sx.addr.0327.lcssa = phi float* [ %sx.addr.0327, %land.rhs ]
  br label %START, !dbg !504

while.body:                                       ; preds = %land.rhs
  %inc = add nuw nsw i32 %i.0326, 1, !dbg !506
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !68, metadata !131), !dbg !497
  %add.ptr = getelementptr inbounds float* %sx.addr.0327, i64 %idx.ext, !dbg !499
  tail call void @llvm.dbg.value(metadata float* %add.ptr, i64 0, metadata !66, metadata !131), !dbg !478
  %cmp5 = icmp slt i32 %inc, %n, !dbg !498
  br i1 %cmp5, label %land.rhs, label %return.loopexit, !dbg !498

START:                                            ; preds = %START.preheader, %if.then68
  %1 = phi float [ %.lcssa431, %if.then68 ], [ %.lcssa457, %START.preheader ]
  %sum.0 = phi double [ %mul72, %if.then68 ], [ 0.000000e+00, %START.preheader ]
  %i.1 = phi i32 [ %i.3309.lcssa, %if.then68 ], [ %i.0326.lcssa, %START.preheader ]
  %sx.addr.1 = phi float* [ %sx.addr.3308.lcssa, %if.then68 ], [ %sx.addr.0327.lcssa, %START.preheader ]
  %cmp15 = fcmp ogt float %1, 0.000000e+00, !dbg !504
  br i1 %cmp15, label %cond.end, label %cond.false, !dbg !504

cond.false:                                       ; preds = %START
  %sub = fsub float -0.000000e+00, %1, !dbg !507
  br label %cond.end, !dbg !507

cond.end:                                         ; preds = %START, %cond.false
  %cond = phi float [ %sub, %cond.false ], [ %1, %START ], !dbg !504
  %conv17 = fpext float %cond to double, !dbg !509
  %cmp18 = fcmp ogt double %conv17, 0x3BFB084B92366CC2, !dbg !504
  br i1 %cmp18, label %for.cond.preheader, label %if.else, !dbg !512

for.cond.preheader:                               ; preds = %cond.end
  %sx.addr.1.lcssa = phi float* [ %sx.addr.1, %cond.end ]
  %i.1.lcssa = phi i32 [ %i.1, %cond.end ]
  %sum.0.lcssa = phi double [ %sum.0, %cond.end ]
  %.lcssa438 = phi float [ %1, %cond.end ]
  %cmp21299 = icmp slt i32 %i.1.lcssa, %n, !dbg !513
  br i1 %cmp21299, label %for.body.preheader, label %for.end, !dbg !517

for.body.preheader:                               ; preds = %for.cond.preheader
  br label %for.body, !dbg !518

for.body:                                         ; preds = %for.body.preheader, %if.end35.for.body_crit_edge
  %.pr259 = phi float [ %.pre, %if.end35.for.body_crit_edge ], [ %.lcssa438, %for.body.preheader ]
  %sx.addr.2302 = phi float* [ %add.ptr39, %if.end35.for.body_crit_edge ], [ %sx.addr.1.lcssa, %for.body.preheader ]
  %i.2301 = phi i32 [ %inc37, %if.end35.for.body_crit_edge ], [ %i.1.lcssa, %for.body.preheader ]
  %sum.1300 = phi double [ %add, %if.end35.for.body_crit_edge ], [ %sum.0.lcssa, %for.body.preheader ]
  %cmp24 = fcmp ogt float %.pr259, 0.000000e+00, !dbg !518
  br i1 %cmp24, label %cond.end29, label %cond.false27, !dbg !518

cond.false27:                                     ; preds = %for.body
  %sub28 = fsub float -0.000000e+00, %.pr259, !dbg !521
  br label %cond.end29, !dbg !521

cond.end29:                                       ; preds = %for.body, %cond.false27
  %cond30 = phi float [ %.pr259, %for.body ], [ %sub28, %cond.false27 ], !dbg !518
  %conv31 = fpext float %cond30 to double, !dbg !523
  %cmp32 = fcmp ogt double %conv31, %div4, !dbg !518
  br i1 %cmp32, label %GOT_LARGE, label %if.end35, !dbg !526

if.end35:                                         ; preds = %cond.end29
  %mul = fmul float %.pr259, %.pr259, !dbg !527
  %conv36 = fpext float %mul to double, !dbg !527
  %add = fadd double %sum.1300, %conv36, !dbg !528
  tail call void @llvm.dbg.value(metadata double %add, i64 0, metadata !70, metadata !131), !dbg !481
  %inc37 = add nsw i32 %i.2301, 1, !dbg !529
  tail call void @llvm.dbg.value(metadata i32 %inc37, i64 0, metadata !68, metadata !131), !dbg !497
  %add.ptr39 = getelementptr inbounds float* %sx.addr.2302, i64 %idx.ext, !dbg !530
  tail call void @llvm.dbg.value(metadata float* %add.ptr39, i64 0, metadata !66, metadata !131), !dbg !478
  %cmp21 = icmp slt i32 %inc37, %n, !dbg !513
  br i1 %cmp21, label %if.end35.for.body_crit_edge, label %for.end.loopexit, !dbg !517

if.end35.for.body_crit_edge:                      ; preds = %if.end35
  %.pre = load float* %add.ptr39, align 4, !dbg !518, !tbaa !152
  br label %for.body, !dbg !517

for.end.loopexit:                                 ; preds = %if.end35
  %add.lcssa = phi double [ %add, %if.end35 ]
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.cond.preheader
  %sum.1.lcssa = phi double [ %sum.0.lcssa, %for.cond.preheader ], [ %add.lcssa, %for.end.loopexit ]
  %call40 = tail call double @sqrt(double %sum.1.lcssa) #5, !dbg !531
  tail call void @llvm.dbg.value(metadata double %call40, i64 0, metadata !70, metadata !131), !dbg !481
  br label %return, !dbg !532

if.else:                                          ; preds = %cond.end
  br i1 %cmp15, label %cond.end47, label %cond.false45, !dbg !533

cond.false45:                                     ; preds = %if.else
  %sub46 = fsub float -0.000000e+00, %1, !dbg !535
  br label %cond.end47, !dbg !535

cond.end47:                                       ; preds = %if.else, %cond.false45
  %cond48 = phi float [ %sub46, %cond.false45 ], [ %1, %if.else ], !dbg !533
  tail call void @llvm.dbg.value(metadata float %cond48, i64 0, metadata !74, metadata !131), !dbg !537
  %add52 = fadd double %sum.0, 1.000000e+00, !dbg !538
  tail call void @llvm.dbg.value(metadata double %add52, i64 0, metadata !70, metadata !131), !dbg !481
  %i.3305315 = add nsw i32 %i.1, 1, !dbg !539
  %cmp54306316 = icmp slt i32 %i.3305315, %n, !dbg !540
  br i1 %cmp54306316, label %for.body56.lr.ph.preheader, label %for.end110.loopexit413, !dbg !543

for.body56.lr.ph.preheader:                       ; preds = %cond.end47
  br label %for.body56.lr.ph, !dbg !543

for.body56.lr.ph:                                 ; preds = %for.body56.lr.ph.preheader, %for.cond53.outer.backedge
  %i.3305320 = phi i32 [ %i.3305, %for.cond53.outer.backedge ], [ %i.3305315, %for.body56.lr.ph.preheader ]
  %sx.addr.1.pn = phi float* [ %sx.addr.3308.lcssa429, %for.cond53.outer.backedge ], [ %sx.addr.1, %for.body56.lr.ph.preheader ]
  %xmax.0.ph318 = phi float [ %xmax.0.ph.be, %for.cond53.outer.backedge ], [ %cond48, %for.body56.lr.ph.preheader ]
  %sum.2.ph317 = phi double [ %add91, %for.cond53.outer.backedge ], [ %add52, %for.body56.lr.ph.preheader ]
  br label %for.body56, !dbg !543

for.body56:                                       ; preds = %for.body56.lr.ph, %if.end100
  %i.3309 = phi i32 [ %i.3305320, %for.body56.lr.ph ], [ %i.3, %if.end100 ]
  %sx.addr.1.pn.pn = phi float* [ %sx.addr.1.pn, %for.body56.lr.ph ], [ %sx.addr.3308, %if.end100 ]
  %sum.2307 = phi double [ %sum.2.ph317, %for.body56.lr.ph ], [ %add105, %if.end100 ]
  %sx.addr.3308 = getelementptr inbounds float* %sx.addr.1.pn.pn, i64 %idx.ext, !dbg !544
  %2 = load float* %sx.addr.3308, align 4, !dbg !545, !tbaa !152
  %cmp58 = fcmp ogt float %2, 0.000000e+00, !dbg !545
  br i1 %cmp58, label %cond.end63, label %cond.false61, !dbg !545

cond.false61:                                     ; preds = %for.body56
  %sub62 = fsub float -0.000000e+00, %2, !dbg !548
  br label %cond.end63, !dbg !548

cond.end63:                                       ; preds = %for.body56, %cond.false61
  %cond64 = phi float [ %sub62, %cond.false61 ], [ %2, %for.body56 ], !dbg !545
  %conv65 = fpext float %cond64 to double, !dbg !550
  %cmp66 = fcmp ogt double %conv65, 0x3BFB084B92366CC2, !dbg !545
  br i1 %cmp66, label %if.then68, label %if.end73, !dbg !553

if.then68:                                        ; preds = %cond.end63
  %xmax.0.ph318.lcssa = phi float [ %xmax.0.ph318, %cond.end63 ]
  %.lcssa431 = phi float [ %2, %cond.end63 ]
  %sx.addr.3308.lcssa = phi float* [ %sx.addr.3308, %cond.end63 ]
  %sum.2307.lcssa = phi double [ %sum.2307, %cond.end63 ]
  %i.3309.lcssa = phi i32 [ %i.3309, %cond.end63 ]
  %conv69 = fpext float %xmax.0.ph318.lcssa to double, !dbg !554
  %mul70 = fmul double %sum.2307.lcssa, %conv69, !dbg !556
  %mul72 = fmul double %conv69, %mul70, !dbg !557
  tail call void @llvm.dbg.value(metadata double %mul72, i64 0, metadata !70, metadata !131), !dbg !481
  br label %START, !dbg !558

if.end73:                                         ; preds = %cond.end63
  br i1 %cmp58, label %cond.end80, label %cond.false78, !dbg !559

cond.false78:                                     ; preds = %if.end73
  %sub79 = fsub float -0.000000e+00, %2, !dbg !561
  br label %cond.end80, !dbg !561

cond.end80:                                       ; preds = %if.end73, %cond.false78
  %cond81 = phi float [ %2, %if.end73 ], [ %sub79, %cond.false78 ], !dbg !559
  %cmp82 = fcmp ogt float %cond81, %xmax.0.ph318, !dbg !559
  br i1 %cmp82, label %if.then84, label %if.end100, !dbg !563

if.then84:                                        ; preds = %cond.end80
  %cmp58.lcssa434 = phi i1 [ %cmp58, %cond.end80 ]
  %.lcssa432 = phi float [ %2, %cond.end80 ]
  %sx.addr.3308.lcssa429 = phi float* [ %sx.addr.3308, %cond.end80 ]
  %sum.2307.lcssa427 = phi double [ %sum.2307, %cond.end80 ]
  %i.3309.lcssa425 = phi i32 [ %i.3309, %cond.end80 ]
  %div85 = fdiv float %xmax.0.ph318, %.lcssa432, !dbg !564
  %conv86 = fpext float %div85 to double, !dbg !566
  %mul87 = fmul double %sum.2307.lcssa427, %conv86, !dbg !567
  %mul90 = fmul double %conv86, %mul87, !dbg !567
  %add91 = fadd double %mul90, 1.000000e+00, !dbg !568
  tail call void @llvm.dbg.value(metadata double %add91, i64 0, metadata !70, metadata !131), !dbg !481
  br i1 %cmp58.lcssa434, label %for.cond53.outer.backedge, label %cond.false96, !dbg !569

for.cond53.outer.backedge:                        ; preds = %if.then84, %cond.false96
  %xmax.0.ph.be = phi float [ %sub97, %cond.false96 ], [ %.lcssa432, %if.then84 ]
  %i.3305 = add nsw i32 %i.3309.lcssa425, 1, !dbg !539
  %cmp54306 = icmp slt i32 %i.3305, %n, !dbg !540
  br i1 %cmp54306, label %for.body56.lr.ph, label %for.end110.loopexit412, !dbg !543

cond.false96:                                     ; preds = %if.then84
  %sub97 = fsub float -0.000000e+00, %.lcssa432, !dbg !570
  br label %for.cond53.outer.backedge, !dbg !570

if.end100:                                        ; preds = %cond.end80
  %div101 = fdiv float %2, %xmax.0.ph318, !dbg !572
  %mul103 = fmul float %div101, %div101, !dbg !573
  %conv104 = fpext float %mul103 to double, !dbg !573
  %add105 = fadd double %sum.2307, %conv104, !dbg !574
  tail call void @llvm.dbg.value(metadata double %add105, i64 0, metadata !70, metadata !131), !dbg !481
  %i.3 = add nsw i32 %i.3309, 1, !dbg !539
  %cmp54 = icmp slt i32 %i.3, %n, !dbg !540
  br i1 %cmp54, label %for.body56, label %for.end110.loopexit, !dbg !543

for.end110.loopexit:                              ; preds = %if.end100
  %xmax.0.ph318.lcssa436 = phi float [ %xmax.0.ph318, %if.end100 ]
  %add105.lcssa = phi double [ %add105, %if.end100 ]
  br label %for.end110

for.end110.loopexit412:                           ; preds = %for.cond53.outer.backedge
  %xmax.0.ph.be.lcssa = phi float [ %xmax.0.ph.be, %for.cond53.outer.backedge ]
  %add91.lcssa = phi double [ %add91, %for.cond53.outer.backedge ]
  br label %for.end110

for.end110.loopexit413:                           ; preds = %cond.end47
  %add52.lcssa = phi double [ %add52, %cond.end47 ]
  %cond48.lcssa = phi float [ %cond48, %cond.end47 ]
  br label %for.end110

for.end110:                                       ; preds = %for.end110.loopexit413, %for.end110.loopexit412, %for.end110.loopexit
  %xmax.0.ph.lcssa275 = phi float [ %xmax.0.ph318.lcssa436, %for.end110.loopexit ], [ %xmax.0.ph.be.lcssa, %for.end110.loopexit412 ], [ %cond48.lcssa, %for.end110.loopexit413 ]
  %sum.2.lcssa = phi double [ %add105.lcssa, %for.end110.loopexit ], [ %add91.lcssa, %for.end110.loopexit412 ], [ %add52.lcssa, %for.end110.loopexit413 ]
  %conv111 = fpext float %xmax.0.ph.lcssa275 to double, !dbg !575
  %call112 = tail call double @sqrt(double %sum.2.lcssa) #5, !dbg !576
  %mul113 = fmul double %conv111, %call112, !dbg !575
  br label %return, !dbg !577

GOT_LARGE:                                        ; preds = %cond.end29
  %cmp24.lcssa = phi i1 [ %cmp24, %cond.end29 ]
  %sum.1300.lcssa = phi double [ %sum.1300, %cond.end29 ]
  %i.2301.lcssa = phi i32 [ %i.2301, %cond.end29 ]
  %sx.addr.2302.lcssa = phi float* [ %sx.addr.2302, %cond.end29 ]
  %.pr259.lcssa = phi float [ %.pr259, %cond.end29 ]
  %conv114 = fpext float %.pr259.lcssa to double, !dbg !578
  %div115 = fdiv double %sum.1300.lcssa, %conv114, !dbg !579
  %div117 = fdiv double %div115, %conv114, !dbg !580
  %add118 = fadd double %div117, 1.000000e+00, !dbg !581
  tail call void @llvm.dbg.value(metadata double %add118, i64 0, metadata !70, metadata !131), !dbg !481
  br i1 %cmp24.lcssa, label %cond.end125, label %cond.false123, !dbg !582

cond.false123:                                    ; preds = %GOT_LARGE
  %sub124 = fsub float -0.000000e+00, %.pr259.lcssa, !dbg !583
  br label %cond.end125, !dbg !583

cond.end125:                                      ; preds = %GOT_LARGE, %cond.false123
  %cond126 = phi float [ %sub124, %cond.false123 ], [ %.pr259.lcssa, %GOT_LARGE ], !dbg !582
  tail call void @llvm.dbg.value(metadata float %cond126, i64 0, metadata !74, metadata !131), !dbg !537
  %i.4282291 = add nsw i32 %i.2301.lcssa, 1, !dbg !585
  %cmp131283292 = icmp slt i32 %i.4282291, %n, !dbg !586
  br i1 %cmp131283292, label %for.body133.lr.ph.preheader, label %for.end170, !dbg !589

for.body133.lr.ph.preheader:                      ; preds = %cond.end125
  br label %for.body133.lr.ph, !dbg !589

for.body133.lr.ph:                                ; preds = %for.body133.lr.ph.preheader, %for.cond130.outer.backedge
  %i.4282296 = phi i32 [ %i.4282, %for.cond130.outer.backedge ], [ %i.4282291, %for.body133.lr.ph.preheader ]
  %sx.addr.2302.pn = phi float* [ %sx.addr.4285.lcssa, %for.cond130.outer.backedge ], [ %sx.addr.2302.lcssa, %for.body133.lr.ph.preheader ]
  %xmax.2.ph294 = phi float [ %xmax.2.ph.be, %for.cond130.outer.backedge ], [ %cond126, %for.body133.lr.ph.preheader ]
  %sum.4.ph293 = phi double [ %add151, %for.cond130.outer.backedge ], [ %add118, %for.body133.lr.ph.preheader ]
  br label %for.body133, !dbg !589

for.body133:                                      ; preds = %for.body133.lr.ph, %if.end160
  %i.4286 = phi i32 [ %i.4282296, %for.body133.lr.ph ], [ %i.4, %if.end160 ]
  %sx.addr.2302.pn.pn = phi float* [ %sx.addr.2302.pn, %for.body133.lr.ph ], [ %sx.addr.4285, %if.end160 ]
  %sum.4284 = phi double [ %sum.4.ph293, %for.body133.lr.ph ], [ %add165, %if.end160 ]
  %sx.addr.4285 = getelementptr inbounds float* %sx.addr.2302.pn.pn, i64 %idx.ext, !dbg !590
  %3 = load float* %sx.addr.4285, align 4, !dbg !591, !tbaa !152
  %cmp135 = fcmp ogt float %3, 0.000000e+00, !dbg !591
  br i1 %cmp135, label %cond.end140, label %cond.false138, !dbg !591

cond.false138:                                    ; preds = %for.body133
  %sub139 = fsub float -0.000000e+00, %3, !dbg !594
  br label %cond.end140, !dbg !594

cond.end140:                                      ; preds = %for.body133, %cond.false138
  %cond141 = phi float [ %3, %for.body133 ], [ %sub139, %cond.false138 ], !dbg !591
  %cmp142 = fcmp ogt float %cond141, %xmax.2.ph294, !dbg !591
  br i1 %cmp142, label %if.then144, label %if.end160, !dbg !596

if.then144:                                       ; preds = %cond.end140
  %cmp135.lcssa = phi i1 [ %cmp135, %cond.end140 ]
  %.lcssa = phi float [ %3, %cond.end140 ]
  %sx.addr.4285.lcssa = phi float* [ %sx.addr.4285, %cond.end140 ]
  %sum.4284.lcssa = phi double [ %sum.4284, %cond.end140 ]
  %i.4286.lcssa = phi i32 [ %i.4286, %cond.end140 ]
  %div145 = fdiv float %xmax.2.ph294, %.lcssa, !dbg !597
  %conv146 = fpext float %div145 to double, !dbg !599
  %mul147 = fmul double %sum.4284.lcssa, %conv146, !dbg !600
  %mul150 = fmul double %conv146, %mul147, !dbg !600
  %add151 = fadd double %mul150, 1.000000e+00, !dbg !601
  tail call void @llvm.dbg.value(metadata double %add151, i64 0, metadata !70, metadata !131), !dbg !481
  br i1 %cmp135.lcssa, label %for.cond130.outer.backedge, label %cond.false156, !dbg !602

for.cond130.outer.backedge:                       ; preds = %if.then144, %cond.false156
  %xmax.2.ph.be = phi float [ %sub157, %cond.false156 ], [ %.lcssa, %if.then144 ]
  %i.4282 = add nsw i32 %i.4286.lcssa, 1, !dbg !585
  %cmp131283 = icmp slt i32 %i.4282, %n, !dbg !586
  br i1 %cmp131283, label %for.body133.lr.ph, label %for.end170.loopexit411, !dbg !589

cond.false156:                                    ; preds = %if.then144
  %sub157 = fsub float -0.000000e+00, %.lcssa, !dbg !603
  br label %for.cond130.outer.backedge, !dbg !603

if.end160:                                        ; preds = %cond.end140
  %div161 = fdiv float %3, %xmax.2.ph294, !dbg !605
  %mul163 = fmul float %div161, %div161, !dbg !606
  %conv164 = fpext float %mul163 to double, !dbg !606
  %add165 = fadd double %sum.4284, %conv164, !dbg !607
  tail call void @llvm.dbg.value(metadata double %add165, i64 0, metadata !70, metadata !131), !dbg !481
  %i.4 = add nsw i32 %i.4286, 1, !dbg !585
  %cmp131 = icmp slt i32 %i.4, %n, !dbg !586
  br i1 %cmp131, label %for.body133, label %for.end170.loopexit, !dbg !589

for.end170.loopexit:                              ; preds = %if.end160
  %xmax.2.ph294.lcssa = phi float [ %xmax.2.ph294, %if.end160 ]
  %add165.lcssa = phi double [ %add165, %if.end160 ]
  br label %for.end170

for.end170.loopexit411:                           ; preds = %for.cond130.outer.backedge
  %xmax.2.ph.be.lcssa = phi float [ %xmax.2.ph.be, %for.cond130.outer.backedge ]
  %add151.lcssa = phi double [ %add151, %for.cond130.outer.backedge ]
  br label %for.end170

for.end170:                                       ; preds = %for.end170.loopexit411, %for.end170.loopexit, %cond.end125
  %xmax.2.ph.lcssa = phi float [ %cond126, %cond.end125 ], [ %xmax.2.ph294.lcssa, %for.end170.loopexit ], [ %xmax.2.ph.be.lcssa, %for.end170.loopexit411 ]
  %sum.4.lcssa = phi double [ %add118, %cond.end125 ], [ %add165.lcssa, %for.end170.loopexit ], [ %add151.lcssa, %for.end170.loopexit411 ]
  %conv171 = fpext float %xmax.2.ph.lcssa to double, !dbg !608
  %call172 = tail call double @sqrt(double %sum.4.lcssa) #5, !dbg !609
  %mul173 = fmul double %conv171, %call172, !dbg !608
  br label %return, !dbg !610

return.loopexit:                                  ; preds = %while.body
  br label %return

return:                                           ; preds = %return.loopexit, %if.end, %entry, %for.end170, %for.end110, %for.end
  %retval.0 = phi double [ %mul173, %for.end170 ], [ %call40, %for.end ], [ %mul113, %for.end110 ], [ 0.000000e+00, %entry ], [ 0.000000e+00, %if.end ], [ 0.000000e+00, %return.loopexit ]
  ret double %retval.0, !dbg !611
}

; Function Attrs: nounwind
declare double @sqrt(double) #2

; Function Attrs: nounwind readnone uwtable
define double @r1mach() #3 {
entry:
  tail call void @llvm.dbg.value(metadata float 1.000000e+00, i64 0, metadata !78, metadata !131), !dbg !612
  tail call void @llvm.dbg.value(metadata float 5.000000e-01, i64 0, metadata !78, metadata !131), !dbg !612
  tail call void @llvm.dbg.value(metadata float 1.500000e+00, i64 0, metadata !79, metadata !131), !dbg !613
  tail call void @llvm.dbg.value(metadata float 5.000000e-01, i64 0, metadata !78, metadata !131), !dbg !612
  tail call void @llvm.dbg.value(metadata float 1.500000e+00, i64 0, metadata !79, metadata !131), !dbg !613
  tail call void @llvm.dbg.value(metadata float 5.000000e-01, i64 0, metadata !78, metadata !131), !dbg !612
  tail call void @llvm.dbg.value(metadata float 1.500000e+00, i64 0, metadata !79, metadata !131), !dbg !613
  tail call void @llvm.dbg.value(metadata float 5.000000e-01, i64 0, metadata !78, metadata !131), !dbg !612
  tail call void @llvm.dbg.value(metadata float 1.500000e+00, i64 0, metadata !79, metadata !131), !dbg !613
  tail call void @llvm.dbg.value(metadata float 5.000000e-01, i64 0, metadata !78, metadata !131), !dbg !612
  tail call void @llvm.dbg.value(metadata float 1.500000e+00, i64 0, metadata !79, metadata !131), !dbg !613
  tail call void @llvm.dbg.value(metadata float 5.000000e-01, i64 0, metadata !78, metadata !131), !dbg !612
  tail call void @llvm.dbg.value(metadata float 1.500000e+00, i64 0, metadata !79, metadata !131), !dbg !613
  tail call void @llvm.dbg.value(metadata float 5.000000e-01, i64 0, metadata !78, metadata !131), !dbg !612
  tail call void @llvm.dbg.value(metadata float 1.500000e+00, i64 0, metadata !79, metadata !131), !dbg !613
  tail call void @llvm.dbg.value(metadata float 5.000000e-01, i64 0, metadata !78, metadata !131), !dbg !612
  tail call void @llvm.dbg.value(metadata float 1.500000e+00, i64 0, metadata !79, metadata !131), !dbg !613
  tail call void @llvm.dbg.value(metadata float 5.000000e-01, i64 0, metadata !78, metadata !131), !dbg !612
  tail call void @llvm.dbg.value(metadata float 1.500000e+00, i64 0, metadata !79, metadata !131), !dbg !613
  tail call void @llvm.dbg.value(metadata float 5.000000e-01, i64 0, metadata !78, metadata !131), !dbg !612
  tail call void @llvm.dbg.value(metadata float 1.500000e+00, i64 0, metadata !79, metadata !131), !dbg !613
  tail call void @llvm.dbg.value(metadata float 5.000000e-01, i64 0, metadata !78, metadata !131), !dbg !612
  tail call void @llvm.dbg.value(metadata float 1.500000e+00, i64 0, metadata !79, metadata !131), !dbg !613
  tail call void @llvm.dbg.value(metadata float 5.000000e-01, i64 0, metadata !78, metadata !131), !dbg !612
  tail call void @llvm.dbg.value(metadata float 1.500000e+00, i64 0, metadata !79, metadata !131), !dbg !613
  tail call void @llvm.dbg.value(metadata float 5.000000e-01, i64 0, metadata !78, metadata !131), !dbg !612
  tail call void @llvm.dbg.value(metadata float 1.500000e+00, i64 0, metadata !79, metadata !131), !dbg !613
  tail call void @llvm.dbg.value(metadata float 5.000000e-01, i64 0, metadata !78, metadata !131), !dbg !612
  tail call void @llvm.dbg.value(metadata float 1.500000e+00, i64 0, metadata !79, metadata !131), !dbg !613
  tail call void @llvm.dbg.value(metadata float 5.000000e-01, i64 0, metadata !78, metadata !131), !dbg !612
  tail call void @llvm.dbg.value(metadata float 1.500000e+00, i64 0, metadata !79, metadata !131), !dbg !613
  tail call void @llvm.dbg.value(metadata float 5.000000e-01, i64 0, metadata !78, metadata !131), !dbg !612
  tail call void @llvm.dbg.value(metadata float 1.500000e+00, i64 0, metadata !79, metadata !131), !dbg !613
  tail call void @llvm.dbg.value(metadata float 5.000000e-01, i64 0, metadata !78, metadata !131), !dbg !612
  tail call void @llvm.dbg.value(metadata float 1.500000e+00, i64 0, metadata !79, metadata !131), !dbg !613
  tail call void @llvm.dbg.value(metadata float 5.000000e-01, i64 0, metadata !78, metadata !131), !dbg !612
  tail call void @llvm.dbg.value(metadata float 1.500000e+00, i64 0, metadata !79, metadata !131), !dbg !613
  tail call void @llvm.dbg.value(metadata float 5.000000e-01, i64 0, metadata !78, metadata !131), !dbg !612
  tail call void @llvm.dbg.value(metadata float 1.500000e+00, i64 0, metadata !79, metadata !131), !dbg !613
  tail call void @llvm.dbg.value(metadata float 5.000000e-01, i64 0, metadata !78, metadata !131), !dbg !612
  tail call void @llvm.dbg.value(metadata float 1.500000e+00, i64 0, metadata !79, metadata !131), !dbg !613
  tail call void @llvm.dbg.value(metadata float 5.000000e-01, i64 0, metadata !78, metadata !131), !dbg !612
  tail call void @llvm.dbg.value(metadata float 1.500000e+00, i64 0, metadata !79, metadata !131), !dbg !613
  tail call void @llvm.dbg.value(metadata float 5.000000e-01, i64 0, metadata !78, metadata !131), !dbg !612
  tail call void @llvm.dbg.value(metadata float 1.500000e+00, i64 0, metadata !79, metadata !131), !dbg !613
  tail call void @llvm.dbg.value(metadata float 5.000000e-01, i64 0, metadata !78, metadata !131), !dbg !612
  tail call void @llvm.dbg.value(metadata float 1.500000e+00, i64 0, metadata !79, metadata !131), !dbg !613
  tail call void @llvm.dbg.value(metadata float 5.000000e-01, i64 0, metadata !78, metadata !131), !dbg !612
  tail call void @llvm.dbg.value(metadata float 1.500000e+00, i64 0, metadata !79, metadata !131), !dbg !613
  ret double 0x3E80000000000000, !dbg !614
}

; Function Attrs: nounwind readnone uwtable
define i32 @min0(i32 %n, i32 %a, i32 %b, i32 %c, i32 %d, i32 %e, i32 %f, i32 %g, i32 %h, i32 %i, i32 %j, i32 %k, i32 %l, i32 %m, i32 %o, i32 %p) #3 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %n, i64 0, metadata !84, metadata !131), !dbg !615
  tail call void @llvm.dbg.value(metadata i32 %a, i64 0, metadata !85, metadata !131), !dbg !616
  tail call void @llvm.dbg.value(metadata i32 %b, i64 0, metadata !86, metadata !131), !dbg !617
  tail call void @llvm.dbg.value(metadata i32 %c, i64 0, metadata !87, metadata !131), !dbg !618
  tail call void @llvm.dbg.value(metadata i32 %d, i64 0, metadata !88, metadata !131), !dbg !619
  tail call void @llvm.dbg.value(metadata i32 %e, i64 0, metadata !89, metadata !131), !dbg !620
  tail call void @llvm.dbg.value(metadata i32 %f, i64 0, metadata !90, metadata !131), !dbg !621
  tail call void @llvm.dbg.value(metadata i32 %g, i64 0, metadata !91, metadata !131), !dbg !622
  tail call void @llvm.dbg.value(metadata i32 %h, i64 0, metadata !92, metadata !131), !dbg !623
  tail call void @llvm.dbg.value(metadata i32 %i, i64 0, metadata !93, metadata !131), !dbg !624
  tail call void @llvm.dbg.value(metadata i32 %j, i64 0, metadata !94, metadata !131), !dbg !625
  tail call void @llvm.dbg.value(metadata i32 %k, i64 0, metadata !95, metadata !131), !dbg !626
  tail call void @llvm.dbg.value(metadata i32 %l, i64 0, metadata !96, metadata !131), !dbg !627
  tail call void @llvm.dbg.value(metadata i32 %m, i64 0, metadata !97, metadata !131), !dbg !628
  tail call void @llvm.dbg.value(metadata i32 %o, i64 0, metadata !98, metadata !131), !dbg !629
  tail call void @llvm.dbg.value(metadata i32 %p, i64 0, metadata !99, metadata !131), !dbg !630
  %n.off = add i32 %n, -1, !dbg !631
  %0 = icmp ugt i32 %n.off, 14, !dbg !631
  br i1 %0, label %return, label %if.end, !dbg !631

if.end:                                           ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 %a, i64 0, metadata !100, metadata !131), !dbg !632
  %cmp2 = icmp eq i32 %n, 1, !dbg !633
  br i1 %cmp2, label %return, label %if.end4, !dbg !635

if.end4:                                          ; preds = %if.end
  %cmp5 = icmp sgt i32 %a, %b, !dbg !636
  tail call void @llvm.dbg.value(metadata i32 %b, i64 0, metadata !100, metadata !131), !dbg !632
  %b.a = select i1 %cmp5, i32 %b, i32 %a, !dbg !638
  %cmp8 = icmp eq i32 %n, 2, !dbg !639
  br i1 %cmp8, label %return, label %if.end10, !dbg !641

if.end10:                                         ; preds = %if.end4
  %cmp11 = icmp sgt i32 %b.a, %c, !dbg !642
  tail call void @llvm.dbg.value(metadata i32 %c, i64 0, metadata !100, metadata !131), !dbg !632
  %c.b.a = select i1 %cmp11, i32 %c, i32 %b.a, !dbg !644
  %cmp14 = icmp eq i32 %n, 3, !dbg !645
  br i1 %cmp14, label %return, label %if.end16, !dbg !647

if.end16:                                         ; preds = %if.end10
  %cmp17 = icmp sgt i32 %c.b.a, %d, !dbg !648
  tail call void @llvm.dbg.value(metadata i32 %d, i64 0, metadata !100, metadata !131), !dbg !632
  %d.c.b.a = select i1 %cmp17, i32 %d, i32 %c.b.a, !dbg !650
  %cmp20 = icmp eq i32 %n, 4, !dbg !651
  br i1 %cmp20, label %return, label %if.end22, !dbg !653

if.end22:                                         ; preds = %if.end16
  %cmp23 = icmp sgt i32 %d.c.b.a, %e, !dbg !654
  tail call void @llvm.dbg.value(metadata i32 %e, i64 0, metadata !100, metadata !131), !dbg !632
  %e.d.c.b.a = select i1 %cmp23, i32 %e, i32 %d.c.b.a, !dbg !656
  %cmp26 = icmp eq i32 %n, 5, !dbg !657
  br i1 %cmp26, label %return, label %if.end28, !dbg !659

if.end28:                                         ; preds = %if.end22
  %cmp29 = icmp sgt i32 %e.d.c.b.a, %f, !dbg !660
  tail call void @llvm.dbg.value(metadata i32 %f, i64 0, metadata !100, metadata !131), !dbg !632
  %f.e.d.c.b.a = select i1 %cmp29, i32 %f, i32 %e.d.c.b.a, !dbg !662
  %cmp32 = icmp eq i32 %n, 6, !dbg !663
  br i1 %cmp32, label %return, label %if.end34, !dbg !665

if.end34:                                         ; preds = %if.end28
  %cmp35 = icmp sgt i32 %f.e.d.c.b.a, %g, !dbg !666
  tail call void @llvm.dbg.value(metadata i32 %g, i64 0, metadata !100, metadata !131), !dbg !632
  %g.f.e.d.c.b.a = select i1 %cmp35, i32 %g, i32 %f.e.d.c.b.a, !dbg !668
  %cmp38 = icmp eq i32 %n, 7, !dbg !669
  br i1 %cmp38, label %return, label %if.end40, !dbg !671

if.end40:                                         ; preds = %if.end34
  %cmp41 = icmp sgt i32 %g.f.e.d.c.b.a, %h, !dbg !672
  tail call void @llvm.dbg.value(metadata i32 %h, i64 0, metadata !100, metadata !131), !dbg !632
  %h.g.f.e.d.c.b.a = select i1 %cmp41, i32 %h, i32 %g.f.e.d.c.b.a, !dbg !674
  %cmp44 = icmp eq i32 %n, 8, !dbg !675
  br i1 %cmp44, label %return, label %if.end46, !dbg !677

if.end46:                                         ; preds = %if.end40
  %cmp47 = icmp sgt i32 %h.g.f.e.d.c.b.a, %i, !dbg !678
  tail call void @llvm.dbg.value(metadata i32 %i, i64 0, metadata !100, metadata !131), !dbg !632
  %i.h.g.f.e.d.c.b.a = select i1 %cmp47, i32 %i, i32 %h.g.f.e.d.c.b.a, !dbg !680
  %cmp50 = icmp eq i32 %n, 9, !dbg !681
  br i1 %cmp50, label %return, label %if.end52, !dbg !683

if.end52:                                         ; preds = %if.end46
  %cmp53 = icmp sgt i32 %i.h.g.f.e.d.c.b.a, %j, !dbg !684
  tail call void @llvm.dbg.value(metadata i32 %j, i64 0, metadata !100, metadata !131), !dbg !632
  %j.i.h.g.f.e.d.c.b.a = select i1 %cmp53, i32 %j, i32 %i.h.g.f.e.d.c.b.a, !dbg !686
  %cmp56 = icmp eq i32 %n, 10, !dbg !687
  br i1 %cmp56, label %return, label %if.end58, !dbg !689

if.end58:                                         ; preds = %if.end52
  %cmp59 = icmp sgt i32 %j.i.h.g.f.e.d.c.b.a, %k, !dbg !690
  tail call void @llvm.dbg.value(metadata i32 %k, i64 0, metadata !100, metadata !131), !dbg !632
  %k.j.i.h.g.f.e.d.c.b.a = select i1 %cmp59, i32 %k, i32 %j.i.h.g.f.e.d.c.b.a, !dbg !692
  %cmp62 = icmp eq i32 %n, 11, !dbg !693
  br i1 %cmp62, label %return, label %if.end64, !dbg !695

if.end64:                                         ; preds = %if.end58
  %cmp65 = icmp sgt i32 %k.j.i.h.g.f.e.d.c.b.a, %l, !dbg !696
  tail call void @llvm.dbg.value(metadata i32 %l, i64 0, metadata !100, metadata !131), !dbg !632
  %l.k.j.i.h.g.f.e.d.c.b.a = select i1 %cmp65, i32 %l, i32 %k.j.i.h.g.f.e.d.c.b.a, !dbg !698
  %cmp68 = icmp eq i32 %n, 12, !dbg !699
  br i1 %cmp68, label %return, label %if.end70, !dbg !701

if.end70:                                         ; preds = %if.end64
  %cmp71 = icmp sgt i32 %l.k.j.i.h.g.f.e.d.c.b.a, %m, !dbg !702
  tail call void @llvm.dbg.value(metadata i32 %m, i64 0, metadata !100, metadata !131), !dbg !632
  %m.l.k.j.i.h.g.f.e.d.c.b.a = select i1 %cmp71, i32 %m, i32 %l.k.j.i.h.g.f.e.d.c.b.a, !dbg !704
  %cmp74 = icmp eq i32 %n, 13, !dbg !705
  br i1 %cmp74, label %return, label %if.end76, !dbg !707

if.end76:                                         ; preds = %if.end70
  %cmp77 = icmp sgt i32 %m.l.k.j.i.h.g.f.e.d.c.b.a, %o, !dbg !708
  tail call void @llvm.dbg.value(metadata i32 %o, i64 0, metadata !100, metadata !131), !dbg !632
  %o.m.l.k.j.i.h.g.f.e.d.c.b.a = select i1 %cmp77, i32 %o, i32 %m.l.k.j.i.h.g.f.e.d.c.b.a, !dbg !710
  %cmp80 = icmp eq i32 %n, 14, !dbg !711
  br i1 %cmp80, label %return, label %if.end82, !dbg !713

if.end82:                                         ; preds = %if.end76
  %cmp83 = icmp sgt i32 %o.m.l.k.j.i.h.g.f.e.d.c.b.a, %p, !dbg !714
  tail call void @llvm.dbg.value(metadata i32 %p, i64 0, metadata !100, metadata !131), !dbg !632
  %p.o.m.l.k.j.i.h.g.f.e.d.c.b.a = select i1 %cmp83, i32 %p, i32 %o.m.l.k.j.i.h.g.f.e.d.c.b.a, !dbg !716
  br label %return, !dbg !717

return:                                           ; preds = %if.end76, %if.end70, %if.end64, %if.end58, %if.end52, %if.end46, %if.end40, %if.end34, %if.end28, %if.end22, %if.end16, %if.end10, %if.end4, %if.end, %entry, %if.end82
  %retval.0 = phi i32 [ %p.o.m.l.k.j.i.h.g.f.e.d.c.b.a, %if.end82 ], [ -1, %entry ], [ %a, %if.end ], [ %b.a, %if.end4 ], [ %c.b.a, %if.end10 ], [ %d.c.b.a, %if.end16 ], [ %e.d.c.b.a, %if.end22 ], [ %f.e.d.c.b.a, %if.end28 ], [ %g.f.e.d.c.b.a, %if.end34 ], [ %h.g.f.e.d.c.b.a, %if.end40 ], [ %i.h.g.f.e.d.c.b.a, %if.end46 ], [ %j.i.h.g.f.e.d.c.b.a, %if.end52 ], [ %k.j.i.h.g.f.e.d.c.b.a, %if.end58 ], [ %l.k.j.i.h.g.f.e.d.c.b.a, %if.end64 ], [ %m.l.k.j.i.h.g.f.e.d.c.b.a, %if.end70 ], [ %o.m.l.k.j.i.h.g.f.e.d.c.b.a, %if.end76 ]
  ret i32 %retval.0, !dbg !718
}

; Function Attrs: nounwind uwtable
define i32 @sscal(i32 %n, double, float* nocapture %sx, i32 %incx) #1 {
entry:
  %sa = fptrunc double %0 to float
  tail call void @llvm.dbg.value(metadata i32 %n, i64 0, metadata !105, metadata !131), !dbg !719
  tail call void @llvm.dbg.value(metadata float %sa, i64 0, metadata !106, metadata !131), !dbg !720
  tail call void @llvm.dbg.value(metadata float* %sx, i64 0, metadata !107, metadata !131), !dbg !721
  tail call void @llvm.dbg.value(metadata i32 %incx, i64 0, metadata !108, metadata !131), !dbg !722
  %cmp = icmp slt i32 %n, 1, !dbg !723
  br i1 %cmp, label %return, label %if.end, !dbg !725

if.end:                                           ; preds = %entry
  %cmp1 = icmp eq i32 %incx, 1, !dbg !726
  br i1 %cmp1, label %for.body13.lr.ph, label %if.then2, !dbg !728

for.body13.lr.ph:                                 ; preds = %if.end
  %1 = add i32 %n, -1, !dbg !729
  %2 = zext i32 %1 to i64
  %3 = add nuw nsw i64 %2, 1, !dbg !729
  %end.idx = add nuw nsw i64 %2, 1, !dbg !731
  %n.vec = and i64 %3, 8589934584, !dbg !731
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !731
  %4 = trunc i64 %n.vec to i32
  %ptr.ind.end = getelementptr float* %sx, i64 %n.vec
  br i1 %cmp.zero, label %middle.block, label %vector.ph

vector.ph:                                        ; preds = %for.body13.lr.ph
  %broadcast.splatinsert66 = insertelement <4 x float> undef, float %sa, i32 0
  %broadcast.splat67 = shufflevector <4 x float> %broadcast.splatinsert66, <4 x float> undef, <4 x i32> zeroinitializer
  %5 = add i32 %n, -1
  %6 = zext i32 %5 to i64
  %7 = add i64 %6, 1
  %8 = lshr i64 %7, 3
  %9 = mul i64 %8, 8
  %10 = add i64 %9, -8
  %11 = lshr i64 %10, 3
  %12 = add i64 %11, 1
  %xtraiter83 = and i64 %12, 1
  %lcmp.mod84 = icmp ne i64 %xtraiter83, 0
  %lcmp.overflow85 = icmp eq i64 %12, 0
  %lcmp.or86 = or i1 %lcmp.overflow85, %lcmp.mod84
  br i1 %lcmp.or86, label %vector.body.prol, label %vector.ph.split

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.ph
  %index.prol = phi i64 [ 0, %vector.ph ], [ %index.next.prol, %vector.body.prol ], !dbg !731
  %prol.iter87 = phi i64 [ %xtraiter83, %vector.ph ], [ %prol.iter87.sub, %vector.body.prol ]
  %next.gep.prol = getelementptr float* %sx, i64 %index.prol
  %13 = bitcast float* %next.gep.prol to <4 x float>*, !dbg !733
  %wide.load.prol = load <4 x float>* %13, align 4, !dbg !733, !tbaa !152
  %next.gep.sum77.prol = or i64 %index.prol, 4, !dbg !733
  %14 = getelementptr float* %sx, i64 %next.gep.sum77.prol, !dbg !733
  %15 = bitcast float* %14 to <4 x float>*, !dbg !733
  %wide.load65.prol = load <4 x float>* %15, align 4, !dbg !733, !tbaa !152
  %16 = fmul <4 x float> %broadcast.splat67, %wide.load.prol, !dbg !733
  %17 = fmul <4 x float> %broadcast.splat67, %wide.load65.prol, !dbg !733
  %18 = bitcast float* %next.gep.prol to <4 x float>*, !dbg !733
  store <4 x float> %16, <4 x float>* %18, align 4, !dbg !733, !tbaa !152
  %19 = bitcast float* %14 to <4 x float>*, !dbg !733
  store <4 x float> %17, <4 x float>* %19, align 4, !dbg !733, !tbaa !152
  %index.next.prol = add i64 %index.prol, 8, !dbg !731
  %20 = icmp eq i64 %index.next.prol, %n.vec, !dbg !731
  %prol.iter87.sub = sub i64 %prol.iter87, 1, !dbg !731
  %prol.iter87.cmp = icmp ne i64 %prol.iter87.sub, 0, !dbg !731
  br i1 %prol.iter87.cmp, label %vector.body.prol, label %vector.ph.split, !llvm.loop !734

vector.ph.split:                                  ; preds = %vector.body.prol, %vector.ph
  %index.unr = phi i64 [ 0, %vector.ph ], [ %index.next.prol, %vector.body.prol ]
  %21 = icmp ult i64 %12, 2
  br i1 %21, label %middle.block.loopexit, label %vector.ph.split.split

vector.ph.split.split:                            ; preds = %vector.ph.split
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph.split.split
  %index = phi i64 [ %index.unr, %vector.ph.split.split ], [ %index.next.1, %vector.body ], !dbg !731
  %next.gep = getelementptr float* %sx, i64 %index
  %22 = bitcast float* %next.gep to <4 x float>*, !dbg !733
  %wide.load = load <4 x float>* %22, align 4, !dbg !733, !tbaa !152
  %next.gep.sum77 = or i64 %index, 4, !dbg !733
  %23 = getelementptr float* %sx, i64 %next.gep.sum77, !dbg !733
  %24 = bitcast float* %23 to <4 x float>*, !dbg !733
  %wide.load65 = load <4 x float>* %24, align 4, !dbg !733, !tbaa !152
  %25 = fmul <4 x float> %broadcast.splat67, %wide.load, !dbg !733
  %26 = fmul <4 x float> %broadcast.splat67, %wide.load65, !dbg !733
  %27 = bitcast float* %next.gep to <4 x float>*, !dbg !733
  store <4 x float> %25, <4 x float>* %27, align 4, !dbg !733, !tbaa !152
  %28 = bitcast float* %23 to <4 x float>*, !dbg !733
  store <4 x float> %26, <4 x float>* %28, align 4, !dbg !733, !tbaa !152
  %index.next = add i64 %index, 8, !dbg !731
  %next.gep.1 = getelementptr float* %sx, i64 %index.next
  %29 = bitcast float* %next.gep.1 to <4 x float>*, !dbg !733
  %wide.load.1 = load <4 x float>* %29, align 4, !dbg !733, !tbaa !152
  %next.gep.sum77.1 = or i64 %index.next, 4, !dbg !733
  %30 = getelementptr float* %sx, i64 %next.gep.sum77.1, !dbg !733
  %31 = bitcast float* %30 to <4 x float>*, !dbg !733
  %wide.load65.1 = load <4 x float>* %31, align 4, !dbg !733, !tbaa !152
  %32 = fmul <4 x float> %broadcast.splat67, %wide.load.1, !dbg !733
  %33 = fmul <4 x float> %broadcast.splat67, %wide.load65.1, !dbg !733
  %34 = bitcast float* %next.gep.1 to <4 x float>*, !dbg !733
  store <4 x float> %32, <4 x float>* %34, align 4, !dbg !733, !tbaa !152
  %35 = bitcast float* %30 to <4 x float>*, !dbg !733
  store <4 x float> %33, <4 x float>* %35, align 4, !dbg !733, !tbaa !152
  %index.next.1 = add i64 %index.next, 8, !dbg !731
  %36 = icmp eq i64 %index.next.1, %n.vec, !dbg !731
  br i1 %36, label %middle.block.loopexit.unr-lcssa, label %vector.body, !dbg !731, !llvm.loop !735

middle.block.loopexit.unr-lcssa:                  ; preds = %vector.body
  br label %middle.block.loopexit

middle.block.loopexit:                            ; preds = %vector.ph.split, %middle.block.loopexit.unr-lcssa
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %for.body13.lr.ph
  %resume.val = phi i64 [ 0, %for.body13.lr.ph ], [ %n.vec, %middle.block.loopexit ]
  %trunc.resume.val = phi i32 [ 0, %for.body13.lr.ph ], [ %4, %middle.block.loopexit ]
  %resume.val41 = phi float* [ %sx, %for.body13.lr.ph ], [ %ptr.ind.end, %middle.block.loopexit ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %return, label %for.body13.preheader

for.body13.preheader:                             ; preds = %middle.block
  %37 = sub i32 %n, %trunc.resume.val
  %xtraiter = and i32 %37, 3
  %lcmp.mod = icmp ne i32 %xtraiter, 0
  %lcmp.overflow = icmp eq i32 %37, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %for.body13.prol, label %for.body13.preheader.split

for.body13.prol:                                  ; preds = %for.body13.prol, %for.body13.preheader
  %i.135.prol = phi i32 [ %inc16.prol, %for.body13.prol ], [ %trunc.resume.val, %for.body13.preheader ]
  %sx.addr.234.prol = phi float* [ %incdec.ptr.prol, %for.body13.prol ], [ %resume.val41, %for.body13.preheader ]
  %prol.iter = phi i32 [ %xtraiter, %for.body13.preheader ], [ %prol.iter.sub, %for.body13.prol ]
  %38 = load float* %sx.addr.234.prol, align 4, !dbg !733, !tbaa !152
  %mul14.prol = fmul float %sa, %38, !dbg !733
  store float %mul14.prol, float* %sx.addr.234.prol, align 4, !dbg !733, !tbaa !152
  %inc16.prol = add nuw nsw i32 %i.135.prol, 1, !dbg !731
  tail call void @llvm.dbg.value(metadata i32 %inc16.prol, i64 0, metadata !109, metadata !131), !dbg !736
  %incdec.ptr.prol = getelementptr inbounds float* %sx.addr.234.prol, i64 1, !dbg !737
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr.prol, i64 0, metadata !107, metadata !131), !dbg !721
  %exitcond.prol = icmp eq i32 %i.135.prol, %1, !dbg !729
  %prol.iter.sub = sub i32 %prol.iter, 1, !dbg !729
  %prol.iter.cmp = icmp ne i32 %prol.iter.sub, 0, !dbg !729
  br i1 %prol.iter.cmp, label %for.body13.prol, label %for.body13.preheader.split, !llvm.loop !738

for.body13.preheader.split:                       ; preds = %for.body13.prol, %for.body13.preheader
  %i.135.unr = phi i32 [ %trunc.resume.val, %for.body13.preheader ], [ %inc16.prol, %for.body13.prol ]
  %sx.addr.234.unr = phi float* [ %resume.val41, %for.body13.preheader ], [ %incdec.ptr.prol, %for.body13.prol ]
  %39 = icmp ult i32 %37, 4
  br i1 %39, label %return.loopexit, label %for.body13.preheader.split.split

for.body13.preheader.split.split:                 ; preds = %for.body13.preheader.split
  br label %for.body13, !dbg !733

if.then2:                                         ; preds = %if.end
  %cmp3 = icmp slt i32 %incx, 0, !dbg !739
  br i1 %cmp3, label %if.then4, label %for.body.lr.ph, !dbg !742

if.then4:                                         ; preds = %if.then2
  %add = sub i32 1, %n, !dbg !743
  %mul = mul nsw i32 %add, %incx, !dbg !744
  %idx.ext = sext i32 %mul to i64, !dbg !745
  %add.ptr = getelementptr inbounds float* %sx, i64 %idx.ext, !dbg !745
  tail call void @llvm.dbg.value(metadata float* %add.ptr, i64 0, metadata !107, metadata !131), !dbg !721
  br label %for.body.lr.ph, !dbg !745

for.body.lr.ph:                                   ; preds = %if.then2, %if.then4
  %sx.addr.1.ph = phi float* [ %sx, %if.then2 ], [ %add.ptr, %if.then4 ]
  %idx.ext8 = sext i32 %incx to i64, !dbg !746
  %40 = add i32 %n, -1, !dbg !749
  %xtraiter88 = and i32 %n, 3
  %lcmp.mod89 = icmp ne i32 %xtraiter88, 0
  %lcmp.overflow90 = icmp eq i32 %n, 0
  %lcmp.or91 = or i1 %lcmp.overflow90, %lcmp.mod89
  br i1 %lcmp.or91, label %for.body.prol, label %for.body.lr.ph.split

for.body.prol:                                    ; preds = %for.body.prol, %for.body.lr.ph
  %i.038.prol = phi i32 [ 0, %for.body.lr.ph ], [ %inc.prol, %for.body.prol ]
  %sx.addr.137.prol = phi float* [ %sx.addr.1.ph, %for.body.lr.ph ], [ %add.ptr9.prol, %for.body.prol ]
  %prol.iter92 = phi i32 [ %xtraiter88, %for.body.lr.ph ], [ %prol.iter92.sub, %for.body.prol ]
  %41 = load float* %sx.addr.137.prol, align 4, !dbg !750, !tbaa !152
  %mul7.prol = fmul float %sa, %41, !dbg !750
  store float %mul7.prol, float* %sx.addr.137.prol, align 4, !dbg !750, !tbaa !152
  %inc.prol = add nuw nsw i32 %i.038.prol, 1, !dbg !751
  tail call void @llvm.dbg.value(metadata i32 %inc.prol, i64 0, metadata !109, metadata !131), !dbg !736
  %add.ptr9.prol = getelementptr inbounds float* %sx.addr.137.prol, i64 %idx.ext8, !dbg !746
  tail call void @llvm.dbg.value(metadata float* %add.ptr9.prol, i64 0, metadata !107, metadata !131), !dbg !721
  %exitcond39.prol = icmp eq i32 %i.038.prol, %40, !dbg !749
  %prol.iter92.sub = sub i32 %prol.iter92, 1, !dbg !749
  %prol.iter92.cmp = icmp ne i32 %prol.iter92.sub, 0, !dbg !749
  br i1 %prol.iter92.cmp, label %for.body.prol, label %for.body.lr.ph.split, !llvm.loop !752

for.body.lr.ph.split:                             ; preds = %for.body.prol, %for.body.lr.ph
  %i.038.unr = phi i32 [ 0, %for.body.lr.ph ], [ %inc.prol, %for.body.prol ]
  %sx.addr.137.unr = phi float* [ %sx.addr.1.ph, %for.body.lr.ph ], [ %add.ptr9.prol, %for.body.prol ]
  %42 = icmp ult i32 %n, 4
  br i1 %42, label %return.loopexit82, label %for.body.lr.ph.split.split

for.body.lr.ph.split.split:                       ; preds = %for.body.lr.ph.split
  br label %for.body, !dbg !749

for.body:                                         ; preds = %for.body, %for.body.lr.ph.split.split
  %i.038 = phi i32 [ %i.038.unr, %for.body.lr.ph.split.split ], [ %inc.3, %for.body ]
  %sx.addr.137 = phi float* [ %sx.addr.137.unr, %for.body.lr.ph.split.split ], [ %add.ptr9.3, %for.body ]
  %43 = load float* %sx.addr.137, align 4, !dbg !750, !tbaa !152
  %mul7 = fmul float %sa, %43, !dbg !750
  store float %mul7, float* %sx.addr.137, align 4, !dbg !750, !tbaa !152
  %inc = add nuw nsw i32 %i.038, 1, !dbg !751
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !109, metadata !131), !dbg !736
  %add.ptr9 = getelementptr inbounds float* %sx.addr.137, i64 %idx.ext8, !dbg !746
  tail call void @llvm.dbg.value(metadata float* %add.ptr9, i64 0, metadata !107, metadata !131), !dbg !721
  %44 = load float* %add.ptr9, align 4, !dbg !750, !tbaa !152
  %mul7.1 = fmul float %sa, %44, !dbg !750
  store float %mul7.1, float* %add.ptr9, align 4, !dbg !750, !tbaa !152
  %inc.1 = add nuw nsw i32 %inc, 1, !dbg !751
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !109, metadata !131), !dbg !736
  %add.ptr9.1 = getelementptr inbounds float* %add.ptr9, i64 %idx.ext8, !dbg !746
  tail call void @llvm.dbg.value(metadata float* %add.ptr9, i64 0, metadata !107, metadata !131), !dbg !721
  %45 = load float* %add.ptr9.1, align 4, !dbg !750, !tbaa !152
  %mul7.2 = fmul float %sa, %45, !dbg !750
  store float %mul7.2, float* %add.ptr9.1, align 4, !dbg !750, !tbaa !152
  %inc.2 = add nuw nsw i32 %inc.1, 1, !dbg !751
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !109, metadata !131), !dbg !736
  %add.ptr9.2 = getelementptr inbounds float* %add.ptr9.1, i64 %idx.ext8, !dbg !746
  tail call void @llvm.dbg.value(metadata float* %add.ptr9, i64 0, metadata !107, metadata !131), !dbg !721
  %46 = load float* %add.ptr9.2, align 4, !dbg !750, !tbaa !152
  %mul7.3 = fmul float %sa, %46, !dbg !750
  store float %mul7.3, float* %add.ptr9.2, align 4, !dbg !750, !tbaa !152
  %inc.3 = add nuw nsw i32 %inc.2, 1, !dbg !751
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !109, metadata !131), !dbg !736
  %add.ptr9.3 = getelementptr inbounds float* %add.ptr9.2, i64 %idx.ext8, !dbg !746
  tail call void @llvm.dbg.value(metadata float* %add.ptr9, i64 0, metadata !107, metadata !131), !dbg !721
  %exitcond39.3 = icmp eq i32 %inc.2, %40, !dbg !749
  br i1 %exitcond39.3, label %return.loopexit82.unr-lcssa, label %for.body, !dbg !749

for.body13:                                       ; preds = %for.body13, %for.body13.preheader.split.split
  %i.135 = phi i32 [ %i.135.unr, %for.body13.preheader.split.split ], [ %inc16.3, %for.body13 ]
  %sx.addr.234 = phi float* [ %sx.addr.234.unr, %for.body13.preheader.split.split ], [ %incdec.ptr.3, %for.body13 ]
  %47 = load float* %sx.addr.234, align 4, !dbg !733, !tbaa !152
  %mul14 = fmul float %sa, %47, !dbg !733
  store float %mul14, float* %sx.addr.234, align 4, !dbg !733, !tbaa !152
  %inc16 = add nuw nsw i32 %i.135, 1, !dbg !731
  tail call void @llvm.dbg.value(metadata i32 %inc16, i64 0, metadata !109, metadata !131), !dbg !736
  %incdec.ptr = getelementptr inbounds float* %sx.addr.234, i64 1, !dbg !737
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr, i64 0, metadata !107, metadata !131), !dbg !721
  %48 = load float* %incdec.ptr, align 4, !dbg !733, !tbaa !152
  %mul14.1 = fmul float %sa, %48, !dbg !733
  store float %mul14.1, float* %incdec.ptr, align 4, !dbg !733, !tbaa !152
  %inc16.1 = add nuw nsw i32 %inc16, 1, !dbg !731
  tail call void @llvm.dbg.value(metadata i32 %inc16, i64 0, metadata !109, metadata !131), !dbg !736
  %incdec.ptr.1 = getelementptr inbounds float* %incdec.ptr, i64 1, !dbg !737
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr, i64 0, metadata !107, metadata !131), !dbg !721
  %49 = load float* %incdec.ptr.1, align 4, !dbg !733, !tbaa !152
  %mul14.2 = fmul float %sa, %49, !dbg !733
  store float %mul14.2, float* %incdec.ptr.1, align 4, !dbg !733, !tbaa !152
  %inc16.2 = add nuw nsw i32 %inc16.1, 1, !dbg !731
  tail call void @llvm.dbg.value(metadata i32 %inc16, i64 0, metadata !109, metadata !131), !dbg !736
  %incdec.ptr.2 = getelementptr inbounds float* %incdec.ptr.1, i64 1, !dbg !737
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr, i64 0, metadata !107, metadata !131), !dbg !721
  %50 = load float* %incdec.ptr.2, align 4, !dbg !733, !tbaa !152
  %mul14.3 = fmul float %sa, %50, !dbg !733
  store float %mul14.3, float* %incdec.ptr.2, align 4, !dbg !733, !tbaa !152
  %inc16.3 = add nuw nsw i32 %inc16.2, 1, !dbg !731
  tail call void @llvm.dbg.value(metadata i32 %inc16, i64 0, metadata !109, metadata !131), !dbg !736
  %incdec.ptr.3 = getelementptr inbounds float* %incdec.ptr.2, i64 1, !dbg !737
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr, i64 0, metadata !107, metadata !131), !dbg !721
  %exitcond.3 = icmp eq i32 %inc16.2, %1, !dbg !729
  br i1 %exitcond.3, label %return.loopexit.unr-lcssa, label %for.body13, !dbg !729, !llvm.loop !753

return.loopexit.unr-lcssa:                        ; preds = %for.body13
  br label %return.loopexit

return.loopexit:                                  ; preds = %for.body13.preheader.split, %return.loopexit.unr-lcssa
  br label %return

return.loopexit82.unr-lcssa:                      ; preds = %for.body
  br label %return.loopexit82

return.loopexit82:                                ; preds = %for.body.lr.ph.split, %return.loopexit82.unr-lcssa
  br label %return

return:                                           ; preds = %return.loopexit82, %return.loopexit, %middle.block, %entry
  %retval.0 = phi i32 [ 1, %entry ], [ 0, %middle.block ], [ 0, %return.loopexit ], [ 0, %return.loopexit82 ]
  ret i32 %retval.0, !dbg !754
}

; Function Attrs: nounwind uwtable
define void @vexopy(i32 %n, float* nocapture %v, float* nocapture readonly %x, float* nocapture readonly %y, i32 %itype) #1 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %n, i64 0, metadata !114, metadata !131), !dbg !755
  tail call void @llvm.dbg.value(metadata float* %v, i64 0, metadata !115, metadata !131), !dbg !756
  tail call void @llvm.dbg.value(metadata float* %x, i64 0, metadata !116, metadata !131), !dbg !757
  tail call void @llvm.dbg.value(metadata float* %y, i64 0, metadata !117, metadata !131), !dbg !758
  tail call void @llvm.dbg.value(metadata i32 %itype, i64 0, metadata !118, metadata !131), !dbg !759
  %cmp = icmp slt i32 %n, 1, !dbg !760
  br i1 %cmp, label %if.end15, label %if.end, !dbg !762

if.end:                                           ; preds = %entry
  %cmp1 = icmp eq i32 %itype, 1, !dbg !763
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !119, metadata !131), !dbg !765
  %0 = add i32 %n, -1, !dbg !766
  %1 = add i32 %n, -1, !dbg !768
  %2 = zext i32 %1 to i64
  %3 = add nuw nsw i64 %2, 1, !dbg !768
  %end.idx107 = add nuw nsw i64 %2, 1, !dbg !770
  %n.vec109 = and i64 %3, 8589934588, !dbg !770
  %cmp.zero111 = icmp eq i64 %n.vec109, 0, !dbg !770
  %4 = add i32 %n, -1
  %5 = zext i32 %4 to i64
  %scevgep113 = getelementptr float* %v, i64 %5
  br i1 %cmp1, label %overflow.checked112, label %overflow.checked, !dbg !771

overflow.checked:                                 ; preds = %if.end
  br i1 %cmp.zero111, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %overflow.checked
  %scevgep46 = getelementptr float* %x, i64 %5
  %bound0 = icmp uge float* %scevgep46, %v
  %bound1 = icmp uge float* %scevgep113, %x
  %found.conflict = and i1 %bound0, %bound1
  %scevgep49 = getelementptr float* %y, i64 %5
  %bound051 = icmp uge float* %scevgep49, %v
  %bound152 = icmp uge float* %scevgep113, %y
  %found.conflict53 = and i1 %bound051, %bound152
  %conflict.rdx = or i1 %found.conflict, %found.conflict53
  %6 = trunc i64 %n.vec109 to i32
  %ptr.ind.end = getelementptr float* %v, i64 %n.vec109
  %ptr.ind.end58 = getelementptr float* %y, i64 %n.vec109
  %ptr.ind.end61 = getelementptr float* %x, i64 %n.vec109
  br i1 %conflict.rdx, label %middle.block, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %7 = add i32 %n, -1
  %8 = zext i32 %7 to i64
  %9 = add i64 %8, 1
  %10 = lshr i64 %9, 2
  %11 = mul i64 %10, 4
  %12 = add i64 %11, -4
  %13 = lshr i64 %12, 2
  %14 = add i64 %13, 1
  %xtraiter230 = and i64 %14, 1
  %lcmp.mod231 = icmp ne i64 %xtraiter230, 0
  %lcmp.overflow232 = icmp eq i64 %14, 0
  %lcmp.or233 = or i1 %lcmp.overflow232, %lcmp.mod231
  br i1 %lcmp.or233, label %vector.body.prol, label %vector.body.preheader.split

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.preheader ], !dbg !772
  %prol.iter234 = phi i64 [ %xtraiter230, %vector.body.preheader ], [ %prol.iter234.sub, %vector.body.prol ]
  %next.gep.prol = getelementptr float* %v, i64 %index.prol
  %next.gep73.prol = getelementptr float* %y, i64 %index.prol
  %next.gep86.prol = getelementptr float* %x, i64 %index.prol
  %15 = bitcast float* %next.gep86.prol to <4 x float>*, !dbg !775
  %wide.load.prol = load <4 x float>* %15, align 4, !dbg !775, !tbaa !152
  %16 = bitcast float* %next.gep73.prol to <4 x float>*, !dbg !776
  %wide.load97.prol = load <4 x float>* %16, align 4, !dbg !776, !tbaa !152
  %17 = fsub <4 x float> %wide.load.prol, %wide.load97.prol, !dbg !775
  %18 = bitcast float* %next.gep.prol to <4 x float>*, !dbg !777
  store <4 x float> %17, <4 x float>* %18, align 4, !dbg !777, !tbaa !152
  %index.next.prol = add i64 %index.prol, 4, !dbg !772
  %19 = icmp eq i64 %index.next.prol, %n.vec109, !dbg !772
  %prol.iter234.sub = sub i64 %prol.iter234, 1, !dbg !772
  %prol.iter234.cmp = icmp ne i64 %prol.iter234.sub, 0, !dbg !772
  br i1 %prol.iter234.cmp, label %vector.body.prol, label %vector.body.preheader.split, !llvm.loop !778

vector.body.preheader.split:                      ; preds = %vector.body.prol, %vector.body.preheader
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol ]
  %20 = icmp ult i64 %14, 2
  br i1 %20, label %middle.block.loopexit, label %vector.body.preheader.split.split

vector.body.preheader.split.split:                ; preds = %vector.body.preheader.split
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.split.split
  %index = phi i64 [ %index.unr, %vector.body.preheader.split.split ], [ %index.next.1, %vector.body ], !dbg !772
  %next.gep = getelementptr float* %v, i64 %index
  %next.gep73 = getelementptr float* %y, i64 %index
  %next.gep86 = getelementptr float* %x, i64 %index
  %21 = bitcast float* %next.gep86 to <4 x float>*, !dbg !775
  %wide.load = load <4 x float>* %21, align 4, !dbg !775, !tbaa !152
  %22 = bitcast float* %next.gep73 to <4 x float>*, !dbg !776
  %wide.load97 = load <4 x float>* %22, align 4, !dbg !776, !tbaa !152
  %23 = fsub <4 x float> %wide.load, %wide.load97, !dbg !775
  %24 = bitcast float* %next.gep to <4 x float>*, !dbg !777
  store <4 x float> %23, <4 x float>* %24, align 4, !dbg !777, !tbaa !152
  %index.next = add i64 %index, 4, !dbg !772
  %next.gep.1 = getelementptr float* %v, i64 %index.next
  %next.gep73.1 = getelementptr float* %y, i64 %index.next
  %next.gep86.1 = getelementptr float* %x, i64 %index.next
  %25 = bitcast float* %next.gep86.1 to <4 x float>*, !dbg !775
  %wide.load.1 = load <4 x float>* %25, align 4, !dbg !775, !tbaa !152
  %26 = bitcast float* %next.gep73.1 to <4 x float>*, !dbg !776
  %wide.load97.1 = load <4 x float>* %26, align 4, !dbg !776, !tbaa !152
  %27 = fsub <4 x float> %wide.load.1, %wide.load97.1, !dbg !775
  %28 = bitcast float* %next.gep.1 to <4 x float>*, !dbg !777
  store <4 x float> %27, <4 x float>* %28, align 4, !dbg !777, !tbaa !152
  %index.next.1 = add i64 %index.next, 4, !dbg !772
  %29 = icmp eq i64 %index.next.1, %n.vec109, !dbg !772
  br i1 %29, label %middle.block.loopexit.unr-lcssa, label %vector.body, !dbg !772, !llvm.loop !779

middle.block.loopexit.unr-lcssa:                  ; preds = %vector.body
  br label %middle.block.loopexit

middle.block.loopexit:                            ; preds = %vector.body.preheader.split, %middle.block.loopexit.unr-lcssa
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %vector.memcheck, %overflow.checked
  %resume.val = phi i64 [ 0, %overflow.checked ], [ 0, %vector.memcheck ], [ %n.vec109, %middle.block.loopexit ]
  %trunc.resume.val = phi i32 [ 0, %overflow.checked ], [ 0, %vector.memcheck ], [ %6, %middle.block.loopexit ]
  %resume.val54 = phi float* [ %v, %overflow.checked ], [ %v, %vector.memcheck ], [ %ptr.ind.end, %middle.block.loopexit ]
  %resume.val56 = phi float* [ %y, %overflow.checked ], [ %y, %vector.memcheck ], [ %ptr.ind.end58, %middle.block.loopexit ]
  %resume.val59 = phi float* [ %x, %overflow.checked ], [ %x, %vector.memcheck ], [ %ptr.ind.end61, %middle.block.loopexit ]
  %cmp.n = icmp eq i64 %end.idx107, %resume.val
  br i1 %cmp.n, label %if.end15, label %for.body8.preheader

for.body8.preheader:                              ; preds = %middle.block
  %30 = sub i32 %n, %trunc.resume.val
  %xtraiter225 = and i32 %30, 3
  %lcmp.mod226 = icmp ne i32 %xtraiter225, 0
  %lcmp.overflow227 = icmp eq i32 %30, 0
  %lcmp.or228 = or i1 %lcmp.overflow227, %lcmp.mod226
  br i1 %lcmp.or228, label %for.body8.prol, label %for.body8.preheader.split

for.body8.prol:                                   ; preds = %for.body8.prol, %for.body8.preheader
  %i.140.prol = phi i32 [ %inc10.prol, %for.body8.prol ], [ %trunc.resume.val, %for.body8.preheader ]
  %v.addr.139.prol = phi float* [ %incdec.ptr13.prol, %for.body8.prol ], [ %resume.val54, %for.body8.preheader ]
  %y.addr.138.prol = phi float* [ %incdec.ptr12.prol, %for.body8.prol ], [ %resume.val56, %for.body8.preheader ]
  %x.addr.137.prol = phi float* [ %incdec.ptr11.prol, %for.body8.prol ], [ %resume.val59, %for.body8.preheader ]
  %prol.iter229 = phi i32 [ %xtraiter225, %for.body8.preheader ], [ %prol.iter229.sub, %for.body8.prol ]
  %31 = load float* %x.addr.137.prol, align 4, !dbg !775, !tbaa !152
  %32 = load float* %y.addr.138.prol, align 4, !dbg !776, !tbaa !152
  %sub.prol = fsub float %31, %32, !dbg !775
  store float %sub.prol, float* %v.addr.139.prol, align 4, !dbg !777, !tbaa !152
  %inc10.prol = add nuw nsw i32 %i.140.prol, 1, !dbg !772
  tail call void @llvm.dbg.value(metadata i32 %inc10.prol, i64 0, metadata !119, metadata !131), !dbg !765
  %incdec.ptr11.prol = getelementptr inbounds float* %x.addr.137.prol, i64 1, !dbg !780
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr11.prol, i64 0, metadata !116, metadata !131), !dbg !757
  %incdec.ptr12.prol = getelementptr inbounds float* %y.addr.138.prol, i64 1, !dbg !781
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr12.prol, i64 0, metadata !117, metadata !131), !dbg !758
  %incdec.ptr13.prol = getelementptr inbounds float* %v.addr.139.prol, i64 1, !dbg !782
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr13.prol, i64 0, metadata !115, metadata !131), !dbg !756
  %exitcond41.prol = icmp eq i32 %i.140.prol, %0, !dbg !783
  %prol.iter229.sub = sub i32 %prol.iter229, 1, !dbg !783
  %prol.iter229.cmp = icmp ne i32 %prol.iter229.sub, 0, !dbg !783
  br i1 %prol.iter229.cmp, label %for.body8.prol, label %for.body8.preheader.split, !llvm.loop !784

for.body8.preheader.split:                        ; preds = %for.body8.prol, %for.body8.preheader
  %i.140.unr = phi i32 [ %trunc.resume.val, %for.body8.preheader ], [ %inc10.prol, %for.body8.prol ]
  %v.addr.139.unr = phi float* [ %resume.val54, %for.body8.preheader ], [ %incdec.ptr13.prol, %for.body8.prol ]
  %y.addr.138.unr = phi float* [ %resume.val56, %for.body8.preheader ], [ %incdec.ptr12.prol, %for.body8.prol ]
  %x.addr.137.unr = phi float* [ %resume.val59, %for.body8.preheader ], [ %incdec.ptr11.prol, %for.body8.prol ]
  %33 = icmp ult i32 %30, 4
  br i1 %33, label %if.end15.loopexit219, label %for.body8.preheader.split.split

for.body8.preheader.split.split:                  ; preds = %for.body8.preheader.split
  br label %for.body8, !dbg !775

overflow.checked112:                              ; preds = %if.end
  br i1 %cmp.zero111, label %middle.block104, label %vector.memcheck127

vector.memcheck127:                               ; preds = %overflow.checked112
  %scevgep115 = getelementptr float* %x, i64 %5
  %bound0119 = icmp uge float* %scevgep115, %v
  %bound1120 = icmp uge float* %scevgep113, %x
  %found.conflict121 = and i1 %bound0119, %bound1120
  %scevgep117 = getelementptr float* %y, i64 %5
  %bound0122 = icmp uge float* %scevgep117, %v
  %bound1123 = icmp uge float* %scevgep113, %y
  %found.conflict124 = and i1 %bound0122, %bound1123
  %conflict.rdx125 = or i1 %found.conflict121, %found.conflict124
  %34 = trunc i64 %n.vec109 to i32
  %ptr.ind.end134 = getelementptr float* %v, i64 %n.vec109
  %ptr.ind.end137 = getelementptr float* %y, i64 %n.vec109
  %ptr.ind.end140 = getelementptr float* %x, i64 %n.vec109
  br i1 %conflict.rdx125, label %middle.block104, label %vector.body103.preheader

vector.body103.preheader:                         ; preds = %vector.memcheck127
  %35 = add i32 %n, -1
  %36 = zext i32 %35 to i64
  %37 = add i64 %36, 1
  %38 = lshr i64 %37, 2
  %39 = mul i64 %38, 4
  %40 = add i64 %39, -4
  %41 = lshr i64 %40, 2
  %42 = add i64 %41, 1
  %xtraiter220 = and i64 %42, 1
  %lcmp.mod221 = icmp ne i64 %xtraiter220, 0
  %lcmp.overflow222 = icmp eq i64 %42, 0
  %lcmp.or223 = or i1 %lcmp.overflow222, %lcmp.mod221
  br i1 %lcmp.or223, label %vector.body103.prol, label %vector.body103.preheader.split

vector.body103.prol:                              ; preds = %vector.body103.prol, %vector.body103.preheader
  %index106.prol = phi i64 [ %index.next142.prol, %vector.body103.prol ], [ 0, %vector.body103.preheader ], !dbg !770
  %prol.iter224 = phi i64 [ %xtraiter220, %vector.body103.preheader ], [ %prol.iter224.sub, %vector.body103.prol ]
  %next.gep148.prol = getelementptr float* %v, i64 %index106.prol
  %next.gep161.prol = getelementptr float* %y, i64 %index106.prol
  %next.gep174.prol = getelementptr float* %x, i64 %index106.prol
  %43 = bitcast float* %next.gep174.prol to <4 x float>*, !dbg !768
  %wide.load185.prol = load <4 x float>* %43, align 4, !dbg !768, !tbaa !152
  %44 = bitcast float* %next.gep161.prol to <4 x float>*, !dbg !785
  %wide.load186.prol = load <4 x float>* %44, align 4, !dbg !785, !tbaa !152
  %45 = fadd <4 x float> %wide.load185.prol, %wide.load186.prol, !dbg !768
  %46 = bitcast float* %next.gep148.prol to <4 x float>*, !dbg !786
  store <4 x float> %45, <4 x float>* %46, align 4, !dbg !786, !tbaa !152
  %index.next142.prol = add i64 %index106.prol, 4, !dbg !770
  %47 = icmp eq i64 %index.next142.prol, %n.vec109, !dbg !770
  %prol.iter224.sub = sub i64 %prol.iter224, 1, !dbg !770
  %prol.iter224.cmp = icmp ne i64 %prol.iter224.sub, 0, !dbg !770
  br i1 %prol.iter224.cmp, label %vector.body103.prol, label %vector.body103.preheader.split, !llvm.loop !787

vector.body103.preheader.split:                   ; preds = %vector.body103.prol, %vector.body103.preheader
  %index106.unr = phi i64 [ 0, %vector.body103.preheader ], [ %index.next142.prol, %vector.body103.prol ]
  %48 = icmp ult i64 %42, 2
  br i1 %48, label %middle.block104.loopexit, label %vector.body103.preheader.split.split

vector.body103.preheader.split.split:             ; preds = %vector.body103.preheader.split
  br label %vector.body103

vector.body103:                                   ; preds = %vector.body103, %vector.body103.preheader.split.split
  %index106 = phi i64 [ %index106.unr, %vector.body103.preheader.split.split ], [ %index.next142.1, %vector.body103 ], !dbg !770
  %next.gep148 = getelementptr float* %v, i64 %index106
  %next.gep161 = getelementptr float* %y, i64 %index106
  %next.gep174 = getelementptr float* %x, i64 %index106
  %49 = bitcast float* %next.gep174 to <4 x float>*, !dbg !768
  %wide.load185 = load <4 x float>* %49, align 4, !dbg !768, !tbaa !152
  %50 = bitcast float* %next.gep161 to <4 x float>*, !dbg !785
  %wide.load186 = load <4 x float>* %50, align 4, !dbg !785, !tbaa !152
  %51 = fadd <4 x float> %wide.load185, %wide.load186, !dbg !768
  %52 = bitcast float* %next.gep148 to <4 x float>*, !dbg !786
  store <4 x float> %51, <4 x float>* %52, align 4, !dbg !786, !tbaa !152
  %index.next142 = add i64 %index106, 4, !dbg !770
  %next.gep148.1 = getelementptr float* %v, i64 %index.next142
  %next.gep161.1 = getelementptr float* %y, i64 %index.next142
  %next.gep174.1 = getelementptr float* %x, i64 %index.next142
  %53 = bitcast float* %next.gep174.1 to <4 x float>*, !dbg !768
  %wide.load185.1 = load <4 x float>* %53, align 4, !dbg !768, !tbaa !152
  %54 = bitcast float* %next.gep161.1 to <4 x float>*, !dbg !785
  %wide.load186.1 = load <4 x float>* %54, align 4, !dbg !785, !tbaa !152
  %55 = fadd <4 x float> %wide.load185.1, %wide.load186.1, !dbg !768
  %56 = bitcast float* %next.gep148.1 to <4 x float>*, !dbg !786
  store <4 x float> %55, <4 x float>* %56, align 4, !dbg !786, !tbaa !152
  %index.next142.1 = add i64 %index.next142, 4, !dbg !770
  %57 = icmp eq i64 %index.next142.1, %n.vec109, !dbg !770
  br i1 %57, label %middle.block104.loopexit.unr-lcssa, label %vector.body103, !dbg !770, !llvm.loop !788

middle.block104.loopexit.unr-lcssa:               ; preds = %vector.body103
  br label %middle.block104.loopexit

middle.block104.loopexit:                         ; preds = %vector.body103.preheader.split, %middle.block104.loopexit.unr-lcssa
  br label %middle.block104

middle.block104:                                  ; preds = %middle.block104.loopexit, %vector.memcheck127, %overflow.checked112
  %resume.val128 = phi i64 [ 0, %overflow.checked112 ], [ 0, %vector.memcheck127 ], [ %n.vec109, %middle.block104.loopexit ]
  %trunc.resume.val129 = phi i32 [ 0, %overflow.checked112 ], [ 0, %vector.memcheck127 ], [ %34, %middle.block104.loopexit ]
  %resume.val132 = phi float* [ %v, %overflow.checked112 ], [ %v, %vector.memcheck127 ], [ %ptr.ind.end134, %middle.block104.loopexit ]
  %resume.val135 = phi float* [ %y, %overflow.checked112 ], [ %y, %vector.memcheck127 ], [ %ptr.ind.end137, %middle.block104.loopexit ]
  %resume.val138 = phi float* [ %x, %overflow.checked112 ], [ %x, %vector.memcheck127 ], [ %ptr.ind.end140, %middle.block104.loopexit ]
  %cmp.n141 = icmp eq i64 %end.idx107, %resume.val128
  br i1 %cmp.n141, label %if.end15, label %for.body.preheader

for.body.preheader:                               ; preds = %middle.block104
  %58 = sub i32 %n, %trunc.resume.val129
  %xtraiter = and i32 %58, 3
  %lcmp.mod = icmp ne i32 %xtraiter, 0
  %lcmp.overflow = icmp eq i32 %58, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %for.body.prol, label %for.body.preheader.split

for.body.prol:                                    ; preds = %for.body.prol, %for.body.preheader
  %i.035.prol = phi i32 [ %inc.prol, %for.body.prol ], [ %trunc.resume.val129, %for.body.preheader ]
  %v.addr.034.prol = phi float* [ %incdec.ptr5.prol, %for.body.prol ], [ %resume.val132, %for.body.preheader ]
  %y.addr.033.prol = phi float* [ %incdec.ptr4.prol, %for.body.prol ], [ %resume.val135, %for.body.preheader ]
  %x.addr.032.prol = phi float* [ %incdec.ptr.prol, %for.body.prol ], [ %resume.val138, %for.body.preheader ]
  %prol.iter = phi i32 [ %xtraiter, %for.body.preheader ], [ %prol.iter.sub, %for.body.prol ]
  %59 = load float* %x.addr.032.prol, align 4, !dbg !768, !tbaa !152
  %60 = load float* %y.addr.033.prol, align 4, !dbg !785, !tbaa !152
  %add.prol = fadd float %59, %60, !dbg !768
  store float %add.prol, float* %v.addr.034.prol, align 4, !dbg !786, !tbaa !152
  %inc.prol = add nuw nsw i32 %i.035.prol, 1, !dbg !770
  tail call void @llvm.dbg.value(metadata i32 %inc.prol, i64 0, metadata !119, metadata !131), !dbg !765
  %incdec.ptr.prol = getelementptr inbounds float* %x.addr.032.prol, i64 1, !dbg !789
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr.prol, i64 0, metadata !116, metadata !131), !dbg !757
  %incdec.ptr4.prol = getelementptr inbounds float* %y.addr.033.prol, i64 1, !dbg !790
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr4.prol, i64 0, metadata !117, metadata !131), !dbg !758
  %incdec.ptr5.prol = getelementptr inbounds float* %v.addr.034.prol, i64 1, !dbg !791
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr5.prol, i64 0, metadata !115, metadata !131), !dbg !756
  %exitcond.prol = icmp eq i32 %i.035.prol, %0, !dbg !766
  %prol.iter.sub = sub i32 %prol.iter, 1, !dbg !766
  %prol.iter.cmp = icmp ne i32 %prol.iter.sub, 0, !dbg !766
  br i1 %prol.iter.cmp, label %for.body.prol, label %for.body.preheader.split, !llvm.loop !792

for.body.preheader.split:                         ; preds = %for.body.prol, %for.body.preheader
  %i.035.unr = phi i32 [ %trunc.resume.val129, %for.body.preheader ], [ %inc.prol, %for.body.prol ]
  %v.addr.034.unr = phi float* [ %resume.val132, %for.body.preheader ], [ %incdec.ptr5.prol, %for.body.prol ]
  %y.addr.033.unr = phi float* [ %resume.val135, %for.body.preheader ], [ %incdec.ptr4.prol, %for.body.prol ]
  %x.addr.032.unr = phi float* [ %resume.val138, %for.body.preheader ], [ %incdec.ptr.prol, %for.body.prol ]
  %61 = icmp ult i32 %58, 4
  br i1 %61, label %if.end15.loopexit, label %for.body.preheader.split.split

for.body.preheader.split.split:                   ; preds = %for.body.preheader.split
  br label %for.body, !dbg !768

for.body:                                         ; preds = %for.body, %for.body.preheader.split.split
  %i.035 = phi i32 [ %i.035.unr, %for.body.preheader.split.split ], [ %inc.3, %for.body ]
  %v.addr.034 = phi float* [ %v.addr.034.unr, %for.body.preheader.split.split ], [ %incdec.ptr5.3, %for.body ]
  %y.addr.033 = phi float* [ %y.addr.033.unr, %for.body.preheader.split.split ], [ %incdec.ptr4.3, %for.body ]
  %x.addr.032 = phi float* [ %x.addr.032.unr, %for.body.preheader.split.split ], [ %incdec.ptr.3, %for.body ]
  %62 = load float* %x.addr.032, align 4, !dbg !768, !tbaa !152
  %63 = load float* %y.addr.033, align 4, !dbg !785, !tbaa !152
  %add = fadd float %62, %63, !dbg !768
  store float %add, float* %v.addr.034, align 4, !dbg !786, !tbaa !152
  %inc = add nuw nsw i32 %i.035, 1, !dbg !770
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !119, metadata !131), !dbg !765
  %incdec.ptr = getelementptr inbounds float* %x.addr.032, i64 1, !dbg !789
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr, i64 0, metadata !116, metadata !131), !dbg !757
  %incdec.ptr4 = getelementptr inbounds float* %y.addr.033, i64 1, !dbg !790
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr4, i64 0, metadata !117, metadata !131), !dbg !758
  %incdec.ptr5 = getelementptr inbounds float* %v.addr.034, i64 1, !dbg !791
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr5, i64 0, metadata !115, metadata !131), !dbg !756
  %64 = load float* %incdec.ptr, align 4, !dbg !768, !tbaa !152
  %65 = load float* %incdec.ptr4, align 4, !dbg !785, !tbaa !152
  %add.1 = fadd float %64, %65, !dbg !768
  store float %add.1, float* %incdec.ptr5, align 4, !dbg !786, !tbaa !152
  %inc.1 = add nuw nsw i32 %inc, 1, !dbg !770
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !119, metadata !131), !dbg !765
  %incdec.ptr.1 = getelementptr inbounds float* %incdec.ptr, i64 1, !dbg !789
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr, i64 0, metadata !116, metadata !131), !dbg !757
  %incdec.ptr4.1 = getelementptr inbounds float* %incdec.ptr4, i64 1, !dbg !790
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr4, i64 0, metadata !117, metadata !131), !dbg !758
  %incdec.ptr5.1 = getelementptr inbounds float* %incdec.ptr5, i64 1, !dbg !791
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr5, i64 0, metadata !115, metadata !131), !dbg !756
  %66 = load float* %incdec.ptr.1, align 4, !dbg !768, !tbaa !152
  %67 = load float* %incdec.ptr4.1, align 4, !dbg !785, !tbaa !152
  %add.2 = fadd float %66, %67, !dbg !768
  store float %add.2, float* %incdec.ptr5.1, align 4, !dbg !786, !tbaa !152
  %inc.2 = add nuw nsw i32 %inc.1, 1, !dbg !770
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !119, metadata !131), !dbg !765
  %incdec.ptr.2 = getelementptr inbounds float* %incdec.ptr.1, i64 1, !dbg !789
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr, i64 0, metadata !116, metadata !131), !dbg !757
  %incdec.ptr4.2 = getelementptr inbounds float* %incdec.ptr4.1, i64 1, !dbg !790
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr4, i64 0, metadata !117, metadata !131), !dbg !758
  %incdec.ptr5.2 = getelementptr inbounds float* %incdec.ptr5.1, i64 1, !dbg !791
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr5, i64 0, metadata !115, metadata !131), !dbg !756
  %68 = load float* %incdec.ptr.2, align 4, !dbg !768, !tbaa !152
  %69 = load float* %incdec.ptr4.2, align 4, !dbg !785, !tbaa !152
  %add.3 = fadd float %68, %69, !dbg !768
  store float %add.3, float* %incdec.ptr5.2, align 4, !dbg !786, !tbaa !152
  %inc.3 = add nuw nsw i32 %inc.2, 1, !dbg !770
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !119, metadata !131), !dbg !765
  %incdec.ptr.3 = getelementptr inbounds float* %incdec.ptr.2, i64 1, !dbg !789
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr, i64 0, metadata !116, metadata !131), !dbg !757
  %incdec.ptr4.3 = getelementptr inbounds float* %incdec.ptr4.2, i64 1, !dbg !790
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr4, i64 0, metadata !117, metadata !131), !dbg !758
  %incdec.ptr5.3 = getelementptr inbounds float* %incdec.ptr5.2, i64 1, !dbg !791
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr5, i64 0, metadata !115, metadata !131), !dbg !756
  %exitcond.3 = icmp eq i32 %inc.2, %0, !dbg !766
  br i1 %exitcond.3, label %if.end15.loopexit.unr-lcssa, label %for.body, !dbg !766, !llvm.loop !793

for.body8:                                        ; preds = %for.body8, %for.body8.preheader.split.split
  %i.140 = phi i32 [ %i.140.unr, %for.body8.preheader.split.split ], [ %inc10.3, %for.body8 ]
  %v.addr.139 = phi float* [ %v.addr.139.unr, %for.body8.preheader.split.split ], [ %incdec.ptr13.3, %for.body8 ]
  %y.addr.138 = phi float* [ %y.addr.138.unr, %for.body8.preheader.split.split ], [ %incdec.ptr12.3, %for.body8 ]
  %x.addr.137 = phi float* [ %x.addr.137.unr, %for.body8.preheader.split.split ], [ %incdec.ptr11.3, %for.body8 ]
  %70 = load float* %x.addr.137, align 4, !dbg !775, !tbaa !152
  %71 = load float* %y.addr.138, align 4, !dbg !776, !tbaa !152
  %sub = fsub float %70, %71, !dbg !775
  store float %sub, float* %v.addr.139, align 4, !dbg !777, !tbaa !152
  %inc10 = add nuw nsw i32 %i.140, 1, !dbg !772
  tail call void @llvm.dbg.value(metadata i32 %inc10, i64 0, metadata !119, metadata !131), !dbg !765
  %incdec.ptr11 = getelementptr inbounds float* %x.addr.137, i64 1, !dbg !780
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr11, i64 0, metadata !116, metadata !131), !dbg !757
  %incdec.ptr12 = getelementptr inbounds float* %y.addr.138, i64 1, !dbg !781
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr12, i64 0, metadata !117, metadata !131), !dbg !758
  %incdec.ptr13 = getelementptr inbounds float* %v.addr.139, i64 1, !dbg !782
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr13, i64 0, metadata !115, metadata !131), !dbg !756
  %72 = load float* %incdec.ptr11, align 4, !dbg !775, !tbaa !152
  %73 = load float* %incdec.ptr12, align 4, !dbg !776, !tbaa !152
  %sub.1 = fsub float %72, %73, !dbg !775
  store float %sub.1, float* %incdec.ptr13, align 4, !dbg !777, !tbaa !152
  %inc10.1 = add nuw nsw i32 %inc10, 1, !dbg !772
  tail call void @llvm.dbg.value(metadata i32 %inc10, i64 0, metadata !119, metadata !131), !dbg !765
  %incdec.ptr11.1 = getelementptr inbounds float* %incdec.ptr11, i64 1, !dbg !780
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr11, i64 0, metadata !116, metadata !131), !dbg !757
  %incdec.ptr12.1 = getelementptr inbounds float* %incdec.ptr12, i64 1, !dbg !781
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr12, i64 0, metadata !117, metadata !131), !dbg !758
  %incdec.ptr13.1 = getelementptr inbounds float* %incdec.ptr13, i64 1, !dbg !782
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr13, i64 0, metadata !115, metadata !131), !dbg !756
  %74 = load float* %incdec.ptr11.1, align 4, !dbg !775, !tbaa !152
  %75 = load float* %incdec.ptr12.1, align 4, !dbg !776, !tbaa !152
  %sub.2 = fsub float %74, %75, !dbg !775
  store float %sub.2, float* %incdec.ptr13.1, align 4, !dbg !777, !tbaa !152
  %inc10.2 = add nuw nsw i32 %inc10.1, 1, !dbg !772
  tail call void @llvm.dbg.value(metadata i32 %inc10, i64 0, metadata !119, metadata !131), !dbg !765
  %incdec.ptr11.2 = getelementptr inbounds float* %incdec.ptr11.1, i64 1, !dbg !780
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr11, i64 0, metadata !116, metadata !131), !dbg !757
  %incdec.ptr12.2 = getelementptr inbounds float* %incdec.ptr12.1, i64 1, !dbg !781
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr12, i64 0, metadata !117, metadata !131), !dbg !758
  %incdec.ptr13.2 = getelementptr inbounds float* %incdec.ptr13.1, i64 1, !dbg !782
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr13, i64 0, metadata !115, metadata !131), !dbg !756
  %76 = load float* %incdec.ptr11.2, align 4, !dbg !775, !tbaa !152
  %77 = load float* %incdec.ptr12.2, align 4, !dbg !776, !tbaa !152
  %sub.3 = fsub float %76, %77, !dbg !775
  store float %sub.3, float* %incdec.ptr13.2, align 4, !dbg !777, !tbaa !152
  %inc10.3 = add nuw nsw i32 %inc10.2, 1, !dbg !772
  tail call void @llvm.dbg.value(metadata i32 %inc10, i64 0, metadata !119, metadata !131), !dbg !765
  %incdec.ptr11.3 = getelementptr inbounds float* %incdec.ptr11.2, i64 1, !dbg !780
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr11, i64 0, metadata !116, metadata !131), !dbg !757
  %incdec.ptr12.3 = getelementptr inbounds float* %incdec.ptr12.2, i64 1, !dbg !781
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr12, i64 0, metadata !117, metadata !131), !dbg !758
  %incdec.ptr13.3 = getelementptr inbounds float* %incdec.ptr13.2, i64 1, !dbg !782
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr13, i64 0, metadata !115, metadata !131), !dbg !756
  %exitcond41.3 = icmp eq i32 %inc10.2, %0, !dbg !783
  br i1 %exitcond41.3, label %if.end15.loopexit219.unr-lcssa, label %for.body8, !dbg !783, !llvm.loop !794

if.end15.loopexit.unr-lcssa:                      ; preds = %for.body
  br label %if.end15.loopexit

if.end15.loopexit:                                ; preds = %for.body.preheader.split, %if.end15.loopexit.unr-lcssa
  br label %if.end15

if.end15.loopexit219.unr-lcssa:                   ; preds = %for.body8
  br label %if.end15.loopexit219

if.end15.loopexit219:                             ; preds = %for.body8.preheader.split, %if.end15.loopexit219.unr-lcssa
  br label %if.end15

if.end15:                                         ; preds = %if.end15.loopexit219, %if.end15.loopexit, %middle.block, %middle.block104, %entry
  ret void, !dbg !795
}

; Function Attrs: nounwind uwtable
define void @vfill(i32 %n, float* nocapture %v, double) #1 {
entry:
  %val = fptrunc double %0 to float
  tail call void @llvm.dbg.value(metadata i32 %n, i64 0, metadata !124, metadata !131), !dbg !796
  tail call void @llvm.dbg.value(metadata float* %v, i64 0, metadata !125, metadata !131), !dbg !797
  tail call void @llvm.dbg.value(metadata float %val, i64 0, metadata !126, metadata !131), !dbg !798
  %cmp = icmp slt i32 %n, 1, !dbg !799
  br i1 %cmp, label %for.end, label %for.body.lr.ph, !dbg !801

for.body.lr.ph:                                   ; preds = %entry
  %1 = add i32 %n, -1, !dbg !802
  %2 = zext i32 %1 to i64
  %3 = add nuw nsw i64 %2, 1, !dbg !802
  %end.idx = add nuw nsw i64 %2, 1, !dbg !804
  %n.vec = and i64 %3, 8589934584, !dbg !804
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !804
  %4 = trunc i64 %n.vec to i32
  %ptr.ind.end = getelementptr float* %v, i64 %n.vec
  br i1 %cmp.zero, label %middle.block, label %vector.ph

vector.ph:                                        ; preds = %for.body.lr.ph
  %broadcast.splatinsert32 = insertelement <4 x float> undef, float %val, i32 0
  %broadcast.splat33 = shufflevector <4 x float> %broadcast.splatinsert32, <4 x float> undef, <4 x i32> zeroinitializer
  %5 = add i32 %n, -1
  %6 = zext i32 %5 to i64
  %7 = add i64 %6, 1
  %8 = lshr i64 %7, 3
  %9 = mul i64 %8, 8
  %10 = add i64 %9, -8
  %11 = lshr i64 %10, 3
  %12 = add i64 %11, 1
  %xtraiter48 = and i64 %12, 3
  %lcmp.mod49 = icmp ne i64 %xtraiter48, 0
  %lcmp.overflow50 = icmp eq i64 %12, 0
  %lcmp.or51 = or i1 %lcmp.overflow50, %lcmp.mod49
  br i1 %lcmp.or51, label %vector.body.prol, label %vector.ph.split

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.ph
  %index.prol = phi i64 [ 0, %vector.ph ], [ %index.next.prol, %vector.body.prol ], !dbg !804
  %prol.iter52 = phi i64 [ %xtraiter48, %vector.ph ], [ %prol.iter52.sub, %vector.body.prol ]
  %next.gep.prol = getelementptr float* %v, i64 %index.prol
  %13 = bitcast float* %next.gep.prol to <4 x float>*, !dbg !806
  store <4 x float> %broadcast.splat33, <4 x float>* %13, align 4, !dbg !806, !tbaa !152
  %next.gep.sum43.prol = or i64 %index.prol, 4, !dbg !806
  %14 = getelementptr float* %v, i64 %next.gep.sum43.prol, !dbg !806
  %15 = bitcast float* %14 to <4 x float>*, !dbg !806
  store <4 x float> %broadcast.splat33, <4 x float>* %15, align 4, !dbg !806, !tbaa !152
  %index.next.prol = add i64 %index.prol, 8, !dbg !804
  %16 = icmp eq i64 %index.next.prol, %n.vec, !dbg !804
  %prol.iter52.sub = sub i64 %prol.iter52, 1, !dbg !804
  %prol.iter52.cmp = icmp ne i64 %prol.iter52.sub, 0, !dbg !804
  br i1 %prol.iter52.cmp, label %vector.body.prol, label %vector.ph.split, !llvm.loop !807

vector.ph.split:                                  ; preds = %vector.body.prol, %vector.ph
  %index.unr = phi i64 [ 0, %vector.ph ], [ %index.next.prol, %vector.body.prol ]
  %17 = icmp ult i64 %12, 4
  br i1 %17, label %middle.block.loopexit, label %vector.ph.split.split

vector.ph.split.split:                            ; preds = %vector.ph.split
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph.split.split
  %index = phi i64 [ %index.unr, %vector.ph.split.split ], [ %index.next.3, %vector.body ], !dbg !804
  %next.gep = getelementptr float* %v, i64 %index
  %18 = bitcast float* %next.gep to <4 x float>*, !dbg !806
  store <4 x float> %broadcast.splat33, <4 x float>* %18, align 4, !dbg !806, !tbaa !152
  %next.gep.sum43 = or i64 %index, 4, !dbg !806
  %19 = getelementptr float* %v, i64 %next.gep.sum43, !dbg !806
  %20 = bitcast float* %19 to <4 x float>*, !dbg !806
  store <4 x float> %broadcast.splat33, <4 x float>* %20, align 4, !dbg !806, !tbaa !152
  %index.next = add i64 %index, 8, !dbg !804
  %next.gep.1 = getelementptr float* %v, i64 %index.next
  %21 = bitcast float* %next.gep.1 to <4 x float>*, !dbg !806
  store <4 x float> %broadcast.splat33, <4 x float>* %21, align 4, !dbg !806, !tbaa !152
  %next.gep.sum43.1 = or i64 %index.next, 4, !dbg !806
  %22 = getelementptr float* %v, i64 %next.gep.sum43.1, !dbg !806
  %23 = bitcast float* %22 to <4 x float>*, !dbg !806
  store <4 x float> %broadcast.splat33, <4 x float>* %23, align 4, !dbg !806, !tbaa !152
  %index.next.1 = add i64 %index.next, 8, !dbg !804
  %next.gep.2 = getelementptr float* %v, i64 %index.next.1
  %24 = bitcast float* %next.gep.2 to <4 x float>*, !dbg !806
  store <4 x float> %broadcast.splat33, <4 x float>* %24, align 4, !dbg !806, !tbaa !152
  %next.gep.sum43.2 = or i64 %index.next.1, 4, !dbg !806
  %25 = getelementptr float* %v, i64 %next.gep.sum43.2, !dbg !806
  %26 = bitcast float* %25 to <4 x float>*, !dbg !806
  store <4 x float> %broadcast.splat33, <4 x float>* %26, align 4, !dbg !806, !tbaa !152
  %index.next.2 = add i64 %index.next.1, 8, !dbg !804
  %next.gep.3 = getelementptr float* %v, i64 %index.next.2
  %27 = bitcast float* %next.gep.3 to <4 x float>*, !dbg !806
  store <4 x float> %broadcast.splat33, <4 x float>* %27, align 4, !dbg !806, !tbaa !152
  %next.gep.sum43.3 = or i64 %index.next.2, 4, !dbg !806
  %28 = getelementptr float* %v, i64 %next.gep.sum43.3, !dbg !806
  %29 = bitcast float* %28 to <4 x float>*, !dbg !806
  store <4 x float> %broadcast.splat33, <4 x float>* %29, align 4, !dbg !806, !tbaa !152
  %index.next.3 = add i64 %index.next.2, 8, !dbg !804
  %30 = icmp eq i64 %index.next.3, %n.vec, !dbg !804
  br i1 %30, label %middle.block.loopexit.unr-lcssa, label %vector.body, !dbg !804, !llvm.loop !808

middle.block.loopexit.unr-lcssa:                  ; preds = %vector.body
  br label %middle.block.loopexit

middle.block.loopexit:                            ; preds = %vector.ph.split, %middle.block.loopexit.unr-lcssa
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %for.body.lr.ph
  %resume.val = phi i64 [ 0, %for.body.lr.ph ], [ %n.vec, %middle.block.loopexit ]
  %trunc.resume.val = phi i32 [ 0, %for.body.lr.ph ], [ %4, %middle.block.loopexit ]
  %resume.val8 = phi float* [ %v, %for.body.lr.ph ], [ %ptr.ind.end, %middle.block.loopexit ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %for.end, label %for.body.preheader

for.body.preheader:                               ; preds = %middle.block
  %31 = sub i32 %n, %trunc.resume.val
  %xtraiter = and i32 %31, 7
  %lcmp.mod = icmp ne i32 %xtraiter, 0
  %lcmp.overflow = icmp eq i32 %31, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %for.body.prol, label %for.body.preheader.split

for.body.prol:                                    ; preds = %for.body.prol, %for.body.preheader
  %i.07.prol = phi i32 [ %inc.prol, %for.body.prol ], [ %trunc.resume.val, %for.body.preheader ]
  %v.addr.06.prol = phi float* [ %incdec.ptr.prol, %for.body.prol ], [ %resume.val8, %for.body.preheader ]
  %prol.iter = phi i32 [ %xtraiter, %for.body.preheader ], [ %prol.iter.sub, %for.body.prol ]
  store float %val, float* %v.addr.06.prol, align 4, !dbg !806, !tbaa !152
  %inc.prol = add nuw nsw i32 %i.07.prol, 1, !dbg !804
  tail call void @llvm.dbg.value(metadata i32 %inc.prol, i64 0, metadata !127, metadata !131), !dbg !809
  %incdec.ptr.prol = getelementptr inbounds float* %v.addr.06.prol, i64 1, !dbg !810
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr.prol, i64 0, metadata !125, metadata !131), !dbg !797
  %exitcond.prol = icmp eq i32 %i.07.prol, %1, !dbg !802
  %prol.iter.sub = sub i32 %prol.iter, 1, !dbg !802
  %prol.iter.cmp = icmp ne i32 %prol.iter.sub, 0, !dbg !802
  br i1 %prol.iter.cmp, label %for.body.prol, label %for.body.preheader.split, !llvm.loop !811

for.body.preheader.split:                         ; preds = %for.body.prol, %for.body.preheader
  %i.07.unr = phi i32 [ %trunc.resume.val, %for.body.preheader ], [ %inc.prol, %for.body.prol ]
  %v.addr.06.unr = phi float* [ %resume.val8, %for.body.preheader ], [ %incdec.ptr.prol, %for.body.prol ]
  %32 = icmp ult i32 %31, 8
  br i1 %32, label %for.end.loopexit, label %for.body.preheader.split.split

for.body.preheader.split.split:                   ; preds = %for.body.preheader.split
  br label %for.body, !dbg !806

for.body:                                         ; preds = %for.body, %for.body.preheader.split.split
  %i.07 = phi i32 [ %i.07.unr, %for.body.preheader.split.split ], [ %inc.7, %for.body ]
  %v.addr.06 = phi float* [ %v.addr.06.unr, %for.body.preheader.split.split ], [ %incdec.ptr.7, %for.body ]
  store float %val, float* %v.addr.06, align 4, !dbg !806, !tbaa !152
  %inc = add nuw nsw i32 %i.07, 1, !dbg !804
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !127, metadata !131), !dbg !809
  %incdec.ptr = getelementptr inbounds float* %v.addr.06, i64 1, !dbg !810
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr, i64 0, metadata !125, metadata !131), !dbg !797
  store float %val, float* %incdec.ptr, align 4, !dbg !806, !tbaa !152
  %inc.1 = add nuw nsw i32 %inc, 1, !dbg !804
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !127, metadata !131), !dbg !809
  %incdec.ptr.1 = getelementptr inbounds float* %incdec.ptr, i64 1, !dbg !810
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr, i64 0, metadata !125, metadata !131), !dbg !797
  store float %val, float* %incdec.ptr.1, align 4, !dbg !806, !tbaa !152
  %inc.2 = add nuw nsw i32 %inc.1, 1, !dbg !804
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !127, metadata !131), !dbg !809
  %incdec.ptr.2 = getelementptr inbounds float* %incdec.ptr.1, i64 1, !dbg !810
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr, i64 0, metadata !125, metadata !131), !dbg !797
  store float %val, float* %incdec.ptr.2, align 4, !dbg !806, !tbaa !152
  %inc.3 = add nuw nsw i32 %inc.2, 1, !dbg !804
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !127, metadata !131), !dbg !809
  %incdec.ptr.3 = getelementptr inbounds float* %incdec.ptr.2, i64 1, !dbg !810
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr, i64 0, metadata !125, metadata !131), !dbg !797
  store float %val, float* %incdec.ptr.3, align 4, !dbg !806, !tbaa !152
  %inc.4 = add nuw nsw i32 %inc.3, 1, !dbg !804
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !127, metadata !131), !dbg !809
  %incdec.ptr.4 = getelementptr inbounds float* %incdec.ptr.3, i64 1, !dbg !810
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr, i64 0, metadata !125, metadata !131), !dbg !797
  store float %val, float* %incdec.ptr.4, align 4, !dbg !806, !tbaa !152
  %inc.5 = add nuw nsw i32 %inc.4, 1, !dbg !804
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !127, metadata !131), !dbg !809
  %incdec.ptr.5 = getelementptr inbounds float* %incdec.ptr.4, i64 1, !dbg !810
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr, i64 0, metadata !125, metadata !131), !dbg !797
  store float %val, float* %incdec.ptr.5, align 4, !dbg !806, !tbaa !152
  %inc.6 = add nuw nsw i32 %inc.5, 1, !dbg !804
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !127, metadata !131), !dbg !809
  %incdec.ptr.6 = getelementptr inbounds float* %incdec.ptr.5, i64 1, !dbg !810
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr, i64 0, metadata !125, metadata !131), !dbg !797
  store float %val, float* %incdec.ptr.6, align 4, !dbg !806, !tbaa !152
  %inc.7 = add nuw nsw i32 %inc.6, 1, !dbg !804
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !127, metadata !131), !dbg !809
  %incdec.ptr.7 = getelementptr inbounds float* %incdec.ptr.6, i64 1, !dbg !810
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr, i64 0, metadata !125, metadata !131), !dbg !797
  %exitcond.7 = icmp eq i32 %inc.6, %1, !dbg !802
  br i1 %exitcond.7, label %for.end.loopexit.unr-lcssa, label %for.body, !dbg !802, !llvm.loop !812

for.end.loopexit.unr-lcssa:                       ; preds = %for.body
  br label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.body.preheader.split, %for.end.loopexit.unr-lcssa
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %middle.block, %entry
  ret void, !dbg !813
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #4

attributes #0 = { nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!128, !129}
!llvm.ident = !{!130}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !5, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c] [DW_LANG_C99]
!1 = !{!"blas.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa"}
!2 = !{}
!3 = !{!4}
!4 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!5 = !{!6, !20, !31, !40, !50, !61, !75, !80, !101, !110, !120}
!6 = !{!"0x2e\00isamax\00isamax\00\0023\000\001\000\000\000\001\0036", !1, !7, !8, null, i32 (i32, float*, i32)* @isamax, null, null, !13} ; [ DW_TAG_subprogram ] [line 23] [def] [scope 36] [isamax]
!7 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!8 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !9, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!9 = !{!10, !10, !11, !10}
!10 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!11 = !{!"0xf\00\000\0064\0064\000\000", null, null, !12} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from float]
!12 = !{!"0x24\00float\000\0032\0032\000\000\004", null, null} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!13 = !{!14, !15, !16, !17, !18, !19}
!14 = !{!"0x101\00n\0016777241\000", !6, !7, !10} ; [ DW_TAG_arg_variable ] [n] [line 25]
!15 = !{!"0x101\00sx\0033554456\000", !6, !7, !11} ; [ DW_TAG_arg_variable ] [sx] [line 24]
!16 = !{!"0x101\00incx\0050331673\000", !6, !7, !10} ; [ DW_TAG_arg_variable ] [incx] [line 25]
!17 = !{!"0x100\00smax\0037\000", !6, !7, !12}    ; [ DW_TAG_auto_variable ] [smax] [line 37]
!18 = !{!"0x100\00i\0038\000", !6, !7, !10}       ; [ DW_TAG_auto_variable ] [i] [line 38]
!19 = !{!"0x100\00istmp\0038\000", !6, !7, !10}   ; [ DW_TAG_auto_variable ] [istmp] [line 38]
!20 = !{!"0x2e\00saxpy\00saxpy\00\0069\000\001\000\000\000\001\0087", !1, !7, !21, null, void (i32, double, float*, i32, float*, i32)* @saxpy, null, null, !23} ; [ DW_TAG_subprogram ] [line 69] [def] [scope 87] [saxpy]
!21 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !22, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!22 = !{null, !10, !12, !11, !10, !11, !10}
!23 = !{!24, !25, !26, !27, !28, !29, !30}
!24 = !{!"0x101\00n\0016777287\000", !20, !7, !10} ; [ DW_TAG_arg_variable ] [n] [line 71]
!25 = !{!"0x101\00sa\0033554502\000", !20, !7, !12} ; [ DW_TAG_arg_variable ] [sa] [line 70]
!26 = !{!"0x101\00sx\0050331718\000", !20, !7, !11} ; [ DW_TAG_arg_variable ] [sx] [line 70]
!27 = !{!"0x101\00incx\0067108935\000", !20, !7, !10} ; [ DW_TAG_arg_variable ] [incx] [line 71]
!28 = !{!"0x101\00sy\0083886150\000", !20, !7, !11} ; [ DW_TAG_arg_variable ] [sy] [line 70]
!29 = !{!"0x101\00incy\00100663367\000", !20, !7, !10} ; [ DW_TAG_arg_variable ] [incy] [line 71]
!30 = !{!"0x100\00i\0088\000", !20, !7, !10}      ; [ DW_TAG_auto_variable ] [i] [line 88]
!31 = !{!"0x2e\00saxpyx\00saxpyx\00\00112\000\001\000\000\000\001\00130", !1, !7, !21, null, void (i32, double, float*, i32, float*, i32)* @saxpyx, null, null, !32} ; [ DW_TAG_subprogram ] [line 112] [def] [scope 130] [saxpyx]
!32 = !{!33, !34, !35, !36, !37, !38, !39}
!33 = !{!"0x101\00n\0016777330\000", !31, !7, !10} ; [ DW_TAG_arg_variable ] [n] [line 114]
!34 = !{!"0x101\00sa\0033554545\000", !31, !7, !12} ; [ DW_TAG_arg_variable ] [sa] [line 113]
!35 = !{!"0x101\00sx\0050331761\000", !31, !7, !11} ; [ DW_TAG_arg_variable ] [sx] [line 113]
!36 = !{!"0x101\00incx\0067108978\000", !31, !7, !10} ; [ DW_TAG_arg_variable ] [incx] [line 114]
!37 = !{!"0x101\00sy\0083886193\000", !31, !7, !11} ; [ DW_TAG_arg_variable ] [sy] [line 113]
!38 = !{!"0x101\00incy\00100663410\000", !31, !7, !10} ; [ DW_TAG_arg_variable ] [incy] [line 114]
!39 = !{!"0x100\00i\00131\000", !31, !7, !10}     ; [ DW_TAG_auto_variable ] [i] [line 131]
!40 = !{!"0x2e\00scopy\00scopy\00\00155\000\001\000\000\000\001\00171", !1, !7, !41, null, void (i32, float*, i32, float*, i32)* @scopy, null, null, !43} ; [ DW_TAG_subprogram ] [line 155] [def] [scope 171] [scopy]
!41 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !42, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!42 = !{null, !10, !11, !10, !11, !10}
!43 = !{!44, !45, !46, !47, !48, !49}
!44 = !{!"0x101\00n\0016777373\000", !40, !7, !10} ; [ DW_TAG_arg_variable ] [n] [line 157]
!45 = !{!"0x101\00sx\0033554588\000", !40, !7, !11} ; [ DW_TAG_arg_variable ] [sx] [line 156]
!46 = !{!"0x101\00incx\0050331805\000", !40, !7, !10} ; [ DW_TAG_arg_variable ] [incx] [line 157]
!47 = !{!"0x101\00sy\0067109020\000", !40, !7, !11} ; [ DW_TAG_arg_variable ] [sy] [line 156]
!48 = !{!"0x101\00incy\0083886237\000", !40, !7, !10} ; [ DW_TAG_arg_variable ] [incy] [line 157]
!49 = !{!"0x100\00i\00172\000", !40, !7, !10}     ; [ DW_TAG_auto_variable ] [i] [line 172]
!50 = !{!"0x2e\00sdot\00sdot\00\00196\000\001\000\000\000\001\00214", !1, !7, !51, null, double (i32, float*, i32, float*, i32)* @sdot, null, null, !53} ; [ DW_TAG_subprogram ] [line 196] [def] [scope 214] [sdot]
!51 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !52, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!52 = !{!4, !10, !11, !10, !11, !10}
!53 = !{!54, !55, !56, !57, !58, !59, !60}
!54 = !{!"0x101\00n\0016777414\000", !50, !7, !10} ; [ DW_TAG_arg_variable ] [n] [line 198]
!55 = !{!"0x101\00sx\0033554629\000", !50, !7, !11} ; [ DW_TAG_arg_variable ] [sx] [line 197]
!56 = !{!"0x101\00incx\0050331846\000", !50, !7, !10} ; [ DW_TAG_arg_variable ] [incx] [line 198]
!57 = !{!"0x101\00sy\0067109061\000", !50, !7, !11} ; [ DW_TAG_arg_variable ] [sy] [line 197]
!58 = !{!"0x101\00incy\0083886278\000", !50, !7, !10} ; [ DW_TAG_arg_variable ] [incy] [line 198]
!59 = !{!"0x100\00i\00215\000", !50, !7, !10}     ; [ DW_TAG_auto_variable ] [i] [line 215]
!60 = !{!"0x100\00stemp\00216\000", !50, !7, !12} ; [ DW_TAG_auto_variable ] [stemp] [line 216]
!61 = !{!"0x2e\00snrm2\00snrm2\00\00241\000\001\000\000\000\001\00262", !1, !7, !62, null, double (i32, float*, i32)* @snrm2, null, null, !64} ; [ DW_TAG_subprogram ] [line 241] [def] [scope 262] [snrm2]
!62 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !63, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!63 = !{!4, !10, !11, !10}
!64 = !{!65, !66, !67, !68, !69, !70, !71, !72, !73, !74}
!65 = !{!"0x101\00n\0016777459\000", !61, !7, !10} ; [ DW_TAG_arg_variable ] [n] [line 243]
!66 = !{!"0x101\00sx\0033554674\000", !61, !7, !11} ; [ DW_TAG_arg_variable ] [sx] [line 242]
!67 = !{!"0x101\00incx\0050331891\000", !61, !7, !10} ; [ DW_TAG_arg_variable ] [incx] [line 243]
!68 = !{!"0x100\00i\00263\000", !61, !7, !10}     ; [ DW_TAG_auto_variable ] [i] [line 263]
!69 = !{!"0x100\00phase\00264\000", !61, !7, !10} ; [ DW_TAG_auto_variable ] [phase] [line 264]
!70 = !{!"0x100\00sum\00265\000", !61, !7, !4}    ; [ DW_TAG_auto_variable ] [sum] [line 265]
!71 = !{!"0x100\00cutlo\00265\000", !61, !7, !4}  ; [ DW_TAG_auto_variable ] [cutlo] [line 265]
!72 = !{!"0x100\00cuthi\00265\000", !61, !7, !4}  ; [ DW_TAG_auto_variable ] [cuthi] [line 265]
!73 = !{!"0x100\00hitst\00265\000", !61, !7, !4}  ; [ DW_TAG_auto_variable ] [hitst] [line 265]
!74 = !{!"0x100\00xmax\00266\000", !61, !7, !12}  ; [ DW_TAG_auto_variable ] [xmax] [line 266]
!75 = !{!"0x2e\00r1mach\00r1mach\00\00327\000\001\000\000\000\001\00334", !1, !7, !76, null, double ()* @r1mach, null, null, !77} ; [ DW_TAG_subprogram ] [line 327] [def] [scope 334] [r1mach]
!76 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !3, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!77 = !{!78, !79}
!78 = !{!"0x100\00u\00335\000", !75, !7, !12}     ; [ DW_TAG_auto_variable ] [u] [line 335]
!79 = !{!"0x100\00comp\00335\000", !75, !7, !12}  ; [ DW_TAG_auto_variable ] [comp] [line 335]
!80 = !{!"0x2e\00min0\00min0\00\00346\000\001\000\000\000\001\00359", !1, !7, !81, null, i32 (i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32)* @min0, null, null, !83} ; [ DW_TAG_subprogram ] [line 346] [def] [scope 359] [min0]
!81 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !82, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!82 = !{!10, !10, !10, !10, !10, !10, !10, !10, !10, !10, !10, !10, !10, !10, !10, !10, !10}
!83 = !{!84, !85, !86, !87, !88, !89, !90, !91, !92, !93, !94, !95, !96, !97, !98, !99, !100}
!84 = !{!"0x101\00n\0016777574\000", !80, !7, !10} ; [ DW_TAG_arg_variable ] [n] [line 358]
!85 = !{!"0x101\00a\0033554790\000", !80, !7, !10} ; [ DW_TAG_arg_variable ] [a] [line 358]
!86 = !{!"0x101\00b\0050332006\000", !80, !7, !10} ; [ DW_TAG_arg_variable ] [b] [line 358]
!87 = !{!"0x101\00c\0067109222\000", !80, !7, !10} ; [ DW_TAG_arg_variable ] [c] [line 358]
!88 = !{!"0x101\00d\0083886438\000", !80, !7, !10} ; [ DW_TAG_arg_variable ] [d] [line 358]
!89 = !{!"0x101\00e\00100663654\000", !80, !7, !10} ; [ DW_TAG_arg_variable ] [e] [line 358]
!90 = !{!"0x101\00f\00117440870\000", !80, !7, !10} ; [ DW_TAG_arg_variable ] [f] [line 358]
!91 = !{!"0x101\00g\00134218086\000", !80, !7, !10} ; [ DW_TAG_arg_variable ] [g] [line 358]
!92 = !{!"0x101\00h\00150995302\000", !80, !7, !10} ; [ DW_TAG_arg_variable ] [h] [line 358]
!93 = !{!"0x101\00i\00167772518\000", !80, !7, !10} ; [ DW_TAG_arg_variable ] [i] [line 358]
!94 = !{!"0x101\00j\00184549734\000", !80, !7, !10} ; [ DW_TAG_arg_variable ] [j] [line 358]
!95 = !{!"0x101\00k\00201326950\000", !80, !7, !10} ; [ DW_TAG_arg_variable ] [k] [line 358]
!96 = !{!"0x101\00l\00218104166\000", !80, !7, !10} ; [ DW_TAG_arg_variable ] [l] [line 358]
!97 = !{!"0x101\00m\00234881382\000", !80, !7, !10} ; [ DW_TAG_arg_variable ] [m] [line 358]
!98 = !{!"0x101\00o\00251658598\000", !80, !7, !10} ; [ DW_TAG_arg_variable ] [o] [line 358]
!99 = !{!"0x101\00p\00268435814\000", !80, !7, !10} ; [ DW_TAG_arg_variable ] [p] [line 358]
!100 = !{!"0x100\00mt\00360\000", !80, !7, !10}   ; [ DW_TAG_auto_variable ] [mt] [line 360]
!101 = !{!"0x2e\00sscal\00sscal\00\00408\000\001\000\000\000\001\00424", !1, !7, !102, null, i32 (i32, double, float*, i32)* @sscal, null, null, !104} ; [ DW_TAG_subprogram ] [line 408] [def] [scope 424] [sscal]
!102 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !103, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!103 = !{!10, !10, !12, !11, !10}
!104 = !{!105, !106, !107, !108, !109}
!105 = !{!"0x101\00n\0016777625\000", !101, !7, !10} ; [ DW_TAG_arg_variable ] [n] [line 409]
!106 = !{!"0x101\00sa\0033554842\000", !101, !7, !12} ; [ DW_TAG_arg_variable ] [sa] [line 410]
!107 = !{!"0x101\00sx\0050332058\000", !101, !7, !11} ; [ DW_TAG_arg_variable ] [sx] [line 410]
!108 = !{!"0x101\00incx\0067109273\000", !101, !7, !10} ; [ DW_TAG_arg_variable ] [incx] [line 409]
!109 = !{!"0x100\00i\00425\000", !101, !7, !10}   ; [ DW_TAG_auto_variable ] [i] [line 425]
!110 = !{!"0x2e\00vexopy\00vexopy\00\00441\000\001\000\000\000\001\00459", !1, !7, !111, null, void (i32, float*, float*, float*, i32)* @vexopy, null, null, !113} ; [ DW_TAG_subprogram ] [line 441] [def] [scope 459] [vexopy]
!111 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !112, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!112 = !{null, !10, !11, !11, !11, !10}
!113 = !{!114, !115, !116, !117, !118, !119}
!114 = !{!"0x101\00n\0016777658\000", !110, !7, !10} ; [ DW_TAG_arg_variable ] [n] [line 442]
!115 = !{!"0x101\00v\0033554875\000", !110, !7, !11} ; [ DW_TAG_arg_variable ] [v] [line 443]
!116 = !{!"0x101\00x\0050332091\000", !110, !7, !11} ; [ DW_TAG_arg_variable ] [x] [line 443]
!117 = !{!"0x101\00y\0067109307\000", !110, !7, !11} ; [ DW_TAG_arg_variable ] [y] [line 443]
!118 = !{!"0x101\00itype\0083886522\000", !110, !7, !10} ; [ DW_TAG_arg_variable ] [itype] [line 442]
!119 = !{!"0x100\00i\00460\000", !110, !7, !10}   ; [ DW_TAG_auto_variable ] [i] [line 460]
!120 = !{!"0x2e\00vfill\00vfill\00\00471\000\001\000\000\000\001\00481", !1, !7, !121, null, void (i32, float*, double)* @vfill, null, null, !123} ; [ DW_TAG_subprogram ] [line 471] [def] [scope 481] [vfill]
!121 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !122, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!122 = !{null, !10, !11, !12}
!123 = !{!124, !125, !126, !127}
!124 = !{!"0x101\00n\0016777688\000", !120, !7, !10} ; [ DW_TAG_arg_variable ] [n] [line 472]
!125 = !{!"0x101\00v\0033554905\000", !120, !7, !11} ; [ DW_TAG_arg_variable ] [v] [line 473]
!126 = !{!"0x101\00val\0050332121\000", !120, !7, !12} ; [ DW_TAG_arg_variable ] [val] [line 473]
!127 = !{!"0x100\00i\00482\000", !120, !7, !10}   ; [ DW_TAG_auto_variable ] [i] [line 482]
!128 = !{i32 2, !"Dwarf Version", i32 4}
!129 = !{i32 2, !"Debug Info Version", i32 2}
!130 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!131 = !{!"0x102"}                                ; [ DW_TAG_expression ]
!132 = !MDLocation(line: 25, column: 5, scope: !6)
!133 = !MDLocation(line: 24, column: 8, scope: !6)
!134 = !MDLocation(line: 25, column: 8, scope: !6)
!135 = !MDLocation(line: 37, column: 9, scope: !6)
!136 = !MDLocation(line: 38, column: 10, scope: !6)
!137 = !MDLocation(line: 43, column: 7, scope: !138)
!138 = !{!"0xb\0043\007\000", !1, !6}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!139 = !MDLocation(line: 43, column: 7, scope: !6)
!140 = !MDLocation(line: 44, column: 7, scope: !141)
!141 = !{!"0xb\0044\007\001", !1, !6}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!142 = !MDLocation(line: 44, column: 7, scope: !6)
!143 = !MDLocation(line: 46, column: 9, scope: !144)
!144 = !{!"0xb\0046\009\003", !1, !145}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!145 = !{!"0xb\0044\0019\002", !1, !141}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!146 = !MDLocation(line: 46, column: 9, scope: !145)
!147 = !MDLocation(line: 46, column: 32, scope: !144)
!148 = !MDLocation(line: 46, column: 31, scope: !144)
!149 = !MDLocation(line: 46, column: 25, scope: !144)
!150 = !MDLocation(line: 46, column: 20, scope: !144)
!151 = !MDLocation(line: 48, column: 13, scope: !145)
!152 = !{!153, !153, i64 0}
!153 = !{!"float", !154, i64 0}
!154 = !{!"omnipotent char", !155, i64 0}
!155 = !{!"Simple C/C++ TBAA"}
!156 = !MDLocation(line: 48, column: 13, scope: !157)
!157 = !{!"0xb\002", !1, !145}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!158 = !MDLocation(line: 49, column: 5, scope: !145)
!159 = !MDLocation(line: 38, column: 7, scope: !6)
!160 = !MDLocation(line: 50, column: 5, scope: !161)
!161 = !{!"0xb\0050\005\004", !1, !145}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!162 = !MDLocation(line: 51, column: 11, scope: !163)
!163 = !{!"0xb\0051\0011\006", !1, !164}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!164 = !{!"0xb\0050\005\005", !1, !161}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!165 = !MDLocation(line: 51, column: 11, scope: !166)
!166 = !{!"0xb\002", !1, !163}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!167 = !MDLocation(line: 51, column: 11, scope: !164)
!168 = !MDLocation(line: 53, column: 10, scope: !169)
!169 = !{!"0xb\002", !1, !170}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!170 = !{!"0xb\0051\0031\007", !1, !163}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!171 = !MDLocation(line: 50, column: 20, scope: !164)
!172 = !MDLocation(line: 59, column: 11, scope: !6)
!173 = !MDLocation(line: 59, column: 11, scope: !174)
!174 = !{!"0xb\002", !1, !6}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!175 = !MDLocation(line: 61, column: 3, scope: !176)
!176 = !{!"0xb\0061\003\008", !1, !6}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!177 = !MDLocation(line: 60, column: 3, scope: !6)
!178 = !MDLocation(line: 62, column: 9, scope: !179)
!179 = !{!"0xb\0062\009\0010", !1, !180}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!180 = !{!"0xb\0061\003\009", !1, !176}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!181 = !MDLocation(line: 62, column: 9, scope: !182)
!182 = !{!"0xb\002", !1, !179}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!183 = !MDLocation(line: 62, column: 9, scope: !180)
!184 = !MDLocation(line: 64, column: 15, scope: !185)
!185 = !{!"0xb\002", !1, !186}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!186 = !{!"0xb\0062\0029\0011", !1, !179}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!187 = !MDLocation(line: 61, column: 18, scope: !180)
!188 = distinct !{!188, !189}
!189 = !{!"llvm.loop.unroll.disable"}
!190 = !MDLocation(line: 67, column: 1, scope: !6)
!191 = !MDLocation(line: 71, column: 7, scope: !20)
!192 = !MDLocation(line: 70, column: 17, scope: !20)
!193 = !MDLocation(line: 70, column: 8, scope: !20)
!194 = !MDLocation(line: 71, column: 10, scope: !20)
!195 = !MDLocation(line: 70, column: 13, scope: !20)
!196 = !MDLocation(line: 71, column: 16, scope: !20)
!197 = !MDLocation(line: 90, column: 7, scope: !198)
!198 = !{!"0xb\0090\007\0012", !1, !20}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!199 = !MDLocation(line: 90, column: 15, scope: !200)
!200 = !{!"0xb\002", !1, !198}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!201 = !MDLocation(line: 90, column: 7, scope: !20)
!202 = !MDLocation(line: 91, column: 7, scope: !203)
!203 = !{!"0xb\0091\007\0013", !1, !20}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!204 = !MDLocation(line: 91, column: 7, scope: !20)
!205 = !MDLocation(line: 92, column: 9, scope: !206)
!206 = !{!"0xb\0092\009\0015", !1, !207}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!207 = !{!"0xb\0091\0022\0014", !1, !203}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!208 = !MDLocation(line: 92, column: 9, scope: !207)
!209 = !MDLocation(line: 94, column: 17, scope: !210)
!210 = !{!"0xb\0094\007\0018", !1, !211}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!211 = !{!"0xb\0094\007\0017", !1, !212}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!212 = !{!"0xb\0092\0021\0016", !1, !206}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!213 = !MDLocation(line: 94, column: 7, scope: !211)
!214 = !MDLocation(line: 94, column: 22, scope: !210)
!215 = !MDLocation(line: 95, column: 13, scope: !210)
!216 = !MDLocation(line: 95, column: 9, scope: !210)
!217 = !MDLocation(line: 95, column: 2, scope: !210)
!218 = distinct !{!218, !189}
!219 = distinct !{!219, !220, !221}
!220 = !{!"llvm.loop.vectorize.width", i32 1}
!221 = !{!"llvm.loop.interleave.count", i32 1}
!222 = !MDLocation(line: 88, column: 16, scope: !20)
!223 = !MDLocation(line: 94, column: 26, scope: !210)
!224 = !MDLocation(line: 94, column: 31, scope: !210)
!225 = distinct !{!225, !189}
!226 = distinct !{!226, !220, !221}
!227 = !MDLocation(line: 98, column: 9, scope: !228)
!228 = !{!"0xb\0098\009\0019", !1, !207}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!229 = !MDLocation(line: 98, column: 9, scope: !207)
!230 = !MDLocation(line: 100, column: 17, scope: !231)
!231 = !{!"0xb\00100\007\0022", !1, !232}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!232 = !{!"0xb\00100\007\0021", !1, !233}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!233 = !{!"0xb\0098\0018\0020", !1, !228}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!234 = !MDLocation(line: 100, column: 7, scope: !232)
!235 = !MDLocation(line: 100, column: 26, scope: !231)
!236 = !MDLocation(line: 101, column: 13, scope: !231)
!237 = !MDLocation(line: 101, column: 9, scope: !231)
!238 = !MDLocation(line: 101, column: 2, scope: !231)
!239 = !MDLocation(line: 100, column: 22, scope: !231)
!240 = !MDLocation(line: 100, column: 35, scope: !231)
!241 = distinct !{!241, !189}
!242 = !MDLocation(line: 106, column: 7, scope: !243)
!243 = !{!"0xb\00106\007\0023", !1, !20}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!244 = !MDLocation(line: 106, column: 7, scope: !20)
!245 = !MDLocation(line: 106, column: 26, scope: !243)
!246 = !MDLocation(line: 106, column: 25, scope: !243)
!247 = !MDLocation(line: 106, column: 18, scope: !243)
!248 = !MDLocation(line: 107, column: 7, scope: !249)
!249 = !{!"0xb\00107\007\0024", !1, !20}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!250 = !MDLocation(line: 107, column: 7, scope: !20)
!251 = !MDLocation(line: 107, column: 26, scope: !249)
!252 = !MDLocation(line: 107, column: 25, scope: !249)
!253 = !MDLocation(line: 107, column: 18, scope: !249)
!254 = !MDLocation(line: 108, column: 13, scope: !255)
!255 = !{!"0xb\00108\003\0026", !1, !256}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!256 = !{!"0xb\00108\003\0025", !1, !20}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!257 = !MDLocation(line: 108, column: 3, scope: !256)
!258 = !MDLocation(line: 108, column: 22, scope: !255)
!259 = !MDLocation(line: 108, column: 31, scope: !255)
!260 = !MDLocation(line: 109, column: 16, scope: !255)
!261 = !MDLocation(line: 109, column: 12, scope: !255)
!262 = !MDLocation(line: 109, column: 5, scope: !255)
!263 = !MDLocation(line: 108, column: 18, scope: !255)
!264 = distinct !{!264, !189}
!265 = !MDLocation(line: 110, column: 1, scope: !20)
!266 = !MDLocation(line: 114, column: 7, scope: !31)
!267 = !MDLocation(line: 113, column: 17, scope: !31)
!268 = !MDLocation(line: 113, column: 8, scope: !31)
!269 = !MDLocation(line: 114, column: 10, scope: !31)
!270 = !MDLocation(line: 113, column: 13, scope: !31)
!271 = !MDLocation(line: 114, column: 16, scope: !31)
!272 = !MDLocation(line: 133, column: 7, scope: !273)
!273 = !{!"0xb\00133\007\0027", !1, !31}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!274 = !MDLocation(line: 133, column: 15, scope: !275)
!275 = !{!"0xb\002", !1, !273}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!276 = !MDLocation(line: 133, column: 7, scope: !31)
!277 = !MDLocation(line: 134, column: 7, scope: !278)
!278 = !{!"0xb\00134\007\0028", !1, !31}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!279 = !MDLocation(line: 134, column: 7, scope: !31)
!280 = !MDLocation(line: 135, column: 9, scope: !281)
!281 = !{!"0xb\00135\009\0030", !1, !282}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!282 = !{!"0xb\00134\0022\0029", !1, !278}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!283 = !MDLocation(line: 135, column: 9, scope: !282)
!284 = !MDLocation(line: 137, column: 17, scope: !285)
!285 = !{!"0xb\00137\007\0033", !1, !286}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!286 = !{!"0xb\00137\007\0032", !1, !287}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!287 = !{!"0xb\00135\0021\0031", !1, !281}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!288 = !MDLocation(line: 137, column: 7, scope: !286)
!289 = !MDLocation(line: 137, column: 22, scope: !285)
!290 = !MDLocation(line: 138, column: 8, scope: !285)
!291 = !MDLocation(line: 138, column: 18, scope: !285)
!292 = !MDLocation(line: 138, column: 14, scope: !285)
!293 = !MDLocation(line: 138, column: 2, scope: !285)
!294 = distinct !{!294, !189}
!295 = distinct !{!295, !220, !221}
!296 = !MDLocation(line: 131, column: 12, scope: !31)
!297 = !MDLocation(line: 137, column: 27, scope: !285)
!298 = !MDLocation(line: 137, column: 33, scope: !285)
!299 = distinct !{!299, !189}
!300 = distinct !{!300, !220, !221}
!301 = !MDLocation(line: 141, column: 9, scope: !302)
!302 = !{!"0xb\00141\009\0034", !1, !282}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!303 = !MDLocation(line: 141, column: 9, scope: !282)
!304 = !MDLocation(line: 143, column: 17, scope: !305)
!305 = !{!"0xb\00143\007\0037", !1, !306}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!306 = !{!"0xb\00143\007\0036", !1, !307}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!307 = !{!"0xb\00141\0018\0035", !1, !302}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!308 = !MDLocation(line: 143, column: 7, scope: !306)
!309 = !MDLocation(line: 143, column: 27, scope: !305)
!310 = !MDLocation(line: 144, column: 8, scope: !305)
!311 = !MDLocation(line: 144, column: 18, scope: !305)
!312 = !MDLocation(line: 144, column: 14, scope: !305)
!313 = !MDLocation(line: 144, column: 2, scope: !305)
!314 = !MDLocation(line: 143, column: 22, scope: !305)
!315 = !MDLocation(line: 143, column: 37, scope: !305)
!316 = distinct !{!316, !189}
!317 = !MDLocation(line: 149, column: 7, scope: !318)
!318 = !{!"0xb\00149\007\0038", !1, !31}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!319 = !MDLocation(line: 149, column: 7, scope: !31)
!320 = !MDLocation(line: 149, column: 26, scope: !318)
!321 = !MDLocation(line: 149, column: 25, scope: !318)
!322 = !MDLocation(line: 149, column: 18, scope: !318)
!323 = !MDLocation(line: 150, column: 7, scope: !324)
!324 = !{!"0xb\00150\007\0039", !1, !31}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!325 = !MDLocation(line: 150, column: 7, scope: !31)
!326 = !MDLocation(line: 150, column: 26, scope: !324)
!327 = !MDLocation(line: 150, column: 25, scope: !324)
!328 = !MDLocation(line: 150, column: 18, scope: !324)
!329 = !MDLocation(line: 151, column: 13, scope: !330)
!330 = !{!"0xb\00151\003\0041", !1, !331}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!331 = !{!"0xb\00151\003\0040", !1, !31}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!332 = !MDLocation(line: 151, column: 3, scope: !331)
!333 = !MDLocation(line: 151, column: 22, scope: !330)
!334 = !MDLocation(line: 151, column: 31, scope: !330)
!335 = !MDLocation(line: 152, column: 11, scope: !330)
!336 = !MDLocation(line: 152, column: 21, scope: !330)
!337 = !MDLocation(line: 152, column: 17, scope: !330)
!338 = !MDLocation(line: 152, column: 5, scope: !330)
!339 = !MDLocation(line: 151, column: 18, scope: !330)
!340 = distinct !{!340, !189}
!341 = !MDLocation(line: 153, column: 1, scope: !31)
!342 = !MDLocation(line: 157, column: 9, scope: !40)
!343 = !MDLocation(line: 156, column: 9, scope: !40)
!344 = !MDLocation(line: 157, column: 12, scope: !40)
!345 = !MDLocation(line: 156, column: 14, scope: !40)
!346 = !MDLocation(line: 157, column: 18, scope: !40)
!347 = !MDLocation(line: 174, column: 7, scope: !348)
!348 = !{!"0xb\00174\007\0042", !1, !40}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!349 = !MDLocation(line: 174, column: 7, scope: !40)
!350 = !MDLocation(line: 175, column: 7, scope: !351)
!351 = !{!"0xb\00175\007\0043", !1, !40}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!352 = !MDLocation(line: 175, column: 7, scope: !40)
!353 = !MDLocation(line: 176, column: 9, scope: !354)
!354 = !{!"0xb\00176\009\0045", !1, !355}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!355 = !{!"0xb\00175\0022\0044", !1, !351}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!356 = !MDLocation(line: 176, column: 9, scope: !355)
!357 = !MDLocation(line: 178, column: 7, scope: !358)
!358 = !{!"0xb\00178\007\0047", !1, !359}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!359 = !{!"0xb\00176\0021\0046", !1, !354}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!360 = !MDLocation(line: 178, column: 22, scope: !361)
!361 = !{!"0xb\00178\007\0048", !1, !358}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!362 = !MDLocation(line: 179, column: 12, scope: !361)
!363 = !MDLocation(line: 179, column: 2, scope: !361)
!364 = distinct !{!364, !189}
!365 = distinct !{!365, !220, !221}
!366 = !MDLocation(line: 179, column: 14, scope: !361)
!367 = !MDLocation(line: 179, column: 4, scope: !361)
!368 = !MDLocation(line: 172, column: 16, scope: !40)
!369 = distinct !{!369, !189}
!370 = distinct !{!370, !220, !221}
!371 = !MDLocation(line: 182, column: 9, scope: !372)
!372 = !{!"0xb\00182\009\0049", !1, !355}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!373 = !MDLocation(line: 182, column: 9, scope: !355)
!374 = !MDLocation(line: 184, column: 27, scope: !375)
!375 = !{!"0xb\00184\007\0052", !1, !376}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!376 = !{!"0xb\00184\007\0051", !1, !377}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!377 = !{!"0xb\00182\0020\0050", !1, !372}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!378 = !MDLocation(line: 184, column: 7, scope: !376)
!379 = !MDLocation(line: 185, column: 8, scope: !375)
!380 = !MDLocation(line: 185, column: 2, scope: !375)
!381 = !MDLocation(line: 184, column: 22, scope: !375)
!382 = !MDLocation(line: 184, column: 37, scope: !375)
!383 = distinct !{!383, !189}
!384 = !MDLocation(line: 190, column: 7, scope: !385)
!385 = !{!"0xb\00190\007\0053", !1, !40}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!386 = !MDLocation(line: 190, column: 7, scope: !40)
!387 = !MDLocation(line: 190, column: 26, scope: !385)
!388 = !MDLocation(line: 190, column: 25, scope: !385)
!389 = !MDLocation(line: 190, column: 18, scope: !385)
!390 = !MDLocation(line: 191, column: 7, scope: !391)
!391 = !{!"0xb\00191\007\0054", !1, !40}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!392 = !MDLocation(line: 191, column: 7, scope: !40)
!393 = !MDLocation(line: 191, column: 26, scope: !391)
!394 = !MDLocation(line: 191, column: 25, scope: !391)
!395 = !MDLocation(line: 191, column: 18, scope: !391)
!396 = !MDLocation(line: 192, column: 22, scope: !397)
!397 = !{!"0xb\00192\003\0056", !1, !398}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!398 = !{!"0xb\00192\003\0055", !1, !40}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!399 = !MDLocation(line: 192, column: 31, scope: !397)
!400 = !MDLocation(line: 192, column: 3, scope: !398)
!401 = !MDLocation(line: 193, column: 14, scope: !397)
!402 = !MDLocation(line: 193, column: 5, scope: !397)
!403 = !MDLocation(line: 192, column: 18, scope: !397)
!404 = distinct !{!404, !189}
!405 = !MDLocation(line: 195, column: 1, scope: !40)
!406 = !MDLocation(line: 198, column: 5, scope: !50)
!407 = !MDLocation(line: 197, column: 8, scope: !50)
!408 = !MDLocation(line: 198, column: 8, scope: !50)
!409 = !MDLocation(line: 197, column: 13, scope: !50)
!410 = !MDLocation(line: 198, column: 14, scope: !50)
!411 = !MDLocation(line: 216, column: 9, scope: !50)
!412 = !MDLocation(line: 218, column: 7, scope: !413)
!413 = !{!"0xb\00218\007\0057", !1, !50}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!414 = !MDLocation(line: 218, column: 7, scope: !50)
!415 = !MDLocation(line: 219, column: 7, scope: !416)
!416 = !{!"0xb\00219\007\0058", !1, !50}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!417 = !MDLocation(line: 219, column: 7, scope: !50)
!418 = !MDLocation(line: 220, column: 9, scope: !419)
!419 = !{!"0xb\00220\009\0060", !1, !420}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!420 = !{!"0xb\00219\0022\0059", !1, !416}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!421 = !MDLocation(line: 220, column: 9, scope: !420)
!422 = !MDLocation(line: 222, column: 7, scope: !423)
!423 = !{!"0xb\00222\007\0062", !1, !424}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!424 = !{!"0xb\00220\0021\0061", !1, !419}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!425 = !MDLocation(line: 223, column: 12, scope: !426)
!426 = !{!"0xb\00222\007\0063", !1, !423}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!427 = !MDLocation(line: 223, column: 18, scope: !426)
!428 = !MDLocation(line: 223, column: 11, scope: !426)
!429 = !MDLocation(line: 223, column: 2, scope: !426)
!430 = !MDLocation(line: 222, column: 22, scope: !426)
!431 = !MDLocation(line: 215, column: 12, scope: !50)
!432 = !MDLocation(line: 222, column: 27, scope: !426)
!433 = !MDLocation(line: 222, column: 33, scope: !426)
!434 = distinct !{!434, !189}
!435 = !MDLocation(line: 224, column: 7, scope: !424)
!436 = !MDLocation(line: 226, column: 9, scope: !437)
!437 = !{!"0xb\00226\009\0064", !1, !420}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!438 = !MDLocation(line: 226, column: 9, scope: !420)
!439 = !MDLocation(line: 228, column: 27, scope: !440)
!440 = !{!"0xb\00228\007\0067", !1, !441}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!441 = !{!"0xb\00228\007\0066", !1, !442}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!442 = !{!"0xb\00226\0018\0065", !1, !437}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!443 = !MDLocation(line: 228, column: 7, scope: !441)
!444 = !MDLocation(line: 229, column: 12, scope: !440)
!445 = !MDLocation(line: 229, column: 18, scope: !440)
!446 = !MDLocation(line: 229, column: 11, scope: !440)
!447 = !MDLocation(line: 229, column: 2, scope: !440)
!448 = !MDLocation(line: 228, column: 22, scope: !440)
!449 = !MDLocation(line: 228, column: 37, scope: !440)
!450 = distinct !{!450, !189}
!451 = !MDLocation(line: 230, column: 7, scope: !442)
!452 = !MDLocation(line: 234, column: 7, scope: !453)
!453 = !{!"0xb\00234\007\0068", !1, !50}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!454 = !MDLocation(line: 234, column: 7, scope: !50)
!455 = !MDLocation(line: 234, column: 26, scope: !453)
!456 = !MDLocation(line: 234, column: 25, scope: !453)
!457 = !MDLocation(line: 234, column: 18, scope: !453)
!458 = !MDLocation(line: 235, column: 7, scope: !459)
!459 = !{!"0xb\00235\007\0069", !1, !50}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!460 = !MDLocation(line: 235, column: 7, scope: !50)
!461 = !MDLocation(line: 235, column: 26, scope: !459)
!462 = !MDLocation(line: 235, column: 25, scope: !459)
!463 = !MDLocation(line: 235, column: 18, scope: !459)
!464 = !MDLocation(line: 236, column: 22, scope: !465)
!465 = !{!"0xb\00236\003\0071", !1, !466}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!466 = !{!"0xb\00236\003\0070", !1, !50}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!467 = !MDLocation(line: 236, column: 31, scope: !465)
!468 = !MDLocation(line: 236, column: 3, scope: !466)
!469 = !MDLocation(line: 237, column: 15, scope: !465)
!470 = !MDLocation(line: 237, column: 21, scope: !465)
!471 = !MDLocation(line: 237, column: 14, scope: !465)
!472 = !MDLocation(line: 237, column: 5, scope: !465)
!473 = !MDLocation(line: 236, column: 18, scope: !465)
!474 = distinct !{!474, !189}
!475 = !MDLocation(line: 238, column: 3, scope: !50)
!476 = !MDLocation(line: 239, column: 1, scope: !50)
!477 = !MDLocation(line: 243, column: 5, scope: !61)
!478 = !MDLocation(line: 242, column: 8, scope: !61)
!479 = !MDLocation(line: 243, column: 8, scope: !61)
!480 = !MDLocation(line: 264, column: 8, scope: !61)
!481 = !MDLocation(line: 265, column: 10, scope: !61)
!482 = !MDLocation(line: 268, column: 7, scope: !483)
!483 = !{!"0xb\00268\007\0072", !1, !61}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!484 = !MDLocation(line: 268, column: 14, scope: !485)
!485 = !{!"0xb\002", !1, !483}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!486 = !MDLocation(line: 268, column: 7, scope: !61)
!487 = !{!"0x100\00u\00335\000", !75, !7, !12, !488} ; [ DW_TAG_auto_variable ] [u] [line 335]
!488 = !MDLocation(line: 270, column: 25, scope: !61)
!489 = !MDLocation(line: 335, column: 11, scope: !75, inlinedAt: !488)
!490 = !{!"0x100\00comp\00335\000", !75, !7, !12, !488} ; [ DW_TAG_auto_variable ] [comp] [line 335]
!491 = !MDLocation(line: 335, column: 22, scope: !75, inlinedAt: !488)
!492 = !MDLocation(line: 265, column: 23, scope: !61)
!493 = !MDLocation(line: 265, column: 30, scope: !61)
!494 = !MDLocation(line: 272, column: 17, scope: !61)
!495 = !MDLocation(line: 272, column: 11, scope: !61)
!496 = !MDLocation(line: 265, column: 37, scope: !61)
!497 = !MDLocation(line: 263, column: 16, scope: !61)
!498 = !MDLocation(line: 276, column: 10, scope: !61)
!499 = !MDLocation(line: 278, column: 5, scope: !500)
!500 = !{!"0xb\00276\0032\0073", !1, !61}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!501 = !MDLocation(line: 276, column: 19, scope: !61)
!502 = !MDLocation(line: 276, column: 3, scope: !503)
!503 = !{!"0xb\003", !1, !61}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!504 = !MDLocation(line: 283, column: 7, scope: !505)
!505 = !{!"0xb\00283\007\0075", !1, !61}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!506 = !MDLocation(line: 277, column: 5, scope: !500)
!507 = !MDLocation(line: 283, column: 7, scope: !508)
!508 = !{!"0xb\002", !1, !505}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!509 = !MDLocation(line: 283, column: 7, scope: !510)
!510 = !{!"0xb\004", !1, !511}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!511 = !{!"0xb\003", !1, !505}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!512 = !MDLocation(line: 283, column: 7, scope: !61)
!513 = !MDLocation(line: 284, column: 12, scope: !514)
!514 = !{!"0xb\00284\005\0078", !1, !515}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!515 = !{!"0xb\00284\005\0077", !1, !516}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!516 = !{!"0xb\00283\0028\0076", !1, !505}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!517 = !MDLocation(line: 284, column: 5, scope: !515)
!518 = !MDLocation(line: 285, column: 11, scope: !519)
!519 = !{!"0xb\00285\0011\0080", !1, !520}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!520 = !{!"0xb\00284\0033\0079", !1, !514}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!521 = !MDLocation(line: 285, column: 11, scope: !522)
!522 = !{!"0xb\002", !1, !519}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!523 = !MDLocation(line: 285, column: 11, scope: !524)
!524 = !{!"0xb\004", !1, !525}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!525 = !{!"0xb\003", !1, !519}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!526 = !MDLocation(line: 285, column: 11, scope: !520)
!527 = !MDLocation(line: 286, column: 14, scope: !520)
!528 = !MDLocation(line: 286, column: 7, scope: !520)
!529 = !MDLocation(line: 284, column: 17, scope: !514)
!530 = !MDLocation(line: 284, column: 22, scope: !514)
!531 = !MDLocation(line: 288, column: 11, scope: !516)
!532 = !MDLocation(line: 289, column: 5, scope: !516)
!533 = !MDLocation(line: 292, column: 13, scope: !534)
!534 = !{!"0xb\00291\008\0081", !1, !505}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!535 = !MDLocation(line: 292, column: 13, scope: !536)
!536 = !{!"0xb\002", !1, !534}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!537 = !MDLocation(line: 266, column: 9, scope: !61)
!538 = !MDLocation(line: 295, column: 5, scope: !534)
!539 = !MDLocation(line: 294, column: 5, scope: !534)
!540 = !MDLocation(line: 296, column: 12, scope: !541)
!541 = !{!"0xb\00296\005\0083", !1, !542}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!542 = !{!"0xb\00296\005\0082", !1, !534}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!543 = !MDLocation(line: 296, column: 5, scope: !542)
!544 = !MDLocation(line: 293, column: 5, scope: !534)
!545 = !MDLocation(line: 297, column: 11, scope: !546)
!546 = !{!"0xb\00297\0011\0085", !1, !547}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!547 = !{!"0xb\00296\0033\0084", !1, !541}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!548 = !MDLocation(line: 297, column: 11, scope: !549)
!549 = !{!"0xb\002", !1, !546}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!550 = !MDLocation(line: 297, column: 11, scope: !551)
!551 = !{!"0xb\004", !1, !552}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!552 = !{!"0xb\003", !1, !546}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!553 = !MDLocation(line: 297, column: 11, scope: !547)
!554 = !MDLocation(line: 298, column: 13, scope: !555)
!555 = !{!"0xb\00297\0032\0086", !1, !546}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!556 = !MDLocation(line: 298, column: 9, scope: !555)
!557 = !MDLocation(line: 298, column: 8, scope: !555)
!558 = !MDLocation(line: 299, column: 2, scope: !555)
!559 = !MDLocation(line: 301, column: 11, scope: !560)
!560 = !{!"0xb\00301\0011\0087", !1, !547}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!561 = !MDLocation(line: 301, column: 11, scope: !562)
!562 = !{!"0xb\002", !1, !560}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!563 = !MDLocation(line: 301, column: 11, scope: !547)
!564 = !MDLocation(line: 302, column: 20, scope: !565)
!565 = !{!"0xb\00301\0031\0088", !1, !560}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!566 = !MDLocation(line: 302, column: 19, scope: !565)
!567 = !MDLocation(line: 302, column: 15, scope: !565)
!568 = !MDLocation(line: 302, column: 9, scope: !565)
!569 = !MDLocation(line: 303, column: 9, scope: !565)
!570 = !MDLocation(line: 303, column: 9, scope: !571)
!571 = !{!"0xb\002", !1, !565}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!572 = !MDLocation(line: 306, column: 15, scope: !547)
!573 = !MDLocation(line: 306, column: 14, scope: !547)
!574 = !MDLocation(line: 306, column: 7, scope: !547)
!575 = !MDLocation(line: 308, column: 13, scope: !534)
!576 = !MDLocation(line: 308, column: 26, scope: !534)
!577 = !MDLocation(line: 308, column: 5, scope: !534)
!578 = !MDLocation(line: 312, column: 21, scope: !61)
!579 = !MDLocation(line: 312, column: 17, scope: !61)
!580 = !MDLocation(line: 312, column: 16, scope: !61)
!581 = !MDLocation(line: 312, column: 10, scope: !61)
!582 = !MDLocation(line: 313, column: 10, scope: !61)
!583 = !MDLocation(line: 313, column: 10, scope: !584)
!584 = !{!"0xb\002", !1, !61}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!585 = !MDLocation(line: 315, column: 3, scope: !61)
!586 = !MDLocation(line: 316, column: 10, scope: !587)
!587 = !{!"0xb\00316\003\0090", !1, !588}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!588 = !{!"0xb\00316\003\0089", !1, !61}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!589 = !MDLocation(line: 316, column: 3, scope: !588)
!590 = !MDLocation(line: 314, column: 3, scope: !61)
!591 = !MDLocation(line: 317, column: 9, scope: !592)
!592 = !{!"0xb\00317\009\0092", !1, !593}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!593 = !{!"0xb\00316\0031\0091", !1, !587}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!594 = !MDLocation(line: 317, column: 9, scope: !595)
!595 = !{!"0xb\002", !1, !592}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!596 = !MDLocation(line: 317, column: 9, scope: !593)
!597 = !MDLocation(line: 318, column: 25, scope: !598)
!598 = !{!"0xb\00317\0029\0093", !1, !592}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!599 = !MDLocation(line: 318, column: 24, scope: !598)
!600 = !MDLocation(line: 318, column: 20, scope: !598)
!601 = !MDLocation(line: 318, column: 14, scope: !598)
!602 = !MDLocation(line: 319, column: 14, scope: !598)
!603 = !MDLocation(line: 319, column: 14, scope: !604)
!604 = !{!"0xb\002", !1, !598}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!605 = !MDLocation(line: 322, column: 13, scope: !593)
!606 = !MDLocation(line: 322, column: 12, scope: !593)
!607 = !MDLocation(line: 322, column: 5, scope: !593)
!608 = !MDLocation(line: 324, column: 11, scope: !61)
!609 = !MDLocation(line: 324, column: 24, scope: !61)
!610 = !MDLocation(line: 324, column: 3, scope: !61)
!611 = !MDLocation(line: 325, column: 1, scope: !61)
!612 = !MDLocation(line: 335, column: 11, scope: !75)
!613 = !MDLocation(line: 335, column: 22, scope: !75)
!614 = !MDLocation(line: 342, column: 5, scope: !75)
!615 = !MDLocation(line: 358, column: 5, scope: !80)
!616 = !MDLocation(line: 358, column: 8, scope: !80)
!617 = !MDLocation(line: 358, column: 11, scope: !80)
!618 = !MDLocation(line: 358, column: 14, scope: !80)
!619 = !MDLocation(line: 358, column: 17, scope: !80)
!620 = !MDLocation(line: 358, column: 20, scope: !80)
!621 = !MDLocation(line: 358, column: 23, scope: !80)
!622 = !MDLocation(line: 358, column: 26, scope: !80)
!623 = !MDLocation(line: 358, column: 29, scope: !80)
!624 = !MDLocation(line: 358, column: 32, scope: !80)
!625 = !MDLocation(line: 358, column: 35, scope: !80)
!626 = !MDLocation(line: 358, column: 38, scope: !80)
!627 = !MDLocation(line: 358, column: 41, scope: !80)
!628 = !MDLocation(line: 358, column: 44, scope: !80)
!629 = !MDLocation(line: 358, column: 47, scope: !80)
!630 = !MDLocation(line: 358, column: 50, scope: !80)
!631 = !MDLocation(line: 362, column: 9, scope: !80)
!632 = !MDLocation(line: 360, column: 9, scope: !80)
!633 = !MDLocation(line: 364, column: 9, scope: !634)
!634 = !{!"0xb\00364\009\0096", !1, !80}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!635 = !MDLocation(line: 364, column: 9, scope: !80)
!636 = !MDLocation(line: 366, column: 9, scope: !637)
!637 = !{!"0xb\00366\009\0097", !1, !80}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!638 = !MDLocation(line: 366, column: 9, scope: !80)
!639 = !MDLocation(line: 367, column: 9, scope: !640)
!640 = !{!"0xb\00367\009\0098", !1, !80}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!641 = !MDLocation(line: 367, column: 9, scope: !80)
!642 = !MDLocation(line: 369, column: 9, scope: !643)
!643 = !{!"0xb\00369\009\0099", !1, !80}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!644 = !MDLocation(line: 369, column: 9, scope: !80)
!645 = !MDLocation(line: 370, column: 9, scope: !646)
!646 = !{!"0xb\00370\009\00100", !1, !80}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!647 = !MDLocation(line: 370, column: 9, scope: !80)
!648 = !MDLocation(line: 372, column: 9, scope: !649)
!649 = !{!"0xb\00372\009\00101", !1, !80}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!650 = !MDLocation(line: 372, column: 9, scope: !80)
!651 = !MDLocation(line: 373, column: 9, scope: !652)
!652 = !{!"0xb\00373\009\00102", !1, !80}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!653 = !MDLocation(line: 373, column: 9, scope: !80)
!654 = !MDLocation(line: 375, column: 9, scope: !655)
!655 = !{!"0xb\00375\009\00103", !1, !80}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!656 = !MDLocation(line: 375, column: 9, scope: !80)
!657 = !MDLocation(line: 376, column: 9, scope: !658)
!658 = !{!"0xb\00376\009\00104", !1, !80}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!659 = !MDLocation(line: 376, column: 9, scope: !80)
!660 = !MDLocation(line: 378, column: 9, scope: !661)
!661 = !{!"0xb\00378\009\00105", !1, !80}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!662 = !MDLocation(line: 378, column: 9, scope: !80)
!663 = !MDLocation(line: 379, column: 9, scope: !664)
!664 = !{!"0xb\00379\009\00106", !1, !80}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!665 = !MDLocation(line: 379, column: 9, scope: !80)
!666 = !MDLocation(line: 381, column: 9, scope: !667)
!667 = !{!"0xb\00381\009\00107", !1, !80}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!668 = !MDLocation(line: 381, column: 9, scope: !80)
!669 = !MDLocation(line: 382, column: 9, scope: !670)
!670 = !{!"0xb\00382\009\00108", !1, !80}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!671 = !MDLocation(line: 382, column: 9, scope: !80)
!672 = !MDLocation(line: 384, column: 9, scope: !673)
!673 = !{!"0xb\00384\009\00109", !1, !80}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!674 = !MDLocation(line: 384, column: 9, scope: !80)
!675 = !MDLocation(line: 385, column: 9, scope: !676)
!676 = !{!"0xb\00385\009\00110", !1, !80}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!677 = !MDLocation(line: 385, column: 9, scope: !80)
!678 = !MDLocation(line: 387, column: 9, scope: !679)
!679 = !{!"0xb\00387\009\00111", !1, !80}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!680 = !MDLocation(line: 387, column: 9, scope: !80)
!681 = !MDLocation(line: 388, column: 9, scope: !682)
!682 = !{!"0xb\00388\009\00112", !1, !80}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!683 = !MDLocation(line: 388, column: 9, scope: !80)
!684 = !MDLocation(line: 390, column: 9, scope: !685)
!685 = !{!"0xb\00390\009\00113", !1, !80}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!686 = !MDLocation(line: 390, column: 9, scope: !80)
!687 = !MDLocation(line: 391, column: 9, scope: !688)
!688 = !{!"0xb\00391\009\00114", !1, !80}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!689 = !MDLocation(line: 391, column: 9, scope: !80)
!690 = !MDLocation(line: 393, column: 9, scope: !691)
!691 = !{!"0xb\00393\009\00115", !1, !80}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!692 = !MDLocation(line: 393, column: 9, scope: !80)
!693 = !MDLocation(line: 394, column: 9, scope: !694)
!694 = !{!"0xb\00394\009\00116", !1, !80}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!695 = !MDLocation(line: 394, column: 9, scope: !80)
!696 = !MDLocation(line: 396, column: 9, scope: !697)
!697 = !{!"0xb\00396\009\00117", !1, !80}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!698 = !MDLocation(line: 396, column: 9, scope: !80)
!699 = !MDLocation(line: 397, column: 9, scope: !700)
!700 = !{!"0xb\00397\009\00118", !1, !80}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!701 = !MDLocation(line: 397, column: 9, scope: !80)
!702 = !MDLocation(line: 399, column: 9, scope: !703)
!703 = !{!"0xb\00399\009\00119", !1, !80}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!704 = !MDLocation(line: 399, column: 9, scope: !80)
!705 = !MDLocation(line: 400, column: 9, scope: !706)
!706 = !{!"0xb\00400\009\00120", !1, !80}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!707 = !MDLocation(line: 400, column: 9, scope: !80)
!708 = !MDLocation(line: 402, column: 9, scope: !709)
!709 = !{!"0xb\00402\009\00121", !1, !80}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!710 = !MDLocation(line: 402, column: 9, scope: !80)
!711 = !MDLocation(line: 403, column: 9, scope: !712)
!712 = !{!"0xb\00403\009\00122", !1, !80}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!713 = !MDLocation(line: 403, column: 9, scope: !80)
!714 = !MDLocation(line: 405, column: 9, scope: !715)
!715 = !{!"0xb\00405\009\00123", !1, !80}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!716 = !MDLocation(line: 405, column: 9, scope: !80)
!717 = !MDLocation(line: 406, column: 5, scope: !80)
!718 = !MDLocation(line: 407, column: 1, scope: !80)
!719 = !MDLocation(line: 409, column: 9, scope: !101)
!720 = !MDLocation(line: 410, column: 8, scope: !101)
!721 = !MDLocation(line: 410, column: 13, scope: !101)
!722 = !MDLocation(line: 409, column: 12, scope: !101)
!723 = !MDLocation(line: 427, column: 7, scope: !724)
!724 = !{!"0xb\00427\007\00124", !1, !101}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!725 = !MDLocation(line: 427, column: 7, scope: !101)
!726 = !MDLocation(line: 430, column: 7, scope: !727)
!727 = !{!"0xb\00430\007\00125", !1, !101}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!728 = !MDLocation(line: 430, column: 7, scope: !101)
!729 = !MDLocation(line: 437, column: 3, scope: !730)
!730 = !{!"0xb\00437\003\00130", !1, !101}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!731 = !MDLocation(line: 437, column: 18, scope: !732)
!732 = !{!"0xb\00437\003\00131", !1, !730}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!733 = !MDLocation(line: 438, column: 5, scope: !732)
!734 = distinct !{!734, !189}
!735 = distinct !{!735, !220, !221}
!736 = !MDLocation(line: 425, column: 7, scope: !101)
!737 = !MDLocation(line: 437, column: 23, scope: !732)
!738 = distinct !{!738, !189}
!739 = !MDLocation(line: 431, column: 9, scope: !740)
!740 = !{!"0xb\00431\009\00127", !1, !741}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!741 = !{!"0xb\00430\0019\00126", !1, !727}       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!742 = !MDLocation(line: 431, column: 9, scope: !741)
!743 = !MDLocation(line: 431, column: 27, scope: !740)
!744 = !MDLocation(line: 431, column: 26, scope: !740)
!745 = !MDLocation(line: 431, column: 20, scope: !740)
!746 = !MDLocation(line: 432, column: 25, scope: !747)
!747 = !{!"0xb\00432\005\00129", !1, !748}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!748 = !{!"0xb\00432\005\00128", !1, !741}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!749 = !MDLocation(line: 432, column: 5, scope: !748)
!750 = !MDLocation(line: 433, column: 4, scope: !747)
!751 = !MDLocation(line: 432, column: 20, scope: !747)
!752 = distinct !{!752, !189}
!753 = distinct !{!753, !220, !221}
!754 = !MDLocation(line: 440, column: 1, scope: !101)
!755 = !MDLocation(line: 442, column: 5, scope: !110)
!756 = !MDLocation(line: 443, column: 8, scope: !110)
!757 = !MDLocation(line: 443, column: 12, scope: !110)
!758 = !MDLocation(line: 443, column: 16, scope: !110)
!759 = !MDLocation(line: 442, column: 8, scope: !110)
!760 = !MDLocation(line: 462, column: 7, scope: !761)
!761 = !{!"0xb\00462\007\00132", !1, !110}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!762 = !MDLocation(line: 462, column: 7, scope: !110)
!763 = !MDLocation(line: 464, column: 7, scope: !764)
!764 = !{!"0xb\00464\007\00133", !1, !110}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!765 = !MDLocation(line: 460, column: 16, scope: !110)
!766 = !MDLocation(line: 465, column: 5, scope: !767)
!767 = !{!"0xb\00465\005\00134", !1, !764}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!768 = !MDLocation(line: 466, column: 12, scope: !769)
!769 = !{!"0xb\00465\005\00135", !1, !767}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!770 = !MDLocation(line: 465, column: 20, scope: !769)
!771 = !MDLocation(line: 464, column: 7, scope: !110)
!772 = !MDLocation(line: 468, column: 20, scope: !773)
!773 = !{!"0xb\00468\005\00137", !1, !774}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!774 = !{!"0xb\00468\005\00136", !1, !764}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!775 = !MDLocation(line: 469, column: 12, scope: !773)
!776 = !MDLocation(line: 469, column: 17, scope: !773)
!777 = !MDLocation(line: 469, column: 7, scope: !773)
!778 = distinct !{!778, !189}
!779 = distinct !{!779, !220, !221}
!780 = !MDLocation(line: 468, column: 25, scope: !773)
!781 = !MDLocation(line: 468, column: 30, scope: !773)
!782 = !MDLocation(line: 468, column: 35, scope: !773)
!783 = !MDLocation(line: 468, column: 5, scope: !774)
!784 = distinct !{!784, !189}
!785 = !MDLocation(line: 466, column: 17, scope: !769)
!786 = !MDLocation(line: 466, column: 7, scope: !769)
!787 = distinct !{!787, !189}
!788 = distinct !{!788, !220, !221}
!789 = !MDLocation(line: 465, column: 25, scope: !769)
!790 = !MDLocation(line: 465, column: 30, scope: !769)
!791 = !MDLocation(line: 465, column: 35, scope: !769)
!792 = distinct !{!792, !189}
!793 = distinct !{!793, !220, !221}
!794 = distinct !{!794, !220, !221}
!795 = !MDLocation(line: 470, column: 1, scope: !110)
!796 = !MDLocation(line: 472, column: 5, scope: !120)
!797 = !MDLocation(line: 473, column: 8, scope: !120)
!798 = !MDLocation(line: 473, column: 11, scope: !120)
!799 = !MDLocation(line: 484, column: 7, scope: !800)
!800 = !{!"0xb\00484\007\00138", !1, !120}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!801 = !MDLocation(line: 484, column: 7, scope: !120)
!802 = !MDLocation(line: 485, column: 3, scope: !803)
!803 = !{!"0xb\00485\003\00139", !1, !120}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!804 = !MDLocation(line: 485, column: 18, scope: !805)
!805 = !{!"0xb\00485\003\00140", !1, !803}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!806 = !MDLocation(line: 486, column: 5, scope: !805)
!807 = distinct !{!807, !189}
!808 = distinct !{!808, !220, !221}
!809 = !MDLocation(line: 482, column: 16, scope: !120)
!810 = !MDLocation(line: 485, column: 23, scope: !805)
!811 = distinct !{!811, !189}
!812 = distinct !{!812, !220, !221}
!813 = !MDLocation(line: 487, column: 1, scope: !120)
