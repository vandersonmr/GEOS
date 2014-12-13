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

; Function Attrs: nounwind optsize uwtable
define void @Initrand() #0 {
  store i64 74755, i64* @seed, align 8, !dbg !131, !tbaa !132
  ret void, !dbg !136
}

; Function Attrs: nounwind optsize uwtable
define i32 @Rand() #0 {
  %1 = load i64* @seed, align 8, !dbg !137, !tbaa !132
  %2 = mul nsw i64 %1, 1309, !dbg !137
  %3 = add nsw i64 %2, 13849, !dbg !137
  %4 = and i64 %3, 65535, !dbg !137
  store i64 %4, i64* @seed, align 8, !dbg !137, !tbaa !132
  %5 = trunc i64 %4 to i32, !dbg !138
  ret i32 %5, !dbg !138
}

; Function Attrs: nounwind optsize readonly uwtable
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

; Function Attrs: nounwind optsize uwtable
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

; Function Attrs: nounwind optsize uwtable
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

; Function Attrs: nounwind optsize uwtable
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

; Function Attrs: nounwind optsize uwtable
define void @Puzzle() #0 {
vector.ph:
  tail call void @llvm.dbg.value(metadata !140, i64 0, metadata !43), !dbg !183
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ], !dbg !183
  %0 = getelementptr inbounds [512 x i32]* @puzzl, i64 0, i64 %index, !dbg !183
  %1 = bitcast i32* %0 to <4 x i32>*, !dbg !183
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %1, align 16, !dbg !183
  %index.next = add i64 %index, 4, !dbg !183
  %2 = icmp eq i64 %index.next, 512, !dbg !183
  br i1 %2, label %.preheader33, label %vector.body, !dbg !183, !llvm.loop !185

.preheader33:                                     ; preds = %vector.body, %10
  %indvars.iv190 = phi i64 [ %indvars.iv.next191, %10 ], [ 1, %vector.body ]
  br label %.preheader32, !dbg !188

.preheader31:                                     ; preds = %10
  call void @llvm.memset.p0i8.i64(i8* bitcast ([13 x [512 x i32]]* @p to i8*), i8 0, i64 26624, i32 16, i1 false), !dbg !191
  br label %.preheader28, !dbg !194

.preheader32:                                     ; preds = %9, %.preheader33
  %indvars.iv187 = phi i64 [ 1, %.preheader33 ], [ %indvars.iv.next188, %9 ]
  br label %3, !dbg !196

; <label>:3                                       ; preds = %3, %.preheader32
  %indvars.iv184 = phi i64 [ 1, %.preheader32 ], [ %indvars.iv.next185, %3 ]
  %4 = shl i64 %indvars.iv184, 3, !dbg !196
  %5 = add nsw i64 %4, %indvars.iv187, !dbg !196
  %6 = shl i64 %5, 3, !dbg !196
  %7 = add nsw i64 %6, %indvars.iv190, !dbg !196
  %8 = getelementptr inbounds [512 x i32]* @puzzl, i64 0, i64 %7, !dbg !196
  store i32 0, i32* %8, align 4, !dbg !196, !tbaa !143
  %indvars.iv.next185 = add nuw nsw i64 %indvars.iv184, 1, !dbg !196
  %exitcond186 = icmp eq i64 %indvars.iv.next185, 6, !dbg !196
  br i1 %exitcond186, label %9, label %3, !dbg !196

; <label>:9                                       ; preds = %3
  %indvars.iv.next188 = add nuw nsw i64 %indvars.iv187, 1, !dbg !188
  %exitcond189 = icmp eq i64 %indvars.iv.next188, 6, !dbg !188
  br i1 %exitcond189, label %10, label %.preheader32, !dbg !188

; <label>:10                                      ; preds = %9
  %indvars.iv.next191 = add nuw nsw i64 %indvars.iv190, 1, !dbg !198
  %exitcond192 = icmp eq i64 %indvars.iv.next191, 6, !dbg !198
  br i1 %exitcond192, label %.preheader31, label %.preheader33, !dbg !198

.preheader28:                                     ; preds = %15, %.preheader31
  %indvars.iv176 = phi i64 [ 0, %.preheader31 ], [ %indvars.iv.next177, %15 ]
  br label %11, !dbg !199

; <label>:11                                      ; preds = %.preheader28, %11
  %indvars.iv173 = phi i64 [ 0, %.preheader28 ], [ %indvars.iv.next174, %11 ]
  %12 = shl i64 %indvars.iv173, 3, !dbg !201
  %13 = add nsw i64 %12, %indvars.iv176, !dbg !201
  %14 = getelementptr inbounds [13 x [512 x i32]]* @p, i64 0, i64 0, i64 %13, !dbg !201
  store i32 1, i32* %14, align 4, !dbg !201, !tbaa !143
  %indvars.iv.next174 = add nuw nsw i64 %indvars.iv173, 1, !dbg !199
  %exitcond175 = icmp eq i64 %indvars.iv.next174, 2, !dbg !199
  br i1 %exitcond175, label %15, label %11, !dbg !199

; <label>:15                                      ; preds = %11
  %indvars.iv.next177 = add nuw nsw i64 %indvars.iv176, 1, !dbg !194
  %exitcond178 = icmp eq i64 %indvars.iv.next177, 4, !dbg !194
  br i1 %exitcond178, label %16, label %.preheader28, !dbg !194

; <label>:16                                      ; preds = %15
  store i32 0, i32* getelementptr inbounds ([13 x i32]* @class, i64 0, i64 0), align 16, !dbg !203, !tbaa !143
  store i32 11, i32* getelementptr inbounds ([13 x i32]* @piecemax, i64 0, i64 0), align 16, !dbg !204, !tbaa !143
  tail call void @llvm.dbg.value(metadata !140, i64 0, metadata !40), !dbg !205
  br label %.preheader26, !dbg !205

.preheader26:                                     ; preds = %20, %16
  %indvars.iv168 = phi i64 [ 0, %16 ], [ %indvars.iv.next169, %20 ]
  br label %.preheader25, !dbg !207

.preheader25:                                     ; preds = %.preheader26, %.preheader25
  %indvars.iv163 = phi i64 [ %indvars.iv.next164, %.preheader25 ], [ 0, %.preheader26 ]
  %17 = shl i64 %indvars.iv163, 6, !dbg !209
  %18 = add nsw i64 %17, %indvars.iv168, !dbg !209
  %19 = getelementptr inbounds [13 x [512 x i32]]* @p, i64 0, i64 1, i64 %18, !dbg !209
  store i32 1, i32* %19, align 4, !dbg !209, !tbaa !143
  %indvars.iv.next164 = add nuw nsw i64 %indvars.iv163, 1, !dbg !209
  %exitcond165 = icmp eq i64 %indvars.iv.next164, 4, !dbg !209
  br i1 %exitcond165, label %20, label %.preheader25, !dbg !209

; <label>:20                                      ; preds = %.preheader25
  %indvars.iv.next169 = add nuw nsw i64 %indvars.iv168, 1, !dbg !205
  %exitcond170 = icmp eq i64 %indvars.iv.next169, 2, !dbg !205
  br i1 %exitcond170, label %21, label %.preheader26, !dbg !205

; <label>:21                                      ; preds = %20
  store i32 0, i32* getelementptr inbounds ([13 x i32]* @class, i64 0, i64 1), align 4, !dbg !211, !tbaa !143
  store i32 193, i32* getelementptr inbounds ([13 x i32]* @piecemax, i64 0, i64 1), align 4, !dbg !212, !tbaa !143
  tail call void @llvm.dbg.value(metadata !140, i64 0, metadata !40), !dbg !213
  br label %.preheader23, !dbg !213

.preheader23:                                     ; preds = %21, %27
  %indvars.iv158 = phi i64 [ %indvars.iv.next159, %27 ], [ 0, %21 ]
  br label %22, !dbg !215

; <label>:22                                      ; preds = %22, %.preheader23
  %indvars.iv155 = phi i64 [ 0, %.preheader23 ], [ %indvars.iv.next156, %22 ]
  %23 = shl i64 %indvars.iv155, 3, !dbg !215
  %24 = add nsw i64 %23, %indvars.iv158, !dbg !215
  %25 = shl i64 %24, 3, !dbg !215
  %26 = getelementptr inbounds [13 x [512 x i32]]* @p, i64 0, i64 2, i64 %25, !dbg !215
  store i32 1, i32* %26, align 16, !dbg !215, !tbaa !143
  %indvars.iv.next156 = add nuw nsw i64 %indvars.iv155, 1, !dbg !215
  %exitcond157 = icmp eq i64 %indvars.iv.next156, 2, !dbg !215
  br i1 %exitcond157, label %27, label %22, !dbg !215

; <label>:27                                      ; preds = %22
  %indvars.iv.next159 = add nuw nsw i64 %indvars.iv158, 1, !dbg !218
  %exitcond160 = icmp eq i64 %indvars.iv.next159, 4, !dbg !218
  br i1 %exitcond160, label %28, label %.preheader23, !dbg !218

; <label>:28                                      ; preds = %27
  store i32 0, i32* getelementptr inbounds ([13 x i32]* @class, i64 0, i64 2), align 8, !dbg !219, !tbaa !143
  store i32 88, i32* getelementptr inbounds ([13 x i32]* @piecemax, i64 0, i64 2), align 8, !dbg !220, !tbaa !143
  tail call void @llvm.dbg.value(metadata !140, i64 0, metadata !40), !dbg !221
  br label %.preheader22, !dbg !221

.preheader22:                                     ; preds = %33, %28
  %indvars.iv152 = phi i64 [ 0, %28 ], [ %indvars.iv.next153, %33 ]
  br label %29, !dbg !223

; <label>:29                                      ; preds = %.preheader22, %29
  %indvars.iv149 = phi i64 [ 0, %.preheader22 ], [ %indvars.iv.next150, %29 ]
  %30 = shl i64 %indvars.iv149, 3, !dbg !225
  %31 = add nsw i64 %30, %indvars.iv152, !dbg !225
  %32 = getelementptr inbounds [13 x [512 x i32]]* @p, i64 0, i64 3, i64 %31, !dbg !225
  store i32 1, i32* %32, align 4, !dbg !225, !tbaa !143
  %indvars.iv.next150 = add nuw nsw i64 %indvars.iv149, 1, !dbg !223
  %exitcond151 = icmp eq i64 %indvars.iv.next150, 4, !dbg !223
  br i1 %exitcond151, label %33, label %29, !dbg !223

; <label>:33                                      ; preds = %29
  %indvars.iv.next153 = add nuw nsw i64 %indvars.iv152, 1, !dbg !221
  %exitcond154 = icmp eq i64 %indvars.iv.next153, 2, !dbg !221
  br i1 %exitcond154, label %34, label %.preheader22, !dbg !221

; <label>:34                                      ; preds = %33
  store i32 0, i32* getelementptr inbounds ([13 x i32]* @class, i64 0, i64 3), align 4, !dbg !227, !tbaa !143
  store i32 25, i32* getelementptr inbounds ([13 x i32]* @piecemax, i64 0, i64 3), align 4, !dbg !228, !tbaa !143
  tail call void @llvm.dbg.value(metadata !140, i64 0, metadata !40), !dbg !229
  br label %.preheader20, !dbg !229

.preheader20:                                     ; preds = %38, %34
  %indvars.iv144 = phi i64 [ 0, %34 ], [ %indvars.iv.next145, %38 ]
  br label %.preheader19, !dbg !231

.preheader19:                                     ; preds = %.preheader20, %.preheader19
  %indvars.iv139 = phi i64 [ %indvars.iv.next140, %.preheader19 ], [ 0, %.preheader20 ]
  %35 = shl i64 %indvars.iv139, 6, !dbg !233
  %36 = add nsw i64 %35, %indvars.iv144, !dbg !233
  %37 = getelementptr inbounds [13 x [512 x i32]]* @p, i64 0, i64 4, i64 %36, !dbg !233
  store i32 1, i32* %37, align 4, !dbg !233, !tbaa !143
  %indvars.iv.next140 = add nuw nsw i64 %indvars.iv139, 1, !dbg !233
  %exitcond141 = icmp eq i64 %indvars.iv.next140, 2, !dbg !233
  br i1 %exitcond141, label %38, label %.preheader19, !dbg !233

; <label>:38                                      ; preds = %.preheader19
  %indvars.iv.next145 = add nuw nsw i64 %indvars.iv144, 1, !dbg !229
  %exitcond146 = icmp eq i64 %indvars.iv.next145, 4, !dbg !229
  br i1 %exitcond146, label %39, label %.preheader20, !dbg !229

; <label>:39                                      ; preds = %38
  store i32 0, i32* getelementptr inbounds ([13 x i32]* @class, i64 0, i64 4), align 16, !dbg !235, !tbaa !143
  store i32 67, i32* getelementptr inbounds ([13 x i32]* @piecemax, i64 0, i64 4), align 16, !dbg !236, !tbaa !143
  tail call void @llvm.dbg.value(metadata !140, i64 0, metadata !40), !dbg !237
  br label %.preheader17, !dbg !237

.preheader17:                                     ; preds = %39, %45
  %indvars.iv134 = phi i64 [ %indvars.iv.next135, %45 ], [ 0, %39 ]
  br label %40, !dbg !239

; <label>:40                                      ; preds = %40, %.preheader17
  %indvars.iv131 = phi i64 [ 0, %.preheader17 ], [ %indvars.iv.next132, %40 ]
  %41 = shl i64 %indvars.iv131, 3, !dbg !239
  %42 = add nsw i64 %41, %indvars.iv134, !dbg !239
  %43 = shl i64 %42, 3, !dbg !239
  %44 = getelementptr inbounds [13 x [512 x i32]]* @p, i64 0, i64 5, i64 %43, !dbg !239
  store i32 1, i32* %44, align 16, !dbg !239, !tbaa !143
  %indvars.iv.next132 = add nuw nsw i64 %indvars.iv131, 1, !dbg !239
  %exitcond133 = icmp eq i64 %indvars.iv.next132, 4, !dbg !239
  br i1 %exitcond133, label %45, label %40, !dbg !239

; <label>:45                                      ; preds = %40
  %indvars.iv.next135 = add nuw nsw i64 %indvars.iv134, 1, !dbg !242
  %exitcond136 = icmp eq i64 %indvars.iv.next135, 2, !dbg !242
  br i1 %exitcond136, label %46, label %.preheader17, !dbg !242

; <label>:46                                      ; preds = %45
  store i32 0, i32* getelementptr inbounds ([13 x i32]* @class, i64 0, i64 5), align 4, !dbg !243, !tbaa !143
  store i32 200, i32* getelementptr inbounds ([13 x i32]* @piecemax, i64 0, i64 5), align 4, !dbg !244, !tbaa !143
  tail call void @llvm.dbg.value(metadata !140, i64 0, metadata !40), !dbg !245
  br label %47, !dbg !245

; <label>:47                                      ; preds = %46, %47
  %indvars.iv128 = phi i64 [ 0, %46 ], [ %indvars.iv.next129, %47 ]
  %48 = getelementptr inbounds [13 x [512 x i32]]* @p, i64 0, i64 6, i64 %indvars.iv128, !dbg !247
  store i32 1, i32* %48, align 4, !dbg !247, !tbaa !143
  %indvars.iv.next129 = add nuw nsw i64 %indvars.iv128, 1, !dbg !245
  %exitcond130 = icmp eq i64 %indvars.iv.next129, 3, !dbg !245
  br i1 %exitcond130, label %49, label %47, !dbg !245

; <label>:49                                      ; preds = %47
  store i32 1, i32* getelementptr inbounds ([13 x i32]* @class, i64 0, i64 6), align 8, !dbg !250, !tbaa !143
  store i32 2, i32* getelementptr inbounds ([13 x i32]* @piecemax, i64 0, i64 6), align 8, !dbg !251, !tbaa !143
  tail call void @llvm.dbg.value(metadata !140, i64 0, metadata !40), !dbg !252
  br label %50, !dbg !252

; <label>:50                                      ; preds = %50, %49
  %indvars.iv119 = phi i64 [ %indvars.iv.next120, %50 ], [ 0, %49 ]
  %51 = shl i64 %indvars.iv119, 3, !dbg !254
  %52 = getelementptr inbounds [13 x [512 x i32]]* @p, i64 0, i64 7, i64 %51, !dbg !254
  store i32 1, i32* %52, align 16, !dbg !254, !tbaa !143
  %indvars.iv.next120 = add nuw nsw i64 %indvars.iv119, 1, !dbg !257
  %exitcond121 = icmp eq i64 %indvars.iv.next120, 3, !dbg !257
  br i1 %exitcond121, label %53, label %50, !dbg !257

; <label>:53                                      ; preds = %50
  store i32 1, i32* getelementptr inbounds ([13 x i32]* @class, i64 0, i64 7), align 4, !dbg !258, !tbaa !143
  store i32 16, i32* getelementptr inbounds ([13 x i32]* @piecemax, i64 0, i64 7), align 4, !dbg !259, !tbaa !143
  tail call void @llvm.dbg.value(metadata !140, i64 0, metadata !40), !dbg !260
  br label %.preheader11, !dbg !260

.preheader11:                                     ; preds = %53, %.preheader11
  %indvars.iv110 = phi i64 [ %indvars.iv.next111, %.preheader11 ], [ 0, %53 ]
  %54 = shl i64 %indvars.iv110, 6, !dbg !262
  %55 = getelementptr inbounds [13 x [512 x i32]]* @p, i64 0, i64 8, i64 %54, !dbg !262
  store i32 1, i32* %55, align 16, !dbg !262, !tbaa !143
  %indvars.iv.next111 = add nuw nsw i64 %indvars.iv110, 1, !dbg !262
  %exitcond112 = icmp eq i64 %indvars.iv.next111, 3, !dbg !262
  br i1 %exitcond112, label %56, label %.preheader11, !dbg !262

; <label>:56                                      ; preds = %.preheader11
  store i32 1, i32* getelementptr inbounds ([13 x i32]* @class, i64 0, i64 8), align 16, !dbg !265, !tbaa !143
  store i32 128, i32* getelementptr inbounds ([13 x i32]* @piecemax, i64 0, i64 8), align 16, !dbg !266, !tbaa !143
  tail call void @llvm.dbg.value(metadata !140, i64 0, metadata !40), !dbg !267
  br label %.preheader10, !dbg !267

.preheader10:                                     ; preds = %61, %56
  %indvars.iv107 = phi i64 [ 0, %56 ], [ %indvars.iv.next108, %61 ]
  br label %57, !dbg !269

; <label>:57                                      ; preds = %.preheader10, %57
  %indvars.iv104 = phi i64 [ 0, %.preheader10 ], [ %indvars.iv.next105, %57 ]
  %58 = shl i64 %indvars.iv104, 3, !dbg !271
  %59 = add nsw i64 %58, %indvars.iv107, !dbg !271
  %60 = getelementptr inbounds [13 x [512 x i32]]* @p, i64 0, i64 9, i64 %59, !dbg !271
  store i32 1, i32* %60, align 4, !dbg !271, !tbaa !143
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104, 1, !dbg !269
  %exitcond106 = icmp eq i64 %indvars.iv.next105, 2, !dbg !269
  br i1 %exitcond106, label %61, label %57, !dbg !269

; <label>:61                                      ; preds = %57
  %indvars.iv.next108 = add nuw nsw i64 %indvars.iv107, 1, !dbg !267
  %exitcond109 = icmp eq i64 %indvars.iv.next108, 2, !dbg !267
  br i1 %exitcond109, label %62, label %.preheader10, !dbg !267

; <label>:62                                      ; preds = %61
  store i32 2, i32* getelementptr inbounds ([13 x i32]* @class, i64 0, i64 9), align 4, !dbg !273, !tbaa !143
  store i32 9, i32* getelementptr inbounds ([13 x i32]* @piecemax, i64 0, i64 9), align 4, !dbg !274, !tbaa !143
  tail call void @llvm.dbg.value(metadata !140, i64 0, metadata !40), !dbg !275
  br label %.preheader8, !dbg !275

.preheader8:                                      ; preds = %66, %62
  %indvars.iv99 = phi i64 [ 0, %62 ], [ %indvars.iv.next100, %66 ]
  br label %.preheader7, !dbg !277

.preheader7:                                      ; preds = %.preheader8, %.preheader7
  %indvars.iv94 = phi i64 [ %indvars.iv.next95, %.preheader7 ], [ 0, %.preheader8 ]
  %63 = shl i64 %indvars.iv94, 6, !dbg !279
  %64 = add nsw i64 %63, %indvars.iv99, !dbg !279
  %65 = getelementptr inbounds [13 x [512 x i32]]* @p, i64 0, i64 10, i64 %64, !dbg !279
  store i32 1, i32* %65, align 4, !dbg !279, !tbaa !143
  %indvars.iv.next95 = add nuw nsw i64 %indvars.iv94, 1, !dbg !279
  %exitcond96 = icmp eq i64 %indvars.iv.next95, 2, !dbg !279
  br i1 %exitcond96, label %66, label %.preheader7, !dbg !279

; <label>:66                                      ; preds = %.preheader7
  %indvars.iv.next100 = add nuw nsw i64 %indvars.iv99, 1, !dbg !275
  %exitcond101 = icmp eq i64 %indvars.iv.next100, 2, !dbg !275
  br i1 %exitcond101, label %67, label %.preheader8, !dbg !275

; <label>:67                                      ; preds = %66
  store i32 2, i32* getelementptr inbounds ([13 x i32]* @class, i64 0, i64 10), align 8, !dbg !281, !tbaa !143
  store i32 65, i32* getelementptr inbounds ([13 x i32]* @piecemax, i64 0, i64 10), align 8, !dbg !282, !tbaa !143
  tail call void @llvm.dbg.value(metadata !140, i64 0, metadata !40), !dbg !283
  br label %.preheader5, !dbg !283

.preheader5:                                      ; preds = %67, %73
  %indvars.iv89 = phi i64 [ %indvars.iv.next90, %73 ], [ 0, %67 ]
  br label %68, !dbg !285

; <label>:68                                      ; preds = %68, %.preheader5
  %indvars.iv86 = phi i64 [ 0, %.preheader5 ], [ %indvars.iv.next87, %68 ]
  %69 = shl i64 %indvars.iv86, 3, !dbg !285
  %70 = add nsw i64 %69, %indvars.iv89, !dbg !285
  %71 = shl i64 %70, 3, !dbg !285
  %72 = getelementptr inbounds [13 x [512 x i32]]* @p, i64 0, i64 11, i64 %71, !dbg !285
  store i32 1, i32* %72, align 16, !dbg !285, !tbaa !143
  %indvars.iv.next87 = add nuw nsw i64 %indvars.iv86, 1, !dbg !285
  %exitcond88 = icmp eq i64 %indvars.iv.next87, 2, !dbg !285
  br i1 %exitcond88, label %73, label %68, !dbg !285

; <label>:73                                      ; preds = %68
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89, 1, !dbg !288
  %exitcond91 = icmp eq i64 %indvars.iv.next90, 2, !dbg !288
  br i1 %exitcond91, label %74, label %.preheader5, !dbg !288

; <label>:74                                      ; preds = %73
  store i32 2, i32* getelementptr inbounds ([13 x i32]* @class, i64 0, i64 11), align 4, !dbg !289, !tbaa !143
  store i32 72, i32* getelementptr inbounds ([13 x i32]* @piecemax, i64 0, i64 11), align 4, !dbg !290, !tbaa !143
  tail call void @llvm.dbg.value(metadata !140, i64 0, metadata !40), !dbg !291
  br label %.preheader4, !dbg !291

.preheader4:                                      ; preds = %82, %74
  %indvars.iv83 = phi i64 [ 0, %74 ], [ %indvars.iv.next84, %82 ]
  br label %.preheader, !dbg !293

.preheader:                                       ; preds = %81, %.preheader4
  %indvars.iv80 = phi i64 [ 0, %.preheader4 ], [ %indvars.iv.next81, %81 ]
  br label %75, !dbg !295

; <label>:75                                      ; preds = %75, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %75 ]
  %76 = shl i64 %indvars.iv, 3, !dbg !295
  %77 = add nsw i64 %76, %indvars.iv80, !dbg !295
  %78 = shl i64 %77, 3, !dbg !295
  %79 = add nsw i64 %78, %indvars.iv83, !dbg !295
  %80 = getelementptr inbounds [13 x [512 x i32]]* @p, i64 0, i64 12, i64 %79, !dbg !295
  store i32 1, i32* %80, align 4, !dbg !295, !tbaa !143
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !295
  %exitcond = icmp eq i64 %indvars.iv.next, 2, !dbg !295
  br i1 %exitcond, label %81, label %75, !dbg !295

; <label>:81                                      ; preds = %75
  %indvars.iv.next81 = add nuw nsw i64 %indvars.iv80, 1, !dbg !293
  %exitcond82 = icmp eq i64 %indvars.iv.next81, 2, !dbg !293
  br i1 %exitcond82, label %82, label %.preheader, !dbg !293

; <label>:82                                      ; preds = %81
  %indvars.iv.next84 = add nuw nsw i64 %indvars.iv83, 1, !dbg !291
  %exitcond85 = icmp eq i64 %indvars.iv.next84, 2, !dbg !291
  br i1 %exitcond85, label %.lr.ph.i.preheader, label %.preheader4, !dbg !291

.lr.ph.i.preheader:                               ; preds = %82
  store i32 3, i32* getelementptr inbounds ([13 x i32]* @class, i64 0, i64 12), align 16, !dbg !297, !tbaa !143
  store i32 73, i32* getelementptr inbounds ([13 x i32]* @piecemax, i64 0, i64 12), align 16, !dbg !298, !tbaa !143
  store i32 13, i32* getelementptr inbounds ([4 x i32]* @piececount, i64 0, i64 0), align 16, !dbg !299, !tbaa !143
  store i32 3, i32* getelementptr inbounds ([4 x i32]* @piececount, i64 0, i64 1), align 4, !dbg !300, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([4 x i32]* @piececount, i64 0, i64 2), align 8, !dbg !301, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([4 x i32]* @piececount, i64 0, i64 3), align 4, !dbg !302, !tbaa !143
  tail call void @llvm.dbg.value(metadata !303, i64 0, metadata !43), !dbg !304
  store i32 0, i32* @kount, align 4, !dbg !305, !tbaa !143
  tail call void @llvm.dbg.value(metadata !140, i64 0, metadata !306), !dbg !309
  tail call void @llvm.dbg.value(metadata !303, i64 0, metadata !310), !dbg !309
  tail call void @llvm.dbg.value(metadata !140, i64 0, metadata !311), !dbg !312
  br label %.lr.ph.i, !dbg !313

.lr.ph.i:                                         ; preds = %.lr.ph.i.preheader, %91
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %91 ], [ 0, %.lr.ph.i.preheader ]
  %83 = getelementptr inbounds [13 x [512 x i32]]* @p, i64 0, i64 0, i64 %indvars.iv.i, !dbg !313
  %84 = load i32* %83, align 4, !dbg !313, !tbaa !143
  %85 = icmp eq i32 %84, 0, !dbg !313
  br i1 %85, label %91, label %86, !dbg !313

; <label>:86                                      ; preds = %.lr.ph.i
  %87 = add nsw i64 %indvars.iv.i, 73, !dbg !314
  %88 = getelementptr inbounds [512 x i32]* @puzzl, i64 0, i64 %87, !dbg !314
  %89 = load i32* %88, align 4, !dbg !314, !tbaa !143
  %90 = icmp eq i32 %89, 0, !dbg !314
  br i1 %90, label %91, label %95, !dbg !314

; <label>:91                                      ; preds = %86, %.lr.ph.i
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !312
  %92 = trunc i64 %indvars.iv.i to i32, !dbg !312
  %93 = icmp slt i32 %92, 11, !dbg !312
  br i1 %93, label %.lr.ph.i, label %.loopexit, !dbg !312

.loopexit:                                        ; preds = %91
  %94 = tail call i32 @Place(i32 0, i32 73) #5, !dbg !307
  store i32 %94, i32* @n, align 4, !dbg !307, !tbaa !143
  br label %96, !dbg !307

; <label>:95                                      ; preds = %86
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([17 x i8]* @str, i64 0, i64 0)), !dbg !315
  %.pre = load i32* @n, align 4, !dbg !316, !tbaa !143
  br label %96

; <label>:96                                      ; preds = %95, %.loopexit
  %97 = phi i32 [ %.pre, %95 ], [ %94, %.loopexit ]
  %98 = tail call i32 @Trial(i32 %97) #5, !dbg !316
  %99 = icmp eq i32 %98, 0, !dbg !316
  br i1 %99, label %100, label %101, !dbg !316

; <label>:100                                     ; preds = %96
  %puts1 = tail call i32 @puts(i8* getelementptr inbounds ([18 x i8]* @str4, i64 0, i64 0)), !dbg !316
  br label %105, !dbg !316

; <label>:101                                     ; preds = %96
  %102 = load i32* @kount, align 4, !dbg !318, !tbaa !143
  %103 = icmp eq i32 %102, 2005, !dbg !318
  br i1 %103, label %105, label %104, !dbg !318

; <label>:104                                     ; preds = %101
  %puts2 = tail call i32 @puts(i8* getelementptr inbounds ([18 x i8]* @str5, i64 0, i64 0)), !dbg !318
  br label %105, !dbg !318

; <label>:105                                     ; preds = %101, %104, %100
  %106 = load i32* @n, align 4, !dbg !320, !tbaa !143
  %107 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str3, i64 0, i64 0), i32 %106) #6, !dbg !320
  %108 = load i32* @kount, align 4, !dbg !321, !tbaa !143
  %109 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str3, i64 0, i64 0), i32 %108) #6, !dbg !321
  ret void, !dbg !322
}

; Function Attrs: nounwind optsize
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind optsize uwtable
define i32 @main() #0 {
  tail call void @llvm.dbg.value(metadata !140, i64 0, metadata !46), !dbg !323
  br label %1, !dbg !323

; <label>:1                                       ; preds = %1, %0
  %i.01 = phi i32 [ 0, %0 ], [ %2, %1 ]
  tail call void @Puzzle() #5, !dbg !323
  %2 = add nsw i32 %i.01, 1, !dbg !323
  tail call void @llvm.dbg.value(metadata !{i32 %2}, i64 0, metadata !46), !dbg !323
  %exitcond = icmp eq i32 %2, 100, !dbg !323
  br i1 %exitcond, label %3, label %1, !dbg !323

; <label>:3                                       ; preds = %1
  ret i32 0, !dbg !325
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #3

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #4

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #4

attributes #0 = { nounwind optsize uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind optsize readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind optsize "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }
attributes #5 = { optsize }
attributes #6 = { nounwind optsize }

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
!185 = metadata !{metadata !185, metadata !186, metadata !187}
!186 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!187 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!188 = metadata !{i32 165, i32 0, metadata !189, null}
!189 = metadata !{i32 786443, metadata !1, metadata !190, i32 165, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!190 = metadata !{i32 786443, metadata !1, metadata !38, i32 165, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!191 = metadata !{i32 166, i32 0, metadata !192, null}
!192 = metadata !{i32 786443, metadata !1, metadata !193, i32 166, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!193 = metadata !{i32 786443, metadata !1, metadata !38, i32 166, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!194 = metadata !{i32 167, i32 0, metadata !195, null}
!195 = metadata !{i32 786443, metadata !1, metadata !38, i32 167, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!196 = metadata !{i32 165, i32 0, metadata !197, null}
!197 = metadata !{i32 786443, metadata !1, metadata !189, i32 165, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!198 = metadata !{i32 165, i32 0, metadata !190, null}
!199 = metadata !{i32 167, i32 0, metadata !200, null}
!200 = metadata !{i32 786443, metadata !1, metadata !195, i32 167, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!201 = metadata !{i32 167, i32 0, metadata !202, null}
!202 = metadata !{i32 786443, metadata !1, metadata !200, i32 167, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!203 = metadata !{i32 168, i32 0, metadata !38, null}
!204 = metadata !{i32 169, i32 0, metadata !38, null}
!205 = metadata !{i32 170, i32 0, metadata !206, null}
!206 = metadata !{i32 786443, metadata !1, metadata !38, i32 170, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!207 = metadata !{i32 170, i32 0, metadata !208, null}
!208 = metadata !{i32 786443, metadata !1, metadata !206, i32 170, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!209 = metadata !{i32 170, i32 0, metadata !210, null}
!210 = metadata !{i32 786443, metadata !1, metadata !208, i32 170, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!211 = metadata !{i32 171, i32 0, metadata !38, null}
!212 = metadata !{i32 172, i32 0, metadata !38, null}
!213 = metadata !{i32 173, i32 0, metadata !214, null}
!214 = metadata !{i32 786443, metadata !1, metadata !38, i32 173, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!215 = metadata !{i32 173, i32 0, metadata !216, null}
!216 = metadata !{i32 786443, metadata !1, metadata !217, i32 173, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!217 = metadata !{i32 786443, metadata !1, metadata !214, i32 173, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!218 = metadata !{i32 173, i32 0, metadata !217, null}
!219 = metadata !{i32 174, i32 0, metadata !38, null}
!220 = metadata !{i32 175, i32 0, metadata !38, null}
!221 = metadata !{i32 176, i32 0, metadata !222, null}
!222 = metadata !{i32 786443, metadata !1, metadata !38, i32 176, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!223 = metadata !{i32 176, i32 0, metadata !224, null}
!224 = metadata !{i32 786443, metadata !1, metadata !222, i32 176, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!225 = metadata !{i32 176, i32 0, metadata !226, null}
!226 = metadata !{i32 786443, metadata !1, metadata !224, i32 176, i32 0, i32 31} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!227 = metadata !{i32 177, i32 0, metadata !38, null}
!228 = metadata !{i32 178, i32 0, metadata !38, null}
!229 = metadata !{i32 179, i32 0, metadata !230, null}
!230 = metadata !{i32 786443, metadata !1, metadata !38, i32 179, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!231 = metadata !{i32 179, i32 0, metadata !232, null}
!232 = metadata !{i32 786443, metadata !1, metadata !230, i32 179, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!233 = metadata !{i32 179, i32 0, metadata !234, null}
!234 = metadata !{i32 786443, metadata !1, metadata !232, i32 179, i32 0, i32 34} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!235 = metadata !{i32 180, i32 0, metadata !38, null}
!236 = metadata !{i32 181, i32 0, metadata !38, null}
!237 = metadata !{i32 182, i32 0, metadata !238, null}
!238 = metadata !{i32 786443, metadata !1, metadata !38, i32 182, i32 0, i32 35} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!239 = metadata !{i32 182, i32 0, metadata !240, null}
!240 = metadata !{i32 786443, metadata !1, metadata !241, i32 182, i32 0, i32 37} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!241 = metadata !{i32 786443, metadata !1, metadata !238, i32 182, i32 0, i32 36} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!242 = metadata !{i32 182, i32 0, metadata !241, null}
!243 = metadata !{i32 183, i32 0, metadata !38, null}
!244 = metadata !{i32 184, i32 0, metadata !38, null}
!245 = metadata !{i32 185, i32 0, metadata !246, null}
!246 = metadata !{i32 786443, metadata !1, metadata !38, i32 185, i32 0, i32 38} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!247 = metadata !{i32 185, i32 0, metadata !248, null}
!248 = metadata !{i32 786443, metadata !1, metadata !249, i32 185, i32 0, i32 40} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!249 = metadata !{i32 786443, metadata !1, metadata !246, i32 185, i32 0, i32 39} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!250 = metadata !{i32 186, i32 0, metadata !38, null}
!251 = metadata !{i32 187, i32 0, metadata !38, null}
!252 = metadata !{i32 188, i32 0, metadata !253, null}
!253 = metadata !{i32 786443, metadata !1, metadata !38, i32 188, i32 0, i32 41} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!254 = metadata !{i32 188, i32 0, metadata !255, null}
!255 = metadata !{i32 786443, metadata !1, metadata !256, i32 188, i32 0, i32 43} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!256 = metadata !{i32 786443, metadata !1, metadata !253, i32 188, i32 0, i32 42} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!257 = metadata !{i32 188, i32 0, metadata !256, null}
!258 = metadata !{i32 189, i32 0, metadata !38, null}
!259 = metadata !{i32 190, i32 0, metadata !38, null}
!260 = metadata !{i32 191, i32 0, metadata !261, null}
!261 = metadata !{i32 786443, metadata !1, metadata !38, i32 191, i32 0, i32 44} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!262 = metadata !{i32 191, i32 0, metadata !263, null}
!263 = metadata !{i32 786443, metadata !1, metadata !264, i32 191, i32 0, i32 46} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!264 = metadata !{i32 786443, metadata !1, metadata !261, i32 191, i32 0, i32 45} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!265 = metadata !{i32 192, i32 0, metadata !38, null}
!266 = metadata !{i32 193, i32 0, metadata !38, null}
!267 = metadata !{i32 194, i32 0, metadata !268, null}
!268 = metadata !{i32 786443, metadata !1, metadata !38, i32 194, i32 0, i32 47} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!269 = metadata !{i32 194, i32 0, metadata !270, null}
!270 = metadata !{i32 786443, metadata !1, metadata !268, i32 194, i32 0, i32 48} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!271 = metadata !{i32 194, i32 0, metadata !272, null}
!272 = metadata !{i32 786443, metadata !1, metadata !270, i32 194, i32 0, i32 49} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!273 = metadata !{i32 195, i32 0, metadata !38, null}
!274 = metadata !{i32 196, i32 0, metadata !38, null}
!275 = metadata !{i32 197, i32 0, metadata !276, null}
!276 = metadata !{i32 786443, metadata !1, metadata !38, i32 197, i32 0, i32 50} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!277 = metadata !{i32 197, i32 0, metadata !278, null}
!278 = metadata !{i32 786443, metadata !1, metadata !276, i32 197, i32 0, i32 51} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!279 = metadata !{i32 197, i32 0, metadata !280, null}
!280 = metadata !{i32 786443, metadata !1, metadata !278, i32 197, i32 0, i32 52} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!281 = metadata !{i32 198, i32 0, metadata !38, null}
!282 = metadata !{i32 199, i32 0, metadata !38, null}
!283 = metadata !{i32 200, i32 0, metadata !284, null}
!284 = metadata !{i32 786443, metadata !1, metadata !38, i32 200, i32 0, i32 53} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!285 = metadata !{i32 200, i32 0, metadata !286, null}
!286 = metadata !{i32 786443, metadata !1, metadata !287, i32 200, i32 0, i32 55} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!287 = metadata !{i32 786443, metadata !1, metadata !284, i32 200, i32 0, i32 54} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!288 = metadata !{i32 200, i32 0, metadata !287, null}
!289 = metadata !{i32 201, i32 0, metadata !38, null}
!290 = metadata !{i32 202, i32 0, metadata !38, null}
!291 = metadata !{i32 203, i32 0, metadata !292, null}
!292 = metadata !{i32 786443, metadata !1, metadata !38, i32 203, i32 0, i32 56} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!293 = metadata !{i32 203, i32 0, metadata !294, null}
!294 = metadata !{i32 786443, metadata !1, metadata !292, i32 203, i32 0, i32 57} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!295 = metadata !{i32 203, i32 0, metadata !296, null}
!296 = metadata !{i32 786443, metadata !1, metadata !294, i32 203, i32 0, i32 58} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!297 = metadata !{i32 204, i32 0, metadata !38, null}
!298 = metadata !{i32 205, i32 0, metadata !38, null}
!299 = metadata !{i32 206, i32 0, metadata !38, null}
!300 = metadata !{i32 207, i32 0, metadata !38, null}
!301 = metadata !{i32 208, i32 0, metadata !38, null}
!302 = metadata !{i32 209, i32 0, metadata !38, null}
!303 = metadata !{i32 73}
!304 = metadata !{i32 210, i32 0, metadata !38, null}
!305 = metadata !{i32 211, i32 0, metadata !38, null}
!306 = metadata !{i32 786689, metadata !12, metadata !"i", metadata !5, i32 16777344, metadata !11, i32 0, metadata !307} ; [ DW_TAG_arg_variable ] [i] [line 128]
!307 = metadata !{i32 212, i32 0, metadata !308, null}
!308 = metadata !{i32 786443, metadata !1, metadata !38, i32 212, i32 0, i32 59} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!309 = metadata !{i32 128, i32 0, metadata !12, metadata !307}
!310 = metadata !{i32 786689, metadata !12, metadata !"j", metadata !5, i32 33554560, metadata !11, i32 0, metadata !307} ; [ DW_TAG_arg_variable ] [j] [line 128]
!311 = metadata !{i32 786688, metadata !12, metadata !"k", metadata !5, i32 129, metadata !11, i32 0, metadata !307} ; [ DW_TAG_auto_variable ] [k] [line 129]
!312 = metadata !{i32 130, i32 0, metadata !142, metadata !307}
!313 = metadata !{i32 131, i32 0, metadata !146, metadata !307}
!314 = metadata !{i32 131, i32 0, metadata !148, metadata !307}
!315 = metadata !{i32 213, i32 0, metadata !308, null}
!316 = metadata !{i32 214, i32 0, metadata !317, null}
!317 = metadata !{i32 786443, metadata !1, metadata !38, i32 214, i32 0, i32 60} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!318 = metadata !{i32 215, i32 0, metadata !319, null}
!319 = metadata !{i32 786443, metadata !1, metadata !317, i32 215, i32 0, i32 61} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!320 = metadata !{i32 216, i32 0, metadata !38, null}
!321 = metadata !{i32 217, i32 0, metadata !38, null}
!322 = metadata !{i32 218, i32 0, metadata !38, null}
!323 = metadata !{i32 223, i32 0, metadata !324, null}
!324 = metadata !{i32 786443, metadata !1, metadata !44, i32 223, i32 0, i32 62} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!325 = metadata !{i32 224, i32 0, metadata !44, null}
