; ModuleID = 'FFT.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [43 x i8] c"FFT: Data length is not a power of 2!: %d \00", align 1

; Function Attrs: nounwind uwtable
define double @FFT_num_flops(i32 %N) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %N, i64 0, metadata !12, metadata !101), !dbg !102
  %conv = sitofp i32 %N to double, !dbg !103
  tail call void @llvm.dbg.value(metadata double %conv, i64 0, metadata !13, metadata !101), !dbg !104
  tail call void @llvm.dbg.value(metadata i32 %N, i64 0, metadata !105, metadata !101) #4, !dbg !107
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !108, metadata !101) #4, !dbg !109
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !110, metadata !101) #4, !dbg !111
  %cmp7.i = icmp sgt i32 %N, 1, !dbg !112
  br i1 %cmp7.i, label %for.inc.i.preheader, label %for.end.i, !dbg !115

for.inc.i.preheader:                              ; preds = %entry
  br label %for.inc.i, !dbg !116

for.inc.i:                                        ; preds = %for.inc.i.preheader, %for.inc.i
  %log.09.i = phi i32 [ %inc.i, %for.inc.i ], [ 0, %for.inc.i.preheader ], !dbg !106
  %k.08.i = phi i32 [ %mul.i, %for.inc.i ], [ 1, %for.inc.i.preheader ], !dbg !106
  %mul.i = shl nsw i32 %k.08.i, 1, !dbg !116
  tail call void @llvm.dbg.value(metadata i32 %mul.i, i64 0, metadata !108, metadata !101) #4, !dbg !109
  %inc.i = add nuw nsw i32 %log.09.i, 1, !dbg !118
  tail call void @llvm.dbg.value(metadata i32 %inc.i, i64 0, metadata !110, metadata !101) #4, !dbg !111
  %cmp.i = icmp slt i32 %mul.i, %N, !dbg !112
  br i1 %cmp.i, label %for.inc.i, label %for.end.i.loopexit, !dbg !115

for.end.i.loopexit:                               ; preds = %for.inc.i
  %inc.i.lcssa = phi i32 [ %inc.i, %for.inc.i ]
  br label %for.end.i

for.end.i:                                        ; preds = %for.end.i.loopexit, %entry
  %log.0.lcssa.i = phi i32 [ 0, %entry ], [ %inc.i.lcssa, %for.end.i.loopexit ], !dbg !106
  %shl.i = shl i32 1, %log.0.lcssa.i, !dbg !119
  %cmp1.i = icmp eq i32 %shl.i, %N, !dbg !121
  br i1 %cmp1.i, label %int_log2.exit, label %if.then.i, !dbg !122

if.then.i:                                        ; preds = %for.end.i
  %call.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([43 x i8]* @.str, i64 0, i64 0), i32 %N) #4, !dbg !123
  tail call void @exit(i32 1) #5, !dbg !125
  unreachable, !dbg !125

int_log2.exit:                                    ; preds = %for.end.i
  %conv1 = sitofp i32 %log.0.lcssa.i to double, !dbg !126
  tail call void @llvm.dbg.value(metadata double %conv1, i64 0, metadata !14, metadata !101), !dbg !127
  %mul = fmul double %conv, 5.000000e+00, !dbg !128
  %0 = insertelement <2 x double> undef, double %conv, i32 0, !dbg !129
  %1 = insertelement <2 x double> %0, double %mul, i32 1, !dbg !129
  %2 = fadd <2 x double> %1, <double 1.000000e+00, double -2.000000e+00>, !dbg !129
  %3 = insertelement <2 x double> <double 2.000000e+00, double undef>, double %conv1, i32 1, !dbg !130
  %4 = fmul <2 x double> %2, %3, !dbg !130
  %5 = extractelement <2 x double> %4, i32 0, !dbg !131
  %6 = extractelement <2 x double> %4, i32 1, !dbg !131
  %add4 = fadd double %5, %6, !dbg !131
  ret double %add4, !dbg !132
}

; Function Attrs: nounwind uwtable
define void @FFT_bitreverse(i32 %N, double* nocapture %data) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %N, i64 0, metadata !20, metadata !101), !dbg !133
  tail call void @llvm.dbg.value(metadata double* %data, i64 0, metadata !21, metadata !101), !dbg !134
  %div = sdiv i32 %N, 2, !dbg !135
  tail call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !22, metadata !101), !dbg !136
  tail call void @llvm.dbg.value(metadata i32 %sub, i64 0, metadata !23, metadata !101), !dbg !137
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !24, metadata !101), !dbg !138
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !25, metadata !101), !dbg !139
  %cmp52 = icmp sgt i32 %N, 3, !dbg !140
  br i1 %cmp52, label %for.body.lr.ph, label %for.end, !dbg !141

for.body.lr.ph:                                   ; preds = %entry
  %sub = add nsw i32 %div, -1, !dbg !142
  %shr = ashr i32 %div, 1, !dbg !143
  %0 = sext i32 %sub to i64, !dbg !141
  br label %for.body, !dbg !141

for.body:                                         ; preds = %for.body.lr.ph, %while.end
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %while.end ]
  %j.053 = phi i32 [ 0, %for.body.lr.ph ], [ %add23, %while.end ]
  tail call void @llvm.dbg.value(metadata i32 %shl, i64 0, metadata !26, metadata !101), !dbg !144
  tail call void @llvm.dbg.value(metadata i32 %shl1, i64 0, metadata !30, metadata !101), !dbg !145
  tail call void @llvm.dbg.value(metadata i32 %shr, i64 0, metadata !31, metadata !101), !dbg !146
  %1 = sext i32 %j.053 to i64, !dbg !147
  %cmp2 = icmp slt i64 %indvars.iv, %1, !dbg !147
  br i1 %cmp2, label %if.then, label %while.cond.preheader, !dbg !148

if.then:                                          ; preds = %for.body
  %shl1 = shl i32 %j.053, 1, !dbg !149
  %2 = trunc i64 %indvars.iv to i32, !dbg !150
  %shl = shl i32 %2, 1, !dbg !150
  %idxprom = sext i32 %shl to i64, !dbg !151
  %arrayidx = getelementptr inbounds double* %data, i64 %idxprom, !dbg !151
  tail call void @llvm.dbg.value(metadata double undef, i64 0, metadata !32, metadata !101), !dbg !152
  %3 = bitcast double* %arrayidx to <2 x double>*, !dbg !151
  %4 = load <2 x double>* %3, align 8, !dbg !151, !tbaa !153
  tail call void @llvm.dbg.value(metadata double undef, i64 0, metadata !35, metadata !101), !dbg !157
  %idxprom5 = sext i32 %shl1 to i64, !dbg !158
  %arrayidx6 = getelementptr inbounds double* %data, i64 %idxprom5, !dbg !158
  %5 = bitcast double* %arrayidx6 to <2 x double>*, !dbg !158
  %6 = load <2 x double>* %5, align 8, !dbg !158, !tbaa !153
  %7 = bitcast double* %arrayidx to <2 x double>*, !dbg !159
  store <2 x double> %6, <2 x double>* %7, align 8, !dbg !159, !tbaa !153
  %8 = bitcast double* %arrayidx6 to <2 x double>*, !dbg !160
  store <2 x double> %4, <2 x double>* %8, align 8, !dbg !160, !tbaa !153
  br label %while.cond.preheader, !dbg !161

while.cond.preheader:                             ; preds = %if.then, %for.body
  %cmp2048 = icmp slt i32 %j.053, %shr, !dbg !162
  br i1 %cmp2048, label %while.end, label %while.body.preheader, !dbg !163

while.body.preheader:                             ; preds = %while.cond.preheader
  br label %while.body, !dbg !164

while.body:                                       ; preds = %while.body.preheader, %while.body
  %j.150 = phi i32 [ %sub21, %while.body ], [ %j.053, %while.body.preheader ]
  %k.049 = phi i32 [ %shr22, %while.body ], [ %shr, %while.body.preheader ]
  %sub21 = sub nsw i32 %j.150, %k.049, !dbg !164
  tail call void @llvm.dbg.value(metadata i32 %sub21, i64 0, metadata !25, metadata !101), !dbg !139
  %shr22 = ashr i32 %k.049, 1, !dbg !166
  tail call void @llvm.dbg.value(metadata i32 %shr22, i64 0, metadata !31, metadata !101), !dbg !146
  %cmp20 = icmp slt i32 %sub21, %shr22, !dbg !162
  br i1 %cmp20, label %while.end.loopexit, label %while.body, !dbg !163

while.end.loopexit:                               ; preds = %while.body
  %shr22.lcssa = phi i32 [ %shr22, %while.body ]
  %sub21.lcssa = phi i32 [ %sub21, %while.body ]
  br label %while.end

while.end:                                        ; preds = %while.end.loopexit, %while.cond.preheader
  %j.1.lcssa = phi i32 [ %j.053, %while.cond.preheader ], [ %sub21.lcssa, %while.end.loopexit ]
  %k.0.lcssa = phi i32 [ %shr, %while.cond.preheader ], [ %shr22.lcssa, %while.end.loopexit ]
  %add23 = add nsw i32 %j.1.lcssa, %k.0.lcssa, !dbg !167
  tail call void @llvm.dbg.value(metadata i32 %add23, i64 0, metadata !25, metadata !101), !dbg !139
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !141
  %cmp = icmp slt i64 %indvars.iv.next, %0, !dbg !140
  br i1 %cmp, label %for.body, label %for.end.loopexit, !dbg !141

for.end.loopexit:                                 ; preds = %while.end
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  ret void, !dbg !168
}

; Function Attrs: nounwind uwtable
define void @FFT_transform(i32 %N, double* nocapture %data) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %N, i64 0, metadata !38, metadata !101), !dbg !169
  tail call void @llvm.dbg.value(metadata double* %data, i64 0, metadata !39, metadata !101), !dbg !170
  tail call fastcc void @FFT_transform_internal(i32 %N, double* %data, i32 -1), !dbg !171
  ret void, !dbg !172
}

; Function Attrs: nounwind uwtable
define internal fastcc void @FFT_transform_internal(i32 %N, double* nocapture %data, i32 %direction) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %N, i64 0, metadata !51, metadata !101), !dbg !173
  tail call void @llvm.dbg.value(metadata double* %data, i64 0, metadata !52, metadata !101), !dbg !174
  tail call void @llvm.dbg.value(metadata i32 %direction, i64 0, metadata !53, metadata !101), !dbg !175
  %div = sdiv i32 %N, 2, !dbg !176
  tail call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !54, metadata !101), !dbg !177
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !55, metadata !101), !dbg !178
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !57, metadata !101), !dbg !179
  %0 = and i32 %N, -2, !dbg !180
  %1 = icmp eq i32 %0, 2, !dbg !180
  br i1 %1, label %for.end107, label %if.end, !dbg !182

if.end:                                           ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !183, metadata !101) #4, !dbg !185
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !186, metadata !101) #4, !dbg !187
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !188, metadata !101) #4, !dbg !189
  %cmp7.i = icmp sgt i32 %N, 3, !dbg !190
  br i1 %cmp7.i, label %for.inc.i.preheader, label %for.end.i, !dbg !191

for.inc.i.preheader:                              ; preds = %if.end
  br label %for.inc.i, !dbg !192

for.inc.i:                                        ; preds = %for.inc.i.preheader, %for.inc.i
  %log.09.i = phi i32 [ %inc.i, %for.inc.i ], [ 0, %for.inc.i.preheader ], !dbg !184
  %k.08.i = phi i32 [ %mul.i, %for.inc.i ], [ 1, %for.inc.i.preheader ], !dbg !184
  %mul.i = shl nsw i32 %k.08.i, 1, !dbg !192
  tail call void @llvm.dbg.value(metadata i32 %mul.i, i64 0, metadata !186, metadata !101) #4, !dbg !187
  %inc.i = add nuw nsw i32 %log.09.i, 1, !dbg !193
  tail call void @llvm.dbg.value(metadata i32 %inc.i, i64 0, metadata !188, metadata !101) #4, !dbg !189
  %cmp.i = icmp slt i32 %mul.i, %div, !dbg !190
  br i1 %cmp.i, label %for.inc.i, label %for.end.i.loopexit, !dbg !191

for.end.i.loopexit:                               ; preds = %for.inc.i
  %inc.i.lcssa = phi i32 [ %inc.i, %for.inc.i ]
  br label %for.end.i

for.end.i:                                        ; preds = %for.end.i.loopexit, %if.end
  %log.0.lcssa.i = phi i32 [ 0, %if.end ], [ %inc.i.lcssa, %for.end.i.loopexit ], !dbg !184
  %shl.i = shl i32 1, %log.0.lcssa.i, !dbg !194
  %cmp1.i = icmp eq i32 %shl.i, %div, !dbg !195
  br i1 %cmp1.i, label %int_log2.exit, label %if.then.i, !dbg !196

if.then.i:                                        ; preds = %for.end.i
  %call.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([43 x i8]* @.str, i64 0, i64 0), i32 %div) #4, !dbg !197
  tail call void @exit(i32 1) #5, !dbg !198
  unreachable, !dbg !198

int_log2.exit:                                    ; preds = %for.end.i
  tail call void @llvm.dbg.value(metadata i32 %log.0.lcssa.i, i64 0, metadata !56, metadata !101), !dbg !199
  %cmp1 = icmp eq i32 %N, 0, !dbg !200
  br i1 %cmp1, label %for.end107, label %if.end3, !dbg !202

if.end3:                                          ; preds = %int_log2.exit
  tail call void @llvm.dbg.value(metadata i32 %N, i64 0, metadata !203, metadata !101), !dbg !205
  tail call void @llvm.dbg.value(metadata double* %data, i64 0, metadata !206, metadata !101), !dbg !207
  tail call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !208, metadata !101), !dbg !209
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !210, metadata !101), !dbg !211
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !212, metadata !101), !dbg !213
  br i1 %cmp7.i, label %for.body.lr.ph.i, label %for.cond.preheader, !dbg !214

for.body.lr.ph.i:                                 ; preds = %if.end3
  %sub.i = add nsw i32 %div, -1, !dbg !215
  %shr.i = ashr i32 %div, 1, !dbg !216
  %2 = sext i32 %sub.i to i64, !dbg !214
  br label %for.body.i, !dbg !214

for.body.i:                                       ; preds = %while.end.i, %for.body.lr.ph.i
  %indvars.iv.i = phi i64 [ 0, %for.body.lr.ph.i ], [ %indvars.iv.next.i, %while.end.i ], !dbg !204
  %j.053.i = phi i32 [ 0, %for.body.lr.ph.i ], [ %add23.i, %while.end.i ], !dbg !204
  tail call void @llvm.dbg.value(metadata i32 %shl.i180, i64 0, metadata !217, metadata !101), !dbg !218
  tail call void @llvm.dbg.value(metadata i32 %shl1.i, i64 0, metadata !219, metadata !101), !dbg !220
  tail call void @llvm.dbg.value(metadata i32 %shr.i, i64 0, metadata !221, metadata !101), !dbg !222
  %3 = sext i32 %j.053.i to i64, !dbg !223
  %cmp2.i = icmp slt i64 %indvars.iv.i, %3, !dbg !223
  br i1 %cmp2.i, label %if.then.i181, label %while.cond.preheader.i, !dbg !224

if.then.i181:                                     ; preds = %for.body.i
  %shl1.i = shl i32 %j.053.i, 1, !dbg !225
  %4 = trunc i64 %indvars.iv.i to i32, !dbg !226
  %shl.i180 = shl i32 %4, 1, !dbg !226
  %idxprom.i = sext i32 %shl.i180 to i64, !dbg !227
  %arrayidx.i = getelementptr inbounds double* %data, i64 %idxprom.i, !dbg !227
  tail call void @llvm.dbg.value(metadata double undef, i64 0, metadata !228, metadata !101), !dbg !229
  %5 = bitcast double* %arrayidx.i to <2 x double>*, !dbg !227
  %6 = load <2 x double>* %5, align 8, !dbg !227, !tbaa !153
  tail call void @llvm.dbg.value(metadata double undef, i64 0, metadata !230, metadata !101), !dbg !231
  %idxprom5.i = sext i32 %shl1.i to i64, !dbg !232
  %arrayidx6.i = getelementptr inbounds double* %data, i64 %idxprom5.i, !dbg !232
  %7 = bitcast double* %arrayidx6.i to <2 x double>*, !dbg !232
  %8 = load <2 x double>* %7, align 8, !dbg !232, !tbaa !153
  %9 = bitcast double* %arrayidx.i to <2 x double>*, !dbg !233
  store <2 x double> %8, <2 x double>* %9, align 8, !dbg !233, !tbaa !153
  %10 = bitcast double* %arrayidx6.i to <2 x double>*, !dbg !234
  store <2 x double> %6, <2 x double>* %10, align 8, !dbg !234, !tbaa !153
  br label %while.cond.preheader.i, !dbg !235

while.cond.preheader.i:                           ; preds = %if.then.i181, %for.body.i
  %cmp2048.i = icmp slt i32 %j.053.i, %shr.i, !dbg !236
  br i1 %cmp2048.i, label %while.end.i, label %while.body.i.preheader, !dbg !237

while.body.i.preheader:                           ; preds = %while.cond.preheader.i
  br label %while.body.i, !dbg !238

while.body.i:                                     ; preds = %while.body.i.preheader, %while.body.i
  %j.150.i = phi i32 [ %sub21.i, %while.body.i ], [ %j.053.i, %while.body.i.preheader ], !dbg !204
  %k.049.i = phi i32 [ %shr22.i, %while.body.i ], [ %shr.i, %while.body.i.preheader ], !dbg !204
  %sub21.i = sub nsw i32 %j.150.i, %k.049.i, !dbg !238
  tail call void @llvm.dbg.value(metadata i32 %sub21.i, i64 0, metadata !212, metadata !101), !dbg !213
  %shr22.i = ashr i32 %k.049.i, 1, !dbg !239
  tail call void @llvm.dbg.value(metadata i32 %shr22.i, i64 0, metadata !221, metadata !101), !dbg !222
  %cmp20.i = icmp slt i32 %sub21.i, %shr22.i, !dbg !236
  br i1 %cmp20.i, label %while.end.i.loopexit, label %while.body.i, !dbg !237

while.end.i.loopexit:                             ; preds = %while.body.i
  %shr22.i.lcssa = phi i32 [ %shr22.i, %while.body.i ]
  %sub21.i.lcssa = phi i32 [ %sub21.i, %while.body.i ]
  br label %while.end.i

while.end.i:                                      ; preds = %while.end.i.loopexit, %while.cond.preheader.i
  %j.1.lcssa.i = phi i32 [ %j.053.i, %while.cond.preheader.i ], [ %sub21.i.lcssa, %while.end.i.loopexit ], !dbg !204
  %k.0.lcssa.i = phi i32 [ %shr.i, %while.cond.preheader.i ], [ %shr22.i.lcssa, %while.end.i.loopexit ], !dbg !204
  %add23.i = add nsw i32 %k.0.lcssa.i, %j.1.lcssa.i, !dbg !240
  tail call void @llvm.dbg.value(metadata i32 %add23.i, i64 0, metadata !212, metadata !101), !dbg !213
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !214
  %cmp.i182 = icmp slt i64 %indvars.iv.next.i, %2, !dbg !241
  br i1 %cmp.i182, label %for.body.i, label %for.cond.preheader.loopexit, !dbg !214

for.cond.preheader.loopexit:                      ; preds = %while.end.i
  br label %for.cond.preheader

for.cond.preheader:                               ; preds = %for.cond.preheader.loopexit, %if.end3
  %cmp4193 = icmp sgt i32 %log.0.lcssa.i, 0, !dbg !242
  br i1 %cmp4193, label %for.body.lr.ph, label %for.end107, !dbg !243

for.body.lr.ph:                                   ; preds = %for.cond.preheader
  %conv = sitofp i32 %direction to double, !dbg !244
  %mul = fmul double %conv, 2.000000e+00, !dbg !245
  %mul5 = fmul double %mul, 0x400921FB54442D18, !dbg !245
  %cmp15184 = icmp sgt i32 %N, 1, !dbg !246
  %11 = sext i32 %div to i64, !dbg !243
  %12 = add i32 %log.0.lcssa.i, -1, !dbg !243
  br label %for.body, !dbg !243

for.body:                                         ; preds = %for.inc104, %for.body.lr.ph
  %bit.0197 = phi i32 [ 0, %for.body.lr.ph ], [ %inc105, %for.inc104 ]
  %dual.0194 = phi i32 [ 1, %for.body.lr.ph ], [ %mul106, %for.inc104 ]
  tail call void @llvm.dbg.value(metadata double 1.000000e+00, i64 0, metadata !58, metadata !101), !dbg !247
  tail call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !62, metadata !101), !dbg !248
  %conv6 = sitofp i32 %dual.0194 to double, !dbg !249
  %mul7 = fmul double %conv6, 2.000000e+00, !dbg !250
  %div8 = fdiv double %mul5, %mul7, !dbg !245
  tail call void @llvm.dbg.value(metadata double %div8, i64 0, metadata !65, metadata !101), !dbg !251
  %call9 = tail call double @sin(double %div8) #4, !dbg !252
  tail call void @llvm.dbg.value(metadata double %call9, i64 0, metadata !66, metadata !101), !dbg !253
  %div10 = fmul double %div8, 5.000000e-01, !dbg !254
  %call11 = tail call double @sin(double %div10) #4, !dbg !255
  tail call void @llvm.dbg.value(metadata double %call11, i64 0, metadata !67, metadata !101), !dbg !256
  %mul12 = fmul double %call11, 2.000000e+00, !dbg !257
  %mul13 = fmul double %call11, %mul12, !dbg !257
  tail call void @llvm.dbg.value(metadata double %mul13, i64 0, metadata !68, metadata !101), !dbg !258
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !63, metadata !101), !dbg !259
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !64, metadata !101), !dbg !260
  br i1 %cmp15184, label %for.body17.lr.ph, label %for.cond43.preheader, !dbg !261

for.body17.lr.ph:                                 ; preds = %for.body
  %13 = shl i32 %dual.0194, 1, !dbg !261
  %14 = sext i32 %13 to i64
  %15 = zext i32 %dual.0194 to i64, !dbg !261
  br label %for.body17, !dbg !261

for.cond43.preheader.loopexit:                    ; preds = %for.body17
  br label %for.cond43.preheader

for.cond43.preheader:                             ; preds = %for.cond43.preheader.loopexit, %for.body
  %cmp44188.not = icmp slt i32 %dual.0194, 2, !dbg !262
  %cmp15184.not = xor i1 %cmp15184, true, !dbg !262
  %brmerge = or i1 %cmp44188.not, %cmp15184.not, !dbg !262
  br i1 %brmerge, label %for.inc104, label %for.body46.lr.ph.split.us, !dbg !262

for.body46.lr.ph.split.us:                        ; preds = %for.cond43.preheader
  %16 = shl i32 %dual.0194, 1, !dbg !262
  %17 = sext i32 %16 to i64
  %18 = zext i32 %dual.0194 to i64, !dbg !262
  %19 = add i32 %dual.0194, -1, !dbg !262
  %20 = insertelement <2 x double> undef, double %call9, i32 0, !dbg !263
  %21 = insertelement <2 x double> %20, double %call9, i32 1, !dbg !263
  %22 = insertelement <2 x double> undef, double %mul13, i32 0, !dbg !264
  %23 = insertelement <2 x double> %22, double %mul13, i32 1, !dbg !264
  br label %for.body58.lr.ph.us, !dbg !262

for.inc102.us:                                    ; preds = %for.body58.us
  %indvars.iv.next204 = add nuw nsw i64 %indvars.iv203, 1, !dbg !262
  %lftr.wideiv = trunc i64 %indvars.iv203 to i32, !dbg !262
  %exitcond = icmp eq i32 %lftr.wideiv, %19, !dbg !262
  br i1 %exitcond, label %for.inc104.loopexit, label %for.body58.lr.ph.us, !dbg !262

for.body58.us:                                    ; preds = %for.body58.lr.ph.us, %for.body58.us
  %indvars.iv199 = phi i64 [ 0, %for.body58.lr.ph.us ], [ %indvars.iv.next200, %for.body58.us ]
  %24 = add nsw i64 %indvars.iv199, %indvars.iv203, !dbg !265
  %25 = trunc i64 %24 to i32, !dbg !266
  %mul61.us = shl nsw i32 %25, 1, !dbg !266
  tail call void @llvm.dbg.value(metadata i32 %mul61.us, i64 0, metadata !82, metadata !101), !dbg !267
  %26 = add nsw i64 %24, %18, !dbg !268
  %27 = trunc i64 %26 to i32, !dbg !269
  %mul65.us = shl nsw i32 %27, 1, !dbg !269
  tail call void @llvm.dbg.value(metadata i32 %mul65.us, i64 0, metadata !86, metadata !101), !dbg !270
  %idxprom66.us = sext i32 %mul65.us to i64, !dbg !271
  %arrayidx67.us = getelementptr inbounds double* %data, i64 %idxprom66.us, !dbg !271
  %28 = load double* %arrayidx67.us, align 8, !dbg !271, !tbaa !153
  tail call void @llvm.dbg.value(metadata double %28, i64 0, metadata !87, metadata !101), !dbg !272
  %add68176.us = or i32 %mul65.us, 1, !dbg !273
  %idxprom69.us = sext i32 %add68176.us to i64, !dbg !274
  %arrayidx70.us = getelementptr inbounds double* %data, i64 %idxprom69.us, !dbg !274
  %29 = load double* %arrayidx70.us, align 8, !dbg !274, !tbaa !153
  tail call void @llvm.dbg.value(metadata double %29, i64 0, metadata !88, metadata !101), !dbg !275
  %30 = extractelement <2 x double> %43, i32 0, !dbg !276
  %mul72.us = fmul double %30, %28, !dbg !276
  %31 = extractelement <2 x double> %43, i32 1, !dbg !277
  %mul73.us = fmul double %31, %29, !dbg !277
  %sub74.us = fsub double %mul72.us, %mul73.us, !dbg !276
  tail call void @llvm.dbg.value(metadata double %sub74.us, i64 0, metadata !89, metadata !101), !dbg !278
  %mul76.us = fmul double %30, %29, !dbg !279
  %mul77.us = fmul double %31, %28, !dbg !280
  %add78.us = fadd double %mul77.us, %mul76.us, !dbg !279
  tail call void @llvm.dbg.value(metadata double %add78.us, i64 0, metadata !90, metadata !101), !dbg !281
  %idxprom79.us = sext i32 %mul61.us to i64, !dbg !282
  %arrayidx80.us = getelementptr inbounds double* %data, i64 %idxprom79.us, !dbg !282
  %32 = load double* %arrayidx80.us, align 8, !dbg !282, !tbaa !153
  %sub81.us = fsub double %32, %sub74.us, !dbg !282
  store double %sub81.us, double* %arrayidx67.us, align 8, !dbg !283, !tbaa !153
  %add84177.us = or i32 %mul61.us, 1, !dbg !284
  %idxprom85.us = sext i32 %add84177.us to i64, !dbg !285
  %arrayidx86.us = getelementptr inbounds double* %data, i64 %idxprom85.us, !dbg !285
  %33 = load double* %arrayidx86.us, align 8, !dbg !285, !tbaa !153
  %sub87.us = fsub double %33, %add78.us, !dbg !285
  store double %sub87.us, double* %arrayidx70.us, align 8, !dbg !286, !tbaa !153
  %34 = load double* %arrayidx80.us, align 8, !dbg !287, !tbaa !153
  %add93.us = fadd double %sub74.us, %34, !dbg !287
  store double %add93.us, double* %arrayidx80.us, align 8, !dbg !287, !tbaa !153
  %35 = load double* %arrayidx86.us, align 8, !dbg !288, !tbaa !153
  %add97.us = fadd double %add78.us, %35, !dbg !288
  store double %add97.us, double* %arrayidx86.us, align 8, !dbg !288, !tbaa !153
  %indvars.iv.next200 = add nsw i64 %indvars.iv199, %17, !dbg !289
  %cmp56.us = icmp slt i64 %indvars.iv.next200, %11, !dbg !290
  br i1 %cmp56.us, label %for.body58.us, label %for.inc102.us, !dbg !289

for.body58.lr.ph.us:                              ; preds = %for.body46.lr.ph.split.us, %for.inc102.us
  %indvars.iv203 = phi i64 [ %indvars.iv.next204, %for.inc102.us ], [ 1, %for.body46.lr.ph.split.us ]
  %36 = phi <2 x double> [ %43, %for.inc102.us ], [ <double 1.000000e+00, double 0.000000e+00>, %for.body46.lr.ph.split.us ]
  tail call void @llvm.dbg.value(metadata double undef, i64 0, metadata !76, metadata !101), !dbg !291
  %37 = shufflevector <2 x double> %36, <2 x double> undef, <2 x i32> <i32 1, i32 0>, !dbg !263
  %38 = fmul <2 x double> %37, %21, !dbg !263
  %39 = fsub <2 x double> %36, %38, !dbg !292
  %40 = fadd <2 x double> %36, %38, !dbg !292
  %41 = shufflevector <2 x double> %39, <2 x double> %40, <2 x i32> <i32 0, i32 3>, !dbg !292
  %42 = fmul <2 x double> %23, %36, !dbg !264
  %43 = fsub <2 x double> %41, %42, !dbg !292
  tail call void @llvm.dbg.value(metadata double undef, i64 0, metadata !81, metadata !101), !dbg !293
  tail call void @llvm.dbg.value(metadata double undef, i64 0, metadata !58, metadata !101), !dbg !247
  tail call void @llvm.dbg.value(metadata double undef, i64 0, metadata !62, metadata !101), !dbg !248
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !64, metadata !101), !dbg !260
  br label %for.body58.us, !dbg !289

for.body17:                                       ; preds = %for.body17.lr.ph, %for.body17
  %indvars.iv = phi i64 [ 0, %for.body17.lr.ph ], [ %indvars.iv.next, %for.body17 ]
  %44 = trunc i64 %indvars.iv to i32, !dbg !294
  %mul18 = shl nsw i32 %44, 1, !dbg !294
  tail call void @llvm.dbg.value(metadata i32 %mul18, i64 0, metadata !69, metadata !101), !dbg !295
  %45 = add nsw i64 %indvars.iv, %15, !dbg !296
  %46 = trunc i64 %45 to i32, !dbg !297
  %mul19 = shl nsw i32 %46, 1, !dbg !297
  tail call void @llvm.dbg.value(metadata i32 %mul19, i64 0, metadata !73, metadata !101), !dbg !298
  %idxprom = sext i32 %mul19 to i64, !dbg !299
  %arrayidx = getelementptr inbounds double* %data, i64 %idxprom, !dbg !299
  %47 = load double* %arrayidx, align 8, !dbg !299, !tbaa !153
  tail call void @llvm.dbg.value(metadata double %47, i64 0, metadata !74, metadata !101), !dbg !300
  %add20178 = or i32 %mul19, 1, !dbg !301
  %idxprom21 = sext i32 %add20178 to i64, !dbg !302
  %arrayidx22 = getelementptr inbounds double* %data, i64 %idxprom21, !dbg !302
  %48 = load double* %arrayidx22, align 8, !dbg !302, !tbaa !153
  tail call void @llvm.dbg.value(metadata double %48, i64 0, metadata !75, metadata !101), !dbg !303
  %idxprom23 = sext i32 %mul18 to i64, !dbg !304
  %arrayidx24 = getelementptr inbounds double* %data, i64 %idxprom23, !dbg !304
  %49 = load double* %arrayidx24, align 8, !dbg !304, !tbaa !153
  %sub = fsub double %49, %47, !dbg !304
  store double %sub, double* %arrayidx, align 8, !dbg !305, !tbaa !153
  %add27179 = or i32 %mul18, 1, !dbg !306
  %idxprom28 = sext i32 %add27179 to i64, !dbg !307
  %arrayidx29 = getelementptr inbounds double* %data, i64 %idxprom28, !dbg !307
  %50 = load double* %arrayidx29, align 8, !dbg !307, !tbaa !153
  %sub30 = fsub double %50, %48, !dbg !307
  store double %sub30, double* %arrayidx22, align 8, !dbg !308, !tbaa !153
  %51 = load double* %arrayidx24, align 8, !dbg !309, !tbaa !153
  %add36 = fadd double %47, %51, !dbg !309
  store double %add36, double* %arrayidx24, align 8, !dbg !309, !tbaa !153
  %52 = load double* %arrayidx29, align 8, !dbg !310, !tbaa !153
  %add40 = fadd double %48, %52, !dbg !310
  store double %add40, double* %arrayidx29, align 8, !dbg !310, !tbaa !153
  %indvars.iv.next = add nsw i64 %indvars.iv, %14, !dbg !261
  %cmp15 = icmp slt i64 %indvars.iv.next, %11, !dbg !246
  br i1 %cmp15, label %for.body17, label %for.cond43.preheader.loopexit, !dbg !261

for.inc104.loopexit:                              ; preds = %for.inc102.us
  br label %for.inc104

for.inc104:                                       ; preds = %for.inc104.loopexit, %for.cond43.preheader
  %inc105 = add nuw nsw i32 %bit.0197, 1, !dbg !311
  tail call void @llvm.dbg.value(metadata i32 %inc105, i64 0, metadata !55, metadata !101), !dbg !178
  %mul106 = shl nsw i32 %dual.0194, 1, !dbg !312
  tail call void @llvm.dbg.value(metadata i32 %mul106, i64 0, metadata !57, metadata !101), !dbg !179
  %exitcond205 = icmp eq i32 %bit.0197, %12, !dbg !243
  br i1 %exitcond205, label %for.end107.loopexit, label %for.body, !dbg !243

for.end107.loopexit:                              ; preds = %for.inc104
  br label %for.end107

for.end107:                                       ; preds = %for.end107.loopexit, %for.cond.preheader, %int_log2.exit, %entry
  ret void, !dbg !313
}

; Function Attrs: nounwind uwtable
define void @FFT_inverse(i32 %N, double* nocapture %data) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %N, i64 0, metadata !42, metadata !101), !dbg !314
  tail call void @llvm.dbg.value(metadata double* %data, i64 0, metadata !43, metadata !101), !dbg !315
  %div = sdiv i32 %N, 2, !dbg !316
  tail call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !44, metadata !101), !dbg !317
  tail call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !45, metadata !101), !dbg !318
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !46, metadata !101), !dbg !319
  tail call fastcc void @FFT_transform_internal(i32 %N, double* %data, i32 1), !dbg !320
  %conv = sitofp i32 %div to double, !dbg !321
  %div1 = fdiv double 1.000000e+00, %conv, !dbg !322
  tail call void @llvm.dbg.value(metadata double %div1, i64 0, metadata !45, metadata !101), !dbg !318
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !46, metadata !101), !dbg !319
  %cmp8 = icmp sgt i32 %N, 0, !dbg !323
  br i1 %cmp8, label %for.body.lr.ph, label %for.end, !dbg !326

for.body.lr.ph:                                   ; preds = %entry
  %0 = add i32 %N, -1, !dbg !326
  %1 = zext i32 %0 to i64
  %2 = add nuw nsw i64 %1, 1, !dbg !326
  %end.idx = add nuw nsw i64 %1, 1, !dbg !326
  %n.vec = and i64 %2, 8589934588, !dbg !326
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !326
  br i1 %cmp.zero, label %middle.block, label %vector.ph

vector.ph:                                        ; preds = %for.body.lr.ph
  %broadcast.splatinsert12 = insertelement <2 x double> undef, double %div1, i32 0
  %broadcast.splat13 = shufflevector <2 x double> %broadcast.splatinsert12, <2 x double> undef, <2 x i32> zeroinitializer
  %3 = add i32 %N, -1
  %4 = zext i32 %3 to i64
  %5 = add i64 %4, 1
  %6 = lshr i64 %5, 2
  %7 = mul i64 %6, 4
  %8 = add i64 %7, -4
  %9 = lshr i64 %8, 2
  %10 = add i64 %9, 1
  %xtraiter21 = and i64 %10, 1
  %lcmp.mod22 = icmp ne i64 %xtraiter21, 0
  %lcmp.overflow23 = icmp eq i64 %10, 0
  %lcmp.or24 = or i1 %lcmp.overflow23, %lcmp.mod22
  br i1 %lcmp.or24, label %vector.body.prol, label %vector.ph.split

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.ph
  %index.prol = phi i64 [ 0, %vector.ph ], [ %index.next.prol, %vector.body.prol ], !dbg !326
  %prol.iter25 = phi i64 [ %xtraiter21, %vector.ph ], [ %prol.iter25.sub, %vector.body.prol ]
  %11 = getelementptr inbounds double* %data, i64 %index.prol, !dbg !327
  %12 = bitcast double* %11 to <2 x double>*, !dbg !327
  %wide.load.prol = load <2 x double>* %12, align 8, !dbg !327, !tbaa !153
  %.sum20.prol = or i64 %index.prol, 2, !dbg !327
  %13 = getelementptr double* %data, i64 %.sum20.prol, !dbg !327
  %14 = bitcast double* %13 to <2 x double>*, !dbg !327
  %wide.load11.prol = load <2 x double>* %14, align 8, !dbg !327, !tbaa !153
  %15 = fmul <2 x double> %broadcast.splat13, %wide.load.prol, !dbg !327
  %16 = fmul <2 x double> %broadcast.splat13, %wide.load11.prol, !dbg !327
  %17 = bitcast double* %11 to <2 x double>*, !dbg !327
  store <2 x double> %15, <2 x double>* %17, align 8, !dbg !327, !tbaa !153
  %18 = bitcast double* %13 to <2 x double>*, !dbg !327
  store <2 x double> %16, <2 x double>* %18, align 8, !dbg !327, !tbaa !153
  %index.next.prol = add i64 %index.prol, 4, !dbg !326
  %19 = icmp eq i64 %index.next.prol, %n.vec, !dbg !326
  %prol.iter25.sub = sub i64 %prol.iter25, 1, !dbg !326
  %prol.iter25.cmp = icmp ne i64 %prol.iter25.sub, 0, !dbg !326
  br i1 %prol.iter25.cmp, label %vector.body.prol, label %vector.ph.split, !llvm.loop !328

vector.ph.split:                                  ; preds = %vector.body.prol, %vector.ph
  %index.unr = phi i64 [ 0, %vector.ph ], [ %index.next.prol, %vector.body.prol ]
  %20 = icmp ult i64 %10, 2
  br i1 %20, label %middle.block.loopexit, label %vector.ph.split.split

vector.ph.split.split:                            ; preds = %vector.ph.split
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph.split.split
  %index = phi i64 [ %index.unr, %vector.ph.split.split ], [ %index.next.1, %vector.body ], !dbg !326
  %21 = getelementptr inbounds double* %data, i64 %index, !dbg !327
  %22 = bitcast double* %21 to <2 x double>*, !dbg !327
  %wide.load = load <2 x double>* %22, align 8, !dbg !327, !tbaa !153
  %.sum20 = or i64 %index, 2, !dbg !327
  %23 = getelementptr double* %data, i64 %.sum20, !dbg !327
  %24 = bitcast double* %23 to <2 x double>*, !dbg !327
  %wide.load11 = load <2 x double>* %24, align 8, !dbg !327, !tbaa !153
  %25 = fmul <2 x double> %broadcast.splat13, %wide.load, !dbg !327
  %26 = fmul <2 x double> %broadcast.splat13, %wide.load11, !dbg !327
  %27 = bitcast double* %21 to <2 x double>*, !dbg !327
  store <2 x double> %25, <2 x double>* %27, align 8, !dbg !327, !tbaa !153
  %28 = bitcast double* %23 to <2 x double>*, !dbg !327
  store <2 x double> %26, <2 x double>* %28, align 8, !dbg !327, !tbaa !153
  %index.next = add i64 %index, 4, !dbg !326
  %29 = getelementptr inbounds double* %data, i64 %index.next, !dbg !327
  %30 = bitcast double* %29 to <2 x double>*, !dbg !327
  %wide.load.1 = load <2 x double>* %30, align 8, !dbg !327, !tbaa !153
  %.sum20.1 = or i64 %index.next, 2, !dbg !327
  %31 = getelementptr double* %data, i64 %.sum20.1, !dbg !327
  %32 = bitcast double* %31 to <2 x double>*, !dbg !327
  %wide.load11.1 = load <2 x double>* %32, align 8, !dbg !327, !tbaa !153
  %33 = fmul <2 x double> %broadcast.splat13, %wide.load.1, !dbg !327
  %34 = fmul <2 x double> %broadcast.splat13, %wide.load11.1, !dbg !327
  %35 = bitcast double* %29 to <2 x double>*, !dbg !327
  store <2 x double> %33, <2 x double>* %35, align 8, !dbg !327, !tbaa !153
  %36 = bitcast double* %31 to <2 x double>*, !dbg !327
  store <2 x double> %34, <2 x double>* %36, align 8, !dbg !327, !tbaa !153
  %index.next.1 = add i64 %index.next, 4, !dbg !326
  %37 = icmp eq i64 %index.next.1, %n.vec, !dbg !326
  br i1 %37, label %middle.block.loopexit.unr-lcssa, label %vector.body, !dbg !326, !llvm.loop !330

middle.block.loopexit.unr-lcssa:                  ; preds = %vector.body
  br label %middle.block.loopexit

middle.block.loopexit:                            ; preds = %vector.ph.split, %middle.block.loopexit.unr-lcssa
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %for.body.lr.ph
  %resume.val = phi i64 [ 0, %for.body.lr.ph ], [ %n.vec, %middle.block.loopexit ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %for.end, label %for.body.preheader

for.body.preheader:                               ; preds = %middle.block
  %38 = trunc i64 %resume.val to i32
  %39 = sub i32 %N, %38
  %xtraiter = and i32 %39, 3
  %lcmp.mod = icmp ne i32 %xtraiter, 0
  %lcmp.overflow = icmp eq i32 %39, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %for.body.prol, label %for.body.preheader.split

for.body.prol:                                    ; preds = %for.body.prol, %for.body.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body.prol ], [ %resume.val, %for.body.preheader ]
  %prol.iter = phi i32 [ %xtraiter, %for.body.preheader ], [ %prol.iter.sub, %for.body.prol ]
  %arrayidx.prol = getelementptr inbounds double* %data, i64 %indvars.iv.prol, !dbg !327
  %40 = load double* %arrayidx.prol, align 8, !dbg !327, !tbaa !153
  %mul.prol = fmul double %div1, %40, !dbg !327
  store double %mul.prol, double* %arrayidx.prol, align 8, !dbg !327, !tbaa !153
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1, !dbg !326
  %lftr.wideiv.prol = trunc i64 %indvars.iv.prol to i32, !dbg !326
  %exitcond.prol = icmp eq i32 %lftr.wideiv.prol, %0, !dbg !326
  %prol.iter.sub = sub i32 %prol.iter, 1, !dbg !326
  %prol.iter.cmp = icmp ne i32 %prol.iter.sub, 0, !dbg !326
  br i1 %prol.iter.cmp, label %for.body.prol, label %for.body.preheader.split, !llvm.loop !333

for.body.preheader.split:                         ; preds = %for.body.prol, %for.body.preheader
  %indvars.iv.unr = phi i64 [ %resume.val, %for.body.preheader ], [ %indvars.iv.next.prol, %for.body.prol ]
  %41 = icmp ult i32 %39, 4
  br i1 %41, label %for.end.loopexit, label %for.body.preheader.split.split

for.body.preheader.split.split:                   ; preds = %for.body.preheader.split
  br label %for.body, !dbg !327

for.body:                                         ; preds = %for.body, %for.body.preheader.split.split
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.body.preheader.split.split ], [ %indvars.iv.next.3, %for.body ]
  %arrayidx = getelementptr inbounds double* %data, i64 %indvars.iv, !dbg !327
  %42 = load double* %arrayidx, align 8, !dbg !327, !tbaa !153
  %mul = fmul double %div1, %42, !dbg !327
  store double %mul, double* %arrayidx, align 8, !dbg !327, !tbaa !153
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !326
  %lftr.wideiv = trunc i64 %indvars.iv to i32, !dbg !326
  %arrayidx.1 = getelementptr inbounds double* %data, i64 %indvars.iv.next, !dbg !327
  %43 = load double* %arrayidx.1, align 8, !dbg !327, !tbaa !153
  %mul.1 = fmul double %div1, %43, !dbg !327
  store double %mul.1, double* %arrayidx.1, align 8, !dbg !327, !tbaa !153
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv.next, 1, !dbg !326
  %lftr.wideiv.1 = trunc i64 %indvars.iv.next to i32, !dbg !326
  %arrayidx.2 = getelementptr inbounds double* %data, i64 %indvars.iv.next.1, !dbg !327
  %44 = load double* %arrayidx.2, align 8, !dbg !327, !tbaa !153
  %mul.2 = fmul double %div1, %44, !dbg !327
  store double %mul.2, double* %arrayidx.2, align 8, !dbg !327, !tbaa !153
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv.next.1, 1, !dbg !326
  %lftr.wideiv.2 = trunc i64 %indvars.iv.next.1 to i32, !dbg !326
  %arrayidx.3 = getelementptr inbounds double* %data, i64 %indvars.iv.next.2, !dbg !327
  %45 = load double* %arrayidx.3, align 8, !dbg !327, !tbaa !153
  %mul.3 = fmul double %div1, %45, !dbg !327
  store double %mul.3, double* %arrayidx.3, align 8, !dbg !327, !tbaa !153
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv.next.2, 1, !dbg !326
  %lftr.wideiv.3 = trunc i64 %indvars.iv.next.2 to i32, !dbg !326
  %exitcond.3 = icmp eq i32 %lftr.wideiv.3, %0, !dbg !326
  br i1 %exitcond.3, label %for.end.loopexit.unr-lcssa, label %for.body, !dbg !326, !llvm.loop !334

for.end.loopexit.unr-lcssa:                       ; preds = %for.body
  br label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.body.preheader.split, %for.end.loopexit.unr-lcssa
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %middle.block, %entry
  ret void, !dbg !335
}

; Function Attrs: nounwind
declare double @sin(double) #1

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!98, !99}
!llvm.ident = !{!100}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !5, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/FFT.c] [DW_LANG_C99]
!1 = !{!"FFT.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C"}
!2 = !{}
!3 = !{!4}
!4 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!5 = !{!6, !15, !36, !40, !47, !91}
!6 = !{!"0x2e\00FFT_num_flops\00FFT_num_flops\00\0013\000\001\000\000\00256\001\0014", !1, !7, !8, null, double (i32)* @FFT_num_flops, null, null, !11} ; [ DW_TAG_subprogram ] [line 13] [def] [scope 14] [FFT_num_flops]
!7 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/FFT.c]
!8 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !9, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!9 = !{!4, !10}
!10 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!11 = !{!12, !13, !14}
!12 = !{!"0x101\00N\0016777229\000", !6, !7, !10} ; [ DW_TAG_arg_variable ] [N] [line 13]
!13 = !{!"0x100\00Nd\0016\000", !6, !7, !4}       ; [ DW_TAG_auto_variable ] [Nd] [line 16]
!14 = !{!"0x100\00logN\0017\000", !6, !7, !4}     ; [ DW_TAG_auto_variable ] [logN] [line 17]
!15 = !{!"0x2e\00FFT_bitreverse\00FFT_bitreverse\00\00105\000\001\000\000\00256\001\00105", !1, !7, !16, null, void (i32, double*)* @FFT_bitreverse, null, null, !19} ; [ DW_TAG_subprogram ] [line 105] [def] [FFT_bitreverse]
!16 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !17, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!17 = !{null, !10, !18}
!18 = !{!"0xf\00\000\0064\0064\000\000", null, null, !4} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!19 = !{!20, !21, !22, !23, !24, !25, !26, !30, !31, !32, !35}
!20 = !{!"0x101\00N\0016777321\000", !15, !7, !10} ; [ DW_TAG_arg_variable ] [N] [line 105]
!21 = !{!"0x101\00data\0033554537\000", !15, !7, !18} ; [ DW_TAG_arg_variable ] [data] [line 105]
!22 = !{!"0x100\00n\00107\000", !15, !7, !10}     ; [ DW_TAG_auto_variable ] [n] [line 107]
!23 = !{!"0x100\00nm1\00108\000", !15, !7, !10}   ; [ DW_TAG_auto_variable ] [nm1] [line 108]
!24 = !{!"0x100\00i\00109\000", !15, !7, !10}     ; [ DW_TAG_auto_variable ] [i] [line 109]
!25 = !{!"0x100\00j\00110\000", !15, !7, !10}     ; [ DW_TAG_auto_variable ] [j] [line 110]
!26 = !{!"0x100\00ii\00114\000", !27, !7, !10}    ; [ DW_TAG_auto_variable ] [ii] [line 114]
!27 = !{!"0xb\00111\0026\002", !1, !28}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/FFT.c]
!28 = !{!"0xb\00111\005\001", !1, !29}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/FFT.c]
!29 = !{!"0xb\00111\005\000", !1, !15}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/FFT.c]
!30 = !{!"0x100\00jj\00117\000", !27, !7, !10}    ; [ DW_TAG_auto_variable ] [jj] [line 117]
!31 = !{!"0x100\00k\00120\000", !27, !7, !10}     ; [ DW_TAG_auto_variable ] [k] [line 120]
!32 = !{!"0x100\00tmp_real\00123\000", !33, !7, !4} ; [ DW_TAG_auto_variable ] [tmp_real] [line 123]
!33 = !{!"0xb\00122\0018\004", !1, !34}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/FFT.c]
!34 = !{!"0xb\00122\0011\003", !1, !27}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/FFT.c]
!35 = !{!"0x100\00tmp_imag\00124\000", !33, !7, !4} ; [ DW_TAG_auto_variable ] [tmp_imag] [line 124]
!36 = !{!"0x2e\00FFT_transform\00FFT_transform\00\00143\000\001\000\000\00256\001\00144", !1, !7, !16, null, void (i32, double*)* @FFT_transform, null, null, !37} ; [ DW_TAG_subprogram ] [line 143] [def] [scope 144] [FFT_transform]
!37 = !{!38, !39}
!38 = !{!"0x101\00N\0016777359\000", !36, !7, !10} ; [ DW_TAG_arg_variable ] [N] [line 143]
!39 = !{!"0x101\00data\0033554575\000", !36, !7, !18} ; [ DW_TAG_arg_variable ] [data] [line 143]
!40 = !{!"0x2e\00FFT_inverse\00FFT_inverse\00\00149\000\001\000\000\00256\001\00150", !1, !7, !16, null, void (i32, double*)* @FFT_inverse, null, null, !41} ; [ DW_TAG_subprogram ] [line 149] [def] [scope 150] [FFT_inverse]
!41 = !{!42, !43, !44, !45, !46}
!42 = !{!"0x101\00N\0016777365\000", !40, !7, !10} ; [ DW_TAG_arg_variable ] [N] [line 149]
!43 = !{!"0x101\00data\0033554581\000", !40, !7, !18} ; [ DW_TAG_arg_variable ] [data] [line 149]
!44 = !{!"0x100\00n\00151\000", !40, !7, !10}     ; [ DW_TAG_auto_variable ] [n] [line 151]
!45 = !{!"0x100\00norm\00152\000", !40, !7, !4}   ; [ DW_TAG_auto_variable ] [norm] [line 152]
!46 = !{!"0x100\00i\00153\000", !40, !7, !10}     ; [ DW_TAG_auto_variable ] [i] [line 153]
!47 = !{!"0x2e\00FFT_transform_internal\00FFT_transform_internal\00\0035\001\001\000\000\00256\001\0035", !1, !7, !48, null, void (i32, double*, i32)* @FFT_transform_internal, null, null, !50} ; [ DW_TAG_subprogram ] [line 35] [local] [def] [FFT_transform_internal]
!48 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !49, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!49 = !{null, !10, !18, !10}
!50 = !{!51, !52, !53, !54, !55, !56, !57, !58, !62, !63, !64, !65, !66, !67, !68, !69, !73, !74, !75, !76, !81, !82, !86, !87, !88, !89, !90}
!51 = !{!"0x101\00N\0016777251\000", !47, !7, !10} ; [ DW_TAG_arg_variable ] [N] [line 35]
!52 = !{!"0x101\00data\0033554467\000", !47, !7, !18} ; [ DW_TAG_arg_variable ] [data] [line 35]
!53 = !{!"0x101\00direction\0050331683\000", !47, !7, !10} ; [ DW_TAG_arg_variable ] [direction] [line 35]
!54 = !{!"0x100\00n\0036\000", !47, !7, !10}      ; [ DW_TAG_auto_variable ] [n] [line 36]
!55 = !{!"0x100\00bit\0037\000", !47, !7, !10}    ; [ DW_TAG_auto_variable ] [bit] [line 37]
!56 = !{!"0x100\00logn\0038\000", !47, !7, !10}   ; [ DW_TAG_auto_variable ] [logn] [line 38]
!57 = !{!"0x100\00dual\0039\000", !47, !7, !10}   ; [ DW_TAG_auto_variable ] [dual] [line 39]
!58 = !{!"0x100\00w_real\0053\000", !59, !7, !4}  ; [ DW_TAG_auto_variable ] [w_real] [line 53]
!59 = !{!"0xb\0052\0049\0012", !1, !60}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/FFT.c]
!60 = !{!"0xb\0052\005\0011", !1, !61}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/FFT.c]
!61 = !{!"0xb\0052\005\0010", !1, !47}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/FFT.c]
!62 = !{!"0x100\00w_imag\0054\000", !59, !7, !4}  ; [ DW_TAG_auto_variable ] [w_imag] [line 54]
!63 = !{!"0x100\00a\0055\000", !59, !7, !10}      ; [ DW_TAG_auto_variable ] [a] [line 55]
!64 = !{!"0x100\00b\0056\000", !59, !7, !10}      ; [ DW_TAG_auto_variable ] [b] [line 56]
!65 = !{!"0x100\00theta\0058\000", !59, !7, !4}   ; [ DW_TAG_auto_variable ] [theta] [line 58]
!66 = !{!"0x100\00s\0059\000", !59, !7, !4}       ; [ DW_TAG_auto_variable ] [s] [line 59]
!67 = !{!"0x100\00t\0060\000", !59, !7, !4}       ; [ DW_TAG_auto_variable ] [t] [line 60]
!68 = !{!"0x100\00s2\0061\000", !59, !7, !4}      ; [ DW_TAG_auto_variable ] [s2] [line 61]
!69 = !{!"0x100\00i\0064\000", !70, !7, !10}      ; [ DW_TAG_auto_variable ] [i] [line 64]
!70 = !{!"0xb\0063\0046\0015", !1, !71}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/FFT.c]
!71 = !{!"0xb\0063\007\0014", !1, !72}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/FFT.c]
!72 = !{!"0xb\0063\007\0013", !1, !59}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/FFT.c]
!73 = !{!"0x100\00j\0065\000", !70, !7, !10}      ; [ DW_TAG_auto_variable ] [j] [line 65]
!74 = !{!"0x100\00wd_real\0067\000", !70, !7, !4} ; [ DW_TAG_auto_variable ] [wd_real] [line 67]
!75 = !{!"0x100\00wd_imag\0068\000", !70, !7, !4} ; [ DW_TAG_auto_variable ] [wd_imag] [line 68]
!76 = !{!"0x100\00tmp_real\0080\000", !77, !7, !4} ; [ DW_TAG_auto_variable ] [tmp_real] [line 80]
!77 = !{!"0xb\0079\009\0019", !1, !78}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/FFT.c]
!78 = !{!"0xb\0077\0034\0018", !1, !79}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/FFT.c]
!79 = !{!"0xb\0077\007\0017", !1, !80}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/FFT.c]
!80 = !{!"0xb\0077\007\0016", !1, !59}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/FFT.c]
!81 = !{!"0x100\00tmp_imag\0081\000", !77, !7, !4} ; [ DW_TAG_auto_variable ] [tmp_imag] [line 81]
!82 = !{!"0x100\00i\0086\000", !83, !7, !10}      ; [ DW_TAG_auto_variable ] [i] [line 86]
!83 = !{!"0xb\0085\0043\0022", !1, !84}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/FFT.c]
!84 = !{!"0xb\0085\009\0021", !1, !85}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/FFT.c]
!85 = !{!"0xb\0085\009\0020", !1, !78}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/FFT.c]
!86 = !{!"0x100\00j\0087\000", !83, !7, !10}      ; [ DW_TAG_auto_variable ] [j] [line 87]
!87 = !{!"0x100\00z1_real\0089\000", !83, !7, !4} ; [ DW_TAG_auto_variable ] [z1_real] [line 89]
!88 = !{!"0x100\00z1_imag\0090\000", !83, !7, !4} ; [ DW_TAG_auto_variable ] [z1_imag] [line 90]
!89 = !{!"0x100\00wd_real\0092\000", !83, !7, !4} ; [ DW_TAG_auto_variable ] [wd_real] [line 92]
!90 = !{!"0x100\00wd_imag\0093\000", !83, !7, !4} ; [ DW_TAG_auto_variable ] [wd_imag] [line 93]
!91 = !{!"0x2e\00int_log2\00int_log2\00\0022\001\001\000\000\00256\001\0023", !1, !7, !92, null, null, null, null, !94} ; [ DW_TAG_subprogram ] [line 22] [local] [def] [scope 23] [int_log2]
!92 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !93, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!93 = !{!10, !10}
!94 = !{!95, !96, !97}
!95 = !{!"0x101\00n\0016777238\000", !91, !7, !10} ; [ DW_TAG_arg_variable ] [n] [line 22]
!96 = !{!"0x100\00k\0024\000", !91, !7, !10}      ; [ DW_TAG_auto_variable ] [k] [line 24]
!97 = !{!"0x100\00log\0025\000", !91, !7, !10}    ; [ DW_TAG_auto_variable ] [log] [line 25]
!98 = !{i32 2, !"Dwarf Version", i32 4}
!99 = !{i32 2, !"Debug Info Version", i32 2}
!100 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!101 = !{!"0x102"}                                ; [ DW_TAG_expression ]
!102 = !MDLocation(line: 13, column: 26, scope: !6)
!103 = !MDLocation(line: 16, column: 18, scope: !6)
!104 = !MDLocation(line: 16, column: 13, scope: !6)
!105 = !{!"0x101\00n\0016777238\000", !91, !7, !10, !106} ; [ DW_TAG_arg_variable ] [n] [line 22]
!106 = !MDLocation(line: 17, column: 29, scope: !6)
!107 = !MDLocation(line: 22, column: 26, scope: !91, inlinedAt: !106)
!108 = !{!"0x100\00k\0024\000", !91, !7, !10, !106} ; [ DW_TAG_auto_variable ] [k] [line 24]
!109 = !MDLocation(line: 24, column: 9, scope: !91, inlinedAt: !106)
!110 = !{!"0x100\00log\0025\000", !91, !7, !10, !106} ; [ DW_TAG_auto_variable ] [log] [line 25]
!111 = !MDLocation(line: 25, column: 9, scope: !91, inlinedAt: !106)
!112 = !MDLocation(line: 26, column: 18, scope: !113, inlinedAt: !106)
!113 = !{!"0xb\0026\005\0024", !1, !114}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/FFT.c]
!114 = !{!"0xb\0026\005\0023", !1, !91}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/FFT.c]
!115 = !MDLocation(line: 26, column: 5, scope: !114, inlinedAt: !106)
!116 = !MDLocation(line: 26, column: 25, scope: !117, inlinedAt: !106)
!117 = !{!"0xb\003", !1, !113}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/FFT.c]
!118 = !MDLocation(line: 26, column: 33, scope: !113, inlinedAt: !106)
!119 = !MDLocation(line: 27, column: 15, scope: !120, inlinedAt: !106)
!120 = !{!"0xb\0027\009\0025", !1, !91}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/FFT.c]
!121 = !MDLocation(line: 27, column: 9, scope: !120, inlinedAt: !106)
!122 = !MDLocation(line: 27, column: 9, scope: !91, inlinedAt: !106)
!123 = !MDLocation(line: 29, column: 7, scope: !124, inlinedAt: !106)
!124 = !{!"0xb\0028\005\0026", !1, !120}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/FFT.c]
!125 = !MDLocation(line: 30, column: 7, scope: !124, inlinedAt: !106)
!126 = !MDLocation(line: 17, column: 20, scope: !6)
!127 = !MDLocation(line: 17, column: 13, scope: !6)
!128 = !MDLocation(line: 19, column: 14, scope: !6)
!129 = !MDLocation(line: 19, column: 34, scope: !6)
!130 = !MDLocation(line: 19, column: 31, scope: !6)
!131 = !MDLocation(line: 19, column: 13, scope: !6)
!132 = !MDLocation(line: 19, column: 6, scope: !6)
!133 = !MDLocation(line: 105, column: 25, scope: !15)
!134 = !MDLocation(line: 105, column: 36, scope: !15)
!135 = !MDLocation(line: 107, column: 11, scope: !15)
!136 = !MDLocation(line: 107, column: 9, scope: !15)
!137 = !MDLocation(line: 108, column: 9, scope: !15)
!138 = !MDLocation(line: 109, column: 9, scope: !15)
!139 = !MDLocation(line: 110, column: 9, scope: !15)
!140 = !MDLocation(line: 111, column: 12, scope: !28)
!141 = !MDLocation(line: 111, column: 5, scope: !29)
!142 = !MDLocation(line: 108, column: 15, scope: !15)
!143 = !MDLocation(line: 120, column: 15, scope: !27)
!144 = !MDLocation(line: 114, column: 11, scope: !27)
!145 = !MDLocation(line: 117, column: 11, scope: !27)
!146 = !MDLocation(line: 120, column: 11, scope: !27)
!147 = !MDLocation(line: 122, column: 11, scope: !34)
!148 = !MDLocation(line: 122, column: 11, scope: !27)
!149 = !MDLocation(line: 117, column: 16, scope: !27)
!150 = !MDLocation(line: 114, column: 16, scope: !27)
!151 = !MDLocation(line: 123, column: 30, scope: !33)
!152 = !MDLocation(line: 123, column: 16, scope: !33)
!153 = !{!154, !154, i64 0}
!154 = !{!"double", !155, i64 0}
!155 = !{!"omnipotent char", !156, i64 0}
!156 = !{!"Simple C/C++ TBAA"}
!157 = !MDLocation(line: 124, column: 16, scope: !33)
!158 = !MDLocation(line: 125, column: 22, scope: !33)
!159 = !MDLocation(line: 125, column: 9, scope: !33)
!160 = !MDLocation(line: 127, column: 9, scope: !33)
!161 = !MDLocation(line: 128, column: 32, scope: !33)
!162 = !MDLocation(line: 130, column: 14, scope: !27)
!163 = !MDLocation(line: 130, column: 7, scope: !27)
!164 = !MDLocation(line: 133, column: 9, scope: !165)
!165 = !{!"0xb\00131\007\005", !1, !27}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/FFT.c]
!166 = !MDLocation(line: 136, column: 9, scope: !165)
!167 = !MDLocation(line: 138, column: 7, scope: !27)
!168 = !MDLocation(line: 140, column: 3, scope: !15)
!169 = !MDLocation(line: 143, column: 24, scope: !36)
!170 = !MDLocation(line: 143, column: 35, scope: !36)
!171 = !MDLocation(line: 145, column: 5, scope: !36)
!172 = !MDLocation(line: 146, column: 1, scope: !36)
!173 = !MDLocation(line: 35, column: 41, scope: !47)
!174 = !MDLocation(line: 35, column: 52, scope: !47)
!175 = !MDLocation(line: 35, column: 62, scope: !47)
!176 = !MDLocation(line: 36, column: 13, scope: !47)
!177 = !MDLocation(line: 36, column: 9, scope: !47)
!178 = !MDLocation(line: 37, column: 9, scope: !47)
!179 = !MDLocation(line: 39, column: 9, scope: !47)
!180 = !MDLocation(line: 41, column: 9, scope: !181)
!181 = !{!"0xb\0041\009\008", !1, !47}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/FFT.c]
!182 = !MDLocation(line: 41, column: 9, scope: !47)
!183 = !{!"0x101\00n\0016777238\000", !91, !7, !10, !184} ; [ DW_TAG_arg_variable ] [n] [line 22]
!184 = !MDLocation(line: 42, column: 12, scope: !47)
!185 = !MDLocation(line: 22, column: 26, scope: !91, inlinedAt: !184)
!186 = !{!"0x100\00k\0024\000", !91, !7, !10, !184} ; [ DW_TAG_auto_variable ] [k] [line 24]
!187 = !MDLocation(line: 24, column: 9, scope: !91, inlinedAt: !184)
!188 = !{!"0x100\00log\0025\000", !91, !7, !10, !184} ; [ DW_TAG_auto_variable ] [log] [line 25]
!189 = !MDLocation(line: 25, column: 9, scope: !91, inlinedAt: !184)
!190 = !MDLocation(line: 26, column: 18, scope: !113, inlinedAt: !184)
!191 = !MDLocation(line: 26, column: 5, scope: !114, inlinedAt: !184)
!192 = !MDLocation(line: 26, column: 25, scope: !117, inlinedAt: !184)
!193 = !MDLocation(line: 26, column: 33, scope: !113, inlinedAt: !184)
!194 = !MDLocation(line: 27, column: 15, scope: !120, inlinedAt: !184)
!195 = !MDLocation(line: 27, column: 9, scope: !120, inlinedAt: !184)
!196 = !MDLocation(line: 27, column: 9, scope: !91, inlinedAt: !184)
!197 = !MDLocation(line: 29, column: 7, scope: !124, inlinedAt: !184)
!198 = !MDLocation(line: 30, column: 7, scope: !124, inlinedAt: !184)
!199 = !MDLocation(line: 38, column: 9, scope: !47)
!200 = !MDLocation(line: 45, column: 9, scope: !201)
!201 = !{!"0xb\0045\009\009", !1, !47}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/FFT.c]
!202 = !MDLocation(line: 45, column: 9, scope: !47)
!203 = !{!"0x101\00N\0016777321\000", !15, !7, !10, !204} ; [ DW_TAG_arg_variable ] [N] [line 105]
!204 = !MDLocation(line: 48, column: 5, scope: !47)
!205 = !MDLocation(line: 105, column: 25, scope: !15, inlinedAt: !204)
!206 = !{!"0x101\00data\0033554537\000", !15, !7, !18, !204} ; [ DW_TAG_arg_variable ] [data] [line 105]
!207 = !MDLocation(line: 105, column: 36, scope: !15, inlinedAt: !204)
!208 = !{!"0x100\00n\00107\000", !15, !7, !10, !204} ; [ DW_TAG_auto_variable ] [n] [line 107]
!209 = !MDLocation(line: 107, column: 9, scope: !15, inlinedAt: !204)
!210 = !{!"0x100\00i\00109\000", !15, !7, !10, !204} ; [ DW_TAG_auto_variable ] [i] [line 109]
!211 = !MDLocation(line: 109, column: 9, scope: !15, inlinedAt: !204)
!212 = !{!"0x100\00j\00110\000", !15, !7, !10, !204} ; [ DW_TAG_auto_variable ] [j] [line 110]
!213 = !MDLocation(line: 110, column: 9, scope: !15, inlinedAt: !204)
!214 = !MDLocation(line: 111, column: 5, scope: !29, inlinedAt: !204)
!215 = !MDLocation(line: 108, column: 15, scope: !15, inlinedAt: !204)
!216 = !MDLocation(line: 120, column: 15, scope: !27, inlinedAt: !204)
!217 = !{!"0x100\00ii\00114\000", !27, !7, !10, !204} ; [ DW_TAG_auto_variable ] [ii] [line 114]
!218 = !MDLocation(line: 114, column: 11, scope: !27, inlinedAt: !204)
!219 = !{!"0x100\00jj\00117\000", !27, !7, !10, !204} ; [ DW_TAG_auto_variable ] [jj] [line 117]
!220 = !MDLocation(line: 117, column: 11, scope: !27, inlinedAt: !204)
!221 = !{!"0x100\00k\00120\000", !27, !7, !10, !204} ; [ DW_TAG_auto_variable ] [k] [line 120]
!222 = !MDLocation(line: 120, column: 11, scope: !27, inlinedAt: !204)
!223 = !MDLocation(line: 122, column: 11, scope: !34, inlinedAt: !204)
!224 = !MDLocation(line: 122, column: 11, scope: !27, inlinedAt: !204)
!225 = !MDLocation(line: 117, column: 16, scope: !27, inlinedAt: !204)
!226 = !MDLocation(line: 114, column: 16, scope: !27, inlinedAt: !204)
!227 = !MDLocation(line: 123, column: 30, scope: !33, inlinedAt: !204)
!228 = !{!"0x100\00tmp_real\00123\000", !33, !7, !4, !204} ; [ DW_TAG_auto_variable ] [tmp_real] [line 123]
!229 = !MDLocation(line: 123, column: 16, scope: !33, inlinedAt: !204)
!230 = !{!"0x100\00tmp_imag\00124\000", !33, !7, !4, !204} ; [ DW_TAG_auto_variable ] [tmp_imag] [line 124]
!231 = !MDLocation(line: 124, column: 16, scope: !33, inlinedAt: !204)
!232 = !MDLocation(line: 125, column: 22, scope: !33, inlinedAt: !204)
!233 = !MDLocation(line: 125, column: 9, scope: !33, inlinedAt: !204)
!234 = !MDLocation(line: 127, column: 9, scope: !33, inlinedAt: !204)
!235 = !MDLocation(line: 128, column: 32, scope: !33, inlinedAt: !204)
!236 = !MDLocation(line: 130, column: 14, scope: !27, inlinedAt: !204)
!237 = !MDLocation(line: 130, column: 7, scope: !27, inlinedAt: !204)
!238 = !MDLocation(line: 133, column: 9, scope: !165, inlinedAt: !204)
!239 = !MDLocation(line: 136, column: 9, scope: !165, inlinedAt: !204)
!240 = !MDLocation(line: 138, column: 7, scope: !27, inlinedAt: !204)
!241 = !MDLocation(line: 111, column: 12, scope: !28, inlinedAt: !204)
!242 = !MDLocation(line: 52, column: 19, scope: !60)
!243 = !MDLocation(line: 52, column: 5, scope: !61)
!244 = !MDLocation(line: 58, column: 28, scope: !59)
!245 = !MDLocation(line: 58, column: 22, scope: !59)
!246 = !MDLocation(line: 63, column: 24, scope: !71)
!247 = !MDLocation(line: 53, column: 14, scope: !59)
!248 = !MDLocation(line: 54, column: 14, scope: !59)
!249 = !MDLocation(line: 58, column: 52, scope: !59)
!250 = !MDLocation(line: 58, column: 46, scope: !59)
!251 = !MDLocation(line: 58, column: 14, scope: !59)
!252 = !MDLocation(line: 59, column: 18, scope: !59)
!253 = !MDLocation(line: 59, column: 14, scope: !59)
!254 = !MDLocation(line: 60, column: 22, scope: !59)
!255 = !MDLocation(line: 60, column: 18, scope: !59)
!256 = !MDLocation(line: 60, column: 14, scope: !59)
!257 = !MDLocation(line: 61, column: 19, scope: !59)
!258 = !MDLocation(line: 61, column: 14, scope: !59)
!259 = !MDLocation(line: 55, column: 11, scope: !59)
!260 = !MDLocation(line: 56, column: 11, scope: !59)
!261 = !MDLocation(line: 63, column: 7, scope: !72)
!262 = !MDLocation(line: 77, column: 7, scope: !80)
!263 = !MDLocation(line: 80, column: 38, scope: !77)
!264 = !MDLocation(line: 80, column: 51, scope: !77)
!265 = !MDLocation(line: 86, column: 22, scope: !83)
!266 = !MDLocation(line: 86, column: 19, scope: !83)
!267 = !MDLocation(line: 86, column: 15, scope: !83)
!268 = !MDLocation(line: 87, column: 22, scope: !83)
!269 = !MDLocation(line: 87, column: 19, scope: !83)
!270 = !MDLocation(line: 87, column: 15, scope: !83)
!271 = !MDLocation(line: 89, column: 28, scope: !83)
!272 = !MDLocation(line: 89, column: 18, scope: !83)
!273 = !MDLocation(line: 90, column: 33, scope: !83)
!274 = !MDLocation(line: 90, column: 28, scope: !83)
!275 = !MDLocation(line: 90, column: 18, scope: !83)
!276 = !MDLocation(line: 92, column: 28, scope: !83)
!277 = !MDLocation(line: 92, column: 47, scope: !83)
!278 = !MDLocation(line: 92, column: 18, scope: !83)
!279 = !MDLocation(line: 93, column: 28, scope: !83)
!280 = !MDLocation(line: 93, column: 47, scope: !83)
!281 = !MDLocation(line: 93, column: 18, scope: !83)
!282 = !MDLocation(line: 95, column: 23, scope: !83)
!283 = !MDLocation(line: 95, column: 11, scope: !83)
!284 = !MDLocation(line: 96, column: 28, scope: !83)
!285 = !MDLocation(line: 96, column: 23, scope: !83)
!286 = !MDLocation(line: 96, column: 11, scope: !83)
!287 = !MDLocation(line: 97, column: 11, scope: !83)
!288 = !MDLocation(line: 98, column: 11, scope: !83)
!289 = !MDLocation(line: 85, column: 9, scope: !85)
!290 = !MDLocation(line: 85, column: 21, scope: !84)
!291 = !MDLocation(line: 80, column: 18, scope: !77)
!292 = !MDLocation(line: 80, column: 29, scope: !77)
!293 = !MDLocation(line: 81, column: 18, scope: !77)
!294 = !MDLocation(line: 64, column: 17, scope: !70)
!295 = !MDLocation(line: 64, column: 13, scope: !70)
!296 = !MDLocation(line: 65, column: 20, scope: !70)
!297 = !MDLocation(line: 65, column: 17, scope: !70)
!298 = !MDLocation(line: 65, column: 13, scope: !70)
!299 = !MDLocation(line: 67, column: 26, scope: !70)
!300 = !MDLocation(line: 67, column: 16, scope: !70)
!301 = !MDLocation(line: 68, column: 31, scope: !70)
!302 = !MDLocation(line: 68, column: 26, scope: !70)
!303 = !MDLocation(line: 68, column: 16, scope: !70)
!304 = !MDLocation(line: 70, column: 21, scope: !70)
!305 = !MDLocation(line: 70, column: 9, scope: !70)
!306 = !MDLocation(line: 71, column: 26, scope: !70)
!307 = !MDLocation(line: 71, column: 21, scope: !70)
!308 = !MDLocation(line: 71, column: 9, scope: !70)
!309 = !MDLocation(line: 72, column: 9, scope: !70)
!310 = !MDLocation(line: 73, column: 9, scope: !70)
!311 = !MDLocation(line: 52, column: 31, scope: !60)
!312 = !MDLocation(line: 52, column: 38, scope: !60)
!313 = !MDLocation(line: 102, column: 3, scope: !47)
!314 = !MDLocation(line: 149, column: 22, scope: !40)
!315 = !MDLocation(line: 149, column: 33, scope: !40)
!316 = !MDLocation(line: 151, column: 13, scope: !40)
!317 = !MDLocation(line: 151, column: 9, scope: !40)
!318 = !MDLocation(line: 152, column: 12, scope: !40)
!319 = !MDLocation(line: 153, column: 9, scope: !40)
!320 = !MDLocation(line: 154, column: 5, scope: !40)
!321 = !MDLocation(line: 159, column: 13, scope: !40)
!322 = !MDLocation(line: 159, column: 10, scope: !40)
!323 = !MDLocation(line: 160, column: 14, scope: !324)
!324 = !{!"0xb\00160\005\007", !1, !325}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/FFT.c]
!325 = !{!"0xb\00160\005\006", !1, !40}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/FFT.c]
!326 = !MDLocation(line: 160, column: 5, scope: !325)
!327 = !MDLocation(line: 161, column: 7, scope: !324)
!328 = distinct !{!328, !329}
!329 = !{!"llvm.loop.unroll.disable"}
!330 = distinct !{!330, !331, !332}
!331 = !{!"llvm.loop.vectorize.width", i32 1}
!332 = !{!"llvm.loop.interleave.count", i32 1}
!333 = distinct !{!333, !329}
!334 = distinct !{!334, !331, !332}
!335 = !MDLocation(line: 163, column: 1, scope: !40)
