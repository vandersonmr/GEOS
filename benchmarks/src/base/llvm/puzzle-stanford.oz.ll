; ModuleID = 'puzzle-stanford.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

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

; Function Attrs: minsize nounwind optsize uwtable
define void @Initrand() #0 {
  store i64 74755, i64* @seed, align 8, !dbg !131, !tbaa !132
  ret void, !dbg !136
}

; Function Attrs: minsize nounwind optsize uwtable
define i32 @Rand() #0 {
  %1 = load i64* @seed, align 8, !dbg !137, !tbaa !132
  %2 = mul nsw i64 %1, 1309, !dbg !137
  %3 = add nsw i64 %2, 13849, !dbg !137
  %4 = and i64 %3, 65535, !dbg !137
  store i64 %4, i64* @seed, align 8, !dbg !137, !tbaa !132
  %5 = trunc i64 %4 to i32, !dbg !138
  ret i32 %5, !dbg !138
}

; Function Attrs: minsize nounwind optsize readonly uwtable
define i32 @Fit(i32 %i, i32 %j) #1 {
  tail call void @llvm.dbg.value(metadata !{i32 %i}, i64 0, metadata !16), !dbg !139
  tail call void @llvm.dbg.value(metadata !{i32 %j}, i64 0, metadata !17), !dbg !139
  tail call void @llvm.dbg.value(metadata !140, i64 0, metadata !18), !dbg !141
  %1 = sext i32 %i to i64, !dbg !141
  %2 = getelementptr inbounds [13 x i32]* @piecemax, i64 0, i64 %1, !dbg !141
  %3 = load i32* %2, align 4, !dbg !141, !tbaa !143
  %4 = icmp slt i32 %3, 0, !dbg !141
  br i1 %4, label %._crit_edge, label %.lr.ph, !dbg !141

.lr.ph:                                           ; preds = %0
  %5 = sext i32 %j to i64, !dbg !141
  br label %6, !dbg !141

; <label>:6                                       ; preds = %15, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %15 ], [ 0, %.lr.ph ]
  %7 = getelementptr inbounds [13 x [512 x i32]]* @p, i64 0, i64 %1, i64 %indvars.iv, !dbg !145
  %8 = load i32* %7, align 4, !dbg !145, !tbaa !143
  %9 = icmp eq i32 %8, 0, !dbg !145
  br i1 %9, label %15, label %10, !dbg !145

; <label>:10                                      ; preds = %6
  %11 = add nsw i64 %indvars.iv, %5, !dbg !147
  %12 = getelementptr inbounds [512 x i32]* @puzzl, i64 0, i64 %11, !dbg !147
  %13 = load i32* %12, align 4, !dbg !147, !tbaa !143
  %14 = icmp eq i32 %13, 0, !dbg !147
  br i1 %14, label %15, label %._crit_edge, !dbg !147

; <label>:15                                      ; preds = %10, %6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !141
  %16 = trunc i64 %indvars.iv to i32, !dbg !141
  %17 = icmp slt i32 %16, %3, !dbg !141
  br i1 %17, label %6, label %._crit_edge, !dbg !141

._crit_edge:                                      ; preds = %10, %15, %0
  %.0 = phi i32 [ 1, %0 ], [ 0, %10 ], [ 1, %15 ]
  ret i32 %.0, !dbg !149
}

; Function Attrs: minsize nounwind optsize uwtable
define i32 @Place(i32 %i, i32 %j) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %i}, i64 0, metadata !21), !dbg !150
  tail call void @llvm.dbg.value(metadata !{i32 %j}, i64 0, metadata !22), !dbg !150
  tail call void @llvm.dbg.value(metadata !140, i64 0, metadata !23), !dbg !151
  %1 = sext i32 %i to i64, !dbg !151
  %2 = getelementptr inbounds [13 x i32]* @piecemax, i64 0, i64 %1, !dbg !151
  %3 = load i32* %2, align 4, !dbg !151, !tbaa !143
  %4 = icmp slt i32 %3, 0, !dbg !151
  br i1 %4, label %._crit_edge7, label %.lr.ph6, !dbg !151

.lr.ph6:                                          ; preds = %0
  %5 = sext i32 %j to i64, !dbg !151
  br label %6, !dbg !151

; <label>:6                                       ; preds = %13, %.lr.ph6
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %13 ], [ 0, %.lr.ph6 ]
  %7 = getelementptr inbounds [13 x [512 x i32]]* @p, i64 0, i64 %1, i64 %indvars.iv10, !dbg !153
  %8 = load i32* %7, align 4, !dbg !153, !tbaa !143
  %9 = icmp eq i32 %8, 0, !dbg !153
  br i1 %9, label %13, label %10, !dbg !153

; <label>:10                                      ; preds = %6
  %11 = add nsw i64 %indvars.iv10, %5, !dbg !153
  %12 = getelementptr inbounds [512 x i32]* @puzzl, i64 0, i64 %11, !dbg !153
  store i32 1, i32* %12, align 4, !dbg !153, !tbaa !143
  br label %13, !dbg !153

; <label>:13                                      ; preds = %6, %10
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1, !dbg !151
  %14 = trunc i64 %indvars.iv10 to i32, !dbg !151
  %15 = icmp slt i32 %14, %3, !dbg !151
  br i1 %15, label %6, label %._crit_edge7, !dbg !151

._crit_edge7:                                     ; preds = %13, %0
  %16 = getelementptr inbounds [13 x i32]* @class, i64 0, i64 %1, !dbg !155
  %17 = load i32* %16, align 4, !dbg !155, !tbaa !143
  %18 = sext i32 %17 to i64, !dbg !155
  %19 = getelementptr inbounds [4 x i32]* @piececount, i64 0, i64 %18, !dbg !155
  %20 = load i32* %19, align 4, !dbg !155, !tbaa !143
  %21 = add nsw i32 %20, -1, !dbg !155
  store i32 %21, i32* %19, align 4, !dbg !155, !tbaa !143
  tail call void @llvm.dbg.value(metadata !{i32 %j}, i64 0, metadata !23), !dbg !156
  %22 = icmp slt i32 %j, 512, !dbg !156
  br i1 %22, label %.lr.ph, label %._crit_edge, !dbg !156

.lr.ph:                                           ; preds = %._crit_edge7
  %23 = sext i32 %j to i64
  br label %27, !dbg !156

; <label>:24                                      ; preds = %27
  %25 = trunc i64 %indvars.iv.next to i32, !dbg !156
  %26 = icmp slt i32 %25, 512, !dbg !156
  br i1 %26, label %27, label %._crit_edge, !dbg !156

; <label>:27                                      ; preds = %.lr.ph, %24
  %indvars.iv = phi i64 [ %23, %.lr.ph ], [ %indvars.iv.next, %24 ]
  %28 = getelementptr inbounds [512 x i32]* @puzzl, i64 0, i64 %indvars.iv, !dbg !158
  %29 = load i32* %28, align 4, !dbg !158, !tbaa !143
  %30 = icmp eq i32 %29, 0, !dbg !158
  %indvars.iv.next = add nsw i64 %indvars.iv, 1, !dbg !156
  br i1 %30, label %._crit_edge2, label %24, !dbg !158

._crit_edge2:                                     ; preds = %27
  %31 = trunc i64 %indvars.iv to i32, !dbg !158
  br label %._crit_edge, !dbg !158

._crit_edge:                                      ; preds = %24, %._crit_edge2, %._crit_edge7
  %.0 = phi i32 [ %31, %._crit_edge2 ], [ 0, %._crit_edge7 ], [ 0, %24 ]
  ret i32 %.0, !dbg !160
}

; Function Attrs: minsize nounwind optsize uwtable
define void @Remove(i32 %i, i32 %j) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %i}, i64 0, metadata !28), !dbg !161
  tail call void @llvm.dbg.value(metadata !{i32 %j}, i64 0, metadata !29), !dbg !161
  tail call void @llvm.dbg.value(metadata !140, i64 0, metadata !30), !dbg !162
  %1 = sext i32 %i to i64, !dbg !162
  %2 = getelementptr inbounds [13 x i32]* @piecemax, i64 0, i64 %1, !dbg !162
  %3 = load i32* %2, align 4, !dbg !162, !tbaa !143
  %4 = icmp slt i32 %3, 0, !dbg !162
  br i1 %4, label %._crit_edge, label %.lr.ph, !dbg !162

.lr.ph:                                           ; preds = %0
  %5 = sext i32 %j to i64, !dbg !162
  br label %6, !dbg !162

; <label>:6                                       ; preds = %13, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %13 ], [ 0, %.lr.ph ]
  %7 = getelementptr inbounds [13 x [512 x i32]]* @p, i64 0, i64 %1, i64 %indvars.iv, !dbg !164
  %8 = load i32* %7, align 4, !dbg !164, !tbaa !143
  %9 = icmp eq i32 %8, 0, !dbg !164
  br i1 %9, label %13, label %10, !dbg !164

; <label>:10                                      ; preds = %6
  %11 = add nsw i64 %indvars.iv, %5, !dbg !164
  %12 = getelementptr inbounds [512 x i32]* @puzzl, i64 0, i64 %11, !dbg !164
  store i32 0, i32* %12, align 4, !dbg !164, !tbaa !143
  br label %13, !dbg !164

; <label>:13                                      ; preds = %6, %10
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !162
  %14 = trunc i64 %indvars.iv to i32, !dbg !162
  %15 = icmp slt i32 %14, %3, !dbg !162
  br i1 %15, label %6, label %._crit_edge, !dbg !162

._crit_edge:                                      ; preds = %13, %0
  %16 = getelementptr inbounds [13 x i32]* @class, i64 0, i64 %1, !dbg !166
  %17 = load i32* %16, align 4, !dbg !166, !tbaa !143
  %18 = sext i32 %17 to i64, !dbg !166
  %19 = getelementptr inbounds [4 x i32]* @piececount, i64 0, i64 %18, !dbg !166
  %20 = load i32* %19, align 4, !dbg !166, !tbaa !143
  %21 = add nsw i32 %20, 1, !dbg !166
  store i32 %21, i32* %19, align 4, !dbg !166, !tbaa !143
  ret void, !dbg !167
}

; Function Attrs: minsize nounwind optsize uwtable
define i32 @Trial(i32 %j) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %j}, i64 0, metadata !35), !dbg !168
  %1 = load i32* @kount, align 4, !dbg !169, !tbaa !143
  %2 = add nsw i32 %1, 1, !dbg !169
  store i32 %2, i32* @kount, align 4, !dbg !169, !tbaa !143
  tail call void @llvm.dbg.value(metadata !140, i64 0, metadata !36), !dbg !170
  br label %3, !dbg !170

; <label>:3                                       ; preds = %0, %20
  %indvars.iv = phi i64 [ 0, %0 ], [ %indvars.iv.next, %20 ]
  %4 = getelementptr inbounds [13 x i32]* @class, i64 0, i64 %indvars.iv, !dbg !172
  %5 = load i32* %4, align 4, !dbg !172, !tbaa !143
  %6 = sext i32 %5 to i64, !dbg !172
  %7 = getelementptr inbounds [4 x i32]* @piececount, i64 0, i64 %6, !dbg !172
  %8 = load i32* %7, align 4, !dbg !172, !tbaa !143
  %9 = icmp eq i32 %8, 0, !dbg !172
  br i1 %9, label %20, label %10, !dbg !172

; <label>:10                                      ; preds = %3
  %11 = trunc i64 %indvars.iv to i32, !dbg !174
  %12 = tail call i32 @Fit(i32 %11, i32 %j) #5, !dbg !174
  %13 = icmp eq i32 %12, 0, !dbg !174
  br i1 %13, label %20, label %14, !dbg !174

; <label>:14                                      ; preds = %10
  %15 = tail call i32 @Place(i32 %11, i32 %j) #5, !dbg !176
  tail call void @llvm.dbg.value(metadata !{i32 %15}, i64 0, metadata !37), !dbg !176
  %16 = tail call i32 @Trial(i32 %15) #5, !dbg !178
  %17 = icmp ne i32 %16, 0, !dbg !178
  %18 = icmp eq i32 %15, 0, !dbg !178
  %or.cond = or i1 %17, %18, !dbg !178
  br i1 %or.cond, label %23, label %19, !dbg !178

; <label>:19                                      ; preds = %14
  tail call void @Remove(i32 %11, i32 %j) #5, !dbg !180
  br label %20, !dbg !181

; <label>:20                                      ; preds = %10, %3, %19
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !170
  %21 = trunc i64 %indvars.iv.next to i32, !dbg !170
  %22 = icmp slt i32 %21, 13, !dbg !170
  br i1 %22, label %3, label %23, !dbg !170

; <label>:23                                      ; preds = %20, %14
  %.0 = phi i32 [ 1, %14 ], [ 0, %20 ]
  ret i32 %.0, !dbg !182
}

; Function Attrs: minsize nounwind optsize uwtable
define void @Puzzle() #0 {
  tail call void @llvm.dbg.value(metadata !140, i64 0, metadata !43), !dbg !183
  br label %1, !dbg !183

; <label>:1                                       ; preds = %1, %0
  %indvars.iv192 = phi i64 [ 0, %0 ], [ %indvars.iv.next193, %1 ]
  %2 = getelementptr inbounds [512 x i32]* @puzzl, i64 0, i64 %indvars.iv192, !dbg !183
  store i32 1, i32* %2, align 4, !dbg !183, !tbaa !143
  %indvars.iv.next193 = add nuw nsw i64 %indvars.iv192, 1, !dbg !183
  %exitcond194 = icmp eq i64 %indvars.iv.next193, 512, !dbg !183
  br i1 %exitcond194, label %.preheader32, label %1, !dbg !183

.preheader32:                                     ; preds = %1, %10
  %indvars.iv189 = phi i64 [ %indvars.iv.next190, %10 ], [ 1, %1 ]
  br label %.preheader31, !dbg !185

.preheader30:                                     ; preds = %10
  call void @llvm.memset.p0i8.i64(i8* bitcast ([13 x [512 x i32]]* @p to i8*), i8 0, i64 26624, i32 16, i1 false), !dbg !188
  br label %.preheader27, !dbg !191

.preheader31:                                     ; preds = %9, %.preheader32
  %indvars.iv186 = phi i64 [ 1, %.preheader32 ], [ %indvars.iv.next187, %9 ]
  br label %3, !dbg !193

; <label>:3                                       ; preds = %3, %.preheader31
  %indvars.iv183 = phi i64 [ 1, %.preheader31 ], [ %indvars.iv.next184, %3 ]
  %4 = shl i64 %indvars.iv183, 3, !dbg !193
  %5 = add nsw i64 %4, %indvars.iv186, !dbg !193
  %6 = shl i64 %5, 3, !dbg !193
  %7 = add nsw i64 %6, %indvars.iv189, !dbg !193
  %8 = getelementptr inbounds [512 x i32]* @puzzl, i64 0, i64 %7, !dbg !193
  store i32 0, i32* %8, align 4, !dbg !193, !tbaa !143
  %indvars.iv.next184 = add nuw nsw i64 %indvars.iv183, 1, !dbg !193
  %exitcond185 = icmp eq i64 %indvars.iv.next184, 6, !dbg !193
  br i1 %exitcond185, label %9, label %3, !dbg !193

; <label>:9                                       ; preds = %3
  %indvars.iv.next187 = add nuw nsw i64 %indvars.iv186, 1, !dbg !185
  %exitcond188 = icmp eq i64 %indvars.iv.next187, 6, !dbg !185
  br i1 %exitcond188, label %10, label %.preheader31, !dbg !185

; <label>:10                                      ; preds = %9
  %indvars.iv.next190 = add nuw nsw i64 %indvars.iv189, 1, !dbg !195
  %exitcond191 = icmp eq i64 %indvars.iv.next190, 6, !dbg !195
  br i1 %exitcond191, label %.preheader30, label %.preheader32, !dbg !195

.preheader27:                                     ; preds = %15, %.preheader30
  %indvars.iv175 = phi i64 [ 0, %.preheader30 ], [ %indvars.iv.next176, %15 ]
  br label %11, !dbg !196

; <label>:11                                      ; preds = %.preheader27, %11
  %indvars.iv172 = phi i64 [ 0, %.preheader27 ], [ %indvars.iv.next173, %11 ]
  %12 = shl i64 %indvars.iv172, 3, !dbg !198
  %13 = add nsw i64 %12, %indvars.iv175, !dbg !198
  %14 = getelementptr inbounds [13 x [512 x i32]]* @p, i64 0, i64 0, i64 %13, !dbg !198
  store i32 1, i32* %14, align 4, !dbg !198, !tbaa !143
  %indvars.iv.next173 = add nuw nsw i64 %indvars.iv172, 1, !dbg !196
  %exitcond174 = icmp eq i64 %indvars.iv.next173, 2, !dbg !196
  br i1 %exitcond174, label %15, label %11, !dbg !196

; <label>:15                                      ; preds = %11
  %indvars.iv.next176 = add nuw nsw i64 %indvars.iv175, 1, !dbg !191
  %exitcond177 = icmp eq i64 %indvars.iv.next176, 4, !dbg !191
  br i1 %exitcond177, label %16, label %.preheader27, !dbg !191

; <label>:16                                      ; preds = %15
  store i32 0, i32* getelementptr inbounds ([13 x i32]* @class, i64 0, i64 0), align 16, !dbg !200, !tbaa !143
  store i32 11, i32* getelementptr inbounds ([13 x i32]* @piecemax, i64 0, i64 0), align 16, !dbg !201, !tbaa !143
  tail call void @llvm.dbg.value(metadata !140, i64 0, metadata !40), !dbg !202
  br label %.preheader25, !dbg !202

.preheader25:                                     ; preds = %20, %16
  %indvars.iv167 = phi i64 [ 0, %16 ], [ %indvars.iv.next168, %20 ]
  br label %.preheader24, !dbg !204

.preheader24:                                     ; preds = %.preheader25, %.preheader24
  %indvars.iv162 = phi i64 [ %indvars.iv.next163, %.preheader24 ], [ 0, %.preheader25 ]
  %17 = shl i64 %indvars.iv162, 6, !dbg !206
  %18 = add nsw i64 %17, %indvars.iv167, !dbg !206
  %19 = getelementptr inbounds [13 x [512 x i32]]* @p, i64 0, i64 1, i64 %18, !dbg !206
  store i32 1, i32* %19, align 4, !dbg !206, !tbaa !143
  %indvars.iv.next163 = add nuw nsw i64 %indvars.iv162, 1, !dbg !206
  %exitcond164 = icmp eq i64 %indvars.iv.next163, 4, !dbg !206
  br i1 %exitcond164, label %20, label %.preheader24, !dbg !206

; <label>:20                                      ; preds = %.preheader24
  %indvars.iv.next168 = add nuw nsw i64 %indvars.iv167, 1, !dbg !202
  %exitcond169 = icmp eq i64 %indvars.iv.next168, 2, !dbg !202
  br i1 %exitcond169, label %21, label %.preheader25, !dbg !202

; <label>:21                                      ; preds = %20
  store i32 0, i32* getelementptr inbounds ([13 x i32]* @class, i64 0, i64 1), align 4, !dbg !208, !tbaa !143
  store i32 193, i32* getelementptr inbounds ([13 x i32]* @piecemax, i64 0, i64 1), align 4, !dbg !209, !tbaa !143
  tail call void @llvm.dbg.value(metadata !140, i64 0, metadata !40), !dbg !210
  br label %.preheader22, !dbg !210

.preheader22:                                     ; preds = %21, %27
  %indvars.iv157 = phi i64 [ %indvars.iv.next158, %27 ], [ 0, %21 ]
  br label %22, !dbg !212

; <label>:22                                      ; preds = %22, %.preheader22
  %indvars.iv154 = phi i64 [ 0, %.preheader22 ], [ %indvars.iv.next155, %22 ]
  %23 = shl i64 %indvars.iv154, 3, !dbg !212
  %24 = add nsw i64 %23, %indvars.iv157, !dbg !212
  %25 = shl i64 %24, 3, !dbg !212
  %26 = getelementptr inbounds [13 x [512 x i32]]* @p, i64 0, i64 2, i64 %25, !dbg !212
  store i32 1, i32* %26, align 16, !dbg !212, !tbaa !143
  %indvars.iv.next155 = add nuw nsw i64 %indvars.iv154, 1, !dbg !212
  %exitcond156 = icmp eq i64 %indvars.iv.next155, 2, !dbg !212
  br i1 %exitcond156, label %27, label %22, !dbg !212

; <label>:27                                      ; preds = %22
  %indvars.iv.next158 = add nuw nsw i64 %indvars.iv157, 1, !dbg !215
  %exitcond159 = icmp eq i64 %indvars.iv.next158, 4, !dbg !215
  br i1 %exitcond159, label %28, label %.preheader22, !dbg !215

; <label>:28                                      ; preds = %27
  store i32 0, i32* getelementptr inbounds ([13 x i32]* @class, i64 0, i64 2), align 8, !dbg !216, !tbaa !143
  store i32 88, i32* getelementptr inbounds ([13 x i32]* @piecemax, i64 0, i64 2), align 8, !dbg !217, !tbaa !143
  tail call void @llvm.dbg.value(metadata !140, i64 0, metadata !40), !dbg !218
  br label %.preheader21, !dbg !218

.preheader21:                                     ; preds = %33, %28
  %indvars.iv151 = phi i64 [ 0, %28 ], [ %indvars.iv.next152, %33 ]
  br label %29, !dbg !220

; <label>:29                                      ; preds = %.preheader21, %29
  %indvars.iv148 = phi i64 [ 0, %.preheader21 ], [ %indvars.iv.next149, %29 ]
  %30 = shl i64 %indvars.iv148, 3, !dbg !222
  %31 = add nsw i64 %30, %indvars.iv151, !dbg !222
  %32 = getelementptr inbounds [13 x [512 x i32]]* @p, i64 0, i64 3, i64 %31, !dbg !222
  store i32 1, i32* %32, align 4, !dbg !222, !tbaa !143
  %indvars.iv.next149 = add nuw nsw i64 %indvars.iv148, 1, !dbg !220
  %exitcond150 = icmp eq i64 %indvars.iv.next149, 4, !dbg !220
  br i1 %exitcond150, label %33, label %29, !dbg !220

; <label>:33                                      ; preds = %29
  %indvars.iv.next152 = add nuw nsw i64 %indvars.iv151, 1, !dbg !218
  %exitcond153 = icmp eq i64 %indvars.iv.next152, 2, !dbg !218
  br i1 %exitcond153, label %34, label %.preheader21, !dbg !218

; <label>:34                                      ; preds = %33
  store i32 0, i32* getelementptr inbounds ([13 x i32]* @class, i64 0, i64 3), align 4, !dbg !224, !tbaa !143
  store i32 25, i32* getelementptr inbounds ([13 x i32]* @piecemax, i64 0, i64 3), align 4, !dbg !225, !tbaa !143
  tail call void @llvm.dbg.value(metadata !140, i64 0, metadata !40), !dbg !226
  br label %.preheader19, !dbg !226

.preheader19:                                     ; preds = %38, %34
  %indvars.iv143 = phi i64 [ 0, %34 ], [ %indvars.iv.next144, %38 ]
  br label %.preheader18, !dbg !228

.preheader18:                                     ; preds = %.preheader19, %.preheader18
  %indvars.iv138 = phi i64 [ %indvars.iv.next139, %.preheader18 ], [ 0, %.preheader19 ]
  %35 = shl i64 %indvars.iv138, 6, !dbg !230
  %36 = add nsw i64 %35, %indvars.iv143, !dbg !230
  %37 = getelementptr inbounds [13 x [512 x i32]]* @p, i64 0, i64 4, i64 %36, !dbg !230
  store i32 1, i32* %37, align 4, !dbg !230, !tbaa !143
  %indvars.iv.next139 = add nuw nsw i64 %indvars.iv138, 1, !dbg !230
  %exitcond140 = icmp eq i64 %indvars.iv.next139, 2, !dbg !230
  br i1 %exitcond140, label %38, label %.preheader18, !dbg !230

; <label>:38                                      ; preds = %.preheader18
  %indvars.iv.next144 = add nuw nsw i64 %indvars.iv143, 1, !dbg !226
  %exitcond145 = icmp eq i64 %indvars.iv.next144, 4, !dbg !226
  br i1 %exitcond145, label %39, label %.preheader19, !dbg !226

; <label>:39                                      ; preds = %38
  store i32 0, i32* getelementptr inbounds ([13 x i32]* @class, i64 0, i64 4), align 16, !dbg !232, !tbaa !143
  store i32 67, i32* getelementptr inbounds ([13 x i32]* @piecemax, i64 0, i64 4), align 16, !dbg !233, !tbaa !143
  tail call void @llvm.dbg.value(metadata !140, i64 0, metadata !40), !dbg !234
  br label %.preheader16, !dbg !234

.preheader16:                                     ; preds = %39, %45
  %indvars.iv133 = phi i64 [ %indvars.iv.next134, %45 ], [ 0, %39 ]
  br label %40, !dbg !236

; <label>:40                                      ; preds = %40, %.preheader16
  %indvars.iv130 = phi i64 [ 0, %.preheader16 ], [ %indvars.iv.next131, %40 ]
  %41 = shl i64 %indvars.iv130, 3, !dbg !236
  %42 = add nsw i64 %41, %indvars.iv133, !dbg !236
  %43 = shl i64 %42, 3, !dbg !236
  %44 = getelementptr inbounds [13 x [512 x i32]]* @p, i64 0, i64 5, i64 %43, !dbg !236
  store i32 1, i32* %44, align 16, !dbg !236, !tbaa !143
  %indvars.iv.next131 = add nuw nsw i64 %indvars.iv130, 1, !dbg !236
  %exitcond132 = icmp eq i64 %indvars.iv.next131, 4, !dbg !236
  br i1 %exitcond132, label %45, label %40, !dbg !236

; <label>:45                                      ; preds = %40
  %indvars.iv.next134 = add nuw nsw i64 %indvars.iv133, 1, !dbg !239
  %exitcond135 = icmp eq i64 %indvars.iv.next134, 2, !dbg !239
  br i1 %exitcond135, label %46, label %.preheader16, !dbg !239

; <label>:46                                      ; preds = %45
  store i32 0, i32* getelementptr inbounds ([13 x i32]* @class, i64 0, i64 5), align 4, !dbg !240, !tbaa !143
  store i32 200, i32* getelementptr inbounds ([13 x i32]* @piecemax, i64 0, i64 5), align 4, !dbg !241, !tbaa !143
  tail call void @llvm.dbg.value(metadata !140, i64 0, metadata !40), !dbg !242
  br label %47, !dbg !242

; <label>:47                                      ; preds = %46, %47
  %indvars.iv127 = phi i64 [ 0, %46 ], [ %indvars.iv.next128, %47 ]
  %48 = getelementptr inbounds [13 x [512 x i32]]* @p, i64 0, i64 6, i64 %indvars.iv127, !dbg !244
  store i32 1, i32* %48, align 4, !dbg !244, !tbaa !143
  %indvars.iv.next128 = add nuw nsw i64 %indvars.iv127, 1, !dbg !242
  %exitcond129 = icmp eq i64 %indvars.iv.next128, 3, !dbg !242
  br i1 %exitcond129, label %49, label %47, !dbg !242

; <label>:49                                      ; preds = %47
  store i32 1, i32* getelementptr inbounds ([13 x i32]* @class, i64 0, i64 6), align 8, !dbg !247, !tbaa !143
  store i32 2, i32* getelementptr inbounds ([13 x i32]* @piecemax, i64 0, i64 6), align 8, !dbg !248, !tbaa !143
  tail call void @llvm.dbg.value(metadata !140, i64 0, metadata !40), !dbg !249
  br label %50, !dbg !249

; <label>:50                                      ; preds = %50, %49
  %indvars.iv118 = phi i64 [ %indvars.iv.next119, %50 ], [ 0, %49 ]
  %51 = shl i64 %indvars.iv118, 3, !dbg !251
  %52 = getelementptr inbounds [13 x [512 x i32]]* @p, i64 0, i64 7, i64 %51, !dbg !251
  store i32 1, i32* %52, align 16, !dbg !251, !tbaa !143
  %indvars.iv.next119 = add nuw nsw i64 %indvars.iv118, 1, !dbg !254
  %exitcond120 = icmp eq i64 %indvars.iv.next119, 3, !dbg !254
  br i1 %exitcond120, label %53, label %50, !dbg !254

; <label>:53                                      ; preds = %50
  store i32 1, i32* getelementptr inbounds ([13 x i32]* @class, i64 0, i64 7), align 4, !dbg !255, !tbaa !143
  store i32 16, i32* getelementptr inbounds ([13 x i32]* @piecemax, i64 0, i64 7), align 4, !dbg !256, !tbaa !143
  tail call void @llvm.dbg.value(metadata !140, i64 0, metadata !40), !dbg !257
  br label %.preheader10, !dbg !257

.preheader10:                                     ; preds = %53, %.preheader10
  %indvars.iv109 = phi i64 [ %indvars.iv.next110, %.preheader10 ], [ 0, %53 ]
  %54 = shl i64 %indvars.iv109, 6, !dbg !259
  %55 = getelementptr inbounds [13 x [512 x i32]]* @p, i64 0, i64 8, i64 %54, !dbg !259
  store i32 1, i32* %55, align 16, !dbg !259, !tbaa !143
  %indvars.iv.next110 = add nuw nsw i64 %indvars.iv109, 1, !dbg !259
  %exitcond111 = icmp eq i64 %indvars.iv.next110, 3, !dbg !259
  br i1 %exitcond111, label %56, label %.preheader10, !dbg !259

; <label>:56                                      ; preds = %.preheader10
  store i32 1, i32* getelementptr inbounds ([13 x i32]* @class, i64 0, i64 8), align 16, !dbg !262, !tbaa !143
  store i32 128, i32* getelementptr inbounds ([13 x i32]* @piecemax, i64 0, i64 8), align 16, !dbg !263, !tbaa !143
  tail call void @llvm.dbg.value(metadata !140, i64 0, metadata !40), !dbg !264
  br label %.preheader9, !dbg !264

.preheader9:                                      ; preds = %61, %56
  %indvars.iv106 = phi i64 [ 0, %56 ], [ %indvars.iv.next107, %61 ]
  br label %57, !dbg !266

; <label>:57                                      ; preds = %.preheader9, %57
  %indvars.iv103 = phi i64 [ 0, %.preheader9 ], [ %indvars.iv.next104, %57 ]
  %58 = shl i64 %indvars.iv103, 3, !dbg !268
  %59 = add nsw i64 %58, %indvars.iv106, !dbg !268
  %60 = getelementptr inbounds [13 x [512 x i32]]* @p, i64 0, i64 9, i64 %59, !dbg !268
  store i32 1, i32* %60, align 4, !dbg !268, !tbaa !143
  %indvars.iv.next104 = add nuw nsw i64 %indvars.iv103, 1, !dbg !266
  %exitcond105 = icmp eq i64 %indvars.iv.next104, 2, !dbg !266
  br i1 %exitcond105, label %61, label %57, !dbg !266

; <label>:61                                      ; preds = %57
  %indvars.iv.next107 = add nuw nsw i64 %indvars.iv106, 1, !dbg !264
  %exitcond108 = icmp eq i64 %indvars.iv.next107, 2, !dbg !264
  br i1 %exitcond108, label %62, label %.preheader9, !dbg !264

; <label>:62                                      ; preds = %61
  store i32 2, i32* getelementptr inbounds ([13 x i32]* @class, i64 0, i64 9), align 4, !dbg !270, !tbaa !143
  store i32 9, i32* getelementptr inbounds ([13 x i32]* @piecemax, i64 0, i64 9), align 4, !dbg !271, !tbaa !143
  tail call void @llvm.dbg.value(metadata !140, i64 0, metadata !40), !dbg !272
  br label %.preheader7, !dbg !272

.preheader7:                                      ; preds = %66, %62
  %indvars.iv98 = phi i64 [ 0, %62 ], [ %indvars.iv.next99, %66 ]
  br label %.preheader6, !dbg !274

.preheader6:                                      ; preds = %.preheader7, %.preheader6
  %indvars.iv93 = phi i64 [ %indvars.iv.next94, %.preheader6 ], [ 0, %.preheader7 ]
  %63 = shl i64 %indvars.iv93, 6, !dbg !276
  %64 = add nsw i64 %63, %indvars.iv98, !dbg !276
  %65 = getelementptr inbounds [13 x [512 x i32]]* @p, i64 0, i64 10, i64 %64, !dbg !276
  store i32 1, i32* %65, align 4, !dbg !276, !tbaa !143
  %indvars.iv.next94 = add nuw nsw i64 %indvars.iv93, 1, !dbg !276
  %exitcond95 = icmp eq i64 %indvars.iv.next94, 2, !dbg !276
  br i1 %exitcond95, label %66, label %.preheader6, !dbg !276

; <label>:66                                      ; preds = %.preheader6
  %indvars.iv.next99 = add nuw nsw i64 %indvars.iv98, 1, !dbg !272
  %exitcond100 = icmp eq i64 %indvars.iv.next99, 2, !dbg !272
  br i1 %exitcond100, label %67, label %.preheader7, !dbg !272

; <label>:67                                      ; preds = %66
  store i32 2, i32* getelementptr inbounds ([13 x i32]* @class, i64 0, i64 10), align 8, !dbg !278, !tbaa !143
  store i32 65, i32* getelementptr inbounds ([13 x i32]* @piecemax, i64 0, i64 10), align 8, !dbg !279, !tbaa !143
  tail call void @llvm.dbg.value(metadata !140, i64 0, metadata !40), !dbg !280
  br label %.preheader4, !dbg !280

.preheader4:                                      ; preds = %67, %73
  %indvars.iv88 = phi i64 [ %indvars.iv.next89, %73 ], [ 0, %67 ]
  br label %68, !dbg !282

; <label>:68                                      ; preds = %68, %.preheader4
  %indvars.iv85 = phi i64 [ 0, %.preheader4 ], [ %indvars.iv.next86, %68 ]
  %69 = shl i64 %indvars.iv85, 3, !dbg !282
  %70 = add nsw i64 %69, %indvars.iv88, !dbg !282
  %71 = shl i64 %70, 3, !dbg !282
  %72 = getelementptr inbounds [13 x [512 x i32]]* @p, i64 0, i64 11, i64 %71, !dbg !282
  store i32 1, i32* %72, align 16, !dbg !282, !tbaa !143
  %indvars.iv.next86 = add nuw nsw i64 %indvars.iv85, 1, !dbg !282
  %exitcond87 = icmp eq i64 %indvars.iv.next86, 2, !dbg !282
  br i1 %exitcond87, label %73, label %68, !dbg !282

; <label>:73                                      ; preds = %68
  %indvars.iv.next89 = add nuw nsw i64 %indvars.iv88, 1, !dbg !285
  %exitcond90 = icmp eq i64 %indvars.iv.next89, 2, !dbg !285
  br i1 %exitcond90, label %74, label %.preheader4, !dbg !285

; <label>:74                                      ; preds = %73
  store i32 2, i32* getelementptr inbounds ([13 x i32]* @class, i64 0, i64 11), align 4, !dbg !286, !tbaa !143
  store i32 72, i32* getelementptr inbounds ([13 x i32]* @piecemax, i64 0, i64 11), align 4, !dbg !287, !tbaa !143
  tail call void @llvm.dbg.value(metadata !140, i64 0, metadata !40), !dbg !288
  br label %.preheader3, !dbg !288

.preheader3:                                      ; preds = %82, %74
  %indvars.iv82 = phi i64 [ 0, %74 ], [ %indvars.iv.next83, %82 ]
  br label %.preheader, !dbg !290

.preheader:                                       ; preds = %81, %.preheader3
  %indvars.iv79 = phi i64 [ 0, %.preheader3 ], [ %indvars.iv.next80, %81 ]
  br label %75, !dbg !292

; <label>:75                                      ; preds = %75, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %75 ]
  %76 = shl i64 %indvars.iv, 3, !dbg !292
  %77 = add nsw i64 %76, %indvars.iv79, !dbg !292
  %78 = shl i64 %77, 3, !dbg !292
  %79 = add nsw i64 %78, %indvars.iv82, !dbg !292
  %80 = getelementptr inbounds [13 x [512 x i32]]* @p, i64 0, i64 12, i64 %79, !dbg !292
  store i32 1, i32* %80, align 4, !dbg !292, !tbaa !143
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !292
  %exitcond = icmp eq i64 %indvars.iv.next, 2, !dbg !292
  br i1 %exitcond, label %81, label %75, !dbg !292

; <label>:81                                      ; preds = %75
  %indvars.iv.next80 = add nuw nsw i64 %indvars.iv79, 1, !dbg !290
  %exitcond81 = icmp eq i64 %indvars.iv.next80, 2, !dbg !290
  br i1 %exitcond81, label %82, label %.preheader, !dbg !290

; <label>:82                                      ; preds = %81
  %indvars.iv.next83 = add nuw nsw i64 %indvars.iv82, 1, !dbg !288
  %exitcond84 = icmp eq i64 %indvars.iv.next83, 2, !dbg !288
  br i1 %exitcond84, label %83, label %.preheader3, !dbg !288

; <label>:83                                      ; preds = %82
  store i32 3, i32* getelementptr inbounds ([13 x i32]* @class, i64 0, i64 12), align 16, !dbg !294, !tbaa !143
  store i32 73, i32* getelementptr inbounds ([13 x i32]* @piecemax, i64 0, i64 12), align 16, !dbg !295, !tbaa !143
  store i32 13, i32* getelementptr inbounds ([4 x i32]* @piececount, i64 0, i64 0), align 16, !dbg !296, !tbaa !143
  store i32 3, i32* getelementptr inbounds ([4 x i32]* @piececount, i64 0, i64 1), align 4, !dbg !297, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([4 x i32]* @piececount, i64 0, i64 2), align 8, !dbg !298, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([4 x i32]* @piececount, i64 0, i64 3), align 4, !dbg !299, !tbaa !143
  tail call void @llvm.dbg.value(metadata !300, i64 0, metadata !43), !dbg !301
  store i32 0, i32* @kount, align 4, !dbg !302, !tbaa !143
  %84 = tail call i32 @Fit(i32 0, i32 73) #5, !dbg !303
  %85 = icmp eq i32 %84, 0, !dbg !303
  br i1 %85, label %88, label %86, !dbg !303

; <label>:86                                      ; preds = %83
  %87 = tail call i32 @Place(i32 0, i32 73) #5, !dbg !303
  store i32 %87, i32* @n, align 4, !dbg !303, !tbaa !143
  br label %89, !dbg !303

; <label>:88                                      ; preds = %83
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([17 x i8]* @str, i64 0, i64 0)), !dbg !305
  %.pre = load i32* @n, align 4, !dbg !306, !tbaa !143
  br label %89

; <label>:89                                      ; preds = %88, %86
  %90 = phi i32 [ %.pre, %88 ], [ %87, %86 ]
  %91 = tail call i32 @Trial(i32 %90) #5, !dbg !306
  %92 = icmp eq i32 %91, 0, !dbg !306
  br i1 %92, label %93, label %94, !dbg !306

; <label>:93                                      ; preds = %89
  %puts1 = tail call i32 @puts(i8* getelementptr inbounds ([18 x i8]* @str4, i64 0, i64 0)), !dbg !306
  br label %98, !dbg !306

; <label>:94                                      ; preds = %89
  %95 = load i32* @kount, align 4, !dbg !308, !tbaa !143
  %96 = icmp eq i32 %95, 2005, !dbg !308
  br i1 %96, label %98, label %97, !dbg !308

; <label>:97                                      ; preds = %94
  %puts2 = tail call i32 @puts(i8* getelementptr inbounds ([18 x i8]* @str5, i64 0, i64 0)), !dbg !308
  br label %98, !dbg !308

; <label>:98                                      ; preds = %94, %97, %93
  %99 = load i32* @n, align 4, !dbg !310, !tbaa !143
  %100 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str3, i64 0, i64 0), i32 %99) #6, !dbg !310
  %101 = load i32* @kount, align 4, !dbg !311, !tbaa !143
  %102 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str3, i64 0, i64 0), i32 %101) #6, !dbg !311
  ret void, !dbg !312
}

; Function Attrs: minsize nounwind optsize
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: minsize nounwind optsize uwtable
define i32 @main() #0 {
  tail call void @llvm.dbg.value(metadata !140, i64 0, metadata !46), !dbg !313
  br label %1, !dbg !313

; <label>:1                                       ; preds = %1, %0
  %i.01 = phi i32 [ 0, %0 ], [ %2, %1 ]
  tail call void @Puzzle() #5, !dbg !313
  %2 = add nsw i32 %i.01, 1, !dbg !313
  tail call void @llvm.dbg.value(metadata !{i32 %2}, i64 0, metadata !46), !dbg !313
  %exitcond = icmp eq i32 %2, 100, !dbg !313
  br i1 %exitcond, label %3, label %1, !dbg !313

; <label>:3                                       ; preds = %1
  ret i32 0, !dbg !315
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #3

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #4

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #4

attributes #0 = { minsize nounwind optsize uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { minsize nounwind optsize readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { minsize nounwind optsize "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }
attributes #5 = { minsize optsize }
attributes #6 = { minsize nounwind optsize }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!128, !129}
!llvm.ident = !{!130}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !47, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c] [DW_LANG_C99]
!1 = metadata !{metadata !"puzzle-stanford.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !8, metadata !12, metadata !19, metadata !24, metadata !31, metadata !38, metadata !44}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Initrand", metadata !"Initrand", metadata !"", i32 115, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, void ()* @Initrand, null, null, metadata !2, i32 115} ; [ DW_TAG_subprogram ] [line 115] [def] [Initrand]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{null}
!8 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Rand", metadata !"Rand", metadata !"", i32 119, metadata !9, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 ()* @Rand, null, null, metadata !2, i32 119} ; [ DW_TAG_subprogram ] [line 119] [def] [Rand]
!9 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !10, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!10 = metadata !{metadata !11}
!11 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Fit", metadata !"Fit", metadata !"", i32 128, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32)* @Fit, null, null, metadata !15, i32 128} ; [ DW_TAG_subprogram ] [line 128] [def] [Fit]
!13 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = metadata !{metadata !11, metadata !11, metadata !11}
!15 = metadata !{metadata !16, metadata !17, metadata !18}
!16 = metadata !{i32 786689, metadata !12, metadata !"i", metadata !5, i32 16777344, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [i] [line 128]
!17 = metadata !{i32 786689, metadata !12, metadata !"j", metadata !5, i32 33554560, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [j] [line 128]
!18 = metadata !{i32 786688, metadata !12, metadata !"k", metadata !5, i32 129, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 129]
!19 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Place", metadata !"Place", metadata !"", i32 135, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32)* @Place, null, null, metadata !20, i32 135} ; [ DW_TAG_subprogram ] [line 135] [def] [Place]
!20 = metadata !{metadata !21, metadata !22, metadata !23}
!21 = metadata !{i32 786689, metadata !19, metadata !"i", metadata !5, i32 16777351, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [i] [line 135]
!22 = metadata !{i32 786689, metadata !19, metadata !"j", metadata !5, i32 33554567, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [j] [line 135]
!23 = metadata !{i32 786688, metadata !19, metadata !"k", metadata !5, i32 136, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 136]
!24 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Remove", metadata !"Remove", metadata !"", i32 143, metadata !25, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32, i32)* @Remove, null, null, metadata !27, i32 143} ; [ DW_TAG_subprogram ] [line 143] [def] [Remove]
!25 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !26, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!26 = metadata !{null, metadata !11, metadata !11}
!27 = metadata !{metadata !28, metadata !29, metadata !30}
!28 = metadata !{i32 786689, metadata !24, metadata !"i", metadata !5, i32 16777359, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [i] [line 143]
!29 = metadata !{i32 786689, metadata !24, metadata !"j", metadata !5, i32 33554575, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [j] [line 143]
!30 = metadata !{i32 786688, metadata !24, metadata !"k", metadata !5, i32 144, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 144]
!31 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Trial", metadata !"Trial", metadata !"", i32 149, metadata !32, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @Trial, null, null, metadata !34, i32 149} ; [ DW_TAG_subprogram ] [line 149] [def] [Trial]
!32 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !33, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!33 = metadata !{metadata !11, metadata !11}
!34 = metadata !{metadata !35, metadata !36, metadata !37}
!35 = metadata !{i32 786689, metadata !31, metadata !"j", metadata !5, i32 16777365, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [j] [line 149]
!36 = metadata !{i32 786688, metadata !31, metadata !"i", metadata !5, i32 150, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 150]
!37 = metadata !{i32 786688, metadata !31, metadata !"k", metadata !5, i32 150, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 150]
!38 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Puzzle", metadata !"Puzzle", metadata !"", i32 162, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, void ()* @Puzzle, null, null, metadata !39, i32 162} ; [ DW_TAG_subprogram ] [line 162] [def] [Puzzle]
!39 = metadata !{metadata !40, metadata !41, metadata !42, metadata !43}
!40 = metadata !{i32 786688, metadata !38, metadata !"i", metadata !5, i32 163, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 163]
!41 = metadata !{i32 786688, metadata !38, metadata !"j", metadata !5, i32 163, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 163]
!42 = metadata !{i32 786688, metadata !38, metadata !"k", metadata !5, i32 163, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 163]
!43 = metadata !{i32 786688, metadata !38, metadata !"m", metadata !5, i32 163, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [m] [line 163]
!44 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 220, metadata !9, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 ()* @main, null, null, metadata !45, i32 221} ; [ DW_TAG_subprogram ] [line 220] [def] [scope 221] [main]
!45 = metadata !{metadata !46}
!46 = metadata !{i32 786688, metadata !44, metadata !"i", metadata !5, i32 222, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 222]
!47 = metadata !{metadata !48, metadata !50, metadata !51, metadata !52, metadata !54, metadata !58, metadata !60, metadata !67, metadata !71, metadata !79, metadata !80, metadata !81, metadata !85, metadata !86, metadata !87, metadata !89, metadata !90, metadata !91, metadata !92, metadata !96, metadata !97, metadata !101, metadata !104, metadata !105, metadata !106, metadata !110, metadata !111, metadata !112, metadata !113, metadata !121, metadata !122, metadata !126, metadata !127}
!48 = metadata !{i32 786484, i32 0, null, metadata !"value", metadata !"value", metadata !"", metadata !5, i32 81, metadata !49, i32 0, i32 1, float* @value, null} ; [ DW_TAG_variable ] [value] [line 81] [def]
!49 = metadata !{i32 786468, null, null, metadata !"float", i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!50 = metadata !{i32 786484, i32 0, null, metadata !"fixed", metadata !"fixed", metadata !"", metadata !5, i32 81, metadata !49, i32 0, i32 1, float* @fixed, null} ; [ DW_TAG_variable ] [fixed] [line 81] [def]
!51 = metadata !{i32 786484, i32 0, null, metadata !"floated", metadata !"floated", metadata !"", metadata !5, i32 81, metadata !49, i32 0, i32 1, float* @floated, null} ; [ DW_TAG_variable ] [floated] [line 81] [def]
!52 = metadata !{i32 786484, i32 0, null, metadata !"seed", metadata !"seed", metadata !"", metadata !5, i32 84, metadata !53, i32 0, i32 1, i64* @seed, null} ; [ DW_TAG_variable ] [seed] [line 84] [def]
!53 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!54 = metadata !{i32 786484, i32 0, null, metadata !"permarray", metadata !"permarray", metadata !"", metadata !5, i32 87, metadata !55, i32 0, i32 1, [11 x i32]* @permarray, null} ; [ DW_TAG_variable ] [permarray] [line 87] [def]
!55 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 352, i64 32, i32 0, i32 0, metadata !11, metadata !56, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 352, align 32, offset 0] [from int]
!56 = metadata !{metadata !57}
!57 = metadata !{i32 786465, i64 0, i64 11}       ; [ DW_TAG_subrange_type ] [0, 10]
!58 = metadata !{i32 786484, i32 0, null, metadata !"pctr", metadata !"pctr", metadata !"", metadata !5, i32 89, metadata !59, i32 0, i32 1, i32* @pctr, null} ; [ DW_TAG_variable ] [pctr] [line 89] [def]
!59 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!60 = metadata !{i32 786484, i32 0, null, metadata !"tree", metadata !"tree", metadata !"", metadata !5, i32 92, metadata !61, i32 0, i32 1, %struct.node** @tree, null} ; [ DW_TAG_variable ] [tree] [line 92] [def]
!61 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !62} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from node]
!62 = metadata !{i32 786451, metadata !1, null, metadata !"node", i32 45, i64 192, i64 64, i32 0, i32 0, null, metadata !63, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [node] [line 45, size 192, align 64, offset 0] [def] [from ]
!63 = metadata !{metadata !64, metadata !65, metadata !66}
!64 = metadata !{i32 786445, metadata !1, metadata !62, metadata !"left", i32 46, i64 64, i64 64, i64 0, i32 0, metadata !61} ; [ DW_TAG_member ] [left] [line 46, size 64, align 64, offset 0] [from ]
!65 = metadata !{i32 786445, metadata !1, metadata !62, metadata !"right", i32 46, i64 64, i64 64, i64 64, i32 0, metadata !61} ; [ DW_TAG_member ] [right] [line 46, size 64, align 64, offset 64] [from ]
!66 = metadata !{i32 786445, metadata !1, metadata !62, metadata !"val", i32 47, i64 32, i64 32, i64 128, i32 0, metadata !11} ; [ DW_TAG_member ] [val] [line 47, size 32, align 32, offset 128] [from int]
!67 = metadata !{i32 786484, i32 0, null, metadata !"stack", metadata !"stack", metadata !"", metadata !5, i32 95, metadata !68, i32 0, i32 1, [4 x i32]* @stack, null} ; [ DW_TAG_variable ] [stack] [line 95] [def]
!68 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 128, i64 32, i32 0, i32 0, metadata !11, metadata !69, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 128, align 32, offset 0] [from int]
!69 = metadata !{metadata !70}
!70 = metadata !{i32 786465, i64 0, i64 4}        ; [ DW_TAG_subrange_type ] [0, 3]
!71 = metadata !{i32 786484, i32 0, null, metadata !"cellspace", metadata !"cellspace", metadata !"", metadata !5, i32 96, metadata !72, i32 0, i32 1, [19 x %struct.element]* @cellspace, null} ; [ DW_TAG_variable ] [cellspace] [line 96] [def]
!72 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 1216, i64 32, i32 0, i32 0, metadata !73, metadata !77, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1216, align 32, offset 0] [from element]
!73 = metadata !{i32 786451, metadata !1, null, metadata !"element", i32 54, i64 64, i64 32, i32 0, i32 0, null, metadata !74, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [element] [line 54, size 64, align 32, offset 0] [def] [from ]
!74 = metadata !{metadata !75, metadata !76}
!75 = metadata !{i32 786445, metadata !1, metadata !73, metadata !"discsize", i32 55, i64 32, i64 32, i64 0, i32 0, metadata !11} ; [ DW_TAG_member ] [discsize] [line 55, size 32, align 32, offset 0] [from int]
!76 = metadata !{i32 786445, metadata !1, metadata !73, metadata !"next", i32 56, i64 32, i64 32, i64 32, i32 0, metadata !11} ; [ DW_TAG_member ] [next] [line 56, size 32, align 32, offset 32] [from int]
!77 = metadata !{metadata !78}
!78 = metadata !{i32 786465, i64 0, i64 19}       ; [ DW_TAG_subrange_type ] [0, 18]
!79 = metadata !{i32 786484, i32 0, null, metadata !"freelist", metadata !"freelist", metadata !"", metadata !5, i32 97, metadata !11, i32 0, i32 1, i32* @freelist, null} ; [ DW_TAG_variable ] [freelist] [line 97] [def]
!80 = metadata !{i32 786484, i32 0, null, metadata !"movesdone", metadata !"movesdone", metadata !"", metadata !5, i32 97, metadata !11, i32 0, i32 1, i32* @movesdone, null} ; [ DW_TAG_variable ] [movesdone] [line 97] [def]
!81 = metadata !{i32 786484, i32 0, null, metadata !"ima", metadata !"ima", metadata !"", metadata !5, i32 101, metadata !82, i32 0, i32 1, [41 x [41 x i32]]* @ima, null} ; [ DW_TAG_variable ] [ima] [line 101] [def]
!82 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 53792, i64 32, i32 0, i32 0, metadata !11, metadata !83, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 53792, align 32, offset 0] [from int]
!83 = metadata !{metadata !84, metadata !84}
!84 = metadata !{i32 786465, i64 0, i64 41}       ; [ DW_TAG_subrange_type ] [0, 40]
!85 = metadata !{i32 786484, i32 0, null, metadata !"imb", metadata !"imb", metadata !"", metadata !5, i32 101, metadata !82, i32 0, i32 1, [41 x [41 x i32]]* @imb, null} ; [ DW_TAG_variable ] [imb] [line 101] [def]
!86 = metadata !{i32 786484, i32 0, null, metadata !"imr", metadata !"imr", metadata !"", metadata !5, i32 101, metadata !82, i32 0, i32 1, [41 x [41 x i32]]* @imr, null} ; [ DW_TAG_variable ] [imr] [line 101] [def]
!87 = metadata !{i32 786484, i32 0, null, metadata !"rma", metadata !"rma", metadata !"", metadata !5, i32 102, metadata !88, i32 0, i32 1, [41 x [41 x float]]* @rma, null} ; [ DW_TAG_variable ] [rma] [line 102] [def]
!88 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 53792, i64 32, i32 0, i32 0, metadata !49, metadata !83, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 53792, align 32, offset 0] [from float]
!89 = metadata !{i32 786484, i32 0, null, metadata !"rmb", metadata !"rmb", metadata !"", metadata !5, i32 102, metadata !88, i32 0, i32 1, [41 x [41 x float]]* @rmb, null} ; [ DW_TAG_variable ] [rmb] [line 102] [def]
!90 = metadata !{i32 786484, i32 0, null, metadata !"rmr", metadata !"rmr", metadata !"", metadata !5, i32 102, metadata !88, i32 0, i32 1, [41 x [41 x float]]* @rmr, null} ; [ DW_TAG_variable ] [rmr] [line 102] [def]
!91 = metadata !{i32 786484, i32 0, null, metadata !"piececount", metadata !"piececount", metadata !"", metadata !5, i32 105, metadata !68, i32 0, i32 1, [4 x i32]* @piececount, null} ; [ DW_TAG_variable ] [piececount] [line 105] [def]
!92 = metadata !{i32 786484, i32 0, null, metadata !"class", metadata !"class", metadata !"", metadata !5, i32 105, metadata !93, i32 0, i32 1, [13 x i32]* @class, null} ; [ DW_TAG_variable ] [class] [line 105] [def]
!93 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 416, i64 32, i32 0, i32 0, metadata !11, metadata !94, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 416, align 32, offset 0] [from int]
!94 = metadata !{metadata !95}
!95 = metadata !{i32 786465, i64 0, i64 13}       ; [ DW_TAG_subrange_type ] [0, 12]
!96 = metadata !{i32 786484, i32 0, null, metadata !"piecemax", metadata !"piecemax", metadata !"", metadata !5, i32 105, metadata !93, i32 0, i32 1, [13 x i32]* @piecemax, null} ; [ DW_TAG_variable ] [piecemax] [line 105] [def]
!97 = metadata !{i32 786484, i32 0, null, metadata !"puzzl", metadata !"puzzl", metadata !"", metadata !5, i32 106, metadata !98, i32 0, i32 1, [512 x i32]* @puzzl, null} ; [ DW_TAG_variable ] [puzzl] [line 106] [def]
!98 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 16384, i64 32, i32 0, i32 0, metadata !11, metadata !99, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16384, align 32, offset 0] [from int]
!99 = metadata !{metadata !100}
!100 = metadata !{i32 786465, i64 0, i64 512}     ; [ DW_TAG_subrange_type ] [0, 511]
!101 = metadata !{i32 786484, i32 0, null, metadata !"p", metadata !"p", metadata !"", metadata !5, i32 106, metadata !102, i32 0, i32 1, [13 x [512 x i32]]* @p, null} ; [ DW_TAG_variable ] [p] [line 106] [def]
!102 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 212992, i64 32, i32 0, i32 0, metadata !11, metadata !103, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 212992, align 32, offset 0] [from int]
!103 = metadata !{metadata !95, metadata !100}
!104 = metadata !{i32 786484, i32 0, null, metadata !"n", metadata !"n", metadata !"", metadata !5, i32 106, metadata !11, i32 0, i32 1, i32* @n, null} ; [ DW_TAG_variable ] [n] [line 106] [def]
!105 = metadata !{i32 786484, i32 0, null, metadata !"kount", metadata !"kount", metadata !"", metadata !5, i32 106, metadata !11, i32 0, i32 1, i32* @kount, null} ; [ DW_TAG_variable ] [kount] [line 106] [def]
!106 = metadata !{i32 786484, i32 0, null, metadata !"sortlist", metadata !"sortlist", metadata !"", metadata !5, i32 109, metadata !107, i32 0, i32 1, [5001 x i32]* @sortlist, null} ; [ DW_TAG_variable ] [sortlist] [line 109] [def]
!107 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 160032, i64 32, i32 0, i32 0, metadata !11, metadata !108, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 160032, align 32, offset 0] [from int]
!108 = metadata !{metadata !109}
!109 = metadata !{i32 786465, i64 0, i64 5001}    ; [ DW_TAG_subrange_type ] [0, 5000]
!110 = metadata !{i32 786484, i32 0, null, metadata !"biggest", metadata !"biggest", metadata !"", metadata !5, i32 109, metadata !11, i32 0, i32 1, i32* @biggest, null} ; [ DW_TAG_variable ] [biggest] [line 109] [def]
!111 = metadata !{i32 786484, i32 0, null, metadata !"littlest", metadata !"littlest", metadata !"", metadata !5, i32 109, metadata !11, i32 0, i32 1, i32* @littlest, null} ; [ DW_TAG_variable ] [littlest] [line 109] [def]
!112 = metadata !{i32 786484, i32 0, null, metadata !"top", metadata !"top", metadata !"", metadata !5, i32 109, metadata !11, i32 0, i32 1, i32* @top, null} ; [ DW_TAG_variable ] [top] [line 109] [def]
!113 = metadata !{i32 786484, i32 0, null, metadata !"z", metadata !"z", metadata !"", metadata !5, i32 112, metadata !114, i32 0, i32 1, [257 x %struct.complex]* @z, null} ; [ DW_TAG_variable ] [z] [line 112] [def]
!114 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 16448, i64 32, i32 0, i32 0, metadata !115, metadata !119, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16448, align 32, offset 0] [from complex]
!115 = metadata !{i32 786451, metadata !1, null, metadata !"complex", i32 75, i64 64, i64 32, i32 0, i32 0, null, metadata !116, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [complex] [line 75, size 64, align 32, offset 0] [def] [from ]
!116 = metadata !{metadata !117, metadata !118}
!117 = metadata !{i32 786445, metadata !1, metadata !115, metadata !"rp", i32 75, i64 32, i64 32, i64 0, i32 0, metadata !49} ; [ DW_TAG_member ] [rp] [line 75, size 32, align 32, offset 0] [from float]
!118 = metadata !{i32 786445, metadata !1, metadata !115, metadata !"ip", i32 75, i64 32, i64 32, i64 32, i32 0, metadata !49} ; [ DW_TAG_member ] [ip] [line 75, size 32, align 32, offset 32] [from float]
!119 = metadata !{metadata !120}
!120 = metadata !{i32 786465, i64 0, i64 257}     ; [ DW_TAG_subrange_type ] [0, 256]
!121 = metadata !{i32 786484, i32 0, null, metadata !"w", metadata !"w", metadata !"", metadata !5, i32 112, metadata !114, i32 0, i32 1, [257 x %struct.complex]* @w, null} ; [ DW_TAG_variable ] [w] [line 112] [def]
!122 = metadata !{i32 786484, i32 0, null, metadata !"e", metadata !"e", metadata !"", metadata !5, i32 112, metadata !123, i32 0, i32 1, [130 x %struct.complex]* @e, null} ; [ DW_TAG_variable ] [e] [line 112] [def]
!123 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 8320, i64 32, i32 0, i32 0, metadata !115, metadata !124, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 8320, align 32, offset 0] [from complex]
!124 = metadata !{metadata !125}
!125 = metadata !{i32 786465, i64 0, i64 130}     ; [ DW_TAG_subrange_type ] [0, 129]
!126 = metadata !{i32 786484, i32 0, null, metadata !"zr", metadata !"zr", metadata !"", metadata !5, i32 113, metadata !49, i32 0, i32 1, float* @zr, null} ; [ DW_TAG_variable ] [zr] [line 113] [def]
!127 = metadata !{i32 786484, i32 0, null, metadata !"zi", metadata !"zi", metadata !"", metadata !5, i32 113, metadata !49, i32 0, i32 1, float* @zi, null} ; [ DW_TAG_variable ] [zi] [line 113] [def]
!128 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!129 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!130 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!131 = metadata !{i32 116, i32 0, metadata !4, null}
!132 = metadata !{metadata !133, metadata !133, i64 0}
!133 = metadata !{metadata !"long", metadata !134, i64 0}
!134 = metadata !{metadata !"omnipotent char", metadata !135, i64 0}
!135 = metadata !{metadata !"Simple C/C++ TBAA"}
!136 = metadata !{i32 117, i32 0, metadata !4, null}
!137 = metadata !{i32 120, i32 0, metadata !8, null}
!138 = metadata !{i32 121, i32 0, metadata !8, null}
!139 = metadata !{i32 128, i32 0, metadata !12, null}
!140 = metadata !{i32 0}
!141 = metadata !{i32 130, i32 0, metadata !142, null}
!142 = metadata !{i32 786443, metadata !1, metadata !12, i32 130, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!143 = metadata !{metadata !144, metadata !144, i64 0}
!144 = metadata !{metadata !"int", metadata !134, i64 0}
!145 = metadata !{i32 131, i32 0, metadata !146, null}
!146 = metadata !{i32 786443, metadata !1, metadata !142, i32 131, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!147 = metadata !{i32 131, i32 0, metadata !148, null}
!148 = metadata !{i32 786443, metadata !1, metadata !146, i32 131, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!149 = metadata !{i32 133, i32 0, metadata !12, null}
!150 = metadata !{i32 135, i32 0, metadata !19, null}
!151 = metadata !{i32 137, i32 0, metadata !152, null}
!152 = metadata !{i32 786443, metadata !1, metadata !19, i32 137, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!153 = metadata !{i32 137, i32 0, metadata !154, null}
!154 = metadata !{i32 786443, metadata !1, metadata !152, i32 137, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!155 = metadata !{i32 138, i32 0, metadata !19, null}
!156 = metadata !{i32 139, i32 0, metadata !157, null}
!157 = metadata !{i32 786443, metadata !1, metadata !19, i32 139, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!158 = metadata !{i32 139, i32 0, metadata !159, null}
!159 = metadata !{i32 786443, metadata !1, metadata !157, i32 139, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!160 = metadata !{i32 141, i32 0, metadata !19, null}
!161 = metadata !{i32 143, i32 0, metadata !24, null}
!162 = metadata !{i32 145, i32 0, metadata !163, null}
!163 = metadata !{i32 786443, metadata !1, metadata !24, i32 145, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!164 = metadata !{i32 145, i32 0, metadata !165, null}
!165 = metadata !{i32 786443, metadata !1, metadata !163, i32 145, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!166 = metadata !{i32 146, i32 0, metadata !24, null}
!167 = metadata !{i32 147, i32 0, metadata !24, null}
!168 = metadata !{i32 149, i32 0, metadata !31, null}
!169 = metadata !{i32 151, i32 0, metadata !31, null}
!170 = metadata !{i32 152, i32 0, metadata !171, null}
!171 = metadata !{i32 786443, metadata !1, metadata !31, i32 152, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!172 = metadata !{i32 153, i32 0, metadata !173, null}
!173 = metadata !{i32 786443, metadata !1, metadata !171, i32 153, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!174 = metadata !{i32 154, i32 0, metadata !175, null}
!175 = metadata !{i32 786443, metadata !1, metadata !173, i32 154, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!176 = metadata !{i32 155, i32 0, metadata !177, null}
!177 = metadata !{i32 786443, metadata !1, metadata !175, i32 154, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!178 = metadata !{i32 156, i32 0, metadata !179, null}
!179 = metadata !{i32 786443, metadata !1, metadata !177, i32 156, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!180 = metadata !{i32 157, i32 0, metadata !179, null}
!181 = metadata !{i32 158, i32 0, metadata !177, null}
!182 = metadata !{i32 160, i32 0, metadata !31, null}
!183 = metadata !{i32 164, i32 0, metadata !184, null}
!184 = metadata !{i32 786443, metadata !1, metadata !38, i32 164, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!185 = metadata !{i32 165, i32 0, metadata !186, null}
!186 = metadata !{i32 786443, metadata !1, metadata !187, i32 165, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!187 = metadata !{i32 786443, metadata !1, metadata !38, i32 165, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!188 = metadata !{i32 166, i32 0, metadata !189, null}
!189 = metadata !{i32 786443, metadata !1, metadata !190, i32 166, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!190 = metadata !{i32 786443, metadata !1, metadata !38, i32 166, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!191 = metadata !{i32 167, i32 0, metadata !192, null}
!192 = metadata !{i32 786443, metadata !1, metadata !38, i32 167, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!193 = metadata !{i32 165, i32 0, metadata !194, null}
!194 = metadata !{i32 786443, metadata !1, metadata !186, i32 165, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!195 = metadata !{i32 165, i32 0, metadata !187, null}
!196 = metadata !{i32 167, i32 0, metadata !197, null}
!197 = metadata !{i32 786443, metadata !1, metadata !192, i32 167, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!198 = metadata !{i32 167, i32 0, metadata !199, null}
!199 = metadata !{i32 786443, metadata !1, metadata !197, i32 167, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!200 = metadata !{i32 168, i32 0, metadata !38, null}
!201 = metadata !{i32 169, i32 0, metadata !38, null}
!202 = metadata !{i32 170, i32 0, metadata !203, null}
!203 = metadata !{i32 786443, metadata !1, metadata !38, i32 170, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!204 = metadata !{i32 170, i32 0, metadata !205, null}
!205 = metadata !{i32 786443, metadata !1, metadata !203, i32 170, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!206 = metadata !{i32 170, i32 0, metadata !207, null}
!207 = metadata !{i32 786443, metadata !1, metadata !205, i32 170, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!208 = metadata !{i32 171, i32 0, metadata !38, null}
!209 = metadata !{i32 172, i32 0, metadata !38, null}
!210 = metadata !{i32 173, i32 0, metadata !211, null}
!211 = metadata !{i32 786443, metadata !1, metadata !38, i32 173, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!212 = metadata !{i32 173, i32 0, metadata !213, null}
!213 = metadata !{i32 786443, metadata !1, metadata !214, i32 173, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!214 = metadata !{i32 786443, metadata !1, metadata !211, i32 173, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!215 = metadata !{i32 173, i32 0, metadata !214, null}
!216 = metadata !{i32 174, i32 0, metadata !38, null}
!217 = metadata !{i32 175, i32 0, metadata !38, null}
!218 = metadata !{i32 176, i32 0, metadata !219, null}
!219 = metadata !{i32 786443, metadata !1, metadata !38, i32 176, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!220 = metadata !{i32 176, i32 0, metadata !221, null}
!221 = metadata !{i32 786443, metadata !1, metadata !219, i32 176, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!222 = metadata !{i32 176, i32 0, metadata !223, null}
!223 = metadata !{i32 786443, metadata !1, metadata !221, i32 176, i32 0, i32 31} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!224 = metadata !{i32 177, i32 0, metadata !38, null}
!225 = metadata !{i32 178, i32 0, metadata !38, null}
!226 = metadata !{i32 179, i32 0, metadata !227, null}
!227 = metadata !{i32 786443, metadata !1, metadata !38, i32 179, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!228 = metadata !{i32 179, i32 0, metadata !229, null}
!229 = metadata !{i32 786443, metadata !1, metadata !227, i32 179, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!230 = metadata !{i32 179, i32 0, metadata !231, null}
!231 = metadata !{i32 786443, metadata !1, metadata !229, i32 179, i32 0, i32 34} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!232 = metadata !{i32 180, i32 0, metadata !38, null}
!233 = metadata !{i32 181, i32 0, metadata !38, null}
!234 = metadata !{i32 182, i32 0, metadata !235, null}
!235 = metadata !{i32 786443, metadata !1, metadata !38, i32 182, i32 0, i32 35} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!236 = metadata !{i32 182, i32 0, metadata !237, null}
!237 = metadata !{i32 786443, metadata !1, metadata !238, i32 182, i32 0, i32 37} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!238 = metadata !{i32 786443, metadata !1, metadata !235, i32 182, i32 0, i32 36} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!239 = metadata !{i32 182, i32 0, metadata !238, null}
!240 = metadata !{i32 183, i32 0, metadata !38, null}
!241 = metadata !{i32 184, i32 0, metadata !38, null}
!242 = metadata !{i32 185, i32 0, metadata !243, null}
!243 = metadata !{i32 786443, metadata !1, metadata !38, i32 185, i32 0, i32 38} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!244 = metadata !{i32 185, i32 0, metadata !245, null}
!245 = metadata !{i32 786443, metadata !1, metadata !246, i32 185, i32 0, i32 40} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!246 = metadata !{i32 786443, metadata !1, metadata !243, i32 185, i32 0, i32 39} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!247 = metadata !{i32 186, i32 0, metadata !38, null}
!248 = metadata !{i32 187, i32 0, metadata !38, null}
!249 = metadata !{i32 188, i32 0, metadata !250, null}
!250 = metadata !{i32 786443, metadata !1, metadata !38, i32 188, i32 0, i32 41} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!251 = metadata !{i32 188, i32 0, metadata !252, null}
!252 = metadata !{i32 786443, metadata !1, metadata !253, i32 188, i32 0, i32 43} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!253 = metadata !{i32 786443, metadata !1, metadata !250, i32 188, i32 0, i32 42} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!254 = metadata !{i32 188, i32 0, metadata !253, null}
!255 = metadata !{i32 189, i32 0, metadata !38, null}
!256 = metadata !{i32 190, i32 0, metadata !38, null}
!257 = metadata !{i32 191, i32 0, metadata !258, null}
!258 = metadata !{i32 786443, metadata !1, metadata !38, i32 191, i32 0, i32 44} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!259 = metadata !{i32 191, i32 0, metadata !260, null}
!260 = metadata !{i32 786443, metadata !1, metadata !261, i32 191, i32 0, i32 46} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!261 = metadata !{i32 786443, metadata !1, metadata !258, i32 191, i32 0, i32 45} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!262 = metadata !{i32 192, i32 0, metadata !38, null}
!263 = metadata !{i32 193, i32 0, metadata !38, null}
!264 = metadata !{i32 194, i32 0, metadata !265, null}
!265 = metadata !{i32 786443, metadata !1, metadata !38, i32 194, i32 0, i32 47} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!266 = metadata !{i32 194, i32 0, metadata !267, null}
!267 = metadata !{i32 786443, metadata !1, metadata !265, i32 194, i32 0, i32 48} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!268 = metadata !{i32 194, i32 0, metadata !269, null}
!269 = metadata !{i32 786443, metadata !1, metadata !267, i32 194, i32 0, i32 49} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!270 = metadata !{i32 195, i32 0, metadata !38, null}
!271 = metadata !{i32 196, i32 0, metadata !38, null}
!272 = metadata !{i32 197, i32 0, metadata !273, null}
!273 = metadata !{i32 786443, metadata !1, metadata !38, i32 197, i32 0, i32 50} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!274 = metadata !{i32 197, i32 0, metadata !275, null}
!275 = metadata !{i32 786443, metadata !1, metadata !273, i32 197, i32 0, i32 51} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!276 = metadata !{i32 197, i32 0, metadata !277, null}
!277 = metadata !{i32 786443, metadata !1, metadata !275, i32 197, i32 0, i32 52} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!278 = metadata !{i32 198, i32 0, metadata !38, null}
!279 = metadata !{i32 199, i32 0, metadata !38, null}
!280 = metadata !{i32 200, i32 0, metadata !281, null}
!281 = metadata !{i32 786443, metadata !1, metadata !38, i32 200, i32 0, i32 53} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!282 = metadata !{i32 200, i32 0, metadata !283, null}
!283 = metadata !{i32 786443, metadata !1, metadata !284, i32 200, i32 0, i32 55} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!284 = metadata !{i32 786443, metadata !1, metadata !281, i32 200, i32 0, i32 54} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!285 = metadata !{i32 200, i32 0, metadata !284, null}
!286 = metadata !{i32 201, i32 0, metadata !38, null}
!287 = metadata !{i32 202, i32 0, metadata !38, null}
!288 = metadata !{i32 203, i32 0, metadata !289, null}
!289 = metadata !{i32 786443, metadata !1, metadata !38, i32 203, i32 0, i32 56} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!290 = metadata !{i32 203, i32 0, metadata !291, null}
!291 = metadata !{i32 786443, metadata !1, metadata !289, i32 203, i32 0, i32 57} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!292 = metadata !{i32 203, i32 0, metadata !293, null}
!293 = metadata !{i32 786443, metadata !1, metadata !291, i32 203, i32 0, i32 58} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!294 = metadata !{i32 204, i32 0, metadata !38, null}
!295 = metadata !{i32 205, i32 0, metadata !38, null}
!296 = metadata !{i32 206, i32 0, metadata !38, null}
!297 = metadata !{i32 207, i32 0, metadata !38, null}
!298 = metadata !{i32 208, i32 0, metadata !38, null}
!299 = metadata !{i32 209, i32 0, metadata !38, null}
!300 = metadata !{i32 73}
!301 = metadata !{i32 210, i32 0, metadata !38, null}
!302 = metadata !{i32 211, i32 0, metadata !38, null}
!303 = metadata !{i32 212, i32 0, metadata !304, null}
!304 = metadata !{i32 786443, metadata !1, metadata !38, i32 212, i32 0, i32 59} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!305 = metadata !{i32 213, i32 0, metadata !304, null}
!306 = metadata !{i32 214, i32 0, metadata !307, null}
!307 = metadata !{i32 786443, metadata !1, metadata !38, i32 214, i32 0, i32 60} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!308 = metadata !{i32 215, i32 0, metadata !309, null}
!309 = metadata !{i32 786443, metadata !1, metadata !307, i32 215, i32 0, i32 61} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!310 = metadata !{i32 216, i32 0, metadata !38, null}
!311 = metadata !{i32 217, i32 0, metadata !38, null}
!312 = metadata !{i32 218, i32 0, metadata !38, null}
!313 = metadata !{i32 223, i32 0, metadata !314, null}
!314 = metadata !{i32 786443, metadata !1, metadata !44, i32 223, i32 0, i32 62} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!315 = metadata !{i32 224, i32 0, metadata !44, null}
