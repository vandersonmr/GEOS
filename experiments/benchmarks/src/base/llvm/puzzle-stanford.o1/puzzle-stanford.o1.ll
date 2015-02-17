; ModuleID = 'puzzle-stanford.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.node = type { %struct.node*, %struct.node*, i32 }
%struct.element = type { i32, i32 }
%struct.complex = type { float, float }

@seed = common global i64 0, align 8
@piecemax = common global [13 x i32] zeroinitializer, align 16
@p = common global [13 x [512 x i32]] zeroinitializer, align 16
@puzzl = common global [512 x i32] zeroinitializer, align 16
@class = common global [13 x i32] zeroinitializer, align 16
@piececount = common global [4 x i32] zeroinitializer, align 16
@kount = common global i32 0, align 4
@n = common global i32 0, align 4
@.str = private unnamed_addr constant [18 x i8] c"Error1 in Puzzle\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"Error2 in Puzzle.\0A\00", align 1
@.str2 = private unnamed_addr constant [19 x i8] c"Error3 in Puzzle.\0A\00", align 1
@.str3 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
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
@sortlist = common global [5001 x i32] zeroinitializer, align 16
@biggest = common global i32 0, align 4
@littlest = common global i32 0, align 4
@top = common global i32 0, align 4
@z = common global [257 x %struct.complex] zeroinitializer, align 16
@w = common global [257 x %struct.complex] zeroinitializer, align 16
@e = common global [130 x %struct.complex] zeroinitializer, align 16
@zr = common global float 0.000000e+00, align 4
@zi = common global float 0.000000e+00, align 4
@str = private unnamed_addr constant [17 x i8] c"Error1 in Puzzle\00"
@str4 = private unnamed_addr constant [18 x i8] c"Error2 in Puzzle.\00"
@str5 = private unnamed_addr constant [18 x i8] c"Error3 in Puzzle.\00"

; Function Attrs: nounwind uwtable
define void @Initrand() #0 {
entry:
  store i64 74755, i64* @seed, align 8, !dbg !131, !tbaa !132
  ret void, !dbg !136
}

; Function Attrs: nounwind uwtable
define i32 @Rand() #0 {
entry:
  %0 = load i64* @seed, align 8, !dbg !137, !tbaa !132
  %mul = mul nsw i64 %0, 1309, !dbg !137
  %add = add nsw i64 %mul, 13849, !dbg !137
  %and = and i64 %add, 65535, !dbg !138
  store i64 %and, i64* @seed, align 8, !dbg !139, !tbaa !132
  %conv = trunc i64 %and to i32, !dbg !140
  ret i32 %conv, !dbg !141
}

; Function Attrs: nounwind readonly uwtable
define i32 @Fit(i32 %i, i32 %j) #1 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %i, i64 0, metadata !16, metadata !142), !dbg !143
  tail call void @llvm.dbg.value(metadata i32 %j, i64 0, metadata !17, metadata !142), !dbg !144
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !18, metadata !142), !dbg !145
  %idxprom = sext i32 %i to i64, !dbg !146
  %arrayidx = getelementptr inbounds [13 x i32]* @piecemax, i64 0, i64 %idxprom, !dbg !146
  %0 = load i32* %arrayidx, align 4, !dbg !146, !tbaa !149
  %cmp14 = icmp slt i32 %0, 0, !dbg !151
  br i1 %cmp14, label %return, label %for.body.lr.ph, !dbg !152

for.body.lr.ph:                                   ; preds = %entry
  %1 = sext i32 %j to i64, !dbg !152
  br label %for.body, !dbg !152

for.body:                                         ; preds = %for.inc, %for.body.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 0, %for.body.lr.ph ]
  %arrayidx4 = getelementptr inbounds [13 x [512 x i32]]* @p, i64 0, i64 %idxprom, i64 %indvars.iv, !dbg !153
  %2 = load i32* %arrayidx4, align 4, !dbg !153, !tbaa !149
  %tobool = icmp eq i32 %2, 0, !dbg !155
  br i1 %tobool, label %for.inc, label %if.then, !dbg !155

if.then:                                          ; preds = %for.body
  %3 = add nsw i64 %indvars.iv, %1, !dbg !156
  %arrayidx6 = getelementptr inbounds [512 x i32]* @puzzl, i64 0, i64 %3, !dbg !158
  %4 = load i32* %arrayidx6, align 4, !dbg !158, !tbaa !149
  %tobool7 = icmp eq i32 %4, 0, !dbg !159
  br i1 %tobool7, label %for.inc, label %return, !dbg !159

for.inc:                                          ; preds = %if.then, %for.body
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !152
  %5 = load i32* %arrayidx, align 4, !dbg !146, !tbaa !149
  %6 = sext i32 %5 to i64, !dbg !151
  %cmp = icmp slt i64 %indvars.iv, %6, !dbg !151
  br i1 %cmp, label %for.body, label %return, !dbg !152

return:                                           ; preds = %if.then, %for.inc, %entry
  %retval.0 = phi i32 [ 1, %entry ], [ 0, %if.then ], [ 1, %for.inc ]
  ret i32 %retval.0, !dbg !160
}

; Function Attrs: nounwind uwtable
define i32 @Place(i32 %i, i32 %j) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %i, i64 0, metadata !21, metadata !142), !dbg !161
  tail call void @llvm.dbg.value(metadata i32 %j, i64 0, metadata !22, metadata !142), !dbg !162
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !23, metadata !142), !dbg !163
  %idxprom = sext i32 %i to i64, !dbg !164
  %arrayidx = getelementptr inbounds [13 x i32]* @piecemax, i64 0, i64 %idxprom, !dbg !164
  %0 = load i32* %arrayidx, align 4, !dbg !164, !tbaa !149
  %cmp39 = icmp slt i32 %0, 0, !dbg !167
  br i1 %cmp39, label %for.end, label %for.body.lr.ph, !dbg !168

for.body.lr.ph:                                   ; preds = %entry
  %1 = load i32* %arrayidx, align 4, !dbg !164, !tbaa !149
  %2 = sext i32 %j to i64, !dbg !168
  %3 = sext i32 %1 to i64, !dbg !168
  br label %for.body, !dbg !168

for.body:                                         ; preds = %for.inc, %for.body.lr.ph
  %indvars.iv43 = phi i64 [ %indvars.iv.next44, %for.inc ], [ 0, %for.body.lr.ph ]
  %arrayidx4 = getelementptr inbounds [13 x [512 x i32]]* @p, i64 0, i64 %idxprom, i64 %indvars.iv43, !dbg !169
  %4 = load i32* %arrayidx4, align 4, !dbg !169, !tbaa !149
  %tobool = icmp eq i32 %4, 0, !dbg !171
  br i1 %tobool, label %for.inc, label %if.then, !dbg !171

if.then:                                          ; preds = %for.body
  %5 = add nsw i64 %indvars.iv43, %2, !dbg !172
  %arrayidx6 = getelementptr inbounds [512 x i32]* @puzzl, i64 0, i64 %5, !dbg !173
  store i32 1, i32* %arrayidx6, align 4, !dbg !173, !tbaa !149
  br label %for.inc, !dbg !173

for.inc:                                          ; preds = %for.body, %if.then
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1, !dbg !168
  %cmp = icmp slt i64 %indvars.iv43, %3, !dbg !167
  br i1 %cmp, label %for.body, label %for.end, !dbg !168

for.end:                                          ; preds = %for.inc, %entry
  %arrayidx8 = getelementptr inbounds [13 x i32]* @class, i64 0, i64 %idxprom, !dbg !174
  %6 = load i32* %arrayidx8, align 4, !dbg !174, !tbaa !149
  %idxprom9 = sext i32 %6 to i64, !dbg !175
  %arrayidx10 = getelementptr inbounds [4 x i32]* @piececount, i64 0, i64 %idxprom9, !dbg !175
  %7 = load i32* %arrayidx10, align 4, !dbg !175, !tbaa !149
  %sub = add nsw i32 %7, -1, !dbg !175
  store i32 %sub, i32* %arrayidx10, align 4, !dbg !176, !tbaa !149
  tail call void @llvm.dbg.value(metadata i32 %j, i64 0, metadata !23, metadata !142), !dbg !163
  %cmp1636 = icmp slt i32 %j, 512, !dbg !177
  br i1 %cmp1636, label %for.body17.lr.ph, label %return, !dbg !182

for.body17.lr.ph:                                 ; preds = %for.end
  %8 = sext i32 %j to i64
  br label %for.body17, !dbg !182

for.body17:                                       ; preds = %for.body17.lr.ph, %for.inc23
  %indvars.iv = phi i64 [ %8, %for.body17.lr.ph ], [ %indvars.iv.next, %for.inc23 ]
  %arrayidx19 = getelementptr inbounds [512 x i32]* @puzzl, i64 0, i64 %indvars.iv, !dbg !183
  %9 = load i32* %arrayidx19, align 4, !dbg !183, !tbaa !149
  %tobool20 = icmp eq i32 %9, 0, !dbg !185
  br i1 %tobool20, label %for.body17.return_crit_edge, label %for.inc23, !dbg !185

for.inc23:                                        ; preds = %for.body17
  %indvars.iv.next = add nsw i64 %indvars.iv, 1, !dbg !182
  %cmp16 = icmp slt i64 %indvars.iv.next, 512, !dbg !177
  br i1 %cmp16, label %for.body17, label %return, !dbg !182

for.body17.return_crit_edge:                      ; preds = %for.body17
  %10 = trunc i64 %indvars.iv to i32, !dbg !185
  br label %return, !dbg !185

return:                                           ; preds = %for.inc23, %for.body17.return_crit_edge, %for.end
  %retval.0 = phi i32 [ %10, %for.body17.return_crit_edge ], [ 0, %for.end ], [ 0, %for.inc23 ]
  ret i32 %retval.0, !dbg !186
}

; Function Attrs: nounwind uwtable
define void @Remove(i32 %i, i32 %j) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %i, i64 0, metadata !28, metadata !142), !dbg !187
  tail call void @llvm.dbg.value(metadata i32 %j, i64 0, metadata !29, metadata !142), !dbg !188
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !30, metadata !142), !dbg !189
  %idxprom = sext i32 %i to i64, !dbg !190
  %arrayidx = getelementptr inbounds [13 x i32]* @piecemax, i64 0, i64 %idxprom, !dbg !190
  %0 = load i32* %arrayidx, align 4, !dbg !190, !tbaa !149
  %cmp22 = icmp slt i32 %0, 0, !dbg !193
  br i1 %cmp22, label %for.end, label %for.body.lr.ph, !dbg !194

for.body.lr.ph:                                   ; preds = %entry
  %1 = load i32* %arrayidx, align 4, !dbg !190, !tbaa !149
  %2 = sext i32 %j to i64, !dbg !194
  %3 = sext i32 %1 to i64, !dbg !194
  br label %for.body, !dbg !194

for.body:                                         ; preds = %for.inc, %for.body.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 0, %for.body.lr.ph ]
  %arrayidx4 = getelementptr inbounds [13 x [512 x i32]]* @p, i64 0, i64 %idxprom, i64 %indvars.iv, !dbg !195
  %4 = load i32* %arrayidx4, align 4, !dbg !195, !tbaa !149
  %tobool = icmp eq i32 %4, 0, !dbg !197
  br i1 %tobool, label %for.inc, label %if.then, !dbg !197

if.then:                                          ; preds = %for.body
  %5 = add nsw i64 %indvars.iv, %2, !dbg !198
  %arrayidx6 = getelementptr inbounds [512 x i32]* @puzzl, i64 0, i64 %5, !dbg !199
  store i32 0, i32* %arrayidx6, align 4, !dbg !199, !tbaa !149
  br label %for.inc, !dbg !199

for.inc:                                          ; preds = %for.body, %if.then
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !194
  %cmp = icmp slt i64 %indvars.iv, %3, !dbg !193
  br i1 %cmp, label %for.body, label %for.end, !dbg !194

for.end:                                          ; preds = %for.inc, %entry
  %arrayidx8 = getelementptr inbounds [13 x i32]* @class, i64 0, i64 %idxprom, !dbg !200
  %6 = load i32* %arrayidx8, align 4, !dbg !200, !tbaa !149
  %idxprom9 = sext i32 %6 to i64, !dbg !201
  %arrayidx10 = getelementptr inbounds [4 x i32]* @piececount, i64 0, i64 %idxprom9, !dbg !201
  %7 = load i32* %arrayidx10, align 4, !dbg !201, !tbaa !149
  %add11 = add nsw i32 %7, 1, !dbg !201
  store i32 %add11, i32* %arrayidx10, align 4, !dbg !202, !tbaa !149
  ret void, !dbg !203
}

; Function Attrs: nounwind uwtable
define i32 @Trial(i32 %j) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %j, i64 0, metadata !35, metadata !142), !dbg !204
  %0 = load i32* @kount, align 4, !dbg !205, !tbaa !149
  %add = add nsw i32 %0, 1, !dbg !205
  store i32 %add, i32* @kount, align 4, !dbg !206, !tbaa !149
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !36, metadata !142), !dbg !207
  br label %for.body, !dbg !208

for.body:                                         ; preds = %entry, %for.inc
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.inc ]
  %arrayidx = getelementptr inbounds [13 x i32]* @class, i64 0, i64 %indvars.iv, !dbg !210
  %1 = load i32* %arrayidx, align 4, !dbg !210, !tbaa !149
  %idxprom1 = sext i32 %1 to i64, !dbg !213
  %arrayidx2 = getelementptr inbounds [4 x i32]* @piececount, i64 0, i64 %idxprom1, !dbg !213
  %2 = load i32* %arrayidx2, align 4, !dbg !213, !tbaa !149
  %cmp3 = icmp eq i32 %2, 0, !dbg !213
  br i1 %cmp3, label %for.inc, label %if.then, !dbg !214

if.then:                                          ; preds = %for.body
  %3 = trunc i64 %indvars.iv to i32, !dbg !215
  %call = tail call i32 @Fit(i32 %3, i32 %j), !dbg !215
  %tobool = icmp eq i32 %call, 0, !dbg !217
  br i1 %tobool, label %for.inc, label %if.then4, !dbg !217

if.then4:                                         ; preds = %if.then
  %4 = trunc i64 %indvars.iv to i32, !dbg !218
  %call5 = tail call i32 @Place(i32 %4, i32 %j), !dbg !218
  tail call void @llvm.dbg.value(metadata i32 %call5, i64 0, metadata !37, metadata !142), !dbg !220
  %call6 = tail call i32 @Trial(i32 %call5), !dbg !221
  %tobool7 = icmp ne i32 %call6, 0, !dbg !223
  %cmp8 = icmp eq i32 %call5, 0, !dbg !224
  %or.cond = or i1 %cmp8, %tobool7, !dbg !223
  br i1 %or.cond, label %return, label %if.else, !dbg !223

if.else:                                          ; preds = %if.then4
  %5 = trunc i64 %indvars.iv to i32, !dbg !226
  tail call void @Remove(i32 %5, i32 %j), !dbg !226
  br label %for.inc, !dbg !227

for.inc:                                          ; preds = %if.then, %for.body, %if.else
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !208
  %cmp = icmp slt i64 %indvars.iv.next, 13, !dbg !228
  br i1 %cmp, label %for.body, label %return, !dbg !208

return:                                           ; preds = %for.inc, %if.then4
  %retval.0 = phi i32 [ 1, %if.then4 ], [ 0, %for.inc ]
  ret i32 %retval.0, !dbg !231
}

; Function Attrs: nounwind uwtable
define void @Puzzle() #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !43, metadata !142), !dbg !232
  br label %for.body, !dbg !233

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv714 = phi i64 [ 0, %entry ], [ %indvars.iv.next715, %for.body ]
  %arrayidx = getelementptr inbounds [512 x i32]* @puzzl, i64 0, i64 %indvars.iv714, !dbg !235
  store i32 1, i32* %arrayidx, align 4, !dbg !235, !tbaa !149
  %indvars.iv.next715 = add nuw nsw i64 %indvars.iv714, 1, !dbg !233
  %exitcond716 = icmp eq i64 %indvars.iv.next715, 512, !dbg !233
  br i1 %exitcond716, label %for.cond4.preheader, label %for.body, !dbg !233

for.cond4.preheader:                              ; preds = %for.body, %for.inc20
  %indvars.iv711 = phi i64 [ %indvars.iv.next712, %for.inc20 ], [ 1, %for.body ]
  br label %for.cond7.preheader, !dbg !237

for.cond7.preheader:                              ; preds = %for.inc17, %for.cond4.preheader
  %indvars.iv708 = phi i64 [ 1, %for.cond4.preheader ], [ %indvars.iv.next709, %for.inc17 ]
  br label %for.body9, !dbg !241

for.body9:                                        ; preds = %for.body9, %for.cond7.preheader
  %indvars.iv701 = phi i64 [ 1, %for.cond7.preheader ], [ %indvars.iv.next702, %for.body9 ]
  %0 = shl i64 %indvars.iv701, 3, !dbg !244
  %1 = add nuw nsw i64 %0, %indvars.iv708, !dbg !246
  %2 = shl i64 %1, 3, !dbg !247
  %3 = add nuw nsw i64 %2, %indvars.iv711, !dbg !248
  %arrayidx13 = getelementptr inbounds [512 x i32]* @puzzl, i64 0, i64 %3, !dbg !249
  store i32 0, i32* %arrayidx13, align 4, !dbg !249, !tbaa !149
  %indvars.iv.next702 = add nuw nsw i64 %indvars.iv701, 1, !dbg !241
  %exitcond707 = icmp eq i64 %indvars.iv.next702, 6, !dbg !241
  br i1 %exitcond707, label %for.inc17, label %for.body9, !dbg !241

for.inc17:                                        ; preds = %for.body9
  %indvars.iv.next709 = add nuw nsw i64 %indvars.iv708, 1, !dbg !237
  %exitcond710 = icmp eq i64 %indvars.iv.next709, 6, !dbg !237
  br i1 %exitcond710, label %for.inc20, label %for.cond7.preheader, !dbg !237

for.inc20:                                        ; preds = %for.inc17
  %indvars.iv.next712 = add nuw nsw i64 %indvars.iv711, 1, !dbg !250
  %exitcond713 = icmp eq i64 %indvars.iv.next712, 6, !dbg !250
  br i1 %exitcond713, label %for.cond39.preheader, label %for.cond4.preheader, !dbg !250

for.cond39.preheader:                             ; preds = %for.inc20
  call void @llvm.memset.p0i8.i64(i8* bitcast ([13 x [512 x i32]]* @p to i8*), i8 0, i64 26624, i32 16, i1 false), !dbg !251
  br label %for.cond42.preheader, !dbg !256

for.cond42.preheader:                             ; preds = %for.inc60, %for.cond39.preheader
  %indvars.iv693 = phi i64 [ 0, %for.cond39.preheader ], [ %indvars.iv.next694, %for.inc60 ]
  br label %for.inc57, !dbg !258

for.inc57:                                        ; preds = %for.inc57, %for.cond42.preheader
  %indvars.iv690 = phi i64 [ 0, %for.cond42.preheader ], [ %indvars.iv.next691, %for.inc57 ]
  %4 = shl i64 %indvars.iv690, 3, !dbg !261
  %5 = add nuw nsw i64 %4, %indvars.iv693, !dbg !265
  %arrayidx53 = getelementptr inbounds [13 x [512 x i32]]* @p, i64 0, i64 0, i64 %5, !dbg !266
  store i32 1, i32* %arrayidx53, align 4, !dbg !266, !tbaa !149
  %indvars.iv.next691 = add nuw nsw i64 %indvars.iv690, 1, !dbg !258
  %exitcond692 = icmp eq i64 %indvars.iv.next691, 2, !dbg !258
  br i1 %exitcond692, label %for.inc60, label %for.inc57, !dbg !258

for.inc60:                                        ; preds = %for.inc57
  %indvars.iv.next694 = add nuw nsw i64 %indvars.iv693, 1, !dbg !256
  %exitcond695 = icmp eq i64 %indvars.iv.next694, 4, !dbg !256
  br i1 %exitcond695, label %for.end62, label %for.cond42.preheader, !dbg !256

for.end62:                                        ; preds = %for.inc60
  store i32 0, i32* getelementptr inbounds ([13 x i32]* @class, i64 0, i64 0), align 16, !dbg !267, !tbaa !149
  store i32 11, i32* getelementptr inbounds ([13 x i32]* @piecemax, i64 0, i64 0), align 16, !dbg !268, !tbaa !149
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !40, metadata !142), !dbg !269
  br label %for.cond69.preheader, !dbg !270

for.cond69.preheader:                             ; preds = %for.end62, %for.inc84
  %indvars.iv681 = phi i64 [ 0, %for.end62 ], [ %indvars.iv.next682, %for.inc84 ]
  br label %for.body71, !dbg !272

for.body71:                                       ; preds = %for.body71, %for.cond69.preheader
  %indvars.iv672 = phi i64 [ 0, %for.cond69.preheader ], [ %indvars.iv.next673, %for.body71 ]
  %6 = shl i64 %indvars.iv672, 6, !dbg !277
  %7 = add nuw nsw i64 %6, %indvars.iv681, !dbg !279
  %arrayidx77 = getelementptr inbounds [13 x [512 x i32]]* @p, i64 0, i64 1, i64 %7, !dbg !280
  store i32 1, i32* %arrayidx77, align 4, !dbg !280, !tbaa !149
  %indvars.iv.next673 = add nuw nsw i64 %indvars.iv672, 1, !dbg !272
  %exitcond678 = icmp eq i64 %indvars.iv.next673, 4, !dbg !272
  br i1 %exitcond678, label %for.inc84, label %for.body71, !dbg !272

for.inc84:                                        ; preds = %for.body71
  %indvars.iv.next682 = add nuw nsw i64 %indvars.iv681, 1, !dbg !270
  %exitcond683 = icmp eq i64 %indvars.iv.next682, 2, !dbg !270
  br i1 %exitcond683, label %for.cond90.preheader, label %for.cond69.preheader, !dbg !270

for.cond90.preheader:                             ; preds = %for.inc84
  store i32 0, i32* getelementptr inbounds ([13 x i32]* @class, i64 0, i64 1), align 4, !dbg !281, !tbaa !149
  store i32 193, i32* getelementptr inbounds ([13 x i32]* @piecemax, i64 0, i64 1), align 4, !dbg !282, !tbaa !149
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !40, metadata !142), !dbg !269
  br label %for.cond93.preheader, !dbg !283

for.cond93.preheader:                             ; preds = %for.inc105, %for.cond90.preheader
  %indvars.iv667 = phi i64 [ 0, %for.cond90.preheader ], [ %indvars.iv.next668, %for.inc105 ]
  br label %for.body95, !dbg !287

for.body95:                                       ; preds = %for.body95, %for.cond93.preheader
  %indvars.iv660 = phi i64 [ 0, %for.cond93.preheader ], [ %indvars.iv.next661, %for.body95 ]
  %8 = shl i64 %indvars.iv660, 3, !dbg !290
  %9 = add nuw nsw i64 %8, %indvars.iv667, !dbg !292
  %10 = shl i64 %9, 3, !dbg !293
  %arrayidx101 = getelementptr inbounds [13 x [512 x i32]]* @p, i64 0, i64 2, i64 %10, !dbg !294
  store i32 1, i32* %arrayidx101, align 16, !dbg !294, !tbaa !149
  %indvars.iv.next661 = add nuw nsw i64 %indvars.iv660, 1, !dbg !287
  %exitcond666 = icmp eq i64 %indvars.iv.next661, 2, !dbg !287
  br i1 %exitcond666, label %for.inc105, label %for.body95, !dbg !287

for.inc105:                                       ; preds = %for.body95
  %indvars.iv.next668 = add nuw nsw i64 %indvars.iv667, 1, !dbg !283
  %exitcond669 = icmp eq i64 %indvars.iv.next668, 4, !dbg !283
  br i1 %exitcond669, label %for.end110, label %for.cond93.preheader, !dbg !283

for.end110:                                       ; preds = %for.inc105
  store i32 0, i32* getelementptr inbounds ([13 x i32]* @class, i64 0, i64 2), align 8, !dbg !295, !tbaa !149
  store i32 88, i32* getelementptr inbounds ([13 x i32]* @piecemax, i64 0, i64 2), align 8, !dbg !296, !tbaa !149
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !40, metadata !142), !dbg !269
  br label %for.cond114.preheader, !dbg !297

for.cond114.preheader:                            ; preds = %for.inc132, %for.end110
  %indvars.iv657 = phi i64 [ 0, %for.end110 ], [ %indvars.iv.next658, %for.inc132 ]
  br label %for.inc129, !dbg !299

for.inc129:                                       ; preds = %for.inc129, %for.cond114.preheader
  %indvars.iv654 = phi i64 [ 0, %for.cond114.preheader ], [ %indvars.iv.next655, %for.inc129 ]
  %11 = shl i64 %indvars.iv654, 3, !dbg !302
  %12 = add nuw nsw i64 %11, %indvars.iv657, !dbg !306
  %arrayidx125 = getelementptr inbounds [13 x [512 x i32]]* @p, i64 0, i64 3, i64 %12, !dbg !307
  store i32 1, i32* %arrayidx125, align 4, !dbg !307, !tbaa !149
  %indvars.iv.next655 = add nuw nsw i64 %indvars.iv654, 1, !dbg !299
  %exitcond656 = icmp eq i64 %indvars.iv.next655, 4, !dbg !299
  br i1 %exitcond656, label %for.inc132, label %for.inc129, !dbg !299

for.inc132:                                       ; preds = %for.inc129
  %indvars.iv.next658 = add nuw nsw i64 %indvars.iv657, 1, !dbg !297
  %exitcond659 = icmp eq i64 %indvars.iv.next658, 2, !dbg !297
  br i1 %exitcond659, label %for.end134, label %for.cond114.preheader, !dbg !297

for.end134:                                       ; preds = %for.inc132
  store i32 0, i32* getelementptr inbounds ([13 x i32]* @class, i64 0, i64 3), align 4, !dbg !308, !tbaa !149
  store i32 25, i32* getelementptr inbounds ([13 x i32]* @piecemax, i64 0, i64 3), align 4, !dbg !309, !tbaa !149
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !40, metadata !142), !dbg !269
  br label %for.cond141.preheader, !dbg !310

for.cond141.preheader:                            ; preds = %for.end134, %for.inc156
  %indvars.iv645 = phi i64 [ 0, %for.end134 ], [ %indvars.iv.next646, %for.inc156 ]
  br label %for.body143, !dbg !312

for.body143:                                      ; preds = %for.body143, %for.cond141.preheader
  %indvars.iv636 = phi i64 [ 0, %for.cond141.preheader ], [ %indvars.iv.next637, %for.body143 ]
  %13 = shl i64 %indvars.iv636, 6, !dbg !317
  %14 = add nuw nsw i64 %13, %indvars.iv645, !dbg !319
  %arrayidx149 = getelementptr inbounds [13 x [512 x i32]]* @p, i64 0, i64 4, i64 %14, !dbg !320
  store i32 1, i32* %arrayidx149, align 4, !dbg !320, !tbaa !149
  %indvars.iv.next637 = add nuw nsw i64 %indvars.iv636, 1, !dbg !312
  %exitcond642 = icmp eq i64 %indvars.iv.next637, 2, !dbg !312
  br i1 %exitcond642, label %for.inc156, label %for.body143, !dbg !312

for.inc156:                                       ; preds = %for.body143
  %indvars.iv.next646 = add nuw nsw i64 %indvars.iv645, 1, !dbg !310
  %exitcond647 = icmp eq i64 %indvars.iv.next646, 4, !dbg !310
  br i1 %exitcond647, label %for.cond162.preheader, label %for.cond141.preheader, !dbg !310

for.cond162.preheader:                            ; preds = %for.inc156
  store i32 0, i32* getelementptr inbounds ([13 x i32]* @class, i64 0, i64 4), align 16, !dbg !321, !tbaa !149
  store i32 67, i32* getelementptr inbounds ([13 x i32]* @piecemax, i64 0, i64 4), align 16, !dbg !322, !tbaa !149
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !40, metadata !142), !dbg !269
  br label %for.cond165.preheader, !dbg !323

for.cond165.preheader:                            ; preds = %for.inc177, %for.cond162.preheader
  %indvars.iv631 = phi i64 [ 0, %for.cond162.preheader ], [ %indvars.iv.next632, %for.inc177 ]
  br label %for.body167, !dbg !327

for.body167:                                      ; preds = %for.body167, %for.cond165.preheader
  %indvars.iv624 = phi i64 [ 0, %for.cond165.preheader ], [ %indvars.iv.next625, %for.body167 ]
  %15 = shl i64 %indvars.iv624, 3, !dbg !330
  %16 = add nuw nsw i64 %15, %indvars.iv631, !dbg !332
  %17 = shl i64 %16, 3, !dbg !333
  %arrayidx173 = getelementptr inbounds [13 x [512 x i32]]* @p, i64 0, i64 5, i64 %17, !dbg !334
  store i32 1, i32* %arrayidx173, align 16, !dbg !334, !tbaa !149
  %indvars.iv.next625 = add nuw nsw i64 %indvars.iv624, 1, !dbg !327
  %exitcond630 = icmp eq i64 %indvars.iv.next625, 4, !dbg !327
  br i1 %exitcond630, label %for.inc177, label %for.body167, !dbg !327

for.inc177:                                       ; preds = %for.body167
  %indvars.iv.next632 = add nuw nsw i64 %indvars.iv631, 1, !dbg !323
  %exitcond633 = icmp eq i64 %indvars.iv.next632, 2, !dbg !323
  br i1 %exitcond633, label %for.end182, label %for.cond165.preheader, !dbg !323

for.end182:                                       ; preds = %for.inc177
  store i32 0, i32* getelementptr inbounds ([13 x i32]* @class, i64 0, i64 5), align 4, !dbg !335, !tbaa !149
  store i32 200, i32* getelementptr inbounds ([13 x i32]* @piecemax, i64 0, i64 5), align 4, !dbg !336, !tbaa !149
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !40, metadata !142), !dbg !269
  br label %for.inc204, !dbg !337

for.inc204:                                       ; preds = %for.inc204, %for.end182
  %indvars.iv621 = phi i64 [ 0, %for.end182 ], [ %indvars.iv.next622, %for.inc204 ]
  %arrayidx197 = getelementptr inbounds [13 x [512 x i32]]* @p, i64 0, i64 6, i64 %indvars.iv621, !dbg !339
  store i32 1, i32* %arrayidx197, align 4, !dbg !339, !tbaa !149
  %indvars.iv.next622 = add nuw nsw i64 %indvars.iv621, 1, !dbg !337
  %exitcond623 = icmp eq i64 %indvars.iv.next622, 3, !dbg !337
  br i1 %exitcond623, label %for.cond210.preheader, label %for.inc204, !dbg !337

for.cond210.preheader:                            ; preds = %for.inc204
  store i32 1, i32* getelementptr inbounds ([13 x i32]* @class, i64 0, i64 6), align 8, !dbg !345, !tbaa !149
  store i32 2, i32* getelementptr inbounds ([13 x i32]* @piecemax, i64 0, i64 6), align 8, !dbg !346, !tbaa !149
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !40, metadata !142), !dbg !269
  br label %for.inc225, !dbg !347

for.inc225:                                       ; preds = %for.inc225, %for.cond210.preheader
  %indvars.iv608 = phi i64 [ 0, %for.cond210.preheader ], [ %indvars.iv.next609, %for.inc225 ]
  %18 = shl i64 %indvars.iv608, 3, !dbg !351
  %arrayidx221 = getelementptr inbounds [13 x [512 x i32]]* @p, i64 0, i64 7, i64 %18, !dbg !355
  store i32 1, i32* %arrayidx221, align 16, !dbg !355, !tbaa !149
  %indvars.iv.next609 = add nuw nsw i64 %indvars.iv608, 1, !dbg !347
  %exitcond610 = icmp eq i64 %indvars.iv.next609, 3, !dbg !347
  br i1 %exitcond610, label %for.cond237.preheader, label %for.inc225, !dbg !347

for.cond237.preheader:                            ; preds = %for.inc225
  store i32 1, i32* getelementptr inbounds ([13 x i32]* @class, i64 0, i64 7), align 4, !dbg !356, !tbaa !149
  store i32 16, i32* getelementptr inbounds ([13 x i32]* @piecemax, i64 0, i64 7), align 4, !dbg !357, !tbaa !149
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !40, metadata !142), !dbg !269
  br label %for.body239, !dbg !358

for.body239:                                      ; preds = %for.body239, %for.cond237.preheader
  %indvars.iv591 = phi i64 [ 0, %for.cond237.preheader ], [ %indvars.iv.next592, %for.body239 ]
  %19 = shl i64 %indvars.iv591, 6, !dbg !364
  %arrayidx245 = getelementptr inbounds [13 x [512 x i32]]* @p, i64 0, i64 8, i64 %19, !dbg !366
  store i32 1, i32* %arrayidx245, align 16, !dbg !366, !tbaa !149
  %indvars.iv.next592 = add nuw nsw i64 %indvars.iv591, 1, !dbg !358
  %exitcond597 = icmp eq i64 %indvars.iv.next592, 3, !dbg !358
  br i1 %exitcond597, label %for.end254, label %for.body239, !dbg !358

for.end254:                                       ; preds = %for.body239
  store i32 1, i32* getelementptr inbounds ([13 x i32]* @class, i64 0, i64 8), align 16, !dbg !367, !tbaa !149
  store i32 128, i32* getelementptr inbounds ([13 x i32]* @piecemax, i64 0, i64 8), align 16, !dbg !368, !tbaa !149
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !40, metadata !142), !dbg !269
  br label %for.cond258.preheader, !dbg !369

for.cond258.preheader:                            ; preds = %for.inc276, %for.end254
  %indvars.iv588 = phi i64 [ 0, %for.end254 ], [ %indvars.iv.next589, %for.inc276 ]
  br label %for.inc273, !dbg !371

for.inc273:                                       ; preds = %for.inc273, %for.cond258.preheader
  %indvars.iv585 = phi i64 [ 0, %for.cond258.preheader ], [ %indvars.iv.next586, %for.inc273 ]
  %20 = shl i64 %indvars.iv585, 3, !dbg !374
  %21 = add nuw nsw i64 %20, %indvars.iv588, !dbg !378
  %arrayidx269 = getelementptr inbounds [13 x [512 x i32]]* @p, i64 0, i64 9, i64 %21, !dbg !379
  store i32 1, i32* %arrayidx269, align 4, !dbg !379, !tbaa !149
  %indvars.iv.next586 = add nuw nsw i64 %indvars.iv585, 1, !dbg !371
  %exitcond587 = icmp eq i64 %indvars.iv.next586, 2, !dbg !371
  br i1 %exitcond587, label %for.inc276, label %for.inc273, !dbg !371

for.inc276:                                       ; preds = %for.inc273
  %indvars.iv.next589 = add nuw nsw i64 %indvars.iv588, 1, !dbg !369
  %exitcond590 = icmp eq i64 %indvars.iv.next589, 2, !dbg !369
  br i1 %exitcond590, label %for.end278, label %for.cond258.preheader, !dbg !369

for.end278:                                       ; preds = %for.inc276
  store i32 2, i32* getelementptr inbounds ([13 x i32]* @class, i64 0, i64 9), align 4, !dbg !380, !tbaa !149
  store i32 9, i32* getelementptr inbounds ([13 x i32]* @piecemax, i64 0, i64 9), align 4, !dbg !381, !tbaa !149
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !40, metadata !142), !dbg !269
  br label %for.cond285.preheader, !dbg !382

for.cond285.preheader:                            ; preds = %for.end278, %for.inc300
  %indvars.iv576 = phi i64 [ 0, %for.end278 ], [ %indvars.iv.next577, %for.inc300 ]
  br label %for.body287, !dbg !384

for.body287:                                      ; preds = %for.body287, %for.cond285.preheader
  %indvars.iv567 = phi i64 [ 0, %for.cond285.preheader ], [ %indvars.iv.next568, %for.body287 ]
  %22 = shl i64 %indvars.iv567, 6, !dbg !389
  %23 = add nuw nsw i64 %22, %indvars.iv576, !dbg !391
  %arrayidx293 = getelementptr inbounds [13 x [512 x i32]]* @p, i64 0, i64 10, i64 %23, !dbg !392
  store i32 1, i32* %arrayidx293, align 4, !dbg !392, !tbaa !149
  %indvars.iv.next568 = add nuw nsw i64 %indvars.iv567, 1, !dbg !384
  %exitcond573 = icmp eq i64 %indvars.iv.next568, 2, !dbg !384
  br i1 %exitcond573, label %for.inc300, label %for.body287, !dbg !384

for.inc300:                                       ; preds = %for.body287
  %indvars.iv.next577 = add nuw nsw i64 %indvars.iv576, 1, !dbg !382
  %exitcond578 = icmp eq i64 %indvars.iv.next577, 2, !dbg !382
  br i1 %exitcond578, label %for.cond306.preheader, label %for.cond285.preheader, !dbg !382

for.cond306.preheader:                            ; preds = %for.inc300
  store i32 2, i32* getelementptr inbounds ([13 x i32]* @class, i64 0, i64 10), align 8, !dbg !393, !tbaa !149
  store i32 65, i32* getelementptr inbounds ([13 x i32]* @piecemax, i64 0, i64 10), align 8, !dbg !394, !tbaa !149
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !40, metadata !142), !dbg !269
  br label %for.cond309.preheader, !dbg !395

for.cond309.preheader:                            ; preds = %for.inc321, %for.cond306.preheader
  %indvars.iv562 = phi i64 [ 0, %for.cond306.preheader ], [ %indvars.iv.next563, %for.inc321 ]
  br label %for.body311, !dbg !399

for.body311:                                      ; preds = %for.body311, %for.cond309.preheader
  %indvars.iv555 = phi i64 [ 0, %for.cond309.preheader ], [ %indvars.iv.next556, %for.body311 ]
  %24 = shl i64 %indvars.iv555, 3, !dbg !402
  %25 = add nuw nsw i64 %24, %indvars.iv562, !dbg !404
  %26 = shl i64 %25, 3, !dbg !405
  %arrayidx317 = getelementptr inbounds [13 x [512 x i32]]* @p, i64 0, i64 11, i64 %26, !dbg !406
  store i32 1, i32* %arrayidx317, align 16, !dbg !406, !tbaa !149
  %indvars.iv.next556 = add nuw nsw i64 %indvars.iv555, 1, !dbg !399
  %exitcond561 = icmp eq i64 %indvars.iv.next556, 2, !dbg !399
  br i1 %exitcond561, label %for.inc321, label %for.body311, !dbg !399

for.inc321:                                       ; preds = %for.body311
  %indvars.iv.next563 = add nuw nsw i64 %indvars.iv562, 1, !dbg !395
  %exitcond564 = icmp eq i64 %indvars.iv.next563, 2, !dbg !395
  br i1 %exitcond564, label %for.end326, label %for.cond309.preheader, !dbg !395

for.end326:                                       ; preds = %for.inc321
  store i32 2, i32* getelementptr inbounds ([13 x i32]* @class, i64 0, i64 11), align 4, !dbg !407, !tbaa !149
  store i32 72, i32* getelementptr inbounds ([13 x i32]* @piecemax, i64 0, i64 11), align 4, !dbg !408, !tbaa !149
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !40, metadata !142), !dbg !269
  br label %for.cond330.preheader, !dbg !409

for.cond330.preheader:                            ; preds = %for.inc348, %for.end326
  %indvars.iv552 = phi i64 [ 0, %for.end326 ], [ %indvars.iv.next553, %for.inc348 ]
  br label %for.cond333.preheader, !dbg !411

for.cond333.preheader:                            ; preds = %for.inc345, %for.cond330.preheader
  %indvars.iv549 = phi i64 [ 0, %for.cond330.preheader ], [ %indvars.iv.next550, %for.inc345 ]
  br label %for.body335, !dbg !414

for.body335:                                      ; preds = %for.body335, %for.cond333.preheader
  %indvars.iv = phi i64 [ 0, %for.cond333.preheader ], [ %indvars.iv.next, %for.body335 ]
  %27 = shl i64 %indvars.iv, 3, !dbg !417
  %28 = add nuw nsw i64 %27, %indvars.iv549, !dbg !419
  %29 = shl i64 %28, 3, !dbg !420
  %30 = add nuw nsw i64 %29, %indvars.iv552, !dbg !421
  %arrayidx341 = getelementptr inbounds [13 x [512 x i32]]* @p, i64 0, i64 12, i64 %30, !dbg !422
  store i32 1, i32* %arrayidx341, align 4, !dbg !422, !tbaa !149
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !414
  %exitcond = icmp eq i64 %indvars.iv.next, 2, !dbg !414
  br i1 %exitcond, label %for.inc345, label %for.body335, !dbg !414

for.inc345:                                       ; preds = %for.body335
  %indvars.iv.next550 = add nuw nsw i64 %indvars.iv549, 1, !dbg !411
  %exitcond551 = icmp eq i64 %indvars.iv.next550, 2, !dbg !411
  br i1 %exitcond551, label %for.inc348, label %for.cond333.preheader, !dbg !411

for.inc348:                                       ; preds = %for.inc345
  %indvars.iv.next553 = add nuw nsw i64 %indvars.iv552, 1, !dbg !409
  %exitcond554 = icmp eq i64 %indvars.iv.next553, 2, !dbg !409
  br i1 %exitcond554, label %for.end350, label %for.cond330.preheader, !dbg !409

for.end350:                                       ; preds = %for.inc348
  store i32 3, i32* getelementptr inbounds ([13 x i32]* @class, i64 0, i64 12), align 16, !dbg !423, !tbaa !149
  store i32 73, i32* getelementptr inbounds ([13 x i32]* @piecemax, i64 0, i64 12), align 16, !dbg !424, !tbaa !149
  store i32 13, i32* getelementptr inbounds ([4 x i32]* @piececount, i64 0, i64 0), align 16, !dbg !425, !tbaa !149
  store i32 3, i32* getelementptr inbounds ([4 x i32]* @piececount, i64 0, i64 1), align 4, !dbg !426, !tbaa !149
  store i32 1, i32* getelementptr inbounds ([4 x i32]* @piececount, i64 0, i64 2), align 8, !dbg !427, !tbaa !149
  store i32 1, i32* getelementptr inbounds ([4 x i32]* @piececount, i64 0, i64 3), align 4, !dbg !428, !tbaa !149
  tail call void @llvm.dbg.value(metadata i32 73, i64 0, metadata !43, metadata !142), !dbg !232
  store i32 0, i32* @kount, align 4, !dbg !429, !tbaa !149
  %call = tail call i32 @Fit(i32 0, i32 73), !dbg !430
  %tobool = icmp eq i32 %call, 0, !dbg !432
  br i1 %tobool, label %if.else, label %if.then, !dbg !432

if.then:                                          ; preds = %for.end350
  %call351 = tail call i32 @Place(i32 0, i32 73), !dbg !433
  store i32 %call351, i32* @n, align 4, !dbg !434, !tbaa !149
  br label %if.end, !dbg !434

if.else:                                          ; preds = %for.end350
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([17 x i8]* @str, i64 0, i64 0)), !dbg !435
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %31 = load i32* @n, align 4, !dbg !436, !tbaa !149
  %call353 = tail call i32 @Trial(i32 %31), !dbg !438
  %tobool354 = icmp eq i32 %call353, 0, !dbg !439
  br i1 %tobool354, label %if.then355, label %if.else357, !dbg !439

if.then355:                                       ; preds = %if.end
  %puts498 = tail call i32 @puts(i8* getelementptr inbounds ([18 x i8]* @str4, i64 0, i64 0)), !dbg !440
  br label %if.end362, !dbg !440

if.else357:                                       ; preds = %if.end
  %32 = load i32* @kount, align 4, !dbg !442, !tbaa !149
  %cmp358 = icmp eq i32 %32, 2005, !dbg !442
  br i1 %cmp358, label %if.end362, label %if.then359, !dbg !444

if.then359:                                       ; preds = %if.else357
  %puts499 = tail call i32 @puts(i8* getelementptr inbounds ([18 x i8]* @str5, i64 0, i64 0)), !dbg !445
  br label %if.end362, !dbg !445

if.end362:                                        ; preds = %if.else357, %if.then359, %if.then355
  %33 = load i32* @n, align 4, !dbg !447, !tbaa !149
  %call363 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str3, i64 0, i64 0), i32 %33) #4, !dbg !448
  %34 = load i32* @kount, align 4, !dbg !449, !tbaa !149
  %call364 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str3, i64 0, i64 0), i32 %34) #4, !dbg !450
  ret void, !dbg !451
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !46, metadata !142), !dbg !452
  br label %for.body, !dbg !453

for.body:                                         ; preds = %for.body, %entry
  %i.02 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  tail call void @Puzzle(), !dbg !455
  %inc = add nuw nsw i32 %i.02, 1, !dbg !458
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !46, metadata !142), !dbg !452
  %exitcond = icmp eq i32 %inc, 100, !dbg !453
  br i1 %exitcond, label %for.end, label %for.body, !dbg !453

for.end:                                          ; preds = %for.body
  ret i32 0, !dbg !460
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #3

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #4

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #4

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!128, !129}
!llvm.ident = !{!130}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !5, !47, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c] [DW_LANG_C99]
!1 = !{!"puzzle-stanford.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4}
!4 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!5 = !{!6, !10, !12, !19, !24, !31, !38, !44}
!6 = !{!"0x2e\00Initrand\00Initrand\00\00115\000\001\000\000\000\001\00115", !1, !7, !8, null, void ()* @Initrand, null, null, !2} ; [ DW_TAG_subprogram ] [line 115] [def] [Initrand]
!7 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!8 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !9, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!9 = !{null}
!10 = !{!"0x2e\00Rand\00Rand\00\00119\000\001\000\000\000\001\00119", !1, !7, !11, null, i32 ()* @Rand, null, null, !2} ; [ DW_TAG_subprogram ] [line 119] [def] [Rand]
!11 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !3, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!12 = !{!"0x2e\00Fit\00Fit\00\00128\000\001\000\000\00256\001\00128", !1, !7, !13, null, i32 (i32, i32)* @Fit, null, null, !15} ; [ DW_TAG_subprogram ] [line 128] [def] [Fit]
!13 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !14, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = !{!4, !4, !4}
!15 = !{!16, !17, !18}
!16 = !{!"0x101\00i\0016777344\000", !12, !7, !4} ; [ DW_TAG_arg_variable ] [i] [line 128]
!17 = !{!"0x101\00j\0033554560\000", !12, !7, !4} ; [ DW_TAG_arg_variable ] [j] [line 128]
!18 = !{!"0x100\00k\00129\000", !12, !7, !4}      ; [ DW_TAG_auto_variable ] [k] [line 129]
!19 = !{!"0x2e\00Place\00Place\00\00135\000\001\000\000\00256\001\00135", !1, !7, !13, null, i32 (i32, i32)* @Place, null, null, !20} ; [ DW_TAG_subprogram ] [line 135] [def] [Place]
!20 = !{!21, !22, !23}
!21 = !{!"0x101\00i\0016777351\000", !19, !7, !4} ; [ DW_TAG_arg_variable ] [i] [line 135]
!22 = !{!"0x101\00j\0033554567\000", !19, !7, !4} ; [ DW_TAG_arg_variable ] [j] [line 135]
!23 = !{!"0x100\00k\00136\000", !19, !7, !4}      ; [ DW_TAG_auto_variable ] [k] [line 136]
!24 = !{!"0x2e\00Remove\00Remove\00\00143\000\001\000\000\00256\001\00143", !1, !7, !25, null, void (i32, i32)* @Remove, null, null, !27} ; [ DW_TAG_subprogram ] [line 143] [def] [Remove]
!25 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !26, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!26 = !{null, !4, !4}
!27 = !{!28, !29, !30}
!28 = !{!"0x101\00i\0016777359\000", !24, !7, !4} ; [ DW_TAG_arg_variable ] [i] [line 143]
!29 = !{!"0x101\00j\0033554575\000", !24, !7, !4} ; [ DW_TAG_arg_variable ] [j] [line 143]
!30 = !{!"0x100\00k\00144\000", !24, !7, !4}      ; [ DW_TAG_auto_variable ] [k] [line 144]
!31 = !{!"0x2e\00Trial\00Trial\00\00149\000\001\000\000\00256\001\00149", !1, !7, !32, null, i32 (i32)* @Trial, null, null, !34} ; [ DW_TAG_subprogram ] [line 149] [def] [Trial]
!32 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !33, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!33 = !{!4, !4}
!34 = !{!35, !36, !37}
!35 = !{!"0x101\00j\0016777365\000", !31, !7, !4} ; [ DW_TAG_arg_variable ] [j] [line 149]
!36 = !{!"0x100\00i\00150\000", !31, !7, !4}      ; [ DW_TAG_auto_variable ] [i] [line 150]
!37 = !{!"0x100\00k\00150\000", !31, !7, !4}      ; [ DW_TAG_auto_variable ] [k] [line 150]
!38 = !{!"0x2e\00Puzzle\00Puzzle\00\00162\000\001\000\000\000\001\00162", !1, !7, !8, null, void ()* @Puzzle, null, null, !39} ; [ DW_TAG_subprogram ] [line 162] [def] [Puzzle]
!39 = !{!40, !41, !42, !43}
!40 = !{!"0x100\00i\00163\000", !38, !7, !4}      ; [ DW_TAG_auto_variable ] [i] [line 163]
!41 = !{!"0x100\00j\00163\000", !38, !7, !4}      ; [ DW_TAG_auto_variable ] [j] [line 163]
!42 = !{!"0x100\00k\00163\000", !38, !7, !4}      ; [ DW_TAG_auto_variable ] [k] [line 163]
!43 = !{!"0x100\00m\00163\000", !38, !7, !4}      ; [ DW_TAG_auto_variable ] [m] [line 163]
!44 = !{!"0x2e\00main\00main\00\00220\000\001\000\000\000\001\00221", !1, !7, !11, null, i32 ()* @main, null, null, !45} ; [ DW_TAG_subprogram ] [line 220] [def] [scope 221] [main]
!45 = !{!46}
!46 = !{!"0x100\00i\00222\000", !44, !7, !4}      ; [ DW_TAG_auto_variable ] [i] [line 222]
!47 = !{!48, !50, !51, !52, !54, !58, !60, !67, !71, !79, !80, !81, !85, !86, !87, !89, !90, !91, !92, !96, !97, !101, !104, !105, !106, !110, !111, !112, !113, !121, !122, !126, !127}
!48 = !{!"0x34\00value\00value\00\0081\000\001", null, !7, !49, float* @value, null} ; [ DW_TAG_variable ] [value] [line 81] [def]
!49 = !{!"0x24\00float\000\0032\0032\000\000\004", null, null} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!50 = !{!"0x34\00fixed\00fixed\00\0081\000\001", null, !7, !49, float* @fixed, null} ; [ DW_TAG_variable ] [fixed] [line 81] [def]
!51 = !{!"0x34\00floated\00floated\00\0081\000\001", null, !7, !49, float* @floated, null} ; [ DW_TAG_variable ] [floated] [line 81] [def]
!52 = !{!"0x34\00seed\00seed\00\0084\000\001", null, !7, !53, i64* @seed, null} ; [ DW_TAG_variable ] [seed] [line 84] [def]
!53 = !{!"0x24\00long int\000\0064\0064\000\000\005", null, null} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!54 = !{!"0x34\00permarray\00permarray\00\0087\000\001", null, !7, !55, [11 x i32]* @permarray, null} ; [ DW_TAG_variable ] [permarray] [line 87] [def]
!55 = !{!"0x1\00\000\00352\0032\000\000\000", null, null, !4, !56, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 352, align 32, offset 0] [from int]
!56 = !{!57}
!57 = !{!"0x21\000\0011"}                         ; [ DW_TAG_subrange_type ] [0, 10]
!58 = !{!"0x34\00pctr\00pctr\00\0089\000\001", null, !7, !59, i32* @pctr, null} ; [ DW_TAG_variable ] [pctr] [line 89] [def]
!59 = !{!"0x24\00unsigned int\000\0032\0032\000\000\007", null, null} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!60 = !{!"0x34\00tree\00tree\00\0092\000\001", null, !7, !61, %struct.node** @tree, null} ; [ DW_TAG_variable ] [tree] [line 92] [def]
!61 = !{!"0xf\00\000\0064\0064\000\000", null, null, !62} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from node]
!62 = !{!"0x13\00node\0045\00192\0064\000\000\000", !1, null, null, !63, null, null, null} ; [ DW_TAG_structure_type ] [node] [line 45, size 192, align 64, offset 0] [def] [from ]
!63 = !{!64, !65, !66}
!64 = !{!"0xd\00left\0046\0064\0064\000\000", !1, !62, !61} ; [ DW_TAG_member ] [left] [line 46, size 64, align 64, offset 0] [from ]
!65 = !{!"0xd\00right\0046\0064\0064\0064\000", !1, !62, !61} ; [ DW_TAG_member ] [right] [line 46, size 64, align 64, offset 64] [from ]
!66 = !{!"0xd\00val\0047\0032\0032\00128\000", !1, !62, !4} ; [ DW_TAG_member ] [val] [line 47, size 32, align 32, offset 128] [from int]
!67 = !{!"0x34\00stack\00stack\00\0095\000\001", null, !7, !68, [4 x i32]* @stack, null} ; [ DW_TAG_variable ] [stack] [line 95] [def]
!68 = !{!"0x1\00\000\00128\0032\000\000\000", null, null, !4, !69, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 128, align 32, offset 0] [from int]
!69 = !{!70}
!70 = !{!"0x21\000\004"}                          ; [ DW_TAG_subrange_type ] [0, 3]
!71 = !{!"0x34\00cellspace\00cellspace\00\0096\000\001", null, !7, !72, [19 x %struct.element]* @cellspace, null} ; [ DW_TAG_variable ] [cellspace] [line 96] [def]
!72 = !{!"0x1\00\000\001216\0032\000\000\000", null, null, !73, !77, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1216, align 32, offset 0] [from element]
!73 = !{!"0x13\00element\0054\0064\0032\000\000\000", !1, null, null, !74, null, null, null} ; [ DW_TAG_structure_type ] [element] [line 54, size 64, align 32, offset 0] [def] [from ]
!74 = !{!75, !76}
!75 = !{!"0xd\00discsize\0055\0032\0032\000\000", !1, !73, !4} ; [ DW_TAG_member ] [discsize] [line 55, size 32, align 32, offset 0] [from int]
!76 = !{!"0xd\00next\0056\0032\0032\0032\000", !1, !73, !4} ; [ DW_TAG_member ] [next] [line 56, size 32, align 32, offset 32] [from int]
!77 = !{!78}
!78 = !{!"0x21\000\0019"}                         ; [ DW_TAG_subrange_type ] [0, 18]
!79 = !{!"0x34\00freelist\00freelist\00\0097\000\001", null, !7, !4, i32* @freelist, null} ; [ DW_TAG_variable ] [freelist] [line 97] [def]
!80 = !{!"0x34\00movesdone\00movesdone\00\0097\000\001", null, !7, !4, i32* @movesdone, null} ; [ DW_TAG_variable ] [movesdone] [line 97] [def]
!81 = !{!"0x34\00ima\00ima\00\00101\000\001", null, !7, !82, [41 x [41 x i32]]* @ima, null} ; [ DW_TAG_variable ] [ima] [line 101] [def]
!82 = !{!"0x1\00\000\0053792\0032\000\000\000", null, null, !4, !83, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 53792, align 32, offset 0] [from int]
!83 = !{!84, !84}
!84 = !{!"0x21\000\0041"}                         ; [ DW_TAG_subrange_type ] [0, 40]
!85 = !{!"0x34\00imb\00imb\00\00101\000\001", null, !7, !82, [41 x [41 x i32]]* @imb, null} ; [ DW_TAG_variable ] [imb] [line 101] [def]
!86 = !{!"0x34\00imr\00imr\00\00101\000\001", null, !7, !82, [41 x [41 x i32]]* @imr, null} ; [ DW_TAG_variable ] [imr] [line 101] [def]
!87 = !{!"0x34\00rma\00rma\00\00102\000\001", null, !7, !88, [41 x [41 x float]]* @rma, null} ; [ DW_TAG_variable ] [rma] [line 102] [def]
!88 = !{!"0x1\00\000\0053792\0032\000\000\000", null, null, !49, !83, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 53792, align 32, offset 0] [from float]
!89 = !{!"0x34\00rmb\00rmb\00\00102\000\001", null, !7, !88, [41 x [41 x float]]* @rmb, null} ; [ DW_TAG_variable ] [rmb] [line 102] [def]
!90 = !{!"0x34\00rmr\00rmr\00\00102\000\001", null, !7, !88, [41 x [41 x float]]* @rmr, null} ; [ DW_TAG_variable ] [rmr] [line 102] [def]
!91 = !{!"0x34\00piececount\00piececount\00\00105\000\001", null, !7, !68, [4 x i32]* @piececount, null} ; [ DW_TAG_variable ] [piececount] [line 105] [def]
!92 = !{!"0x34\00class\00class\00\00105\000\001", null, !7, !93, [13 x i32]* @class, null} ; [ DW_TAG_variable ] [class] [line 105] [def]
!93 = !{!"0x1\00\000\00416\0032\000\000\000", null, null, !4, !94, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 416, align 32, offset 0] [from int]
!94 = !{!95}
!95 = !{!"0x21\000\0013"}                         ; [ DW_TAG_subrange_type ] [0, 12]
!96 = !{!"0x34\00piecemax\00piecemax\00\00105\000\001", null, !7, !93, [13 x i32]* @piecemax, null} ; [ DW_TAG_variable ] [piecemax] [line 105] [def]
!97 = !{!"0x34\00puzzl\00puzzl\00\00106\000\001", null, !7, !98, [512 x i32]* @puzzl, null} ; [ DW_TAG_variable ] [puzzl] [line 106] [def]
!98 = !{!"0x1\00\000\0016384\0032\000\000\000", null, null, !4, !99, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16384, align 32, offset 0] [from int]
!99 = !{!100}
!100 = !{!"0x21\000\00512"}                       ; [ DW_TAG_subrange_type ] [0, 511]
!101 = !{!"0x34\00p\00p\00\00106\000\001", null, !7, !102, [13 x [512 x i32]]* @p, null} ; [ DW_TAG_variable ] [p] [line 106] [def]
!102 = !{!"0x1\00\000\00212992\0032\000\000\000", null, null, !4, !103, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 212992, align 32, offset 0] [from int]
!103 = !{!95, !100}
!104 = !{!"0x34\00n\00n\00\00106\000\001", null, !7, !4, i32* @n, null} ; [ DW_TAG_variable ] [n] [line 106] [def]
!105 = !{!"0x34\00kount\00kount\00\00106\000\001", null, !7, !4, i32* @kount, null} ; [ DW_TAG_variable ] [kount] [line 106] [def]
!106 = !{!"0x34\00sortlist\00sortlist\00\00109\000\001", null, !7, !107, [5001 x i32]* @sortlist, null} ; [ DW_TAG_variable ] [sortlist] [line 109] [def]
!107 = !{!"0x1\00\000\00160032\0032\000\000\000", null, null, !4, !108, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 160032, align 32, offset 0] [from int]
!108 = !{!109}
!109 = !{!"0x21\000\005001"}                      ; [ DW_TAG_subrange_type ] [0, 5000]
!110 = !{!"0x34\00biggest\00biggest\00\00109\000\001", null, !7, !4, i32* @biggest, null} ; [ DW_TAG_variable ] [biggest] [line 109] [def]
!111 = !{!"0x34\00littlest\00littlest\00\00109\000\001", null, !7, !4, i32* @littlest, null} ; [ DW_TAG_variable ] [littlest] [line 109] [def]
!112 = !{!"0x34\00top\00top\00\00109\000\001", null, !7, !4, i32* @top, null} ; [ DW_TAG_variable ] [top] [line 109] [def]
!113 = !{!"0x34\00z\00z\00\00112\000\001", null, !7, !114, [257 x %struct.complex]* @z, null} ; [ DW_TAG_variable ] [z] [line 112] [def]
!114 = !{!"0x1\00\000\0016448\0032\000\000\000", null, null, !115, !119, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16448, align 32, offset 0] [from complex]
!115 = !{!"0x13\00complex\0075\0064\0032\000\000\000", !1, null, null, !116, null, null, null} ; [ DW_TAG_structure_type ] [complex] [line 75, size 64, align 32, offset 0] [def] [from ]
!116 = !{!117, !118}
!117 = !{!"0xd\00rp\0075\0032\0032\000\000", !1, !115, !49} ; [ DW_TAG_member ] [rp] [line 75, size 32, align 32, offset 0] [from float]
!118 = !{!"0xd\00ip\0075\0032\0032\0032\000", !1, !115, !49} ; [ DW_TAG_member ] [ip] [line 75, size 32, align 32, offset 32] [from float]
!119 = !{!120}
!120 = !{!"0x21\000\00257"}                       ; [ DW_TAG_subrange_type ] [0, 256]
!121 = !{!"0x34\00w\00w\00\00112\000\001", null, !7, !114, [257 x %struct.complex]* @w, null} ; [ DW_TAG_variable ] [w] [line 112] [def]
!122 = !{!"0x34\00e\00e\00\00112\000\001", null, !7, !123, [130 x %struct.complex]* @e, null} ; [ DW_TAG_variable ] [e] [line 112] [def]
!123 = !{!"0x1\00\000\008320\0032\000\000\000", null, null, !115, !124, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 8320, align 32, offset 0] [from complex]
!124 = !{!125}
!125 = !{!"0x21\000\00130"}                       ; [ DW_TAG_subrange_type ] [0, 129]
!126 = !{!"0x34\00zr\00zr\00\00113\000\001", null, !7, !49, float* @zr, null} ; [ DW_TAG_variable ] [zr] [line 113] [def]
!127 = !{!"0x34\00zi\00zi\00\00113\000\001", null, !7, !49, float* @zi, null} ; [ DW_TAG_variable ] [zi] [line 113] [def]
!128 = !{i32 2, !"Dwarf Version", i32 4}
!129 = !{i32 2, !"Debug Info Version", i32 2}
!130 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!131 = !MDLocation(line: 116, column: 5, scope: !6)
!132 = !{!133, !133, i64 0}
!133 = !{!"long", !134, i64 0}
!134 = !{!"omnipotent char", !135, i64 0}
!135 = !{!"Simple C/C++ TBAA"}
!136 = !MDLocation(line: 117, column: 1, scope: !6)
!137 = !MDLocation(line: 120, column: 13, scope: !10)
!138 = !MDLocation(line: 120, column: 12, scope: !10)
!139 = !MDLocation(line: 120, column: 5, scope: !10)
!140 = !MDLocation(line: 121, column: 13, scope: !10)
!141 = !MDLocation(line: 121, column: 5, scope: !10)
!142 = !{!"0x102"}                                ; [ DW_TAG_expression ]
!143 = !MDLocation(line: 128, column: 14, scope: !12)
!144 = !MDLocation(line: 128, column: 21, scope: !12)
!145 = !MDLocation(line: 129, column: 6, scope: !12)
!146 = !MDLocation(line: 130, column: 20, scope: !147)
!147 = !{!"0xb\00130\002\001", !1, !148}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!148 = !{!"0xb\00130\002\000", !1, !12}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!149 = !{!150, !150, i64 0}
!150 = !{!"int", !134, i64 0}
!151 = !MDLocation(line: 130, column: 15, scope: !147)
!152 = !MDLocation(line: 130, column: 2, scope: !148)
!153 = !MDLocation(line: 131, column: 11, scope: !154)
!154 = !{!"0xb\00131\0011\002", !1, !147}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!155 = !MDLocation(line: 131, column: 11, scope: !147)
!156 = !MDLocation(line: 131, column: 32, scope: !157)
!157 = !{!"0xb\00131\0026\003", !1, !154}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!158 = !MDLocation(line: 131, column: 26, scope: !157)
!159 = !MDLocation(line: 131, column: 26, scope: !154)
!160 = !MDLocation(line: 133, column: 1, scope: !12)
!161 = !MDLocation(line: 135, column: 16, scope: !19)
!162 = !MDLocation(line: 135, column: 23, scope: !19)
!163 = !MDLocation(line: 136, column: 6, scope: !19)
!164 = !MDLocation(line: 137, column: 20, scope: !165)
!165 = !{!"0xb\00137\002\005", !1, !166}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!166 = !{!"0xb\00137\002\004", !1, !19}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!167 = !MDLocation(line: 137, column: 15, scope: !165)
!168 = !MDLocation(line: 137, column: 2, scope: !166)
!169 = !MDLocation(line: 137, column: 44, scope: !170)
!170 = !{!"0xb\00137\0044\006", !1, !165}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!171 = !MDLocation(line: 137, column: 44, scope: !165)
!172 = !MDLocation(line: 137, column: 60, scope: !170)
!173 = !MDLocation(line: 137, column: 54, scope: !170)
!174 = !MDLocation(line: 138, column: 36, scope: !19)
!175 = !MDLocation(line: 138, column: 25, scope: !19)
!176 = !MDLocation(line: 138, column: 2, scope: !19)
!177 = !MDLocation(line: 139, column: 15, scope: !178)
!178 = !{!"0xb\006", !1, !179}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!179 = !{!"0xb\001", !1, !180}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!180 = !{!"0xb\00139\002\008", !1, !181}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!181 = !{!"0xb\00139\002\007", !1, !19}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!182 = !MDLocation(line: 139, column: 2, scope: !181)
!183 = !MDLocation(line: 139, column: 39, scope: !184)
!184 = !{!"0xb\00139\0037\009", !1, !180}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!185 = !MDLocation(line: 139, column: 37, scope: !180)
!186 = !MDLocation(line: 141, column: 1, scope: !19)
!187 = !MDLocation(line: 143, column: 18, scope: !24)
!188 = !MDLocation(line: 143, column: 25, scope: !24)
!189 = !MDLocation(line: 144, column: 6, scope: !24)
!190 = !MDLocation(line: 145, column: 20, scope: !191)
!191 = !{!"0xb\00145\002\0011", !1, !192}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!192 = !{!"0xb\00145\002\0010", !1, !24}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!193 = !MDLocation(line: 145, column: 15, scope: !191)
!194 = !MDLocation(line: 145, column: 2, scope: !192)
!195 = !MDLocation(line: 145, column: 44, scope: !196)
!196 = !{!"0xb\00145\0044\0012", !1, !191}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!197 = !MDLocation(line: 145, column: 44, scope: !191)
!198 = !MDLocation(line: 145, column: 60, scope: !196)
!199 = !MDLocation(line: 145, column: 54, scope: !196)
!200 = !MDLocation(line: 146, column: 36, scope: !24)
!201 = !MDLocation(line: 146, column: 25, scope: !24)
!202 = !MDLocation(line: 146, column: 2, scope: !24)
!203 = !MDLocation(line: 147, column: 1, scope: !24)
!204 = !MDLocation(line: 149, column: 16, scope: !31)
!205 = !MDLocation(line: 151, column: 10, scope: !31)
!206 = !MDLocation(line: 151, column: 2, scope: !31)
!207 = !MDLocation(line: 150, column: 6, scope: !31)
!208 = !MDLocation(line: 152, column: 2, scope: !209)
!209 = !{!"0xb\00152\002\0013", !1, !31}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!210 = !MDLocation(line: 153, column: 22, scope: !211)
!211 = !{!"0xb\00153\0011\0015", !1, !212}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!212 = !{!"0xb\00152\002\0014", !1, !209}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!213 = !MDLocation(line: 153, column: 11, scope: !211)
!214 = !MDLocation(line: 153, column: 11, scope: !212)
!215 = !MDLocation(line: 154, column: 8, scope: !216)
!216 = !{!"0xb\00154\008\0016", !1, !211}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!217 = !MDLocation(line: 154, column: 8, scope: !211)
!218 = !MDLocation(line: 155, column: 11, scope: !219)
!219 = !{!"0xb\00154\0021\0017", !1, !216}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!220 = !MDLocation(line: 150, column: 9, scope: !31)
!221 = !MDLocation(line: 156, column: 12, scope: !222)
!222 = !{!"0xb\00156\0012\0018", !1, !219}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!223 = !MDLocation(line: 156, column: 12, scope: !219)
!224 = !MDLocation(line: 156, column: 25, scope: !225)
!225 = !{!"0xb\002", !1, !222}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!226 = !MDLocation(line: 157, column: 9, scope: !222)
!227 = !MDLocation(line: 158, column: 3, scope: !219)
!228 = !MDLocation(line: 152, column: 15, scope: !229)
!229 = !{!"0xb\002", !1, !230}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!230 = !{!"0xb\001", !1, !212}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!231 = !MDLocation(line: 160, column: 1, scope: !31)
!232 = !MDLocation(line: 163, column: 18, scope: !38)
!233 = !MDLocation(line: 164, column: 5, scope: !234)
!234 = !{!"0xb\00164\005\0019", !1, !38}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!235 = !MDLocation(line: 164, column: 35, scope: !236)
!236 = !{!"0xb\00164\005\0020", !1, !234}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!237 = !MDLocation(line: 165, column: 30, scope: !238)
!238 = !{!"0xb\00165\0030\0023", !1, !239}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!239 = !{!"0xb\00165\005\0022", !1, !240}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!240 = !{!"0xb\00165\005\0021", !1, !38}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!241 = !MDLocation(line: 165, column: 55, scope: !242)
!242 = !{!"0xb\00165\0055\0025", !1, !243}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!243 = !{!"0xb\00165\0030\0024", !1, !238}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!244 = !MDLocation(line: 165, column: 94, scope: !245)
!245 = !{!"0xb\00165\0055\0026", !1, !242}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!246 = !MDLocation(line: 165, column: 92, scope: !245)
!247 = !MDLocation(line: 165, column: 89, scope: !245)
!248 = !MDLocation(line: 165, column: 87, scope: !245)
!249 = !MDLocation(line: 165, column: 81, scope: !245)
!250 = !MDLocation(line: 165, column: 5, scope: !240)
!251 = !MDLocation(line: 166, column: 64, scope: !252)
!252 = !{!"0xb\00166\0036\0030", !1, !253}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!253 = !{!"0xb\00166\0036\0029", !1, !254}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!254 = !{!"0xb\00166\005\0028", !1, !255}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!255 = !{!"0xb\00166\005\0027", !1, !38}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!256 = !MDLocation(line: 167, column: 5, scope: !257)
!257 = !{!"0xb\00167\005\0031", !1, !38}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!258 = !MDLocation(line: 167, column: 30, scope: !259)
!259 = !{!"0xb\00167\0030\0033", !1, !260}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!260 = !{!"0xb\00167\005\0032", !1, !257}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!261 = !MDLocation(line: 167, column: 88, scope: !262)
!262 = !{!"0xb\00167\0055\0036", !1, !263}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!263 = !{!"0xb\00167\0055\0035", !1, !264}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!264 = !{!"0xb\00167\0030\0034", !1, !259}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!265 = !MDLocation(line: 167, column: 86, scope: !262)
!266 = !MDLocation(line: 167, column: 81, scope: !262)
!267 = !MDLocation(line: 168, column: 5, scope: !38)
!268 = !MDLocation(line: 169, column: 5, scope: !38)
!269 = !MDLocation(line: 163, column: 9, scope: !38)
!270 = !MDLocation(line: 170, column: 5, scope: !271)
!271 = !{!"0xb\00170\005\0037", !1, !38}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!272 = !MDLocation(line: 170, column: 55, scope: !273)
!273 = !{!"0xb\00170\0055\0041", !1, !274}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!274 = !{!"0xb\00170\0030\0040", !1, !275}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!275 = !{!"0xb\00170\0030\0039", !1, !276}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!276 = !{!"0xb\00170\005\0038", !1, !271}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!277 = !MDLocation(line: 170, column: 93, scope: !278)
!278 = !{!"0xb\00170\0055\0042", !1, !273}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!279 = !MDLocation(line: 170, column: 86, scope: !278)
!280 = !MDLocation(line: 170, column: 81, scope: !278)
!281 = !MDLocation(line: 171, column: 5, scope: !38)
!282 = !MDLocation(line: 172, column: 5, scope: !38)
!283 = !MDLocation(line: 173, column: 30, scope: !284)
!284 = !{!"0xb\00173\0030\0045", !1, !285}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!285 = !{!"0xb\00173\005\0044", !1, !286}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!286 = !{!"0xb\00173\005\0043", !1, !38}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!287 = !MDLocation(line: 173, column: 55, scope: !288)
!288 = !{!"0xb\00173\0055\0047", !1, !289}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!289 = !{!"0xb\00173\0030\0046", !1, !284}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!290 = !MDLocation(line: 173, column: 93, scope: !291)
!291 = !{!"0xb\00173\0055\0048", !1, !288}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!292 = !MDLocation(line: 173, column: 91, scope: !291)
!293 = !MDLocation(line: 173, column: 88, scope: !291)
!294 = !MDLocation(line: 173, column: 81, scope: !291)
!295 = !MDLocation(line: 174, column: 5, scope: !38)
!296 = !MDLocation(line: 175, column: 5, scope: !38)
!297 = !MDLocation(line: 176, column: 5, scope: !298)
!298 = !{!"0xb\00176\005\0049", !1, !38}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!299 = !MDLocation(line: 176, column: 30, scope: !300)
!300 = !{!"0xb\00176\0030\0051", !1, !301}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!301 = !{!"0xb\00176\005\0050", !1, !298}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!302 = !MDLocation(line: 176, column: 88, scope: !303)
!303 = !{!"0xb\00176\0055\0054", !1, !304}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!304 = !{!"0xb\00176\0055\0053", !1, !305}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!305 = !{!"0xb\00176\0030\0052", !1, !300}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!306 = !MDLocation(line: 176, column: 86, scope: !303)
!307 = !MDLocation(line: 176, column: 81, scope: !303)
!308 = !MDLocation(line: 177, column: 5, scope: !38)
!309 = !MDLocation(line: 178, column: 5, scope: !38)
!310 = !MDLocation(line: 179, column: 5, scope: !311)
!311 = !{!"0xb\00179\005\0055", !1, !38}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!312 = !MDLocation(line: 179, column: 55, scope: !313)
!313 = !{!"0xb\00179\0055\0059", !1, !314}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!314 = !{!"0xb\00179\0030\0058", !1, !315}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!315 = !{!"0xb\00179\0030\0057", !1, !316}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!316 = !{!"0xb\00179\005\0056", !1, !311}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!317 = !MDLocation(line: 179, column: 93, scope: !318)
!318 = !{!"0xb\00179\0055\0060", !1, !313}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!319 = !MDLocation(line: 179, column: 86, scope: !318)
!320 = !MDLocation(line: 179, column: 81, scope: !318)
!321 = !MDLocation(line: 180, column: 5, scope: !38)
!322 = !MDLocation(line: 181, column: 5, scope: !38)
!323 = !MDLocation(line: 182, column: 30, scope: !324)
!324 = !{!"0xb\00182\0030\0063", !1, !325}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!325 = !{!"0xb\00182\005\0062", !1, !326}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!326 = !{!"0xb\00182\005\0061", !1, !38}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!327 = !MDLocation(line: 182, column: 55, scope: !328)
!328 = !{!"0xb\00182\0055\0065", !1, !329}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!329 = !{!"0xb\00182\0030\0064", !1, !324}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!330 = !MDLocation(line: 182, column: 93, scope: !331)
!331 = !{!"0xb\00182\0055\0066", !1, !328}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!332 = !MDLocation(line: 182, column: 91, scope: !331)
!333 = !MDLocation(line: 182, column: 88, scope: !331)
!334 = !MDLocation(line: 182, column: 81, scope: !331)
!335 = !MDLocation(line: 183, column: 5, scope: !38)
!336 = !MDLocation(line: 184, column: 5, scope: !38)
!337 = !MDLocation(line: 185, column: 5, scope: !338)
!338 = !{!"0xb\00185\005\0067", !1, !38}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!339 = !MDLocation(line: 185, column: 81, scope: !340)
!340 = !{!"0xb\00185\0055\0072", !1, !341}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!341 = !{!"0xb\00185\0055\0071", !1, !342}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!342 = !{!"0xb\00185\0030\0070", !1, !343}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!343 = !{!"0xb\00185\0030\0069", !1, !344}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!344 = !{!"0xb\00185\005\0068", !1, !338}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!345 = !MDLocation(line: 186, column: 5, scope: !38)
!346 = !MDLocation(line: 187, column: 5, scope: !38)
!347 = !MDLocation(line: 188, column: 30, scope: !348)
!348 = !{!"0xb\00188\0030\0075", !1, !349}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!349 = !{!"0xb\00188\005\0074", !1, !350}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!350 = !{!"0xb\00188\005\0073", !1, !38}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!351 = !MDLocation(line: 188, column: 88, scope: !352)
!352 = !{!"0xb\00188\0055\0078", !1, !353}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!353 = !{!"0xb\00188\0055\0077", !1, !354}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!354 = !{!"0xb\00188\0030\0076", !1, !348}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!355 = !MDLocation(line: 188, column: 81, scope: !352)
!356 = !MDLocation(line: 189, column: 5, scope: !38)
!357 = !MDLocation(line: 190, column: 5, scope: !38)
!358 = !MDLocation(line: 191, column: 55, scope: !359)
!359 = !{!"0xb\00191\0055\0083", !1, !360}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!360 = !{!"0xb\00191\0030\0082", !1, !361}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!361 = !{!"0xb\00191\0030\0081", !1, !362}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!362 = !{!"0xb\00191\005\0080", !1, !363}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!363 = !{!"0xb\00191\005\0079", !1, !38}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!364 = !MDLocation(line: 191, column: 93, scope: !365)
!365 = !{!"0xb\00191\0055\0084", !1, !359}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!366 = !MDLocation(line: 191, column: 81, scope: !365)
!367 = !MDLocation(line: 192, column: 5, scope: !38)
!368 = !MDLocation(line: 193, column: 5, scope: !38)
!369 = !MDLocation(line: 194, column: 5, scope: !370)
!370 = !{!"0xb\00194\005\0085", !1, !38}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!371 = !MDLocation(line: 194, column: 30, scope: !372)
!372 = !{!"0xb\00194\0030\0087", !1, !373}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!373 = !{!"0xb\00194\005\0086", !1, !370}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!374 = !MDLocation(line: 194, column: 88, scope: !375)
!375 = !{!"0xb\00194\0055\0090", !1, !376}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!376 = !{!"0xb\00194\0055\0089", !1, !377}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!377 = !{!"0xb\00194\0030\0088", !1, !372}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!378 = !MDLocation(line: 194, column: 86, scope: !375)
!379 = !MDLocation(line: 194, column: 81, scope: !375)
!380 = !MDLocation(line: 195, column: 5, scope: !38)
!381 = !MDLocation(line: 196, column: 5, scope: !38)
!382 = !MDLocation(line: 197, column: 5, scope: !383)
!383 = !{!"0xb\00197\005\0091", !1, !38}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!384 = !MDLocation(line: 197, column: 55, scope: !385)
!385 = !{!"0xb\00197\0055\0095", !1, !386}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!386 = !{!"0xb\00197\0030\0094", !1, !387}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!387 = !{!"0xb\00197\0030\0093", !1, !388}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!388 = !{!"0xb\00197\005\0092", !1, !383}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!389 = !MDLocation(line: 197, column: 94, scope: !390)
!390 = !{!"0xb\00197\0055\0096", !1, !385}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!391 = !MDLocation(line: 197, column: 87, scope: !390)
!392 = !MDLocation(line: 197, column: 81, scope: !390)
!393 = !MDLocation(line: 198, column: 5, scope: !38)
!394 = !MDLocation(line: 199, column: 5, scope: !38)
!395 = !MDLocation(line: 200, column: 30, scope: !396)
!396 = !{!"0xb\00200\0030\0099", !1, !397}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!397 = !{!"0xb\00200\005\0098", !1, !398}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!398 = !{!"0xb\00200\005\0097", !1, !38}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!399 = !MDLocation(line: 200, column: 55, scope: !400)
!400 = !{!"0xb\00200\0055\00101", !1, !401}       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!401 = !{!"0xb\00200\0030\00100", !1, !396}       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!402 = !MDLocation(line: 200, column: 94, scope: !403)
!403 = !{!"0xb\00200\0055\00102", !1, !400}       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!404 = !MDLocation(line: 200, column: 92, scope: !403)
!405 = !MDLocation(line: 200, column: 89, scope: !403)
!406 = !MDLocation(line: 200, column: 81, scope: !403)
!407 = !MDLocation(line: 201, column: 5, scope: !38)
!408 = !MDLocation(line: 202, column: 5, scope: !38)
!409 = !MDLocation(line: 203, column: 5, scope: !410)
!410 = !{!"0xb\00203\005\00103", !1, !38}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!411 = !MDLocation(line: 203, column: 30, scope: !412)
!412 = !{!"0xb\00203\0030\00105", !1, !413}       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!413 = !{!"0xb\00203\005\00104", !1, !410}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!414 = !MDLocation(line: 203, column: 55, scope: !415)
!415 = !{!"0xb\00203\0055\00107", !1, !416}       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!416 = !{!"0xb\00203\0030\00106", !1, !412}       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!417 = !MDLocation(line: 203, column: 94, scope: !418)
!418 = !{!"0xb\00203\0055\00108", !1, !415}       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!419 = !MDLocation(line: 203, column: 92, scope: !418)
!420 = !MDLocation(line: 203, column: 89, scope: !418)
!421 = !MDLocation(line: 203, column: 87, scope: !418)
!422 = !MDLocation(line: 203, column: 81, scope: !418)
!423 = !MDLocation(line: 204, column: 5, scope: !38)
!424 = !MDLocation(line: 205, column: 5, scope: !38)
!425 = !MDLocation(line: 206, column: 5, scope: !38)
!426 = !MDLocation(line: 207, column: 5, scope: !38)
!427 = !MDLocation(line: 208, column: 5, scope: !38)
!428 = !MDLocation(line: 209, column: 5, scope: !38)
!429 = !MDLocation(line: 211, column: 5, scope: !38)
!430 = !MDLocation(line: 212, column: 10, scope: !431)
!431 = !{!"0xb\00212\0010\00109", !1, !38}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!432 = !MDLocation(line: 212, column: 10, scope: !38)
!433 = !MDLocation(line: 212, column: 26, scope: !431)
!434 = !MDLocation(line: 212, column: 22, scope: !431)
!435 = !MDLocation(line: 213, column: 10, scope: !431)
!436 = !MDLocation(line: 214, column: 18, scope: !437)
!437 = !{!"0xb\00214\0010\00110", !1, !38}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!438 = !MDLocation(line: 214, column: 12, scope: !437)
!439 = !MDLocation(line: 214, column: 10, scope: !38)
!440 = !MDLocation(line: 214, column: 23, scope: !441)
!441 = !{!"0xb\001", !1, !437}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!442 = !MDLocation(line: 215, column: 15, scope: !443)
!443 = !{!"0xb\00215\0015\00111", !1, !437}       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!444 = !MDLocation(line: 215, column: 15, scope: !437)
!445 = !MDLocation(line: 215, column: 31, scope: !446)
!446 = !{!"0xb\001", !1, !443}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!447 = !MDLocation(line: 216, column: 18, scope: !38)
!448 = !MDLocation(line: 216, column: 3, scope: !38)
!449 = !MDLocation(line: 217, column: 18, scope: !38)
!450 = !MDLocation(line: 217, column: 3, scope: !38)
!451 = !MDLocation(line: 218, column: 1, scope: !38)
!452 = !MDLocation(line: 222, column: 6, scope: !44)
!453 = !MDLocation(line: 223, column: 2, scope: !454)
!454 = !{!"0xb\00223\002\00112", !1, !44}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!455 = !MDLocation(line: 223, column: 28, scope: !456)
!456 = !{!"0xb\002", !1, !457}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!457 = !{!"0xb\00223\002\00113", !1, !454}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!458 = !MDLocation(line: 223, column: 23, scope: !459)
!459 = !{!"0xb\003", !1, !457}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle-stanford.c]
!460 = !MDLocation(line: 224, column: 2, scope: !44)
