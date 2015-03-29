; ModuleID = 'lpbench.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stdout = external global %struct._IO_FILE*
@.str1 = private unnamed_addr constant [3 x i8] c"%f\00", align 1
@.str2 = private unnamed_addr constant [33 x i8] c"\0Alpbench (Std. C) run time: %f\0A\0A\00", align 1
@seed = internal unnamed_addr global i64 1325, align 8

; Function Attrs: nounwind uwtable
define void @matgen(double** nocapture readonly %a, double* nocapture %b) #0 {
entry:
  tail call void @llvm.dbg.value(metadata double** %a, i64 0, metadata !26, metadata !166), !dbg !167
  tail call void @llvm.dbg.value(metadata double* %b, i64 0, metadata !27, metadata !166), !dbg !168
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !28, metadata !166), !dbg !169
  %b67 = bitcast double* %b to i8*
  %seed.promoted59 = load i64* @seed, align 8, !dbg !170, !tbaa !176
  br label %for.cond1.preheader, !dbg !180

for.cond1.preheader:                              ; preds = %for.inc6, %entry
  %indvars.iv71 = phi i64 [ 0, %entry ], [ %indvars.iv.next72, %for.inc6 ]
  %xor5.i.lcssa60 = phi i64 [ %seed.promoted59, %entry ], [ %xor5.i.lcssa, %for.inc6 ]
  br label %for.body3, !dbg !181

for.cond9.preheader:                              ; preds = %for.inc6
  %xor5.i.lcssa.lcssa = phi i64 [ %xor5.i.lcssa, %for.inc6 ]
  store i64 %xor5.i.lcssa.lcssa, i64* @seed, align 8, !dbg !170, !tbaa !176
  call void @llvm.memset.p0i8.i64(i8* %b67, i8 0, i64 16000, i32 8, i1 false), !dbg !182
  %scevgep = getelementptr double* %b, i64 1999
  br label %for.cond20.preheader, !dbg !185

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv68 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next69, %for.body3 ]
  %xor5.i57 = phi i64 [ %xor5.i.lcssa60, %for.cond1.preheader ], [ %xor5.i, %for.body3 ], !dbg !187
  %xor.i = xor i64 %xor5.i57, 123459876, !dbg !187
  %div.i = sdiv i64 %xor.i, 127773, !dbg !188
  tail call void @llvm.dbg.value(metadata i64 %div.i, i64 0, metadata !189, metadata !166), !dbg !190
  %0 = mul i64 %div.i, -127773, !dbg !191
  %sub7.i51 = add i64 %xor.i, %0, !dbg !191
  %mul1.i = mul nsw i64 %sub7.i51, 16807, !dbg !192
  %1 = mul i64 %div.i, -2836, !dbg !192
  %sub38.i52 = add i64 %mul1.i, %1, !dbg !192
  %cmp.i = icmp slt i64 %sub38.i52, 0, !dbg !193
  %add.i = add nsw i64 %sub38.i52, 2147483647, !dbg !195
  %add.sub3.i = select i1 %cmp.i, i64 %add.i, i64 %sub38.i52, !dbg !196
  %conv.i = sitofp i64 %add.sub3.i to double, !dbg !197
  %mul4.i = fmul double %conv.i, 0x3E00000000200FE1, !dbg !198
  tail call void @llvm.dbg.value(metadata double %mul4.i, i64 0, metadata !199, metadata !166), !dbg !200
  %xor5.i = xor i64 %add.sub3.i, 123459876, !dbg !170
  %arrayidx = getelementptr inbounds double** %a, i64 %indvars.iv68, !dbg !201
  %2 = load double** %arrayidx, align 8, !dbg !201, !tbaa !202
  %arrayidx5 = getelementptr inbounds double* %2, i64 %indvars.iv71, !dbg !201
  store double %mul4.i, double* %arrayidx5, align 8, !dbg !201, !tbaa !204
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1, !dbg !181
  %exitcond70 = icmp eq i64 %indvars.iv.next69, 2000, !dbg !181
  br i1 %exitcond70, label %for.inc6, label %for.body3, !dbg !181

for.inc6:                                         ; preds = %for.body3
  %xor5.i.lcssa = phi i64 [ %xor5.i, %for.body3 ]
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1, !dbg !180
  %exitcond73 = icmp eq i64 %indvars.iv.next72, 2000, !dbg !180
  br i1 %exitcond73, label %for.cond9.preheader, label %for.cond1.preheader, !dbg !180

for.cond20.preheader:                             ; preds = %for.inc32, %for.cond9.preheader
  %indvars.iv61 = phi i64 [ 0, %for.cond9.preheader ], [ %indvars.iv.next62, %for.inc32 ]
  %arrayidx25 = getelementptr inbounds double** %a, i64 %indvars.iv61, !dbg !206
  %3 = load double** %arrayidx25, align 8, !dbg !206, !tbaa !202
  %scevgep75 = getelementptr double* %3, i64 1999
  %bound0 = icmp uge double* %scevgep75, %b
  %bound1 = icmp ule double* %3, %scevgep
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %middle.block, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond20.preheader
  br label %vector.body, !dbg !206

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ], !dbg !210
  %4 = getelementptr inbounds double* %3, i64 %index, !dbg !206
  %5 = bitcast double* %4 to <2 x double>*, !dbg !206
  %wide.load = load <2 x double>* %5, align 8, !dbg !206, !tbaa !204
  %.sum81 = or i64 %index, 2, !dbg !206
  %6 = getelementptr double* %3, i64 %.sum81, !dbg !206
  %7 = bitcast double* %6 to <2 x double>*, !dbg !206
  %wide.load78 = load <2 x double>* %7, align 8, !dbg !206, !tbaa !204
  %8 = getelementptr inbounds double* %b, i64 %index, !dbg !211
  %9 = bitcast double* %8 to <2 x double>*, !dbg !211
  %wide.load79 = load <2 x double>* %9, align 8, !dbg !211, !tbaa !204
  %.sum82 = or i64 %index, 2, !dbg !211
  %10 = getelementptr double* %b, i64 %.sum82, !dbg !211
  %11 = bitcast double* %10 to <2 x double>*, !dbg !211
  %wide.load80 = load <2 x double>* %11, align 8, !dbg !211, !tbaa !204
  %12 = fadd <2 x double> %wide.load, %wide.load79, !dbg !211
  %13 = fadd <2 x double> %wide.load78, %wide.load80, !dbg !211
  %14 = bitcast double* %8 to <2 x double>*, !dbg !211
  store <2 x double> %12, <2 x double>* %14, align 8, !dbg !211, !tbaa !204
  %15 = bitcast double* %10 to <2 x double>*, !dbg !211
  store <2 x double> %13, <2 x double>* %15, align 8, !dbg !211, !tbaa !204
  %index.next = add i64 %index, 4, !dbg !210
  %16 = icmp eq i64 %index.next, 2000, !dbg !210
  br i1 %16, label %middle.block.loopexit, label %vector.body, !dbg !210, !llvm.loop !212

middle.block.loopexit:                            ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %for.cond20.preheader
  %resume.val = phi i1 [ false, %for.cond20.preheader ], [ true, %middle.block.loopexit ]
  %trunc.resume.val = phi i64 [ 0, %for.cond20.preheader ], [ 2000, %middle.block.loopexit ]
  br i1 %resume.val, label %for.inc32, label %for.body22.preheader

for.body22.preheader:                             ; preds = %middle.block
  %17 = sub i64 2000, %trunc.resume.val
  %xtraiter = and i64 %17, 1
  %lcmp.mod = icmp ne i64 %xtraiter, 0
  %lcmp.overflow = icmp eq i64 %17, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %for.body22.prol.preheader, label %for.body22.preheader.split

for.body22.prol.preheader:                        ; preds = %for.body22.preheader
  br label %for.body22.prol, !dbg !206

for.body22.prol:                                  ; preds = %for.body22.prol.preheader, %for.body22.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body22.prol ], [ %trunc.resume.val, %for.body22.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body22.prol ], [ %xtraiter, %for.body22.prol.preheader ]
  %arrayidx26.prol = getelementptr inbounds double* %3, i64 %indvars.iv.prol, !dbg !206
  %18 = load double* %arrayidx26.prol, align 8, !dbg !206, !tbaa !204
  %arrayidx28.prol = getelementptr inbounds double* %b, i64 %indvars.iv.prol, !dbg !211
  %19 = load double* %arrayidx28.prol, align 8, !dbg !211, !tbaa !204
  %add.prol = fadd double %18, %19, !dbg !211
  store double %add.prol, double* %arrayidx28.prol, align 8, !dbg !211, !tbaa !204
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1, !dbg !210
  %exitcond.prol = icmp eq i64 %indvars.iv.next.prol, 2000, !dbg !210
  %prol.iter.sub = sub i64 %prol.iter, 1, !dbg !210
  %prol.iter.cmp = icmp ne i64 %prol.iter.sub, 0, !dbg !210
  br i1 %prol.iter.cmp, label %for.body22.prol, label %for.body22.preheader.split.loopexit, !llvm.loop !215

for.body22.preheader.split.loopexit:              ; preds = %for.body22.prol
  %indvars.iv.unr.ph = phi i64 [ %indvars.iv.next.prol, %for.body22.prol ]
  br label %for.body22.preheader.split

for.body22.preheader.split:                       ; preds = %for.body22.preheader.split.loopexit, %for.body22.preheader
  %indvars.iv.unr = phi i64 [ %trunc.resume.val, %for.body22.preheader ], [ %indvars.iv.unr.ph, %for.body22.preheader.split.loopexit ]
  %20 = icmp ult i64 %17, 2
  br i1 %20, label %for.inc32.loopexit, label %for.body22.preheader.split.split

for.body22.preheader.split.split:                 ; preds = %for.body22.preheader.split
  br label %for.body22, !dbg !206

for.body22:                                       ; preds = %for.body22, %for.body22.preheader.split.split
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.body22.preheader.split.split ], [ %indvars.iv.next.1, %for.body22 ]
  %arrayidx26 = getelementptr inbounds double* %3, i64 %indvars.iv, !dbg !206
  %21 = load double* %arrayidx26, align 8, !dbg !206, !tbaa !204
  %arrayidx28 = getelementptr inbounds double* %b, i64 %indvars.iv, !dbg !211
  %22 = load double* %arrayidx28, align 8, !dbg !211, !tbaa !204
  %add = fadd double %21, %22, !dbg !211
  store double %add, double* %arrayidx28, align 8, !dbg !211, !tbaa !204
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !210
  %arrayidx26.1 = getelementptr inbounds double* %3, i64 %indvars.iv.next, !dbg !206
  %23 = load double* %arrayidx26.1, align 8, !dbg !206, !tbaa !204
  %arrayidx28.1 = getelementptr inbounds double* %b, i64 %indvars.iv.next, !dbg !211
  %24 = load double* %arrayidx28.1, align 8, !dbg !211, !tbaa !204
  %add.1 = fadd double %23, %24, !dbg !211
  store double %add.1, double* %arrayidx28.1, align 8, !dbg !211, !tbaa !204
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv.next, 1, !dbg !210
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000, !dbg !210
  br i1 %exitcond.1, label %for.inc32.loopexit.unr-lcssa, label %for.body22, !dbg !210, !llvm.loop !217

for.inc32.loopexit.unr-lcssa:                     ; preds = %for.body22
  br label %for.inc32.loopexit

for.inc32.loopexit:                               ; preds = %for.body22.preheader.split, %for.inc32.loopexit.unr-lcssa
  br label %for.inc32

for.inc32:                                        ; preds = %for.inc32.loopexit, %middle.block
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1, !dbg !185
  %exitcond63 = icmp eq i64 %indvars.iv.next62, 2000, !dbg !185
  br i1 %exitcond63, label %for.end34, label %for.cond20.preheader, !dbg !185

for.end34:                                        ; preds = %for.inc32
  ret void, !dbg !218
}

; Function Attrs: nounwind readonly uwtable
define i32 @idamax(i32 %n, double* nocapture readonly %dx, i32 %dx_off, i32 %incx) #1 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %n, i64 0, metadata !34, metadata !166), !dbg !219
  tail call void @llvm.dbg.value(metadata double* %dx, i64 0, metadata !35, metadata !166), !dbg !220
  tail call void @llvm.dbg.value(metadata i32 %dx_off, i64 0, metadata !36, metadata !166), !dbg !221
  tail call void @llvm.dbg.value(metadata i32 %incx, i64 0, metadata !37, metadata !166), !dbg !222
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !42, metadata !166), !dbg !223
  %cmp = icmp slt i32 %n, 1, !dbg !224
  br i1 %cmp, label %if.end33, label %if.else, !dbg !226

if.else:                                          ; preds = %entry
  %cmp1 = icmp eq i32 %n, 1, !dbg !227
  br i1 %cmp1, label %if.end33, label %if.else3, !dbg !230

if.else3:                                         ; preds = %if.else
  %cmp4 = icmp eq i32 %incx, 1, !dbg !231
  %idxprom15 = sext i32 %dx_off to i64, !dbg !234
  %arrayidx16 = getelementptr inbounds double* %dx, i64 %idxprom15, !dbg !234
  %0 = load double* %arrayidx16, align 8, !dbg !234, !tbaa !204
  %call17 = tail call double @fabs(double %0) #4, !dbg !236
  tail call void @llvm.dbg.value(metadata double %call17, i64 0, metadata !38, metadata !166), !dbg !237
  br i1 %cmp4, label %for.body20.lr.ph, label %for.body.lr.ph, !dbg !238

for.body20.lr.ph:                                 ; preds = %if.else3
  %1 = add i32 %n, -1, !dbg !239
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp ne i32 %xtraiter, 0
  %lcmp.overflow = icmp eq i32 %1, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %for.body20.prol, label %for.body20.lr.ph.split

for.body20.prol:                                  ; preds = %for.body20.prol, %for.body20.lr.ph
  %indvars.iv.prol = phi i64 [ 1, %for.body20.lr.ph ], [ %indvars.iv.next.prol, %for.body20.prol ]
  %itemp.260.prol = phi i32 [ 0, %for.body20.lr.ph ], [ %itemp.3.prol, %for.body20.prol ]
  %dmax.258.prol = phi double [ %call17, %for.body20.lr.ph ], [ %dmax.3.prol, %for.body20.prol ]
  %prol.iter = phi i32 [ %xtraiter, %for.body20.lr.ph ], [ %prol.iter.sub, %for.body20.prol ]
  %2 = add nsw i64 %indvars.iv.prol, %idxprom15, !dbg !241
  %arrayidx23.prol = getelementptr inbounds double* %dx, i64 %2, !dbg !244
  %3 = load double* %arrayidx23.prol, align 8, !dbg !244, !tbaa !204
  %call24.prol = tail call double @fabs(double %3) #4, !dbg !245
  tail call void @llvm.dbg.value(metadata double %call24.prol, i64 0, metadata !39, metadata !166), !dbg !246
  %cmp25.prol = fcmp ogt double %call24.prol, %dmax.258.prol, !dbg !247
  tail call void @llvm.dbg.value(metadata double %call24.prol, i64 0, metadata !38, metadata !166), !dbg !237
  %dmax.3.prol = select i1 %cmp25.prol, double %call24.prol, double %dmax.258.prol, !dbg !249
  %4 = trunc i64 %indvars.iv.prol to i32, !dbg !249
  %itemp.3.prol = select i1 %cmp25.prol, i32 %4, i32 %itemp.260.prol, !dbg !249
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1, !dbg !239
  %exitcond.prol = icmp eq i32 %4, %1, !dbg !239
  %prol.iter.sub = sub i32 %prol.iter, 1, !dbg !239
  %prol.iter.cmp = icmp ne i32 %prol.iter.sub, 0, !dbg !239
  br i1 %prol.iter.cmp, label %for.body20.prol, label %for.body20.lr.ph.split, !llvm.loop !250

for.body20.lr.ph.split:                           ; preds = %for.body20.prol, %for.body20.lr.ph
  %itemp.3.lcssa.unr = phi i32 [ 0, %for.body20.lr.ph ], [ %itemp.3.prol, %for.body20.prol ]
  %indvars.iv.unr = phi i64 [ 1, %for.body20.lr.ph ], [ %indvars.iv.next.prol, %for.body20.prol ]
  %itemp.260.unr = phi i32 [ 0, %for.body20.lr.ph ], [ %itemp.3.prol, %for.body20.prol ]
  %dmax.258.unr = phi double [ %call17, %for.body20.lr.ph ], [ %dmax.3.prol, %for.body20.prol ]
  %5 = icmp ult i32 %1, 2
  br i1 %5, label %if.end33.loopexit, label %for.body20.lr.ph.split.split

for.body20.lr.ph.split.split:                     ; preds = %for.body20.lr.ph.split
  br label %for.body20, !dbg !239

for.body.lr.ph:                                   ; preds = %if.else3
  tail call void @llvm.dbg.value(metadata i32 %add, i64 0, metadata !41, metadata !166), !dbg !251
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !40, metadata !166), !dbg !252
  %add = add nsw i32 %incx, 1, !dbg !253
  %6 = sext i32 %add to i64
  %7 = sext i32 %incx to i64
  %8 = add i32 %n, -1, !dbg !255
  %xtraiter75 = and i32 %8, 1
  %lcmp.mod76 = icmp ne i32 %xtraiter75, 0
  %lcmp.overflow77 = icmp eq i32 %8, 0
  %lcmp.or78 = or i1 %lcmp.overflow77, %lcmp.mod76
  br i1 %lcmp.or78, label %for.body.prol, label %for.body.lr.ph.split

for.body.prol:                                    ; preds = %for.body.prol, %for.body.lr.ph
  %indvars.iv68.prol = phi i64 [ %6, %for.body.lr.ph ], [ %indvars.iv.next69.prol, %for.body.prol ]
  %itemp.065.prol = phi i32 [ 0, %for.body.lr.ph ], [ %itemp.1.prol, %for.body.prol ]
  %i.063.prol = phi i32 [ 1, %for.body.lr.ph ], [ %inc.prol, %for.body.prol ]
  %dmax.062.prol = phi double [ %call17, %for.body.lr.ph ], [ %dmax.1.prol, %for.body.prol ]
  %prol.iter79 = phi i32 [ %xtraiter75, %for.body.lr.ph ], [ %prol.iter79.sub, %for.body.prol ]
  %9 = add nsw i64 %indvars.iv68.prol, %idxprom15, !dbg !257
  %arrayidx9.prol = getelementptr inbounds double* %dx, i64 %9, !dbg !260
  %10 = load double* %arrayidx9.prol, align 8, !dbg !260, !tbaa !204
  %call10.prol = tail call double @fabs(double %10) #4, !dbg !261
  tail call void @llvm.dbg.value(metadata double %call10.prol, i64 0, metadata !39, metadata !166), !dbg !246
  %cmp11.prol = fcmp ogt double %call10.prol, %dmax.062.prol, !dbg !262
  tail call void @llvm.dbg.value(metadata i32 %inc.prol, i64 0, metadata !42, metadata !166), !dbg !223
  tail call void @llvm.dbg.value(metadata double %call10.prol, i64 0, metadata !38, metadata !166), !dbg !237
  %dmax.1.prol = select i1 %cmp11.prol, double %call10.prol, double %dmax.062.prol, !dbg !264
  %itemp.1.prol = select i1 %cmp11.prol, i32 %i.063.prol, i32 %itemp.065.prol, !dbg !264
  %inc.prol = add nuw nsw i32 %i.063.prol, 1, !dbg !265
  tail call void @llvm.dbg.value(metadata i32 %inc.prol, i64 0, metadata !40, metadata !166), !dbg !252
  %indvars.iv.next69.prol = add nsw i64 %indvars.iv68.prol, %7, !dbg !255
  %exitcond72.prol = icmp eq i32 %i.063.prol, %8, !dbg !255
  %prol.iter79.sub = sub i32 %prol.iter79, 1, !dbg !255
  %prol.iter79.cmp = icmp ne i32 %prol.iter79.sub, 0, !dbg !255
  br i1 %prol.iter79.cmp, label %for.body.prol, label %for.body.lr.ph.split, !llvm.loop !266

for.body.lr.ph.split:                             ; preds = %for.body.prol, %for.body.lr.ph
  %itemp.1.lcssa.unr = phi i32 [ 0, %for.body.lr.ph ], [ %itemp.1.prol, %for.body.prol ]
  %indvars.iv68.unr = phi i64 [ %6, %for.body.lr.ph ], [ %indvars.iv.next69.prol, %for.body.prol ]
  %itemp.065.unr = phi i32 [ 0, %for.body.lr.ph ], [ %itemp.1.prol, %for.body.prol ]
  %i.063.unr = phi i32 [ 1, %for.body.lr.ph ], [ %inc.prol, %for.body.prol ]
  %dmax.062.unr = phi double [ %call17, %for.body.lr.ph ], [ %dmax.1.prol, %for.body.prol ]
  %11 = icmp ult i32 %8, 2
  br i1 %11, label %if.end33.loopexit74, label %for.body.lr.ph.split.split

for.body.lr.ph.split.split:                       ; preds = %for.body.lr.ph.split
  br label %for.body, !dbg !255

for.body:                                         ; preds = %for.body, %for.body.lr.ph.split.split
  %indvars.iv68 = phi i64 [ %indvars.iv68.unr, %for.body.lr.ph.split.split ], [ %indvars.iv.next69.1, %for.body ]
  %itemp.065 = phi i32 [ %itemp.065.unr, %for.body.lr.ph.split.split ], [ %itemp.1.1, %for.body ]
  %i.063 = phi i32 [ %i.063.unr, %for.body.lr.ph.split.split ], [ %inc.1, %for.body ]
  %dmax.062 = phi double [ %dmax.062.unr, %for.body.lr.ph.split.split ], [ %dmax.1.1, %for.body ]
  %12 = add nsw i64 %indvars.iv68, %idxprom15, !dbg !257
  %arrayidx9 = getelementptr inbounds double* %dx, i64 %12, !dbg !260
  %13 = load double* %arrayidx9, align 8, !dbg !260, !tbaa !204
  %call10 = tail call double @fabs(double %13) #4, !dbg !261
  tail call void @llvm.dbg.value(metadata double %call10, i64 0, metadata !39, metadata !166), !dbg !246
  %cmp11 = fcmp ogt double %call10, %dmax.062, !dbg !262
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !42, metadata !166), !dbg !223
  tail call void @llvm.dbg.value(metadata double %call10, i64 0, metadata !38, metadata !166), !dbg !237
  %dmax.1 = select i1 %cmp11, double %call10, double %dmax.062, !dbg !264
  %itemp.1 = select i1 %cmp11, i32 %i.063, i32 %itemp.065, !dbg !264
  %inc = add nuw nsw i32 %i.063, 1, !dbg !265
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !40, metadata !166), !dbg !252
  %indvars.iv.next69 = add nsw i64 %indvars.iv68, %7, !dbg !255
  %14 = add nsw i64 %indvars.iv.next69, %idxprom15, !dbg !257
  %arrayidx9.1 = getelementptr inbounds double* %dx, i64 %14, !dbg !260
  %15 = load double* %arrayidx9.1, align 8, !dbg !260, !tbaa !204
  %call10.1 = tail call double @fabs(double %15) #4, !dbg !261
  tail call void @llvm.dbg.value(metadata double %call10, i64 0, metadata !39, metadata !166), !dbg !246
  %cmp11.1 = fcmp ogt double %call10.1, %dmax.1, !dbg !262
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !42, metadata !166), !dbg !223
  tail call void @llvm.dbg.value(metadata double %call10, i64 0, metadata !38, metadata !166), !dbg !237
  %dmax.1.1 = select i1 %cmp11.1, double %call10.1, double %dmax.1, !dbg !264
  %itemp.1.1 = select i1 %cmp11.1, i32 %inc, i32 %itemp.1, !dbg !264
  %inc.1 = add nuw nsw i32 %inc, 1, !dbg !265
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !40, metadata !166), !dbg !252
  %indvars.iv.next69.1 = add nsw i64 %indvars.iv.next69, %7, !dbg !255
  %exitcond72.1 = icmp eq i32 %inc, %8, !dbg !255
  br i1 %exitcond72.1, label %if.end33.loopexit74.unr-lcssa, label %for.body, !dbg !255

for.body20:                                       ; preds = %for.body20, %for.body20.lr.ph.split.split
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.body20.lr.ph.split.split ], [ %indvars.iv.next.1, %for.body20 ]
  %itemp.260 = phi i32 [ %itemp.260.unr, %for.body20.lr.ph.split.split ], [ %itemp.3.1, %for.body20 ]
  %dmax.258 = phi double [ %dmax.258.unr, %for.body20.lr.ph.split.split ], [ %dmax.3.1, %for.body20 ]
  %16 = add nsw i64 %indvars.iv, %idxprom15, !dbg !241
  %arrayidx23 = getelementptr inbounds double* %dx, i64 %16, !dbg !244
  %17 = load double* %arrayidx23, align 8, !dbg !244, !tbaa !204
  %call24 = tail call double @fabs(double %17) #4, !dbg !245
  tail call void @llvm.dbg.value(metadata double %call24, i64 0, metadata !39, metadata !166), !dbg !246
  %cmp25 = fcmp ogt double %call24, %dmax.258, !dbg !247
  tail call void @llvm.dbg.value(metadata double %call24, i64 0, metadata !38, metadata !166), !dbg !237
  %dmax.3 = select i1 %cmp25, double %call24, double %dmax.258, !dbg !249
  %18 = trunc i64 %indvars.iv to i32, !dbg !249
  %itemp.3 = select i1 %cmp25, i32 %18, i32 %itemp.260, !dbg !249
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !239
  %19 = add nsw i64 %indvars.iv.next, %idxprom15, !dbg !241
  %arrayidx23.1 = getelementptr inbounds double* %dx, i64 %19, !dbg !244
  %20 = load double* %arrayidx23.1, align 8, !dbg !244, !tbaa !204
  %call24.1 = tail call double @fabs(double %20) #4, !dbg !245
  tail call void @llvm.dbg.value(metadata double %call24, i64 0, metadata !39, metadata !166), !dbg !246
  %cmp25.1 = fcmp ogt double %call24.1, %dmax.3, !dbg !247
  tail call void @llvm.dbg.value(metadata double %call24, i64 0, metadata !38, metadata !166), !dbg !237
  %dmax.3.1 = select i1 %cmp25.1, double %call24.1, double %dmax.3, !dbg !249
  %21 = trunc i64 %indvars.iv.next to i32, !dbg !249
  %itemp.3.1 = select i1 %cmp25.1, i32 %21, i32 %itemp.3, !dbg !249
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv.next, 1, !dbg !239
  %exitcond.1 = icmp eq i32 %21, %1, !dbg !239
  br i1 %exitcond.1, label %if.end33.loopexit.unr-lcssa, label %for.body20, !dbg !239

if.end33.loopexit.unr-lcssa:                      ; preds = %for.body20
  %itemp.3.lcssa.ph = phi i32 [ %itemp.3.1, %for.body20 ]
  br label %if.end33.loopexit

if.end33.loopexit:                                ; preds = %for.body20.lr.ph.split, %if.end33.loopexit.unr-lcssa
  %itemp.3.lcssa = phi i32 [ %itemp.3.lcssa.unr, %for.body20.lr.ph.split ], [ %itemp.3.lcssa.ph, %if.end33.loopexit.unr-lcssa ]
  br label %if.end33

if.end33.loopexit74.unr-lcssa:                    ; preds = %for.body
  %itemp.1.lcssa.ph = phi i32 [ %itemp.1.1, %for.body ]
  br label %if.end33.loopexit74

if.end33.loopexit74:                              ; preds = %for.body.lr.ph.split, %if.end33.loopexit74.unr-lcssa
  %itemp.1.lcssa = phi i32 [ %itemp.1.lcssa.unr, %for.body.lr.ph.split ], [ %itemp.1.lcssa.ph, %if.end33.loopexit74.unr-lcssa ]
  br label %if.end33

if.end33:                                         ; preds = %if.end33.loopexit74, %if.end33.loopexit, %if.else, %entry
  %itemp.4 = phi i32 [ -1, %entry ], [ 0, %if.else ], [ %itemp.3.lcssa, %if.end33.loopexit ], [ %itemp.1.lcssa, %if.end33.loopexit74 ]
  ret i32 %itemp.4, !dbg !267
}

; Function Attrs: nounwind readnone
declare double @fabs(double) #2

; Function Attrs: nounwind uwtable
define void @dscal(i32 %n, double %da, double* nocapture %dx, i32 %dx_off, i32 %incx) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %n, i64 0, metadata !47, metadata !166), !dbg !268
  tail call void @llvm.dbg.value(metadata double %da, i64 0, metadata !48, metadata !166), !dbg !269
  tail call void @llvm.dbg.value(metadata double* %dx, i64 0, metadata !49, metadata !166), !dbg !270
  tail call void @llvm.dbg.value(metadata i32 %dx_off, i64 0, metadata !50, metadata !166), !dbg !271
  tail call void @llvm.dbg.value(metadata i32 %incx, i64 0, metadata !51, metadata !166), !dbg !272
  %cmp = icmp sgt i32 %n, 0, !dbg !273
  br i1 %cmp, label %if.then, label %if.end15, !dbg !274

if.then:                                          ; preds = %entry
  %cmp1 = icmp eq i32 %incx, 1, !dbg !275
  br i1 %cmp1, label %for.body8.lr.ph, label %if.then2, !dbg !276

for.body8.lr.ph:                                  ; preds = %if.then
  %0 = sext i32 %dx_off to i64, !dbg !277
  %1 = add i32 %n, -1, !dbg !277
  %2 = zext i32 %1 to i64
  %3 = add nuw nsw i64 %2, 1, !dbg !277
  %end.idx = add nuw nsw i64 %2, 1, !dbg !277
  %n.vec = and i64 %3, 8589934588, !dbg !277
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !277
  br i1 %cmp.zero, label %middle.block, label %vector.ph

vector.ph:                                        ; preds = %for.body8.lr.ph
  %broadcast.splatinsert42 = insertelement <2 x double> undef, double %da, i32 0
  %broadcast.splat43 = shufflevector <2 x double> %broadcast.splatinsert42, <2 x double> undef, <2 x i32> zeroinitializer
  %4 = add i32 %n, -1
  %5 = zext i32 %4 to i64
  %6 = add i64 %5, 1
  %7 = lshr i64 %6, 2
  %8 = mul i64 %7, 4
  %9 = add i64 %8, -4
  %10 = lshr i64 %9, 2
  %11 = add i64 %10, 1
  %xtraiter52 = and i64 %11, 1
  %lcmp.mod53 = icmp ne i64 %xtraiter52, 0
  %lcmp.overflow54 = icmp eq i64 %11, 0
  %lcmp.or55 = or i1 %lcmp.overflow54, %lcmp.mod53
  br i1 %lcmp.or55, label %vector.body.prol, label %vector.ph.split

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.ph
  %index.prol = phi i64 [ 0, %vector.ph ], [ %index.next.prol, %vector.body.prol ], !dbg !277
  %prol.iter56 = phi i64 [ %xtraiter52, %vector.ph ], [ %prol.iter56.sub, %vector.body.prol ]
  %12 = add i64 %index.prol, %0, !dbg !280
  %13 = getelementptr inbounds double* %dx, i64 %12, !dbg !280
  %14 = bitcast double* %13 to <2 x double>*, !dbg !280
  %wide.load.prol = load <2 x double>* %14, align 8, !dbg !280, !tbaa !204
  %.sum.prol = add i64 %12, 2, !dbg !280
  %15 = getelementptr double* %dx, i64 %.sum.prol, !dbg !280
  %16 = bitcast double* %15 to <2 x double>*, !dbg !280
  %wide.load41.prol = load <2 x double>* %16, align 8, !dbg !280, !tbaa !204
  %17 = fmul <2 x double> %wide.load.prol, %broadcast.splat43, !dbg !280
  %18 = fmul <2 x double> %wide.load41.prol, %broadcast.splat43, !dbg !280
  %19 = bitcast double* %13 to <2 x double>*, !dbg !280
  store <2 x double> %17, <2 x double>* %19, align 8, !dbg !280, !tbaa !204
  %20 = bitcast double* %15 to <2 x double>*, !dbg !280
  store <2 x double> %18, <2 x double>* %20, align 8, !dbg !280, !tbaa !204
  %index.next.prol = add i64 %index.prol, 4, !dbg !277
  %21 = icmp eq i64 %index.next.prol, %n.vec, !dbg !277
  %prol.iter56.sub = sub i64 %prol.iter56, 1, !dbg !277
  %prol.iter56.cmp = icmp ne i64 %prol.iter56.sub, 0, !dbg !277
  br i1 %prol.iter56.cmp, label %vector.body.prol, label %vector.ph.split, !llvm.loop !282

vector.ph.split:                                  ; preds = %vector.body.prol, %vector.ph
  %index.unr = phi i64 [ 0, %vector.ph ], [ %index.next.prol, %vector.body.prol ]
  %22 = icmp ult i64 %11, 2
  br i1 %22, label %middle.block.loopexit, label %vector.ph.split.split

vector.ph.split.split:                            ; preds = %vector.ph.split
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph.split.split
  %index = phi i64 [ %index.unr, %vector.ph.split.split ], [ %index.next.1, %vector.body ], !dbg !277
  %23 = add i64 %index, %0, !dbg !280
  %24 = getelementptr inbounds double* %dx, i64 %23, !dbg !280
  %25 = bitcast double* %24 to <2 x double>*, !dbg !280
  %wide.load = load <2 x double>* %25, align 8, !dbg !280, !tbaa !204
  %.sum = add i64 %23, 2, !dbg !280
  %26 = getelementptr double* %dx, i64 %.sum, !dbg !280
  %27 = bitcast double* %26 to <2 x double>*, !dbg !280
  %wide.load41 = load <2 x double>* %27, align 8, !dbg !280, !tbaa !204
  %28 = fmul <2 x double> %wide.load, %broadcast.splat43, !dbg !280
  %29 = fmul <2 x double> %wide.load41, %broadcast.splat43, !dbg !280
  %30 = bitcast double* %24 to <2 x double>*, !dbg !280
  store <2 x double> %28, <2 x double>* %30, align 8, !dbg !280, !tbaa !204
  %31 = bitcast double* %26 to <2 x double>*, !dbg !280
  store <2 x double> %29, <2 x double>* %31, align 8, !dbg !280, !tbaa !204
  %index.next = add i64 %index, 4, !dbg !277
  %32 = add i64 %index.next, %0, !dbg !280
  %33 = getelementptr inbounds double* %dx, i64 %32, !dbg !280
  %34 = bitcast double* %33 to <2 x double>*, !dbg !280
  %wide.load.1 = load <2 x double>* %34, align 8, !dbg !280, !tbaa !204
  %.sum.1 = add i64 %32, 2, !dbg !280
  %35 = getelementptr double* %dx, i64 %.sum.1, !dbg !280
  %36 = bitcast double* %35 to <2 x double>*, !dbg !280
  %wide.load41.1 = load <2 x double>* %36, align 8, !dbg !280, !tbaa !204
  %37 = fmul <2 x double> %wide.load.1, %broadcast.splat43, !dbg !280
  %38 = fmul <2 x double> %wide.load41.1, %broadcast.splat43, !dbg !280
  %39 = bitcast double* %33 to <2 x double>*, !dbg !280
  store <2 x double> %37, <2 x double>* %39, align 8, !dbg !280, !tbaa !204
  %40 = bitcast double* %35 to <2 x double>*, !dbg !280
  store <2 x double> %38, <2 x double>* %40, align 8, !dbg !280, !tbaa !204
  %index.next.1 = add i64 %index.next, 4, !dbg !277
  %41 = icmp eq i64 %index.next.1, %n.vec, !dbg !277
  br i1 %41, label %middle.block.loopexit.unr-lcssa, label %vector.body, !dbg !277, !llvm.loop !283

middle.block.loopexit.unr-lcssa:                  ; preds = %vector.body
  br label %middle.block.loopexit

middle.block.loopexit:                            ; preds = %vector.ph.split, %middle.block.loopexit.unr-lcssa
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %for.body8.lr.ph
  %resume.val = phi i64 [ 0, %for.body8.lr.ph ], [ %n.vec, %middle.block.loopexit ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %if.end15, label %for.body8.preheader

for.body8.preheader:                              ; preds = %middle.block
  %42 = trunc i64 %resume.val to i32
  %43 = sub i32 %n, %42
  %xtraiter = and i32 %43, 3
  %lcmp.mod = icmp ne i32 %xtraiter, 0
  %lcmp.overflow = icmp eq i32 %43, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %for.body8.prol, label %for.body8.preheader.split

for.body8.prol:                                   ; preds = %for.body8.prol, %for.body8.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body8.prol ], [ %resume.val, %for.body8.preheader ]
  %prol.iter = phi i32 [ %xtraiter, %for.body8.preheader ], [ %prol.iter.sub, %for.body8.prol ]
  %44 = add nsw i64 %indvars.iv.prol, %0, !dbg !284
  %arrayidx11.prol = getelementptr inbounds double* %dx, i64 %44, !dbg !280
  %45 = load double* %arrayidx11.prol, align 8, !dbg !280, !tbaa !204
  %mul12.prol = fmul double %45, %da, !dbg !280
  store double %mul12.prol, double* %arrayidx11.prol, align 8, !dbg !280, !tbaa !204
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1, !dbg !277
  %lftr.wideiv.prol = trunc i64 %indvars.iv.prol to i32, !dbg !277
  %exitcond.prol = icmp eq i32 %lftr.wideiv.prol, %1, !dbg !277
  %prol.iter.sub = sub i32 %prol.iter, 1, !dbg !277
  %prol.iter.cmp = icmp ne i32 %prol.iter.sub, 0, !dbg !277
  br i1 %prol.iter.cmp, label %for.body8.prol, label %for.body8.preheader.split, !llvm.loop !285

for.body8.preheader.split:                        ; preds = %for.body8.prol, %for.body8.preheader
  %indvars.iv.unr = phi i64 [ %resume.val, %for.body8.preheader ], [ %indvars.iv.next.prol, %for.body8.prol ]
  %46 = icmp ult i32 %43, 4
  br i1 %46, label %if.end15.loopexit, label %for.body8.preheader.split.split

for.body8.preheader.split.split:                  ; preds = %for.body8.preheader.split
  br label %for.body8, !dbg !284

if.then2:                                         ; preds = %if.then
  %mul = mul nsw i32 %incx, %n, !dbg !286
  tail call void @llvm.dbg.value(metadata i32 %mul, i64 0, metadata !53, metadata !166), !dbg !287
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !52, metadata !166), !dbg !288
  %cmp331 = icmp sgt i32 %mul, 0, !dbg !289
  br i1 %cmp331, label %for.body.lr.ph, label %if.end15, !dbg !292

for.body.lr.ph:                                   ; preds = %if.then2
  %47 = sext i32 %incx to i64
  %48 = sext i32 %mul to i64, !dbg !292
  %49 = sext i32 %dx_off to i64, !dbg !292
  br label %for.body, !dbg !292

for.body:                                         ; preds = %for.body.lr.ph, %for.body
  %indvars.iv34 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next35, %for.body ]
  %50 = add nsw i64 %indvars.iv34, %49, !dbg !293
  %arrayidx = getelementptr inbounds double* %dx, i64 %50, !dbg !294
  %51 = load double* %arrayidx, align 8, !dbg !294, !tbaa !204
  %mul4 = fmul double %51, %da, !dbg !294
  store double %mul4, double* %arrayidx, align 8, !dbg !294, !tbaa !204
  %indvars.iv.next35 = add nsw i64 %indvars.iv34, %47, !dbg !292
  %cmp3 = icmp slt i64 %indvars.iv.next35, %48, !dbg !289
  br i1 %cmp3, label %for.body, label %if.end15.loopexit51, !dbg !292

for.body8:                                        ; preds = %for.body8, %for.body8.preheader.split.split
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.body8.preheader.split.split ], [ %indvars.iv.next.3, %for.body8 ]
  %52 = add nsw i64 %indvars.iv, %0, !dbg !284
  %arrayidx11 = getelementptr inbounds double* %dx, i64 %52, !dbg !280
  %53 = load double* %arrayidx11, align 8, !dbg !280, !tbaa !204
  %mul12 = fmul double %53, %da, !dbg !280
  store double %mul12, double* %arrayidx11, align 8, !dbg !280, !tbaa !204
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !277
  %lftr.wideiv = trunc i64 %indvars.iv to i32, !dbg !277
  %54 = add nsw i64 %indvars.iv.next, %0, !dbg !284
  %arrayidx11.1 = getelementptr inbounds double* %dx, i64 %54, !dbg !280
  %55 = load double* %arrayidx11.1, align 8, !dbg !280, !tbaa !204
  %mul12.1 = fmul double %55, %da, !dbg !280
  store double %mul12.1, double* %arrayidx11.1, align 8, !dbg !280, !tbaa !204
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv.next, 1, !dbg !277
  %lftr.wideiv.1 = trunc i64 %indvars.iv.next to i32, !dbg !277
  %56 = add nsw i64 %indvars.iv.next.1, %0, !dbg !284
  %arrayidx11.2 = getelementptr inbounds double* %dx, i64 %56, !dbg !280
  %57 = load double* %arrayidx11.2, align 8, !dbg !280, !tbaa !204
  %mul12.2 = fmul double %57, %da, !dbg !280
  store double %mul12.2, double* %arrayidx11.2, align 8, !dbg !280, !tbaa !204
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv.next.1, 1, !dbg !277
  %lftr.wideiv.2 = trunc i64 %indvars.iv.next.1 to i32, !dbg !277
  %58 = add nsw i64 %indvars.iv.next.2, %0, !dbg !284
  %arrayidx11.3 = getelementptr inbounds double* %dx, i64 %58, !dbg !280
  %59 = load double* %arrayidx11.3, align 8, !dbg !280, !tbaa !204
  %mul12.3 = fmul double %59, %da, !dbg !280
  store double %mul12.3, double* %arrayidx11.3, align 8, !dbg !280, !tbaa !204
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv.next.2, 1, !dbg !277
  %lftr.wideiv.3 = trunc i64 %indvars.iv.next.2 to i32, !dbg !277
  %exitcond.3 = icmp eq i32 %lftr.wideiv.3, %1, !dbg !277
  br i1 %exitcond.3, label %if.end15.loopexit.unr-lcssa, label %for.body8, !dbg !277, !llvm.loop !295

if.end15.loopexit.unr-lcssa:                      ; preds = %for.body8
  br label %if.end15.loopexit

if.end15.loopexit:                                ; preds = %for.body8.preheader.split, %if.end15.loopexit.unr-lcssa
  br label %if.end15

if.end15.loopexit51:                              ; preds = %for.body
  br label %if.end15

if.end15:                                         ; preds = %if.end15.loopexit51, %if.end15.loopexit, %middle.block, %if.then2, %entry
  ret void, !dbg !296
}

; Function Attrs: nounwind uwtable
define void @daxpy(i32 %n, double %da, double* nocapture readonly %dx, i32 %dx_off, i32 %incx, double* nocapture %dy, i32 %dy_off, i32 %incy) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %n, i64 0, metadata !62, metadata !166), !dbg !297
  tail call void @llvm.dbg.value(metadata double %da, i64 0, metadata !63, metadata !166), !dbg !298
  tail call void @llvm.dbg.value(metadata double* %dx, i64 0, metadata !64, metadata !166), !dbg !299
  tail call void @llvm.dbg.value(metadata i32 %dx_off, i64 0, metadata !65, metadata !166), !dbg !300
  tail call void @llvm.dbg.value(metadata i32 %incx, i64 0, metadata !66, metadata !166), !dbg !301
  tail call void @llvm.dbg.value(metadata double* %dy, i64 0, metadata !67, metadata !166), !dbg !302
  tail call void @llvm.dbg.value(metadata i32 %dy_off, i64 0, metadata !68, metadata !166), !dbg !303
  tail call void @llvm.dbg.value(metadata i32 %incy, i64 0, metadata !69, metadata !166), !dbg !304
  %cmp = icmp sgt i32 %n, 0, !dbg !305
  %cmp1 = fcmp une double %da, 0.000000e+00, !dbg !306
  %or.cond = and i1 %cmp, %cmp1, !dbg !308
  br i1 %or.cond, label %if.then, label %if.end35, !dbg !308

if.then:                                          ; preds = %entry
  %cmp2 = icmp ne i32 %incx, 1, !dbg !309
  %cmp3 = icmp ne i32 %incy, 1, !dbg !310
  %or.cond36 = or i1 %cmp2, %cmp3, !dbg !312
  br i1 %or.cond36, label %if.then4, label %for.body22.lr.ph, !dbg !312

for.body22.lr.ph:                                 ; preds = %if.then
  %0 = sext i32 %dy_off to i64, !dbg !313
  %1 = sext i32 %dx_off to i64, !dbg !313
  %2 = add i32 %n, -1, !dbg !313
  %3 = zext i32 %2 to i64
  %4 = add nuw nsw i64 %3, 1, !dbg !313
  %end.idx = add nuw nsw i64 %3, 1, !dbg !313
  %n.vec = and i64 %4, 8589934588, !dbg !313
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !313
  %5 = sext i32 %dy_off to i64
  %6 = add i32 %n, -1
  %7 = zext i32 %6 to i64
  %8 = sext i32 %dx_off to i64
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %for.body22.lr.ph
  %scevgep = getelementptr double* %dy, i64 %5
  %9 = add nsw i64 %8, %7
  %scevgep83 = getelementptr double* %dx, i64 %9
  %bound0 = icmp ule double* %scevgep, %scevgep83
  %scevgep81 = getelementptr double* %dx, i64 %8
  %10 = add nsw i64 %5, %7
  %scevgep79 = getelementptr double* %dy, i64 %10
  %bound1 = icmp ule double* %scevgep81, %scevgep79
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %middle.block, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %broadcast.splatinsert89 = insertelement <2 x double> undef, double %da, i32 0
  %broadcast.splat90 = shufflevector <2 x double> %broadcast.splatinsert89, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ], !dbg !313
  %11 = add i64 %index, %1, !dbg !316
  %12 = getelementptr inbounds double* %dx, i64 %11, !dbg !316
  %13 = bitcast double* %12 to <2 x double>*, !dbg !316
  %wide.load = load <2 x double>* %13, align 8, !dbg !316, !tbaa !204
  %.sum = add i64 %11, 2, !dbg !316
  %14 = getelementptr double* %dx, i64 %.sum, !dbg !316
  %15 = bitcast double* %14 to <2 x double>*, !dbg !316
  %wide.load88 = load <2 x double>* %15, align 8, !dbg !316, !tbaa !204
  %16 = fmul <2 x double> %wide.load, %broadcast.splat90, !dbg !318
  %17 = fmul <2 x double> %wide.load88, %broadcast.splat90, !dbg !318
  %18 = add i64 %index, %0, !dbg !319
  %19 = getelementptr inbounds double* %dy, i64 %18, !dbg !319
  %20 = bitcast double* %19 to <2 x double>*, !dbg !319
  %wide.load93 = load <2 x double>* %20, align 8, !dbg !319, !tbaa !204
  %.sum102 = add i64 %18, 2, !dbg !319
  %21 = getelementptr double* %dy, i64 %.sum102, !dbg !319
  %22 = bitcast double* %21 to <2 x double>*, !dbg !319
  %wide.load94 = load <2 x double>* %22, align 8, !dbg !319, !tbaa !204
  %23 = fadd <2 x double> %wide.load93, %16, !dbg !319
  %24 = fadd <2 x double> %wide.load94, %17, !dbg !319
  %25 = bitcast double* %19 to <2 x double>*, !dbg !319
  store <2 x double> %23, <2 x double>* %25, align 8, !dbg !319, !tbaa !204
  %26 = bitcast double* %21 to <2 x double>*, !dbg !319
  store <2 x double> %24, <2 x double>* %26, align 8, !dbg !319, !tbaa !204
  %index.next = add i64 %index, 4, !dbg !313
  %27 = icmp eq i64 %index.next, %n.vec, !dbg !313
  br i1 %27, label %middle.block.loopexit, label %vector.body, !dbg !313, !llvm.loop !320

middle.block.loopexit:                            ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %vector.memcheck, %for.body22.lr.ph
  %resume.val = phi i64 [ 0, %for.body22.lr.ph ], [ 0, %vector.memcheck ], [ %n.vec, %middle.block.loopexit ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %if.end35, label %for.body22.preheader

for.body22.preheader:                             ; preds = %middle.block
  %28 = trunc i64 %resume.val to i32
  %29 = sub i32 %n, %28
  %xtraiter104 = and i32 %29, 1
  %lcmp.mod105 = icmp ne i32 %xtraiter104, 0
  %lcmp.overflow106 = icmp eq i32 %29, 0
  %lcmp.or107 = or i1 %lcmp.overflow106, %lcmp.mod105
  br i1 %lcmp.or107, label %for.body22.prol, label %for.body22.preheader.split

for.body22.prol:                                  ; preds = %for.body22.prol, %for.body22.preheader
  %indvars.iv71.prol = phi i64 [ %indvars.iv.next72.prol, %for.body22.prol ], [ %resume.val, %for.body22.preheader ]
  %prol.iter108 = phi i32 [ %xtraiter104, %for.body22.preheader ], [ %prol.iter108.sub, %for.body22.prol ]
  %30 = add nsw i64 %indvars.iv71.prol, %1, !dbg !321
  %arrayidx25.prol = getelementptr inbounds double* %dx, i64 %30, !dbg !316
  %31 = load double* %arrayidx25.prol, align 8, !dbg !316, !tbaa !204
  %mul26.prol = fmul double %31, %da, !dbg !318
  %32 = add nsw i64 %indvars.iv71.prol, %0, !dbg !322
  %arrayidx29.prol = getelementptr inbounds double* %dy, i64 %32, !dbg !319
  %33 = load double* %arrayidx29.prol, align 8, !dbg !319, !tbaa !204
  %add30.prol = fadd double %33, %mul26.prol, !dbg !319
  store double %add30.prol, double* %arrayidx29.prol, align 8, !dbg !319, !tbaa !204
  %indvars.iv.next72.prol = add nuw nsw i64 %indvars.iv71.prol, 1, !dbg !313
  %lftr.wideiv.prol = trunc i64 %indvars.iv71.prol to i32, !dbg !313
  %exitcond75.prol = icmp eq i32 %lftr.wideiv.prol, %2, !dbg !313
  %prol.iter108.sub = sub i32 %prol.iter108, 1, !dbg !313
  %prol.iter108.cmp = icmp ne i32 %prol.iter108.sub, 0, !dbg !313
  br i1 %prol.iter108.cmp, label %for.body22.prol, label %for.body22.preheader.split, !llvm.loop !323

for.body22.preheader.split:                       ; preds = %for.body22.prol, %for.body22.preheader
  %indvars.iv71.unr = phi i64 [ %resume.val, %for.body22.preheader ], [ %indvars.iv.next72.prol, %for.body22.prol ]
  %34 = icmp ult i32 %29, 2
  br i1 %34, label %if.end35.loopexit103, label %for.body22.preheader.split.split

for.body22.preheader.split.split:                 ; preds = %for.body22.preheader.split
  br label %for.body22, !dbg !321

if.then4:                                         ; preds = %if.then
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !71, metadata !166), !dbg !324
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !76, metadata !166), !dbg !325
  %cmp5 = icmp slt i32 %incx, 0, !dbg !326
  br i1 %cmp5, label %if.then6, label %if.end, !dbg !328

if.then6:                                         ; preds = %if.then4
  %sub = sub nsw i32 1, %n, !dbg !329
  %mul = mul nsw i32 %sub, %incx, !dbg !330
  tail call void @llvm.dbg.value(metadata i32 %mul, i64 0, metadata !71, metadata !166), !dbg !324
  %phitmp76 = sext i32 %mul to i64, !dbg !331
  br label %if.end, !dbg !331

if.end:                                           ; preds = %if.then6, %if.then4
  %ix.0 = phi i64 [ %phitmp76, %if.then6 ], [ 0, %if.then4 ]
  %cmp7 = icmp slt i32 %incy, 0, !dbg !332
  br i1 %cmp7, label %if.then8, label %for.body.lr.ph, !dbg !334

if.then8:                                         ; preds = %if.end
  %sub9 = sub nsw i32 1, %n, !dbg !335
  %mul10 = mul nsw i32 %sub9, %incy, !dbg !336
  tail call void @llvm.dbg.value(metadata i32 %mul10, i64 0, metadata !76, metadata !166), !dbg !325
  %phitmp = sext i32 %mul10 to i64, !dbg !337
  br label %for.body.lr.ph, !dbg !337

for.body.lr.ph:                                   ; preds = %if.end, %if.then8
  %iy.1.ph = phi i64 [ 0, %if.end ], [ %phitmp, %if.then8 ]
  %35 = sext i32 %incy to i64
  %36 = sext i32 %dy_off to i64, !dbg !338
  %37 = sext i32 %incx to i64
  %38 = sext i32 %dx_off to i64, !dbg !338
  %39 = add i32 %n, -1, !dbg !338
  %xtraiter = and i32 %n, 1
  %lcmp.mod = icmp ne i32 %xtraiter, 0
  %lcmp.overflow = icmp eq i32 %n, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %for.body.prol, label %for.body.lr.ph.split

for.body.prol:                                    ; preds = %for.body.prol, %for.body.lr.ph
  %indvars.iv68.prol = phi i64 [ %ix.0, %for.body.lr.ph ], [ %indvars.iv.next69.prol, %for.body.prol ]
  %indvars.iv.prol = phi i64 [ %iy.1.ph, %for.body.lr.ph ], [ %indvars.iv.next.prol, %for.body.prol ]
  %i.062.prol = phi i32 [ 0, %for.body.lr.ph ], [ %inc.prol, %for.body.prol ]
  %prol.iter = phi i32 [ %xtraiter, %for.body.lr.ph ], [ %prol.iter.sub, %for.body.prol ]
  %40 = add nsw i64 %indvars.iv68.prol, %38, !dbg !340
  %arrayidx.prol = getelementptr inbounds double* %dx, i64 %40, !dbg !343
  %41 = load double* %arrayidx.prol, align 8, !dbg !343, !tbaa !204
  %mul13.prol = fmul double %41, %da, !dbg !344
  %42 = add nsw i64 %indvars.iv.prol, %36, !dbg !345
  %arrayidx16.prol = getelementptr inbounds double* %dy, i64 %42, !dbg !346
  %43 = load double* %arrayidx16.prol, align 8, !dbg !346, !tbaa !204
  %add17.prol = fadd double %43, %mul13.prol, !dbg !346
  store double %add17.prol, double* %arrayidx16.prol, align 8, !dbg !346, !tbaa !204
  %indvars.iv.next69.prol = add nsw i64 %indvars.iv68.prol, %37, !dbg !338
  %indvars.iv.next.prol = add nsw i64 %indvars.iv.prol, %35, !dbg !338
  %inc.prol = add nuw nsw i32 %i.062.prol, 1, !dbg !347
  tail call void @llvm.dbg.value(metadata i32 %inc.prol, i64 0, metadata !70, metadata !166), !dbg !348
  %exitcond.prol = icmp eq i32 %i.062.prol, %39, !dbg !338
  %prol.iter.sub = sub i32 %prol.iter, 1, !dbg !338
  %prol.iter.cmp = icmp ne i32 %prol.iter.sub, 0, !dbg !338
  br i1 %prol.iter.cmp, label %for.body.prol, label %for.body.lr.ph.split, !llvm.loop !349

for.body.lr.ph.split:                             ; preds = %for.body.prol, %for.body.lr.ph
  %indvars.iv68.unr = phi i64 [ %ix.0, %for.body.lr.ph ], [ %indvars.iv.next69.prol, %for.body.prol ]
  %indvars.iv.unr = phi i64 [ %iy.1.ph, %for.body.lr.ph ], [ %indvars.iv.next.prol, %for.body.prol ]
  %i.062.unr = phi i32 [ 0, %for.body.lr.ph ], [ %inc.prol, %for.body.prol ]
  %44 = icmp ult i32 %n, 2
  br i1 %44, label %if.end35.loopexit, label %for.body.lr.ph.split.split

for.body.lr.ph.split.split:                       ; preds = %for.body.lr.ph.split
  br label %for.body, !dbg !338

for.body:                                         ; preds = %for.body, %for.body.lr.ph.split.split
  %indvars.iv68 = phi i64 [ %indvars.iv68.unr, %for.body.lr.ph.split.split ], [ %indvars.iv.next69.1, %for.body ]
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.body.lr.ph.split.split ], [ %indvars.iv.next.1, %for.body ]
  %i.062 = phi i32 [ %i.062.unr, %for.body.lr.ph.split.split ], [ %inc.1, %for.body ]
  %45 = add nsw i64 %indvars.iv68, %38, !dbg !340
  %arrayidx = getelementptr inbounds double* %dx, i64 %45, !dbg !343
  %46 = load double* %arrayidx, align 8, !dbg !343, !tbaa !204
  %mul13 = fmul double %46, %da, !dbg !344
  %47 = add nsw i64 %indvars.iv, %36, !dbg !345
  %arrayidx16 = getelementptr inbounds double* %dy, i64 %47, !dbg !346
  %48 = load double* %arrayidx16, align 8, !dbg !346, !tbaa !204
  %add17 = fadd double %48, %mul13, !dbg !346
  store double %add17, double* %arrayidx16, align 8, !dbg !346, !tbaa !204
  %indvars.iv.next69 = add nsw i64 %indvars.iv68, %37, !dbg !338
  %indvars.iv.next = add nsw i64 %indvars.iv, %35, !dbg !338
  %inc = add nuw nsw i32 %i.062, 1, !dbg !347
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !70, metadata !166), !dbg !348
  %49 = add nsw i64 %indvars.iv.next69, %38, !dbg !340
  %arrayidx.1 = getelementptr inbounds double* %dx, i64 %49, !dbg !343
  %50 = load double* %arrayidx.1, align 8, !dbg !343, !tbaa !204
  %mul13.1 = fmul double %50, %da, !dbg !344
  %51 = add nsw i64 %indvars.iv.next, %36, !dbg !345
  %arrayidx16.1 = getelementptr inbounds double* %dy, i64 %51, !dbg !346
  %52 = load double* %arrayidx16.1, align 8, !dbg !346, !tbaa !204
  %add17.1 = fadd double %52, %mul13.1, !dbg !346
  store double %add17.1, double* %arrayidx16.1, align 8, !dbg !346, !tbaa !204
  %indvars.iv.next69.1 = add nsw i64 %indvars.iv.next69, %37, !dbg !338
  %indvars.iv.next.1 = add nsw i64 %indvars.iv.next, %35, !dbg !338
  %inc.1 = add nuw nsw i32 %inc, 1, !dbg !347
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !70, metadata !166), !dbg !348
  %exitcond.1 = icmp eq i32 %inc, %39, !dbg !338
  br i1 %exitcond.1, label %if.end35.loopexit.unr-lcssa, label %for.body, !dbg !338

for.body22:                                       ; preds = %for.body22, %for.body22.preheader.split.split
  %indvars.iv71 = phi i64 [ %indvars.iv71.unr, %for.body22.preheader.split.split ], [ %indvars.iv.next72.1, %for.body22 ]
  %53 = add nsw i64 %indvars.iv71, %1, !dbg !321
  %arrayidx25 = getelementptr inbounds double* %dx, i64 %53, !dbg !316
  %54 = load double* %arrayidx25, align 8, !dbg !316, !tbaa !204
  %mul26 = fmul double %54, %da, !dbg !318
  %55 = add nsw i64 %indvars.iv71, %0, !dbg !322
  %arrayidx29 = getelementptr inbounds double* %dy, i64 %55, !dbg !319
  %56 = load double* %arrayidx29, align 8, !dbg !319, !tbaa !204
  %add30 = fadd double %56, %mul26, !dbg !319
  store double %add30, double* %arrayidx29, align 8, !dbg !319, !tbaa !204
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1, !dbg !313
  %lftr.wideiv = trunc i64 %indvars.iv71 to i32, !dbg !313
  %57 = add nsw i64 %indvars.iv.next72, %1, !dbg !321
  %arrayidx25.1 = getelementptr inbounds double* %dx, i64 %57, !dbg !316
  %58 = load double* %arrayidx25.1, align 8, !dbg !316, !tbaa !204
  %mul26.1 = fmul double %58, %da, !dbg !318
  %59 = add nsw i64 %indvars.iv.next72, %0, !dbg !322
  %arrayidx29.1 = getelementptr inbounds double* %dy, i64 %59, !dbg !319
  %60 = load double* %arrayidx29.1, align 8, !dbg !319, !tbaa !204
  %add30.1 = fadd double %60, %mul26.1, !dbg !319
  store double %add30.1, double* %arrayidx29.1, align 8, !dbg !319, !tbaa !204
  %indvars.iv.next72.1 = add nuw nsw i64 %indvars.iv.next72, 1, !dbg !313
  %lftr.wideiv.1 = trunc i64 %indvars.iv.next72 to i32, !dbg !313
  %exitcond75.1 = icmp eq i32 %lftr.wideiv.1, %2, !dbg !313
  br i1 %exitcond75.1, label %if.end35.loopexit103.unr-lcssa, label %for.body22, !dbg !313, !llvm.loop !350

if.end35.loopexit.unr-lcssa:                      ; preds = %for.body
  br label %if.end35.loopexit

if.end35.loopexit:                                ; preds = %for.body.lr.ph.split, %if.end35.loopexit.unr-lcssa
  br label %if.end35

if.end35.loopexit103.unr-lcssa:                   ; preds = %for.body22
  br label %if.end35.loopexit103

if.end35.loopexit103:                             ; preds = %for.body22.preheader.split, %if.end35.loopexit103.unr-lcssa
  br label %if.end35

if.end35:                                         ; preds = %if.end35.loopexit103, %if.end35.loopexit, %middle.block, %entry
  ret void, !dbg !351
}

; Function Attrs: nounwind uwtable
define void @dgefa(double** nocapture readonly %a, i32* nocapture %ipvt) #0 {
entry:
  tail call void @llvm.dbg.value(metadata double** %a, i64 0, metadata !81, metadata !166), !dbg !352
  tail call void @llvm.dbg.value(metadata i32* %ipvt, i64 0, metadata !82, metadata !166), !dbg !353
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !84, metadata !166), !dbg !354
  br label %if.else3.i, !dbg !355

if.else3.i:                                       ; preds = %for.cond.backedge, %entry
  %indvars.iv112 = phi i64 [ 0, %entry ], [ %indvars.iv.next113, %for.cond.backedge ]
  %indvars.iv106 = phi i64 [ 1, %entry ], [ %indvars.iv.next107, %for.cond.backedge ]
  %indvars.iv102 = phi i32 [ 1999, %entry ], [ %indvars.iv.next103, %for.cond.backedge ]
  %indvars.iv = phi i32 [ 2000, %entry ], [ %indvars.iv.next, %for.cond.backedge ]
  %0 = mul i64 %indvars.iv112, -1, !dbg !356
  %1 = add i64 %0, 2000, !dbg !356
  %2 = trunc i64 %1 to i32
  %3 = mul i64 %indvars.iv112, -1, !dbg !356
  %4 = add i64 %3, 2000, !dbg !356
  %5 = trunc i64 %4 to i32
  %6 = mul i64 %indvars.iv112, -1, !dbg !356
  %7 = add i64 %6, 1999, !dbg !356
  %8 = lshr i64 %7, 2, !dbg !356
  %9 = mul i64 %8, 4, !dbg !356
  %10 = add i64 %9, -4, !dbg !356
  %11 = lshr i64 %10, 2, !dbg !356
  %12 = add i64 %11, 1, !dbg !356
  %13 = mul i64 %indvars.iv112, -1, !dbg !356
  %14 = add i64 %13, 1999, !dbg !356
  %15 = trunc i64 %14 to i32
  %16 = sub i64 1999, %indvars.iv112, !dbg !356
  %17 = add i64 %indvars.iv112, 1, !dbg !356
  %18 = sub i64 1999, %indvars.iv112, !dbg !356
  %arrayidx = getelementptr inbounds double** %a, i64 %indvars.iv112, !dbg !356
  %19 = load double** %arrayidx, align 8, !dbg !356, !tbaa !202
  tail call void @llvm.dbg.value(metadata double* %19, i64 0, metadata !86, metadata !166), !dbg !357
  %indvars.iv.next113 = add nuw nsw i64 %indvars.iv112, 1, !dbg !355
  tail call void @llvm.dbg.value(metadata double* %19, i64 0, metadata !358, metadata !166) #5, !dbg !360
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !361, metadata !166) #5, !dbg !362
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !363, metadata !166) #5, !dbg !364
  %arrayidx16.i = getelementptr inbounds double* %19, i64 %indvars.iv112, !dbg !365
  %20 = load double* %arrayidx16.i, align 8, !dbg !365, !tbaa !204
  %call17.i = tail call double @fabs(double %20) #4, !dbg !366
  tail call void @llvm.dbg.value(metadata double %call17.i, i64 0, metadata !367, metadata !166) #5, !dbg !368
  %xtraiter = and i32 %15, 1
  %lcmp.mod = icmp ne i32 %xtraiter, 0
  %lcmp.overflow = icmp eq i32 %15, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %for.body20.i.prol.preheader, label %if.else3.i.split

for.body20.i.prol.preheader:                      ; preds = %if.else3.i
  br label %for.body20.i.prol, !dbg !369

for.body20.i.prol:                                ; preds = %for.body20.i.prol.preheader, %for.body20.i.prol
  %indvars.iv.i.prol = phi i64 [ %indvars.iv.next.i.prol, %for.body20.i.prol ], [ 1, %for.body20.i.prol.preheader ], !dbg !359
  %itemp.260.i.prol = phi i32 [ %itemp.3.i.prol, %for.body20.i.prol ], [ 0, %for.body20.i.prol.preheader ], !dbg !359
  %dmax.258.i.prol = phi double [ %dmax.3.i.prol, %for.body20.i.prol ], [ %call17.i, %for.body20.i.prol.preheader ], !dbg !359
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body20.i.prol ], [ %xtraiter, %for.body20.i.prol.preheader ]
  %21 = add nuw nsw i64 %indvars.iv.i.prol, %indvars.iv112, !dbg !369
  %arrayidx23.i.prol = getelementptr inbounds double* %19, i64 %21, !dbg !370
  %22 = load double* %arrayidx23.i.prol, align 8, !dbg !370, !tbaa !204
  %call24.i.prol = tail call double @fabs(double %22) #4, !dbg !371
  tail call void @llvm.dbg.value(metadata double %call24.i.prol, i64 0, metadata !372, metadata !166) #5, !dbg !373
  %cmp25.i.prol = fcmp ogt double %call24.i.prol, %dmax.258.i.prol, !dbg !374
  tail call void @llvm.dbg.value(metadata double %call24.i.prol, i64 0, metadata !367, metadata !166) #5, !dbg !368
  %dmax.3.i.prol = select i1 %cmp25.i.prol, double %call24.i.prol, double %dmax.258.i.prol, !dbg !375
  %23 = trunc i64 %indvars.iv.i.prol to i32, !dbg !375
  %itemp.3.i.prol = select i1 %cmp25.i.prol, i32 %23, i32 %itemp.260.i.prol, !dbg !375
  %indvars.iv.next.i.prol = add nuw nsw i64 %indvars.iv.i.prol, 1, !dbg !376
  %lftr.wideiv.prol = trunc i64 %indvars.iv.next.i.prol to i32, !dbg !376
  %exitcond.prol = icmp eq i32 %lftr.wideiv.prol, %indvars.iv, !dbg !376
  %prol.iter.sub = sub i32 %prol.iter, 1, !dbg !376
  %prol.iter.cmp = icmp ne i32 %prol.iter.sub, 0, !dbg !376
  br i1 %prol.iter.cmp, label %for.body20.i.prol, label %if.else3.i.split.loopexit, !llvm.loop !377

if.else3.i.split.loopexit:                        ; preds = %for.body20.i.prol
  %itemp.3.i.lcssa.unr.ph = phi i32 [ %itemp.3.i.prol, %for.body20.i.prol ]
  %indvars.iv.i.unr.ph = phi i64 [ %indvars.iv.next.i.prol, %for.body20.i.prol ]
  %itemp.260.i.unr.ph = phi i32 [ %itemp.3.i.prol, %for.body20.i.prol ]
  %dmax.258.i.unr.ph = phi double [ %dmax.3.i.prol, %for.body20.i.prol ]
  br label %if.else3.i.split

if.else3.i.split:                                 ; preds = %if.else3.i.split.loopexit, %if.else3.i
  %itemp.3.i.lcssa.unr = phi i32 [ 0, %if.else3.i ], [ %itemp.3.i.lcssa.unr.ph, %if.else3.i.split.loopexit ]
  %indvars.iv.i.unr = phi i64 [ 1, %if.else3.i ], [ %indvars.iv.i.unr.ph, %if.else3.i.split.loopexit ]
  %itemp.260.i.unr = phi i32 [ 0, %if.else3.i ], [ %itemp.260.i.unr.ph, %if.else3.i.split.loopexit ]
  %dmax.258.i.unr = phi double [ %call17.i, %if.else3.i ], [ %dmax.258.i.unr.ph, %if.else3.i.split.loopexit ]
  %24 = icmp ult i32 %15, 2
  br i1 %24, label %idamax.exit, label %if.else3.i.split.split

if.else3.i.split.split:                           ; preds = %if.else3.i.split
  br label %for.body20.i, !dbg !376

for.body20.i:                                     ; preds = %for.body20.i, %if.else3.i.split.split
  %indvars.iv.i = phi i64 [ %indvars.iv.i.unr, %if.else3.i.split.split ], [ %indvars.iv.next.i.1, %for.body20.i ], !dbg !359
  %itemp.260.i = phi i32 [ %itemp.260.i.unr, %if.else3.i.split.split ], [ %itemp.3.i.1, %for.body20.i ], !dbg !359
  %dmax.258.i = phi double [ %dmax.258.i.unr, %if.else3.i.split.split ], [ %dmax.3.i.1, %for.body20.i ], !dbg !359
  %25 = add nuw nsw i64 %indvars.iv.i, %indvars.iv112, !dbg !369
  %arrayidx23.i = getelementptr inbounds double* %19, i64 %25, !dbg !370
  %26 = load double* %arrayidx23.i, align 8, !dbg !370, !tbaa !204
  %call24.i = tail call double @fabs(double %26) #4, !dbg !371
  tail call void @llvm.dbg.value(metadata double %call24.i, i64 0, metadata !372, metadata !166) #5, !dbg !373
  %cmp25.i = fcmp ogt double %call24.i, %dmax.258.i, !dbg !374
  tail call void @llvm.dbg.value(metadata double %call24.i, i64 0, metadata !367, metadata !166) #5, !dbg !368
  %dmax.3.i = select i1 %cmp25.i, double %call24.i, double %dmax.258.i, !dbg !375
  %27 = trunc i64 %indvars.iv.i to i32, !dbg !375
  %itemp.3.i = select i1 %cmp25.i, i32 %27, i32 %itemp.260.i, !dbg !375
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !376
  %lftr.wideiv = trunc i64 %indvars.iv.next.i to i32, !dbg !376
  %28 = add nuw nsw i64 %indvars.iv.next.i, %indvars.iv112, !dbg !369
  %arrayidx23.i.1 = getelementptr inbounds double* %19, i64 %28, !dbg !370
  %29 = load double* %arrayidx23.i.1, align 8, !dbg !370, !tbaa !204
  %call24.i.1 = tail call double @fabs(double %29) #4, !dbg !371
  tail call void @llvm.dbg.value(metadata double %call24.i, i64 0, metadata !372, metadata !166) #5, !dbg !373
  %cmp25.i.1 = fcmp ogt double %call24.i.1, %dmax.3.i, !dbg !374
  tail call void @llvm.dbg.value(metadata double %call24.i, i64 0, metadata !367, metadata !166) #5, !dbg !368
  %dmax.3.i.1 = select i1 %cmp25.i.1, double %call24.i.1, double %dmax.3.i, !dbg !375
  %30 = trunc i64 %indvars.iv.next.i to i32, !dbg !375
  %itemp.3.i.1 = select i1 %cmp25.i.1, i32 %30, i32 %itemp.3.i, !dbg !375
  %indvars.iv.next.i.1 = add nuw nsw i64 %indvars.iv.next.i, 1, !dbg !376
  %lftr.wideiv.1 = trunc i64 %indvars.iv.next.i.1 to i32, !dbg !376
  %exitcond.1 = icmp eq i32 %lftr.wideiv.1, %indvars.iv, !dbg !376
  br i1 %exitcond.1, label %idamax.exit.unr-lcssa, label %for.body20.i, !dbg !376

idamax.exit.unr-lcssa:                            ; preds = %for.body20.i
  %itemp.3.i.lcssa.ph = phi i32 [ %itemp.3.i.1, %for.body20.i ]
  br label %idamax.exit

idamax.exit:                                      ; preds = %if.else3.i.split, %idamax.exit.unr-lcssa
  %itemp.3.i.lcssa = phi i32 [ %itemp.3.i.lcssa.unr, %if.else3.i.split ], [ %itemp.3.i.lcssa.ph, %idamax.exit.unr-lcssa ]
  %31 = trunc i64 %indvars.iv112 to i32, !dbg !359
  %add1 = add nsw i32 %itemp.3.i.lcssa, %31, !dbg !359
  tail call void @llvm.dbg.value(metadata i32 %add1, i64 0, metadata !91, metadata !166), !dbg !378
  %arrayidx3 = getelementptr inbounds i32* %ipvt, i64 %indvars.iv112, !dbg !379
  store i32 %add1, i32* %arrayidx3, align 4, !dbg !379, !tbaa !380
  %idxprom4 = sext i32 %add1 to i64, !dbg !382
  %arrayidx5 = getelementptr inbounds double* %19, i64 %idxprom4, !dbg !382
  %32 = load double* %arrayidx5, align 8, !dbg !382, !tbaa !204
  %cmp6 = fcmp une double %32, 0.000000e+00, !dbg !382
  br i1 %cmp6, label %if.then, label %for.cond.backedge, !dbg !383

for.cond.backedge.loopexit:                       ; preds = %daxpy.exit
  br label %for.cond.backedge

for.cond.backedge:                                ; preds = %for.cond.backedge.loopexit, %idamax.exit
  %indvars.iv.next = add nsw i32 %indvars.iv, -1, !dbg !355
  %indvars.iv.next103 = add nsw i32 %indvars.iv102, -1, !dbg !355
  %indvars.iv.next107 = add nuw nsw i64 %indvars.iv106, 1, !dbg !355
  %exitcond116 = icmp eq i64 %indvars.iv.next113, 1999, !dbg !355
  br i1 %exitcond116, label %for.end40, label %if.else3.i, !dbg !355

if.then:                                          ; preds = %idamax.exit
  %cmp7 = icmp ne i32 %itemp.3.i.lcssa, 0, !dbg !384
  %arrayidx12 = getelementptr inbounds double* %19, i64 %indvars.iv112, !dbg !386
  %33 = load double* %arrayidx12, align 8, !dbg !386, !tbaa !204
  br i1 %cmp7, label %if.then8, label %if.then.i, !dbg !388

if.then8:                                         ; preds = %if.then
  tail call void @llvm.dbg.value(metadata double %32, i64 0, metadata !83, metadata !166), !dbg !389
  store double %33, double* %arrayidx5, align 8, !dbg !390, !tbaa !204
  store double %32, double* %arrayidx12, align 8, !dbg !391, !tbaa !204
  br label %if.then.i, !dbg !392

if.then.i:                                        ; preds = %if.then, %if.then8
  %34 = phi double [ %32, %if.then8 ], [ %33, %if.then ]
  %div = fdiv double -1.000000e+00, %34, !dbg !393
  tail call void @llvm.dbg.value(metadata double %div, i64 0, metadata !83, metadata !166), !dbg !389
  tail call void @llvm.dbg.value(metadata double %div, i64 0, metadata !394, metadata !166), !dbg !396
  tail call void @llvm.dbg.value(metadata double* %19, i64 0, metadata !397, metadata !166), !dbg !398
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !399, metadata !166), !dbg !400
  %backedge.overflow134 = icmp eq i64 %indvars.iv112, 1999
  br i1 %backedge.overflow134, label %for.body8.i.preheader, label %overflow.checked146

overflow.checked146:                              ; preds = %if.then.i
  %n.vec143 = and i64 %16, -4, !dbg !395
  %cmp.zero145 = icmp eq i64 %n.vec143, 0, !dbg !395
  br i1 %cmp.zero145, label %middle.block138, label %vector.ph136

vector.ph136:                                     ; preds = %overflow.checked146
  %broadcast.splatinsert161 = insertelement <2 x double> undef, double %div, i32 0
  %broadcast.splat162 = shufflevector <2 x double> %broadcast.splatinsert161, <2 x double> undef, <2 x i32> zeroinitializer
  %xtraiter168 = and i64 %12, 1
  %lcmp.mod169 = icmp ne i64 %xtraiter168, 0
  %lcmp.overflow170 = icmp eq i64 %12, 0
  %lcmp.or171 = or i1 %lcmp.overflow170, %lcmp.mod169
  br i1 %lcmp.or171, label %vector.body137.prol.preheader, label %vector.ph136.split

vector.body137.prol.preheader:                    ; preds = %vector.ph136
  br label %vector.body137.prol, !dbg !401

vector.body137.prol:                              ; preds = %vector.body137.prol.preheader, %vector.body137.prol
  %index140.prol = phi i64 [ %index.next152.prol, %vector.body137.prol ], [ 0, %vector.body137.prol.preheader ], !dbg !395
  %prol.iter172 = phi i64 [ %prol.iter172.sub, %vector.body137.prol ], [ %xtraiter168, %vector.body137.prol.preheader ]
  %35 = add i64 %index140.prol, %indvars.iv.next113, !dbg !401
  %36 = getelementptr inbounds double* %19, i64 %35, !dbg !401
  %37 = bitcast double* %36 to <2 x double>*, !dbg !401
  %wide.load159.prol = load <2 x double>* %37, align 8, !dbg !401, !tbaa !204
  %.sum.prol = add i64 %35, 2, !dbg !401
  %38 = getelementptr double* %19, i64 %.sum.prol, !dbg !401
  %39 = bitcast double* %38 to <2 x double>*, !dbg !401
  %wide.load160.prol = load <2 x double>* %39, align 8, !dbg !401, !tbaa !204
  %40 = fmul <2 x double> %broadcast.splat162, %wide.load159.prol, !dbg !401
  %41 = fmul <2 x double> %broadcast.splat162, %wide.load160.prol, !dbg !401
  %42 = bitcast double* %36 to <2 x double>*, !dbg !401
  store <2 x double> %40, <2 x double>* %42, align 8, !dbg !401, !tbaa !204
  %43 = bitcast double* %38 to <2 x double>*, !dbg !401
  store <2 x double> %41, <2 x double>* %43, align 8, !dbg !401, !tbaa !204
  %index.next152.prol = add i64 %index140.prol, 4, !dbg !395
  %44 = icmp eq i64 %index.next152.prol, %n.vec143, !dbg !395
  %prol.iter172.sub = sub i64 %prol.iter172, 1, !dbg !395
  %prol.iter172.cmp = icmp ne i64 %prol.iter172.sub, 0, !dbg !395
  br i1 %prol.iter172.cmp, label %vector.body137.prol, label %vector.ph136.split.loopexit, !llvm.loop !402

vector.ph136.split.loopexit:                      ; preds = %vector.body137.prol
  %index140.unr.ph = phi i64 [ %index.next152.prol, %vector.body137.prol ]
  br label %vector.ph136.split

vector.ph136.split:                               ; preds = %vector.ph136.split.loopexit, %vector.ph136
  %index140.unr = phi i64 [ 0, %vector.ph136 ], [ %index140.unr.ph, %vector.ph136.split.loopexit ]
  %45 = icmp ult i64 %12, 2
  br i1 %45, label %middle.block138.loopexit, label %vector.ph136.split.split

vector.ph136.split.split:                         ; preds = %vector.ph136.split
  br label %vector.body137

vector.body137:                                   ; preds = %vector.body137, %vector.ph136.split.split
  %index140 = phi i64 [ %index140.unr, %vector.ph136.split.split ], [ %index.next152.1, %vector.body137 ], !dbg !395
  %46 = add i64 %index140, %indvars.iv.next113, !dbg !401
  %47 = getelementptr inbounds double* %19, i64 %46, !dbg !401
  %48 = bitcast double* %47 to <2 x double>*, !dbg !401
  %wide.load159 = load <2 x double>* %48, align 8, !dbg !401, !tbaa !204
  %.sum = add i64 %46, 2, !dbg !401
  %49 = getelementptr double* %19, i64 %.sum, !dbg !401
  %50 = bitcast double* %49 to <2 x double>*, !dbg !401
  %wide.load160 = load <2 x double>* %50, align 8, !dbg !401, !tbaa !204
  %51 = fmul <2 x double> %broadcast.splat162, %wide.load159, !dbg !401
  %52 = fmul <2 x double> %broadcast.splat162, %wide.load160, !dbg !401
  %53 = bitcast double* %47 to <2 x double>*, !dbg !401
  store <2 x double> %51, <2 x double>* %53, align 8, !dbg !401, !tbaa !204
  %54 = bitcast double* %49 to <2 x double>*, !dbg !401
  store <2 x double> %52, <2 x double>* %54, align 8, !dbg !401, !tbaa !204
  %index.next152 = add i64 %index140, 4, !dbg !395
  %55 = add i64 %index.next152, %indvars.iv.next113, !dbg !401
  %56 = getelementptr inbounds double* %19, i64 %55, !dbg !401
  %57 = bitcast double* %56 to <2 x double>*, !dbg !401
  %wide.load159.1 = load <2 x double>* %57, align 8, !dbg !401, !tbaa !204
  %.sum.1 = add i64 %55, 2, !dbg !401
  %58 = getelementptr double* %19, i64 %.sum.1, !dbg !401
  %59 = bitcast double* %58 to <2 x double>*, !dbg !401
  %wide.load160.1 = load <2 x double>* %59, align 8, !dbg !401, !tbaa !204
  %60 = fmul <2 x double> %broadcast.splat162, %wide.load159.1, !dbg !401
  %61 = fmul <2 x double> %broadcast.splat162, %wide.load160.1, !dbg !401
  %62 = bitcast double* %56 to <2 x double>*, !dbg !401
  store <2 x double> %60, <2 x double>* %62, align 8, !dbg !401, !tbaa !204
  %63 = bitcast double* %58 to <2 x double>*, !dbg !401
  store <2 x double> %61, <2 x double>* %63, align 8, !dbg !401, !tbaa !204
  %index.next152.1 = add i64 %index.next152, 4, !dbg !395
  %64 = icmp eq i64 %index.next152.1, %n.vec143, !dbg !395
  br i1 %64, label %middle.block138.loopexit.unr-lcssa, label %vector.body137, !dbg !395, !llvm.loop !403

middle.block138.loopexit.unr-lcssa:               ; preds = %vector.body137
  br label %middle.block138.loopexit

middle.block138.loopexit:                         ; preds = %vector.ph136.split, %middle.block138.loopexit.unr-lcssa
  br label %middle.block138

middle.block138:                                  ; preds = %middle.block138.loopexit, %overflow.checked146
  %resume.val147 = phi i64 [ 0, %overflow.checked146 ], [ %n.vec143, %middle.block138.loopexit ]
  %cmp.n151 = icmp eq i64 %16, %resume.val147
  br i1 %cmp.n151, label %for.body22.preheader, label %for.body8.i.preheader

for.body8.i.preheader:                            ; preds = %middle.block138, %if.then.i
  %indvars.iv.i88.ph = phi i64 [ 0, %if.then.i ], [ %resume.val147, %middle.block138 ]
  %65 = add i64 %indvars.iv.i88.ph, 1
  %66 = trunc i64 %65 to i32
  %67 = sub i32 %5, %66
  %xtraiter173 = and i32 %67, 3
  %lcmp.mod174 = icmp ne i32 %xtraiter173, 0
  %lcmp.overflow175 = icmp eq i32 %67, 0
  %lcmp.or176 = or i1 %lcmp.overflow175, %lcmp.mod174
  br i1 %lcmp.or176, label %for.body8.i.prol.preheader, label %for.body8.i.preheader.split

for.body8.i.prol.preheader:                       ; preds = %for.body8.i.preheader
  br label %for.body8.i.prol, !dbg !404

for.body8.i.prol:                                 ; preds = %for.body8.i.prol.preheader, %for.body8.i.prol
  %indvars.iv.i88.prol = phi i64 [ %indvars.iv.next.i89.prol, %for.body8.i.prol ], [ %indvars.iv.i88.ph, %for.body8.i.prol.preheader ], !dbg !395
  %prol.iter177 = phi i32 [ %prol.iter177.sub, %for.body8.i.prol ], [ %xtraiter173, %for.body8.i.prol.preheader ]
  %68 = add nuw nsw i64 %indvars.iv.i88.prol, %indvars.iv.next113, !dbg !404
  %arrayidx11.i.prol = getelementptr inbounds double* %19, i64 %68, !dbg !401
  %69 = load double* %arrayidx11.i.prol, align 8, !dbg !401, !tbaa !204
  %mul12.i.prol = fmul double %div, %69, !dbg !401
  store double %mul12.i.prol, double* %arrayidx11.i.prol, align 8, !dbg !401, !tbaa !204
  %indvars.iv.next.i89.prol = add nuw nsw i64 %indvars.iv.i88.prol, 1, !dbg !405
  %lftr.wideiv100.prol = trunc i64 %indvars.iv.next.i89.prol to i32, !dbg !405
  %exitcond101.prol = icmp eq i32 %lftr.wideiv100.prol, %indvars.iv102, !dbg !405
  %prol.iter177.sub = sub i32 %prol.iter177, 1, !dbg !405
  %prol.iter177.cmp = icmp ne i32 %prol.iter177.sub, 0, !dbg !405
  br i1 %prol.iter177.cmp, label %for.body8.i.prol, label %for.body8.i.preheader.split.loopexit, !llvm.loop !406

for.body8.i.preheader.split.loopexit:             ; preds = %for.body8.i.prol
  %indvars.iv.i88.unr.ph = phi i64 [ %indvars.iv.next.i89.prol, %for.body8.i.prol ]
  br label %for.body8.i.preheader.split

for.body8.i.preheader.split:                      ; preds = %for.body8.i.preheader.split.loopexit, %for.body8.i.preheader
  %indvars.iv.i88.unr = phi i64 [ %indvars.iv.i88.ph, %for.body8.i.preheader ], [ %indvars.iv.i88.unr.ph, %for.body8.i.preheader.split.loopexit ]
  %70 = icmp ult i32 %67, 4
  br i1 %70, label %for.body22.preheader.loopexit, label %for.body8.i.preheader.split.split

for.body8.i.preheader.split.split:                ; preds = %for.body8.i.preheader.split
  br label %for.body8.i, !dbg !404

for.body8.i:                                      ; preds = %for.body8.i, %for.body8.i.preheader.split.split
  %indvars.iv.i88 = phi i64 [ %indvars.iv.i88.unr, %for.body8.i.preheader.split.split ], [ %indvars.iv.next.i89.3, %for.body8.i ], !dbg !395
  %71 = add nuw nsw i64 %indvars.iv.i88, %indvars.iv.next113, !dbg !404
  %arrayidx11.i = getelementptr inbounds double* %19, i64 %71, !dbg !401
  %72 = load double* %arrayidx11.i, align 8, !dbg !401, !tbaa !204
  %mul12.i = fmul double %div, %72, !dbg !401
  store double %mul12.i, double* %arrayidx11.i, align 8, !dbg !401, !tbaa !204
  %indvars.iv.next.i89 = add nuw nsw i64 %indvars.iv.i88, 1, !dbg !405
  %lftr.wideiv100 = trunc i64 %indvars.iv.next.i89 to i32, !dbg !405
  %73 = add nuw nsw i64 %indvars.iv.next.i89, %indvars.iv.next113, !dbg !404
  %arrayidx11.i.1 = getelementptr inbounds double* %19, i64 %73, !dbg !401
  %74 = load double* %arrayidx11.i.1, align 8, !dbg !401, !tbaa !204
  %mul12.i.1 = fmul double %div, %74, !dbg !401
  store double %mul12.i.1, double* %arrayidx11.i.1, align 8, !dbg !401, !tbaa !204
  %indvars.iv.next.i89.1 = add nuw nsw i64 %indvars.iv.next.i89, 1, !dbg !405
  %lftr.wideiv100.1 = trunc i64 %indvars.iv.next.i89.1 to i32, !dbg !405
  %75 = add nuw nsw i64 %indvars.iv.next.i89.1, %indvars.iv.next113, !dbg !404
  %arrayidx11.i.2 = getelementptr inbounds double* %19, i64 %75, !dbg !401
  %76 = load double* %arrayidx11.i.2, align 8, !dbg !401, !tbaa !204
  %mul12.i.2 = fmul double %div, %76, !dbg !401
  store double %mul12.i.2, double* %arrayidx11.i.2, align 8, !dbg !401, !tbaa !204
  %indvars.iv.next.i89.2 = add nuw nsw i64 %indvars.iv.next.i89.1, 1, !dbg !405
  %lftr.wideiv100.2 = trunc i64 %indvars.iv.next.i89.2 to i32, !dbg !405
  %77 = add nuw nsw i64 %indvars.iv.next.i89.2, %indvars.iv.next113, !dbg !404
  %arrayidx11.i.3 = getelementptr inbounds double* %19, i64 %77, !dbg !401
  %78 = load double* %arrayidx11.i.3, align 8, !dbg !401, !tbaa !204
  %mul12.i.3 = fmul double %div, %78, !dbg !401
  store double %mul12.i.3, double* %arrayidx11.i.3, align 8, !dbg !401, !tbaa !204
  %indvars.iv.next.i89.3 = add nuw nsw i64 %indvars.iv.next.i89.2, 1, !dbg !405
  %lftr.wideiv100.3 = trunc i64 %indvars.iv.next.i89.3 to i32, !dbg !405
  %exitcond101.3 = icmp eq i32 %lftr.wideiv100.3, %indvars.iv102, !dbg !405
  br i1 %exitcond101.3, label %for.body22.preheader.loopexit.unr-lcssa, label %for.body8.i, !dbg !405, !llvm.loop !407

for.body22.preheader.loopexit.unr-lcssa:          ; preds = %for.body8.i
  br label %for.body22.preheader.loopexit

for.body22.preheader.loopexit:                    ; preds = %for.body8.i.preheader.split, %for.body22.preheader.loopexit.unr-lcssa
  br label %for.body22.preheader

for.body22.preheader:                             ; preds = %for.body22.preheader.loopexit, %middle.block138
  %scevgep120 = getelementptr double* %19, i64 %17
  %scevgep122 = getelementptr double* %19, i64 1999
  br label %for.body22, !dbg !408

for.body22:                                       ; preds = %for.body22.preheader, %daxpy.exit
  %indvars.iv108 = phi i64 [ %indvars.iv.next109, %daxpy.exit ], [ %indvars.iv106, %for.body22.preheader ]
  %arrayidx24 = getelementptr inbounds double** %a, i64 %indvars.iv108, !dbg !408
  %79 = load double** %arrayidx24, align 8, !dbg !408, !tbaa !202
  tail call void @llvm.dbg.value(metadata double* %79, i64 0, metadata !92, metadata !166), !dbg !409
  %arrayidx26 = getelementptr inbounds double* %79, i64 %idxprom4, !dbg !410
  %80 = load double* %arrayidx26, align 8, !dbg !410, !tbaa !204
  tail call void @llvm.dbg.value(metadata double %80, i64 0, metadata !83, metadata !166), !dbg !389
  br i1 %cmp7, label %if.then28, label %if.end35, !dbg !411

if.then28:                                        ; preds = %for.body22
  %arrayidx30 = getelementptr inbounds double* %79, i64 %indvars.iv112, !dbg !412
  %81 = load double* %arrayidx30, align 8, !dbg !412, !tbaa !204
  store double %81, double* %arrayidx26, align 8, !dbg !415, !tbaa !204
  store double %80, double* %arrayidx30, align 8, !dbg !416, !tbaa !204
  br label %if.end35, !dbg !417

if.end35:                                         ; preds = %if.then28, %for.body22
  tail call void @llvm.dbg.value(metadata double %80, i64 0, metadata !418, metadata !166), !dbg !420
  tail call void @llvm.dbg.value(metadata double* %19, i64 0, metadata !421, metadata !166), !dbg !422
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !423, metadata !166), !dbg !424
  tail call void @llvm.dbg.value(metadata double* %79, i64 0, metadata !425, metadata !166), !dbg !426
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !427, metadata !166), !dbg !428
  %cmp1.i92 = fcmp une double %80, 0.000000e+00, !dbg !429
  br i1 %cmp1.i92, label %for.body22.i.preheader, label %daxpy.exit, !dbg !430

for.body22.i.preheader:                           ; preds = %if.end35
  %backedge.overflow = icmp eq i64 %indvars.iv112, 1999
  br i1 %backedge.overflow, label %for.body22.i.preheader167, label %overflow.checked

overflow.checked:                                 ; preds = %for.body22.i.preheader
  %n.vec = and i64 %18, -4, !dbg !419
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !419
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %overflow.checked
  %scevgep = getelementptr double* %79, i64 %17
  %bound0 = icmp ule double* %scevgep, %scevgep122
  %scevgep118 = getelementptr double* %79, i64 1999
  %bound1 = icmp ule double* %scevgep120, %scevgep118
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %middle.block, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %broadcast.splatinsert128 = insertelement <2 x double> undef, double %80, i32 0
  %broadcast.splat129 = shufflevector <2 x double> %broadcast.splatinsert128, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ], !dbg !419
  %82 = add i64 %index, %indvars.iv.next113, !dbg !431
  %83 = getelementptr inbounds double* %19, i64 %82, !dbg !431
  %84 = bitcast double* %83 to <2 x double>*, !dbg !431
  %wide.load = load <2 x double>* %84, align 8, !dbg !431, !tbaa !204
  %.sum165 = add i64 %82, 2, !dbg !431
  %85 = getelementptr double* %19, i64 %.sum165, !dbg !431
  %86 = bitcast double* %85 to <2 x double>*, !dbg !431
  %wide.load127 = load <2 x double>* %86, align 8, !dbg !431, !tbaa !204
  %87 = fmul <2 x double> %broadcast.splat129, %wide.load, !dbg !432
  %88 = fmul <2 x double> %broadcast.splat129, %wide.load127, !dbg !432
  %89 = getelementptr inbounds double* %79, i64 %82, !dbg !433
  %90 = bitcast double* %89 to <2 x double>*, !dbg !433
  %wide.load130 = load <2 x double>* %90, align 8, !dbg !433, !tbaa !204
  %.sum166 = add i64 %82, 2, !dbg !433
  %91 = getelementptr double* %79, i64 %.sum166, !dbg !433
  %92 = bitcast double* %91 to <2 x double>*, !dbg !433
  %wide.load131 = load <2 x double>* %92, align 8, !dbg !433, !tbaa !204
  %93 = fadd <2 x double> %wide.load130, %87, !dbg !433
  %94 = fadd <2 x double> %wide.load131, %88, !dbg !433
  %95 = bitcast double* %89 to <2 x double>*, !dbg !433
  store <2 x double> %93, <2 x double>* %95, align 8, !dbg !433, !tbaa !204
  %96 = bitcast double* %91 to <2 x double>*, !dbg !433
  store <2 x double> %94, <2 x double>* %96, align 8, !dbg !433, !tbaa !204
  %index.next = add i64 %index, 4, !dbg !419
  %97 = icmp eq i64 %index.next, %n.vec, !dbg !419
  br i1 %97, label %middle.block.loopexit, label %vector.body, !dbg !419, !llvm.loop !434

middle.block.loopexit:                            ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %vector.memcheck, %overflow.checked
  %resume.val = phi i64 [ 0, %overflow.checked ], [ 0, %vector.memcheck ], [ %n.vec, %middle.block.loopexit ]
  %cmp.n = icmp eq i64 %18, %resume.val
  br i1 %cmp.n, label %daxpy.exit, label %for.body22.i.preheader167

for.body22.i.preheader167:                        ; preds = %middle.block, %for.body22.i.preheader
  %indvars.iv71.i.ph = phi i64 [ 0, %for.body22.i.preheader ], [ %resume.val, %middle.block ]
  %98 = add i64 %indvars.iv71.i.ph, 1
  %99 = trunc i64 %98 to i32
  %100 = sub i32 %2, %99
  %xtraiter178 = and i32 %100, 1
  %lcmp.mod179 = icmp ne i32 %xtraiter178, 0
  %lcmp.overflow180 = icmp eq i32 %100, 0
  %lcmp.or181 = or i1 %lcmp.overflow180, %lcmp.mod179
  br i1 %lcmp.or181, label %for.body22.i.prol.preheader, label %for.body22.i.preheader167.split

for.body22.i.prol.preheader:                      ; preds = %for.body22.i.preheader167
  br label %for.body22.i.prol, !dbg !435

for.body22.i.prol:                                ; preds = %for.body22.i.prol.preheader, %for.body22.i.prol
  %indvars.iv71.i.prol = phi i64 [ %indvars.iv.next72.i.prol, %for.body22.i.prol ], [ %indvars.iv71.i.ph, %for.body22.i.prol.preheader ], !dbg !419
  %prol.iter182 = phi i32 [ %prol.iter182.sub, %for.body22.i.prol ], [ %xtraiter178, %for.body22.i.prol.preheader ]
  %101 = add nuw nsw i64 %indvars.iv71.i.prol, %indvars.iv.next113, !dbg !435
  %arrayidx25.i.prol = getelementptr inbounds double* %19, i64 %101, !dbg !431
  %102 = load double* %arrayidx25.i.prol, align 8, !dbg !431, !tbaa !204
  %mul26.i.prol = fmul double %80, %102, !dbg !432
  %arrayidx29.i.prol = getelementptr inbounds double* %79, i64 %101, !dbg !433
  %103 = load double* %arrayidx29.i.prol, align 8, !dbg !433, !tbaa !204
  %add30.i.prol = fadd double %103, %mul26.i.prol, !dbg !433
  store double %add30.i.prol, double* %arrayidx29.i.prol, align 8, !dbg !433, !tbaa !204
  %indvars.iv.next72.i.prol = add nuw nsw i64 %indvars.iv71.i.prol, 1, !dbg !436
  %lftr.wideiv104.prol = trunc i64 %indvars.iv.next72.i.prol to i32, !dbg !436
  %exitcond105.prol = icmp eq i32 %lftr.wideiv104.prol, %indvars.iv102, !dbg !436
  %prol.iter182.sub = sub i32 %prol.iter182, 1, !dbg !436
  %prol.iter182.cmp = icmp ne i32 %prol.iter182.sub, 0, !dbg !436
  br i1 %prol.iter182.cmp, label %for.body22.i.prol, label %for.body22.i.preheader167.split.loopexit, !llvm.loop !437

for.body22.i.preheader167.split.loopexit:         ; preds = %for.body22.i.prol
  %indvars.iv71.i.unr.ph = phi i64 [ %indvars.iv.next72.i.prol, %for.body22.i.prol ]
  br label %for.body22.i.preheader167.split

for.body22.i.preheader167.split:                  ; preds = %for.body22.i.preheader167.split.loopexit, %for.body22.i.preheader167
  %indvars.iv71.i.unr = phi i64 [ %indvars.iv71.i.ph, %for.body22.i.preheader167 ], [ %indvars.iv71.i.unr.ph, %for.body22.i.preheader167.split.loopexit ]
  %104 = icmp ult i32 %100, 2
  br i1 %104, label %daxpy.exit.loopexit, label %for.body22.i.preheader167.split.split

for.body22.i.preheader167.split.split:            ; preds = %for.body22.i.preheader167.split
  br label %for.body22.i, !dbg !435

for.body22.i:                                     ; preds = %for.body22.i, %for.body22.i.preheader167.split.split
  %indvars.iv71.i = phi i64 [ %indvars.iv71.i.unr, %for.body22.i.preheader167.split.split ], [ %indvars.iv.next72.i.1, %for.body22.i ], !dbg !419
  %105 = add nuw nsw i64 %indvars.iv71.i, %indvars.iv.next113, !dbg !435
  %arrayidx25.i = getelementptr inbounds double* %19, i64 %105, !dbg !431
  %106 = load double* %arrayidx25.i, align 8, !dbg !431, !tbaa !204
  %mul26.i = fmul double %80, %106, !dbg !432
  %arrayidx29.i = getelementptr inbounds double* %79, i64 %105, !dbg !433
  %107 = load double* %arrayidx29.i, align 8, !dbg !433, !tbaa !204
  %add30.i = fadd double %107, %mul26.i, !dbg !433
  store double %add30.i, double* %arrayidx29.i, align 8, !dbg !433, !tbaa !204
  %indvars.iv.next72.i = add nuw nsw i64 %indvars.iv71.i, 1, !dbg !436
  %lftr.wideiv104 = trunc i64 %indvars.iv.next72.i to i32, !dbg !436
  %108 = add nuw nsw i64 %indvars.iv.next72.i, %indvars.iv.next113, !dbg !435
  %arrayidx25.i.1 = getelementptr inbounds double* %19, i64 %108, !dbg !431
  %109 = load double* %arrayidx25.i.1, align 8, !dbg !431, !tbaa !204
  %mul26.i.1 = fmul double %80, %109, !dbg !432
  %arrayidx29.i.1 = getelementptr inbounds double* %79, i64 %108, !dbg !433
  %110 = load double* %arrayidx29.i.1, align 8, !dbg !433, !tbaa !204
  %add30.i.1 = fadd double %110, %mul26.i.1, !dbg !433
  store double %add30.i.1, double* %arrayidx29.i.1, align 8, !dbg !433, !tbaa !204
  %indvars.iv.next72.i.1 = add nuw nsw i64 %indvars.iv.next72.i, 1, !dbg !436
  %lftr.wideiv104.1 = trunc i64 %indvars.iv.next72.i.1 to i32, !dbg !436
  %exitcond105.1 = icmp eq i32 %lftr.wideiv104.1, %indvars.iv102, !dbg !436
  br i1 %exitcond105.1, label %daxpy.exit.loopexit.unr-lcssa, label %for.body22.i, !dbg !436, !llvm.loop !438

daxpy.exit.loopexit.unr-lcssa:                    ; preds = %for.body22.i
  br label %daxpy.exit.loopexit

daxpy.exit.loopexit:                              ; preds = %for.body22.i.preheader167.split, %daxpy.exit.loopexit.unr-lcssa
  br label %daxpy.exit

daxpy.exit:                                       ; preds = %daxpy.exit.loopexit, %middle.block, %if.end35
  %indvars.iv.next109 = add nuw nsw i64 %indvars.iv108, 1, !dbg !439
  %lftr.wideiv110 = trunc i64 %indvars.iv.next109 to i32, !dbg !439
  %exitcond111 = icmp eq i32 %lftr.wideiv110, 2000, !dbg !439
  br i1 %exitcond111, label %for.cond.backedge.loopexit, label %for.body22, !dbg !439

for.end40:                                        ; preds = %for.cond.backedge
  %arrayidx41 = getelementptr inbounds i32* %ipvt, i64 1999, !dbg !440
  store i32 1999, i32* %arrayidx41, align 4, !dbg !440, !tbaa !380
  ret void, !dbg !441
}

; Function Attrs: nounwind uwtable
define void @dgesl(double** nocapture readonly %a, i32* nocapture readonly %ipvt, double* nocapture %b) #0 {
entry:
  tail call void @llvm.dbg.value(metadata double** %a, i64 0, metadata !102, metadata !166), !dbg !442
  tail call void @llvm.dbg.value(metadata i32* %ipvt, i64 0, metadata !103, metadata !166), !dbg !443
  tail call void @llvm.dbg.value(metadata double* %b, i64 0, metadata !104, metadata !166), !dbg !444
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !106, metadata !166), !dbg !445
  %scevgep90 = getelementptr double* %b, i64 1999
  br label %for.body, !dbg !446

for.body:                                         ; preds = %for.cond.backedge, %entry
  %indvars.iv85 = phi i64 [ 0, %entry ], [ %indvars.iv.next86, %for.cond.backedge ]
  %indvars.iv81 = phi i32 [ 1999, %entry ], [ %indvars.iv.next82, %for.cond.backedge ]
  %0 = mul i64 %indvars.iv85, -1, !dbg !447
  %1 = add i64 %0, 2000, !dbg !447
  %2 = trunc i64 %1 to i32
  %3 = add i64 %indvars.iv85, 1, !dbg !447
  %scevgep = getelementptr double* %b, i64 %3
  %4 = sub i64 1999, %indvars.iv85, !dbg !447
  %arrayidx = getelementptr inbounds i32* %ipvt, i64 %indvars.iv85, !dbg !447
  %5 = load i32* %arrayidx, align 4, !dbg !447, !tbaa !380
  tail call void @llvm.dbg.value(metadata i32 %5, i64 0, metadata !108, metadata !166), !dbg !448
  %idxprom1 = sext i32 %5 to i64, !dbg !449
  %arrayidx2 = getelementptr inbounds double* %b, i64 %idxprom1, !dbg !449
  %6 = load double* %arrayidx2, align 8, !dbg !449, !tbaa !204
  tail call void @llvm.dbg.value(metadata double %6, i64 0, metadata !105, metadata !166), !dbg !450
  %7 = trunc i64 %indvars.iv85 to i32, !dbg !451
  %cmp3 = icmp eq i32 %5, %7, !dbg !451
  br i1 %cmp3, label %if.end, label %if.then, !dbg !453

if.then:                                          ; preds = %for.body
  %arrayidx5 = getelementptr inbounds double* %b, i64 %indvars.iv85, !dbg !454
  %8 = load double* %arrayidx5, align 8, !dbg !454, !tbaa !204
  store double %8, double* %arrayidx2, align 8, !dbg !456, !tbaa !204
  store double %6, double* %arrayidx5, align 8, !dbg !457, !tbaa !204
  br label %if.end, !dbg !458

if.end:                                           ; preds = %for.body, %if.then
  %indvars.iv.next86 = add nuw nsw i64 %indvars.iv85, 1, !dbg !446
  %arrayidx11 = getelementptr inbounds double** %a, i64 %indvars.iv85, !dbg !459
  %9 = load double** %arrayidx11, align 8, !dbg !459, !tbaa !202
  tail call void @llvm.dbg.value(metadata double %6, i64 0, metadata !460, metadata !166), !dbg !462
  tail call void @llvm.dbg.value(metadata double* %9, i64 0, metadata !463, metadata !166), !dbg !464
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !465, metadata !166), !dbg !466
  tail call void @llvm.dbg.value(metadata double* %b, i64 0, metadata !467, metadata !166), !dbg !468
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !469, metadata !166), !dbg !470
  %cmp1.i = fcmp une double %6, 0.000000e+00, !dbg !471
  br i1 %cmp1.i, label %for.body22.i.preheader, label %for.cond.backedge, !dbg !472

for.body22.i.preheader:                           ; preds = %if.end
  %backedge.overflow = icmp eq i64 %indvars.iv85, 1999
  br i1 %backedge.overflow, label %for.body22.i.preheader154, label %overflow.checked

for.body22.i.preheader154:                        ; preds = %middle.block, %for.body22.i.preheader
  %indvars.iv71.i.ph = phi i64 [ 0, %for.body22.i.preheader ], [ %resume.val, %middle.block ]
  %10 = add i64 %indvars.iv71.i.ph, 1
  %11 = trunc i64 %10 to i32
  %12 = sub i32 %2, %11
  %xtraiter155 = and i32 %12, 1
  %lcmp.mod156 = icmp ne i32 %xtraiter155, 0
  %lcmp.overflow157 = icmp eq i32 %12, 0
  %lcmp.or158 = or i1 %lcmp.overflow157, %lcmp.mod156
  br i1 %lcmp.or158, label %for.body22.i.prol.preheader, label %for.body22.i.preheader154.split

for.body22.i.prol.preheader:                      ; preds = %for.body22.i.preheader154
  br label %for.body22.i.prol, !dbg !473

for.body22.i.prol:                                ; preds = %for.body22.i.prol.preheader, %for.body22.i.prol
  %indvars.iv71.i.prol = phi i64 [ %indvars.iv.next72.i.prol, %for.body22.i.prol ], [ %indvars.iv71.i.ph, %for.body22.i.prol.preheader ], !dbg !461
  %prol.iter159 = phi i32 [ %prol.iter159.sub, %for.body22.i.prol ], [ %xtraiter155, %for.body22.i.prol.preheader ]
  %13 = add nuw nsw i64 %indvars.iv71.i.prol, %indvars.iv.next86, !dbg !473
  %arrayidx25.i.prol = getelementptr inbounds double* %9, i64 %13, !dbg !474
  %14 = load double* %arrayidx25.i.prol, align 8, !dbg !474, !tbaa !204
  %mul26.i.prol = fmul double %6, %14, !dbg !475
  %arrayidx29.i.prol = getelementptr inbounds double* %b, i64 %13, !dbg !476
  %15 = load double* %arrayidx29.i.prol, align 8, !dbg !476, !tbaa !204
  %add30.i.prol = fadd double %15, %mul26.i.prol, !dbg !476
  store double %add30.i.prol, double* %arrayidx29.i.prol, align 8, !dbg !476, !tbaa !204
  %indvars.iv.next72.i.prol = add nuw nsw i64 %indvars.iv71.i.prol, 1, !dbg !477
  %lftr.wideiv83.prol = trunc i64 %indvars.iv.next72.i.prol to i32, !dbg !477
  %exitcond84.prol = icmp eq i32 %lftr.wideiv83.prol, %indvars.iv81, !dbg !477
  %prol.iter159.sub = sub i32 %prol.iter159, 1, !dbg !477
  %prol.iter159.cmp = icmp ne i32 %prol.iter159.sub, 0, !dbg !477
  br i1 %prol.iter159.cmp, label %for.body22.i.prol, label %for.body22.i.preheader154.split.loopexit, !llvm.loop !478

for.body22.i.preheader154.split.loopexit:         ; preds = %for.body22.i.prol
  %indvars.iv71.i.unr.ph = phi i64 [ %indvars.iv.next72.i.prol, %for.body22.i.prol ]
  br label %for.body22.i.preheader154.split

for.body22.i.preheader154.split:                  ; preds = %for.body22.i.preheader154.split.loopexit, %for.body22.i.preheader154
  %indvars.iv71.i.unr = phi i64 [ %indvars.iv71.i.ph, %for.body22.i.preheader154 ], [ %indvars.iv71.i.unr.ph, %for.body22.i.preheader154.split.loopexit ]
  %16 = icmp ult i32 %12, 2
  br i1 %16, label %for.cond.backedge.loopexit, label %for.body22.i.preheader154.split.split

for.body22.i.preheader154.split.split:            ; preds = %for.body22.i.preheader154.split
  br label %for.body22.i, !dbg !473

overflow.checked:                                 ; preds = %for.body22.i.preheader
  %n.vec = and i64 %4, -4, !dbg !461
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !461
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %overflow.checked
  %scevgep94 = getelementptr double* %9, i64 1999
  %bound0 = icmp ule double* %scevgep, %scevgep94
  %scevgep92 = getelementptr double* %9, i64 %3
  %bound1 = icmp ule double* %scevgep92, %scevgep90
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %middle.block, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %broadcast.splatinsert100 = insertelement <2 x double> undef, double %6, i32 0
  %broadcast.splat101 = shufflevector <2 x double> %broadcast.splatinsert100, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ], !dbg !461
  %17 = add i64 %index, %indvars.iv.next86, !dbg !474
  %18 = getelementptr inbounds double* %9, i64 %17, !dbg !474
  %19 = bitcast double* %18 to <2 x double>*, !dbg !474
  %wide.load = load <2 x double>* %19, align 8, !dbg !474, !tbaa !204
  %.sum = add i64 %17, 2, !dbg !474
  %20 = getelementptr double* %9, i64 %.sum, !dbg !474
  %21 = bitcast double* %20 to <2 x double>*, !dbg !474
  %wide.load99 = load <2 x double>* %21, align 8, !dbg !474, !tbaa !204
  %22 = fmul <2 x double> %broadcast.splat101, %wide.load, !dbg !475
  %23 = fmul <2 x double> %broadcast.splat101, %wide.load99, !dbg !475
  %24 = getelementptr inbounds double* %b, i64 %17, !dbg !476
  %25 = bitcast double* %24 to <2 x double>*, !dbg !476
  %wide.load102 = load <2 x double>* %25, align 8, !dbg !476, !tbaa !204
  %.sum153 = add i64 %17, 2, !dbg !476
  %26 = getelementptr double* %b, i64 %.sum153, !dbg !476
  %27 = bitcast double* %26 to <2 x double>*, !dbg !476
  %wide.load103 = load <2 x double>* %27, align 8, !dbg !476, !tbaa !204
  %28 = fadd <2 x double> %wide.load102, %22, !dbg !476
  %29 = fadd <2 x double> %wide.load103, %23, !dbg !476
  %30 = bitcast double* %24 to <2 x double>*, !dbg !476
  store <2 x double> %28, <2 x double>* %30, align 8, !dbg !476, !tbaa !204
  %31 = bitcast double* %26 to <2 x double>*, !dbg !476
  store <2 x double> %29, <2 x double>* %31, align 8, !dbg !476, !tbaa !204
  %index.next = add i64 %index, 4, !dbg !461
  %32 = icmp eq i64 %index.next, %n.vec, !dbg !461
  br i1 %32, label %middle.block.loopexit, label %vector.body, !dbg !461, !llvm.loop !479

middle.block.loopexit:                            ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %vector.memcheck, %overflow.checked
  %resume.val = phi i64 [ 0, %overflow.checked ], [ 0, %vector.memcheck ], [ %n.vec, %middle.block.loopexit ]
  %cmp.n = icmp eq i64 %4, %resume.val
  br i1 %cmp.n, label %for.cond.backedge, label %for.body22.i.preheader154

for.cond.backedge.loopexit.unr-lcssa:             ; preds = %for.body22.i
  br label %for.cond.backedge.loopexit

for.cond.backedge.loopexit:                       ; preds = %for.body22.i.preheader154.split, %for.cond.backedge.loopexit.unr-lcssa
  br label %for.cond.backedge

for.cond.backedge:                                ; preds = %for.cond.backedge.loopexit, %middle.block, %if.end
  %indvars.iv.next82 = add nsw i32 %indvars.iv81, -1, !dbg !446
  %exitcond88 = icmp eq i64 %indvars.iv.next86, 1999, !dbg !446
  br i1 %exitcond88, label %for.body14.preheader, label %for.body, !dbg !446

for.body14.preheader:                             ; preds = %for.cond.backedge
  br label %for.body14, !dbg !480

for.body22.i:                                     ; preds = %for.body22.i, %for.body22.i.preheader154.split.split
  %indvars.iv71.i = phi i64 [ %indvars.iv71.i.unr, %for.body22.i.preheader154.split.split ], [ %indvars.iv.next72.i.1, %for.body22.i ], !dbg !461
  %33 = add nuw nsw i64 %indvars.iv71.i, %indvars.iv.next86, !dbg !473
  %arrayidx25.i = getelementptr inbounds double* %9, i64 %33, !dbg !474
  %34 = load double* %arrayidx25.i, align 8, !dbg !474, !tbaa !204
  %mul26.i = fmul double %6, %34, !dbg !475
  %arrayidx29.i = getelementptr inbounds double* %b, i64 %33, !dbg !476
  %35 = load double* %arrayidx29.i, align 8, !dbg !476, !tbaa !204
  %add30.i = fadd double %35, %mul26.i, !dbg !476
  store double %add30.i, double* %arrayidx29.i, align 8, !dbg !476, !tbaa !204
  %indvars.iv.next72.i = add nuw nsw i64 %indvars.iv71.i, 1, !dbg !477
  %lftr.wideiv83 = trunc i64 %indvars.iv.next72.i to i32, !dbg !477
  %36 = add nuw nsw i64 %indvars.iv.next72.i, %indvars.iv.next86, !dbg !473
  %arrayidx25.i.1 = getelementptr inbounds double* %9, i64 %36, !dbg !474
  %37 = load double* %arrayidx25.i.1, align 8, !dbg !474, !tbaa !204
  %mul26.i.1 = fmul double %6, %37, !dbg !475
  %arrayidx29.i.1 = getelementptr inbounds double* %b, i64 %36, !dbg !476
  %38 = load double* %arrayidx29.i.1, align 8, !dbg !476, !tbaa !204
  %add30.i.1 = fadd double %38, %mul26.i.1, !dbg !476
  store double %add30.i.1, double* %arrayidx29.i.1, align 8, !dbg !476, !tbaa !204
  %indvars.iv.next72.i.1 = add nuw nsw i64 %indvars.iv.next72.i, 1, !dbg !477
  %lftr.wideiv83.1 = trunc i64 %indvars.iv.next72.i.1 to i32, !dbg !477
  %exitcond84.1 = icmp eq i32 %lftr.wideiv83.1, %indvars.iv81, !dbg !477
  br i1 %exitcond84.1, label %for.cond.backedge.loopexit.unr-lcssa, label %for.body22.i, !dbg !477, !llvm.loop !482

for.body14:                                       ; preds = %for.body14.preheader, %for.cond12.backedge
  %indvars.iv77 = phi i64 [ %indvars.iv.next78, %for.cond12.backedge ], [ 0, %for.body14.preheader ]
  %indvars.iv = phi i32 [ %indvars.iv.next, %for.cond12.backedge ], [ 1998, %for.body14.preheader ]
  %39 = mul i64 %indvars.iv77, -1, !dbg !480
  %40 = add i64 %39, 1999, !dbg !480
  %41 = trunc i64 %40 to i32
  %42 = sub i64 1998, %indvars.iv77, !dbg !480
  %43 = and i64 %42, 4294967295
  %scevgep120 = getelementptr double* %b, i64 %43
  %44 = sub i64 1998, %indvars.iv77, !dbg !480
  %45 = and i64 %44, 4294967295
  %46 = add nuw nsw i64 %45, 1, !dbg !480
  %indvars.iv.next78 = add nuw nsw i64 %indvars.iv77, 1, !dbg !480
  %47 = sub i64 1999, %indvars.iv77, !dbg !483
  %arrayidx19 = getelementptr inbounds double** %a, i64 %47, !dbg !486
  %48 = load double** %arrayidx19, align 8, !dbg !486, !tbaa !202
  %arrayidx20 = getelementptr inbounds double* %48, i64 %47, !dbg !486
  %49 = load double* %arrayidx20, align 8, !dbg !486, !tbaa !204
  %arrayidx22 = getelementptr inbounds double* %b, i64 %47, !dbg !487
  %50 = load double* %arrayidx22, align 8, !dbg !487, !tbaa !204
  %div = fdiv double %50, %49, !dbg !487
  store double %div, double* %arrayidx22, align 8, !dbg !487, !tbaa !204
  tail call void @llvm.dbg.value(metadata double* %48, i64 0, metadata !488, metadata !166), !dbg !490
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !491, metadata !166), !dbg !492
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !493, metadata !166), !dbg !494
  tail call void @llvm.dbg.value(metadata double* %b, i64 0, metadata !495, metadata !166), !dbg !496
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !497, metadata !166), !dbg !498
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !499, metadata !166), !dbg !500
  %cmp.i61 = icmp sgt i64 %47, 0, !dbg !501
  %cmp1.i62 = fcmp une double %div, -0.000000e+00, !dbg !502
  %or.cond.i63 = and i1 %cmp.i61, %cmp1.i62, !dbg !503
  br i1 %or.cond.i63, label %overflow.checked118, label %for.cond12.backedge, !dbg !503

overflow.checked118:                              ; preds = %for.body14
  %end.idx113 = add nuw nsw i64 %45, 1, !dbg !489
  %fold = add i64 %44, 1, !dbg !489
  %n.mod.vf114 = and i64 %fold, 3, !dbg !489
  %n.vec115 = sub nsw i64 %46, %n.mod.vf114, !dbg !489
  %cmp.zero117 = icmp eq i64 %46, %n.mod.vf114, !dbg !489
  br i1 %cmp.zero117, label %middle.block110, label %vector.memcheck128

vector.memcheck128:                               ; preds = %overflow.checked118
  %scevgep122 = getelementptr double* %48, i64 %43
  %bound0124 = icmp uge double* %scevgep122, %b
  %bound1125 = icmp ule double* %48, %scevgep120
  %memcheck.conflict127 = and i1 %bound0124, %bound1125
  br i1 %memcheck.conflict127, label %middle.block110, label %vector.ph108

vector.ph108:                                     ; preds = %vector.memcheck128
  %broadcast.splatinsert141 = insertelement <2 x double> undef, double %div, i32 0
  %broadcast.splat142 = shufflevector <2 x double> %broadcast.splatinsert141, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body109

vector.body109:                                   ; preds = %vector.body109, %vector.ph108
  %index112 = phi i64 [ 0, %vector.ph108 ], [ %index.next134, %vector.body109 ], !dbg !489
  %51 = getelementptr inbounds double* %48, i64 %index112, !dbg !504
  %52 = bitcast double* %51 to <2 x double>*, !dbg !504
  %wide.load139 = load <2 x double>* %52, align 8, !dbg !504, !tbaa !204
  %.sum151 = or i64 %index112, 2, !dbg !504
  %53 = getelementptr double* %48, i64 %.sum151, !dbg !504
  %54 = bitcast double* %53 to <2 x double>*, !dbg !504
  %wide.load140 = load <2 x double>* %54, align 8, !dbg !504, !tbaa !204
  %55 = fmul <2 x double> %broadcast.splat142, %wide.load139, !dbg !505
  %56 = fmul <2 x double> %broadcast.splat142, %wide.load140, !dbg !505
  %57 = getelementptr inbounds double* %b, i64 %index112, !dbg !506
  %58 = bitcast double* %57 to <2 x double>*, !dbg !506
  %wide.load143 = load <2 x double>* %58, align 8, !dbg !506, !tbaa !204
  %.sum152 = or i64 %index112, 2, !dbg !506
  %59 = getelementptr double* %b, i64 %.sum152, !dbg !506
  %60 = bitcast double* %59 to <2 x double>*, !dbg !506
  %wide.load144 = load <2 x double>* %60, align 8, !dbg !506, !tbaa !204
  %61 = fsub <2 x double> %wide.load143, %55, !dbg !506
  %62 = fsub <2 x double> %wide.load144, %56, !dbg !506
  %63 = bitcast double* %57 to <2 x double>*, !dbg !506
  store <2 x double> %61, <2 x double>* %63, align 8, !dbg !506, !tbaa !204
  %64 = bitcast double* %59 to <2 x double>*, !dbg !506
  store <2 x double> %62, <2 x double>* %64, align 8, !dbg !506, !tbaa !204
  %index.next134 = add i64 %index112, 4, !dbg !489
  %65 = icmp eq i64 %index.next134, %n.vec115, !dbg !489
  br i1 %65, label %middle.block110.loopexit, label %vector.body109, !dbg !489, !llvm.loop !507

middle.block110.loopexit:                         ; preds = %vector.body109
  br label %middle.block110

middle.block110:                                  ; preds = %middle.block110.loopexit, %vector.memcheck128, %overflow.checked118
  %resume.val129 = phi i64 [ 0, %overflow.checked118 ], [ 0, %vector.memcheck128 ], [ %n.vec115, %middle.block110.loopexit ]
  %cmp.n133 = icmp eq i64 %end.idx113, %resume.val129
  br i1 %cmp.n133, label %for.cond12.backedge, label %for.body22.i73.preheader

for.body22.i73.preheader:                         ; preds = %middle.block110
  %66 = trunc i64 %resume.val129 to i32
  %67 = sub i32 %41, %66
  %xtraiter = and i32 %67, 1
  %lcmp.mod = icmp ne i32 %xtraiter, 0
  %lcmp.overflow = icmp eq i32 %67, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %for.body22.i73.prol.preheader, label %for.body22.i73.preheader.split

for.body22.i73.prol.preheader:                    ; preds = %for.body22.i73.preheader
  br label %for.body22.i73.prol, !dbg !504

for.body22.i73.prol:                              ; preds = %for.body22.i73.prol.preheader, %for.body22.i73.prol
  %indvars.iv71.i65.prol = phi i64 [ %indvars.iv.next72.i70.prol, %for.body22.i73.prol ], [ %resume.val129, %for.body22.i73.prol.preheader ], !dbg !489
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body22.i73.prol ], [ %xtraiter, %for.body22.i73.prol.preheader ]
  %arrayidx25.i66.prol = getelementptr inbounds double* %48, i64 %indvars.iv71.i65.prol, !dbg !504
  %68 = load double* %arrayidx25.i66.prol, align 8, !dbg !504, !tbaa !204
  %69 = fmul double %div, %68, !dbg !505
  %arrayidx29.i68.prol = getelementptr inbounds double* %b, i64 %indvars.iv71.i65.prol, !dbg !506
  %70 = load double* %arrayidx29.i68.prol, align 8, !dbg !506, !tbaa !204
  %add30.i69.prol = fsub double %70, %69, !dbg !506
  store double %add30.i69.prol, double* %arrayidx29.i68.prol, align 8, !dbg !506, !tbaa !204
  %indvars.iv.next72.i70.prol = add nuw nsw i64 %indvars.iv71.i65.prol, 1, !dbg !508
  %lftr.wideiv.prol = trunc i64 %indvars.iv71.i65.prol to i32, !dbg !508
  %exitcond.prol = icmp eq i32 %lftr.wideiv.prol, %indvars.iv, !dbg !508
  %prol.iter.sub = sub i32 %prol.iter, 1, !dbg !508
  %prol.iter.cmp = icmp ne i32 %prol.iter.sub, 0, !dbg !508
  br i1 %prol.iter.cmp, label %for.body22.i73.prol, label %for.body22.i73.preheader.split.loopexit, !llvm.loop !509

for.body22.i73.preheader.split.loopexit:          ; preds = %for.body22.i73.prol
  %indvars.iv71.i65.unr.ph = phi i64 [ %indvars.iv.next72.i70.prol, %for.body22.i73.prol ]
  br label %for.body22.i73.preheader.split

for.body22.i73.preheader.split:                   ; preds = %for.body22.i73.preheader.split.loopexit, %for.body22.i73.preheader
  %indvars.iv71.i65.unr = phi i64 [ %resume.val129, %for.body22.i73.preheader ], [ %indvars.iv71.i65.unr.ph, %for.body22.i73.preheader.split.loopexit ]
  %71 = icmp ult i32 %67, 2
  br i1 %71, label %for.cond12.backedge.loopexit, label %for.body22.i73.preheader.split.split

for.body22.i73.preheader.split.split:             ; preds = %for.body22.i73.preheader.split
  br label %for.body22.i73, !dbg !504

for.cond12.backedge.loopexit.unr-lcssa:           ; preds = %for.body22.i73
  br label %for.cond12.backedge.loopexit

for.cond12.backedge.loopexit:                     ; preds = %for.body22.i73.preheader.split, %for.cond12.backedge.loopexit.unr-lcssa
  br label %for.cond12.backedge

for.cond12.backedge:                              ; preds = %for.cond12.backedge.loopexit, %middle.block110, %for.body14
  %indvars.iv.next = add nsw i32 %indvars.iv, -1, !dbg !480
  %exitcond80 = icmp eq i64 %indvars.iv.next78, 2000, !dbg !480
  br i1 %exitcond80, label %for.end30, label %for.body14, !dbg !480

for.body22.i73:                                   ; preds = %for.body22.i73, %for.body22.i73.preheader.split.split
  %indvars.iv71.i65 = phi i64 [ %indvars.iv71.i65.unr, %for.body22.i73.preheader.split.split ], [ %indvars.iv.next72.i70.1, %for.body22.i73 ], !dbg !489
  %arrayidx25.i66 = getelementptr inbounds double* %48, i64 %indvars.iv71.i65, !dbg !504
  %72 = load double* %arrayidx25.i66, align 8, !dbg !504, !tbaa !204
  %73 = fmul double %div, %72, !dbg !505
  %arrayidx29.i68 = getelementptr inbounds double* %b, i64 %indvars.iv71.i65, !dbg !506
  %74 = load double* %arrayidx29.i68, align 8, !dbg !506, !tbaa !204
  %add30.i69 = fsub double %74, %73, !dbg !506
  store double %add30.i69, double* %arrayidx29.i68, align 8, !dbg !506, !tbaa !204
  %indvars.iv.next72.i70 = add nuw nsw i64 %indvars.iv71.i65, 1, !dbg !508
  %lftr.wideiv = trunc i64 %indvars.iv71.i65 to i32, !dbg !508
  %arrayidx25.i66.1 = getelementptr inbounds double* %48, i64 %indvars.iv.next72.i70, !dbg !504
  %75 = load double* %arrayidx25.i66.1, align 8, !dbg !504, !tbaa !204
  %76 = fmul double %div, %75, !dbg !505
  %arrayidx29.i68.1 = getelementptr inbounds double* %b, i64 %indvars.iv.next72.i70, !dbg !506
  %77 = load double* %arrayidx29.i68.1, align 8, !dbg !506, !tbaa !204
  %add30.i69.1 = fsub double %77, %76, !dbg !506
  store double %add30.i69.1, double* %arrayidx29.i68.1, align 8, !dbg !506, !tbaa !204
  %indvars.iv.next72.i70.1 = add nuw nsw i64 %indvars.iv.next72.i70, 1, !dbg !508
  %lftr.wideiv.1 = trunc i64 %indvars.iv.next72.i70 to i32, !dbg !508
  %exitcond.1 = icmp eq i32 %lftr.wideiv.1, %indvars.iv, !dbg !508
  br i1 %exitcond.1, label %for.cond12.backedge.loopexit.unr-lcssa, label %for.body22.i73, !dbg !508, !llvm.loop !510

for.end30:                                        ; preds = %for.cond12.backedge
  ret void, !dbg !511
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !119, metadata !166), !dbg !512
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !120, metadata !166), !dbg !513
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !122, metadata !166), !dbg !514
  %cmp = icmp sgt i32 %argc, 1, !dbg !515
  br i1 %cmp, label %cond.true.lr.ph, label %if.end44, !dbg !516

cond.true.lr.ph:                                  ; preds = %entry
  %arrayidx = getelementptr inbounds i8** %argv, i64 1, !dbg !517
  %0 = load i8** %arrayidx, align 8, !dbg !517, !tbaa !202
  %1 = load i8* %0, align 1, !dbg !517, !tbaa !519
  %cmp10 = icmp eq i8 %1, 45, !dbg !520
  %arrayidx14 = getelementptr inbounds i8* %0, i64 1, !dbg !523
  %arrayidx24 = getelementptr inbounds i8* %0, i64 2, !dbg !526
  %arrayidx34 = getelementptr inbounds i8* %0, i64 3, !dbg !530
  br label %cond.true, !dbg !533

for.cond:                                         ; preds = %cond.true, %if.then12, %if.then22, %if.end38
  %inc120 = add nuw nsw i32 %i.0113, 1, !dbg !534
  %cmp1 = icmp slt i32 %inc120, %argc, !dbg !535
  br i1 %cmp1, label %cond.true, label %if.end44.loopexit, !dbg !533

cond.true:                                        ; preds = %cond.true.lr.ph, %for.cond
  %i.0113 = phi i32 [ 1, %cond.true.lr.ph ], [ %inc120, %for.cond ]
  tail call void @llvm.dbg.value(metadata i64 3, i64 0, metadata !132, metadata !166), !dbg !536
  tail call void @llvm.dbg.value(metadata i8* %0, i64 0, metadata !133, metadata !166), !dbg !537
  br i1 %cmp10, label %if.then12, label %for.cond, !dbg !537

if.then12:                                        ; preds = %cond.true
  %2 = load i8* %arrayidx14, align 1, !dbg !523, !tbaa !519
  %cmp20 = icmp eq i8 %2, 103, !dbg !538
  br i1 %cmp20, label %if.then22, label %for.cond, !dbg !540

if.then22:                                        ; preds = %if.then12
  %3 = load i8* %arrayidx24, align 1, !dbg !526, !tbaa !519
  %cmp30 = icmp eq i8 %3, 97, !dbg !541
  br i1 %cmp30, label %if.end38, label %for.cond, !dbg !543

if.end38:                                         ; preds = %if.then22
  %4 = load i8* %arrayidx34, align 1, !dbg !530, !tbaa !519
  %tobool = icmp eq i8 %4, 0, !dbg !544
  br i1 %tobool, label %if.end44.loopexit, label %for.cond, !dbg !544

if.end44.loopexit:                                ; preds = %if.end38, %for.cond
  %ga_testing.0.ph = phi i1 [ false, %for.cond ], [ true, %if.end38 ]
  br label %if.end44

if.end44:                                         ; preds = %if.end44.loopexit, %entry
  %ga_testing.0 = phi i1 [ false, %entry ], [ %ga_testing.0.ph, %if.end44.loopexit ]
  %call46 = tail call noalias i8* @malloc(i64 16000) #5, !dbg !545
  %5 = bitcast i8* %call46 to double**, !dbg !546
  tail call void @llvm.dbg.value(metadata double** %5, i64 0, metadata !136, metadata !166), !dbg !547
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !121, metadata !166), !dbg !548
  br label %for.body50, !dbg !549

for.body50:                                       ; preds = %for.body50, %if.end44
  %indvars.iv115 = phi i64 [ 0, %if.end44 ], [ %indvars.iv.next116, %for.body50 ]
  %call51 = tail call noalias i8* @malloc(i64 16008) #5, !dbg !551
  %arrayidx52 = getelementptr inbounds double** %5, i64 %indvars.iv115, !dbg !553
  %6 = bitcast double** %arrayidx52 to i8**, !dbg !553
  store i8* %call51, i8** %6, align 8, !dbg !553, !tbaa !202
  %indvars.iv.next116 = add nuw nsw i64 %indvars.iv115, 1, !dbg !549
  %exitcond117 = icmp eq i64 %indvars.iv.next116, 2000, !dbg !549
  br i1 %exitcond117, label %for.end55, label %for.body50, !dbg !549

for.end55:                                        ; preds = %for.body50
  %call57 = tail call noalias i8* @malloc(i64 16000) #5, !dbg !554
  tail call void @llvm.dbg.value(metadata double* %7, i64 0, metadata !137, metadata !166), !dbg !555
  tail call void @llvm.dbg.value(metadata double* undef, i64 0, metadata !138, metadata !166), !dbg !556
  %call61 = tail call noalias i8* @malloc(i64 8000) #5, !dbg !557
  tail call void @llvm.dbg.value(metadata i32* %8, i64 0, metadata !139, metadata !166), !dbg !558
  tail call void @llvm.dbg.value(metadata double 0x41F3E5E475555555, i64 0, metadata !140, metadata !166), !dbg !559
  tail call void @llvm.dbg.value(metadata double** %5, i64 0, metadata !560, metadata !166) #5, !dbg !562
  tail call void @llvm.dbg.value(metadata double* %7, i64 0, metadata !563, metadata !166) #5, !dbg !564
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !565, metadata !166) #5, !dbg !566
  %seed.promoted59.i = load i64* @seed, align 8, !dbg !567, !tbaa !176
  br label %for.cond1.preheader.i, !dbg !569

for.cond1.preheader.i:                            ; preds = %for.inc6.i, %for.end55
  %indvars.iv71.i = phi i64 [ 0, %for.end55 ], [ %indvars.iv.next72.i, %for.inc6.i ], !dbg !561
  %xor5.i.lcssa60.i = phi i64 [ %seed.promoted59.i, %for.end55 ], [ %xor5.i.i.lcssa, %for.inc6.i ], !dbg !561
  br label %for.body3.i, !dbg !570

for.cond9.preheader.i:                            ; preds = %for.inc6.i
  %xor5.i.i.lcssa.lcssa = phi i64 [ %xor5.i.i.lcssa, %for.inc6.i ]
  %7 = bitcast i8* %call57 to double*, !dbg !571
  %8 = bitcast i8* %call61 to i32*, !dbg !572
  store i64 %xor5.i.i.lcssa.lcssa, i64* @seed, align 8, !dbg !567, !tbaa !176
  tail call void @llvm.memset.p0i8.i64(i8* %call57, i8 0, i64 16000, i32 8, i1 false) #5, !dbg !573
  br label %for.cond20.preheader.i, !dbg !574

for.body3.i:                                      ; preds = %for.body3.i, %for.cond1.preheader.i
  %indvars.iv68.i = phi i64 [ 0, %for.cond1.preheader.i ], [ %indvars.iv.next69.i, %for.body3.i ], !dbg !561
  %xor5.i57.i = phi i64 [ %xor5.i.lcssa60.i, %for.cond1.preheader.i ], [ %xor5.i.i, %for.body3.i ], !dbg !575
  %xor.i.i = xor i64 %xor5.i57.i, 123459876, !dbg !575
  %div.i.i = sdiv i64 %xor.i.i, 127773, !dbg !576
  tail call void @llvm.dbg.value(metadata i64 %div.i.i, i64 0, metadata !577, metadata !166) #5, !dbg !578
  %9 = mul i64 %div.i.i, -127773, !dbg !579
  %sub7.i51.i108 = add i64 %xor.i.i, %9, !dbg !579
  %mul1.i.i = mul nsw i64 %sub7.i51.i108, 16807, !dbg !580
  %10 = mul i64 %div.i.i, -2836, !dbg !580
  %sub38.i52.i109 = add i64 %mul1.i.i, %10, !dbg !580
  %cmp.i.i = icmp slt i64 %sub38.i52.i109, 0, !dbg !581
  %add.i.i = add nsw i64 %sub38.i52.i109, 2147483647, !dbg !582
  %add.sub3.i.i = select i1 %cmp.i.i, i64 %add.i.i, i64 %sub38.i52.i109, !dbg !583
  %conv.i.i = sitofp i64 %add.sub3.i.i to double, !dbg !584
  %mul4.i.i = fmul double %conv.i.i, 0x3E00000000200FE1, !dbg !585
  tail call void @llvm.dbg.value(metadata double %mul4.i.i, i64 0, metadata !586, metadata !166) #5, !dbg !587
  %xor5.i.i = xor i64 %add.sub3.i.i, 123459876, !dbg !567
  %arrayidx.i = getelementptr inbounds double** %5, i64 %indvars.iv68.i, !dbg !588
  %11 = load double** %arrayidx.i, align 8, !dbg !588, !tbaa !202
  %arrayidx5.i = getelementptr inbounds double* %11, i64 %indvars.iv71.i, !dbg !588
  store double %mul4.i.i, double* %arrayidx5.i, align 8, !dbg !588, !tbaa !204
  %indvars.iv.next69.i = add nuw nsw i64 %indvars.iv68.i, 1, !dbg !570
  %exitcond70.i = icmp eq i64 %indvars.iv.next69.i, 2000, !dbg !570
  br i1 %exitcond70.i, label %for.inc6.i, label %for.body3.i, !dbg !570

for.inc6.i:                                       ; preds = %for.body3.i
  %xor5.i.i.lcssa = phi i64 [ %xor5.i.i, %for.body3.i ]
  %indvars.iv.next72.i = add nuw nsw i64 %indvars.iv71.i, 1, !dbg !569
  %exitcond73.i = icmp eq i64 %indvars.iv.next72.i, 2000, !dbg !569
  br i1 %exitcond73.i, label %for.cond9.preheader.i, label %for.cond1.preheader.i, !dbg !569

for.cond20.preheader.i:                           ; preds = %for.inc32.i, %for.cond9.preheader.i
  %indvars.iv61.i = phi i64 [ 0, %for.cond9.preheader.i ], [ %indvars.iv.next62.i, %for.inc32.i ], !dbg !561
  %arrayidx25.i = getelementptr inbounds double** %5, i64 %indvars.iv61.i, !dbg !589
  %12 = load double** %arrayidx25.i, align 8, !dbg !589, !tbaa !202
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %for.cond20.preheader.i
  %index = phi i64 [ 0, %for.cond20.preheader.i ], [ %index.next, %vector.body ], !dbg !561
  %13 = getelementptr inbounds double* %12, i64 %index, !dbg !589
  %14 = bitcast double* %13 to <2 x double>*, !dbg !589
  %wide.load = load <2 x double>* %14, align 8, !dbg !589, !tbaa !204
  %.sum125 = or i64 %index, 2, !dbg !589
  %15 = getelementptr double* %12, i64 %.sum125, !dbg !589
  %16 = bitcast double* %15 to <2 x double>*, !dbg !589
  %wide.load122 = load <2 x double>* %16, align 8, !dbg !589, !tbaa !204
  %17 = getelementptr inbounds double* %7, i64 %index, !dbg !590
  %18 = bitcast double* %17 to <2 x double>*, !dbg !590
  %wide.load123 = load <2 x double>* %18, align 8, !dbg !590, !tbaa !204
  %.sum126 = or i64 %index, 2, !dbg !590
  %19 = getelementptr double* %7, i64 %.sum126, !dbg !590
  %20 = bitcast double* %19 to <2 x double>*, !dbg !590
  %wide.load124 = load <2 x double>* %20, align 8, !dbg !590, !tbaa !204
  %21 = fadd <2 x double> %wide.load, %wide.load123, !dbg !590
  %22 = fadd <2 x double> %wide.load122, %wide.load124, !dbg !590
  %23 = bitcast double* %17 to <2 x double>*, !dbg !590
  store <2 x double> %21, <2 x double>* %23, align 8, !dbg !590, !tbaa !204
  %24 = bitcast double* %19 to <2 x double>*, !dbg !590
  store <2 x double> %22, <2 x double>* %24, align 8, !dbg !590, !tbaa !204
  %index.next = add i64 %index, 4, !dbg !561
  %25 = icmp eq i64 %index.next, 2000, !dbg !561
  br i1 %25, label %for.inc32.i, label %vector.body, !dbg !561, !llvm.loop !591

for.inc32.i:                                      ; preds = %vector.body
  %indvars.iv.next62.i = add nuw nsw i64 %indvars.iv61.i, 1, !dbg !574
  %exitcond63.i = icmp eq i64 %indvars.iv.next62.i, 2000, !dbg !574
  br i1 %exitcond63.i, label %matgen.exit, label %for.cond20.preheader.i, !dbg !574

matgen.exit:                                      ; preds = %for.inc32.i
  tail call void @dgefa(double** %5, i32* %8), !dbg !592
  tail call void @dgesl(double** %5, i32* %8, double* %7), !dbg !593
  tail call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !141, metadata !166), !dbg !594
  tail call void @free(i8* %call61) #5, !dbg !595
  tail call void @free(i8* %call57) #5, !dbg !596
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !121, metadata !166), !dbg !548
  br label %for.body67, !dbg !597

for.body67:                                       ; preds = %for.body67, %matgen.exit
  %indvars.iv = phi i64 [ 0, %matgen.exit ], [ %indvars.iv.next, %for.body67 ]
  %arrayidx69 = getelementptr inbounds double** %5, i64 %indvars.iv, !dbg !599
  %26 = bitcast double** %arrayidx69 to i8**, !dbg !599
  %27 = load i8** %26, align 8, !dbg !599, !tbaa !202
  tail call void @free(i8* %27) #5, !dbg !601
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !597
  %exitcond = icmp eq i64 %indvars.iv.next, 2000, !dbg !597
  br i1 %exitcond, label %for.end72, label %for.body67, !dbg !597

for.end72:                                        ; preds = %for.body67
  tail call void @free(i8* %call46) #5, !dbg !602
  %28 = load %struct._IO_FILE** @stdout, align 8, !dbg !603, !tbaa !202
  br i1 %ga_testing.0, label %if.then74, label %if.else, !dbg !605

if.then74:                                        ; preds = %for.end72
  %call75 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %28, i8* getelementptr inbounds ([3 x i8]* @.str1, i64 0, i64 0), double 0.000000e+00) #5, !dbg !606
  br label %if.end77, !dbg !606

if.else:                                          ; preds = %for.end72
  %call76 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %28, i8* getelementptr inbounds ([33 x i8]* @.str2, i64 0, i64 0), double 0.000000e+00) #5, !dbg !607
  br label %if.end77

if.end77:                                         ; preds = %if.else, %if.then74
  %29 = load %struct._IO_FILE** @stdout, align 8, !dbg !608, !tbaa !202
  %call78 = tail call i32 @fflush(%struct._IO_FILE* %29) #5, !dbg !609
  ret i32 0, !dbg !610
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #3

; Function Attrs: nounwind
declare void @free(i8* nocapture) #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #3

; Function Attrs: nounwind
declare i32 @fflush(%struct._IO_FILE* nocapture) #3

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #4

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #5

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!163, !164}
!llvm.ident = !{!165}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !20, !149, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c] [DW_LANG_C99]
!1 = !{!"lpbench.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4, !7, !9, !12, !15, !16, !18, !17}
!4 = !{!"0x16\00size_t\0062\000\000\000\000", !5, null, !6} ; [ DW_TAG_typedef ] [size_t] [line 62, size 0, align 0, offset 0] [from long unsigned int]
!5 = !{!"/usr/local/bin/../lib/clang/3.6.0/include/stddef.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!6 = !{!"0x24\00long unsigned int\000\0064\0064\000\000\007", null, null} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!7 = !{!"0xf\00\000\0064\0064\000\000", null, null, !8} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!8 = !{!"0x26\00\000\000\000\000\000", null, null, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!9 = !{!"0xf\00\000\0064\0064\000\000", null, null, !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = !{!"0x26\00\000\000\000\000\000", null, null, !11} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from unsigned char]
!11 = !{!"0x24\00unsigned char\000\008\008\000\000\008", null, null} ; [ DW_TAG_base_type ] [unsigned char] [line 0, size 8, align 8, offset 0, enc DW_ATE_unsigned_char]
!12 = !{!"0xf\00\000\0064\0064\000\000", null, null, !13} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!13 = !{!"0x26\00\000\000\000\000\000", null, null, !14} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!14 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!15 = !{!"0xf\00\000\0064\0064\000\000", null, null, !16} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!16 = !{!"0xf\00\000\0064\0064\000\000", null, null, !17} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!17 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!18 = !{!"0xf\00\000\0064\0064\000\000", null, null, !19} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!19 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!20 = !{!21, !30, !43, !58, !77, !98, !113, !142}
!21 = !{!"0x2e\00matgen\00matgen\00\0093\000\001\000\000\00256\001\0094", !1, !22, !23, null, void (double**, double*)* @matgen, null, null, !25} ; [ DW_TAG_subprogram ] [line 93] [def] [scope 94] [matgen]
!22 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!23 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !24, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!24 = !{null, !15, !16}
!25 = !{!26, !27, !28, !29}
!26 = !{!"0x101\00a\0016777309\000", !21, !22, !15} ; [ DW_TAG_arg_variable ] [a] [line 93]
!27 = !{!"0x101\00b\0033554525\000", !21, !22, !16} ; [ DW_TAG_arg_variable ] [b] [line 93]
!28 = !{!"0x100\00i\0096\000", !21, !22, !19}     ; [ DW_TAG_auto_variable ] [i] [line 96]
!29 = !{!"0x100\00j\0096\000", !21, !22, !19}     ; [ DW_TAG_auto_variable ] [j] [line 96]
!30 = !{!"0x2e\00idamax\00idamax\00\00111\000\001\000\000\00256\001\00112", !1, !22, !31, null, i32 (i32, double*, i32, i32)* @idamax, null, null, !33} ; [ DW_TAG_subprogram ] [line 111] [def] [scope 112] [idamax]
!31 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !32, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!32 = !{!19, !19, !16, !19, !19}
!33 = !{!34, !35, !36, !37, !38, !39, !40, !41, !42}
!34 = !{!"0x101\00n\0016777327\000", !30, !22, !19} ; [ DW_TAG_arg_variable ] [n] [line 111]
!35 = !{!"0x101\00dx\0033554543\000", !30, !22, !16} ; [ DW_TAG_arg_variable ] [dx] [line 111]
!36 = !{!"0x101\00dx_off\0050331759\000", !30, !22, !19} ; [ DW_TAG_arg_variable ] [dx_off] [line 111]
!37 = !{!"0x101\00incx\0067108975\000", !30, !22, !19} ; [ DW_TAG_arg_variable ] [incx] [line 111]
!38 = !{!"0x100\00dmax\00113\000", !30, !22, !17} ; [ DW_TAG_auto_variable ] [dmax] [line 113]
!39 = !{!"0x100\00dtemp\00113\000", !30, !22, !17} ; [ DW_TAG_auto_variable ] [dtemp] [line 113]
!40 = !{!"0x100\00i\00114\000", !30, !22, !19}    ; [ DW_TAG_auto_variable ] [i] [line 114]
!41 = !{!"0x100\00ix\00114\000", !30, !22, !19}   ; [ DW_TAG_auto_variable ] [ix] [line 114]
!42 = !{!"0x100\00itemp\00114\000", !30, !22, !19} ; [ DW_TAG_auto_variable ] [itemp] [line 114]
!43 = !{!"0x2e\00dscal\00dscal\00\00205\000\001\000\000\00256\001\00206", !1, !22, !44, null, void (i32, double, double*, i32, i32)* @dscal, null, null, !46} ; [ DW_TAG_subprogram ] [line 205] [def] [scope 206] [dscal]
!44 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !45, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!45 = !{null, !19, !17, !16, !19, !19}
!46 = !{!47, !48, !49, !50, !51, !52, !53}
!47 = !{!"0x101\00n\0016777421\000", !43, !22, !19} ; [ DW_TAG_arg_variable ] [n] [line 205]
!48 = !{!"0x101\00da\0033554637\000", !43, !22, !17} ; [ DW_TAG_arg_variable ] [da] [line 205]
!49 = !{!"0x101\00dx\0050331853\000", !43, !22, !16} ; [ DW_TAG_arg_variable ] [dx] [line 205]
!50 = !{!"0x101\00dx_off\0067109069\000", !43, !22, !19} ; [ DW_TAG_arg_variable ] [dx_off] [line 205]
!51 = !{!"0x101\00incx\0083886285\000", !43, !22, !19} ; [ DW_TAG_arg_variable ] [incx] [line 205]
!52 = !{!"0x100\00i\00207\000", !43, !22, !19}    ; [ DW_TAG_auto_variable ] [i] [line 207]
!53 = !{!"0x100\00nincx\00214\000", !54, !22, !19} ; [ DW_TAG_auto_variable ] [nincx] [line 214]
!54 = !{!"0xb\00212\009\0030", !1, !55}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!55 = !{!"0xb\00211\0013\0029", !1, !56}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!56 = !{!"0xb\00210\005\0028", !1, !57}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!57 = !{!"0xb\00209\009\0027", !1, !43}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!58 = !{!"0x2e\00daxpy\00daxpy\00\00229\000\001\000\000\00256\001\00230", !1, !22, !59, null, void (i32, double, double*, i32, i32, double*, i32, i32)* @daxpy, null, null, !61} ; [ DW_TAG_subprogram ] [line 229] [def] [scope 230] [daxpy]
!59 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !60, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!60 = !{null, !19, !17, !16, !19, !19, !16, !19, !19}
!61 = !{!62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !76}
!62 = !{!"0x101\00n\0016777445\000", !58, !22, !19} ; [ DW_TAG_arg_variable ] [n] [line 229]
!63 = !{!"0x101\00da\0033554661\000", !58, !22, !17} ; [ DW_TAG_arg_variable ] [da] [line 229]
!64 = !{!"0x101\00dx\0050331877\000", !58, !22, !16} ; [ DW_TAG_arg_variable ] [dx] [line 229]
!65 = !{!"0x101\00dx_off\0067109093\000", !58, !22, !19} ; [ DW_TAG_arg_variable ] [dx_off] [line 229]
!66 = !{!"0x101\00incx\0083886309\000", !58, !22, !19} ; [ DW_TAG_arg_variable ] [incx] [line 229]
!67 = !{!"0x101\00dy\00100663525\000", !58, !22, !16} ; [ DW_TAG_arg_variable ] [dy] [line 229]
!68 = !{!"0x101\00dy_off\00117440741\000", !58, !22, !19} ; [ DW_TAG_arg_variable ] [dy_off] [line 229]
!69 = !{!"0x101\00incy\00134217957\000", !58, !22, !19} ; [ DW_TAG_arg_variable ] [incy] [line 229]
!70 = !{!"0x100\00i\00231\000", !58, !22, !19}    ; [ DW_TAG_auto_variable ] [i] [line 231]
!71 = !{!"0x100\00ix\00238\000", !72, !22, !19}   ; [ DW_TAG_auto_variable ] [ix] [line 238]
!72 = !{!"0xb\00236\009\0039", !1, !73}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!73 = !{!"0xb\00235\0013\0038", !1, !74}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!74 = !{!"0xb\00234\005\0037", !1, !75}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!75 = !{!"0xb\00233\009\0036", !1, !58}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!76 = !{!"0x100\00iy\00239\000", !72, !22, !19}   ; [ DW_TAG_auto_variable ] [iy] [line 239]
!77 = !{!"0x2e\00dgefa\00dgefa\00\00266\000\001\000\000\00256\001\00267", !1, !22, !78, null, void (double**, i32*)* @dgefa, null, null, !80} ; [ DW_TAG_subprogram ] [line 266] [def] [scope 267] [dgefa]
!78 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !79, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!79 = !{null, !15, !18}
!80 = !{!81, !82, !83, !84, !85, !86, !90, !91, !92}
!81 = !{!"0x101\00a\0016777482\000", !77, !22, !15} ; [ DW_TAG_arg_variable ] [a] [line 266]
!82 = !{!"0x101\00ipvt\0033554698\000", !77, !22, !18} ; [ DW_TAG_arg_variable ] [ipvt] [line 266]
!83 = !{!"0x100\00temp\00268\000", !77, !22, !17} ; [ DW_TAG_auto_variable ] [temp] [line 268]
!84 = !{!"0x100\00k\00269\000", !77, !22, !19}    ; [ DW_TAG_auto_variable ] [k] [line 269]
!85 = !{!"0x100\00j\00269\000", !77, !22, !19}    ; [ DW_TAG_auto_variable ] [j] [line 269]
!86 = !{!"0x100\00col_k\00273\000", !87, !22, !16} ; [ DW_TAG_auto_variable ] [col_k] [line 273]
!87 = !{!"0xb\00272\005\0050", !1, !88}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!88 = !{!"0xb\00271\005\0049", !1, !89}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!89 = !{!"0xb\00271\005\0048", !1, !77}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!90 = !{!"0x100\00kp1\00274\000", !87, !22, !19}  ; [ DW_TAG_auto_variable ] [kp1] [line 274]
!91 = !{!"0x100\00l\00277\000", !87, !22, !19}    ; [ DW_TAG_auto_variable ] [l] [line 277]
!92 = !{!"0x100\00col_j\00298\000", !93, !22, !16} ; [ DW_TAG_auto_variable ] [col_j] [line 298]
!93 = !{!"0xb\00297\0013\0057", !1, !94}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!94 = !{!"0xb\00296\0013\0056", !1, !95}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!95 = !{!"0xb\00296\0013\0055", !1, !96}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!96 = !{!"0xb\00282\009\0052", !1, !97}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!97 = !{!"0xb\00281\0013\0051", !1, !87}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!98 = !{!"0x2e\00dgesl\00dgesl\00\00317\000\001\000\000\00256\001\00318", !1, !22, !99, null, void (double**, i32*, double*)* @dgesl, null, null, !101} ; [ DW_TAG_subprogram ] [line 317] [def] [scope 318] [dgesl]
!99 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !100, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!100 = !{null, !15, !18, !16}
!101 = !{!102, !103, !104, !105, !106, !107, !108, !112}
!102 = !{!"0x101\00a\0016777533\000", !98, !22, !15} ; [ DW_TAG_arg_variable ] [a] [line 317]
!103 = !{!"0x101\00ipvt\0033554749\000", !98, !22, !18} ; [ DW_TAG_arg_variable ] [ipvt] [line 317]
!104 = !{!"0x101\00b\0050331965\000", !98, !22, !16} ; [ DW_TAG_arg_variable ] [b] [line 317]
!105 = !{!"0x100\00t\00319\000", !98, !22, !17}   ; [ DW_TAG_auto_variable ] [t] [line 319]
!106 = !{!"0x100\00k\00320\000", !98, !22, !19}   ; [ DW_TAG_auto_variable ] [k] [line 320]
!107 = !{!"0x100\00kb\00320\000", !98, !22, !19}  ; [ DW_TAG_auto_variable ] [kb] [line 320]
!108 = !{!"0x100\00l\00325\000", !109, !22, !19}  ; [ DW_TAG_auto_variable ] [l] [line 325]
!109 = !{!"0xb\00324\005\0062", !1, !110}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!110 = !{!"0xb\00323\005\0061", !1, !111}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!111 = !{!"0xb\00323\005\0060", !1, !98}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!112 = !{!"0x100\00kp1\00334\000", !109, !22, !19} ; [ DW_TAG_auto_variable ] [kp1] [line 334]
!113 = !{!"0x2e\00main\00main\00\00348\000\001\000\000\00256\001\00349", !1, !22, !114, null, i32 (i32, i8**)* @main, null, null, !118} ; [ DW_TAG_subprogram ] [line 348] [def] [scope 349] [main]
!114 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !115, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!115 = !{!19, !19, !116}
!116 = !{!"0xf\00\000\0064\0064\000\000", null, null, !117} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!117 = !{!"0xf\00\000\0064\0064\000\000", null, null, !14} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!118 = !{!119, !120, !121, !122, !124, !132, !133, !135, !136, !137, !138, !139, !140, !141}
!119 = !{!"0x101\00argc\0016777564\000", !113, !22, !19} ; [ DW_TAG_arg_variable ] [argc] [line 348]
!120 = !{!"0x101\00argv\0033554780\000", !113, !22, !116} ; [ DW_TAG_arg_variable ] [argv] [line 348]
!121 = !{!"0x100\00i\00350\000", !113, !22, !19}  ; [ DW_TAG_auto_variable ] [i] [line 350]
!122 = !{!"0x100\00ga_testing\00353\000", !113, !22, !123} ; [ DW_TAG_auto_variable ] [ga_testing] [line 353]
!123 = !{!"0x24\00_Bool\000\008\008\000\000\002", null, null} ; [ DW_TAG_base_type ] [_Bool] [line 0, size 8, align 8, offset 0, enc DW_ATE_boolean]
!124 = !{!"0x100\00__s1_len\00359\000", !125, !22, !4} ; [ DW_TAG_auto_variable ] [__s1_len] [line 359]
!125 = !{!"0xb\00359\0018\0074", !1, !126}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!126 = !{!"0xb\00359\0017\0073", !1, !127}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!127 = !{!"0xb\00358\009\0072", !1, !128}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!128 = !{!"0xb\00357\009\0071", !1, !129}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!129 = !{!"0xb\00357\009\0070", !1, !130}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!130 = !{!"0xb\00356\005\0069", !1, !131}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!131 = !{!"0xb\00355\009\0068", !1, !113}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!132 = !{!"0x100\00__s2_len\00359\000", !125, !22, !4} ; [ DW_TAG_auto_variable ] [__s2_len] [line 359]
!133 = !{!"0x100\00__s2\00359\000", !134, !22, !9} ; [ DW_TAG_auto_variable ] [__s2] [line 359]
!134 = !{!"0xb\00359\0018\0075", !1, !125}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!135 = !{!"0x100\00__result\00359\000", !134, !22, !19} ; [ DW_TAG_auto_variable ] [__result] [line 359]
!136 = !{!"0x100\00a\00367\000", !113, !22, !15}  ; [ DW_TAG_auto_variable ] [a] [line 367]
!137 = !{!"0x100\00b\00372\000", !113, !22, !16}  ; [ DW_TAG_auto_variable ] [b] [line 372]
!138 = !{!"0x100\00x\00373\000", !113, !22, !16}  ; [ DW_TAG_auto_variable ] [x] [line 373]
!139 = !{!"0x100\00ipvt\00374\000", !113, !22, !18} ; [ DW_TAG_auto_variable ] [ipvt] [line 374]
!140 = !{!"0x100\00ops\00377\000", !113, !22, !17} ; [ DW_TAG_auto_variable ] [ops] [line 377]
!141 = !{!"0x100\00run_time\00392\000", !113, !22, !17} ; [ DW_TAG_auto_variable ] [run_time] [line 392]
!142 = !{!"0x2e\00random_double\00random_double\00\0052\001\001\000\000\000\001\0053", !1, !22, !143, null, null, null, null, !145} ; [ DW_TAG_subprogram ] [line 52] [local] [def] [scope 53] [random_double]
!143 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !144, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!144 = !{!17}
!145 = !{!146, !148}
!146 = !{!"0x100\00k\0054\000", !142, !22, !147}  ; [ DW_TAG_auto_variable ] [k] [line 54]
!147 = !{!"0x24\00long int\000\0064\0064\000\000\005", null, null} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!148 = !{!"0x100\00result\0055\000", !142, !22, !17} ; [ DW_TAG_auto_variable ] [result] [line 55]
!149 = !{!150, !152, !153, !154, !156, !157, !158, !159, !160, !162}
!150 = !{!"0x34\00N\00N\00\0086\001\001", null, !22, !151, i32 2000, null} ; [ DW_TAG_variable ] [N] [line 86] [local] [def]
!151 = !{!"0x26\00\000\000\000\000\000", null, null, !19} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from int]
!152 = !{!"0x34\00NM1\00NM1\00\0087\001\001", null, !22, !151, i32 1999, null} ; [ DW_TAG_variable ] [NM1] [line 87] [local] [def]
!153 = !{!"0x34\00NP1\00NP1\00\0088\001\001", null, !22, !151, i32 2001, null} ; [ DW_TAG_variable ] [NP1] [line 88] [local] [def]
!154 = !{!"0x34\00MASK\00MASK\00\0050\001\001", null, !22, !155, i64 123459876, null} ; [ DW_TAG_variable ] [MASK] [line 50] [local] [def]
!155 = !{!"0x26\00\000\000\000\000\000", null, null, !147} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from long int]
!156 = !{!"0x34\00IQ\00IQ\00\0048\001\001", null, !22, !155, i64 127773, null} ; [ DW_TAG_variable ] [IQ] [line 48] [local] [def]
!157 = !{!"0x34\00IA\00IA\00\0045\001\001", null, !22, !155, i64 16807, null} ; [ DW_TAG_variable ] [IA] [line 45] [local] [def]
!158 = !{!"0x34\00IR\00IR\00\0049\001\001", null, !22, !155, i64 2836, null} ; [ DW_TAG_variable ] [IR] [line 49] [local] [def]
!159 = !{!"0x34\00IM\00IM\00\0046\001\001", null, !22, !155, i64 2147483647, null} ; [ DW_TAG_variable ] [IM] [line 46] [local] [def]
!160 = !{!"0x34\00AM\00AM\00\0047\001\001", null, !22, !161, double 0x3E00000000200FE1, null} ; [ DW_TAG_variable ] [AM] [line 47] [local] [def]
!161 = !{!"0x26\00\000\000\000\000\000", null, null, !17} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from double]
!162 = !{!"0x34\00seed\00seed\00\0044\001\001", null, !22, !147, i64* @seed, null} ; [ DW_TAG_variable ] [seed] [line 44] [local] [def]
!163 = !{i32 2, !"Dwarf Version", i32 4}
!164 = !{i32 2, !"Debug Info Version", i32 2}
!165 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!166 = !{!"0x102"}                                ; [ DW_TAG_expression ]
!167 = !MDLocation(line: 93, column: 24, scope: !21)
!168 = !MDLocation(line: 93, column: 36, scope: !21)
!169 = !MDLocation(line: 96, column: 9, scope: !21)
!170 = !MDLocation(line: 65, column: 5, scope: !142, inlinedAt: !171)
!171 = !MDLocation(line: 100, column: 23, scope: !172)
!172 = !{!"0xb\0099\009\003", !1, !173}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!173 = !{!"0xb\0099\009\002", !1, !174}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!174 = !{!"0xb\0098\005\001", !1, !175}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!175 = !{!"0xb\0098\005\000", !1, !21}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!176 = !{!177, !177, i64 0}
!177 = !{!"long", !178, i64 0}
!178 = !{!"omnipotent char", !179, i64 0}
!179 = !{!"Simple C/C++ TBAA"}
!180 = !MDLocation(line: 98, column: 5, scope: !175)
!181 = !MDLocation(line: 99, column: 9, scope: !173)
!182 = !MDLocation(line: 103, column: 9, scope: !183)
!183 = !{!"0xb\00102\005\005", !1, !184}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!184 = !{!"0xb\00102\005\004", !1, !21}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!185 = !MDLocation(line: 105, column: 5, scope: !186)
!186 = !{!"0xb\00105\005\006", !1, !21}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!187 = !MDLocation(line: 57, column: 5, scope: !142, inlinedAt: !171)
!188 = !MDLocation(line: 58, column: 9, scope: !142, inlinedAt: !171)
!189 = !{!"0x100\00k\0054\000", !142, !22, !147, !171} ; [ DW_TAG_auto_variable ] [k] [line 54]
!190 = !MDLocation(line: 54, column: 10, scope: !142, inlinedAt: !171)
!191 = !MDLocation(line: 59, column: 18, scope: !142, inlinedAt: !171)
!192 = !MDLocation(line: 59, column: 12, scope: !142, inlinedAt: !171)
!193 = !MDLocation(line: 61, column: 9, scope: !194, inlinedAt: !171)
!194 = !{!"0xb\0061\009\0087", !1, !142}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!195 = !MDLocation(line: 62, column: 9, scope: !194, inlinedAt: !171)
!196 = !MDLocation(line: 61, column: 9, scope: !142, inlinedAt: !171)
!197 = !MDLocation(line: 64, column: 19, scope: !142, inlinedAt: !171)
!198 = !MDLocation(line: 64, column: 14, scope: !142, inlinedAt: !171)
!199 = !{!"0x100\00result\0055\000", !142, !22, !17, !171} ; [ DW_TAG_auto_variable ] [result] [line 55]
!200 = !MDLocation(line: 55, column: 12, scope: !142, inlinedAt: !171)
!201 = !MDLocation(line: 100, column: 13, scope: !172)
!202 = !{!203, !203, i64 0}
!203 = !{!"any pointer", !178, i64 0}
!204 = !{!205, !205, i64 0}
!205 = !{!"double", !178, i64 0}
!206 = !MDLocation(line: 107, column: 21, scope: !207)
!207 = !{!"0xb\00106\009\009", !1, !208}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!208 = !{!"0xb\00106\009\008", !1, !209}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!209 = !{!"0xb\00105\005\007", !1, !186}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!210 = !MDLocation(line: 106, column: 9, scope: !208)
!211 = !MDLocation(line: 107, column: 13, scope: !207)
!212 = distinct !{!212, !213, !214}
!213 = !{!"llvm.loop.vectorize.width", i32 1}
!214 = !{!"llvm.loop.interleave.count", i32 1}
!215 = distinct !{!215, !216}
!216 = !{!"llvm.loop.unroll.disable"}
!217 = distinct !{!217, !213, !214}
!218 = !MDLocation(line: 108, column: 1, scope: !21)
!219 = !MDLocation(line: 111, column: 16, scope: !30)
!220 = !MDLocation(line: 111, column: 28, scope: !30)
!221 = !MDLocation(line: 111, column: 36, scope: !30)
!222 = !MDLocation(line: 111, column: 48, scope: !30)
!223 = !MDLocation(line: 114, column: 16, scope: !30)
!224 = !MDLocation(line: 116, column: 9, scope: !225)
!225 = !{!"0xb\00116\009\0010", !1, !30}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!226 = !MDLocation(line: 116, column: 9, scope: !30)
!227 = !MDLocation(line: 120, column: 13, scope: !228)
!228 = !{!"0xb\00120\0013\0012", !1, !229}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!229 = !{!"0xb\00119\005\0011", !1, !225}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!230 = !MDLocation(line: 120, column: 13, scope: !229)
!231 = !MDLocation(line: 124, column: 17, scope: !232)
!232 = !{!"0xb\00124\0017\0014", !1, !233}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!233 = !{!"0xb\00123\009\0013", !1, !228}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!234 = !MDLocation(line: 147, column: 29, scope: !235)
!235 = !{!"0xb\00144\0013\0021", !1, !232}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!236 = !MDLocation(line: 147, column: 24, scope: !235)
!237 = !MDLocation(line: 113, column: 12, scope: !30)
!238 = !MDLocation(line: 124, column: 17, scope: !233)
!239 = !MDLocation(line: 149, column: 17, scope: !240)
!240 = !{!"0xb\00149\0017\0022", !1, !235}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!241 = !MDLocation(line: 151, column: 34, scope: !242)
!242 = !{!"0xb\00150\0017\0024", !1, !243}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!243 = !{!"0xb\00149\0017\0023", !1, !240}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!244 = !MDLocation(line: 151, column: 31, scope: !242)
!245 = !MDLocation(line: 151, column: 26, scope: !242)
!246 = !MDLocation(line: 113, column: 18, scope: !30)
!247 = !MDLocation(line: 153, column: 22, scope: !248)
!248 = !{!"0xb\00153\0022\0025", !1, !242}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!249 = !MDLocation(line: 153, column: 22, scope: !242)
!250 = distinct !{!250, !216}
!251 = !MDLocation(line: 114, column: 12, scope: !30)
!252 = !MDLocation(line: 114, column: 9, scope: !30)
!253 = !MDLocation(line: 128, column: 22, scope: !254)
!254 = !{!"0xb\00125\0013\0015", !1, !232}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!255 = !MDLocation(line: 130, column: 17, scope: !256)
!256 = !{!"0xb\00130\0017\0016", !1, !254}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!257 = !MDLocation(line: 132, column: 34, scope: !258)
!258 = !{!"0xb\00131\0017\0018", !1, !259}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!259 = !{!"0xb\00130\0017\0017", !1, !256}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!260 = !MDLocation(line: 132, column: 31, scope: !258)
!261 = !MDLocation(line: 132, column: 26, scope: !258)
!262 = !MDLocation(line: 134, column: 25, scope: !263)
!263 = !{!"0xb\00134\0025\0019", !1, !258}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!264 = !MDLocation(line: 134, column: 25, scope: !258)
!265 = !MDLocation(line: 130, column: 36, scope: !259)
!266 = distinct !{!266, !216}
!267 = !MDLocation(line: 163, column: 5, scope: !30)
!268 = !MDLocation(line: 205, column: 16, scope: !43)
!269 = !MDLocation(line: 205, column: 26, scope: !43)
!270 = !MDLocation(line: 205, column: 39, scope: !43)
!271 = !MDLocation(line: 205, column: 47, scope: !43)
!272 = !MDLocation(line: 205, column: 59, scope: !43)
!273 = !MDLocation(line: 209, column: 9, scope: !57)
!274 = !MDLocation(line: 209, column: 9, scope: !43)
!275 = !MDLocation(line: 211, column: 13, scope: !55)
!276 = !MDLocation(line: 211, column: 13, scope: !56)
!277 = !MDLocation(line: 222, column: 13, scope: !278)
!278 = !{!"0xb\00222\0013\0034", !1, !279}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!279 = !{!"0xb\00220\009\0033", !1, !55}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!280 = !MDLocation(line: 223, column: 17, scope: !281)
!281 = !{!"0xb\00222\0013\0035", !1, !278}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!282 = distinct !{!282, !216}
!283 = distinct !{!283, !213, !214}
!284 = !MDLocation(line: 223, column: 20, scope: !281)
!285 = distinct !{!285, !216}
!286 = !MDLocation(line: 214, column: 22, scope: !54)
!287 = !MDLocation(line: 214, column: 14, scope: !54)
!288 = !MDLocation(line: 207, column: 9, scope: !43)
!289 = !MDLocation(line: 216, column: 25, scope: !290)
!290 = !{!"0xb\00216\0013\0032", !1, !291}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!291 = !{!"0xb\00216\0013\0031", !1, !54}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!292 = !MDLocation(line: 216, column: 13, scope: !291)
!293 = !MDLocation(line: 217, column: 20, scope: !290)
!294 = !MDLocation(line: 217, column: 17, scope: !290)
!295 = distinct !{!295, !213, !214}
!296 = !MDLocation(line: 226, column: 1, scope: !43)
!297 = !MDLocation(line: 229, column: 16, scope: !58)
!298 = !MDLocation(line: 229, column: 26, scope: !58)
!299 = !MDLocation(line: 229, column: 39, scope: !58)
!300 = !MDLocation(line: 229, column: 47, scope: !58)
!301 = !MDLocation(line: 229, column: 59, scope: !58)
!302 = !MDLocation(line: 229, column: 74, scope: !58)
!303 = !MDLocation(line: 229, column: 82, scope: !58)
!304 = !MDLocation(line: 229, column: 94, scope: !58)
!305 = !MDLocation(line: 233, column: 10, scope: !75)
!306 = !MDLocation(line: 233, column: 21, scope: !307)
!307 = !{!"0xb\001", !1, !75}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!308 = !MDLocation(line: 233, column: 9, scope: !58)
!309 = !MDLocation(line: 235, column: 13, scope: !73)
!310 = !MDLocation(line: 235, column: 26, scope: !311)
!311 = !{!"0xb\001", !1, !73}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!312 = !MDLocation(line: 235, column: 13, scope: !74)
!313 = !MDLocation(line: 259, column: 13, scope: !314)
!314 = !{!"0xb\00259\0013\0046", !1, !315}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!315 = !{!"0xb\00257\009\0045", !1, !73}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!316 = !MDLocation(line: 260, column: 40, scope: !317)
!317 = !{!"0xb\00259\0013\0047", !1, !314}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!318 = !MDLocation(line: 260, column: 35, scope: !317)
!319 = !MDLocation(line: 260, column: 17, scope: !317)
!320 = distinct !{!320, !213, !214}
!321 = !MDLocation(line: 260, column: 43, scope: !317)
!322 = !MDLocation(line: 260, column: 20, scope: !317)
!323 = distinct !{!323, !216}
!324 = !MDLocation(line: 238, column: 17, scope: !72)
!325 = !MDLocation(line: 239, column: 17, scope: !72)
!326 = !MDLocation(line: 241, column: 17, scope: !327)
!327 = !{!"0xb\00241\0017\0040", !1, !72}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!328 = !MDLocation(line: 241, column: 17, scope: !72)
!329 = !MDLocation(line: 242, column: 23, scope: !327)
!330 = !MDLocation(line: 242, column: 22, scope: !327)
!331 = !MDLocation(line: 242, column: 17, scope: !327)
!332 = !MDLocation(line: 244, column: 17, scope: !333)
!333 = !{!"0xb\00244\0017\0041", !1, !72}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!334 = !MDLocation(line: 244, column: 17, scope: !72)
!335 = !MDLocation(line: 245, column: 23, scope: !333)
!336 = !MDLocation(line: 245, column: 22, scope: !333)
!337 = !MDLocation(line: 245, column: 17, scope: !333)
!338 = !MDLocation(line: 247, column: 13, scope: !339)
!339 = !{!"0xb\00247\0013\0042", !1, !72}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!340 = !MDLocation(line: 249, column: 44, scope: !341)
!341 = !{!"0xb\00248\0013\0044", !1, !342}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!342 = !{!"0xb\00247\0013\0043", !1, !339}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!343 = !MDLocation(line: 249, column: 41, scope: !341)
!344 = !MDLocation(line: 249, column: 36, scope: !341)
!345 = !MDLocation(line: 249, column: 20, scope: !341)
!346 = !MDLocation(line: 249, column: 17, scope: !341)
!347 = !MDLocation(line: 247, column: 32, scope: !342)
!348 = !MDLocation(line: 231, column: 9, scope: !58)
!349 = distinct !{!349, !216}
!350 = distinct !{!350, !213, !214}
!351 = !MDLocation(line: 263, column: 1, scope: !58)
!352 = !MDLocation(line: 266, column: 22, scope: !77)
!353 = !MDLocation(line: 266, column: 31, scope: !77)
!354 = !MDLocation(line: 269, column: 9, scope: !77)
!355 = !MDLocation(line: 271, column: 5, scope: !89)
!356 = !MDLocation(line: 273, column: 26, scope: !87)
!357 = !MDLocation(line: 273, column: 18, scope: !87)
!358 = !{!"0x101\00dx\0033554543\000", !30, !22, !16, !359} ; [ DW_TAG_arg_variable ] [dx] [line 111]
!359 = !MDLocation(line: 277, column: 17, scope: !87)
!360 = !MDLocation(line: 111, column: 28, scope: !30, inlinedAt: !359)
!361 = !{!"0x101\00incx\0067108975\000", !30, !22, !19, !359} ; [ DW_TAG_arg_variable ] [incx] [line 111]
!362 = !MDLocation(line: 111, column: 48, scope: !30, inlinedAt: !359)
!363 = !{!"0x100\00itemp\00114\000", !30, !22, !19, !359} ; [ DW_TAG_auto_variable ] [itemp] [line 114]
!364 = !MDLocation(line: 114, column: 16, scope: !30, inlinedAt: !359)
!365 = !MDLocation(line: 147, column: 29, scope: !235, inlinedAt: !359)
!366 = !MDLocation(line: 147, column: 24, scope: !235, inlinedAt: !359)
!367 = !{!"0x100\00dmax\00113\000", !30, !22, !17, !359} ; [ DW_TAG_auto_variable ] [dmax] [line 113]
!368 = !MDLocation(line: 113, column: 12, scope: !30, inlinedAt: !359)
!369 = !MDLocation(line: 151, column: 34, scope: !242, inlinedAt: !359)
!370 = !MDLocation(line: 151, column: 31, scope: !242, inlinedAt: !359)
!371 = !MDLocation(line: 151, column: 26, scope: !242, inlinedAt: !359)
!372 = !{!"0x100\00dtemp\00113\000", !30, !22, !17, !359} ; [ DW_TAG_auto_variable ] [dtemp] [line 113]
!373 = !MDLocation(line: 113, column: 18, scope: !30, inlinedAt: !359)
!374 = !MDLocation(line: 153, column: 22, scope: !248, inlinedAt: !359)
!375 = !MDLocation(line: 153, column: 22, scope: !242, inlinedAt: !359)
!376 = !MDLocation(line: 149, column: 17, scope: !240, inlinedAt: !359)
!377 = distinct !{!377, !216}
!378 = !MDLocation(line: 277, column: 13, scope: !87)
!379 = !MDLocation(line: 278, column: 6, scope: !87)
!380 = !{!381, !381, i64 0}
!381 = !{!"int", !178, i64 0}
!382 = !MDLocation(line: 281, column: 13, scope: !97)
!383 = !MDLocation(line: 281, column: 13, scope: !87)
!384 = !MDLocation(line: 284, column: 14, scope: !385)
!385 = !{!"0xb\00284\0014\0053", !1, !96}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!386 = !MDLocation(line: 287, column: 25, scope: !387)
!387 = !{!"0xb\00285\0013\0054", !1, !385}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!388 = !MDLocation(line: 284, column: 14, scope: !96)
!389 = !MDLocation(line: 268, column: 12, scope: !77)
!390 = !MDLocation(line: 287, column: 14, scope: !387)
!391 = !MDLocation(line: 288, column: 14, scope: !387)
!392 = !MDLocation(line: 289, column: 13, scope: !387)
!393 = !MDLocation(line: 292, column: 20, scope: !96)
!394 = !{!"0x101\00da\0033554637\000", !43, !22, !17, !395} ; [ DW_TAG_arg_variable ] [da] [line 205]
!395 = !MDLocation(line: 293, column: 13, scope: !96)
!396 = !MDLocation(line: 205, column: 26, scope: !43, inlinedAt: !395)
!397 = !{!"0x101\00dx\0050331853\000", !43, !22, !16, !395} ; [ DW_TAG_arg_variable ] [dx] [line 205]
!398 = !MDLocation(line: 205, column: 39, scope: !43, inlinedAt: !395)
!399 = !{!"0x101\00incx\0083886285\000", !43, !22, !19, !395} ; [ DW_TAG_arg_variable ] [incx] [line 205]
!400 = !MDLocation(line: 205, column: 59, scope: !43, inlinedAt: !395)
!401 = !MDLocation(line: 223, column: 17, scope: !281, inlinedAt: !395)
!402 = distinct !{!402, !216}
!403 = distinct !{!403, !213, !214}
!404 = !MDLocation(line: 223, column: 20, scope: !281, inlinedAt: !395)
!405 = !MDLocation(line: 222, column: 13, scope: !278, inlinedAt: !395)
!406 = distinct !{!406, !216}
!407 = distinct !{!407, !213, !214}
!408 = !MDLocation(line: 298, column: 31, scope: !93)
!409 = !MDLocation(line: 298, column: 23, scope: !93)
!410 = !MDLocation(line: 299, column: 21, scope: !93)
!411 = !MDLocation(line: 301, column: 18, scope: !93)
!412 = !MDLocation(line: 303, column: 32, scope: !413)
!413 = !{!"0xb\00302\0017\0059", !1, !414}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!414 = !{!"0xb\00301\0018\0058", !1, !93}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!415 = !MDLocation(line: 303, column: 21, scope: !413)
!416 = !MDLocation(line: 304, column: 21, scope: !413)
!417 = !MDLocation(line: 305, column: 17, scope: !413)
!418 = !{!"0x101\00da\0033554661\000", !58, !22, !17, !419} ; [ DW_TAG_arg_variable ] [da] [line 229]
!419 = !MDLocation(line: 307, column: 17, scope: !93)
!420 = !MDLocation(line: 229, column: 26, scope: !58, inlinedAt: !419)
!421 = !{!"0x101\00dx\0050331877\000", !58, !22, !16, !419} ; [ DW_TAG_arg_variable ] [dx] [line 229]
!422 = !MDLocation(line: 229, column: 39, scope: !58, inlinedAt: !419)
!423 = !{!"0x101\00incx\0083886309\000", !58, !22, !19, !419} ; [ DW_TAG_arg_variable ] [incx] [line 229]
!424 = !MDLocation(line: 229, column: 59, scope: !58, inlinedAt: !419)
!425 = !{!"0x101\00dy\00100663525\000", !58, !22, !16, !419} ; [ DW_TAG_arg_variable ] [dy] [line 229]
!426 = !MDLocation(line: 229, column: 74, scope: !58, inlinedAt: !419)
!427 = !{!"0x101\00incy\00134217957\000", !58, !22, !19, !419} ; [ DW_TAG_arg_variable ] [incy] [line 229]
!428 = !MDLocation(line: 229, column: 94, scope: !58, inlinedAt: !419)
!429 = !MDLocation(line: 233, column: 21, scope: !307, inlinedAt: !419)
!430 = !MDLocation(line: 233, column: 9, scope: !58, inlinedAt: !419)
!431 = !MDLocation(line: 260, column: 40, scope: !317, inlinedAt: !419)
!432 = !MDLocation(line: 260, column: 35, scope: !317, inlinedAt: !419)
!433 = !MDLocation(line: 260, column: 17, scope: !317, inlinedAt: !419)
!434 = distinct !{!434, !213, !214}
!435 = !MDLocation(line: 260, column: 43, scope: !317, inlinedAt: !419)
!436 = !MDLocation(line: 259, column: 13, scope: !314, inlinedAt: !419)
!437 = distinct !{!437, !216}
!438 = distinct !{!438, !213, !214}
!439 = !MDLocation(line: 296, column: 13, scope: !95)
!440 = !MDLocation(line: 312, column: 5, scope: !77)
!441 = !MDLocation(line: 313, column: 1, scope: !77)
!442 = !MDLocation(line: 317, column: 22, scope: !98)
!443 = !MDLocation(line: 317, column: 31, scope: !98)
!444 = !MDLocation(line: 317, column: 46, scope: !98)
!445 = !MDLocation(line: 320, column: 9, scope: !98)
!446 = !MDLocation(line: 323, column: 5, scope: !111)
!447 = !MDLocation(line: 325, column: 17, scope: !109)
!448 = !MDLocation(line: 325, column: 13, scope: !109)
!449 = !MDLocation(line: 326, column: 13, scope: !109)
!450 = !MDLocation(line: 319, column: 12, scope: !98)
!451 = !MDLocation(line: 328, column: 13, scope: !452)
!452 = !{!"0xb\00328\0013\0063", !1, !109}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!453 = !MDLocation(line: 328, column: 13, scope: !109)
!454 = !MDLocation(line: 330, column: 20, scope: !455)
!455 = !{!"0xb\00329\009\0064", !1, !452}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!456 = !MDLocation(line: 330, column: 13, scope: !455)
!457 = !MDLocation(line: 331, column: 13, scope: !455)
!458 = !MDLocation(line: 332, column: 9, scope: !455)
!459 = !MDLocation(line: 335, column: 27, scope: !109)
!460 = !{!"0x101\00da\0033554661\000", !58, !22, !17, !461} ; [ DW_TAG_arg_variable ] [da] [line 229]
!461 = !MDLocation(line: 335, column: 9, scope: !109)
!462 = !MDLocation(line: 229, column: 26, scope: !58, inlinedAt: !461)
!463 = !{!"0x101\00dx\0050331877\000", !58, !22, !16, !461} ; [ DW_TAG_arg_variable ] [dx] [line 229]
!464 = !MDLocation(line: 229, column: 39, scope: !58, inlinedAt: !461)
!465 = !{!"0x101\00incx\0083886309\000", !58, !22, !19, !461} ; [ DW_TAG_arg_variable ] [incx] [line 229]
!466 = !MDLocation(line: 229, column: 59, scope: !58, inlinedAt: !461)
!467 = !{!"0x101\00dy\00100663525\000", !58, !22, !16, !461} ; [ DW_TAG_arg_variable ] [dy] [line 229]
!468 = !MDLocation(line: 229, column: 74, scope: !58, inlinedAt: !461)
!469 = !{!"0x101\00incy\00134217957\000", !58, !22, !19, !461} ; [ DW_TAG_arg_variable ] [incy] [line 229]
!470 = !MDLocation(line: 229, column: 94, scope: !58, inlinedAt: !461)
!471 = !MDLocation(line: 233, column: 21, scope: !307, inlinedAt: !461)
!472 = !MDLocation(line: 233, column: 9, scope: !58, inlinedAt: !461)
!473 = !MDLocation(line: 260, column: 43, scope: !317, inlinedAt: !461)
!474 = !MDLocation(line: 260, column: 40, scope: !317, inlinedAt: !461)
!475 = !MDLocation(line: 260, column: 35, scope: !317, inlinedAt: !461)
!476 = !MDLocation(line: 260, column: 17, scope: !317, inlinedAt: !461)
!477 = !MDLocation(line: 259, column: 13, scope: !314, inlinedAt: !461)
!478 = distinct !{!478, !216}
!479 = distinct !{!479, !213, !214}
!480 = !MDLocation(line: 339, column: 5, scope: !481)
!481 = !{!"0xb\00339\005\0065", !1, !98}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!482 = distinct !{!482, !213, !214}
!483 = !MDLocation(line: 341, column: 17, scope: !484)
!484 = !{!"0xb\00340\005\0067", !1, !485}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!485 = !{!"0xb\00339\005\0066", !1, !481}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!486 = !MDLocation(line: 342, column: 17, scope: !484)
!487 = !MDLocation(line: 342, column: 9, scope: !484)
!488 = !{!"0x101\00dx\0050331877\000", !58, !22, !16, !489} ; [ DW_TAG_arg_variable ] [dx] [line 229]
!489 = !MDLocation(line: 344, column: 9, scope: !484)
!490 = !MDLocation(line: 229, column: 39, scope: !58, inlinedAt: !489)
!491 = !{!"0x101\00dx_off\0067109093\000", !58, !22, !19, !489} ; [ DW_TAG_arg_variable ] [dx_off] [line 229]
!492 = !MDLocation(line: 229, column: 47, scope: !58, inlinedAt: !489)
!493 = !{!"0x101\00incx\0083886309\000", !58, !22, !19, !489} ; [ DW_TAG_arg_variable ] [incx] [line 229]
!494 = !MDLocation(line: 229, column: 59, scope: !58, inlinedAt: !489)
!495 = !{!"0x101\00dy\00100663525\000", !58, !22, !16, !489} ; [ DW_TAG_arg_variable ] [dy] [line 229]
!496 = !MDLocation(line: 229, column: 74, scope: !58, inlinedAt: !489)
!497 = !{!"0x101\00dy_off\00117440741\000", !58, !22, !19, !489} ; [ DW_TAG_arg_variable ] [dy_off] [line 229]
!498 = !MDLocation(line: 229, column: 82, scope: !58, inlinedAt: !489)
!499 = !{!"0x101\00incy\00134217957\000", !58, !22, !19, !489} ; [ DW_TAG_arg_variable ] [incy] [line 229]
!500 = !MDLocation(line: 229, column: 94, scope: !58, inlinedAt: !489)
!501 = !MDLocation(line: 233, column: 10, scope: !75, inlinedAt: !489)
!502 = !MDLocation(line: 233, column: 21, scope: !307, inlinedAt: !489)
!503 = !MDLocation(line: 233, column: 9, scope: !58, inlinedAt: !489)
!504 = !MDLocation(line: 260, column: 40, scope: !317, inlinedAt: !489)
!505 = !MDLocation(line: 260, column: 35, scope: !317, inlinedAt: !489)
!506 = !MDLocation(line: 260, column: 17, scope: !317, inlinedAt: !489)
!507 = distinct !{!507, !213, !214}
!508 = !MDLocation(line: 259, column: 13, scope: !314, inlinedAt: !489)
!509 = distinct !{!509, !216}
!510 = distinct !{!510, !213, !214}
!511 = !MDLocation(line: 346, column: 1, scope: !98)
!512 = !MDLocation(line: 348, column: 14, scope: !113)
!513 = !MDLocation(line: 348, column: 28, scope: !113)
!514 = !MDLocation(line: 353, column: 10, scope: !113)
!515 = !MDLocation(line: 355, column: 9, scope: !131)
!516 = !MDLocation(line: 355, column: 9, scope: !113)
!517 = !MDLocation(line: 359, column: 18, scope: !518)
!518 = !{!"0xb\003", !1, !134}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!519 = !{!178, !178, i64 0}
!520 = !MDLocation(line: 359, column: 18, scope: !521)
!521 = !{!"0xb\005", !1, !522}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!522 = !{!"0xb\00359\0018\0076", !1, !134}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!523 = !MDLocation(line: 359, column: 18, scope: !524)
!524 = !{!"0xb\007", !1, !525}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!525 = !{!"0xb\00359\0018\0077", !1, !522}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!526 = !MDLocation(line: 359, column: 18, scope: !527)
!527 = !{!"0xb\0011", !1, !528}                   ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!528 = !{!"0xb\00359\0018\0079", !1, !529}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!529 = !{!"0xb\00359\0018\0078", !1, !525}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!530 = !MDLocation(line: 359, column: 18, scope: !531)
!531 = !{!"0xb\0015", !1, !532}                   ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!532 = !{!"0xb\00359\0018\0080", !1, !528}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!533 = !MDLocation(line: 357, column: 9, scope: !129)
!534 = !MDLocation(line: 357, column: 31, scope: !128)
!535 = !MDLocation(line: 357, column: 21, scope: !128)
!536 = !MDLocation(line: 359, column: 18, scope: !125)
!537 = !MDLocation(line: 359, column: 18, scope: !134)
!538 = !MDLocation(line: 359, column: 18, scope: !539)
!539 = !{!"0xb\009", !1, !529}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!540 = !MDLocation(line: 359, column: 18, scope: !525)
!541 = !MDLocation(line: 359, column: 18, scope: !542)
!542 = !{!"0xb\0013", !1, !532}                   ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!543 = !MDLocation(line: 359, column: 18, scope: !528)
!544 = !MDLocation(line: 359, column: 17, scope: !127)
!545 = !MDLocation(line: 367, column: 30, scope: !113)
!546 = !MDLocation(line: 367, column: 19, scope: !113)
!547 = !MDLocation(line: 367, column: 15, scope: !113)
!548 = !MDLocation(line: 350, column: 9, scope: !113)
!549 = !MDLocation(line: 369, column: 5, scope: !550)
!550 = !{!"0xb\00369\005\0082", !1, !113}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!551 = !MDLocation(line: 370, column: 26, scope: !552)
!552 = !{!"0xb\00369\005\0083", !1, !550}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!553 = !MDLocation(line: 370, column: 9, scope: !552)
!554 = !MDLocation(line: 372, column: 28, scope: !113)
!555 = !MDLocation(line: 372, column: 14, scope: !113)
!556 = !MDLocation(line: 373, column: 14, scope: !113)
!557 = !MDLocation(line: 374, column: 25, scope: !113)
!558 = !MDLocation(line: 374, column: 11, scope: !113)
!559 = !MDLocation(line: 377, column: 12, scope: !113)
!560 = !{!"0x101\00a\0016777309\000", !21, !22, !15, !561} ; [ DW_TAG_arg_variable ] [a] [line 93]
!561 = !MDLocation(line: 380, column: 5, scope: !113)
!562 = !MDLocation(line: 93, column: 24, scope: !21, inlinedAt: !561)
!563 = !{!"0x101\00b\0033554525\000", !21, !22, !16, !561} ; [ DW_TAG_arg_variable ] [b] [line 93]
!564 = !MDLocation(line: 93, column: 36, scope: !21, inlinedAt: !561)
!565 = !{!"0x100\00i\0096\000", !21, !22, !19, !561} ; [ DW_TAG_auto_variable ] [i] [line 96]
!566 = !MDLocation(line: 96, column: 9, scope: !21, inlinedAt: !561)
!567 = !MDLocation(line: 65, column: 5, scope: !142, inlinedAt: !568)
!568 = !MDLocation(line: 100, column: 23, scope: !172, inlinedAt: !561)
!569 = !MDLocation(line: 98, column: 5, scope: !175, inlinedAt: !561)
!570 = !MDLocation(line: 99, column: 9, scope: !173, inlinedAt: !561)
!571 = !MDLocation(line: 372, column: 18, scope: !113)
!572 = !MDLocation(line: 374, column: 18, scope: !113)
!573 = !MDLocation(line: 103, column: 9, scope: !183, inlinedAt: !561)
!574 = !MDLocation(line: 105, column: 5, scope: !186, inlinedAt: !561)
!575 = !MDLocation(line: 57, column: 5, scope: !142, inlinedAt: !568)
!576 = !MDLocation(line: 58, column: 9, scope: !142, inlinedAt: !568)
!577 = !{!"0x100\00k\0054\000", !142, !22, !147, !568} ; [ DW_TAG_auto_variable ] [k] [line 54]
!578 = !MDLocation(line: 54, column: 10, scope: !142, inlinedAt: !568)
!579 = !MDLocation(line: 59, column: 18, scope: !142, inlinedAt: !568)
!580 = !MDLocation(line: 59, column: 12, scope: !142, inlinedAt: !568)
!581 = !MDLocation(line: 61, column: 9, scope: !194, inlinedAt: !568)
!582 = !MDLocation(line: 62, column: 9, scope: !194, inlinedAt: !568)
!583 = !MDLocation(line: 61, column: 9, scope: !142, inlinedAt: !568)
!584 = !MDLocation(line: 64, column: 19, scope: !142, inlinedAt: !568)
!585 = !MDLocation(line: 64, column: 14, scope: !142, inlinedAt: !568)
!586 = !{!"0x100\00result\0055\000", !142, !22, !17, !568} ; [ DW_TAG_auto_variable ] [result] [line 55]
!587 = !MDLocation(line: 55, column: 12, scope: !142, inlinedAt: !568)
!588 = !MDLocation(line: 100, column: 13, scope: !172, inlinedAt: !561)
!589 = !MDLocation(line: 107, column: 21, scope: !207, inlinedAt: !561)
!590 = !MDLocation(line: 107, column: 13, scope: !207, inlinedAt: !561)
!591 = distinct !{!591, !213, !214}
!592 = !MDLocation(line: 387, column: 5, scope: !113)
!593 = !MDLocation(line: 388, column: 5, scope: !113)
!594 = !MDLocation(line: 392, column: 12, scope: !113)
!595 = !MDLocation(line: 395, column: 5, scope: !113)
!596 = !MDLocation(line: 397, column: 5, scope: !113)
!597 = !MDLocation(line: 399, column: 5, scope: !598)
!598 = !{!"0xb\00399\005\0084", !1, !113}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!599 = !MDLocation(line: 400, column: 14, scope: !600)
!600 = !{!"0xb\00399\005\0085", !1, !598}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!601 = !MDLocation(line: 400, column: 9, scope: !600)
!602 = !MDLocation(line: 402, column: 5, scope: !113)
!603 = !MDLocation(line: 406, column: 17, scope: !604)
!604 = !{!"0xb\00405\009\0086", !1, !113}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lpbench.c]
!605 = !MDLocation(line: 405, column: 9, scope: !113)
!606 = !MDLocation(line: 406, column: 9, scope: !604)
!607 = !MDLocation(line: 408, column: 9, scope: !604)
!608 = !MDLocation(line: 410, column: 12, scope: !113)
!609 = !MDLocation(line: 410, column: 5, scope: !113)
!610 = !MDLocation(line: 413, column: 5, scope: !113)
