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

; Function Attrs: nounwind uwtable
define void @Initrand() #0 {
  store i64 74755, i64* @seed, align 8, !dbg !131, !tbaa !132
  ret void, !dbg !136
}

; Function Attrs: nounwind uwtable
define i32 @Rand() #0 {
  %1 = load i64* @seed, align 8, !dbg !137, !tbaa !132
  %2 = mul nsw i64 %1, 1309, !dbg !137
  %3 = add nsw i64 %2, 13849, !dbg !137
  %4 = and i64 %3, 65535, !dbg !137
  store i64 %4, i64* @seed, align 8, !dbg !137, !tbaa !132
  %5 = trunc i64 %4 to i32, !dbg !138
  ret i32 %5, !dbg !138
}

; Function Attrs: nounwind readonly uwtable
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

; Function Attrs: nounwind uwtable
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

; Function Attrs: nounwind uwtable
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

; Function Attrs: nounwind uwtable
define i32 @Trial(i32 %j) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %j}, i64 0, metadata !35), !dbg !168
  %1 = load i32* @kount, align 4, !dbg !169, !tbaa !143
  %2 = add nsw i32 %1, 1, !dbg !169
  store i32 %2, i32* @kount, align 4, !dbg !169, !tbaa !143
  tail call void @llvm.dbg.value(metadata !140, i64 0, metadata !36), !dbg !170
  %3 = icmp slt i32 %j, 512, !dbg !172
  %4 = sext i32 %j to i64
  br label %5, !dbg !170

; <label>:5                                       ; preds = %0, %Fit.exit.thread9
  %indvars.iv = phi i64 [ 0, %0 ], [ %indvars.iv.next, %Fit.exit.thread9 ]
  %6 = getelementptr inbounds [13 x i32]* @class, i64 0, i64 %indvars.iv, !dbg !177
  %7 = load i32* %6, align 4, !dbg !177, !tbaa !143
  %8 = sext i32 %7 to i64, !dbg !177
  %9 = getelementptr inbounds [4 x i32]* @piececount, i64 0, i64 %8, !dbg !177
  %10 = load i32* %9, align 4, !dbg !177, !tbaa !143
  %11 = icmp eq i32 %10, 0, !dbg !177
  br i1 %11, label %Fit.exit.thread9, label %12, !dbg !177

; <label>:12                                      ; preds = %5
  tail call void @llvm.dbg.value(metadata !178, i64 0, metadata !179), !dbg !181
  tail call void @llvm.dbg.value(metadata !{i32 %j}, i64 0, metadata !182), !dbg !181
  tail call void @llvm.dbg.value(metadata !140, i64 0, metadata !183), !dbg !184
  %13 = getelementptr inbounds [13 x i32]* @piecemax, i64 0, i64 %indvars.iv, !dbg !184
  %14 = load i32* %13, align 4, !dbg !184, !tbaa !143
  %15 = icmp slt i32 %14, 0, !dbg !184
  br i1 %15, label %._crit_edge7.i, label %.lr.ph.i, !dbg !184

.lr.ph.i:                                         ; preds = %12, %24
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %24 ], [ 0, %12 ]
  %16 = getelementptr inbounds [13 x [512 x i32]]* @p, i64 0, i64 %indvars.iv, i64 %indvars.iv.i, !dbg !185
  %17 = load i32* %16, align 4, !dbg !185, !tbaa !143
  %18 = icmp eq i32 %17, 0, !dbg !185
  br i1 %18, label %24, label %19, !dbg !185

; <label>:19                                      ; preds = %.lr.ph.i
  %20 = add nsw i64 %indvars.iv.i, %4, !dbg !186
  %21 = getelementptr inbounds [512 x i32]* @puzzl, i64 0, i64 %20, !dbg !186
  %22 = load i32* %21, align 4, !dbg !186, !tbaa !143
  %23 = icmp eq i32 %22, 0, !dbg !186
  br i1 %23, label %24, label %Fit.exit.thread9, !dbg !186

; <label>:24                                      ; preds = %19, %.lr.ph.i
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !184
  %25 = trunc i64 %indvars.iv.i to i32, !dbg !184
  %26 = icmp slt i32 %25, %14, !dbg !184
  br i1 %26, label %.lr.ph.i, label %.lr.ph6.i, !dbg !184

.lr.ph6.i:                                        ; preds = %24
  tail call void @llvm.dbg.value(metadata !178, i64 0, metadata !187), !dbg !188
  tail call void @llvm.dbg.value(metadata !{i32 %j}, i64 0, metadata !189), !dbg !188
  tail call void @llvm.dbg.value(metadata !140, i64 0, metadata !190), !dbg !191
  %27 = add i32 %14, 1, !dbg !191
  br label %28, !dbg !191

; <label>:28                                      ; preds = %35, %.lr.ph6.i
  %indvars.iv10.i = phi i64 [ %indvars.iv.next11.i, %35 ], [ 0, %.lr.ph6.i ]
  %29 = getelementptr inbounds [13 x [512 x i32]]* @p, i64 0, i64 %indvars.iv, i64 %indvars.iv10.i, !dbg !192
  %30 = load i32* %29, align 4, !dbg !192, !tbaa !143
  %31 = icmp eq i32 %30, 0, !dbg !192
  br i1 %31, label %35, label %32, !dbg !192

; <label>:32                                      ; preds = %28
  %33 = add nsw i64 %indvars.iv10.i, %4, !dbg !192
  %34 = getelementptr inbounds [512 x i32]* @puzzl, i64 0, i64 %33, !dbg !192
  store i32 1, i32* %34, align 4, !dbg !192, !tbaa !143
  br label %35, !dbg !192

; <label>:35                                      ; preds = %32, %28
  %indvars.iv.next11.i = add nuw nsw i64 %indvars.iv10.i, 1, !dbg !191
  %lftr.wideiv = trunc i64 %indvars.iv.next11.i to i32, !dbg !191
  %exitcond = icmp eq i32 %lftr.wideiv, %27, !dbg !191
  br i1 %exitcond, label %._crit_edge7.i, label %28, !dbg !191

._crit_edge7.i:                                   ; preds = %35, %12
  %36 = add nsw i32 %10, -1, !dbg !193
  store i32 %36, i32* %9, align 4, !dbg !193, !tbaa !143
  tail call void @llvm.dbg.value(metadata !{i32 %j}, i64 0, metadata !190), !dbg !172
  br i1 %3, label %.lr.ph.i2, label %Place.exit, !dbg !172

; <label>:37                                      ; preds = %.lr.ph.i2
  %38 = trunc i64 %indvars.iv.next.i4 to i32, !dbg !172
  %39 = icmp slt i32 %38, 512, !dbg !172
  br i1 %39, label %.lr.ph.i2, label %Place.exit, !dbg !172

.lr.ph.i2:                                        ; preds = %._crit_edge7.i, %37
  %indvars.iv.i3 = phi i64 [ %indvars.iv.next.i4, %37 ], [ %4, %._crit_edge7.i ]
  %40 = getelementptr inbounds [512 x i32]* @puzzl, i64 0, i64 %indvars.iv.i3, !dbg !194
  %41 = load i32* %40, align 4, !dbg !194, !tbaa !143
  %42 = icmp eq i32 %41, 0, !dbg !194
  %indvars.iv.next.i4 = add nsw i64 %indvars.iv.i3, 1, !dbg !172
  br i1 %42, label %._crit_edge2.i, label %37, !dbg !194

._crit_edge2.i:                                   ; preds = %.lr.ph.i2
  %43 = trunc i64 %indvars.iv.i3 to i32, !dbg !194
  br label %Place.exit, !dbg !194

Place.exit:                                       ; preds = %37, %._crit_edge7.i, %._crit_edge2.i
  %.0.i5 = phi i32 [ %43, %._crit_edge2.i ], [ 0, %._crit_edge7.i ], [ 0, %37 ]
  tail call void @llvm.dbg.value(metadata !{i32 %.0.i5}, i64 0, metadata !37), !dbg !173
  %44 = tail call i32 @Trial(i32 %.0.i5), !dbg !195
  %45 = icmp ne i32 %44, 0, !dbg !195
  %46 = icmp eq i32 %.0.i5, 0, !dbg !195
  %or.cond = or i1 %45, %46, !dbg !195
  br i1 %or.cond, label %66, label %47, !dbg !195

; <label>:47                                      ; preds = %Place.exit
  tail call void @llvm.dbg.value(metadata !178, i64 0, metadata !197), !dbg !199
  tail call void @llvm.dbg.value(metadata !{i32 %j}, i64 0, metadata !200), !dbg !199
  tail call void @llvm.dbg.value(metadata !140, i64 0, metadata !201), !dbg !202
  %48 = load i32* %13, align 4, !dbg !202, !tbaa !143
  %49 = icmp slt i32 %48, 0, !dbg !202
  br i1 %49, label %Remove.exit, label %.lr.ph.i6, !dbg !202

.lr.ph.i6:                                        ; preds = %47
  %50 = add i32 %48, 1, !dbg !202
  br label %51, !dbg !202

; <label>:51                                      ; preds = %58, %.lr.ph.i6
  %indvars.iv.i7 = phi i64 [ %indvars.iv.next.i8, %58 ], [ 0, %.lr.ph.i6 ]
  %52 = getelementptr inbounds [13 x [512 x i32]]* @p, i64 0, i64 %indvars.iv, i64 %indvars.iv.i7, !dbg !203
  %53 = load i32* %52, align 4, !dbg !203, !tbaa !143
  %54 = icmp eq i32 %53, 0, !dbg !203
  br i1 %54, label %58, label %55, !dbg !203

; <label>:55                                      ; preds = %51
  %56 = add nsw i64 %indvars.iv.i7, %4, !dbg !203
  %57 = getelementptr inbounds [512 x i32]* @puzzl, i64 0, i64 %56, !dbg !203
  store i32 0, i32* %57, align 4, !dbg !203, !tbaa !143
  br label %58, !dbg !203

; <label>:58                                      ; preds = %55, %51
  %indvars.iv.next.i8 = add nuw nsw i64 %indvars.iv.i7, 1, !dbg !202
  %lftr.wideiv13 = trunc i64 %indvars.iv.next.i8 to i32, !dbg !202
  %exitcond14 = icmp eq i32 %lftr.wideiv13, %50, !dbg !202
  br i1 %exitcond14, label %Remove.exit, label %51, !dbg !202

Remove.exit:                                      ; preds = %58, %47
  %59 = load i32* %6, align 4, !dbg !204, !tbaa !143
  %60 = sext i32 %59 to i64, !dbg !204
  %61 = getelementptr inbounds [4 x i32]* @piececount, i64 0, i64 %60, !dbg !204
  %62 = load i32* %61, align 4, !dbg !204, !tbaa !143
  %63 = add nsw i32 %62, 1, !dbg !204
  store i32 %63, i32* %61, align 4, !dbg !204, !tbaa !143
  br label %Fit.exit.thread9, !dbg !205

Fit.exit.thread9:                                 ; preds = %19, %5, %Remove.exit
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !170
  %64 = trunc i64 %indvars.iv.next to i32, !dbg !170
  %65 = icmp slt i32 %64, 13, !dbg !170
  br i1 %65, label %5, label %66, !dbg !170

; <label>:66                                      ; preds = %Fit.exit.thread9, %Place.exit
  %.0 = phi i32 [ 1, %Place.exit ], [ 0, %Fit.exit.thread9 ]
  ret i32 %.0, !dbg !206
}

; Function Attrs: nounwind uwtable
define void @Puzzle() #0 {
vector.ph:
  tail call void @llvm.dbg.value(metadata !140, i64 0, metadata !43), !dbg !207
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ], !dbg !207
  %0 = getelementptr inbounds [512 x i32]* @puzzl, i64 0, i64 %index, !dbg !207
  %1 = bitcast i32* %0 to <4 x i32>*, !dbg !207
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %1, align 16, !dbg !207
  %.sum151 = or i64 %index, 4, !dbg !207
  %2 = getelementptr [512 x i32]* @puzzl, i64 0, i64 %.sum151, !dbg !207
  %3 = bitcast i32* %2 to <4 x i32>*, !dbg !207
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %3, align 16, !dbg !207
  %index.next = add i64 %index, 8, !dbg !207
  %4 = icmp eq i64 %index.next, 512, !dbg !207
  br i1 %4, label %.preheader37, label %vector.body, !dbg !207, !llvm.loop !209

.preheader37:                                     ; preds = %vector.body, %.preheader37
  %indvars.iv = phi i64 [ %indvars.iv.next, %.preheader37 ], [ 1, %vector.body ]
  %5 = add nsw i64 %indvars.iv, 72, !dbg !212
  %6 = getelementptr inbounds [512 x i32]* @puzzl, i64 0, i64 %5, !dbg !212
  store i32 0, i32* %6, align 4, !dbg !212, !tbaa !143
  %7 = add nsw i64 %indvars.iv, 136, !dbg !212
  %8 = getelementptr inbounds [512 x i32]* @puzzl, i64 0, i64 %7, !dbg !212
  store i32 0, i32* %8, align 4, !dbg !212, !tbaa !143
  %9 = add nsw i64 %indvars.iv, 200, !dbg !212
  %10 = getelementptr inbounds [512 x i32]* @puzzl, i64 0, i64 %9, !dbg !212
  store i32 0, i32* %10, align 4, !dbg !212, !tbaa !143
  %11 = add nsw i64 %indvars.iv, 264, !dbg !212
  %12 = getelementptr inbounds [512 x i32]* @puzzl, i64 0, i64 %11, !dbg !212
  store i32 0, i32* %12, align 4, !dbg !212, !tbaa !143
  %13 = add nsw i64 %indvars.iv, 328, !dbg !212
  %14 = getelementptr inbounds [512 x i32]* @puzzl, i64 0, i64 %13, !dbg !212
  store i32 0, i32* %14, align 4, !dbg !212, !tbaa !143
  %15 = add nsw i64 %indvars.iv, 80, !dbg !212
  %16 = getelementptr inbounds [512 x i32]* @puzzl, i64 0, i64 %15, !dbg !212
  store i32 0, i32* %16, align 4, !dbg !212, !tbaa !143
  %17 = add nsw i64 %indvars.iv, 144, !dbg !212
  %18 = getelementptr inbounds [512 x i32]* @puzzl, i64 0, i64 %17, !dbg !212
  store i32 0, i32* %18, align 4, !dbg !212, !tbaa !143
  %19 = add nsw i64 %indvars.iv, 208, !dbg !212
  %20 = getelementptr inbounds [512 x i32]* @puzzl, i64 0, i64 %19, !dbg !212
  store i32 0, i32* %20, align 4, !dbg !212, !tbaa !143
  %21 = add nsw i64 %indvars.iv, 272, !dbg !212
  %22 = getelementptr inbounds [512 x i32]* @puzzl, i64 0, i64 %21, !dbg !212
  store i32 0, i32* %22, align 4, !dbg !212, !tbaa !143
  %23 = add nsw i64 %indvars.iv, 336, !dbg !212
  %24 = getelementptr inbounds [512 x i32]* @puzzl, i64 0, i64 %23, !dbg !212
  store i32 0, i32* %24, align 4, !dbg !212, !tbaa !143
  %25 = add nsw i64 %indvars.iv, 88, !dbg !212
  %26 = getelementptr inbounds [512 x i32]* @puzzl, i64 0, i64 %25, !dbg !212
  store i32 0, i32* %26, align 4, !dbg !212, !tbaa !143
  %27 = add nsw i64 %indvars.iv, 152, !dbg !212
  %28 = getelementptr inbounds [512 x i32]* @puzzl, i64 0, i64 %27, !dbg !212
  store i32 0, i32* %28, align 4, !dbg !212, !tbaa !143
  %29 = add nsw i64 %indvars.iv, 216, !dbg !212
  %30 = getelementptr inbounds [512 x i32]* @puzzl, i64 0, i64 %29, !dbg !212
  store i32 0, i32* %30, align 4, !dbg !212, !tbaa !143
  %31 = add nsw i64 %indvars.iv, 280, !dbg !212
  %32 = getelementptr inbounds [512 x i32]* @puzzl, i64 0, i64 %31, !dbg !212
  store i32 0, i32* %32, align 4, !dbg !212, !tbaa !143
  %33 = add nsw i64 %indvars.iv, 344, !dbg !212
  %34 = getelementptr inbounds [512 x i32]* @puzzl, i64 0, i64 %33, !dbg !212
  store i32 0, i32* %34, align 4, !dbg !212, !tbaa !143
  %35 = add nsw i64 %indvars.iv, 96, !dbg !212
  %36 = getelementptr inbounds [512 x i32]* @puzzl, i64 0, i64 %35, !dbg !212
  store i32 0, i32* %36, align 4, !dbg !212, !tbaa !143
  %37 = add nsw i64 %indvars.iv, 160, !dbg !212
  %38 = getelementptr inbounds [512 x i32]* @puzzl, i64 0, i64 %37, !dbg !212
  store i32 0, i32* %38, align 4, !dbg !212, !tbaa !143
  %39 = add nsw i64 %indvars.iv, 224, !dbg !212
  %40 = getelementptr inbounds [512 x i32]* @puzzl, i64 0, i64 %39, !dbg !212
  store i32 0, i32* %40, align 4, !dbg !212, !tbaa !143
  %41 = add nsw i64 %indvars.iv, 288, !dbg !212
  %42 = getelementptr inbounds [512 x i32]* @puzzl, i64 0, i64 %41, !dbg !212
  store i32 0, i32* %42, align 4, !dbg !212, !tbaa !143
  %43 = add nsw i64 %indvars.iv, 352, !dbg !212
  %44 = getelementptr inbounds [512 x i32]* @puzzl, i64 0, i64 %43, !dbg !212
  store i32 0, i32* %44, align 4, !dbg !212, !tbaa !143
  %45 = add nsw i64 %indvars.iv, 104, !dbg !212
  %46 = getelementptr inbounds [512 x i32]* @puzzl, i64 0, i64 %45, !dbg !212
  store i32 0, i32* %46, align 4, !dbg !212, !tbaa !143
  %47 = add nsw i64 %indvars.iv, 168, !dbg !212
  %48 = getelementptr inbounds [512 x i32]* @puzzl, i64 0, i64 %47, !dbg !212
  store i32 0, i32* %48, align 4, !dbg !212, !tbaa !143
  %49 = add nsw i64 %indvars.iv, 232, !dbg !212
  %50 = getelementptr inbounds [512 x i32]* @puzzl, i64 0, i64 %49, !dbg !212
  store i32 0, i32* %50, align 4, !dbg !212, !tbaa !143
  %51 = add nsw i64 %indvars.iv, 296, !dbg !212
  %52 = getelementptr inbounds [512 x i32]* @puzzl, i64 0, i64 %51, !dbg !212
  store i32 0, i32* %52, align 4, !dbg !212, !tbaa !143
  %53 = add nsw i64 %indvars.iv, 360, !dbg !212
  %54 = getelementptr inbounds [512 x i32]* @puzzl, i64 0, i64 %53, !dbg !212
  store i32 0, i32* %54, align 4, !dbg !212, !tbaa !143
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !216
  %exitcond145 = icmp eq i64 %indvars.iv.next, 6, !dbg !216
  br i1 %exitcond145, label %.lr.ph.i.preheader, label %.preheader37, !dbg !216

.lr.ph.i.preheader:                               ; preds = %.preheader37
  call void @llvm.memset.p0i8.i64(i8* bitcast ([13 x [512 x i32]]* @p to i8*), i8 0, i64 26624, i32 16, i1 false), !dbg !217
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 0, i64 0), align 16, !dbg !220, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 0, i64 8), align 16, !dbg !220, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 0, i64 1), align 4, !dbg !220, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 0, i64 9), align 4, !dbg !220, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 0, i64 2), align 8, !dbg !220, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 0, i64 10), align 8, !dbg !220, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 0, i64 3), align 4, !dbg !220, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 0, i64 11), align 4, !dbg !220, !tbaa !143
  store i32 0, i32* getelementptr inbounds ([13 x i32]* @class, i64 0, i64 0), align 16, !dbg !224, !tbaa !143
  store i32 11, i32* getelementptr inbounds ([13 x i32]* @piecemax, i64 0, i64 0), align 16, !dbg !225, !tbaa !143
  tail call void @llvm.dbg.value(metadata !140, i64 0, metadata !40), !dbg !226
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 1, i64 0), align 16, !dbg !228, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 1, i64 64), align 16, !dbg !228, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 1, i64 128), align 16, !dbg !228, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 1, i64 192), align 16, !dbg !228, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 1, i64 1), align 4, !dbg !228, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 1, i64 65), align 4, !dbg !228, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 1, i64 129), align 4, !dbg !228, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 1, i64 193), align 4, !dbg !228, !tbaa !143
  store i32 0, i32* getelementptr inbounds ([13 x i32]* @class, i64 0, i64 1), align 4, !dbg !231, !tbaa !143
  store i32 193, i32* getelementptr inbounds ([13 x i32]* @piecemax, i64 0, i64 1), align 4, !dbg !232, !tbaa !143
  tail call void @llvm.dbg.value(metadata !140, i64 0, metadata !40), !dbg !233
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 2, i64 0), align 16, !dbg !235, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 2, i64 64), align 16, !dbg !235, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 2, i64 8), align 16, !dbg !235, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 2, i64 72), align 16, !dbg !235, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 2, i64 16), align 16, !dbg !235, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 2, i64 80), align 16, !dbg !235, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 2, i64 24), align 16, !dbg !235, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 2, i64 88), align 16, !dbg !235, !tbaa !143
  store i32 0, i32* getelementptr inbounds ([13 x i32]* @class, i64 0, i64 2), align 8, !dbg !238, !tbaa !143
  store i32 88, i32* getelementptr inbounds ([13 x i32]* @piecemax, i64 0, i64 2), align 8, !dbg !239, !tbaa !143
  tail call void @llvm.dbg.value(metadata !140, i64 0, metadata !40), !dbg !240
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 3, i64 0), align 16, !dbg !242, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 3, i64 8), align 16, !dbg !242, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 3, i64 16), align 16, !dbg !242, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 3, i64 24), align 16, !dbg !242, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 3, i64 1), align 4, !dbg !242, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 3, i64 9), align 4, !dbg !242, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 3, i64 17), align 4, !dbg !242, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 3, i64 25), align 4, !dbg !242, !tbaa !143
  store i32 0, i32* getelementptr inbounds ([13 x i32]* @class, i64 0, i64 3), align 4, !dbg !245, !tbaa !143
  store i32 25, i32* getelementptr inbounds ([13 x i32]* @piecemax, i64 0, i64 3), align 4, !dbg !246, !tbaa !143
  tail call void @llvm.dbg.value(metadata !140, i64 0, metadata !40), !dbg !247
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 4, i64 0), align 16, !dbg !249, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 4, i64 64), align 16, !dbg !249, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 4, i64 1), align 4, !dbg !249, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 4, i64 65), align 4, !dbg !249, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 4, i64 2), align 8, !dbg !249, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 4, i64 66), align 8, !dbg !249, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 4, i64 3), align 4, !dbg !249, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 4, i64 67), align 4, !dbg !249, !tbaa !143
  store i32 0, i32* getelementptr inbounds ([13 x i32]* @class, i64 0, i64 4), align 16, !dbg !252, !tbaa !143
  store i32 67, i32* getelementptr inbounds ([13 x i32]* @piecemax, i64 0, i64 4), align 16, !dbg !253, !tbaa !143
  tail call void @llvm.dbg.value(metadata !140, i64 0, metadata !40), !dbg !254
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 5, i64 0), align 16, !dbg !256, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 5, i64 64), align 16, !dbg !256, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 5, i64 128), align 16, !dbg !256, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 5, i64 192), align 16, !dbg !256, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 5, i64 8), align 16, !dbg !256, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 5, i64 72), align 16, !dbg !256, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 5, i64 136), align 16, !dbg !256, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 5, i64 200), align 16, !dbg !256, !tbaa !143
  store i32 0, i32* getelementptr inbounds ([13 x i32]* @class, i64 0, i64 5), align 4, !dbg !259, !tbaa !143
  store i32 200, i32* getelementptr inbounds ([13 x i32]* @piecemax, i64 0, i64 5), align 4, !dbg !260, !tbaa !143
  tail call void @llvm.dbg.value(metadata !140, i64 0, metadata !40), !dbg !261
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 6, i64 0), align 16, !dbg !263, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 6, i64 1), align 4, !dbg !263, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 6, i64 2), align 8, !dbg !263, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x i32]* @class, i64 0, i64 6), align 8, !dbg !266, !tbaa !143
  store i32 2, i32* getelementptr inbounds ([13 x i32]* @piecemax, i64 0, i64 6), align 8, !dbg !267, !tbaa !143
  tail call void @llvm.dbg.value(metadata !140, i64 0, metadata !40), !dbg !268
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 7, i64 0), align 16, !dbg !270, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 7, i64 8), align 16, !dbg !270, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 7, i64 16), align 16, !dbg !270, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x i32]* @class, i64 0, i64 7), align 4, !dbg !273, !tbaa !143
  store i32 16, i32* getelementptr inbounds ([13 x i32]* @piecemax, i64 0, i64 7), align 4, !dbg !274, !tbaa !143
  tail call void @llvm.dbg.value(metadata !140, i64 0, metadata !40), !dbg !275
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 8, i64 0), align 16, !dbg !277, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 8, i64 64), align 16, !dbg !277, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 8, i64 128), align 16, !dbg !277, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x i32]* @class, i64 0, i64 8), align 16, !dbg !280, !tbaa !143
  store i32 128, i32* getelementptr inbounds ([13 x i32]* @piecemax, i64 0, i64 8), align 16, !dbg !281, !tbaa !143
  tail call void @llvm.dbg.value(metadata !140, i64 0, metadata !40), !dbg !282
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 9, i64 0), align 16, !dbg !284, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 9, i64 8), align 16, !dbg !284, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 9, i64 1), align 4, !dbg !284, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 9, i64 9), align 4, !dbg !284, !tbaa !143
  store i32 2, i32* getelementptr inbounds ([13 x i32]* @class, i64 0, i64 9), align 4, !dbg !287, !tbaa !143
  store i32 9, i32* getelementptr inbounds ([13 x i32]* @piecemax, i64 0, i64 9), align 4, !dbg !288, !tbaa !143
  tail call void @llvm.dbg.value(metadata !140, i64 0, metadata !40), !dbg !289
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 10, i64 0), align 16, !dbg !291, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 10, i64 64), align 16, !dbg !291, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 10, i64 1), align 4, !dbg !291, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 10, i64 65), align 4, !dbg !291, !tbaa !143
  store i32 2, i32* getelementptr inbounds ([13 x i32]* @class, i64 0, i64 10), align 8, !dbg !294, !tbaa !143
  store i32 65, i32* getelementptr inbounds ([13 x i32]* @piecemax, i64 0, i64 10), align 8, !dbg !295, !tbaa !143
  tail call void @llvm.dbg.value(metadata !140, i64 0, metadata !40), !dbg !296
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 11, i64 0), align 16, !dbg !298, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 11, i64 64), align 16, !dbg !298, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 11, i64 8), align 16, !dbg !298, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 11, i64 72), align 16, !dbg !298, !tbaa !143
  store i32 2, i32* getelementptr inbounds ([13 x i32]* @class, i64 0, i64 11), align 4, !dbg !301, !tbaa !143
  store i32 72, i32* getelementptr inbounds ([13 x i32]* @piecemax, i64 0, i64 11), align 4, !dbg !302, !tbaa !143
  tail call void @llvm.dbg.value(metadata !140, i64 0, metadata !40), !dbg !303
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 12, i64 0), align 16, !dbg !305, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 12, i64 64), align 16, !dbg !305, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 12, i64 8), align 16, !dbg !305, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 12, i64 72), align 16, !dbg !305, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 12, i64 1), align 4, !dbg !305, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 12, i64 65), align 4, !dbg !305, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 12, i64 9), align 4, !dbg !305, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i64 0, i64 12, i64 73), align 4, !dbg !305, !tbaa !143
  store i32 3, i32* getelementptr inbounds ([13 x i32]* @class, i64 0, i64 12), align 16, !dbg !308, !tbaa !143
  store i32 73, i32* getelementptr inbounds ([13 x i32]* @piecemax, i64 0, i64 12), align 16, !dbg !309, !tbaa !143
  store i32 13, i32* getelementptr inbounds ([4 x i32]* @piececount, i64 0, i64 0), align 16, !dbg !310, !tbaa !143
  store i32 3, i32* getelementptr inbounds ([4 x i32]* @piececount, i64 0, i64 1), align 4, !dbg !311, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([4 x i32]* @piececount, i64 0, i64 2), align 8, !dbg !312, !tbaa !143
  store i32 1, i32* getelementptr inbounds ([4 x i32]* @piececount, i64 0, i64 3), align 4, !dbg !313, !tbaa !143
  tail call void @llvm.dbg.value(metadata !314, i64 0, metadata !43), !dbg !315
  store i32 0, i32* @kount, align 4, !dbg !316, !tbaa !143
  tail call void @llvm.dbg.value(metadata !140, i64 0, metadata !317), !dbg !320
  tail call void @llvm.dbg.value(metadata !314, i64 0, metadata !321), !dbg !320
  tail call void @llvm.dbg.value(metadata !140, i64 0, metadata !322), !dbg !323
  br label %.lr.ph.i, !dbg !324

.lr.ph.i:                                         ; preds = %.lr.ph.i.preheader, %63
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %63 ], [ 0, %.lr.ph.i.preheader ]
  %55 = getelementptr inbounds [13 x [512 x i32]]* @p, i64 0, i64 0, i64 %indvars.iv.i, !dbg !324
  %56 = load i32* %55, align 4, !dbg !324, !tbaa !143
  %57 = icmp eq i32 %56, 0, !dbg !324
  br i1 %57, label %63, label %58, !dbg !324

; <label>:58                                      ; preds = %.lr.ph.i
  %59 = add nsw i64 %indvars.iv.i, 73, !dbg !325
  %60 = getelementptr inbounds [512 x i32]* @puzzl, i64 0, i64 %59, !dbg !325
  %61 = load i32* %60, align 4, !dbg !325, !tbaa !143
  %62 = icmp eq i32 %61, 0, !dbg !325
  br i1 %62, label %63, label %89, !dbg !325

; <label>:63                                      ; preds = %58, %.lr.ph.i
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !323
  %64 = trunc i64 %indvars.iv.i to i32, !dbg !323
  %65 = icmp slt i32 %64, 11, !dbg !323
  br i1 %65, label %.lr.ph.i, label %66, !dbg !323

; <label>:66                                      ; preds = %63
  %.pr = load i32* getelementptr inbounds ([13 x i32]* @piecemax, i64 0, i64 0), align 16, !dbg !326, !tbaa !143
  tail call void @llvm.dbg.value(metadata !140, i64 0, metadata !327), !dbg !328
  tail call void @llvm.dbg.value(metadata !314, i64 0, metadata !329), !dbg !328
  tail call void @llvm.dbg.value(metadata !140, i64 0, metadata !330), !dbg !326
  %67 = icmp slt i32 %.pr, 0, !dbg !326
  br i1 %67, label %._crit_edge7.i, label %.lr.ph6.i.preheader, !dbg !326

.lr.ph6.i.preheader:                              ; preds = %66
  %68 = add i32 %.pr, 1, !dbg !331
  br label %.lr.ph6.i, !dbg !331

.lr.ph6.i:                                        ; preds = %75, %.lr.ph6.i.preheader
  %indvars.iv10.i = phi i64 [ %indvars.iv.next11.i, %75 ], [ 0, %.lr.ph6.i.preheader ]
  %69 = getelementptr inbounds [13 x [512 x i32]]* @p, i64 0, i64 0, i64 %indvars.iv10.i, !dbg !331
  %70 = load i32* %69, align 4, !dbg !331, !tbaa !143
  %71 = icmp eq i32 %70, 0, !dbg !331
  br i1 %71, label %75, label %72, !dbg !331

; <label>:72                                      ; preds = %.lr.ph6.i
  %73 = add nsw i64 %indvars.iv10.i, 73, !dbg !331
  %74 = getelementptr inbounds [512 x i32]* @puzzl, i64 0, i64 %73, !dbg !331
  store i32 1, i32* %74, align 4, !dbg !331, !tbaa !143
  br label %75, !dbg !331

; <label>:75                                      ; preds = %72, %.lr.ph6.i
  %indvars.iv.next11.i = add nuw nsw i64 %indvars.iv10.i, 1, !dbg !326
  %lftr.wideiv = trunc i64 %indvars.iv.next11.i to i32, !dbg !326
  %exitcond = icmp eq i32 %lftr.wideiv, %68, !dbg !326
  br i1 %exitcond, label %._crit_edge7.i, label %.lr.ph6.i, !dbg !326

._crit_edge7.i:                                   ; preds = %75, %66
  %76 = load i32* getelementptr inbounds ([13 x i32]* @class, i64 0, i64 0), align 16, !dbg !332, !tbaa !143
  %77 = sext i32 %76 to i64, !dbg !332
  %78 = getelementptr inbounds [4 x i32]* @piececount, i64 0, i64 %77, !dbg !332
  %79 = load i32* %78, align 4, !dbg !332, !tbaa !143
  %80 = add nsw i32 %79, -1, !dbg !332
  store i32 %80, i32* %78, align 4, !dbg !332, !tbaa !143
  tail call void @llvm.dbg.value(metadata !314, i64 0, metadata !330), !dbg !333
  br label %84, !dbg !333

; <label>:81                                      ; preds = %84
  %82 = trunc i64 %indvars.iv.next.i5 to i32, !dbg !333
  %83 = icmp slt i32 %82, 512, !dbg !333
  br i1 %83, label %84, label %Place.exit, !dbg !333

; <label>:84                                      ; preds = %81, %._crit_edge7.i
  %indvars.iv.i4 = phi i64 [ 73, %._crit_edge7.i ], [ %indvars.iv.next.i5, %81 ]
  %85 = getelementptr inbounds [512 x i32]* @puzzl, i64 0, i64 %indvars.iv.i4, !dbg !334
  %86 = load i32* %85, align 4, !dbg !334, !tbaa !143
  %87 = icmp eq i32 %86, 0, !dbg !334
  %indvars.iv.next.i5 = add nsw i64 %indvars.iv.i4, 1, !dbg !333
  br i1 %87, label %._crit_edge2.i, label %81, !dbg !334

._crit_edge2.i:                                   ; preds = %84
  %88 = trunc i64 %indvars.iv.i4 to i32, !dbg !334
  br label %Place.exit, !dbg !334

Place.exit:                                       ; preds = %81, %._crit_edge2.i
  %.0.i6 = phi i32 [ %88, %._crit_edge2.i ], [ 0, %81 ]
  store i32 %.0.i6, i32* @n, align 4, !dbg !318, !tbaa !143
  br label %90, !dbg !318

; <label>:89                                      ; preds = %58
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([17 x i8]* @str, i64 0, i64 0)), !dbg !335
  %.pre = load i32* @n, align 4, !dbg !336, !tbaa !143
  br label %90

; <label>:90                                      ; preds = %89, %Place.exit
  %91 = phi i32 [ %.pre, %89 ], [ %.0.i6, %Place.exit ]
  %92 = tail call i32 @Trial(i32 %91), !dbg !336
  %93 = icmp eq i32 %92, 0, !dbg !336
  br i1 %93, label %94, label %95, !dbg !336

; <label>:94                                      ; preds = %90
  %puts1 = tail call i32 @puts(i8* getelementptr inbounds ([18 x i8]* @str4, i64 0, i64 0)), !dbg !336
  br label %99, !dbg !336

; <label>:95                                      ; preds = %90
  %96 = load i32* @kount, align 4, !dbg !338, !tbaa !143
  %97 = icmp eq i32 %96, 2005, !dbg !338
  br i1 %97, label %99, label %98, !dbg !338

; <label>:98                                      ; preds = %95
  %puts2 = tail call i32 @puts(i8* getelementptr inbounds ([18 x i8]* @str5, i64 0, i64 0)), !dbg !338
  br label %99, !dbg !338

; <label>:99                                      ; preds = %95, %98, %94
  %100 = load i32* @n, align 4, !dbg !340, !tbaa !143
  %101 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str3, i64 0, i64 0), i32 %100) #4, !dbg !340
  %102 = load i32* @kount, align 4, !dbg !341, !tbaa !143
  %103 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str3, i64 0, i64 0), i32 %102) #4, !dbg !341
  ret void, !dbg !342
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  tail call void @llvm.dbg.value(metadata !140, i64 0, metadata !46), !dbg !343
  br label %1, !dbg !343

; <label>:1                                       ; preds = %1, %0
  %i.01 = phi i32 [ 0, %0 ], [ %2, %1 ]
  tail call void @Puzzle(), !dbg !343
  %2 = add nsw i32 %i.01, 1, !dbg !343
  tail call void @llvm.dbg.value(metadata !{i32 %2}, i64 0, metadata !46), !dbg !343
  %exitcond = icmp eq i32 %2, 100, !dbg !343
  br i1 %exitcond, label %3, label %1, !dbg !343

; <label>:3                                       ; preds = %1
  ret i32 0, !dbg !345
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #3

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
!172 = metadata !{i32 139, i32 0, metadata !157, metadata !173}
!173 = metadata !{i32 155, i32 0, metadata !174, null}
!174 = metadata !{i32 786443, metadata !1, metadata !175, i32 154, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!175 = metadata !{i32 786443, metadata !1, metadata !176, i32 154, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!176 = metadata !{i32 786443, metadata !1, metadata !171, i32 153, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!177 = metadata !{i32 153, i32 0, metadata !176, null}
!178 = metadata !{i32 undef}
!179 = metadata !{i32 786689, metadata !12, metadata !"i", metadata !5, i32 16777344, metadata !11, i32 0, metadata !180} ; [ DW_TAG_arg_variable ] [i] [line 128]
!180 = metadata !{i32 154, i32 0, metadata !175, null}
!181 = metadata !{i32 128, i32 0, metadata !12, metadata !180}
!182 = metadata !{i32 786689, metadata !12, metadata !"j", metadata !5, i32 33554560, metadata !11, i32 0, metadata !180} ; [ DW_TAG_arg_variable ] [j] [line 128]
!183 = metadata !{i32 786688, metadata !12, metadata !"k", metadata !5, i32 129, metadata !11, i32 0, metadata !180} ; [ DW_TAG_auto_variable ] [k] [line 129]
!184 = metadata !{i32 130, i32 0, metadata !142, metadata !180}
!185 = metadata !{i32 131, i32 0, metadata !146, metadata !180}
!186 = metadata !{i32 131, i32 0, metadata !148, metadata !180}
!187 = metadata !{i32 786689, metadata !19, metadata !"i", metadata !5, i32 16777351, metadata !11, i32 0, metadata !173} ; [ DW_TAG_arg_variable ] [i] [line 135]
!188 = metadata !{i32 135, i32 0, metadata !19, metadata !173}
!189 = metadata !{i32 786689, metadata !19, metadata !"j", metadata !5, i32 33554567, metadata !11, i32 0, metadata !173} ; [ DW_TAG_arg_variable ] [j] [line 135]
!190 = metadata !{i32 786688, metadata !19, metadata !"k", metadata !5, i32 136, metadata !11, i32 0, metadata !173} ; [ DW_TAG_auto_variable ] [k] [line 136]
!191 = metadata !{i32 137, i32 0, metadata !152, metadata !173}
!192 = metadata !{i32 137, i32 0, metadata !154, metadata !173}
!193 = metadata !{i32 138, i32 0, metadata !19, metadata !173}
!194 = metadata !{i32 139, i32 0, metadata !159, metadata !173}
!195 = metadata !{i32 156, i32 0, metadata !196, null}
!196 = metadata !{i32 786443, metadata !1, metadata !174, i32 156, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!197 = metadata !{i32 786689, metadata !24, metadata !"i", metadata !5, i32 16777359, metadata !11, i32 0, metadata !198} ; [ DW_TAG_arg_variable ] [i] [line 143]
!198 = metadata !{i32 157, i32 0, metadata !196, null}
!199 = metadata !{i32 143, i32 0, metadata !24, metadata !198}
!200 = metadata !{i32 786689, metadata !24, metadata !"j", metadata !5, i32 33554575, metadata !11, i32 0, metadata !198} ; [ DW_TAG_arg_variable ] [j] [line 143]
!201 = metadata !{i32 786688, metadata !24, metadata !"k", metadata !5, i32 144, metadata !11, i32 0, metadata !198} ; [ DW_TAG_auto_variable ] [k] [line 144]
!202 = metadata !{i32 145, i32 0, metadata !163, metadata !198}
!203 = metadata !{i32 145, i32 0, metadata !165, metadata !198}
!204 = metadata !{i32 146, i32 0, metadata !24, metadata !198}
!205 = metadata !{i32 158, i32 0, metadata !174, null}
!206 = metadata !{i32 160, i32 0, metadata !31, null}
!207 = metadata !{i32 164, i32 0, metadata !208, null}
!208 = metadata !{i32 786443, metadata !1, metadata !38, i32 164, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!209 = metadata !{metadata !209, metadata !210, metadata !211}
!210 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!211 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!212 = metadata !{i32 165, i32 0, metadata !213, null}
!213 = metadata !{i32 786443, metadata !1, metadata !214, i32 165, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!214 = metadata !{i32 786443, metadata !1, metadata !215, i32 165, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!215 = metadata !{i32 786443, metadata !1, metadata !38, i32 165, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!216 = metadata !{i32 165, i32 0, metadata !215, null}
!217 = metadata !{i32 166, i32 0, metadata !218, null}
!218 = metadata !{i32 786443, metadata !1, metadata !219, i32 166, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!219 = metadata !{i32 786443, metadata !1, metadata !38, i32 166, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!220 = metadata !{i32 167, i32 0, metadata !221, null}
!221 = metadata !{i32 786443, metadata !1, metadata !222, i32 167, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!222 = metadata !{i32 786443, metadata !1, metadata !223, i32 167, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!223 = metadata !{i32 786443, metadata !1, metadata !38, i32 167, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!224 = metadata !{i32 168, i32 0, metadata !38, null}
!225 = metadata !{i32 169, i32 0, metadata !38, null}
!226 = metadata !{i32 170, i32 0, metadata !227, null}
!227 = metadata !{i32 786443, metadata !1, metadata !38, i32 170, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!228 = metadata !{i32 170, i32 0, metadata !229, null}
!229 = metadata !{i32 786443, metadata !1, metadata !230, i32 170, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!230 = metadata !{i32 786443, metadata !1, metadata !227, i32 170, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!231 = metadata !{i32 171, i32 0, metadata !38, null}
!232 = metadata !{i32 172, i32 0, metadata !38, null}
!233 = metadata !{i32 173, i32 0, metadata !234, null}
!234 = metadata !{i32 786443, metadata !1, metadata !38, i32 173, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!235 = metadata !{i32 173, i32 0, metadata !236, null}
!236 = metadata !{i32 786443, metadata !1, metadata !237, i32 173, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!237 = metadata !{i32 786443, metadata !1, metadata !234, i32 173, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!238 = metadata !{i32 174, i32 0, metadata !38, null}
!239 = metadata !{i32 175, i32 0, metadata !38, null}
!240 = metadata !{i32 176, i32 0, metadata !241, null}
!241 = metadata !{i32 786443, metadata !1, metadata !38, i32 176, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!242 = metadata !{i32 176, i32 0, metadata !243, null}
!243 = metadata !{i32 786443, metadata !1, metadata !244, i32 176, i32 0, i32 31} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!244 = metadata !{i32 786443, metadata !1, metadata !241, i32 176, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!245 = metadata !{i32 177, i32 0, metadata !38, null}
!246 = metadata !{i32 178, i32 0, metadata !38, null}
!247 = metadata !{i32 179, i32 0, metadata !248, null}
!248 = metadata !{i32 786443, metadata !1, metadata !38, i32 179, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!249 = metadata !{i32 179, i32 0, metadata !250, null}
!250 = metadata !{i32 786443, metadata !1, metadata !251, i32 179, i32 0, i32 34} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!251 = metadata !{i32 786443, metadata !1, metadata !248, i32 179, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!252 = metadata !{i32 180, i32 0, metadata !38, null}
!253 = metadata !{i32 181, i32 0, metadata !38, null}
!254 = metadata !{i32 182, i32 0, metadata !255, null}
!255 = metadata !{i32 786443, metadata !1, metadata !38, i32 182, i32 0, i32 35} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!256 = metadata !{i32 182, i32 0, metadata !257, null}
!257 = metadata !{i32 786443, metadata !1, metadata !258, i32 182, i32 0, i32 37} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!258 = metadata !{i32 786443, metadata !1, metadata !255, i32 182, i32 0, i32 36} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!259 = metadata !{i32 183, i32 0, metadata !38, null}
!260 = metadata !{i32 184, i32 0, metadata !38, null}
!261 = metadata !{i32 185, i32 0, metadata !262, null}
!262 = metadata !{i32 786443, metadata !1, metadata !38, i32 185, i32 0, i32 38} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!263 = metadata !{i32 185, i32 0, metadata !264, null}
!264 = metadata !{i32 786443, metadata !1, metadata !265, i32 185, i32 0, i32 40} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!265 = metadata !{i32 786443, metadata !1, metadata !262, i32 185, i32 0, i32 39} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!266 = metadata !{i32 186, i32 0, metadata !38, null}
!267 = metadata !{i32 187, i32 0, metadata !38, null}
!268 = metadata !{i32 188, i32 0, metadata !269, null}
!269 = metadata !{i32 786443, metadata !1, metadata !38, i32 188, i32 0, i32 41} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!270 = metadata !{i32 188, i32 0, metadata !271, null}
!271 = metadata !{i32 786443, metadata !1, metadata !272, i32 188, i32 0, i32 43} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!272 = metadata !{i32 786443, metadata !1, metadata !269, i32 188, i32 0, i32 42} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!273 = metadata !{i32 189, i32 0, metadata !38, null}
!274 = metadata !{i32 190, i32 0, metadata !38, null}
!275 = metadata !{i32 191, i32 0, metadata !276, null}
!276 = metadata !{i32 786443, metadata !1, metadata !38, i32 191, i32 0, i32 44} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!277 = metadata !{i32 191, i32 0, metadata !278, null}
!278 = metadata !{i32 786443, metadata !1, metadata !279, i32 191, i32 0, i32 46} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!279 = metadata !{i32 786443, metadata !1, metadata !276, i32 191, i32 0, i32 45} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!280 = metadata !{i32 192, i32 0, metadata !38, null}
!281 = metadata !{i32 193, i32 0, metadata !38, null}
!282 = metadata !{i32 194, i32 0, metadata !283, null}
!283 = metadata !{i32 786443, metadata !1, metadata !38, i32 194, i32 0, i32 47} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!284 = metadata !{i32 194, i32 0, metadata !285, null}
!285 = metadata !{i32 786443, metadata !1, metadata !286, i32 194, i32 0, i32 49} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!286 = metadata !{i32 786443, metadata !1, metadata !283, i32 194, i32 0, i32 48} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!287 = metadata !{i32 195, i32 0, metadata !38, null}
!288 = metadata !{i32 196, i32 0, metadata !38, null}
!289 = metadata !{i32 197, i32 0, metadata !290, null}
!290 = metadata !{i32 786443, metadata !1, metadata !38, i32 197, i32 0, i32 50} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!291 = metadata !{i32 197, i32 0, metadata !292, null}
!292 = metadata !{i32 786443, metadata !1, metadata !293, i32 197, i32 0, i32 52} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!293 = metadata !{i32 786443, metadata !1, metadata !290, i32 197, i32 0, i32 51} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!294 = metadata !{i32 198, i32 0, metadata !38, null}
!295 = metadata !{i32 199, i32 0, metadata !38, null}
!296 = metadata !{i32 200, i32 0, metadata !297, null}
!297 = metadata !{i32 786443, metadata !1, metadata !38, i32 200, i32 0, i32 53} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!298 = metadata !{i32 200, i32 0, metadata !299, null}
!299 = metadata !{i32 786443, metadata !1, metadata !300, i32 200, i32 0, i32 55} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!300 = metadata !{i32 786443, metadata !1, metadata !297, i32 200, i32 0, i32 54} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!301 = metadata !{i32 201, i32 0, metadata !38, null}
!302 = metadata !{i32 202, i32 0, metadata !38, null}
!303 = metadata !{i32 203, i32 0, metadata !304, null}
!304 = metadata !{i32 786443, metadata !1, metadata !38, i32 203, i32 0, i32 56} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!305 = metadata !{i32 203, i32 0, metadata !306, null}
!306 = metadata !{i32 786443, metadata !1, metadata !307, i32 203, i32 0, i32 58} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!307 = metadata !{i32 786443, metadata !1, metadata !304, i32 203, i32 0, i32 57} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!308 = metadata !{i32 204, i32 0, metadata !38, null}
!309 = metadata !{i32 205, i32 0, metadata !38, null}
!310 = metadata !{i32 206, i32 0, metadata !38, null}
!311 = metadata !{i32 207, i32 0, metadata !38, null}
!312 = metadata !{i32 208, i32 0, metadata !38, null}
!313 = metadata !{i32 209, i32 0, metadata !38, null}
!314 = metadata !{i32 73}
!315 = metadata !{i32 210, i32 0, metadata !38, null}
!316 = metadata !{i32 211, i32 0, metadata !38, null}
!317 = metadata !{i32 786689, metadata !12, metadata !"i", metadata !5, i32 16777344, metadata !11, i32 0, metadata !318} ; [ DW_TAG_arg_variable ] [i] [line 128]
!318 = metadata !{i32 212, i32 0, metadata !319, null}
!319 = metadata !{i32 786443, metadata !1, metadata !38, i32 212, i32 0, i32 59} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!320 = metadata !{i32 128, i32 0, metadata !12, metadata !318}
!321 = metadata !{i32 786689, metadata !12, metadata !"j", metadata !5, i32 33554560, metadata !11, i32 0, metadata !318} ; [ DW_TAG_arg_variable ] [j] [line 128]
!322 = metadata !{i32 786688, metadata !12, metadata !"k", metadata !5, i32 129, metadata !11, i32 0, metadata !318} ; [ DW_TAG_auto_variable ] [k] [line 129]
!323 = metadata !{i32 130, i32 0, metadata !142, metadata !318}
!324 = metadata !{i32 131, i32 0, metadata !146, metadata !318}
!325 = metadata !{i32 131, i32 0, metadata !148, metadata !318}
!326 = metadata !{i32 137, i32 0, metadata !152, metadata !318}
!327 = metadata !{i32 786689, metadata !19, metadata !"i", metadata !5, i32 16777351, metadata !11, i32 0, metadata !318} ; [ DW_TAG_arg_variable ] [i] [line 135]
!328 = metadata !{i32 135, i32 0, metadata !19, metadata !318}
!329 = metadata !{i32 786689, metadata !19, metadata !"j", metadata !5, i32 33554567, metadata !11, i32 0, metadata !318} ; [ DW_TAG_arg_variable ] [j] [line 135]
!330 = metadata !{i32 786688, metadata !19, metadata !"k", metadata !5, i32 136, metadata !11, i32 0, metadata !318} ; [ DW_TAG_auto_variable ] [k] [line 136]
!331 = metadata !{i32 137, i32 0, metadata !154, metadata !318}
!332 = metadata !{i32 138, i32 0, metadata !19, metadata !318}
!333 = metadata !{i32 139, i32 0, metadata !157, metadata !318}
!334 = metadata !{i32 139, i32 0, metadata !159, metadata !318}
!335 = metadata !{i32 213, i32 0, metadata !319, null}
!336 = metadata !{i32 214, i32 0, metadata !337, null}
!337 = metadata !{i32 786443, metadata !1, metadata !38, i32 214, i32 0, i32 60} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!338 = metadata !{i32 215, i32 0, metadata !339, null}
!339 = metadata !{i32 786443, metadata !1, metadata !337, i32 215, i32 0, i32 61} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!340 = metadata !{i32 216, i32 0, metadata !38, null}
!341 = metadata !{i32 217, i32 0, metadata !38, null}
!342 = metadata !{i32 218, i32 0, metadata !38, null}
!343 = metadata !{i32 223, i32 0, metadata !344, null}
!344 = metadata !{i32 786443, metadata !1, metadata !44, i32 223, i32 0, i32 62} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!345 = metadata !{i32 224, i32 0, metadata !44, null}
