; ModuleID = 'Random.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Random_struct = type { [17 x i32], i32, i32, i32, i32, double, double, double }

@dm1 = internal unnamed_addr global double 0.000000e+00, align 8

; Function Attrs: nounwind uwtable
define noalias %struct.Random_struct* @new_Random_seed(i32 %seed) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %seed, i64 0, metadata !31, metadata !94), !dbg !95
  %call = tail call noalias i8* @malloc(i64 112) #3, !dbg !96
  %0 = bitcast i8* %call to %struct.Random_struct*, !dbg !97
  tail call void @llvm.dbg.value(metadata %struct.Random_struct* %0, i64 0, metadata !32, metadata !94), !dbg !98
  tail call void @llvm.dbg.value(metadata %struct.Random_struct* %0, i64 0, metadata !99, metadata !94), !dbg !101
  tail call void @llvm.dbg.value(metadata i32 %seed, i64 0, metadata !102, metadata !94), !dbg !103
  store double 0x3E00000000200000, double* @dm1, align 8, !dbg !104, !tbaa !105
  %seed1.i = getelementptr inbounds i8* %call, i64 68, !dbg !109
  %1 = bitcast i8* %seed1.i to i32*, !dbg !109
  store i32 %seed, i32* %1, align 4, !dbg !109, !tbaa !110
  %cmp.i = icmp slt i32 %seed, 0, !dbg !113
  %sub.i = sub nsw i32 0, %seed, !dbg !115
  tail call void @llvm.dbg.value(metadata i32 %sub.i, i64 0, metadata !102, metadata !94), !dbg !103
  %sub.seed.i = select i1 %cmp.i, i32 %sub.i, i32 %seed, !dbg !116
  tail call void @llvm.dbg.value(metadata i32 %sub.seed.i, i64 0, metadata !117, metadata !94), !dbg !118
  %rem34.i = and i32 %sub.seed.i, 1, !dbg !119
  %sext.i = add i32 %sub.seed.i, -1, !dbg !121
  %jseed.0.i = add i32 %sext.i, %rem34.i, !dbg !121
  tail call void @llvm.dbg.value(metadata i32 9069, i64 0, metadata !122, metadata !94), !dbg !123
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !124, metadata !94), !dbg !125
  %rem6.i = srem i32 %jseed.0.i, 65536, !dbg !126
  tail call void @llvm.dbg.value(metadata i32 %rem6.i, i64 0, metadata !127, metadata !94), !dbg !128
  %div.i = sdiv i32 %jseed.0.i, 65536, !dbg !129
  tail call void @llvm.dbg.value(metadata i32 %div.i, i64 0, metadata !130, metadata !94), !dbg !131
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !132, metadata !94), !dbg !133
  br label %for.body.i, !dbg !134

for.body.i:                                       ; preds = %for.body.i, %entry
  %indvars.iv.i = phi i64 [ 0, %entry ], [ %indvars.iv.next.i, %for.body.i ], !dbg !100
  %j1.036.i = phi i32 [ %div.i, %entry ], [ %rem12.i, %for.body.i ], !dbg !100
  %j0.035.i = phi i32 [ %rem6.i, %entry ], [ %rem13.i, %for.body.i ], !dbg !100
  %mul.i = mul nsw i32 %j0.035.i, 9069, !dbg !136
  tail call void @llvm.dbg.value(metadata i32 %mul.i, i64 0, metadata !117, metadata !94), !dbg !118
  %div8.i = sdiv i32 %mul.i, 65536, !dbg !139
  %mul10.i = mul nsw i32 %j1.036.i, 9069, !dbg !140
  %add11.i = add nsw i32 %div8.i, %mul10.i, !dbg !139
  %rem12.i = srem i32 %add11.i, 32768, !dbg !141
  tail call void @llvm.dbg.value(metadata i32 %rem12.i, i64 0, metadata !130, metadata !94), !dbg !131
  %rem13.i = srem i32 %mul.i, 65536, !dbg !142
  tail call void @llvm.dbg.value(metadata i32 %rem13.i, i64 0, metadata !127, metadata !94), !dbg !128
  %mul14.i = shl i32 %rem12.i, 16, !dbg !143
  %add15.i = add nsw i32 %rem13.i, %mul14.i, !dbg !144
  %arrayidx.i = getelementptr inbounds %struct.Random_struct* %0, i64 0, i32 0, i64 %indvars.iv.i, !dbg !145
  store i32 %add15.i, i32* %arrayidx.i, align 4, !dbg !145, !tbaa !146
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !134
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, 17, !dbg !134
  br i1 %exitcond.i, label %initialize.exit, label %for.body.i, !dbg !134

initialize.exit:                                  ; preds = %for.body.i
  %i.i = getelementptr inbounds i8* %call, i64 72, !dbg !147
  %2 = bitcast i8* %i.i to i32*, !dbg !147
  store i32 4, i32* %2, align 4, !dbg !147, !tbaa !148
  %j.i = getelementptr inbounds i8* %call, i64 76, !dbg !149
  %3 = bitcast i8* %j.i to i32*, !dbg !149
  store i32 16, i32* %3, align 4, !dbg !149, !tbaa !150
  %left = getelementptr inbounds i8* %call, i64 88, !dbg !151
  %4 = bitcast i8* %left to double*, !dbg !151
  store double 0.000000e+00, double* %4, align 8, !dbg !151, !tbaa !152
  %right = getelementptr inbounds i8* %call, i64 96, !dbg !153
  %5 = bitcast i8* %right to <2 x double>*, !dbg !153
  store <2 x double> <double 1.000000e+00, double 1.000000e+00>, <2 x double>* %5, align 8, !dbg !153, !tbaa !105
  %haveRange = getelementptr inbounds i8* %call, i64 80, !dbg !154
  %6 = bitcast i8* %haveRange to i32*, !dbg !154
  store i32 0, i32* %6, align 4, !dbg !154, !tbaa !155
  ret %struct.Random_struct* %0, !dbg !156
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind uwtable
define noalias %struct.Random_struct* @new_Random(i32 %seed, double %left, double %right) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %seed, i64 0, metadata !37, metadata !94), !dbg !157
  tail call void @llvm.dbg.value(metadata double %left, i64 0, metadata !38, metadata !94), !dbg !158
  tail call void @llvm.dbg.value(metadata double %right, i64 0, metadata !39, metadata !94), !dbg !159
  %call = tail call noalias i8* @malloc(i64 112) #3, !dbg !160
  %0 = bitcast i8* %call to %struct.Random_struct*, !dbg !161
  tail call void @llvm.dbg.value(metadata %struct.Random_struct* %0, i64 0, metadata !40, metadata !94), !dbg !162
  tail call void @llvm.dbg.value(metadata %struct.Random_struct* %0, i64 0, metadata !163, metadata !94), !dbg !165
  tail call void @llvm.dbg.value(metadata i32 %seed, i64 0, metadata !166, metadata !94), !dbg !167
  store double 0x3E00000000200000, double* @dm1, align 8, !dbg !168, !tbaa !105
  %seed1.i = getelementptr inbounds i8* %call, i64 68, !dbg !169
  %1 = bitcast i8* %seed1.i to i32*, !dbg !169
  store i32 %seed, i32* %1, align 4, !dbg !169, !tbaa !110
  %cmp.i = icmp slt i32 %seed, 0, !dbg !170
  %sub.i = sub nsw i32 0, %seed, !dbg !171
  tail call void @llvm.dbg.value(metadata i32 %sub.i, i64 0, metadata !166, metadata !94), !dbg !167
  %sub.seed.i = select i1 %cmp.i, i32 %sub.i, i32 %seed, !dbg !172
  tail call void @llvm.dbg.value(metadata i32 %sub.seed.i, i64 0, metadata !173, metadata !94), !dbg !174
  %rem34.i = and i32 %sub.seed.i, 1, !dbg !175
  %sext.i = add i32 %sub.seed.i, -1, !dbg !176
  %jseed.0.i = add i32 %sext.i, %rem34.i, !dbg !176
  tail call void @llvm.dbg.value(metadata i32 9069, i64 0, metadata !177, metadata !94), !dbg !178
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !179, metadata !94), !dbg !180
  %rem6.i = srem i32 %jseed.0.i, 65536, !dbg !181
  tail call void @llvm.dbg.value(metadata i32 %rem6.i, i64 0, metadata !182, metadata !94), !dbg !183
  %div.i = sdiv i32 %jseed.0.i, 65536, !dbg !184
  tail call void @llvm.dbg.value(metadata i32 %div.i, i64 0, metadata !185, metadata !94), !dbg !186
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !187, metadata !94), !dbg !188
  br label %for.body.i, !dbg !189

for.body.i:                                       ; preds = %for.body.i, %entry
  %indvars.iv.i = phi i64 [ 0, %entry ], [ %indvars.iv.next.i, %for.body.i ], !dbg !164
  %j1.036.i = phi i32 [ %div.i, %entry ], [ %rem12.i, %for.body.i ], !dbg !164
  %j0.035.i = phi i32 [ %rem6.i, %entry ], [ %rem13.i, %for.body.i ], !dbg !164
  %mul.i = mul nsw i32 %j0.035.i, 9069, !dbg !190
  tail call void @llvm.dbg.value(metadata i32 %mul.i, i64 0, metadata !173, metadata !94), !dbg !174
  %div8.i = sdiv i32 %mul.i, 65536, !dbg !191
  %mul10.i = mul nsw i32 %j1.036.i, 9069, !dbg !192
  %add11.i = add nsw i32 %div8.i, %mul10.i, !dbg !191
  %rem12.i = srem i32 %add11.i, 32768, !dbg !193
  tail call void @llvm.dbg.value(metadata i32 %rem12.i, i64 0, metadata !185, metadata !94), !dbg !186
  %rem13.i = srem i32 %mul.i, 65536, !dbg !194
  tail call void @llvm.dbg.value(metadata i32 %rem13.i, i64 0, metadata !182, metadata !94), !dbg !183
  %mul14.i = shl i32 %rem12.i, 16, !dbg !195
  %add15.i = add nsw i32 %rem13.i, %mul14.i, !dbg !196
  %arrayidx.i = getelementptr inbounds %struct.Random_struct* %0, i64 0, i32 0, i64 %indvars.iv.i, !dbg !197
  store i32 %add15.i, i32* %arrayidx.i, align 4, !dbg !197, !tbaa !146
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !189
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, 17, !dbg !189
  br i1 %exitcond.i, label %initialize.exit, label %for.body.i, !dbg !189

initialize.exit:                                  ; preds = %for.body.i
  %i.i = getelementptr inbounds i8* %call, i64 72, !dbg !198
  %2 = bitcast i8* %i.i to i32*, !dbg !198
  store i32 4, i32* %2, align 4, !dbg !198, !tbaa !148
  %j.i = getelementptr inbounds i8* %call, i64 76, !dbg !199
  %3 = bitcast i8* %j.i to i32*, !dbg !199
  store i32 16, i32* %3, align 4, !dbg !199, !tbaa !150
  %left1 = getelementptr inbounds i8* %call, i64 88, !dbg !200
  %4 = bitcast i8* %left1 to double*, !dbg !200
  store double %left, double* %4, align 8, !dbg !200, !tbaa !152
  %right2 = getelementptr inbounds i8* %call, i64 96, !dbg !201
  %5 = bitcast i8* %right2 to double*, !dbg !201
  store double %right, double* %5, align 8, !dbg !201, !tbaa !202
  %sub = fsub double %right, %left, !dbg !203
  %width = getelementptr inbounds i8* %call, i64 104, !dbg !204
  %6 = bitcast i8* %width to double*, !dbg !204
  store double %sub, double* %6, align 8, !dbg !204, !tbaa !205
  %haveRange = getelementptr inbounds i8* %call, i64 80, !dbg !206
  %7 = bitcast i8* %haveRange to i32*, !dbg !206
  store i32 1, i32* %7, align 4, !dbg !206, !tbaa !155
  ret %struct.Random_struct* %0, !dbg !207
}

; Function Attrs: nounwind uwtable
define void @Random_delete(%struct.Random_struct* nocapture %R) #0 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.Random_struct* %R, i64 0, metadata !45, metadata !94), !dbg !208
  %0 = bitcast %struct.Random_struct* %R to i8*, !dbg !209
  tail call void @free(i8* %0) #3, !dbg !210
  ret void, !dbg !211
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #1

; Function Attrs: nounwind uwtable
define double @Random_nextDouble(%struct.Random_struct* nocapture %R) #0 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.Random_struct* %R, i64 0, metadata !50, metadata !94), !dbg !212
  %i = getelementptr inbounds %struct.Random_struct* %R, i64 0, i32 2, !dbg !213
  %0 = load i32* %i, align 4, !dbg !213, !tbaa !148
  tail call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !52, metadata !94), !dbg !214
  %j = getelementptr inbounds %struct.Random_struct* %R, i64 0, i32 3, !dbg !215
  %1 = load i32* %j, align 4, !dbg !215, !tbaa !150
  tail call void @llvm.dbg.value(metadata i32 %1, i64 0, metadata !53, metadata !94), !dbg !216
  %idxprom = sext i32 %0 to i64, !dbg !217
  %arrayidx = getelementptr inbounds %struct.Random_struct* %R, i64 0, i32 0, i64 %idxprom, !dbg !217
  %2 = load i32* %arrayidx, align 4, !dbg !217, !tbaa !146
  %idxprom2 = sext i32 %1 to i64, !dbg !218
  %arrayidx3 = getelementptr inbounds %struct.Random_struct* %R, i64 0, i32 0, i64 %idxprom2, !dbg !218
  %3 = load i32* %arrayidx3, align 4, !dbg !218, !tbaa !146
  %sub = sub nsw i32 %2, %3, !dbg !217
  tail call void @llvm.dbg.value(metadata i32 %sub, i64 0, metadata !51, metadata !94), !dbg !219
  %cmp = icmp slt i32 %sub, 0, !dbg !220
  %add = add nsw i32 %sub, 2147483647, !dbg !222
  tail call void @llvm.dbg.value(metadata i32 %add, i64 0, metadata !51, metadata !94), !dbg !219
  %add.sub = select i1 %cmp, i32 %add, i32 %sub, !dbg !224
  store i32 %add.sub, i32* %arrayidx3, align 4, !dbg !225, !tbaa !146
  %cmp7 = icmp eq i32 %0, 0, !dbg !226
  %dec = add nsw i32 %0, -1, !dbg !228
  tail call void @llvm.dbg.value(metadata i32 %dec, i64 0, metadata !52, metadata !94), !dbg !214
  %I.0 = select i1 %cmp7, i32 16, i32 %dec, !dbg !229
  store i32 %I.0, i32* %i, align 4, !dbg !230, !tbaa !148
  %cmp11 = icmp eq i32 %1, 0, !dbg !231
  %dec14 = add nsw i32 %1, -1, !dbg !233
  tail call void @llvm.dbg.value(metadata i32 %dec14, i64 0, metadata !53, metadata !94), !dbg !216
  %J.0 = select i1 %cmp11, i32 16, i32 %dec14, !dbg !234
  store i32 %J.0, i32* %j, align 4, !dbg !235, !tbaa !150
  %haveRange = getelementptr inbounds %struct.Random_struct* %R, i64 0, i32 4, !dbg !236
  %4 = load i32* %haveRange, align 4, !dbg !236, !tbaa !155
  %tobool = icmp eq i32 %4, 0, !dbg !238
  br i1 %tobool, label %if.else20, label %if.then17, !dbg !238

if.then17:                                        ; preds = %entry
  %left = getelementptr inbounds %struct.Random_struct* %R, i64 0, i32 5, !dbg !239
  %5 = load double* %left, align 8, !dbg !239, !tbaa !152
  %6 = load double* @dm1, align 8, !dbg !240, !tbaa !105
  %conv = sitofp i32 %add.sub to double, !dbg !241
  %mul = fmul double %conv, %6, !dbg !240
  %width = getelementptr inbounds %struct.Random_struct* %R, i64 0, i32 7, !dbg !242
  %7 = load double* %width, align 8, !dbg !242, !tbaa !205
  %mul18 = fmul double %mul, %7, !dbg !240
  %add19 = fadd double %5, %mul18, !dbg !239
  br label %return, !dbg !243

if.else20:                                        ; preds = %entry
  %8 = load double* @dm1, align 8, !dbg !244, !tbaa !105
  %conv21 = sitofp i32 %add.sub to double, !dbg !245
  %mul22 = fmul double %conv21, %8, !dbg !244
  br label %return, !dbg !246

return:                                           ; preds = %if.else20, %if.then17
  %retval.0 = phi double [ %add19, %if.then17 ], [ %mul22, %if.else20 ]
  ret double %retval.0, !dbg !247
}

; Function Attrs: nounwind uwtable
define noalias double* @RandomVector(i32 %N, %struct.Random_struct* nocapture %R) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %N, i64 0, metadata !60, metadata !94), !dbg !248
  tail call void @llvm.dbg.value(metadata %struct.Random_struct* %R, i64 0, metadata !61, metadata !94), !dbg !249
  %conv = sext i32 %N to i64, !dbg !250
  %mul = shl nsw i64 %conv, 3, !dbg !251
  %call = tail call noalias i8* @malloc(i64 %mul) #3, !dbg !252
  %0 = bitcast i8* %call to double*, !dbg !253
  tail call void @llvm.dbg.value(metadata double* %0, i64 0, metadata !63, metadata !94), !dbg !254
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !62, metadata !94), !dbg !255
  %cmp7 = icmp sgt i32 %N, 0, !dbg !256
  br i1 %cmp7, label %for.body.lr.ph, label %for.end, !dbg !259

for.body.lr.ph:                                   ; preds = %entry
  %i.i = getelementptr inbounds %struct.Random_struct* %R, i64 0, i32 2, !dbg !260
  %j.i = getelementptr inbounds %struct.Random_struct* %R, i64 0, i32 3, !dbg !262
  %haveRange.i = getelementptr inbounds %struct.Random_struct* %R, i64 0, i32 4, !dbg !263
  %left.i = getelementptr inbounds %struct.Random_struct* %R, i64 0, i32 5, !dbg !264
  %width.i = getelementptr inbounds %struct.Random_struct* %R, i64 0, i32 7, !dbg !265
  %1 = add i32 %N, -1, !dbg !259
  %.pre = load i32* %i.i, align 4, !dbg !260, !tbaa !148
  %.pre9 = load i32* %j.i, align 4, !dbg !262, !tbaa !150
  br label %for.body, !dbg !259

for.body:                                         ; preds = %Random_nextDouble.exit, %for.body.lr.ph
  %2 = phi i32 [ %.pre9, %for.body.lr.ph ], [ %J.0.i, %Random_nextDouble.exit ], !dbg !266
  %3 = phi i32 [ %.pre, %for.body.lr.ph ], [ %I.0.i, %Random_nextDouble.exit ], !dbg !266
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %Random_nextDouble.exit ]
  tail call void @llvm.dbg.value(metadata %struct.Random_struct* %R, i64 0, metadata !267, metadata !94), !dbg !266
  tail call void @llvm.dbg.value(metadata i32 %3, i64 0, metadata !268, metadata !94), !dbg !269
  tail call void @llvm.dbg.value(metadata i32 %2, i64 0, metadata !270, metadata !94), !dbg !271
  %idxprom.i = sext i32 %3 to i64, !dbg !272
  %arrayidx.i = getelementptr inbounds %struct.Random_struct* %R, i64 0, i32 0, i64 %idxprom.i, !dbg !272
  %4 = load i32* %arrayidx.i, align 4, !dbg !272, !tbaa !146
  %idxprom2.i = sext i32 %2 to i64, !dbg !273
  %arrayidx3.i = getelementptr inbounds %struct.Random_struct* %R, i64 0, i32 0, i64 %idxprom2.i, !dbg !273
  %5 = load i32* %arrayidx3.i, align 4, !dbg !273, !tbaa !146
  %sub.i = sub nsw i32 %4, %5, !dbg !272
  tail call void @llvm.dbg.value(metadata i32 %sub.i, i64 0, metadata !274, metadata !94), !dbg !275
  %cmp.i = icmp slt i32 %sub.i, 0, !dbg !276
  %add.i = add nsw i32 %sub.i, 2147483647, !dbg !277
  tail call void @llvm.dbg.value(metadata i32 %add.i, i64 0, metadata !274, metadata !94), !dbg !275
  %add.sub.i = select i1 %cmp.i, i32 %add.i, i32 %sub.i, !dbg !278
  store i32 %add.sub.i, i32* %arrayidx3.i, align 4, !dbg !279, !tbaa !146
  %cmp7.i = icmp eq i32 %3, 0, !dbg !280
  %dec.i = add nsw i32 %3, -1, !dbg !281
  tail call void @llvm.dbg.value(metadata i32 %dec.i, i64 0, metadata !268, metadata !94), !dbg !269
  %I.0.i = select i1 %cmp7.i, i32 16, i32 %dec.i, !dbg !282
  store i32 %I.0.i, i32* %i.i, align 4, !dbg !283, !tbaa !148
  %cmp11.i = icmp eq i32 %2, 0, !dbg !284
  %dec14.i = add nsw i32 %2, -1, !dbg !285
  tail call void @llvm.dbg.value(metadata i32 %dec14.i, i64 0, metadata !270, metadata !94), !dbg !271
  %J.0.i = select i1 %cmp11.i, i32 16, i32 %dec14.i, !dbg !286
  store i32 %J.0.i, i32* %j.i, align 4, !dbg !287, !tbaa !150
  %6 = load i32* %haveRange.i, align 4, !dbg !263, !tbaa !155
  %tobool.i = icmp eq i32 %6, 0, !dbg !288
  br i1 %tobool.i, label %if.else20.i, label %if.then17.i, !dbg !288

if.then17.i:                                      ; preds = %for.body
  %7 = load double* %left.i, align 8, !dbg !264, !tbaa !152
  %8 = load double* @dm1, align 8, !dbg !289, !tbaa !105
  %conv.i = sitofp i32 %add.sub.i to double, !dbg !290
  %mul.i = fmul double %conv.i, %8, !dbg !289
  %9 = load double* %width.i, align 8, !dbg !265, !tbaa !205
  %mul18.i = fmul double %mul.i, %9, !dbg !289
  %add19.i = fadd double %7, %mul18.i, !dbg !264
  br label %Random_nextDouble.exit, !dbg !291

if.else20.i:                                      ; preds = %for.body
  %10 = load double* @dm1, align 8, !dbg !292, !tbaa !105
  %conv21.i = sitofp i32 %add.sub.i to double, !dbg !293
  %mul22.i = fmul double %conv21.i, %10, !dbg !292
  br label %Random_nextDouble.exit, !dbg !294

Random_nextDouble.exit:                           ; preds = %if.then17.i, %if.else20.i
  %retval.0.i = phi double [ %add19.i, %if.then17.i ], [ %mul22.i, %if.else20.i ], !dbg !261
  %arrayidx = getelementptr inbounds double* %0, i64 %indvars.iv, !dbg !295
  store double %retval.0.i, double* %arrayidx, align 8, !dbg !295, !tbaa !105
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !259
  %lftr.wideiv = trunc i64 %indvars.iv to i32, !dbg !259
  %exitcond = icmp eq i32 %lftr.wideiv, %1, !dbg !259
  br i1 %exitcond, label %for.end.loopexit, label %for.body, !dbg !259

for.end.loopexit:                                 ; preds = %Random_nextDouble.exit
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  ret double* %0, !dbg !296
}

; Function Attrs: nounwind uwtable
define noalias double** @RandomMatrix(i32 %M, i32 %N, %struct.Random_struct* nocapture %R) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %M, i64 0, metadata !68, metadata !94), !dbg !297
  tail call void @llvm.dbg.value(metadata i32 %N, i64 0, metadata !69, metadata !94), !dbg !298
  tail call void @llvm.dbg.value(metadata %struct.Random_struct* %R, i64 0, metadata !70, metadata !94), !dbg !299
  %conv = sext i32 %M to i64, !dbg !300
  %mul = shl nsw i64 %conv, 3, !dbg !301
  %call = tail call noalias i8* @malloc(i64 %mul) #3, !dbg !302
  %0 = bitcast i8* %call to double**, !dbg !303
  tail call void @llvm.dbg.value(metadata double** %0, i64 0, metadata !73, metadata !94), !dbg !304
  %cmp = icmp eq i8* %call, null, !dbg !305
  br i1 %cmp, label %return, label %for.cond.preheader, !dbg !307

for.cond.preheader:                               ; preds = %entry
  %cmp240 = icmp sgt i32 %M, 0, !dbg !308
  br i1 %cmp240, label %for.body.lr.ph, label %return, !dbg !311

for.body.lr.ph:                                   ; preds = %for.cond.preheader
  %conv4 = sext i32 %N to i64, !dbg !312
  %mul5 = shl nsw i64 %conv4, 3, !dbg !314
  %cmp1438 = icmp sgt i32 %N, 0, !dbg !315
  %i.i = getelementptr inbounds %struct.Random_struct* %R, i64 0, i32 2, !dbg !318
  %j.i = getelementptr inbounds %struct.Random_struct* %R, i64 0, i32 3, !dbg !320
  %haveRange.i = getelementptr inbounds %struct.Random_struct* %R, i64 0, i32 4, !dbg !321
  %left.i = getelementptr inbounds %struct.Random_struct* %R, i64 0, i32 5, !dbg !322
  %width.i = getelementptr inbounds %struct.Random_struct* %R, i64 0, i32 7, !dbg !323
  br i1 %cmp1438, label %for.body.lr.ph.split.us, label %for.body.preheader

for.body.preheader:                               ; preds = %for.body.lr.ph
  br label %for.body, !dbg !324

for.body.lr.ph.split.us:                          ; preds = %for.body.lr.ph
  %1 = add i32 %N, -1, !dbg !311
  br label %for.body.us, !dbg !311

for.body.us:                                      ; preds = %for.inc22.us, %for.body.lr.ph.split.us
  %indvars.iv44 = phi i64 [ %indvars.iv.next45, %for.inc22.us ], [ 0, %for.body.lr.ph.split.us ]
  %call6.us = tail call noalias i8* @malloc(i64 %mul5) #3, !dbg !324
  %arrayidx.us = getelementptr inbounds double** %0, i64 %indvars.iv44, !dbg !325
  %2 = bitcast double** %arrayidx.us to i8**, !dbg !325
  store i8* %call6.us, i8** %2, align 8, !dbg !325, !tbaa !326
  %cmp9.us = icmp eq i8* %call6.us, null, !dbg !328
  %3 = bitcast i8* %call6.us to double*
  br i1 %cmp9.us, label %if.then11.loopexit, label %for.body16.us.preheader, !dbg !330

for.body16.us.preheader:                          ; preds = %for.body.us
  br label %for.body16.us, !dbg !331

for.inc22.us:                                     ; preds = %Random_nextDouble.exit.us
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1, !dbg !311
  %cmp2.us = icmp slt i64 %indvars.iv.next45, %conv, !dbg !308
  br i1 %cmp2.us, label %for.body.us, label %return.loopexit, !dbg !311

for.body16.us:                                    ; preds = %for.body16.us.preheader, %Random_nextDouble.exit.us
  %indvars.iv42 = phi i64 [ %indvars.iv.next43, %Random_nextDouble.exit.us ], [ 0, %for.body16.us.preheader ]
  tail call void @llvm.dbg.value(metadata %struct.Random_struct* %R, i64 0, metadata !332, metadata !94), !dbg !331
  %4 = load i32* %i.i, align 4, !dbg !318, !tbaa !148
  tail call void @llvm.dbg.value(metadata i32 %4, i64 0, metadata !333, metadata !94), !dbg !334
  %5 = load i32* %j.i, align 4, !dbg !320, !tbaa !150
  tail call void @llvm.dbg.value(metadata i32 %5, i64 0, metadata !335, metadata !94), !dbg !336
  %idxprom.i.us = sext i32 %4 to i64, !dbg !337
  %arrayidx.i.us = getelementptr inbounds %struct.Random_struct* %R, i64 0, i32 0, i64 %idxprom.i.us, !dbg !337
  %6 = load i32* %arrayidx.i.us, align 4, !dbg !337, !tbaa !146
  %idxprom2.i.us = sext i32 %5 to i64, !dbg !338
  %arrayidx3.i.us = getelementptr inbounds %struct.Random_struct* %R, i64 0, i32 0, i64 %idxprom2.i.us, !dbg !338
  %7 = load i32* %arrayidx3.i.us, align 4, !dbg !338, !tbaa !146
  %sub.i.us = sub nsw i32 %6, %7, !dbg !337
  tail call void @llvm.dbg.value(metadata i32 %sub.i.us, i64 0, metadata !339, metadata !94), !dbg !340
  %cmp.i.us = icmp slt i32 %sub.i.us, 0, !dbg !341
  %add.i.us = add nsw i32 %sub.i.us, 2147483647, !dbg !342
  tail call void @llvm.dbg.value(metadata i32 %add.i.us, i64 0, metadata !339, metadata !94), !dbg !340
  %add.sub.i.us = select i1 %cmp.i.us, i32 %add.i.us, i32 %sub.i.us, !dbg !343
  store i32 %add.sub.i.us, i32* %arrayidx3.i.us, align 4, !dbg !344, !tbaa !146
  %cmp7.i.us = icmp eq i32 %4, 0, !dbg !345
  %dec.i.us = add nsw i32 %4, -1, !dbg !346
  tail call void @llvm.dbg.value(metadata i32 %dec.i.us, i64 0, metadata !333, metadata !94), !dbg !334
  %I.0.i.us = select i1 %cmp7.i.us, i32 16, i32 %dec.i.us, !dbg !347
  store i32 %I.0.i.us, i32* %i.i, align 4, !dbg !348, !tbaa !148
  %cmp11.i.us = icmp eq i32 %5, 0, !dbg !349
  %dec14.i.us = add nsw i32 %5, -1, !dbg !350
  tail call void @llvm.dbg.value(metadata i32 %dec14.i.us, i64 0, metadata !335, metadata !94), !dbg !336
  %J.0.i.us = select i1 %cmp11.i.us, i32 16, i32 %dec14.i.us, !dbg !351
  store i32 %J.0.i.us, i32* %j.i, align 4, !dbg !352, !tbaa !150
  %8 = load i32* %haveRange.i, align 4, !dbg !321, !tbaa !155
  %tobool.i.us = icmp eq i32 %8, 0, !dbg !353
  br i1 %tobool.i.us, label %if.else20.i.us, label %if.then17.i.us, !dbg !353

if.then17.i.us:                                   ; preds = %for.body16.us
  %9 = load double* %left.i, align 8, !dbg !322, !tbaa !152
  %10 = load double* @dm1, align 8, !dbg !354, !tbaa !105
  %conv.i.us = sitofp i32 %add.sub.i.us to double, !dbg !355
  %mul.i.us = fmul double %conv.i.us, %10, !dbg !354
  %11 = load double* %width.i, align 8, !dbg !323, !tbaa !205
  %mul18.i.us = fmul double %mul.i.us, %11, !dbg !354
  %add19.i.us = fadd double %9, %mul18.i.us, !dbg !322
  br label %Random_nextDouble.exit.us, !dbg !356

if.else20.i.us:                                   ; preds = %for.body16.us
  %12 = load double* @dm1, align 8, !dbg !357, !tbaa !105
  %conv21.i.us = sitofp i32 %add.sub.i.us to double, !dbg !358
  %mul22.i.us = fmul double %conv21.i.us, %12, !dbg !357
  br label %Random_nextDouble.exit.us, !dbg !359

Random_nextDouble.exit.us:                        ; preds = %if.else20.i.us, %if.then17.i.us
  %retval.0.i.us = phi double [ %add19.i.us, %if.then17.i.us ], [ %mul22.i.us, %if.else20.i.us ], !dbg !319
  %arrayidx21.us = getelementptr inbounds double* %3, i64 %indvars.iv42, !dbg !360
  store double %retval.0.i.us, double* %arrayidx21.us, align 8, !dbg !360, !tbaa !105
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1, !dbg !361
  %lftr.wideiv = trunc i64 %indvars.iv42 to i32, !dbg !361
  %exitcond = icmp eq i32 %lftr.wideiv, %1, !dbg !361
  br i1 %exitcond, label %for.inc22.us, label %for.body16.us, !dbg !361

for.body:                                         ; preds = %for.body.preheader, %for.inc22
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc22 ], [ 0, %for.body.preheader ]
  %call6 = tail call noalias i8* @malloc(i64 %mul5) #3, !dbg !324
  %arrayidx = getelementptr inbounds double** %0, i64 %indvars.iv, !dbg !325
  %13 = bitcast double** %arrayidx to i8**, !dbg !325
  store i8* %call6, i8** %13, align 8, !dbg !325, !tbaa !326
  %cmp9 = icmp eq i8* %call6, null, !dbg !328
  br i1 %cmp9, label %if.then11.loopexit48, label %for.inc22, !dbg !330

if.then11.loopexit:                               ; preds = %for.body.us
  br label %if.then11

if.then11.loopexit48:                             ; preds = %for.body
  br label %if.then11

if.then11:                                        ; preds = %if.then11.loopexit48, %if.then11.loopexit
  tail call void @free(i8* %call) #3, !dbg !362
  br label %return, !dbg !364

for.inc22:                                        ; preds = %for.body
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !311
  %cmp2 = icmp slt i64 %indvars.iv.next, %conv, !dbg !308
  br i1 %cmp2, label %for.body, label %return.loopexit49, !dbg !311

return.loopexit:                                  ; preds = %for.inc22.us
  br label %return

return.loopexit49:                                ; preds = %for.inc22
  br label %return

return:                                           ; preds = %return.loopexit49, %return.loopexit, %for.cond.preheader, %entry, %if.then11
  %retval.0 = phi double** [ null, %if.then11 ], [ null, %entry ], [ %0, %for.cond.preheader ], [ %0, %return.loopexit ], [ %0, %return.loopexit49 ]
  ret double** %retval.0, !dbg !365
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!91, !92}
!llvm.ident = !{!93}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !25, !86, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/Random.c] [DW_LANG_C99]
!1 = !{!"Random.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C"}
!2 = !{}
!3 = !{!4, !19, !22, !23, !24}
!4 = !{!"0x16\00Random\0012\000\000\000\000", !5, null, !6} ; [ DW_TAG_typedef ] [Random] [line 12, size 0, align 0, offset 0] [from ]
!5 = !{!"./Random.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C"}
!6 = !{!"0xf\00\000\0064\0064\000\000", null, null, !7} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!7 = !{!"0x13\00\001\00896\0064\000\000\000", !5, null, null, !8, null, null, null} ; [ DW_TAG_structure_type ] [line 1, size 896, align 64, offset 0] [def] [from ]
!8 = !{!9, !14, !15, !16, !17, !18, !20, !21}
!9 = !{!"0xd\00m\003\00544\0032\000\000", !5, !7, !10} ; [ DW_TAG_member ] [m] [line 3, size 544, align 32, offset 0] [from ]
!10 = !{!"0x1\00\000\00544\0032\000\000\000", null, null, !11, !12, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 544, align 32, offset 0] [from int]
!11 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!12 = !{!13}
!13 = !{!"0x21\000\0017"}                         ; [ DW_TAG_subrange_type ] [0, 16]
!14 = !{!"0xd\00seed\004\0032\0032\00544\000", !5, !7, !11} ; [ DW_TAG_member ] [seed] [line 4, size 32, align 32, offset 544] [from int]
!15 = !{!"0xd\00i\005\0032\0032\00576\000", !5, !7, !11} ; [ DW_TAG_member ] [i] [line 5, size 32, align 32, offset 576] [from int]
!16 = !{!"0xd\00j\006\0032\0032\00608\000", !5, !7, !11} ; [ DW_TAG_member ] [j] [line 6, size 32, align 32, offset 608] [from int]
!17 = !{!"0xd\00haveRange\007\0032\0032\00640\000", !5, !7, !11} ; [ DW_TAG_member ] [haveRange] [line 7, size 32, align 32, offset 640] [from int]
!18 = !{!"0xd\00left\008\0064\0064\00704\000", !5, !7, !19} ; [ DW_TAG_member ] [left] [line 8, size 64, align 64, offset 704] [from double]
!19 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!20 = !{!"0xd\00right\009\0064\0064\00768\000", !5, !7, !19} ; [ DW_TAG_member ] [right] [line 9, size 64, align 64, offset 768] [from double]
!21 = !{!"0xd\00width\0010\0064\0064\00832\000", !5, !7, !19} ; [ DW_TAG_member ] [width] [line 10, size 64, align 64, offset 832] [from double]
!22 = !{!"0xf\00\000\0064\0064\000\000", null, null, !19} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!23 = !{!"0xf\00\000\0064\0064\000\000", null, null, !22} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!24 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!25 = !{!26, !33, !41, !46, !56, !64, !74}
!26 = !{!"0x2e\00new_Random_seed\00new_Random_seed\00\0035\000\001\000\000\00256\001\0036", !1, !27, !28, null, %struct.Random_struct* (i32)* @new_Random_seed, null, null, !30} ; [ DW_TAG_subprogram ] [line 35] [def] [scope 36] [new_Random_seed]
!27 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/Random.c]
!28 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !29, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!29 = !{!4, !11}
!30 = !{!31, !32}
!31 = !{!"0x101\00seed\0016777251\000", !26, !27, !11} ; [ DW_TAG_arg_variable ] [seed] [line 35]
!32 = !{!"0x100\00R\0037\000", !26, !27, !4}      ; [ DW_TAG_auto_variable ] [R] [line 37]
!33 = !{!"0x2e\00new_Random\00new_Random\00\0048\000\001\000\000\00256\001\0049", !1, !27, !34, null, %struct.Random_struct* (i32, double, double)* @new_Random, null, null, !36} ; [ DW_TAG_subprogram ] [line 48] [def] [scope 49] [new_Random]
!34 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !35, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!35 = !{!4, !11, !19, !19}
!36 = !{!37, !38, !39, !40}
!37 = !{!"0x101\00seed\0016777264\000", !33, !27, !11} ; [ DW_TAG_arg_variable ] [seed] [line 48]
!38 = !{!"0x101\00left\0033554480\000", !33, !27, !19} ; [ DW_TAG_arg_variable ] [left] [line 48]
!39 = !{!"0x101\00right\0050331696\000", !33, !27, !19} ; [ DW_TAG_arg_variable ] [right] [line 48]
!40 = !{!"0x100\00R\0050\000", !33, !27, !4}      ; [ DW_TAG_auto_variable ] [R] [line 50]
!41 = !{!"0x2e\00Random_delete\00Random_delete\00\0061\000\001\000\000\00256\001\0062", !1, !27, !42, null, void (%struct.Random_struct*)* @Random_delete, null, null, !44} ; [ DW_TAG_subprogram ] [line 61] [def] [scope 62] [Random_delete]
!42 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !43, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!43 = !{null, !4}
!44 = !{!45}
!45 = !{!"0x101\00R\0016777277\000", !41, !27, !4} ; [ DW_TAG_arg_variable ] [R] [line 61]
!46 = !{!"0x2e\00Random_nextDouble\00Random_nextDouble\00\0070\000\001\000\000\00256\001\0071", !1, !27, !47, null, double (%struct.Random_struct*)* @Random_nextDouble, null, null, !49} ; [ DW_TAG_subprogram ] [line 70] [def] [scope 71] [Random_nextDouble]
!47 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !48, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!48 = !{!19, !4}
!49 = !{!50, !51, !52, !53, !54}
!50 = !{!"0x101\00R\0016777286\000", !46, !27, !4} ; [ DW_TAG_arg_variable ] [R] [line 70]
!51 = !{!"0x100\00k\0072\000", !46, !27, !11}     ; [ DW_TAG_auto_variable ] [k] [line 72]
!52 = !{!"0x100\00I\0074\000", !46, !27, !11}     ; [ DW_TAG_auto_variable ] [I] [line 74]
!53 = !{!"0x100\00J\0075\000", !46, !27, !11}     ; [ DW_TAG_auto_variable ] [J] [line 75]
!54 = !{!"0x100\00m\0076\000", !46, !27, !55}     ; [ DW_TAG_auto_variable ] [m] [line 76]
!55 = !{!"0xf\00\000\0064\0064\000\000", null, null, !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!56 = !{!"0x2e\00RandomVector\00RandomVector\00\00134\000\001\000\000\00256\001\00135", !1, !27, !57, null, double* (i32, %struct.Random_struct*)* @RandomVector, null, null, !59} ; [ DW_TAG_subprogram ] [line 134] [def] [scope 135] [RandomVector]
!57 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !58, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!58 = !{!22, !11, !4}
!59 = !{!60, !61, !62, !63}
!60 = !{!"0x101\00N\0016777350\000", !56, !27, !11} ; [ DW_TAG_arg_variable ] [N] [line 134]
!61 = !{!"0x101\00R\0033554566\000", !56, !27, !4} ; [ DW_TAG_arg_variable ] [R] [line 134]
!62 = !{!"0x100\00i\00136\000", !56, !27, !11}    ; [ DW_TAG_auto_variable ] [i] [line 136]
!63 = !{!"0x100\00x\00137\000", !56, !27, !22}    ; [ DW_TAG_auto_variable ] [x] [line 137]
!64 = !{!"0x2e\00RandomMatrix\00RandomMatrix\00\00146\000\001\000\000\00256\001\00147", !1, !27, !65, null, double** (i32, i32, %struct.Random_struct*)* @RandomMatrix, null, null, !67} ; [ DW_TAG_subprogram ] [line 146] [def] [scope 147] [RandomMatrix]
!65 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !66, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!66 = !{!23, !11, !11, !4}
!67 = !{!68, !69, !70, !71, !72, !73}
!68 = !{!"0x101\00M\0016777362\000", !64, !27, !11} ; [ DW_TAG_arg_variable ] [M] [line 146]
!69 = !{!"0x101\00N\0033554578\000", !64, !27, !11} ; [ DW_TAG_arg_variable ] [N] [line 146]
!70 = !{!"0x101\00R\0050331794\000", !64, !27, !4} ; [ DW_TAG_arg_variable ] [R] [line 146]
!71 = !{!"0x100\00i\00148\000", !64, !27, !11}    ; [ DW_TAG_auto_variable ] [i] [line 148]
!72 = !{!"0x100\00j\00149\000", !64, !27, !11}    ; [ DW_TAG_auto_variable ] [j] [line 149]
!73 = !{!"0x100\00A\00153\000", !64, !27, !23}    ; [ DW_TAG_auto_variable ] [A] [line 153]
!74 = !{!"0x2e\00initialize\00initialize\00\00106\001\001\000\000\00256\001\00107", !1, !27, !75, null, null, null, null, !77} ; [ DW_TAG_subprogram ] [line 106] [local] [def] [scope 107] [initialize]
!75 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !76, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!76 = !{null, !4, !11}
!77 = !{!78, !79, !80, !81, !82, !83, !84, !85}
!78 = !{!"0x101\00R\0016777322\000", !74, !27, !4} ; [ DW_TAG_arg_variable ] [R] [line 106]
!79 = !{!"0x101\00seed\0033554538\000", !74, !27, !11} ; [ DW_TAG_arg_variable ] [seed] [line 106]
!80 = !{!"0x100\00jseed\00109\000", !74, !27, !11} ; [ DW_TAG_auto_variable ] [jseed] [line 109]
!81 = !{!"0x100\00k0\00109\000", !74, !27, !11}   ; [ DW_TAG_auto_variable ] [k0] [line 109]
!82 = !{!"0x100\00k1\00109\000", !74, !27, !11}   ; [ DW_TAG_auto_variable ] [k1] [line 109]
!83 = !{!"0x100\00j0\00109\000", !74, !27, !11}   ; [ DW_TAG_auto_variable ] [j0] [line 109]
!84 = !{!"0x100\00j1\00109\000", !74, !27, !11}   ; [ DW_TAG_auto_variable ] [j1] [line 109]
!85 = !{!"0x100\00iloop\00109\000", !74, !27, !11} ; [ DW_TAG_auto_variable ] [iloop] [line 109]
!86 = !{!87, !89, !90}
!87 = !{!"0x34\00m1\00m1\00\0017\001\001", null, !27, !88, i32 2147483647, null} ; [ DW_TAG_variable ] [m1] [line 17] [local] [def]
!88 = !{!"0x26\00\000\000\000\000\000", null, null, !11} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from int]
!89 = !{!"0x34\00dm1\00dm1\00\0028\001\001", null, !27, !19, double* @dm1, null} ; [ DW_TAG_variable ] [dm1] [line 28] [local] [def]
!90 = !{!"0x34\00m2\00m2\00\0018\001\001", null, !27, !88, i32 65536, null} ; [ DW_TAG_variable ] [m2] [line 18] [local] [def]
!91 = !{i32 2, !"Dwarf Version", i32 4}
!92 = !{i32 2, !"Debug Info Version", i32 2}
!93 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!94 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!95 = !MDLocation(line: 35, column: 28, scope: !26)
!96 = !MDLocation(line: 37, column: 25, scope: !26)
!97 = !MDLocation(line: 37, column: 16, scope: !26)
!98 = !MDLocation(line: 37, column: 12, scope: !26)
!99 = !{!"0x101\00R\0016777322\000", !74, !27, !4, !100} ; [ DW_TAG_arg_variable ] [R] [line 106]
!100 = !MDLocation(line: 39, column: 5, scope: !26)
!101 = !MDLocation(line: 106, column: 31, scope: !74, inlinedAt: !100)
!102 = !{!"0x101\00seed\0033554538\000", !74, !27, !11, !100} ; [ DW_TAG_arg_variable ] [seed] [line 106]
!103 = !MDLocation(line: 106, column: 38, scope: !74, inlinedAt: !100)
!104 = !MDLocation(line: 111, column: 5, scope: !74, inlinedAt: !100)
!105 = !{!106, !106, i64 0}
!106 = !{!"double", !107, i64 0}
!107 = !{!"omnipotent char", !108, i64 0}
!108 = !{!"Simple C/C++ TBAA"}
!109 = !MDLocation(line: 113, column: 5, scope: !74, inlinedAt: !100)
!110 = !{!111, !112, i64 68}
!111 = !{!"", !107, i64 0, !112, i64 68, !112, i64 72, !112, i64 76, !112, i64 80, !106, i64 88, !106, i64 96, !106, i64 104}
!112 = !{!"int", !107, i64 0}
!113 = !MDLocation(line: 115, column: 9, scope: !114, inlinedAt: !100)
!114 = !{!"0xb\00115\009\0014", !1, !74}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/Random.c]
!115 = !MDLocation(line: 115, column: 27, scope: !114, inlinedAt: !100)
!116 = !MDLocation(line: 115, column: 9, scope: !74, inlinedAt: !100)
!117 = !{!"0x100\00jseed\00109\000", !74, !27, !11, !100} ; [ DW_TAG_auto_variable ] [jseed] [line 109]
!118 = !MDLocation(line: 109, column: 9, scope: !74, inlinedAt: !100)
!119 = !MDLocation(line: 117, column: 9, scope: !120, inlinedAt: !100)
!120 = !{!"0xb\00117\009\0015", !1, !74}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/Random.c]
!121 = !MDLocation(line: 117, column: 9, scope: !74, inlinedAt: !100)
!122 = !{!"0x100\00k0\00109\000", !74, !27, !11, !100} ; [ DW_TAG_auto_variable ] [k0] [line 109]
!123 = !MDLocation(line: 109, column: 16, scope: !74, inlinedAt: !100)
!124 = !{!"0x100\00k1\00109\000", !74, !27, !11, !100} ; [ DW_TAG_auto_variable ] [k1] [line 109]
!125 = !MDLocation(line: 109, column: 20, scope: !74, inlinedAt: !100)
!126 = !MDLocation(line: 120, column: 10, scope: !74, inlinedAt: !100)
!127 = !{!"0x100\00j0\00109\000", !74, !27, !11, !100} ; [ DW_TAG_auto_variable ] [j0] [line 109]
!128 = !MDLocation(line: 109, column: 24, scope: !74, inlinedAt: !100)
!129 = !MDLocation(line: 121, column: 10, scope: !74, inlinedAt: !100)
!130 = !{!"0x100\00j1\00109\000", !74, !27, !11, !100} ; [ DW_TAG_auto_variable ] [j1] [line 109]
!131 = !MDLocation(line: 109, column: 28, scope: !74, inlinedAt: !100)
!132 = !{!"0x100\00iloop\00109\000", !74, !27, !11, !100} ; [ DW_TAG_auto_variable ] [iloop] [line 109]
!133 = !MDLocation(line: 109, column: 32, scope: !74, inlinedAt: !100)
!134 = !MDLocation(line: 122, column: 5, scope: !135, inlinedAt: !100)
!135 = !{!"0xb\00122\005\0016", !1, !74}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/Random.c]
!136 = !MDLocation(line: 124, column: 17, scope: !137, inlinedAt: !100)
!137 = !{!"0xb\00123\005\0018", !1, !138}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/Random.c]
!138 = !{!"0xb\00122\005\0017", !1, !135}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/Random.c]
!139 = !MDLocation(line: 125, column: 15, scope: !137, inlinedAt: !100)
!140 = !MDLocation(line: 125, column: 38, scope: !137, inlinedAt: !100)
!141 = !MDLocation(line: 125, column: 14, scope: !137, inlinedAt: !100)
!142 = !MDLocation(line: 126, column: 14, scope: !137, inlinedAt: !100)
!143 = !MDLocation(line: 127, column: 28, scope: !137, inlinedAt: !100)
!144 = !MDLocation(line: 127, column: 23, scope: !137, inlinedAt: !100)
!145 = !MDLocation(line: 127, column: 9, scope: !137, inlinedAt: !100)
!146 = !{!112, !112, i64 0}
!147 = !MDLocation(line: 129, column: 5, scope: !74, inlinedAt: !100)
!148 = !{!111, !112, i64 72}
!149 = !MDLocation(line: 130, column: 5, scope: !74, inlinedAt: !100)
!150 = !{!111, !112, i64 76}
!151 = !MDLocation(line: 40, column: 5, scope: !26)
!152 = !{!111, !106, i64 88}
!153 = !MDLocation(line: 41, column: 5, scope: !26)
!154 = !MDLocation(line: 43, column: 5, scope: !26)
!155 = !{!111, !112, i64 80}
!156 = !MDLocation(line: 45, column: 5, scope: !26)
!157 = !MDLocation(line: 48, column: 23, scope: !33)
!158 = !MDLocation(line: 48, column: 36, scope: !33)
!159 = !MDLocation(line: 48, column: 49, scope: !33)
!160 = !MDLocation(line: 50, column: 25, scope: !33)
!161 = !MDLocation(line: 50, column: 16, scope: !33)
!162 = !MDLocation(line: 50, column: 12, scope: !33)
!163 = !{!"0x101\00R\0016777322\000", !74, !27, !4, !164} ; [ DW_TAG_arg_variable ] [R] [line 106]
!164 = !MDLocation(line: 52, column: 5, scope: !33)
!165 = !MDLocation(line: 106, column: 31, scope: !74, inlinedAt: !164)
!166 = !{!"0x101\00seed\0033554538\000", !74, !27, !11, !164} ; [ DW_TAG_arg_variable ] [seed] [line 106]
!167 = !MDLocation(line: 106, column: 38, scope: !74, inlinedAt: !164)
!168 = !MDLocation(line: 111, column: 5, scope: !74, inlinedAt: !164)
!169 = !MDLocation(line: 113, column: 5, scope: !74, inlinedAt: !164)
!170 = !MDLocation(line: 115, column: 9, scope: !114, inlinedAt: !164)
!171 = !MDLocation(line: 115, column: 27, scope: !114, inlinedAt: !164)
!172 = !MDLocation(line: 115, column: 9, scope: !74, inlinedAt: !164)
!173 = !{!"0x100\00jseed\00109\000", !74, !27, !11, !164} ; [ DW_TAG_auto_variable ] [jseed] [line 109]
!174 = !MDLocation(line: 109, column: 9, scope: !74, inlinedAt: !164)
!175 = !MDLocation(line: 117, column: 9, scope: !120, inlinedAt: !164)
!176 = !MDLocation(line: 117, column: 9, scope: !74, inlinedAt: !164)
!177 = !{!"0x100\00k0\00109\000", !74, !27, !11, !164} ; [ DW_TAG_auto_variable ] [k0] [line 109]
!178 = !MDLocation(line: 109, column: 16, scope: !74, inlinedAt: !164)
!179 = !{!"0x100\00k1\00109\000", !74, !27, !11, !164} ; [ DW_TAG_auto_variable ] [k1] [line 109]
!180 = !MDLocation(line: 109, column: 20, scope: !74, inlinedAt: !164)
!181 = !MDLocation(line: 120, column: 10, scope: !74, inlinedAt: !164)
!182 = !{!"0x100\00j0\00109\000", !74, !27, !11, !164} ; [ DW_TAG_auto_variable ] [j0] [line 109]
!183 = !MDLocation(line: 109, column: 24, scope: !74, inlinedAt: !164)
!184 = !MDLocation(line: 121, column: 10, scope: !74, inlinedAt: !164)
!185 = !{!"0x100\00j1\00109\000", !74, !27, !11, !164} ; [ DW_TAG_auto_variable ] [j1] [line 109]
!186 = !MDLocation(line: 109, column: 28, scope: !74, inlinedAt: !164)
!187 = !{!"0x100\00iloop\00109\000", !74, !27, !11, !164} ; [ DW_TAG_auto_variable ] [iloop] [line 109]
!188 = !MDLocation(line: 109, column: 32, scope: !74, inlinedAt: !164)
!189 = !MDLocation(line: 122, column: 5, scope: !135, inlinedAt: !164)
!190 = !MDLocation(line: 124, column: 17, scope: !137, inlinedAt: !164)
!191 = !MDLocation(line: 125, column: 15, scope: !137, inlinedAt: !164)
!192 = !MDLocation(line: 125, column: 38, scope: !137, inlinedAt: !164)
!193 = !MDLocation(line: 125, column: 14, scope: !137, inlinedAt: !164)
!194 = !MDLocation(line: 126, column: 14, scope: !137, inlinedAt: !164)
!195 = !MDLocation(line: 127, column: 28, scope: !137, inlinedAt: !164)
!196 = !MDLocation(line: 127, column: 23, scope: !137, inlinedAt: !164)
!197 = !MDLocation(line: 127, column: 9, scope: !137, inlinedAt: !164)
!198 = !MDLocation(line: 129, column: 5, scope: !74, inlinedAt: !164)
!199 = !MDLocation(line: 130, column: 5, scope: !74, inlinedAt: !164)
!200 = !MDLocation(line: 53, column: 5, scope: !33)
!201 = !MDLocation(line: 54, column: 5, scope: !33)
!202 = !{!111, !106, i64 96}
!203 = !MDLocation(line: 55, column: 16, scope: !33)
!204 = !MDLocation(line: 55, column: 5, scope: !33)
!205 = !{!111, !106, i64 104}
!206 = !MDLocation(line: 56, column: 5, scope: !33)
!207 = !MDLocation(line: 58, column: 5, scope: !33)
!208 = !MDLocation(line: 61, column: 27, scope: !41)
!209 = !MDLocation(line: 63, column: 10, scope: !41)
!210 = !MDLocation(line: 63, column: 5, scope: !41)
!211 = !MDLocation(line: 64, column: 1, scope: !41)
!212 = !MDLocation(line: 70, column: 33, scope: !46)
!213 = !MDLocation(line: 74, column: 13, scope: !46)
!214 = !MDLocation(line: 74, column: 9, scope: !46)
!215 = !MDLocation(line: 75, column: 13, scope: !46)
!216 = !MDLocation(line: 75, column: 9, scope: !46)
!217 = !MDLocation(line: 78, column: 9, scope: !46)
!218 = !MDLocation(line: 78, column: 16, scope: !46)
!219 = !MDLocation(line: 72, column: 9, scope: !46)
!220 = !MDLocation(line: 79, column: 9, scope: !221)
!221 = !{!"0xb\0079\009\000", !1, !46}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/Random.c]
!222 = !MDLocation(line: 79, column: 16, scope: !223)
!223 = !{!"0xb\001", !1, !221}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/Random.c]
!224 = !MDLocation(line: 79, column: 9, scope: !46)
!225 = !MDLocation(line: 80, column: 5, scope: !46)
!226 = !MDLocation(line: 82, column: 9, scope: !227)
!227 = !{!"0xb\0082\009\001", !1, !46}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/Random.c]
!228 = !MDLocation(line: 84, column: 10, scope: !227)
!229 = !MDLocation(line: 82, column: 9, scope: !46)
!230 = !MDLocation(line: 85, column: 5, scope: !46)
!231 = !MDLocation(line: 87, column: 9, scope: !232)
!232 = !{!"0xb\0087\009\002", !1, !46}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/Random.c]
!233 = !MDLocation(line: 89, column: 10, scope: !232)
!234 = !MDLocation(line: 87, column: 9, scope: !46)
!235 = !MDLocation(line: 90, column: 5, scope: !46)
!236 = !MDLocation(line: 92, column: 9, scope: !237)
!237 = !{!"0xb\0092\009\003", !1, !46}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/Random.c]
!238 = !MDLocation(line: 92, column: 9, scope: !46)
!239 = !MDLocation(line: 93, column: 17, scope: !237)
!240 = !MDLocation(line: 93, column: 28, scope: !237)
!241 = !MDLocation(line: 93, column: 34, scope: !237)
!242 = !MDLocation(line: 93, column: 47, scope: !237)
!243 = !MDLocation(line: 93, column: 9, scope: !237)
!244 = !MDLocation(line: 95, column: 16, scope: !237)
!245 = !MDLocation(line: 95, column: 22, scope: !237)
!246 = !MDLocation(line: 95, column: 9, scope: !237)
!247 = !MDLocation(line: 97, column: 1, scope: !46)
!248 = !MDLocation(line: 134, column: 26, scope: !56)
!249 = !MDLocation(line: 134, column: 36, scope: !56)
!250 = !MDLocation(line: 137, column: 50, scope: !56)
!251 = !MDLocation(line: 137, column: 35, scope: !56)
!252 = !MDLocation(line: 137, column: 28, scope: !56)
!253 = !MDLocation(line: 137, column: 17, scope: !56)
!254 = !MDLocation(line: 137, column: 13, scope: !56)
!255 = !MDLocation(line: 136, column: 9, scope: !56)
!256 = !MDLocation(line: 139, column: 15, scope: !257)
!257 = !{!"0xb\00139\005\005", !1, !258}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/Random.c]
!258 = !{!"0xb\00139\005\004", !1, !56}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/Random.c]
!259 = !MDLocation(line: 139, column: 5, scope: !258)
!260 = !MDLocation(line: 74, column: 13, scope: !46, inlinedAt: !261)
!261 = !MDLocation(line: 140, column: 16, scope: !257)
!262 = !MDLocation(line: 75, column: 13, scope: !46, inlinedAt: !261)
!263 = !MDLocation(line: 92, column: 9, scope: !237, inlinedAt: !261)
!264 = !MDLocation(line: 93, column: 17, scope: !237, inlinedAt: !261)
!265 = !MDLocation(line: 93, column: 47, scope: !237, inlinedAt: !261)
!266 = !MDLocation(line: 70, column: 33, scope: !46, inlinedAt: !261)
!267 = !{!"0x101\00R\0016777286\000", !46, !27, !4, !261} ; [ DW_TAG_arg_variable ] [R] [line 70]
!268 = !{!"0x100\00I\0074\000", !46, !27, !11, !261} ; [ DW_TAG_auto_variable ] [I] [line 74]
!269 = !MDLocation(line: 74, column: 9, scope: !46, inlinedAt: !261)
!270 = !{!"0x100\00J\0075\000", !46, !27, !11, !261} ; [ DW_TAG_auto_variable ] [J] [line 75]
!271 = !MDLocation(line: 75, column: 9, scope: !46, inlinedAt: !261)
!272 = !MDLocation(line: 78, column: 9, scope: !46, inlinedAt: !261)
!273 = !MDLocation(line: 78, column: 16, scope: !46, inlinedAt: !261)
!274 = !{!"0x100\00k\0072\000", !46, !27, !11, !261} ; [ DW_TAG_auto_variable ] [k] [line 72]
!275 = !MDLocation(line: 72, column: 9, scope: !46, inlinedAt: !261)
!276 = !MDLocation(line: 79, column: 9, scope: !221, inlinedAt: !261)
!277 = !MDLocation(line: 79, column: 16, scope: !223, inlinedAt: !261)
!278 = !MDLocation(line: 79, column: 9, scope: !46, inlinedAt: !261)
!279 = !MDLocation(line: 80, column: 5, scope: !46, inlinedAt: !261)
!280 = !MDLocation(line: 82, column: 9, scope: !227, inlinedAt: !261)
!281 = !MDLocation(line: 84, column: 10, scope: !227, inlinedAt: !261)
!282 = !MDLocation(line: 82, column: 9, scope: !46, inlinedAt: !261)
!283 = !MDLocation(line: 85, column: 5, scope: !46, inlinedAt: !261)
!284 = !MDLocation(line: 87, column: 9, scope: !232, inlinedAt: !261)
!285 = !MDLocation(line: 89, column: 10, scope: !232, inlinedAt: !261)
!286 = !MDLocation(line: 87, column: 9, scope: !46, inlinedAt: !261)
!287 = !MDLocation(line: 90, column: 5, scope: !46, inlinedAt: !261)
!288 = !MDLocation(line: 92, column: 9, scope: !46, inlinedAt: !261)
!289 = !MDLocation(line: 93, column: 28, scope: !237, inlinedAt: !261)
!290 = !MDLocation(line: 93, column: 34, scope: !237, inlinedAt: !261)
!291 = !MDLocation(line: 93, column: 9, scope: !237, inlinedAt: !261)
!292 = !MDLocation(line: 95, column: 16, scope: !237, inlinedAt: !261)
!293 = !MDLocation(line: 95, column: 22, scope: !237, inlinedAt: !261)
!294 = !MDLocation(line: 95, column: 9, scope: !237, inlinedAt: !261)
!295 = !MDLocation(line: 140, column: 9, scope: !257)
!296 = !MDLocation(line: 142, column: 5, scope: !56)
!297 = !MDLocation(line: 146, column: 27, scope: !64)
!298 = !MDLocation(line: 146, column: 34, scope: !64)
!299 = !MDLocation(line: 146, column: 44, scope: !64)
!300 = !MDLocation(line: 153, column: 53, scope: !64)
!301 = !MDLocation(line: 153, column: 37, scope: !64)
!302 = !MDLocation(line: 153, column: 30, scope: !64)
!303 = !MDLocation(line: 153, column: 18, scope: !64)
!304 = !MDLocation(line: 153, column: 14, scope: !64)
!305 = !MDLocation(line: 155, column: 9, scope: !306)
!306 = !{!"0xb\00155\009\006", !1, !64}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/Random.c]
!307 = !MDLocation(line: 155, column: 9, scope: !64)
!308 = !MDLocation(line: 157, column: 15, scope: !309)
!309 = !{!"0xb\00157\005\008", !1, !310}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/Random.c]
!310 = !{!"0xb\00157\005\007", !1, !64}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/Random.c]
!311 = !MDLocation(line: 157, column: 5, scope: !310)
!312 = !MDLocation(line: 159, column: 49, scope: !313)
!313 = !{!"0xb\00158\005\009", !1, !309}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/Random.c]
!314 = !MDLocation(line: 159, column: 34, scope: !313)
!315 = !MDLocation(line: 165, column: 19, scope: !316)
!316 = !{!"0xb\00165\009\0013", !1, !317}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/Random.c]
!317 = !{!"0xb\00165\009\0012", !1, !313}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/Random.c]
!318 = !MDLocation(line: 74, column: 13, scope: !46, inlinedAt: !319)
!319 = !MDLocation(line: 166, column: 23, scope: !316)
!320 = !MDLocation(line: 75, column: 13, scope: !46, inlinedAt: !319)
!321 = !MDLocation(line: 92, column: 9, scope: !237, inlinedAt: !319)
!322 = !MDLocation(line: 93, column: 17, scope: !237, inlinedAt: !319)
!323 = !MDLocation(line: 93, column: 47, scope: !237, inlinedAt: !319)
!324 = !MDLocation(line: 159, column: 27, scope: !313)
!325 = !MDLocation(line: 159, column: 9, scope: !313)
!326 = !{!327, !327, i64 0}
!327 = !{!"any pointer", !107, i64 0}
!328 = !MDLocation(line: 160, column: 13, scope: !329)
!329 = !{!"0xb\00160\0013\0010", !1, !313}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/Random.c]
!330 = !MDLocation(line: 160, column: 13, scope: !313)
!331 = !MDLocation(line: 70, column: 33, scope: !46, inlinedAt: !319)
!332 = !{!"0x101\00R\0016777286\000", !46, !27, !4, !319} ; [ DW_TAG_arg_variable ] [R] [line 70]
!333 = !{!"0x100\00I\0074\000", !46, !27, !11, !319} ; [ DW_TAG_auto_variable ] [I] [line 74]
!334 = !MDLocation(line: 74, column: 9, scope: !46, inlinedAt: !319)
!335 = !{!"0x100\00J\0075\000", !46, !27, !11, !319} ; [ DW_TAG_auto_variable ] [J] [line 75]
!336 = !MDLocation(line: 75, column: 9, scope: !46, inlinedAt: !319)
!337 = !MDLocation(line: 78, column: 9, scope: !46, inlinedAt: !319)
!338 = !MDLocation(line: 78, column: 16, scope: !46, inlinedAt: !319)
!339 = !{!"0x100\00k\0072\000", !46, !27, !11, !319} ; [ DW_TAG_auto_variable ] [k] [line 72]
!340 = !MDLocation(line: 72, column: 9, scope: !46, inlinedAt: !319)
!341 = !MDLocation(line: 79, column: 9, scope: !221, inlinedAt: !319)
!342 = !MDLocation(line: 79, column: 16, scope: !223, inlinedAt: !319)
!343 = !MDLocation(line: 79, column: 9, scope: !46, inlinedAt: !319)
!344 = !MDLocation(line: 80, column: 5, scope: !46, inlinedAt: !319)
!345 = !MDLocation(line: 82, column: 9, scope: !227, inlinedAt: !319)
!346 = !MDLocation(line: 84, column: 10, scope: !227, inlinedAt: !319)
!347 = !MDLocation(line: 82, column: 9, scope: !46, inlinedAt: !319)
!348 = !MDLocation(line: 85, column: 5, scope: !46, inlinedAt: !319)
!349 = !MDLocation(line: 87, column: 9, scope: !232, inlinedAt: !319)
!350 = !MDLocation(line: 89, column: 10, scope: !232, inlinedAt: !319)
!351 = !MDLocation(line: 87, column: 9, scope: !46, inlinedAt: !319)
!352 = !MDLocation(line: 90, column: 5, scope: !46, inlinedAt: !319)
!353 = !MDLocation(line: 92, column: 9, scope: !46, inlinedAt: !319)
!354 = !MDLocation(line: 93, column: 28, scope: !237, inlinedAt: !319)
!355 = !MDLocation(line: 93, column: 34, scope: !237, inlinedAt: !319)
!356 = !MDLocation(line: 93, column: 9, scope: !237, inlinedAt: !319)
!357 = !MDLocation(line: 95, column: 16, scope: !237, inlinedAt: !319)
!358 = !MDLocation(line: 95, column: 22, scope: !237, inlinedAt: !319)
!359 = !MDLocation(line: 95, column: 9, scope: !237, inlinedAt: !319)
!360 = !MDLocation(line: 166, column: 13, scope: !316)
!361 = !MDLocation(line: 165, column: 9, scope: !317)
!362 = !MDLocation(line: 162, column: 13, scope: !363)
!363 = !{!"0xb\00161\009\0011", !1, !329}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/Random.c]
!364 = !MDLocation(line: 163, column: 13, scope: !363)
!365 = !MDLocation(line: 169, column: 1, scope: !64)
